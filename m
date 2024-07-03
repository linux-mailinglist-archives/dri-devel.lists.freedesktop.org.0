Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E1D926175
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 15:10:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B290910E835;
	Wed,  3 Jul 2024 13:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="n5+Kb2Np";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4009710E835
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 13:10:23 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2eaa89464a3so55129731fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2024 06:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720012221; x=1720617021; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fYNKyC7r0lY93w+1DA2lEanB3Pazmm2DrUBGKs4HZ0o=;
 b=n5+Kb2NpDDjzwk/qzdDwYON2wezZC1seO6mkzzwYjOc8JjIGNagjwDVwVfeoaYwE9Q
 woVzFI+eVjT+8EcMPla1xYYxNza5GlTNgy/JjMH36xPfhED1Jao8AlTq5qCKPPK0Qa2V
 B90aFAnQtT+xmvJPsmhgwC2krGCum3bXZ2AxWxWB1pt0TQ9Az16TaMyoGh6i4JQm+K9s
 38bMl9cl+2aanhan5FskWvKjKeXwmzB02st1/vZ1c4HEd6HJ4PiTzINRA2drzivg7t+e
 ug/koD0icsH3tV5rP/ijQCxTy0CR2W6NDxQPrHQQWcUI3BeLz1NJ6lhFTR+DF7y1++Du
 LiMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720012221; x=1720617021;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fYNKyC7r0lY93w+1DA2lEanB3Pazmm2DrUBGKs4HZ0o=;
 b=WZHQI2m5FSiyxU4QfXqjmDJHkwQ6Vy4c/FQVUVwQ86WJesDLv2mTjqzaF+r/Tk8uCL
 QbyK9r2IMj/2MeUF6gvZomoxNrftSn0rYwN5HVU+kCkA23Gdwx0V+Xo65kU/5xD57N/V
 abWlbhW35I9W7+DIPWKTPFbC3Cl5CQJEv+DvZXH7FbIgr99rtqnjYcvn5ep0cfBDyGJI
 x4ERMIbhXYK8lBNrIOptUMybb/8xRLNrJwwWapP5K7K1zOoXlKAFsHnk0DSVhZbKB6qU
 5U9oJEekzCd5ITQ4TmzTDZzncF9Uu1DHtyzaL7rIZYeC3iMnilzdvsn7Ti3wVHEPTg7A
 1UAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSyfIsHGGlwjYAKhOl+xFxFyjoFUX0r4lUpjxxU/JaTkQloBy0Os602TtmwfQGVnHljA2O/8qhWE79HGg8FtS2LecqnOZin3q4k2On54Lu
X-Gm-Message-State: AOJu0YyUri2Pnuz3OwKBDsmfSnkWKkq35BdwOcYjZKygdtRQtGpBeloQ
 iYtjbGVSzkrWuQ1p1G0JJmLCnkwHz6j9GfUX+/uMTTCJgoHfgF5PvMvKguSa9MFTRT4ndcbvTQK
 lAJj3WwiiAbF4n04OcXWOXOUWeoZJOnvh+ffT2Q==
X-Google-Smtp-Source: AGHT+IF2tkib/oC3Qiv+r3vhOaGqxlEBIzZGIynLySjW51phBdlrQV9rmjY1VJWS6M/DGM6KhRIAswSjPmSVX6S2YU4=
X-Received: by 2002:a2e:b5cb:0:b0:2ee:8555:473e with SMTP id
 38308e7fff4ca-2ee85556516mr7890711fa.46.1720012221282; Wed, 03 Jul 2024
 06:10:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240702130138.2543711-1-yangcong5@huaqin.corp-partner.google.com>
 <20240702130138.2543711-3-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20240702130138.2543711-3-yangcong5@huaqin.corp-partner.google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 3 Jul 2024 15:10:09 +0200
Message-ID: <CACRpkdY+nuSWz7rnVVUpF_mZOfDUb_6fgoJpnG2Pt-+AGLqt0g@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drm/panel: jd9365da: Support for Melfas
 lmfbx101117480 MIPI-DSI panel
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 dianders@chromium.org, swboyd@chromium.org, airlied@gmail.com, 
 dmitry.baryshkov@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
 robh+dt@kernel.org, conor+dt@kernel.org, 
 lvzhaoxiong@huaqin.corp-partner.google.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 2, 2024 at 3:02=E2=80=AFPM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:

> The Melfas lmfbx101117480 is a 10.1" WXGA TFT-LCD panel, use jd9365da
> controller, which fits in nicely with the existing panel-jadard-jd9365da-=
h3
> driver. Hence, we add a new compatible with panel specific config.
>
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>

This is certainly OK
Acked-by: Linus Walleij <linus.walleij@linaro.org>

> +static int melfas_lmfbx101117480_init_cmds(struct jadard *jadard)
> +{
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D jadard->dsi =
};
> +
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0x00);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe1, 0x93);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe2, 0x65);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe3, 0xf8);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x80, 0x03);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0x01);

Until this point *all* displays have the same init sequence, what about
a follow-up patch that start to break things that are always the
same into helper functions?

These sequences all have a lot of the same magic bytes, so if
you guys have a datasheet for this display controller then start
adding gradually some #defines for the e0, e1, e2 etc commands
please.

Yours,
Linus Walleij

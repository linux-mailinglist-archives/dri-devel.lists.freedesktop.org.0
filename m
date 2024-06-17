Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5F490A8F9
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 11:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C17410E034;
	Mon, 17 Jun 2024 09:04:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="soOelshJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E3310E034
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 09:04:36 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-52bc0a9cea4so3609298e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 02:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718615075; x=1719219875; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q+3Vz3i2TsdrpjkC9PcCy29rOh22Klo7SY6unJ5sDoA=;
 b=soOelshJy3X5AwrvLNmppuxj9sro2aVknwKFAIyVQoNrbR8JEF5ePhJmT0Oyn+I6sp
 QGi9VwhVXggzLLy2xYN+LNNp+SPiO7/lktDwmkesuPVB+0M2bT0MbofN0igStFg4iIYi
 ist2Tw2MIglCxyMEiocEduoOGYyYmJwkoeOHQ9Y/qcYWWVjv7MHK3EXXEVjINC+m7vgo
 TiZLVTXR2+OYEbQu7Ss/WEYkDXGBJnPseDM7zAf6FqzBCFB1maWV0TuAvUimikFVNmz8
 1RMdRqZNtl6IVTV48Z06VM0oV1/q2QOIT/uXf/k+9dPK+StbT1yna1XQQXQ7vaf7A2WS
 bjXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718615075; x=1719219875;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q+3Vz3i2TsdrpjkC9PcCy29rOh22Klo7SY6unJ5sDoA=;
 b=ZaDt9yhkizdEhOrpfw758V6aJDN9+dqzMzb5tGfoYncik4Fz2KTR5wX5Dr0MS9QwvJ
 rrlOsiQ+qhd/xV8JcoDrXYs85kHvcRNDEui8R4gEwsxOA7gFI8svFXO4v2SunrJb7iat
 rv3HxNz1tiDhpVvxegkA3wgnKf8P+zB9lypcPiSYi7dK9GW5M1GKL5xAONWOyqVq1nJ2
 RDkZTVkzojfHDr79l2SdkXTLD8hdgbYvfEOlBvovk7ENJINv50i564/ms3VlyCuFFj4i
 6i1lHkB6aygysPv2H7FDqKzuOct3VtZWH/C0UjaaYErfaIsyjURNDL45RFYCHAG9xOmL
 Tbmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVLZYhAQYUjgqjNavDvPO9fahXjWCXOea5rHtCyJn7gMQPaHGKIJPY8Sd6m/3aniCfFXVTxFS/LZgLL4EdoezorZKKcJkQJkTfLyabjcQl
X-Gm-Message-State: AOJu0YwU8yzW06+APXCnx+BR5pv5Z1Qx4rQM9PiZnjvCipZO3BlzXoMA
 Y0zP5TT7qQAEptsIRDSYxBNK7YgJMw5GP6fZBTtnJ+lrNS011D/BzraD1MsDmcJ7JcNLsMXObKM
 YU6yBP1+h61yTgvEoE/ZGXeJx7iIr2g1yQuWILWZANPBsm2zg
X-Google-Smtp-Source: AGHT+IF+HJZcRpUbZaoti30eFGkz57My4se7oV+eTI19fCyAo/6voMtDXYoZMTNQnN/HrQtJfz8h91nbF6hk4mFYQKI=
X-Received: by 2002:a05:6512:ba0:b0:52c:8dea:c56f with SMTP id
 2adb3069b0e04-52ca6cc6e6bmr3777612e87.25.1718615072794; Mon, 17 Jun 2024
 02:04:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240611102744.v2.1.I2b014f90afc4729b6ecc7b5ddd1f6dedcea4625b@changeid>
In-Reply-To: <20240611102744.v2.1.I2b014f90afc4729b6ecc7b5ddd1f6dedcea4625b@changeid>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 17 Jun 2024 11:04:21 +0200
Message-ID: <CACRpkda4KbfWnMwFyJAFKeyvJ3A32D1WuEQd=VQpQcg02-+32Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: Call drm_atomic_helper_shutdown() at
 shutdown time
To: Douglas Anderson <dianders@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Fei Shao <fshao@chromium.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
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

On Tue, Jun 11, 2024 at 7:28=E2=80=AFPM Douglas Anderson <dianders@chromium=
.org> wrote:

> Based on grepping through the source code this driver appears to be
> missing a call to drm_atomic_helper_shutdown() at system shutdown
> time. Among other things, this means that if a panel is in use that it
> won't be cleanly powered off at system shutdown time.
>
> The fact that we should call drm_atomic_helper_shutdown() in the case
> of OS shutdown/restart comes straight out of the kernel doc "driver
> instance overview" in drm_drv.c.
>
> This driver users the component model and shutdown happens in the base
> driver. The "drvdata" for this driver will always be valid if
> shutdown() is called and as of commit 2a073968289d
> ("drm/atomic-helper: drm_atomic_helper_shutdown(NULL) should be a
> noop") we don't need to confirm that "drm" is non-NULL.
>
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Reviewed-by: Fei Shao <fshao@chromium.org>
> Tested-by: Fei Shao <fshao@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

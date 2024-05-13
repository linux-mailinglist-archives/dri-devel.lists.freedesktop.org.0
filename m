Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5AA8C47CB
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 21:46:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD4D10E1CD;
	Mon, 13 May 2024 19:46:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Mg7EQLX9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E55D910E1CD
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 19:46:18 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-61be674f5d1so52204357b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 12:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715629578; x=1716234378; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QJEfzwkd2qxnsKE/Vy91fWDkVPR6tUmf6vlcyzKqO+0=;
 b=Mg7EQLX9YO6ACm2ToA+T0kBMHl/UfpguEMnCT8Ub87h+ARqg3QcNAwUuhrXzf0jByl
 swBBaaSQGXS+yOmyVLz/qGTvNn+8dDCZb/wnDD62ehccbNDqwnud/eeacsq/3CME9Idf
 d9Bj1N1UL0g2nIpsTyxYuD8UEhTMgfkhhA6CUYuXMjXdJOIF7Wjko2gV8haIGaVnKS8W
 feo3wke5exSEtsDs3om2l4YpBS7RRss8LuoOC8S7URtiJfUMES7+6+RsGFJTl6/QxpaU
 GTfxVHiZ1kf7c1R5n+SdH5TaOFgx+QGOqhp1Di1UskcHcGwuZBqPCCZE6qtMfkMEGEEc
 JOLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715629578; x=1716234378;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QJEfzwkd2qxnsKE/Vy91fWDkVPR6tUmf6vlcyzKqO+0=;
 b=hXrZ4oH+5LwxvsbCNE4bKe18dIXMSaEItXx0kZbqB1jRpG+a2SlgDTtC3XCfPa1n89
 Wyi4+cyJ+aZhgLoNiZAT9srJx27krhwrFgn66aSQH3BNmjjbTaPzJbZ56jwRn3TtsIWJ
 K9EIIly5d0ihpWBWunfgUED64CJXIsqOFZApsKhWcmLso5lOk5cSvVUGel7EF1TDJqjn
 s1TPueCmy8OzgG8onft/Ex3IbOTlfEHpfo9U+TU1Aaoe5qzBt4APGK73Qq3joe1F+W5b
 oiiSGYKQogvnh0IUom60mWQqEedYpby/SG+k7e3khcZ142x63pwRPsYmKATYoHbmUgjG
 IUJg==
X-Gm-Message-State: AOJu0YzJ+XmPFhPrb2d/o6E4vZz0+loFFLE/v29OlTNDSFEn3K+5cNux
 c3+eFlnZMWEKEW/Uwd/cju4TuLJfBiTOWWnkG8lUFREk8E2qKafYrVYqmNPi6lehCAEwSqAfrX/
 gTe07Qfr5jcmiJhuxAaVrRdQ12y57F8aPY0dZIg==
X-Google-Smtp-Source: AGHT+IGPz3LnxD+FGgFaCeFXh78jEmepPyxiwe+4wcuPzQbaTP/typ2A4tlWBQFabmLYpFP+8e9pZBIybxpkvek/nwE=
X-Received: by 2002:a05:690c:3805:b0:61e:a66:bccd with SMTP id
 00721157ae682-622afff95e1mr158687087b3.38.1715629577353; Mon, 13 May 2024
 12:46:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240508205222.2251854-1-dianders@chromium.org>
 <20240508135148.v4.6.I3c08a7d02c467d2bc88da14e513ea4c8649fce45@changeid>
In-Reply-To: <20240508135148.v4.6.I3c08a7d02c467d2bc88da14e513ea4c8649fce45@changeid>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 May 2024 21:46:06 +0200
Message-ID: <CACRpkdZjaqAr6s-VUTw52qNmkP1aFxXdjdKd+JC_ukC5fKL0kw@mail.gmail.com>
Subject: Re: [PATCH v4 6/9] drm/panel: novatek-nt36672e: Switch to
 mipi_dsi_dcs_write_seq_multi()
To: Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, 
 lvzhaoxiong@huaqin.corp-partner.google.com, 
 Jani Nikula <jani.nikula@linux.intel.com>, Hsin-Yi Wang <hsinyi@google.com>, 
 Javier Martinez Canillas <javierm@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Sam Ravnborg <sam@ravnborg.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Joel Selvaraj <jo@jsfamily.in>,
 Brian Norris <briannorris@chromium.org>,
 Ritesh Kumar <quic_riteshk@quicinc.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
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

On Wed, May 8, 2024 at 10:53=E2=80=AFPM Douglas Anderson <dianders@chromium=
.org> wrote:

> This is a mechanical conversion of the novatek-nt36672e driver to use
> the new mipi_dsi_dcs_write_seq_multi(). The new function is easier for
> clients to understand and using it also causes smaller code to be
> generated. Specifically:
>
> $ scripts/bloat-o-meter \
>   ...after/panel-novatek-nt36672e.ko \
>   ...ctx/panel-novatek-nt36672e.ko
> add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-988 (-988)
> Function                                     old     new   delta
> nt36672e_1080x2408_60hz_init                6236    5248    -988
> Total: Before=3D10651, After=3D9663, chg -9.28%
>
> Cc: Ritesh Kumar <quic_riteshk@quicinc.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

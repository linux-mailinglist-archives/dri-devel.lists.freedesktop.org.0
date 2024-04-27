Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2E38B4391
	for <lists+dri-devel@lfdr.de>; Sat, 27 Apr 2024 03:44:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B1F8112626;
	Sat, 27 Apr 2024 01:44:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YTFarZfh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31136112626
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Apr 2024 01:44:46 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-dc236729a2bso2789895276.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 18:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714182284; x=1714787084; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QGCg4Zu+ZV3ocI1mnZ5+/Ant+yZ7/OtI/o1sSvTL4HM=;
 b=YTFarZfhGWSvrqSGPATGVSET5Q40RupzO2R9DojafyulRNmxMitWh/dacnwxxxM4SX
 kp94y54TP8N8f7rSwfS+I+3Ivw4tGYsLH9+sw3NGDXbjzhEJLRy7j6/OlhJJetI+hIvZ
 uN+uxh360+HoJUTCWo2VsiuJAoL45nImYcfMi7ab5rI0lzm0KGLOgWvE+rmcJnnFSNuI
 Y1JtlBVevlBepHqdkmjTsn8RmYhnMVUHaC4ZMufSaMDOuEsgSGglOYy/LC0yaBKzZlKw
 T2HDrS6hgKhA4GJIu5A7Pu+J28qWtpR46yPrLVGq26eSu3WFO0HOIY71yx3lT+qX9U2I
 w2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714182284; x=1714787084;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QGCg4Zu+ZV3ocI1mnZ5+/Ant+yZ7/OtI/o1sSvTL4HM=;
 b=JTU5Qfq8aPhZbqA7SqnekXtGIZkJeOjggw5EZiI+YOquuIBhETAKWGmHzGXUXZ+msD
 7rOgcr3EMEqROExIlppkNV3/ERIpH7Ny3XSNF2Ven7c1OK+d2rkvjlFigHHwzDSPhABb
 U87LpwzNIFTjHUYRX1bGNvIYfCjB3dGjF9vwsOkxs1s2IYVVOJUFuBkbklQNRtgqXT4C
 cYeP0fuUSMA38lULPyH6Ae5VTWl1fc/OruTtvcuh2MKWfisZPbxg3Db8eN9Y63uD9qnq
 Cyb53r2or3MmXZ8FA1jbnlrt8jL0rQ6hRz2LwyuMXmx6iJUmPeDnbP2YVOF2XiybOaB6
 1y8g==
X-Gm-Message-State: AOJu0Yxgftx7uzk5jTeqOY5wuc1mBt+w1jB7JaCFJZrpOpx60Z3nOss+
 3SUIYteO0XDYNOwVpDDg/bfPRy+hmLDj/6J91gjhdUC2OH+6EtrP1oAzyIeR3IdbfBHBkPXB9oX
 cc6kPnfhGfPb5J7DGo8cjUdRapfR/nBAGgnH9jw==
X-Google-Smtp-Source: AGHT+IG1A0M8caFGulGcx2R5Fp59/NY4nN7r8y1wfNgBJA6VQ6kPux0p8Muei5EVBn19NOuDzqIElo1na2AKOn3EzLM=
X-Received: by 2002:a05:6902:1024:b0:dd1:48c9:53f3 with SMTP id
 x4-20020a056902102400b00dd148c953f3mr5689733ybt.60.1714182284249; Fri, 26 Apr
 2024 18:44:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240426235857.3870424-1-dianders@chromium.org>
 <20240426165839.v2.1.I30fa4c8348ea316c886ef8a522a52fed617f930d@changeid>
In-Reply-To: <20240426165839.v2.1.I30fa4c8348ea316c886ef8a522a52fed617f930d@changeid>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 27 Apr 2024 04:44:33 +0300
Message-ID: <CAA8EJpog5yn5kiabJOZRipTx--onH9cepPe0dD4nA=Hm0aZS+g@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] drm/mipi-dsi: Fix theoretical int overflow in
 mipi_dsi_dcs_write_seq()
To: Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, Linus Walleij <linus.walleij@linaro.org>, 
 lvzhaoxiong@huaqin.corp-partner.google.com, 
 Jani Nikula <jani.nikula@linux.intel.com>, Hsin-Yi Wang <hsinyi@google.com>, 
 Javier Martinez Canillas <javierm@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Joel Selvaraj <jo@jsfamily.in>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Sat, 27 Apr 2024 at 02:59, Douglas Anderson <dianders@chromium.org> wrote:
>
> The mipi_dsi_dcs_write_seq() macro makes a call to
> mipi_dsi_dcs_write_buffer() which returns a type ssize_t. The macro
> then stores it in an int and checks to see if it's negative. This
> could theoretically be a problem if "ssize_t" is larger than "int".
>
> To see the issue, imagine that "ssize_t" is 32-bits and "int" is
> 16-bits, you could see a problem if there was some code out there that
> looked like:
>
>   mipi_dsi_dcs_write_seq(dsi, cmd, <32767 bytes as arguments>);
>
> ...since we'd get back that 32768 bytes were transferred and 32768
> stored in a 16-bit int would look negative.
>
> Though there are no callsites where we'd actually hit this (even if
> "int" was only 16-bit), it's cleaner to make the types match so let's
> fix it.
>
> Fixes: 2a9e9daf7523 ("drm/mipi-dsi: Introduce mipi_dsi_dcs_write_seq macro")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v2:
> - New
>
>  include/drm/drm_mipi_dsi.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 82b1cc434ea3..b3576be22bfa 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -337,12 +337,12 @@ int mipi_dsi_dcs_get_display_brightness_large(struct mipi_dsi_device *dsi,
>         do {                                                               \
>                 static const u8 d[] = { cmd, seq };                        \
>                 struct device *dev = &dsi->dev;                            \
> -               int ret;                                                   \
> +               ssize_t ret;                                               \
>                 ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));    \
>                 if (ret < 0) {                                             \
>                         dev_err_ratelimited(                               \
>                                 dev, "sending command %#02x failed: %d\n", \
> -                               cmd, ret);                                 \
> +                               cmd, (int)ret);                            \

Please consider using %zd instead

>                         return ret;                                        \
>                 }                                                          \
>         } while (0)
> --
> 2.44.0.769.g3c40516874-goog
>


-- 
With best wishes
Dmitry

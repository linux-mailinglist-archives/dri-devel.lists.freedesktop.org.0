Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E08E854B69E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 18:47:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A83FA1128D8;
	Tue, 14 Jun 2022 16:47:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1FB21128EE
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 16:47:55 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id u12so18296889eja.8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 09:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vVovGQ5fjfaOvKC3MlcNhsynn0qk9qxvdPKcyK4Jv4w=;
 b=nDBYggQz56AaQegQSy4PvGQ/v4hU6wDc3U5ZHn5DmHMVptFBekry8XN/iFV8wvBsH8
 wQWUtSe7P6wg3aRn3sJxNMZdY0KDY+TKVSF4jttsHMw4Hv7gheeTClBsgy4zANFVWqbw
 /xOzQ4eLDnLvDVzHyVv8RqB0aBvmp36uJHOdUGJO6hqjd6fTwvVWvyyqB6klXhza2aQR
 ENgPZDWUSFFqiEJlgJWVkFvrqBkuLRopsn56xNJ4Gv9YJPBVRwLU2mreH9quSjTO6P2P
 qWC/tn8HRnUGU4BG1Ha0ni0WNu0Aj2nPZ63UnWDN/3ztDNxhbm+wAiUv/IjZ8yv8Vsbi
 +9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vVovGQ5fjfaOvKC3MlcNhsynn0qk9qxvdPKcyK4Jv4w=;
 b=0H1qhapbEc035qwXm9QjSj0ZqYKMypmbQRfMhb9HMaxDTVRda8YshqNJ9Y3YiY0Kab
 6RFx4iOD+GWcKq5QFKrO1N+B0MUXobZY0HtcB527Mr7RfhLxee7acGWMW9h0mPkoyEIr
 99iW17oBnn82fWqaJ9qJE6Q65Clgrxl6nAZ312y7YpWEmrvMaaBEwDgMdKf9f1ynEbYm
 kcO97JYwEqI3NPM1UFyZfrfFOYqqT5h4uETBKb9g+9tkWF6GpxUSvVX0bXqG8/acVXDo
 nSNl/lZAPDhQbFH++3tkMSF2qegf+ziSUa3kfr5ceSNtpKYzCcnAEk83Xkd5rSS4sVbN
 Im8w==
X-Gm-Message-State: AOAM533D+J1uw9cTbaVo5AByYU/GuMMhXW0AbVKnGOfmmJndsB8tJB41
 d6EbZR5EgNSSdle5jxVoztWeS5uDl/DAug+uZX4bAQ==
X-Google-Smtp-Source: ABdhPJxah+q9lB20h/S1bst2Vd+U46LvT3NunyCVGnwL1zG0TY5UUWvGLrRl70BHU2xnrmIT+OvbhagZwM6c0qsZuYY=
X-Received: by 2002:a17:907:8a13:b0:707:194c:30df with SMTP id
 sc19-20020a1709078a1300b00707194c30dfmr5202131ejc.154.1655225274488; Tue, 14
 Jun 2022 09:47:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-26-maxime@cerno.tech>
In-Reply-To: <20220610092924.754942-26-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 14 Jun 2022 17:47:28 +0100
Message-ID: <CAPY8ntDemhFi3ZFfOE_9kxtmc7v8Wse0C+dz0xxLrBGvSPh12w@mail.gmail.com>
Subject: Re: [PATCH 25/64] drm/vc4: dpi: Add action to disable the clock
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime.

On Fri, 10 Jun 2022 at 10:30, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Adding a device-managed action will make the error path easier, so let's
> create one to disable our clock.

The DPI block has two clocks (core and pixel), and this is only
affecting one of them (the core clock).
(I'm actually puzzling over what it's wanting to do with the core
clock here as it's only enabling it rather than setting a rate. I
think it may be redundant).

With that text amended:
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

  Dave

> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_dpi.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
> index 5a6cdea7bf7b..4e24dbad77f2 100644
> --- a/drivers/gpu/drm/vc4/vc4_dpi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dpi.c
> @@ -237,6 +237,13 @@ static int vc4_dpi_init_bridge(struct vc4_dpi *dpi)
>         return drm_bridge_attach(&dpi->encoder.base, bridge, NULL, 0);
>  }
>
> +static void vc4_dpi_disable_clock(void *ptr)
> +{
> +       struct vc4_dpi *dpi = ptr;
> +
> +       clk_disable_unprepare(dpi->core_clock);
> +}
> +
>  static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
>  {
>         struct platform_device *pdev = to_platform_device(dev);
> @@ -285,6 +292,10 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
>                 return ret;
>         }
>
> +       ret = devm_add_action_or_reset(dev, vc4_dpi_disable_clock, dpi);
> +       if (ret)
> +               return ret;
> +
>         drm_simple_encoder_init(drm, &dpi->encoder.base, DRM_MODE_ENCODER_DPI);
>         drm_encoder_helper_add(&dpi->encoder.base, &vc4_dpi_encoder_helper_funcs);
>
> @@ -300,7 +311,6 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
>
>  err_destroy_encoder:
>         drm_encoder_cleanup(&dpi->encoder.base);
> -       clk_disable_unprepare(dpi->core_clock);
>         return ret;
>  }
>
> @@ -310,8 +320,6 @@ static void vc4_dpi_unbind(struct device *dev, struct device *master,
>         struct vc4_dpi *dpi = dev_get_drvdata(dev);
>
>         drm_encoder_cleanup(&dpi->encoder.base);
> -
> -       clk_disable_unprepare(dpi->core_clock);
>  }
>
>  static const struct component_ops vc4_dpi_ops = {
> --
> 2.36.1
>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B86F4896FA
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 12:07:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F099914A510;
	Mon, 10 Jan 2022 11:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C45A714A510
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 11:07:39 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id i129so3056723pfe.13
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 03:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h0WhJOXOIXStJJ6ck6mfg09D8OffbWXAr5yGtvcomGQ=;
 b=broGCfCJUjXflqF+qrPipmCf7A0RD2h2SunDU/BCJMJVGWcLopGMquRTPeS5xOigiH
 I/vqrjPnxZx0Nac+2ICN71FQRXxdAb5Ip3FeiD2Q+TvrHyEDHRjwGnEr3ytfXk80E3Uz
 mEGQM+zf1YlsZkC3dInbafnqrz4tCqLmNIMrkU3TRC3q+Eaggq85RXg/pNZK+Uo2vCLb
 X2i/4w7mBz5tf+TCFXxJDNu0HyYzv3ctAzeQ2qlO0YACVvxJbBhE5k8/iMHkHGAC/F/a
 /Doy8SyfjLF3z4aa9h5fwsiwtLtR6sgr/gonS0SttFe0sTINGlJPolmq/rHrr1zH4xu0
 A8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h0WhJOXOIXStJJ6ck6mfg09D8OffbWXAr5yGtvcomGQ=;
 b=i9exup+TMxMcKSPzgORZiDftdXn+mg3tW3fXH1iEYWlf9mw6XVXkA7Frd+dOqGyX8N
 Ssjwi7ClDRfgA3v2YL/tniRlRpdFiHb6A745eB39WtMCB0e/NZ4tgHqTU06kuldm+E65
 NIDz89kThsRi2pJ2lp2BICYKXKBvB5+Yl3zXXSPcXF1iA+y1+30szQTvoC7wEcut85oN
 /n4cw9OrfAWKS/BxN4ZQPqVDodQa/oEZjnHHj631htBAbUdZuRoBXD63EjOtbsGnwBAH
 s10DItUpvy6CYy3a0V42bv/brWeJHiExsfQuVxS1Rf1JX8wF9qOL19S3O8mqNiQR3nuC
 nwpA==
X-Gm-Message-State: AOAM531wakMHkwrUDhLeZoQn8PbqOZeNpony4/WCC0CmJh+1l9t+/EH4
 jlNDqU9cHPihZ1NUEEDSCZHP4gANVPPjnR9pmMKKJw==
X-Google-Smtp-Source: ABdhPJyFWvC6StVIpcpUmbE8FzPylEJlJXKs2EwC1wxmkkefiROXZoDv4dgmlDmccAlMuCyl0puEZAHRYhRyDH3WXpA=
X-Received: by 2002:a63:7c51:: with SMTP id l17mr4819031pgn.178.1641812859327; 
 Mon, 10 Jan 2022 03:07:39 -0800 (PST)
MIME-Version: 1.0
References: <20220109172949.168167-1-jagan@amarulasolutions.com>
In-Reply-To: <20220109172949.168167-1-jagan@amarulasolutions.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 10 Jan 2022 12:07:28 +0100
Message-ID: <CAG3jFysNcSnL2JRmuDFtv-yCphG=aNKbcyLg75Zau=Uekh1bFw@mail.gmail.com>
Subject: Re: [PATCH] drm: bridge: adv7511: Fix ADV7535 HPD enablement
To: Jagan Teki <jagan@amarulasolutions.com>
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
Cc: dri-devel@lists.freedesktop.org, linux-amarula@amarulasolutions.com,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Jagan,

Thanks for submitting this fix.

On Sun, 9 Jan 2022 at 18:30, Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Existing HPD enablement logic is not compatible with ADV7535
> bridge, thus any runtime plug-in of HDMI cable is not working
> on these bridge designs.
>
> Unlike other ADV7511 family of bridges, the ADV7535 require
> HPD_OVERRIDE bit to set and reset for proper handling of HPD
> functionality.
>
> Fix it.
>
> Fixes: 8501fe4b14a3 ("drm: bridge: adv7511: Add support for ADV7535")
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511.h     |  1 +
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 29 +++++++++++++++-----
>  2 files changed, 23 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> index 592ecfcf00ca..6a882891d91c 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> @@ -169,6 +169,7 @@
>  #define ADV7511_PACKET_ENABLE_SPARE2           BIT(1)
>  #define ADV7511_PACKET_ENABLE_SPARE1           BIT(0)
>
> +#define ADV7535_REG_POWER2_HPD_OVERRIDE                BIT(6)
>  #define ADV7511_REG_POWER2_HPD_SRC_MASK                0xc0
>  #define ADV7511_REG_POWER2_HPD_SRC_BOTH                0x00
>  #define ADV7511_REG_POWER2_HPD_SRC_HPD         0x40
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index f8e5da148599..77118c3395bf 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -351,11 +351,17 @@ static void __adv7511_power_on(struct adv7511 *adv7511)
>          * from standby or are enabled. When the HPD goes low the adv7511 is
>          * reset and the outputs are disabled which might cause the monitor to
>          * go to standby again. To avoid this we ignore the HPD pin for the
> -        * first few seconds after enabling the output.
> +        * first few seconds after enabling the output. On the other hand
> +        * adv7535 require to enable HPD Override bit for proper HPD.
>          */
> -       regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER2,
> -                          ADV7511_REG_POWER2_HPD_SRC_MASK,
> -                          ADV7511_REG_POWER2_HPD_SRC_NONE);
> +       if (adv7511->type == ADV7535)
> +               regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER2,
> +                                  ADV7535_REG_POWER2_HPD_OVERRIDE,
> +                                  ADV7535_REG_POWER2_HPD_OVERRIDE);
> +       else
> +               regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER2,
> +                                  ADV7511_REG_POWER2_HPD_SRC_MASK,
> +                                  ADV7511_REG_POWER2_HPD_SRC_NONE);
>  }
>
>  static void adv7511_power_on(struct adv7511 *adv7511)
> @@ -375,6 +381,10 @@ static void adv7511_power_on(struct adv7511 *adv7511)
>  static void __adv7511_power_off(struct adv7511 *adv7511)
>  {
>         /* TODO: setup additional power down modes */
> +       if (adv7511->type == ADV7535)
> +               regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER2,
> +                                  ADV7535_REG_POWER2_HPD_OVERRIDE, 0);
> +
>         regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER,
>                            ADV7511_POWER_POWER_DOWN,
>                            ADV7511_POWER_POWER_DOWN);
> @@ -672,9 +682,14 @@ adv7511_detect(struct adv7511 *adv7511, struct drm_connector *connector)
>                         status = connector_status_disconnected;
>         } else {
>                 /* Renable HPD sensing */
> -               regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER2,
> -                                  ADV7511_REG_POWER2_HPD_SRC_MASK,
> -                                  ADV7511_REG_POWER2_HPD_SRC_BOTH);
> +               if (adv7511->type == ADV7535)
> +                       regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER2,
> +                                          ADV7535_REG_POWER2_HPD_OVERRIDE,
> +                                          ADV7535_REG_POWER2_HPD_OVERRIDE);
> +               else
> +                       regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER2,
> +                                          ADV7511_REG_POWER2_HPD_SRC_MASK,
> +                                          ADV7511_REG_POWER2_HPD_SRC_BOTH);
>         }
>
>         adv7511->status = status;
> --
> 2.25.1
>

Reviewed-by: Robert Foss  <robert.foss@linaro.org>

Applied to drm-misc-next

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9537915C0AB
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 15:49:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4694D6F5EF;
	Thu, 13 Feb 2020 14:49:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B41976F5EF
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 14:49:04 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id p8so5755986oth.10
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 06:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vcfLm2jtEzdazoJrhRa/6IjRAeuLRNph80bHonczbjs=;
 b=ZXQD9YKcdWM/E1humUj0PqFUv1bR2pVGnWs/66SL0Pr0ocCSO9cCRjLK9aHppfnEc1
 c7+y9Rq58JHpa1PAW70q7AhsChY4KgSpPaEjH6Eyq+qvRhiSL6rRXeNYDnc+XsqzNsal
 nnXlbugr+kdCE/gvgjOJKEKA61ugdYrd7EIBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vcfLm2jtEzdazoJrhRa/6IjRAeuLRNph80bHonczbjs=;
 b=A9PKc7QiXy77mibEXoAQ5PLGR3O3lavJd4h29wtZSvIqHijYPbTn3gWfqhfepybIjy
 LyYFTxaHB2X2/5+2jdLLTyFQY3MX6aaJqgQDh8S65qAoBBKsN1gah/GrzTmIKFCFD4fm
 +kpovbRbiIizg+2ogegAUbpzG3T6tbhiKudN+KZErvE3urDQiwT1hSUbuPQnrzmR+Evz
 jVO/OJ1cmb7Q46rl0rTNOiLJQnLGbr2Thi4uhtFkVdO8Xj9748aGr2Qwg0duOJIWOaM+
 a25xnyBLn7CakNpS0bMsGI8db+u0waNmI5mnYqoDMFysIs1yNwpE3Cycpnf9aljNgIGB
 E2QQ==
X-Gm-Message-State: APjAAAV/p6EbL9G5HE8ULS7yv5J4H+j9hB0A3w2EJTM3fM2anImuuxr2
 61b3g3tNzUb5lgbBvFPZR7t4ld10RdIxUCXuFH6zWA==
X-Google-Smtp-Source: APXvYqyzwflTghR6+6u4NDALVo42W7QHaLTETE+pMSGVtE8277s0wjFRf+5vwFnO5GO0Etm0/02313JNlPIPYNF0QWU=
X-Received: by 2002:a9d:7696:: with SMTP id j22mr14433000otl.188.1581605343955; 
 Thu, 13 Feb 2020 06:49:03 -0800 (PST)
MIME-Version: 1.0
References: <20200213124833.35545-1-linus.walleij@linaro.org>
In-Reply-To: <20200213124833.35545-1-linus.walleij@linaro.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 13 Feb 2020 15:48:53 +0100
Message-ID: <CAKMK7uGDG7N1j53hPwNpnK+E=jiPDnEg3MofgC4fKmej_BUm2w@mail.gmail.com>
Subject: Re: [PATCH] drm/pl111: Support Integrator IM-PD1 module
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Sean Paul <sean@poorly.run>, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 13, 2020 at 1:48 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> The last in-kernel user of the old framebuffer driver is the
> IM-PD1 module for the Integrator/AP. Let's implement support for
> this remaining user so we can migrate the last user over to
> DRM and delete the old FB driver.
>
> On the Integrator/AP the IM-PD1 system controller will exist
> alongside the common Integrator system controller so make
> sure to do a special lookup for the IM-PD1 syscon and make it
> take precedence if found.
>
> Tested on the Integrator/AP with the IM-PD1 mounted.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Looking around in the arm/mach-integrator code this seems to match
roughly :-) I noticed there's also two more outputs for two panels,
but not here. Do we not care about these anymore?

Anyway, lgtm. Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/pl111/pl111_versatile.c | 73 +++++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
>
> diff --git a/drivers/gpu/drm/pl111/pl111_versatile.c b/drivers/gpu/drm/pl111/pl111_versatile.c
> index 09aeaffb7660..4f325c410b5d 100644
> --- a/drivers/gpu/drm/pl111/pl111_versatile.c
> +++ b/drivers/gpu/drm/pl111/pl111_versatile.c
> @@ -19,6 +19,7 @@ static struct regmap *versatile_syscon_map;
>   * We detect the different syscon types from the compatible strings.
>   */
>  enum versatile_clcd {
> +       INTEGRATOR_IMPD1,
>         INTEGRATOR_CLCD_CM,
>         VERSATILE_CLCD,
>         REALVIEW_CLCD_EB,
> @@ -65,6 +66,14 @@ static const struct of_device_id versatile_clcd_of_match[] = {
>         {},
>  };
>
> +static const struct of_device_id impd1_clcd_of_match[] = {
> +       {
> +               .compatible = "arm,im-pd1-syscon",
> +               .data = (void *)INTEGRATOR_IMPD1,
> +       },
> +       {},
> +};
> +
>  /*
>   * Core module CLCD control on the Integrator/CP, bits
>   * 8 thru 19 of the CM_CONTROL register controls a bunch
> @@ -125,6 +134,36 @@ static void pl111_integrator_enable(struct drm_device *drm, u32 format)
>                            val);
>  }
>
> +#define IMPD1_CTRL_OFFSET      0x18
> +#define IMPD1_CTRL_DISP_LCD    (0 << 0)
> +#define IMPD1_CTRL_DISP_VGA    (1 << 0)
> +#define IMPD1_CTRL_DISP_LCD1   (2 << 0)
> +#define IMPD1_CTRL_DISP_ENABLE (1 << 2)
> +#define IMPD1_CTRL_DISP_MASK   (7 << 0)
> +
> +static void pl111_impd1_enable(struct drm_device *drm, u32 format)
> +{
> +       u32 val;
> +
> +       dev_info(drm->dev, "enable IM-PD1 CLCD connectors\n");
> +       val = IMPD1_CTRL_DISP_VGA | IMPD1_CTRL_DISP_ENABLE;
> +
> +       regmap_update_bits(versatile_syscon_map,
> +                          IMPD1_CTRL_OFFSET,
> +                          IMPD1_CTRL_DISP_MASK,
> +                          val);
> +}
> +
> +static void pl111_impd1_disable(struct drm_device *drm)
> +{
> +       dev_info(drm->dev, "disable IM-PD1 CLCD connectors\n");
> +
> +       regmap_update_bits(versatile_syscon_map,
> +                          IMPD1_CTRL_OFFSET,
> +                          IMPD1_CTRL_DISP_MASK,
> +                          0);
> +}
> +
>  /*
>   * This configuration register in the Versatile and RealView
>   * family is uniformly present but appears more and more
> @@ -270,6 +309,20 @@ static const struct pl111_variant_data pl110_integrator = {
>         .fb_bpp = 16,
>  };
>
> +/*
> + * The IM-PD1 variant is a PL110 with a bunch of broken, or not
> + * yet implemented features
> + */
> +static const struct pl111_variant_data pl110_impd1 = {
> +       .name = "PL110 IM-PD1",
> +       .is_pl110 = true,
> +       .broken_clockdivider = true,
> +       .broken_vblank = true,
> +       .formats = pl110_integrator_pixel_formats,
> +       .nformats = ARRAY_SIZE(pl110_integrator_pixel_formats),
> +       .fb_bpp = 16,
> +};
> +
>  /*
>   * This is the in-between PL110 variant found in the ARM Versatile,
>   * supporting RGB565/BGR565
> @@ -322,8 +375,21 @@ int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
>                 /* Non-ARM reference designs, just bail out */
>                 return 0;
>         }
> +
>         versatile_clcd_type = (enum versatile_clcd)clcd_id->data;
>
> +       /*
> +        * On the Integrator, check if we should use the IM-PD1 instead,
> +        * if we find it, it will take precedence. This is on the Integrator/AP
> +        * which only has this option for PL110 graphics.
> +        */
> +        if (versatile_clcd_type == INTEGRATOR_CLCD_CM) {
> +               np = of_find_matching_node_and_match(NULL, impd1_clcd_of_match,
> +                                                    &clcd_id);
> +               if (np)
> +                       versatile_clcd_type = (enum versatile_clcd)clcd_id->data;
> +       }
> +
>         /* Versatile Express special handling */
>         if (versatile_clcd_type == VEXPRESS_CLCD_V2M) {
>                 struct platform_device *pdev;
> @@ -367,6 +433,13 @@ int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
>                 priv->variant_display_enable = pl111_integrator_enable;
>                 dev_info(dev, "set up callbacks for Integrator PL110\n");
>                 break;
> +       case INTEGRATOR_IMPD1:
> +               versatile_syscon_map = map;
> +               priv->variant = &pl110_impd1;
> +               priv->variant_display_enable = pl111_impd1_enable;
> +               priv->variant_display_disable = pl111_impd1_disable;
> +               dev_info(dev, "set up callbacks for IM-PD1 PL110\n");
> +               break;
>         case VERSATILE_CLCD:
>                 versatile_syscon_map = map;
>                 /* This can do RGB565 with external PLD */
> --
> 2.23.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



--
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

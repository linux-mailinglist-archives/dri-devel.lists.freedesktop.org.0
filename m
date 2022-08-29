Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B36085A5172
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 18:20:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2565410E21B;
	Mon, 29 Aug 2022 16:20:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2294F10E21B
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 16:19:59 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id s11so10772329edd.13
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 09:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=OQAkogXyi5MfxH3MvVmFFLbEUzfWs2ei3zVaXo77Oac=;
 b=xb9cOuu1DSGmOn2ydqO2FqAy6S64XlEABywPt/+9CjOLzndmJORuI4axUAuxpNvzxd
 QtjEFqrXTV2TfoTYUS/6MrXKL0VxURPv9D/RS7+ojfy1/cSdzDq64mz9zopYegPwLc4J
 V+FFeHqRPleFUY1FL3siAsYR67IADO5UFpFJ+e57oubFdbjN+Vs9bVQuVOUfwbGihUMO
 2qMs9UYsAO6S205JSI2M7Wh8ahnuUYzkqgFcJ2ukPFRht9g50iwzr6E4cWGMhB7YpTbo
 nPjjoRjvYh1Js8Ipk218UkYAsHaGE+l/iDpsBlSXKblFfwhVllWKhG/gFYCM8IK8u1Qx
 316w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=OQAkogXyi5MfxH3MvVmFFLbEUzfWs2ei3zVaXo77Oac=;
 b=uEfe5aTXKkvQOO0fZ1JUFn6z69pD+hX3q8a6OMoKXCLSLscZUsWwcTpdueeDjUR4HY
 ro6iNQ+XkmwY9lzW9B0inb7dUSvJnzJCk55siHWONemVoHxRfGK3NObceaM3CRW/4bno
 D3ocTC+4NjqmOzocDVmHqZ1O1EnPRAqFS33754WL/e0MW4Q4HSH1kgPEmqsw6bdN97nn
 5ZQ6Xx541QYStwW1i6PfBS/YQaAGLxoHpe5CvJ5X1QWlD/AQmv6RlB6qF8KP8jZcY9cR
 vqawhznZR4/m1nssqCZVYQGMwQ4DAZXjpnvOWEokCLnVwFeuDFKDtNtyrhoKUzeYcJdl
 xaRQ==
X-Gm-Message-State: ACgBeo1v+v6+AstwH8vWc+dElc5jLL2wANRl4yQk92dXRTzxm90IBwE/
 5k2xmphWGTb4uk3xB7Sy6U6QDlmmDcoCqgvmWbmu2A==
X-Google-Smtp-Source: AA6agR77T5nWOClvMTQuVAIlIEXoGPDWcNQXiaUtH472l9io+/9RPxPOoBuzNG0JDnGAkVBpR2Gx3rpmY1Nll8GmL68=
X-Received: by 2002:a05:6402:909:b0:435:a8b:5232 with SMTP id
 g9-20020a056402090900b004350a8b5232mr17004884edz.240.1661789997676; Mon, 29
 Aug 2022 09:19:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220330193941.3720-1-macroalpha82@gmail.com>
 <20220330193941.3720-3-macroalpha82@gmail.com>
In-Reply-To: <20220330193941.3720-3-macroalpha82@gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 29 Aug 2022 18:19:46 +0200
Message-ID: <CAG3jFyu+3SC_JyYK-Dn4AfkxkRM5XEctPzPx_Ut9DgDJS_a3YQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/bridge: chrontel-ch7033: Add option for setting
 byteswap order
To: Chris Morgan <macroalpha82@gmail.com>
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
Cc: jernej.skrabec@gmail.com, narmstrong@baylibre.com, airlied@linux.ie,
 jonas@kwiboo.se, Chris Morgan <macromorgan@hotmail.com>,
 dri-devel@lists.freedesktop.org, lkundrak@v3.sk, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 30 Mar 2022 at 21:39, Chris Morgan <macroalpha82@gmail.com> wrote:
>
> From: Chris Morgan <macromorgan@hotmail.com>
>
> Add the option to set the byteswap order in the devicetree. For the
> official HDMI DIP for the NTC CHIP the byteswap order needs to be
> RGB, however the driver sets it as BGR. With this patch the driver
> will remain at BGR unless manually specified via devicetree.
>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  drivers/gpu/drm/bridge/chrontel-ch7033.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
> index 486f405c2e16..88175b7e80d4 100644
> --- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
> +++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
> @@ -67,6 +67,7 @@ enum {
>         BYTE_SWAP_GBR   = 3,
>         BYTE_SWAP_BRG   = 4,
>         BYTE_SWAP_BGR   = 5,
> +       BYTE_SWAP_MAX   = 6,
>  };
>
>  /* Page 0, Register 0x19 */
> @@ -354,6 +355,8 @@ static void ch7033_bridge_mode_set(struct drm_bridge *bridge,
>         int hsynclen = mode->hsync_end - mode->hsync_start;
>         int vbporch = mode->vsync_start - mode->vdisplay;
>         int vsynclen = mode->vsync_end - mode->vsync_start;
> +       u8 byte_swap;
> +       int ret;
>
>         /*
>          * Page 4
> @@ -397,8 +400,16 @@ static void ch7033_bridge_mode_set(struct drm_bridge *bridge,
>         regmap_write(priv->regmap, 0x15, vbporch);
>         regmap_write(priv->regmap, 0x16, vsynclen);
>
> -       /* Input color swap. */
> -       regmap_update_bits(priv->regmap, 0x18, SWAP, BYTE_SWAP_BGR);
> +       /* Input color swap. Byte order is optional and will default to
> +        * BYTE_SWAP_BGR to preserve backwards compatibility with existing
> +        * driver.
> +        */
> +       ret = of_property_read_u8(priv->bridge.of_node, "chrontel,byteswap",
> +                                 &byte_swap);
> +       if (!ret && byte_swap < BYTE_SWAP_MAX)
> +               regmap_update_bits(priv->regmap, 0x18, SWAP, byte_swap);
> +       else
> +               regmap_update_bits(priv->regmap, 0x18, SWAP, BYTE_SWAP_BGR);
>
>         /* Input clock and sync polarity. */
>         regmap_update_bits(priv->regmap, 0x19, 0x1, mode->clock >> 16);
> --
> 2.25.1
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>

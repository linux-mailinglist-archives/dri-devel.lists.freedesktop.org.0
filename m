Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0E1325400
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 17:51:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B2C96ECE3;
	Thu, 25 Feb 2021 16:51:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8499D6ECE3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 16:51:40 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id 7so5941095wrz.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 08:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pC8GhdhL7FQzyqXKBARK8g3SpEQ7eUs8uU1WApnchic=;
 b=JNszVqasWRybdF5BPfiaCuQMheCTMfDfriRVZJWjKuwJ2E0sm0/dNmOePpPBohPaNe
 5pUTIEmXZj6LQuh+XRSwviI4m8nOuQ7HwbPHdnT2A15QAUzbNlR4Zv6/p+c7bbb1CbwA
 bNPU064gWYVMObYHH2lB9hVj75/SUsLlTsYbAsXrcg2mp3E63xKhHYrfsq2A+XS4vIMP
 uEbrzjHIDy++H8BfLHv+TArG7SC/n3J0UbSbjAmArv8ct6TNNef2KP5+Z0WPWeKZm3ZE
 ZZ7RpwK8dCsI28gROB5nCtcdTLXRCdLSSZAH1CUIvicTAUIkSzD/YPZ5ZAhi2vt4ewrR
 fYBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pC8GhdhL7FQzyqXKBARK8g3SpEQ7eUs8uU1WApnchic=;
 b=DdA6cF/L6Yhd8CxKoTwBKwdS6O+wAY7837KL0+tptIrFx+eyagotojVpeT6mtXtFxP
 0l/tU1yk4DESzLC9Nj0bcfzEZG6XZGBzThX9KJcQZQbYkN8DT39NgJTyDIw3BaM7Ghe1
 U3/nonq49fP9hhUPFsgeaVkmIgeikWBpFdrD5FCXSNFh/UOGJUaFaTG/newgpsYH2Wxh
 GutWq1eSm8sEpIObGvEMtZprMYSHVjKB1hBeZQdpTCDWHUVL2ELNYQPrS85Hsr7XyYzA
 d6FtPq9+kYPZgd7RoMzUninacv5Z1wDuzQ5b2bRx4Mw9m9zNkVEkbVYoXwJKp6YU+Kx7
 etcg==
X-Gm-Message-State: AOAM533mbxGalZJxQRClGSxezI5B5SPWslttyeGAJjoand72f01iJdVS
 KN4d3F/9wZZpes8euwQoOvwPlZsT3Js8QP7Uq+Jd6BIzZG8=
X-Google-Smtp-Source: ABdhPJwvIr51FEdcMlolg+/kkVFJSRrYfHL29cXZcfOelOKj1lJWo2tx8JJS8TlA+oHH861XElivlNjSOtVpt172Fds=
X-Received: by 2002:a5d:4e05:: with SMTP id p5mr4354391wrt.273.1614271899137; 
 Thu, 25 Feb 2021 08:51:39 -0800 (PST)
MIME-Version: 1.0
References: <20210225155909.1853812-1-maxime@cerno.tech>
 <20210225155909.1853812-3-maxime@cerno.tech>
In-Reply-To: <20210225155909.1853812-3-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 25 Feb 2021 16:51:23 +0000
Message-ID: <CAPY8ntApkdz_WjuBqgjXHRbE5AGvLUPup=bi2rTt94ssX_CTpw@mail.gmail.com>
Subject: Re: [PATCH 2/8] drm/vc4: hvs: Make the HVS bind first
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, Stephen Boyd <sboyd@kernel.org>,
 Mike Turquette <mturquette@baylibre.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Phil Elwell <phil@raspberrypi.com>, David Airlie <airlied@linux.ie>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-clk@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 25 Feb 2021 at 15:59, Maxime Ripard <maxime@cerno.tech> wrote:
>
> We'll need to have the HVS binding before the HDMI controllers so that
> we can check whether the firmware allows to run in 4kp60. Reorder a bit
> the component list, and document the current constraints we're aware of.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Based on my understanding of bind ordering this makes sense, but I
don't consider myself an expert there.

Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_drv.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
> index 556ad0f02a0d..0310590ee66e 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.c
> +++ b/drivers/gpu/drm/vc4/vc4_drv.c
> @@ -303,12 +303,21 @@ static const struct component_master_ops vc4_drm_ops = {
>         .unbind = vc4_drm_unbind,
>  };
>
> +/*
> + * This list determines the binding order of our components, and we have
> + * a few constraints:
> + *   - The TXP driver needs to be bound before the PixelValves (CRTC)
> + *     but after the HVS to set the possible_crtc field properly
> + *   - The HDMI driver needs to be bound after the HVS so that we can
> + *     lookup the HVS maximum core clock rate and figure out if we
> + *     support 4kp60 or not.
> + */
>  static struct platform_driver *const component_drivers[] = {
> +       &vc4_hvs_driver,
>         &vc4_hdmi_driver,
>         &vc4_vec_driver,
>         &vc4_dpi_driver,
>         &vc4_dsi_driver,
> -       &vc4_hvs_driver,
>         &vc4_txp_driver,
>         &vc4_crtc_driver,
>         &vc4_v3d_driver,
> --
> 2.29.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED67F2307B0
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 12:30:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D89F36E23F;
	Tue, 28 Jul 2020 10:30:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 614A86E23F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 10:30:33 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id k8so7331995wma.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 03:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y5ceSz5kBwvnkS9EauvIKWx1J5tvf5TXDk4n7UdnC5w=;
 b=k7c86DFkAMXUKdkCigOqF6z+tJn4AYl2YFAMqdxQpX14GIluEQj8pekgNwItnSKj2N
 /QAd8CsRWLuuqXATjhgH9+qrbs1gpFld3vO5ncwaNXqlFGY49rCbnwRhIlYipEtCt67u
 sBhVQtty+k7AOvdFftIO1Lty4nZqVGdGhSWByRfV7G0j5SPsdYngxeSdPrMmt8tCr9/Q
 49BL0ffavtQhjtvmfcng4fEU9t5tKjBbAYzqmUvnG9GBahvgtOoD0/r+JvtSbOul80JO
 qnmn4M3ZvTEwgzc9M1yl3PAyy6eynXLRW8We14LFJpaxWRvuK/pm3soZMPyo3178Uz0n
 tXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y5ceSz5kBwvnkS9EauvIKWx1J5tvf5TXDk4n7UdnC5w=;
 b=AlYJ96o915zE4wMn8ltt5WvONYXRk0WZ5IQsMHxS3Df5GbwBV/32UNFROu5X6x9Uog
 pxV2aRdrBuJiaEXje7HF/vSj0hiXWkyWT01UQJBW9HQZUrTxVqkN7sgtylQFZGBnk/CZ
 w0OELuzLwXjI8r0UpvP6oD2aWOX2ih7Lh+xNLnuFp4WpUAH6EiEAM5Srox4GOvflXmcB
 X4XjC1jXOgbPlyOwQTqkhGjZMndYYUEu9M4vDSE38PibdhfO+unGk2/vOMeqRmqrkGTS
 UdMZIZUPxOjgjLOyJ9R4aU/9zzgJbmjox7tGWyjWCCsKo14dUxqo5kOQbCjrajV2GufS
 1AEA==
X-Gm-Message-State: AOAM530mqiBRqttmI/80Pz4FhF0JVVbZ8CI0RWacMkQWspEDwfaf+vO0
 s+KAJ60wQ5x1rHhg9E6TGOlc7QfnkXRP3O4+0lFR/g==
X-Google-Smtp-Source: ABdhPJwKbedCANNtAuPmzJgxQeCetxm7R61+Z3yE5qNo7ncV2Mv/As0sHRgJ0X8luyfpiII4Snt3cMFdXnKRnxMJjXE=
X-Received: by 2002:a1c:7918:: with SMTP id l24mr3367332wme.158.1595932231996; 
 Tue, 28 Jul 2020 03:30:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <bb369aede3a6d0463805faabeb5f598a369b54bf.1594230107.git-series.maxime@cerno.tech>
In-Reply-To: <bb369aede3a6d0463805faabeb5f598a369b54bf.1594230107.git-series.maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 28 Jul 2020 11:30:16 +0100
Message-ID: <CAPY8ntBSux3gAU1+LV_wA5pLwaovNy1cwZY7KZkb8Er8-MnNPA@mail.gmail.com>
Subject: Re: [PATCH v4 21/78] drm/vc4: crtc: Move PV dump to config_pv
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Wed, 8 Jul 2020 at 18:43, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Now that we only configure the PixelValve in vc4_crtc_config_pv, it doesn't
> really make much sense to dump its register content in its caller.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_crtc.c | 26 ++++++++++++--------------
>  1 file changed, 12 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
> index c2ab907611e3..181d3fd57bc7 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -290,6 +290,14 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc)
>                        vc4_encoder->type == VC4_ENCODER_TYPE_DSI1);
>         u32 format = is_dsi ? PV_CONTROL_FORMAT_DSIV_24 : PV_CONTROL_FORMAT_24;
>         u8 ppc = pv_data->pixels_per_clock;
> +       bool debug_dump_regs = false;
> +
> +       if (debug_dump_regs) {
> +               struct drm_printer p = drm_info_printer(&vc4_crtc->pdev->dev);
> +               dev_info(&vc4_crtc->pdev->dev, "CRTC %d regs before:\n",
> +                        drm_crtc_index(crtc));
> +               drm_print_regset32(&p, &vc4_crtc->regset);
> +       }
>
>         vc4_crtc_pixelvalve_reset(crtc);
>
> @@ -359,30 +367,20 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc)
>                    PV_CONTROL_WAIT_HSTART |
>                    VC4_SET_FIELD(vc4_encoder->clock_select,
>                                  PV_CONTROL_CLK_SELECT));
> -}
> -
> -static void vc4_crtc_mode_set_nofb(struct drm_crtc *crtc)
> -{
> -       struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
> -       bool debug_dump_regs = false;
>
>         if (debug_dump_regs) {
>                 struct drm_printer p = drm_info_printer(&vc4_crtc->pdev->dev);
> -               dev_info(&vc4_crtc->pdev->dev, "CRTC %d regs before:\n",
> +               dev_info(&vc4_crtc->pdev->dev, "CRTC %d regs after:\n",
>                          drm_crtc_index(crtc));
>                 drm_print_regset32(&p, &vc4_crtc->regset);
>         }
> +}
>
> +static void vc4_crtc_mode_set_nofb(struct drm_crtc *crtc)
> +{
>         vc4_crtc_config_pv(crtc);
>
>         vc4_hvs_mode_set_nofb(crtc);
> -
> -       if (debug_dump_regs) {
> -               struct drm_printer p = drm_info_printer(&vc4_crtc->pdev->dev);
> -               dev_info(&vc4_crtc->pdev->dev, "CRTC %d regs after:\n",
> -                        drm_crtc_index(crtc));
> -               drm_print_regset32(&p, &vc4_crtc->regset);
> -       }
>  }
>
>  static void require_hvs_enabled(struct drm_device *dev)
> --
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

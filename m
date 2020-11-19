Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8913D2B90C1
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 12:15:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7006789C3F;
	Thu, 19 Nov 2020 11:15:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1110A89C3F
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 11:15:10 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id h21so6382189wmb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 03:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i3bywqJGibmImGFVBloG/PxKQsxxZW+1/hxQlrjgQ2M=;
 b=kViebYGf415PllV0Y/kR3BerhJPS88hs4oIKDLMMJ6Oz6BBVcMhrU7MDfg6pBweuys
 HP/ktZl2lvoeUezzxzoZU0W7CYSur36juWPWN1SwExFOpyvq0nIOUywJxzwmjQuJUo5F
 EH93U+Nty5EKwSh9whoYh1ADy22TIFt9mJNecTs2EudW+PBgoY35ajE10b+iKH8A0GzA
 I07QUvMNJASyDEoFAwQHjCelRT9zFJodOryXa+FVVX1iI9MXReG1L0rxzhaHc6elvHcB
 GVRklaiVtGrs3gAWXwVnI8gcnloDTwy89I/iJE8zxoP8I0Nvy06FNNmvkpuynMPSKSfk
 1twg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i3bywqJGibmImGFVBloG/PxKQsxxZW+1/hxQlrjgQ2M=;
 b=QWMpH9vW24zzK5/tm5E4I4xCK5AWhfwfBHpQ53+p7um2AXoDGXEFLK7OoJlJiOX/1x
 M8D0nRlyHhlQFFaUFTfyRneawNp69ey0ma3UJ/buw5XF3p3V92CeV+QaoQ/LKNSCEA7z
 ZoohAHz9TIXVsogsctF6lUBL+oAMTneUz4/Fi8Zn/KvaU1zxuv3g3FdQvhFVmyKOoqmh
 y5oXOSGQmHXJyVd1SqrjR4hbgmwCe7TnsJ9GrV/tKM787RJbBAxsjzyRo2mswb318vCI
 xyeDeRfrm5MERe6SG2/3NG/F8ryHcslZu80m/2An0lfkTueabLIfQUOFy3vL+nH/mtzS
 HNDA==
X-Gm-Message-State: AOAM5315oxqQkh18t+l9XOmW3iYcpqVCeYo2YjHTs6m/B5hyr1gwb38j
 xxw8Kts3I6MXmuv8CNCKjyf0KwWCyzU3SrcQKqJ4WA==
X-Google-Smtp-Source: ABdhPJyB/azykQfBEc+CLIkkFCj/BRoWSVMQ5O1khMgFJBoR5x2SDgk0oIVd5froSHQYd588aMJNZk1cdHfNfEihuQs=
X-Received: by 2002:a1c:810c:: with SMTP id c12mr3772722wmd.96.1605784508683; 
 Thu, 19 Nov 2020 03:15:08 -0800 (PST)
MIME-Version: 1.0
References: <20201029122522.1917579-1-maxime@cerno.tech>
 <20201029122522.1917579-2-maxime@cerno.tech>
In-Reply-To: <20201029122522.1917579-2-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 19 Nov 2020 11:14:50 +0000
Message-ID: <CAPY8ntCBGBv-FkOD1qR4-xOsKSB+G1Qcy5rcebRmkVWiwpRUzw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/vc4: hdmi: Block odd horizontal timings
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Tim Gover <tim.gover@raspberrypi.com>, David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

Thanks for the rewording :-)

On Thu, 29 Oct 2020 at 12:25, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The FIFO between the pixelvalve and the HDMI controller runs at 2 pixels
> per clock cycle, and cannot deal with odd timings.
>
> Let's reject any mode with such timings.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>
> Changes from v1:
>   - s/broken/unsupported/
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 12 ++++++++++++
>  drivers/gpu/drm/vc4/vc4_hdmi.h |  3 +++
>  2 files changed, 15 insertions(+)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 3d0338822cd2..506c12454086 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -768,6 +768,11 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
>         struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
>         unsigned long long pixel_rate = mode->clock * 1000;
>
> +       if (vc4_hdmi->variant->unsupported_odd_h_timings &&
> +           ((mode->hdisplay % 2) || (mode->hsync_start % 2) ||
> +            (mode->hsync_end % 2) || (mode->htotal % 2)))
> +               return -EINVAL;
> +
>         if (pixel_rate > vc4_hdmi->variant->max_pixel_clock)
>                 return -EINVAL;
>
> @@ -780,6 +785,11 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
>  {
>         struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
>
> +       if (vc4_hdmi->variant->unsupported_odd_h_timings &&
> +           ((mode->hdisplay % 2) || (mode->hsync_start % 2) ||
> +            (mode->hsync_end % 2) || (mode->htotal % 2)))
> +               return MODE_H_ILLEGAL;
> +
>         if ((mode->clock * 1000) > vc4_hdmi->variant->max_pixel_clock)
>                 return MODE_CLOCK_HIGH;
>
> @@ -1830,6 +1840,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi0_variant = {
>                 PHY_LANE_2,
>                 PHY_LANE_CK,
>         },
> +       .unsupported_odd_h_timings      = true,
>
>         .init_resources         = vc5_hdmi_init_resources,
>         .csc_setup              = vc5_hdmi_csc_setup,
> @@ -1855,6 +1866,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi1_variant = {
>                 PHY_LANE_CK,
>                 PHY_LANE_2,
>         },
> +       .unsupported_odd_h_timings      = true,
>
>         .init_resources         = vc5_hdmi_init_resources,
>         .csc_setup              = vc5_hdmi_csc_setup,
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> index 63c6f8bddf1d..6815e93b1a48 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -62,6 +62,9 @@ struct vc4_hdmi_variant {
>          */
>         enum vc4_hdmi_phy_channel phy_lane_mapping[4];
>
> +       /* The BCM2711 cannot deal with odd horizontal pixel timings */
> +       bool unsupported_odd_h_timings;
> +
>         /* Callback to get the resources (memory region, interrupts,
>          * clocks, etc) for that variant.
>          */
> --
> 2.26.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7134329D01E
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 14:42:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC0F6E084;
	Wed, 28 Oct 2020 13:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 314F26E084
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 13:42:39 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id a9so1933756wrg.12
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 06:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hK/WSL9FyAVmtlI/O7hyywoJ/cONMzmBczRpsSKA8PY=;
 b=He4OOcFW6toYZqJaviYtsWiNweymgmV8WmXxJHM34iYFWAFLwukEIcFghgPD6y+doi
 zZc4VUrkLrFx76IA2/MY4q/KorfS5O/V/qMQC1n3y8Iy0zuYnlTkVwnuvBKenyOUdb0C
 KmeFxEax2jjIK/hE6c7SVHJj9f1HgbMyhAfQa/VFPugpnRCHeJXrALib4I4pXkTVm8CX
 PK0ajwvSYR8zbuX2JBkU/c/RkygT6vIvMB64uRSMOknyJAwNN5FQAHWDKMkp7h/Y+7oZ
 KcZzXI8qTu4rqu6MP2myMyLZdMmfQF6DMlldEHqAjl1Ch9v70sFS6f1e0+gu3u4ghzA/
 liUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hK/WSL9FyAVmtlI/O7hyywoJ/cONMzmBczRpsSKA8PY=;
 b=QEdJgogkEjcc8p8dEmx/KEIfze2W/b5y7WaXB0u4z1RgSXFUetu3Yk94Pui1UxtzyQ
 fGMKieZDMP06pdEen3gb2c8151CRuwfaLiA9NTAAmQYERjalKSFLp1noxRcGa/zTX4Lm
 aGG9KBnCKmYeCUt/6ufe0B5mnfCEZbPtoQ/QQWwup+FmN9+lk9LOr44UzjEEs/gQ6zsV
 VwHkGDqDKuW6oOs+AMjKhy5Y4/QAiTYYyMWkzQ2C0iEZBx0CeRIxnVHIwad3foiJw1kt
 +IZE6l+2S1/3jXHeN1uH3IO7eBXHKwBMnE0HxMwxJUobgR6Ndt55LY2g/UWZRjOG3jnf
 LkWw==
X-Gm-Message-State: AOAM532O0veCZXLDEnBVy3FagwU+sm2p1kfuxNR6UFHJLNbhFY9Q7NoB
 eY2UBde/iP4UD4lXXO6eWk1v/qxy4x63cYJ8lGXj2A==
X-Google-Smtp-Source: ABdhPJzuytQEIr7RSHD0qRKyoS5wp55V36D2cJJJnMI+vedeshcSOxkZAueduYzzJ+DqyW0bruGN4GHyKPj+an+k/1E=
X-Received: by 2002:a05:6000:1185:: with SMTP id
 g5mr3618403wrx.42.1603892557860; 
 Wed, 28 Oct 2020 06:42:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200925130044.574220-1-maxime@cerno.tech>
In-Reply-To: <20200925130044.574220-1-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 28 Oct 2020 13:42:20 +0000
Message-ID: <CAPY8ntAOsE5Xg-6R64B9NVE9SS85SkiNXJq19Uspx=-4v4Y3ug@mail.gmail.com>
Subject: Re: [PATCH] drm/vc4: hdmi: Block odd horizontal timings
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Fri, 25 Sep 2020 at 14:00, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The FIFO between the pixelvalve and the HDMI controller runs at 2 pixels
> per clock cycle, and cannot deal with odd timings.
>
> Let's reject any mode with such timings.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

It's unsupported due to the architecture rather than broken.

I'd hope the compiler would convert "% 2" to "& 1" in these cases, but
it's not a critical performance path anyway.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 12 ++++++++++++
>  drivers/gpu/drm/vc4/vc4_hdmi.h |  3 +++
>  2 files changed, 15 insertions(+)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 1c4dc774d56e..acfb4e235214 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -879,6 +879,11 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
>         struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
>         unsigned long long pixel_rate = mode->clock * 1000;
>
> +       if (vc4_hdmi->variant->broken_odd_h_timings &&
> +           ((mode->hdisplay % 2) || (mode->hsync_start % 2) ||
> +            (mode->hsync_end % 2) || (mode->htotal % 2)))
> +               return -EINVAL;
> +
>         if (mode->flags & DRM_MODE_FLAG_DBLCLK)
>                 pixel_rate *= 2;
>
> @@ -901,6 +906,11 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
>  {
>         struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
>
> +       if (vc4_hdmi->variant->broken_odd_h_timings &&
> +           ((mode->hdisplay % 2) || (mode->hsync_start % 2) ||
> +            (mode->hsync_end % 2) || (mode->htotal % 2)))
> +               return MODE_H_ILLEGAL;
> +
>         if ((mode->clock * 1000) > vc4_hdmi->variant->max_pixel_clock)
>                 return MODE_CLOCK_HIGH;
>
> @@ -1950,6 +1960,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi0_variant = {
>                 PHY_LANE_2,
>                 PHY_LANE_CK,
>         },
> +       .broken_odd_h_timings   = true,
>
>         .init_resources         = vc5_hdmi_init_resources,
>         .csc_setup              = vc5_hdmi_csc_setup,
> @@ -1975,6 +1986,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi1_variant = {
>                 PHY_LANE_CK,
>                 PHY_LANE_2,
>         },
> +       .broken_odd_h_timings   = true,
>
>         .init_resources         = vc5_hdmi_init_resources,
>         .csc_setup              = vc5_hdmi_csc_setup,
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> index af45b0d81dec..40e51ece8efe 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -62,6 +62,9 @@ struct vc4_hdmi_variant {
>          */
>         enum vc4_hdmi_phy_channel phy_lane_mapping[4];
>
> +       /* The BCM2711 cannot deal with odd horizontal pixel timings */
> +       bool broken_odd_h_timings;
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

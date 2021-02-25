Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D40A3253F6
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 17:50:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 565376ECDF;
	Thu, 25 Feb 2021 16:50:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA81F6ECDF
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 16:50:17 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id a11so1935140wmd.5
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 08:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ujtq4Dq47uF2eTEGpffKSWLYbYoXaFOz7LZhMGMgJmo=;
 b=ryg5umGlDRp6y1sOQMhcEBBz9zkU36sVN1nEaT2XCjPSbBuErpKioDj7ge/NrTkygh
 04qPq9nQ1h+hMy9XTwEwcATvf39Z64gGNeu1k6fkIDFmUhIQVIl56+PPMlWcAINbvyku
 JLkASHT7Sx67EeAXx3NYxnOi7wdxohuGMdhpuJa4wE86LIWIbQxhOhUnYRq5gnkzuHeI
 Dhr1dQTKOpoqGAuqJrutZgOkI/LGuBDAcwHdWq/DmWhwbv+8zZQzR9EVODcS2sn5lrhB
 nKJYptojkdt6a2eEfewwcFIkv40rANfQT4cP8oYXt2rbzLsXIIa8RasVs59ukg5oyn0C
 hZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ujtq4Dq47uF2eTEGpffKSWLYbYoXaFOz7LZhMGMgJmo=;
 b=FBFwKZ7gfb/lKx4K6whC5L2UvxuJsb2Nq0m87BIiVWD+uEyooQ10h+EgeVLHqsMSDC
 rhzV4WOcXqqhvO7As6H4mOScPUQC7vTSu+PxAOPTscp42G6G3jYzLXjH1MDvlnPmXyOW
 ow56DLmlgQTO5eY6dKu8ZJZn3G1H080yi6oh3vgAQgWUKe50yNoJlniUydV97TL/2ii0
 GHZucY3B9PnP/9fzVWF/MO6nrn78N0/jXZufMCFSLMgBaRajhA6QDbL7CH6+A76J3Eko
 PWUDMyL0KoipCOUw+C828LP6/nXR8QRT7uUFnWxT6xQ6lmx01/Iy7kqtVRiXh4uVqqdY
 2hiA==
X-Gm-Message-State: AOAM530f0gHusRAqNfRNILh43+Ibc0KZ/fR4F2knIwp1104YUJGYHpIJ
 hGCfeZETFLaA44zOj0laczLrEObwZsMy38uXwpihLA==
X-Google-Smtp-Source: ABdhPJxZqSZhEEKMJ++j9qXWBx8PHurKD3HHd01rqa+Uwo1VLRjo9ks0dRY4UTLj3KZLtNP2UAdHMe//su/KOGVkytE=
X-Received: by 2002:a1c:28c1:: with SMTP id o184mr3932948wmo.183.1614271816426; 
 Thu, 25 Feb 2021 08:50:16 -0800 (PST)
MIME-Version: 1.0
References: <20210225155909.1853812-1-maxime@cerno.tech>
 <20210225155909.1853812-8-maxime@cerno.tech>
In-Reply-To: <20210225155909.1853812-8-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 25 Feb 2021 16:50:00 +0000
Message-ID: <CAPY8ntBtL=mbz1-4yOcaJg2kiawk_1sosDY1Aa0dL=en7W3e9g@mail.gmail.com>
Subject: Re: [PATCH 7/8] drm/vc4: plane: Fix typo in scaler width and height
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
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Again no commit text body, but possibly not warranted

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_plane.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
> index 4a075294ff4c..5e8b7f72dc05 100644
> --- a/drivers/gpu/drm/vc4/vc4_plane.c
> +++ b/drivers/gpu/drm/vc4/vc4_plane.c
> @@ -912,9 +912,9 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
>                 if (!vc4_state->is_unity) {
>                         vc4_dlist_write(vc4_state,
>                                         VC4_SET_FIELD(vc4_state->crtc_w,
> -                                                     SCALER_POS1_SCL_WIDTH) |
> +                                                     SCALER5_POS1_SCL_WIDTH) |
>                                         VC4_SET_FIELD(vc4_state->crtc_h,
> -                                                     SCALER_POS1_SCL_HEIGHT));
> +                                                     SCALER5_POS1_SCL_HEIGHT));
>                 }
>
>                 /* Position Word 2: Source Image Size */
> --
> 2.29.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

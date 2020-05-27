Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B17D1E4D13
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 20:26:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4359F6E3A0;
	Wed, 27 May 2020 18:26:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4458B6E395
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 18:26:25 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id w10so30206406ljo.0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 11:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QB7YwKLcAEW/NVxETJ/RRwZrpqw1ubcJORL5utvFFXU=;
 b=jVDU6dAIH5AMHvUenFCLEWc4e55tCqNJdfkNlGCKtdQ94FJ2ncc6VGQQ6rttsFcAyl
 dqtMPPBIon1Ieua2HOivG/UGPk9Ax02cmVxtlqyXA4gNg4qCWoTPim7JDk6SxP0y+Snc
 KqNNJXD4/Fwdr13n9LZMd/DSXHh7ebYllwc7RsOiaeEfmid5gUShCMZoJaA/zHhugQ+3
 vXiq57zCHznETZPv6jo2AMUFiicPgZ5MgBnBGNQ2/aZdxQdxbjj4kALa2fBrOfUuIFU2
 2SKqQuH6ewCZ4tiwHO47DhJaRPS5pt/diRpda0vF7ojfHnwoJpJnohxNt+gtNrB5K2Ax
 G+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QB7YwKLcAEW/NVxETJ/RRwZrpqw1ubcJORL5utvFFXU=;
 b=YrpdXrsqucL6KneDW0GzHN7pLM2hWJxWRGx+TMPS7O+o/FO0kiPbuTJ2cTxTELB2Er
 8d2q+rerz+NI2T6Q5khcTsF+OPgr8WRR1CCaBufnRuHdR58T00gBer1AzZJ4wXq8vm+c
 PXJvXhhvfEXvufyXHveOkKrqZ/dp26pvzWKDwNxx97NOcMdZFRLKKqm5nCvxvvfiaQ6x
 yxNTaAU7Dlel9KoScVLUw3nXn0jFf+FYTxvq1tDlhLmCjhxqWhmQZxB2mN5UxWHMq9Lt
 1b5O2uZ2bxNMI0ibClMlKQtHLDVLgf7vVmj9NirSytUSxMruRfgmkLPs9wz4zG1X5CoF
 8RTw==
X-Gm-Message-State: AOAM530aXV6SzTjLdgekA9XU4WP8/iSiTji/hr0KBVINFkw6LXen1rCs
 RsKj+ZzQSDLj+/9/vEXYFebcC6y26TT+9y2N/6awFA==
X-Google-Smtp-Source: ABdhPJxA8oAlyNouzKzEzxB2DjfrFnm6s4bMaRIjUr0L/MTi6rlsrHzCde2XffFmTHZekkBhimOM52uiHfe7MBRTvrc=
X-Received: by 2002:a2e:8186:: with SMTP id e6mr3843593ljg.252.1590603983554; 
 Wed, 27 May 2020 11:26:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
 <afcc607bdcaf9ad38480f49cc1fa186ebe6f2d5a.1590594512.git-series.maxime@cerno.tech>
In-Reply-To: <afcc607bdcaf9ad38480f49cc1fa186ebe6f2d5a.1590594512.git-series.maxime@cerno.tech>
From: Eric Anholt <eric@anholt.net>
Date: Wed, 27 May 2020 11:26:12 -0700
Message-ID: <CADaigPUFP5QXCbE81kFnwJPGO1GjvmoaKK28BhbEUNnJ4Pc0jg@mail.gmail.com>
Subject: Re: [PATCH v3 041/105] drm/vc4: crtc: Move HVS mode config to HVS file
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 27, 2020 at 8:50 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_crtc.c | 272 +-------------------------------
>  drivers/gpu/drm/vc4/vc4_drv.h  |   5 +-
>  drivers/gpu/drm/vc4/vc4_hvs.c  | 298 ++++++++++++++++++++++++++++++++++-
>  3 files changed, 309 insertions(+), 266 deletions(-)


>  static void vc4_crtc_mode_set_nofb(struct drm_crtc *crtc)
>  {
> -       struct drm_device *dev = crtc->dev;
> -       struct vc4_dev *vc4 = to_vc4_dev(dev);
>         struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
>         struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
> -       struct drm_display_mode *mode = &crtc->state->adjusted_mode;
> -       bool interlace = mode->flags & DRM_MODE_FLAG_INTERLACE;
>         bool debug_dump_regs = false;
>
>         if (debug_dump_regs) {
> @@ -418,42 +372,10 @@ static void vc4_crtc_mode_set_nofb(struct drm_crtc *crtc)
>                 drm_print_regset32(&p, &vc4_crtc->regset);
>         }
>
> -       if (vc4_crtc->data->hvs_output == 2) {
> -               u32 dispctrl;
> -               u32 dsp3_mux;
> -
> -               /*
> -                * SCALER_DISPCTRL_DSP3 = X, where X < 2 means 'connect DSP3 to
> -                * FIFO X'.
> -                * SCALER_DISPCTRL_DSP3 = 3 means 'disable DSP 3'.
> -                *
> -                * DSP3 is connected to FIFO2 unless the transposer is
> -                * enabled. In this case, FIFO 2 is directly accessed by the
> -                * TXP IP, and we need to disable the FIFO2 -> pixelvalve1
> -                * route.
> -                */
> -               if (vc4_state->feed_txp)
> -                       dsp3_mux = VC4_SET_FIELD(3, SCALER_DISPCTRL_DSP3_MUX);
> -               else
> -                       dsp3_mux = VC4_SET_FIELD(2, SCALER_DISPCTRL_DSP3_MUX);
> -
> -               dispctrl = HVS_READ(SCALER_DISPCTRL) &
> -                          ~SCALER_DISPCTRL_DSP3_MUX_MASK;
> -               HVS_WRITE(SCALER_DISPCTRL, dispctrl | dsp3_mux);
> -       }

I just noticed, this block being moved looks like it should probably
have been removed as part of patch #33.  Cleaning this up I think will
impact the following patches.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

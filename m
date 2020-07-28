Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEAF230CE2
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 17:01:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 282236E321;
	Tue, 28 Jul 2020 15:01:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A918E6E321
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 15:01:39 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 184so18530997wmb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 08:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZcrgKc86yq8jTIyryDrJPO9n2XZz5GQUQu/T72sz8/s=;
 b=Jo9KrEARmx57XEuZF9UIjrILmxJkqN/glLYpkX7VkYNnqVSVCjrANh+1dL79NRHS+1
 kw225T0kYBhckZq3H9fiBzqhXHLawffOfQXvDJ6HyevfgEIvEBLyD1k6MBUMuMRGgR/d
 nbY30rZu+Fh8ghEYOuFlcFQS+xvKAlop0ZRcQcvuULOZuplN2+KOANZtFSC8llMfrEvH
 v73MIuvqQOVIjJlKccE9+CYFGqAvsAz1HRavlCB/HZuEQyCDHdY5oVRQxNJERFrukYHH
 hbkGzJmDiSGw+Kd10EwExQ0HBNDznk2Z24CHoqFJuSqS2TgSfCJ++2T1DaIXPlkFxOjb
 qL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZcrgKc86yq8jTIyryDrJPO9n2XZz5GQUQu/T72sz8/s=;
 b=JrFUiUbJWfOXxXR28AjvItd4gj1y2SQZhNTDlxGElmp2AC5uQFJ2tu3I5aB8wnv6wD
 /G27Nqy50uVTw0F8JekAS7WW4kQE8SU3kYCvV4xR9QYxQ1rBO1fIu+anAnMx2oltWFqe
 /4kOyBskVxKhajE2TP8PfSlthbfLmMC9N17F7WL0wc3T39/8CB0S/IS69NLsome3ywdd
 rpzXr3y1OM2AmmQ617H4bTymk3mTGY4HlZUwaUf423MDkqkFG1dgHJKcT4DT5FBegqZa
 SE2GzTmGuTSCxx0vBTUVmH86TMoehUk/YwKqR2YCe6SAQHDU9+KIhXD7e0bS2htN460F
 lxDw==
X-Gm-Message-State: AOAM533/WM9Ljdp7awI5quzJ1Y8pvZZhLtY5j05kBwzj/s4FTfop6mDI
 qhFDSBKDdt663Q9f25XUqSlJeRjEAbZ41/zLJoJeSg==
X-Google-Smtp-Source: ABdhPJxsowHKjs4VRkG6lEsi2OtxAldJwXZhMHpPadE/C085R7BWsFMiIcXNwj9j5QNXuzmhc2E3AmMjKoxXxa/+oaE=
X-Received: by 2002:a1c:e382:: with SMTP id a124mr4093328wmh.96.1595948498383; 
 Tue, 28 Jul 2020 08:01:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <805c78c427113b151dbd289dc52116f17734a1da.1594230107.git-series.maxime@cerno.tech>
In-Reply-To: <805c78c427113b151dbd289dc52116f17734a1da.1594230107.git-series.maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 28 Jul 2020 16:01:22 +0100
Message-ID: <CAPY8ntBD_qkvP5DyOx8O-9kFzqKxE-q9swrhBcmRm2L4dDA7gw@mail.gmail.com>
Subject: Re: [PATCH v4 69/78] drm/vc4: hdmi: Remove register dumps in enable
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

On Wed, 8 Jul 2020 at 18:44, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The current code has some logic, disabled by default, to dump the register
> setup in the HDMI controller.
>
> However, since we're going to split those functions in multiple, shorter,
> functions that only make sense where they are called in sequence, keeping
> the register dump makes little sense.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 17 -----------------
>  1 file changed, 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 0a9a323e03d8..4058985940e6 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -430,7 +430,6 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
>         struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
>         struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
>         struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
> -       bool debug_dump_regs = false;
>         unsigned long pixel_rate, hsm_rate;
>         int ret;
>
> @@ -489,14 +488,6 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
>         if (vc4_hdmi->variant->phy_init)
>                 vc4_hdmi->variant->phy_init(vc4_hdmi, mode);
>
> -       if (debug_dump_regs) {
> -               struct drm_printer p = drm_info_printer(&vc4_hdmi->pdev->dev);
> -
> -               dev_info(&vc4_hdmi->pdev->dev, "HDMI regs before:\n");
> -               drm_print_regset32(&p, &vc4_hdmi->hdmi_regset);
> -               drm_print_regset32(&p, &vc4_hdmi->hd_regset);
> -       }
> -
>         HDMI_WRITE(HDMI_VID_CTL, 0);
>
>         HDMI_WRITE(HDMI_SCHEDULER_CONTROL,
> @@ -522,14 +513,6 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
>
>         HDMI_WRITE(HDMI_FIFO_CTL, VC4_HDMI_FIFO_CTL_MASTER_SLAVE_N);
>
> -       if (debug_dump_regs) {
> -               struct drm_printer p = drm_info_printer(&vc4_hdmi->pdev->dev);
> -
> -               dev_info(&vc4_hdmi->pdev->dev, "HDMI regs after:\n");
> -               drm_print_regset32(&p, &vc4_hdmi->hdmi_regset);
> -               drm_print_regset32(&p, &vc4_hdmi->hd_regset);
> -       }
> -
>         HDMI_WRITE(HDMI_VID_CTL,
>                    HDMI_READ(HDMI_VID_CTL) |
>                    VC4_HD_VID_CTL_ENABLE |
> --
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

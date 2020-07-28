Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC731230CE8
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 17:03:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 971E589C68;
	Tue, 28 Jul 2020 15:03:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A8F089BF8
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 15:03:25 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id a5so8653923wrm.6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 08:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DtL8cvtGkTaSwrDEo6k42OsH604F6vO5Vz2A8YHvbY0=;
 b=hP8vsKKec9YLR2W8CGgLTYGKA8sdZ4RxnBJQkHDsbPl2+gFpJ7h5Xi2unxRqQ8shA3
 owPmJ/S3v/1TLjQ3qN/DTf27uH3u1CAWl0907z2yfwETuyMlYYNcv2eDKOySGn66zwyQ
 mX+E2fYeqgs89ToGesm8NC4ntvo9YrhrI5cXmSR3fBL2zq/ez2tay/ByKBEc7Ri74dZc
 5KDyExhpUPDPdVxhaukoFQ+r0GaDRTi98myBRjPgdsEYeuWZMYKKiYp+Uwpc1EuM5HCD
 XCMQaOWzub3ePwPr9UA4oBzmZCYovmxd/dIXwRzV+pIptUk/dqv2ubJ8drc4OiA1kN7P
 Wj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DtL8cvtGkTaSwrDEo6k42OsH604F6vO5Vz2A8YHvbY0=;
 b=g+nSRpID9srEIHWzVzYOqaXnVci7T73j7g4PAQgty1gBqpaPM/iKyUBiUNTer7KeJF
 ZfBBlLasQZAUUKxK4SMc34/PbGdbes4tEnAgLM5eNvUvk+K2kW8sp50BrbdamfY41+0v
 xw6nho0c2NwEUjbsKFwCtJU8Iims70pdy6Ept/tIYCMg3SgBCLexIK6zZ64a/rDDe22P
 korFTY2ImEbiXR7noaZZWI02FAarxkqIS3ZrgiAamkMRbEoh3fsCsro9A9/1eUFCivQ3
 x57SWBpwgpv2kNgt9Eo8KPmFlhOAuR/av5q6xXBZ7mHQM9RDit4zUxwgyhei/cYVhuPF
 H16A==
X-Gm-Message-State: AOAM532UuM4Dgqp4m3y77Do9sYIlb+DNxBp2Cdh6OT4wHMStJPl0i5JX
 DhMIZof42RgKulGzOuvb5oMZXy256GevarSBPECg8A==
X-Google-Smtp-Source: ABdhPJwb5RGbkaoI7/zf6RLk+H9Fb3Ean0zD1XK8jF76zOj3GM3Mzq0w6Hd+U4moU85Uefhrh/0o0bNmat6Ci3VhPrk=
X-Received: by 2002:adf:fe50:: with SMTP id m16mr7990761wrs.27.1595948604162; 
 Tue, 28 Jul 2020 08:03:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <12499869afccd632b222eec328a6352111472986.1594230107.git-series.maxime@cerno.tech>
In-Reply-To: <12499869afccd632b222eec328a6352111472986.1594230107.git-series.maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 28 Jul 2020 16:03:04 +0100
Message-ID: <CAPY8ntCypUxUzGw0LBDsG8oPZBf5RbF-ia=McBF0gYp9mAtwxQ@mail.gmail.com>
Subject: Re: [PATCH v4 70/78] drm/vc4: hdmi: Always recenter the HDMI FIFO
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
> In order to avoid a pixel getting stuck in an unflushable FIFO, we need to
> recenter the FIFO every time we're doing a modeset and not only if we're
> connected to an HDMI monitor.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 46 +++++++++++++++++++----------------
>  1 file changed, 26 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 4058985940e6..00592c1ada73 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -425,6 +425,30 @@ static void vc4_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
>                    (hsync_pos ? 0 : VC4_HD_VID_CTL_HSYNC_LOW));
>  }
>
> +static void vc4_hdmi_recenter_fifo(struct vc4_hdmi *vc4_hdmi)
> +{
> +       u32 drift;
> +       int ret;
> +
> +       drift = HDMI_READ(HDMI_FIFO_CTL);
> +       drift &= VC4_HDMI_FIFO_VALID_WRITE_MASK;
> +
> +       HDMI_WRITE(HDMI_FIFO_CTL,
> +                  drift & ~VC4_HDMI_FIFO_CTL_RECENTER);
> +       HDMI_WRITE(HDMI_FIFO_CTL,
> +                  drift | VC4_HDMI_FIFO_CTL_RECENTER);
> +       usleep_range(1000, 1100);
> +       HDMI_WRITE(HDMI_FIFO_CTL,
> +                  drift & ~VC4_HDMI_FIFO_CTL_RECENTER);
> +       HDMI_WRITE(HDMI_FIFO_CTL,
> +                  drift | VC4_HDMI_FIFO_CTL_RECENTER);
> +
> +       ret = wait_for(HDMI_READ(HDMI_FIFO_CTL) &
> +                      VC4_HDMI_FIFO_CTL_RECENTER_DONE, 1);
> +       WARN_ONCE(ret, "Timeout waiting for "
> +                 "VC4_HDMI_FIFO_CTL_RECENTER_DONE");
> +}
> +
>  static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
>  {
>         struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
> @@ -543,8 +567,6 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
>         }
>
>         if (vc4_encoder->hdmi_monitor) {
> -               u32 drift;
> -
>                 WARN_ON(!(HDMI_READ(HDMI_SCHEDULER_CONTROL) &
>                           VC4_HDMI_SCHEDULER_CONTROL_HDMI_ACTIVE));
>                 HDMI_WRITE(HDMI_SCHEDULER_CONTROL,
> @@ -555,25 +577,9 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
>                            VC4_HDMI_RAM_PACKET_ENABLE);
>
>                 vc4_hdmi_set_infoframes(encoder);
> -
> -               drift = HDMI_READ(HDMI_FIFO_CTL);
> -               drift &= VC4_HDMI_FIFO_VALID_WRITE_MASK;
> -
> -               HDMI_WRITE(HDMI_FIFO_CTL,
> -                          drift & ~VC4_HDMI_FIFO_CTL_RECENTER);
> -               HDMI_WRITE(HDMI_FIFO_CTL,
> -                          drift | VC4_HDMI_FIFO_CTL_RECENTER);
> -               usleep_range(1000, 1100);
> -               HDMI_WRITE(HDMI_FIFO_CTL,
> -                          drift & ~VC4_HDMI_FIFO_CTL_RECENTER);
> -               HDMI_WRITE(HDMI_FIFO_CTL,
> -                          drift | VC4_HDMI_FIFO_CTL_RECENTER);
> -
> -               ret = wait_for(HDMI_READ(HDMI_FIFO_CTL) &
> -                              VC4_HDMI_FIFO_CTL_RECENTER_DONE, 1);
> -               WARN_ONCE(ret, "Timeout waiting for "
> -                         "VC4_HDMI_FIFO_CTL_RECENTER_DONE");
>         }
> +
> +       vc4_hdmi_recenter_fifo(vc4_hdmi);
>  }
>
>  static enum drm_mode_status
> --
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

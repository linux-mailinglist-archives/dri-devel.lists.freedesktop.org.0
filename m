Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3409230D19
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 17:10:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 971106E326;
	Tue, 28 Jul 2020 15:10:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B42BE6E326
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 15:10:13 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id g8so6495358wmk.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 08:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yoaV8EiIxu54dsFIyU0qdvYTV9Nos1kcoN3M/Zvq+Z8=;
 b=oPm1eOTKzWnAqS5MU6mSlSrX5N1BhOrhoJz8NsUIH4WoueF1QeJdRlXIuDeIbPw/1R
 V15xq8XH1hmSvtP0/JmCEw5PGrzsLToKzbXYE3dqAOl5/0jb4MRPaAmQ2ORdHUcFbdHe
 DZX1uNWDKlhEcmvzcQSlxOCnTj8r9QfxvxERm16MIn9heQtAUFMpazXta1UyzxhN3rw4
 GalYPH8T1XcfqzmBhftP+J0AndZznl0EcTSLLYD4CA7Y3d81IR4gydyEthoR35CLjy7b
 BGMasywv/e+ePgnSYZRv57hCaFXKWZv94DjQpOPAP68dc2zYGp2aQQBXrhA/Qv3X11qR
 55Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yoaV8EiIxu54dsFIyU0qdvYTV9Nos1kcoN3M/Zvq+Z8=;
 b=Vkn4URWQ7YxAgzfGZlB7ntByhHTUpXUd5j0zdLjvYdH2xWr/xonYmQql5FwrsbOXPH
 /bQP4OMAfMHTcMy3lJRbg3gpGMdJp9of0KVTg3jmRV/n8FtdHkD6tCad0m9TLo6W1Mvs
 rQYEoofrxjUbNUJHXSfF8rLwwq3lqnj85ctRw3oMNkuVZfUdg2xt6X94stb5ZXu+LR6e
 qIq6NkYAtDKZiSY+NNH9SHtyQJvwEC+jhOxSdSsuFHobSfXEcPaJIzcfsUeKgU5DInsW
 lGaJS+GEcrAwko7XtrGF6DflnV/dSuZ7YSS93T47GIgSZUFlRhW6i8gf01zvB3Bd4BwB
 OBDw==
X-Gm-Message-State: AOAM533pMzemXPKgEJ7XFZ5tIM4CB4tS8Gt4ELr5Tke7OH/v0wJSQ32r
 3Ii7OGad5K8ZG2IDaMqy+gzUcrftKNt05AMCHxWZpA==
X-Google-Smtp-Source: ABdhPJyNYOA6mCmdd4k+gqY/yaotErgNgTwjweShu/vSvjyf4/SAxApHi7n17d+UDmL6h8xlukBGzg/W25y9L1n/yS8=
X-Received: by 2002:a7b:cf18:: with SMTP id l24mr4420427wmg.116.1595949012379; 
 Tue, 28 Jul 2020 08:10:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <c76f3fe7ded07234e711007330ea40d32c461119.1594230107.git-series.maxime@cerno.tech>
In-Reply-To: <c76f3fe7ded07234e711007330ea40d32c461119.1594230107.git-series.maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 28 Jul 2020 16:09:54 +0100
Message-ID: <CAPY8ntD+Wz3C8gnTuoZB0SPFhmGD_FqNgEDcxHOWeV5n94UtqQ@mail.gmail.com>
Subject: Re: [PATCH v4 73/78] drm/vc4: hdmi: Switch to blank pixels when
 disabled
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
> In order to avoid pixels getting stuck in an unflushable FIFO, we need when
> we disable the HDMI controller to switch away from getting our pixels from
> the pixelvalve and instead use blank pixels, and switch back to the
> pixelvalve when we enable the HDMI controller.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c |  9 +++++++++
>  drivers/gpu/drm/vc4/vc4_regs.h |  3 +++
>  2 files changed, 12 insertions(+)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index f56a718a3643..37463b016b47 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -325,6 +325,12 @@ static void vc4_hdmi_encoder_post_crtc_disable(struct drm_encoder *encoder)
>         struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
>
>         HDMI_WRITE(HDMI_RAM_PACKET_CONFIG, 0);
> +
> +       HDMI_WRITE(HDMI_VID_CTL, HDMI_READ(HDMI_VID_CTL) |
> +                  VC4_HD_VID_CTL_CLRRGB | VC4_HD_VID_CTL_CLRSYNC);
> +
> +       HDMI_WRITE(HDMI_VID_CTL,
> +                  HDMI_READ(HDMI_VID_CTL) | VC4_HD_VID_CTL_BLANKPIX);
>  }
>
>  static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *encoder)
> @@ -563,6 +569,9 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder)
>                    (vsync_pos ? 0 : VC4_HD_VID_CTL_VSYNC_LOW) |
>                    (hsync_pos ? 0 : VC4_HD_VID_CTL_HSYNC_LOW));
>
> +       HDMI_WRITE(HDMI_VID_CTL,
> +                  HDMI_READ(HDMI_VID_CTL) & ~VC4_HD_VID_CTL_BLANKPIX);
> +
>         if (vc4_encoder->hdmi_monitor) {
>                 HDMI_WRITE(HDMI_SCHEDULER_CONTROL,
>                            HDMI_READ(HDMI_SCHEDULER_CONTROL) |
> diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
> index d1e8961edaa0..30af52b406f1 100644
> --- a/drivers/gpu/drm/vc4/vc4_regs.h
> +++ b/drivers/gpu/drm/vc4/vc4_regs.h
> @@ -723,6 +723,9 @@
>  # define VC4_HD_VID_CTL_FRAME_COUNTER_RESET    BIT(29)
>  # define VC4_HD_VID_CTL_VSYNC_LOW              BIT(28)
>  # define VC4_HD_VID_CTL_HSYNC_LOW              BIT(27)
> +# define VC4_HD_VID_CTL_CLRSYNC                        BIT(24)
> +# define VC4_HD_VID_CTL_CLRRGB                 BIT(23)
> +# define VC4_HD_VID_CTL_BLANKPIX               BIT(18)
>
>  # define VC4_HD_CSC_CTL_ORDER_MASK             VC4_MASK(7, 5)
>  # define VC4_HD_CSC_CTL_ORDER_SHIFT            5
> --
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

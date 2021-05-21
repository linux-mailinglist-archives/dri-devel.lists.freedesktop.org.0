Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8555E38CC15
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 19:26:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFF726E514;
	Fri, 21 May 2021 17:26:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 762646E514
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 17:26:52 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id z17so21791270wrq.7
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 10:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0HWXVP0e3Hcyxgm8TtR0BXxQYkcU6pjwHxvcyzC9gIM=;
 b=VS5DSLSPprKtNFD0DVsGL14+/349xDGMLh+mX2jYz2j67JB8oy37/IphMpC9gaq3Av
 thAtnj9g919W1QBh26aPfrvVfPg8zh6SkHyUYHpFXVURyB8kevNkNsTleB2N3mkctI2I
 iJM7f7/8iDBWE13iMiU7EIO7FvlI80+ob/z+dptosRK8jq/Y3pjZmZ9Szr0n1sPEr1JP
 u0vBLFJmo7/SQ/peGi+R77cDGZCYF2gNApRnq8Wp/cBr5L0U3UeGjPwmY6UQXxm4VyBe
 q1HLaZsa6cD9KKt80im6oPfYVPo7Uz1bXcZhMKfiOeeUXwvktcEcQ/Y73cZ/TsX6lKr1
 YLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0HWXVP0e3Hcyxgm8TtR0BXxQYkcU6pjwHxvcyzC9gIM=;
 b=H8SxUTjOOerhqmX8qwWdcQxtwUIXP11h7tkoaloM5A8N2gj4VkQgM13TotDTtsHLfa
 qlgdC44Oq8EuhpGqATihNhqYLyqve/YhvfD88KoQp2X26BL2wh3gPWlI4e6ozUx0Yjaa
 pQrU8ous8ZtBIREHFJcPpGyQJKSd99q0YQXVbCWWCt2P7qj8QUItbrkyZ/CmNoTe3TiE
 aGV41vrhhz+uPj7f4z40XLqp2OABiRn67hRx0Xe/0saW53ISst/KC9lDO1Aqu0tluYr+
 wk65v8iMRdg4FupYqS7cnlqd0oVtVEphX0CV0FEJJ1wjTACk9R7wzaIL6q1M1M2wW1gR
 6SVg==
X-Gm-Message-State: AOAM533aLMFEVlpffJXbeKiO8hfwYE5zR6OHhiz4NR6MmRYt7hdMiZOw
 c52HiXXO3StnUWPwcxewtfduuFkC+/G6ZiiQrVcn4w==
X-Google-Smtp-Source: ABdhPJy08vzADSRZP901UvB9CawI7ieMduPTcjcFSBxbQPA1ZbKP/sY1janxRj9OfUR+ZdJ6zLxeTboD1W8fG+E3R/8=
X-Received: by 2002:a5d:6248:: with SMTP id m8mr10798651wrv.42.1621618011198; 
 Fri, 21 May 2021 10:26:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210507150515.257424-1-maxime@cerno.tech>
 <20210507150515.257424-4-maxime@cerno.tech>
In-Reply-To: <20210507150515.257424-4-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 21 May 2021 18:26:35 +0100
Message-ID: <CAPY8ntDh_HKny+VoeGKn_facrTDNg_=JTzN1AZBaXCDT0Fp6Eg@mail.gmail.com>
Subject: Re: [PATCH v4 03/12] drm/vc4: crtc: Pass the drm_atomic_state to
 config_pv
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

Thanks for the patch

On Fri, 7 May 2021 at 16:05, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The vc4_crtc_config_pv will need to access the drm_atomic_state
> structure and its only parent function, vc4_crtc_atomic_enable already
> has access to it. Let's pass it as a parameter.
>
> Fixes: 792c3132bc1b ("drm/vc4: encoder: Add finer-grained encoder callbacks")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_crtc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
> index f1f2e8cbce79..8a19d6c76605 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -288,7 +288,7 @@ static void vc4_crtc_pixelvalve_reset(struct drm_crtc *crtc)
>         CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) | PV_CONTROL_FIFO_CLR);
>  }
>
> -static void vc4_crtc_config_pv(struct drm_crtc *crtc)
> +static void vc4_crtc_config_pv(struct drm_crtc *crtc, struct drm_atomic_state *state)
>  {
>         struct drm_device *dev = crtc->dev;
>         struct vc4_dev *vc4 = to_vc4_dev(dev);
> @@ -296,8 +296,8 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc)
>         struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
>         struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
>         const struct vc4_pv_data *pv_data = vc4_crtc_to_vc4_pv_data(vc4_crtc);
> -       struct drm_crtc_state *state = crtc->state;
> -       struct drm_display_mode *mode = &state->adjusted_mode;
> +       struct drm_crtc_state *crtc_state = crtc->state;
> +       struct drm_display_mode *mode = &crtc_state->adjusted_mode;
>         bool interlace = mode->flags & DRM_MODE_FLAG_INTERLACE;
>         u32 pixel_rep = (mode->flags & DRM_MODE_FLAG_DBLCLK) ? 2 : 1;
>         bool is_dsi = (vc4_encoder->type == VC4_ENCODER_TYPE_DSI0 ||
> @@ -522,7 +522,7 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
>         if (vc4_encoder->pre_crtc_configure)
>                 vc4_encoder->pre_crtc_configure(encoder, state);
>
> -       vc4_crtc_config_pv(crtc);
> +       vc4_crtc_config_pv(crtc, state);
>
>         CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) | PV_CONTROL_EN);
>
> --
> 2.31.1
>

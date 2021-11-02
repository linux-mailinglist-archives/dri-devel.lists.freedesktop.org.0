Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4014432A9
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 17:25:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C8573196;
	Tue,  2 Nov 2021 16:25:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16EAA73196
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 16:25:18 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id u1so2595091wru.13
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Nov 2021 09:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3UVbCn+dweftJ4UThMfodLelIWvo3obPmmaxdZTGfog=;
 b=Fc43d8+8UQDqpXQpsb+NlcnNHH7EZ8igqz4gIwWrH/WoOalk1npGU9P9LJqNHHS1W4
 qkSoAtH67pe4gmFzMGMEtM2QGbxgR2DE2b16xKQtc/XiZB2PI9GRIDbWg4cWWOOuZTco
 hu4WMUEUo7Q6DL6kQ9VEKUpcJkOnA8ipSGIAKFNJRI9aFhE/cOa1jy+E3kh2ny9tfAhI
 NL95lYzHB/IDrULrtDv9BhphGKLR5mVH2MM1MyD5snuzmh5LyvAXj4cT0Rq4r6M0cepm
 8eOn9aKUQz/kPWN8J6hRGByYux06kgL1HWy2WEpaPheqk3CI2cfY4SmuKBWwfQv7io0K
 JbQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3UVbCn+dweftJ4UThMfodLelIWvo3obPmmaxdZTGfog=;
 b=5l4MZ5Y2uYU8agwwOarQxYzQNje4+oLU3RgL6um398HdS2geZjtT3M/WiZtvy61abr
 ceTme20XGRgd9j+wg0kLj8fmpWl/XnJbMyQUfpHWp632jpjuEYJB8Bv+DFS+l+Qk4j/r
 0w+s34QpwcO+kZNlZwhngwloYDvI5QCwx9Sc5rulXVn8xkKKQrjj4/j7RIZhSAouHuaS
 78x+uYE6/1t01h/vQ+GlbnTanodRhKAGp2OawXqVTc4j1Ynfx6nLW4vwaTVr5RxoUBc+
 qLP0irpq0MWlCFjkcUumEShIksZVsAQ99Mui4gwzLCr0bSoEObXZ+8MONu1X5rIqBtnc
 HV5A==
X-Gm-Message-State: AOAM5323YTXcMdExgQTR7o6PyGEJBr3LV3quTBJko4ZmHUJB1uSuJn6q
 PglekNG4b+7/x9U+k7LFT7KDfQXo5fWsbQJubGwqMQ==
X-Google-Smtp-Source: ABdhPJwxkkRG0ys6ur+FK/m7LPeGgM2Dl9LR5lM6EbYjmNKYjg8TbseGiHPCBRGubUjKaQlGMekP5J1laoKvxFHiu2k=
X-Received: by 2002:adf:a143:: with SMTP id r3mr48449737wrr.8.1635870316662;
 Tue, 02 Nov 2021 09:25:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211025152903.1088803-1-maxime@cerno.tech>
 <20211025152903.1088803-5-maxime@cerno.tech>
In-Reply-To: <20211025152903.1088803-5-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 2 Nov 2021 16:25:00 +0000
Message-ID: <CAPY8ntB=SCKArD5O_Zic_dPxCO0RZxr==EnfdWcghiuNtBHZ3A@mail.gmail.com>
Subject: Re: [PATCH v8 04/10] drm/vc4: crtc: Add encoder to vc4_crtc_config_pv
 prototype
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
 Tim Gover <tim.gover@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 25 Oct 2021 at 16:29, Maxime Ripard <maxime@cerno.tech> wrote:
>
> vc4_crtc_config_pv() retrieves the encoder again, even though its only
> caller, vc4_crtc_atomic_enable(), already did.
>
> Pass the encoder pointer as an argument instead of going through all the
> connectors to retrieve it again.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_crtc.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
> index 7cfd4a097847..e5c2e29a6f01 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -315,12 +315,11 @@ static void vc4_crtc_pixelvalve_reset(struct drm_crtc *crtc)
>         CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) | PV_CONTROL_FIFO_CLR);
>  }
>
> -static void vc4_crtc_config_pv(struct drm_crtc *crtc, struct drm_atomic_state *state)
> +static void vc4_crtc_config_pv(struct drm_crtc *crtc, struct drm_encoder *encoder,
> +                              struct drm_atomic_state *state)
>  {
>         struct drm_device *dev = crtc->dev;
>         struct vc4_dev *vc4 = to_vc4_dev(dev);
> -       struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc, state,
> -                                                          drm_atomic_get_new_connector_state);
>         struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
>         struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
>         const struct vc4_pv_data *pv_data = vc4_crtc_to_vc4_pv_data(vc4_crtc);
> @@ -597,7 +596,7 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
>         if (vc4_encoder->pre_crtc_configure)
>                 vc4_encoder->pre_crtc_configure(encoder, state);
>
> -       vc4_crtc_config_pv(crtc, state);
> +       vc4_crtc_config_pv(crtc, encoder, state);
>
>         CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) | PV_CONTROL_EN);
>
> --
> 2.31.1
>

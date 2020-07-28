Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 073E22307B9
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 12:32:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD5336E248;
	Tue, 28 Jul 2020 10:32:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE196E248
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 10:32:06 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 184so17662119wmb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 03:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=klH9XyrVq3uSlEXE3zAfesJXPnrCV0J6mB3bxXXeLHI=;
 b=Jtgwn639L7rCcHeF8Su+nhnl0wfh/jljZ8QPs8S+BQVQGFRp/n90hrkBTzk5eteqae
 /5M61JjXkFkxNAWZS9PKf55QSCBl2rlavEN7xHeSOywsXapHDLfbNofwV2LXh+rNQHLl
 WE4mtf9rrjnf/sJYX3KOujasNbmo1wIK90X8LnGiHr8J9Whd0N8ZFWi+WNC90s88OIED
 11L33ZyZrNWsys+OeK6GF5TRHAd3ZVrgX6kGbzTrV4TpjMqOOCUpuIkywspjHeBxYjro
 lXpXwom60ETpdTSGfc80jbou+ftATvrdrHdatj4egO4RV4bGAwL/6Zds604o41XmneDv
 K1oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=klH9XyrVq3uSlEXE3zAfesJXPnrCV0J6mB3bxXXeLHI=;
 b=jvtxS4oyv+UCOdxf/51DvaUiJE2kPDHKnEE6srUiUrxvGfHku7p3mG+f3NLFzQHWkz
 GY+yCUAC8WLdbY2pKhoHk0KKJFsCKeXfQyrOhRY3R6JEp1BJzk6r0V23hhBgjzppNmFx
 5OIxa8UNW9+7F9kqS6Zz9Nanaz/6epIDZi+8mGEz87+3YmNQ7G2eoV9rTFhKZkjB2RiI
 OHa1VjPJacY9ERUUu/Az2mXgieiG1RJhV0/PPv1c8fs5D3rQmrQeT1dtgBUuH781MF7x
 7SQH18bn+am5FNfvDxZwEbqvvOETYXJB1xUWO9MjAFPL8nabaCfqo+gRK31YZSZA+6pO
 hcSQ==
X-Gm-Message-State: AOAM532q6VOVXl+0g3jGVlmBQaK5AMq9YQD0RpokG1E6Py+A4kUopqYq
 YXbeGNHLVn5R3q83GxnwHG1ngBta2FN9yVgC2SFF7w==
X-Google-Smtp-Source: ABdhPJz8Mn129klT2Z8C5717SOIojFV7FscbpxEGGVx1FGUmDzUkvja4xu2G7NB9uooMLEC7pKyMk/eDXyTyxpqWxew=
X-Received: by 2002:a1c:e382:: with SMTP id a124mr3176329wmh.96.1595932324875; 
 Tue, 28 Jul 2020 03:32:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <840cb5324364e431b15d4105c85cebf8d12257f0.1594230107.git-series.maxime@cerno.tech>
In-Reply-To: <840cb5324364e431b15d4105c85cebf8d12257f0.1594230107.git-series.maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 28 Jul 2020 11:31:49 +0100
Message-ID: <CAPY8ntCSEH58GDzT4=N_eExpJCfsdaEpNFZ0aq=xessBhFfiZg@mail.gmail.com>
Subject: Re: [PATCH v4 22/78] drm/vc4: crtc: Move HVS init and close to a
 function
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
> In order to make further refactoring easier, let's move the HVS channel
> setup / teardown to their own function.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hvs.c | 104 +++++++++++++++++++----------------
>  1 file changed, 58 insertions(+), 46 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
> index 50f9a9674a7e..78bb1c0b0b76 100644
> --- a/drivers/gpu/drm/vc4/vc4_hvs.c
> +++ b/drivers/gpu/drm/vc4/vc4_hvs.c
> @@ -196,6 +196,62 @@ static void vc4_hvs_update_gamma_lut(struct drm_crtc *crtc)
>         vc4_hvs_lut_load(crtc);
>  }
>
> +static int vc4_hvs_init_channel(struct vc4_dev *vc4, struct drm_crtc *crtc,
> +                               struct drm_display_mode *mode, bool oneshot)
> +{
> +       struct vc4_crtc_state *vc4_crtc_state = to_vc4_crtc_state(crtc->state);
> +       unsigned int chan = vc4_crtc_state->assigned_channel;
> +       u32 dispctrl;
> +
> +       /* Turn on the scaler, which will wait for vstart to start
> +        * compositing.
> +        * When feeding the transposer, we should operate in oneshot
> +        * mode.
> +        */
> +       dispctrl = SCALER_DISPCTRLX_ENABLE;
> +
> +       if (!vc4->hvs->hvs5)
> +               dispctrl |= VC4_SET_FIELD(mode->hdisplay,
> +                                         SCALER_DISPCTRLX_WIDTH) |
> +                           VC4_SET_FIELD(mode->vdisplay,
> +                                         SCALER_DISPCTRLX_HEIGHT) |
> +                           (oneshot ? SCALER_DISPCTRLX_ONESHOT : 0);
> +       else
> +               dispctrl |= VC4_SET_FIELD(mode->hdisplay,
> +                                         SCALER5_DISPCTRLX_WIDTH) |
> +                           VC4_SET_FIELD(mode->vdisplay,
> +                                         SCALER5_DISPCTRLX_HEIGHT) |
> +                           (oneshot ? SCALER5_DISPCTRLX_ONESHOT : 0);
> +
> +       HVS_WRITE(SCALER_DISPCTRLX(chan), dispctrl);
> +
> +       return 0;
> +}
> +
> +static void vc4_hvs_stop_channel(struct drm_device *dev, unsigned int chan)
> +{
> +       struct vc4_dev *vc4 = to_vc4_dev(dev);
> +
> +       if (HVS_READ(SCALER_DISPCTRLX(chan)) & SCALER_DISPCTRLX_ENABLE)
> +               return;
> +
> +       HVS_WRITE(SCALER_DISPCTRLX(chan),
> +                 HVS_READ(SCALER_DISPCTRLX(chan)) | SCALER_DISPCTRLX_RESET);
> +       HVS_WRITE(SCALER_DISPCTRLX(chan),
> +                 HVS_READ(SCALER_DISPCTRLX(chan)) & ~SCALER_DISPCTRLX_ENABLE);
> +
> +       /* Once we leave, the scaler should be disabled and its fifo empty. */
> +       WARN_ON_ONCE(HVS_READ(SCALER_DISPCTRLX(chan)) & SCALER_DISPCTRLX_RESET);
> +
> +       WARN_ON_ONCE(VC4_GET_FIELD(HVS_READ(SCALER_DISPSTATX(chan)),
> +                                  SCALER_DISPSTATX_MODE) !=
> +                    SCALER_DISPSTATX_MODE_DISABLED);
> +
> +       WARN_ON_ONCE((HVS_READ(SCALER_DISPSTATX(chan)) &
> +                     (SCALER_DISPSTATX_FULL | SCALER_DISPSTATX_EMPTY)) !=
> +                    SCALER_DISPSTATX_EMPTY);
> +}
> +
>  int vc4_hvs_atomic_check(struct drm_crtc *crtc,
>                          struct drm_crtc_state *state)
>  {
> @@ -268,63 +324,19 @@ void vc4_hvs_atomic_enable(struct drm_crtc *crtc,
>         struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
>         struct drm_display_mode *mode = &crtc->state->adjusted_mode;
>         bool oneshot = vc4_state->feed_txp;
> -       u32 dispctrl;
>
>         vc4_hvs_update_dlist(crtc);
> -
> -       /* Turn on the scaler, which will wait for vstart to start
> -        * compositing.
> -        * When feeding the transposer, we should operate in oneshot
> -        * mode.
> -        */
> -       dispctrl = SCALER_DISPCTRLX_ENABLE;
> -
> -       if (!vc4->hvs->hvs5)
> -               dispctrl |= VC4_SET_FIELD(mode->hdisplay,
> -                                         SCALER_DISPCTRLX_WIDTH) |
> -                           VC4_SET_FIELD(mode->vdisplay,
> -                                         SCALER_DISPCTRLX_HEIGHT) |
> -                           (oneshot ? SCALER_DISPCTRLX_ONESHOT : 0);
> -       else
> -               dispctrl |= VC4_SET_FIELD(mode->hdisplay,
> -                                         SCALER5_DISPCTRLX_WIDTH) |
> -                           VC4_SET_FIELD(mode->vdisplay,
> -                                         SCALER5_DISPCTRLX_HEIGHT) |
> -                           (oneshot ? SCALER5_DISPCTRLX_ONESHOT : 0);
> -
> -       HVS_WRITE(SCALER_DISPCTRLX(vc4_state->assigned_channel), dispctrl);
> +       vc4_hvs_init_channel(vc4, crtc, mode, oneshot);
>  }
>
>  void vc4_hvs_atomic_disable(struct drm_crtc *crtc,
>                             struct drm_crtc_state *old_state)
>  {
>         struct drm_device *dev = crtc->dev;
> -       struct vc4_dev *vc4 = to_vc4_dev(dev);
>         struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(old_state);
>         unsigned int chan = vc4_state->assigned_channel;
>
> -       if (HVS_READ(SCALER_DISPCTRLX(chan)) &
> -           SCALER_DISPCTRLX_ENABLE) {
> -               HVS_WRITE(SCALER_DISPCTRLX(chan),
> -                         SCALER_DISPCTRLX_RESET);
> -
> -               /* While the docs say that reset is self-clearing, it
> -                * seems it doesn't actually.
> -                */
> -               HVS_WRITE(SCALER_DISPCTRLX(chan), 0);
> -       }
> -
> -       /* Once we leave, the scaler should be disabled and its fifo empty. */
> -
> -       WARN_ON_ONCE(HVS_READ(SCALER_DISPCTRLX(chan)) & SCALER_DISPCTRLX_RESET);
> -
> -       WARN_ON_ONCE(VC4_GET_FIELD(HVS_READ(SCALER_DISPSTATX(chan)),
> -                                  SCALER_DISPSTATX_MODE) !=
> -                    SCALER_DISPSTATX_MODE_DISABLED);
> -
> -       WARN_ON_ONCE((HVS_READ(SCALER_DISPSTATX(chan)) &
> -                     (SCALER_DISPSTATX_FULL | SCALER_DISPSTATX_EMPTY)) !=
> -                    SCALER_DISPSTATX_EMPTY);
> +       vc4_hvs_stop_channel(dev, chan);
>  }
>
>  void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
> --
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

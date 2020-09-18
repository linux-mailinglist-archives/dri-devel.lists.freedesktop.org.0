Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 309C3270281
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 18:46:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62EF46ED38;
	Fri, 18 Sep 2020 16:46:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCAC26ED38
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 16:46:51 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id k18so6228568wmj.5
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 09:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x2dP4UcE3sWQ3VomUCH89EZ1bsooBucMERiNI9LOr4o=;
 b=M7p0/el/7VYU9UxL73Xz4wuyltP/kOyR+IrgJFfDgxn2d0IAFvqwEXbvYBdaHzSr+W
 XUPp4uJ9w7vCps/87JacUoGuvEp6NehpzFK6ekOZiLLJkicVa6OAryl/PCfDFunbr7lm
 H3AArXWir/DqdaWhCs5E6EOJribV1sb83JP5SyGcOZJLfkx7kjQN+DLbw4XRck2qe38L
 5RhpBv6pfxghL6oGfpujnvgnYAjRbykU8zs4Iwko2x96PH45g1lkeIZgyEL46PgUPtCR
 iK5MbljBP8R61H/FVJsbnr5NVIxA/ZDM+IpKIqAoSdtVZd80QRCG9mKIriXlTXaj25/O
 Y1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x2dP4UcE3sWQ3VomUCH89EZ1bsooBucMERiNI9LOr4o=;
 b=mwB7k23Jo0vgtHzJ3MfAfxGEN+iWUmAyLESWTXFWso6yXB2+7HzYNfV1f8uDfSknjN
 638ZurmIPKp5ooHhpmSgUVOiL4f5GjY6hwFInPx1Le4pgvo2IO6iGDzlvxajhLeUq5Rt
 oadeK1or2TdxVLnF2CU2RUkB3XTZY74PJ4Rp2m47xfo9LquyE5X5nMyh5Nkx8kj0VZyC
 T2EqUHCjzM4AZU8c6IPyxFVtj39pvM7YS6f72AVGpB4YOwA1s2oRUhr0Uk3S84c3nKm7
 Lg/42JJoWnFxvYuNcHkhWw6cY89823dMcSOye6c79AYbEBjktP5gUq30GtclOri6koVO
 Q2zg==
X-Gm-Message-State: AOAM5314ChKUT3miKBp0uo2dLoNWYsobayD3wrl63az0fFprWr39DzcV
 DvB1+wuSbqmOuuXJZlBHJNzqnwhpcjwWKPEIF43Hsw==
X-Google-Smtp-Source: ABdhPJy/gGJanF4ZoO96vmE+oOeRyKOjBs0RNno4WqWu/PRKvijSwIorHR/mTqBz1TpaSXxraAhStFFwsrhaaLORMp4=
X-Received: by 2002:a1c:1d52:: with SMTP id d79mr17492245wmd.82.1600447610254; 
 Fri, 18 Sep 2020 09:46:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200918145918.101068-1-maxime@cerno.tech>
 <20200918145918.101068-2-maxime@cerno.tech>
In-Reply-To: <20200918145918.101068-2-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 18 Sep 2020 17:46:34 +0100
Message-ID: <CAPY8ntA4b3Sf29OWMxS=cPHmGBx+8kCx_ix0mhcgqUWeTirL-A@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/vc4: crtc: Keep the previously assigned HVS FIFO
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
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

Thanks for the patch - it makes mode switching reliable for me! :-)

On Fri, 18 Sep 2020 at 15:59, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The HVS FIFOs are currently assigned each time we have an atomic_check
> for all the enabled CRTCs.
>
> However, if we are running multiple outputs in parallel and we happen to
> disable the first (by index) CRTC, we end up changing the assigned FIFO
> of the second CRTC without disabling and reenabling the pixelvalve which
> ends up in a stall and eventually a VBLANK timeout.
>
> In order to fix this, we can create a special value for our assigned
> channel to mark it as disabled, and if our CRTC already had an assigned
> channel in its previous state, we keep on using it.
>
> Fixes: 87ebcd42fb7b ("drm/vc4: crtc: Assign output to channel automatically")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Review comments below though.

> ---
>  drivers/gpu/drm/vc4/vc4_crtc.c | 13 ++++++++++---
>  drivers/gpu/drm/vc4/vc4_drv.h  |  1 +
>  drivers/gpu/drm/vc4/vc4_kms.c  | 21 +++++++++++++++------
>  3 files changed, 26 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
> index a393f93390a2..be754120faa8 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -852,11 +852,18 @@ void vc4_crtc_destroy_state(struct drm_crtc *crtc,
>
>  void vc4_crtc_reset(struct drm_crtc *crtc)
>  {
> +       struct vc4_crtc_state *vc4_crtc_state;
> +
>         if (crtc->state)
>                 vc4_crtc_destroy_state(crtc, crtc->state);
> -       crtc->state = kzalloc(sizeof(struct vc4_crtc_state), GFP_KERNEL);
> -       if (crtc->state)
> -               __drm_atomic_helper_crtc_reset(crtc, crtc->state);
> +
> +       vc4_crtc_state = kzalloc(sizeof(*vc4_crtc_state), GFP_KERNEL);
> +       if (!vc4_crtc_state)
> +               return;

This error path has me worried, but I may have missed it.

If crtc->state was set then it's been freed via
vc4_crtc_destroy_state. However I don't see anything that has reset
crtc->state to NULL.
If the new alloc fails then I believe we exit with crtc->state still
set to the old freed pointer.

The old code directly set crtc->state, so it got reset to NULL by the failure.

> +
> +       vc4_crtc_state->assigned_channel = VC4_HVS_CHANNEL_DISABLED;
> +       crtc->state = &vc4_crtc_state->base;
> +       __drm_atomic_helper_crtc_reset(crtc, crtc->state);
>  }
>
>  static const struct drm_crtc_funcs vc4_crtc_funcs = {
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> index 8c8d96b6289f..2b13f2126f13 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -531,6 +531,7 @@ struct vc4_crtc_state {
>                 unsigned int bottom;
>         } margins;
>  };
> +#define VC4_HVS_CHANNEL_DISABLED ((unsigned int) -1)

Checkpatch whinge on that
CHECK: No space is necessary after a cast
#55: FILE: drivers/gpu/drm/vc4/vc4_drv.h:539:
+#define VC4_HVS_CHANNEL_DISABLED ((unsigned int) -1)

CHECK: Please use a blank line after function/struct/union/enum declarations
#55: FILE: drivers/gpu/drm/vc4/vc4_drv.h:539:
 };
+#define VC4_HVS_CHANNEL_DISABLED ((unsigned int) -1)

>  static inline struct vc4_crtc_state *
>  to_vc4_crtc_state(struct drm_crtc_state *crtc_state)
> diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
> index 01fa60844695..f452dad50c22 100644
> --- a/drivers/gpu/drm/vc4/vc4_kms.c
> +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> @@ -616,7 +616,7 @@ static int
>  vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
>  {
>         unsigned long unassigned_channels = GENMASK(NUM_CHANNELS - 1, 0);
> -       struct drm_crtc_state *crtc_state;
> +       struct drm_crtc_state *old_crtc_state, *new_crtc_state;
>         struct drm_crtc *crtc;
>         int i, ret;
>
> @@ -629,6 +629,7 @@ vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
>          * modified.
>          */
>         list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
> +               struct drm_crtc_state *crtc_state;

Blank line between variables and code, or not in this subsystem?
Checkpatch hasn't complained to me here.

>                 if (!crtc->state->enable)
>                         continue;
>
> @@ -637,15 +638,23 @@ vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
>                         return PTR_ERR(crtc_state);
>         }
>
> -       for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
> -               struct vc4_crtc_state *vc4_crtc_state =
> -                       to_vc4_crtc_state(crtc_state);
> +       for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
> +               struct vc4_crtc_state *new_vc4_crtc_state =
> +                       to_vc4_crtc_state(new_crtc_state);
>                 struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
>                 unsigned int matching_channels;
>
> -               if (!crtc_state->enable)
> +               if (old_crtc_state->enable && !new_crtc_state->enable)
> +                       new_vc4_crtc_state->assigned_channel = VC4_HVS_CHANNEL_DISABLED;
> +
> +               if (!new_crtc_state->enable)
>                         continue;
>
> +               if (new_vc4_crtc_state->assigned_channel != VC4_HVS_CHANNEL_DISABLED) {
> +                       unassigned_channels &= ~BIT(new_vc4_crtc_state->assigned_channel);
> +                       continue;
> +               }
> +
>                 /*
>                  * The problem we have to solve here is that we have
>                  * up to 7 encoders, connected to up to 6 CRTCs.
> @@ -674,7 +683,7 @@ vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
>                 if (matching_channels) {
>                         unsigned int channel = ffs(matching_channels) - 1;
>
> -                       vc4_crtc_state->assigned_channel = channel;
> +                       new_vc4_crtc_state->assigned_channel = channel;
>                         unassigned_channels &= ~BIT(channel);
>                 } else {
>                         return -EINVAL;
> --
> 2.26.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

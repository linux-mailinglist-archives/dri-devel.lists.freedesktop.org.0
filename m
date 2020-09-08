Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5628261EAC
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 21:54:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0366E28B;
	Tue,  8 Sep 2020 19:54:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 593 seconds by postgrey-1.36 at gabe;
 Tue, 08 Sep 2020 19:54:17 UTC
Received: from a27-186.smtp-out.us-west-2.amazonses.com
 (a27-186.smtp-out.us-west-2.amazonses.com [54.240.27.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4318A6E28B;
 Tue,  8 Sep 2020 19:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599594264;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
 bh=8WW0GBw5JW+XfqzWOS9BQy4RMnqMxVS+U0EKG5ssuts=;
 b=NY2k2CwFEM4KutzMxMGmaJyDJBJ9EIjKXt/DUzbK4uWwwJjIWScFckVkRxlsG5Fx
 dvQt9PlcPkZMRtBL+sdfgBuxCKmRCXVbdZb0RyVrWyR9kpCEBsiaVycILK7VTNOgRjj
 uMWHL/MJ6qOAnDsRx6+XcfOtKBJyidjmtWHfgezo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599594264;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
 bh=8WW0GBw5JW+XfqzWOS9BQy4RMnqMxVS+U0EKG5ssuts=;
 b=mYvNP3O4vRc/nKrhTGPMgnfNnrV2gyb5/zUG+hzvhVYcY5fHHt7dTgGBrvCVwu9d
 VHHUOmQxTkqNY99fgJBGiP0/aCwH/xFf7J5dGmHJEgOrlY53tDmkvznBEe05hjU0Mpj
 VN8/cGEeReR6OiB5cY/2aliu+6IKC6ch/HJAjQC8=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Date: Tue, 8 Sep 2020 19:44:24 +0000
From: abhinavk@codeaurora.org
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 2/2] drm/msm/dpu: clean up some impossibilities
In-Reply-To: <20200907170450.370122-2-robdclark@gmail.com>
References: <20200907170450.370122-1-robdclark@gmail.com>
 <20200907170450.370122-2-robdclark@gmail.com>
Message-ID: <010101746f3f7662-293fa8ca-5a27-4f76-a55e-c9009fd2f81f-000000@us-west-2.amazonses.com>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2020.09.08-54.240.27.186
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Hongbo Yao <yaohongbo@huawei.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Drew Davenport <ddavenport@chromium.org>, Sean Paul <sean@poorly.run>,
 linux-arm-msm-owner@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-09-07 10:04, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 81 ++++--------------------
>  1 file changed, 12 insertions(+), 69 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 89c0245b5de5..ad49b0e17fcb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -265,11 +265,6 @@ enum dpu_intf_mode dpu_crtc_get_intf_mode(struct
> drm_crtc *crtc)
>  {
>  	struct drm_encoder *encoder;
> 
> -	if (!crtc) {
> -		DPU_ERROR("invalid crtc\n");
> -		return INTF_MODE_NONE;
> -	}
> -
>  	/*
>  	 * TODO: This function is called from dpu debugfs and as part of 
> atomic
>  	 * check. When called from debugfs, the crtc->mutex must be held to
> @@ -500,12 +495,6 @@ static void dpu_crtc_atomic_begin(struct drm_crtc 
> *crtc,
>  	struct dpu_crtc_state *cstate;
>  	struct drm_encoder *encoder;
>  	struct drm_device *dev;
> -	unsigned long flags;
> -
> -	if (!crtc) {
> -		DPU_ERROR("invalid crtc\n");
> -		return;
> -	}
> 
>  	if (!crtc->state->enable) {
>  		DPU_DEBUG("crtc%d -> enable %d, skip atomic_begin\n",
> @@ -521,15 +510,6 @@ static void dpu_crtc_atomic_begin(struct drm_crtc 
> *crtc,
> 
>  	_dpu_crtc_setup_lm_bounds(crtc, crtc->state);
> 
> -	if (dpu_crtc->event) {
> -		WARN_ON(dpu_crtc->event);
> -	} else {
> -		spin_lock_irqsave(&dev->event_lock, flags);
> -		dpu_crtc->event = crtc->state->event;
> -		crtc->state->event = NULL;
> -		spin_unlock_irqrestore(&dev->event_lock, flags);
> -	}
> -
>  	/* encoder will trigger pending mask now */
>  	drm_for_each_encoder_mask(encoder, crtc->dev, 
> crtc->state->encoder_mask)
>  		dpu_encoder_trigger_kickoff_pending(encoder);
> @@ -583,14 +563,11 @@ static void dpu_crtc_atomic_flush(struct drm_crtc 
> *crtc,
>  		return;
>  	}
> 
> -	if (dpu_crtc->event) {
> -		DPU_DEBUG("already received dpu_crtc->event\n");
> -	} else {
> -		spin_lock_irqsave(&dev->event_lock, flags);
> -		dpu_crtc->event = crtc->state->event;
> -		crtc->state->event = NULL;
> -		spin_unlock_irqrestore(&dev->event_lock, flags);
> -	}
> +	WARN_ON(dpu_crtc->event);
before the patch "move vblank events to complete_commit()", the dpu_crtc 
events
were consumed in the _dpu_crtc_complete_flip(). So there was a chance 
that if the vblank event
did not come in time before the next commit, dpu_crtc->event will not be 
consumed.

But after the patch, _dpu_crtc_complete_flip() is being signaled in 
dpu_crtc_complete_commit()
which will always happen, so is there any case where we will hit this 
warning at all or will this
catch some other condition?

> +	spin_lock_irqsave(&dev->event_lock, flags);
> +	dpu_crtc->event = crtc->state->event;
> +	crtc->state->event = NULL;
> +	spin_unlock_irqrestore(&dev->event_lock, flags);
> 
>  	/*
>  	 * If no mixers has been allocated in dpu_crtc_atomic_check(),
> @@ -635,14 +612,7 @@ static void dpu_crtc_atomic_flush(struct drm_crtc 
> *crtc,
>  static void dpu_crtc_destroy_state(struct drm_crtc *crtc,
>  		struct drm_crtc_state *state)
>  {
> -	struct dpu_crtc_state *cstate;
> -
> -	if (!crtc || !state) {
> -		DPU_ERROR("invalid argument(s)\n");
> -		return;
> -	}
> -
> -	cstate = to_dpu_crtc_state(state);
> +	struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
> 
>  	DPU_DEBUG("crtc%d\n", crtc->base.id);
> 
> @@ -731,14 +701,8 @@ static void dpu_crtc_reset(struct drm_crtc *crtc)
>   */
>  static struct drm_crtc_state *dpu_crtc_duplicate_state(struct drm_crtc 
> *crtc)
>  {
> -	struct dpu_crtc_state *cstate, *old_cstate;
> -
> -	if (!crtc || !crtc->state) {
> -		DPU_ERROR("invalid argument(s)\n");
> -		return NULL;
> -	}
> +	struct dpu_crtc_state *cstate, *old_cstate = 
> to_dpu_crtc_state(crtc->state);
> 
> -	old_cstate = to_dpu_crtc_state(crtc->state);
>  	cstate = kmemdup(old_cstate, sizeof(*old_cstate), GFP_KERNEL);
>  	if (!cstate) {
>  		DPU_ERROR("failed to allocate state\n");
> @@ -754,19 +718,12 @@ static struct drm_crtc_state
> *dpu_crtc_duplicate_state(struct drm_crtc *crtc)
>  static void dpu_crtc_disable(struct drm_crtc *crtc,
>  			     struct drm_crtc_state *old_crtc_state)
>  {
> -	struct dpu_crtc *dpu_crtc;
> -	struct dpu_crtc_state *cstate;
> +	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
> +	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc->state);
>  	struct drm_encoder *encoder;
>  	unsigned long flags;
>  	bool release_bandwidth = false;
> 
> -	if (!crtc || !crtc->state) {
> -		DPU_ERROR("invalid crtc\n");
> -		return;
> -	}
> -	dpu_crtc = to_dpu_crtc(crtc);
> -	cstate = to_dpu_crtc_state(crtc->state);
> -
>  	DRM_DEBUG_KMS("crtc%d\n", crtc->base.id);
> 
>  	/* Disable/save vblank irq handling */
> @@ -825,19 +782,13 @@ static void dpu_crtc_disable(struct drm_crtc 
> *crtc,
>  static void dpu_crtc_enable(struct drm_crtc *crtc,
>  		struct drm_crtc_state *old_crtc_state)
>  {
> -	struct dpu_crtc *dpu_crtc;
> +	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
>  	struct drm_encoder *encoder;
>  	bool request_bandwidth = false;
> 
> -	if (!crtc) {
> -		DPU_ERROR("invalid crtc\n");
> -		return;
> -	}
> -
>  	pm_runtime_get_sync(crtc->dev->dev);
> 
>  	DRM_DEBUG_KMS("crtc%d\n", crtc->base.id);
> -	dpu_crtc = to_dpu_crtc(crtc);
> 
>  	drm_for_each_encoder_mask(encoder, crtc->dev, 
> crtc->state->encoder_mask) {
>  		/* in video mode, we hold an extra bandwidth reference
> @@ -873,9 +824,9 @@ struct plane_state {
>  static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>  		struct drm_crtc_state *state)
>  {
> -	struct dpu_crtc *dpu_crtc;
> +	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
> +	struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
>  	struct plane_state *pstates;
> -	struct dpu_crtc_state *cstate;
> 
>  	const struct drm_plane_state *pstate;
>  	struct drm_plane *plane;
> @@ -889,16 +840,8 @@ static int dpu_crtc_atomic_check(struct drm_crtc 
> *crtc,
>  	int left_zpos_cnt = 0, right_zpos_cnt = 0;
>  	struct drm_rect crtc_rect = { 0 };
> 
> -	if (!crtc) {
> -		DPU_ERROR("invalid crtc\n");
> -		return -EINVAL;
> -	}
> -
>  	pstates = kzalloc(sizeof(*pstates) * DPU_STAGE_MAX * 4, GFP_KERNEL);
> 
> -	dpu_crtc = to_dpu_crtc(crtc);
> -	cstate = to_dpu_crtc_state(state);
> -
>  	if (!state->enable || !state->active) {
>  		DPU_DEBUG("crtc%d -> enable %d, active %d, skip atomic_check\n",
>  				crtc->base.id, state->enable, state->active);
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

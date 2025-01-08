Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBD1A05821
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 11:29:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4101F10E84A;
	Wed,  8 Jan 2025 10:29:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fhXqL58J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1BFE10E84A
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 10:29:44 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-3003e203acaso164707741fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 02:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736332123; x=1736936923; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EmeyzTrOQIA9vHi8vWZpVljLw/8smezgBrfiULckA3c=;
 b=fhXqL58Jj0MfjH5YkqJrCAe7sm6CcZovRzyJQzT4iEv3WTxa72QWy47uTIm/OJwbmr
 02z0UKjEX2v6jhrOZHxWQZp1Mbwht2KC+z1xp0UFZb4BZMK3G68dEo8Z77ykcaJYoy5I
 o94TfRehAsJWKGWfGqh8mAn5od3EP2TbZHznxfme1Y8iitvN6ooH7V6zU4vGp/4y/mnz
 1bcTLcGYMNs2E0JNZO2vj8TLGxcVkUB5oLk0d/cMp+BpwKRlwvKRLGrOXZa3sOpxNITN
 bc2pkA86Wor3mMZPKBBQFVyMnp9NIvXPH/ZXuBTxdqIrhVe4ih232ykKfiqC1O5ohv6J
 ojmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736332123; x=1736936923;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EmeyzTrOQIA9vHi8vWZpVljLw/8smezgBrfiULckA3c=;
 b=aw3h4AzuBAHgYT9z3BqVrHPCJoV0vMyp3GgzKZI+JAg0eyyvpchMG0ACMKdEUwSyF9
 nguCMIqPIaEGNRf5YmpW+VJF+k7P9LzkmMxRjZUqXilY4JDax7iOnamqubTbKsqnQoJ7
 k1d1iUUFEMA5yGpJavEirxffcXNbzFvqmxdsbhB/FxC1+NcsnuQ2L7UBRUK8+DIdHsCX
 oD+psemBnwgOEqgm7TEIB5+0cMnIgCqhKn6GJCpM3epoS59mhCIF4ckduM7THjoMpsOb
 Jo4/iktympJeYUWjcbZHS+LNeRJER+RpKTRFGJUs2PhGiPnqkVfObFqPANoEkqQ0dg5V
 XFgA==
X-Gm-Message-State: AOJu0YwggfVvVGnRvg7Cn3+F/K+wMUpaEs/p/vVGDWEPr8JSiH1lFcVX
 abKsATRRnWGpMH39CeKZmBbwxq3W58+aWz7tD/p3gElDQlm0av07dtWm/o439WQ=
X-Gm-Gg: ASbGncvZEWH7OrwHMV0Fw3glD+XvSdCKTAOJ+LeKVFk2llFNvkIT3zRjyGc/skLVVxa
 Mmp+zAUjtyZ1dqEyVxft1V81gDAvfnINwsb/nK9BfDri+qtRs/xI3DSpK418Xgr0RjVlcdn3zWY
 Td1tVUTXy0RZBpG2ESuGHymI9sGn8LINabMuB+srrDSoAAqGVsrm2OnKOqJuA7dIa0X032oyWKa
 0waCNZ6aUb5yxjj0va+779QZtR9+GjvIKPZwXjRec7v+xmVmjYcjYG7dZRfVy5znq8jh/iTj3pp
 pnq0o1yeTcM3qKC56bYwhv9VCDs9/mA2Wa+I
X-Google-Smtp-Source: AGHT+IE26udTFhcl7SvPsOFQvGtDHk1r+PpmikL0b5Y+/kvCJ7lxnaeJ+BmMDGsC7XtxSnsj+U8qHw==
X-Received: by 2002:a2e:b888:0:b0:302:350c:c630 with SMTP id
 38308e7fff4ca-305f45e1551mr6286681fa.22.1736332123058; 
 Wed, 08 Jan 2025 02:28:43 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045ad9bb7asm66812151fa.46.2025.01.08.02.28.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 02:28:41 -0800 (PST)
Date: Wed, 8 Jan 2025 12:28:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Subject: Re: [PATCH] drm/display: bridge_connector: Do atomic check when
 necessary
Message-ID: <dm4lqvtd4lxqmxruji5eydmbqxoomj6fogiu4uucqfevifqpll@33eeykwlqczx>
References: <20250108101351.2599140-1-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108101351.2599140-1-victor.liu@nxp.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 08, 2025 at 06:13:51PM +0800, Liu Ying wrote:
> It's ok to pass atomic check successfully if an atomic commit tries to
> disable the display pipeline which the connector belongs to. That is,
> when the crtc or the best_encoder pointers in struct drm_connector_state
> are NULL, drm_bridge_connector_atomic_check() should return 0 directly.
> Without the check against the NULL pointers, drm_default_rgb_quant_range()
> called by drm_atomic_helper_connector_hdmi_check() would dereference
> the NULL pointer to_match in drm_match_cea_mode().
> 

[..]

> [   46.823581] pc : drm_default_rgb_quant_range+0x0/0x4c [drm]
> [   46.829244] lr : drm_atomic_helper_connector_hdmi_check+0xb0/0x6b0 [drm_display_helper]
> [   46.837293] sp : ffff80008364ba00

[..]

> [   46.911984] Call trace:
> [   46.914429]  drm_default_rgb_quant_range+0x0/0x4c [drm] (P)
> [   46.920106]  drm_bridge_connector_atomic_check+0x20/0x2c [drm_display_helper]
> [   46.927275]  drm_atomic_helper_check_modeset+0x488/0xc78 [drm_kms_helper]
> [   46.934111]  drm_atomic_helper_check+0x20/0xa4 [drm_kms_helper]
> [   46.940063]  drm_atomic_check_only+0x4b8/0x984 [drm]
> [   46.945136]  drm_atomic_commit+0x48/0xc4 [drm]
> [   46.949674]  drm_framebuffer_remove+0x44c/0x530 [drm]
> [   46.954809]  drm_mode_rmfb_work_fn+0x7c/0xa0 [drm]
> [   46.959687]  process_one_work+0x150/0x294
> [   46.963700]  worker_thread+0x2dc/0x3dc
> [   46.967450]  kthread+0x130/0x204
> [   46.970679]  ret_from_fork+0x10/0x20
> [   46.974258] Code: d50323bf d65f03c0 52800041 17ffffe6 (b9400001)
> [   46.980350] ---[ end trace 0000000000000000 ]---

Please trim the backtrace in a way I trimmed it. Also you can drop the
timestamps, they don't have useful information.

> 
> Fixes: 8ec116ff21a9 ("drm/display: bridge_connector: provide atomic_check for HDMI bridges")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> index 32108307de66..587020a3f3e8 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -343,6 +343,11 @@ static int drm_bridge_connector_atomic_check(struct drm_connector *connector,
>  {
>  	struct drm_bridge_connector *bridge_connector =
>  		to_drm_bridge_connector(connector);
> +	struct drm_connector_state *new_conn_state =
> +		drm_atomic_get_new_connector_state(state, connector);
> +
> +	if (!new_conn_state->crtc || !new_conn_state->best_encoder)
> +		return 0;

Unfortunately, this is not enough. Other drivers (e.g. sun4i) use
drm_atomic_helper_connector_hdmi_check() at connector's atomic_check()
function. Please move necessary checks to the helper itself. Also please
add corresponding KUnit test: attempt to atomic_check() the unconnected
HDMI connector, there is a test suite for the HDMI connector functions,
but the atomic_check() for the disconnected connecor seems to be missing.

>  
>  	if (bridge_connector->bridge_hdmi)
>  		return drm_atomic_helper_connector_hdmi_check(connector, state);
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

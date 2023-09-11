Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE6879AACB
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 20:18:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9897C10E1BC;
	Mon, 11 Sep 2023 18:18:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398F710E1B8;
 Mon, 11 Sep 2023 18:17:59 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9a9f2827131so466725166b.1; 
 Mon, 11 Sep 2023 11:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694456277; x=1695061077; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=2O3Y8vTwkKjYD2RHaXSqIrH4KfUVsOM7ZDxSCNtKlAE=;
 b=EeFD08q0SVF4U+how4PsHaXlfouai917X02UlPgaTeo/xz85TkwsTxscwBdxvXhg6P
 6ZtJbKK/88Jp7ErGmkP2UDfZAD7xDIvfMN8dSwbCnpSS/kh4DFPnJmIgdazr6rVWl1Bf
 /g3iuKb2TrC1NMg7vtDFyosfkBC9O7ydMwI6PDDjM4F/0NmeQOq1yBc8wGogCe4wBTJe
 pnySh5s8ZxvTeruWd8cxcQHbM4ot2IErYBgjQUm+7yfEoJCr1bgVBcsgjtLA90lDYRPC
 7sfQxaZZ9avSgFwPM7aXxgV5urSRnJfEcgti7wO+dQKh+LuFnOF/Ep7xnEGsVzCw+MBb
 EZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694456277; x=1695061077;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2O3Y8vTwkKjYD2RHaXSqIrH4KfUVsOM7ZDxSCNtKlAE=;
 b=OyuxUsAeh6lXwBTEpsDwXfQKZzEJRUGeAsru8zzIEMCBMLocEkd5bN+/qAsRG77F1+
 FG6qYB+MvQCy3fEWEI1ithc8/Q60G5WNhcGR7eUL6GJqyxZT8Wuceyhzb1tguWtVRwt6
 pTBZbbXd1PFIctjSPTgsTL5d85A4MDI6YvBe7gdnlZa6jDauN0dIpRjcE2It3vUYjbPJ
 PIzjWiMq/HMhoVr6haHTziDFUJnPShxq1B2G1JOq7lrwp5rxmzUDFMmYu6zThkektmru
 YokusXLrT4MtWcX3hDH99gTSv5GcXAiOOybwYDELWS6Cd0uIY+ZGLw43+/dx9KCOlXuQ
 nLhw==
X-Gm-Message-State: AOJu0YzQql2POzr3h/Dk+r/abRox5Z6LqT2dnePquYmAMXPXUVOjH1Cq
 m0oDJ93kJrJD4bYGxlvYhASWZdRK+E7fWQ==
X-Google-Smtp-Source: AGHT+IFogFxzedZSDTIRuyY41H5iWfxSmZU99Xblxp3hdVM0z80mjABNGdMK22mwxATNMsGV/Ve+Nw==
X-Received: by 2002:a17:906:1da9:b0:9a1:688f:cf21 with SMTP id
 u9-20020a1709061da900b009a1688fcf21mr8920628ejh.43.1694456277141; 
 Mon, 11 Sep 2023 11:17:57 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.137.87])
 by smtp.googlemail.com with ESMTPSA id
 kj13-20020a170907764d00b009a1b857e3a5sm5690909ejc.54.2023.09.11.11.17.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Sep 2023 11:17:56 -0700 (PDT)
Message-ID: <fe78c136-0dc3-6253-21bc-59992efa52da@gmail.com>
Date: Mon, 11 Sep 2023 21:17:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [Intel-gfx] [PATCH v2 1/2] drm/i915: Use vblank worker to unpin
 old legacy cursor fb safely
Content-Language: en-US
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20230904041640.31297-1-ville.syrjala@linux.intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20230904041640.31297-1-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Reply-To: juhapekka.heikkila@gmail.com
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I didn't spot anything to nag about. Just hope that warning doesn't 
become excessively noisy. These two patches are

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 4.9.2023 7.16, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> The cursor hardware only does sync updates, and thus the hardware
> will be scanning out from the old fb until the next start of vblank.
> So in order to make the legacy cursor fastpath actually safe we
> should not unpin the old fb until we're sure the hardware has
> ceased accessing it. The simplest approach is to just use a vblank
> work here to do the delayed unpin.
> 
> Not 100% sure it's a good idea to put this onto the same high
> priority vblank worker as eg. our timing critical gamma updates.
> But let's keep it simple for now, and it we later discover that
> this is causing problems we can think about adding a lower
> priority worker for such things.
> 
> v2: wait for cursor unpins before turning off the vblank irq
> 
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_cursor.c   | 36 +++++++++++++++++--
>   drivers/gpu/drm/i915/display/intel_cursor.h   |  2 ++
>   drivers/gpu/drm/i915/display/intel_display.c  |  3 ++
>   .../drm/i915/display/intel_display_types.h    |  4 +++
>   4 files changed, 43 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
> index b342fad180ca..625540fd1dab 100644
> --- a/drivers/gpu/drm/i915/display/intel_cursor.c
> +++ b/drivers/gpu/drm/i915/display/intel_cursor.c
> @@ -603,6 +603,26 @@ static bool intel_cursor_format_mod_supported(struct drm_plane *_plane,
>   	return format == DRM_FORMAT_ARGB8888;
>   }
>   
> +static void intel_cursor_unpin_work(struct kthread_work *base)
> +{
> +	struct drm_vblank_work *work = to_drm_vblank_work(base);
> +	struct intel_plane_state *plane_state =
> +		container_of(work, typeof(*plane_state), unpin_work);
> +	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
> +
> +	intel_plane_unpin_fb(plane_state);
> +	intel_plane_destroy_state(&plane->base, &plane_state->uapi);
> +
> +	if (atomic_dec_and_test(&plane->cursor.pending_unpins))
> +		wake_up_var(&plane->cursor.pending_unpins);
> +}
> +
> +void intel_cursor_wait_unpin_works(struct intel_plane *plane)
> +{
> +	wait_var_event(&plane->cursor.pending_unpins,
> +		       !atomic_read(&plane->cursor.pending_unpins));
> +}
> +
>   static int
>   intel_legacy_cursor_update(struct drm_plane *_plane,
>   			   struct drm_crtc *_crtc,
> @@ -730,14 +750,26 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
>   
>   	local_irq_enable();
>   
> -	intel_plane_unpin_fb(old_plane_state);
> +	if (old_plane_state->hw.fb != new_plane_state->hw.fb) {
> +		drm_vblank_work_init(&old_plane_state->unpin_work, &crtc->base,
> +				     intel_cursor_unpin_work);
> +
> +		atomic_inc(&plane->cursor.pending_unpins);
> +		drm_vblank_work_schedule(&old_plane_state->unpin_work,
> +					 drm_crtc_accurate_vblank_count(&crtc->base) + 1,
> +					 false);
> +
> +		old_plane_state = NULL;
> +	} else {
> +		intel_plane_unpin_fb(old_plane_state);
> +	}
>   
>   out_free:
>   	if (new_crtc_state)
>   		intel_crtc_destroy_state(&crtc->base, &new_crtc_state->uapi);
>   	if (ret)
>   		intel_plane_destroy_state(&plane->base, &new_plane_state->uapi);
> -	else
> +	else if (old_plane_state)
>   		intel_plane_destroy_state(&plane->base, &old_plane_state->uapi);
>   	return ret;
>   
> diff --git a/drivers/gpu/drm/i915/display/intel_cursor.h b/drivers/gpu/drm/i915/display/intel_cursor.h
> index ce333bf4c2d5..e778aff77129 100644
> --- a/drivers/gpu/drm/i915/display/intel_cursor.h
> +++ b/drivers/gpu/drm/i915/display/intel_cursor.h
> @@ -14,4 +14,6 @@ struct intel_plane *
>   intel_cursor_plane_create(struct drm_i915_private *dev_priv,
>   			  enum pipe pipe);
>   
> +void intel_cursor_wait_unpin_works(struct intel_plane *plane);
> +
>   #endif
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index f6397462e4c2..90c1ed61ba0e 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -63,6 +63,7 @@
>   #include "intel_crt.h"
>   #include "intel_crtc.h"
>   #include "intel_crtc_state_dump.h"
> +#include "intel_cursor.h"
>   #include "intel_ddi.h"
>   #include "intel_de.h"
>   #include "intel_display_driver.h"
> @@ -6618,6 +6619,8 @@ static void intel_commit_modeset_disables(struct intel_atomic_state *state)
>   
>   		intel_pre_plane_update(state, crtc);
>   		intel_crtc_disable_planes(state, crtc);
> +
> +		intel_cursor_wait_unpin_works(to_intel_plane(crtc->base.cursor));
>   	}
>   
>   	/* Only disable port sync and MST slaves */
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index c21064794f32..f6ca86f1d834 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -702,6 +702,9 @@ struct intel_plane_state {
>   
>   	struct intel_fb_view view;
>   
> +	/* for legacy cursor fb unpin */
> +	struct drm_vblank_work unpin_work;
> +
>   	/* Plane pxp decryption state */
>   	bool decrypt;
>   
> @@ -1515,6 +1518,7 @@ struct intel_plane {
>   
>   	struct {
>   		u32 base, cntl, size;
> +		atomic_t pending_unpins;
>   	} cursor;
>   
>   	struct intel_fbc *fbc;


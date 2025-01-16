Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A23C2A130D2
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 02:36:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72CE910E547;
	Thu, 16 Jan 2025 01:36:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="P5BirvNK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC0310E547
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 01:36:18 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-54021daa6cbso453854e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 17:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736991376; x=1737596176; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/0jxUlk4PxkPEnsYQP0c0nwyVNcSB7Evd/bjTtVkQVk=;
 b=P5BirvNKHkaCFisOI4GDWvwCihPuGlZtZFyXt55p7/iP65x2FRfYF6kawiPMwX7viE
 rDOvyf4Bc2MHb/Az4xYl0w0agyAW+vDf7dvi1nvc483oaYlVzLBMUBiE3QAa7v934iWv
 hnWlASwiG0VKhSpxrCAohPPaEg+Ygho0BzX6U07HPPyVHPRjr3+6AXsT6+wG7WipAnuK
 3R8sOzDm/de7QJ55Uqxqz17bkbdLisNz09v5GwAsirdXdEMfgD87rS+v6cVrqoF4cDnj
 y0gnvLT6KDG842UGUlzPryoJQ9AyrIN18Jkbd66G55Nbotaxv5Gym2K6luSR/+vIfHl+
 uLIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736991376; x=1737596176;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/0jxUlk4PxkPEnsYQP0c0nwyVNcSB7Evd/bjTtVkQVk=;
 b=lJ8nBzYYxdynWvZQ5L++2WTQWH3bgBLfM+cjHu6QvIG6NKM20h+pyKSZApLsb7p6Rm
 3aK5WpMTuDpQGz6nrxrSd3iDPPs8bpKlq5AiNU1Dg8x8Mg2IF0PvBSonTjI/tsn2b7o2
 vYuokXo8OzEOvH5Tz+DtS3/yumY/0GJPqtf8IxPEA5B/3ckI1/l1oK/DLy0K0zIjZnGx
 RN2pzjSsvTzk3PTujAe7wWH3+bj2G2X+h1voBO9WrEVb4JNIjw/J7+QUTrjS2NWYPHYf
 WOtLLZTdGxBJTH/covWrluAVKAyrrcL08kE1Iui3ITrb/wGxodA6ipKFv6hXOD9rJci5
 gT3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+1qt8/H6f5mMZxTbtqHwvs/sve+6DMd8kfGBLkruW85/0zGYGnirZjzy/EIEeftADblZj2w8fBt8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQz3y2h1KBSnk3Mi1LauMj3opcPzHilib1vDol2kfZMi8ZSaid
 qbQsA2rVxwHIEL6SPNvGPibvuyopml/k347ZajV1QYhYcPlA/6No4sm019d1sTI=
X-Gm-Gg: ASbGncsLregqNAh068yeRq1odv6fBejZKmeQy2SjhaAgObmRtDWy1GlLKhmFjsHSbOt
 FmW2sMAb/Tn82NDpfPJ22MCDhC33ta6X6j2Bz9iLSigPrOAe4W4E2NGECwRD9JryoIMIGCwqKpa
 V/q5OwM8Cyu1dT8KJOoGLTPS+DThf6vZGPbKQMsSY0jY03BrOIZSp3xYy3n9A09tjjnrdC7l73j
 j2cRsVz3O9sPiNatfh69XBZDOP9JwUROD+5AQME3f5dGlWMgkuTeb0JepW4u0ZMl0Nvg6H+yOJB
 CpkteGWqWn8JgsCkfN95msUFkL5hzBkOrOon
X-Google-Smtp-Source: AGHT+IGNiPPH4eyRpyBC8Yr4hIpYyUhqsXpI+ybI9bFbP4CyRls8HvYnuIWjQNdsKekbLw5sDAFAmQ==
X-Received: by 2002:a05:6512:220b:b0:53e:389d:8ce6 with SMTP id
 2adb3069b0e04-542845d1dbamr10271860e87.28.1736991376521; 
 Wed, 15 Jan 2025 17:36:16 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428be4a010sm2163288e87.35.2025.01.15.17.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 17:36:15 -0800 (PST)
Date: Thu, 16 Jan 2025 03:36:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/29] drm/atomic-helper: Fix commit_tail state variable
 name
Message-ID: <w6hoxhwyrp44e6yqelxe5qtlyq643bvynmqrwzybuflhb7lkvu@bmsy3losd6t4>
References: <20250115-bridge-connector-v1-0-9a2fecd886a6@kernel.org>
 <20250115-bridge-connector-v1-1-9a2fecd886a6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115-bridge-connector-v1-1-9a2fecd886a6@kernel.org>
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

On Wed, Jan 15, 2025 at 10:05:08PM +0100, Maxime Ripard wrote:
> Even though the commit_tail () drm_atomic_state parameter is called
> old_state, it's actually the state being committed which is confusing.
> 
> It's even more confusing since the atomic_commit_tail hook being called
> by commit_tail() parameter is called state.

Do you have any kind of history and/or explanation, why it's called
old_state all over the place?

I think that the renaming is correct, but I'd like to understand the
reason behind it.

> Let's rename the variable from old_state to state to make it less
> confusing.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 40e4e1b6c9110677c1c4981eeb15dc93966f4cf6..913d94d664d885323ad7e41a6424633c28c787e1 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1818,13 +1818,13 @@ void drm_atomic_helper_commit_tail_rpm(struct drm_atomic_state *old_state)
>  
>  	drm_atomic_helper_cleanup_planes(dev, old_state);
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_commit_tail_rpm);
>  
> -static void commit_tail(struct drm_atomic_state *old_state)
> +static void commit_tail(struct drm_atomic_state *state)
>  {
> -	struct drm_device *dev = old_state->dev;
> +	struct drm_device *dev = state->dev;
>  	const struct drm_mode_config_helper_funcs *funcs;
>  	struct drm_crtc_state *new_crtc_state;
>  	struct drm_crtc *crtc;
>  	ktime_t start;
>  	s64 commit_time_ms;
> @@ -1842,37 +1842,37 @@ static void commit_tail(struct drm_atomic_state *old_state)
>  	 * These times will be averaged out in the self refresh helpers to avoid
>  	 * overreacting over one outlier frame
>  	 */
>  	start = ktime_get();
>  
> -	drm_atomic_helper_wait_for_fences(dev, old_state, false);
> +	drm_atomic_helper_wait_for_fences(dev, state, false);
>  
> -	drm_atomic_helper_wait_for_dependencies(old_state);
> +	drm_atomic_helper_wait_for_dependencies(state);
>  
>  	/*
>  	 * We cannot safely access new_crtc_state after
>  	 * drm_atomic_helper_commit_hw_done() so figure out which crtc's have
>  	 * self-refresh active beforehand:
>  	 */
> -	for_each_new_crtc_in_state(old_state, crtc, new_crtc_state, i)
> +	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i)
>  		if (new_crtc_state->self_refresh_active)
>  			new_self_refresh_mask |= BIT(i);
>  
>  	if (funcs && funcs->atomic_commit_tail)
> -		funcs->atomic_commit_tail(old_state);
> +		funcs->atomic_commit_tail(state);
>  	else
> -		drm_atomic_helper_commit_tail(old_state);
> +		drm_atomic_helper_commit_tail(state);
>  
>  	commit_time_ms = ktime_ms_delta(ktime_get(), start);
>  	if (commit_time_ms > 0)
> -		drm_self_refresh_helper_update_avg_times(old_state,
> +		drm_self_refresh_helper_update_avg_times(state,
>  						 (unsigned long)commit_time_ms,
>  						 new_self_refresh_mask);
>  
> -	drm_atomic_helper_commit_cleanup_done(old_state);
> +	drm_atomic_helper_commit_cleanup_done(state);
>  
> -	drm_atomic_state_put(old_state);
> +	drm_atomic_state_put(state);
>  }
>  
>  static void commit_work(struct work_struct *work)
>  {
>  	struct drm_atomic_state *state = container_of(work,
> 
> -- 
> 2.47.1
> 

-- 
With best wishes
Dmitry

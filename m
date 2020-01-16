Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C3C13D46E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 07:41:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C03266EBF4;
	Thu, 16 Jan 2020 06:41:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331976EBF4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 06:41:17 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id x7so9376207pgl.11
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 22:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=f+3QqTgKD7g/KMqBuMVdD0S0/jS8wXuOx0d2mRo05wM=;
 b=HWyZ3sMXGypZPNNMnZ852l+iVVKgncaqVj3flIFUoNqtIfd60EyelDa3m2LZrvRnBr
 h0l7o9f8UC4fo6HCkftcKVspCowdS+e6L/ybziqj3RV6Rrr6GakIosK/u3nobSMoK8hX
 lSxCdkVTZryN2yp+LCBmbzoysuD5mrcoDIeEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=f+3QqTgKD7g/KMqBuMVdD0S0/jS8wXuOx0d2mRo05wM=;
 b=n+fScjmuWRP/WMptj+E4Mi/ZJW2oinmMY3FvBcaZ1Re9fzWd77iOdl+bKJhIIX+Esh
 le9NNsvJ1gYRyJqmq2y0GibtzwibGoKDsaFOnqzD3R4nQ+PVLKmK+SWk+E27WEDrXo0X
 D9X8vViqRWW5sTt6OF7s9tr7y8y/Nv8t1x7vjoP1Hu8TIjEy3nexOaR5gWGgoUKVQvGY
 i7orN2Ci9PrBmNu3CvAevHuJ5qxCN/0ns96zsVKYXEd7tilkP75v+DLdIFxn7tuAv+PL
 DZqN9HNtjZWKZ+vBTkTviJBu4gvWN/UgjvRrqRXFCXOoVG5dfUdBJZzqXwUR+qGleuQl
 2uqA==
X-Gm-Message-State: APjAAAXT/FVnDym21pdJnRJG243t5rAfhY8fDJTW0Z1Ze2OFlLBuVVS4
 0KvgK7DC2F6rqZbRpKpM7AEa0g==
X-Google-Smtp-Source: APXvYqwZqouniRGqLdIbpa7A320WvTTDLYRevXEYwIJDywXZPmI0KIu4Kbc7bxX/PQE5dglAyvziBw==
X-Received: by 2002:a63:e0c:: with SMTP id d12mr36249068pgl.3.1579156876764;
 Wed, 15 Jan 2020 22:41:16 -0800 (PST)
Received: from dvetter-linux.ger.corp.intel.com ([138.44.248.126])
 by smtp.gmail.com with ESMTPSA id a1sm23642333pfo.68.2020.01.15.22.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 22:41:16 -0800 (PST)
Date: Thu, 16 Jan 2020 07:41:07 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 4/4] drm/simple-kms: Let DRM core send VBLANK events
 by default
Message-ID: <20200116064107.GB8400@dvetter-linux.ger.corp.intel.com>
References: <20200115125226.13843-1-tzimmermann@suse.de>
 <20200115125226.13843-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200115125226.13843-5-tzimmermann@suse.de>
X-Operating-System: Linux dvetter-linux.ger.corp.intel.com
 5.2.11-200.fc30.x86_64 
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
Cc: david@lechnology.com, oleksandr_andrushchenko@epam.com, airlied@linux.ie,
 sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, hdegoede@redhat.com,
 kraxel@redhat.com, xen-devel@lists.xenproject.org, emil.velikov@collabora.com,
 sean@poorly.run, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 15, 2020 at 01:52:26PM +0100, Thomas Zimmermann wrote:
> In drm_atomic_helper_fake_vblank() the DRM core sends out VBLANK events
> if struct drm_crtc_state.no_vblank is enabled in the check() callbacks.
> 
> For drivers that have neither an enable_vblank() callback nor a check()
> callback, the simple-KMS helpers enable VBLANK generation by default. This
> simplifies bochs, udl, several tiny drivers, and drivers based upon MIPI
> DPI helpers. The driver for Xen explicitly disables no_vblank, as it has
> its own logic for sending these events.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

> diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
> index 15fb516ae2d8..4414c7a5b2ce 100644
> --- a/drivers/gpu/drm/drm_simple_kms_helper.c
> +++ b/drivers/gpu/drm/drm_simple_kms_helper.c
> @@ -146,10 +146,21 @@ static int drm_simple_kms_plane_atomic_check(struct drm_plane *plane,
>  	if (!plane_state->visible)
>  		return 0;
>  
> -	if (!pipe->funcs || !pipe->funcs->check)
> -		return 0;
> -
> -	return pipe->funcs->check(pipe, plane_state, crtc_state);
> +	if (pipe->funcs) {
> +		if (pipe->funcs->check)
> +			return pipe->funcs->check(pipe, plane_state,
> +						  crtc_state);
> +		if (pipe->funcs->enable_vblank)
> +			return 0;
> +	}
> +
> +	/* Drivers without VBLANK support have to fake VBLANK events. As
> +	 * there's no check() callback to enable this, set the no_vblank
> +	 * field by default.
> +	 */

The ->check callback is right above this comment ... I'm confused.

> +	crtc_state->no_vblank = true;

That's kinda not what I meant with handling this automatically. Instead
something like this:


diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 7cf3cf936547..23d2f51fc1d4 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -149,6 +149,11 @@ void __drm_atomic_helper_crtc_duplicate_state(struct drm_crtc *crtc,
 	/* Self refresh should be canceled when a new update is available */
 	state->active = drm_atomic_crtc_effectively_active(state);
 	state->self_refresh_active = false;
+
+	if (drm_dev_has_vblank(crtc->dev))
+		state->no_vblank = true;
+	else
+		state->no_vblank = false;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_crtc_duplicate_state);
 
diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 1659b13b178c..32cab3d3c872 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -81,6 +81,12 @@
  */
 #define DRM_REDUNDANT_VBLIRQ_THRESH_NS 1000000
 
+/* FIXME roll this out here in this file */
+bool drm_dev_has_vblank(dev)
+{
+	return dev->num_crtcs;
+}
+
 static bool
 drm_get_last_vbltimestamp(struct drm_device *dev, unsigned int pipe,
 			  ktime_t *tvblank, bool in_vblank_irq);


But maybe move the default value to some other/better place in the atomic
helpers, not sure what the best one is.

Plus then in the documentation patch also highlight the link between
crtc_state->no_vblank and drm_dev_has_vblank respectively
drm_device.num_crtcs.

That should plug this issue once for all across the board.

There's still the fun between having the vblank callbacks and the
drm_vblank setup, but that's a much older can of worms ...
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

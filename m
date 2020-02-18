Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62909162F6F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 20:09:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2856A6EA72;
	Tue, 18 Feb 2020 19:09:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E3B76EA72
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 19:09:44 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id k11so25294604wrd.9
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 11:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=SBqpDcTE6AMCvGrFbLWhx5wZFetN9vSApojWcAj4+aU=;
 b=i+3xx54gT+/cAZ6JrqaPpTCoBJz7XXOp7G7+r0gX9XNxgObwzrh1Wb1TTrZwkxfVCq
 gP6Ovp4ugJ15he6KKTnXKD/O3OzUUpbXWGEOqvTx2kNsQ1tDt6tmnLKU0x6cEoKvnhwm
 CBvzzEqLXY87c4kfGjiWVPdZeRBzpKkiDCxck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=SBqpDcTE6AMCvGrFbLWhx5wZFetN9vSApojWcAj4+aU=;
 b=W6zgS6ECH0iu1jPECiYRaQYBZGdUa9Oo5R3/FFx2w1yueRXgGf0l16pwtAqbNOQTMr
 B0IO5kn4BH8yjiK6fhH/VrHAKvtMbc5EYYSIPV6rBNCWA4DY+kKcdt4kCDQSeQV6MRa8
 uY8m4EZB0hlSLAcpKSdXcX1KRcvNmW5lxUTOJKgGLLPDzoGTHiFxgrhldcIIx140spft
 IRMHJYqUTfF61txrQPKJW1+grn5N2xSh3GT0VO7OO+ggKRzdTv1vxo/YzVexdb8QFQuz
 ZC1PvNbNEQnh2SM201xox9AOhlrLt4QCFulT6KNRauUC+gTuTm58S1YuZT84q1ohEddP
 I5Qw==
X-Gm-Message-State: APjAAAV5YjhZDhbRBjLgaYLgbRJ8e8UBFKJfWqmrN8wFyt0YV9PsKa6k
 +7/W6qo1hsR2FNY/6pgyVUvw/A==
X-Google-Smtp-Source: APXvYqw8JfZcZoALoGUrqXssK3WpI4YwooCYEW8v1nAWpuspWdhwXC/fZ0wbKeKdH3ckafrtkxSOqA==
X-Received: by 2002:adf:e80e:: with SMTP id o14mr30197494wrm.212.1582052983166; 
 Tue, 18 Feb 2020 11:09:43 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d4sm7295827wra.14.2020.02.18.11.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 11:09:42 -0800 (PST)
Date: Tue, 18 Feb 2020 20:09:40 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Wambui Karuga <wambui.karugax@gmail.com>
Subject: Re: [PATCH 1/2] drm/debugfs: remove checks for return value of
 drm_debugfs functions.
Message-ID: <20200218190940.GN2363188@phenom.ffwll.local>
Mail-Followup-To: Wambui Karuga <wambui.karugax@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 gregkh@linuxfoundation.org
References: <20200218172821.18378-1-wambui.karugax@gmail.com>
 <20200218172821.18378-3-wambui.karugax@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200218172821.18378-3-wambui.karugax@gmail.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: tzimmermann@suse.de, airlied@linux.ie, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 18, 2020 at 08:28:14PM +0300, Wambui Karuga wrote:
> As there is no need to check the return value of
> drm_debugfs_create_files, remove unnecessary checks and error handling
> statement blocks.
> 
> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>

I'd split this up a bit differently, with a patch per function. But then
including in that patch the prototype change (at least for the
drm-internal ones that aren't used by drivers). This way reviewers don't
have to check the entire series to make sure that we drop the now
pointeless return value from the implementation of these functions.

I guess you could also just squash this function into the last one, it's a
fairly small patch still.
-Daniel

> ---
>  drivers/gpu/drm/drm_debugfs.c | 28 +++++-----------------------
>  1 file changed, 5 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 4e673d318503..6a2f141b6a38 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -215,35 +215,17 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
>  	sprintf(name, "%d", minor_id);
>  	minor->debugfs_root = debugfs_create_dir(name, root);
>  
> -	ret = drm_debugfs_create_files(drm_debugfs_list, DRM_DEBUGFS_ENTRIES,
> -				       minor->debugfs_root, minor);
> -	if (ret) {
> -		debugfs_remove(minor->debugfs_root);
> -		minor->debugfs_root = NULL;
> -		DRM_ERROR("Failed to create core drm debugfs files\n");
> -		return ret;
> -	}
> +	drm_debugfs_create_files(drm_debugfs_list, DRM_DEBUGFS_ENTRIES,
> +				 minor->debugfs_root, minor);
>  
>  	if (drm_drv_uses_atomic_modeset(dev)) {
> -		ret = drm_atomic_debugfs_init(minor);
> -		if (ret) {
> -			DRM_ERROR("Failed to create atomic debugfs files\n");
> -			return ret;
> -		}
> +		drm_atomic_debugfs_init(minor);
>  	}
>  
>  	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
> -		ret = drm_framebuffer_debugfs_init(minor);
> -		if (ret) {
> -			DRM_ERROR("Failed to create framebuffer debugfs file\n");
> -			return ret;
> -		}
> +		drm_framebuffer_debugfs_init(minor);
>  
> -		ret = drm_client_debugfs_init(minor);
> -		if (ret) {
> -			DRM_ERROR("Failed to create client debugfs file\n");
> -			return ret;
> -		}
> +		drm_client_debugfs_init(minor);
>  	}
>  
>  	if (dev->driver->debugfs_init) {
> -- 
> 2.25.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

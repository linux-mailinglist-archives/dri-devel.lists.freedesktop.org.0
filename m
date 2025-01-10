Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AF5A09BBD
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 20:19:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 987E010E029;
	Fri, 10 Jan 2025 19:19:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="L+tBDSam";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 930A710E029
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 19:19:51 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-436a03197b2so17771655e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 11:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1736536790; x=1737141590; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J80hwrHQqzeoTkDC+Lfua1rPRYfFeh84D/XME2XqQ0g=;
 b=L+tBDSamFvxDGUBs+jD68axcDMwF3wLGc6GUm82ixDifGql7inDNJZQB6AsMmMgcTV
 C6jp9Wrrzh54p0NJKK2kDRPMTGQtOjyQ8JPmGR6VSut9Rx86/nOvKUvD21eHrw6qnSJu
 0PJ2+P0z8O0/ArKOW/Cn8eZNUfG8SFygOs08I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736536790; x=1737141590;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J80hwrHQqzeoTkDC+Lfua1rPRYfFeh84D/XME2XqQ0g=;
 b=TLbRikZeS2AEyor07jJs2XhJmQ8KZjfqLHLIB4qZ4kl7hKs9wKsNnFfY80zCc5Ov/n
 VMOvD2KN2wcYMsHVr86t4I05ieEAE5vbUrQAkLqqMjgMTvhRmJTjUZrS+jDVWH4lem0j
 67lBCGdZJmYOLE72KqRnQeeAvhQ38t2dVXE5co6Nnk2zThMwIXQlFjNmifs79DraXOYh
 wp5My4E15eRe7Kc1oPX37unRpkXZpfbPaWDCeXVaYiQUPp/S2t79Un4aPMt4LcgvG445
 X4mTd8NYwAWgnGqCyut/rVMF5kR+aYYDyJaonm+ijreRUDF61BpZkltPHDH+ojdjIYHi
 Tp6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWICPv4oxvd84XokwCEHubXYn2/2vtN1DT7GZxL1JGLnyheb4sUU4E6PgnKSfR3ftq8uWKafiEqSRg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOV5LkVrm+z1nQ4oLmojELGJ8yoSbVZGm2ULnqZsIwX2xDKie0
 na6IXQ0GcOzjBg6Hk//BMz7HfLgSwqaQlC0ectov5PiVOPizHbsgzoiRWnEYsiI=
X-Gm-Gg: ASbGncvBcIkTkOcDiRbgT8140wrRG2Jgjzj+w9bP3/ctaXXIkWygyFKrV/fisgW4Gnb
 DrvoktBUixtHUNcLEsWX69GRSQJ7OpzgdS3lLu5WYz000Fi0ekqB4De9F9wDxD6s3LayAJ2apKl
 OeDY1qf5V8lveFLMRX0CRTFRhESjAdmJVi/Hq/8urv+n6GgZNkkBs+k7M6aE6x4IW1AtmxZvvzs
 7OTIfplSektA7UuDq3LruYVE4x+VuK+Z955srBqquP5BVuCVwNyts9n/sk0PqApANlm
X-Google-Smtp-Source: AGHT+IHbD9hx5MizCz9A5ppQUUAZ2G7xGpUfk4GcyU7iEMldA5WVYOdJ209mUwDG82HgKY3UKSxngQ==
X-Received: by 2002:a05:600c:1c85:b0:434:a1d3:a331 with SMTP id
 5b1f17b1804b1-436e26f01c1mr99108515e9.22.1736536790079; 
 Fri, 10 Jan 2025 11:19:50 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9dc8802sm60338755e9.10.2025.01.10.11.19.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 11:19:49 -0800 (PST)
Date: Fri, 10 Jan 2025 20:19:47 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Vitaliy Shevtsov <v.shevtsov@maxima.ru>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 syzbot+9a8f87865d5e2e8ef57f@syzkaller.appspotmail.com,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matt Roper <matthew.d.roper@intel.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org, stable@vger.kernel.org
Subject: Re: [PATCH] drm/vblank: fix misuse of drm_WARN in
 drm_wait_one_vblank()
Message-ID: <Z4Fy04u7RjaZIsqI@phenom.ffwll.local>
Mail-Followup-To: Vitaliy Shevtsov <v.shevtsov@maxima.ru>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 syzbot+9a8f87865d5e2e8ef57f@syzkaller.appspotmail.com,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matt Roper <matthew.d.roper@intel.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org, stable@vger.kernel.org
References: <20250110164914.15013-1-v.shevtsov@maxima.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110164914.15013-1-v.shevtsov@maxima.ru>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

On Fri, Jan 10, 2025 at 04:49:13PM +0000, Vitaliy Shevtsov wrote:
> drm_wait_one_vblank() uses drm_WARN() to check for a time-dependent
> condition. Since syzkaller runs the kernel with the panic_on_warn set, this
> causes the entire kernel to panic with a "vblank wait timed out on crtc %i"
> message.
> 
> In this case it does not mean that there is something wrong with the kernel
> but is caused by time delays in vblanks handling that the fuzzer introduces
> as a side effect when fail_alloc_pages, failslab, fail_usercopy faults are
> injected with maximum verbosity. With lower verbosity this issue disappears.

Hm, unless a drivers vblank handling code is extremely fun, there should
be absolutely no memory allocations or user copies in there at all. Hence
I think you're papering over a real bug here. The vblank itself should be
purely a free-wheeling hrtimer, if those stop we have serious kernel bug
at our hands.

Which wouldn't be a big surprise, because we've fixed a _lot_ of bugs in
vkms' vblank and page flip code, it's surprisingly tricky.

Iow, what kind of memory allocation is holding up vkms vblanks?

Cheers, Sima

> drm_WARN() was introduced here by e8450f51a4b3 ("drm/irq: Implement a
> generic vblank_wait function") and it is intended to indicate a failure with
> vblank irqs handling by the underlying driver. The issue is raised during
> testing of the vkms driver, but it may be potentially reproduced with other
> drivers.
> 
> Fix this by using drm_warn() instead which does not cause the kernel to
> panic with panic_on_warn set, but still provides a way to tell users about
> this unexpected condition.
> 
> Found by Linux Verification Center (linuxtesting.org) with Syzkaller.
> 
> Fixes: e8450f51a4b3 ("drm/irq: Implement a generic vblank_wait function")
> Cc: stable@vger.kernel.org
> Reported-by: syzbot+9a8f87865d5e2e8ef57f@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=9a8f87865d5e2e8ef57f
> Signed-off-by: Vitaliy Shevtsov <v.shevtsov@maxima.ru>
> ---
>  drivers/gpu/drm/drm_vblank.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 94e45ed6869d..fa09ff5b1d48 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -1304,7 +1304,8 @@ void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe)
>  				 last != drm_vblank_count(dev, pipe),
>  				 msecs_to_jiffies(100));
>  
> -	drm_WARN(dev, ret == 0, "vblank wait timed out on crtc %i\n", pipe);
> +	if (!ret)
> +		drm_warn(dev, "vblank wait timed out on crtc %i\n", pipe);
>  
>  	drm_vblank_put(dev, pipe);
>  }
> -- 
> 2.47.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

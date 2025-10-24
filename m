Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5E8C06121
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 13:45:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C538610EA78;
	Fri, 24 Oct 2025 11:45:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="e6Xyx2PY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE0AB10EA78
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 11:45:44 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-afcb7ae6ed0so438419166b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 04:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1761306343; x=1761911143; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p6FBIeEJhtBk6yTaDfvQpJNMn8UelVMBFc+lFgE8CvU=;
 b=e6Xyx2PYJAFFjiJfONz6QFmYZ0Tl6zqtIflkFEfWfYyd2qnOpNjQUe9grk9MAXgTf1
 DNArXcP9M9TNtWit19a7c1IqiMIWOPRbWKUKW7LebKKdR0HwTYZDyoZmVhTsGwl69Ll/
 Vqd8O4xc2aEgueH/eWxYQmkgpiK1+KHyPrlrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761306343; x=1761911143;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p6FBIeEJhtBk6yTaDfvQpJNMn8UelVMBFc+lFgE8CvU=;
 b=BB1v07FD1XjPrbF6lHVoO68f1R9hrCImxn77L73tDPAbXBZ8f5vtt+cewT77S/Kjwf
 iCRhkqJpzGfXwE1KMRuItP081bNC+ZE2wJ296ycFomroqZm/MDraMeJF7ylfQXO/kwev
 G06gVkYJAQMliIHjiYQR+6gJuGmJS6wAomeW4ultEhCkIsJl8GnRonHsVX+A/QyBNKU8
 oXBd+XWBlukDb2fAc8LfYZHj/YVQAj55UabXKS0PKwCuk+69qbWfeMgts9esdeprxQnM
 25CYHKeF4LXYUfl2Y26NL8Ai5xaoyqyTUtJkAPcWsHEq9fyJ58Rnt8gtLZEYkCxNr7B/
 zqiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXn/24wIarAxcRRDcvdz0cdtSPFjhZD3vWsiLv8rv0vU00WYWCVCyvnzeD3P1NZkS6v37YKEUibtTI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHTbKJ8RFW8JuEXAwQUUpUrkti0AYyzsufugHLcFfrxOrZM8/d
 yxoZbQIvihfOjiXyNQ17ONb3WKieKgl21WMeJUJs1TxcvpoJte0kr1jcQOqAjU9eGBs=
X-Gm-Gg: ASbGncviRJ49n96DDPPvFQLLVR/KyNu0UaWzTHl8vS/X1W7SH3IfiExVw3sw48jxDdQ
 ovreSVH53VG3nDlTilvhIpfKA1AlV99uXvWj+RjNfgJ1kV4QlhmjU+2QYbv+id2r0OysPz0ZTIP
 EzbFnVFS7PXsJFiSA7jI6TM8KpKHcfYCLjiMdZcWUqMLTZsYgl+eqJ3/pwiqJ3MEomGPPwBR+jP
 UG0s7PK4P5wjbOonpSOKmAicZ9T4e3EpkeLXNfxwqoOJ3Ah2f3XRxHZA0rl4QIqOtSBWVFQxrLY
 iOyuyXjZSGAnb4ZVRbICX5l5cwn3CQpKsnx7VzAKA8j5nRbU70ehes8hh8Hg5kiMcgLmUdiG64P
 rS/pIWdfylBw18h0g8aVtnbvCXO04S1DjwLl7N0FgYUtug9r3gr+QIeJ/QjJPa1lml7WxJXq6N0
 foqBqorFeCPjI=
X-Google-Smtp-Source: AGHT+IE0zXk5rqoOLi9/G0nAmkXgAeq6s0+wLVcAYE6NdPO3i7wFpyzjRZtDYsvoj5daTeKJpRRC8A==
X-Received: by 2002:a17:907:3f21:b0:b57:78fa:db46 with SMTP id
 a640c23a62f3a-b6d6ffe193bmr218870166b.43.1761306343240; 
 Fri, 24 Oct 2025 04:45:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63e3f3349b3sm4138928a12.37.2025.10.24.04.45.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 04:45:42 -0700 (PDT)
Date: Fri, 24 Oct 2025 13:45:41 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Philipp Stanner <phasta@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Maintain spsc_queue through drm_sched
Message-ID: <aPtm5UD4tfVBJzSh@phenom.ffwll.local>
Mail-Followup-To: Philipp Stanner <phasta@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251024081459.164634-2-phasta@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024081459.164634-2-phasta@kernel.org>
X-Operating-System: Linux phenom 6.12.38+deb13-amd64 
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

On Fri, Oct 24, 2025 at 10:15:00AM +0200, Philipp Stanner wrote:
> Back in the day a specialized lockless queue was designed solely for the
> DRM GPU Scheduler: spsc_queue. This queue's only user is drm_sched, and
> there is no dedicated maintainer entry for the queue.
> 
> Add the spsc_queue header to the DRM GPU Scheduler MAINTAINERS' section.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Acked-by: Simona Vetter <simona.vetter@ffwll.ch>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5889df9de210..efafe2b3517c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8580,6 +8580,7 @@ S:	Supported
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	drivers/gpu/drm/scheduler/
>  F:	include/drm/gpu_scheduler.h
> +F:	include/drm/spsc_queue.h
>  
>  DRM GPUVM
>  M:	Danilo Krummrich <dakr@kernel.org>
> -- 
> 2.49.0
> 

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8553936C178
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 11:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B716E922;
	Tue, 27 Apr 2021 09:10:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 501526E922
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 09:10:50 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id d11so822292wrw.8
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 02:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=n7pb8U/vANg8DkgjnfhKWXBOO9anvx207tlIcVrJQJ8=;
 b=F30ycGVHuqTdERjON0BrUg7XctaGeT53f7MbHOVymKhnJD+MIwrvM8DZ10UJJDma4W
 7oVFQ4r4V0H9ULifunx+AR9oycW6WxWVTrSTkx1JDfQy1GHREx7oIBKhD0knlGSLPJRU
 CZsxgvX5Wq53Jr5CRAHqy3uHeJ/rX7KY15MSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=n7pb8U/vANg8DkgjnfhKWXBOO9anvx207tlIcVrJQJ8=;
 b=cejDFjTdBlsLlbvjIUxCmgcqG5dMTsh9AhS0o7mRGXjm+hJ7eRlLcCwq/a3WADJzBn
 Rakvl8bIb8yGWO6mRUm3dHuNwEFimTeKN4xYWhX2PwQHNOK6GKa31SyEXgM6N77qMGNg
 cE7Cu5XCwqPG++mMIQpzz9mAA2Au7fSSHtbmJtlOMgiymR0DHaHSgRe0+DSHtYEn6Nys
 Jc4KXUp6jNHBmI9WoVt53pxWcLqBqZVp1saStt3pGPQgRWZUNSNSQpC1hwt4JE8hT3A/
 RWXFUWG4LHf6A/jgUJOKHf8CfuczLTphuop7Y4PY2Y6TjVxV7Afsoz9R5Com8pLW3A8I
 E9vw==
X-Gm-Message-State: AOAM533W39P25R+tpA+nk1S8UPiUuPqVZjZZ8do5uIGKtALXFcUQVxlZ
 Xdyn51duBEtcn/rCZ9XkATl/Xw==
X-Google-Smtp-Source: ABdhPJxi11Q25W3ep1Deeurj1gNS9KQqebu7z2WSz2/OvIkkKvYk/cXzjlCgzcq92lN90LhBmjvMdg==
X-Received: by 2002:adf:fc85:: with SMTP id g5mr1852842wrr.295.1619514649110; 
 Tue, 27 Apr 2021 02:10:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a2sm3262846wrt.82.2021.04.27.02.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 02:10:48 -0700 (PDT)
Date: Tue, 27 Apr 2021 11:10:46 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: Re: [PATCH v2] drm/drm_file.c: Define drm_send_event_helper() as
 'static'
Message-ID: <YIfVFqUtJ2UDucSJ@phenom.ffwll.local>
Mail-Followup-To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 outreachy-kernel@googlegroups.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
References: <20210426200051.11530-1-fmdefrancesco@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210426200051.11530-1-fmdefrancesco@gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 outreachy-kernel@googlegroups.com, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 26, 2021 at 10:00:51PM +0200, Fabio M. De Francesco wrote:
> drm_send_event_helper() has not prototype, it has internal linkage and
> therefore it should be defined with storage class 'static'.
> 
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
> 
> Changes from v1: As suggested by Daniel Vetter, removed unnecessary
> kernel-doc comments.
> 
>  drivers/gpu/drm/drm_file.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 7efbccffc2ea..a32e0d4f3604 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -774,19 +774,15 @@ void drm_event_cancel_free(struct drm_device *dev,
>  }
>  EXPORT_SYMBOL(drm_event_cancel_free);
>  
> -/**
> +/*
>   * drm_send_event_helper - send DRM event to file descriptor
> - * @dev: DRM device
> - * @e: DRM event to deliver
> - * @timestamp: timestamp to set for the fence event in kernel's CLOCK_MONOTONIC
> - * time domain
>   *
> - * This helper function sends the event @e, initialized with
> + * This helper function sends the event e, initialized with

Sorry I wasn't clear, I don't think there's anything useful at all in this
comment, so best to entirely remove it. Not just the kerneldoc header. Can
you pls respin?
-Daniel

>   * drm_event_reserve_init(), to its associated userspace DRM file.
>   * The timestamp variant of dma_fence_signal is used when the caller
>   * sends a valid timestamp.
>   */
> -void drm_send_event_helper(struct drm_device *dev,
> +static void drm_send_event_helper(struct drm_device *dev,
>  			   struct drm_pending_event *e, ktime_t timestamp)
>  {
>  	assert_spin_locked(&dev->event_lock);
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

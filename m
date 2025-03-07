Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF2FA56902
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 14:32:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF9F10E06D;
	Fri,  7 Mar 2025 13:32:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="bXYWWRZg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FBAC10EB43
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 13:32:24 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43bcbdf79cdso11344545e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 05:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1741354342; x=1741959142; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ChJemeuPEZn6Q+3bqGB9JYOMOwodtQcquQZgShLg1Zw=;
 b=bXYWWRZgO/n/6v7Bj6vOZpeIafgFe67L5gRRqKqmklTlb8PO+IgI7f/yhOQ0rbVUqd
 l1D/yEqcv1Fmsh/ynIo+yJRdCXlteIctb5N77M+ZeJjQg5y5X7ajdnEDCSnb43YNKHiF
 f5jm+EKOwrj9drAZ4x/xsdhL79I1ZFfKZMwTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741354342; x=1741959142;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ChJemeuPEZn6Q+3bqGB9JYOMOwodtQcquQZgShLg1Zw=;
 b=cW6UiIVdfGukKjkHnme+DbhaGXeKDg5MWydW1oXm/h1+cqDAP7qsTeEwGx86IbwMPX
 WUTSIyujSD2sYNchv9WjsgHlOPo31LCkff+e52a1p2+ueJ2TweENaAmIpnp3hq9ytKPO
 QUwMe6SBiRTXXeAPPbtQtzDblHrQxP5lPIslHS0AY27DKlf0BJ6+sBAq0cgkO4BfTb6Q
 bRhzFi2gFFfq/J4I7NX5KLhe/cE6tAVWPwNvoVmCBhxao79z4sswAwArfJ+9G5qTrLcs
 FSissPReR3GwtHWlKR97X0LpKW7vxS8AmQxMT/9lSgj0/CiAYKEw1V1Ef3saHyMsVR4e
 udpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfEYGPIwzGpY26F4KraQWV5au2F9y8kl5MoGrGF1jo95+ObbQpJNMdR+lKj0hnNoKdVcpqdgZdeds=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPHICE9oczRw2jlLrpBhkF/s5mqpxbdEFP4Ps6VlwOfnbVRldE
 QVq3TQyNhBYKMEnreMLwxRotNrMzCBqDPgBAqBEnP201aUUmmLDqZoXcZ8L59F8=
X-Gm-Gg: ASbGncvHnvUC1rNwKP9PH0ePGHKV2b8/jyP2qaSu7Lt2cV2SU8EVI+0IjVJua/8OTrL
 GFOKLcbyKZB6xSKfaINeEbel8chNGrwMf5ahDtVKLpxWJGjnmE1NPauu92edORAoCQLG58Ridmj
 Foxr5Tl494R2wD9OY8H5J5x6B0PMYSHXVtKZAknlXguTgEW6xjEgywOdwiC8CJuoWRJcCqi/4HD
 vVG6fGycs9xsVeZLi7OHoXEpdPgfpsM/NoxBH1TS4fb3REtXZILMn6iMuoCPY9ePKhYFQL9gSri
 JUa5VT6v1CE51mGW4HwFcZCj+JZRen7A5bAJpBKjhbbWdb9WpbhZdesP
X-Google-Smtp-Source: AGHT+IHmcYKDIuPSNh68jIA6DlaFbfhMUgI2zry4iPep8Jq2p3h6kxvi8kZ68dIna+LzL6PgLpJQrw==
X-Received: by 2002:a05:600c:26cc:b0:43b:c390:b77f with SMTP id
 5b1f17b1804b1-43cb91c5affmr16632775e9.26.1741354342489; 
 Fri, 07 Mar 2025 05:32:22 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bdd8db6c7sm51316205e9.22.2025.03.07.05.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 05:32:22 -0800 (PST)
Date: Fri, 7 Mar 2025 14:32:18 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, javierm@redhat.com, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 hdegoede@redhat.com, airlied@redhat.com, sean@poorly.run,
 sumit.semwal@linaro.org, christian.koenig@amd.com, admin@kodeit.net,
 gargaditya08@live.com, jani.nikula@intel.com,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 0/5] drm: Provide a dedicated DMA device for PRIME
 import
Message-ID: <Z8r1Ymc0RzoHEUpG@phenom.ffwll.local>
References: <20250307080836.42848-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307080836.42848-1-tzimmermann@suse.de>
X-Operating-System: Linux phenom 6.12.11-amd64 
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

On Fri, Mar 07, 2025 at 09:03:58AM +0100, Thomas Zimmermann wrote:
> Importing dma-bufs via PRIME requires a DMA-capable hardware device.
> This is not the case for USB, where DMA is performed entirely by the
> USB controller instead of the USB devices.
> 
> Drivers for USB-based hardware maintain their own workarounds for this
> problem. The original idea to resolve this was to provide different
> PRIME helpers for such devices, but the dma-buf code internally assumes
> DMA functionality as well. So that ideas is not realistic.

So dma-buf without dma is doable, but you have to avoid dma_buf_attach.
And that is a lot of surgery in the current prime helpers, since those
assume that an attachment always exists. But dma-buf itself is entirely
fine with cpu-only access through either userspace mmap or kernel vmap.

I think as an interim step this is still good, since it makes the current
hacks easier to find because at least it's all common now.
-Sima

> Let's instead turn the current workaround into a feature. Patch 1 adds a
> dma_dev field to struct drm_device and makes the PRIME code use it. Patches
> 2 to 5 replace related driver code.
> 
> It will also be useful in other code. The exynos and mediatek drivers
> already maintain a dedicated DMA device for non-PRIME code. They could
> likely use dma_dev as well. GEM-DMA helpers currently allocate DMA
> memory with the regular parent device. They should support the dma_dev
> settings as well.
> 
> Tested with udl.
> 
> v2:
> - maintain reference on dma_dev (Jani)
> - improve docs (Maxime)
> - update appletbdrm
> 
> Thomas Zimmermann (5):
>   drm/prime: Support dedicated DMA device for dma-buf imports
>   drm/appletbdrm: Set struct drm_device.dma_dev
>   drm/gm12u320: Set struct drm_device.dma_dev
>   drm/gud: Set struct drm_device.dma_dev
>   drm/udl: Set struct drm_device.dma_dev
> 
>  drivers/gpu/drm/drm_drv.c          | 21 ++++++++++++++
>  drivers/gpu/drm/drm_prime.c        |  2 +-
>  drivers/gpu/drm/gud/gud_drv.c      | 33 ++++++---------------
>  drivers/gpu/drm/gud/gud_internal.h |  1 -
>  drivers/gpu/drm/tiny/appletbdrm.c  | 27 +++++++-----------
>  drivers/gpu/drm/tiny/gm12u320.c    | 46 +++++++++---------------------
>  drivers/gpu/drm/udl/udl_drv.c      | 17 -----------
>  drivers/gpu/drm/udl/udl_drv.h      |  1 -
>  drivers/gpu/drm/udl/udl_main.c     | 14 ++++-----
>  include/drm/drm_device.h           | 41 ++++++++++++++++++++++++++
>  10 files changed, 102 insertions(+), 101 deletions(-)
> 
> -- 
> 2.48.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3B64E9955
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 16:22:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A6BF10EC7D;
	Mon, 28 Mar 2022 14:22:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 812AD10EC6E
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 14:22:54 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id
 bg31-20020a05600c3c9f00b00381590dbb33so8661633wmb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 07:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=0qMi19vJjaBiLl9cST+fBDBfq+lOIRwdfDjsTWbv4+A=;
 b=F6SrEc540oQbJ4koNpIXnsQNTXkFgqI6U/3cDMxUWVC4DyuuAWQRvto0jWiQx+RygR
 az1eH84A1QaOlVPcmO2sktRA6+Oq14ehcGOz9Wipe7TsmT4xpng2OUhP8KJzz26RUyKz
 O3PYrAc8ylFBmFqVK6n23fC3EaqzGbjQigaF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=0qMi19vJjaBiLl9cST+fBDBfq+lOIRwdfDjsTWbv4+A=;
 b=38bQfx9dZKumeClfLkxCWtJqvlpn6l5rk7PzT4i+nTWaS2VL4OjNQUkkiiVbhbLAOU
 UMLH/PFJBB1mXKPWE4d7v2y6ILW95BASQ/84zBJLpemaRVmRTUxK7LE3xW1X/32FW7WC
 4q+wOCgoUWgN+4lraTLG/EkrEANvg2eTPzSkhLtvAF//lZvYZxz/DT8BpgZUHQqKLAtc
 Wdrv4viOTyiWb6qXAO8BrlhOnwp2/nMlAzkOQznFaePqj1cEKDfkcCioDNH99i4opRmH
 MCnoc2DYpWEHeSgn7s7dHv5NqGSQFxO4B5S/eBBJJNpMzShsYZNd4UU5FTYjR3+szg2t
 8cRw==
X-Gm-Message-State: AOAM5319O2SOod0xBaYqaqtxfj4DIaMBhToaoB/P0X6DbMtkJGqASlF6
 eSpJQS7K376/17zj0ZIE6UYHzg==
X-Google-Smtp-Source: ABdhPJy/CXlQv4q32M0C+eVPZAvzKzIlirYkPv5FpU1qt19fZsp2h8xi+lNT8j6s35IT6ynk7FjAsw==
X-Received: by 2002:a05:600c:12c9:b0:38c:b319:6da2 with SMTP id
 v9-20020a05600c12c900b0038cb3196da2mr36510119wmd.125.1648477373048; 
 Mon, 28 Mar 2022 07:22:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a05600c0a0500b0037fa93193a8sm13921845wmp.44.2022.03.28.07.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 07:22:52 -0700 (PDT)
Date: Mon, 28 Mar 2022 16:22:50 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/2] dma-buf: add dma_fence_unwrap
Message-ID: <YkHEutP7ylbVgJjf@phenom.ffwll.local>
References: <20220311110244.1245-1-christian.koenig@amd.com>
 <Yj3e0QjbnPoG7n4I@intel.com>
 <35cc3bd5-c0ab-0bd1-9603-4971234fbcd6@amd.com>
 <338d0623-1161-c958-101f-dc7d8ef12f99@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <338d0623-1161-c958-101f-dc7d8ef12f99@gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: gustavo@padovan.org, dri-devel@lists.freedesktop.org,
 sumit.semwal@linaro.org, linaro-mm-sig@lists.linaro.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 28, 2022 at 12:28:31PM +0200, Christian König wrote:
> Hi Ville & Daniel,
> 
> Am 25.03.22 um 16:28 schrieb Christian König:
> > Am 25.03.22 um 16:25 schrieb Ville Syrjälä:
> > > On Fri, Mar 11, 2022 at 12:02:43PM +0100, Christian König wrote:
> > > > Add a general purpose helper to deep dive into
> > > > dma_fence_chain/dma_fence_array
> > > > structures and iterate over all the fences in them.
> > > > 
> > > > This is useful when we need to flatten out all fences in those
> > > > structures.
> > > > 
> > > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > > One of the dma-buf patches took down Intel CI. Looks like every
> > > machine oopses in some sync_file thing now:
> > > <1>[  260.470008] BUG: kernel NULL pointer dereference, address:
> > > 0000000000000010
> > > <1>[  260.470020] #PF: supervisor read access in kernel mode
> > > <1>[  260.470025] #PF: error_code(0x0000) - not-present page
> > > <6>[  260.470030] PGD 0 P4D 0
> > > <4>[  260.470035] Oops: 0000 [#1] PREEMPT SMP NOPTI
> > > <4>[  260.470040] CPU: 0 PID: 5306 Comm: core_hotunplug Not tainted
> > > 5.17.0-CI-CI_DRM_11405+ #1
> > > <4>[  260.470049] Hardware name: Intel Corporation Jasper Lake
> > > Client Platform/Jasperlake DDR4 SODIMM RVP, BIOS
> > > JSLSFWI1.R00.2385.D02.2010160831 10/16/2020
> > > <4>[  260.470058] RIP: 0010:dma_fence_array_first+0x19/0x20
> 
> I've looked into this and the root cause seems to be that the new code
> doesn't handle dma_fence_arrays with zero elements.
> 
> That is rather easy to fix, but a dma_fence_array with zero number of
> elements is most likely a bug because under the wrong circumstances it can
> create a dma_fence instance which will never signal.
> 
> I've send out a patch on Frinday ([PATCH] dma-buf: WIP dma_fence_array_first
> fix) which avoids the crash and prints a warning if anybody tries to create
> a dma_fence_array with zero length.
> 
> Can you test this?

It's in drm-tip now (in the fixup branch) so drm-tip results should have
the result soonish:

https://intel-gfx-ci.01.org/tree/drm-tip/index.html?

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

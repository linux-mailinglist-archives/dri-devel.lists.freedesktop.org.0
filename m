Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2829642C360
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 16:34:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C7B6E0BC;
	Wed, 13 Oct 2021 14:34:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58E4A6E0BC
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 14:33:59 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id r10so9016614wra.12
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 07:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=pZqawXw6UpoUQ2cej4Qa5A3wHYYjxH4fj/Bl1MwSL8w=;
 b=Jxp0oqznNbBiOsB8cW3LRAMwIa/3afgU8ZgLZdrZuLhGoMoE8fkmlbERISJ9MLYIIX
 eSURghWFTAyYBcOglsYo5NsuO7LtaERM01z84d3hL8yNS4noitygVtxc7N82mPV2f4YE
 fUz3jktTaQzL3LgoBhLm86p8jPrzPjzOs47Zg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=pZqawXw6UpoUQ2cej4Qa5A3wHYYjxH4fj/Bl1MwSL8w=;
 b=09tTNWFyjSbsLtyEkTAltTkuv2NYEN4QZXV5vX0hmpmJPrbsvRrgVpGoHTEDO7fGIn
 rg7xyJGhxTsUbOXW+4B2zWggLE80lAraY+GXvWnhEDgofuKiccmRHJ2TOPew6dQwAoo9
 /yoZzXM27LQtiY3JOEa4wQcfRTz9TboFqFITZsupGxXwTZ+pG/EoW/O2Q4NBHZyQnRpD
 I9nR7DxX8pY5EGOnG3uZVjyZhZRyINl7C1mCDaxOlNImpfj9VgLCrU4YHp2gh3F+ZL3d
 UCVQaMeT1eAVF7kSdCsE5SfPGZqOifQ6DnxcUlCF0kJAdiWQ2BZfcEHHxduxThTpeBO0
 DazQ==
X-Gm-Message-State: AOAM530pVPSsT6aHkyipM7gCug+ER0gaUK7VL2OxygMcXSBmp5p6fyT3
 9OuHCJV3mqUbCl25zjXXjSPzUA==
X-Google-Smtp-Source: ABdhPJxFav47gRkOdlOCldp3JsxK3LwtLHV/iuJaoMI9I8Ony8ciBtEWdYIJdx2vLIhm5tfCvmzJ/g==
X-Received: by 2002:a1c:4d06:: with SMTP id o6mr13098685wmh.137.1634135637872; 
 Wed, 13 Oct 2021 07:33:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n17sm12435286wrq.11.2021.10.13.07.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 07:33:57 -0700 (PDT)
Date: Wed, 13 Oct 2021 16:33:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 matthew.auld@intel.com
Subject: Re: [Intel-gfx] [PATCH 4/6] drm/i915: Add a struct dma_fence_work
 timeline
Message-ID: <YWbuU+09AkjCnGyq@phenom.ffwll.local>
References: <20211008133530.664509-1-thomas.hellstrom@linux.intel.com>
 <20211008133530.664509-5-thomas.hellstrom@linux.intel.com>
 <YWbUZ2A7iLEAaRW+@phenom.ffwll.local>
 <3af6691caadc315b01bf3acdff94ff14f967a4a4.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3af6691caadc315b01bf3acdff94ff14f967a4a4.camel@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 13, 2021 at 04:21:43PM +0200, Thomas Hellström wrote:
> On Wed, 2021-10-13 at 14:43 +0200, Daniel Vetter wrote:
> > On Fri, Oct 08, 2021 at 03:35:28PM +0200, Thomas Hellström wrote:
> > > The TTM managers and, possibly, the gtt address space managers will
> > > need to be able to order fences for async operation.
> > > Using dma_fence_is_later() for this will require that the fences we
> > > hand
> > > them are from a single fence context and ordered.
> > > 
> > > Introduce a struct dma_fence_work_timeline, and a function to
> > > attach
> > > struct dma_fence_work to such a timeline in a way that all previous
> > > fences attached to the timeline will be signaled when the latest
> > > attached struct dma_fence_work signals.
> > > 
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > 
> > I'm not understanding why we need this:
> > 
> > - if we just want to order dma_fence work, then an ordered workqueue
> > is
> >   what we want. Which is why hand-rolling is better than reusing
> >   dma_fence_work for absolutely everything.
> > 
> > - if we just need to make sure the public fences signal in order,
> > then
> >   it's a dma_fence_chain.
> 
> Part of the same series that needs reworking.
> 
> What we need here is a way to coalesce multiple fences from various
> contexts (including both gpu and work fences) into a single fence and
> then attach it to a timeline.

I thought dma_fence_chain does this for you, including coelescing on the
same timeline. Or at least it's supposed to, because if it doesn't you can
produce some rather epic chain explosions with vulkan :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

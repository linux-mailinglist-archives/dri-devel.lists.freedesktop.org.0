Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4251A2AD288
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 10:33:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D8A89950;
	Tue, 10 Nov 2020 09:33:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FCD789950
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 09:33:18 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id s8so4792324wrw.10
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 01:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=D87wf9S+VQgrir5Y3Im/Lq0uDNDXr/OXwkaKziQOSSk=;
 b=eqL1EGtwAV0BAaSSSGWva6fXzKWOb6Oa1XVotzJar+d6PpWo5hMHGFJXoBYXBTBNHo
 f0rstUhe9BA+ySYTaa/XO3JrE0m+/VM4StP0l5JEXeeJjkBiyFQ/+8Bjmyd2465hZ7ED
 2wQc6/2xM8CqGgjA/wixfzu3N3yl/UlEOwSkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=D87wf9S+VQgrir5Y3Im/Lq0uDNDXr/OXwkaKziQOSSk=;
 b=c8UfIAuFHe5CsezkRQEyvgaPm4r1NM9GOeDsXda0+ncK2pEpqk/oKqyuYsDp+22A+V
 dFxnMLX8YZvTwPGEoHMIq/Z4ZVcgH0olHCbpBsHycRVIY/gRT0Io8Ij1nAgGLTg2qm45
 g6U6oFKDQ6YHXtQss0KiTOVZGTO+tmARW4vZmLVqAzZDwlUaokvmwJYVACODLzrXzDJQ
 l0kX+LH5xxo7YjCsVylHRpSF6gGpQfjpMhwDk98rNzZf9pDgrQ/99ZpBlO5S4mYNqB/9
 D1yw2KKSQGqac+sjMYHqGxKuPGLpQfeium1AN1mmzTfnyvdQiZu3FUTiSdYV1xWG5Chp
 frug==
X-Gm-Message-State: AOAM533hkG8BVe/vjBgbYXutyCsZbfqh3cj/6Yrp3e+NeryQhgLab4ED
 9P39U06W9B/G6cF/145x4PhFWw==
X-Google-Smtp-Source: ABdhPJyGbMjLRkYp8QapsVbIw4iwcuqTaZ4I3ctrgmpDvNh11tupCr/ocZW9QLoIqcZCE+molvVXBg==
X-Received: by 2002:adf:8465:: with SMTP id 92mr21597643wrf.50.1605000797075; 
 Tue, 10 Nov 2020 01:33:17 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t12sm16411910wrm.25.2020.11.10.01.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 01:33:16 -0800 (PST)
Date: Tue, 10 Nov 2020 10:33:14 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/2] drm: Build fixes for msm and mediatek
Message-ID: <20201110093314.GE401619@phenom.ffwll.local>
References: <20201109103242.19544-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201109103242.19544-1-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: chunkuang.hu@kernel.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 09, 2020 at 11:32:40AM +0100, Thomas Zimmermann wrote:
> Commit 49a3f51dfeee ("drm/gem: Use struct dma_buf_map in GEM vmap ops and
> convert GEM backends") changed DRM's internal GEM vmap callbacks. Msm and
> mediatek were forgotten during the conversion.
> 
> Thomas Zimmermann (2):
>   drm/msm: Use struct dma_buf_map in GEM vmap ops
>   drm/mediatek: Use struct dma_buf_map in GEM vmap ops

On both:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I guess more motivation to convert drivers over to shmem helpers, if
possible ...
-Daniel

> 
>  drivers/gpu/drm/mediatek/mtk_drm_gem.c | 20 ++++++++++++--------
>  drivers/gpu/drm/mediatek/mtk_drm_gem.h |  4 ++--
>  drivers/gpu/drm/msm/msm_drv.h          |  4 ++--
>  drivers/gpu/drm/msm/msm_gem_prime.c    | 13 ++++++++++---
>  4 files changed, 26 insertions(+), 15 deletions(-)
> 
> --
> 2.29.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

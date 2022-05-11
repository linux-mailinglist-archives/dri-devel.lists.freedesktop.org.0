Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E6A523DED
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 21:49:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C7510E373;
	Wed, 11 May 2022 19:49:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D41210E373
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 19:49:18 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id dk23so6101429ejb.8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 12:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=scfrlHkH4gr1q/2Vy873eAJkRSNR30afFwKPN7GCoao=;
 b=IngW+U5qtZHY4DcxOTzUN2GDFYADPWG82iSiVz4FL+88W2jv9CGanaBZiMz2mODiBf
 hvXHLmFj6B4qA+7AuQKb4O8DGfgSel+scheLAu8ZpdQDog+IocyCodQgiFiLlqRFlm9l
 eQzJgRP6jJToZv0HTe5iFCivtWn0RebokUuhQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=scfrlHkH4gr1q/2Vy873eAJkRSNR30afFwKPN7GCoao=;
 b=613c/05bJGRMDZoD9BBcSTXWBlvswrMELdmZf/kC7+ceLZ81aZiFEy6fpzPgwNCFVe
 EQylPPOte5LpULXO3rwdU+/FtgnUoEsU0wgv9H75I9DoyQJ3bV3Y7YdRRRzoJo3Ch8zq
 Q49+QZsUavT+FEOCqfsIaz6GYWwyRHCP8Qyq9Y7fTMSiyp2fmX5obTei3yGnuyLxPVS5
 qm/we9e4fwe3vGasWGjHqgdF9n/+dS8Gc7tFr29bIJXm8R31eo7bqKjnVTUTSl+S4Wbg
 W7l1GHojQgeEfKcCQfNrC8tVJ1o7vp25HgvBc65+8p+bXUyBFlPbW1ctr3S+swbLRd3q
 /o9A==
X-Gm-Message-State: AOAM530VnYlv8hh5oPaN9sG4eePtPTTPYIhn21slh1/Uz7csUzpDKu9i
 DW3EQ2eSkn3b4mSL6vgJhlEp7g==
X-Google-Smtp-Source: ABdhPJxFCTLYBDo3vkCRhnq8kp97v4f17V+pD4CZjWgX8Ykjs//jm6CsTwIYBaTBgGPQdFqTjejMEg==
X-Received: by 2002:a17:907:1c87:b0:6f0:29ea:cc01 with SMTP id
 nb7-20020a1709071c8700b006f029eacc01mr26242942ejc.671.1652298557052; 
 Wed, 11 May 2022 12:49:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 q21-20020aa7d455000000b0042617ba63d3sm1551385edr.93.2022.05.11.12.49.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 12:49:16 -0700 (PDT)
Date: Wed, 11 May 2022 21:49:14 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: Improve TTMs empty object handling
Message-ID: <YnwTOvGhRV2Efe/j@phenom.ffwll.local>
References: <20220509130951.486344-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220509130951.486344-1-christian.koenig@amd.com>
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
Cc: bob.beckett@collabora.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 09, 2022 at 03:09:40PM +0200, Christian König wrote:
> Hi everyone,
> 
> re-sending this because Daniel was requesting a background why this is
> useful.

Thanks a lot for typing this up. To make sure this isn't lost, could you
add a patch to at least add this as a comment to
ttm_buffer_object.resource, ideally rolling out the kerneldoc scaffolding
for that file while at it and making it kerneldoc?

I think documenting that kind of why&how for key links like
ttm_bo->ttm_resource is really important.

> When TTM creates a buffer this object initially should not have any
> backing store and there no resource object associated with it. The same
> can happen when a driver requests that the backing store of an object is
> destroyed without allocating a new one.
> 
> This is really useful during initial buffer creation as well as temporary
> buffers and page tables which content doesn't need to be preserved when
> they are evicted.
> 
> Currently TTM allocates dummy system resources for that because drivers
> couldn't handle a NULL pointer there. Audit the drivers and then clean
> up TTM to stop making those dummy allocations.

Also I guess this is good prep work for going the other direction, i.e.
allowing more than one ttm_resource per ttm_bo? Or is that all mostly
orthogonal issues that bo:resource 1:N for N=0 has vs 1:N for N > 1?

> Please review and comment,

I'll ... try. But maybe call in some favours from other i915 ttm folks
because I'm just really bad at doing review timeline these days :-/
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

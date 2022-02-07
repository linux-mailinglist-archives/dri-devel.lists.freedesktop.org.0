Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 014704AC9A6
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 20:35:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D00310E40F;
	Mon,  7 Feb 2022 19:35:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA4710F916
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 19:35:10 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id o5so4606394qvm.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Feb 2022 11:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rboH21WjTo7Zpin6WU8ENnQ0jpp7u5mio4o8y61h1qA=;
 b=VXh06X+F+pn59Qpun2TvClz1m9HjYoHgaKOI4lztMUBuiGjL99BTi+BawyYvV0b0yn
 9cSLWqxROo0MXIKlUdGoc9EE7z86T+5wHR+ArNTi5/pxBOI4IWPMYAGwHGhxndX7GpTZ
 fSLPo9Dt2nuunse7tKeQTFKIcNt0CE4F9KzzI4ti/AgzATLEA1o9kXR4ml55Lqmm3Yhc
 wbAAtoduBxENkPGmrIt8sbv6drZp6l+PHJ57vTSVfC3pA1NN7u0WuhjPEL0YmplkLBQR
 SW4HkKGx0mKB2zSYzcqNdqN99/smutm6o5outMhJEioQPVTN6gdzMAHSMaOhfZa5HAKv
 HEcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rboH21WjTo7Zpin6WU8ENnQ0jpp7u5mio4o8y61h1qA=;
 b=EaYairINTH/DpVHREd1SK9FlskTUa9g/WwKGtDyJJUgVJwOmJgiaKb6R0I6b5ADIQb
 VkmNvkk1R7qqTuY6lALtxh7d4bfKADg+M7higT21cYSCPEL3KDM75C/zSXOrmIZlZod/
 CsiI/5Wu8txt5TG7Qy1Dw/0VsbggJ2XG/vSNdZRSIZaToup/Zd9fu9nkFhsOakcT1ygu
 VX71kD/Lx5Eb+XRcpZ9SYNuo9JjGSJy/6+iU4iLx8/Gc4AJPwqyjq+uW5l0quAtlGU94
 62mTNsfP74C6trTZ1VO8m5Trndu5ePxBtXs11U1xBGMmzSEXH2lX6Os9pldJp93mOstB
 KJPA==
X-Gm-Message-State: AOAM530Dlxcan2dVeCPltbBHftgSk+ACTD+KpKqD8EmZqX7UF4OaeSbv
 BxoXJEA010p0TWYtFTVREGo7yenGQABHcQ==
X-Google-Smtp-Source: ABdhPJwMTfVdQUHipluh+Ohvh/JxuUZnOnGCSsmXZVjjmoMxCtKJINJPPq28Adoz05obvbxhEw7l+Q==
X-Received: by 2002:ad4:5942:: with SMTP id eo2mr803626qvb.7.1644262509546;
 Mon, 07 Feb 2022 11:35:09 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129])
 by smtp.gmail.com with ESMTPSA id bj24sm5684465qkb.115.2022.02.07.11.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 11:35:09 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1nH9n2-000I62-Fa; Mon, 07 Feb 2022 15:35:08 -0400
Date: Mon, 7 Feb 2022 15:35:08 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 6/8] mm: don't include <linux/memremap.h> in <linux/mm.h>
Message-ID: <20220207193508.GG49147@ziepe.ca>
References: <20220207063249.1833066-1-hch@lst.de>
 <20220207063249.1833066-7-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220207063249.1833066-7-hch@lst.de>
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
Cc: nvdimm@lists.linux.dev, Ralph Campbell <rcampbell@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, dri-devel@lists.freedesktop.org,
 Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, linux-mm@kvack.org,
 Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>, Dan Williams <dan.j.williams@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 07, 2022 at 07:32:47AM +0100, Christoph Hellwig wrote:
> Move the check for the actual pgmap types that need the free at refcount
> one behavior into the out of line helper, and thus avoid the need to
> pull memremap.h into mm.h.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/arm64/mm/mmu.c                    |  1 +
>  drivers/gpu/drm/amd/amdkfd/kfd_priv.h  |  1 +
>  drivers/gpu/drm/drm_cache.c            |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_dmem.c |  1 +
>  drivers/gpu/drm/nouveau/nouveau_svm.c  |  1 +
>  drivers/infiniband/core/rw.c           |  1 +
>  drivers/nvdimm/pmem.h                  |  1 +
>  drivers/nvme/host/pci.c                |  1 +
>  drivers/nvme/target/io-cmd-bdev.c      |  1 +
>  fs/fuse/virtio_fs.c                    |  1 +
>  include/linux/memremap.h               | 18 ++++++++++++++++++
>  include/linux/mm.h                     | 20 --------------------
>  lib/test_hmm.c                         |  1 +
>  mm/memremap.c                          |  6 +++++-
>  14 files changed, 34 insertions(+), 22 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

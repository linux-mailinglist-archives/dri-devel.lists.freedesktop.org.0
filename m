Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1241A3899
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 19:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 684106EC13;
	Thu,  9 Apr 2020 17:08:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 121356EC13
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 17:08:18 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id b8so2537190pfp.8
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Apr 2020 10:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bQvrRMm1xrJntOiYTsW2Lx5FztmdO0PKJyWqixStKZM=;
 b=SMSIs7zBXCYahuaxAxR+LoWlUnZeIr9zTb2pf+IjX3ssSGO4f/LJ71rs7cs+jdg3O/
 IC2318r5GGhJcELuDl/Ze0uwNXia0OcIjwna6k5blB77mj0Y4XtCiMcbIK8st3rNlQ+e
 osVfwDBBL2rIaU7lZns6ACclP5PoeUh8qegQnwkKt4YjmRM4qERNzP7oJBRDLPzgJljZ
 qy1lKCQ8rFVztGlVzfI/Rkmzy7LEt8LalUdIpP0YHvwYF+bjfC0BE4mFZcwtZ0vyDnDC
 IIFREURwImK0S68ylJtyrSaPkrzDPGZiOeOLFfr2hQJsER61wmNg7KZF/yKS5L8L3Igm
 o7XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=bQvrRMm1xrJntOiYTsW2Lx5FztmdO0PKJyWqixStKZM=;
 b=Dguz1MMziedVNgVAq4/tw4frqd6FGy3wY5Jhi9ZkNMHr9SSkls+7Oar4JgW1FdDE74
 PHcTLDNRDnjgrJ8iipTm2yfLA2V9JlxiT8HKirQp/A0cQ70cOuk6jc2zeFEzh1x39AZS
 CCs946Qwn3APfEyFhgiyP1IxK6yDx+J2bYXR06PR0iKg3uDuON33wPHZC6x0ZMJhnnO9
 5KHAsyqyM+/IksPfRHK4aSQDJ91FbUyvtlpH6JgNmchxyeZtvqNFj8Si4Zh4+9LPL3nu
 6Vwu4aIzYhlQGqksAkj5L5OL9bZFi7uzuWN2lXNC9JcUc2u1TOU32eDEOrmobYYDQwMw
 SDXQ==
X-Gm-Message-State: AGi0PuZH8/BrzrwkKtL0gByKURNNcw/V3moy8SNBXUaH6qhapcq5PCWq
 moz77R2kdBM75/YikVJgnkE=
X-Google-Smtp-Source: APiQypIGXl7ptK897jLts3QdF+EDBFxPJWcYJ6uqbpmOLvOgFWAldqFqZYwLtwgtv4/3t4lh0qbzWw==
X-Received: by 2002:a63:d143:: with SMTP id c3mr401112pgj.171.1586452097545;
 Thu, 09 Apr 2020 10:08:17 -0700 (PDT)
Received: from google.com ([2601:647:4001:3000::50e3])
 by smtp.gmail.com with ESMTPSA id w142sm1167934pff.111.2020.04.09.10.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2020 10:08:16 -0700 (PDT)
Date: Thu, 9 Apr 2020 10:08:13 -0700
From: Minchan Kim <minchan@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 10/28] mm: only allow page table mappings for built-in
 zsmalloc
Message-ID: <20200409170813.GD247701@google.com>
References: <20200408115926.1467567-1-hch@lst.de>
 <20200408115926.1467567-11-hch@lst.de>
 <20200409160826.GC247701@google.com>
 <20200409165030.GG20713@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200409165030.GG20713@hirez.programming.kicks-ass.net>
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
Cc: linux-hyperv@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 "K. Y. Srinivasan" <kys@microsoft.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, x86@kernel.org,
 Christoph Hellwig <hch@lst.de>, Laura Abbott <labbott@redhat.com>,
 Nitin Gupta <ngupta@vflare.org>, Haiyang Zhang <haiyangz@microsoft.com>,
 linaro-mm-sig@lists.linaro.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 sergey.senozhatsky@gmail.com, iommu@lists.linux-foundation.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 09, 2020 at 06:50:30PM +0200, Peter Zijlstra wrote:
> On Thu, Apr 09, 2020 at 09:08:26AM -0700, Minchan Kim wrote:
> > On Wed, Apr 08, 2020 at 01:59:08PM +0200, Christoph Hellwig wrote:
> > > This allows to unexport map_vm_area and unmap_kernel_range, which are
> > > rather deep internal and should not be available to modules.
> > 
> > Even though I don't know how many usecase we have using zsmalloc as
> > module(I heard only once by dumb reason), it could affect existing
> > users. Thus, please include concrete explanation in the patch to
> > justify when the complain occurs.
> 
> The justification is 'we can unexport functions that have no sane reason
> of being exported in the first place'.
> 
> The Changelog pretty much says that.

Okay, I hope there is no affected user since this patch.
If there are someone, they need to provide sane reason why they want
to have zsmalloc as module.

Acked-by: Minchan Kim <minchan@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CFA8B9B2B
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 14:57:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E1A10E87B;
	Thu,  2 May 2024 12:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GGBOF4kk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F84D10E87B
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 12:57:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9C4CB6199B;
 Thu,  2 May 2024 12:57:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAA61C113CC;
 Thu,  2 May 2024 12:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714654648;
 bh=OwqbgGXta9Pf1TpudRH9JFOWS6zl+MgHoogHnhBKWs8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GGBOF4kkklhLBl56r2o43uYC7YyvUQB/QuJJj3UH6bTN7xggBqA5uFxckuBAFvX62
 5TyyKfoxVDdGJpiOwt2bS2XLT6C9WgrU7DhMs4h1FrKFI6INS/X54sSP+dQYEaTQuq
 72LvOOKBn9xF07XWJMyPwVC45Rg2QXN2rWb3AbAVfS0PbXugfpIFwyA0nTwZThPYvs
 L3SJVJPQiMGO/vLJJojAQN6LGBBFMUcy72CiVKtdy9OytnFbUfJOy/iTEsBNlsoC7m
 XexYPYX1owumny5YzAMlf/+GzbEpjVYxdnMRCQteywaxIaUfeqgLrlL7nORybK4xi8
 x3G2HzY5yNZ1g==
Date: Thu, 2 May 2024 15:57:24 +0300
From: Leon Romanovsky <leon@kernel.org>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v1 2/2] vfio/pci: Allow MMIO regions to be exported
 through dma-buf
Message-ID: <20240502125724.GI100414@unreal>
References: <20240422063602.3690124-1-vivek.kasireddy@intel.com>
 <20240422063602.3690124-3-vivek.kasireddy@intel.com>
 <20240430162450.711f4616.alex.williamson@redhat.com>
 <20240501125309.GB941030@nvidia.com>
 <IA0PR11MB718509BB8B56455710DB2033F8182@IA0PR11MB7185.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA0PR11MB718509BB8B56455710DB2033F8182@IA0PR11MB7185.namprd11.prod.outlook.com>
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

On Thu, May 02, 2024 at 07:50:36AM +0000, Kasireddy, Vivek wrote:
> Hi Jason,

<...>

> > I'd rather we stick with the original design. Leon is working on DMA
> > API changes that should address half the issue.
> Ok, I'll keep an eye out for Leon's work.

The code for v1 is here:
https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git/log/?h=dma-split-v1
It is constantly rebased till we will be ready to submit it.

v0 is here:
https://lore.kernel.org/linux-rdma/cover.1709635535.git.leon@kernel.org/

Thanks

> 
> Thanks,
> Vivek
> 
> > 
> > Jason
> 

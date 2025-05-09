Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE4DAB1A90
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 18:34:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 539DA10EA82;
	Fri,  9 May 2025 16:34:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TnxVfTSj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF9010EA82
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 16:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746808454; x=1778344454;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wpGjb75UGNI5SN/+un5W0Q7nrSwwQCwyXAhHTWzF7Jc=;
 b=TnxVfTSjghvoXC05tlQkUNu5X5fBJVsf77u1ygk4ZmXFiHtu/eR2Tou4
 1Tz6IhfeqwTpNb0T5jHIobvH1MmdhWPxAw8Va2DmpBSfWSuTwkVaN1+3H
 oE6DCV5fmNWJte1yiVSWzTM6VsXtK422htNFvXSFEEcak+y64f0WRuoVa
 8jwMnl0CeiNNeOmIzEjIvrdCO4MQYHcnPVCQs48p1lpAaYzI5Q6XOBq2C
 ab81VBmwQ2oYV7hLbLbZt8wocmv+t00laLw8VYd0I4C0RWHiEQr/GmTn7
 7PAExiCqSNjI1hG8wPwtbw8hEMu2KhJK5k7pjNy+YIFiUIwB3cf2cLuJo g==;
X-CSE-ConnectionGUID: TUKd5M/eT1yLghK6QryDdA==
X-CSE-MsgGUID: lqdfc7RBTaevZiPF+olgmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="52298067"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; d="scan'208";a="52298067"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 09:34:14 -0700
X-CSE-ConnectionGUID: qFZqHKY6TKC22AE4ddjwoQ==
X-CSE-MsgGUID: CW04MrzJTdexiH1jBKMEbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; d="scan'208";a="141622357"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost)
 ([10.239.159.165])
 by orviesa004.jf.intel.com with ESMTP; 09 May 2025 09:34:09 -0700
Date: Sat, 10 May 2025 00:28:48 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 jgg@nvidia.com, vivek.kasireddy@intel.com, dan.j.williams@intel.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com
Subject: Re: [RFC PATCH 00/12] Private MMIO support for private assigned dev
Message-ID: <aB4tQHmHzHooDeTE@yilunxu-OptiPlex-7050>
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <371ab632-d167-4720-8f0d-57be1e3fee84@amd.com>
 <4b6dc759-86fd-47a7-a206-66b25a0ccc6d@amd.com>
 <c10bf9c2-e073-479d-ad1c-6796c592d333@amd.com>
 <aB3jLmlUKKziwdeG@yilunxu-OptiPlex-7050>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aB3jLmlUKKziwdeG@yilunxu-OptiPlex-7050>
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

On Fri, May 09, 2025 at 07:12:46PM +0800, Xu Yilun wrote:
> On Fri, May 09, 2025 at 01:04:58PM +1000, Alexey Kardashevskiy wrote:
> > Ping?
> 
> Sorry for late reply from vacation.
> 
> > Also, since there is pushback on 01/12 "dma-buf: Introduce dma_buf_get_pfn_unlocked() kAPI", what is the plan now? Thanks,
> 
> As disscussed in the thread, this kAPI is not well considered but IIUC
> the concept of "importer mapping" is still valid. We need more
> investigation about all the needs - P2P, CC memory, private bus
> channel, and work out a formal API.
> 
> However in last few months I'm focusing on high level TIO flow - TSM
> framework, IOMMUFD based bind/unbind, so no much progress here and is
> still using this temporary kAPI. But as long as "importer mapping" is
> alive, the dmabuf fd for KVM is still valid and we could enable TIO
> based on that.

Oh I forgot to mention I moved the dmabuf creation from VFIO to IOMMUFD
recently, the IOCTL is against iommufd_device. According to Jason's
opinion [1], TSM bind/unbind should be called against iommufd_device,
then I need to do the same for dmabuf.  This is because Intel TDX
Connect enforces a specific operation sequence between TSM unbind & MMIO
unmap:

  1. STOP TDI via TDISP message STOP_INTERFACE
  2. Private MMIO unmap from Secure EPT
  3. Trusted Device Context Table cleanup for the TDI
  4. TDI ownership reclaim and metadata free

That makes TSM unbind & dmabuf closely correlated and should be managed
by the same kernel component.

IIUC, the suggested flow is VFIO receives a CC capable flag and propagate
to IOMMUFD, which means VFIO hand over device's MMIO management & CC
management to IOMMUFD.

[1]: https://lore.kernel.org/all/20250306182614.GF354403@ziepe.ca/

Thanks,
Yilun

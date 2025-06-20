Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80182AE1257
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 06:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 828F310EAA4;
	Fri, 20 Jun 2025 04:29:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B2yHGDVB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE7710EAA4
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 04:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750393757; x=1781929757;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=It+X+LhsWdDOwjdBav4EX8XJ1EMBhJqb7BxwKfvsvlY=;
 b=B2yHGDVBw5E6+LXwYfrOyPMN6j+M9JfFgmVj3Uw4DnbWxQ52ppnAvpr4
 vUWZ6I6W1oeKfkWWnegU9V2Yi3uQvea/9VcE4iM24fVaTqk9Q6KQPQksN
 TTopsJoXlG8Ukn+Dgs645O3nmacM+lW6aIXAlfG+lWj0A7D3DfxyzLCbB
 +5UZhEhvd/8nMrH6pBnh5yUWWSx3M9RzsBnn75dUvwhPdHftaYuNVo0CZ
 XFRBarZjGhM3C5o4zkMGEP+uhO+8PLE/1DhI4TMTpYv6XEtxpTVLa/y0E
 1P7HYplwxLhsXAA57bHYZcznSy+ewc271G0D6xcjB/9NL+h5A1rSIT8Qr Q==;
X-CSE-ConnectionGUID: K8cel3wJRXySq/onKQCXHA==
X-CSE-MsgGUID: jJ8SEJOEQi6+x3e9ADlcSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="40257709"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="40257709"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 21:29:17 -0700
X-CSE-ConnectionGUID: rWOJemhGSAKbmpWp/SKpxg==
X-CSE-MsgGUID: 6a20+jVmRau5+Pgdg0r32w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="154817573"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost)
 ([10.239.159.165])
 by fmviesa003.fm.intel.com with ESMTP; 19 Jun 2025 21:29:11 -0700
Date: Fri, 20 Jun 2025 12:21:49 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: kvm@vger.kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 dan.j.williams@intel.com, aik@amd.com, linux-coco@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, vivek.kasireddy@intel.com,
 yilun.xu@intel.com, linux-kernel@vger.kernel.org, lukas@wunner.de,
 yan.y.zhao@intel.com, daniel.vetter@ffwll.ch, leon@kernel.org,
 baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com, linux-pci@vger.kernel.org, zhiw@nvidia.com,
 simona.vetter@ffwll.ch, shameerali.kolothum.thodi@huawei.com,
 aneesh.kumar@kernel.org, iommu@lists.linux.dev, kevin.tian@intel.com
Subject: Re: [RFC PATCH 00/30] Host side (KVM/VFIO/IOMMUFD) support for TDISP
 using TSM
Message-ID: <aFTh3YASDNtyAc+k@yilunxu-OptiPlex-7050>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
 <20250602133727.GD233377@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602133727.GD233377@nvidia.com>
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

On Mon, Jun 02, 2025 at 10:37:27AM -0300, Jason Gunthorpe wrote:
> On Thu, May 29, 2025 at 01:34:43PM +0800, Xu Yilun wrote:
> 
> > This series has 3 sections:
> 
> I really think this is too big to try to progress, even in RFC
> form.

Sorry, I missed this message...

Yeah, I just try to give a overview of what components we need, what the
expect flow would be like for the first time. Also vendors need as much
components as possible to enable their own HW and verify this flow works.

We could split into small topics then.

>  
> > Patch 1 - 11 deal with the private MMIO mapping in KVM MMU via DMABUF.
> > Leverage Jason & Vivek's latest VFIO dmabuf series [3], see Patch 2 - 4.
> > The concern for get_pfn() kAPI [4] is not addressed so are marked as
> > HACK, will investigate later.
> 
> I would probably split this out entirely into its own topic. It
> doesn't seem directly related to TSM as KVM can use DMABUF for good
> reasons independently .

Yes, since I'm not work on improving this for now, I'll not include this
part next time. Will start independent thread if there is update.

> 
> > Patch 12 - 22 is about TSM Bind/Unbind/Guest request management in VFIO
> > & IOMMUFD. Picks some of Shameer's patch in [5], see Patch 12 & 14.
> 
> This is some reasonable topic on its own after Dan's series

OK, I'll just focus on this for next version.

>  
> > Patch 23 - 30 is a solution to meet the TDX specific sequence
> > enforcement on various device Unbind cases, including converting device
> > back to shared, hot unplug, TD destroy. Start with a tdx_tsm driver
> > prototype and finally implement the Unbind enforcement inside the
> > driver. To be honest it is still awkward to me, but I need help.
> 
> Then you have a series or two to implement TDX using the infrastructure.

Yeah, this should happen after "IOMMUFD for trusted".

Thanks,
Yilun

> 
> Jason

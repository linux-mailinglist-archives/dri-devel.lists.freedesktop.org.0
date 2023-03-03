Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9686A98E3
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 14:49:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52DE910E5E5;
	Fri,  3 Mar 2023 13:49:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C729310E5E5
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 13:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677851377; x=1709387377;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1DcRojDhcYd/5hgYkX/D/eFp0Loh8mlANtVNOfmijZA=;
 b=YTHuVoNqhK38NeDzYhkIGtOfQw94j04v9DWFk73htwhYlIP+ZdI2lcyt
 7WVJSZsHLqtIlCx5vGMvbliJK1RnLyKfYLGOqinCJuq6ghj/HL+ko78Ed
 XgB66sZDAZzOXhdC2YBI4vsMmHymFa/l9rwFlX+M2sN/q3bH96FvFcyIX
 YjKSGlqRjwye3K3ouHxp83WlsCPWIaULUH4XSkXq4mHUavKycYzaRtDDF
 0yoEd2girmkHTonKX9C3x9S8PTUiHTkcX5lpRif0ZwH/9YOIJZBZTvcxL
 7xa5Gjq60HboyhKpvH1I5v056tUBdgpYwTLcKK93/qLpAMoPOS+fhSK9/ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="318867456"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="318867456"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 05:49:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="705648522"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="705648522"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 05:49:34 -0800
Date: Fri, 3 Mar 2023 14:49:32 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH v2 5/8] accel/qaic: Add datapath
Message-ID: <20230303134932.GF3963532@linux.intel.com>
References: <1675698105-19025-1-git-send-email-quic_jhugo@quicinc.com>
 <1675698105-19025-6-git-send-email-quic_jhugo@quicinc.com>
 <20230224152546.GB3547587@linux.intel.com>
 <00914fa9-8618-a3ef-d3c5-2a3bba68fa1f@quicinc.com>
 <20230227171454.GF3547587@linux.intel.com>
 <83543d98-e624-fadc-7f92-490efa602805@quicinc.com>
 <20230301170514.GB3963532@linux.intel.com>
 <5eed22fc-cd22-8186-de08-98827852a518@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5eed22fc-cd22-8186-de08-98827852a518@quicinc.com>
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
Cc: linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 ogabbay@kernel.org, dri-devel@lists.freedesktop.org, quic_ajitpals@quicinc.com,
 quic_pkanojiy@quicinc.com, quic_carlv@quicinc.com,
 jacek.lawrynowicz@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 01, 2023 at 11:14:35AM -0700, Jeffrey Hugo wrote:
> On 3/1/2023 10:05 AM, Stanislaw Gruszka wrote:
> > On Wed, Mar 01, 2023 at 09:08:03AM -0700, Jeffrey Hugo wrote:
> > > > This looks a bit suspicious. Are you sure you can modify
> > > > sg->dma_address and still use it as valid value ?
> > > 
> > > A single entry in the sg table is a contiguous mapping of memory.  If it
> > > wasn't contiguous, it would have to be broken up into multiple entries.  In
> > > the simple case, a driver is going to take the dma_address/len pair and hand
> > > that directly to the device.  Then the device is going to access every
> > > address in that range.
> > > 
> > > If the device can access every address from dma_address to dma_address +
> > > len, why can't it access a subset of that?
> > 
> > Required address alignment can be broken. Not sure if only that.
> 
> AIC100 doesn't have required alignment.  AIC100 can access any 64-bit
> address, at a byte level granularity.  The only restriction AIC100 has is
> that the size of a transfer is restricted to a 32-bit value, so max
> individual transfer size of 4GB.  Transferring more than 4GB requires
> multiple transactions.
> 
> > > > > Are you suggesting renaming
> > > > > this function?  I guess I'm not quite understanding your comment here. Can
> > > > > you elaborate?
> > > > 
> > > > Renaming would be nice. I was thinking by simplifying it, not sure
> > > > now if that's easy achievable, though.
> > > 
> > > Ok.  I'll think on this.
> > 
> > Maybe this function could be removed ? And create sg lists
> > that hardware can handle without any modification.
> > Just idea to consider, not any requirement.
> 
> Ok, so this is part of our "slicing" operation, and thus required.
> 
> Maybe how slicing works is not clear.
> 
> Lets say that we have a workload on AIC100 that can identify a license plate
> in a picture (aka lprnet).  Lets assume this workload only needs the RGB
> values of a RGBA file (a "jpeg" we are processing).
> 
> Userspace allocates a BO to hold the entire file.  A quarter of the file is
> R values, a quarter is G values, etc.  For simplicity, lets assume the R
> values are all sequentially listed, then the G values, then the B values,
> finally the A values.  When we allocate the BO, we map it once.  If we have
> an IOMMU, this optimizes the IOMMU mappings.  BOs can be quite large.  We
> have some test workloads based on real world workloads where each BO is
> 16-32M in size, and there are multiple BOs.  I don't want to map a 32M BO N
> duplicate times in the IOMMU.
> 
> So, now userspace slices the BO.  It tells us we need to transfer the RGB
> values (the first 75% of the BO), but not the A values.  So, we create a
> copy of the mapped SG and edit it to represent this transfer, which is a
> subset of the entire BO.  Using the slice information and the mapping
> information, we construct the DMA engine commands that can be used to
> transfer the relevant portions of the BO to the device.
> 
> It sounds like you are suggesting, lets flip this around.  Don't map the
> entire BO once.  Instead, wait for the slice info from userspace, construct
> a sg list based on the parts of the BO for the slice, and map that.  Then
> the driver gets a mapped SG it can just use.  The issue I see with that is
> slices can overlap.  You can transfer the same part of a BO multiple times.
> Maybe lprnet has multiple threads on AIC100 where thread A consumes R data,
> thread B consumes R and G data, and thread C consumes B data.  We need to
> transfer the R data twice to different device locations so that threads A
> and B can consume the R data independently.
> 
> If we map per slice, we are going to map the R part of the BO twice in the
> IOMMU.  Is that valid?  It feels possible that there exists some IOMMU
> implementation that won't allow multiple IOVAs to map to the same DDR PA
> because that is weird and the implementer thinks its a software bug.  I
> don't want to run into that.  Assuming it is valid, that is multiple
> mappings in the IOMMU TLB which could have been a single mapping.  We are
> wasting IOMMU resources.
> 
> There are some ARM systems we support with limited IOVA space in the IOMMU,
> and we've had some issues with exhausting that space.  The current
> implementation is influenced by those experiences.

Ok, then the current implementation seems reasonable.
Thanks for explanation!

Regards
Stanislaw

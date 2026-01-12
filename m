Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09584D11B6B
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 11:06:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6479210E2CC;
	Mon, 12 Jan 2026 10:06:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BCv5OnK2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2A0B10E316;
 Mon, 12 Jan 2026 10:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768212388; x=1799748388;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iSWIcO1i5jggJsyD+MD4zjW6/xb5F0GUSvfS1ASBirU=;
 b=BCv5OnK21Vk6vsMA0w2Cu9on8gAX9s29iIOdq9W7pzXRA93lRAD6KnXn
 7FZ1GseXtc/FWRnSyqs3Sya4noeJjn2vzMlY9Z4U59/8uUdqVNMJzxny2
 sWegYiLpUHTUsF78gWGiQIvdCAfNsXPT+Bo5JsVxhVnnruxfEOnvNCHN+
 rl7Si5HhlNPboyqs4QNwN8wksBKYQa1iVpOv7B+S0iGRAA92t5o8aG6by
 fdM8GUMyaco1fx+B0BjdVH7bzyY0WB0XRFVEvFu6Y4xxm0Xgi/nSb+ftd
 MRB6cfYfH5XjKEK1eXhOQimLpMTj9nV6f6uQpP03hlyxX04Cpl5tfQXNN A==;
X-CSE-ConnectionGUID: VGfsrGbESre9kE24E91QjA==
X-CSE-MsgGUID: djNHhyA9SJCHWmkRhg+9Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69410997"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="69410997"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 02:06:28 -0800
X-CSE-ConnectionGUID: nHf53CDnRn+XnV/kZSminw==
X-CSE-MsgGUID: esE46Hq9RtCjDvXRZ4/CYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="204070633"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 02:06:24 -0800
Date: Mon, 12 Jan 2026 11:06:20 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 lukas@wunner.de, simona.vetter@ffwll.ch, airlied@gmail.com,
 pratik.bari@intel.com, joshua.santosh.ranjan@intel.com,
 ashwin.kumar.kulkarni@intel.com, shubham.kumar@intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v3 4/4] drm/xe/xe_hw_error: Add support for PVC SOC errors
Message-ID: <aWTHnOhn7NS-bN5F@black.igk.intel.com>
References: <20251205083934.3602030-6-riana.tauro@intel.com>
 <20251205083934.3602030-10-riana.tauro@intel.com>
 <aT_oXo97R3GyWgNk@black.igk.intel.com>
 <55c9e0d6-42e7-4736-a5d1-29ac6933e067@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55c9e0d6-42e7-4736-a5d1-29ac6933e067@intel.com>
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

On Mon, Jan 12, 2026 at 10:15:58AM +0530, Riana Tauro wrote:
> On 12/15/2025 4:22 PM, Raag Jadav wrote:
> > On Fri, Dec 05, 2025 at 02:09:36PM +0530, Riana Tauro wrote:
> > > Report the SOC nonfatal/fatal hardware error and update the counters.

...

> > > +	master_global_errstat = xe_mmio_read32(mmio, SOC_GLOBAL_ERR_STAT_REG(base, severity));
> > > +	if (master_global_errstat & SOC_SLAVE_IEH) {
> > > +		slave_global_errstat = xe_mmio_read32(mmio,
> > > +						      SOC_GLOBAL_ERR_STAT_REG(slave_base, severity));
> > > +		if (slave_global_errstat & SOC_IEH1_LOCAL_ERR_STATUS) {
> > > +			slave_local_errstat = xe_mmio_read32(mmio,
> > > +							     SOC_LOCAL_ERR_STAT_REG(slave_base,
> > > +										    severity));
> > > +
> > > +			for_each_set_bit(regbit, &slave_local_errstat, XE_RAS_REG_SIZE) {
> > > +				if (severity == DRM_XE_RAS_ERROR_FATAL)
> > 
> > Shouldn't this condition be outside the loop? Also, should we not log it
> > after we clear the bits?
> 
> Yeah condition can be.
> 
> But why should we log it after? Anyway the rest of the registers need to
> cleared too to unmask

Yes, doesn't make much functional difference but the rule of thumb is to

1. Execute
2. Log

so just ordering change, but upto you.

Raag

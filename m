Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3789729628
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 12:00:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC49F10E676;
	Fri,  9 Jun 2023 10:00:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2471310E676;
 Fri,  9 Jun 2023 10:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686304812; x=1717840812;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5IFngkZie9+cvtvkRd8SsyP8FagkAPqJVEZ9YPHSJys=;
 b=i3ISsklXuFq/KstXipMU0l8JZCW8mJpk8lLFGaKnMiBgVbZdCDEwWCJG
 qBaHmOCjeF/FzJ146OqH6wnabj4o0rRBhZOfs0eB/Eb1JQLW+45eH4U3o
 2jjCkcpv5R3oZaAuANIfMBvwfU/oOff+dcanEkqReDhOssj0pktYNZW3Q
 U257XSPJl76BsNoydWNDPGX8U6L5ZoSV8xlilNFJZhHFkX+k+3THgs7P5
 YT9gZ5F9kU3ITaHfcxVw81V1oeYe8wkOBv6h/h2k4j50Zzg0UWro1ZAi7
 nvbklwW+UEsAAaQoF1sMXwrDx9AoYNrb09QL4Iv49p6uX8rgCjZgjs5j9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="357564945"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; d="scan'208";a="357564945"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 03:00:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="854692814"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; d="scan'208";a="854692814"
Received: from lmirabel-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.251.211.108])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 03:00:05 -0700
Date: Fri, 9 Jun 2023 11:59:56 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Zhang, Carl" <carl.zhang@intel.com>
Subject: Re: [PATCH v17 1/1] drm/i915: Allow user to set cache at BO creation
Message-ID: <ZIL4HNonFakDqJtB@ashyti-mobl2.lan>
References: <20230606100042.482345-1-andi.shyti@linux.intel.com>
 <20230606100042.482345-2-andi.shyti@linux.intel.com>
 <ec219702-8608-e919-cbcd-f271646845d1@linux.intel.com>
 <ZH8H3ovN20uVO+tK@ashyti-mobl2.lan>
 <168604992363.24014.14317865195655387952@jlahtine-mobl.ger.corp.intel.com>
 <ZH8VLY8a9d7i96cw@ashyti-mobl2.lan>
 <PH0PR11MB5579C119BEF9653A9A20CC4E8753A@PH0PR11MB5579.namprd11.prod.outlook.com>
 <ZIARdL44LW5BEysa@ashyti-mobl2.lan>
 <PH0PR11MB55793C2F3B66887186CF68198753A@PH0PR11MB5579.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH0PR11MB55793C2F3B66887186CF68198753A@PH0PR11MB5579.namprd11.prod.outlook.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, "Gu,
 Lihao" <lihao.gu@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>, "Justen,
 Jordan L" <jordan.l.justen@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, "Yang, Fei" <fei.yang@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Carl,

> > > besides this, ask a dumb question.
> > > How we retrieve the pat_index from a shared resource though dma_buf fd?
> > > maybe we need to know whether it could be CPU cached if we want map it.
> > > Of course, looks there are no real usage to access it though CPU.
> > > Just use it directly without any pat related options ?
> > 
> > I am not understanding. Do you want to ask the PAT table to the driver? Are
> > you referring to the CPU PAT index?
> > 
> > In any case, if I understood correctly, you don't necessarily always need to
> > set the PAT options and the cache options will fall into the default values.
> > 
> > Please let me know if I haven't answered the question.
> > 
> 
> If mesa create a resource , then use DRM_IOCTL_PRIME_HANDLE_TO_FD convert it to a dma fd. 
> Then share it to media, media use DRM_IOCTL_PRIME_FD_TO_HANDLE convert it to a gem bo. 
> But media does not know the PAT index , because mesa create it and set it. 
> So, if media want to call DRM_IOCTL_I915_GEM_MMAP_OFFSET, media does not know whether it could be WB.

That's a good point. To be honest I am not really sure how this
is handled.

Fei, Jordan? Do you have suggestion here?

Andi

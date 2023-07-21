Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB3275C3F6
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 12:02:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F9FB10E644;
	Fri, 21 Jul 2023 10:02:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E34310E642;
 Fri, 21 Jul 2023 10:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689933747; x=1721469747;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=L39xNoLTuiFqWrU9U5/rPXL0nELBWgjHwigd09/msqU=;
 b=RyjyQEm6s8SP1PK5LVtTo4z++VvB60c3cXVtnP5FsfW5R2nQV3/1OmGT
 qoVmbzqsXV3cFXoaxMPeF6eihaYmG2P6zeKSczBGmocuqBbNMDO+ZfA18
 gGpJX069NZ+b/DU3dEFSL0xrQbsZLwd4jRlLcRoYf5qVMXSBLcXlQMog9
 OF9JPhLmg/019yHLChM5RkKoGQxv5DILNEJn5PgKU57QpocOaUesAkS24
 solKDFVf9zjmyiwvkrik9zqUSmfdTX4zkcff9Mat6azk1cecY83V71Opc
 K1hvTG7fo/wL9sIpaDLExMTuEVdF6YDc3ETP2RJvpkdo8KP1RJwN2n/bw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="346579805"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="346579805"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 03:02:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="838488706"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="838488706"
Received: from hbockhor-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.54.104])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 03:02:23 -0700
Date: Fri, 21 Jul 2023 12:02:20 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Krzysztofik, Janusz" <janusz.krzysztofik@intel.com>
Subject: Re: [v7,2/9] drm/i915: Add the has_aux_ccs device property
Message-ID: <ZLpXrADgrQjybo0/@ashyti-mobl2.lan>
References: <20230720210737.761400-3-andi.shyti@linux.intel.com>
 <2423957.jE0xQCEvom@jkrzyszt-mobl2.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2423957.jE0xQCEvom@jkrzyszt-mobl2.ger.corp.intel.com>
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>, linux-stable <stable@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 dri-evel <dri-devel@lists.freedesktop.org>, "Hajda,
 Andrzej" <andrzej.hajda@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>, "Das, Nirmoy" <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Janusz,

On Fri, Jul 21, 2023 at 09:25:03AM +0000, Krzysztofik, Janusz wrote:
> Hi Andy,
> 
> On Thursday, 20 July 2023 23:07:30 CEST Andi Shyti wrote:
> > We always assumed that a device might either have AUX or FLAT
> > CCS, but this is an approximation that is not always true 
> 
> If there exists a device that can have CCSs that fall into either none or both 
> of those categories then I think we should have that device or two listed here 
> as an example, regardless of deducible from the change or not.  Or if there 
> are no such devices so far, but we are going to introduce some, then I think 
> we should provide that information here.

true! I will improve the commit log.

[...]

> > --- a/drivers/gpu/drm/i915/i915_pci.c
> > +++ b/drivers/gpu/drm/i915/i915_pci.c
> > @@ -643,7 +643,8 @@ static const struct intel_device_info jsl_info = {
> >  	TGL_CACHELEVEL, \
> >  	.has_global_mocs = 1, \
> >  	.has_pxp = 1, \
> > -	.max_pat_index = 3
> > +	.max_pat_index = 3, \
> > +	.has_aux_ccs = 1
> 
> NIT: Can we please have the last element also followed by comma, like in other 
>      places (e.g. see below)?  That will simplify future patches.
> 
> Other than that, LGTM.

As Andrzej and Matt suggested I will take another approach, i.e.
adding a helper function that tells whether the aux invalidation
is necessary or not.

Thanks,
Andi

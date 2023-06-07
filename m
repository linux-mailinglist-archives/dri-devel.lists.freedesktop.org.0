Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DCC72533B
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 07:11:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39FB610E421;
	Wed,  7 Jun 2023 05:11:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D083310E421;
 Wed,  7 Jun 2023 05:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686114686; x=1717650686;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LQGazGoExlzMMZE6XgwTj1RStrXPNZolc/UO6bZR+9U=;
 b=NzIZ+jetonZBxQ0eECzY52JR16kXFTM3FFoY3DTY2TME07UYJVaLFoG8
 oFNGvv0BFdTHseS4jsvi6xDRDrvbsJiGRUokjG8QbCOoBqAC1oCQrHIQn
 6VzgPFlC6ur1aHaP6iq0tXPkpFMB0uO70iJ4CGmTeTW0woF74STe7gOZh
 M8bSMP0hsMEQQGJ+k7XCrEFyIvozClSZH4DXRgX0r7OSbyjmf75M38pOf
 mO0+yx5wo8EHi7nKxUSb15Ek/oqwZ/DpJSDo2mgmsBdeoTzAwq0vdJ1kH
 43jKpQgHMgJK13SBXv9VvOPY5l5CtzATvqtK+/9sOaoadS54tRSn6sWx4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="354375381"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="354375381"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 22:11:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="774368665"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="774368665"
Received: from jjrevuel-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.249.42.202])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 22:11:22 -0700
Date: Wed, 7 Jun 2023 07:11:16 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Zhang, Carl" <carl.zhang@intel.com>
Subject: Re: [PATCH v17 1/1] drm/i915: Allow user to set cache at BO creation
Message-ID: <ZIARdL44LW5BEysa@ashyti-mobl2.lan>
References: <20230606100042.482345-1-andi.shyti@linux.intel.com>
 <20230606100042.482345-2-andi.shyti@linux.intel.com>
 <ec219702-8608-e919-cbcd-f271646845d1@linux.intel.com>
 <ZH8H3ovN20uVO+tK@ashyti-mobl2.lan>
 <168604992363.24014.14317865195655387952@jlahtine-mobl.ger.corp.intel.com>
 <ZH8VLY8a9d7i96cw@ashyti-mobl2.lan>
 <PH0PR11MB5579C119BEF9653A9A20CC4E8753A@PH0PR11MB5579.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH0PR11MB5579C119BEF9653A9A20CC4E8753A@PH0PR11MB5579.namprd11.prod.outlook.com>
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

On Wed, Jun 07, 2023 at 03:40:20AM +0000, Zhang, Carl wrote:
> Media driver reverted previous patches, and file a new  PR
> https://github.com/intel/media-driver/pull/1680
> will hold this PR until the uapi changes appear in drm_next.

That's great, thanks a lot for the quick actions here.

Before pushing I am going to replace the Media part in the commit
log with the following sentence:

"
The media driver supprt has bin submitted in this merge request:
https://github.com/intel/media-driver/pull/1680
"

> besides this, ask a dumb question. 
> How we retrieve the pat_index from a shared resource though dma_buf fd?
> maybe we need to know whether it could be CPU cached if we want map it.
> Of course, looks there are no real usage to access it though CPU. 
> Just use it directly without any pat related options ?

I am not understanding. Do you want to ask the PAT table to the
driver? Are you referring to the CPU PAT index?

In any case, if I understood correctly, you don't necessarily
always need to set the PAT options and the cache options will
fall into the default values.

Please let me know if I haven't answered the question.

Andi

> Thanks
> Carl
> 
> > -----Original Message-----
> > From: Andi Shyti <andi.shyti@linux.intel.com>
> > Sent: Tuesday, June 6, 2023 7:15 PM
> > To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: Andi Shyti <andi.shyti@linux.intel.com>; Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com>; Yang, Fei <fei.yang@intel.com>; Chris
> > Wilson <chris@chris-wilson.co.uk>; Roper, Matthew D
> > <matthew.d.roper@intel.com>; Justen, Jordan L <jordan.l.justen@intel.com>;
> > Zhang, Carl <carl.zhang@intel.com>; Gu, Lihao <lihao.gu@intel.com>; Intel
> > GFX <intel-gfx@lists.freedesktop.org>; DRI Devel <dri-
> > devel@lists.freedesktop.org>
> > Subject: Re: [PATCH v17 1/1] drm/i915: Allow user to set cache at BO creation
> > 
> > > > > > To comply with the design that buffer objects shall have
> > > > > > immutable cache setting through out their life cycle, {set,
> > > > > > get}_caching ioctl's are no longer supported from MTL onward.
> > > > > > With that change caching policy can only be set at object
> > > > > > creation time. The current code applies a default (platform dependent)
> > cache setting for all objects.
> > > > > > However this is not optimal for performance tuning. The patch
> > > > > > extends the existing gem_create uAPI to let user set PAT index
> > > > > > for the object at creation time.
> > > > > > The new extension is platform independent, so UMD's can switch
> > > > > > to using this extension for older platforms as well, while {set,
> > > > > > get}_caching are still supported on these legacy paltforms for
> > compatibility reason.
> > > > > > However, since PAT index was not clearly defined for platforms
> > > > > > prior to
> > > > > > GEN12 (TGL), so we are limiting this externsion to GEN12+
> > > > > > platforms only. See ext_set_pat() in for the implementation details.
> > > > > >
> > > > > > Note: The documentation related to the PAT/MOCS tables is
> > > > > > currently available for Tiger Lake here:
> > > > > > https://www.intel.com/content/www/us/en/docs/graphics-for-linux/
> > > > > > developer-reference/1-0/tiger-lake.html
> > > > > >
> > > > > > BSpec: 45101
> > > > > >
> > > > > > Mesa support has been submitted in this merge request:
> > > > > > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/22878
> > > > > >
> > > > > > The media driver is supported by the following commits:
> > > > > > https://github.com/intel/media-
> > driver/commit/92c00a857433ebb34ec
> > > > > > 575e9834f473c6fcb6341
> > > > > > https://github.com/intel/media-driver/commit/fd375cf2c5e1f6bf6b4
> > > > > > 3258ff797b3134aadc9fd
> > > > > > https://github.com/intel/media-
> > driver/commit/08dd244b22484770a33
> > > > > > 464c2c8ae85430e548000
> > >
> > > Andi, let's still get these corrected before merging once the
> > > media-driver revert is completed.
> > 
> > Sure!
> > 
> > At least this doesn't need a new version to be respinned.
> > 
> > Please, Carl, link the new pull request and I will update the commit log.
> > 
> > Andi

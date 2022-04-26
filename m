Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E4650F252
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 09:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C92B111272D;
	Tue, 26 Apr 2022 07:25:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F0211272D;
 Tue, 26 Apr 2022 07:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650957917; x=1682493917;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=NbJR21No21yrnTS3KWfmbJGDcdtZ7pIR8B3DJrMdN0U=;
 b=nKc2Dfj72Igk2B4CGco4jVBxPBUUXZVFTmnVuwfm0oOi3r+BZlnClHx/
 RsZV2aA2zuMIue82+mIR9W7lwY6fImKJUHhj/0/D7w/iygme+9tUTjmim
 Jpbo3RreB56llNC7EFfmvX156qhWhpzjDDkszWBUlQd4A6E42teZWJkjJ
 ksjQKzfQgR4AfsJxG2M8Gm86IEGK5OpJ4xTTpB1a4Qw8GhraADEYS5Fgo
 dIpE+FmEkI+D9Qfd1YAYcZCu8Sgyt2FsYpcj14hoEeFeqm1Y+Zm5Ro4j+
 o7hAscrNeKMh+s3Euoba+jIeZVqZBw2tHDgBmsh6ZU3DF9mDpJLutd3+7 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="252858213"
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; d="scan'208";a="252858213"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 00:25:16 -0700
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; d="scan'208";a="558159958"
Received: from rwambsga-mobl2.ger.corp.intel.com (HELO [10.213.204.226])
 ([10.213.204.226])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 00:25:11 -0700
Message-ID: <d13dbabb-0848-7f60-ef01-f1d2a8c77da4@linux.intel.com>
Date: Tue, 26 Apr 2022 08:25:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] drm/i915/xehp: Add compute engine ABI
Content-Language: en-US
To: "Yang, Fei" <fei.yang@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>
References: <20220422195007.4019661-1-matthew.d.roper@intel.com>
 <20220422195007.4019661-2-matthew.d.roper@intel.com>
 <643c0538-dc2a-a99b-aa53-73693ace6e38@linux.intel.com>
 <YmbbzudQMsDNbhFm@mdroper-desk1.amr.corp.intel.com>
 <BYAPR11MB2567CB015A6B1ADF5F1FEDAB9AF89@BYAPR11MB2567.namprd11.prod.outlook.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <BYAPR11MB2567CB015A6B1ADF5F1FEDAB9AF89@BYAPR11MB2567.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: "Morek, Szymon" <szymon.morek@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Justen,
 Jordan L" <jordan.l.justen@intel.com>, "Belgaumkar,
 Vinay" <vinay.belgaumkar@intel.com>, "Kumar Valsan,
 Prathap" <prathap.kumar.valsan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 25/04/2022 19:40, Yang, Fei wrote:
>>>> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
>>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
>>>> @@ -1175,6 +1175,7 @@ void intel_gt_invalidate_tlbs(struct intel_gt *gt)
>>>>    		[VIDEO_DECODE_CLASS]		= GEN12_VD_TLB_INV_CR,
>>>>    		[VIDEO_ENHANCEMENT_CLASS]	= GEN12_VE_TLB_INV_CR,
>>>>    		[COPY_ENGINE_CLASS]		= GEN12_BLT_TLB_INV_CR,
>>>> +		[COMPUTE_CLASS]			= GEN12_GFX_TLB_INV_CR,
>>>
>>> Do you know what 0xcf04 is?
> 
> Looks like that is the TLB invalidation register for each compute context.

What does compute "context" stand for in this context, as used in bspec? 
Not compute command streamer? Suspiciously individual bits (eight of 
them) are reserved per context, just like for example in 
GEN12_VD_TLB_INV_CR.

>>> Or if GEN12_GFX_TLB_INV_CR is correct then I think get_reg_and_bit()
>>> might need adjusting to always select bit 0 for any compute engine
>>> instance. Not sure how hardware would behave if value other than '1'
>>> would be written into 0xced8.
>>
>> I think Prathap and Fei have more familiarity with the MMIO TLB invalidation; adding them for their thoughts.
> 
> I believe GEN12_GFX_TLB_INV_CR is the right one to use because we are invalidating the TLB for each engine.

I don't understand this argument, I guess because I don't understand 
0xcf04 still.

> I'm not sure if we could narrow down to exact which compute context the TLB needs to be invalidated though. If that's possible it might be a bit more efficient.

Or even correct if 0xcf04 is for compute command streamers? That's my 
concern.

Regards,

Tvrtko

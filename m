Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7D45BA90B
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 11:11:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F6AF10ED00;
	Fri, 16 Sep 2022 09:10:56 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A08AB10ED00;
 Fri, 16 Sep 2022 09:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663319450; x=1694855450;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yKPsW4qzSFBzOvFQEx5GDrJcxpAHzYBPLu+uWyDF4Sw=;
 b=IxgXyvrkiwoCJbSr3mfp956sdHFdDKfG8S+Lst94FNwtpHvBOexB4pnj
 2kkvrYRNpXfSAgS2Dv929pzLfE1VAPoNdm81d7zAqyfS1yOHvprjPnNCX
 TPTgfuFshGzvtWuBM9MJLUEFjIDPfgy2kV6I+Rc/auzR1yKJYkz+Jbwqh
 n0wMTq5cjZu9Fmkkjuhl2Bi658pnTOo4pHx+yXieLOtrFYq+tBfZ5ZJnE
 igmts5F2dlesmh0HYyRgTGuhWLc9Sd9FZaQGvRClZAtKejEh5CKeKLw1o
 u1HR4VIUX4OlBgW7i564WGP7gbjH6B+u98pIRYV8SzoUH9+2UkWKonqoj g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="362914620"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="362914620"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 02:10:48 -0700
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="617605838"
Received: from agiridha-mobl1.ger.corp.intel.com (HELO [10.213.204.25])
 ([10.213.204.25])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 02:10:47 -0700
Message-ID: <aeedcce3-ff03-b8d4-54b1-13ea7d482258@linux.intel.com>
Date: Fri, 16 Sep 2022 10:10:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [Intel-gfx] [PATCH 1/1] drm/i915/uc: Update to latest GuC and use
 new-format GuC/HuC names
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, Intel-GFX@Lists.FreeDesktop.Org
References: <20220914234605.622342-1-John.C.Harrison@Intel.com>
 <20220914234605.622342-2-John.C.Harrison@Intel.com>
 <2bf26f8f-7f5f-4cfb-5117-a9119bf708fe@linux.intel.com>
 <722b1da6-459b-dd35-8a3c-3056a75ee8a1@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <722b1da6-459b-dd35-8a3c-3056a75ee8a1@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 15/09/2022 21:03, John Harrison wrote:
> On 9/15/2022 01:59, Tvrtko Ursulin wrote:
>>
>> Hi,
>>
>> On 15/09/2022 00:46, John.C.Harrison@Intel.com wrote:
>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>> Going forwards, the intention is for GuC firmware files to be named
>>> for their major version only and HuC firmware files to have no version
>>> number in the name at all. This patch adds those entries for all
>>> platforms that are officially GuC/HuC enabled.
>>>
>>> Also, update the expected GuC version numbers to the latest firmware
>>> release for those platforms.
>>>
>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 10 +++++++---
>>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>> index 1169e2a09da24..b91ad4aede1f7 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>> @@ -72,12 +72,14 @@ void intel_uc_fw_change_status(struct intel_uc_fw 
>>> *uc_fw,
>>>    * security fixes, etc. to be enabled.
>>>    */
>>>   #define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_maj, guc_mmp) \
>>> -    fw_def(DG2,          0, guc_mmp(dg2,  70, 4, 1)) \
>>> +    fw_def(DG2,          0, guc_maj(dg2,  70, 5)) \
>>
>> Just glancing over out of curiosity. Part which confused me is that if 
>> only major is supposed to be used then what is the '5' in guc_maj(dg2, 
>> 70, 5) ?
> See the earlier patch that added support for version reduced filenames. 
> The minor number is still specified because want to be able to warn the 
> user if their firmware is out of date and causing them to miss features, 
> security fixes, etc. The driver will still load any old firmware with 
> the right name and work with it, but user's need to know that there are 
> updates available.

Got it. Release is deemed not important enough to warn about? no 
actually, it's different, I guess we never expect to bump only the 
release with a source level change - so in practice kernel could not 
warn that there is a newer release version since it would never know. In 
other words those ones would only be hitting linux-firmware, while minor 
changes would be kernel patches as well.

>> I also couldn't find guc_maj with grep so I guess it's some sort of a 
>> magic concatenation macro or what?
> 'guc_maj' is a macro parameter as per the definition of the macro three 
> lines above. According to where INTEL_GUC_FIRMWARE_DEFS is used, it 
> becomes either a mechanism for creating just a 'MODULE_FIRMWARE' 
> definition for the firmware file or a table entry giving all the version 
> information as well as the filename.

Doh thanks, macro magic was apparently impenetrable to me yesterday.

Regards,

Tvrtko

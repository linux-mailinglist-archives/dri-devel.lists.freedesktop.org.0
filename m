Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3CE6B05EF
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 12:27:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D0B210E669;
	Wed,  8 Mar 2023 11:27:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ADCE10E5B9;
 Wed,  8 Mar 2023 11:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678274824; x=1709810824;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=aaAMp5abdfHMzxR7YmZ+8IjTgKJMhdB2LBIkRQEh8V4=;
 b=bKhEWot+Zj6FGRZjuTz8f18yrukQkiMaRmbHk0tBKNUUHxNCUzHuwyQm
 guxrNaOngG9bKeem6sWbLNmN/Kb8MYBohKH2t+SGsq2FciwgCXgbN0KkU
 i/WwH1WZbzXbgIIWmud7kCqX7PbSb9lwysUQwxLHrFDo0AA8E54ubmwYV
 D4sjhOcXJCJ5oNVI6f6TGQM2kuclFbIMTqxbLinCA+DM0L8cqopKRVj0n
 m/8tp5kZNYRQoDf3v0nw0ixzAN21HQamKcBBj08LBBOT/UTPeZuG+9H0M
 EdQ9N0y9JHrigVQ5D35XkH36xhIYaZd1nsNgAt5ZZbGCOhTJF/k09kVI8 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="315790532"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="315790532"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 03:27:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="679309269"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="679309269"
Received: from eharan-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.58.177])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 03:27:01 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "Kandpal, Suraj"
 <suraj.kandpal@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH 3/7] drm/i915: Adding the new registers for DSC
In-Reply-To: <DM4PR11MB63608B360592329EF088351DF4B49@DM4PR11MB6360.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230222053153.3658345-1-suraj.kandpal@intel.com>
 <20230222053153.3658345-4-suraj.kandpal@intel.com>
 <DM4PR11MB63608B360592329EF088351DF4B49@DM4PR11MB6360.namprd11.prod.outlook.com>
Date: Wed, 08 Mar 2023 13:26:58 +0200
Message-ID: <87wn3rbi0t.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 08 Mar 2023, "Shankar, Uma" <uma.shankar@intel.com> wrote:
>> -----Original Message-----
>> From: Kandpal, Suraj <suraj.kandpal@intel.com>
>> Sent: Wednesday, February 22, 2023 11:02 AM
>> To: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
>> Cc: Shankar, Uma <uma.shankar@intel.com>; Nautiyal, Ankit K
>> <ankit.k.nautiyal@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>; Kulkarni,
>> Vandita <vandita.kulkarni@intel.com>
>> Subject: [PATCH 3/7] drm/i915: Adding the new registers for DSC
>
> Nit: drm/i915/dsc would be better.
>
> Looks Good to me.
> Reviewed-by: Uma Shankar <uma.shankar@intel.com>

Except since c3f059483671 ("drm/i915/display: split out DSC and DSS
registers") the DSC registers need to go to display/intel_vdsc_regs.h.

BR,
Jani.

>
>> Adding new DSC register which are introducted MTL onwards
>> 
>> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
>> Reviewed-by: Vandita Kulkarni <Vandita.kulkarni@intel.com>
>> ---
>>  drivers/gpu/drm/i915/i915_reg.h | 28 ++++++++++++++++++++++++++++
>>  1 file changed, 28 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
>> index 596efc940ee7..9e25e21d37e4 100644
>> --- a/drivers/gpu/drm/i915/i915_reg.h
>> +++ b/drivers/gpu/drm/i915/i915_reg.h
>> @@ -7715,6 +7715,8 @@ enum skl_power_gate {
>>  #define ICL_DSC1_PICTURE_PARAMETER_SET_0(pipe)	_MMIO_PIPE((pipe) -
>> PIPE_B, \
>> 
>> _ICL_DSC1_PICTURE_PARAMETER_SET_0_PB, \
>> 
>> _ICL_DSC1_PICTURE_PARAMETER_SET_0_PC)
>> +#define  DSC_NATIVE_422_ENABLE		BIT(23)
>> +#define  DSC_NATIVE_420_ENABLE		BIT(22)
>>  #define  DSC_ALT_ICH_SEL		(1 << 20)
>>  #define  DSC_VBR_ENABLE			(1 << 19)
>>  #define  DSC_422_ENABLE			(1 << 18)
>> @@ -7959,6 +7961,32 @@ enum skl_power_gate {
>>  #define  DSC_SLICE_PER_LINE(slice_per_line)		((slice_per_line) << 16)
>>  #define  DSC_SLICE_CHUNK_SIZE(slice_chunk_size)		((slice_chunk_size)
>> << 0)
>> 
>> +/* MTL Display Stream Compression registers */
>> +#define _MTL_DSC0_PICTURE_PARAMETER_SET_17_PB	0x782B4
>> +#define _MTL_DSC1_PICTURE_PARAMETER_SET_17_PB	0x783B4
>> +#define _MTL_DSC0_PICTURE_PARAMETER_SET_17_PC	0x784B4
>> +#define _MTL_DSC1_PICTURE_PARAMETER_SET_17_PC	0x785B4
>> +#define MTL_DSC0_PICTURE_PARAMETER_SET_17(pipe)
>> 	_MMIO_PIPE((pipe) - PIPE_B, \
>> +
>> _MTL_DSC0_PICTURE_PARAMETER_SET_17_PB, \
>> +
>> _MTL_DSC0_PICTURE_PARAMETER_SET_17_PC)
>> +#define MTL_DSC1_PICTURE_PARAMETER_SET_17(pipe)
>> 	_MMIO_PIPE((pipe) - PIPE_B, \
>> +
>> _MTL_DSC1_PICTURE_PARAMETER_SET_17_PB, \
>> +
>> _MTL_DSC1_PICTURE_PARAMETER_SET_17_PC)
>> +#define DSC_SL_BPG_OFFSET(offset)		((offset) << 27)
>> +
>> +#define _MTL_DSC0_PICTURE_PARAMETER_SET_18_PB	0x782B8
>> +#define _MTL_DSC1_PICTURE_PARAMETER_SET_18_PB	0x783B8
>> +#define _MTL_DSC0_PICTURE_PARAMETER_SET_18_PC	0x784B8
>> +#define _MTL_DSC1_PICTURE_PARAMETER_SET_18_PC	0x785B8
>> +#define MTL_DSC0_PICTURE_PARAMETER_SET_18(pipe)
>> 	_MMIO_PIPE((pipe) - PIPE_B, \
>> +
>> _MTL_DSC0_PICTURE_PARAMETER_SET_18_PB, \
>> +
>> _MTL_DSC0_PICTURE_PARAMETER_SET_18_PC)
>> +#define MTL_DSC1_PICTURE_PARAMETER_SET_18(pipe)
>> 	_MMIO_PIPE((pipe) - PIPE_B, \
>> +
>> _MTL_DSC1_PICTURE_PARAMETER_SET_18_PB, \
>> +
>> _MTL_DSC1_PICTURE_PARAMETER_SET_18_PC)
>> +#define DSC_NSL_BPG_OFFSET(offset)		((offset) << 16)
>> +#define DSC_SL_OFFSET_ADJ(offset)		((offset) << 0)
>> +
>>  /* Icelake Rate Control Buffer Threshold Registers */
>>  #define DSCA_RC_BUF_THRESH_0			_MMIO(0x6B230)
>>  #define DSCA_RC_BUF_THRESH_0_UDW		_MMIO(0x6B230 + 4)
>> --
>> 2.25.1
>

-- 
Jani Nikula, Intel Open Source Graphics Center

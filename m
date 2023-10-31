Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 379407DCB38
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 11:56:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7327410E468;
	Tue, 31 Oct 2023 10:56:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8523210E468;
 Tue, 31 Oct 2023 10:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698749790; x=1730285790;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=U93Zidy7Say0VYhRIztSYVU1fhqnl1QbOnY0ngU2TgM=;
 b=iqWuogCltR0lPSQyqUYt2lBddoTzyWKSnkEPCZkwezNG7B/M8toe4n/9
 6qUJpvIzWV2ua+dK5fUKCRzaL6cllifZzmWUzLy0I3QV5Kx5Wb44/I8OL
 o+cm++clDaLlnB6xUZjkaoQDTOMgbMGHIwO9lgpjBXeD+HumR6CJK8WIY
 ImKFg3MJiECUceV+syqKjVHpINQW5qocGq1AbdXKFyS8dEe8NodiGEKiK
 TpUBkd/ArsasV7S8W0sfpKndBMqTx+HlOFtLtb9e1ksAEZzmOrANKe/P1
 FjqrKfghtsmtxXlZEWuTena0RhuGPaogcvQo8sSTYDANcylyw6JlsmGSX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="474501925"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="474501925"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 03:56:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="710391285"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="710391285"
Received: from hteikenx-mobl.ger.corp.intel.com (HELO [10.252.33.135])
 ([10.252.33.135])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 03:56:27 -0700
Message-ID: <59a0141f-786c-8170-c3fb-8a8d820aeac0@linux.intel.com>
Date: Tue, 31 Oct 2023 11:56:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3] drm/i915: Flush WC GGTT only on required platforms
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20231018093815.1349-1-nirmoy.das@intel.com>
 <ZS/GZ0U7rOuuD0Kw@ashyti-mobl2.lan>
 <36c0e644-4013-f2f8-a0a7-9b9c3d8423c9@linux.intel.com>
 <ZS/W6obrW/g8WuS4@ashyti-mobl2.lan>
 <3887c6f2-687e-01d0-71c9-b2354a0df9c7@linux.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <3887c6f2-687e-01d0-71c9-b2354a0df9c7@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is now merged to gt-next


Thanks,

Nirmoy

On 10/18/2023 4:04 PM, Nirmoy Das wrote:
>
> On 10/18/2023 3:00 PM, Andi Shyti wrote:
>> Hi Nirmoy,
>>
>>>>> gen8_ggtt_invalidate() is only needed for limited set of platforms
>>>>> where GGTT is mapped as WC. This was added as way to fix WC based 
>>>>> GGTT in
>>>>> commit 0f9b91c754b7 ("drm/i915: flush system agent TLBs on SNB") and
>>>>> there are no reference in HW docs that forces us to use this on 
>>>>> non-WC
>>>>> backed GGTT.
>>>>>
>>>>> This can also cause unwanted side-effects on XE_HP platforms where
>>>>> GFX_FLSH_CNTL_GEN6 is not valid anymore.
>>>>>
>>>>> v2: Add a func to detect wc ggtt detection (Ville)
>>>>> v3: Improve commit log and add reference commit (Daniel)
>>>>>
>>>>> Fixes: d2eae8e98d59 ("drm/i915/dg2: Drop force_probe requirement")
>>>> I'm wondering if this is the right Fixes, though. Should this
>>>> rather be:
>>>>
>>>> Fixes: 6266992cf105 ("drm/i915/gt: remove GRAPHICS_VER == 10")
>>> Hard to find a real Fixes for this. I just want to backport this to dg2
>>> where we can have unwanted side-effects.
>> yes, this piece of code has moved around enough so to make it
>> diffuclt to track its origin.
>>
>> I think the one I found should be the correct one,
>
> That just removes a graphics ver, not related to WC GGTT map or XE_HP.
>
>>   but the dg2
>> force probe removeal can also become a placeholder for DG2 fixes.
>
> Yes, I have no better ideas too.
>
>
> Regards,
>
> Nirmoy
>
>>
>> I won't complain.
>>
>> Andi

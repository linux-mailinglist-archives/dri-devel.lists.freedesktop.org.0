Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A56C63929B1
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 10:41:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD206E8D1;
	Thu, 27 May 2021 08:41:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 903106E8BE;
 Thu, 27 May 2021 08:41:51 +0000 (UTC)
IronPort-SDR: pgnotTnLKDXiB7EIsHUoNPshPcXGPimxb7Nuz8Hjig6HjhgZ9Dk9ZknMYzZ5f9jboAgvXSG2Td
 ppOxMp92SL2w==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="189802564"
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="189802564"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 01:41:50 -0700
IronPort-SDR: dfXSCQiFQyq2/WVFG1CoRQ2P9LEE3I7gfV/4+5YnQctTCsPgHGUZPkvmCfO4MZL+lw1kL/+XNJ
 wW9QlHRkaN4w==
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="547600831"
Received: from amoses-mobl1.ger.corp.intel.com (HELO [10.213.211.53])
 ([10.213.211.53])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 01:41:48 -0700
Subject: Re: [Intel-gfx] [RFC PATCH 53/97] drm/i915/guc: Disable semaphores
 when using GuC scheduling
To: Matthew Brost <matthew.brost@intel.com>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-54-matthew.brost@intel.com>
 <295c0e48-5091-504a-5a81-10a60fa900f4@linux.intel.com>
 <20210525170131.GA14724@sdutt-i7>
 <cff93d4a-e852-0a33-9235-b019fd828a0a@linux.intel.com>
 <20210526181501.GA4268@sdutt-i7>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <44a8a634-e50c-62fc-585a-c9786b70cc11@linux.intel.com>
Date: Thu, 27 May 2021 09:41:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210526181501.GA4268@sdutt-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: jason.ekstrand@intel.com, daniel.vetter@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 26/05/2021 19:15, Matthew Brost wrote:
> On Wed, May 26, 2021 at 10:25:13AM +0100, Tvrtko Ursulin wrote:
>>
>> On 25/05/2021 18:01, Matthew Brost wrote:
>>> On Tue, May 25, 2021 at 10:52:01AM +0100, Tvrtko Ursulin wrote:
>>>>
>>>> On 06/05/2021 20:14, Matthew Brost wrote:
>>>>> Disable semaphores when using GuC scheduling as semaphores are broken in
>>>>> the current GuC firmware.
>>>>
>>>> What is "current"? Given that the patch itself is like year and a half old.
>>>>
>>>
>>> Stale comment. Semaphore work with the firmware we just haven't enabled
>>> them in the i915 with GuC submission as this an optimization and not
>>> required for functionality.
>>
>> How will the updated commit message look in terms of remaining reasons why
>> semaphores won't/can't be enabled?
>>
> 
> Semaphores are an optimization and not required for basic GuC submission
> to work properly. Disable until we have time to do the implementation to
> enable semaphores and tune them for performance.
> 
>> They were a nice performance win on some media workloads although granted a
>> lot of tweaking was required to find a good balance on when to use them and
>> when not to.
>>
> 
> The same tweaking would have to be done for with GuC submission. Let's
> get basic submission then tweak for performance.

I don't have fundamental complaints as longs as commit message is 
improved and it is understood the absence of semaphores is extremely 
likely to regress transcode performance tests. Latter probably doesn't 
matter (for some definition of it) unless either there will be a 
platform where both GuC and execlists can be supported, or there will be 
two separate platforms similar in hw performance in theory, both 
relevant to transcode customers, one using execlists and one using GuC.

Regards,

Tvrtko



Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFB16C61E1
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 09:36:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F25410E320;
	Thu, 23 Mar 2023 08:35:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F1710E32E;
 Thu, 23 Mar 2023 08:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679560555; x=1711096555;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wDdeSb/bg+wF+kSpsoEp2QhZRodkIdNWumr/7wREvzk=;
 b=B9a59O8pOk0VlSAZbX9Os3EQUt7kydUU+GNXtRQnnZ1ZbG65svOaqtIo
 0slQ5Vfzc08vyy0atR9Pf9pX7+D5qq6QeANZC2nJaYSrvRgT8ih4a+rJc
 3Ru4ZV+tzKmaf/vIw1B7v2W2EzmDYsk6YPyq7bSdBsx6j4YQE0VPF7+kF
 1/dty5mZrtdkgk7S2zfmu4LFuIb2ea3Uk0lFPqGHMH8kXzlqSUJUS7MLD
 OTeasnYI8fPrjCiKtZoToppTvWRyKueSbMOO2gevQaODWzwPtzDs5EhJM
 jCl7H7vGZvhOGaiKmWydQWzIgDWjIghbLalbFWUf2SbLUE7Z1bL9JhKIZ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="323276911"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="323276911"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 01:35:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="682230055"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="682230055"
Received: from mplechx-mobl.ger.corp.intel.com (HELO [10.213.211.105])
 ([10.213.211.105])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 01:35:53 -0700
Message-ID: <416a0d13-0013-ecbe-716e-f3bda59c9d30@linux.intel.com>
Date: Thu, 23 Mar 2023 08:35:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [Intel-gfx] [PATCH v3] drm/i915/pxp: limit drm-errors or warning
 on firmware API failures
Content-Language: en-US
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "Tamminen, Eero T" <eero.t.tamminen@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20230314175832.1506427-1-alan.previn.teres.alexis@intel.com>
 <6cff8c19-0ab6-4b03-d778-ad57aa207b98@intel.com>
 <cc56d923-4021-3423-bfdf-986e7b73283f@linux.intel.com>
 <3841da5b-06df-eacf-ebd1-0e7885e6c9cb@intel.com>
 <38deebc090105826da9c85172392b10b93e99801.camel@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <38deebc090105826da9c85172392b10b93e99801.camel@intel.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 23/03/2023 00:27, Teres Alexis, Alan Previn wrote:
> On Fri, 2023-03-17 at 13:37 +0200, Tamminen, Eero T wrote:
>> Hi,
>>
>> On 16.3.2023 10.50, Tvrtko Ursulin wrote:
>>>> [   11.674183] i915 0000:00:02.0: PXP init-arb-session-15 failed due
>>>> to BIOS/SOC:0x0000101a:ERR_PLATFORM_CONFIG
>> ...
>>> Alan - is this expected during normal operation on some parts, or it's
>>> something truly unexpected/unexplained? If the former then I think it
>>> would be good to downgrade away from drm_WARN so it is less scary.
>>>
>>> Commit message talks about "HW/platform gaps" - if it is like a missing
>>> BIOS support or so then I think WARN_ON is too much.
>>
>> Note that this was on pre-production TGL-H HW with BIOS from April 2021.
>>
>> (I don't know where to get update, nor interested to update it.)
>>
>>
>> 	- Eero
> 
> Alan: Hi Tvrtko, thanks for the feedback -i shall change from WARN_ONCE to drm_info_once.

Maybe it deserves to be a warning? Or a notice? I was just thinking it 
does not need a call trace and all since it is not a driver issue. Your 
call on the level and whether or not there is any chance for it to 
happen in the field to make the discussion relevant or not.

Regards,

Tvrtko

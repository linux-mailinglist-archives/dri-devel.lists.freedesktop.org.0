Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6513ACC7E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 15:43:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C23196EA13;
	Fri, 18 Jun 2021 13:43:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 285AE6EA09;
 Fri, 18 Jun 2021 13:43:05 +0000 (UTC)
IronPort-SDR: H8pmQMHNh5W4/bQYPAswEGbMNOFFCOj2+r+wjTrEiawrGJy55Xuo7xItLMomMbx6HCQBq7iDGD
 2MBREM6s+DaQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10018"; a="204725859"
X-IronPort-AV: E=Sophos;i="5.83,283,1616482800"; d="scan'208";a="204725859"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2021 06:43:04 -0700
IronPort-SDR: 2g9qF2PdFqs/4gk7FjE6iZ5ctHXimqbehOKhVhFXE/fjdlHZlcW2/HtWkZk/XnMsMXaysMUBU6
 qwywsNpEr17Q==
X-IronPort-AV: E=Sophos;i="5.83,283,1616482800"; d="scan'208";a="451398894"
Received: from murphyke-mobl1.ger.corp.intel.com (HELO [10.213.237.184])
 ([10.213.237.184])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2021 06:43:03 -0700
Subject: Re: [PATCH 1/2] drm/i915/selftests: add back the selftest() hook for
 the buddy
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20210618133150.700375-1-matthew.auld@intel.com>
 <a188086b-0f54-db4c-7c1c-06c29de8d5a6@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <b1714503-e8fd-6099-3eac-3fe563a0bd48@intel.com>
Date: Fri, 18 Jun 2021 14:43:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <a188086b-0f54-db4c-7c1c-06c29de8d5a6@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/06/2021 14:36, Thomas Hellström wrote:
> Hi.
> 
> On 6/18/21 3:31 PM, Matthew Auld wrote:
>> When we resurrected the selftest we forgot to add back the selftest()
>> hook, meaning the test is not currently run.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> Do we need a Fixes: tag?

Not completely sure since this is just for the selftests, so should have 
zero impact for "normal" users, and so also no need to backport or queue 
for fixes I think. I'll add a References: link.

> 
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> 
>> ---
>>   drivers/gpu/drm/i915/selftests/i915_mock_selftests.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/i915/selftests/i915_mock_selftests.h 
>> b/drivers/gpu/drm/i915/selftests/i915_mock_selftests.h
>> index 34e5caf38093..6759b56086fb 100644
>> --- a/drivers/gpu/drm/i915/selftests/i915_mock_selftests.h
>> +++ b/drivers/gpu/drm/i915/selftests/i915_mock_selftests.h
>> @@ -34,3 +34,4 @@ selftest(gtt, i915_gem_gtt_mock_selftests)
>>   selftest(hugepages, i915_gem_huge_page_mock_selftests)
>>   selftest(contexts, i915_gem_context_mock_selftests)
>>   selftest(memory_region, intel_memory_region_mock_selftests)
>> +selftest(buddy, i915_buddy_mock_selftests)

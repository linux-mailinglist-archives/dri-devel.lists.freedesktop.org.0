Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6347A5E78F1
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 13:01:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 151C210E848;
	Fri, 23 Sep 2022 11:01:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8940D10E852;
 Fri, 23 Sep 2022 11:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663930859; x=1695466859;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Oh/2jbnJUIYU2lX82cH9xbHClZolpriMoBQA7OEFGQo=;
 b=YrboYZj6fFA9un1KKDzZEJJtlvTA/WlmKXi7d9inX5fdENNmo4q/gF4Y
 oyv0JphDSf3TyxXdJk4U4RG/KgSF1PlBNOpvFgJL23PenkBDYJB/jMC5R
 5b0+cKugdCXJorZ6tYw1dAWU1Aa8mzTqSPzyECqcGjYXlfpZxQ9wvJNdJ
 Z+TJ+ESDvAuFFq19suEt6o7El9/FZzPESK3cM0NLg9nTFE/LW/YE6Ro+5
 5oIqfu6pVEHE7YGrC4WW/gHfUFCMZ+gdPZABEtY+yCnRLdapn8wSCmG6O
 P5HKp8cuN3RH+YT9cgwPNaydBV38pMRNem5Pzb9wfhkge9ESH93lZEK2t w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="300552302"
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; d="scan'208";a="300552302"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 04:00:58 -0700
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; d="scan'208";a="620176090"
Received: from ccislaru-mobl.ger.corp.intel.com (HELO [10.213.225.140])
 ([10.213.225.140])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 04:00:57 -0700
Message-ID: <161f5a01-e6e0-f249-045f-bc2f9c0f2a1d@linux.intel.com>
Date: Fri, 23 Sep 2022 12:00:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] drm/i915/selftests: Remove flush_scheduled_work() from
 live_execlists
Content-Language: en-US
To: "Das, Nirmoy" <nirmoy.das@linux.intel.com>, Intel-gfx@lists.freedesktop.org
References: <20220630125716.50835-1-tvrtko.ursulin@linux.intel.com>
 <6f789a18-76be-ebc6-a20a-fa63963e9498@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <6f789a18-76be-ebc6-a20a-fa63963e9498@linux.intel.com>
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
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 23/09/2022 11:32, Das, Nirmoy wrote:
> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

Thanks!

Pushed now. Should land with 6.2.

Regards,

Tvrtko

> On 6/30/2022 2:57 PM, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> There are ongoing efforts to remove usages of flush_scheduled_work() from
>> drivers in order to avoid several cases of potentential problems when
>> flushing is done from certain contexts.
>>
>> Remove the call from the live_execlists selftest. Its purpose was to be
>> thorough and sync with the execlists capture state handling, but that is
>> not strictly required for the test to function and can be removed.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
>> ---
>>   drivers/gpu/drm/i915/gt/selftest_execlists.c | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c 
>> b/drivers/gpu/drm/i915/gt/selftest_execlists.c
>> index 09f8cd2d0e2c..e62d089257ae 100644
>> --- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
>> +++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
>> @@ -85,8 +85,6 @@ static int wait_for_reset(struct intel_engine_cs 
>> *engine,
>>               break;
>>       } while (time_before(jiffies, timeout));
>> -    flush_scheduled_work();
>> -
>>       if (rq->fence.error != -EIO) {
>>           pr_err("%s: hanging request %llx:%lld not reset\n",
>>                  engine->name,

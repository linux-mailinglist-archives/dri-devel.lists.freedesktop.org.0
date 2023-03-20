Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B87B6C1F98
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 19:25:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A49710E037;
	Mon, 20 Mar 2023 18:25:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5258F10E037;
 Mon, 20 Mar 2023 18:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679336697; x=1710872697;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KAqlx1YFiowkUDpvtxglFZCWP+Bcoz7vB9tjbuTJQK4=;
 b=fhgg78mRClnivFESzyM5ciesMA7NYSSytZ9VnlbqtxQQ+UrsjUOmpkZk
 8sMbnwjHsSRLziXOfhidKTsbn8pAAKqr9viynPqr1GN+J/q8RLSp2Bma0
 Hidwo9rAGd/EYGTyO7/qYgS7fkSRW2Kpy1OXCD2hoS0HsqXdEJiZKGx9G
 o9uJlo99DCCfoa5oh3kpqKflqFAYa5Y2r+YXxctNJrEHO6MJkId0gCvGN
 cidZJN6g3hV4NoCJH1r1RZntnsql3ujokNgZDzDS4azlCCugqQTlX+MBo
 EtjucPnrqBFOAJicC6PQ/2uVWse67UrVxiW6/uDBEeCtRsiOWi5JSS5pM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="341101262"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; d="scan'208";a="341101262"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 11:24:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="674507500"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; d="scan'208";a="674507500"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.6.65])
 ([10.213.6.65])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 11:24:53 -0700
Message-ID: <9b1efced-605e-1088-946f-06a4c1a27260@intel.com>
Date: Mon, 20 Mar 2023 19:24:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [Intel-gfx] [PATCH v4 03/10] lib/ref_tracker: add printing to
 memory buffer
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20230224-track_gt-v4-0-464e8ab4c9ab@intel.com>
 <20230224-track_gt-v4-3-464e8ab4c9ab@intel.com>
 <ZBeYNaTUmvAxrzoU@ashyti-mobl2.lan>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <ZBeYNaTUmvAxrzoU@ashyti-mobl2.lan>
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
Cc: netdev@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chris Wilson <chris.p.wilson@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, Eric Dumazet <edumazet@google.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20.03.2023 00:18, Andi Shyti wrote:
> Hi Andrzej,
> 
> This looks also good, just few questions.
> 
> On Mon, Mar 06, 2023 at 05:31:59PM +0100, Andrzej Hajda wrote:
>> In case one wants to show stats via debugfs.
> 
> shall I say it? I'll say it... you can do better with the log
> here. It's not a typo fix :)
> 
>> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> 
> [...]
> 
>> +void __ref_tracker_dir_print(struct ref_tracker_dir *dir,
>> +			   unsigned int display_limit)
>> +{
>> +	struct ostream os = {};
>> +
>> +	__ref_tracker_dir_pr_ostream(dir, display_limit, &os);
>> +}
>>   EXPORT_SYMBOL(__ref_tracker_dir_print);
>>   
>>   void ref_tracker_dir_print(struct ref_tracker_dir *dir,
>> @@ -114,6 +141,19 @@ void ref_tracker_dir_print(struct ref_tracker_dir *dir,
>>   }
>>   EXPORT_SYMBOL(ref_tracker_dir_print);
>>   
>> +int ref_tracker_dir_snprint(struct ref_tracker_dir *dir, char *buf, size_t size)
> 
> nit: snprintf is normally referred to its variable parameter
> counterpart... I would choose a different name... how about
> ref_tracker_dir_fetch_print()?


Hmm, original ref_tracker_dir_print prints the stats to dmesg,
ref_tracker_dir_snprint prints to memory buffer, like:
- stack_depot_print and stack_depot_snprint,
- stack_trace_print and stack_trace_snprint.


> 
>> +{
>> +	struct ostream os = { .buf = buf, .size = size };
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&dir->lock, flags);
>> +	__ref_tracker_dir_pr_ostream(dir, 16, &os);
>> +	spin_unlock_irqrestore(&dir->lock, flags);
> 
> What are you trying to protect with this spinlock? what if
> the caller has already locked here? do we need a _locked()
> version?

spinlock is to serialize access to dir,
at the moment _locked version is not necessary, but it can be easily 
added if needed.

Regards
Andrzej


> 
> Thanks,
> Andi
> 
>> +	return os.used;
>> +}
>> +EXPORT_SYMBOL(ref_tracker_dir_snprint);
>> +
>>   void ref_tracker_dir_exit(struct ref_tracker_dir *dir)
>>   {
>>   	struct ref_tracker *tracker, *n;
>>
>> -- 
>> 2.34.1


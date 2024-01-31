Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03498844ABF
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 23:07:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3085F10FD33;
	Wed, 31 Jan 2024 22:07:40 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F1E10FD33;
 Wed, 31 Jan 2024 22:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706738859; x=1738274859;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=m4eI2aCs1dIdqSnKpBYX6yPzazetfSmMWlubiKXx1k4=;
 b=ClrcUtAiIk5wYo2okypSxJISJdh0gcCID9p2w+PZ1OsSTc9B6LXo4gpn
 ZliAMAN8n6A0/ERQgzL3uoALaiZ+gZKQBcV7CnCwS3v4XEd9Q4S7gM3WN
 o0w7JL5SkpapDEtBLIzx7kqd9GKCrC/IJeMZ/PSvRojxAmoyBVkXPvMi4
 WoppMEL4wXrPzqi6HXfExjhrRQRUK74wr9B1snmHzuoByVZJJYilFM/vu
 jQZSwVmS0PuSqSSfow3Sl+R/0VnwI8JFdBTi76X/69eahP3QSljIZNHIa
 b+YinnE+EH5EYAqwq7LsM6zNF7yuxT3DjAY8zeyM7I37f+c7KZQ186E3E w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10840494"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; d="scan'208";a="10840494"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 14:07:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; d="scan'208";a="22915477"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2024 14:07:36 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 14:07:35 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 14:07:34 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 31 Jan 2024 14:07:34 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 31 Jan 2024 14:07:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mYqijfllJpstVLBlbPEbzqv0BwMcew/G9sWFo4StQ2z0UUg8AZUQoAdSRK0pq9xed+ysX8O6X2DK7xUJx38/q3KLK2T7KS7dwCwKVGccUgaRQOieYWG3X6cQO3zLJh+L9xDuau37ckAi2ZWaV4F7BzdXgZhdIlWC906zJi6cBwuT01I/4a3vnd7vWPp2xYryuJFY0qM/+tmelxuhdBD4gaqg2zKcun2OUdbwIvcitmsfDgvR363Q4TCtpnWYJxTz6s8pw73CSIuljh+ig4P0XlzMcyRFSHkYkEMgcuqQalIffyfwyc5oEUUk0ahecK0f50ppLgTr9f7XyE0lYRG3aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/dtw0V3FdOHDc1bpGDZwmWvnvrCM2gh7lrLBx3GjMw=;
 b=e4u/ThwzF7f0+MWd9uHlzqQgcC5ePpkZ0twZg5iCugEEe5oSGZ/nw3cOeuhOEXvvArW3sn1ysQrj+yDWrGZxoV9MaMqz3gF7hUJ/x/S9pQlXe2PMxq2MJoU0TdImUGM3zEbYMY8UGnvhRqfTUINT6yAc+UAxDdb85Oid6l7MpGIfBKWpgv60du7IEfCUC6WfQCVdbmyci1XiF3rZ6jAvmyLE3jQy3kxBiuYLdyxG97QOZgTe/Yy8uN1ZryKfvFTv4b9qFTTXX549/TJjQ8LMgx6EBJOV+TEgjzci3OibUZV3sQRf9ldiBCIARLBjo15usTAwvHk6Mj6Pmr1odsl1Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CH3PR11MB7939.namprd11.prod.outlook.com (2603:10b6:610:131::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.24; Wed, 31 Jan
 2024 22:07:32 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f%3]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 22:07:32 +0000
Message-ID: <44132ac6-2a1c-4a2d-945d-67b6594e6fae@intel.com>
Date: Wed, 31 Jan 2024 14:07:29 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/gt: Restart the heartbeat timer when forcing a
 pulse
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 <Intel-GFX@lists.freedesktop.org>, Andi Shyti <andi.shyti@intel.com>
References: <20240110210216.4125092-1-John.C.Harrison@Intel.com>
 <2202042.NgBsaNRSFp@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <2202042.NgBsaNRSFp@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0024.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::37) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CH3PR11MB7939:EE_
X-MS-Office365-Filtering-Correlation-Id: 40272b00-9dcd-4857-06ef-08dc22a905c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HwW1d7u4VasTU1v5Sc56PvwELwG5XbndwVtLlQikxJK+q+8CwO0kDrOBVwSAckRNey+ezjgFCgKwmNG8NAxZzNXW1nY1U6p4YWsPD8vkCk1zH0PEGsoYasqbXOzuvI87U9efu+2iSNxfGqhu5l3+88SHGSqMzPk6kZyX+Skk9tVB3pKshPhtb7y7ebVV7IPo4i74s0TF3+Xeh5rPlyr5mEXGIqgI5zv6UM8UWhEGHsEmMdR3XxJXNF3c6P2IFBbBsenM01IKuDBblpAyZSu5yPw2mybXxVAaUEIIKOxKbBXzPkVTCVfhRmh+JdRxR5njGaBuF54eRJ81K4MykSEukfxiU6ZEuGVNTRUJpzG7WJEvsnJPBvtlAtwl2hKxD6tg9y6/2y2PzuXvoooPJbXCZA4Hv7eSRlZKLKLMn3VUY5Bbpn/dDhGYfuYhxilnQpzXjuRqKkr72yN21m7JR8xj/pec1kFMjipNbrgcTwzXNxUr7zDqZUgylRDtpgD1c4UU9nO1h74vZCQULpnASIj68faaHVcfFA+arSR42R0uyzlkDTVYDkjDWGI3dHVuFWlxDxgippGKt5Bb1RHEwIwGToBACZw0i+NxZX2eJp0TWklqDyyh/z0GVXDwbTrV5XJCx27TrTrRpggRBN8XzpeJwA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(396003)(39860400002)(346002)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(41300700001)(6666004)(6486002)(478600001)(66556008)(8936002)(8676002)(4326008)(66946007)(316002)(6636002)(110136005)(66476007)(26005)(38100700002)(2616005)(83380400001)(6512007)(6506007)(53546011)(31686004)(36756003)(86362001)(2906002)(31696002)(82960400001)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTFMdTdBZWVVWkxrS0wvMGl6Q3k2SGJkcXlJSGlBUTBUYk9BQThobldaVkdX?=
 =?utf-8?B?OHRmbFVLZXcvM3ppWEpQL0ZmMXE1em83Vmw2RTF2dEQzSThYVzdzK3JTWUU5?=
 =?utf-8?B?OU42U3h0TlpydUhIYVNSM2pRRURVNUtKMUI0NFJsdEhES3dPeWcxOG1xYUdT?=
 =?utf-8?B?cUEyV3NxUzFkNCtVazB1RmZqUEpMVkRsYXZ2K1FrOXRDUTVkU3kzd3czRWNw?=
 =?utf-8?B?YTlvaU5sVTZaUExyZjhNZWtDbkVKc2JhaDAxYWRDRS9WNkJaS3VTd1hzclJj?=
 =?utf-8?B?ZXBHRGhqalFxclVEVDRQRC9lVTZmY1Y1aG9xSWk1Y1dmSE5abkJ5RCs2TWdw?=
 =?utf-8?B?bloxTEVEM1RpZjRGNE45RC9oUXBrV21tdyt3ZlRwNjVUaGlqRHExbUtDeGdS?=
 =?utf-8?B?cFNYMVh0Q1I2d2MyQ3hna2VqY0wwRVNMMzJNbTM2bWs3M1RJa3NZMlQ3cUJ3?=
 =?utf-8?B?UU04ZGh4UE9hRURCMlZYekdpeEduV0M1QW5vRk16aTYyTDdWS0RVNHhoTExQ?=
 =?utf-8?B?M2Y0RWllOVRodzVGanhmU1Jla0lWaW12YTVvNXlWM0E2Y3M0MXVSK0ZKQXlo?=
 =?utf-8?B?OGVtUCtiYnY4NGd0K1Y0STYxYUlFVng4dGF0bXR0SUlWSlNHa0dCUjhGdmU5?=
 =?utf-8?B?RzNZRkdHaElEMXppcC92M3ljMkpiM3k1aXhmMUhLeUM0UFFaL3h2b3VrWi9z?=
 =?utf-8?B?SFAzUWdDbC9EY2ljVWJsVHRQaFF2Y0FjVG9ha01uTHdnMWNJZW9lSmd4RVJP?=
 =?utf-8?B?bzJqZ2xNVFBDcWxqWk5QdzBkZXYxRFY2V2toWk8vS3VEVHY3TnV5a1I5TlhJ?=
 =?utf-8?B?NUtwKzh5dDhST2oxcWJlS1R6YXhFWnVFR1JFRUZpQjNmQ1AzVkNjTC9lN2c3?=
 =?utf-8?B?dHZOQ21WZzJDRTVsVFVYcjBNN0pDcUVjRVdUT1dudit1bW5lS0xhbWtxc3hD?=
 =?utf-8?B?NVlRTnY4MHpqZjNjQWRWVDk3MlFXT3BWSEcrSzUwbFUxa3NBcnRnV0NOY0hh?=
 =?utf-8?B?RE9zTXpxVVowbnBQaUhtMitoU0FEdXMrODc2RzF2b3AzODFkclJMeURQeHll?=
 =?utf-8?B?bTZDQ0JYeXpYY1dFNllLOXRXMHRheURxLzZXcmdXQ3lvdFJwR0FUYUNBb1Nh?=
 =?utf-8?B?dXVHVHZNSTdXU1hvTC9Zems0K1laY3h4OTJxaDYxOExmL2gzLzkxV2dxNTBU?=
 =?utf-8?B?YjRlZGNLRUZSSVJYSmU5M3BjNyswYTVjb2tmSjR4S1JUN0FwYUNxZzlXMlp2?=
 =?utf-8?B?UDlhTFhrWWZ2cUxpK2FZOTBhNGFPR1BQcWtDRzJjaU1FUjVwL0E3QURnZWdB?=
 =?utf-8?B?bGtYcCtNcmt1Q0hRTlZNa3lhSWU1eTVNSHZGWnVwVnlWZGNQbXpWQlJva1c4?=
 =?utf-8?B?aEhzRTB0ajUvaE1ZTzA1a1hEZ3YzSE9lSUpDYW8xT3NjdmpuY0kwNzVHTGxB?=
 =?utf-8?B?QUo3MlVzVUYrL1lBUUtYS2tzS05LZkc5UjNwa0J3ZE9GZ3dBNDFaeTdwOTFE?=
 =?utf-8?B?YW5xYjVYNmg3UGZ0U1FQejNJTHVSQTVIcE93NTk2N2p1WXVtQ1EvY2VEUVJ5?=
 =?utf-8?B?OHgySWxKei9scDU5NkErRmQvMUREK0lzOTJETm5tZ0dKQjh4eDRsdGZ6NGMy?=
 =?utf-8?B?aDlselVCdXdFVjg2K3p0cEljYUxMRm95Y0xpMys4MGkxSWZNcDFtdThGNlU5?=
 =?utf-8?B?WWtOOUVxTzZjZVg4TlBxQ0UycmlQRlE3VTNVb212ZTUrREw0TFRXQm01SUpY?=
 =?utf-8?B?VXkyUnd2N0tTZzN5NzRYcG1sQXQxVVEzWDlNMlM5d0pxelErdTV6UkZVTFdt?=
 =?utf-8?B?cWpPd29KcWU0T0ZxTjlLdjErSnhTSzhlckc4cDV4N0cwVFJQang4aHVVd2d0?=
 =?utf-8?B?UmxFdnpTTjdhTFVQRFB0T0VUUEVYbXlBbDVqLzE1N21uODJMdDZHelJJa2U4?=
 =?utf-8?B?YjIxTEF4bytJTWczNW9BNWQ5Z21IaGd6R2dBSXRhRG1TMndGWk1CK1kyZWVh?=
 =?utf-8?B?akIrL2czMmVYV0RtRTlpcDB4N0NvczVCREJjM3R1Z3pWT3JBbExVZnkvVkdh?=
 =?utf-8?B?V291dk1SQTVMYzNYSUxWMVJHTjVLLzhwU2tCQ1RrSXU2aS9LOGFxZStwL1Nx?=
 =?utf-8?B?blZIRS9NVElPNUFpclFwUDNsbUFEYnQ2UXkxSEk4eGVacGN3NVZqVVE3dXA3?=
 =?utf-8?B?c2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40272b00-9dcd-4857-06ef-08dc22a905c7
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 22:07:32.3195 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y4SDxu8g9g/vVSEMIwQSSXMWBTssyqEB3y7MiKvuNEIl0srfc2U7qh4aky/wpJ6juWb0HSR2JS3SeJ/Or9cQ38kMrVQxhIzAp2ebrQgpW44=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7939
X-OriginatorOrg: intel.com
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
Cc: DRI-Devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/31/2024 10:48, Janusz Krzysztofik wrote:
> Hi John,
>
> On Wednesday, 10 January 2024 22:02:16 CET John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> The context persistence code does things like send super high priority
>> heartbeat pulses to ensure any leaked context can still be pre-empted
>> and thus isn't a total denial of service but only a minor denial of
>> service. Unfortunately, it wasn't bothering to restart the heatbeat
>> worker with a fresh timeout. Thus, if a persistent context happened to
>> be closed just before the heartbeat was going to go ping anyway then
>> the forced pulse would get a negligble execution time. And as the
>> forced pulse is super high priority, the worker thread's next step is
>> a reset. Which means a potentially innocent system randomly goes boom
>> when attempting to close a context. So, force a re-schedule of the
>> worker thread with the appropriate timeout.
> I haven't looked too much in heartbeat pulses code before, but I think I can
> understand your change.  I've also got a positive opinion from Chris on it.
> I can provide my Ack, assuming the pre-merge failure reported by CI is not
> related, but could you please comment that failure first and/or ask BUG Filing
> to handle it so we have it cleaned up?
Pretty confident the CI failure is unrelated. Not seeing how a change to 
the heartbeat timing of persistence context clean up could cause a HDMI 
test to fail to complete.

However, I was really hoping for a full code review by someone who 
understands this code and would be able to say whether there could be 
unexpected side effects of the change. Or even if there is a better / 
safer way to fix the problem.

@Andi Shyti, you were fingered as being someone who might have such 
knowledge. Can you comment?

Thanks,
John.

> Thanks,
> Janusz
>
>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
>> index 1a8e2b7db0138..4ae2fa0b61dd4 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
>> @@ -290,6 +290,9 @@ static int __intel_engine_pulse(struct intel_engine_cs *engine)
>>   	heartbeat_commit(rq, &attr);
>>   	GEM_BUG_ON(rq->sched.attr.priority < I915_PRIORITY_BARRIER);
>>   
>> +	/* Ensure the forced pulse gets a full period to execute */
>> +	next_heartbeat(engine);
>> +
>>   	return 0;
>>   }
>>   
>>
>
>
>


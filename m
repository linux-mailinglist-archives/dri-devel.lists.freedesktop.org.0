Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD595785EC2
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 19:37:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A64510E0A7;
	Wed, 23 Aug 2023 17:37:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B1E10E09F;
 Wed, 23 Aug 2023 17:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692812244; x=1724348244;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GD44jnqIx7v21Zl3HijERQVpE35jMJXYdKVlMpEK7AU=;
 b=a9EYz/7jQ4eRdkO7sfCO9exHLyy6zrGYGtuZhfSJgF0E0tX8bjC9sv7m
 wty1kUY6K4RePFVR+trChk07F5n0wj0BzNF15ioTA47BOUGhqLfM7OPBw
 lu5quGNo5xR9asTLjDJXZBvpYWnGSgQctHGgUCp0tzGi6dfoSa4gW8MhS
 +4MJj6DhvB1XCSooogj9bjtNUjH3TUlPKDKmZ+kFhghqBBvoSx7FvjtrH
 XxGVb9fY21Y6EqbK95Lmq2aFxSwnPF/S3lSfJRoFZzcFUvvNqZkmWojlA
 bJXKMS7TjFAGcgv0E0gZ0ZMBxQkSv/wQIGmnZkYRw936etG1Q13hT9ewZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="374201454"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="374201454"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 10:37:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="766216575"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="766216575"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 23 Aug 2023 10:37:23 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 23 Aug 2023 10:37:23 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 23 Aug 2023 10:37:22 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 23 Aug 2023 10:37:22 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 23 Aug 2023 10:37:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=msTonfuPh5Oxotroe6VDa7/nENK8itOWtV+PRH9J/nVZMu8vf5OA9WqlNe8/vb/yMYkgYfD/moxyC9nIdf1AhqfkA8YF5p13IlUtOUTpASxW4DdSoOpqCW8SL9fKoalEibxhlSJI9qGfBI5O7q5fP92mH++PwfIhEC0X9Fg6db2q2ruwaXru1Jwf/RZIzXqRR7Ndt5ZGE/cimU4WcqUC3BHATY0CenPexpolaX03Xt74g6SBMvSK/P/9+Avu3cE0KT1g3nuF1TOlsqap0dQ7ZZeuQMY9gtialMQR19RdCFmkGJW1a8eNIA4p4PPXOWE35K92qDHlNL0N1Po25ji3kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HzPwBXlH/niP5CwDEiUIHaKEzzvyuVB6TFpv4qkj1UE=;
 b=OalUX12Ok2u3QwfLFp/yVeHUMhg8o2ozpeSr+KJ0pXZxPbuezrO58ikoCVSwSZH36smzTUTUqA+A9e377hVwYkPaj97oJEHIuif7IK4a0eEsFQWQOZNEuKB/6zVd4WPgKAaQtkFJFSskl49Sl52izHm0aSILEaIS7YJ+hhO9HUOXVL0UpKHPmKOztobtO2KdfpRIJJpyCIYnhXg7voKQSMOwq3nSM1kBJ/+dos3m7kenVfJO4FNI7KxCfqhtXkb4ckKgbF9kzLN4eGmH5SzU18uTAVqvUZ0TNqmrGh35+wpDi9uNJbMCHq3MkUamrIth4tp75K2LgjmI5YFrAWV7BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SJ0PR11MB4879.namprd11.prod.outlook.com (2603:10b6:a03:2da::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 17:37:20 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::6bdd:6fe1:4045:c26f]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::6bdd:6fe1:4045:c26f%6]) with mapi id 15.20.6699.026; Wed, 23 Aug 2023
 17:37:20 +0000
Message-ID: <e31b1f49-88cd-d6e4-abbe-51f27712ff83@intel.com>
Date: Wed, 23 Aug 2023 10:37:16 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.14.0
Subject: Re: [PATCH v5] drm/i915: Avoid circular locking dependency when flush
 delayed work on gt reset
Content-Language: en-GB
To: Daniel Vetter <daniel@ffwll.ch>
References: <20230811182011.546026-1-zhanjun.dong@intel.com>
 <3a745c83-e7cf-6a24-5556-8c0c019adfec@intel.com>
 <ZOYtNyqfvqJPeqq2@phenom.ffwll.local>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ZOYtNyqfvqJPeqq2@phenom.ffwll.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0148.namprd04.prod.outlook.com
 (2603:10b6:303:84::33) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SJ0PR11MB4879:EE_
X-MS-Office365-Filtering-Correlation-Id: dea0e577-6cb3-4bf7-cac3-08dba3ff99f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tX+ohys9HIr4+UX4WynPFi3mZ8n6k9TA+0ZbReo8boC41ldH9tPb+IaPEaFPIXxTNdcE7QPc/p2x/3cns3waXUSeCBLWGHdydZW8QuYGB+ziiKkuU4pkYndumq1BfP6GfqDvQF1nKBlfNLrG2deZMMRY7sAwzoSyt5yE/aM722snS+UyG0hWePcoqi3EDNuVR3GsdfYqYIOKSEuW4MI9xEsI80Tl7o40cal8gwim8+aw7fKuEOHoNQsnPQKb/sHyNn855CDR0STWH4EOyDNGlrE/yN2Gy80Ye3OsV4aQtzrbpe6rd2raVcwcPiD2XgdpBbgabOqNAECgAabhsPD+tmcfAA7Ms8XKKbdueZeedd+ICcSJwRFWfyPDwfJi3Lu+Uu7bwXMcHbNK1tVbqfm++5bY6UxDxj+NUMS2+LCHaphOPGDPuKtnecJf5wdm37nAaVTr7OIQyFq+LNW50x2wdKuWcrK6eC6VXqXQ8f8ymmBZbXXmBZX7SZDfFA8WYP42rQOdaZav+1Ury3erPrcDkG1jCi/3irwcYiamJBIcmmaLAgSHkLxQqaTLSzskN8Vt7iKV0f2d3221O8B9Xrdpvjzd2jGeaTbZUt1BA+03FsKiimzZTU8zgkLleKDZzYy+/aD5H6WA8nvYmIh5AfJAag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199024)(186009)(1800799009)(2906002)(83380400001)(6506007)(53546011)(6486002)(38100700002)(5660300002)(26005)(31696002)(86362001)(31686004)(8676002)(8936002)(82960400001)(2616005)(4326008)(6512007)(316002)(66476007)(66556008)(54906003)(66946007)(6916009)(478600001)(6666004)(36756003)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjFVb3BqRk9rMjcrTTJiTVUydjJ5UmtYMHpjMm1YL041SERiU09maWRnSmV6?=
 =?utf-8?B?d1hsS2taWUY0di90dTNyWlZsajBOdE04UXZZNnc2Y1VtRUg3a1hVREYzUmYw?=
 =?utf-8?B?Y0ZQdm1OQURnbERRUDZiYmZ5Zk9CUlhzRW9OeExqZVR2UGVGSkh2Zis1ZDVZ?=
 =?utf-8?B?ZGpXN0I3cWR6eXpKN1htb0kwZVlZSkFZVDlYTnFrT1R5NmVFanVkZGtpZWE0?=
 =?utf-8?B?dTNMUzdHUjFBVDZuNVBTcjVYVkR3Z2VlaDZjSGlPNTVsSGN4WW1UUXBlOVhp?=
 =?utf-8?B?eGJCQnFrZlZ1QXF5ckIrSUFBQzhid2tVMVRUZUdtaGtXUjRxejFvSlVmM1Zw?=
 =?utf-8?B?Z2M2RnJYNFdTTVh5VnNyZEtXWlJPNm5DK3VPRVNNSEd6YXB5NXR3NEhLVmRI?=
 =?utf-8?B?bVREOHBscG9BVWlSRTlWQmdFS0U4ODBEeHhvRUd4S2ZYZzF4aFRROWZYaVB6?=
 =?utf-8?B?L01tWjgxR3JvMTdKdlpzdVhCY1h3YkhjOUFEam0yVHYwQ21VVW1SbGROd25j?=
 =?utf-8?B?NE9SR3N0TnJseWtxYUhpM0lycEVRZ3RhZHhDMzdWN3BueThYWm8yYTdxQnNw?=
 =?utf-8?B?ZTR6RUV2TERNbE44dWJaQnJaN1J6cFozQUgwbzdjamx2dEwyUVlKMjU1Tmt0?=
 =?utf-8?B?SHBVMzE2RTRZRTQ0UXNxNDBiTStLUVN4WjJ2U2FqQ2NDZDl2MmZVWmNVVU4x?=
 =?utf-8?B?by9ZaEJhckdid2c3My9STWU2TERidHU4cUxtZm5CMHhwMC9HaCt0NmNwSTBC?=
 =?utf-8?B?a0wyMXpOZENhcmNPODJjVlhPZzNrOCs4d2VDZWo0NFdaY2o1eDMwdFBvSWVi?=
 =?utf-8?B?VlppTTBWelVYc253SXNiRmMyTXBSWEhBVlBkZkQ1VHNhR25qc0I0Tld1Y1o3?=
 =?utf-8?B?UEpuYWY5YlpsN0xibDJSL3d2SXFzd0ZDcFVJMEpzNUp6b0VTNVJGeDdzdnoy?=
 =?utf-8?B?VThXenNrVE1TVEpBM0VyWjM4STN5bnJVY0hhQXBwMUltZUlnNDRQTjQ3b3Fo?=
 =?utf-8?B?SW5kVzgxTlBzb3hMYTN1MU4rWUJ4YW1nbE1sRWk4c1dyRG05d3QvQVNwZzlD?=
 =?utf-8?B?M01ZWEh4T2ZiY2drZ01HeUFuZEM0MzZyVjNUdnhqSUpaVDFLM2RNVkdnUTEv?=
 =?utf-8?B?OUVjWmNrWVpBdCsxSjFueHN0TWNwY1JNaE5mVUc5SlYyR2xQWWloNFlKSzF2?=
 =?utf-8?B?UWM3RzdGbFRmN2tldnVUcVE0d0JjdG81OG12M0pKdXNkeWE5a0NPd1RWYnk0?=
 =?utf-8?B?MGkyamJ1YSs1cWJ1Z0gzL2VVRVI3Uyt2RENZWFBEUUFhYWVJVFBWMnBMaVhL?=
 =?utf-8?B?Rlkxb3I4c0xzWERLZHRMSWVIRkpGZktDMjdlTHRWUUpoMVZrRVdGZWZJWUdP?=
 =?utf-8?B?T0o3d1piNmxWN2Zibk1uclpFcnd6eDAyZlN1Wm9wRFpFaWZDeWVVakxuT3JJ?=
 =?utf-8?B?cW1iZWE4M0VGTkJmWHQrNHNPZjdRY3R2Q0RzaklOLzhuTm9HK3NFQnY1c0xl?=
 =?utf-8?B?bGROeFI4M08xZk5VcUJEUkdoMUhKb21VbEErNStlOWFFOUdpL0xvL0lKVVR5?=
 =?utf-8?B?ZjhuTUdocWZaU28vME9kVm14NHBkcklhbzA4SzVjZVBaYldOcE4zVmFCWWQ2?=
 =?utf-8?B?eVZIeFFNc2dkb2ZFaHV5NEJOM2kzRnEyWlRGOTVheWJ3ak9xRS9rL045YkFm?=
 =?utf-8?B?TDFEcHduRGVHbG9oNGdnWFFtcVlURXZQUjZyZmFhUS9kMloya1ArV3QrSU9G?=
 =?utf-8?B?NWtHdnQwVG4zTXF1dktzeXpBQ2lOeGNUT0lqbXEvcURuWVRRakx2T3pNeVU0?=
 =?utf-8?B?cW9JYml4b0Y4WkZna0VkWUNMbnBqZERjNXl0d1ZyRThtd1p4Wk43Z3pXS1dj?=
 =?utf-8?B?aWhqY2pESHR5c2pVSjArRzJFdGF6b2M5Y09oS2s0KzFXVDByd3pOdW9KR3k1?=
 =?utf-8?B?c3greEMrdWNrSVlLKzZKZS9ESUZHZ2dRcDlUczVjekV6NUtCSG8zM1JVTmRK?=
 =?utf-8?B?WkdLc1RlTzVFY3dUSCtVdnBRL0cwV3FPL3d4NEgxSHZxSUFqakJGQzJXc1lP?=
 =?utf-8?B?bnI5K3FUUXJiRDhhY1NjNkhabTVsdk9sbjhzb0VKeC9rS3htNEprN2s0elc5?=
 =?utf-8?B?NXNkNUE2UlE5V2wvYTdtMjJhUUVFRk9pUXpoYWg5OTNEWDNEdmRCZWpSSURM?=
 =?utf-8?B?MUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dea0e577-6cb3-4bf7-cac3-08dba3ff99f5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 17:37:19.9646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YXQtTeuHSIrIfWFbTfSWX0NVPYrVuY1XNsbV5S++V2TwFREoFFeDahvBwNFKfo26bs0/NunvvtdUNINyr0Ibo+8T8uXesXSiyGWjMw/kL1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4879
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
Cc: Zhanjun Dong <zhanjun.dong@intel.com>, intel-gfx@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/23/2023 09:00, Daniel Vetter wrote:
> On Tue, Aug 22, 2023 at 11:53:24AM -0700, John Harrison wrote:
>> On 8/11/2023 11:20, Zhanjun Dong wrote:
>>> This attempts to avoid circular locking dependency between flush delayed
>>> work and intel_gt_reset.
>>> When intel_gt_reset was called, task will hold a lock.
>>> To cacel delayed work here, the _sync version will also acquire a lock,
>>> which might trigger the possible cirular locking dependency warning.
>>> When intel_gt_reset called, reset_in_progress flag will be set, add code
>>> to check the flag, call async verion if reset is in progress.
>>>
>>> Signed-off-by: Zhanjun Dong<zhanjun.dong@intel.com>
>>> Cc: John Harrison<John.C.Harrison@Intel.com>
>>> Cc: Andi Shyti<andi.shyti@linux.intel.com>
>>> Cc: Daniel Vetter<daniel@ffwll.ch>
>>> ---
>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 11 ++++++++++-
>>>    1 file changed, 10 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> index a0e3ef1c65d2..600388c849f7 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> @@ -1359,7 +1359,16 @@ static void guc_enable_busyness_worker(struct intel_guc *guc)
>>>    static void guc_cancel_busyness_worker(struct intel_guc *guc)
>>>    {
>>> -	cancel_delayed_work_sync(&guc->timestamp.work);
>>> +	/*
>>> +	 * When intel_gt_reset was called, task will hold a lock.
>>> +	 * To cacel delayed work here, the _sync version will also acquire a lock, which might
>>> +	 * trigger the possible cirular locking dependency warning.
>>> +	 * Check the reset_in_progress flag, call async verion if reset is in progress.
>>> +	 */
>> This needs to explain in much more detail what is going on and why it is not
>> a problem. E.g.:
>>
>>     The busyness worker needs to be cancelled. In general that means
>>     using the synchronous cancel version to ensure that an in-progress
>>     worker will not keep executing beyond whatever is happening that
>>     needs the cancel. E.g. suspend, driver unload, etc. However, in the
>>     case of a reset, the synchronous version is not required and can
>>     trigger a false deadlock detection warning.
>>
>>     The business worker takes the reset mutex to protect against resets
>>     interfering with it. However, it does a trylock and bails out if the
>>     reset lock is already acquired. Thus there is no actual deadlock or
>>     other concern with the worker running concurrently with a reset. So
>>     an asynchronous cancel is safe in the case of a reset rather than a
>>     driver unload or suspend type operation. On the other hand, if the
>>     cancel_sync version is used when a reset is in progress then the
>>     mutex deadlock detection sees the mutex being acquired through
>>     multiple paths and complains.
>>
>>     So just don't bother. That keeps the detection code happy and is
>>     safe because of the trylock code described above.
> So why do we even need to cancel anything if it doesn't do anything while
> the reset is in progress?
It still needs to be cancelled. The worker only aborts if it is actively 
executing concurrently with the reset. It might not start to execute 
until after the reset has completed. And there is presumably a reason 
why the cancel is being called, a reason not necessarily related to 
resets at all. Leaving the worker to run arbitrarily after the driver is 
expecting it to be stopped will lead to much worse things than a fake 
lockdep splat, e.g. a use after free pointer deref.

John.

>
> Just remove the cancel from the reset path as uneeded instead, and explain
> why that's ok? Because that's defacto what the cancel_work with a
> potential deadlock scenario for cancel_work_sync does, you either don't
> need it at all, or the replacement creates a bug.
> -Daniel
>
>>
>> John.
>>
>>
>>> +	if (guc_to_gt(guc)->uc.reset_in_progress)
>>> +		cancel_delayed_work(&guc->timestamp.work);
>>> +	else
>>> +		cancel_delayed_work_sync(&guc->timestamp.work);
>>>    }
>>>    static void __reset_guc_busyness_stats(struct intel_guc *guc)


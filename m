Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56ABF67B8F3
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 19:00:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E28D10E370;
	Wed, 25 Jan 2023 18:00:48 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C1A10E13E;
 Wed, 25 Jan 2023 18:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674669646; x=1706205646;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dhMtq3B7KoKHuZnzLw0mZEIQJhrceadQiSWsifNY6z4=;
 b=UBThPoXTn7Y/0Zmls7lazvM637wFRpdKFxf5jOAYcs3yozsDO+OyBWiA
 84XKNBsRp4SAUCYP8NQ/73mNSZ9rq1obpZIjjCxhAUcWeLbZK4qQom1Js
 gq2Ld4971PwfxWMpNJvuqQTJqfEK9452YL9nlHwJytTJasKB7/yrgPysx
 DDlsa20fguLhStroPjzM4a3K07uN3st4593PHIX9jjJ8Be+3xcthpBNar
 JJuhmlQYAwXfoz9A6sDXtwWJoj1fdhzt6dF8aK5nfug234PNV0JKA+xa0
 bAI6LV3GVQgd3S2dmgnK3BWVXWnSGfMSlXdzt6SGbMr31leKs8m3gwpd+ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="326655990"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; d="scan'208";a="326655990"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 10:00:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="664541397"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; d="scan'208";a="664541397"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP; 25 Jan 2023 10:00:34 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 25 Jan 2023 10:00:34 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 25 Jan 2023 10:00:33 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 25 Jan 2023 10:00:33 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 25 Jan 2023 10:00:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U9xvWcyZk3Skz8FaPdvBi/sgdgKnlfvXG/sGCQAVpCd6Tiyu66t1JGrCGq+ruhsKerP3BNfwumSE2AbB3QObaODA2u9zu9PGWrwaiVKfqZKMRj+ImlqsqCNx2CfcNXd5h//uUThacpRB65Am9EraJQQf+xD5pQKiolVePMsnryzdnYRzhk3nd9zmgnlUvGsSHHl3rKte+SEdX3SFdR12g+eJ3LXm2NK9Adr3O7GF6THNGIU5AGFzSfLxtZ9AOLysuoMsjgOgy1YIK+ZB5q2iYdNcNNzG8k9z12+2SY1XnlO7qD1dcSx+S6Kqq5SSTCFCIjeszAw2mLwhDHA4G28egg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8BeFTJ9xDQYFC/MLsXTGhZfg/XLvTM+oAqrepy5NjVY=;
 b=IfqBBQyOmxI1ztgNczlpsBbiiHoHbwc0OODOqASfjan8aVJ2TZ3BsHdZ/pmDwneqDgTlqS/aSUu8JmyO950lHqnrY6G8b6R6Qmf1Ri4rIDPEtDsFV7d7OANTWH3SLW6f1DIY/Z336PRecX95T/cicPzOx+frHGJORp/ggY5jwO0d1WNHKfCKWk52xRl/BD1eGKwJPCnv+GI+mPbQJ+k1ovHNSrIWmWy5RlwRT81sd7GU+Dz4NHONhR5fHvdn/Hb30Dg+f5DAAcW84jvRtdQFouXVE10Tk3wHhu80KnlSfRwJz11/E8xBWPLiia4M6HWnw3OY933aGAbTYABMvvHSnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DM4PR11MB5501.namprd11.prod.outlook.com (2603:10b6:5:388::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 18:00:30 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb%2]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 18:00:30 +0000
Message-ID: <a92d23df-d749-68ba-b707-69b5ddf5899e@intel.com>
Date: Wed, 25 Jan 2023 10:00:27 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH v4 2/7] drm/i915: Fix up locking around
 dumping requests lists
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230120232831.28177-1-John.C.Harrison@Intel.com>
 <20230120232831.28177-3-John.C.Harrison@Intel.com>
 <f2aa8185-216a-2cb8-45be-7b7179de83ba@linux.intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <f2aa8185-216a-2cb8-45be-7b7179de83ba@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW2PR16CA0022.namprd16.prod.outlook.com (2603:10b6:907::35)
 To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|DM4PR11MB5501:EE_
X-MS-Office365-Filtering-Correlation-Id: 22820a5a-519f-43b0-63f9-08dafefe0c29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zKxvcqLXQ7m5pcTFx2INJkHVe1RKt4RC0s67rPGvuFBx/5DEWWJp6rtHnTrdhAqAGNtjuk/gKmaoVlpTJJZukXBlj3xYoKaKLDEdtboAYJGO+8g4x0IyRczTHA9uxGq1t5Nswfg26vhIo9UKoyUWF5dxXUDJ2IUaGQEFrgmpmsN+Zq6a8bvg0D/F+CP32h1FBGUOoRSxwsrJ0c2yjY0Ea198d5goVbO+VgTBj9AtzR+EAGMQHlTFwVVBCSj7+gcA/P6LmzMnnbzeSmO+BDk+qzzY7CiM1Ws3NXhknTebRL618/gmFTPxajkScVc9vMkzZp1TlW0RbqPuREaZr55uAQr9tjaycETw8nflLGt3C5V+fpFmcdohwfUoyr0yjzkajGUE7UNokpInzt9LcefgKW7onkwBeHMdjYlP2PXgKkQvy4afrXKMuNoMxRIPmWnT0HlWyNb8dVyxoHduhGxoOyOFOnF/KdEFNins75EGaS07eICC6f1AfMe2wB441NRhjre7TGI7ZcQwPp7pInUBoHToquIN3FCIqWOBT43OgYfVwDpDD23X5TQuel0o06mabj2FC5nCIMVqaDVtXPSMjUxlYLTsZ1ZKcpcQc1f+6zfV/peMGvkyF6iiv+aaQSJXDRnE/yYC8Agay4gtLyx4pamMXAyxeQT/k0v5rClku9RUKzbQ03QHwbzMZTIbZONfna8wVInwA3Q1Jjf6GpVlUz5e6K9vqo8cWpvvgo+NLCI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(396003)(39860400002)(136003)(376002)(366004)(451199018)(83380400001)(38100700002)(26005)(82960400001)(5660300002)(30864003)(2906002)(41300700001)(86362001)(4326008)(8936002)(316002)(6512007)(6666004)(6506007)(186003)(8676002)(66476007)(66556008)(2616005)(53546011)(478600001)(66946007)(36756003)(31696002)(6486002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmpZL09SaFArcUN5OC83S1dSLzJvZ293RGJlVGlsNEkzUkgrc2R6M1JEVzdU?=
 =?utf-8?B?eTY4TnB4R3lRQTVCRW5ESTZpSjRNa0pvbWVFMUJQbXVWbnJRRTM0Zys2TmdN?=
 =?utf-8?B?UWVlWmNUZU10QkpPKzczc0dVMnR5ZkZnTzhxZlN3dGZkK3dKWnBJUXFENWJn?=
 =?utf-8?B?aGJSdjJjVTBFb0IvTFBxY0xISWFWdTd6azdlNkRieFExNmVpWnU2bXNQbHhO?=
 =?utf-8?B?UER2VnZOQXRPUEtJQ1ZSRUo1cUtnU1RIQXd3bU9PUk9HY29lSGFvRFg0NXBD?=
 =?utf-8?B?cUFHMy8xOUwwa0dCUmlOMVJ6cVlzMW0yN0hUaStCZDF3djAwU3FOT0pPTzJH?=
 =?utf-8?B?eWlZWDB1M3FURE9uWGxISFdzTEhveUNMSHdZdGx3SWZXV2VRSzZ6N0VkWmxp?=
 =?utf-8?B?N0UxNFIxOUMxZlorZmpiYzVoeTVUYU11aFlQL2h3ZDNqVXFaZjBPbDJzLzVD?=
 =?utf-8?B?eGZGU2VmWndOd0xHQnFDQWdaTCtUSmdUSDF0Q2tMeHZHWkM2YnlRQmx6RW5Q?=
 =?utf-8?B?S1k0c0Z2ZTArTmhOYU4rcDFjaWwrT0twRHZZK25GSXhTQnNmZmh3NXdib3NJ?=
 =?utf-8?B?NWtSMS91R3R1OGVqakppQm5sT1ZUa1JDZDNxbjYxVXpYTHVVYVZLUHNzTjJF?=
 =?utf-8?B?S3hIdFFpRE5QYlFDby9abFo0aUdnSlArbkFPb1BvblI1Q0s3anBxOUZ2QUV1?=
 =?utf-8?B?am1zRzR5SC9xSnpzZG5kS0dlWngxamRlRno5NWF3RXhZNC9yOFBHMEVPRlh1?=
 =?utf-8?B?ZTNzSVV0dmhMQVVLTkdUZTE3VEh6RHBXQjdyUkdJOStkWWpvbERCS1p2b0lu?=
 =?utf-8?B?TW9ieE9lMXE5b2c2cVBkQnhYQmI2bWFyYmM5T0E1TkJncUZFcnJuVTVUOTRl?=
 =?utf-8?B?RGE5VCt3R2VucVR2bHZHRlVaRDRPMmxZMUpud1FjRGVHY0VsYU81cWkwS2Rt?=
 =?utf-8?B?NGUzbXUvOGNXWTUwMi9SMWVqRVpycnBuQjdKOTloK01LUFh0ZEliRm9yWjl0?=
 =?utf-8?B?dE1MQ0w5SFQ1bWx5dWZNRGRzMGVPWnVHZGhMZmZGcW5tTE42M3pDSHNtZjJT?=
 =?utf-8?B?emJDNEZNOVlLYVpWdGpkalJudFRQNlo1ak1kZlUrNklsb0FjdWlHdytQTFY4?=
 =?utf-8?B?OWUwbitLQTAxZDlVODlPTnR6UzFNUWtDdGY0QXEvRGplRjk4NXdHZmNTRVVO?=
 =?utf-8?B?d1pFN0xRNnBYWWwxdWx1NitNbWVKQ1BMNFdSbXlDSWRwZlFVMHlpamZxOUhB?=
 =?utf-8?B?V3ByYU84YmNrU0VJUzgvc0pnR2Qzb1ByaVFTVmlEQm81UlA2ckxnOVFMQTZh?=
 =?utf-8?B?ZDJ6L3o3aXlrdkZ4QmZodE1DeG9QL1pVK0tYUS9GZ0ZyWkppRS8zSDh0bFdw?=
 =?utf-8?B?ZFlUa2hIcno2WjJzeWwrWllNQ3hOdjlrTGs5MUc5TnQ1UHVVSWxBWHgvT0NZ?=
 =?utf-8?B?THYyd0xMZUJjTzhuQVRmZ25FNEphcHhKdmt3LzQ4RlpKQ0tvR29GYlEreUNJ?=
 =?utf-8?B?SGtjbzhZaWJIdDh4bVRMUmJtSW1LN3dPSWRqaExvemR3MlVZYkpWVjVsUnRi?=
 =?utf-8?B?bVEwY1VJSHM2eDhoOFFtcWdJU2VrSldtKzJNZzExRDVrOFJ4bWI0dlF2b1d3?=
 =?utf-8?B?UVl6bVVzaiszTm5GQ2Fya05YdkJQdkdsQlJiVkE0aFEwR2sxa2VqM05tajJB?=
 =?utf-8?B?b2pITi9Kc2o5djZpTFExc29aSkJDWUdkNUtneUxrdThtNnNPaE9JUkhmRGsw?=
 =?utf-8?B?bDNyd1N6QWhTc29ZZTY0bjVYOWtVUGt1cmVFVUdxZGs1dXV6Mk5Jd1UwY3Bp?=
 =?utf-8?B?MEo4V3pIN2RyRzZQTFJVVi9GRkRuUVp0TE5hY2JyYXFHN2lyWks4NGUzMmJN?=
 =?utf-8?B?bFB5bVdDVFZmSFFCVTBIaUFrYlN0SUFpQVV0V0VMbUtLRHVxYnVEMERlTmZU?=
 =?utf-8?B?YWhwT1pQZVU3VmNVeGRma3JJOWJaWEp5NUgzeVVDaUVWUTMxTE5SWFV1cEhQ?=
 =?utf-8?B?ZEs2elFvb2VmRFRxazhUK3N2LzZlYUl1aUwxNTBPTDRjL1dYNVB4NTFtbzhI?=
 =?utf-8?B?MlE4K3A4VHhlUkkveDQ1em9QU3dWOXVteEl1NkorZmwzbFZXUXhpbUxjcEc2?=
 =?utf-8?B?SEtHUDJZUmRMUmE2a2Z3WE5BZDc1eHZ3bDdjQ1RyOXpBMGpQeUx0TnNaNTg3?=
 =?utf-8?B?c0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22820a5a-519f-43b0-63f9-08dafefe0c29
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 18:00:30.6940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: leP9AGtYQp8JoKTuCmAvd44q77TIc7JFBDhzpLqFAzcyIIf9EuezoCXobTSgS9HFKrNXIfpmLrZLcXnJv6IGWx1hHKiP42lIZfXaR9+WhzQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5501
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/24/2023 06:40, Tvrtko Ursulin wrote:
> On 20/01/2023 23:28, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> The debugfs dump of requests was confused about what state requires
>> the execlist lock versus the GuC lock. There was also a bunch of
>> duplicated messy code between it and the error capture code.
>>
>> So refactor the hung request search into a re-usable function. And
>> reduce the span of the execlist state lock to only the execlist
>> specific code paths. In order to do that, also move the report of hold
>> count (which is an execlist only concept) from the top level dump
>> function to the lower level execlist specific function. Also, move the
>> execlist specific code into the execlist source file.
>>
>> v2: Rename some functions and move to more appropriate files (Daniele).
>
> Continuing from yesterday where you pointed out 2/7 exists, after I 
> declared capitulation on 1/7.. I think this refactor makes sense and 
> definitely improves things a lot.
>
> On the high level I am only unsure if the patch split could be 
> improved. There seem to be three separate things, correct me if I 
> missed something:
>
> 1) Locking fix in intel_guc_find_hung_context
This is the change already it's own patch - #1/7. Can't really split 
that one up any further. Changing the internal GuC code requires 
changing the external common code to match.

> 2) Ref counting change throughout
> 3) Locking refactor / helper consolidation
These two being the changes in this patch - #2/7, yes?

The problem is that the reference counting fixes can only be done once 
the code has been refactored/reordered. And the refactor/reorder can 
only be done if the reference counting is fixed. I guess there would be 
some way to do the re-order first but it would require making even more 
of a mess of the spinlock activity to keep it all correct around that 
intermediate stage. So I don't think it would noticeably simplify the patch.

>
> (Or 2 and 3 swapped around, not sure.)
>
> That IMO might be a bit easier to read because first patch wouldn't 
> have two logical changes in it. Maybe easier to backport too if it 
> comes to that?
I'm not seeing 'two logical changes' in the first patch. Patch #1 fixes 
the reference counting of finding the hung request. That involves adding 
a reference count internally within the spinlock on the GuC side and 
moving the external reference count to within the spinlock on the 
execlist side and then doing a put in all cases. That really is a single 
change. It can't be split without either a) introducing a get/put 
mis-match bug or b) making the code really ugly as an intermediate 
(while still leaving one or other side broken).

John.

>
> On the low level it all looks fine to me - hopefully Daniele can do a 
> detailed pass.
>
> Regards,
>
> Tvrtko
>
> P.S. Only that intel_context_find_active_request_get hurts my eyes, 
> and inflates the diff. I wouldn't rename it but if you guys insist okay.
>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_engine.h        |  4 +-
>>   drivers/gpu/drm/i915/gt/intel_engine_cs.c     | 74 +++++++++----------
>>   .../drm/i915/gt/intel_execlists_submission.c  | 27 +++++++
>>   .../drm/i915/gt/intel_execlists_submission.h  |  4 +
>>   drivers/gpu/drm/i915/i915_gpu_error.c         | 26 +------
>>   5 files changed, 73 insertions(+), 62 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h 
>> b/drivers/gpu/drm/i915/gt/intel_engine.h
>> index 0e24af5efee9c..b58c30ac8ef02 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine.h
>> @@ -250,8 +250,8 @@ void intel_engine_dump_active_requests(struct 
>> list_head *requests,
>>   ktime_t intel_engine_get_busy_time(struct intel_engine_cs *engine,
>>                      ktime_t *now);
>>   -struct i915_request *
>> -intel_engine_execlist_find_hung_request(struct intel_engine_cs 
>> *engine);
>> +void intel_engine_get_hung_entity(struct intel_engine_cs *engine,
>> +                  struct intel_context **ce, struct i915_request **rq);
>>     u32 intel_engine_context_size(struct intel_gt *gt, u8 class);
>>   struct intel_context *
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c 
>> b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> index fbc0a81617e89..1d77e27801bce 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> @@ -2114,17 +2114,6 @@ static void print_request_ring(struct 
>> drm_printer *m, struct i915_request *rq)
>>       }
>>   }
>>   -static unsigned long list_count(struct list_head *list)
>> -{
>> -    struct list_head *pos;
>> -    unsigned long count = 0;
>> -
>> -    list_for_each(pos, list)
>> -        count++;
>> -
>> -    return count;
>> -}
>> -
>>   static unsigned long read_ul(void *p, size_t x)
>>   {
>>       return *(unsigned long *)(p + x);
>> @@ -2216,11 +2205,11 @@ void intel_engine_dump_active_requests(struct 
>> list_head *requests,
>>       }
>>   }
>>   -static void engine_dump_active_requests(struct intel_engine_cs 
>> *engine, struct drm_printer *m)
>> +static void engine_dump_active_requests(struct intel_engine_cs *engine,
>> +                    struct drm_printer *m)
>>   {
>> +    struct intel_context *hung_ce = NULL;
>>       struct i915_request *hung_rq = NULL;
>> -    struct intel_context *ce;
>> -    bool guc;
>>         /*
>>        * No need for an engine->irq_seqno_barrier() before the seqno 
>> reads.
>> @@ -2229,29 +2218,20 @@ static void 
>> engine_dump_active_requests(struct intel_engine_cs *engine, struct d
>>        * But the intention here is just to report an instantaneous 
>> snapshot
>>        * so that's fine.
>>        */
>> -    lockdep_assert_held(&engine->sched_engine->lock);
>> +    intel_engine_get_hung_entity(engine, &hung_ce, &hung_rq);
>>         drm_printf(m, "\tRequests:\n");
>>   -    guc = intel_uc_uses_guc_submission(&engine->gt->uc);
>> -    if (guc) {
>> -        ce = intel_engine_get_hung_context(engine);
>> -        if (ce)
>> -            hung_rq = intel_context_find_active_request_get(ce);
>> -    } else {
>> -        hung_rq = intel_engine_execlist_find_hung_request(engine);
>> -        if (hung_rq)
>> -            hung_rq = i915_request_get_rcu(hung_rq);
>> -    }
>> -
>>       if (hung_rq)
>>           engine_dump_request(hung_rq, m, "\t\thung");
>> +    else if (hung_ce)
>> +        drm_printf(m, "\t\tGot hung ce but no hung rq!\n");
>>   -    if (guc)
>> +    if (intel_uc_uses_guc_submission(&engine->gt->uc))
>>           intel_guc_dump_active_requests(engine, hung_rq, m);
>>       else
>> - intel_engine_dump_active_requests(&engine->sched_engine->requests,
>> -                          hung_rq, m);
>> +        intel_execlist_dump_active_requests(engine, hung_rq, m);
>> +
>>       if (hung_rq)
>>           i915_request_put(hung_rq);
>>   }
>> @@ -2263,7 +2243,6 @@ void intel_engine_dump(struct intel_engine_cs 
>> *engine,
>>       struct i915_gpu_error * const error = &engine->i915->gpu_error;
>>       struct i915_request *rq;
>>       intel_wakeref_t wakeref;
>> -    unsigned long flags;
>>       ktime_t dummy;
>>         if (header) {
>> @@ -2300,13 +2279,8 @@ void intel_engine_dump(struct intel_engine_cs 
>> *engine,
>>              i915_reset_count(error));
>>       print_properties(engine, m);
>>   -    spin_lock_irqsave(&engine->sched_engine->lock, flags);
>>       engine_dump_active_requests(engine, m);
>>   -    drm_printf(m, "\tOn hold?: %lu\n",
>> -           list_count(&engine->sched_engine->hold));
>> - spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
>> -
>>       drm_printf(m, "\tMMIO base:  0x%08x\n", engine->mmio_base);
>>       wakeref = intel_runtime_pm_get_if_in_use(engine->uncore->rpm);
>>       if (wakeref) {
>> @@ -2352,8 +2326,7 @@ intel_engine_create_virtual(struct 
>> intel_engine_cs **siblings,
>>       return siblings[0]->cops->create_virtual(siblings, count, flags);
>>   }
>>   -struct i915_request *
>> -intel_engine_execlist_find_hung_request(struct intel_engine_cs *engine)
>> +static struct i915_request *engine_execlist_find_hung_request(struct 
>> intel_engine_cs *engine)
>>   {
>>       struct i915_request *request, *active = NULL;
>>   @@ -2405,6 +2378,33 @@ 
>> intel_engine_execlist_find_hung_request(struct intel_engine_cs *engine)
>>       return active;
>>   }
>>   +void intel_engine_get_hung_entity(struct intel_engine_cs *engine,
>> +                  struct intel_context **ce, struct i915_request **rq)
>> +{
>> +    unsigned long flags;
>> +
>> +    *ce = intel_engine_get_hung_context(engine);
>> +    if (*ce) {
>> +        intel_engine_clear_hung_context(engine);
>> +
>> +        *rq = intel_context_find_active_request_get(*ce);
>> +        return;
>> +    }
>> +
>> +    /*
>> +     * Getting here with GuC enabled means it is a forced error capture
>> +     * with no actual hang. So, no need to attempt the execlist search.
>> +     */
>> +    if (intel_uc_uses_guc_submission(&engine->gt->uc))
>> +        return;
>> +
>> +    spin_lock_irqsave(&engine->sched_engine->lock, flags);
>> +    *rq = engine_execlist_find_hung_request(engine);
>> +    if (*rq)
>> +        *rq = i915_request_get_rcu(*rq);
>> + spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
>> +}
>> +
>>   void xehp_enable_ccs_engines(struct intel_engine_cs *engine)
>>   {
>>       /*
>> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c 
>> b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>> index 18ffe55282e59..05995c8577bef 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>> @@ -4150,6 +4150,33 @@ void intel_execlists_show_requests(struct 
>> intel_engine_cs *engine,
>>       spin_unlock_irqrestore(&sched_engine->lock, flags);
>>   }
>>   +static unsigned long list_count(struct list_head *list)
>> +{
>> +    struct list_head *pos;
>> +    unsigned long count = 0;
>> +
>> +    list_for_each(pos, list)
>> +        count++;
>> +
>> +    return count;
>> +}
>> +
>> +void intel_execlist_dump_active_requests(struct intel_engine_cs 
>> *engine,
>> +                     struct i915_request *hung_rq,
>> +                     struct drm_printer *m)
>> +{
>> +    unsigned long flags;
>> +
>> +    spin_lock_irqsave(&engine->sched_engine->lock, flags);
>> +
>> + intel_engine_dump_active_requests(&engine->sched_engine->requests, 
>> hung_rq, m);
>> +
>> +    drm_printf(m, "\tOn hold?: %lu\n",
>> +           list_count(&engine->sched_engine->hold));
>> +
>> + spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
>> +}
>> +
>>   #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>>   #include "selftest_execlists.c"
>>   #endif
>> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.h 
>> b/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
>> index a1aa92c983a51..cb07488a03764 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
>> @@ -32,6 +32,10 @@ void intel_execlists_show_requests(struct 
>> intel_engine_cs *engine,
>>                               int indent),
>>                      unsigned int max);
>>   +void intel_execlist_dump_active_requests(struct intel_engine_cs 
>> *engine,
>> +                     struct i915_request *hung_rq,
>> +                     struct drm_printer *m);
>> +
>>   bool
>>   intel_engine_in_execlists_submission_mode(const struct 
>> intel_engine_cs *engine);
>>   diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c 
>> b/drivers/gpu/drm/i915/i915_gpu_error.c
>> index 5c73dfa2fb3f6..b20bd6365615b 100644
>> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
>> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
>> @@ -1596,35 +1596,15 @@ capture_engine(struct intel_engine_cs *engine,
>>   {
>>       struct intel_engine_capture_vma *capture = NULL;
>>       struct intel_engine_coredump *ee;
>> -    struct intel_context *ce;
>> +    struct intel_context *ce = NULL;
>>       struct i915_request *rq = NULL;
>> -    unsigned long flags;
>>         ee = intel_engine_coredump_alloc(engine, ALLOW_FAIL, 
>> dump_flags);
>>       if (!ee)
>>           return NULL;
>>   -    ce = intel_engine_get_hung_context(engine);
>> -    if (ce) {
>> -        intel_engine_clear_hung_context(engine);
>> -        rq = intel_context_find_active_request_get(ce);
>> -        if (!rq || !i915_request_started(rq))
>> -            goto no_request_capture;
>> -    } else {
>> -        /*
>> -         * Getting here with GuC enabled means it is a forced error 
>> capture
>> -         * with no actual hang. So, no need to attempt the execlist 
>> search.
>> -         */
>> -        if (!intel_uc_uses_guc_submission(&engine->gt->uc)) {
>> - spin_lock_irqsave(&engine->sched_engine->lock, flags);
>> -            rq = intel_engine_execlist_find_hung_request(engine);
>> -            if (rq)
>> -                rq = i915_request_get_rcu(rq);
>> - spin_unlock_irqrestore(&engine->sched_engine->lock,
>> -                           flags);
>> -        }
>> -    }
>> -    if (!rq)
>> +    intel_engine_get_hung_entity(engine, &ce, &rq);
>> +    if (!rq || !i915_request_started(rq))
>>           goto no_request_capture;
>>         capture = intel_engine_coredump_add_request(ee, rq, 
>> ATOMIC_MAYFAIL);


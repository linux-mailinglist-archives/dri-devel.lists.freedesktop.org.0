Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B537C7544
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 19:56:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71C9210E543;
	Thu, 12 Oct 2023 17:56:52 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C9910E532;
 Thu, 12 Oct 2023 17:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697133409; x=1728669409;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IHVEouXHU7JUIXDqWJ1BOvEYzE+y18+7q/Fa4Jpqf+Y=;
 b=hZbmNhtQXimKcYwP0l0UJAfqoS0WYCwrkv7Js5o/p6KQwDQItM4SbvyJ
 lrpbZGOkUHLjSqPcD8NDvRJbfGe6uk6Xlv9L3dz0CuRhHlnnIOGOUQxDX
 X4q6GRc1toQaD4Hpf8UsWi40VugCvQ8qFQoaQLGQ24YAcFAB0yhQL0LpP
 yoGYfXQxQYCeW56oAfE9WSHZ2S/pNmld3/7lLG+C/1eIZMV9bPCET4hUt
 RyS1U1fBT7xN4i4DfitS4zkEyprGs00jn/qolwab9zuki1/pkxsZc/P3P
 6lWfyBFXaN3VVkDl1Q9iF1gKyH23ClBuBVzxkCnFGoDlTS0IUshjp7Dp7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="387851723"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="387851723"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 10:56:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="870685905"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="870685905"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Oct 2023 10:56:48 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 10:56:48 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 10:56:46 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 12 Oct 2023 10:56:46 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 12 Oct 2023 10:56:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dTzuzDeM85CPV+iXGUJzGun+ptQO21hzwPh4efhtMIcmlZFJVkVDQjtN+Ur5d22FCmW7DczmWphNDa9lSEhAQqZRxM3odG7ENwbgvhVUIGrrjfHC1sKyCH6wXqugxpxn+6AfqW/Iw79kIYTMl6evJ07Y4mrx/Gt3WVpuWopk6hbMXI2arN/TT12bB1YJoITfODKNGGMQKqlk6EmJDyYiu0AS4/VWtQI7KWoevMXsrYubXkiA1K0vuK6VUD6/5gg8exvKbkinhJkXGXQdAcDrc9hvi2ZNoGb9NoD6W02zqo06CWKxFqr3oMuG9pOEu2AmEf9B7tw8jXi+IvXZvbq0Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5iIOY/XJC+wkd5jkwnpLmiov9oZXSXlJFh8XGCC0EmE=;
 b=H7to6oicgeTmkrO18MGDvE2P5osj8oEYevMiU2Ku/BIh7taEulwBO64VPCNDVAdg15Iw3YmB+HB5AnqVQQpKsPcHSGxbaiEu5SlPSHS3yjQ95r2IUy3FueG6NZFuJXtsPzWYplRNABUiVBOOnKi6oEvSDIH5WT+4hAtZNYzP1NDcg5amOiDfjBUZ+mLazExUeHYTv9eYkzTd0gZ145dweXSr8eNHXVLiFse7Ny9H4MWVnrWe6QqMx1ufUSwRMG+mRLHkxEor1pTlNurWnimWCsNsO7uafeenUGFh0scsVfS1OoDV2KknkiudhUqgyLI3IfUL4dbBkX0DVq2B/jOFlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by MW6PR11MB8312.namprd11.prod.outlook.com (2603:10b6:303:242::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Thu, 12 Oct
 2023 17:56:32 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::a782:6fec:8d96:27b5]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::a782:6fec:8d96:27b5%6]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 17:56:32 +0000
Message-ID: <fa9ed09c-7590-4054-850b-eda61e068785@intel.com>
Date: Thu, 12 Oct 2023 10:56:28 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Suppress 'ignoring reset
 notification' message
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230921182033.135448-1-John.C.Harrison@Intel.com>
 <a13a3cc3-3aca-3a67-637c-01f46f1173a5@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <a13a3cc3-3aca-3a67-637c-01f46f1173a5@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW3PR06CA0021.namprd06.prod.outlook.com
 (2603:10b6:303:2a::26) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|MW6PR11MB8312:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bdb8e09-bdf2-42ea-1de7-08dbcb4c9129
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3+cm9FSHXGLMdeuls7QiyV+Sy2BJ5Popdm4Y+Srko8njM7DNZpPY3HE2PwRMbnBE9fdDxMQb+ynwMq34R1V3AjhjP2HD2BxSECe3jTIf1Kt14EHKk5UOmimpXa+ZuWij+t7GbtN359IV7Z2y07zEr9LKDFIhvvjdEi9fwy9kbROgsstX5TOTRE9yRuAs3TTQeIg2/fWs2Vx7zmoaaY0wlXrLSmFb27My6V376BjGeeqC+/4uKrpfSpkCQ4gzntL4g5PlquuISx2VcX3KiR7iu1YfQhz5rs0UzC3T+Vv+rXXNYgyAVUI1u6og8xWFpK6j/YpRmaudJnnFMGNLB7P7aBWPeq1JARewwBKZBFM/tVg8oFf3Wo/zbHlDkSY/hnZTber5scnP88VVazFON+HKykeTIZigqysQ2BXdOOWYVWn0pEqemPmbKMOoeJ8mk4TSKfx4whYTg3AGn73J3ctho3z7bM/u/ObCD5hY9LVZ8QXhRJEz4ld8ZjPKeOB6gAYq4w+All/fItGHe1diecwBkCDEpZ+de9KOVPQ6N7uKYURqdrh8krG2hnu8FOxPWGML2+otX9HgsLZThGNzjKgp7QHOaByz9b9G3N4G8n7sfWLJTYv1LJ0EnQMsT4qRCYRITet250uxBW+aSG0WhPaLhg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(346002)(396003)(366004)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6666004)(53546011)(6512007)(6486002)(478600001)(15650500001)(66556008)(26005)(83380400001)(316002)(2906002)(6506007)(4326008)(5660300002)(66946007)(66476007)(8676002)(8936002)(41300700001)(82960400001)(86362001)(36756003)(38100700002)(31696002)(2616005)(31686004)(66899024)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L085eG5MUUZwQXJWbzkrYTNCMzJZemV5bGl1QzZRZE9Nc0JYbjQvVVJLK2J4?=
 =?utf-8?B?Ym5qRW1xWkxxQlpvNnFRSjJWU1JJU3E1d1NIM0hBNEtlbkp1bjVaaVBiQ2t2?=
 =?utf-8?B?c0VWanpvYm5GQ2hRZkNEdkExRG1LNzVRTXdockZzL1BXUzFRNGtSMjZDZWZO?=
 =?utf-8?B?SWZpV1crK0swcm5OUytCNU4rQTd3a29kTXlIVVVNTTQzTzkva0R6bDdnRUd1?=
 =?utf-8?B?dGVrSFJlNmxIZXIvSFRBZTc3NkQ1b2pxbWJNSE1UVEcvYXVuOVhOUzJzbjE2?=
 =?utf-8?B?U243RUIvYUc3eWhHNVY1ZTI3U3A4TUVKZmJ3R0RNbTBXMy9jKzFMN3A3WUV5?=
 =?utf-8?B?bGpCRFNRS1NIdWJkN3hIYVdHWWJuZWpYMXFyN0FRZVM0cThLd1p3c1p4SUUw?=
 =?utf-8?B?b1l0bGpzM1F0Sk1yZk1FUzJ5WmxEazFNb2JCVGlGMzBCOGZlbmhpYVZ5eGpF?=
 =?utf-8?B?Ulp2a1c0OG5wY3ZVczBtU0N3dWozRTBDQUNWcGdLYkw4SjBJWXRWM09FcnRF?=
 =?utf-8?B?RWl1bHBvbDBPRUZ3bzgvK0N4djRicXVRRmZpbFJrdW5pcW5xRGZjNjV2WnZM?=
 =?utf-8?B?T283bHlFNUVhNWtkYUJRNSs1Z2l2cHFHeW9FYUpuYkVoeVNacXBBL0ExV2xY?=
 =?utf-8?B?WThLWjRIY05EVzV2QktCSmRIY210bEd6eEpqcUltMDlmTGp2T3M5Tk5HS3RK?=
 =?utf-8?B?eG4rRGtQTy9CZms5WmVmbnpQZkR1eUoyQUZMOXhVU3ZQY3RaejRlMW5NT3pL?=
 =?utf-8?B?b1dWKzJDaSs0N3l3a0JFL1J4eWkzYnJLZ0pRTmRRVHZtbTdUOFpLZ2ZNc1Ns?=
 =?utf-8?B?STZMditySzVZSnkxd0VqOTZSYUY0Yk9GMTQ3eG0zRlc2ak5pMC9vWFczbkdu?=
 =?utf-8?B?amQwcVBWR3dXSDlXelQ4WjM5MVB1QXhTaGZ0RU12QW1oRTUzMVFUT09XT1VO?=
 =?utf-8?B?c1Fvak9uTVZieXFLRzRXdWN1R0VhMFJFbktEdUJDVXZpNC84ZjB4aVNmbER3?=
 =?utf-8?B?Q3dyOGtvaXd3R05qam5VY2N0dG13allDSGRWS1FXUmp0ZlcyTjNHQVdVdWUy?=
 =?utf-8?B?VHpzS1V0VGpkZStNclNGNmNpMUxNZ0pXUGZNd1E3OGJrMk1FTGRlYmxvWmNx?=
 =?utf-8?B?eE85WEpJdXRrL3JRN0ZHYU96dTF4S1p1QU1jZUF3bEk5UHJrNzBXOUlmZEhE?=
 =?utf-8?B?b0NKWjVKdXoxbjBnWkNKdDh2bDY0dUx0SDg4K3JYU1dNUFM0T2t0aFM4MmVV?=
 =?utf-8?B?ektQbUlWR3dpLy8wTFNaamtsVUI3eVRYSGlleWdxeFlPWDhLUUdNYWZmYng1?=
 =?utf-8?B?T20xSFMwTjYrUkYxa3JRb1o0U1Z0UkZ0THorUzRDcmlXd2k1WGdGZ1VValhp?=
 =?utf-8?B?WDcxa3BHK0I2WG9UOUUrK25aRXpVaGNNT29odHZYc0NZbWhORWVhTVp1cEJ4?=
 =?utf-8?B?c2tGV3I4ODVIT3Q0NVN1QitBRUplMkFnTEpvTm44aFFIcGpTRE1Qc3ZlajN5?=
 =?utf-8?B?QUs0VUdodFZMdVB5ak5WOThSWXMrSGdLR0J2bUNxN2E2TUIxRUlmSXliblJn?=
 =?utf-8?B?THFCUkk1ZWdxWVhFY2N0OGNWbTFKUGIreFFlVHZickxFeEU0OTBibFBYZ2tq?=
 =?utf-8?B?ZG10MElOZWJJcDMwT280S1QyRXJUaDAyeUpMcnI1d2hCUlNEVFppLzkwYXly?=
 =?utf-8?B?eVlyTCs2N2R4RmVzMXFnSGhoYThFTDhHMEdXeEVSRjBRRkxhM0FiUy9ZUi9U?=
 =?utf-8?B?WS9MWDA3QStEOUhxbmV2dXBjR0YwZlFoME1La1J3NGVvUkRDKzFLR3hhNDlU?=
 =?utf-8?B?OXZGUUpVeUloQTZjSTk1SjdUQnk2UW1lODBROGRmc01ZbVExMzZNVGMxRXcz?=
 =?utf-8?B?UGJrZHlVRmJZWHJJR1NRT0hYakVodzlhNi9kRWFEZG1zMkV0bHoxQXlqbTlO?=
 =?utf-8?B?V3JreUJBajZHVlNGSTdPaFdVdGxEZGRHc1lkK25QVDRsYnZpcVREZlR4TzhF?=
 =?utf-8?B?NmNvYmNJVUYrT0RJc0pBMjhYSnhtTnhadndoZHVjRnE4YThxOTZpc2REcEVG?=
 =?utf-8?B?L0tzS0Q2VWNDVllIVythbHREWkVFTVNFbWZiYlAxL3lLSTNrbUhTTFY0bVBI?=
 =?utf-8?B?QlNxZ0NGTkhpbU9LUmFCeEhWR2hNQzQ2cEFBclcvTWdtMUplbUxoSlJCRElY?=
 =?utf-8?B?alE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bdb8e09-bdf2-42ea-1de7-08dbcb4c9129
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 17:56:32.0600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N09IndKXLOYPulQVfFsenuvTr1tAbGy+mWMh0sxJQleEY0jgL5fHtZvd334W/nwmFgGqf33ERRCEdni8COUOIu1tm677FqftrJ7qxUl8lWk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8312
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

On 10/12/2023 03:21, Tvrtko Ursulin wrote:
> On 21/09/2023 19:20, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> If an active context has been banned (e.g. Ctrl+C killed) then it is
>> likely to be reset as part of evicting it from the hardware. That
>> results in a 'ignoring context reset notification: banned = 1'
>> message at info level. This confuses/concerns people and makes them
>> thing something has gone wrong when it hasn't.
>
> Noticed the "confuses/concerns people" part while preparing the 6.7 
> pull request, and the fact there is no Fixes: tag. Is this something 
> that would be worth sending to stable (manually and if yes could you 
> do that please? If there were actual user bugs filed I guess.
>
No upstream bugs that I am aware of. There were very occasional 
concerned emails from internal test teams (E2E and such rather than 
kernel) and I think one internal bug was logged about it being seen when 
running some automated user interaction stress test thing (monkey runner 
or similar). So not sure that it is worth the effort of a backport to 
older trees. And you can't really call it a bug with an older patch. The 
message was never an error or even a warning, just an info level.

John.


> Regards,
>
> Tvrtko
>
>> There is already a debug level message with essentially the same
>> information. So drop the 'ignore' info level one and just add the
>> 'ignore' flag to the debug level one instead (which will therefore not
>> appear by default but will still show up in CI runs).
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> index cabdc645fcddb..da7331346df1f 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> @@ -4770,19 +4770,19 @@ static void guc_context_replay(struct 
>> intel_context *ce)
>>   static void guc_handle_context_reset(struct intel_guc *guc,
>>                        struct intel_context *ce)
>>   {
>> +    bool capture = intel_context_is_schedulable(ce);
>> +
>>       trace_intel_context_reset(ce);
>>   -    guc_dbg(guc, "Got context reset notification: 0x%04X on %s, 
>> exiting = %s, banned = %s\n",
>> +    guc_dbg(guc, "%s context reset notification: 0x%04X on %s, 
>> exiting = %s, banned = %s\n",
>> +        capture ? "Got" : "Ignoring",
>>           ce->guc_id.id, ce->engine->name,
>>           str_yes_no(intel_context_is_exiting(ce)),
>>           str_yes_no(intel_context_is_banned(ce)));
>>   -    if (likely(intel_context_is_schedulable(ce))) {
>> +    if (capture) {
>>           capture_error_state(guc, ce);
>>           guc_context_replay(ce);
>> -    } else {
>> -        guc_info(guc, "Ignoring context reset notification of 
>> exiting context 0x%04X on %s",
>> -             ce->guc_id.id, ce->engine->name);
>>       }
>>   }


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 516867E72EA
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 21:33:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C632D10E906;
	Thu,  9 Nov 2023 20:33:46 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC8B510E901;
 Thu,  9 Nov 2023 20:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699562018; x=1731098018;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5aNTE+NUxhHNm/dCcDJ6qRBxcDCpRHbtD60ENPpFcNI=;
 b=d9nRi2UCHI78w6k+ukQuVcF5SITOZeOnHIDUwFhYI9ZC+pN4yYx8qogP
 isXkvVgUppJrK2wY0V6OzX8Ji86UkyVtC+ZWM6DnI94les6H4l9MXd77u
 eunPru/lYeZwFG5Dakc00/M1AkTD19JbA+O4NpY2FaNTc/qtxSaHSpE58
 +Hj9vKXhyyTaYlEnf00pkQD7oXrqyeuSULVdCKaeu6/kPh+sGc753uOr5
 JcxXTvN3w1xoN/0noSmFhyKjPczAQRbd09udQfldkNHgC9Q6oXU3ctprE
 uYyRiL4LsckQsKeTLL36ehMrbj0Wf1Fs484+u2QBu23HPCy/cP7Jxd6Jg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="387231095"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="387231095"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 12:33:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="11659642"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 12:33:38 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 12:33:38 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 12:33:37 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 12:33:37 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 12:33:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jSaZ1/BLbO/4UaIq1du9Z1F3A1DyXcOJMIp6Nj879fB0qy2/iF2Aza62smoDT3gV1BcgEqdRPFMPwQjc9e94eJmwgbo9RdlS7SH8Kb8sVg5yMOPfjRnNHgueS5qTjidI5BkvdGcg1N1hkvqVK1AYBeBGbMOnDrmrPNxnPoJV1uzJe5/Qbw0FYIZbFVnHyJ1edhPv1DE+uvw7SZttV0NCv9T6nL6QBOX+1KU6c8VXj6IexVw3HzdMeCQVYx5fifK5QzTl9STOKfb0myuyanNPaYrsXc3gKoZKXaXpfG7TdTRNaJMciHvZiz1I6OnW/CxfenmG5Tw6LjN8PtYjhmr1GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LgfW3//j5yq10wwvkAX5UklTzhKz9oo9BEWyuApfzIw=;
 b=TXO7pa7grdlgKH6uLzmOrdm8RbI2srZf+7xcphJb67+y0YVEruZ8E5xUZW2HUJdaf1hXRKkaIsViRwC5iBn2Nql/k/HvJ7SFkeAGQgpCt/N3yJ0cTmPfX2xTfZbBARDVH41OIh4WygWoG3e3RfZ9NrHEhU9PvFaN469pc3R0SQu9MMowSzftlLZa/vxFoxc5+v5EQOaGYoQQb/xx0vD/K28wZGTzMYZDrKngkJDfMeleMl+bFIp0uy8YK/zUCuGayh4Aqu2D9Hl45qNdRbeDj8a0tixEZ0IB2f8pVktY3E4aNwkDYTVMl0OGd2KpoC4NaBhFQOZqtt7FWCtOOB0BPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SN7PR11MB6774.namprd11.prod.outlook.com (2603:10b6:806:265::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18; Thu, 9 Nov
 2023 20:33:35 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::588d:b37f:130c:9e86]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::588d:b37f:130c:9e86%6]) with mapi id 15.20.6954.028; Thu, 9 Nov 2023
 20:33:35 +0000
Message-ID: <99cd1ec9-1cbc-4692-bc9c-9bf1bc8d4058@intel.com>
Date: Thu, 9 Nov 2023 12:33:35 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/guc: Fix for potential false
 positives in GuC hang selftest
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20231106235929.454983-1-John.C.Harrison@Intel.com>
 <20231106235929.454983-2-John.C.Harrison@Intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20231106235929.454983-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0045.prod.exchangelabs.com (2603:10b6:a03:94::22)
 To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SN7PR11MB6774:EE_
X-MS-Office365-Filtering-Correlation-Id: c9c4d6e2-0756-4b9a-dcda-08dbe1632590
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HA6En9rnBc4sFzX1bl9XhBMSOGEK/V4Hbvpn/BCqgksN5s5BmpqppwYwULB9v7ZGSe/xjUxr38sunoIuS03CinNCJkgsyXIPCfRDBAl94WSfKm1RJBT1wqFHCpS8Zww+X+VryQeRiDrHxr6fqXEOtkRSLQLnGE1xzpMW3zSXjIFRt2LSlkrPsANkPOFAIv7u/McJ+pKb8Yz5QNxglVkocxbTXNx4RlnIG77XA9N5tZQtrKt8gbE/oH2C84iaUTPjs1MCkpDxpsPzgJOp0hBAK0yF+1xva7A9ztija/RQIrVJcNIRnK6a9JoOehskBd9iFwEZzSz3phKBChpDzh4s3G7JT/mqHygjvDoGNx7v6er+HwpgvH3RvCCdEMEHvDuwPO+tM7bStuusf4feVhr0paiohWko4R4/wsrmwaUpqxTNKqyXUSV5RHBfI8j4omWPNUdw6IauPRBeTkEWqv8fetVAXFs9jS0Ur1iPzBrMMHmLYunARfCyqYzBZfLL8ywCVUEnqp/ZnqOyPyp1ydQXPmf9kxpuVfjIWYD8CqSQJyERZ9r7sOObPDIguiy3HkVRt/ID0pI0CZYQpeyWmHuy++oI7+xv9xrgGaAwlpSmIEZucOX9IeQvlaw1FZh5sqX6EYzAgzm/8bLc7cu27+yFxw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(396003)(136003)(366004)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(5660300002)(2906002)(6486002)(478600001)(2616005)(82960400001)(36756003)(26005)(6512007)(53546011)(6506007)(316002)(41300700001)(450100002)(83380400001)(38100700002)(4326008)(8676002)(8936002)(86362001)(31696002)(31686004)(66556008)(66476007)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUNKMTVMM2YwQkVRMmZYT3dvOVVVSWd4djFTdE5tQklBcldzdDZwbkZnTzhE?=
 =?utf-8?B?dStMRHZRT2J4Ums1bWNBUUZsb0ZCMU9WdXMxcTNDSUd5RWNGU1Rlc3hUVHdS?=
 =?utf-8?B?Q1BsN0huTTFZOW1YelBRb1lhRDd3cnZGL0lrUnpKRmI3WmJ6U0x6R1JzUU01?=
 =?utf-8?B?ZVJTdGJ2NVFhaW9pamE0VjB1dlU5TlJTM1o3czU4MCtpYlQ1VHdLTlVNTzVZ?=
 =?utf-8?B?U3dQbFNuRXMxMzVnODgzeE9McXgrR2RpOWl4eGZCQXhvcTZOWDIrZkh0N3hB?=
 =?utf-8?B?cnhYR0VwQ1hMVVhHa2xPZkN6YTNBRjI1U29vOXhBbVc3Lzd6c2pzRS9RNUtH?=
 =?utf-8?B?MktTSkdRMnNwSGl5MERueTZFZUExMlk1RHk5RkhLWDhSR0NRM3g3UFdNVE8r?=
 =?utf-8?B?bUtpWGZQN1ZKTm5qVHdGbzkvUDZrc1BiZzJFcVdjc3ZUUkhidFl3aWtDK3F5?=
 =?utf-8?B?Z0haamxQUklqNFJOM09oWXEyclhlY0VHRmdiYWJEZXoybFNpNlBBT3Q4ZHVR?=
 =?utf-8?B?eEdqOENBN2NPQkppakpvRmFtd0VJMzJSOXpzV2ZaQWxVdDBQQ0cwRCtHdG9D?=
 =?utf-8?B?S2U0RUI5ZktJaktpbUVvbEhnTVdneVpPYjFDYTc2QVNCcExHWkwxNjl2TU9k?=
 =?utf-8?B?aFVoSkFRUHFGUG51RVh6Q0F4RlZvTk0vRkZpcTFlSFRmdTMrWWJIdERleHBP?=
 =?utf-8?B?NjhIVEluMzhkMUxXNzN0UFhHTzJTcWppV3VGWXk2TVA3Nm14U05hVEM1cjJ0?=
 =?utf-8?B?WTFzaG5mdEV4Q0s0QzdIWjk0aXVrVDdRV085MTErWjFycWZiclZkUVlESG9Q?=
 =?utf-8?B?SjJDQTJpcmtRT01CWk9OOGJUQ2swUVNPYTBIOCs0MkZjZThRQUpUWDJCVjBY?=
 =?utf-8?B?ZjM3QUZQS003eGpKTTh0U052U0xWSmxabm9LUVN4MEljSlpOdEUwZCszT2JZ?=
 =?utf-8?B?VVlBclJIMWtHSnhZK0xuNzBNSVd1MEEvZ0Y1d2xWUzVxdEk4MXpTdksrZTNs?=
 =?utf-8?B?Y3RlOHduYzVKaEREYTdFM1ZLVFRxUlk5dFFySWRwK1l3QWFZMUU3V0JvYW54?=
 =?utf-8?B?OWFMcTZoVFF0MEdmZkNNOFZWbTBkUy9PRHl5SnVGdjByWHVnM0hRNjRzRW1t?=
 =?utf-8?B?RUt6dGFNZ3FyWS9pcWwxTG5xRkM3bFlZMlNpMFo3M2RTYmh1dkppREF1Ry9P?=
 =?utf-8?B?UFRoVHlmWWtBNlR0VU1GNHc4UEhqdWtNR1V5Ry9NKzVXdktKUDR6YjZCSWc3?=
 =?utf-8?B?K21EVzBGZnRPR2pUeWt0QXFJbmV6dEJZVllNaWErRWpBWFJtZS9OT0VMY3BJ?=
 =?utf-8?B?cUtPZUpPS1lGWUVHVUVJQllBQWlDY2srQ1FlNzVmbE9tNTY4MWdSbW8vQ2lR?=
 =?utf-8?B?Vy9hMUZCM2ZXL3l1cUdNMzdrSnRQdGNpOFB0a2lsU3dkQytON245V3pjM1hw?=
 =?utf-8?B?RkJPQ0I2aXMwZjlDcDVvekJCRVF0Tk53T0JNb1RoS2h3aUF2NXlkb3FmdDU3?=
 =?utf-8?B?OTBFdXV4bndHb09SNWVHS3FJTnZtVjZyQnlld1AwWW4wdlZlUUFhdTZjOUNj?=
 =?utf-8?B?enJHY3c2VU5sU0g4RWkyS253VENzeHVUZUZGRU5US0orUXhraUdvKzBGMThB?=
 =?utf-8?B?UllGTDk4Q2F2QkRqanlycHA4Sk9qWk51Y2ViQTc3dnVobGdUMnRrd1lSNUFh?=
 =?utf-8?B?YWZtZzNoWTN0Z20xVGFpVjFvYnlid2NpV2R0bFp1RlJBZ1pqSlk1SUlhVXhm?=
 =?utf-8?B?T21ZTUNRQ1h3RTVRZVJaRnh4K0lsRUs5eFBKbVpUbHYzRDZIdGdNY0Z3ZkNW?=
 =?utf-8?B?cy9mcHZlQ291NCtyMzJwekFKTzhFSndwdFpURC9icVRMYmVIT1dBQjR1M1Zi?=
 =?utf-8?B?dDJwSEs5eTlKZmpaQ2hGeWNQNmlQRjBVL1cyV1RmV3NhVko1UXUwUEltQnVR?=
 =?utf-8?B?K21saTF0T1E5QUdiSCtCZGhoQ3NVU3ZjL1lGRTVXTGhaVDBLdWlUN0FKZ2VV?=
 =?utf-8?B?NjU4Rk41VFh3Y3MySGVOb3FtRjFxam9pOUJlYXl2STBrVExZbkw1WDZMSEw2?=
 =?utf-8?B?MkY3dVJsN255c21wcXhQYVpaYWszeEQzeEtmVjVDaEs4cUE4Z2pTZjRjcGU1?=
 =?utf-8?B?TGZua0pKVGRmR204a3pYNmtaV1ZTZ0lTMnh5MUlLOTgzNnR4T2p5OEtCbUU5?=
 =?utf-8?Q?IYS1KGsDj2RkgLdJx3sEhI8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9c4d6e2-0756-4b9a-dcda-08dbe1632590
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 20:33:35.2436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8I/7RXt82KX/uta8r5tarcqCVmqWphRBvSAG3qMzKJ1oPfPRCO7Ss4TpL09f+B7mH91oHmqmYNws6xc39zrZwZW6DfACkbHNdTHS3uVIIQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6774
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



On 11/6/2023 3:59 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> Noticed that the hangcheck selftest is submitting a non-preemptoble
> spinner. That means that even if the GuC does not die, the heartbeat
> will still kick in and trigger a reset. Which is rather defeating the
> purpose of the test - to verify that the heartbeat will kick in if the
> GuC itself has died. The test is deliberately killing the GuC, so it
> should never hit the case of a non-dead GuC. But it is not impossible
> that the kill might fail at some future point due to other driver
> re-work.
>
> So, make the spinner pre-emptible. That way the heartbeat can get
> through if the GuC is alive and context switching. Thus a reset only
> happens if the GuC dies. Thus, if the kill should stop working the
> test will now fail rather than claim to pass.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c
> index 34b5d952e2bcb..26fdc392fce6c 100644
> --- a/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c
> +++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c
> @@ -74,7 +74,7 @@ static int intel_hang_guc(void *arg)
>   		goto err;
>   	}
>   
> -	rq = igt_spinner_create_request(&spin, ce, MI_NOOP);
> +	rq = igt_spinner_create_request(&spin, ce, MI_ARB_CHECK);
>   	intel_context_put(ce);
>   	if (IS_ERR(rq)) {
>   		ret = PTR_ERR(rq);


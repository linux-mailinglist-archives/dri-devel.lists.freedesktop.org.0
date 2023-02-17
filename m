Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B176969B412
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 21:41:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C16410F0E5;
	Fri, 17 Feb 2023 20:40:59 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F0910E45F;
 Fri, 17 Feb 2023 20:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676666458; x=1708202458;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=obH/udBpjLlvH1vssJrjp0ky+N3+Ty/tYr0LqBaqWb8=;
 b=Nr1v8TwpC2jJLFy+skN0ny/hi7VD8G/JV27PZnM1BGj+lOXCrW1VLHLb
 rYpr1lGTWFYCwI2qRuMA52vxApobliildMcOFGxGl7+DbvqY7MtPQgB0g
 2O6+zVT/e1/7SyZcDeNPrKIL4huHEH64yDp039aMuNrAK4bJ0NyNyi/ls
 ZPwCvHMt0Avu/tcLVNzolxh03vnpLtLVyaBEgOsgENwDk1Sthuvfxu17H
 kwFWw0ZNjBF+tS3nu+EYCxmNS50TlrU88nAXZPm++YjODWut+/oJvi7fI
 lrOdcUn6HjhDj99X5yJRuxdIhkoAz5rmI3vj6xgJSeDNVjQpTW7FlgeO6 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="330749573"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="330749573"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 12:40:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="844696722"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="844696722"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP; 17 Feb 2023 12:40:57 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 17 Feb 2023 12:40:56 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 17 Feb 2023 12:40:56 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 17 Feb 2023 12:40:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S4S1qitl2IrfThnCNzfv6pJUacC/E4ufN+sdnTVE3Mc2EVtm9ljfsLaNSXyzN7caEs6bf0A0P7k8brABAm0pwUeMNOAoCCUryDOjCrJxcOc9NzlQmd7PXwKGNcpJ1LIE6WPl1jcwOX9y+by68PvE7p5aEfatms2ThdyvRwVfi/+QJxy5U5lkqWaZsDH8ZG/yBr32L1PDOMX4koSJ9su/zgXP9iXHC1+tl1qL7egRPGMhQFIPVaSFwhZZeuROOkGQZj/EHb4FU9iseCVOVmOUvuChvZWevyAtK0CV2d2V6z4j+IvXbX8Go22KpHf9skHxHKzpsWFJpNsynvgfnl215A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GW3NELfcLZhpvyKR9EVeaiUZclBrCuZ2/MnDZH9acV0=;
 b=Db2VWb3+nk5aG6gVC/shk3x4SGK2iSk+WOwE1TbnviXekI3/Co5RiyeK0zOozhBV3P+UmJd0EFnF/GODlfv94pLW52/OgfDePYGmOLqp3ixaMd52/L2RRM8ft9ZAQOYppKTSQLa+Tdu42WAzM3DHUm9OHJYV2FMsxQkl89aF6xY7LRLt6/oSBQ6c6etEn9HC9FmUtcI3yAIxsRxTilFeEp6IkdOqe4wLTiMwNcv547r2rnOZ840+i2AyNkAfVgh2/hxpZy12HJzKDiq+RiIhjVNZzb1zFnVtuV7enkZ2NBXhYcyc0V1NeRqKhmTSl1PMeUzrytY0ZCPpPG3V4xabmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by PH0PR11MB5628.namprd11.prod.outlook.com (2603:10b6:510:d4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Fri, 17 Feb
 2023 20:40:55 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::5399:6c34:d8f5:9fab]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::5399:6c34:d8f5:9fab%6]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 20:40:55 +0000
Message-ID: <bc45f128-bb22-7b35-d931-22e13a7902c0@intel.com>
Date: Fri, 17 Feb 2023 12:40:52 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.2
Subject: Re: [PATCH 2/2] drm/i915/guc: Fix missing return code checks in
 submission init
Content-Language: en-GB
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230112015447.2430224-1-John.C.Harrison@Intel.com>
 <20230112015447.2430224-3-John.C.Harrison@Intel.com>
 <00d0e2c1-3187-7025-c8eb-821bee0d0f45@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <00d0e2c1-3187-7025-c8eb-821bee0d0f45@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR05CA0033.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::46) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|PH0PR11MB5628:EE_
X-MS-Office365-Filtering-Correlation-Id: 54c8e602-4ac0-48a9-8ab3-08db11274403
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5NMX7jSUiXIJX44B+L3aAluwHW1A0bfSBbQbE4qGWwMitYEhjFvcdjW9comkQsa3Gu/+9YWm0A2CMIlW6Wjh544higNTb0K2t39aVjoAYprjjIiwSE7qX/HTaDaUru669eDXuzN5JbQvuS5yy3NIaGFFzjmypD1wTFQLn/4fTKFzuudLvS9UiE7h3sNYdtIhRxDFkv7tWixi/hylKZRzurwlbmWWkvx6MeGRPR6uLRMJz2CJ+vwMuFlosWgpyE1b+2cO9o48s/IctczLJKmBuv05aswPtr1NYcYCiYkooBG+xalQXQk3viXe1YkPQSgtayCg/H688NlpQMrh+AtWb0FDPGekn8ghnSDuy9Nrw8E/hNKbah8L6I8GWF57ESh9USNOpmH6gWcp7M1XghjLLdx1fPyBsK+vFr2JyOxYDKp6TBawNueN9SVa2mTGo9DBOT8BlrG0yUEpwIsf0JBWXx4YWlcMw+U60Z9Rr18io9PyRKUl2lSKoxEjl1HtP7RHQOeFGVetwS8d4df57Gd5718AYnjrk8wu4kMYGSrVIubfp0Emd5rYcz/yu+teSkeyNOOrWuZnKo3u+E/pzCV20mGvalidINJTDnDbT7Xs49PdBaG8towXMSF/LmhkCmzFpejBgk0w6j2EqLkQC+Xw4LFdwEPVlc1UYro7UkcgM535WHsaCjbRTk2VD3PmI0Z2YAWE/IvihuVr/JrbmEP+axfbWT0MI2deQ2RuSCeoFoI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(136003)(346002)(396003)(366004)(376002)(451199018)(83380400001)(38100700002)(82960400001)(36756003)(86362001)(31696002)(2906002)(8936002)(5660300002)(41300700001)(6512007)(478600001)(6506007)(186003)(53546011)(26005)(6666004)(316002)(2616005)(450100002)(66946007)(66556008)(8676002)(4326008)(66476007)(6486002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3hSMGY5OUluNmovVnpsRkxkMzBna2h4SkJ0UkpqMzB5Y0o4T3diaUxxSW5G?=
 =?utf-8?B?Uk5RRTZjYzF6bzVWdTRVak0zN051Q29IZmg1d0lNYWNpVS9GK21mQSsxVWJH?=
 =?utf-8?B?ZlRaRDZheDVTcGN6N3hQeStGMm1TRytvSTU1cDJ1c0dwdG5heGhNZzYrQ1ZY?=
 =?utf-8?B?M0sxTDRVbjdnU2sraGxnVTdlb1oxb1lHTHRrVUtSUmJxbjdDYmZSUjY4YmNJ?=
 =?utf-8?B?T2NKVVF2Nzg5bjloaFRPcEFTaDZ1UE8zcUdJQlNjQUovSzFXaGRoL0NqK0tJ?=
 =?utf-8?B?UXdtUXBqMmhadjh1TnVRZFU3Y2ZHQW1XSlROV2ttK3NMRlIxR1NNVWdDS0kw?=
 =?utf-8?B?WlREbVFteldpbUVKbk5yMGxxTGJWUkQvbDlwS0w5SW1sZGMwRmdFYUE4cmo1?=
 =?utf-8?B?SFV2a2MyTWsxWDNQbXpoRi85NXFVRkZZR0dtS29xU3Q0YVhXUm9zM0hVOE1R?=
 =?utf-8?B?eFE1TkdBZWRtUzZpbEpFbkVZTUFjRTloR21yaUFkN2V6dnVsNWVwa3luWXhM?=
 =?utf-8?B?L0lNajBjUCs2VVNWYmgydXZLTDF1ZVc5NktPU3F5Yk91TUFISnFST1F5WVBi?=
 =?utf-8?B?SVY3clQ2aTFwem5SQThZdG9qdDdqWWdtS0NsVXJ3S0l5R3FMTmtQaGEvd0JO?=
 =?utf-8?B?WGlIYXFrQU13T2VoSHU3WWZZckQvcnhhVlFQZWxxb3pIQTJrYXQ5M1RKblk1?=
 =?utf-8?B?b3E5QkxjSElsdGtkbDZrQmIwalhJWDFJanVBN0NXQUxQSllYTzNpMkNvSy8v?=
 =?utf-8?B?OWdGanU2UkFWWk10V1o2ZVhXZ3hQMkNoSFNieEdEaGt1aDF2d3YzekJWZis1?=
 =?utf-8?B?V0ZkSDE1OU5wb0JBQW9XMTF4NkFVZjdNTWJ4Szcvb1YrR0ljN0ZrNmE2Vjgw?=
 =?utf-8?B?SmY4Tk9hdUlFRDNKb0RTT0pFY1JCb2szMUwreEhBRmhMUUdjQi9LTTB3Z21p?=
 =?utf-8?B?d29zaFpsNXQyZmhhVWlPVmVVdi82SnJrMEtKWkNtY0kwMmVrUGxXbmt6L0Y2?=
 =?utf-8?B?eFYzRk1ZRkZpTW9ONWhsbVFESVRiMU1MWFNuUE94OHhBT21pcHNFS3RmSEFo?=
 =?utf-8?B?WDdkbjl5MXRsbzhwNmJDckRFZlhyTkxNUTV5bmtQZDNieWkyTFdLOEt3c0J6?=
 =?utf-8?B?emxuZ0pNTDcvcHp2ZllpZ05vcGJjRnhHU1B4WXVGTVVDTXI5SFE5U2hhcDRN?=
 =?utf-8?B?ZGZhTWlWVjl0YjkwRU43YXZBamh0WEwvek5BY2VpVEJoTWRqL2VLb2RlQzR5?=
 =?utf-8?B?ZVpQTis3WDI0eFN5WXpFbkZiVmViejgvMm1tOUtRL3NsRnRZWmlhWG43L0RR?=
 =?utf-8?B?QndVWmNuOEpGQTJjWWZZQllIOGNXK2h3VndHNFFwQ2NiNUdvWEZOY3M1dlhh?=
 =?utf-8?B?SXFqWVVwckZRVTlGVGI3M1JrUkI1aTlhOTdrNlZsUDA0OSt1dU85THljZTRB?=
 =?utf-8?B?bG9jNzM1ZUpveiswRks0UnUybmlnSTdVYktqUUM5K1hqQUJMSU0rVU9nY0RY?=
 =?utf-8?B?T3p4Q0tkSlRFMzlFdVZDVnVBMDBiUzd2VjBMdG42VjQ1WUkrcnIwZ2hvRWYr?=
 =?utf-8?B?QkRONWZvT0pNRkdiQ1p5WHNTdzVHOUtBK3VOYjVmMVJKL1E5TFlSeTIrbUo4?=
 =?utf-8?B?U2trMG5CQ1VJU1ZPbThqNm00dlAxVXpEYmk1RWdOQzVZMHZpSStQUDk4cFpw?=
 =?utf-8?B?a0UxLzBIa05xNTNBeUh1RWw5bFZReFhsQWFKVzNuNTZLTHlrcXgzc2JCeG1B?=
 =?utf-8?B?WThKTTI1OUtYSTdVejVOU2duKzlwUjlBdzVFNnRhV2huWjZTZ3VMMkdLUVVM?=
 =?utf-8?B?dGJ6M3o2aCtqdk9HV1ZEdENLQ2VXSlZ2Z3cwWXhTckpUUllic094R2U3TFdy?=
 =?utf-8?B?Z3FEYUU4aWdEdGdtekV5M2dFKzlsaUxVL3BwRVZwYTEvWi9pcll4WHhsS2JQ?=
 =?utf-8?B?TzBtblRhVE1xZG1WcjJuWXVrUk5CaVUyWU9zZnlCdE1rZEFic0lyTzBjK3d4?=
 =?utf-8?B?R05tNi9sZ3JoL2l2emIxM2N2aFFtUDV6VHBHUkFqQ3labTB6TGF3U2QrOHRm?=
 =?utf-8?B?MVNVcFF4TkdiT2ZGOEdWeUlEMnZXV1d5aWFLYnQwdEhDOUU0WjFqNjgwZm5r?=
 =?utf-8?B?eDJ2NzZPSnBCRy9UWGkyV043b0NHRlVBTFhyenVVMmxaS0tVNjZCa244R09p?=
 =?utf-8?B?OUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54c8e602-4ac0-48a9-8ab3-08db11274403
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 20:40:54.8036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0r6UYSQYmqpjXnHuArrKnNINQMreJWmNn7Ryy5xEq39/p9miYthloPrk5TJIzDP4/tQvf/c50L16gKRwjslv9uIQNJid/A1lrUs9OfPS4R0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5628
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

On 1/24/2023 17:01, Ceraolo Spurio, Daniele wrote:
> On 1/11/2023 5:54 PM, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> The CI results for the 'fast request' patch set (enables error return
>> codes for fire-and-forget H2G messages) hit an issue with the KMD
>> sending context submission requests on an invalid context. That was
>> caused by a fault injection probe failing the context creation of a
>> kernel context. However, there was no return code checking on any of
>> the kernel context registration paths. So the driver kept going and
>> tried to use the kernel context for the record defaults process.
>>
>> This would not cause any actual problems. The invalid requests would
>> be rejected by GuC and ultimately the start up sequence would
>> correctly wedge due to the context creation failure. But fixing the
>> issue correctly rather ignoring it means we won't get CI complaining
>> when the fast request patch lands and enables the extra error checking.
>>
>> So fix it by checking for errors and aborting as appropriate when
>> creating kernel contexts. While at it, clean up some other submission
>> init related failure cleanup paths. Also, rename guc_init_lrc_mapping
>> to guc_init_submission as the former name hasn't been valid in a long
>> time.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 91 ++++++++++++++-----
>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.h |  2 +-
>>   drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  7 +-
>>   3 files changed, 75 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> index 982364777d0c6..dd856fd92945b 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> @@ -1431,7 +1431,7 @@ static int guc_action_enable_usage_stats(struct 
>> intel_guc *guc)
>>       return intel_guc_send(guc, action, ARRAY_SIZE(action));
>>   }
>>   -static void guc_init_engine_stats(struct intel_guc *guc)
>> +static int guc_init_engine_stats(struct intel_guc *guc)
>>   {
>>       struct intel_gt *gt = guc_to_gt(guc);
>>       intel_wakeref_t wakeref;
>> @@ -1447,6 +1447,8 @@ static void guc_init_engine_stats(struct 
>> intel_guc *guc)
>>           cancel_delayed_work_sync(&guc->timestamp.work);
>>           drm_err(&gt->i915->drm, "Failed to enable usage stats: 
>> %d!\n", ret);
>>       }
>> +
>> +    return ret;
>>   }
>>     static void guc_park_engine_stats(struct intel_guc *guc)
>> @@ -4108,9 +4110,11 @@ static void guc_set_default_submission(struct 
>> intel_engine_cs *engine)
>>       engine->submit_request = guc_submit_request;
>>   }
>>   -static inline void guc_kernel_context_pin(struct intel_guc *guc,
>> -                      struct intel_context *ce)
>> +static inline int guc_kernel_context_pin(struct intel_guc *guc,
>> +                     struct intel_context *ce)
>>   {
>> +    int ret;
>> +
>>       /*
>>        * Note: we purposefully do not check the returns below because
>>        * the registration can only fail if a reset is just starting.
>> @@ -4118,16 +4122,24 @@ static inline void 
>> guc_kernel_context_pin(struct intel_guc *guc,
>>        * isn't happening and even it did this code would be run again.
>>        */
>>   -    if (context_guc_id_invalid(ce))
>> -        pin_guc_id(guc, ce);
>> +    if (context_guc_id_invalid(ce)) {
>> +        int ret = pin_guc_id(guc, ce);
>
> Why do you need a local ret variable inside this if statement, when 
> you already have a function-level one? or is it just a cut & paste error?
Yeah, copy/paste thing.

>
>> +
>> +        if (ret < 0)
>> +            return ret;
>> +    }
>>         if (!test_bit(CONTEXT_GUC_INIT, &ce->flags))
>>           guc_context_init(ce);
>>   -    try_context_registration(ce, true);
>> +    ret = try_context_registration(ce, true);
>> +    if (ret)
>> +        unpin_guc_id(guc, ce);
>> +
>> +    return ret;
>>   }
>>   -static inline void guc_init_lrc_mapping(struct intel_guc *guc)
>> +static inline int guc_init_submission(struct intel_guc *guc)
>>   {
>>       struct intel_gt *gt = guc_to_gt(guc);
>>       struct intel_engine_cs *engine;
>> @@ -4154,9 +4166,17 @@ static inline void guc_init_lrc_mapping(struct 
>> intel_guc *guc)
>>           struct intel_context *ce;
>>             list_for_each_entry(ce, &engine->pinned_contexts_list,
>> -                    pinned_contexts_link)
>> -            guc_kernel_context_pin(guc, ce);
>> +                    pinned_contexts_link) {
>> +            int ret = guc_kernel_context_pin(guc, ce);
>> +
>> +            if (ret) {
>> +                /* No point in trying to clean up as i915 will wedge 
>> on failure */
>> +                return ret;
>> +            }
>> +        }
>>       }
>> +
>> +    return 0;
>>   }
>>     static void guc_release(struct intel_engine_cs *engine)
>> @@ -4400,30 +4420,57 @@ static int 
>> guc_init_global_schedule_policy(struct intel_guc *guc)
>>       return ret;
>>   }
>>   -void intel_guc_submission_enable(struct intel_guc *guc)
>> +static void guc_route_semaphores(struct intel_guc *guc, bool to_guc)
>>   {
>>       struct intel_gt *gt = guc_to_gt(guc);
>> +    u32 val;
>>   -    /* Enable and route to GuC */
>> -    if (GRAPHICS_VER(gt->i915) >= 12)
>> -        intel_uncore_write(gt->uncore, GEN12_GUC_SEM_INTR_ENABLES,
>> -                   GUC_SEM_INTR_ROUTE_TO_GUC |
>> -                   GUC_SEM_INTR_ENABLE_ALL);
>> +    if (GRAPHICS_VER(gt->i915) < 12)
>> +        return;
>>   -    guc_init_lrc_mapping(guc);
>> -    guc_init_engine_stats(guc);
>> -    guc_init_global_schedule_policy(guc);
>> +    if (to_guc)
>> +        val = GUC_SEM_INTR_ROUTE_TO_GUC | GUC_SEM_INTR_ENABLE_ALL;
>> +    else
>> +        val = 0;
>> +
>> +    intel_uncore_write(gt->uncore, GEN12_GUC_SEM_INTR_ENABLES, val);
>> +}
>> +
>> +int intel_guc_submission_enable(struct intel_guc *guc)
>> +{
>> +    int ret;
>> +
>> +    /* Semaphore interrupt enable and route to GuC */
>> +    guc_route_semaphores(guc, true);
>> +
>> +    ret = guc_init_submission(guc);
>> +    if (ret)
>> +        goto fail_sem;
>> +
>> +    ret = guc_init_engine_stats(guc);
>> +    if (ret)
>> +        goto fail_sem;
>> +
>> +    ret = guc_init_global_schedule_policy(guc);
>> +    if (ret)
>> +        goto fail_stats;
>> +
>> +    return 0;
>> +
>> +fail_stats:
>> +    guc_park_engine_stats(guc);
>
> personal preference: I'd prefer an extra guc_fini_engine_stats wrapper 
> just so that we're balanced with the naming, but not a blocker.
As per comment on previous patch, I'm thinking I'll rename 
guc_park_engine_stats() to guc_cancel_busyness_worker() (and add a 
matching enable). And I agree on the naming here. But adding yet another 
wrapper would mean having this:
     guc_fini_engine_stats() {
         guc_cancel_busyness_worker() {
             cancel_delayed_work_sync();
         }
     }

Which seems excessive. A wrapper around a wrapper around a one line 
piece of code. I guess the compiler will optimise it all out and it 
leaves room for future expansion if other things need to happen in the 
middle layers in the future.

John.

>
> Daniele
>
>> +fail_sem:
>> +    guc_route_semaphores(guc, false);
>> +    return ret;
>>   }
>>     /* Note: By the time we're here, GuC may have already been reset */
>>   void intel_guc_submission_disable(struct intel_guc *guc)
>>   {
>> -    struct intel_gt *gt = guc_to_gt(guc);
>>       guc_park_engine_stats(guc);
>>   -    /* Disable and route to host */
>> -    if (GRAPHICS_VER(gt->i915) >= 12)
>> -        intel_uncore_write(gt->uncore, GEN12_GUC_SEM_INTR_ENABLES, 
>> 0x0);
>> +    /* Semaphore interrupt disable and route to host */
>> +    guc_route_semaphores(guc, false);
>>   }
>>     static bool __guc_submission_supported(struct intel_guc *guc)
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
>> index 5a95a9f0a8e31..c57b29cdb1a64 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
>> @@ -15,7 +15,7 @@ struct intel_engine_cs;
>>     void intel_guc_submission_init_early(struct intel_guc *guc);
>>   int intel_guc_submission_init(struct intel_guc *guc);
>> -void intel_guc_submission_enable(struct intel_guc *guc);
>> +int intel_guc_submission_enable(struct intel_guc *guc);
>>   void intel_guc_submission_disable(struct intel_guc *guc);
>>   void intel_guc_submission_fini(struct intel_guc *guc);
>>   int intel_guc_preempt_work_create(struct intel_guc *guc);
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> index 9a8a1abf71d7f..8e338b3321a93 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> @@ -537,8 +537,11 @@ static int __uc_init_hw(struct intel_uc *uc)
>>       else
>>           intel_huc_auth(huc);
>>   -    if (intel_uc_uses_guc_submission(uc))
>> -        intel_guc_submission_enable(guc);
>> +    if (intel_uc_uses_guc_submission(uc)) {
>> +        ret = intel_guc_submission_enable(guc);
>> +        if (ret)
>> +            goto err_log_capture;
>> +    }
>>         if (intel_uc_uses_guc_slpc(uc)) {
>>           ret = intel_guc_slpc_enable(&guc->slpc);
>


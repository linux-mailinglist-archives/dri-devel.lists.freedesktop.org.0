Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D97C7825B43
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 20:57:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0391010E65E;
	Fri,  5 Jan 2024 19:57:13 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B989C10E65E;
 Fri,  5 Jan 2024 19:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704484632; x=1736020632;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ly8t5gQDE+qf8n9lMerW3t/hwGCNVqIkL99i7TO+EKc=;
 b=igEv8pEmoqdWfxiBH4NEEvSEPmb8kJvGpSnrpADg8tBO49kiB53nFM1a
 Hlm7UYGV+V0woStTyLPRtkxSrBWQ10cukHScbq01xOISRntPgZG+0dihw
 oIws+DdoDDijKg9QFpLlbWq5332QMDydjZLFdqM6Y0KeQNgXiFhGUEzec
 Jj+NBI8/XuBZLyN9nNjAuecoN+3G/wfstj3/FUeEUOXaaoCPt78zD83uU
 x4zLW1Om3URS5teRFq74V0ytH8+GXjMyzOHWWCW8YzBS8raJuK7B7YZu4
 LOW6yVchTQ2/5C6yV7AqPSL6v5i7R+L3B3JdPxG5RmOK/A+XkSJjKTyNu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="16189177"
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; d="scan'208";a="16189177"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 11:57:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="851219572"
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; d="scan'208";a="851219572"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jan 2024 11:57:10 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Jan 2024 11:57:10 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Jan 2024 11:57:10 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Jan 2024 11:57:09 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Jan 2024 11:57:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ItDj5WGibGyke4m9BLquV/2Ma1myhbZ6xBJeYXgeLbM6p2u0S6usyjYCSPcRnarsqzYaTn6GPtnOFUU/VT8KyWcKWFbJalzfAECeMSQwioRfJL1+RVDmgLGAEkv1FLfYxIPp9lLuzWKSHeNfM/b41cXnEOTVRHYpuAZDqahgSlQ2lmmsp+ic8mNNo4iTYL/cJovCA1JEjBvd+AvcF+ai9sO20CpP0Q7h4LMdjSgzrFmy2NCoINRU8+LTSnMuv+JiXuKZF6QZzkhGpsDxACGNnX7r/si7DsqVHaUbuIl9lobTovB4rhTLw4y31FM3OjHpFjMazXNoE/jHnFIhw+VtMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fkuR422i/Zds4kGdMdTcG/jdSqjDs1vVeU/Vq6A5Gn4=;
 b=dptUE43xlftBbe9iawfyZLXT9CG7cq3i0hlht7Wt+9PjltiOAhWUwelCyQGWPDY6gh/lUG4dLvJf86lvfpF1ktzT/kulLZFE/IPc1g+Y2FkS8+4pkC2njaeOosUEX3IWwXvq9sdtU+XdO/Z/cmSAgSZi7K5UXBMlIUYYJzjV5NQz+qsxi/I5Dxz/bYbSWeSG27xNrOIEdrc2spHoBbPO//vYbi0oX4Kk8aIBGuADBVlcawXVYK4SaqBBw4+WfRPUxTwTHI1R5895UDh5D8Ed+wsRyPWHiK0bo4Y08a/PooiKMDiin6zFsa5aIr2EpIhAgwjAcj/YZ43WmjeCjwuQcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CH0PR11MB8141.namprd11.prod.outlook.com (2603:10b6:610:18a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.16; Fri, 5 Jan
 2024 19:57:08 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f%3]) with mapi id 15.20.7159.015; Fri, 5 Jan 2024
 19:57:08 +0000
Message-ID: <26f6bd49-0b04-417c-a6f0-0dd95d1e1e11@intel.com>
Date: Fri, 5 Jan 2024 11:57:05 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/huc: Allow for very slow HuC loading
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20240102222202.310495-1-John.C.Harrison@Intel.com>
 <2b20c2a7-5f1b-4615-aa97-bc20cf8cf787@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <2b20c2a7-5f1b-4615-aa97-bc20cf8cf787@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0198.namprd04.prod.outlook.com
 (2603:10b6:303:86::23) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CH0PR11MB8141:EE_
X-MS-Office365-Filtering-Correlation-Id: facd08c4-4e54-4a3b-e3d4-08dc0e287f6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2qP7zU+WnH21MnhxFz98fu6CzJyz6aEy/OLujO/OdtzkNnp7EcJkYs8cPjWYgbkQX/xjVKqKoqD6RCY/Zv1zy6POTIAlEL9JNTIYDY5Txq4fl4NavcSPRYTv4p6Wxljn2NxkvqvSG4GTkUP96W86fHLNEcsG3wN8EJFdy30PusoGAnDTZuumsXB69n1R4mHt8Nd4AWOwpFP+SlJavPjx7lIB2Am8bnYzTnkmM/qCdvFQxG0nVd2gIev/KH3Fl0XjyFFmLC5Zbxwm3rLUD4y3pX1Mt1q8rDzzQa0U4Gzx3JZiGvJ0cTdGHV/R2f6vwXf4h2yvrpiCSo0PfEVtnRO2uwnRCtVS1HsZWlwduOEDKyL1krmt63iFwIwSOPsRyAqHTLSJk1mJHUJk8l1cyHDWWWfohTUgcrwLp9bLFELwLNVy9I0AqZVeKh2y4ImOkl1JIsBEAkP9nW4dGXXqPO54GF86z1F7slP7rC34X5WUUfvwMCHoMcdJH7AaNKJvHiK1kRXxuiDsizumVbY5gKIkCXYhJNr4eZcJgpGc98hvKY/9gUDqkSbBptdeKnNxPkmGfgcex3SRRcSS4tPXLlg0M7Nxh/LAjwV1WjmDxJdmY2jE7jFEOsWVhPCHphcwAvWXteoRg1eZrizh8JmbmMLcgA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(39850400004)(136003)(346002)(396003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(2616005)(26005)(53546011)(6506007)(6512007)(6666004)(86362001)(83380400001)(4326008)(316002)(450100002)(8936002)(8676002)(36756003)(5660300002)(2906002)(6486002)(478600001)(66946007)(66556008)(66476007)(38100700002)(82960400001)(31686004)(31696002)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2ZrQnBjN2dYaUxLdnpCc1ZScVZnTGJSQnFCV3BVcUlYQjRNWVRQcGZ0OVNs?=
 =?utf-8?B?QWY2NHBwejVuTEhwS2pzMldUdHNGYlBFRlQ5V1Q1eGFreW5DUUZIQWErczhB?=
 =?utf-8?B?c0ExSHlxSGVoVFlySmtXaCtyL05waFhxRzdldVBkazFKWkVsRmtmQUxpMUF2?=
 =?utf-8?B?VlNWV2dES1JEMXNWSjcwZlIyczVEc1BpSzA3OVd1eUNFcjZtZ0ZRcUVMYUcx?=
 =?utf-8?B?NDhRSlMvZDNMMC9QQzJ0Rzlrb3lUVUV2am1lT1pvb0E1aWM4Vll5SmFhUEVY?=
 =?utf-8?B?QnVUU0lkbGJDWjllUS9IOEN5aCt1bC9teDV3WVY1Tm1DU2Z1UVo2YUJHNXVw?=
 =?utf-8?B?bHJBVnFxV1YrcGppOVJObitheHRGUnE3VnlBdlNIcUsrNGhFMnFoTzVRbWFu?=
 =?utf-8?B?OFEwVWtoTlhIblVlc24vMyt0SHJUcEtvR1BmTjhua1RZdWJ3VjV0dkZzUWhN?=
 =?utf-8?B?MUdacUlxaGlJeFNZbmhEQ1NGeGVtRWdLZVhtOFQvWHFwRVhxM2VrTVY2NFlJ?=
 =?utf-8?B?Rll0VVdVQ1BkZzlPWVpQRktZbmhXWGxaSFIvVzBDOHkwbmpJc3FSNzJhb1I1?=
 =?utf-8?B?Y3Zwcmc2Y3NFaE83c3pubFZteVBGb1h0ZDVjVW52R1gxdzVqMGdxVFBtSDV2?=
 =?utf-8?B?ZUFYaGNMQUtiQTA1aFhGRDkxMnVEQTZaczAvb0JvcWFxMytDZzJDcGhJU2hJ?=
 =?utf-8?B?OVcxMENyRWtFRmIvTGFtWUI1aW1RTFNFY1lwdlg3dXdjajE1UXNCVHRVWThP?=
 =?utf-8?B?UTdQWWQvcEhvUURkbU9mNVB5NS8wVGxkbU1ZdFNvbTJ6VUt6elNHR0U5cnpP?=
 =?utf-8?B?bzVwSzhnVzBHbEYxbTZWRk1pdHJyZGlrSHdUZW1DOE4vZmF4SC90bEtZZzVW?=
 =?utf-8?B?aFMvbGNzVXd3VVNRVjZnVXNRVVZaRit4QkVMTVQ5THVYQVFhUjF6WWtuSC9U?=
 =?utf-8?B?ZStwUWtsU202Zlo5NmdCNFpsdjhNTXg4cnZ2NCtXbEhQbUpjL1NBOHhHcVVv?=
 =?utf-8?B?T3RsWGw5SGJQaGZTVnh6dzRwbFJubWp5WTNJY3JwVVduMTNzb2dQNkFsWXU3?=
 =?utf-8?B?TmEyOGMvMWVORVcwc0RqcXUyTVRKRGtNMmp6bG94bGFrazVNOHAvWkwrVVow?=
 =?utf-8?B?QkIrNXZETFhZNm5Sd3ppd1dOcGJwWmNiNHpTSWRZZWkxZnhqN3dKS0JIdUY0?=
 =?utf-8?B?aDZWaUkvUURVRENrWHhlbXRoWENpcWNiZEpHVFZYVlhvUVI4MHZLKytTRVE3?=
 =?utf-8?B?REliN2IwWTNYdWttZDBTS0d1UzVxbGNqSU10MWxVSnJSNUNRcEVpZ3FLT2hh?=
 =?utf-8?B?MHdmZnA5amhTK0hYdHdZWEN5Sm0rVkJyRWFmaU9aSmVEU1BEbmZaNVFzZXAr?=
 =?utf-8?B?TmEzU3I4eU1vTWlWN0NUanpNU3dlZDR0cnBVeFlSSnd1cEUwaDUwSng1bE0w?=
 =?utf-8?B?RVdFcm5LSFBaUmlXMUF3MWt6WEdMakthUi96RzZSV2VTYTNRditaUUxEMDlW?=
 =?utf-8?B?S2JuK1dzTUVkUjBibGtMUEJ0cklnNUpIRjVMcjFYQ3VzSUJ2dWc2WFBCdldj?=
 =?utf-8?B?WXBUQWVQTkRITXcxS2xiVE1USnJYNXp4cWpnWWxwNGF1RmF1U3E4aVFCNWZZ?=
 =?utf-8?B?V2lVcGsrZnkwaVhMOGxxVURpZjBURFgzSmQzdG1wTWF4bnJPakUvb1pZVzhV?=
 =?utf-8?B?cGtKMWR1S0NQS0NlakRiZnNuT2xBWFZkeUovWFZqT1o5blZSa1AxbXNzRFFK?=
 =?utf-8?B?dWN4Qjd4c3lXazRKOHdTckxYYW0wUWVEb2ZBd2ZINFFhYWVLcVBubUZNTUFB?=
 =?utf-8?B?aXBOakV6UFlPR0hDUld2alFlSm5WMkFKU29FNDJ0SzBFZDZhSHBoOUNUbnpP?=
 =?utf-8?B?QkxiaEFqL1FLRG9XQWtLaTludkN6RkVteno2RUFnK0FBRlNST084NDFIcFJl?=
 =?utf-8?B?M2FNQzhKQzVTL3hTSmkxckw0Y1d5bzVqdTRSbVJ5UkFOK2sxVTA3MDh3c1B3?=
 =?utf-8?B?VjNwWE5icHEvTGJwT1BYQXBtRnVBbmRKTEZ1VUhUcDZkaUV6QTJENU5CZ296?=
 =?utf-8?B?dHdBKzVuQVJ5LzQ2cU00WHVoNjBOU2pHaXdjaXN4VUVqK1JBNlZZVDVISURp?=
 =?utf-8?B?dW1KQ2s3U1ZLSXJVWFI5NU9NWTZrb1VLZVRZTkZEbnNpZVlmTVNnSHZKY0NM?=
 =?utf-8?B?Qnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: facd08c4-4e54-4a3b-e3d4-08dc0e287f6b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 19:57:08.0585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vy7A7NLNhfK845kdazZ/VDntKuztBAdaGbd43gMVw+CQGDsKFs2PCi4GJNmQNPovisG3qiHbxnwyV+huL5CRqHa4Y6j8Gxb6QeStWqAA1J0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8141
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

On 1/4/2024 12:34, Daniele Ceraolo Spurio wrote:
> On 1/2/2024 2:22 PM, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> A failure to load the HuC is occasionally observed where the cause is
>> believed to be a low GT frequency leading to very long load times.
>>
>> So a) increase the timeout so that the user still gets a working
>> system even in the case of slow load. And b) report the frequency
>> during the load to see if that is the cause of the slow down.
>>
>> Also update the similar code on the GuC load to not use uncore->gt
>> when there is a local gt available. The two should match, but no need
>> for unnecessary de-referencing.
>
> Since the code is identical in almost identical in both places, I'm 
> wondering if it is worth using a common waiter function and pass in a 
> function pointer with the waiting logic. The cons of that is that we'd 
> have to move to gt-level logging and pass in a tag, so not sure if it 
> is worth it overall given that it isn't a lot of code. Maybe we should 
> consider it when we implement this on the Xe-driver side?
Yeah, I did think about trying to have something more common but it gets 
messy with all the error reports being specific to the firmware in 
question. But yeah, maybe think some more on it for the Xe version.


>
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c | 10 ++--
>>   drivers/gpu/drm/i915/gt/uc/intel_huc.c    | 64 ++++++++++++++++++++---
>>   2 files changed, 63 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
>> index 0f79cb6585182..52332bb143395 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
>> @@ -184,7 +184,7 @@ static int guc_wait_ucode(struct intel_guc *guc)
>>        * in the seconds range. However, there is a limit on how long an
>>        * individual wait_for() can wait. So wrap it in a loop.
>>        */
>> -    before_freq = intel_rps_read_actual_frequency(&uncore->gt->rps);
>> +    before_freq = intel_rps_read_actual_frequency(&gt->rps);
>>       before = ktime_get();
>>       for (count = 0; count < GUC_LOAD_RETRY_LIMIT; count++) {
>>           ret = wait_for(guc_load_done(uncore, &status, &success), 
>> 1000);
>> @@ -192,7 +192,7 @@ static int guc_wait_ucode(struct intel_guc *guc)
>>               break;
>>             guc_dbg(guc, "load still in progress, count = %d, freq = 
>> %dMHz, status = 0x%08X [0x%02X/%02X]\n",
>> -            count, 
>> intel_rps_read_actual_frequency(&uncore->gt->rps), status,
>> +            count, intel_rps_read_actual_frequency(&gt->rps), status,
>>               REG_FIELD_GET(GS_BOOTROM_MASK, status),
>>               REG_FIELD_GET(GS_UKERNEL_MASK, status));
>>       }
>> @@ -204,7 +204,7 @@ static int guc_wait_ucode(struct intel_guc *guc)
>>           u32 bootrom = REG_FIELD_GET(GS_BOOTROM_MASK, status);
>>             guc_info(guc, "load failed: status = 0x%08X, time = 
>> %lldms, freq = %dMHz, ret = %d\n",
>> -             status, delta_ms, 
>> intel_rps_read_actual_frequency(&uncore->gt->rps), ret);
>> +             status, delta_ms, 
>> intel_rps_read_actual_frequency(&gt->rps), ret);
>>           guc_info(guc, "load failed: status: Reset = %d, BootROM = 
>> 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
>>                REG_FIELD_GET(GS_MIA_IN_RESET, status),
>>                bootrom, ukernel,
>> @@ -254,11 +254,11 @@ static int guc_wait_ucode(struct intel_guc *guc)
>>           guc_warn(guc, "excessive init time: %lldms! [status = 
>> 0x%08X, count = %d, ret = %d]\n",
>>                delta_ms, status, count, ret);
>>           guc_warn(guc, "excessive init time: [freq = %dMHz, before = 
>> %dMHz, perf_limit_reasons = 0x%08X]\n",
>> - intel_rps_read_actual_frequency(&uncore->gt->rps), before_freq,
>> +             intel_rps_read_actual_frequency(&gt->rps), before_freq,
>>                intel_uncore_read(uncore, 
>> intel_gt_perf_limit_reasons_reg(gt)));
>>       } else {
>>           guc_dbg(guc, "init took %lldms, freq = %dMHz, before = 
>> %dMHz, status = 0x%08X, count = %d, ret = %d\n",
>> -            delta_ms, 
>> intel_rps_read_actual_frequency(&uncore->gt->rps),
>> +            delta_ms, intel_rps_read_actual_frequency(&gt->rps),
>>               before_freq, status, count, ret);
>>       }
>>   diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> index ba9e07fc2b577..9ccec7de9628a 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> @@ -6,6 +6,7 @@
>>   #include <linux/types.h>
>>     #include "gt/intel_gt.h"
>> +#include "gt/intel_rps.h"
>>   #include "intel_guc_reg.h"
>>   #include "intel_huc.h"
>>   #include "intel_huc_print.h"
>> @@ -447,17 +448,68 @@ static const char *auth_mode_string(struct 
>> intel_huc *huc,
>>       return partial ? "clear media" : "all workloads";
>>   }
>>   +/*
>> + * Use a longer timeout for debug builds so that problems can be 
>> detected
>> + * and analysed. But a shorter timeout for releases so that user's 
>> don't
>> + * wait forever to find out there is a problem. Note that the only 
>> reason
>> + * an end user should hit the timeout is in case of extreme thermal 
>> throttling.
>> + * And a system that is that hot during boot is probably dead anyway!
>> + */
>> +#if defined(CONFIG_DRM_I915_DEBUG_GEM)
>> +#define HUC_LOAD_RETRY_LIMIT   20
>> +#else
>> +#define HUC_LOAD_RETRY_LIMIT   3
>> +#endif
>> +
>>   int intel_huc_wait_for_auth_complete(struct intel_huc *huc,
>>                        enum intel_huc_authentication_type type)
>>   {
>>       struct intel_gt *gt = huc_to_gt(huc);
>> -    int ret;
>> +    struct intel_uncore *uncore = gt->uncore;
>> +    ktime_t before, after, delta;
>> +    int ret, count;
>> +    u64 delta_ms;
>> +    u32 before_freq;
>>   -    ret = __intel_wait_for_register(gt->uncore,
>> -                    huc->status[type].reg,
>> -                    huc->status[type].mask,
>> -                    huc->status[type].value,
>> -                    2, 50, NULL);
>> +    /*
>> +     * The KMD requests maximum frequency during driver load, 
>> however thermal
>> +     * throttling can force the frequency down to minimum (although 
>> the board
>> +     * really should never get that hot in real life!). IFWI issues 
>> have been
>> +     * seen to cause sporadic failures to grant the higher 
>> frequency. And at
>> +     * minimum frequency, the load time can be in the seconds range. 
>> Note that
>
> this is not load time but auth time. With this fixed (when applying is 
> fine):
Yeah, I guess so. Will fix it.

>
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Thanks.

>
> Daniele
>
>> +     * there is a limit on how long an individual wait_for() can 
>> wait. So wrap
>> +     * it in a loop.
>> +     */
>> +    before_freq = intel_rps_read_actual_frequency(&gt->rps);
>> +    before = ktime_get();
>> +    for (count = 0; count < HUC_LOAD_RETRY_LIMIT; count++) {
>> +        ret = __intel_wait_for_register(gt->uncore,
>> +                        huc->status[type].reg,
>> +                        huc->status[type].mask,
>> +                        huc->status[type].value,
>> +                        2, 1000, NULL);
>> +        if (!ret)
>> +            break;
>> +
>> +        huc_dbg(huc, "auth still in progress, count = %d, freq = 
>> %dMHz, status = 0x%08X\n",
>> +            count, intel_rps_read_actual_frequency(&gt->rps),
>> +            huc->status[type].reg.reg);
>> +    }
>> +    after = ktime_get();
>> +    delta = ktime_sub(after, before);
>> +    delta_ms = ktime_to_ms(delta);
>> +
>> +    if (delta_ms > 50) {
>> +        huc_warn(huc, "excessive auth time: %lldms! [status = 
>> 0x%08X, count = %d, ret = %d]\n",
>> +             delta_ms, huc->status[type].reg.reg, count, ret);
>> +        huc_warn(huc, "excessive auth time: [freq = %dMHz, before = 
>> %dMHz, perf_limit_reasons = 0x%08X]\n",
>> +             intel_rps_read_actual_frequency(&gt->rps), before_freq,
>> +             intel_uncore_read(uncore, 
>> intel_gt_perf_limit_reasons_reg(gt)));
>> +    } else {
>> +        huc_dbg(huc, "auth took %lldms, freq = %dMHz, before = 
>> %dMHz, status = 0x%08X, count = %d, ret = %d\n",
>> +            delta_ms, intel_rps_read_actual_frequency(&gt->rps),
>> +            before_freq, huc->status[type].reg.reg, count, ret);
>> +    }
>>         /* mark the load process as complete even if the wait failed */
>>       delayed_huc_load_complete(huc);
>


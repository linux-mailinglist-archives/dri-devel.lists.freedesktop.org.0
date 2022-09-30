Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED7D5F16BF
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 01:42:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6040E10E2C4;
	Fri, 30 Sep 2022 23:42:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C54C110E2C0;
 Fri, 30 Sep 2022 23:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664581342; x=1696117342;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4J+eDZDy0hkkiNres+b44708e5piZ6lpBOPWQrFVzrg=;
 b=I24HSNF9Zli3xa7U3X4cme4h04rwKTrbg4wOmoTVQT2se0Y6bIPKWfQ8
 n4TfvduuNNaMUZyQCUdCWfOvLEyPpBJVQH87S+ww86+8MrperYfhdxHjC
 cAS9NCbetCdO/E0Uo9+ajAG9oIblIPHpRKNOgjSxehIhUJpsX69xKbx0p
 Hl3phS4FdYGeEzV6ozQmArU0SfxgHlFt04ZnHdmALVhEhVY4btsNCxPGS
 Jt+jOxE4PJfATRUp7JlEQPvCupR98jowJG+KWINtrceMsbTEEf1ff9gRo
 cR7I4kODQ40EDE3at30XkVL1nARfT+r15OuOh+cxAykZ1aSUPsyf5eCxe A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="328699491"
X-IronPort-AV: E=Sophos;i="5.93,359,1654585200"; d="scan'208";a="328699491"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 16:42:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="711979005"
X-IronPort-AV: E=Sophos;i="5.93,359,1654585200"; d="scan'208";a="711979005"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 30 Sep 2022 16:42:22 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 30 Sep 2022 16:42:21 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 30 Sep 2022 16:42:21 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 30 Sep 2022 16:42:21 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 30 Sep 2022 16:42:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fAw4Zbcog/1LYRl3/P3TwpjUYtjJt1zXnP1D/9va0A7HDHl37iuH9paQ2ulzagQTuTFPsotoa51TtIB8tmCo6KUh3g4ER5JLzUkiY3JdWNZSXsGt6nLFPDH1zF8yW9nlugawX3MLFzvl9gRjwHgt+3KVgNPlPAz4FfsSx+/vqgS2COr7HzN1z/vfqZEgGBgyrbwyro6uLqU8WEpzFaiqB0rcNC7o4jAsPx1ojEp644te+ZoOtq/YzzN4bXGR48Cu+LIMaqkCf47SPfi6v4Hp8zraNkKBAQk6hNXGXlvRYDBwWIc0zwhHsElgZ9cuDYxAOtmOH608O3ueGrifZXLtHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zC3SoiGQCZZ0zzeIjhQcDmRKJw2n8Smb3hvYX1cypCo=;
 b=KBNNCxxvStudGp8MNjikMTNEKm0vUeyVz5bLBX9uxR7zZH8XeLpnLjK0/ZL2pm0Fwc9OL701qAfGn2uwQgv0ICZ4To8J6KpCrgPo/SYquCUTiXagFoUFyQl+flGP7+1AbQ29GYDkeikOFKy+oQU+R/tHwt6lov/zBxU2IhFON4tNfPubspOZGpGW5P1mArTL0YQzkWUGaM+AcztFOrgcvAFiEw7oBvmIDiKwWa042Q/3fQ+zUo9KgGzB0I/Lgnhe8hcR6b06a8s3qQMBWddap+Cu/SznJz3QxzyeykpYNOR/sUQ7RWLZyiKFFtyGMmlWB85vbgfnpT3t8IRnF/QLDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 PH0PR11MB5029.namprd11.prod.outlook.com (2603:10b6:510:30::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.23; Fri, 30 Sep 2022 23:42:19 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::280f:75b5:17ad:1668]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::280f:75b5:17ad:1668%4]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 23:42:19 +0000
Message-ID: <31387d98-9e17-3998-6d38-ad3b5115f2f3@intel.com>
Date: Fri, 30 Sep 2022 16:42:16 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH 3/7] drm/i915/uc: use different ggtt pin offsets for uc
 loads
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20220922221117.458087-1-daniele.ceraolospurio@intel.com>
 <20220922221117.458087-4-daniele.ceraolospurio@intel.com>
 <28a2896a-f240-e7b7-a127-b2782164ff58@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <28a2896a-f240-e7b7-a127-b2782164ff58@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR02CA0056.namprd02.prod.outlook.com
 (2603:10b6:a03:54::33) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|PH0PR11MB5029:EE_
X-MS-Office365-Filtering-Correlation-Id: 178521d8-00c0-4f89-143d-08daa33d69d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: es6rpjQiQdaNc6afDkAAnUbLufW+/GVdsey2WcB9n0Hhcs0gm6Ym5j3hrGyc8v7fBKS4ukJ7Gd1j1sEDJQfAQpgtRQ3o5xhGh/hHhpx+q3TNF/6v920Ajf5sGu927VZbxC4+xNVYr7Tpj/1v5uBZyb2kJ1+t15K/AEn2Gxpf5+pg+nlHMGUYW2FQzCmxuii8DFVqJM8CGIZPYW+ypMNoBA+5uUjI3QV/yLUzluU4D4Ul2CoCXHjrmWVM7GWqHasNgGiVSiOuPodrrUnh9F+1ImFn15GQdngMjo3hegTA56vB4iB2DabY1ERDLRqp5u7VJj7WbNxNz5m62YpVsn9RL5HrpyttRRVzyJdqmhDBVxDEqjZXDJHS4Umgp6c1hc7dtTInr1Dog7oxZggNTv6d+VnBUOXAAEtWi1xdL1MOeaXkvc/EI423AbIS4yW9aF90ROsIXwNMQeZMytha5uK7gYnvcfK5I5BQuPcnPCXm9L+vtbQ+o5sPd7UytbXf9tRraoM4NhKy71K+J6yuXQ/D9WQPmoD8saj+aONpOHiUk6iAp3uVX28ue+DCYRzm6U77hzH3W+ivQ/kMVURGTIy/K/ZaZ6p+Ot97eUJ+MNAFVoNGSvv/oPd7jQKXtc+3oUmf+wjtnRK3zySU2vl2qGq9drRL4lB7Etw40pK92515iV2D9mFGyZX6E2uXzC++K0LADA2jnT+XHMDpL06ZzejDpjQAqusrlgh4zo/z9fYMLdP6buMw7RRYk9ou+UGIRN3cGnSfF1I16wbuzOKMpL3dVrE1N/qakI/v8ZOGfInaZv8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(366004)(346002)(376002)(39860400002)(136003)(451199015)(66946007)(450100002)(6512007)(8676002)(66476007)(66556008)(41300700001)(4326008)(26005)(2906002)(186003)(36756003)(2616005)(86362001)(31696002)(8936002)(5660300002)(478600001)(6666004)(6486002)(316002)(82960400001)(83380400001)(6506007)(107886003)(53546011)(38100700002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDl5T2M1MjNHUUpmM2Y3L0xtZklwRHlxdGMwOGJ5MXNIamh6ZXo1RWtaTWJF?=
 =?utf-8?B?MlFpOVEvWUlIL0ZWZXNQaFFHL3lxSG9DZ2xZSDUwVjFLMHF6dnZWNE00OGVO?=
 =?utf-8?B?QmNnQjE4ZG5uRVNwT0dUQmFCWHNndFZaUE10dmpnU2RUenpFWGMrREs2UFVj?=
 =?utf-8?B?amlmM1lFVFVDWiswaHVGTVgzNlBJdkI5TjhkWEU0ZnlOQytDYzZaSUpPVmtM?=
 =?utf-8?B?ZzdqVlY1aUZPTzZyZzhRVVZFVEc4NklxYjdkT2JxbTZYNFoxYnA1NHZaVTlY?=
 =?utf-8?B?c0VvOHlrMWQ5UTduOGp5bXJDelFyckw2Ym9LQlJxNFZYSjE4UVBqTnc2R3Rp?=
 =?utf-8?B?UTVUdVlVaEJhTHl5WlVDWXYwb0RySVFvR3NMN29lLzExRll0MlN0bWxFUFVP?=
 =?utf-8?B?WHpCR3ZnZ25ub0dtNDRBem0xR2hDZ3FMdDhSRTRzdGdxZTdmNUF2ZUxBaWht?=
 =?utf-8?B?OVdpZ25GTGNjZ1RicVhBQVV3QTB3Zy81RGplQkdhb2JVU1ZiNGFvUHc3cVhw?=
 =?utf-8?B?ZUtmRDU5WkJYbnpCbFJzZW5ZZHRPTFBZeCtXdktYN3NCMFNuWEVxZG45OHpK?=
 =?utf-8?B?ODVKZzM4MGFpNmt0b2dJS3F5cWhKZDIzMjVIcElPWFlPZmM2dFh1ckk3NXNS?=
 =?utf-8?B?ZzVpV0RQVlNXVjE3eTkrZm5Hd0lnRzRBS05hSWJ5aHV3YjdnOHRWY09EMWNV?=
 =?utf-8?B?SmFUZ1h4dE85M2hrTWVBUC9QY0wwNW51L0V1Y3E2ZVpQK0xSb3BVQ2Yyd241?=
 =?utf-8?B?TDBIRWdLeG04YlRGaSt2enZoRkw1TDhjN0NReTRJSFlZRzdtWUswUld0cmdB?=
 =?utf-8?B?SWpLblhobENLc2p4cG1XUkhDQ3U5aHl6WStvbzhKWlFKN2Zmdzc1QnFyQU1B?=
 =?utf-8?B?aElhSVlPVm5ZWkYwOFd4UkRZcHVUMFBFYzFUeUlJSzFXcnNySXh1a2dEK2V4?=
 =?utf-8?B?U2Q3eVVQYmFjR0x6aTQ4UThyOGd0L0NaZjc2Y0M5TFFuRDRGUDJCQlJpSGZh?=
 =?utf-8?B?YVBFVUp5bER3Q2c2UEdzOVQwK3FCck9RS3ZSZXIvWHpuV09YSmJyeEI2Ykxt?=
 =?utf-8?B?U3BpamRPTlZNczQxcG5relE0c0U0SjNHNXpBRGNkSU1ZT2ZpVVNGSEhUdW1j?=
 =?utf-8?B?Smc0emxRanhEU3dyVmpFNnZIVjU0WjdLSm0vYUtaaDRHM0FkWjM2M2dKN3VL?=
 =?utf-8?B?bi9zTmVtcVprcWRSZHFWVERoLzBjVGI1dm10Z2RqTUp3ZEg0aHJJZWpBd0F2?=
 =?utf-8?B?V3czTkhrTDI4OGNtcFoyZ3pxMEFCSldSMEtpMUp4S2tIeHJRQ2E2NWFqMkI4?=
 =?utf-8?B?Zk9FTHBRRG9SSVZKYVczYWZya3dpYk9OeSt3ZkFQeGR5eDBDMmJMM1ZzaDdP?=
 =?utf-8?B?aStyMGI1dXBjdk1UczFScHZ1ZGxxR0NKdG5CWkpJWFFod1ZmQVFldGZNS1E4?=
 =?utf-8?B?RXh2SWFpU0ZmR0VSa1orOWFGUDQzOEdRQnpGMC8zcjFWRHNKL1pIV3lKNnpJ?=
 =?utf-8?B?U1NyV0JYV3gyZ2dHUW9pZWd0aWxiY3FzcGNObFlWT2Y3Y3MwTDdaTVR5Yjh0?=
 =?utf-8?B?aUllUE1RVjNlTWo4NHovWHgwaXR4bEc3ZzhFSERHNHRYSVMyYkdDYU14SFVW?=
 =?utf-8?B?N1N5UUdlRi8vcm16Z3J5SWJDSDA0Nlh4RXIyWGJiVTBQMkdpRDAwMm5XWWlT?=
 =?utf-8?B?Y0xTbFcyemszZ2RSazJ0aWFQUmxHSTJ2NjZoYlVjODZMcnlGMHVaaEMyVFNm?=
 =?utf-8?B?azM0Y2VxemtpZ3RuUFB3a2ZHcFp6Y2kwMEhySGQxWUs2TVF6eEIwbHhSZ3Bk?=
 =?utf-8?B?UnhsYkN5WlBESnJGRDZodlhaOXY3OHJKNWgwd1VsWXdYNno0V0p0Nkx2SjNt?=
 =?utf-8?B?bGFIYUR2SDVOb3dYTXFIMytsTTFqVWkrYzNGN1B2WVJjMlVRMUltdzg5VDQ2?=
 =?utf-8?B?aUZwMVkwRVhYTmR2UDcvRFllY29CU0R5bHNTUHpRTXYvdWRVMXZtMHhDcjNo?=
 =?utf-8?B?a0JQeWJqbm1kUk9GNFF2eTdHOXUvaUN4S3oxRVRoK042Mlg2YU5zNFE5STJv?=
 =?utf-8?B?ZHNLbWt1Mzc5djk4TU90emJhNlV2azB5aUgyQjNaT0ZNcVlPZGIrSHlDdHRp?=
 =?utf-8?B?bG1PYm5VMVlMamhuY21IMklVZ1ZDWWQrZmo2a1craVlBMjRVbklVclFseFVm?=
 =?utf-8?Q?+LFsaxgs5Z7GzRX/uZ2MU04=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 178521d8-00c0-4f89-143d-08daa33d69d7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 23:42:19.1787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pm1A2d6WgpJTk5Ol5RnlllPZz7f5jLbHhGnwIyUiM2hBe5k9PFv9z4ao3KPSnx18VRBB5CnGI212voVATrSwIHrMUZI8lGrHok+AJGPKzAo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5029
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/30/2022 4:24 PM, John Harrison wrote:
>
>
> On 9/22/2022 15:11, Daniele Ceraolo Spurio wrote:
>> Our current FW loading process is the same for all FWs:
>>
>> - Pin FW to GGTT at the start of the ggtt->uc_fw node
>> - Load the FW
>> - Unpin
>>
>> This worked because we didn't have a case where 2 FWs would be loaded on
>> the same GGTT at the same time. On MTL, however, this can happend if 
>> both
> The point being that the mapping is done using a single 'dummy' vma 
> that can't be mapped to two different places at the same time? But 
> isn't there a separate dummy object per uc instance. So there would be 
> one for the GuC on the render GT and another for the GuC on the media 
> GT. So each would be mapped separately to it's own unique address and 
> there is no conflict? Or what am I missing?

The issue is that without this patch all the dummy vmas are inserted at 
the same address (start of the reserved node), which only works if they 
can't be mapped at the same time. Note that we don't use the generic vm 
functions to insert the dummy vma and we instead specify the exact 
offset we want it mapped at. This patch makes it so that each dummy vma 
has its own private offset.

>
>> GTs are reset at the same time, so we can't pin everything in the same
>> spot and we need to use separate offset. For simplicity, instead of
>> calculating the exact required size, we reserve a 2MB slot for each fw.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: John Harrison <john.c.harrison@intel.com>
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 22 +++++++++++++++++++---
>>   1 file changed, 19 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> index b91ad4aede1f..d6ca772e9f4b 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> @@ -666,16 +666,33 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>>       return err;
>>   }
>>   +/*
>> + * The reserved GGTT space is ~18 MBs. All our blobs are well below 
>> 1MB, so for
>> + * safety we reserve 2MB each.
>> + */
>> +#define INTEL_UC_RSVD_GGTT_PER_FW SZ_2M
>>   static u32 uc_fw_ggtt_offset(struct intel_uc_fw *uc_fw)
>>   {
>> -    struct i915_ggtt *ggtt = __uc_fw_to_gt(uc_fw)->ggtt;
>> +    struct intel_gt *gt = __uc_fw_to_gt(uc_fw);
>> +    struct i915_ggtt *ggtt = gt->ggtt;
>>       struct drm_mm_node *node = &ggtt->uc_fw;
>> +    u32 offset = uc_fw->type * INTEL_UC_RSVD_GGTT_PER_FW;
>> +
>> +    /*
>> +     * To keep the math simple, we use 8MB for the root tile and 8MB 
>> for
>> +     * the media one.
>> +     */
>> +    BUILD_BUG_ON(INTEL_UC_FW_NUM_TYPES * INTEL_UC_RSVD_GGTT_PER_FW > 
>> SZ_8M);
> Doesn't this need to be >= ?

No, this is a size check and 8MB is fine for a size.

>
>> +    if (gt->type == GT_MEDIA)
>> +        offset += SZ_8M;
>>         GEM_BUG_ON(!drm_mm_node_allocated(node));
>>       GEM_BUG_ON(upper_32_bits(node->start));
>>       GEM_BUG_ON(upper_32_bits(node->start + node->size - 1));
>> +    GEM_BUG_ON(offset + uc_fw->obj->base.size > node->size);
>> +    GEM_BUG_ON(uc_fw->obj->base.size > INTEL_UC_RSVD_GGTT_PER_FW);
> Given that the firmware blob is loaded from the disk and therefore 
> under user control, is a BUG_ON appropriate? Although there doesn't 
> look to be any obvious way to abort at this point. Could the size 
> check be moved to where we actually load the firmware rather than 
> where it is being mapped?

My idea was that we wouldn't release a blob that violates this without 
updating the kernel first, so the only way a user can violate this is if 
they try to load a bogus file. But I can still move this check to fetch 
time and fail the fetch if the size is too big, so we can fall-back to 
something sensible.

>
>>   -    return lower_32_bits(node->start);
>> +    return lower_32_bits(node->start + offset);
>>   }
>>     static void uc_fw_bind_ggtt(struct intel_uc_fw *uc_fw)
>> @@ -690,7 +707,6 @@ static void uc_fw_bind_ggtt(struct intel_uc_fw 
>> *uc_fw)
>>       dummy->bi.pages = obj->mm.pages;
>>         GEM_BUG_ON(!i915_gem_object_has_pinned_pages(obj));
>> -    GEM_BUG_ON(dummy->node_size > ggtt->uc_fw.size);
> Why remove this?

The new GEM_BUG_ONs in the function above perform a more strict test, so 
this is redundant.

Daniele

>
> John.
>
>>         /* uc_fw->obj cache domains were not controlled across 
>> suspend */
>>       if (i915_gem_object_has_struct_page(obj))
>


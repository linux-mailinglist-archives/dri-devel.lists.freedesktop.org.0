Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7461160BAD8
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 22:42:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BFC910E7D6;
	Mon, 24 Oct 2022 20:42:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C417D10E7D6;
 Mon, 24 Oct 2022 20:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666644121; x=1698180121;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IhU6NrSsYVLDHOxG/gPPq3nmtQLcXMW5T2hi7Gezdl4=;
 b=fd4iQm3WJoyq/aJ+34e7G4PptaKC2TeQTrvv3CSXhE7s5XUIxTTDKml6
 g0I1aTo4Akp+dNG36qvTpO3TYM7+k9n8qOmXOQDIdgX9aPUeF5grOvVGm
 LFITaZTHcuCRnHEYQgF5fwSKPo4DOaZ58TWW4eymObzcfZBd+UcQRU6Ec
 CHAi0PSwSWLHNnFBJGsEGv3dfdpuQagAU3YRb5wUwgov5Gv0mxZrsMp96
 EKueHjyONUW2lkN7atRQqMsQ3tNQG/eWBtofkoW7f9iVbveB/dKfONthn
 JA7Weh/IulUIwH/xiwo1qZLuQmGoS2dJXDnhHPRWBoKM4uR2o45axcMfe w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="287914687"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; d="scan'208";a="287914687"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 13:42:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="609327767"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; d="scan'208";a="609327767"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP; 24 Oct 2022 13:42:00 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 24 Oct 2022 13:42:00 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 24 Oct 2022 13:41:59 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 24 Oct 2022 13:41:59 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 24 Oct 2022 13:41:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ohAo2We6WGCExfmJGVSQmWcblxBCGLooaDSWwA4As9JeKAwwXJl5S9MsjvOHC3jKLMGtu7nilEuVCXVV1DvIBlArukinuWmkZ9q2/6O3eMWNHexM36hIMNr7B9PemCib2NK5Lt2Z8ksVsBagTMYMw+dm/R8vfCcEULz5e9ll64q+0tsdkioO5aZVOWB/mS41zVzvSa2I68va/FnGffTvKjXIKLj2Ht+SthC1VsUmRQ4Oh9DMDo9uo5QU4wgxkAwqjY8j7sHAxd50jAAL6dkTDfCdObra+SGs4MTQGbwg73algAfqICkmKZROBSMTUGbr5COP68mOV8OvizKNus3/iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T0890/BLanRtW3XTM3ubwFU8MffDVAb2ZU8MI8GwVxw=;
 b=Ry2XoCaPO6z8DUJL7f87QlAqwqPRAByfCAMS0VeRV0lPa7iA0u+Gg9nkG6y9tkCVF+w83L9G8N+nrcpjOWkVE0PTnUGIujsOLLrX1Cylu5NTqHb/v5qnFej1dtW/sC5MicePgEprtyOEW0TRu/oE6+yUikSRDmbUFBt5asgR/3BLzM0MK04XwSQXdPK0BZv5on3FyfPMyTcXp39kYrRkzuCgDIoPdZxwrii1/S6SZuVlPtrVkgqhowhk94z6iLa/lcb0QpesXb8pNJPMdJFqQYzhD2rkucyO+yHK66TH0OFsIZZ9VMpRJ9eIWhXqBlcAnY0owOWnp6a4R4xkr8+uIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SJ0PR11MB5149.namprd11.prod.outlook.com (2603:10b6:a03:2d1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Mon, 24 Oct
 2022 20:41:56 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036%7]) with mapi id 15.20.5746.027; Mon, 24 Oct 2022
 20:41:55 +0000
Message-ID: <f86937c4-8fbc-ab79-a44a-9a390c8314f6@intel.com>
Date: Mon, 24 Oct 2022 13:41:52 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.0
Subject: Re: [PATCH v3 3/7] drm/i915/uc: use different ggtt pin offsets for uc
 loads
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20221022001008.2340224-1-daniele.ceraolospurio@intel.com>
 <20221022001008.2340224-4-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20221022001008.2340224-4-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0203.namprd05.prod.outlook.com
 (2603:10b6:a03:330::28) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SJ0PR11MB5149:EE_
X-MS-Office365-Filtering-Correlation-Id: 311e33d7-fe7f-4f5b-bb56-08dab6002fa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mmEAdJHMdyiBPA1SQc4crKFbyH8ShZ9pVzgp7rMPl91WnD/lGxIIUwyf5dmDfP5XkLLVx/Tf37iWBFTxfWLJf3j8vUpStP93dYuXuc2Q2FwYNYcpSve0FbQ/5IphzEdo0/HLeKtXdRBoFAPl7bkPGgvH6RaqFIxsKNzZNuZnRzIZ13gZ/exBUd1MxCeyN7fSDpGAYEYJtRKgM3w3bAokI7uwLSe4HnHC2xfi75nZ0hph0Ej/AJ4WPT1skjQm02hHBH3Bn5KFiZJhIStvshTpvIy8HC+iV1n+PnCBhwdLdnxfm88lRjf5fe/vlNjP89rSo18QvPUK74rIHxzBx5WJ4msneGIlOU58foiqmD9vN4nPtziRu739BpI3XahkKMd8zE2lTJ5/8+wHePuWpKK52Rnuk/lezloMXbjkBd7bpqc2mLO1b+tfyWtbkIHiRVG1AeIMWvl9/CIDnrugjnZyxPeG3rkhtyfFbSDAWxTaH4D3vXhOpCE+AxGmpyjfKSekHv2U8YVSoRwJB+AIs/Kze2mQ94jV58utafYCGnZM4gTkWhFUKxTPw1uSfRZ2ejYoNbCasY+SFzBQiPmkLDtowJP6hJj1HI9fkVD2J9bjj0rXiu2FGKyDQ5DMQp1mKEEjrlL2hMstx9k4zYR5gFiTpJS9+aThkiDsH8WOQIjFWCT/caa5nZOF6CcRNPYVCNxBKOKO9O4dq5E+k6bW4wIEdTtYZpOAj1bGtUBcDuHwWbk4HblbdrKYUBswnQ/JvyljfH2DiXPCBJiZuaTiZdBacFZwPRZLM3W3CnL5dYi7QP0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199015)(66899015)(86362001)(36756003)(31696002)(31686004)(82960400001)(38100700002)(2906002)(186003)(6486002)(53546011)(6506007)(6512007)(83380400001)(8676002)(26005)(478600001)(2616005)(6666004)(107886003)(450100002)(4326008)(66476007)(66946007)(66556008)(8936002)(316002)(5660300002)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2xaQ1hVZ20zc1hlMmRVQXJJcENBKzRQcUw2a0ZUQk4zRWFUM2ZtSXZOR2Fy?=
 =?utf-8?B?b2pHVWdCemRtOENtbXZvL202d3NqVGRkdEZpWmY0TlhTWEYrc2F4NGxueFJa?=
 =?utf-8?B?RXRRajQ3aFAzL09wV3lTSXZCT0FtWjNtZlRVa2pnSEJ6RDNhaHhDRWZMOERy?=
 =?utf-8?B?b08xRlpQMGh6SGUzQTNJa01SN2xFeVdkVTNRaEFSN3RoVVZlMWdvc1J5THZE?=
 =?utf-8?B?VExIb2JzNFJiSkxhU1l4NWg4dGpIS0poNVpSTS9acnhqdUJxUGFHMGxpZW5p?=
 =?utf-8?B?NnBOYWRpQ3JPMzVLVU5EY28wT2ZzaVVkNFJMa0o5MXIzeU1EVFdkTzFJNDZt?=
 =?utf-8?B?RVJrRktERHcyTE1oOUZKbmh0VkEzWmNaeElrSHlNcmQ3N1lCZTZEUXdSQll3?=
 =?utf-8?B?VDRwb0VIemhSRkRRa0lmUlFTUSt5RXJqM2krYkZSTW9uaCt1M0syK25LWlY2?=
 =?utf-8?B?VC9takVFTHNCQnI0Y3VsUjREN2lrc2dxZTR2SXBJNGN5VWowak51QUp4MWto?=
 =?utf-8?B?dDJGUVl2SmFKVnFUb3dSbkNYSHh3QjFuUEMrNGJHWG9oTmRjK1JVVjk1OU45?=
 =?utf-8?B?TEpGTVMzUTJxdHdsWGM2Q3ZRVXppaE9CM3hYcUdPQWIwSDZseHhxbnRYZ21h?=
 =?utf-8?B?andDVnNHeldrTFM1M2g0N2szUXdURXFHbGdoT3EwY0ZHR2hHKzQxbmI1UDNn?=
 =?utf-8?B?dXVubWZtbGVyL3dkM3JoYTFwRnM4c0krTW10RXZRMzZjdUMrUzU1enozblZk?=
 =?utf-8?B?VGo1aWxvK3pUSHRJOEZ3U054SzFZQUh1WVlndGV3YlIyTlFLdE8xdkRoWUlj?=
 =?utf-8?B?MmJTdjZ4ZGxXc1B1bG9VUzJwUE5NZEVJR2c5SmIvek1sV1ROMTdycTl0MGgw?=
 =?utf-8?B?MnQrNlV4ZllDVkZRRWxEMUlvbE5vQVpscytZcEF5UDBIQ1A2ZWw5UkNUUTU2?=
 =?utf-8?B?Y1FtRWVXcERJd3RjQktIYVNQVXRqaEJRZEFjN2NETDdibnVuWGtSK0kvQVNn?=
 =?utf-8?B?dDV1bkhnZlkyU1pLT0lIb3drTFhXNlBnRE5VaGJSTXRySXJLZFBnRkswY1Jk?=
 =?utf-8?B?c09qRERCLzBmd3lreDBldmxWR2pXMHgzZVk3VStzRlBZTHkxbDJ3RkxBaUll?=
 =?utf-8?B?b1M5RjNseHBPVlBZS0Focy96T2JVMzUxbWp5elB1RmwrMEkzdnN6VHVJclhi?=
 =?utf-8?B?N3JJZEN3OVZiM1JZaUxCem1HZTY2M2JXdnVlcmtpeGtUMENvSGlxTWFTZGIz?=
 =?utf-8?B?YW4wM01DUklScm5BZ3ZHNTVSbXRBMC9NMFVpblZrMVpIdXAzM3E1Wmp1TkJz?=
 =?utf-8?B?aHdvdEZKcHJVM2NFc09DajV3OUFwa0FjVS8xS1orWHdwQlVDVDZqTktuSnFG?=
 =?utf-8?B?YXdwR1pJeUw3cnhQN1J3cEFBK2dvbnN0NXNnVFNONHNDUkVrNjdwOFREV2xY?=
 =?utf-8?B?UDgvZXgyQitveGpBOU00TUczRWM0Y3pKZHpJVElCQTREdFhFVVVWV21aVHpC?=
 =?utf-8?B?QjVRb0I0R1VBZkV3OG5obFlLSi9TMW1UMDNaQkZuc3kwRCtNMmNScFpRNlk0?=
 =?utf-8?B?Z09zSzRRMDMrTVR0bmRxQ1c4ZVFhRzZjUlBUZ0NwMFlsWDlnUUw1TDBlbVl1?=
 =?utf-8?B?cHhGelNPZ3pnelFqUjZDaXN1UDJiT0VMK2FTVGx2bTltTVRpb2VDcFgyUmpZ?=
 =?utf-8?B?NjVzRjlONnpWbkhQYVBtdElxYS9ReXdSQVJBSDNVaWRuZ3ByMXVKQXhBWnpt?=
 =?utf-8?B?TVBXRk1DZzNyOFYyNEV6S1pvOTdCOHdST2VBTkErNU9wWjBBWnpGaEdTNTJG?=
 =?utf-8?B?N2FMK2hCSHdDWEpMWDhNUTVVVE9wc3JrQ2pXdHBVNWozbUJVS3dNNW1ZSnJh?=
 =?utf-8?B?czI2MjRFOXhuNzdpSUVjTkgyQ3hjd3BDaWJZSCtRTkI3MU9jblVrbnh2VVRx?=
 =?utf-8?B?d0ZtRzg1NEhlVGo5WUt5UHdjWHdIT2pJd1prcUx2ZUpYbG92b2wxNGZTREtu?=
 =?utf-8?B?b3Y1RkJwcTg1N0M5QS9lbFRMRHNsTkhqY2oveUpHS1llWElpby9RY2ZTVjNh?=
 =?utf-8?B?VkYxeXdkZWVZSnU2blluZUFreFBwN0RETm0vTG80Qk8zK0p5cXVTQURlZ01E?=
 =?utf-8?B?SzFGRDFwMUxSeG1FTjhraDN3ak84dVMrallieG9tVUEramM1UzVvOHpvajJ3?=
 =?utf-8?B?elE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 311e33d7-fe7f-4f5b-bb56-08dab6002fa6
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 20:41:55.4088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b1hVRn3ROZZDZ+fR2xoQlEFk2yn/quk86K7q6lRuivx8pvzeWLekNAzRs4yrYwQedPp3/Rvw+ATfiZbddHiadUezks5I9u/JyaNixdJ+xyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5149
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

On 10/21/2022 17:10, Daniele Ceraolo Spurio wrote:
> Our current FW loading process is the same for all FWs:
>
> - Pin FW to GGTT at the start of the ggtt->uc_fw node
> - Load the FW
> - Unpin
>
> This worked because we didn't have a case where 2 FWs would be loaded on
> the same GGTT at the same time. On MTL, however, this can happen if both
> GTs are reset at the same time, so we can't pin everything in the same
> spot and we need to use separate offset. For simplicity, instead of
> calculating the exact required size, we reserve a 2MB slot for each fw.
>
> v2: fail fetch if FW is > 2MBs, improve comments (John)
> v3: more comment improvements (John)
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 32 +++++++++++++++++++++---
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h | 14 +++++++++++
>   2 files changed, 43 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index de2843dc1307..81e06d71c1a8 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -575,6 +575,17 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>   	err = firmware_request_nowarn(&fw, uc_fw->file_selected.path, dev);
>   	memcpy(&file_ideal, &uc_fw->file_wanted, sizeof(file_ideal));
>   
> +	if (!err && fw->size > INTEL_UC_RSVD_GGTT_PER_FW) {
> +		drm_err(&i915->drm,
> +			"%s firmware %s: size (%zuKB) exceeds max supported size (%uKB)\n",
> +			intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
> +			fw->size / SZ_1K, INTEL_UC_RSVD_GGTT_PER_FW / SZ_1K);
> +
> +		/* try to find another blob to load */
> +		release_firmware(fw);
> +		err = -ENOENT;
> +	}
> +
>   	/* Any error is terminal if overriding. Don't bother searching for older versions */
>   	if (err && intel_uc_fw_is_overridden(uc_fw))
>   		goto fail;
> @@ -677,14 +688,30 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>   
>   static u32 uc_fw_ggtt_offset(struct intel_uc_fw *uc_fw)
>   {
> -	struct i915_ggtt *ggtt = __uc_fw_to_gt(uc_fw)->ggtt;
> +	struct intel_gt *gt = __uc_fw_to_gt(uc_fw);
> +	struct i915_ggtt *ggtt = gt->ggtt;
>   	struct drm_mm_node *node = &ggtt->uc_fw;
> +	u32 offset = uc_fw->type * INTEL_UC_RSVD_GGTT_PER_FW;
> +
> +	/*
> +	 * The media GT shares the GGTT with the root GT, which means that
> +	 * we need to use different offsets for the binaries on the media GT.
> +	 * To keep the math simple, we use 8MB for the root tile and 8MB for
> +	 * the media one. This will need to be updated if we ever have more
> +	 * than 1 media GT.
> +	 */
> +	BUILD_BUG_ON(INTEL_UC_FW_NUM_TYPES * INTEL_UC_RSVD_GGTT_PER_FW > SZ_8M);
> +	GEM_BUG_ON(gt->type == GT_MEDIA && gt->info.id > 1);
> +	if (gt->type == GT_MEDIA)
> +		offset += SZ_8M;
>   
>   	GEM_BUG_ON(!drm_mm_node_allocated(node));
>   	GEM_BUG_ON(upper_32_bits(node->start));
>   	GEM_BUG_ON(upper_32_bits(node->start + node->size - 1));
> +	GEM_BUG_ON(offset + uc_fw->obj->base.size > node->size);
> +	GEM_BUG_ON(uc_fw->obj->base.size > INTEL_UC_RSVD_GGTT_PER_FW);
>   
> -	return lower_32_bits(node->start);
> +	return lower_32_bits(node->start + offset);
>   }
>   
>   static void uc_fw_bind_ggtt(struct intel_uc_fw *uc_fw)
> @@ -699,7 +726,6 @@ static void uc_fw_bind_ggtt(struct intel_uc_fw *uc_fw)
>   	dummy->bi.pages = obj->mm.pages;
>   
>   	GEM_BUG_ON(!i915_gem_object_has_pinned_pages(obj));
> -	GEM_BUG_ON(dummy->node_size > ggtt->uc_fw.size);
>   
>   	/* uc_fw->obj cache domains were not controlled across suspend */
>   	if (i915_gem_object_has_struct_page(obj))
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> index cb586f7df270..bc898ba5355d 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> @@ -6,6 +6,7 @@
>   #ifndef _INTEL_UC_FW_H_
>   #define _INTEL_UC_FW_H_
>   
> +#include <linux/sizes.h>
>   #include <linux/types.h>
>   #include "intel_uc_fw_abi.h"
>   #include "intel_device_info.h"
> @@ -114,6 +115,19 @@ struct intel_uc_fw {
>   						     (uc)->fw.file_selected.minor_ver, \
>   						     (uc)->fw.file_selected.patch_ver))
>   
> +/*
> + * When we load the uC binaries, we pin them in a reserved section at the top of
> + * the GGTT, which is ~18 MBs. On multi-GT systems where the GTs share the GGTT,
> + * we also need to make sure that each binary is pinned to a unique location
> + * during load, because the different GT can go through the FW load at the same
> + * time (see uc_fw_ggtt_offset() for details).
> + * Given that the available space is much greater than what is required by the
> + * binaries, to keep things simple instead of dynamically partitioning the
> + * reserved section to make space for all the blobs we can just reserve a static
> + * chunk for each binary.
> + */
> +#define INTEL_UC_RSVD_GGTT_PER_FW SZ_2M
> +
>   #ifdef CONFIG_DRM_I915_DEBUG_GUC
>   void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
>   			       enum intel_uc_fw_status status);


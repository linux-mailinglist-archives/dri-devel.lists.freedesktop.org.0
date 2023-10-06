Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEE57BAFA6
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 02:37:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9223010E089;
	Fri,  6 Oct 2023 00:37:39 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED4CB10E089;
 Fri,  6 Oct 2023 00:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696552657; x=1728088657;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WwBTWE3MTAAEWQCDi+MuAjR/70GTh/VgvKxxgMEcXqE=;
 b=Ns+tFsEMP+Bfb8LvzwmSaBGAzJ6g53+8tOyYDSc30I2wZxgyrXM1k51T
 s+zPvgkdo1TXVEjqlrOCp9qBNCrUv6zsv2yL4r4oJfV3YidodHGjGQD6r
 gai9imfki1kxFk/8VqvJSHf67mm6w3gLYG2P7NVN9dQ5UmIYY6grV2lOM
 +ISXmyoMuI+0/TJLrI6wbvQSVJYdmrGbaE+2YPdi04eCg4ylb6/4DNb8L
 m81hszL7W/82F6ZdWTViTWDHB8UulmDIRY6j2iutA64O+i00AqxEUSw+p
 JJVQN8Pksbk995++8Hf68ry0WvsFpYtfDgmn5RMWpyKgRT0yo1CKVj35t g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="363930864"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="363930864"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 17:37:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="787204592"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="787204592"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Oct 2023 17:37:37 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 17:37:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 17:37:36 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 5 Oct 2023 17:37:36 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 5 Oct 2023 17:37:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XDP+4DnJ8wvSKVwQ6D3BoJbB8KZRCEU1KqEeZbZMBQk//bqsXGQ8tUhiZK7Pd9zA+PatMMCoVt1aCmTwyQ//pTlFOUs/eu2JNpmLbsW2kXlNxhFMKAcy/UDELp7TRbMnQJF3I3nFeF0JDRWkWpTsj/RcnIisBvLda3zeegNYPm7v1BRdQVcFHAwwbrBPostFDRLYbTQOpJr3NIDq3PVoEj55mZae08OxnExqxhqHKQ+bt+5iOjadGEzh29VJEi/K1HzXNLaVwLbGjh1cs8hDED2UwbhiyDqsND/zvEwZrQpY1Ip4GXuIgUQDqL3cJstd56u+1aJf7l+j4T/3uz0xBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KxLLbmkPuWmwsIQg+fNfZI2CDmWn0pBFPBBH4LBPaSE=;
 b=nEnyrY2zAaBToPoTcjoiW5DEhqHYd22iQZYDavKwYNz1/TbGxvijISXdyBFu8ns77kqVzEFjIM4AlSJ3iWFWZnO3PFOmBzsNEBfq/O/CcrN3na5XfAQLfEpQ/GYkArvaHqlMMqKuWmVVE/nAvbSi0foL/6jXS7685cSokzsouP52/JveyLX2KikOO7RPLmTN+66yfS9SwachDNSvRthRRYRuIPTXp2ReRgQHJjmvhsNdPrJQgpqlL2UkdHj4H5tiHIgVpwukpYt3LWpb54fT6dVHOQ3wIh593ZnjqQpBgpXDX76G0w10UHFdu+FL+0QubJSqvTwaK5h2p8LNowsaxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by SA3PR11MB7434.namprd11.prod.outlook.com (2603:10b6:806:306::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.24; Fri, 6 Oct
 2023 00:37:33 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::2d90:2991:354c:a720]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::2d90:2991:354c:a720%4]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 00:37:33 +0000
Message-ID: <925ced5a-5b0a-b08d-c4f6-36905ec1e450@intel.com>
Date: Thu, 5 Oct 2023 17:37:29 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/guc: Enable WA 14018913170
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230914222813.278774-1-John.C.Harrison@Intel.com>
 <20230914222813.278774-3-John.C.Harrison@Intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20230914222813.278774-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0261.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::26) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|SA3PR11MB7434:EE_
X-MS-Office365-Filtering-Correlation-Id: 537d94e2-ec08-4feb-5fb5-08dbc6046dc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kcEeHheX3NZ1Ov1tiItdTPpQ4uvuPFw4+iwxDlqxu/T/KRZFuT3qZgRQy4/Wo0hKVQgQUu9KZk+3mR4eqzMKLgGrq/JrySVKSR7cyMtYe3xngd4GnJI5+9Bx+uUooRennp+vEzfP9UdyfbXebfjrxeYmNHdA3vKsU9+MCcbX5w+vg39XOtNje8iPl9KFjrK3vaD3QO7CB7+Wawe62atlJg6xYvsPb3EB5WGIg91oivn0wfpQVZDIJmUdBSdf0lbAATNV7DAC7LxVXQe+WXL2o1ufh1+sntGJdTvggUxgABVk9icFgRa8MEIX1ZRrL3EOtJ3esuqyZCVCC7ueD3cUCLfLNNWNQymBrCtP/uph4yRe2o5paSW/XHIUmsFoJmZaGF6XwYkhOeJKcfpYB7QTtli4i25ROqYs3AYAZmKwrcED00a8vM4r0U2/hRzCykCdA3wOEnI2e30yQzHNZBp2COH3KzxK2xeTaCUO/E28anEfuRSN8hBsetr1o7EI1dTR5WfKf3tSR7vPmxZBXLErIZ5d7udZbMtjQHQZVJt0ICh0HsFmQUVhv7pZhutNi5FgQnTOzjC1DiewKllh7eKiDHHUrqzr5c4D23hmWjWGcGuIaoOx2mVD/a7NXaMbckEz8h9OXFtQQBMEPH5kxQymuw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(136003)(39860400002)(396003)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(6512007)(5660300002)(6666004)(36756003)(478600001)(6506007)(6486002)(53546011)(66476007)(316002)(38100700002)(41300700001)(66556008)(86362001)(66946007)(31696002)(82960400001)(8676002)(450100002)(8936002)(4326008)(2906002)(31686004)(2616005)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzMwNXBoQkc2NUY2bExXK3dDQjRDb1dCNTViY2o0aXVWbUJXQ0hOZnZkUXZn?=
 =?utf-8?B?djd5VEpNcCs3Ti82bTRzdTBvR2dVSzVwc2tlVmQwMEJVQmd1eEJTSkQyTlNs?=
 =?utf-8?B?RWdXbUs5VkRoM29vMnQrK1FRUHdvNDEyM0ZiaEIwN2l6TXZlUXhtSFNIamIv?=
 =?utf-8?B?K3ZTSDd4YzQwL2VIWlpOTlpFK0dicTVCdWk5L2tVL1ZtS2dGTEljclVkSlJj?=
 =?utf-8?B?MlljY2RHM3ZyS1hPTHh1M2tHMGE2OWR5cmU4Vlllc2pHVFR6OVp3bnI1TlZa?=
 =?utf-8?B?d1VMcU1DZG8yMkNYT2RSWWxCbVpIdjNVMExucHh6SVU2RHRnYm1zRWNPMk56?=
 =?utf-8?B?aDNwTWhPMkVBS3hEaFV2VXhiR0NpYklqaVJaOXM5VTFObGdtMkN5d1h3cUlN?=
 =?utf-8?B?a3pxR0xaMnA2cVEySWV0Um9mdU1kdnptbi9UNmFheDJDTGVneElNUFg2ZFow?=
 =?utf-8?B?cmtYTUZCTmVZM1Q1c3M2UnNuNndEaWJWK3FWelNIT3Q4OFpXSzFBZmRIWmdn?=
 =?utf-8?B?bEtqTnlzU29IWVZ0eTVVOVFJeFpQSXhZS1RwMlJtV0tFTmNmclJHZm1UZnZK?=
 =?utf-8?B?Q0FoVnlrL1ZkSlAzd0lPY1ZudVVFaUdxWXFTV2tCNW5Kc0doTGRwZXVRMlk1?=
 =?utf-8?B?dkJ1d2t4REU5TWxOcEhRZGVydmdWTXp4ZmpXSnJNQk1hVWZNN09UblBleUtV?=
 =?utf-8?B?TDdQOHk4TEJpazRCakQzVWZKTmgrTERzbURteFBONzRYbU4zaG9laldwclBU?=
 =?utf-8?B?UjQxeFFXbFNYQ2s2aFVKK1dKK1loa1NwZXYyclltV3pGWDVKTjlMS3ErdUYy?=
 =?utf-8?B?L1RkQ2tiTXl5a0VxN3lZY1VzSXhqZlZPa1B3aUFseHNFNWI1MkNrSVlwVS9m?=
 =?utf-8?B?T01FWURHcmQrcEN5VUNSRytOZWFsVXRVVldSYzBsbHp4VGU5TzFXQ3h0ZkNv?=
 =?utf-8?B?SSsxYmFuWk81Wm5LREJWc0dhNUxneDZZRmpoSWJPSStRYVV2Y0crRk5ydXds?=
 =?utf-8?B?MjZhRkRHdnB4RkpkRmFZb3Zpd3Y5VnZmRUJuRDJwc094T3V0SGtzU1V5WUhx?=
 =?utf-8?B?OVY4dGtSUFlabnIwK1pRKzNDdFhvT1lPL2R4QVcxaUNKYUlHY1JhZjFyN1dD?=
 =?utf-8?B?SmhIOTAzY014YnRyRXV2YW9QejRYVUlIVC92ZjYxOUtZdjR0OGo2aEJ3YkdD?=
 =?utf-8?B?VXk3eC83TFIzSzMvdUJPNkY0RDN0cGUzSWJtUmYxMUtOUFFFSG56WW1XS3pH?=
 =?utf-8?B?M1gyVnozMW8rYjMvYmJZVXlONS9lSGRad2pRb281OTYwaFJnb3VkNHhIK051?=
 =?utf-8?B?eTZyY2ZxRVozS29MN29Ic0tlSk9hdk5YK3J2dmYxTzUwYnp3SHViblY0amVZ?=
 =?utf-8?B?cXhQZmluU1grbU1wT3pkZXFSbnI1dllrT1VIRk51dzk5L2lkaFdrenZNSkwz?=
 =?utf-8?B?WEd5T0NEWjJqeC9EY1B4enZpZjVxdjlENUxubHN4ODFudjY1R0JocjJGSHFo?=
 =?utf-8?B?S2hQU2kxSVhrVHF0WVFCcCtGc2locWFjWGN3MjNVZXYyZjFlT0dsM0JVS0cz?=
 =?utf-8?B?Q1dYRDJxbWtneE1tcjFwS0Y1RFFXN1BidzlUcGV1Ujlwc1pFdlJyUmU2emxt?=
 =?utf-8?B?Mmg1SENyZnFIVzRjYnlWUGY0NWdtMldPaE5NWmJRZW1MUkNMQ0FzcHBFQlE2?=
 =?utf-8?B?WHZUdzVOMnV5L096Si8ycjUwRFoyRXhBbDY0SlNDK051em8yZWF0UlJpUkJF?=
 =?utf-8?B?WVY2VmM4YU9QWFVJcmliY1RwcUJ1VXBwZ1pweS9FMFZjanZVNjRXclI0Sm1v?=
 =?utf-8?B?K2FVT1I1cmJ0YjRJQjluTWxKTTBqdVZ3R0svYkpkQmdqWTFxc2N2NnJjdUYy?=
 =?utf-8?B?aGdrdVpZN2U0OGNyYS9RUDdiMkxaTmdSQ2ZnM25ZN1NnOUllSXhRTThlWE9F?=
 =?utf-8?B?SFJoeVNuTlVvdndYbHh6bHRpNkhGQStaOGtxMHBxOHgzS3BxS2Zjb0ZKRUtW?=
 =?utf-8?B?Qlh0U05ubi9tamd5a3h3djlEL1RtNkt3YVBaTVdEOW83RjVNSFVnQzBmbWd5?=
 =?utf-8?B?QVBrYVUvSmZtOERZVUE2VWk2RVFJQnZVN2loMFdhOURlMWcrOVowdmM4aG1E?=
 =?utf-8?B?THRxUjBFY3F1Q0NHelg4NUhEdUVaMG1tZUZHMllTcmNjQUFGNnFweHhYemtt?=
 =?utf-8?B?eWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 537d94e2-ec08-4feb-5fb5-08dbc6046dc3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 00:37:33.1708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ut3MQ+573nsngyPMu8/I4plnkrWU+lunlLX5AGUZHytNhdyI3Y/JE3LfhPBhlWUnLAMrXoujKftiuUgdSdPmA3fOlnqYS/afZlYPdcbsp2E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7434
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


On 9/14/2023 3:28 PM, John.C.Harrison@Intel.com wrote:
> From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>
> The GuC handles the WA, the KMD just needs to set the flag to enable
> it on the appropriate platforms.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc.c      | 6 ++++++
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h      | 1 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h | 1 +
>   3 files changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index 27df41c53b890..3f3df1166b860 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -319,6 +319,12 @@ static u32 guc_ctl_wa_flags(struct intel_guc *guc)
>   	if (!RCS_MASK(gt))
>   		flags |= GUC_WA_RCS_REGS_IN_CCS_REGS_LIST;
>   
> +	/* Wa_14018913170 */
> +	if (GUC_FIRMWARE_VER(guc) >= MAKE_GUC_VER(70, 7, 0)) {
> +		if (IS_DG2(gt->i915) || IS_METEORLAKE(gt->i915) || IS_PONTEVECCHIO(gt->i915))
> +			flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
> +	}
> +
>   	return flags;

LGTM,

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

>   }
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 6c392bad29c19..818c8c146fd47 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -295,6 +295,7 @@ struct intel_guc {
>   #define MAKE_GUC_VER(maj, min, pat)	(((maj) << 16) | ((min) << 8) | (pat))
>   #define MAKE_GUC_VER_STRUCT(ver)	MAKE_GUC_VER((ver).major, (ver).minor, (ver).patch)
>   #define GUC_SUBMIT_VER(guc)		MAKE_GUC_VER_STRUCT((guc)->submission_version)
> +#define GUC_FIRMWARE_VER(guc)		MAKE_GUC_VER_STRUCT((guc)->fw.file_selected.ver)
>   
>   static inline struct intel_guc *log_to_guc(struct intel_guc_log *log)
>   {
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> index b4d56eccfb1f0..123ad75d2eb28 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> @@ -100,6 +100,7 @@
>   #define   GUC_WA_HOLD_CCS_SWITCHOUT	BIT(17)
>   #define   GUC_WA_POLLCS			BIT(18)
>   #define   GUC_WA_RCS_REGS_IN_CCS_REGS_LIST	BIT(21)
> +#define   GUC_WA_ENABLE_TSC_CHECK_ON_RC6	BIT(22)
>   
>   #define GUC_CTL_FEATURE			2
>   #define   GUC_CTL_ENABLE_SLPC		BIT(2)

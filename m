Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 238C93E2F6D
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 20:44:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6284F6EC14;
	Fri,  6 Aug 2021 18:44:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3676EC13;
 Fri,  6 Aug 2021 18:44:48 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10068"; a="194019348"
X-IronPort-AV: E=Sophos;i="5.84,301,1620716400"; d="scan'208";a="194019348"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2021 11:44:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,301,1620716400"; d="scan'208";a="669574022"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga006.fm.intel.com with ESMTP; 06 Aug 2021 11:44:47 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 6 Aug 2021 11:44:46 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Fri, 6 Aug 2021 11:44:46 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Fri, 6 Aug 2021 11:44:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G7bLm2erzOn835yz9M3N2DAhL+kdTPU3XasTZ4CF5S4W7207xl3eRKOsHCIy126v800zEZHjtg0USWmiRVnKAn2MRl2v+GDKd4HtBpqYTj9xNuxKKBP3J2aDRqUxH9S2YkPshPUeSg6mm+r3jYFYSE+A+pq38Np6tC5ChI9XUMrAID1Uoae1ZzBpKaJleQcDeTCc28GFKFcvwQ4BerVZj1wEGnGYJ4ZhTR4/ebOgoQqevYkEBAYXsBqVTmZGulcZqqURp1pjnTpDFDLAcOak/y3LjWbNbdfeZ+v9y7H4Ypb+3q/jHASwCXYdZEiPVuSu2YoBVN0MetoNelbEjREaQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35VP5I+t8w8HYl5wnhileQwebZrcN7jH85f604vSo24=;
 b=dChr/yGLakC6GNrTOFbIwVBqhZOWlLxZPG7ehM4dcldIvtuxoX1RybmwAplDi45USIWXhs128i7g5exl2AJt43luk6JR1D+S4HBMDdY1s7kYAFOC1KekQ2lMJ85rBr2HIC429miXxyvirAV8EZxcPx+dU49FVeS4WvjvTdm36+hlbnqvkLAy+RpBGJlJEaFSptsCCmqNpZxe5naezvvdSxa545HN/N3JxpKT+foNyr74w3kJrlnK8E9ulc5bnIPZH1G1whM4PbV/R/5lnplTgheSitWqeX5xib38S08RQQ1MFJuAjONrtKUo06Z4hH4VFaMr6nB4YFoMuMDe0pN6Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35VP5I+t8w8HYl5wnhileQwebZrcN7jH85f604vSo24=;
 b=wDSA7cV9veU46ZqQHG1zTEMTUGCx2RdTT9aXCGFQKGqYqvIQQWVrxMl0Ltr9LmnZxZM+/9hDx5RhpDBefnzcPEmIekedsUGxkFfrbByEzxkDJ7MjijAfbzD7WKyp2g2ZwHqRMyblXUL0cmk6UYiUW/xqkmQH+rBZu7XrCt3W+io=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5657.namprd11.prod.outlook.com (2603:10b6:510:ee::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Fri, 6 Aug
 2021 18:44:39 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4%9]) with mapi id 15.20.4373.026; Fri, 6 Aug 2021
 18:44:39 +0000
Subject: Re: [Intel-gfx] [PATCH 4/4] drm/i915/guc: Enable GuC submission by
 default on DG1
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210803051121.72017-1-matthew.brost@intel.com>
 <20210803051121.72017-5-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <c9928267-90ad-fd4a-4e4a-ba86626bc393@intel.com>
Date: Fri, 6 Aug 2021 11:44:37 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <20210803051121.72017-5-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MW3PR06CA0020.namprd06.prod.outlook.com
 (2603:10b6:303:2a::25) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.221] (73.157.192.58) by
 MW3PR06CA0020.namprd06.prod.outlook.com (2603:10b6:303:2a::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.17 via Frontend Transport; Fri, 6 Aug 2021 18:44:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c280cb79-8bb4-4cc2-fad3-08d9590a3f42
X-MS-TrafficTypeDiagnostic: PH0PR11MB5657:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5657CD6E585B315EC1140F73BDF39@PH0PR11MB5657.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:94;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6JN0DFaTRaaXtY0GpbEC/36ha7VJ3iNKFQAozLFN0iXaOR4Cfe9SROGcIDW7j/Yqdxlw6fpL1/8is/mDoa0E7ds0iF1V2OOs3KPMUrB5kzIzZdP6fHegC3FwM0xfCfOrmLy2/na+/27I0L7XiuhtHp5f40fpn9426ulY/W493ValAy+Hb7P53wu61I34AYF6gvChGeYHWrlDZoGAcUr3La4anWYN8x7ng5Wmzhj/eF/d2QckymVvSB6biC6pIzjqf/NZy50zcvyP/aDaBT6j+KehE+tsDqfzL561l/jlzes8TDK6dSmUzL+gqDEK2etvwtUfjt+pc6UBfciLip8lQXYiacpmVdK90U+h97rOCmd3uysSKeh9u/PAQAPL51C5AqqaCaR3LDTUeEypKdly0zBpxI1ndOL4eqs01EPo8gascLEUD13TXTzlWZs0ZLXSrSxgA9AIhozoyqS8WFtPuxvpNX93JuDFroCgh6jRgFQvkUHEIWAnsG9EAH5VaX959YfeptWg9gObP3IAMh7676AgSoPdtpcu7VCZ+0IwM2+d0cgXy/5RLw/zoWPuCJz7ayI+epVfe9IDPf/3Oo9lD4sJYWyU4L3C6qeoxJE/gqPMq+lqMlh+gmcS5XeQYTjodXknW14TN+HEx9o71c6+uXXUcsE18Yf3G1PISuxkOQYUAmreIOdccq4dj7Hu59BqCLELf4ZE0aclP3yvx+jRUVhoazRpwYsxYvzVrIHf4Mo3V3v1uzoJIgKoH1vATwzh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(16576012)(26005)(316002)(2906002)(2616005)(956004)(4744005)(8676002)(53546011)(8936002)(186003)(66946007)(450100002)(66556008)(66476007)(508600001)(5660300002)(6486002)(31686004)(83380400001)(31696002)(86362001)(38100700002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVFnNDY0dTdQY3lzTXBHM1lKVWFkRFk4YU1hQzRIZFA2N0w4YXdLMDB6WlNF?=
 =?utf-8?B?YXA4YTdHcElFMWNUMTI5UG5PQlkvNVVjUlNwcDg5MzUwTUV6VW9iQnVDdXR1?=
 =?utf-8?B?TlE1dVNlWSsvYVhiNFlReUg4NWhQUWlTdzRmUGYxQXBVMGZmV0lCR2NZU3Rz?=
 =?utf-8?B?TXJnZzZqZ2cwTzN6ZmlEMENWWmp5THJWdU1CUDVaN2R6M3k0R0FhS1hIRU8v?=
 =?utf-8?B?c1BUOEVHNUYxeENGbjR3eGVLM2lvbHRKdGNWTGJMVkVGb0I0U3J5eEhvTGxv?=
 =?utf-8?B?RWk0cmJWektBZVgzeDVFcGtheGt2bVR6WG9RTDMwV09LTjFxZ1Vjb2J1T2x1?=
 =?utf-8?B?YjFvZUVxWDV4NWM5SXRLdlRJYldSaUdqL1o5VktTZGhIdFdScFlqSzZURHBV?=
 =?utf-8?B?U0NGWlU3bkhFbWJjRm9RN1BhNFpPbVpsK3VLMlF2ZXFQTHArZWdaMTFud2dp?=
 =?utf-8?B?UWZKWWFTa2MzTmZzVG1laXhBbGhyWjg2ZXUvUUVDd2hpSGFzM0N1bmZIYkQ2?=
 =?utf-8?B?TjNTT2Y0T0g3MHAzV3A1MTdaSU5nWWlZamdLOGlnY0twY0Q3aW5idUdJZHFG?=
 =?utf-8?B?UytZbCtzem1qWmRtZDl6Q3FtTE93NStoeklSUmFDSEUzaythVUg1b3BBMmdq?=
 =?utf-8?B?QWJFdVRMb1djNG5wbzQ4T2JSZzl5NTE1OUIzN2dIRUVSRVNHNW4xTVkzZG05?=
 =?utf-8?B?YktDdjhyTHRWNUtBT3ZzK01UT001c3ZIZmE0Q1lUL3d4eTd2VHlKYTlOQXhT?=
 =?utf-8?B?SzFidHpTelQzZHFUNFZUNDg1TFlHOUFSU2VhQ1VXOHF5aEJwMHB0S2tFellM?=
 =?utf-8?B?YkMrQ25ZdmtWRlR2cHZTbW0zVkI1OEJVUE1jbmF5MDlOc2JLamd3bVNGNis1?=
 =?utf-8?B?QzhXd1BJUER4clRqVWFaaUpua0JBZURLdWVXU0NDdHp2UGM3ZEc2TEZDQ1lB?=
 =?utf-8?B?Wjc3elE2U3dLaUhvVjdlaW13dnRGRWRXamgvcEZFTmV6TVlCblZram5vM2RT?=
 =?utf-8?B?RVAwOFVqUE5WOXpnV1M0TjBWRm1CK3E4eDNubERkc3V2bzVldW9BUlRkZ0cv?=
 =?utf-8?B?RXdXOXBvcDBmYXhoS3Fpd3Y2WThES0Vqc1dyZ21DK3g5Nnc2RU9XZ05DSzdq?=
 =?utf-8?B?NVl0Yzhsd2hTeVY3b0FzWGE2d1ZPV1prN3NjMytDc0FJcE9RdTg4WUY4UnNq?=
 =?utf-8?B?cXM5UmFReWlRcmhqYkhTWEVzK1VMSUxBVVdqczNHdmFGd2ZTMVc4NkE5Wjd3?=
 =?utf-8?B?aEhXcVJ1cSsrZ3QrYVBsNFJQcTQ3Tm1acXozekU4OHRrbEFXTk1iTldwYndP?=
 =?utf-8?B?VFBQODZwclFZNWxhaE93ZWVFcSszeDJsRzRzZ0x2YnFOQUpkOHd3VVBBYWhB?=
 =?utf-8?B?d0FqenNtQllvcnJWVWRpRzJUZVg5Lzh2NmhpNjhGMHhETFJhUTNQckErdlhM?=
 =?utf-8?B?VmV4N2VMbVJaWDdsYms1clEzR1hVQlhYZ200bDZuOXVIczhwOEFkdXlKUkFI?=
 =?utf-8?B?R2Jpc0hJSXUvSnFSMkd0WUtndVJwbXIxK1ZvT0hqa2FWdndNcmVmWFJJczI3?=
 =?utf-8?B?TVBiTWxFTmJ4RitlMWllTzZ6U2VnOXZvVXVzTHQrTjdXaFV2UmJpcmVtQ2xv?=
 =?utf-8?B?RnQreFluK1NiZVQzaExEZnd6NkVvaWxiR3NzSnY3MzhFei90Vm8xVlc1OVlH?=
 =?utf-8?B?cUE3bnVNUnlEeGUzc0pjbGluU3JZM2dmVmt5ZU95Zm1IS1pMUlZsNUpncTMz?=
 =?utf-8?Q?8z2SRF5Ujob9N98hOcPo6A9M8OT2l+K0Zl+xO9A?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c280cb79-8bb4-4cc2-fad3-08d9590a3f42
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 18:44:39.8352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bKA576PIwu/f6mwKJjV8DpSZhoyD2SZfqU+vf0AQffpd75Ouf92MSCjxmB8nj85anHvM3MSqY+dsWfqFLgqvlgQDqnnVcqVVhC7brcJ61sE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5657
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/2/2021 22:11, Matthew Brost wrote:
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_uc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index da57d18d9f6b..fc2fc8d111d8 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -35,7 +35,7 @@ static void uc_expand_default_options(struct intel_uc *uc)
>   	}
>   
>   	/* Intermediate platforms are HuC authentication only */
> -	if (IS_DG1(i915) || IS_ALDERLAKE_S(i915)) {
> +	if (IS_ALDERLAKE_S(i915)) {
>   		i915->params.enable_guc = ENABLE_GUC_LOAD_HUC;
>   		return;
>   	}

Reviewed-by: John Harrison <John.C.Harrison@Intel.com>


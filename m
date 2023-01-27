Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E0767DAA4
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 01:20:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2484710E0CD;
	Fri, 27 Jan 2023 00:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28AB010E07E;
 Fri, 27 Jan 2023 00:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674778826; x=1706314826;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ae+WvlYfRtNgS0jngTb7PF1DmZOU+Jzi3IDbq8RJtMc=;
 b=YUk7mJLL1qdoMlbq8qlApZPvJ58u+yproGoqme09W6VQl0AThJa64s61
 mO6+3Q6XciIOeCnvc3nk4dtYBIH43+YYsZevKRw8O2ANP6SljxI/DAXdc
 1A5Qcf3vfSFdcL9PpxdAh2U/RxefunV/iXDvSPN6WhzzE2u0ALBTeP3xb
 I90b+HdiEZ368tyHlNwz+KXxGe37izBdm4jd3lDJlDn6vQWYMjgxiH4zz
 DjM38MQ2aPtbDMiz5vQJYwGjJOhEX4AlE/n0Z5kA0DRWifOfPImsn364K
 ZrLisrcKEUr8VwILVgn3m9TlbA534ZHnvKEC3ZuhWh+C6ij5FLDylTLiz g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="324685897"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; d="scan'208";a="324685897"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2023 16:20:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="787051233"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; d="scan'208";a="787051233"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 26 Jan 2023 16:20:25 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 26 Jan 2023 16:20:24 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 26 Jan 2023 16:20:24 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 26 Jan 2023 16:20:24 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 26 Jan 2023 16:20:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LdNadgin82VOWmHBCm+nn5h7ZvABwWbgougj8YuvaouBOnqu33Ys+udSnQFCtdjZSgd/9EyZtyn6XAJ0wvxv4hMFxLm5kEMIpwxDYxfZeYosqjGWDegonHZTS7HdLIqtDVMZ8FhSjXETtM1YhpWGQYbsdICgJc+4/nr36WGC3/mI3vl32OG0DEjZzVOIJEQbW97Qrwoosw3UiVCm1zNRi9qponD1WWJOwXMpLXxPEEgn4dQ1DkWRMG5eTiyRUHx9X0GbeCUCOdMIkD7oTqqZEQG0SKbyDU6si3ztdSvAtc67Z3dP8sTFBgikVNk+LGxvX2liMBMM+PKMAWIlQuBoxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zW27NVscKlWQJ/EGC8rumcuwgm6C9G8EidGZtcU2HY8=;
 b=Hq4kh2MNatmeIiM6/BU6hONdvVFC8FPWZwneBBS0oCicLXr8YrFHNJv6Vw6w0lkIXS65erejYZWbMgVnN/ghBNcjFrc9aagDyKT5QCqJCt/qe5k4/TPJkRBXrHCoACgDEBvzaF5mMwx5wzTSpjwiC/YpDIOI2dUAV+VdABsBcNg0mcU3ucGBleahFUh8tZlIPSKg1dVZJle3tEbr7aurBu7wFuN4c3o4wCzXdAa8rThvIOB31I2SH3MAsi1N2kaJNmpMM6WExIXVXdZtuPzW6Om0Ckj2zyMloD4DYfGHpDs8b8eJMiiKptJGEqS2HHDwX3dATMwXUvvOV48yLPD+QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5475.namprd11.prod.outlook.com (2603:10b6:610:d6::21)
 by DM4PR11MB6480.namprd11.prod.outlook.com (2603:10b6:8:8d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Fri, 27 Jan
 2023 00:20:22 +0000
Received: from CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::166f:f9d8:6041:9f28]) by CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::166f:f9d8:6041:9f28%9]) with mapi id 15.20.6043.022; Fri, 27 Jan 2023
 00:20:22 +0000
Message-ID: <e6af4539-a8e3-6e0a-6202-9d8158522ea4@intel.com>
Date: Thu, 26 Jan 2023 16:20:19 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 2/8] drm/i915/pxp: Add MTL hw-plumbing enabling for KCR
 operation
Content-Language: en-US
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230125080651.100223-1-alan.previn.teres.alexis@intel.com>
 <20230125080651.100223-3-alan.previn.teres.alexis@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230125080651.100223-3-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0375.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::20) To CH0PR11MB5475.namprd11.prod.outlook.com
 (2603:10b6:610:d6::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5475:EE_|DM4PR11MB6480:EE_
X-MS-Office365-Filtering-Correlation-Id: e93c1436-13db-4fb8-16c1-08dafffc4716
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BsgYIMBWs84NHlcrxAw1NVzRebo4K/8AfNBeChZE8vCkYFNPGEGGpfN98taITPESXrTAsDYuJ4zx9DxCmTcPyc1xe+X31PO9XXimrb0tj8NmZzR1R6Nj1CE+RoMOGIhfEZ3zY1K26a0ETr6Q1tVqquwEyzbFRWHvK450sSmOli4V7LyNfjHfzeTzMgSWqO6W+GhDaCtO2wYPVaWEL8wHvJI5b/zDWw7D1O7vEwrxHoCp/pRjZdk40KaT8NHzXFidevgkgRurRRZWCneh2+ZO3GEQKZi4YzxTs542QPiYDe5lT9r5zC1H5D0GIyiYjApIqdbKZNu4U8ggYB3RRFHQUpQqieLz9t9dQsDNrweF4VkayXRJYBm7FCOFTtSmFg8XlWmxwaQD5fxmKgAnYnCzuJuze2vH7oSmDHa1PYuzdTHykb3ZSwhyeUuOTeyULvaws79N0zlxt0R8ES4PJxqXsVwwL166TK57RAy+45rQt3z9xhRQsPfVx/sE2f4w/O4u7XBKwFs3VOEdcfgXA5fk/TKgkkdQv7N7d803JIf3SMCqf/SxjpTAKNYvNxpGiOXdGelc1B02vaESz5SDz7bPCYGMw2DR3j7djnGNoQh5w3YkU3I0cwzInUifJEL4j4YkbCii/8yA7/S2GxA86NPbhNB87WjkE0S4ZTeUQ++MIXRlrjFPclaioWnmmjOi/vcY726mczdqtnT66cMMfmYith989003RhuzNmDsfp/GObk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5475.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(346002)(136003)(366004)(376002)(396003)(451199018)(316002)(83380400001)(31696002)(82960400001)(86362001)(38100700002)(36756003)(6486002)(186003)(26005)(6512007)(478600001)(6506007)(6666004)(53546011)(2616005)(2906002)(8936002)(41300700001)(5660300002)(31686004)(4326008)(66476007)(66946007)(66556008)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tk0xR285MjFQUW91N3M0RW5hVE9PYzhXTWNiSG45UHBNZk1YbGg0c0xsckZI?=
 =?utf-8?B?SlpySW5hNExoZDJjNE1FenFqQk1HSjl3dnhiK0N1OWxocHZKNGpxbFFybHFs?=
 =?utf-8?B?WDRQaFczeHR1ZWRWK1F3Q2tYbU12UVE3S28weERRS1VjMmM0cFN5UVNLOGpC?=
 =?utf-8?B?bFloTzRrUUNJY0pldTEzMzBXRG9adDgwQlFFQkRZMUNiWlFWajU2aXNWVXYv?=
 =?utf-8?B?MnIzYjdYREg5RDZiVExuTUN5RWV5emloOENOdlNGdHBKaGZTQmxaMVl3anFP?=
 =?utf-8?B?NlA1b3BxWDBaTGlwb2MrRjlBTDZoTlpTWkRZNUwwTUtudGFLVmc5dXJmZlJH?=
 =?utf-8?B?Nk9vc09TbXdhaDBZOVRwTTJJWDJCcUdxNnRJRDNhRmordHdNR3diOGpIMHJ5?=
 =?utf-8?B?Z3hPaDNEVnR1RlpLK2daTGZMbmtUamVCUHZzL3lPNGRPbFFEUkxlL0JvdXNo?=
 =?utf-8?B?QTNDOC81Qit3dGk3Yklia2tBR0w5Y1Z0dDJqeTlzVC9YUjRTaUhwMDN2YkN0?=
 =?utf-8?B?WUw3WVJIVEkveVIxbUJreDRVVE5NWTVBejg3Mmllc3Q5dGtoaE9YWlNldWZ4?=
 =?utf-8?B?aXRmVXJBWlhXMk9xeFAzUkUwdE43dlFDNkgzdGRGNzc1WWgwWUZyamZoYmNG?=
 =?utf-8?B?bmdYaTNWVUxRN3QxN2NHM0NaUHhTU0ZUT0xKOFZab3JLWThPaXNhSGtReVZX?=
 =?utf-8?B?Smc3aUc0VkRnQ3JpeE0xdXVpUC9BbFYxVkNBSzBjTW1nQnExYTYyRStCTi9W?=
 =?utf-8?B?dHFCdU8xNjV6amliUEI4eVZKamxPMzY0cTliV1N5a1RhV3J6Mmk0T1RDRjhL?=
 =?utf-8?B?dTdiaWJiWDJzYUIrTjMzV2J4MHV1cW5xSVNMdU4vMm1WcnRaTXdMV0I0RDZP?=
 =?utf-8?B?SzdWVkN5U2ZpZHk5akFZZmpBeUtzMXFwQTZ5Z2FLcXNlYkdJaEF1d0Q1ZWVH?=
 =?utf-8?B?TWpLRGE0YXp3RTNhTDcyUnVGVW02b3VnQytIMm5IbXcxQi9YZTQ5cFBUZHA3?=
 =?utf-8?B?OURXaWRFRG1Qb2xLYmV4QkpZRk93bUJ4eXdjVS91NUxGbWJEcE1GcEowdUhY?=
 =?utf-8?B?VzJLYTBqSVJtR21zbWJqZ1pKK2oxTlpxamtBL1Evbm9qVm1sQTZQWW1rT3M2?=
 =?utf-8?B?SmNxZU9qeFBwenNCYnZYdFU0TDdJblFqV1dGQjR1TXB0VkVIelhmWW02MHNQ?=
 =?utf-8?B?Ly8rU1cwbzVsY0U0ektUc2JzQitoTlg1OEJBRzZFeStkZWZyZEYxVkxxdkgw?=
 =?utf-8?B?VkNhT1lmcm1uSStjQ0xkSVpuM05rL2t2ZDhucWV0dndnVDRNdTJ1U3ExU1l4?=
 =?utf-8?B?UXQ5Qy9ldUlnV20rb0pjNzAvUVU2aVVEV0JYbVRXbk51TjliWGhnNXJZQURT?=
 =?utf-8?B?dE9Db2U3K1F4SFJhOXZjbURVOXJGRDhCMmdlMC9YMzVQSjRVcmREVHN6S29v?=
 =?utf-8?B?QjhBMUhNeVR0THdIaC9LdVhlZlZhV0VNUjJ0QnBza0l4OEx2ek5sZUpKYjYy?=
 =?utf-8?B?ZGcyMG5TUzRlMGpDTjBQK2dpa0NadHRVRk5qQnlaUnJob1ZQclQrVnY2eFBQ?=
 =?utf-8?B?VDVHbDVLK3JqczdPMDl5WDRSTmJvcmtqbDJTWDhobjEzNitoZ1VTbGtIT29Y?=
 =?utf-8?B?RjZoMXM5aWFFNVBOU0dvN1RnTXdQM0VuQTY5K3o5SENKd0RqYi9JSzcxclQ5?=
 =?utf-8?B?Mk1FRThaSStveVhlVjBDbmFoZ1NMcFFXcWZhL3FCR0hYMllsZ2VpS1ZKdDF3?=
 =?utf-8?B?SjNRbjJURDJKZ1hUYWdFZUVGUVJFWWtPbHJ1a092RjExV1FETHMrSGZPV0c5?=
 =?utf-8?B?b2c4Syt0RzdBdW9HYWpIZ2VYektONkZ0TnJ1dkRnVkQ1eStURFhGTTduV05F?=
 =?utf-8?B?ZXBNREZxUkpoSDJOcWpoTytDbmFKRHpEaldMWjU4TXgxakIvV3F4M0dnTE5w?=
 =?utf-8?B?VkJxVURYajZYNkV2bkxyMDlvb1dmbzcwOHMvTkRYVDcwOEUvMEhNZkFDL2lC?=
 =?utf-8?B?NkV2K2lCY1R6SkNzSlVhR0tpWFdZbFZxS1RQcFEvanZSTk9YU3VDd2NKZ2VD?=
 =?utf-8?B?ZlVxdUd5RmNKaFpTRFdSN0ZOUVIzTUV3eStZbS9yU1FISVZPN2QvNXhTb2lo?=
 =?utf-8?B?aUFrdmVYWWZYY1daNWxLanJ1SURWSU8xNWV4ejcyekFGcFB0YXVQUE9JRTM1?=
 =?utf-8?Q?PczuraBLo04CAWRN118G350=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e93c1436-13db-4fb8-16c1-08dafffc4716
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5475.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 00:20:21.9411 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HGZU7AqVKS4+jiNaLDKd3fRF5rcgEgreLVje4YJVQXFSIa0VYEETIsf/ZQ/WnLMjjBBz1JxID0LTTCTFIh1hjLGTI+km8TZWpAMTaiihARA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6480
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
Cc: Juston Li <justonli@chromium.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/25/2023 12:06 AM, Alan Previn wrote:
> Add MTL hw-plumbing enabling for KCR operation under PXP
> which includes:
>
> 1. Updating 'pick-gt' to get the media tile for
>     KCR interrupt handling
> 2. Adding MTL's KCR registers for PXP operation
>     (init, status-checking, etc.).
>
> While doing #2, lets create a separate registers header file for PXP
> to be consistent with other i915 global subsystems.
>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/i915/gt/intel_gt_irq.c       |  3 +-
>   drivers/gpu/drm/i915/pxp/intel_pxp.c         | 32 ++++++++++++--------
>   drivers/gpu/drm/i915/pxp/intel_pxp_regs.h    | 27 +++++++++++++++++
>   drivers/gpu/drm/i915/pxp/intel_pxp_session.c | 12 +++-----
>   drivers/gpu/drm/i915/pxp/intel_pxp_types.h   |  6 ++++
>   5 files changed, 58 insertions(+), 22 deletions(-)
>   create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_regs.h
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> index 1b25a6039152..c360776a98b5 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> @@ -100,7 +100,8 @@ static struct intel_gt *pick_gt(struct intel_gt *gt, u8 class, u8 instance)
>   	case VIDEO_ENHANCEMENT_CLASS:
>   		return media_gt;
>   	case OTHER_CLASS:
> -		if (instance == OTHER_GSC_INSTANCE && HAS_ENGINE(media_gt, GSC0))
> +		if ((instance == OTHER_GSC_INSTANCE || instance == OTHER_KCR_INSTANCE) &&
> +		    HAS_ENGINE(media_gt, GSC0))
>   			return media_gt;
>   		fallthrough;
>   	default:
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> index 22280408156e..4350921e40c4 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> @@ -14,6 +14,7 @@
>   #include "intel_pxp.h"
>   #include "intel_pxp_gsccs.h"
>   #include "intel_pxp_irq.h"
> +#include "intel_pxp_regs.h"
>   #include "intel_pxp_session.h"
>   #include "intel_pxp_tee.h"
>   #include "intel_pxp_types.h"
> @@ -61,21 +62,22 @@ bool intel_pxp_is_active(const struct intel_pxp *pxp)
>   	return IS_ENABLED(CONFIG_DRM_I915_PXP) && pxp && pxp->arb_is_valid;
>   }
>   
> -/* KCR register definitions */
> -#define KCR_INIT _MMIO(0x320f0)
> -/* Setting KCR Init bit is required after system boot */
> -#define KCR_INIT_ALLOW_DISPLAY_ME_WRITES REG_BIT(14)
> +static void kcr_pxp_set_status(const struct intel_pxp *pxp, bool enable)
> +{
> +	u32 val = enable ? _MASKED_BIT_ENABLE(KCR_INIT_ALLOW_DISPLAY_ME_WRITES) :
> +		  _MASKED_BIT_DISABLE(KCR_INIT_ALLOW_DISPLAY_ME_WRITES);
> +
> +	intel_uncore_write(pxp->ctrl_gt->uncore, KCR_INIT(pxp->kcr_base), val);
> +}
>   
> -static void kcr_pxp_enable(struct intel_gt *gt)
> +static void kcr_pxp_enable(const struct intel_pxp *pxp)
>   {
> -	intel_uncore_write(gt->uncore, KCR_INIT,
> -			   _MASKED_BIT_ENABLE(KCR_INIT_ALLOW_DISPLAY_ME_WRITES));
> +	kcr_pxp_set_status(pxp, true);
>   }
>   
> -static void kcr_pxp_disable(struct intel_gt *gt)
> +static void kcr_pxp_disable(const struct intel_pxp *pxp)
>   {
> -	intel_uncore_write(gt->uncore, KCR_INIT,
> -			   _MASKED_BIT_DISABLE(KCR_INIT_ALLOW_DISPLAY_ME_WRITES));
> +	kcr_pxp_set_status(pxp, false);
>   }
>   
>   static int create_vcs_context(struct intel_pxp *pxp)
> @@ -127,6 +129,11 @@ static void pxp_init_full(struct intel_pxp *pxp)
>   	init_completion(&pxp->termination);
>   	complete_all(&pxp->termination);
>   
> +	if (pxp->ctrl_gt->type == GT_MEDIA)
> +		pxp->kcr_base = MTL_KCR_BASE;
> +	else
> +		pxp->kcr_base = GEN12_KCR_BASE;
> +
>   	intel_pxp_session_management_init(pxp);
>   
>   	ret = create_vcs_context(pxp);
> @@ -319,14 +326,13 @@ int intel_pxp_start(struct intel_pxp *pxp)
>   
>   void intel_pxp_init_hw(struct intel_pxp *pxp)
>   {
> -	kcr_pxp_enable(pxp->ctrl_gt);
> +	kcr_pxp_enable(pxp);
>   	intel_pxp_irq_enable(pxp);
>   }
>   
>   void intel_pxp_fini_hw(struct intel_pxp *pxp)
>   {
> -	kcr_pxp_disable(pxp->ctrl_gt);
> -
> +	kcr_pxp_disable(pxp);
>   	intel_pxp_irq_disable(pxp);
>   }
>   
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_regs.h b/drivers/gpu/drm/i915/pxp/intel_pxp_regs.h
> new file mode 100644
> index 000000000000..a9e7e6efa4c7
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_regs.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright(c) 2023, Intel Corporation. All rights reserved.
> + */
> +
> +#ifndef __INTEL_PXP_REGS_H__
> +#define __INTEL_PXP_REGS_H__
> +
> +#include "i915_reg_defs.h"
> +
> +/* KCR subsystem register base address */
> +#define GEN12_KCR_BASE 0x32000
> +#define MTL_KCR_BASE 0x386000
> +
> +/* KCR enable/disable control */
> +#define KCR_INIT(base) _MMIO((base) + 0xf0)
> +
> +/* Setting KCR Init bit is required after system boot */
> +#define KCR_INIT_ALLOW_DISPLAY_ME_WRITES REG_BIT(14)
> +
> +/* KCR hwdrm session in play status 0-31 */
> +#define KCR_SIP(base) _MMIO((base) + 0x260)
> +
> +/* PXP global terminate register for session termination */
> +#define KCR_GLOBAL_TERMINATE(base) _MMIO((base) + 0xf8)
> +
> +#endif /* __INTEL_PXP_REGS_H__ */
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> index ae413580b81a..28f5ca838cb7 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> @@ -10,14 +10,10 @@
>   #include "intel_pxp_session.h"
>   #include "intel_pxp_tee.h"
>   #include "intel_pxp_types.h"
> +#include "intel_pxp_regs.h"
>   
>   #define ARB_SESSION I915_PROTECTED_CONTENT_DEFAULT_SESSION /* shorter define */
>   
> -#define GEN12_KCR_SIP _MMIO(0x32260) /* KCR hwdrm session in play 0-31 */
> -
> -/* PXP global terminate register for session termination */
> -#define PXP_GLOBAL_TERMINATE _MMIO(0x320f8)
> -
>   static bool intel_pxp_session_is_in_play(struct intel_pxp *pxp, u32 id)
>   {
>   	struct intel_uncore *uncore = pxp->ctrl_gt->uncore;
> @@ -26,7 +22,7 @@ static bool intel_pxp_session_is_in_play(struct intel_pxp *pxp, u32 id)
>   
>   	/* if we're suspended the session is considered off */
>   	with_intel_runtime_pm_if_in_use(uncore->rpm, wakeref)
> -		sip = intel_uncore_read(uncore, GEN12_KCR_SIP);
> +		sip = intel_uncore_read(uncore, KCR_SIP(pxp->kcr_base));
>   
>   	return sip & BIT(id);
>   }
> @@ -44,7 +40,7 @@ static int pxp_wait_for_session_state(struct intel_pxp *pxp, u32 id, bool in_pla
>   		return in_play ? -ENODEV : 0;
>   
>   	ret = intel_wait_for_register(uncore,
> -				      GEN12_KCR_SIP,
> +				      KCR_SIP(pxp->kcr_base),
>   				      mask,
>   				      in_play ? mask : 0,
>   				      100);
> @@ -108,7 +104,7 @@ static int pxp_terminate_arb_session_and_global(struct intel_pxp *pxp)
>   		return ret;
>   	}
>   
> -	intel_uncore_write(gt->uncore, PXP_GLOBAL_TERMINATE, 1);
> +	intel_uncore_write(gt->uncore, KCR_GLOBAL_TERMINATE(pxp->kcr_base), 1);
>   
>   	return ret;
>   }
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> index 326bd8414407..be51e43ac23d 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> @@ -26,6 +26,12 @@ struct intel_pxp {
>   	 */
>   	struct intel_gt *ctrl_gt;
>   
> +	/**
> +	 * @kcr_base: base mmio offset for the KCR engine which is different on legacy platforms
> +	 * vs newer platforms where the KCR is inside the media-tile.
> +	 */
> +	u32 kcr_base;
> +
>   	/**
>   	 * @gsccs_res: resources for request submission for platforms that have a GSC engine.
>   	 */


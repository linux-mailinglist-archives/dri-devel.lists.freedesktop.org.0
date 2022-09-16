Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0FF5BACDE
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 13:58:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8AB510ED12;
	Fri, 16 Sep 2022 11:58:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 907C410ED0D;
 Fri, 16 Sep 2022 11:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663329500; x=1694865500;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iQkwpNP6VrsVsfynXgJnxWuxKj0mktj6euBCWL2KDxQ=;
 b=XGYNIlus43xjI0MQubo4vmbWYqsRwsyYxifoExRz28dpkhM+aFL7I3TM
 TyQjGVXw6xpTcRl19V0uQMcucG69z5JiWZN6bfzH5qAHKmujHmCv8J713
 mhDiAdDGT8s9e4gSJilDFNx0R+PJbXz3n03CIAqtiPP7TUcl5sAlm1AsG
 dzZkcUZE63yQGPz7lxhlaibx74FPVgs3FS87NohHKhV3BwI3Oww880VWW
 WmRb8eJKEuhwspGrk/oR8Y8Gzhtv+Kx91hS2aFVgbgkppi4lqxIz7OTn3
 zgVbudSU8+bntoF5jYShIZq+mKYOJs9lib5X+ppe5AnIUo2/+EgJWA82U g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="296564424"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="296564424"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 04:58:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="617643499"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 16 Sep 2022 04:58:19 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 16 Sep 2022 04:58:19 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 16 Sep 2022 04:58:18 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 16 Sep 2022 04:58:18 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 16 Sep 2022 04:58:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A1Woc33s3yUtZ4/p/jf6VuEQj9MeL5ClkyFwx6rx9EGYNZi3mj6AsM+2Oj0twWUjbAivLBoDJurETH95tYEsmiz8gWCtYfT4Rl7C5+cE0nbV3r8KCSEnAaJCG9vYRl2ENswp7sbpxZk1MfgxMDV+ocJlehG8IZGGbQ8rl3boctuoQtIuquSWwWHUHBRJ90R8ryFtVtRPjacDesMWqJt6x5bVtks02IRBMfULbEwKvmrD72XfOvfJjKNU6ZYLAeKgGCntFNGO+vaMGB2Pu7tfRSCBGvTo/4ScIvotNYud7tEALOybP2Z7Bk4d+kQLJJtAe7728/RDA98IiUHN5mllug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oT+E09hdAasdknbXg7Wr2AmqdTll+SBPDarmow+I5B8=;
 b=LxXf+wIYqyZpW82+MDl5cspcUm9ZfgW9ZzUPKvX7WNqN46c+I99/sAjcqrI8hGBgxHHwNsCAeLFPiKTl1fHBASKigWczbKpXGjDGw2VoiGDRtzDKLsfe3Z4zbb4V+N6uPhf75ohlBlYftonMjzn6M0WZ6ic/ULWjKSia7vo6cAk7KIMSxH0chV++6YgZDiZUA+8f6T5PSFad7g8G2keQpFSJ+udFSL3P/5Z42x6gRL/tDhqFkEncgpYNfNtweIHwAPpemkfT5RsfE1A/eE1LIBZ1th35Xbp4AZLYzrSKVOMcqhAvSgOM/W5Ru1qlAko3dqIEhLIqUsGdLermiY9g8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by SN7PR11MB6922.namprd11.prod.outlook.com (2603:10b6:806:2a9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Fri, 16 Sep
 2022 11:58:17 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::bde0:ec99:6d15:8763]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::bde0:ec99:6d15:8763%9]) with mapi id 15.20.5632.017; Fri, 16 Sep 2022
 11:58:16 +0000
Message-ID: <50bb49a3-6f29-ec5d-539a-68e7cbbdced9@intel.com>
Date: Fri, 16 Sep 2022 17:28:07 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH v1 2/4] drm/i915: Add missing mask when reading
 GEN12_DSMBASE
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20220915-stolen-v1-0-117c5f295bb2@intel.com>
 <20220915-stolen-v1-2-117c5f295bb2@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <20220915-stolen-v1-2-117c5f295bb2@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0047.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:49::11) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|SN7PR11MB6922:EE_
X-MS-Office365-Filtering-Correlation-Id: 870c6636-780e-4a89-2b5a-08da97dabd98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2TCLW4KR6tJn3znIlhKwRWuF2vXwsZynQDJ37XmmGIF89m+lk4P0gG1XtNP4NTWy0pgIi1Fc3MuebBbqIkllKg4h5sN1ZLRRT7DqVb1e6bK621TboAeQS6ARt0vSIjB3sEhWgInOvOyPmTW/ygAiPiuMxE8ScU4/X4wpR66DUt1h7LESnrfRc5rq8sd61LpBdywa/h8OU6m665Si88sP9w5zteKixQsktAvWRfltOSsaSGkdpGEFCwIKLIMTp6Gldao6yQbBkZaIb29T9nUMc7lV1xB3Jty58nwOokKGv4t/aSnmSywNcN8CRn4AgN+ThUE3CCeDsiEhepNbAUL6+MNgAG0CCsmfz9S+fmdxHaxb0GSKkpDWLaIkK0LPccvNmIpYOY4o1dl0EF7zHKtlnfdsIoogA5aYw3AZ0eE4gaXLJq60jQgcgbjfrLx8GIf50aaqdMPjItZ30b8ylEZvZEh45MubaRQK7zgPyKetrNgbWEnSgngokicNab+TX05EHVRBzPPFuwGvRCvhpbGnPMxErfGnc0paaILJEjZ2w2DlkwD97no7YNWZuwfke9ezl/P0WmEqqXxU1UxlQ05BRCL1As1npduYTqcuycLb/YChCxGvkhEwlvRWOXzNAAXF8g3067uUALKX2+1DLCcqAITeSJ+Q58eE++gy9O4wAVixsrpQPQ1tA176WqS0+eXG0nk847eFE7trQ473yzc7C6m+3SqL8GeD5cXAqQu+w4SkjjdNE2OyTDDs/t/F3PtTthyUvl/yVqLxONlvu1L6+1jRyGd6pZAxm2ywwbJc/8k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(376002)(136003)(366004)(396003)(39860400002)(451199015)(82960400001)(66946007)(53546011)(450100002)(83380400001)(31696002)(86362001)(4326008)(2906002)(2616005)(8676002)(5660300002)(8936002)(107886003)(6486002)(6512007)(316002)(6666004)(66556008)(41300700001)(186003)(478600001)(26005)(66476007)(6506007)(31686004)(36756003)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTV2MWN1VG9nOCtUc1pqeDJzTWh6RVhUaGdBQ21SSFI5dEV6T1lRQnRrQjBW?=
 =?utf-8?B?T253dUtBRWpIWGo2dVhTakI3TkRXcWs4eWpMbXhweVJ2eGs5bVRYZDRrVzVs?=
 =?utf-8?B?QkVLbnVtM2JDWE52Z3hlOGpJRGRIWFU0RHIyRVRYUGhyMUdSZlJZaFV5b1FW?=
 =?utf-8?B?VWpUZmJ3eEg2Z0NIWld6aFdzT3dacFlDTVNPbGxPZTVtS3JDNjdETFlsZnht?=
 =?utf-8?B?bW5ncnIzakVGditwSzBzT2xnbzdETG9BcExkTzgyQzkzM1F6dS9zK3JoSm9k?=
 =?utf-8?B?SVhCT1NwL2ZQcjRSSEhyZHM3SkE3d1J4Z3JObzJCKzAyYXBtRXl1VmVWaFhR?=
 =?utf-8?B?b0VaOFN5cUxyV2Z4VTlWZHlNWXdPck9NUG9sUi9yY1o3L3JDTkg5MDZkdjlj?=
 =?utf-8?B?Z2FZczRqd0E1ZWE5OFkvQUJqc2RvM0w4c2VqeUlmMzlNd1dNMU1NZHVYeGdP?=
 =?utf-8?B?d3pta1JNaFF3NDNaTkhmK3RGMitiWlFsT25aaW5FVy96OTBkNHllcGZSR1h2?=
 =?utf-8?B?TG9OcDJwK0lzQmh5dTRrT0VRRHQ2Z3FLMStvL1pBWC84aENnRFc0UDFzdEkz?=
 =?utf-8?B?SkFHSWZZa2Nhem1YM1NETldVWkhibGhtYW9HTmJCd3RFSkhidmQ3Z05Qckp4?=
 =?utf-8?B?WW1hNnN3VnVoUmRtMzVZS0hMWHZLRER4bUZqYmJNTjVIMlN2a0Q3UXJNSXZk?=
 =?utf-8?B?eWdJaXZITEE5S2JQUFkwRnVhaXV5cjQwaXR6NytGOTQzVWwreWFXOGs3M25O?=
 =?utf-8?B?Ry9WdnYrYmhxTHRvMGRIZG9OZzBMbDV6OVA0UEFkencrdlVZbmtYcW5pU3FU?=
 =?utf-8?B?VjhXVzcwNHN6b1ZBTGl3cWVuZ3pEYThNVFNZQk9Dd0xJRjhkTlQzYndoY3p2?=
 =?utf-8?B?amQvNEYxODE2Q2UzdHl1aVIrS2pRNVRQUVFyNkU4SlJ1aDg3RklsMWxrdlVY?=
 =?utf-8?B?L3JvckxyQTBVcVJ5dkw1V1NsS0xxMThmVkhtUDdWWlUwcloyb2JzYXpiMnVV?=
 =?utf-8?B?N01EMk9YN2h4Tk91TnNUYkY0azJmNUFnWnRsc0VBSDk2MlBzNk0wbmkyVE5O?=
 =?utf-8?B?Z1k5RmVZTEYxTFdXc2RCM0hyMWNJd1cwblBkUmlBRERPTHQ1T0JqUlFzRGVz?=
 =?utf-8?B?TzJTTllhUG9rZXFvYnkrZllTRmp1UFVrUWlZSFB0NVQ2UWcwdUdqSDJycjhO?=
 =?utf-8?B?TVE0Y1VTRXViWGkrb0RSZzVCbEVLeVBsUml3YkF0SVliM1owbEt1SWd5ZDlh?=
 =?utf-8?B?dWtEQ2cxeTlSMWtuTG1PaElqVTJCUTlUM0JzdXlJTVFqeVFvdXVQeHhDak50?=
 =?utf-8?B?UlI3d0h4MmtGYUlXWk0rbDNjSDVjRkdqRHMyRklFaGFCd1Z5aHY0cXZmc3k0?=
 =?utf-8?B?U201bnUwbldFZ3d3S29oR2VEbmt1S05ua2pQb2pkdy92QWhPNVhKR0hLNVJx?=
 =?utf-8?B?clJhaEpwK25mVTJ1dEFCMDVCcDVBN05KUnhUQzFmQTZlckZ2MUwvOXVDdURF?=
 =?utf-8?B?ZUxJQjljaEZCUHcwWHNOd2NhR1JDTkFCaEhrZDJWc0dLSi8wQmVyRURSTjJT?=
 =?utf-8?B?T0Z5OWRrcHU1OVhDSjV6SGpJVU0yL2lzclhEcHowT2lsRGxRZzAza0RqREo3?=
 =?utf-8?B?VEJJaVBFZ3pZUnhiaUlFMzVSY1BaV200endlcW9tWC9RcTNpM0dZb2ZVNGl6?=
 =?utf-8?B?Mlp5eWltVjRBcEpyT1FFMCtwUHVmU0REbUFlWjRJQ0ZYSzZmR0RCSk1rdlFp?=
 =?utf-8?B?VVJ1dmx5NXlKOGcvTWt6QS9ORG8wT01ENU5pdm40azIvSG1Hd25QVEJLVXdI?=
 =?utf-8?B?bDF5NlFSdHowOHJzZy9Cem1EeHB3ZE5tV3VCZDlnY3hpZWN0TXFpUE93dlVk?=
 =?utf-8?B?MXF5ZkJ1SVNRUkFkQ3VMSVdmb2E3TkZtQUV5a0lBdFlOSnNUbVZSWUQ3Sy92?=
 =?utf-8?B?SHZxLy9NOXJhbitma2JBZlkzc1dqWUVZMkVXaEx2YjBYWnhkQ1BieGdiNVZr?=
 =?utf-8?B?TXI5S3I5Tm5Iamd1ZFNab0JLN0ZHbEJ5YTl6bmdTb3RNQlNTOEFQcmtvZ3Uv?=
 =?utf-8?B?czNSVW9ub0dITFdZeW9CTU1yN1VQb0E0cmRrM0xjbEZvQ1ZyMFVvZUlTY0NY?=
 =?utf-8?B?cWJ5T0t0aDRDOUpqSno0MGVHSXJRV2Rlbkc5VHFlajBNNEMySmFONm5FZjYy?=
 =?utf-8?B?VUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 870c6636-780e-4a89-2b5a-08da97dabd98
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 11:58:16.9170 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: chybOIPebv4lHJXcdMnZRJ4iwbnBLvPjD9S+ilqSqyoE1i2XoIuJrnQjHDFw8fRtLHK1mqxqwbvvCF+PbBayY4/qkx0i4IXw+EbO8ULzOR0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6922
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
Cc: tejas.upadhyay@intel.com, dri-devel@lists.freedesktop.org,
 radhakrishna.sripada@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 16-09-2022 02:09, Lucas De Marchi wrote:
> DSMBASE register is defined so BDSM bitfield contains the bits 63 to 20
> of the base address of stolen. For the supported platforms bits 0-19 are
> zero but that may not be true in future. Add the missing mask.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Acked-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>

Thanks,
Aravind.
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> index 42f4769bb4ac..c34065fe2ecc 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> @@ -814,7 +814,7 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
>  		return ERR_PTR(-ENXIO);
>  
>  	/* Use DSM base address instead for stolen memory */
> -	dsm_base = intel_uncore_read64(uncore, GEN12_DSMBASE);
> +	dsm_base = intel_uncore_read64(uncore, GEN12_DSMBASE) & GEN12_BDSM_MASK;
>  	if (IS_DG1(uncore->i915)) {
>  		lmem_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
>  		if (WARN_ON(lmem_size < dsm_base))
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 1a9bd829fc7e..0301874c76ba 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -7953,6 +7953,7 @@ enum skl_power_gate {
>  
>  #define GEN12_GSMBASE			_MMIO(0x108100)
>  #define GEN12_DSMBASE			_MMIO(0x1080C0)
> +#define   GEN12_BDSM_MASK		GENMASK(63, 20)
>  
>  #define XEHP_CLOCK_GATE_DIS		_MMIO(0x101014)
>  #define   SGSI_SIDECLK_DIS		REG_BIT(17)
> 

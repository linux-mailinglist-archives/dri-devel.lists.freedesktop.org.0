Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9D03F90F6
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 01:33:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE4DE6E8C8;
	Thu, 26 Aug 2021 23:33:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A026E040;
 Thu, 26 Aug 2021 23:33:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10088"; a="240071174"
X-IronPort-AV: E=Sophos;i="5.84,354,1620716400"; d="scan'208";a="240071174"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2021 16:33:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,354,1620716400"; d="scan'208";a="426304587"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga006.jf.intel.com with ESMTP; 26 Aug 2021 16:33:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 26 Aug 2021 16:33:34 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 26 Aug 2021 16:33:33 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Thu, 26 Aug 2021 16:33:33 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Thu, 26 Aug 2021 16:33:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+KFGddajRhrvrEslacJJLZt785KsTffM5cp690i8L4Bn7l9O4KqFtpM+wDGmSLbEm8QwLpbk0L7fN3oZTGkMKcHbsjdqgXf5//2q9z366lEGSy2Vk9fmDWHetpAITrrDtXThq/Ss0xdDDPT8JsfsaNxd38omP//5P5LjXO4RVgh9WVfucbw0zmOssmIf4UPHvouL1I1eIPxTjtCHJTKPLQIXJOk8WcSNe/lyOWULbisOvn35cd4VHLGbSzR3nhN8f9m0B8UZ+v4EyYPVfkB2eAdgpcwqr2j+Qb11VMEOczYlJQHmkgAbSbKCRcEwbzniwdrWG+JmW1ZXoMw9/2+og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMwf0AGXonT3na9FecD50aaFKbRzoJ4pm2BIqvlWsIE=;
 b=i4AgM6TKffSV4wvFgyBB9zvMpIjFftM2AIs8MqR/IOF0k6qD7eJ7aAzviYJIpY+BbJ/i5boy+eRIBHy9J48Ln15E31fY8ia/fanpRlag5owAyeBAEHzkOLTvj+hciIh+uAeHLzeJG7A/w5kTBJhHHt2fLN6zXd8DiDDmiG0paAafEko0yRYIMkbKQzgvP9X0LOckUCYhVGvXdO63JIrNTTy4Qak4R5a2WxNja6hWAFdYN1marz3nDdIA7XU5IdZ8omzpwupEj7xeaXAbbE4jlGwByymhp8blmhq+iOPEPKR7ysFXiGUnMSl4RQqzusA4VGxObLE/jO0gbuqHbWJXBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMwf0AGXonT3na9FecD50aaFKbRzoJ4pm2BIqvlWsIE=;
 b=pStJyz3cJM3FEYEzpDsV7+VnqiFZRSyde/nEL/r88HWP1viUFKg1yNsaWrOeLJ/uBRv02zNz+zmqK+maorWChWxvzDbeypKK56NVM5Cn8RVKIDPZ1UX2BrUI6E+bWdIZVEiJVa9MOUsuI3yNA5Z0sfjNcJ1nH55ipHjxgokNtGo=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5609.namprd11.prod.outlook.com (2603:10b6:510:e0::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 26 Aug
 2021 23:33:31 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%7]) with mapi id 15.20.4457.020; Thu, 26 Aug 2021
 23:33:31 +0000
Subject: Re: [Intel-gfx] [PATCH 11/27] drm/i915/guc: Copy whole golden
 context, set engine state size of subset
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniele.ceraolospurio@intel.com>
References: <20210826032327.18078-1-matthew.brost@intel.com>
 <20210826032327.18078-12-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <b5aecbb0-3f27-50c0-e54e-a62593b9e22c@intel.com>
Date: Thu, 26 Aug 2021 16:33:28 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210826032327.18078-12-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MWHPR15CA0049.namprd15.prod.outlook.com
 (2603:10b6:301:4c::11) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.221] (73.157.192.58) by
 MWHPR15CA0049.namprd15.prod.outlook.com (2603:10b6:301:4c::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.20 via Frontend Transport; Thu, 26 Aug 2021 23:33:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d469fdc-618d-4566-6514-08d968e9ea3a
X-MS-TrafficTypeDiagnostic: PH0PR11MB5609:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5609E0B92FF46D55FD539174BDC79@PH0PR11MB5609.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Us47znzcDAsler7u9l6eYzDqTuwKWjI1dEbmkTYsATuqsey6/18Unp58ai8F88lATGtiHo4ub7JEbIT/1okqbhIJpH0Yj+P4ODy7KElWPkmbFtTLSP/Tr5RYblVLIZnmnY2HhDk9Rm+U9Q3kdE1CxKsGMN9KzVxcwCWY7rky4elXYzXEDVqSTeoYpgpNebz+CBw1hnWCFNdRR6HqFZHQ97AZs3NJWX1G8u1yJVPGD2xiqZCppyIik+4eCL1iX0Q299NAyzr5rOkiCdhw+xAmA0H/pBcKI0I0soBrzeBZazJqxC/fbf8WQek5tDnEw+kMyPuCf5b0m9fLfG9xIo8NRgv4xkYTdtHGZUiSnFsXlGPmJb45PFXCjUl5cg8XRK6IUdnf8eQRjjoYMX3qZ/ME3fMZ3H8ZB0/1tueiMDJtOkZtUf2QFwzjYczn1WMkvfbbdCl9yVfOY8LfTP0TGM8YRsyiVlilei5zyU3mi5lt9m5OCZ0F9tZgm+6OJd5fyGQ3M82qf9Cv3AoLCMViACBe4nvneyj1Jf7PBQrOXSBHiyfDFlmX3YTjBFIX9B31GcIKsH27IQVPJ2lFQ5j4+nlrHCkiqdZIUK8ibBC3h7flnvQ1wqBwm7bJZ/BpwO5T0Ryh0whAb+hNYjRHGIdSxvERy6kHi7yLaljBI09NVTW8O4rsz09My6ZdEXhmVZ3VMqt2hiWmWrVfDqRFdaZGN+x+ZQLWLs7siDP0INo4PGhjFjX3WfJr4NWkGGtseXxMqCvF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(16576012)(2616005)(66946007)(31686004)(83380400001)(86362001)(2906002)(31696002)(38100700002)(956004)(66556008)(66476007)(8676002)(4326008)(5660300002)(508600001)(8936002)(53546011)(186003)(107886003)(26005)(36756003)(316002)(450100002)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RE8rQlFBU0QxZFM3U1RFbkxrRkZtRUhDZTN1V005WE5qbm9mWmhyQkhhNVVi?=
 =?utf-8?B?Rml3Y0RIOFRJTHlYSGZTd2FBdFdhQVlIL2RMN3V6QzhmZU42bVFISjVqUyth?=
 =?utf-8?B?NWI0UTZneFkwRXYzWlRJZ2FUUTRzR1pxTFhNb240TzB3K2RzVm82ZlBwK2dN?=
 =?utf-8?B?b21ldU40Qk4xRVgxL3FRM2Izak5YN2dOT0FheUowNVVPd1ROVkJ0RHlaSTho?=
 =?utf-8?B?K3NsbFp5VWJLNm5pbi9QNWRZWmEyZXd3OXJuTUZ5cWNNWUlpVGFLekk5cGxt?=
 =?utf-8?B?UWlzNkFicDJVRE8rSlAzZmoxa3V3VXMxY2w0VWdXVzUrd2dkeXRqdnpOUzVM?=
 =?utf-8?B?c2s3bEVmVFpoc1lob0hRN3lxMXZTSXRpOXlneG1ITzJua1dxMG0vdmdDYlUy?=
 =?utf-8?B?b05sclVRcmVxL0VzNU1yb21sTGxEL1kvT1piN1JrdDFsQ3RWSEpmV0pYODhK?=
 =?utf-8?B?TDQ5Tm8xT1dVR3F5WTRZS014ODBla1FqQnpicFZRa1dTQVJqSWFMSDJEaXRi?=
 =?utf-8?B?OGM5RW4zQ1BvcW5PYVVZOFpmZ09kTkJiMkxGdTB2YXZKZlkwczdRV1NyMXFt?=
 =?utf-8?B?czRWVSsxcUdEN3JBREJ5cmgyTkd4em9CTXcyakE4VFEyTUNRNFhUY0I5UnVR?=
 =?utf-8?B?dFlOMGNMZFVYenEwb3BBbmdOUXlXWGtHaW01NDhuNi8yNkFjVytnZkh2Tjlz?=
 =?utf-8?B?TlhJRk5uSW4wZDFKaFRjVEwzcjB1UCtQQ25DcC83cXgvdG5YNllCRTY4b3d1?=
 =?utf-8?B?Tkx3NkFzM1FrNDZYckIxcnQya3g0V3VaUWtCS2Ira2hsdURmbG13Y0gyS1F3?=
 =?utf-8?B?bnp1S3BOS2tydHAxanRhWWVSWFpFWG9pREhuQkt5cThIUU85bm0yYnpXekNq?=
 =?utf-8?B?YUtwd094Z0JCcnlXU1pLV0JiN242THliMVQ3cTlzWDlETnlnT3pKL0huYUEw?=
 =?utf-8?B?WTZWak5mOHpaU3h1QmdMU2dYOFFZRXE3dDV2S0Q0WVBvTDB0OFUySUt6VnB6?=
 =?utf-8?B?d2dwL2oyVFc5ODIwMEQ5anFsY2N3T2hGb1JIaFNNek1Eak5makk4T1VSTXFZ?=
 =?utf-8?B?S3FQWE8vSVJkZHA5dWc2Mm1ZT3M0WWtEL1hsSXA3dFdGMC9OOTlFSEhKbkln?=
 =?utf-8?B?aWF0ZmhXWUFQM0h5Ym94cy9qbXlKOUc0UnNnWmt3S2JIV2Jxd253T2FrRkEz?=
 =?utf-8?B?U1Z5am1FTWFNWEg1N0dlWlVueHJHV2VDMU5OYnlTTUNVQ1Iza3YvTUQyb2RQ?=
 =?utf-8?B?UnFXVmJ5QjNmazF1b1U5cmhxV1ZYUU1JMVBMaEtkS1Y2QkJZUlV2TStWS1h5?=
 =?utf-8?B?ZE93VFJ6UmN3TEwvOHRySE5aeS8vMk1OZHdFZTA3MDdXYVhTVng2akozMW1h?=
 =?utf-8?B?d09hNXZsS1M4aUt1MkRYYzhNczc3NXVuc0FTazZENExORXRLSlkzakh5dk9V?=
 =?utf-8?B?OHJ3TDFrT2tzbUNWVkVIcks4RFh2bXljY05WeTFMRUhaSmNBdG9pYXVGNXpi?=
 =?utf-8?B?bkVzZHBOOG1zZUxXQXNTZGZUNUcyWXkrVHZGZ29KV3BIVTFTb01ZcklOUG14?=
 =?utf-8?B?dkFuUk1pbXFlSmFOaXlUT09KQnZSYXBtbVBnb3dFMUM2V3VualVhbVNhVEZN?=
 =?utf-8?B?QXRMK1dVdW1ob0hQRzFyYmZZTWd0cmlka3p0djRzWlNCMm5ZUTZWNGoxWXBI?=
 =?utf-8?B?UlZ2TWJRaTRjSHFETEF0Q0RHVnVxSDBMQ0tmTHlCajQvb0pXZTJEbkNSZnJa?=
 =?utf-8?Q?Z1/4cHE28Yqb7M6TqwT7SgWLPklydNsO/hjFfkM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d469fdc-618d-4566-6514-08d968e9ea3a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 23:33:31.8021 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PkcqWBvFQA3pe+1vvebt60gpfKLzWiD4AiexaelucmH53HTuOREYLdghVGEazb5sgNUQR1rBgEApFSHrOu0PX4U4ZZIOR6TSna9qzy3eVRQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5609
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

On 8/25/2021 20:23, Matthew Brost wrote:
> When the GuC does a media reset, it copies a golden context state back
> into the corrupted context's state. The address of the golden context
> and the size of the engine state restore are passed in via the GuC ADS.
> The i915 had a bug where it passed in the whole size of the golden
> context, not the size of the engine state to restore resulting in a
> memory corruption.
>
> Also copy the entire golden context on init rather than just the engine
> state that is restored.
>
> Fixes: 481d458caede ("drm/i915/guc: Add golden context to GuC ADS")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 28 +++++++++++++++++-----
>   1 file changed, 22 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> index 6926919bcac6..df2734bfe078 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> @@ -358,6 +358,11 @@ static int guc_prep_golden_context(struct intel_guc *guc,
>   	u8 engine_class, guc_class;
>   	struct guc_gt_system_info *info, local_info;
>   
> +	/* Skip execlist and PPGTT registers + HWSP */
> +	const u32 lr_hw_context_size = 80 * sizeof(u32);
> +	const u32 skip_size = LRC_PPHWSP_SZ * PAGE_SIZE +
> +		lr_hw_context_size;
> +
>   	/*
>   	 * Reserve the memory for the golden contexts and point GuC at it but
>   	 * leave it empty for now. The context data will be filled in later
> @@ -396,7 +401,18 @@ static int guc_prep_golden_context(struct intel_guc *guc,
>   		if (!blob)
>   			continue;
>   
> -		blob->ads.eng_state_size[guc_class] = real_size;
> +		/*
> +		 * This interface is slightly confusing. We need to pass the
> +		 * base address of the golden context and the engine state size
> +		 * which is not the size of the whole golden context, it is a
> +		 * subset that the GuC uses when doing a watchdog reset. The
> +		 * engine state size must match the size of the golden context
> +		 * minus the first part of the golden context that the GuC does
> +		 * not retore during reset. Currently no real way to verify this
> +		 * other than reading the GuC spec / code and ensuring the
> +		 * 'skip_size' below matches the value used in the GuC code.
> +		 */
> +		blob->ads.eng_state_size[guc_class] = real_size - skip_size;
>   		blob->ads.golden_context_lrca[guc_class] = addr_ggtt;
>   		addr_ggtt += alloc_size;
>   	}
> @@ -437,8 +453,8 @@ static void guc_init_golden_context(struct intel_guc *guc)
>   	u8 *ptr;
>   
>   	/* Skip execlist and PPGTT registers + HWSP */
> -	const u32 lr_hw_context_size = 80 * sizeof(u32);
> -	const u32 skip_size = LRC_PPHWSP_SZ * PAGE_SIZE +
> +	__maybe_unused const u32 lr_hw_context_size = 80 * sizeof(u32);
> +	__maybe_unused const u32 skip_size = LRC_PPHWSP_SZ * PAGE_SIZE +
>   		lr_hw_context_size;
Not sure why the 'maybe unused'? The values are not only used in BUG_ONs 
or such that could vanish.

More importantly, you now have two sets of definitions for these magic 
numbers. That seems like a very bad idea. They should be moved into a 
helper function rather than repeated.

John.


>   
>   	if (!intel_uc_uses_guc_submission(&gt->uc))
> @@ -476,12 +492,12 @@ static void guc_init_golden_context(struct intel_guc *guc)
>   			continue;
>   		}
>   
> -		GEM_BUG_ON(blob->ads.eng_state_size[guc_class] != real_size);
> +		GEM_BUG_ON(blob->ads.eng_state_size[guc_class] !=
> +			   real_size - skip_size);
>   		GEM_BUG_ON(blob->ads.golden_context_lrca[guc_class] != addr_ggtt);
>   		addr_ggtt += alloc_size;
>   
> -		shmem_read(engine->default_state, skip_size, ptr + skip_size,
> -			   real_size - skip_size);
> +		shmem_read(engine->default_state, 0, ptr, real_size);
>   		ptr += alloc_size;
>   	}
>   


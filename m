Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2930634B41
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 00:39:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0760710E495;
	Tue, 22 Nov 2022 23:39:12 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56EA010E140;
 Tue, 22 Nov 2022 23:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669160348; x=1700696348;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hjjE3u0DjwCw9XpeYzDT1VmsYYJLOkovLdGNdAitlEs=;
 b=IsdY+okm0OZ5xBvZ0ZyRu4jGzhTUz4sQkzjVLNTR6Ml/awLEOeB7l2rP
 TBL70YjkIIxveuZYkqR6Ps1iC95dlgz3x1WWTZcxRBLkyyziY+onOcT35
 vpowwKyhJkUT7UZu2ACMCfwysB3SvCa3VdhmQJpoC9cHFTJpm7Se2wFFa
 2dmau3rgYYQceSDa46HCYvei2SGfKhbstYRytvP7sojZUFIsLyaqTMggp
 H6250JRiZK5WYdIZ2DdgdZ/AgNlXtP+rtqq49PgBjj48k5xaNZuUY4yEp
 Gy4Hksavlm3dZg5LOeH0pwSvmWzLYer+AJYV3LOyFo2Fl4IFaNsQ76W4d w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="400230162"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="400230162"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 15:39:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="643897736"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="643897736"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP; 22 Nov 2022 15:39:07 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 15:39:07 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 22 Nov 2022 15:39:07 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 22 Nov 2022 15:39:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JgGb1uL0X1ZRwjxsom4r5S8yI2Z3j5cX/RCuOpehvSar1pxMwB5XJZr6DN94Cbf3xfC0f7paZoSeeXaYYA2bl2VQNmJamwS2rESHKgNCgvs6QF7c4xdGWkQ2NnqZVSlTrxm1WpJG0pHOuLVyXkqh2gssFtHQz8hJrLtGpjSG22cVB4XiOS/LKoMB1DGNvZKvQJ2NCDVcdi1/2Y3xoKiLsy0aWSjhLbQSdZe8hFM/qlserm1oKBbC1yXCDjw5ZL1WzKJq8qIDRWWZR+LnNpkLDzZEuKXmaNPMpvYgqpaKNOwbf2M8HNTY9eENPUVg8G9CZNaBSLHMPs5pWVENVFvb9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ORhfgSDY2Jri69r8/8s9ZiUU5XueroXVBaCbmSXFY2M=;
 b=DrcDH86JtHHXqkHuYsRjNEjRyfW1XEs+9MyMTI6Q4xTSjGQz12JmzL+v69dzLjUJwhNro27GCSUV/1asfjrIgxVB++Gx5v3I1cNSmBOfMT06oTtNyKzFM9Pj/wSTyKlPlXj3Fw7McL4lJL6NiMzJFgc2JkjGJ501mfHBGZiGhk3cHCIttfed2VY45rTmkBgTDJkmwwQTnnL4rTdnSSMY1ROr/lWfQPq9+n9u7oTsp6m2am9woSUk5cSMGPVLO6hpwQqlrsOebGzFz0agEoggHIfsR/1NiZoAgyP9BVxlufYDuxCuK5c4ElrJjSykL3O6idFqTCA4S8KTvPDek8gZ0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 CO1PR11MB5139.namprd11.prod.outlook.com (2603:10b6:303:95::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.15; Tue, 22 Nov 2022 23:39:00 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::f7a8:6d03:2464:2afd]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::f7a8:6d03:2464:2afd%5]) with mapi id 15.20.5834.009; Tue, 22 Nov 2022
 23:39:00 +0000
Message-ID: <2740bb69-2764-e056-c0e8-c7d4d38b22c9@intel.com>
Date: Tue, 22 Nov 2022 15:38:58 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/i915/guc: Use GuC submission API
 version number
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20221122200915.680629-1-John.C.Harrison@Intel.com>
 <20221122200915.680629-4-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20221122200915.680629-4-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR06CA0022.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::35) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|CO1PR11MB5139:EE_
X-MS-Office365-Filtering-Correlation-Id: b19f0134-1ad6-4764-cc4d-08dacce2bb30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TaEr6+4VliFp/ABwmkNNwTqTFhES+s9F4IlGfqHAbMMTqYh+ubv5Sq1NT9Y+vVZP63gCIj82iG4PP5AxH9gxj2rTd/u0pnHpUV75aRcsSBm2QCTVywjDI4K5DIsSwbzvEWWCg/SF0bPfpC7CA5AIt+LPX48CguIQNnodFBX8GYXWp/rpgCX0hSBTrOIB1z+OIRokOq/YeIJeEHa2c8XYLCSR+0D4KM6dJbZDzdZ0D73ocknJLEfKNAF3bq2EouT8A7o0fzGutw8e/K3o9fTpWb/oMLPoO0JQiKJlgsauHhU0VSIeUnfkdzgNAboneMqreFUPXOIOhDy90UJtGUrzXiKj013rfhbHySGnHUZ0nwGCQ6RkuYxV3RvLqiQ+vraAZouLbauDW5OK9peTMvnvJ+td6gW/Ndcfh6FmuPJb4qk7HEfQN9cgLNz15lmuAdISzL/XsFx7AOaxFuOvN3hoLUIaezQaK9g4BLColpIyIQMM3C9MzFb8x8uKvnJurAnhzK6qZ1fMLEMdhi60KX4zgQCma3GefCiFTfx33xkZCWT6Nwt48XdHrwY0+KZUfx1CrbocXoUYi71w1lDQrPbKKTiuTxx12ch7D0ybPQ3EexBAZTbdN6c1f9/IHfHV8CH0yCehfPOQopgOThCW9H4JZf3I2FFatAtCoVesrEK5vtI0Nr0wlMUxJ3V27OXmRdeFBNRiUiJIhToYoCcW9rU7ibSmSe+Z5cm8lJ95tNIgtjQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(396003)(39860400002)(376002)(346002)(136003)(451199015)(66556008)(450100002)(8676002)(316002)(6512007)(66476007)(66946007)(4326008)(26005)(53546011)(41300700001)(36756003)(6506007)(2616005)(6486002)(38100700002)(30864003)(82960400001)(2906002)(83380400001)(8936002)(186003)(478600001)(5660300002)(31696002)(86362001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVBOcE9ucFJueVIxVkI0aEtTblkzbXZWNFVrOXRtV1oxQlNJZDA3ak42YzlP?=
 =?utf-8?B?Ukp3VVYrMldKZ1JEeU84U1REVHg1ellERVFoU0t4NnA2Y0Q0QXEvVktFd3R2?=
 =?utf-8?B?OFM2U2hQTk5LT1FETmEwRGp1LzdibmVxcVhSOFI4Rll2UmZPVHNFbEZQRCti?=
 =?utf-8?B?SWx4MnFOMU5HZ0RPQTBOZU9wMXZqSGdhOCtWWHd5YlUraVJsVUpvZWw3bHRO?=
 =?utf-8?B?Tmd6VGhLNFVjeUZBUEx5dGZZaU4xUmxVcFpaczU2UVNNckovRjJBbUdHaWFn?=
 =?utf-8?B?S1RWTUVJY0lpeSsxQTYvRjlveEx0cklNUXhzMDRLTEd0emFFMkVQRW42THgv?=
 =?utf-8?B?bkdybDFXem1rUkd0ZDN5WHBzdzdsaDFoZWtqVWpQbVV3SEJCaXVrblFWS214?=
 =?utf-8?B?cVRtVGxMSHgvVHkzbi9YNmVLbklYV0pCSkpvWmhTMXV5TUpGd0hibUFieXdY?=
 =?utf-8?B?TGJUTG5reUFOcnJXWEpuYVIwdXFhN0RraWJ1b21WOVJyOVNSdGUvY0VOak1I?=
 =?utf-8?B?ZGlzeVRDU2Z6aWlSbCsrTFpwR0toSFg1UVVIdFBZbXh4djI0SEo0U2JLcnV6?=
 =?utf-8?B?ZjJ2SVNYSEFWdnB6QnBuLysrTTNMVjJmMWNiMEpndmFuY3RoZDc3cFE0Zkwx?=
 =?utf-8?B?SnNNNkpzOXBWN3FHR1VKblpjNCt0cEF5bEpqdDlMV2dMREZvbXlzRXlTcXU5?=
 =?utf-8?B?R3R4Q2Rwb2dOTTl0TUtoWmxEa1JneWlBVUV6eDlIbERIMnVHdVlKdW9xQTk1?=
 =?utf-8?B?bTllMk1Sdndsb3RCQkEyRDVwb2xhc0xIcUJyVXZrS0JiVWV2aEg3bVRUTTdS?=
 =?utf-8?B?N01iZXBqaUw3ZUtheG5LWGJFZkhCUFBVWUNUK0N6R2ZrVzRZMW1kVGozQXRk?=
 =?utf-8?B?NHozTU45YTQ5b2dKU2hLVllMTVFNbWp1bWFKeUduVzZFaE1qRDBMc1lVZXZT?=
 =?utf-8?B?cjExT1piRHBMcG56U05JbWxOKzZuSXdMZEllaHNQMFArTVpVNkUwRGFFY2N5?=
 =?utf-8?B?VlhpQXB5Y2dCS1VDdGJER3hqdUU2cm5TdGZSaVRMek9TazV6UHJsT3RDcmEv?=
 =?utf-8?B?SzJLUVR4VHZyNFhDRWYzTXV3cytLM2RCeFF5WXYrLzM2d0ljSGxyUGRRaTgy?=
 =?utf-8?B?VVBQR3ZYa0lxNFo1TmJTb3R1dWZKclBpV3orSkxMYnlSMzdTblBJQTZWRjY0?=
 =?utf-8?B?WTA3T0MwMHdVYjNKL1RZbTFuOFUwcXF6djZFbWxWU1o3WHBQaWFiUzZOc2gy?=
 =?utf-8?B?b3c0ZU1iNVl3d1pPdUZmNTlpMWNnN2djRTZDV2FZMXFzYitkYzNSUE1xQytZ?=
 =?utf-8?B?YUloOTIvd0ttQTV5NjVlcGgvRVZ5WUpQazhWek9iZVdlb1VWK0tmeXQvYkJL?=
 =?utf-8?B?QjRpTnAvSnVrSTV6TlJZVHZ2Qno3NFpPUEgxVTlLUVZxUjU4U0x1RnAzbExS?=
 =?utf-8?B?TWhMdzgxRlRwWkVGeWhhUVFkS2FNcTFhMG5EcnhXUm1IREdyRHZUUDRDYUU0?=
 =?utf-8?B?QjRuYmQ0Qm5JSURYNjJBMFhuYlQyZ01VYzBYNGs4NnZTV1lhcW54Q3ZNUDc5?=
 =?utf-8?B?MGhIaHRSTjFmN21GZmMwbmUvR0Nkb1NGUWRORkRRSnpvbkRuaDlrRnZQVmVj?=
 =?utf-8?B?V3gyZnUwWHhKZDdxeDhnSDc0Q0I0TzNKam8wZEhKYTZhOUlkVnQ1YXVHTTMw?=
 =?utf-8?B?a2pqb2RlcW9sbkFIMFp2eU9NcXpnankvTzN2Z0N3a1FveEJ6WGd6RGlnYzNU?=
 =?utf-8?B?a2VQTjQ1R2g4MXlsckp2ZVluRWs0R2FwMTZnbkZLR2c0SmdLMm1ZcTl5UVlR?=
 =?utf-8?B?V0hUakYvbDB0RWg5c1Z6eXZjbjUxSW5neTlTSmZzQ2hZeXJ4bGEvaTNpWnZT?=
 =?utf-8?B?K2RZeXNVdGhTamVBU2h4Ny9rVFhtSGNKNndxd2JIdVk5YjRWMVI2eXNrR00z?=
 =?utf-8?B?TFkvQW15dkwrd01Vd2xSK01xd2tNY1g2a0huSVJpMzY3MkUwWm1yVFdXSWZP?=
 =?utf-8?B?N2ZialJ5N3N5RGtmTXh6TGY4VEd3WWczVTltL1kwS0hUajZhRXBpVDFVY080?=
 =?utf-8?B?MUo1UTc3N2ZwVFhveTVKS2ZRZkVzTEJqNGtZNjFnSWxPZnhQdndFRWo0d1Fo?=
 =?utf-8?B?UXUwY0JOR2RDTllteGdOZVB0ODdLQkZWM04xQU1XbW9meFUzdU1Qa2lyTEQ3?=
 =?utf-8?Q?brlYik+CGzGIYU4YataeBk8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b19f0134-1ad6-4764-cc4d-08dacce2bb30
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 23:39:00.3120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n3oxuugmTPDr+UAmm5g9okDiZMKC+IGepddYOdruEzjIr6VmbtnOhhkVxhk7fil0eEjG7PaE2eEKfaIUh9OAadUzHA1JZl7BD0xQ1NkdBas=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5139
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



On 11/22/2022 12:09 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> The GuC firmware includes an extra version number to specify the
> submission API level. So use that rather than the main firmware
> version number for submission related checks.
>
> Also, while it is guaranteed that GuC version number components are
> only 8-bits in size, other firmwares do not have that restriction. So
> stop making assumptions about them generically fitting in a u16
> individually, or in a u32 as a combined 8.8.8.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        | 11 +++
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 15 +--
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 91 ++++++++++++++++---
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h      | 10 +-
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h  |  3 +-
>   5 files changed, 104 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 1bb3f98292866..bb4dfe707a7d0 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -158,6 +158,9 @@ struct intel_guc {
>   	bool submission_selected;
>   	/** @submission_initialized: tracks whether GuC submission has been initialised */
>   	bool submission_initialized;
> +	/** @submission_version: Submission API version of the currently loaded firmware */
> +	struct intel_uc_fw_ver submission_version;
> +
>   	/**
>   	 * @rc_supported: tracks whether we support GuC rc on the current platform
>   	 */
> @@ -268,6 +271,14 @@ struct intel_guc {
>   #endif
>   };
>   
> +/*
> + * GuC version number components are only 8-bit, so converting to a 32bit 8.8.8
> + * integer works.
> + */
> +#define MAKE_GUC_VER(maj, min, pat)	(((maj) << 16) | ((min) << 8) | (pat))
> +#define MAKE_GUC_VER_STRUCT(ver)	MAKE_GUC_VER((ver).major, (ver).minor, (ver).patch)
> +#define GUC_SUBMIT_VER(guc)		MAKE_GUC_VER_STRUCT((guc)->submission_version)
> +
>   static inline struct intel_guc *log_to_guc(struct intel_guc_log *log)
>   {
>   	return container_of(log, struct intel_guc, log);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 0a42f1807f52c..53f7f599cde3a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1890,7 +1890,7 @@ int intel_guc_submission_init(struct intel_guc *guc)
>   	if (guc->submission_initialized)
>   		return 0;
>   
> -	if (GET_UC_VER(guc) < MAKE_UC_VER(70, 0, 0)) {
> +	if (GUC_SUBMIT_VER(guc) < MAKE_GUC_VER(1, 0, 0)) {
>   		ret = guc_lrc_desc_pool_create_v69(guc);
>   		if (ret)
>   			return ret;
> @@ -2330,7 +2330,7 @@ static int register_context(struct intel_context *ce, bool loop)
>   	GEM_BUG_ON(intel_context_is_child(ce));
>   	trace_intel_context_register(ce);
>   
> -	if (GET_UC_VER(guc) >= MAKE_UC_VER(70, 0, 0))
> +	if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 0, 0))
>   		ret = register_context_v70(guc, ce, loop);
>   	else
>   		ret = register_context_v69(guc, ce, loop);
> @@ -2342,7 +2342,7 @@ static int register_context(struct intel_context *ce, bool loop)
>   		set_context_registered(ce);
>   		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>   
> -		if (GET_UC_VER(guc) >= MAKE_UC_VER(70, 0, 0))
> +		if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 0, 0))
>   			guc_context_policy_init_v70(ce, loop);
>   	}
>   
> @@ -2956,7 +2956,7 @@ static void __guc_context_set_preemption_timeout(struct intel_guc *guc,
>   						 u16 guc_id,
>   						 u32 preemption_timeout)
>   {
> -	if (GET_UC_VER(guc) >= MAKE_UC_VER(70, 0, 0)) {
> +	if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 0, 0)) {
>   		struct context_policy policy;
>   
>   		__guc_context_policy_start_klv(&policy, guc_id);
> @@ -3283,7 +3283,7 @@ static int guc_context_alloc(struct intel_context *ce)
>   static void __guc_context_set_prio(struct intel_guc *guc,
>   				   struct intel_context *ce)
>   {
> -	if (GET_UC_VER(guc) >= MAKE_UC_VER(70, 0, 0)) {
> +	if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 0, 0)) {
>   		struct context_policy policy;
>   
>   		__guc_context_policy_start_klv(&policy, ce->guc_id.id);
> @@ -4366,7 +4366,7 @@ static int guc_init_global_schedule_policy(struct intel_guc *guc)
>   	intel_wakeref_t wakeref;
>   	int ret = 0;
>   
> -	if (GET_UC_VER(guc) < MAKE_UC_VER(70, 3, 0))
> +	if (GUC_SUBMIT_VER(guc) < MAKE_GUC_VER(1, 1, 0))
>   		return 0;
>   
>   	__guc_scheduling_policy_start_klv(&policy);
> @@ -4905,6 +4905,9 @@ void intel_guc_submission_print_info(struct intel_guc *guc,
>   	if (!sched_engine)
>   		return;
>   
> +	drm_printf(p, "GuC Submission API Version: %d.%d.%d\n",
> +		   guc->submission_version.major, guc->submission_version.minor,
> +		   guc->submission_version.patch);
>   	drm_printf(p, "GuC Number Outstanding Submission G2H: %u\n",
>   		   atomic_read(&guc->outstanding_submission_g2h));
>   	drm_printf(p, "GuC tasklet count: %u\n",
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index 5e2ee1ac89514..df5b53faa9583 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -532,15 +532,71 @@ static int check_ccs_header(struct intel_gt *gt,
>   	}
>   
>   	/* Get version numbers from the CSS header */
> -	uc_fw->file_selected.ver.major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
> -						   css->sw_version);
> -	uc_fw->file_selected.ver.minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
> -						   css->sw_version);
> -	uc_fw->file_selected.ver.patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
> -						   css->sw_version);
> -
> -	if (uc_fw->type == INTEL_UC_FW_TYPE_GUC)
> +	uc_fw->file_selected.ver.major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, css->sw_version);
> +	uc_fw->file_selected.ver.minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, css->sw_version);
> +	uc_fw->file_selected.ver.patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, css->sw_version);
> +
> +	if (uc_fw->type == INTEL_UC_FW_TYPE_GUC) {
> +		struct intel_guc *guc = container_of(uc_fw, struct intel_guc, fw);
> +
> +		/*
> +		 * GuC version number components are defined as being 8-bits.
> +		 * The submission code relies on this to optimise version comparison
> +		 * tests. So enforce the restriction here.
> +		 */
> +		if (uc_fw->file_selected.ver.major > 0xFF ||
> +		    uc_fw->file_selected.ver.minor > 0xFF ||
> +		    uc_fw->file_selected.ver.patch > 0xFF) {
> +			drm_warn(&i915->drm, "%s firmware %s: invalid version: 0x%02X:%02X:%02X\n",
> +				 intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
> +				 uc_fw->file_selected.ver.major, uc_fw->file_selected.ver.minor,
> +				 uc_fw->file_selected.ver.patch);
> +		}
> +
> +		/*
> +		 * The GuC firmware includes an extra version number to specify the
> +		 * submission API level. This allows submission code to work with
> +		 * multiple GuC versions without having to know the absolute firmware
> +		 * version number (there are likely to be multiple firmware releases
> +		 * which all support the same submission API level).
> +		 *
> +		 * Unfortunately, due to an oversight, this version was only exposed
> +		 * in the CSS header from v70.6.0.
> +		 */
> +		if (uc_fw->file_selected.ver.major >= 70) {
> +			if (uc_fw->file_selected.ver.minor >= 6) {
> +				/* v70.6.0 adds CSS header support */
> +				guc->submission_version.major =
> +						FIELD_GET(CSS_SW_VERSION_UC_MAJOR, css->vf_version);
> +				guc->submission_version.minor =
> +						FIELD_GET(CSS_SW_VERSION_UC_MINOR, css->vf_version);
> +				guc->submission_version.patch =
> +						FIELD_GET(CSS_SW_VERSION_UC_PATCH, css->vf_version);

These lines are getting long. I'm wondering if it's worth having a small 
helper? something like:

void extract_guc_ver(struct intel_uc_fw_ver *ver, u32 css_ver)
{
     ver->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, css_ver);
     ver->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, css_ver);
     ver->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, css_ver);
}

and then have:

extract_guc_ver(&uc_fw->file_selected.ver, css->sw_version);
extract_guc_ver(&guc->submission_version, css->vf_version);

Not a blocker.

> +			} else if (uc_fw->file_selected.ver.minor >= 3) {
> +				/* v70.3.0 introduced v1.1.0 */
> +				guc->submission_version.major = 1;
> +				guc->submission_version.minor = 1;
> +				guc->submission_version.patch = 0;
> +			} else {
> +				/* v70.0.0 introduced v1.0.0 */
> +				guc->submission_version.major = 1;
> +				guc->submission_version.minor = 0;
> +				guc->submission_version.patch = 0;
> +			}
> +		} else if (uc_fw->file_selected.ver.major >= 69) {
> +			/* v69.0.0 introduced v0.10.0 */
> +			guc->submission_version.major = 0;
> +			guc->submission_version.minor = 10;
> +			guc->submission_version.patch = 0;
> +		} else {
> +			/* Prior versions were v0.1.0 */
> +			guc->submission_version.major = 0;
> +			guc->submission_version.minor = 1;
> +			guc->submission_version.patch = 0;
> +		}
> +
>   		uc_fw->private_data_size = css->private_data_size;
> +	}
>   
>   	return 0;
>   }
> @@ -1054,7 +1110,7 @@ size_t intel_uc_fw_copy_rsa(struct intel_uc_fw *uc_fw, void *dst, u32 max_len)
>    */
>   void intel_uc_fw_dump(const struct intel_uc_fw *uc_fw, struct drm_printer *p)
>   {
> -	u32 ver_sel, ver_want;
> +	bool found;

"found" is a confusing name here, because you're not searching for 
anything, just want to see if the available FW is older than the wanted 
one. Maybe rename it to "old" or something like that?

>   
>   	drm_printf(p, "%s firmware: %s\n",
>   		   intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path);
> @@ -1063,9 +1119,20 @@ void intel_uc_fw_dump(const struct intel_uc_fw *uc_fw, struct drm_printer *p)
>   			   intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_wanted.path);
>   	drm_printf(p, "\tstatus: %s\n",
>   		   intel_uc_fw_status_repr(uc_fw->status));
> -	ver_sel = MAKE_UC_VER_STRUCT(uc_fw->file_selected.ver);
> -	ver_want = MAKE_UC_VER_STRUCT(uc_fw->file_wanted.ver);
> -	if (ver_sel < ver_want)
> +
> +	if (uc_fw->file_selected.ver.major < uc_fw->file_wanted.ver.major)
> +		found = false;
> +	else if ((uc_fw->file_selected.ver.major == uc_fw->file_wanted.ver.major) &&
> +		 (uc_fw->file_selected.ver.minor < uc_fw->file_wanted.ver.minor))
> +		found = false;
> +	else if ((uc_fw->file_selected.ver.major == uc_fw->file_wanted.ver.major) &&
> +		 (uc_fw->file_selected.ver.minor == uc_fw->file_wanted.ver.minor) &&
> +		 (uc_fw->file_selected.ver.patch < uc_fw->file_wanted.ver.patch))
> +		found = false;
> +	else
> +		found = true;
> +
> +	if (!found)
>   		drm_printf(p, "\tversion: wanted %u.%u.%u, found %u.%u.%u\n",
>   			   uc_fw->file_wanted.ver.major,
>   			   uc_fw->file_wanted.ver.minor,
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> index 6501d6f1fbdff..3ab87c54a3987 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> @@ -66,9 +66,9 @@ enum intel_uc_fw_type {
>   #define INTEL_UC_FW_NUM_TYPES 2
>   
>   struct intel_uc_fw_ver {
> -	u16 major;
> -	u16 minor;
> -	u16 patch;
> +	u32 major;
> +	u32 minor;
> +	u32 patch;
>   };
>   
>   /*
> @@ -114,10 +114,6 @@ struct intel_uc_fw {
>   	bool loaded_via_gsc;
>   };
>   
> -#define MAKE_UC_VER(maj, min, pat)	((pat) | ((min) << 8) | ((maj) << 16))
> -#define MAKE_UC_VER_STRUCT(ver)		MAKE_UC_VER((ver).major, (ver).minor, (ver).patch)
> -#define GET_UC_VER(uc)			(MAKE_UC_VER_STRUCT((uc)->fw.file_selected.ver))
> -
>   /*
>    * When we load the uC binaries, we pin them in a reserved section at the top of
>    * the GGTT, which is ~18 MBs. On multi-GT systems where the GTs share the GGTT,
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
> index 7a411178bdbf2..646fa8aa6cf19 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
> @@ -74,7 +74,8 @@ struct uc_css_header {
>   #define CSS_SW_VERSION_UC_MAJOR		(0xFF << 16)
>   #define CSS_SW_VERSION_UC_MINOR		(0xFF << 8)
>   #define CSS_SW_VERSION_UC_PATCH		(0xFF << 0)
> -	u32 reserved0[13];
> +	u32 vf_version;

The vf_version naming here clashes a bit with the submission_version 
naming we used in the driver. I understand that the vf_version naming 
comes from the GuC specs and that it's named that way because the main 
reason it was added is for virtualization, but it might be useful to 
have a comment in the driver to explain that to avoid confusion. Not a 
blocker.

Daniele

> +	u32 reserved0[12];
>   	union {
>   		u32 private_data_size; /* only applies to GuC */
>   		u32 reserved1;


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D282B5BAD44
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 14:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1239010ED16;
	Fri, 16 Sep 2022 12:20:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7123F10E41E;
 Fri, 16 Sep 2022 12:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663330846; x=1694866846;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/jQNiEujtd/u036lyLJ5tstw437+SQVhQtHQgA18cus=;
 b=PpFl7m+Qo5fDuHWlSDjSfO4hp15OGkoZmtALfwvkbTC5/H9BXIHFLP9c
 buzePO2oTT7cnzeCYLMdfk0rl98IxpxHjrKwmaEPyzO/C6jgmrI+wpDou
 ZnBp6rqBsne4NT8suros5M3QdBhbgmpxmwLW8Qz8hhHksfG+U1Zm2whQn
 hhWRtvZqjvkwk1zLGmaigL15+paQ/pe2soTiYdfgcXLFD2q4mCWYTbP8T
 eV93dDGZpg0udcC9MW6evDGcVMyPkZJP3zH9CvyNvrPN2NAdbrY8mBW7w
 t+/LQ/cb6OEbOomWDmCvWDWamOpc+x50uSOVBpfU0HAZPKRS4VtZNxcPm Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="286019817"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="286019817"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 05:20:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="946355764"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP; 16 Sep 2022 05:20:45 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 16 Sep 2022 05:20:45 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 16 Sep 2022 05:20:44 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 16 Sep 2022 05:20:44 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 16 Sep 2022 05:20:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cr6STK/G1M/8BYkCdspVEzTRuIwjwJltdyREbQKvkdtWkIn1oOg+xyBzxWD/REIY+OKtizJ+bQovg+2CGEYOWyohoAAT8koqWqXNWD5oAvV1PAkF7meqEsjkWKoTVA33S+zsezsiLXUZYBST6GCAuyWgHniaC9bIiTrTm0lNn5G0AwoD3ytnLRQ8UChDvNKzauefVa0ADwAuMfUqJaRDDu82ahuYSxoujibhXAvZ4sIrYLMvHZzRiWE+Q6Vee+mWHpwGneJXLGkVjCcfrYQFd47OVjbqJg034C7Et34FDlSFzxT5gsFs6SONE2D93WTM4H0d7+fpTPwexu2bR0MM4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IjwKhFz356m64CImHwmea39vNyZr3ipxuE4eB6rXn4o=;
 b=V5GOgdqHc/vARCccugLrJ9M/J/d+ujEDH/dhryV8Y9DM+sMu32xGwo14LM02pa3ovIZTiNo7B8akF0y2GPWlYQ4OCTa22jqVbNoNWD7tcz9oZ7r01RpXNmUUI4475Bv8XjV3NxdiQaH+U3Q+AP69N0Y4jWGd1mvWi3f8ztM0u/7nPPEnD0+rAe6F1VFQWQpPvFVFWqUUPiGm/xzsWQihqAGEiki82dZsJWNkTOTEBgpeoNdl/kalNLDUrEjSfoYxdMKtjJIkG7c3yelBhgMx5vmJxdyK0v/gsEINHO8W+rbCyOg/bMLm0JZflYvdfeff2hIDz6tyShfLSWWL+j6HqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Fri, 16 Sep
 2022 12:20:43 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::bde0:ec99:6d15:8763]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::bde0:ec99:6d15:8763%9]) with mapi id 15.20.5632.017; Fri, 16 Sep 2022
 12:20:42 +0000
Message-ID: <dd4bec0f-9d8d-83c2-a0a4-722c4678dcce@intel.com>
Date: Fri, 16 Sep 2022 17:50:33 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH v1 3/4] drm/i915: Split i915_gem_init_stolen()
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20220915-stolen-v1-0-117c5f295bb2@intel.com>
 <20220915-stolen-v1-3-117c5f295bb2@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <20220915-stolen-v1-3-117c5f295bb2@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0044.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:49::19) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|DM4PR11MB6479:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c9b4f0d-7e19-4d26-ee1e-08da97dddfd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sw6lr3XrB8LQCx9fe236D0ClSqNPIdTqPqy0OJrSxQdBxPNx1rZ6lkLk0QUqdxWaHB6gRuis5nsomWgZgja/1qA43vLLKw/Jw2+cQcWEsqUvlIytb8Zrv8Wj6N4AdvIFF4KTgoz6VSogLzAmLw4G1Nk8wd26rRQeQVQrfJllLL9LhM9AjltrjIbd05hTxNgDNBessIpujEc1cqPpmTdaXPJKQbH25tA4AAC5j8IfRfCpvk0zGdi3JiaZAGoTKMIhR8X6SaoLt/X9TjRJnbDD0Si3U888wK16e8JSCrtzJS53ME57a8FaoaqtmTGk78JPnFCG2kAGCieHKlaakbhc7pdi8rqmbz3cbn807RH4aDz3Ukf0Fvrl/pE7fNDCjKeG49Bfe5p43mYEJEFnd9npCQtXx7W8Lw/CSnx+jB5zj90KT1fhKrHN/mWehht7EJzhXHJxgJiuzAirGAQWniozUTSJjfAdk73DWxu6RdukmwBrRxQN9yB20CTlxmgUPJvwoSjiBnAtmoPLOwp06Jrg9AiLj8oobeuOfWplO3Vj5eYIb0PT/7/JrJgf+3idziCzJC7rh+Q/nMM16Qx8YgmZ245+r2vLX7jNnRr9Wo8/cphR03v1DY7rqMGDH7Xw4DA5DLtAzmvuRcEfExkdfCTbbSXEvIaH/yneLnjJ4PGhhhQQOdBZyykAk6L50CSF9k8h4DvQPpUxJ4Faiv4jwHfhSOWszAJJ871+NrvTEMGGPmGBE7q9WAXKL/dHddjHK3v0xftrxPx+WNXkVdoCu9X1HsLCtiPjOr5ox9wm1+9J3ko=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(396003)(136003)(376002)(366004)(39860400002)(451199015)(26005)(478600001)(450100002)(66946007)(6666004)(66476007)(53546011)(86362001)(5660300002)(82960400001)(36756003)(6512007)(41300700001)(6506007)(4326008)(8936002)(31696002)(316002)(83380400001)(38100700002)(8676002)(66556008)(31686004)(2906002)(2616005)(107886003)(186003)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1N1ZXBubGI1UW5PSHU4OFMzS0gyOTV2b29EeEFXSVNxeTRybVB6TFg2aEs2?=
 =?utf-8?B?SHlxWXhaV0FBdTYwK0o3NWNCOHNuYU01RXFlZERBcUxHeDlRTTdtY1RsY1VE?=
 =?utf-8?B?bVlGblFIaFcyb0wwSE1MbDBKUllWRSs4akV3bzF2MG55ZXZUMlE5Y3U2T1RL?=
 =?utf-8?B?RFB6R3pGR283SGovZWVhSXNoT1FSNnJJcVhVdVRja2RyZVZ4NW53WWQ1YVRP?=
 =?utf-8?B?dGs4SG1IcHFmalkzdnlVK0NidUNOUCtrL3J5ZHJ5OXlWWkdNSFBQM3RZa0RZ?=
 =?utf-8?B?bXV6dDBOVFBlRzBPdFNiR2ZVc2ZuZEprWUNKa2tRV0lVVmFGTllkQ3lXV1ha?=
 =?utf-8?B?Ry9YdFdFOUxiZ3BHN3dOb2xnL2gzRVAxVFRyM2lCZ3RvSUErMlk2QW9OZHZN?=
 =?utf-8?B?LzZFNERmZktaUVhSeWoreFlCUk5oSDZMQ00yOCsxT2ZvTnhBVlNrNFpLL3Er?=
 =?utf-8?B?Yk1DUTJXbkhpSXRzbUoxODFId3ZhWGRwMjgwNU5GdnhDR3dKbzdIMzlxanFR?=
 =?utf-8?B?Z3FpaDBrT0FsbGhhblJ4MlZGeDJZWDdLWk50a3VuMmI3VVR6cHAwMG1kdVRh?=
 =?utf-8?B?TmdhQ3lkTERDUjhNVzk2a2ZXR1VUSHV1aFcyZFYwUGdpZG5TL2EvTWFzVmk5?=
 =?utf-8?B?UHB5MXppQWNOYk5sbVBFa2R2Y01KeFRTTEI2NVgwUlVQVUt5NHd6OGpVMGhE?=
 =?utf-8?B?dU1ZTGJuNkpwUGJhUHpVUTYrWXFRQVZrWWFhSEVHekdCeEVUQW1PVUs0ZjJ5?=
 =?utf-8?B?Z1FWMy9SREZMR1FKd3dXMzV1QkdDejNvZUEydG5iNEtQMXd1V2dOZFVNZlVL?=
 =?utf-8?B?bitmZGIzK0dodEhCOWpROE0wYnlpckpQR0tqY3AybnBHekw4ampRQ3R1SWIr?=
 =?utf-8?B?SWtUeXQyaWgwK1A1RmZRQkg2ODEvOWVBVlFFaWNLQWt3eVJscHJtUUdzVTRu?=
 =?utf-8?B?Y0tHTEQweHk1T3ZTaGo1WGpWYjFvME01QXIyYkhscmg4emNwbjRmdlJXVUlV?=
 =?utf-8?B?VEZNSHV2MUdZQk5yWGxDeGNucFlnOFhhbVFicEpTTE04akJFQVgzc2grMzYv?=
 =?utf-8?B?b1VXd1ZwQzN2bmlIZHZXdk93SWk4RHFaRS9mYWMzd0phM3htMExNWDljL0ZM?=
 =?utf-8?B?aGZFUzFLV0hlZ1diOTJxOUhqRTUra2xGWUdSdDZCY1FvNTVTV3kxNE1xUVN2?=
 =?utf-8?B?eXIrTUxTdkZrNFNTNG1VZk42bi8wTlEzeHZ3czFTNURGUG1EN3FsdkFCRUJT?=
 =?utf-8?B?VTI1Tk83Yk9scmI2UXNIWWUzam1HSVlNejZLUWZWU0hhakNEaFJTdUNzSXRt?=
 =?utf-8?B?UFZSVFJ2Y0JFcytBeVhOREI1Q2NCbE5EMnQwNEdiSlMvVEhTOFdmS3BpNmdu?=
 =?utf-8?B?b01QRFV1ZWF0T0xzbTZ1NjlHUlhhVXBBU3lxTmtrd2NLVmJaeVhzaS84a1R3?=
 =?utf-8?B?MDRTZkpxelFseWxLdTdGTWF1N2ZWbE5IWGpacTR2M1N3QjBlVkVXOVVxSVVK?=
 =?utf-8?B?bnJxaEpFVTJxVW53WENlVHFpdW1DU0k0QWk0QjYwQkFkV2VFZkdwVXpoS05B?=
 =?utf-8?B?RVdiWmxjazkxYXlkSnpUenZvK3RSalJrRjUvNFhWbHlyUll6U3pQTVdRbFA1?=
 =?utf-8?B?clByVTNhekRlVjUweUxBbnZyeGh5U0s3RWthTHptblJ6enJRM08xUlJ1S1RL?=
 =?utf-8?B?b1VLQnV6c3JyT0Nqc2k5Z0ZvVkJWUUtGT1NZWkw1YmxUTllzYU4rQTE2dGtj?=
 =?utf-8?B?WEZsWlgyQndmcEd0TkJDbDc0bG9JSFo5K0Q0dDYwMEFLNEt3bHBzK05ERmhH?=
 =?utf-8?B?N2RRc01WZ2ZhblVHSHpmZ0ZRTFVGN0ovVXF4MnlSK0pGZ3NibDBXc1dNUHpT?=
 =?utf-8?B?VnQ5OGRsT255OHNDY2l2VUNhZnBHWWdOYWpwM0JHc09pc0RUWGFFL3c5Rkwz?=
 =?utf-8?B?SUV2RkNTeUlkSGVaN3drSnNSaXl3L3NQQ1hrSGlhVGpKcFdtbEJxQWxmN2Fz?=
 =?utf-8?B?Z2Q2a2JjbzBCNmtDVWFKdGo4NU5DbjlneEo5TGRLN2JKN0ZFbUFDcDVSQTQ3?=
 =?utf-8?B?eDBGYXRyQUdQMGpJNzduS3lGYWJGakN3T2tmOHRaMW1sNGJNbkhCbldnSWhP?=
 =?utf-8?B?cDhOdU94STNhMHZMNGk4VElPenFPMllCZHhSWjVjWWxrWVdOdGVTRkhXVjM0?=
 =?utf-8?B?aGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c9b4f0d-7e19-4d26-ee1e-08da97dddfd8
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 12:20:42.8729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3wLQQrxXBT3EfMxs1RZF93L15H1APJV8P+VCUIMM1v2ZxV37AEIi4M79f90N4wrraxNr5VpuPf9WS5WGbO1VWJ/ZBfr3za+ssNBMpwrJs2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6479
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
> Add some helpers: adjust_stolen(), request_smem_stolen_() and
> init_reserved_stolen() that are now called by i915_gem_init_stolen() to
> initialize each part of the Data Stolen Memory region. Main goal is to
> split the reserved part, also known as WOPCM, as its calculation changes
> often per platform.
> 
> This also fixes a bug in graphics version < 5 (in theory, not tested,
> due to no machine available): it would bail out on stolen creation due
> to "Stolen reserved area outside stolen memory". Other than that, no
> change in behavior.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> index c34065fe2ecc..0e57a6d81534 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> @@ -77,22 +77,26 @@ void i915_gem_stolen_remove_node(struct drm_i915_private *i915,
>  	mutex_unlock(&i915->mm.stolen_lock);
>  }
>  
> -static int i915_adjust_stolen(struct drm_i915_private *i915,
> -			      struct resource *dsm)
> +static bool valid_stolen_size(struct resource *dsm)
> +{
> +	return dsm->start != 0 && dsm->end > dsm->start;
> +}
> +
> +static int adjust_stolen(struct drm_i915_private *i915,
> +			 struct resource *dsm)
>  {
>  	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
>  	struct intel_uncore *uncore = ggtt->vm.gt->uncore;
> -	struct resource *r;
>  
> -	if (dsm->start == 0 || dsm->end <= dsm->start)
> +	if (!valid_stolen_size(dsm))
>  		return -EINVAL;
>  
>  	/*
> +	 * Make sure we don't clobber the GTT if it's within stolen memory
> +	 *
>  	 * TODO: We have yet too encounter the case where the GTT wasn't at the
>  	 * end of stolen. With that assumption we could simplify this.
>  	 */
> -
> -	/* Make sure we don't clobber the GTT if it's within stolen memory */
>  	if (GRAPHICS_VER(i915) <= 4 &&
>  	    !IS_G33(i915) && !IS_PINEVIEW(i915) && !IS_G4X(i915)) {
>  		struct resource stolen[2] = {*dsm, *dsm};
> @@ -131,10 +135,20 @@ static int i915_adjust_stolen(struct drm_i915_private *i915,
>  		}
>  	}
>  
> +	if (!valid_stolen_size(dsm))
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int request_smem_stolen(struct drm_i915_private *i915,
> +			       struct resource *dsm)
> +{
> +	struct resource *r;
> +
>  	/*
> -	 * With stolen lmem, we don't need to check if the address range
> -	 * overlaps with the non-stolen system memory range, since lmem is local
> -	 * to the gpu.
> +	 * With stolen lmem, we don't need to request if the address range
replace /if/for
> +	 * since lmem is local to the gpu.
>  	 */
>  	if (HAS_LMEM(i915))
>  		return 0;
> @@ -392,39 +406,22 @@ static void icl_get_stolen_reserved(struct drm_i915_private *i915,
>  	}
>  }
>  
> -static int i915_gem_init_stolen(struct intel_memory_region *mem)
> +/*
> + * Initialize i915->dsm_reserved to contain the reserved space within the Data
> + * Stolen Memory. This is a range on the top of DSM that is reserved, not to
> + * be used by driver, so must be excluded from the region passed to the
> + * allocator later. In the spec this is also called as WOPCM.
> + *
> + * Our expectation is that the reserved space is at the top of the stolen
> + * region, as it has been the case for every platform, and *never* at the
> + * bottom, so the calculation here can be simplified.
> + */
> +static int init_reserved_stolen(struct drm_i915_private *i915)
>  {
> -	struct drm_i915_private *i915 = mem->i915;
>  	struct intel_uncore *uncore = &i915->uncore;
>  	resource_size_t reserved_base, stolen_top;
> -	resource_size_t reserved_total, reserved_size;
> -
> -	mutex_init(&i915->mm.stolen_lock);
> -
> -	if (intel_vgpu_active(i915)) {
> -		drm_notice(&i915->drm,
> -			   "%s, disabling use of stolen memory\n",
> -			   "iGVT-g active");
> -		return 0;
> -	}
> -
> -	if (i915_vtd_active(i915) && GRAPHICS_VER(i915) < 8) {
> -		drm_notice(&i915->drm,
> -			   "%s, disabling use of stolen memory\n",
> -			   "DMAR active");
> -		return 0;
> -	}
> -
> -	if (resource_size(&mem->region) == 0)
> -		return 0;
> -
> -	if (i915_adjust_stolen(i915, &mem->region))
> -		return 0;
> -
> -	GEM_BUG_ON(i915->dsm.start == 0);
> -	GEM_BUG_ON(i915->dsm.end <= i915->dsm.start);
> -
> -	i915->dsm = mem->region;
> +	resource_size_t reserved_size;
> +	int ret = 0;
>  
>  	stolen_top = i915->dsm.end + 1;
>  	reserved_base = stolen_top;
> @@ -453,19 +450,17 @@ static int i915_gem_init_stolen(struct intel_memory_region *mem)
>  	} else if (GRAPHICS_VER(i915) >= 5 || IS_G4X(i915)) {
>  		g4x_get_stolen_reserved(i915, uncore,
>  					&reserved_base, &reserved_size);
> +	} else {
> +		/* No reserved region */
> +		goto bail_out;

better to have a WARN_ON here about STOLEN region wrongly passed on the
region list.

>  	}
>  
> -	/*
> -	 * Our expectation is that the reserved space is at the top of the
> -	 * stolen region and *never* at the bottom. If we see !reserved_base,
> -	 * it likely means we failed to read the registers correctly.
> -	 */
> -	if (!reserved_base) {
> +	if (!reserved_base || reserved_base == stolen_top) {
>  		drm_err(&i915->drm,
>  			"inconsistent reservation %pa + %pa; ignoring\n",
>  			&reserved_base, &reserved_size);
> -		reserved_base = stolen_top;
> -		reserved_size = 0;
> +		ret = -EINVAL;
> +		goto bail_out;
>  	}
>  
>  	i915->dsm_reserved =
> @@ -475,19 +470,55 @@ static int i915_gem_init_stolen(struct intel_memory_region *mem)
>  		drm_err(&i915->drm,
>  			"Stolen reserved area %pR outside stolen memory %pR\n",
>  			&i915->dsm_reserved, &i915->dsm);
> +		ret = -EINVAL;
> +		goto bail_out;
> +	}
> +
> +	return 0;
> +
> +bail_out:
> +	i915->dsm_reserved =
> +		(struct resource)DEFINE_RES_MEM(reserved_base, 0);
> +
> +	return ret;
> +}
> +
> +static int i915_gem_init_stolen(struct intel_memory_region *mem)
> +{
> +	struct drm_i915_private *i915 = mem->i915;
> +
> +	mutex_init(&i915->mm.stolen_lock);
> +
> +	if (intel_vgpu_active(i915)) {
> +		drm_notice(&i915->drm,
> +			   "%s, disabling use of stolen memory\n",
> +			   "iGVT-g active");
> +		return 0;
> +	}
> +
> +	if (i915_vtd_active(i915) && GRAPHICS_VER(i915) < 8) {
> +		drm_notice(&i915->drm,
> +			   "%s, disabling use of stolen memory\n",
> +			   "DMAR active");
>  		return 0;
>  	}
>  
> +	if (adjust_stolen(i915, &mem->region))
> +		return 0;
> +
> +	if (request_smem_stolen(i915, &mem->region))
> +		return 0;

why do we want to subside the errors returned in adjust_stolen and
request_smem_stolen?

> +
> +	i915->dsm = mem->region;
> +
> +	if (init_reserved_stolen(i915))
similarly here.

Thanks,
Aravind.
> +		return 0;
> +
>  	/* Exclude the reserved region from driver use */
> -	mem->region.end = reserved_base - 1;
> +	mem->region.end = i915->dsm_reserved.start - 1;
>  	mem->io_size = min(mem->io_size, resource_size(&mem->region));
>  
> -	/* It is possible for the reserved area to end before the end of stolen
> -	 * memory, so just consider the start. */
> -	reserved_total = stolen_top - reserved_base;
> -
> -	i915->stolen_usable_size =
> -		resource_size(&i915->dsm) - reserved_total;
> +	i915->stolen_usable_size = resource_size(&mem->region);
>  
>  	drm_dbg(&i915->drm,
>  		"Memory reserved for graphics device: %lluK, usable: %lluK\n",
> @@ -759,11 +790,6 @@ static int init_stolen_lmem(struct intel_memory_region *mem)
>  	if (GEM_WARN_ON(resource_size(&mem->region) == 0))
>  		return -ENODEV;
>  
> -	/*
> -	 * TODO: For stolen lmem we mostly just care about populating the dsm
> -	 * related bits and setting up the drm_mm allocator for the range.
> -	 * Perhaps split up i915_gem_init_stolen() for this.
> -	 */
>  	err = i915_gem_init_stolen(mem);
>  	if (err)
>  		return err;
> 

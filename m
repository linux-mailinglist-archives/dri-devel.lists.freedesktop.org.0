Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46528540357
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 18:07:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE34910E552;
	Tue,  7 Jun 2022 16:07:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B8B10E552;
 Tue,  7 Jun 2022 16:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654618043; x=1686154043;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PBaqJxIQ9VmTRlgRmQ6Uj+B4wBr6JdCr4RgSA5neTvE=;
 b=kdx+riWqlpNqsav466Pa+UkBEWLD/vD1P7whruekpkF25KxmcE47NVI8
 eaxoGGWQv9d+naom37EwXEsKU5QhA/9VeGU/ZCllw4mBVDrNnBFpXWhg1
 20G7uGti5E9oFsKWoEkQxCVVHfaAogX/r91EyKKzD+x1/YBkudHkzS/iF
 kWBtEBk5ZXlrc40EdnzOYKuNZj+ADEndWQUge2NPmwXlDJxUWy4cZ0e2P
 lZJ0n5Nulqro7/NSavxWyz+5icjRs6oOPEzpFQEubT9kuXwIwoQKFWUsN
 ItBrSKVuIutRqeigWVq6aNyJ3OYZUsGPjjYPd3oKQ9JTKvdT6icECLGO4 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="276768383"
X-IronPort-AV: E=Sophos;i="5.91,284,1647327600"; d="scan'208";a="276768383"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2022 09:07:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,284,1647327600"; d="scan'208";a="565490040"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga002.jf.intel.com with ESMTP; 07 Jun 2022 09:07:22 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 7 Jun 2022 09:07:22 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 7 Jun 2022 09:07:22 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 7 Jun 2022 09:07:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M3z2J35iA/wvfQFKD94c2dFdDMWiBFDC+W84uDrMpBL7d0aR2e1QvIcldTJrpw68dZ9++Yt3TSRq103cILUFExgjn0fsxEFbbBGEb8O6cw3gKDqrFQnnr/TTD26wNpbaJSFgZsl4kRcIh4eUnhK/U/rvvoTvvaAWcD4aE9lkpgenBd4C91X4zWH+upux4sVNw+pksF7ni0hrrC9brWj7DkXR4yDuKnwy4QLoQZABakXtcmbBRDy34y37jcm3zgfmzv7ALZqd75Q9dCiVNbAOmt9MKZJ2VJShauuisVCu28xSZyf1/vtIDbx5/bUAIGb6Ry7zvwGqoLQkhLw3tDLFGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jECyjnzrNrii35Ol1fLIQpLmlbQADjvTBS/IRTHjDxs=;
 b=PAiUXJIugFYN0Z1PkR2MLt25VSVG+i5QkZ6TjILyXh8mNIksNGe1jFrSeAhiNTGlun7T5DMSF8qwrP/M8SN82mcKDumxnUl3booMRDYikVK4UzjkVB7o2bB66IagivZtAfgu91eRlfKfNwbkvGfb6lhh/sDuVCqqYDWiDy/DnzCAayAfVOpj1Kthu29fIZFEGexBMeWwqq9GobrNB3T2o+RBxk7EV9n9l64Lk5RW6A8b0W9LUZQ4oScslGssxpF9qEOdmZE4FhZOjBOZUPYrue6vvvis5PYwK7W17OnqATftqO+OvGXnvbjM44IUQ4fluFzQLjNEHKJQRGFvc+SvaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 MWHPR11MB1789.namprd11.prod.outlook.com (2603:10b6:300:108::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Tue, 7 Jun
 2022 16:07:20 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::29a0:67ad:4b77:ce13]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::29a0:67ad:4b77:ce13%8]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 16:07:20 +0000
Date: Tue, 7 Jun 2022 21:37:11 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/dg2: Correct DSS check for Wa_1308578152
Message-ID: <Yp93rxbgO6b2VNlA@bvivekan-mobl.gar.corp.intel.com>
References: <20220607154724.3155521-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20220607154724.3155521-1-matthew.d.roper@intel.com>
X-ClientProxiedBy: PN2PR01CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::14) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c9cd91d-ae52-4883-2652-08da489fccf6
X-MS-TrafficTypeDiagnostic: MWHPR11MB1789:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <MWHPR11MB1789230F943CF5C28173A5409FA59@MWHPR11MB1789.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ulCFSeFSkhnXQCCXOzaZ5oL+NU0mJsRqBxGmfdOApUo/GccgIyMg80q7LsmI396GZGgkUvnkqKd5Mh9z7hXwx2DOmnIE9fAPdR9F2o0FP10XF3YZwtLXHc19inU93RextlIolW0NeKugNgso0rSeFFgh1hf7cxqq8xvul7rG95w7wp9lDIV57FdOnOvADLXcOOzXWEr8izqkb9EtijB0eI0YhfGdHSkvnaz37CAt42oeI1eagin3fK2wt5bX4QwoUxSKd5GaS5Exv3109xcGzELW7eHTq5GbB0Hk9xJJ9dlhDot9u/iJPwe+7be7MXy2JIcKKzUiQlToYTZqediHvzx8gjyzfSPdD0vrtE7Fg5mKuWRgPDujDAreMUVbaRB52lwcsGOgjKJ8U52CeqwV7/VAk7cTrgPhApRMFtnsz6HDVtx4w6/i9PDv5JIy3MyDNKmdynpHlifpP2Q8keaPAi/LDZ/EOTDf5KNn5cycIFvsoyA/ovWIQH8M9Cx9ZnS9/iPGsxQQy6Fbq5r+vaKT+yVM5/s65vX/4jKbyuKZxP7ShFMEixjLOApMsUmBnBVnfL1/4FPaUVioHUdW/S67R1KT3nOIpb3tmLLCKZA9cYZly3k7vcYuv85v+60WN5X8o45+eT7/Mxc961tD7nejdg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(8936002)(4326008)(5660300002)(26005)(6512007)(53546011)(38100700002)(6666004)(6486002)(6506007)(450100002)(83380400001)(186003)(316002)(82960400001)(86362001)(2906002)(66476007)(66556008)(66946007)(8676002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TCtiYlA3OFRCZ01uYWx0WC9za1l4M1NpeDdFZnp6UnJsaS90amMxdUcyQXpF?=
 =?utf-8?B?QWZjUTQ4ODlhejJ0MFJ6azk3RHRud21uZEdyL0daMTdJdzBRbWlFd21CUkRG?=
 =?utf-8?B?LzdzbXVYaVVsZkkyS1EyenEvTnVSSGRyb0ZqeW5kSXBNZkNCSmhZTGoybm16?=
 =?utf-8?B?U0pCbUZERjZXL2w1ektjUklrQ1NUaDJESVl3RWtRdk5LWmRYeUZhNHphSGw2?=
 =?utf-8?B?NzhJdENjelFhVERPM2hWU1ZyT1dBbE1DQ3NvVnZmdm9kOVlrcWJ1LzdSVUY3?=
 =?utf-8?B?Unl4bjg4VERrSzk5SGo2ZDdQUG5zUzh1SVk4RytDRHNwWkhYaThqSnQzU05T?=
 =?utf-8?B?TzMyaEV5bGh5QVFzWGJudFNiQjc5WWZRZjhMM0pUSEIwdjZhWmtpVVZzRXha?=
 =?utf-8?B?VG5KazJHQmtVNVY1OThucWVOWkc4M3hKd1VrU2hReFgvakdUUDVOL3VZK1ZQ?=
 =?utf-8?B?MUpHM2tUbDRkT24vQnp2aFduNDl6bDQrdFpocytPYmF2NDJCM0lRc1NCVVI5?=
 =?utf-8?B?TzVUM0pHRlNRSlZzU1lJOHRSbjd1WTNuRk1lcURWdDBJM1VyY2gxRDJPVStU?=
 =?utf-8?B?azhGRnZlRGw5T1RCUnpQRElLcE1ZemJRc29NVWc4S0tsRWIxUHI2akVuRGVQ?=
 =?utf-8?B?ZFdXSkZVbVd4c1VrOGZpdjlMczJzUEpPOXA5MlpVTTdwZTd4TW1ldkZsM2Zl?=
 =?utf-8?B?L2YydzVaQTBJSE5ybHBlR2ttVnNEdDVTdnY2UkkyRE04QUlmRjR0ZDR3MFR6?=
 =?utf-8?B?Q1Q2WHM4QTRaT3lDQkl5QlQxS0VCYU9kbjNUeDhaMU94SFFyVFgxTzRQV0Nk?=
 =?utf-8?B?MzNHRXVqaXRtUG9VSTJUbDkxWTd6UVlISXNrQ05YdGp5b0dJZmNWZ3VheWVG?=
 =?utf-8?B?WEVsUlVJRVBqeW8yNk1CS0dzVjlVTWJCZW9zZVppSEEzTHVMclYrY1ZwM2Zj?=
 =?utf-8?B?dlIrTGEyeVlBNnEzOXQwbTFya0V0Yk9taHJMWVM4VHgrc3ZZTXZUWENFc3lI?=
 =?utf-8?B?a3dQVUF4Z2RQUFFQTk1rNzh1Q253Q1lMSWE4Z1BZMklxRXNyK1cyZlR5N2tl?=
 =?utf-8?B?WVR2cnUxeWgzNFphdEkwTnplYmt0QnVYMm5NRnEwRkNRclJHektTbHg3WXA4?=
 =?utf-8?B?Rjdxb3ZFRzZuT1pjNkhQQTVJWkJHZmVhenpXZHgyb2o0YWdyRlVJNDMvNlJi?=
 =?utf-8?B?L3A5dEoxcEpXaEZaSFE1dW80OElvdlBmSEtuOVk5aXhPbTZXcUZaMTlLTjVi?=
 =?utf-8?B?aE1rUjEzVGhsMUk0c1FtNmNad0UxMTd0cVVIZWllK2NtRU9hbTNHREJHQXNq?=
 =?utf-8?B?WElrT3lKakRaQzdHcmRTSGhkaFNkY2NSR0M3R3dHRWg2WkE5SitiSEJ3anFl?=
 =?utf-8?B?M0xRYjhVOXVNeWswcVl3VFpTZ2R6VFVrQ0JOYVhLaEcvVlZKMGZtd0ltUVNM?=
 =?utf-8?B?NVNpR3dRaVI4NG9IN0pvSkNsOVlhK3VkNHgvNXkyK2ZyMk55N1pxLzNKbHRq?=
 =?utf-8?B?YjFYM1BKQnNVcklBTEZ2dXcvQnViQjkvaXI4YVBERnNocG1Gakc1M2o4UnIw?=
 =?utf-8?B?MW9oakVGREowMDB2VTAvd29UR1IzRWorczBiNGcySU9OOUpyWDBMczVycUNZ?=
 =?utf-8?B?R2lyeE5yMFZ6NDQxQlFhRWpxcUtHUUNwaXlDb2d4K00zTzNHZTRQYjdJL2JH?=
 =?utf-8?B?eDNsVFBOUUdlcmtmcHRWNEhBcS9RVzdRR2VvSHhHVzU0QlVlbnVhakdVZWdZ?=
 =?utf-8?B?eHhpWmZPazJ6MjE1WkVLMkUzWWVPNjdFQWNYY2ZKcUQ5SmtTSGQ5cE5rb3pp?=
 =?utf-8?B?MGp0eCtLYjI1THF1T2w5YjArdkQraUZqemN5c2NJc09GRXZ5QVBET2RtcEI2?=
 =?utf-8?B?WG4rbDhTM1NFTHZpVmZDYkdRUm9SK2J2cXNaRGNaQmx0MVdJUXVpQnRmdEtW?=
 =?utf-8?B?UGhwVnRYNnNDMUNybHRlMFJXMDJWZ0VWNFhoMXpDMVVjYjFLTW9XVG5od3JN?=
 =?utf-8?B?d3lleGV0WG9rbllHMDhMclF0VmMrWGloekhLTkovcHovV0xOdUd0WWsvQ3U1?=
 =?utf-8?B?V2tWb1RSbVpGTXgwSzVCaHNPMHpMQ1dyNVdvWFFHT3gyejRTTXJyVDJqalR2?=
 =?utf-8?B?dmpZU0pNVVNoUzRRQTRiT3RxMXN0U1JyOVo1RXhxNFgya3pGMDBYOWp5SFRP?=
 =?utf-8?B?NDk1SVNJZVNmUmlhSFZhMUVHanA1cWcwQkxXNm9YcUZmY2tCY2Y0azFreXps?=
 =?utf-8?B?a1NHdHg4YXNESkN5TVA4YlpqZG85VGFLR083V1Q3QkZ4a1RCeFJZRWVKZEJJ?=
 =?utf-8?B?NlpvUUJVQ2tpZU1rQWNtL1FZc0Z3UTgzZ0FCdWIvZ1FOVzRCMWEzSnZscVcv?=
 =?utf-8?Q?Of5I0UXtv27ZUsFOGY5cW9IK//VL9R4KmanY7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c9cd91d-ae52-4883-2652-08da489fccf6
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 16:07:20.5779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yS+VMgTivveK/06+P1AnaxPH2I1X2HySaIuVQZvcxp1nacOdeSPMYCyBrOP4GqZuSh+sRb9dv5Fp6EPJZ6AcSQsmOoGzPA28Q/wAK3YLN45O4j6f067AYWH8T52Phla0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1789
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07.06.2022 08:47, Matt Roper wrote:
> When converting our DSS masks to bitmaps, we fumbled the condition used
> to check whether any DSS are present in the first gslice.  Since
> intel_sseu_find_first_xehp_dss() returns a 0-based number, we need a >=
> condition rather than >.
> 
> Fixes: b87d39019651 ("drm/i915/sseu: Disassociate internal subslice mask representation from uapi")
> Reported-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 1b191b234160..67104ba8951e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -2079,7 +2079,7 @@ engine_fake_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>  
>  static bool needs_wa_1308578152(struct intel_engine_cs *engine)
>  {
> -	return intel_sseu_find_first_xehp_dss(&engine->gt->info.sseu, 0, 0) >
> +	return intel_sseu_find_first_xehp_dss(&engine->gt->info.sseu, 0, 0) >=
>  		GEN_DSS_PER_GSLICE;
>  }

Acked-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>  
> -- 
> 2.35.3
> 

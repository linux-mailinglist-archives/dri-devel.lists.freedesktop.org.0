Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB82601410
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 18:54:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A8910EDB5;
	Mon, 17 Oct 2022 16:54:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F2810EDB2;
 Mon, 17 Oct 2022 16:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666025677; x=1697561677;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Yb91/4HJNRp4AyJh4u0S4AbMEmZtlUcSYxSiuonXTRU=;
 b=OgUev56362T+ZEGu7e8dNSgb6nwctAFpWI/Hfj3EKTyTvLjo01vHRv5M
 V1Kzl2OhNrpmOD33hjhW1L2sTbFKBEupacOMq2780E8nkQ5pYfujStOtx
 u6Su8gA/QDf3NdbJLRMin+YbFvJgOnOC0ttiZO+mCjxpge9fXPCYskys/
 WzcAXP+rn5VS9QiayzVH8Gu/Xf4MF5Bhk/dVLDMb5tmbLVNIduPpNXGq5
 j5LeB1uRnMA0rKwlTd5SkL9huSiZLjSdoRk+/xqzK3G7mha0L/5GDUDm6
 Gl16FYhewwcS4J7WLVEJL8jzdPPuSLVJjvWaEZx0SMdsT3S0kpbCIILhS Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="306937997"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="306937997"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 09:54:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="753699817"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="753699817"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 17 Oct 2022 09:54:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 17 Oct 2022 09:54:36 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 17 Oct 2022 09:54:36 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 17 Oct 2022 09:54:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ppq4fysq/d+T6mGM+pfqm6lHjvr4wQsyqO7mLYAHS3zCKzgGqZdnqRnDTUwT2QhtDLn6F2N9nJ9gMb5q1WgbRbmZKZHRImwvXVlhOi5cB+JRMN2jVQTJcpXwLPJtPNTS02eNpwMNI0moxbBrN3n8qQgAcMzRyc6U4DMYh8cN0lUoqd1XPt8NCJendpSX4JlK/Yt7bdfJbzwK2lshFkG8U7XEUeA30Vhq5rYULLW73D2Xx9M71Arr+Q52C89C4yLJPpXi219QubtELkJUVOY0DrGpZnk4g76DH49SWgql569Qy+ZdFvDRSCryvOjsz3P3gDDCx3ILaeH5xIbzpR8V7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=24JKwwKAWw3PgcEZaiqvjQAPZFKlmAu8pDI9DyDgyXE=;
 b=U/mHLARkc9i7ckKo/nkL0ilkmhBHiCgJtjmJZBFOOEFp4pck2Wk7XZupuGtDnAfsUtx4/vcZISyumdj6LUrHwO6L66U560iV93xHULe+RIjAiiJYjNf5y6naeQB3aPdDltPvgGgY+nxBXLisaUeHzTWdCb0qiWC+vnJ+2RrlrdiK88LPeLZUQG5iRJtDABAXwpMofhAzZmaicyvVJoNtfs9PI2k2+OpEVxVGda7k4MmlzyggECHQW4oZxNGup14V2QYkUKcz9zGRVDDejW2EerzORawb219A2h05tkkTHuXANndL1GYrkbO7xQgH1aBmoQHuwfNFNnk0kj4O3s1tpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 DM4PR11MB7350.namprd11.prod.outlook.com (2603:10b6:8:105::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.30; Mon, 17 Oct 2022 16:54:34 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::c0e8:f5ad:37d:ee67]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::c0e8:f5ad:37d:ee67%3]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 16:54:34 +0000
Date: Mon, 17 Oct 2022 22:24:25 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 10/14] drm/i915/guc: Handle save/restore of MCR
 registers explicitly
Message-ID: <Y02IwZHnyKt0lnwe@bala-ubuntu>
References: <20221014230239.1023689-1-matthew.d.roper@intel.com>
 <20221014230239.1023689-11-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20221014230239.1023689-11-matthew.d.roper@intel.com>
X-ClientProxiedBy: PN2PR01CA0144.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::29) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1897:EE_|DM4PR11MB7350:EE_
X-MS-Office365-Filtering-Correlation-Id: 312f3bdf-d2a7-4c40-39f4-08dab06044e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eojkXRyBt3BgfLoRKdn2fCjE+TIjsASt377f4Z0UHThyYaAy0yxxJJM0DG8yA/UV2dPeBa8KI9U5j+HakYJszPwGTNnn89Gby3DCLZPxwgbSr5Dx5OztFywls9FhaOMGmV1KE7BuJ1vaq8LOefeYgwLbHnZgqfSlkWwp3r0yC5C0bhZ6iiQi6KdVAvaH+jydlk9XbFn/YKrU9KHlijHrSuO4E+jwT35uG00FBXXNMlMwwqkq6WaXl4dBpiZz4fNDsEK0/zYdeE48fygcPmap3SsLRKNYc9/bXLB9JbnaS44TgjonM8rhYUXEjVNW9k0+t2cwOtU4WfHG9kTfo9FN/kH8pJA61/tpblVjw3BvBHrdbscnKzSjg6dZeCzVL0tr4LgS9aXFvVCUaI5i4NDL5yP4VAEFNfEN7t6BQQ/2BDipIPVGxES5ErVEaCYCXlF/WftY9fN2YnjxGTQhAJ/HTdhEPfUyRSwZOsSviea7yrMH2NbD42xo9rrlfbKZ/ipSm5Dcbs1wOHZofLPaTFne6ZxB+DbDzQIDNIH3AXck69k14kbG7ZkV2ywNkNQEwdHMN5acm2Q0qj9xHzcQjTpwb1T+d/5mUAk0q3+UqnmrViUXkYETZOwMXgs6QcXdqVwhje/QwaAAX9KFRWR8zP+J5VHtmFCGfKQRFT9cjhHnRiXO0px3QK1QFElAazV+HNQihNJgqOIh1C3G7hq5pb/i7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(39860400002)(136003)(366004)(346002)(376002)(396003)(451199015)(4326008)(5660300002)(44832011)(66476007)(66556008)(41300700001)(66946007)(8676002)(316002)(6486002)(478600001)(6506007)(53546011)(26005)(6512007)(9686003)(186003)(2906002)(8936002)(83380400001)(82960400001)(33716001)(38100700002)(6666004)(450100002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWgwd0t5bGFVMjY2U1pLQUdQNVBYWXQyaWloYjR4TWJKSUZBajhHYXYyUEhP?=
 =?utf-8?B?eFJVQ0dKWG1uQm4yUFVMbFhaQzRaWEdkOHh0V1M1Tkdmd0RPNENrSHZTUEh3?=
 =?utf-8?B?OFhlcFoxN1dPNXM3V2JFYXFhZjZnZHlmWTlCNDB0WndGZ1lPc0ZlcjRRUC9O?=
 =?utf-8?B?QWROUXk4eVdwd3RXMTZqTE90QkJ0VEFDYUFqdlBjZ0tUTkhHSUZIZEpwNlVk?=
 =?utf-8?B?UFRpSGVDMmZDZi83Z0FMSUZmb05mMHRoeHFSeEpveVJQc3VGUkVYYUE1N05U?=
 =?utf-8?B?Mm4vOUFwaEJpbys2eWp4WGJWUkR4aEdjMmdxNURaUTF2TUQvVExmckRMdlZF?=
 =?utf-8?B?aXUvSXNuQjdPa3lMRE5TUk95aDZoSWkwL1p1VzNUM1l4UUpvenR1b2tRYzZj?=
 =?utf-8?B?NW1sZDE2dGlCVnFNQUZicDRmSmhOcXIrNXdrNXlXZ3l0Rnd0VmNLajZST09S?=
 =?utf-8?B?WjFtS2UxZU1CS1U1RFcvQUlVSUkxL05FWm41c1NCUlN4Q0JHR1A0SmFpQ3ps?=
 =?utf-8?B?ZVVnRytjZXVLcDlYMzV4cWdrTXg2dnlhVmFOajJpUWcyRVVxVGxJb3ZuNDhB?=
 =?utf-8?B?aVV3SmVIM0Jrb0RmNklxUHdzWHBVN3pvYzNPZWdNOFRzdWFsM0xhUHNwSDlC?=
 =?utf-8?B?VzFVVGNDZDd5RHRTTzgwaDZLNG1SclBlR09ZVlBTUFFaaXZxR3Myamo5Tlkx?=
 =?utf-8?B?bWlOd0dsVitkZGg4ak5SSjl2Qm1RbGFER0twQTV3VTRaK3pFYm5hc1dsMUcz?=
 =?utf-8?B?S3hoYm5NbGM4dGtTSkNYZDVsS2E3Q0wrYXBWOXJVZU1vYlJzWUZtRnFab2Jj?=
 =?utf-8?B?akZLc1ZNanRoajJBQ0hkUGZJREhHZ2NLTDNCTFlISE9IY2ZNV0N1TS9GUm5K?=
 =?utf-8?B?R3Z0L0FJejNENzBWWW1pL2k1NFkwSTdZb3hUTk5VdndpeG1JRHlUamc4Q1hN?=
 =?utf-8?B?SHRyZVNIQ2cxazdCR20zYURKL2ZkUVpCdlN2cmxKTXQ3emdFUkNEZCszd2JN?=
 =?utf-8?B?WDVOTFRmSWNVbnpNZ3NJeWJ1aklodGhoclBaZHZIOXFidTZUQlFtTUhnQ0o1?=
 =?utf-8?B?WUp3Skg1VmdxaEl1c0F0Y3lhODRRU1hySk5EWlM2cHBmYjRJd2NIMllvdExZ?=
 =?utf-8?B?ZXFQMmpyeDlJa3FyekFKWXlTaTNPRkp4UXJWWUtyRnJKbEJMMUJKd3ZlcmVI?=
 =?utf-8?B?R0ZXSmZMTUNGa0R1UklUZnorVktVVGRzYVJIejg5M3pRclRibEo4WC9hTjVQ?=
 =?utf-8?B?eTlvY0U5OG1ZZUxZZjllY25BR256Y3p0RGpQNUpZMFNrbnZXOUEwM0VuS2Nt?=
 =?utf-8?B?SGl0eFp4bmR5VlNTSUx0VkNOelpUYVJ3ZmgvdXU4Y1hHZmE0SlVrRFc5N1pN?=
 =?utf-8?B?Mm1PWmtwdlI2em9mL05Mc0wvM2tURHFENGtWTDFNL0oweU9oZkZKYkJybk16?=
 =?utf-8?B?aTJXVnZJNXlySm9GTnRUSUhMM1VZZHRBWDJ4OWlEcmRwY2U3a3YwSHpWaGRX?=
 =?utf-8?B?cmpTc1p5NjQyL3BkWXpGUXJCaVZSTnltOVlUYmVuTHk1WjJuWE15aUdlTGlG?=
 =?utf-8?B?REdFY3VTUlpWeCtFdTlFMDlvSWZRWVIzdW9TbXA1NiswZDUvazJxd08rZW1m?=
 =?utf-8?B?bjQ3YmdtUXVwRjdnZkNROU83TkIyNnpxMVN0MjQ4UUN5dGVRdEd4NXZ5MDRE?=
 =?utf-8?B?Q0RHT0hUQWZSalFIMmh5SVF6WUxJN3pRVFJ0d2V6YkVKeFNucC9IbDJrRnZz?=
 =?utf-8?B?VTQvZlpQWEtCTElmVlV6azlwTTJHNzVHNCtBMEtRVlVNdzd6TFo2Tk5Ya0RL?=
 =?utf-8?B?MEt5RWFCNzJWcFhJeTd4VzBlUE9IZk5yZFJPME8xOWZmZU9NTG5RZXFCNGl1?=
 =?utf-8?B?cEFiNmZrbmZVcGRJWG9MK3JjbExpc1NReko4Ni9pMFhKa3BpdzIxZExFTm95?=
 =?utf-8?B?d1dMY2I1dmZJS3Z3dVdIdHUweHgxS0ZaZVpsVlFmNmZpRFJUajI1TUZITis1?=
 =?utf-8?B?Szc3cHp0VUlyaXFTc1J4NjR6a09SY0ZoTS9tbWpuajM3dGFBU3ZCQ1BHQ25j?=
 =?utf-8?B?aWo2ODdwQnRCbnNFaE5lSDlQdWJwWDBoWVk2L1NqNzNZMFE3VXJUYW1PeFZq?=
 =?utf-8?B?aytkRWI5MUw5M0o5NkJVNmU0MlNELzhjL01BaUMvUEYyd3gvUHBpRGNnSUNw?=
 =?utf-8?Q?FRgYVs/Xp+L9+8ARPHX9EB4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 312f3bdf-d2a7-4c40-39f4-08dab06044e7
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 16:54:34.6793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /JA16YCyFuhW/YCLlQCIYwiir9Di7zc31LwisLhB+Gj+DhnLpM2mD+YaFXGbERRny74ite8K4OacQchA2imZYGQwYexZeoz9ePEwwThf71nt8GH8owUu0iSCxYunHYe7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7350
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

On 14.10.2022 16:02, Matt Roper wrote:
> MCR registers can be placed on the GuC's save/restore list, but at the
> moment they are always handled in a multicast manner (i.e., the GuC
> reads one instance to save the value and then does a multicast write to
> restore that single value to all instances).  In the future the GuC will
> probably give us an alternate interface to do unicast per-instance
> save/restore operations, so we should be very clear about which
> registers on the list are MCR registers (and in the future which
> save/restore behavior we want for them).
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 55 +++++++++++++---------
>  1 file changed, 34 insertions(+), 21 deletions(-)

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> index cc357fa0c270..de923fb82301 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> @@ -278,24 +278,16 @@ __mmio_reg_add(struct temp_regset *regset, struct guc_mmio_reg *reg)
>  	return slot;
>  }
>  
> -#define GUC_REGSET_STEERING(group, instance) ( \
> -	FIELD_PREP(GUC_REGSET_STEERING_GROUP, (group)) | \
> -	FIELD_PREP(GUC_REGSET_STEERING_INSTANCE, (instance)) | \
> -	GUC_REGSET_NEEDS_STEERING \
> -)
> -
>  static long __must_check guc_mmio_reg_add(struct intel_gt *gt,
>  					  struct temp_regset *regset,
> -					  i915_reg_t reg, u32 flags)
> +					  u32 offset, u32 flags)
>  {
>  	u32 count = regset->storage_used - (regset->registers - regset->storage);
> -	u32 offset = i915_mmio_reg_offset(reg);
>  	struct guc_mmio_reg entry = {
>  		.offset = offset,
>  		.flags = flags,
>  	};
>  	struct guc_mmio_reg *slot;
> -	u8 group, inst;
>  
>  	/*
>  	 * The mmio list is built using separate lists within the driver.
> @@ -307,17 +299,6 @@ static long __must_check guc_mmio_reg_add(struct intel_gt *gt,
>  		    sizeof(entry), guc_mmio_reg_cmp))
>  		return 0;
>  
> -	/*
> -	 * The GuC doesn't have a default steering, so we need to explicitly
> -	 * steer all registers that need steering. However, we do not keep track
> -	 * of all the steering ranges, only of those that have a chance of using
> -	 * a non-default steering from the i915 pov. Instead of adding such
> -	 * tracking, it is easier to just program the default steering for all
> -	 * regs that don't need a non-default one.
> -	 */
> -	intel_gt_mcr_get_nonterminated_steering(gt, reg, &group, &inst);
> -	entry.flags |= GUC_REGSET_STEERING(group, inst);
> -
>  	slot = __mmio_reg_add(regset, &entry);
>  	if (IS_ERR(slot))
>  		return PTR_ERR(slot);
> @@ -335,6 +316,38 @@ static long __must_check guc_mmio_reg_add(struct intel_gt *gt,
>  
>  #define GUC_MMIO_REG_ADD(gt, regset, reg, masked) \
>  	guc_mmio_reg_add(gt, \
> +			 regset, \
> +			 i915_mmio_reg_offset(reg), \
> +			 (masked) ? GUC_REGSET_MASKED : 0)
> +
> +#define GUC_REGSET_STEERING(group, instance) ( \
> +	FIELD_PREP(GUC_REGSET_STEERING_GROUP, (group)) | \
> +	FIELD_PREP(GUC_REGSET_STEERING_INSTANCE, (instance)) | \
> +	GUC_REGSET_NEEDS_STEERING \
> +)
> +
> +static long __must_check guc_mcr_reg_add(struct intel_gt *gt,
> +					 struct temp_regset *regset,
> +					 i915_reg_t reg, u32 flags)
> +{
> +	u8 group, inst;
> +
> +	/*
> +	 * The GuC doesn't have a default steering, so we need to explicitly
> +	 * steer all registers that need steering. However, we do not keep track
> +	 * of all the steering ranges, only of those that have a chance of using
> +	 * a non-default steering from the i915 pov. Instead of adding such
> +	 * tracking, it is easier to just program the default steering for all
> +	 * regs that don't need a non-default one.
> +	 */
> +	intel_gt_mcr_get_nonterminated_steering(gt, reg, &group, &inst);
> +	flags |= GUC_REGSET_STEERING(group, inst);
> +
> +	return guc_mmio_reg_add(gt, regset, i915_mmio_reg_offset(reg), flags);
> +}
> +
> +#define GUC_MCR_REG_ADD(gt, regset, reg, masked) \
> +	guc_mcr_reg_add(gt, \
>  			 regset, \
>  			 (reg), \
>  			 (masked) ? GUC_REGSET_MASKED : 0)
> @@ -375,7 +388,7 @@ static int guc_mmio_regset_init(struct temp_regset *regset,
>  	/* add in local MOCS registers */
>  	for (i = 0; i < LNCFCMOCS_REG_COUNT; i++)
>  		if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 50))
> -			ret |= GUC_MMIO_REG_ADD(gt, regset, XEHP_LNCFCMOCS(i), false);
> +			ret |= GUC_MCR_REG_ADD(gt, regset, XEHP_LNCFCMOCS(i), false);
>  		else
>  			ret |= GUC_MMIO_REG_ADD(gt, regset, GEN9_LNCFCMOCS(i), false);
>  
> -- 
> 2.37.3
> 

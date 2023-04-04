Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5796D599E
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 09:29:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C7E10E10D;
	Tue,  4 Apr 2023 07:29:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF85710E5ED;
 Tue,  4 Apr 2023 07:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680593372; x=1712129372;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QX2C27Mz4duEURYVT2sNhpbZl3HmuXEYGV8GGkYWybQ=;
 b=SW2nSwp+DFqCuOCSY1eRHNbs9d1/BA7VXETqtnsSnoCWCNmWei8ejrlW
 VzDDmcnKwKCP38YE+gPGk0pT44XQ7G/hH85VZboNs/qsZbzpuStAQRlwo
 vqVGUv05pwKrqMaE6UfZlKLWCeb3iSzt9nO4QOu8kkH+TIT4noETUj+gP
 /3cJhbm7zPPMTFrXE1i1Gh3D7dT96NZA8xRkXqbdDQxkJpe/zUrtfQTsD
 7pLybLlC/8iM7IndCN/crPAOmAOKba2RH7ZidTBielvmxEoYvXB7Xp/rm
 8u9XU/Sis/+7BjzolHJnHI7U4kvnArSIxhvs+0OFnUjeO9CDEOGFy5x7k Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="339600338"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; d="scan'208";a="339600338"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 00:29:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="829877810"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; d="scan'208";a="829877810"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 04 Apr 2023 00:29:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Apr 2023 00:29:31 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 4 Apr 2023 00:29:31 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 4 Apr 2023 00:29:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dgy8wXTCXxQHbMjy37DaidNKJHWLUNdsVmfSPWpKLS9OSuuDXfLQBqS3uwXo0B05aYor5eV9cV1iHHDJV/BfxVgQFpIQx2lRPQwWBL1fSolIVSC+0seXIWSEsH2YR/ZyYPQ4u8IjqKIyZtgIR6SC6G4JfFJXIL+nZ5VowOxdP1v3x/gkS2oXM+9eV05Xx1GNvO62ipdLgjkgyx2iQX+dtkcngcMCr8N/hAAXoXEBhc0ifQXaL7qHeQOncOPmHTh6q7+0x27Z02wPHNZH5yzOmKoyXyB8neBeEnRfSj34/LqTd8j8+yhNw9Y3afDOonlgXtsXiAB2XMHe2BliUSp8bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A5fqNlq6wQvmaO8v8pjAznrBgWxLkIPQvRAIaD1fy+k=;
 b=PK2nMbLs3vzbweQI1ViGo3oQwHLdTO8FK2GRdCmadJkOKy3P1Rcct4gW1qGvscjKFnGQrZV4izboun5o19gJdFUDEd1PQZeNigMGAnerHeUR5G6dvqDGWbkgOMYmNM1ncDvVKlbmUSR49hyyDnPWTeFE5ryIYOnzcJrU5CrSzssB85YQlJdpfQObjxTyc/BUtL22Bvpczkna7dVU3jpaAs29tM5frxMP440pJbtFe3SBTvHBPcXyRz9BqcFOYNiTHftC8T9tYIWUHEuFW7mYiGzJ8Pdlj14TpHzgZqC38HDOOgCVXIX+Emkb3NgjA9QWYlsAjJpe6YmoqdgkmF6Q4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by SA1PR11MB6823.namprd11.prod.outlook.com (2603:10b6:806:2b0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Tue, 4 Apr
 2023 07:29:24 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::a6ec:a0c7:4dde:aa7f]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::a6ec:a0c7:4dde:aa7f%8]) with mapi id 15.20.6254.033; Tue, 4 Apr 2023
 07:29:24 +0000
Message-ID: <7aa541f8-55e3-a182-5390-6ca161edb70b@intel.com>
Date: Tue, 4 Apr 2023 10:29:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [Intel-gfx] [PATCH 7/7] drm/i915: Allow user to set cache at BO
 creation
To: <fei.yang@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20230401063830.438127-1-fei.yang@intel.com>
 <20230401063830.438127-8-fei.yang@intel.com>
Content-Language: en-US
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20230401063830.438127-8-fei.yang@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0062.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::20) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|SA1PR11MB6823:EE_
X-MS-Office365-Filtering-Correlation-Id: b328302d-66ad-44f9-85d3-08db34de5062
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UlBzfZv0gqvaNIGgP+fU8ZYUGhLVDlznCtz8PaFQWADRVNN+FhuE7LwwD435PYG9dwTBUKPgz5OnWMP1AqQ24sjE2MH1jWtV1F3CZMoDOmxTsKf3FSFg+e4uYY/WNnwuxU9Ghi5pxnoA61kUWaKSCDPZU8i0yg/VhGFSaKitIck52uVnuIvHxTKGF3kMeJfMPkhL+V5971NenZt/KRpVNvaGIiUw1C9gSIB+KZAXqpuXy2Li2ID0KRsRR8sHeNlpAfCJrGul1koY6VQuE9fKne1P8lJKCX39NyLVTp8vGd08sukLJhLgb3Dp0qZp6LKLKpynQpTHk0fRoSuVUiftU8ATymAn7v69sqmZP/6BHsED+tVPJPz1SSNcudFrkoQ+8GxudEodOP8QXW4hSJ2MVIiDaVYfrqlpqQelfBj8/atXnggRCLu6CTMcpxDGFt1RfGm3B8bI+Kyi83e29hnjlVX7/8wOjSBdjzJ1t+qygeyrxxjV0tQHhx+zD441EF4qzg42U+W6mtEondviRrPC9BFQDoiGxzo/vLG9hyuB54k/yZEeBnIFcfhYemiBk59U9WpYCCpaAYF/PTfqFfh9Yolw3Pp1Iy1IATT5xSqouHIBq2q1Gat7ifEFxn1SN150yrRa1H5+5eJcioPr90Mueg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(376002)(136003)(346002)(396003)(451199021)(66476007)(2906002)(66946007)(31686004)(31696002)(2616005)(86362001)(8676002)(8936002)(41300700001)(5660300002)(36756003)(4326008)(478600001)(54906003)(316002)(66556008)(6486002)(6512007)(6506007)(38100700002)(186003)(53546011)(26005)(82960400001)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TU51YXBrUndwK2s3WUk4cEVoejNuMThhTjBtWmtCQ0xzZFZZVDM5a2t6SUxa?=
 =?utf-8?B?dit4elFTWkhjUDdCNmJUckFISFJYZWpIazN4bVNtOGhkSk9Jamc0NkpSbmRu?=
 =?utf-8?B?dFpYSmcwakVlMVltNW55MG5UbDVYNXdDSlRvbTl5SzRUUlloRjRocnJuTVpi?=
 =?utf-8?B?ei9kWTcvQmpLOVYwbG9KNngwbzA1a21mKzdPOWxrREpoV1k4ZkR1OTRPUGpy?=
 =?utf-8?B?elV0a2RteExoSDF0dUhPN0tDZGxiTk5vbXZaWTVtSlFXMlJnaFh1U3V4Mzk1?=
 =?utf-8?B?SGI1WERTRWVhNzlBVXFHSjZHZVh3M2hxQXRhaEtpT0NUSDkyYWh5Y0xHTVIw?=
 =?utf-8?B?WDVsdkpsQityNzhJUHBHZXZuekFOM3VRRXFOWVZNR3ArSTZMTlE5YzhOc2M1?=
 =?utf-8?B?S3N6VFVWSncxS29vVG9QVGY4dWNycEk0MGxSTnd5K0xmVVVQNWJRZThXYTRM?=
 =?utf-8?B?OVBpbDFtUjB1RWQ1SGhUaWxHSXFRbUJ4U2FpYUY0anFRenpwR1BHbkxkK2Zq?=
 =?utf-8?B?djNSV3hPVTcrMTJLdFBLOFRkMVVBVW5RQjhMRStDTGZ4OUhNSzhyU0wzTFYy?=
 =?utf-8?B?OWdpbWkwd2Q1S2k1RkFjUVNxanlPZlFXTWFBdGlBMHVrMGQ5czhSUXY4cXkv?=
 =?utf-8?B?T2ZSdmtreXdVWGJoNmdENG8yV1dISlJQbHd5dHdUV2luZnFmKy9qT09HVER2?=
 =?utf-8?B?cENsaUtya0UybG5WU1JqZUQybldUWm9hcG5tNWZqb2h5VnZuR2NCaGUwR0F6?=
 =?utf-8?B?MnVxeTI5Z1AzNUxTWFE5U2tGZTEvUnRiUUwyU2Q1dTBTTXczRlNGZUtnMUsv?=
 =?utf-8?B?VUg2NktxcDJOTExqbFBNS0ROeUIvZk9RdTd4K21nSCtydWNKczVGa1FRNEhk?=
 =?utf-8?B?Siticzh0LzVGZ2szWm1od0ltU0NENEhQbkNtNXM1RWtMRGdUWmlmL3hRNGZQ?=
 =?utf-8?B?TS9kTDZXVHJsMmt5alIvVStDNzZPaE1yYzhIZ1FSQzA1MjU4Um5zQUtYS0Vu?=
 =?utf-8?B?aVgxTllVcWEzLzBxdWxzam41T2NFY0YrbVFQYTdyb0I3N3pMR1VsRU5QVzBr?=
 =?utf-8?B?dnp5OVJRZ05QRXZWL1Fib1luK29GS2lMNXRBTGdFWm9JaEhUUVl4UEgwaFRW?=
 =?utf-8?B?SkhOdXBGZ0o3dGgwWTZ4MkpQbGQ4WW1uT1c2d1h3UEo0cGdIaEFoc0VsYkc1?=
 =?utf-8?B?VVpxdHEzczZlMzhuVTdvd0Niajc5ZVBFeXpRZ3VialVIcmpTcm92K2w0WG1Z?=
 =?utf-8?B?UDhkYmVScmlqZHhtZjFqZ1pnM09kYXZWQjZ6cEUwd1g0cm5xUTFRVEN6SFFW?=
 =?utf-8?B?c2NoNTBSNEYyMkQwM0E4K2RWeE5ZTG5QM1RER1NLTUgxSzFBU29yMFM0NThl?=
 =?utf-8?B?cVQ4TllXS2h2OEdUOS9HVEVzM2x3d1k1TnpoRGlmNkRTUGNCV1MzVmhnc2lH?=
 =?utf-8?B?eW94cmxpc3ZjM1JQOFRYbGwzYkdtU2dRQnBOcTB5Und5T2dhRHloSzgwRUxK?=
 =?utf-8?B?R0MyT25YNzRrQjJhMVBzdlpnUWFEVW9OYnhVaG5WRDB6UjBWMjRUU0lIVnFI?=
 =?utf-8?B?M3RIREJEUnVRV0p4SFlqNGdhQmx1VDdzSy9XR3NYbkMzOVUrOGNDRDhZR2dF?=
 =?utf-8?B?anR1WVpCRHk1dE1aZ1FUSzlib09ORjI3a2dQb0lYZVBaUWZ4dzBMTjZ3Skor?=
 =?utf-8?B?UEsxQmIzbzhzZEhVQjdiSzRqazAybGYrTFVoWHZqM1BkTW8zYytCRnVVZkFM?=
 =?utf-8?B?dFdtZzRSTVJlWENjbVVETTNxUVgzZENhL0d4ZEZCZWw5b0dkQ1R2SWJ1QkFx?=
 =?utf-8?B?K1NmRURIYXB3K0YraGg4VGd2Q256RWFpOUdGREw2QnhUL2JsbU9wUVVsQXpW?=
 =?utf-8?B?Zm1Ya3JEYWw2eXIyek1KdlFPczZlaGRJL1ErNkRvRSt5YTZwWWRkMEFuWnBi?=
 =?utf-8?B?WmtkK3k4aEt5YnZYeTJiazBZRFB3WXZyc0hyTnpkYUpBVTZ0TUFzVGJhZjlx?=
 =?utf-8?B?d2xPQytQTlBoaHJxLzlzN3RPY1p0NTcyK2dzUWg1UXRYZFFvTEZXTmZ2WEdI?=
 =?utf-8?B?ZnRaWG1KSWo2RjBoUHg1NWQ0N3gxUVRaWWRIVDQ4U1l2dFA3eG4wRzVndW5I?=
 =?utf-8?B?eU4vQmlrOUZyR2lQS3ZjSFVYY1YyRnZ0ZjR2WWNYMUxocjQyUGRxcndFbE0x?=
 =?utf-8?B?L0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b328302d-66ad-44f9-85d3-08db34de5062
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 07:29:24.1043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KsocfED/LjLpTcpxuC6iVWhvGw7OcEC8mIU1xc3qiCqdhUYSZZMISr9Lm1Tj3bWEoMEuHK7S88il0aPkQYlIqpd7uSCeIPuhTBgp6ymI1zw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6823
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
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/04/2023 09:38, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
>
> To comply with the design that buffer objects shall have immutable
> cache setting through out its life cycle, {set, get}_caching ioctl's
> are no longer supported from MTL onward. With that change caching
> policy can only be set at object creation time. The current code
> applies a default (platform dependent) cache setting for all objects.
> However this is not optimal for performance tuning. The patch extends
> the existing gem_create uAPI to let user set PAT index for the object
> at creation time.
> The new extension is platform independent, so UMD's can switch to using
> this extension for older platforms as well, while {set, get}_caching are
> still supported on these legacy paltforms for compatibility reason.
>
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>


Just like the protected content uAPI, there is no way for userspace to 
tell this feature is available other than trying using it.

Given the issues with protected content, is it not thing we could want 
to add?


Thanks,


-Lionel


> ---
>   drivers/gpu/drm/i915/gem/i915_gem_create.c | 33 ++++++++++++++++++++
>   include/uapi/drm/i915_drm.h                | 36 ++++++++++++++++++++++
>   tools/include/uapi/drm/i915_drm.h          | 36 ++++++++++++++++++++++
>   3 files changed, 105 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> index e76c9703680e..1c6e2034d28e 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> @@ -244,6 +244,7 @@ struct create_ext {
>   	unsigned int n_placements;
>   	unsigned int placement_mask;
>   	unsigned long flags;
> +	unsigned int pat_index;
>   };
>   
>   static void repr_placements(char *buf, size_t size,
> @@ -393,11 +394,39 @@ static int ext_set_protected(struct i915_user_extension __user *base, void *data
>   	return 0;
>   }
>   
> +static int ext_set_pat(struct i915_user_extension __user *base, void *data)
> +{
> +	struct create_ext *ext_data = data;
> +	struct drm_i915_private *i915 = ext_data->i915;
> +	struct drm_i915_gem_create_ext_set_pat ext;
> +	unsigned int max_pat_index;
> +
> +	BUILD_BUG_ON(sizeof(struct drm_i915_gem_create_ext_set_pat) !=
> +		     offsetofend(struct drm_i915_gem_create_ext_set_pat, rsvd));
> +
> +	if (copy_from_user(&ext, base, sizeof(ext)))
> +		return -EFAULT;
> +
> +	max_pat_index = INTEL_INFO(i915)->max_pat_index;
> +
> +	if (ext.pat_index > max_pat_index) {
> +		drm_dbg(&i915->drm, "PAT index is invalid: %u\n",
> +			ext.pat_index);
> +		return -EINVAL;
> +	}
> +
> +	ext_data->pat_index = ext.pat_index;
> +
> +	return 0;
> +}
> +
>   static const i915_user_extension_fn create_extensions[] = {
>   	[I915_GEM_CREATE_EXT_MEMORY_REGIONS] = ext_set_placements,
>   	[I915_GEM_CREATE_EXT_PROTECTED_CONTENT] = ext_set_protected,
> +	[I915_GEM_CREATE_EXT_SET_PAT] = ext_set_pat,
>   };
>   
> +#define PAT_INDEX_NOT_SET	0xffff
>   /**
>    * Creates a new mm object and returns a handle to it.
>    * @dev: drm device pointer
> @@ -417,6 +446,7 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
>   	if (args->flags & ~I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS)
>   		return -EINVAL;
>   
> +	ext_data.pat_index = PAT_INDEX_NOT_SET;
>   	ret = i915_user_extensions(u64_to_user_ptr(args->extensions),
>   				   create_extensions,
>   				   ARRAY_SIZE(create_extensions),
> @@ -453,5 +483,8 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
>   	if (IS_ERR(obj))
>   		return PTR_ERR(obj);
>   
> +	if (ext_data.pat_index != PAT_INDEX_NOT_SET)
> +		i915_gem_object_set_pat_index(obj, ext_data.pat_index);
> +
>   	return i915_gem_publish(obj, file, &args->size, &args->handle);
>   }
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index dba7c5a5b25e..03c5c314846e 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -3630,9 +3630,13 @@ struct drm_i915_gem_create_ext {
>   	 *
>   	 * For I915_GEM_CREATE_EXT_PROTECTED_CONTENT usage see
>   	 * struct drm_i915_gem_create_ext_protected_content.
> +	 *
> +	 * For I915_GEM_CREATE_EXT_SET_PAT usage see
> +	 * struct drm_i915_gem_create_ext_set_pat.
>   	 */
>   #define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
>   #define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1
> +#define I915_GEM_CREATE_EXT_SET_PAT 2
>   	__u64 extensions;
>   };
>   
> @@ -3747,6 +3751,38 @@ struct drm_i915_gem_create_ext_protected_content {
>   	__u32 flags;
>   };
>   
> +/**
> + * struct drm_i915_gem_create_ext_set_pat - The
> + * I915_GEM_CREATE_EXT_SET_PAT extension.
> + *
> + * If this extension is provided, the specified caching policy (PAT index) is
> + * applied to the buffer object.
> + *
> + * Below is an example on how to create an object with specific caching policy:
> + *
> + * .. code-block:: C
> + *
> + *      struct drm_i915_gem_create_ext_set_pat set_pat_ext = {
> + *              .base = { .name = I915_GEM_CREATE_EXT_SET_PAT },
> + *              .pat_index = 0,
> + *      };
> + *      struct drm_i915_gem_create_ext create_ext = {
> + *              .size = PAGE_SIZE,
> + *              .extensions = (uintptr_t)&set_pat_ext,
> + *      };
> + *
> + *      int err = ioctl(fd, DRM_IOCTL_I915_GEM_CREATE_EXT, &create_ext);
> + *      if (err) ...
> + */
> +struct drm_i915_gem_create_ext_set_pat {
> +	/** @base: Extension link. See struct i915_user_extension. */
> +	struct i915_user_extension base;
> +	/** @pat_index: PAT index to be set */
> +	__u32 pat_index;
> +	/** @rsvd: reserved for future use */
> +	__u32 rsvd;
> +};
> +
>   /* ID of the protected content session managed by i915 when PXP is active */
>   #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
>   
> diff --git a/tools/include/uapi/drm/i915_drm.h b/tools/include/uapi/drm/i915_drm.h
> index 8df261c5ab9b..8cdcdb5fac26 100644
> --- a/tools/include/uapi/drm/i915_drm.h
> +++ b/tools/include/uapi/drm/i915_drm.h
> @@ -3607,9 +3607,13 @@ struct drm_i915_gem_create_ext {
>   	 *
>   	 * For I915_GEM_CREATE_EXT_PROTECTED_CONTENT usage see
>   	 * struct drm_i915_gem_create_ext_protected_content.
> +	 *
> +	 * For I915_GEM_CREATE_EXT_SET_PAT usage see
> +	 * struct drm_i915_gem_create_ext_set_pat.
>   	 */
>   #define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
>   #define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1
> +#define I915_GEM_CREATE_EXT_SET_PAT 2
>   	__u64 extensions;
>   };
>   
> @@ -3724,6 +3728,38 @@ struct drm_i915_gem_create_ext_protected_content {
>   	__u32 flags;
>   };
>   
> +/**
> + * struct drm_i915_gem_create_ext_set_pat - The
> + * I915_GEM_CREATE_EXT_SET_PAT extension.
> + *
> + * If this extension is provided, the specified caching policy (PAT index) is
> + * applied to the buffer object.
> + *
> + * Below is an example on how to create an object with specific caching policy:
> + *
> + * .. code-block:: C
> + *
> + *      struct drm_i915_gem_create_ext_set_pat set_pat_ext = {
> + *              .base = { .name = I915_GEM_CREATE_EXT_SET_PAT },
> + *              .pat_index = 0,
> + *      };
> + *      struct drm_i915_gem_create_ext create_ext = {
> + *              .size = PAGE_SIZE,
> + *              .extensions = (uintptr_t)&set_pat_ext,
> + *      };
> + *
> + *      int err = ioctl(fd, DRM_IOCTL_I915_GEM_CREATE_EXT, &create_ext);
> + *      if (err) ...
> + */
> +struct drm_i915_gem_create_ext_set_pat {
> +	/** @base: Extension link. See struct i915_user_extension. */
> +	struct i915_user_extension base;
> +	/** @pat_index: PAT index to be set */
> +	__u32 pat_index;
> +	/** @rsvd: reserved for future use */
> +	__u32 rsvd;
> +};
> +
>   /* ID of the protected content session managed by i915 when PXP is active */
>   #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
>   



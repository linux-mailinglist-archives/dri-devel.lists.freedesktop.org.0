Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 979DC618826
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 20:03:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BDB310E7CB;
	Thu,  3 Nov 2022 19:03:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F300D10E7CB;
 Thu,  3 Nov 2022 19:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667502198; x=1699038198;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UAqMzjpJ1fq6BI76lLRYm2TewGvcwaoTX6RQNMm2gfY=;
 b=oHza+CLyPmD11e+DxyD6cVnS568VjoqdhODoZ6grYAeQqHtj6pDtl7N2
 /f1B79WM3rvqncPVZfZ3kG2QUaqWgRlvGndZPZM9ykuPvx6N35+zJcx/0
 y/bGKjHz1UrBX+6a1qErn4WLTg0Z/wQc4+p2ZQCN2kfRzCrTHfK6mxozZ
 fZc52uGf9gdB6HnGx+i7Uo6McNmWvsMCu1ebhtczJsyZ6B8LAfj7uTNDY
 YRpdstghYn5ZTc5g721m5XzW9dhkD5pf14A8/E4uSW5tXzazwRNhNMcEc
 leB61pZqvDMlLMvc+Li6DTqDF+ui21yDM8kNj6w2GDU/D6L49bjBHhWsa g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="396081288"
X-IronPort-AV: E=Sophos;i="5.96,135,1665471600"; d="scan'208";a="396081288"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2022 12:03:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="634786449"
X-IronPort-AV: E=Sophos;i="5.96,135,1665471600"; d="scan'208";a="634786449"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP; 03 Nov 2022 12:03:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 3 Nov 2022 12:03:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 3 Nov 2022 12:03:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 3 Nov 2022 12:03:16 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 3 Nov 2022 12:03:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WssugI5OYYV/+oT/CS4QL+p0HFpVfqbAJj/TCAf7HVRWpat4Ccb0aeRjNunFRxPs3Uo+XH3vjERIVAgt/gGZ7e/aSSJ7oLPWcSfznCmgd83NYlRpTYOnDvteyD7/GOHdhb/QGmE+b4BoQ+Z0JeCch7iY6veVqNwlBGEpS4g8WhlNZ/kEGBCk5gzK0dfrvJmHBRFt3suT1KH7Fty4s2xkEuu0i4c2+hx7yTmAQ+kP+s3b+IL7tH/yvbzf9qSZFh4rY9fdIDwZWeUXThRmw+3aWrYR1JTFij/j1fXC1E4M9JhtISVcwTHy77QZsLQapUcHhQBuI5EueMbkR9a7tlb85Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kkETv5CZsmAyDBlN3G69cOuxh7YuuPa62Biw+0XfxMw=;
 b=mORjuJIH+PHOFsa2qxypI3vEmYqEwtUiOaQOovMIFBB/sLm0XYUqbtn9+tfMHqjlEchMNVwR/nujHWv7UQLUK1Dq7UaS8aT7MCippnOniGd/lIijgODhSwFDEQQ3bkPVMYvzv6RLD+WKA6PdJdK3/+NbH0GZRF2qHzzm7fjYloPiKMggfzkEvMZMKBE19PC4vIzHwbpD3pbQ7hZRwt+CoDW7lXe8SrKuO3b/QPhyvQQRpo/FonNjnLSfmiiqz95BdNuGhRQZznW+aqJhSdC2nmG+C3p5853sQQxaza0UkoHTPSXpb19p7rUoSiP/E9tUFAczBePztKuBBso9Vk2IpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17)
 by SA2PR11MB5161.namprd11.prod.outlook.com (2603:10b6:806:fa::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 3 Nov
 2022 19:03:11 +0000
Received: from SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::5236:c530:cc10:68f]) by SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::5236:c530:cc10:68f%4]) with mapi id 15.20.5791.022; Thu, 3 Nov 2022
 19:03:11 +0000
Date: Thu, 3 Nov 2022 12:03:05 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Zhao Liu <zhao1.liu@linux.intel.com>
Subject: Re: [PATCH 7/9] drm/i915: Use memcpy_from_page() in
 gt/uc/intel_uc_fw.c
Message-ID: <Y2QQaYBD1ECJDoNP@iweiny-desk3>
References: <20221017093726.2070674-1-zhao1.liu@linux.intel.com>
 <20221017093726.2070674-8-zhao1.liu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221017093726.2070674-8-zhao1.liu@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0149.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::34) To SA1PR11MB6733.namprd11.prod.outlook.com
 (2603:10b6:806:25c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6733:EE_|SA2PR11MB5161:EE_
X-MS-Office365-Filtering-Correlation-Id: 653220bb-fff7-4bc4-c58a-08dabdce0d52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qI4nvovWialvDu+yQ2POU4cqc9Apn++7Qi/dIXjTRichKNatvZ5sedXDD4HO1sMOMefBIzYkueZ8Hh4rxuzlUUl7SA1d2yOZTuuBOg+RzpL79IK6cshq6ux9y0H3BzGZm4PbPbOdQGe0ZInx3hfeaQW6yE+E8pp3kffbv9rE11BdHbJGv5tjxnmA72x4GnaaZIvBW7/0QUqIrKBirS0d6YqHPbkD+rVLpE/6LOYhn2uy5bNCIZ2lysFYyNHzVAgkA8mAVZv+Wnv3VJKOLYj5mKKlfUi4A0MJVq9nfZZNA0yMB6qKqICDL5WbDkTGe6+5an5lRuM65lkC8aFYGCq8RusP5kfy73vY1jon6nWs6uOGPPZrRINJwZaHplw4qTBXgdnKLNuMi/bBOUmcrImZoOZpLj6RNVpoJXAjtNvdhLo62cUKojd5wGj4DFL63k2ZWLq5eDcc3IJel8sCvkJmCRxX1JcuoKYvTVGIIcQEyfKaIshVy/sS3/9iJo62Hk6c1nV78pMkZDydH5iF8EFKFkW0KiKYYBcpPYqc77ZSvRowkNrYYXKvEdWzoj1Za/uLdOapK9AjjnuY6x6Nfqe4gKXpdgqHe+JkZ9hXQ4LgC9+UGFIiai7LgE+zCecSpBc1IsjdVH4b/rISCkx6v67pMECoAEQ2qrtPyMmUQN6mQPVd5CxtlAKzkmrr1mSDJ5vV5uo90PbN5uQzNA7E5ddmEJon9qaGk4Y9Td0RHCjGx7c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(396003)(366004)(376002)(346002)(136003)(39860400002)(451199015)(2906002)(83380400001)(8676002)(41300700001)(66476007)(26005)(6512007)(66556008)(4326008)(9686003)(86362001)(33716001)(38100700002)(316002)(54906003)(82960400001)(186003)(5660300002)(6666004)(8936002)(66946007)(7416002)(6916009)(478600001)(966005)(6486002)(6506007)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?anm4px1RBaIZOoFHJgPyNySczHrBFwjB958AcT0XnW+OGymcbDh9/Zc8xTSe?=
 =?us-ascii?Q?n8ayRtoXt4dTTD2p4WHFGeCZOjxiXDwjAm9/s6WGv3TGDvvlGAk9RKVNTios?=
 =?us-ascii?Q?VjuDLVckRBC6O4/A2cuTWWJz5JWvjTXzbEKVXfGT9o4MoM799E6PB/Vdypi5?=
 =?us-ascii?Q?ZwsveD/4teX7qWUKsy2v4Tzo7YO0r9J9gF1BUozUyAbtBsrUUfJk0evZIuf2?=
 =?us-ascii?Q?8DpLL5OT2aZBUtvu15YXIz/X2rxJF4cNvJTdiUKudhUjUOeJeciruxanib+g?=
 =?us-ascii?Q?xEmc6TwLMRJldZzyVAn2qPTeRC5KBsBMSemQ4IeA+4xd6nm6pEBRyxnLIzcK?=
 =?us-ascii?Q?GS4o7uFxTJyfov6DE0/P8gRZ1jBf/ZCmRFqfZ5HvtJ3H2EFpaw64GigxuOly?=
 =?us-ascii?Q?NHHNQlI2Hw4xgUhHEQmPNDvhXp71qh+2VwnsiVzLej74JivyMWRQFMjHJpW9?=
 =?us-ascii?Q?s64936nL9whrhWy0Xv47pAL9dkVYeZgOdM/GBVk3tnFWMGCRsi3HlIIRpIYF?=
 =?us-ascii?Q?34YYI0xSsVZiIJZS4n19n9BH5WveYkxwcSIYdV9bp8rL85mCqwZzMM2yrJgv?=
 =?us-ascii?Q?vxBQrejtpmAZfcKL4WekUZiy1FaZ5O0t9i7eXTX7s9rUfD2yqppwN6LMFTSu?=
 =?us-ascii?Q?G0M1B1IZdzc2gf+SvmXj2W0mIxouIR/Z/5u7Lhs8rm6ZUUlqAAUPrlYS0azM?=
 =?us-ascii?Q?BbrEhnonkkUBhPzsX2yfwG38pEvLUAG+7JdVsp21YYEvfWSAFkWT4XfHua0Z?=
 =?us-ascii?Q?m3koe3IP6qTyC7TcNS/hlBpZXR3osMWDw8+/C9WaCEjIwf424++n9iSnDnOf?=
 =?us-ascii?Q?STzS/H7cX685SxgnvJJ3fKPGZyafy3zmC0c1hio1gG0t9SmWqaqoW7hYP4iZ?=
 =?us-ascii?Q?DXuXok4VAqUzSBFRBN1XUJCa6lBLiTJSgfqPlsckah1Jv3pxopW06dJo2R+U?=
 =?us-ascii?Q?a3cWN2e1dFVpJGUMGB+I2rErnSGm/Q446WA+Q0TVLn3CoB/zzif+i/IaVQz1?=
 =?us-ascii?Q?1LmTBusSXwXR8dPXk/EGBIiblXox6Fj6NSBg3zYkSppO/yrZMqe2E56tSda/?=
 =?us-ascii?Q?7TbiwYD55PRAq/6ERmRTvigmzfFCa4Lp1hZ+gNDQFO0GJ4OCq/zxOnWj8GNp?=
 =?us-ascii?Q?WTxNUJcAj7FQuemQ0A+DloefW0QWICSoXHfPYHlCsFmUChvX4ROdQ92J8Qra?=
 =?us-ascii?Q?rQz6PbCFkHEaUus9JIUSnAs3PHXOR2zYILV48UNzMs81/qZwy2yUDtaJvXqz?=
 =?us-ascii?Q?dRtk+TJLFmCYiRk8/FYFGBGEDZAnH8L3zo1tY4CKDSvbjycPzeqcoYQCg3OX?=
 =?us-ascii?Q?w/0nwJ14ECY2ZFKua0cDVGL0Mf3mq5y5YN73OGtbCbp0RfigKPCD/m6THZCy?=
 =?us-ascii?Q?i2qXzxzaaifduJ2kBF9IlkcQ/9kDJ2z7vVQTmS2RKsbTQQT7tVQO4FBchRTa?=
 =?us-ascii?Q?RKOhqd3dt+qQiwvO32nWx6nNg1GrYPAwKNMBk1hHX6aYd4gCqWYwmiDsxUCb?=
 =?us-ascii?Q?Icb8AuqgtB0K0azKy6Axts3yUVg26p7roR88IngKO2OkVi87MAw6Y6fDKoAq?=
 =?us-ascii?Q?wJ2PpuidH6KHqCs5e26HKzshZeMcHAmbjE6NvDL4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 653220bb-fff7-4bc4-c58a-08dabdce0d52
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 19:03:11.2505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nUm+gF1rcD+u3owDyr/gwbL4ozc0tNZNYXHkvgUfAxXHeGnph5Bytnjy4rClmsHFtt754zef0n+cLuJmrseGEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5161
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Zhenyu Wang <zhenyu.z.wang@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 "Fabio M .
 De Francesco" <fmdefrancesco@gmail.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Zhao Liu <zhao1.liu@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 17, 2022 at 05:37:23PM +0800, Zhao Liu wrote:
> From: Zhao Liu <zhao1.liu@intel.com>
> 
> The use of kmap_atomic() is being deprecated in favor of
> kmap_local_page()[1].
> 
> The main difference between atomic and local mappings is that local
> mappings doesn't disable page faults or preemption.
> 
> In drm/i915/gt/uc/intel_us_fw.c, the function intel_uc_fw_copy_rsa()
> just use the mapping to do memory copy so it doesn't need to disable
> pagefaults and preemption for mapping. Thus the local mapping without
> atomic context (not disable pagefaults / preemption) is enough.
> 
> Therefore, intel_uc_fw_copy_rsa() is a function where the use of
> memcpy_from_page() with kmap_local_page() in place of memcpy() with
> kmap_atomic() is correctly suited.
> 
> Convert the calls of memcpy() with kmap_atomic() / kunmap_atomic() to
> memcpy_from_page() which uses local mapping to copy.
> 
> [1]: https://lore.kernel.org/all/20220813220034.806698-1-ira.weiny@intel.com/T/#u
> 
> Suggested-by: Ira Weiny <ira.weiny@intel.com>

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

> Suggested-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
> Suggested by credits:
>   Ira: Referred to his task document and suggestions about using
>        memcpy_from_page() directly.
>   Fabio: Referred to his boiler plate commit message.
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index b91ad4aede1f..64d56f175d32 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -962,16 +962,13 @@ size_t intel_uc_fw_copy_rsa(struct intel_uc_fw *uc_fw, void *dst, u32 max_len)
>  
>  		for_each_sgt_page(page, iter, uc_fw->obj->mm.pages) {
>  			u32 len = min_t(u32, size, PAGE_SIZE - offset);
> -			void *vaddr;
>  
>  			if (idx > 0) {
>  				idx--;
>  				continue;
>  			}
>  
> -			vaddr = kmap_atomic(page);
> -			memcpy(dst, vaddr + offset, len);
> -			kunmap_atomic(vaddr);
> +			memcpy_from_page(dst, page, offset, len);
>  
>  			offset = 0;
>  			dst += len;
> -- 
> 2.34.1
> 

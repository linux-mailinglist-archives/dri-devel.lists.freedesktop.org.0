Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CFB4E3FD5
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 14:51:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 043F410E714;
	Tue, 22 Mar 2022 13:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 364E610E711;
 Tue, 22 Mar 2022 13:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647957107; x=1679493107;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=mXQ/KpGTOk/hXi48v2R7/MiLwSHyIPNgXOA6Vg/PBZk=;
 b=dS5auQG8qOXW88AGlXC3our293TUIfs6czskYbHY9Z/dFJy1Cy6oajzM
 Oiq/3umAUGxkldwDPRRunyg71S/ggrlrmFY5g9+cm5Pi9lyMRj1QWr27x
 IR1NPmOwHvHcQoPvLnhzz+j3ZGifFyQLkeJXgBIqGdZazgry+qnPDXb3m
 GTHKYtNcOtZz5O/M+8nvCQln3RuR3rwcxuoefP5dNXahH4Gg3aUmcvhmI
 MllkyCJSB+WqsuotTCJVe2c8y69NEhCqEWJaAxqLjBOSIqRxNO/nc+5l5
 Gi+OeJyMEZippbZnUOfIS1/Rq//IO5UmJig0LFD8GleVnQ/0WCb7WZEJU w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="238425423"
X-IronPort-AV: E=Sophos;i="5.90,201,1643702400"; d="scan'208";a="238425423"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 06:51:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,201,1643702400"; d="scan'208";a="543696037"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga007.jf.intel.com with ESMTP; 22 Mar 2022 06:51:46 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 22 Mar 2022 06:51:45 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 22 Mar 2022 06:51:45 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Tue, 22 Mar 2022 06:51:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ULozAMEnFWuEJbzvye9ODyxeOrAa5W0v222L+u3zBBokyso/sQi+1jME4e+LV2x4c7VQ+2SLudhDV1S5ZMhoyg/A3kcVaTb42ryXLV5LwkgrM2R1L/QLpi6AZ2cc7RtlDwo+c+//YU9jdAkyNWWqcsRxnNB4Upj7fESu2d+kh5cX3zv6IpbRTW+aapu7VI3zJTmxyT/UaKN7ytX8I6WPTzjvGKn+t2Ueu1Wq6tPWIaQoa0KCAJ08AnTB7ajy8RgFlVa18YIVDbSo94RJXMJGpPLzpxQisiP2nTZioUdgIcKiil4taDRRmbz/GmmrfO9gieFMx2Yg0P5UMGRVwn9IrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TG4TPq8QajpifaP7GhjFLOjqx+Znm3x5PqD3hyiMUZ4=;
 b=WpopLuAfAUacISJxUuuQwVHIVdAHgRAJDhXzgDRe3o9gCc2FqPoWdg8plGAGadD3PK9ymYoN965N0bHM8uTzVQoQFEVfYi1qdES60K6lfrQ6bRz5zJue+hEYrpAO+bGJ2k0v7DRVx0kEKnPFcUkEytRrZe3Rfj0oITIZyfQk3dclg0ol9IhGnQETszriTFIOgJNaPyNz1MxM/G2VYaJVwn8II7pkN+UIcetWSDoyrw8j5ZnlvpcdbDgjhV+PuqcBr8HcD96OW9mnvFr9gfPFWUcJINcSZCunicsRHBpBDXzKlskjg64oEZP2V4lrbPYx+Di3JOBLy7t8f0QB7KoSwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5)
 by BN9PR11MB5418.namprd11.prod.outlook.com (2603:10b6:408:11f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Tue, 22 Mar
 2022 13:51:43 +0000
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::99ce:ec02:b430:2564]) by SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::99ce:ec02:b430:2564%8]) with mapi id 15.20.5102.016; Tue, 22 Mar 2022
 13:51:43 +0000
Date: Tue, 22 Mar 2022 19:21:29 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 4/7] drm/i915/guc: use the memcpy_from_wc call from
 the drm
Message-ID: <YjnUYfBkLA5XAcAm@bvivekan-mobl.gar.corp.intel.com>
References: <20220303180013.512219-1-balasubramani.vivekanandan@intel.com>
 <20220303180013.512219-5-balasubramani.vivekanandan@intel.com>
 <20220321211407.ujlokc44jx4kbtvo@ldmartin-desk2>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220321211407.ujlokc44jx4kbtvo@ldmartin-desk2>
X-ClientProxiedBy: CO2PR06CA0054.namprd06.prod.outlook.com
 (2603:10b6:104:3::12) To SJ0PR11MB4894.namprd11.prod.outlook.com
 (2603:10b6:a03:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca22ae5b-0ec8-4381-7922-08da0c0b1910
X-MS-TrafficTypeDiagnostic: BN9PR11MB5418:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BN9PR11MB5418CFBABA1A3A22BFDB55569F179@BN9PR11MB5418.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GehCQ1uQUVjhyUDhQ2q7Oc1p1pmxSVu1qkwZ6YYysM7tR39Zh74qzHaL7uXmPEv7K9SHQGWDylsPkl8+6XazYsmfc+BWb1AhFESI0fwl3igzG4Dq0g7olr21e9R4PMt3ZBoR9f37xyHyT1QeAKXDB3tzbf1e956O6bBTwMfb1Yi3/SbvfZHGqeev/cG8EBPV8UXimIit9nFLEdxumLglBl5Y4X7tWCzN6T5Mjewqvz/Atn+WLtAQ8QDL/ft5D+TEex6upmxcZKIB3GWyibuueA9z0KiS/5FYB8OfK7rPThHt8Qn8idjk5lJ+YfXQxa2WWSczrM4W8giZu3bBctWSHeYI7lf/IoRTKJuKaxRidoGupXtU+hXFY6ana+5TgBHzWxX7nqNDDiRzsLncFEn88SB4NAEfAIhmIdh/2/whr8VRyqDC5et1vkBZxSiwfUoW0WJ9WcRgbzp/HK3QOqL6PHGagERwaO5S+Ulu5UHhNHWyO47y0FRCN+lE87b0Zs249Oo/b/HrCjjonAoZmDqw621ZrTg/V5tbTGK2uOsyg3RJjjMw34TDJQVmSDK0kWjgv0vzCaD39oA588sSE5flXjrH6AwcPvVpzcBXrFs00h59VQ5OxQQvkE7n3WLYqyejC2T9IdGVzlWF/AEp+wP/Jw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4894.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(6666004)(316002)(2906002)(6636002)(44832011)(450100002)(6862004)(38100700002)(107886003)(66946007)(6506007)(4326008)(66476007)(8676002)(66556008)(53546011)(6512007)(8936002)(508600001)(86362001)(6486002)(82960400001)(26005)(186003)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1dHRWh2M1JGalRnQUxCNXdCV2x6dnIxSSs2NU41NHo3eXA2RFN2ZlB2ZHFr?=
 =?utf-8?B?V1R3bStLeEJ4R1dmUElZMzV5SjBwaW00SVd3R1BXcC9oZnU0NGtROG9lOVAy?=
 =?utf-8?B?NnNJT3hIeW1YWWROY25NQ0xhQ2lZQXZXSkdjQjVFUGNCVk1XQ1ZrZ2RHYURk?=
 =?utf-8?B?MUdEL2kxUGRlblFFQy9FdG8yN1dkc0hxWEZVeGwwZy9iNEx5ckFxcnI3bXdZ?=
 =?utf-8?B?R25KU0pETXNWNklwNmt6dlVVQitiRzYxSkJWeFFvMU1uMUJqaTljSU54TmF4?=
 =?utf-8?B?YW9JelFENE4wbXRxckE0RnBxRTJOakc0RHUxK0Q1dWZjakYxOE1wc3pQeElX?=
 =?utf-8?B?QkZPV1hrTFJ4UDJGTGJOdytZOTJtbzhjTGpYMjNqdnJUcERxY0o0S29DcG5v?=
 =?utf-8?B?eVlCWVpSakowN2Iyb2lpbi9DS0pKSDNwZ3NqUlpGSkZPS1Fpd2JHSytIZ05G?=
 =?utf-8?B?eVNsaVBqcGY3Q2g3VEVzYW5kdnRZaUZLMEV1Z1RrN3NCVzdlNXAzNUw0R3JM?=
 =?utf-8?B?UWc5bnA5TUxQVmxhVzlOemFHWTJXRkNqeS85Wk5uVjhkM2tUVHJQNzdjMHYx?=
 =?utf-8?B?aU1ySXVUUHFxQjBmYjQreXFGOUpyaXdYTlEwWjhDZzQwK2hNRUNsYmhVbmNZ?=
 =?utf-8?B?ZVJ6ZkMycllrNXY0dFI0OXVPa1RsWHpvUDRtV2NHQVlTVkdjam1EU3dwMVZa?=
 =?utf-8?B?amlubVJPclZVWDFYZGFuYjEvYTNqcmlWeUQvVWVoVC9EWGF3ZGkrRnd3Nyty?=
 =?utf-8?B?K1Y0c3ZsTHdFUlRBMkxhdVJXVmRqbGxXeHlZYlNhTGdjWFVKK0VnS2pQdEhY?=
 =?utf-8?B?MlJqdnJ0RnZMdFp3M2dCd0lwRHFIUFFlRC9ONzArSEJuTzhrbXZYT2d3cGxE?=
 =?utf-8?B?WEFRbWp5ZG9MTDVCTEs4RTdMSHJvMnJDWEtyTkVXUUpYSFZiRjNWMzk2NXU2?=
 =?utf-8?B?TWZxTVZhV09ZVmNVWm5hR1NFeUZhMUR6UFkzd0N1bmtpeVBnS0lNZjVnTlJU?=
 =?utf-8?B?ZXUyN3VIVWxkV01BNUpTanBjNUJvUVF5d2wrdEVOdzRUMU1PbEhZV0RWYUpP?=
 =?utf-8?B?ejRGNUV6VWtUN1FFclZLRzZHeU80OWNkaE1oak52OTNGTFJZWmhEZUs4aWdH?=
 =?utf-8?B?R3hRejg2RVQrY1ZVU1hjNzN0WDhPT2dqb3RhVDI2SHpJTFEyclJFR2V5dWI1?=
 =?utf-8?B?dmNlUEtDTWdkMVloRTdaTGRLT0NaY2l1RGpuRi9HWW13clk1ODdOZ3JYWFcv?=
 =?utf-8?B?N0t3QmpZTGZIQ3RhR1lTWjNuNHR0bldYdDBJeEhqM0hjeEhvV0ZReGtLQVF6?=
 =?utf-8?B?ZEI1MFIvSVBlbUtDcy9jYVd6T05zZk5xV3Y0OEZta1NJTjZvNlFqYVlSMSt6?=
 =?utf-8?B?b2VKYWZTcU9FQklJZXU5amFDUmVYU3VzLy9jSXNRWWNVaDluOG5pY25WTURk?=
 =?utf-8?B?SjE5SDJpTTk3WndJaGRab2NjWHAwdXVTbEYwbXExeHdhZmFQblNuRVZNSGQ4?=
 =?utf-8?B?QlIycTRncGdDaHovSzBYWDB5bG4rbHZtRXpuUzhaRTB4THRLQmRtVUJpVXFm?=
 =?utf-8?B?dkluT2xMNE5taFlDd0MvZzBrY1Z3ckwxcDJXZStOZURuMnRlTEFIZHdjUnpC?=
 =?utf-8?B?U2Fub0c1SWZSdHJYdXNOTkFxVVJYNzFPLzRaWjZReElzaksxbU9qWjVmRFB5?=
 =?utf-8?B?UGtTU01hVmpaQVo1VXlkZkF3bjgrMWdaTTdtdlVjODV2V0dsaStYb0d2eGRZ?=
 =?utf-8?B?RnVjQUNWQWF0SmFoWWJVYURPc1N2a0RFeUR0RUwwazVjRUpIL2FUUndCOFJR?=
 =?utf-8?B?RnEzNjNTMGlUQUw3THhENlB3SWZtaE0xeVBGODhHU1dvTnF1QnpPRU9LNU1h?=
 =?utf-8?B?d0lqVnREeFZJb1cwRkJiRVZqcmNMM1FVYkQ5VGwzazVhdmMzVTl5NU0rbUVp?=
 =?utf-8?B?NUt4M21aZlFBRWR6cVE3ZHBadExLam51dUF3K2FwYkdId1F3YnplQ2pSNmlD?=
 =?utf-8?B?TnJYdmVac1pKWlpnSkEwVXFMczRkWE9jZ3Ywdmd5WHE2Vk1tTFJjTm5BRU1M?=
 =?utf-8?Q?A9C0CQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca22ae5b-0ec8-4381-7922-08da0c0b1910
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4894.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 13:51:43.2748 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NftKTQ3Y+SWJoQU+/iOEVGEOObJIPFe0c21wd6TT57kSVzYCFFsFd3Rb1ceJ4P06yHsRpeo1Nu18tfvXQWm/bjSG/MA9+PdFc/WuAbawkfrBsXMSvl1z5fpwoBYhAjm2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5418
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
Cc: michael.cheng@intel.com, wayne.boyer@intel.com,
 intel-gfx@lists.freedesktop.org, casey.g.bowman@intel.com,
 dri-devel@lists.freedesktop.org, siva.mullati@intel.com,
 michal.wajdeczko@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21.03.2022 14:14, Lucas De Marchi wrote:
> On Thu, Mar 03, 2022 at 11:30:10PM +0530, Balasubramani Vivekanandan wrote:
> > memcpy_from_wc functions in i915_memcpy.c will be removed and replaced
> > by the implementation in drm_cache.c.
> > Updated to use the functions provided by drm_cache.c.
> > 
> > v2: Check if the log object allocated from local memory or system memory
> >    and according setup the iosys_map (Lucas)
> > 
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > 
> > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > ---
> > drivers/gpu/drm/i915/gt/uc/intel_guc_log.c | 15 ++++++++++++---
> > 1 file changed, 12 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> > index a24dc6441872..b9db765627ea 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> > @@ -3,6 +3,7 @@
> >  * Copyright © 2014-2019 Intel Corporation
> >  */
> > 
> > +#include <drm/drm_cache.h>
> > #include <linux/debugfs.h>
> > #include <linux/string_helpers.h>
> > 
> > @@ -206,6 +207,7 @@ static void guc_read_update_log_buffer(struct intel_guc_log *log)
> > 	enum guc_log_buffer_type type;
> > 	void *src_data, *dst_data;
> > 	bool new_overflow;
> > +	struct iosys_map src_map;
> > 
> > 	mutex_lock(&log->relay.lock);
> > 
> > @@ -282,14 +284,21 @@ static void guc_read_update_log_buffer(struct intel_guc_log *log)
> > 		}
> > 
> > 		/* Just copy the newly written data */
> > +		if (i915_gem_object_is_lmem(log->vma->obj))
> > +			iosys_map_set_vaddr_iomem(&src_map, (void __iomem *)src_data);
> > +		else
> > +			iosys_map_set_vaddr(&src_map, src_data);
> 
> It would be better to keep this outside of the loop. So inside the loop
> we can use only iosys_map_incr(&src_map, buffer_size). However you'd
> also have to handle the read_offset. The iosys_map_ API has both a
> src_offset and dst_offset due to situations like that. Maybe this is
> missing in the new drm_memcpy_* function you're adding?
> 
> This function was not correct wrt to IO memory access with the other
> 2 places in this function doing plain memcpy(). Since we are starting to
> use iosys_map here, we probably should handle this commit as "migrate to
> iosys_map", and convert those. In your current final state
> we have 3 variables aliasing the same memory location. IMO it will be
> error prone to keep it like that
yes, it is a good suggestion to completely change the reading of the GuC
log for the relay to use the iosys_map interfaces.
Though it was planned eventually, doing it now with this series will
avoid mixing of memcpy() and drm_memcpy_*(which needs iosys_map
parameters) functions.
I will do the changes.
> 
> +Michal, some questions:
> 
> - I'm not very familiar with the relayfs API. Is the `dst_data += PAGE_SIZE;`
> really correct?
> 
> - Could you double check this patch and ack if ok?
> 
> Heads up that since the log buffer is potentially in lmem, we will need
> to convert this function to take that into account. All those accesses
> to log_buf_state need to use the proper kernel abstraction for system vs
> I/O memory.
> 
> thanks
> Lucas De Marchi
> 
> > +
> > 		if (read_offset > write_offset) {
> > -			i915_memcpy_from_wc(dst_data, src_data, write_offset);
> > +			drm_memcpy_from_wc_vaddr(dst_data, &src_map,
> > +						 write_offset);
> > 			bytes_to_copy = buffer_size - read_offset;
> > 		} else {
> > 			bytes_to_copy = write_offset - read_offset;
> > 		}
> > -		i915_memcpy_from_wc(dst_data + read_offset,
> > -				    src_data + read_offset, bytes_to_copy);
> > +		iosys_map_incr(&src_map, read_offset);
> > +		drm_memcpy_from_wc_vaddr(dst_data + read_offset, &src_map,
> > +					 bytes_to_copy);
> > 
> > 		src_data += buffer_size;
> > 		dst_data += buffer_size;
> > -- 
> > 2.25.1
> > 

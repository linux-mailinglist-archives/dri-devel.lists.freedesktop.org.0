Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6788FC35A
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 08:20:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 180EE10E6A5;
	Wed,  5 Jun 2024 06:20:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WKtJTDu5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B1010E6A0
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 06:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717568415; x=1749104415;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=e9B7+pxe0ivM7d1+E9GQfvIclz9hiPkszIfz5BHDecE=;
 b=WKtJTDu5Jzab7Y/ZXrde3HeVZQE/vcOyQKr/UKgx5jekvegv1LIvWGrn
 VvVf3iexPnBJBfpbIJFh2n+HTD78Dv+jb4Feyp5Omby0Y77XXe4DSeFrw
 NZtddFPHSRz3e3kk8rotShwGMiNIhOKzzOVYbgbGayeXKC+MJNzrqalxk
 QLuwUSQCcmfJEJX+3lN1/BXTTbdx92QFvmiL4QgVaj+KByEbafx/qM7Or
 0stEfnkluOUshb0TWISQleHbrXBlEvY0TrGXJ074K98J2X/U63zablMC7
 CBkkTBgHRqfR2tnwct59AXrxmVInrQIVPqWDB0ZiqQMzgAaSWLq7evfa9 Q==;
X-CSE-ConnectionGUID: JLesgcXLShuEyPHPWnaTlA==
X-CSE-MsgGUID: jgut/fW2RIOFuW938jNO1g==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="36673375"
X-IronPort-AV: E=Sophos;i="6.08,215,1712646000"; d="scan'208";a="36673375"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 23:20:14 -0700
X-CSE-ConnectionGUID: F2q6EDUpRjCGIeks7k7VEg==
X-CSE-MsgGUID: eazLnQKnTvyQOJ5hjBmaJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,215,1712646000"; d="scan'208";a="37409025"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Jun 2024 23:20:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 4 Jun 2024 23:20:13 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 4 Jun 2024 23:20:13 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 4 Jun 2024 23:20:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PlDb3yOGVrCTlBB+WqacqwU/xTTp9vod8zYedbZydnG8bUf5Hcx6HTDDFXDR6va+t+lD43AR7IzisjY7qLA7p+GI9L4HQoyjm3EgkszxTc1DSOWU5i40psoSf7J2tHXmXvyH8oATCsScVnrLq43O+hZor2gpwzJqGLUvsHvLalSxxhyX/m8e8ehIWzVrxUehTf+xZQoA+4bOQuV2BmMj5r/S8m8ErR+TehI2y6Eupw2oN4rryBj+RR/oD125vKuyoxPv2MJI63TegBxNCFsFN0l3kkF3ZKpnNhN/XVKSR/SIiwCDupBaSfclJciAxCcdLRwGkh18InhcOUKiuZ1xrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDS3kiMkTEiBSxJGfD2R1DtoiTWSysgMgDhoc2nBxP8=;
 b=K6T38lGPly3hwaVDhRe2EZmGA+rglnYAe6VCJ+jy5wW1atmvSwvgqJtOEoE0IYhGXpafBzKeRLm0v+UT0IWbV9ZjeITynVzMzEZ4rpM9bJjr/TBv/NbVrqYBcq1P7EDxY0kccyGUmCQ2CIhGj09ez5fAjLcfLhabMd3cD1Xn2m8tTKW96NKP7III4lun2N2rOrHTQ57mrwjtlkfopxZpX5ufyayIYbHpKpkprDKZx/E+11sB6iPTP+BukeDBqDEqUvRxTdyXO9tlREMfcCl3CtOTW7PprkO9ObNlx+GSYhBHePqWuJe88/NMRzKolsxpyzn9iYCQh4HdYmgMJQzMaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by SN7PR11MB6994.namprd11.prod.outlook.com (2603:10b6:806:2ad::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Wed, 5 Jun
 2024 06:20:01 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::d244:15cd:1060:941a]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::d244:15cd:1060:941a%7]) with mapi id 15.20.7633.018; Wed, 5 Jun 2024
 06:20:01 +0000
Message-ID: <b205bcfb-9972-4e03-9994-62419117d76f@intel.com>
Date: Wed, 5 Jun 2024 14:23:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/22] iommu: Add iommu_user_domain_alloc() interface
To: Baolu Lu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>, "Will
 Deacon" <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Jason
 Gunthorpe" <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>
CC: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Kalle
 Valo" <kvalo@kernel.org>, Bjorn Andersson <andersson@kernel.org>, "Mathieu
 Poirier" <mathieu.poirier@linaro.org>, Alex Williamson
 <alex.williamson@redhat.com>, <mst@redhat.com>, Jason Wang
 <jasowang@redhat.com>, Thierry Reding <thierry.reding@gmail.com>, "Jonathan
 Hunter" <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 <iommu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20240604015134.164206-1-baolu.lu@linux.intel.com>
 <20240604015134.164206-2-baolu.lu@linux.intel.com>
 <445fae9f-ea1e-4864-9f0e-f348c51146a1@intel.com>
 <91a42f46-060a-4430-a10a-7bfded67c4a9@linux.intel.com>
Content-Language: en-US
From: Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <91a42f46-060a-4430-a10a-7bfded67c4a9@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYBP286CA0043.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::31) To DS0PR11MB7529.namprd11.prod.outlook.com
 (2603:10b6:8:141::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7529:EE_|SN7PR11MB6994:EE_
X-MS-Office365-Filtering-Correlation-Id: a2bf3d0c-a711-4d61-c698-08dc85278826
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015|7416005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mk5hQWNoOG9JSG1aa2tmWXQ0enZOVGY1K2VjNnFHSURTWWJKMVVTa1FPNm1i?=
 =?utf-8?B?SExpalYrYnoxOE5oRmpEaHkvVkl3VjVKdC8ycXpJMndYWFhQVVlmbDFGTWpT?=
 =?utf-8?B?ZEtjbTFiOUYwSVI1WE04VFluS1VLUGE5ek5lNmhxbGlYdVAySEJwWGtiYW1v?=
 =?utf-8?B?TTl4RGRCOVQxaEdFTXR3Y0dsWW9jeEszaTZTeTllU2hmZnZ4THdNbGtOYzMx?=
 =?utf-8?B?bmxIZVdmVDhHczRaL0ZCT0J4WGtUcW95Ri95YUxFQ29tSmd1R08xS2Y2NFl5?=
 =?utf-8?B?aUZQQ3RTMGlUS3lhMThlZDRXSzk0UjRqSTVBZHVYRE9lTVR1QWxEZkh4NmR1?=
 =?utf-8?B?dnNSL3BsZm1PNHBsOThPT29DSkVKY0NORC9LM2lMcSsrYzAyQVB6eTk0Q2lT?=
 =?utf-8?B?VW5TY2tDa2NkYUpjakdGL2J3R053RklnT0pMZUFPK2wrSG5aQUo2Qkt6RTVH?=
 =?utf-8?B?OHZxbkhtSm9Bd1lRTWlOb1U2N093bnV0VFIwcTVBckV6T242ZUVQQis5VXlW?=
 =?utf-8?B?eVdQK2JJbEMyamhEbG1tZDBuSll2WWRSRkNjdEl4c2RVejNkREpNOXg2WVNo?=
 =?utf-8?B?c0s3MnUzOUh0T2F4a3EzeGQ2clR3MEZlWGJzT2RSZzZjQ3o3eHgzVVA4Szg4?=
 =?utf-8?B?ZGkweU81aldNOENIcE9XMHYrZ3V0TTh2REw4UHJvazNETFA2cGFqaEdxd2Vu?=
 =?utf-8?B?Z1VUYzZLYjFCcURGZEM3NDhEeXVLOFVVRithNmZpbUlnaDcwOS9GM2F1UWZK?=
 =?utf-8?B?czRUM3dKOWpSbVcreUtNUmZ0RUlTUTlFR3VESUpOWGIzMGE4NUlXdWtGeTMx?=
 =?utf-8?B?c3VVM0xWcHRPSFNnUVhBU1FZc0twQ0Qxa0JoWEk3emx5OS9xVy9QeitPeFJG?=
 =?utf-8?B?S1BxTWozWUpFU0UwY283SWMrTUhVZWQzWWF2UTZ2dnVML2F5N3RaS2NEcHNF?=
 =?utf-8?B?WXF1WFErWGMxYmhwcFhXMDh6em4xSGw4ZGpBOTdBOWdCOFY5TGFFUlZHalNY?=
 =?utf-8?B?d1JpeTJUNkdsWHBVL3BGTXl1dUlFQS9FSjEvYTRweW1JanVZaTBnNnNHVXZS?=
 =?utf-8?B?VzNvQytTbkRJL3FTa3VhYmdJZ2RNcWRTdXpmd3MwUFRWVnd0bjRRMEFiOENq?=
 =?utf-8?B?UDRaakpQZjBEWWsybENrYjdRYnVLV29GaFBjai9Fd1BGcUY3bzIrOE1TTzRT?=
 =?utf-8?B?UjNtbDVFZG5KdnFtQlBreXFaYndUWUx2UjdYSzdydm8wbFFiQUFvNy93WVpk?=
 =?utf-8?B?YWQ2TVVrNTdnZGltRE5nTmwvL0FRT3A0dTdNRlREdVlHSTZYcEE0NGdDd2NI?=
 =?utf-8?B?Q0dFV3p0MjR2MjZUek1SVmVQaG5QYi9OTFVHell3VFlCMWxRalI0aXkvZ29L?=
 =?utf-8?B?aklEbTBhWWM0MFhpaDZVRzVWSVdBQU9URURvTkhYNFNVa0g5eGJjeUNSaU1G?=
 =?utf-8?B?WDRtZjdJejlhWUtRWTVhNDA5L1VSS2N5L2xyTkZmUmZlUUp3WWl2Nyt6QzFO?=
 =?utf-8?B?NEdKMURxTmo1ekd5TTVwN0JjUUVpUUdXSWZpdHVmOTI2VjRNaWhSZnFVMkpE?=
 =?utf-8?B?T05DeGZiclI5UHNyY1A0amljeUFnTEtqUzVSbDBHc3RNVWVUZzZCN0tSVFJu?=
 =?utf-8?B?QTdDNkF3MlhBcExDUTRLVXNLY21icVNxZitIcVVMSkJ0NVF6UE0ycnJyVTFV?=
 =?utf-8?B?RXJCVGdpOVMyVlk5anhKMjgyWW1JT2FhaUJPbmphcGhtYUtoZDl3d2FBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(7416005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzVmZlVTU09GZjBXdis4K0VWaTNhYWF1RUplVUtwTVdIUHh5Z0xYYjdLMFk3?=
 =?utf-8?B?ekFQVlV3MElOTUYwSzFvcGYyQnVpbW5aYnlUYlFCY2tyUnhHNjhMZG1GMFEz?=
 =?utf-8?B?akEvLzNaeU0vM284MWxJNWh3T0s4YmlWZFJaaG42azFKanp4dE5mWkF0UjhX?=
 =?utf-8?B?ZEJpUCtNeGk4VTl3dDVHUmxUbWJxTXNDZk1GWGVxNUllTDIrWjVuOGp2elJE?=
 =?utf-8?B?VG9QQWZ4Y2NYL0t1bXNrUytRTmVXQ3hZMFJSc0ZaMUdOSmdNU2JGOVJUd0JT?=
 =?utf-8?B?TW1Fd1FmSFFCdWIxem1sTG9WeGdBMHJiUlFCUjc1NUxNVkJaTE9QeWtqWkRS?=
 =?utf-8?B?THREbGFqNVVuQ2JuN3hCVmdDeEpaaXBVL0pIMDlEWlltWitoNjJROHBwYzho?=
 =?utf-8?B?aGQ5cFBZQ2V6UEU4cHF4dlA0QjRJYzJlblRvZUc0MS9ZTVhoM01rZWJhTVVD?=
 =?utf-8?B?NEthMnRoK1h2OWRqdzdNSGhtMm9FUnJERU1lUWdUcEdYMEM2TDd0OERXMjRh?=
 =?utf-8?B?RjF4RlM4bmJiMWpsUFFHNE1vcWJyS1lmSmlLYzBJNnBJT2h5RnUrZ255YW41?=
 =?utf-8?B?ZFcwaEFyOVl1MDBDblhYRUkwaGY2Nk1meFg3Mm02SXlDY212N28ySmlwNFc1?=
 =?utf-8?B?SUNCSFRraXNRb0xUNTBrZzd6YXNLUlZBSXYxcmt1UU9mNlEyU3lidlZGaDJS?=
 =?utf-8?B?dTdRbjBEdFc1MjVuMWo2dyt3SzJMNllVM2Npa0NlcWxWN25KamNuZVd2Z0Nm?=
 =?utf-8?B?RS9OZElxUnNWWmxKVnpWWTVPWlpXV1BUYXJzemxNd0pSKzliR2J6aWF5ZURQ?=
 =?utf-8?B?ekRkSHpuTWkrckpiZVp1MnAybnJFVlFTbEUvNkQ0eDhxbk1FVXpHdUdKK1g3?=
 =?utf-8?B?ZXNlVCtsRDV4cGY1YVJHdDZneEhUNXVkMGNmSWZnTDN1WHAxa3lTN2N4eWNn?=
 =?utf-8?B?YzQ5SjM1cVg5ZmgyZldWWEwyRFJDVzNMUmk5eWRNTFZDWHh4SWxmZ1dZOFpE?=
 =?utf-8?B?dDR0RVNsT29mUlZEc040QWtmeGROUW5UczJFdGxDM2pVenJyMi9TczVxaXps?=
 =?utf-8?B?VUFacDAyZnZiRjA3Y2RkWVRiU0xwaTdhZllOYzNVWVplRG5rTDZjekxKNlA0?=
 =?utf-8?B?MDdOUjhHbjlrR3RtekZPQXNKaCtTMVQrMTRQd1JuMHlIYlRCK0dnbmp4Q0Nx?=
 =?utf-8?B?d0xOc3NoQlBOaVVnc0NMMlIrT0JkZmtYbzhoenNrdEExMDhUNDRXU2w4T3Z3?=
 =?utf-8?B?cXIzNFppVmRjY1VaMFhoOFFGbkMwVy9tUWpBeVMwbU9vZ2dadmZkQzFyVlZw?=
 =?utf-8?B?ZmM0S3R1cnJmNVJDUzFPWHllTDd2WTBlbGt4cm53a1ZYVDNnUFdNK2d3a293?=
 =?utf-8?B?Mmp0SjNvVE84b3l3Y0FvZ0E1TTFWL2RGTXNGWFd6SElvQ3M2ckl0MWUzaXVh?=
 =?utf-8?B?eUJwdlR0ZktVcGowRGtxNzV0ZFY2cDFpQjFEclZ2QldLRWlvY2o1QklRSlFP?=
 =?utf-8?B?N3VHS0xuVitnY1RYVUNsM1M5VmpGK1pmOWtDZFpTQ29pZzlnQXlKRlhmcVFq?=
 =?utf-8?B?S3Fud2h4b2IxNzhYMWI2bDdSV3dlczlaYUVBR1Ztc09sQTlsK3FVVzl2QURq?=
 =?utf-8?B?UVBrbHhTYzMwaFJDZ1VlTTRzTHJzNm45TXNzWFphSkhHSkJMajVvMUhSL0p6?=
 =?utf-8?B?b2xhak9GVVVlQWFxVmRlWmFIUFY5cDRVWEV2dVhpR0ExaUxNeVFrSzdVaEI3?=
 =?utf-8?B?SHIrc0tJNHhHWTFCSFZFSGIyVjNwMmozSkhDWCtsN0U0T1pXaWdoWERTM2JT?=
 =?utf-8?B?TU9BZ0Z0am82dWVBTE1ndVgraTdZaXd1VWlqSnprZHdPUjZ6enRYcGlVZ0tI?=
 =?utf-8?B?MHlLMHNacEsrMUYwN2ZtU0xqM0U3eXlTdU11SEFmSUx5b1h4b3R3Wk8xZHZ1?=
 =?utf-8?B?LzRoN1g3QnR3MVhvemVmTDVzazZyWVcrd245bjVlVHk2ZlN1aXZBMEdMaU5D?=
 =?utf-8?B?TlZveHBJamN4THVyelVZVWhqQ2swSjVpNjk3eFFaMDJlWExyRktYeVhOaUs1?=
 =?utf-8?B?VGNJeEVmYXAyV2RjTEJTK2RNWEpDNEdsT1MybnV3UTg3VnBXOUhHdEdkUGdT?=
 =?utf-8?Q?SJ3OTv/gPGYnv9khpv8s6fpn6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2bf3d0c-a711-4d61-c698-08dc85278826
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 06:20:01.6772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jff8HfHOYDCc49ShrrPFeqcJcaIJabOLkBzND+PYQ91CGZQRgB6Cz/poQRYEzPS/O7dNanSUuTBCgr2VU7a5WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6994
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

On 2024/6/5 10:00, Baolu Lu wrote:
> On 6/4/24 4:03 PM, Yi Liu wrote:
>> On 2024/6/4 09:51, Lu Baolu wrote:
>>> Commit <909f4abd1097> ("iommu: Add new iommu op to create domains owned
>>> by userspace") added a dedicated iommu op to allocate a user domain.
>>> While IOMMUFD has already made use of this callback, other frameworks
>>> like vfio/type1 and vDPA still use the paging domain allocation interface.
>>>
>>> Add a new interface named iommu_user_domain_alloc(), which indicates the
>>> allocation of a domain for device DMA managed by user space driver. All
>>> device passthrough frameworks could use this interface for their domain
>>> allocation.
>>>
>>> Although it is expected that all iommu drivers could implement their own
>>> domain_alloc_user ops, most drivers haven't implemented it yet. Rollback
>>> to the paging domain allocation interface if the iommu driver hasn't
>>> implemented this op yet.
>>>
>>> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
>>> ---
>>>   include/linux/iommu.h |  6 ++++++
>>>   drivers/iommu/iommu.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>>>   2 files changed, 48 insertions(+)
>>>
>>> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
>>> index 7bc8dff7cf6d..6648b2415474 100644
>>> --- a/include/linux/iommu.h
>>> +++ b/include/linux/iommu.h
>>> @@ -780,6 +780,7 @@ extern bool iommu_present(const struct bus_type *bus);
>>>   extern bool device_iommu_capable(struct device *dev, enum iommu_cap cap);
>>>   extern bool iommu_group_has_isolated_msi(struct iommu_group *group);
>>>   extern struct iommu_domain *iommu_domain_alloc(const struct bus_type 
>>> *bus);
>>> +struct iommu_domain *iommu_user_domain_alloc(struct device *dev, u32 
>>> flags);
>>>   extern void iommu_domain_free(struct iommu_domain *domain);
>>>   extern int iommu_attach_device(struct iommu_domain *domain,
>>>                      struct device *dev);
>>> @@ -1086,6 +1087,11 @@ static inline struct iommu_domain 
>>> *iommu_domain_alloc(const struct bus_type *bus
>>>       return NULL;
>>>   }
>>> +static inline struct iommu_domain *iommu_user_domain_alloc(struct 
>>> device *dev, u32 flags)
>>> +{
>>> +    return ERR_PTR(-ENODEV);
>>> +}
>>> +
>>>   static inline void iommu_domain_free(struct iommu_domain *domain)
>>>   {
>>>   }
>>> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
>>> index 9df7cc75c1bc..f1416892ef8e 100644
>>> --- a/drivers/iommu/iommu.c
>>> +++ b/drivers/iommu/iommu.c
>>> @@ -2032,6 +2032,48 @@ struct iommu_domain *iommu_domain_alloc(const 
>>> struct bus_type *bus)
>>>   }
>>>   EXPORT_SYMBOL_GPL(iommu_domain_alloc);
>>> +/**
>>> + * iommu_user_domain_alloc() - Allocate a user domain
>>> + * @dev: device for which the domain is allocated
>>> + * @flags: iommufd_hwpt_alloc_flags defined in uapi/linux/iommufd.h
>>> + *
>>> + * Allocate a user domain which will be managed by a userspace driver. 
>>> Return
>>> + * allocated domain if successful, or a ERR pointer for failure.
>>
>> do you want to mention that this is for paging domain allocation?
> 
> You are worrying about its confusion with nesting domain allocation,
> right?

yes. As I replied in last version, user_domain is a bit confusing since
nested domain is also a user_domain. That's why we introduced the
alloc_domain_user op.

> My understanding is that if we want a common interface for
> nesting domain allocation, we should make it in another interface. Here,
> the user domain is a paging domain for GVA->HPA mapping, which is common
> across iommufd, vfio, and vdpa.

do you mean user_domain only includes paging domain?

>>
>>> + */
>>> +struct iommu_domain *iommu_user_domain_alloc(struct device *dev, u32 
>>> flags)
>>> +{
>>> +    struct iommu_domain *domain;
>>> +    const struct iommu_ops *ops;
>>> +
>>> +    if (!dev_has_iommu(dev))
>>> +        return ERR_PTR(-ENODEV);
>>> +
>>> +    ops = dev_iommu_ops(dev);
>>> +    if (ops->domain_alloc_user) {
>>> +        domain = ops->domain_alloc_user(dev, flags, NULL, NULL);
>>> +        if (IS_ERR(domain))
>>> +            return domain;
>>> +
>>> +        domain->type = IOMMU_DOMAIN_UNMANAGED;
>>> +        domain->owner = ops;
>>> +        domain->pgsize_bitmap = ops->pgsize_bitmap;
>>
>> this seems to break the iommufd selftest as the mock driver sets extra
>> bits in the domain->pgsize_bitmap in allocation. Override it may fail
>> something in the testing. you may need to check if domain->pgsize_bitmap
>> is set or use &=.
>>
>> static struct iommu_domain *mock_domain_alloc_paging(struct device *dev)
>> {
>>      struct mock_dev *mdev = container_of(dev, struct mock_dev, dev);
>>      struct mock_iommu_domain *mock;
>>
>>      mock = kzalloc(sizeof(*mock), GFP_KERNEL);
>>      if (!mock)
>>          return NULL;
>>      mock->domain.geometry.aperture_start = MOCK_APERTURE_START;
>>      mock->domain.geometry.aperture_end = MOCK_APERTURE_LAST;
>>      mock->domain.pgsize_bitmap = MOCK_IO_PAGE_SIZE;
>>      if (dev && mdev->flags & MOCK_FLAGS_DEVICE_HUGE_IOVA)
>>          mock->domain.pgsize_bitmap |= MOCK_HUGE_PAGE_SIZE;
>>      mock->domain.ops = mock_ops.default_domain_ops;
>>      mock->domain.type = IOMMU_DOMAIN_UNMANAGED;
>>      xa_init(&mock->pfns);
>>      return &mock->domain;
>> }
> 
> You are right. I should follow the code in __iommu_domain_alloc()
> 
>          /*
>           * If not already set, assume all sizes by default; the driver
>           * may override this later
>           */
>          if (!domain->pgsize_bitmap)
>                  domain->pgsize_bitmap = ops->pgsize_bitmap;
> 
> Does it work?

I think so. This should work.

-- 
Regards,
Yi Liu

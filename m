Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B387520DFD
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 08:45:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF9710E999;
	Tue, 10 May 2022 06:45:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA3910E999;
 Tue, 10 May 2022 06:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652165136; x=1683701136;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/uKntV0tU8z131cWgdXipfJZFvMHa2/+qfKVX90AGZo=;
 b=lzwIGTcKCSf01sLVMS97+/K+hPyVZQHXVuJacx1xSa+cz7Hjwgm0YbsH
 w9ZAs55oz4z/mSxXAK5hEi2CfoKMzES2kZONt8X/pQw3S6HhvUe19TwSx
 cWqeH7mPYwh7Nn1pREp3OWntWKBDQDCHFp46/vC3ONQ2Zrk+fJULVF6Tt
 w0ynz5veBUxy2clWb/IV85HThXhs+jjkRxlZp2XYeV1XKMj2tyD0YpkXH
 an9MN5cKhePQf8U5sUljB4mi5jOTEEG2SYV0Ao5j0haPw8IxIISj1ldKg
 nKTyIR25lNoguLP9LJoU4841mOUg65QiRHIqnK/7hhVyODDjSaRt5xi2y A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="249812419"
X-IronPort-AV: E=Sophos;i="5.91,213,1647327600"; d="scan'208";a="249812419"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 23:45:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,213,1647327600"; d="scan'208";a="657506184"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by FMSMGA003.fm.intel.com with ESMTP; 09 May 2022 23:45:35 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 9 May 2022 23:45:35 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 9 May 2022 23:45:34 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 9 May 2022 23:45:34 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 9 May 2022 23:45:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fAWYFiwY6GvpJh0W0O0mCCJETQAKkkUG/39fedURePN5/a/C6A9mwXp9cTocDFgwOM8TvEEOTnGLVbZNSaRd05aacnUwIDi44YiTEzH6J1bD94G2SnPF/eBYkrrLXYVRxZPKPrmULth2jmTd3+dJpbAOq3V5zyM2qqi665pqCJaKcAviTHlV2wVr4yZTYalFwsKnJ5YZvhvPcTwntVoi1H2ViaXrwtoGu5EG1yrbpQanP9yXl7tkpI1jFe9aizOkHT/PXyT5sVvS91V7p1OkW4v3oH69SrG+8VIomv6sPb0qHijjONcpjKRy4BGXlIxRTb+nIkFqpgREa+dIpPDZJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DgSGfsylttZxmETDTlmcMpZS2XHV+PLgH0PcV5UyQAY=;
 b=hz28oCj+2dbmhwk1iQRMZahGBASjrqzomztiSVQzMsRZnxFU3uo4nSSGFl+iD/nPv1nngmcQTSYcUf0NnBbfXBqOpQugk+NSMw6J7fYuupLr9keF4iZGKNKlZipQ2LFM7oJWYPzg6OL84ygMU+2OUcuLVMErRpcyZE8bppSBdWIVYVwBIFNjN/FViVo9Cm7qLfFzrT7YMtBselKquFzvuQDuLMQTmbvLXcJ6RVHIeazei3/7S4loHQHYgPlDAwrXr3qs9PoR/aI1qci3GNOAu/d89/eaJ/MVTsI/pH0iNFI0EnlPPq/hSuf/3P0zWBMfrsR5n0UxeSHCNM2n4T6p0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DM4PR11MB5390.namprd11.prod.outlook.com (2603:10b6:5:395::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Tue, 10 May
 2022 06:45:32 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465%3]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 06:45:32 +0000
Message-ID: <50b247cc-ff03-bf64-ea56-bf043c9e9b15@intel.com>
Date: Tue, 10 May 2022 12:15:24 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [Intel-gfx] [PATCH v2 07/25] drm/edid: convert
 drm_edid_connector_update() to drm_edid fully
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, <dri-devel@lists.freedesktop.org>
References: <cover.1652097712.git.jani.nikula@intel.com>
 <aa04fb75f0c769122a17ee60dc92c2242983f3b8.1652097712.git.jani.nikula@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <aa04fb75f0c769122a17ee60dc92c2242983f3b8.1652097712.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0034.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::9) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f5723fc-b780-4b4a-5da0-08da3250ae07
X-MS-TrafficTypeDiagnostic: DM4PR11MB5390:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM4PR11MB53903F43B0589D5196B39EA2CEC99@DM4PR11MB5390.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iCeRAX6Zrbc8ynxBqbWW+8E9SGK+RJI8y+6dWe+Pdr8Pp4/t79znjprwuCzVJ0vteoz8WYoDvk6GvTe5HpCNOpi2rSK2oUWcLsdfx6+xjZgRufa/yzIuLKAMXJj3LS7nnQI86gP6YSsxYwwUlZJweR1zG7zZtz0UbcaQFoVTWyonWHSNwPbpywLi40nq9ciH/9T5ubOr9qdS9INXOaOfvLtfGKcCQBc1xFYuqW5n6sSaRyVD6fDLRlE1bZWrz2V14iQ3Ag/WUqo4gM15zeAYstH7awwygS50E363eOsOiesoOnik4aiTr2sib3Nx+TOFudHAFPZjephAjtlyDDL+HtAi2BMEJCuj1i6aoruxMHHjNPwXU1keKoBc2PP95NX+LyJ1oDExz5Fzm1upQ0dy/b4TM+SRCuZtTXJvsisd+tFio3YY1tRyVAW0P2yhvZiNiaLRwRnjsfyJiYrvcWDSbQLSjKeAff/x7hdqB38OJMt0rRIDI3SmcJWLCHzyHWVmyS19DdvNV3BVmTKuZAE90RtCXeWqUWG3i62mjNv7hpCwBp51iZKifxj9x3E+/g3rQgxFi0JSMzchvB1cqTlfEPoVvnkFJdjCyoS43UTJPyYLYhfm21DB60+diE5BIpMWvT4oCZwStkj+QvCgnR/IKZHL+ykXuFweC/oLIVNYrlB2/fl1n1UjELj8DT2mH4GvaApgqmn4IyW20U1mOln0NqC7U/Hnq52WOKR0KWJpx7lfRAB8Mt0axaZInDmrnWhgXGvC2c/9USbX1RQdgK+GLg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(26005)(508600001)(6486002)(6512007)(316002)(6506007)(186003)(6666004)(86362001)(31696002)(2616005)(2906002)(5660300002)(55236004)(53546011)(36756003)(82960400001)(83380400001)(450100002)(66476007)(66946007)(66556008)(4326008)(8676002)(38100700002)(31686004)(8936002)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWlmdXlhWGFBamx6SmF2WGlNQUFyVE0vb0ZjdDZxck1QeEMwS3NMZ3RjWFBD?=
 =?utf-8?B?eWsxeHQyRkVmZ3hzczlsY3VMTTUwQ2VSSTM2NzN0eHl3cFRpdGh0eVVaWDNU?=
 =?utf-8?B?NUszTWV3YnNHOU9xUmNxS3dxTFdjN1pJUEUyNkpFam83MTByemRJaXFNNjR4?=
 =?utf-8?B?eXFSVEoramNTOUN3OVFYY0ZETjJwMjJkRjFDWk9jL1RXSlhlU2UvQU50MytK?=
 =?utf-8?B?QWZmTnR0QWdKVWdLNUVsa1hpVjI4cGtZTEptcXlGR2g0R081US9rU2xJSk5o?=
 =?utf-8?B?TndKMnBNOC9UdDdxOHVaRVpNTUN1alBBUFJCUk1IZjcvakNOWTQ4eCtQYmxJ?=
 =?utf-8?B?ZWVabTdqKzVGaE4wS0p3MGRZME5DVHdzczlwWFZiU1NHQnBkMU5GdkdDYmhM?=
 =?utf-8?B?L0xhNHdUWVAxb1l5cGM3VjR3dHJBUU5QdjcxaTVFQjZsdG1LMWU0SU4zaHVt?=
 =?utf-8?B?MUlGV3htUzdSZVJmOUFKT1hDbGszbGpxWmNRT0NudHNSd1A5UGp4Ti9GOHAr?=
 =?utf-8?B?eUN2YmxWWEhFamZRODR0S1lRQWx4SjdnMm1lbi9ENThrOStEeEFNdTRjNFV6?=
 =?utf-8?B?VHhhQTlWb2pFS0d3ZUsyWTcvTEVBY1pwYTh2OG9KMzQ3Rnpjcy95RHNLZS9H?=
 =?utf-8?B?TnA2cVRETnhXeFZIV2NlZjAyTWhnbDVIMUlnaEJNUWl4NTFLYUJBSnVSaisr?=
 =?utf-8?B?dHZxVWlJYkMzT3FRRHZhZWYzZDF1T1Q1R3dYWEs5Ky8vSEd6aXRBd0VKWWw3?=
 =?utf-8?B?SlJDQ3pQVU9Ib05PQndxODZiRHo2Y1hQa0s1S1lFTTByMDExK3NudmIzczYy?=
 =?utf-8?B?MElML0tqcWZvNW5pTVBxM0ZqVXdtc3NRWTgyMXU4dHpJN1Bla0M2NDdmUE1M?=
 =?utf-8?B?WkZ1M0VTYXMzK2JhaWFuYXErSmFCS1NSMGVJeHlUaFNRUGE4OFdXOHl5MllJ?=
 =?utf-8?B?am50RHE4enMzbzNDdlAzQ25nTWp2cUYvQjdKcXVVTzRzSE9VWUJiaUJ5Wm9t?=
 =?utf-8?B?Q2NvTnQvUmRhSlFURWd4ajNqR0VIbGR5V21CeDBTUzRRSjNsdVMrYmg1NVA5?=
 =?utf-8?B?SzlRWnBoZWtSZ0xpZFVPU0kzaXZwcWJrb000MGh0S25WaWhicnY0NWp6OUxq?=
 =?utf-8?B?UnNHSHVYNHpKdk1KMWVOR1pMenBBZENhdzBBbytaM0tWaXR1Y2JLZlBLVVAr?=
 =?utf-8?B?MTB1ZkpETjk4eS9RWjUzR0JRaUFuWTFEUE1MM1JYTUlTZTA1SG1JTzZlWFdJ?=
 =?utf-8?B?Q1JYWlBJY3lUSGo5bWdiaGl6aGRKSGVQQU80RGNueXVhZTZtNk05bkdJVm1R?=
 =?utf-8?B?ZkM5MzA0c3VCei9ESWlDbnZMV1M4UWV1Qjhld2FFbnN2NW14S3AyREkvKy94?=
 =?utf-8?B?NHpQcTFSNzNxT2owbmhOeUNlcWZwcmljeGtvVXhLbmZiNXR6YUtXYVh3d2Rp?=
 =?utf-8?B?L3lvY3ByN2tXNUFxOVdReDduK213V1VxbTFIdzFMNlJDZjdsMVJOUU5QSndr?=
 =?utf-8?B?RDZibm9oQWIvaWR4TUQxVVRUREgvdVZNR2I3b29adTdnT2pjU1d3bkhQNStR?=
 =?utf-8?B?ejVoRjlvQ2FkSUgvMXVkOEdudFBZRE5vV0VHcWZzNWhjZ0tSVHRDWnVvQkxR?=
 =?utf-8?B?Q2p5RFRtWU5XazRFaWxEdjVMbEpZcE9nN2Fqdy9XM0dzUTEwejhNY3JPZUd2?=
 =?utf-8?B?c25oU1pDTTFiN2NIRlJYbDRsNitDNUlYTGNHV2NNMHBQcnFmcWd0Tlk3dG16?=
 =?utf-8?B?bHBXNXdMdlk5U0d2dUR0MmhrekNIRGJRUzJ0ZGU2Y0szaWNZRHMvTDBsb1pi?=
 =?utf-8?B?SlFCczV3alIzMFJ6MExvaHB3d3hQQ0lIaCsrUzF5WVBBT3crSlc0cUZxNzJQ?=
 =?utf-8?B?eHFUeVFROGNwOS9XY2QxazdLSWVqck1KbkRSVTE4Smd0aGVXK1R5RHRGclor?=
 =?utf-8?B?VlVwYUM2NGZXWjkrRHFlK0g5RTQvYWZ4T081S1JPVTM3RkY5dGQ4WkVXOElM?=
 =?utf-8?B?bWFGZzlJa3BLcjZqdjZNWnlEZmwwU2w5UllJeENZcEUyV2VNZWU5WUtCdlJJ?=
 =?utf-8?B?WnFUSU1KdUlzWUllVjV0OVdQWG9QNmN2UkxaR05aTWdlQ1U5WTBwK3hsNTVX?=
 =?utf-8?B?ekpBNTdiMXY3TXU5Y2Nub25NZU5UMldJVFBWd0RtbTBJYmJLRklKYk1rdVo2?=
 =?utf-8?B?Z29BWEdxOE0zNHlUb04rNjh3YkQrUzlCTGNRSW1zMS85aXB4eDUvNFVleVh0?=
 =?utf-8?B?dlFXMVpFeFo3d3BIOFlhQktScEJ3Y1pRTWgxKy9uc2NGSFFXTDdyWkxGZ2Vv?=
 =?utf-8?B?NjlmMWd2dVdFcTlUTmllTU1mNThBQUZZckZqUS9mNHU1K0tmZ3dUcHIxbkNq?=
 =?utf-8?Q?ikMD4OsF7QdirkWw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f5723fc-b780-4b4a-5da0-08da3250ae07
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 06:45:32.8273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SSvHwhsHCGGPNehQIe35hrg3+3405KdfqhGzPWiPcQwSsLK20G2oM30AbGSYn9Jv+SgZSDseHDPnYsjJffbPca7tDeM3oGjwrInr5KTGIkA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5390
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/9/2022 5:33 PM, Jani Nikula wrote:
> We'll need to propagate drm_edid everywhere.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/drm_edid.c | 95 ++++++++++++++++++--------------------
>   1 file changed, 46 insertions(+), 49 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index e4fdf742645b..f54699422bca 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -3253,16 +3253,16 @@ do_inferred_modes(const struct detailed_timing *timing, void *c)
>   	}
>   }
>   
> -static int
> -add_inferred_modes(struct drm_connector *connector, const struct edid *edid)
> +static int add_inferred_modes(struct drm_connector *connector,
> +			      const struct drm_edid *drm_edid)
>   {
>   	struct detailed_mode_closure closure = {
>   		.connector = connector,
> -		.edid = edid,
> +		.edid = drm_edid->edid,
>   	};
>   
> -	if (version_greater(edid, 1, 0))
> -		drm_for_each_detailed_block(edid, do_inferred_modes, &closure);
> +	if (version_greater(drm_edid->edid, 1, 0))
> +		drm_for_each_detailed_block(drm_edid->edid, do_inferred_modes, &closure);
>   
>   	return closure.modes;
>   }
> @@ -3312,10 +3312,11 @@ do_established_modes(const struct detailed_timing *timing, void *c)
>    * bitmap of the supported "established modes" list (defined above). Tease them
>    * out and add them to the global modes list.
>    */
> -static int
> -add_established_modes(struct drm_connector *connector, const struct edid *edid)
> +static int add_established_modes(struct drm_connector *connector,
> +				 const struct drm_edid *drm_edid)
>   {
>   	struct drm_device *dev = connector->dev;
> +	const struct edid *edid = drm_edid->edid;
>   	unsigned long est_bits = edid->established_timings.t1 |
>   		(edid->established_timings.t2 << 8) |
>   		((edid->established_timings.mfg_rsvd & 0x80) << 9);
> @@ -3338,7 +3339,7 @@ add_established_modes(struct drm_connector *connector, const struct edid *edid)
>   	}
>   
>   	if (version_greater(edid, 1, 0))
> -		drm_for_each_detailed_block(edid, do_established_modes,
> +		drm_for_each_detailed_block(drm_edid->edid, do_established_modes,
>   					    &closure);
>   
>   	return modes + closure.modes;
> @@ -3373,28 +3374,28 @@ do_standard_modes(const struct detailed_timing *timing, void *c)
>    * using the appropriate standard (DMT, GTF, or CVT). Grab them from EDID and
>    * add them to the list.
>    */
> -static int
> -add_standard_modes(struct drm_connector *connector, const struct edid *edid)
> +static int add_standard_modes(struct drm_connector *connector,
> +			      const struct drm_edid *drm_edid)
>   {
>   	int i, modes = 0;
>   	struct detailed_mode_closure closure = {
>   		.connector = connector,
> -		.edid = edid,
> +		.edid = drm_edid->edid,
>   	};
>   
>   	for (i = 0; i < EDID_STD_TIMINGS; i++) {
>   		struct drm_display_mode *newmode;
>   
> -		newmode = drm_mode_std(connector, edid,
> -				       &edid->standard_timings[i]);
> +		newmode = drm_mode_std(connector, drm_edid->edid,
> +				       &drm_edid->edid->standard_timings[i]);
>   		if (newmode) {
>   			drm_mode_probed_add(connector, newmode);
>   			modes++;
>   		}
>   	}
>   
> -	if (version_greater(edid, 1, 0))
> -		drm_for_each_detailed_block(edid, do_standard_modes,
> +	if (version_greater(drm_edid->edid, 1, 0))
> +		drm_for_each_detailed_block(drm_edid->edid, do_standard_modes,
>   					    &closure);
>   
>   	/* XXX should also look for standard codes in VTB blocks */
> @@ -3466,15 +3467,15 @@ do_cvt_mode(const struct detailed_timing *timing, void *c)
>   }
>   
>   static int
> -add_cvt_modes(struct drm_connector *connector, const struct edid *edid)
> +add_cvt_modes(struct drm_connector *connector, const struct drm_edid *drm_edid)
>   {
>   	struct detailed_mode_closure closure = {
>   		.connector = connector,
> -		.edid = edid,
> +		.edid = drm_edid->edid,
>   	};
>   
> -	if (version_greater(edid, 1, 2))
> -		drm_for_each_detailed_block(edid, do_cvt_mode, &closure);
> +	if (version_greater(drm_edid->edid, 1, 2))
> +		drm_for_each_detailed_block(drm_edid->edid, do_cvt_mode, &closure);
>   
>   	/* XXX should also look for CVT codes in VTB blocks */
>   
> @@ -3519,22 +3520,21 @@ do_detailed_mode(const struct detailed_timing *timing, void *c)
>    * @edid: EDID block to scan

This needs to be @drm_edid

With this changed:

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


Regards,

Ankit

>    * @quirks: quirks to apply
>    */
> -static int
> -add_detailed_modes(struct drm_connector *connector, const struct edid *edid,
> -		   u32 quirks)
> +static int add_detailed_modes(struct drm_connector *connector,
> +			      const struct drm_edid *drm_edid, u32 quirks)
>   {
>   	struct detailed_mode_closure closure = {
>   		.connector = connector,
> -		.edid = edid,
> +		.edid = drm_edid->edid,
>   		.preferred = true,
>   		.quirks = quirks,
>   	};
>   
> -	if (closure.preferred && !version_greater(edid, 1, 3))
> +	if (closure.preferred && !version_greater(drm_edid->edid, 1, 3))
>   		closure.preferred =
> -		    (edid->features & DRM_EDID_FEATURE_PREFERRED_TIMING);
> +		    (drm_edid->edid->features & DRM_EDID_FEATURE_PREFERRED_TIMING);
>   
> -	drm_for_each_detailed_block(edid, do_detailed_mode, &closure);
> +	drm_for_each_detailed_block(drm_edid->edid, do_detailed_mode, &closure);
>   
>   	return closure.modes;
>   }
> @@ -3588,7 +3588,7 @@ const u8 *drm_find_edid_extension(const struct edid *edid,
>   }
>   
>   /* Return true if the EDID has a CTA extension or a DisplayID CTA data block */
> -static bool drm_edid_has_cta_extension(const struct edid *edid)
> +static bool drm_edid_has_cta_extension(const struct drm_edid *drm_edid)
>   {
>   	const struct displayid_block *block;
>   	struct displayid_iter iter;
> @@ -3596,11 +3596,11 @@ static bool drm_edid_has_cta_extension(const struct edid *edid)
>   	bool found = false;
>   
>   	/* Look for a top level CEA extension block */
> -	if (drm_find_edid_extension(edid, CEA_EXT, &ext_index))
> +	if (drm_find_edid_extension(drm_edid->edid, CEA_EXT, &ext_index))
>   		return true;
>   
>   	/* CEA blocks can also be found embedded in a DisplayID block */
> -	displayid_iter_edid_begin(edid, &iter);
> +	displayid_iter_edid_begin(drm_edid->edid, &iter);
>   	displayid_iter_for_each(block, &iter) {
>   		if (block->tag == DATA_BLOCK_CTA) {
>   			found = true;
> @@ -3874,8 +3874,8 @@ static bool drm_valid_hdmi_vic(u8 vic)
>   	return vic > 0 && vic < ARRAY_SIZE(edid_4k_modes);
>   }
>   
> -static int
> -add_alternate_cea_modes(struct drm_connector *connector, const struct edid *edid)
> +static int add_alternate_cea_modes(struct drm_connector *connector,
> +				   const struct drm_edid *drm_edid)
>   {
>   	struct drm_device *dev = connector->dev;
>   	struct drm_display_mode *mode, *tmp;
> @@ -3883,7 +3883,7 @@ add_alternate_cea_modes(struct drm_connector *connector, const struct edid *edid
>   	int modes = 0;
>   
>   	/* Don't add CTA modes if the CTA extension block is missing */
> -	if (!drm_edid_has_cta_extension(edid))
> +	if (!drm_edid_has_cta_extension(drm_edid))
>   		return 0;
>   
>   	/*
> @@ -4666,14 +4666,14 @@ static void drm_parse_y420cmdb_bitmap(struct drm_connector *connector,
>   	hdmi->y420_cmdb_map = map;
>   }
>   
> -static int
> -add_cea_modes(struct drm_connector *connector, const struct edid *edid)
> +static int add_cea_modes(struct drm_connector *connector,
> +			 const struct drm_edid *drm_edid)
>   {
>   	const struct cea_db *db;
>   	struct cea_db_iter iter;
>   	int modes = 0;
>   
> -	cea_db_iter_edid_begin(edid, &iter);
> +	cea_db_iter_edid_begin(drm_edid->edid, &iter);
>   	cea_db_iter_for_each(db, &iter) {
>   		const u8 *hdmi = NULL, *video = NULL;
>   		u8 hdmi_len = 0, video_len = 0;
> @@ -5824,13 +5824,13 @@ static int add_displayid_detailed_1_modes(struct drm_connector *connector,
>   }
>   
>   static int add_displayid_detailed_modes(struct drm_connector *connector,
> -					const struct edid *edid)
> +					const struct drm_edid *drm_edid)
>   {
>   	const struct displayid_block *block;
>   	struct displayid_iter iter;
>   	int num_modes = 0;
>   
> -	displayid_iter_edid_begin(edid, &iter);
> +	displayid_iter_edid_begin(drm_edid->edid, &iter);
>   	displayid_iter_for_each(block, &iter) {
>   		if (block->tag == DATA_BLOCK_TYPE_1_DETAILED_TIMING ||
>   		    block->tag == DATA_BLOCK_2_TYPE_7_DETAILED_TIMING)
> @@ -5844,7 +5844,6 @@ static int add_displayid_detailed_modes(struct drm_connector *connector,
>   static int drm_edid_connector_update(struct drm_connector *connector,
>   				     const struct drm_edid *drm_edid)
>   {
> -	const struct edid *edid;
>   	int num_modes = 0;
>   	u32 quirks;
>   
> @@ -5854,8 +5853,6 @@ static int drm_edid_connector_update(struct drm_connector *connector,
>   		return 0;
>   	}
>   
> -	edid = drm_edid->edid;
> -
>   	/*
>   	 * CEA-861-F adds ycbcr capability map block, for HDMI 2.0 sinks.
>   	 * To avoid multiple parsing of same block, lets parse that map
> @@ -5880,15 +5877,15 @@ static int drm_edid_connector_update(struct drm_connector *connector,
>   	 *
>   	 * XXX order for additional mode types in extension blocks?
>   	 */
> -	num_modes += add_detailed_modes(connector, edid, quirks);
> -	num_modes += add_cvt_modes(connector, edid);
> -	num_modes += add_standard_modes(connector, edid);
> -	num_modes += add_established_modes(connector, edid);
> -	num_modes += add_cea_modes(connector, edid);
> -	num_modes += add_alternate_cea_modes(connector, edid);
> -	num_modes += add_displayid_detailed_modes(connector, edid);
> -	if (edid->features & DRM_EDID_FEATURE_DEFAULT_GTF)
> -		num_modes += add_inferred_modes(connector, edid);
> +	num_modes += add_detailed_modes(connector, drm_edid, quirks);
> +	num_modes += add_cvt_modes(connector, drm_edid);
> +	num_modes += add_standard_modes(connector, drm_edid);
> +	num_modes += add_established_modes(connector, drm_edid);
> +	num_modes += add_cea_modes(connector, drm_edid);
> +	num_modes += add_alternate_cea_modes(connector, drm_edid);
> +	num_modes += add_displayid_detailed_modes(connector, drm_edid);
> +	if (drm_edid->edid->features & DRM_EDID_FEATURE_DEFAULT_GTF)
> +		num_modes += add_inferred_modes(connector, drm_edid);
>   
>   	if (quirks & (EDID_QUIRK_PREFER_LARGE_60 | EDID_QUIRK_PREFER_LARGE_75))
>   		edid_fixup_preferred(connector, quirks);

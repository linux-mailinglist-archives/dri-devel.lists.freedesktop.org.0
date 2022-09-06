Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D08885AE798
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 14:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE28710E62A;
	Tue,  6 Sep 2022 12:17:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4288710E62A;
 Tue,  6 Sep 2022 12:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662466626; x=1694002626;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+6mE913jXryVRY62JV0coW0X5VGt4p8ugqH7mdFgycs=;
 b=iT3Ny2I48s1QwdJkNR08G4nh0uwdNWaGzg6+jJiZ0yAZQTCt9GTogUMC
 YYYPOR0TpguirbpaCDRhEfxqtUBNoMGaSbO9y0icOwkk81fMePV7pfRIt
 WqLla/q1OO23R91+tlDZo2ooGYmXs9dc26S/jgB+AplIDZ20AYqD2T8oe
 b/oce2V4tz0hbJK5w0zDx7lqtkqkbZfsnbcLj2t09bOWL/7WecAh27qEf
 SxRT806zJ5QygllQ3VyfOIR5uldYL2V2zzuJ+cZar+CTNLz8P25PXsGyT
 Xx0/Hh7eXCMxO2h5gGIHD+vWYDtxBWm035MqQVHdNyh9TuaXkLbonjyhz g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10461"; a="296577834"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="296577834"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 05:17:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="789662360"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 06 Sep 2022 05:17:04 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Sep 2022 05:17:04 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Sep 2022 05:17:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 6 Sep 2022 05:17:04 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 6 Sep 2022 05:17:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BI4Z5QOkW8xigKcABufOnI3X9OHBKcqjXflX12AOaLp1/CcD7IoETiHkHX1op3zbSi0oSBVFHsEvBgjd+pLF6Sv4HAedjMZafRMNvhsV3Bh08DgpEeUs3Hspna0l7vu7GcEU9tSEXst2Qe9xR+pjjutuVF7gdKFdQL3y0LlacDnwHiOJlNiZ+HQpktoSdw+CD9hrB22e1VjTamEc82EDPRRTVIDvGhQeKYoYRe6Z2dGtWw8GAa1mxIHdsYCPDQhzT7Kjl4HD/oYzWbRjwY+tXaZcwPjRkMCFXulB6JPNfC1DksfMK11m4LnhJpEl0gluxEIa4aqQA5flZlYV8bul3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LRHqqyjTV6GB4WIZL/R9z+oFTf4KOwPJl8+d4zmrk3Y=;
 b=RW//9qEcNFpSKJVIb44e1Mp659ADqkztgxiUplVx1rFRdSahYIT3ZuSE1PckrKim+V6gyJ4g6wyAoHP2XqjpLKk2IoKnsNQVTmVzzLbkLswGURRbKL8fcFBBne8ylLx4Vt05JbcE5m6ScljK9d9avCg62eD/m+atGMAIqYGuDYYdebWFFjfxKDHpqq+UVrCyfzFgVe7lyizW+jMD/wohv6Q0XJ/LoVb+ra2db92BP0uUu71zEi8O14NWjQZOeS/uOikS6XoHddpisYXGZD0LXpmoic+1h2Kz3+c/Yd5ut2TMFm7dgF/lWysB1FzdRrSo1OWkjyJ+OCye168bSgPsFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 DM4PR11MB5567.namprd11.prod.outlook.com (2603:10b6:5:39a::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10; Tue, 6 Sep 2022 12:17:02 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::fc2f:babb:578c:f03e]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::fc2f:babb:578c:f03e%6]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 12:17:02 +0000
Date: Tue, 6 Sep 2022 17:46:53 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v4 04/11] drm/i915/mtl: Define engine context layouts
Message-ID: <Yxc6NQ9pJgMxbDDu@bala-ubuntu>
References: <20220902060342.151824-1-radhakrishna.sripada@intel.com>
 <20220902060342.151824-5-radhakrishna.sripada@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20220902060342.151824-5-radhakrishna.sripada@intel.com>
X-ClientProxiedBy: PN2PR01CA0208.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::16) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 364cde4e-7e32-4d35-400e-08da9001b40a
X-MS-TrafficTypeDiagnostic: DM4PR11MB5567:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JITCjXbC0QQEwdr42U44fB3Ul76rjuwR4jyjF30vp2i/4ckS2enNRru9txWP707EszrwblMR85ith3K3PqtTzmKjqg0Gp/GbWHGVCy6m9UllqZYnHgE4luMLMZkQ8YrhOvqJp1ptYQsDNdhgkATrRFWby884/hPY+6B/HTDP/WwrsjlwknHYj+6xlj1BhwWDg43Wtr9MioJAyR8syqTscbc0NIcwiOa2NCJkuWPvEH6xyyiEG9G3g4rded4YLGy6pHCGMG0KIdDvUFSgfK6evJKJ5TnGvh/EXS96Yi/itb9kiJH0XMS+bV/N5gpPeGODENBVB7LrNtMt19b8jBdl6R5Ajp/wpH2lbJxMeminKb/oELECQjjfooTMuBxD/Rvpu8G2Hi+xFNo/jos3jAPvgv8r0d6gfwwkc2yJQrn0EZgINxh9ms7r367kh8MuBVgnmqudmRZl6HguNzbbUNlaWwX36SoIwsuEHOBSEKVex9SpFXpkRmbIJsIBk/YdML+0kIB1SPnBw8g2+MQWvFIJd4KpbbqYlgit/CsBALd944xh9lKpFTtCr1q/EzLLeRnISXapbV+PU/ubPlEMrkLexhRfNiQoj2VXMTRJulQGFs+2zPABfQN0LjG3pOYO6qSI29vM1KA+jLOwDQra0Yffn6mMG/D9pJAcecB2hC6GqHPN1rF2zFaIWtL43M/Sp1uBGQziA7omeSP0UkZZEY+FkA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(396003)(136003)(39860400002)(376002)(366004)(346002)(5660300002)(8936002)(44832011)(38100700002)(6666004)(6512007)(26005)(9686003)(86362001)(53546011)(41300700001)(6506007)(83380400001)(186003)(33716001)(2906002)(82960400001)(66946007)(316002)(450100002)(66476007)(4326008)(478600001)(8676002)(66556008)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkVsMmlLR1JGUWRKUkRKcFJBcVFSZmU2L2JpYkpsZ0xucWNGRlRTcHUrME42?=
 =?utf-8?B?VkZhbnl5M3BQL0dEWWhFcG5kUjQrQ3JPOE9wTlZyNUF6cE5LT2c5RWZuODFz?=
 =?utf-8?B?Qm9aOWlXb0hVZUR5am96cm9DUTZtYzNJRzNITVp2K2YzSnNhcS9BZWxuaEND?=
 =?utf-8?B?OUwyQ09lb08vSXdCUGRLYlY3Nk13RFJ5Z1lCc3U5QU5DSGNpYUpJTUpsdDl6?=
 =?utf-8?B?cGJsM09oVkVsZjFUZ3ZLMHJ1Q29TVExpMzE0a0h5VDBrcU1YMTlCcUIyb3lP?=
 =?utf-8?B?VUppZTNQdmhTTlhGdUtDWmpvdXRVeGdSTWZGeHcwTEdjYnNrV05JM01LWkts?=
 =?utf-8?B?bDRxRXBQUjUwenJJd05IbG5HLzlHMjhPL1V4SEVCRXdKUG1RdWdpWVJqbGVV?=
 =?utf-8?B?eDVST3dVTVZYUmtJYVJJRE0rdDllTHlHZGVvM2I4N2RzZzJIVGVycXB2L3lm?=
 =?utf-8?B?Zm9nQlBFUUgvK085M3ltNDlHYnZpQ3d2aDh3UFZzUlVOZkhhdWdRNTQyR3Ew?=
 =?utf-8?B?Y3pUZk9EWjd3cFBxVnREU2twZVY1VnRmZzh5THpmNVI2NmU1V2liME9BOHBn?=
 =?utf-8?B?dDZFNzlzeGxMdmVuamtXa3FWaWVUL1E1UklJUkh1bHduS3JibHBNMmNQUTQr?=
 =?utf-8?B?WnJkR0xmaHBkTENYcC80T3U1a0hHbE1LTFRrc3QzSGdBbHRtMCsrUGFQS2tG?=
 =?utf-8?B?VElHVGNxajhvWnkzSFFlYW92eWFHd2M4MW9xRTIwQy9rbC92K0ZYbER3ZWc4?=
 =?utf-8?B?dWo3NE9Tekc5czY1bUN3amtzT0ZONUNRSE1jMzlLejBqQXh1TGNRaVNWU0VE?=
 =?utf-8?B?c2ZOeGpVQno5SzNwUkpEVG9oY01icWY3Z1pKVCtQcTlCU21BVVovOUhWYUNr?=
 =?utf-8?B?NFNITjYzQlZFK29YSDJlR0ZWWnArNEJ2NFJkOUtmL2k2OENsM3VTSERUZ0VY?=
 =?utf-8?B?Q3dKdDF2Tm1WZnhmZmZtdVBiYVZjM2s0L09mc2c3c2pFY0dtdFhBMmtsTGhj?=
 =?utf-8?B?d3Z4dVBNc2ZML3JhQ3ZTdGg0bEREeC9rSGQ2VVZtTUM1ZU80M1ZteTRiL3F3?=
 =?utf-8?B?RENqbU1oTzhjSk5xWmVkVmNKdmJxb09ST1ZMWHh3Vis2OTJhdHMzT1FKYS9s?=
 =?utf-8?B?R1NGTWtjTXhXVWtSZUlSeG5GQXFTMWpONktVMFlPWUVlVUNoSDBMaWpIak8y?=
 =?utf-8?B?L2pYQkN5bXhoQUIrRW9hdDJkNmlLOWtCUWR4bTFqa2N3VFVSbzAvOE1oc083?=
 =?utf-8?B?RkViYmFnR21TNVZ3ZHlyWTYxYkhrbE9lazZKbFpaNGNWNklDT3J5eXFYUjBF?=
 =?utf-8?B?K05ZaDF0QmNJcm5BTXhXQWU5bmRZQ2RWeHMrVGMvOHJqNDhFck5xV0FkSTBK?=
 =?utf-8?B?Ny9ScHdKOWRjRjhwU0pCV0NkWE4vT2Vudyt3K216SzZuSnh5OWo2YkxFd3Ew?=
 =?utf-8?B?SCt1bm9rdnJkREtyNVVadkNUTlpCdGVBMVdpVzMxeGppWHZ4a1lFakx3Tnha?=
 =?utf-8?B?bC80M24rZTdoZjFESkFjanFtWllzaU1DS0gwWGN3bjNobWNYYmJ5ZGQ0Njg1?=
 =?utf-8?B?RFNzWm5Qd1JWeFYwemxDVmZiVy9janlyTHhXOVAxVG92UzJVam1RWHIrMGZ6?=
 =?utf-8?B?aXI3dDR6NlRURVlNRjFFU25QbHB3SGRUZ05heVplS3J4KzRhTVcvTllFNFFP?=
 =?utf-8?B?bXVOQVg4aWNBODVWenViREJUSUFyTEdhOUhMNkNXaEJpU0V0Z2hnVncxTlFm?=
 =?utf-8?B?bEl1REJVb1Yrc1NkdUpFQjkvemJoZkxROFVvaDQyUkZWdFRiRjlKSUZlUEpY?=
 =?utf-8?B?N1FIbFovT2QrTmNYMTlsT2NKclBJM0dvVm5yVXA3U1dlMklmUmxVZm1lK1hL?=
 =?utf-8?B?OTlsRXBMZmo2SUFUTEpLVWh5aW9JUDJVNE4rODJ1OGtUdjlDYVpQbWNOcDhC?=
 =?utf-8?B?d21uRGc5akc5c09uTEo1VE1ENy9hZk96U0pFTjZZeVJiT0ZNQU1tOUg4T0VI?=
 =?utf-8?B?RDIyR2NTak1rTEpBN0tidGtDUG9HbEZ2TENIOVZneDhEWHBtSjUzSitSQkVS?=
 =?utf-8?B?Z2MvVGxMMWwvTnZiRWJmZzd2cTczaE1zbDZrUllDQ2huR0JkdVlUZndEWTl4?=
 =?utf-8?B?ZWVDZG9mQTZvUWZFYmRaUk0yY1dLY05XMUhHc3k3bklLeENSTHo2SUtBRzdr?=
 =?utf-8?Q?onoZmih8V0ouTXmOVqkmqmQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 364cde4e-7e32-4d35-400e-08da9001b40a
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 12:17:01.8940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BJsX65hYkiyS6+C58wTPIbwO2MOSBRF2y5CxUHMTu7qfBvPY7Dj7om/51yeRpwF/q3pvjdAjsZ6DwGwZZ0zgtVSHdY/p+TtJm5NPe+kaM/Quc8qUeoE89QHCG4xwhMDp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5567
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

On 01.09.2022 23:03, Radhakrishna Sripada wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> The part of the media and blitter engine contexts that we care about for
> setting up an initial state are the same on MTL as they were on DG2
> (and PVC), so we need to update the driver conditions to re-use the DG2
> context table.
> 
> For render/compute engines, the part of the context images are nearly
> the same, although the layout had a very slight change --- one POSH
> register was removed and the placement of some LRI/noops adjusted
> slightly to compensate.
> 
> v2:
>  - Dg2, mtl xcs offsets slightly vary. Use a separate offsets array(Bala)
>  - Drop unused registers in mtl rcs offsets.(Bala)
> 
> Bspec: 46261, 46260, 45585
> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_lrc.c | 81 ++++++++++++++++++++++++++++-
>  1 file changed, 79 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> index 070cec4ff8a4..ecb030ee39cd 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> @@ -264,6 +264,38 @@ static const u8 dg2_xcs_offsets[] = {
>  	END
>  };
>  
> +static const u8 mtl_xcs_offsets[] = {
> +	NOP(1),
> +	LRI(13, POSTED),
> +	REG16(0x244),
> +	REG(0x034),
> +	REG(0x030),
> +	REG(0x038),
> +	REG(0x03c),
> +	REG(0x168),
> +	REG(0x140),
> +	REG(0x110),
> +	REG(0x1c0),
> +	REG(0x1c4),
> +	REG(0x1c8),
> +	REG(0x180),
> +	REG16(0x2b4),
Comparing Bspec 45585, there are few NOP missing here
> +
> +	NOP(1),
> +	LRI(9, POSTED),
> +	REG16(0x3a8),
> +	REG16(0x28c),
> +	REG16(0x288),
> +	REG16(0x284),
> +	REG16(0x280),
> +	REG16(0x27c),
> +	REG16(0x278),
> +	REG16(0x274),
> +	REG16(0x270),
> +
> +	END
> +};
> +
>  static const u8 gen8_rcs_offsets[] = {
>  	NOP(1),
>  	LRI(14, POSTED),
> @@ -606,6 +638,47 @@ static const u8 dg2_rcs_offsets[] = {
>  	END
>  };
>  
> +static const u8 mtl_rcs_offsets[] = {
> +       NOP(1),
> +       LRI(13, POSTED),
> +       REG16(0x244),
> +       REG(0x034),
> +       REG(0x030),
> +       REG(0x038),
> +       REG(0x03c),
> +       REG(0x168),
> +       REG(0x140),
> +       REG(0x110),
> +       REG(0x1c0),
> +       REG(0x1c4),
> +       REG(0x1c8),
> +       REG(0x180),
> +       REG16(0x2b4),
> +
> +       NOP(1),
> +       LRI(9, POSTED),
> +       REG16(0x3a8),
> +       REG16(0x28c),
> +       REG16(0x288),
> +       REG16(0x284),
> +       REG16(0x280),
> +       REG16(0x27c),
> +       REG16(0x278),
> +       REG16(0x274),
> +       REG16(0x270),
> +
> +       NOP(2),
> +       LRI(2, POSTED),
> +       REG16(0x5a8),
> +       REG16(0x5ac),
> +
> +       NOP(6),
> +       LRI(1, 0),
> +       REG(0x0c8),
> +
> +       END
> +};
> +
>  #undef END
>  #undef REG16
>  #undef REG
> @@ -624,7 +697,9 @@ static const u8 *reg_offsets(const struct intel_engine_cs *engine)
>  		   !intel_engine_has_relative_mmio(engine));
>  
>  	if (engine->flags & I915_ENGINE_HAS_RCS_REG_STATE) {
> -		if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 55))
> +		if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 70))
> +			return mtl_rcs_offsets;
> +		else if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 55))
>  			return dg2_rcs_offsets;
>  		else if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 50))
>  			return xehp_rcs_offsets;
> @@ -637,7 +712,9 @@ static const u8 *reg_offsets(const struct intel_engine_cs *engine)
>  		else
>  			return gen8_rcs_offsets;
>  	} else {
> -		if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 55))
> +		if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 70))
> +			return mtl_xcs_offsets;
> +		else if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 55))
>  			return dg2_xcs_offsets;
>  		else if (GRAPHICS_VER(engine->i915) >= 12)
>  			return gen12_xcs_offsets;
> -- 
> 2.34.1
> 

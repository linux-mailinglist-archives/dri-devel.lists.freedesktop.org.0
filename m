Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE045B1050
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 01:22:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17B2B10E902;
	Wed,  7 Sep 2022 23:22:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D84B210E901;
 Wed,  7 Sep 2022 23:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662592963; x=1694128963;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8y59AJOfn4znnZUsu+Cxo9PMaRH/99PTQPXi5DNBKHU=;
 b=NxXppHdYR7+iBxOh4nQnER/KbHtaQjPjtra20VKeruXn7XfXgTU97Jea
 zPgdcaj3zxJzPhPA+5X3Q+g9q0Zm37bhHS1D2oLtCYXJGmM9QkLTau3Rf
 T+MJ6GOaJ/tdTo0ntPiODwK97wNYO6959yDvxOYHUg19wyKy61r8zZs79
 yhmjN/y9E0y1eawi4U6DICkdRqeZ/MDXLyi1R4FngS5uP2sP+XtTzaaad
 QDlzK3LlGK4f8ZmBBt852rQzn/2AKpWEFuT2B3icyANFyem//xQxLqb4C
 2luw2xaj0UiEuxIuBekh+jVXGy/GLetPkisnzwDCYlNsVoU1/Gp1yyE4H g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="280050872"
X-IronPort-AV: E=Sophos;i="5.93,298,1654585200"; d="scan'208";a="280050872"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2022 16:22:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,298,1654585200"; d="scan'208";a="591917936"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 07 Sep 2022 16:22:39 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 7 Sep 2022 16:22:39 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 7 Sep 2022 16:22:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 7 Sep 2022 16:22:39 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 7 Sep 2022 16:22:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X4dgso52o3SZnfiVw03c1XSCoo1eD8hNi5CyzraD9GLffEltuuoTfMZJgXuSuW1y38khvKHE0w4JOtAQtzD+fW44AA2dkEtNognWwjm9vxQJD6j6oRmk+chB7sBWPbSQC2dWt6qfRDHccGlzZh1JnYsVZKM6tyoKz/cBsKQ1Cc+bWKAKRNApWcYB+DUkGMjjXJDqIB1Rj5dxkFH4o7TFup3ScqicTmbFIhwIh1hn2QRxhdODbyxGYjuitlAKaS38CCa5bR6zbafHvSHz7h5JePJPfUQayvLGCC1lS3hZ+o4SPiahvUp/rsHNti9gTMO6CLWgvDWYzBwevZjcIzd2UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9eFEfkjrYN23OFQsl4oq49Wf/Y2pa2kJiETN7AFeVfQ=;
 b=Bo5uMxmDqZmL4zKLN0ZQXIPsp+An0sLf59GTAtKgROyA57lodYLh38iaIik6yE2eoDwOw/Ge47BjPDhDwI6i5K8hZxByCyRTerYFxqlToi6zbQLCtc4wkjDegGAkCxYFylboU/Breb3EHzJdL+whuuc2EP19Y9UE+ZDjzIgdySBbWIt7m0mQZXKYbp6xo+A8a1z3uQwEPnn7cnAsi1yWUf0FJ0dFcMcszPLnBe/Ex5qugGXlWxtTJYkg0ITUDgNbrqPQvszDcccSN4G4hhtL15G5K1wtrXVr53S4V/+A8Koowsr2qct11hxW2nGlLIob6Azlw2ZPBX59vwO2Vxnaow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by DM8PR11MB5752.namprd11.prod.outlook.com (2603:10b6:8:13::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Wed, 7 Sep
 2022 23:22:18 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514%12]) with mapi id 15.20.5588.015; Wed, 7 Sep 2022
 23:22:18 +0000
Date: Wed, 7 Sep 2022 16:22:16 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/i915: Invert if/else ladder for frequency read
Message-ID: <YxknqIf//0aYbVFh@mdroper-desk1.amr.corp.intel.com>
References: <20220907203041.1651514-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220907203041.1651514-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0213.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::8) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d05a8d80-47bd-4021-0909-08da9127cece
X-MS-TrafficTypeDiagnostic: DM8PR11MB5752:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UM5sY6aJYbUrfK9OszJGwvaSRCDDWTm6GBHk1XnCcvXunO1LmmFmx+F71mfFmokpg+DtA6kw2TZl0vk8ftlIfksEbNxdYUSKk209HFoKRnmxVz3y1DBhnCBlpy5ivG+J18Qsu5odgvwvZYCLgFQLNKyEtUJAQDVD7q9BD3IVX9LZpA14bSX7ZEmulLIEcc7zrTMjQEMVLuM/yVQand1H9hoU+jHrWN5E8jMBWW1EHlV/v8kz+091h+6UFfWnn+g0mXOZe+dfkpXVXErAn/GXVqtzFGWoCW7vsxWrxCUlyiMtP9oo9egGcNDaLOGEwYWU76BpxMQGL/A35ZRxWi5sspCi0OPwkpkLF/QV1i8B8ovksFh4XA0B6YCt6M5qkzhYlHux5NNFtCEchzPClbvKszGtkWU4GFI+Y7bMqmwhUQC+UXwhJzM7k03RlhormIOGFZB6zQgpNa5ZtYT3JlF5GjetyzOF+rBYcrc1NntZQW9LycmcSRIrbF+bqtLi7A00rkJB+jVHi2Ak/4JHwfnqn9eG4WKClblKw4YcTjP9erWe9EoNSeFA4hdSIQ/JGYcWu1tTfCLV4C3KPKzQ7dwqkKOx49AKR26YE8Hey6D/llvsltAhBeF+38QQ+lzG15HQI39LEIXFkXDcXuOVNdEEJl4IAJViqZ2X+5ObK8wi0SWNsoeLaRYUUE5T6fjiRrtKou+ojKB9JKnTgOo8AB4FVg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(396003)(136003)(376002)(39860400002)(346002)(6862004)(8936002)(5660300002)(478600001)(6506007)(450100002)(4326008)(8676002)(66476007)(66556008)(66946007)(2906002)(86362001)(38100700002)(316002)(6636002)(83380400001)(6486002)(41300700001)(26005)(6512007)(82960400001)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmh0cDFjUVN6czlDYnFHa2l1b2R2UmQ2L3h1NXBoeHpTbU45UXJ0Wm1uQStr?=
 =?utf-8?B?OGR1WmhsdDBXMHZJME9wSXRicXdUNm1YQThEakZFQ25XTlQ5UE5mVWlDMU4w?=
 =?utf-8?B?bjJjSjJNSHNLVTI5VXJRbHh2VGk2M2RxK0RVSmRGNjR0bXJJajRZd095Nk85?=
 =?utf-8?B?SHc3L3o3ZUZuUXptNFZJekIxdkZrdzZrbzltN2RwS1dxbTNTMU9oL3lxM2Vl?=
 =?utf-8?B?OGVaM3kxdXFiejlVeWl0MDdhNnFneEx5dlZ2VTdVL1FTRHlPbkRwazYzQ2oz?=
 =?utf-8?B?dllmTnhzdnRGVk5hUUhJd1kvZCs5eWMzRkpHOUMwOHBoR3o2ZS9SNVR5Q0tN?=
 =?utf-8?B?UkRxNlNhK1FZZXdMcGtNdzBSS0tHMW9GZVcvUUNqc3Rhd3JMSUI5QWRLMmJK?=
 =?utf-8?B?bmUyV2Z3RkhOQkkxQWdiZjJIYXYzUDU3SWd1bU9wSDczU0Y5cGQrbGpVcFFx?=
 =?utf-8?B?OUZTeTF6Nm1ESEJ5SzQyRFhtL2Y4M0ZBWDAwM2Vkb25OOHZmdFdyMGlFdUtX?=
 =?utf-8?B?UytTMEs3NUdnU1M4Zlp4UnlyTmhTbnZGalhiVGtyUVhJL093bGpScmhoUFRB?=
 =?utf-8?B?cUJLT0lkUTNzVWJoeGk4am51NlBnNThKQTBFL01nL3krLzB1U3J5eFlncEdQ?=
 =?utf-8?B?VzMzRDUyeGk1S0lkKzN5N3h3SllEZHlsQkorT2tmSUF2emNEV0VXYTQ4bjlm?=
 =?utf-8?B?cDg5c2NLN3NMSnBJZWJGQllhNm1jNzBQSUE2NXh4UFVoNE4xaTVFcWdnMmcr?=
 =?utf-8?B?SlBYckpHQ1BoQzdiVWVoUFkyV2xYc20wK3poQkV3K0k5aDlaMDhPMGVTWS9p?=
 =?utf-8?B?ajVuSXA3SXMvblFtSTRpcFlhUzI3QVg3dTVrUHF6SVBXZ0NnK05CaVIvT3J0?=
 =?utf-8?B?YzdYRHFaVERScVI1RkZlTXdoYTg1aFIwRTd4TjEyZUVBT1ZBdDBoWUpwSEtp?=
 =?utf-8?B?c2p3ZDJubXp1Ym5YRDNBeXBpT3B5RXRUSUNsQ2UwQ04zNWFFTmdaMzFFcGwy?=
 =?utf-8?B?NmNpamR4b24wdmM5dDlpVlNvcG5QTldqQm1ZZmN2ckd3ZWdFbW81eG50QzR0?=
 =?utf-8?B?K0VwZC9waWlKTmo2Y1ZIRzdvT1RvUjVyQndDdTY1NDdHUjFUQTkyZnErLzRa?=
 =?utf-8?B?S2VTK1BpMm5SZUE1dHZDMUFTVVJXUkxFUGVZRi82OWltdUhTTEdYUVQ5SlJu?=
 =?utf-8?B?UUw3YzIrbzVJZWJEbXpGOEFBZkp4eHJOUzRKN2JYTGg1b2lEcHVjT1QzM2Qr?=
 =?utf-8?B?UURpSS8rL2dpb0lpWDQ4aSsvUUxyN2x5Z3V3SXg5cngrSkEwbmNMUHVSbWQ5?=
 =?utf-8?B?Szl1YlJuM2dnQXVKODB4QjhmODVVaUEwcWQxNXdyN05LVHhVMnhrMkRvU05w?=
 =?utf-8?B?V2tTemdEcVlMcGIxSUc3RWJvQ1NTcm1SMGtwZEZxdkNIbHZrMFd6VkVGcjl1?=
 =?utf-8?B?eXNaWVZjWWx6aFFHT1I4MWM2SjlpK2JiZGpKa25UNFovNHlnQjJJKzRQazIx?=
 =?utf-8?B?MEMxS3pIemEwc2dFSTRYNnFBTUQxd0lFVlpDNTFCSUl3eTJnSlprSFp2Mmoy?=
 =?utf-8?B?RHdmaittdjBFR2d4ZmNldWswMERCS1JRSSt3YW9pNmpubEtadkw0Vkhpai9z?=
 =?utf-8?B?dkJ1V0ZaQS8xVjlZSjYyNytScVZ0ZjZnTDFOMng1eGNkcUdOTE4xR1BHcVlB?=
 =?utf-8?B?NHNNZXJFNStwU2pFWFJHZDMzaStaWGVEK1FGUHdVbjFMbTVOM3hwdDI5Yy9w?=
 =?utf-8?B?dkhIK3ZYK1MwNFZQT010cGxtaEh2TlF4ZEVyQ2RLMjRaR1JPamdOYUdxM1Zl?=
 =?utf-8?B?T3ZHaTZSbWtkeG9yMWFRekJtYUJHWTZ0R0JnQzJrWjFIZWxoYk1yRUVkZ2Jr?=
 =?utf-8?B?WGpGSXljYVhGcmh5MmJjbEo3MGQ2YlViUFAvbFp4cC92NVdGUDdWQkppK2p3?=
 =?utf-8?B?T3EvM1FYNDJaeTh0UFZaN1RGVVpudmI5OHVQT2Z6eGlodlhvTG01dUtpc05O?=
 =?utf-8?B?V0t0a1FpRXVRWVlYVmRhd010dTd3M3FPemRsdVZ4YjMwaEswMFJLSDUzeWc5?=
 =?utf-8?B?YU9SUHZycWttSXJkSlo2NWdiUkJ3MjlKOHBIaTA0bFVLQmZmOTJpUU1STXdy?=
 =?utf-8?B?V05RWkFTeGY2UWgzcFpOeisyMzQyUmIvclFPd2hKUjJhMGRic0VoN0NsUXZw?=
 =?utf-8?B?VHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d05a8d80-47bd-4021-0909-08da9127cece
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 23:22:18.7270 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8gyBIroIilNRMa5YOnTkNhGGsjAS/L/bApyHNTFOhjg6GKd5fW1OKCkBu9aXaPyOkggVkn2hSgGcyZ5eGEvQKm3YRIou1TXdylS36m4bP6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5752
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 07, 2022 at 01:30:41PM -0700, Lucas De Marchi wrote:
> Continue converting the driver to the convention of last version first,
> extending it to the future platforms. Now, any GRAPHICS_VER >= 11 will
> be handled by the first branch.
> 
> With the new ranges it's easier to see what platform a branch started to
> be taken. Besides the >= 11 change, the branch taken for GRAPHICS_VER == 10
> is also different, but currently there is no such platform in i915.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  .../gpu/drm/i915/gt/intel_gt_clock_utils.c    | 77 +++++++++----------
>  1 file changed, 37 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c b/drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c
> index d5d1b04dbcad..93608c9349fd 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c
> @@ -78,77 +78,74 @@ static u32 read_clock_frequency(struct intel_uncore *uncore)
>  	u32 f19_2_mhz = 19200000;
>  	u32 f24_mhz = 24000000;
>  
> -	if (GRAPHICS_VER(uncore->i915) <= 4) {
> -		/*
> -		 * PRMs say:
> -		 *
> -		 *     "The value in this register increments once every 16
> -		 *      hclks." (through the “Clocking Configuration”
> -		 *      (“CLKCFG”) MCHBAR register)
> -		 */
> -		return RUNTIME_INFO(uncore->i915)->rawclk_freq * 1000 / 16;
> -	} else if (GRAPHICS_VER(uncore->i915) <= 8) {
> -		/*
> -		 * PRMs say:
> -		 *
> -		 *     "The PCU TSC counts 10ns increments; this timestamp
> -		 *      reflects bits 38:3 of the TSC (i.e. 80ns granularity,
> -		 *      rolling over every 1.5 hours).
> -		 */
> -		return f12_5_mhz;
> -	} else if (GRAPHICS_VER(uncore->i915) <= 9) {
> +	if (GRAPHICS_VER(uncore->i915) >= 11) {
>  		u32 ctc_reg = intel_uncore_read(uncore, CTC_MODE);
>  		u32 freq = 0;
>  
> +		/*
> +		 * First figure out the reference frequency. There are 2 ways
> +		 * we can compute the frequency, either through the
> +		 * TIMESTAMP_OVERRIDE register or through RPM_CONFIG. CTC_MODE
> +		 * tells us which one we should use.
> +		 */
>  		if ((ctc_reg & CTC_SOURCE_PARAMETER_MASK) == CTC_SOURCE_DIVIDE_LOGIC) {
>  			freq = read_reference_ts_freq(uncore);
>  		} else {
> -			freq = IS_GEN9_LP(uncore->i915) ? f19_2_mhz : f24_mhz;
> +			u32 c0 = intel_uncore_read(uncore, RPM_CONFIG0);
> +
> +			if (GRAPHICS_VER(uncore->i915) >= 11)
> +				freq = gen11_get_crystal_clock_freq(uncore, c0);
> +			else
> +				freq = gen9_get_crystal_clock_freq(uncore, c0);
>  
>  			/*
>  			 * Now figure out how the command stream's timestamp
>  			 * register increments from this frequency (it might
>  			 * increment only every few clock cycle).
>  			 */
> -			freq >>= 3 - ((ctc_reg & CTC_SHIFT_PARAMETER_MASK) >>
> -				      CTC_SHIFT_PARAMETER_SHIFT);
> +			freq >>= 3 - ((c0 & GEN10_RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK) >>
> +				      GEN10_RPM_CONFIG0_CTC_SHIFT_PARAMETER_SHIFT);
>  		}
>  
>  		return freq;
> -	} else if (GRAPHICS_VER(uncore->i915) <= 12) {
> +	} else if (GRAPHICS_VER(uncore->i915) >= 9) {
>  		u32 ctc_reg = intel_uncore_read(uncore, CTC_MODE);
>  		u32 freq = 0;
>  
> -		/*
> -		 * First figure out the reference frequency. There are 2 ways
> -		 * we can compute the frequency, either through the
> -		 * TIMESTAMP_OVERRIDE register or through RPM_CONFIG. CTC_MODE
> -		 * tells us which one we should use.
> -		 */
>  		if ((ctc_reg & CTC_SOURCE_PARAMETER_MASK) == CTC_SOURCE_DIVIDE_LOGIC) {
>  			freq = read_reference_ts_freq(uncore);
>  		} else {
> -			u32 c0 = intel_uncore_read(uncore, RPM_CONFIG0);
> -
> -			if (GRAPHICS_VER(uncore->i915) >= 11)
> -				freq = gen11_get_crystal_clock_freq(uncore, c0);
> -			else
> -				freq = gen9_get_crystal_clock_freq(uncore, c0);
> +			freq = IS_GEN9_LP(uncore->i915) ? f19_2_mhz : f24_mhz;
>  
>  			/*
>  			 * Now figure out how the command stream's timestamp
>  			 * register increments from this frequency (it might
>  			 * increment only every few clock cycle).
>  			 */
> -			freq >>= 3 - ((c0 & GEN10_RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK) >>
> -				      GEN10_RPM_CONFIG0_CTC_SHIFT_PARAMETER_SHIFT);
> +			freq >>= 3 - ((ctc_reg & CTC_SHIFT_PARAMETER_MASK) >>
> +				      CTC_SHIFT_PARAMETER_SHIFT);
>  		}
>  
>  		return freq;
> +	} else if (GRAPHICS_VER(uncore->i915) >= 5) {
> +		/*
> +		 * PRMs say:
> +		 *
> +		 *     "The PCU TSC counts 10ns increments; this timestamp
> +		 *      reflects bits 38:3 of the TSC (i.e. 80ns granularity,
> +		 *      rolling over every 1.5 hours).
> +		 */
> +		return f12_5_mhz;
> +	} else {
> +		/*
> +		 * PRMs say:
> +		 *
> +		 *     "The value in this register increments once every 16
> +		 *      hclks." (through the “Clocking Configuration”
> +		 *      (“CLKCFG”) MCHBAR register)
> +		 */
> +		return RUNTIME_INFO(uncore->i915)->rawclk_freq * 1000 / 16;
>  	}
> -
> -	MISSING_CASE("Unknown gen, unable to read command streamer timestamp frequency\n");
> -	return 0;
>  }
>  
>  void intel_gt_init_clock_frequency(struct intel_gt *gt)
> -- 
> 2.37.2
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation

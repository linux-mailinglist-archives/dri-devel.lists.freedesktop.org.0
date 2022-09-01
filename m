Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 364495AA3BC
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 01:31:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EB1B10E39B;
	Thu,  1 Sep 2022 23:31:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F97710E39B;
 Thu,  1 Sep 2022 23:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662075096; x=1693611096;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KdDrGxgxWuBJT0g8Q0i6PT6J8hBWdcK7W1DT4z1xd/k=;
 b=RgS9LtM1CBF8vj2IN2OoQqe2sglTrl6jYz1zvQTamMPYsiGKYI1zLQLn
 fTI/0g+t5y4+YIqH5+3j869dpHJ9EN/tr+tenUqE0HTc2D4e8zsAAoWlf
 iJnUzwwUzWzWyf7BZGycocvpFp4X/yc+QfIn00YmapELfCYEbTMs6ONae
 ph+G4P2X/P0ezcq7cXumlHkfoV8gHLBbfpGUvoYZwdo5pdwD/9EYx7KuV
 Vv8KAIbs1KtBQLYVRX2zmIX8VF+qzU1wHZmQtUScm8LcybuCepYznCf0E
 zADZv8a06WNcn6aObIuiUtY6LxdJWouPEpxx1GQWFAYUqIMquNVBTxtZ5 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="382150866"
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; d="scan'208";a="382150866"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 16:31:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; d="scan'208";a="755038756"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga001.fm.intel.com with ESMTP; 01 Sep 2022 16:31:36 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 1 Sep 2022 16:31:35 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 1 Sep 2022 16:31:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 1 Sep 2022 16:31:35 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 1 Sep 2022 16:31:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vtp6vqIxy6UZ6oSAJMa/873pswFRmCGpDw7T+dKZgeYb2H89K+5mxwDKZRHbUwKnpngazJx3lASUcTg15vDHXYh6/TowvoT2yUYhFqY5F6r5Gk5mozLLfqQY9Hxw2quGB+QuhlH8bH8S1qLJvrxPjQa3KhSXCedEq5ZreeDjeKt9UZr1LIeiIXhEohZiy1n7g3Xtm+ANeavyzoJ2itmCVzkRUcev0hggMJew94ErZgbV95KZgcUeWNg1Z3L/qNoDfZzho2keDyZascko0QAz9VgNOixN/PHikdaMKG8GUrYP2amBe+UKqL8wV9/3PyN99uZv443wMJdsko4TqVkVjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gjESd9h++0B5UhZAw1eqOm8ZuBNnl1u/UJDZT3X6TfU=;
 b=CUmnSGaZV9nQNpcTDXpvoEyaxD5jNEbJ1R6fnD2luFSek3pFqDAK9mlF45uqE6LNojDvltoU5bNjtGv4NEen+sOR2aaQ8EHKDbf7q4V4PBPBkrkkM88T10M4FvoNkD7k9XJKz0W3vudYkBV+okQfWnJr3o9aPfL0zeCCC+fO448HzeZu12cCmb9aDqVbOSTZnZbd0qtHeAJUH1oAsK94e1gX9QXbRZs+jsGZ/J+9WW6YV1d80zc9KB7ZcfrHffCqAzfX8fPrxUDvBUx8P2Wf/PXniPzAEM5GzfkIQlCVNk+eMqrY6Xo5TOoqA04zvMfWay8ZEhq6GRaPktqc0DSKRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DS0PR11MB6349.namprd11.prod.outlook.com (2603:10b6:8:ce::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.11; Thu, 1 Sep 2022 23:31:34 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::1977:59e7:5a28:24e1]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::1977:59e7:5a28:24e1%9]) with mapi id 15.20.5588.012; Thu, 1 Sep 2022
 23:31:33 +0000
Message-ID: <ee2553bb-3b74-1b3d-d467-d4457105c5f7@intel.com>
Date: Thu, 1 Sep 2022 16:31:31 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [Intel-gfx] [PATCH 6/8] drm/i915/xelpmp: Expose media as another
 GT
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20220829170238.969875-1-matthew.d.roper@intel.com>
 <20220829170238.969875-7-matthew.d.roper@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220829170238.969875-7-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0001.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::6) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71277e56-ca95-4b44-a7bd-08da8c721b3c
X-MS-TrafficTypeDiagnostic: DS0PR11MB6349:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E02YqobI/EuMovrt4LRNW6jTGcuDXpaRBzMSDU5ezkm8w5dCjg0rKnHW1L5R8lmptuKcl4G9qRhIKUS36ueAGTekXRPvvnkym1aJ8xMPKlOk6yVysnsGqcFI1yIjcUaUXAW4krKTwvt7cB5DpBAe6WXdyjGaXnKEHffQyk7o4ZJhLDIaDUeCaC6aYK2VTsEgZdpVaqE5mQ+j+bgP+XCofK7/qq6BUOWr9d+xR7hyEvC9WVuXOIkU9tUUf/CDIlEK2YGY6tUIk1zAqE3cPysgGfJUKqyif7j41QDs8gQ1WSVon75gNzBhYRhTlGNGmD2UUoqHnr38h1r2r8DHOpR79xy+GCHcM5lx4zSEoiI3OK1LTmV1H1OsSKjBjxzA5uAL50csBTlSqGMKZ2IwPq+TnALVLgELG1YtovWowVLpSX4V1Lc/J233EEaXkCdT1k8Xol2BQRkQkL5Nnf8AQCq6bNMFJ8aERnAR6/9FonZ0rZZIXvGBfbvZYQjA25ZeghQokrPG0c70RdPBFC/WKEeaGBYTSUEOvSqDZOD85Z2jJOXQqmpPa9V2I8peRTiWw2yH1kKN03QfVByBS1/CppYUCnastiTzuBPiPQR8zdezY+PWymI/1ZwEYN+FcqYWwAhM7pWbceJtiJ405235wteDuC+oQSvQu6GZMbnd0M0qSENcPoJt2bBAOosqLP9gj7HM7tB0gB6LVnT6mMNyvwEjxRfYkRa/OiJCDgpJ5zKlrE9oBzm0OTZEo36QDJmK/2ThS9qPQu6iCTh2TUjajaFCVg1Rk/az4TmmFAn0wm3fX7k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(136003)(366004)(346002)(376002)(39860400002)(2616005)(83380400001)(186003)(8676002)(316002)(66946007)(450100002)(31686004)(6486002)(478600001)(66556008)(36756003)(4326008)(66476007)(41300700001)(26005)(6512007)(86362001)(5660300002)(53546011)(8936002)(31696002)(6506007)(82960400001)(38100700002)(2906002)(30864003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVBSbVZJMStBUjREbGNEOEcrclJqOWZyU1IwNTFWMTA1VzFrVmxXRmExbXRw?=
 =?utf-8?B?WFhGOWZVMFg4MHZ0SU9veHZxY1phbXRTQ05YbDJaSWd4T2xCWk42UU80QjhS?=
 =?utf-8?B?aVhQa3l3TzR0VjUzN0t2d01VVXRMQU5rS0p4R01FM0QxaVB4ckcvWi9iWlRh?=
 =?utf-8?B?dzExcldUNVVOa2RxK3EvSGExTGdmSXM0TkcwM1AyYUh1NVcxaWp3SG1kVTNO?=
 =?utf-8?B?VHR1bFJPOGh3TGhIckJVTDE4T3YxVEwvbFplN1pPek9mWW5Jdi9DWEYwNHl6?=
 =?utf-8?B?QTRYamo4RHorTnh1eDBhZkUrMEtBVDJzUnJCdlFVMWNwcUNFaDA2UTZGVkcy?=
 =?utf-8?B?cGx1T3pEaVVZZGxUZ053RnBBVXlTN0lPTmN1NG9PdGl2ZWNPR0Z1M2FwTGwz?=
 =?utf-8?B?NnNBdFJsZmcxb3R2TGZZTjBiOE5LTFMxZjY0Z1k4SzRUVzloOTR1LzgreG9l?=
 =?utf-8?B?MmlpU0FVT29YR3k0UGpLb295d3R4Z3AvbUNXZ3duNDFwQkJXRytqUm1ZUFFU?=
 =?utf-8?B?WnpFd3p2WWlUVkowcWJ6eldwVHlWU2QxUUtHTzRBRXBnTHVVRG15aWJxMHdx?=
 =?utf-8?B?cWtJS1pTZ0huMk40V1FpTUNiK1V2MDFpNmIydVErRHBPT21Hdy90WWlTeHdV?=
 =?utf-8?B?YmI2RUowY0ZwL3Vuc1BiVmI2bWQ2VmVyRnpKaTIrdUZhSHcwRk4wNVZmRWpx?=
 =?utf-8?B?Sjl6dmM2OGFHYm1nOEI0ei9ZK1gxV2xEZmVhemtyZ2NON0h6bXU3cHBFN1ly?=
 =?utf-8?B?eTd0d2RnaUtEWEo2cFRNczJzSDQ1Zzd5Wk5zQ0VxV2Y4UlZ0dmF6UlZGZXlN?=
 =?utf-8?B?bmZvYlE5Sm1kY2dRWno1eEdENmZJL0JBby9qdXFCekxiS2JxT0REQUVkSlVj?=
 =?utf-8?B?ZnZGNGZYdy95dmpLa0ZmVlBJd04vNnV2WGZrbUhPR3d5NElqZW5rWW9KOGVn?=
 =?utf-8?B?amJZRXpRS1lCWGovM2I5RFZsWW52WThSZWVoaDJkbi9lWEZhNU5pbDN5UWlw?=
 =?utf-8?B?TjM5dE1PUnI0ZFRMMTcrWVh6cjRYY3ltZGlBdStiUjhYTGE5V3dpOE1TYWt6?=
 =?utf-8?B?WVVxM0N5b2h5YzFIY21kdHlHeno5RW5FbGdUSVlWNW9NRkc4S2pkbHQ5SlJO?=
 =?utf-8?B?RUFtd3M2SjFOM2JoWVZBeTFJYUFNTklPOWhXYVkrOUV2UXlFQXlXNU1UM0Ex?=
 =?utf-8?B?cW5lRUowZlVXczVXR0F3ZVlNMFpCbjdxTVcySGhIUWptdzd4d29MaUhkRllF?=
 =?utf-8?B?RmVqT2UwcE5EN015cVRhcUJCWFZmdEhvR2pXai94c2NiWHpDbmMxNHl2cTA3?=
 =?utf-8?B?MlRaaHovQ3Z4d0p6V1FlcnluN1ZJeVdZUG9jaDFoa3A3cWp5Y1dWUExKR2hE?=
 =?utf-8?B?a29jb2JJOTFBMGlxQ1U2eXo4d09Xc1hDdEFPWXBxakZ1NmMwYmxuNmNVZDNy?=
 =?utf-8?B?Q1RobWwxYlovTjVjT1dMc1RHTHhsSG5RVGRmR3J2RFJlYTZReklPTE1sRGRR?=
 =?utf-8?B?dmZiK1ppb25iS1FPakxBNFVjSzJublNvTTFOTVZ5amRCelcwZC9RTittTWVh?=
 =?utf-8?B?cSs5YUlTWG9zVWE1b3V5YzAxUGxPNEgvems1YTNZR25YZHdGK3RXcHQranVI?=
 =?utf-8?B?azB3aVA5bFJWQlJPcmljenJTZUpTQkF2alpuaEVsT1lBMGZnd0o4WTl6MWFR?=
 =?utf-8?B?YVR2alZrbWFpM2RTNURTbEdLQ2hDUHNEMXpmckl1N0NvQmtqaXh6L0ZOQzJG?=
 =?utf-8?B?SEV5RThuZzlrcS9FbVZBL1ZkMTM2MGxPcytST3J2TlVKcjRhRUU3ZWk2UTB6?=
 =?utf-8?B?dVdFMmRrNUdWL0h6RzBtRGtZbUdNV0FHcG96TldHZUNvUXczVHNwNkNxL0dZ?=
 =?utf-8?B?TjdCV2p5VXJoc1RRS3BKM2VZT3hkN2ZjSGFLTXhIeTFzNWZPZm42NnBPaEI0?=
 =?utf-8?B?bjNFUHQxZ0E0eTlzZ2pjZUs0bzZ1N1libTdsdU02NVpsZUU0Z25rU0ozbjdE?=
 =?utf-8?B?OGJNY0tJNUFscWZlQmZqbE5tcHRweDc3L3BwbWxYcnF6NDAzN3I5MmxSVTU1?=
 =?utf-8?B?VElkVWdjbEN3ZHErZGtUbVg5NCswSzNGMkVDUmt2anhWcTEyZzNJSjc4SFp3?=
 =?utf-8?B?WFlDK2NyLzkyM2k1VmhzbHd2ZnNyMlhORWxkSFNLMUxreU9UeE5leGpSR2lu?=
 =?utf-8?Q?+V2jImduJNb9EDFVwbYPxWc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71277e56-ca95-4b44-a7bd-08da8c721b3c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 23:31:33.8871 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XU2AvhJ5i6z0Mb2rrHuXW/KsxUmSVPqgo9ePrmfyxYFZzaF7SQMvDcBALiqrbOCMyY2D7LB2AxY/9Be9Obmlhb5b2uJoty7QdHaHumIIK/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6349
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



On 8/29/2022 10:02 AM, Matt Roper wrote:
> Xe_LPM+ platforms have "standalone media."  I.e., the media unit is
> designed as an additional GT with its own engine list, GuC, forcewake,
> etc.  Let's allow platforms to include media GTs in their device info.
>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/i915/Makefile            |  1 +
>   drivers/gpu/drm/i915/gt/intel_gt.c       | 12 ++++++--
>   drivers/gpu/drm/i915/gt/intel_gt_regs.h  |  8 +++++
>   drivers/gpu/drm/i915/gt/intel_sa_media.c | 39 ++++++++++++++++++++++++
>   drivers/gpu/drm/i915/gt/intel_sa_media.h | 15 +++++++++
>   drivers/gpu/drm/i915/i915_pci.c          | 15 +++++++++
>   drivers/gpu/drm/i915/intel_device_info.h |  5 ++-
>   drivers/gpu/drm/i915/intel_uncore.c      | 16 ++++++++--
>   drivers/gpu/drm/i915/intel_uncore.h      | 20 ++++++++++--
>   9 files changed, 123 insertions(+), 8 deletions(-)
>   create mode 100644 drivers/gpu/drm/i915/gt/intel_sa_media.c
>   create mode 100644 drivers/gpu/drm/i915/gt/intel_sa_media.h
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 522ef9b4aff3..e83e4cd46968 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -123,6 +123,7 @@ gt-y += \
>   	gt/intel_ring.o \
>   	gt/intel_ring_submission.o \
>   	gt/intel_rps.o \
> +	gt/intel_sa_media.o \
>   	gt/intel_sseu.o \
>   	gt/intel_sseu_debugfs.o \
>   	gt/intel_timeline.o \
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index d21ec11346a5..2a29502289cb 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -776,10 +776,15 @@ void intel_gt_driver_late_release_all(struct drm_i915_private *i915)
>   	}
>   }
>   
> -static int intel_gt_tile_setup(struct intel_gt *gt, phys_addr_t phys_addr)
> +static int intel_gt_tile_setup(struct intel_gt *gt,
> +			       phys_addr_t phys_addr,
> +			       u32 gsi_offset)

This is only called from intel_gt_probe_all with gsi_offset = 0, so the 
extra param isn't really used at this point. I'm guessing the intent 
here is to keep the function params the same as intel_sa_mediagt_setup, 
so we can assign this to gtdef->setup() for "normal" extra tiles on 
xehpsdv and pvc. Maybe add a comment about it above here, so no one 
accidentally optimizes this out?

>   {
>   	int ret;
>   
> +	/* GSI offset is only applicable for media GTs */
> +	drm_WARN_ON(&gt->i915->drm, gsi_offset);
> +
>   	if (!gt_is_root(gt)) {
>   		struct intel_uncore *uncore;
>   
> @@ -832,7 +837,7 @@ int intel_gt_probe_all(struct drm_i915_private *i915)
>   	gt->info.engine_mask = RUNTIME_INFO(i915)->platform_engine_mask;
>   
>   	drm_dbg(&i915->drm, "Setting up %s\n", gt->name);
> -	ret = intel_gt_tile_setup(gt, phys_addr);
> +	ret = intel_gt_tile_setup(gt, phys_addr, 0);
>   	if (ret)
>   		return ret;
>   
> @@ -862,7 +867,8 @@ int intel_gt_probe_all(struct drm_i915_private *i915)
>   			goto err;
>   		}
>   
> -		ret = gtdef->setup(gt, phys_addr + gtdef->mapping_base);
> +		ret = gtdef->setup(gt, phys_addr + gtdef->mapping_base,
> +				   gtdef->gsi_offset);
>   		if (ret)
>   			goto err;
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 94f9ddcfb3a5..05a40ef33258 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -1576,4 +1576,12 @@
>   
>   #define GEN12_SFC_DONE(n)			_MMIO(0x1cc000 + (n) * 0x1000)
>   
> +/*
> + * Standalone Media's non-engine GT registers are located at their regular GT
> + * offsets plus 0x380000.  This extra offset is stored inside the intel_uncore
> + * structure so that the existing code can be used for both GTs without
> + * modification.
> + */
> +#define MTL_MEDIA_GSI_BASE			0x380000
> +
>   #endif /* __INTEL_GT_REGS__ */
> diff --git a/drivers/gpu/drm/i915/gt/intel_sa_media.c b/drivers/gpu/drm/i915/gt/intel_sa_media.c
> new file mode 100644
> index 000000000000..8c5c519457cc
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/intel_sa_media.c
> @@ -0,0 +1,39 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2021 Intel Corporation
> + */
> +
> +#include <drm/drm_managed.h>
> +
> +#include "i915_drv.h"
> +#include "gt/intel_gt.h"
> +#include "gt/intel_sa_media.h"
> +
> +int intel_sa_mediagt_setup(struct intel_gt *gt, phys_addr_t phys_addr,
> +			   u32 gsi_offset)
> +{
> +	struct drm_i915_private *i915 = gt->i915;
> +	struct intel_uncore *uncore;
> +
> +	uncore = drmm_kzalloc(&i915->drm, sizeof(*uncore), GFP_KERNEL);
> +	if (!uncore)
> +		return -ENOMEM;
> +
> +	uncore->gsi_offset = gsi_offset;
> +
> +	intel_gt_common_init_early(gt);
> +	intel_uncore_init_early(uncore, gt);

Where is the initialization of this uncore completed (i.e. call to 
intel_uncore_init_mmio) ? Can't find it in follow up patches and without 
it the register access on the media GT would be broken since the 
function pointers in the uncore struct won't be set. Not a blocker since 
this is still early enabling, but I'd prefer if this limitation (and 
follow up remediation plan) was stated in the commit message or cover 
letter.

> +
> +	/*
> +	 * Standalone media shares the general MMIO space with the primary
> +	 * GT.  We'll re-use the primary GT's mapping.
> +	 */
> +	uncore->regs = i915->uncore.regs;
> +	if (drm_WARN_ON(&i915->drm, uncore->regs == NULL))
> +		return -EIO;
> +
> +	gt->uncore = uncore;
> +	gt->phys_addr = phys_addr;
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/i915/gt/intel_sa_media.h b/drivers/gpu/drm/i915/gt/intel_sa_media.h
> new file mode 100644
> index 000000000000..3afb310de932
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/intel_sa_media.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2021 Intel Corporation
> + */
> +#ifndef __INTEL_SA_MEDIA__
> +#define __INTEL_SA_MEDIA__
> +
> +#include <linux/types.h>
> +
> +struct intel_gt;
> +
> +int intel_sa_mediagt_setup(struct intel_gt *gt, phys_addr_t phys_addr,
> +			   u32 gsi_offset);
> +
> +#endif /* __INTEL_SA_MEDIA_H__ */
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index 857e8bb6865c..7183778a69c2 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -26,6 +26,9 @@
>   #include <drm/drm_drv.h>
>   #include <drm/i915_pciids.h>
>   
> +#include "gt/intel_gt_regs.h"
> +#include "gt/intel_sa_media.h"
> +
>   #include "i915_driver.h"
>   #include "i915_drv.h"
>   #include "i915_pci.h"
> @@ -1114,6 +1117,17 @@ static const struct intel_device_info pvc_info = {
>   	.display.has_cdclk_crawl = 1, \
>   	.__runtime.fbc_mask = BIT(INTEL_FBC_A) | BIT(INTEL_FBC_B)
>   
> +static const struct intel_gt_definition xelpmp_extra_gt[] = {
> +	{
> +		.type = GT_MEDIA,
> +		.name = "Standalone Media GT",
> +		.setup = intel_sa_mediagt_setup,
> +		.gsi_offset = MTL_MEDIA_GSI_BASE,
> +		.engine_mask = BIT(VECS0) | BIT(VCS0) | BIT(VCS2),
> +	},
> +	{}
> +};
> +
>   __maybe_unused
>   static const struct intel_device_info mtl_info = {
>   	XE_HP_FEATURES,
> @@ -1127,6 +1141,7 @@ static const struct intel_device_info mtl_info = {
>   	.media.ver = 13,
>   	PLATFORM(INTEL_METEORLAKE),
>   	.display.has_modular_fia = 1,
> +	.extra_gt_list = xelpmp_extra_gt,
>   	.has_flat_ccs = 0,
>   	.has_snoop = 1,
>   	.__runtime.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,
> diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
> index e0b79dc0fccc..eb4bcf65e91e 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.h
> +++ b/drivers/gpu/drm/i915/intel_device_info.h
> @@ -247,14 +247,17 @@ struct intel_runtime_info {
>   enum intel_gt_type {
>   	GT_PRIMARY,
>   	GT_TILE,
> +	GT_MEDIA,
>   };
>   
>   struct intel_gt_definition {
>   	enum intel_gt_type type;
>   	char *name;
>   	int (*setup)(struct intel_gt *gt,
> -		     phys_addr_t phys_addr);
> +		     phys_addr_t phys_addr,
> +		     u32 gsi_offset);
>   	u32 mapping_base;
> +	u32 gsi_offset;
>   	intel_engine_mask_t engine_mask;
>   };
>   
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
> index 6841f76533f9..be88fb95cb45 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -1780,10 +1780,15 @@ __gen2_read(64)
>   #undef GEN2_READ_FOOTER
>   #undef GEN2_READ_HEADER
>   
> +#define IS_GSI_REG(reg) ((reg) < 0x40000)
> +
>   #define GEN6_READ_HEADER(x) \
> -	u32 offset = i915_mmio_reg_offset(reg); \
> +	u32 offset; \
>   	unsigned long irqflags; \
>   	u##x val = 0; \
> +	if (IS_GSI_REG(reg.reg)) \
> +		reg.reg += uncore->gsi_offset; \
> +	offset = i915_mmio_reg_offset(reg); \

I was initially confused here on why you were modifying reg.reg to then 
extract it, but then I realized other function further down use the reg 
variable as well, so this would adapt it for them all. However, it still 
seem weird to me to use both offset and reg in an interleaved way in the 
code and IMO we should converge on one. It looks like there is only one 
use of "offset", so maybe that's the one we can drop. Not something that 
needs to be done in this patch, just reflecting on it.

>   	assert_rpm_wakelock_held(uncore->rpm); \
>   	spin_lock_irqsave(&uncore->lock, irqflags); \
>   	unclaimed_reg_debug(uncore, reg, true, true)
> @@ -1885,8 +1890,11 @@ __gen2_write(32)
>   #undef GEN2_WRITE_HEADER
>   
>   #define GEN6_WRITE_HEADER \
> -	u32 offset = i915_mmio_reg_offset(reg); \
> +	u32 offset; \
>   	unsigned long irqflags; \
> +	if (IS_GSI_REG(reg.reg)) \
> +		reg.reg += uncore->gsi_offset; \
> +	offset = i915_mmio_reg_offset(reg); \
>   	trace_i915_reg_rw(true, reg, val, sizeof(val), trace); \
>   	assert_rpm_wakelock_held(uncore->rpm); \
>   	spin_lock_irqsave(&uncore->lock, irqflags); \
> @@ -2265,6 +2273,10 @@ int intel_uncore_setup_mmio(struct intel_uncore *uncore, phys_addr_t phys_addr)
>   
>   void intel_uncore_cleanup_mmio(struct intel_uncore *uncore)
>   {
> +	/* The media GT re-uses the primary GT's register mapping */
> +	if (uncore->gt->type == GT_MEDIA)
> +		return;
> +
>   	iounmap(uncore->regs);
>   }
>   
> diff --git a/drivers/gpu/drm/i915/intel_uncore.h b/drivers/gpu/drm/i915/intel_uncore.h
> index 6100d0f4498a..1b7311a4b98b 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.h
> +++ b/drivers/gpu/drm/i915/intel_uncore.h
> @@ -135,6 +135,16 @@ struct intel_uncore {
>   
>   	spinlock_t lock; /** lock is also taken in irq contexts. */
>   
> +	/*
> +	 * Do we need to apply an additional offset to reach the beginning
> +	 * of the basic non-engine GT registers (referred to as "GSI" on
> +	 * newer platforms, or "GT block" on older platforms)?  If so, we'll
> +	 * track that here and apply it transparently to registers in the
> +	 * appropriate range to maintain compatibility with our existing
> +	 * register definitions and GT code.
> +	 */
> +	u32 gsi_offset;
> +
>   	unsigned int flags;
>   #define UNCORE_HAS_FORCEWAKE		BIT(0)
>   #define UNCORE_HAS_FPGA_DBG_UNCLAIMED	BIT(1)
> @@ -298,14 +308,20 @@ intel_wait_for_register_fw(struct intel_uncore *uncore,
>   static inline u##x__ __raw_uncore_read##x__(const struct intel_uncore *uncore, \
>   					    i915_reg_t reg) \
>   { \
> -	return read##s__(uncore->regs + i915_mmio_reg_offset(reg)); \
> +	u32 offset = i915_mmio_reg_offset(reg); \
> +	if (offset < 0x40000) \

Any reason not to have IS_GSI_REG() defined in this header and used here?

Daniele

> +		offset += uncore->gsi_offset; \
> +	return read##s__(uncore->regs + offset); \
>   }
>   
>   #define __raw_write(x__, s__) \
>   static inline void __raw_uncore_write##x__(const struct intel_uncore *uncore, \
>   					   i915_reg_t reg, u##x__ val) \
>   { \
> -	write##s__(val, uncore->regs + i915_mmio_reg_offset(reg)); \
> +	u32 offset = i915_mmio_reg_offset(reg); \
> +	if (offset < 0x40000) \
> +		offset += uncore->gsi_offset; \
> +	write##s__(val, uncore->regs + offset); \
>   }
>   __raw_read(8, b)
>   __raw_read(16, w)


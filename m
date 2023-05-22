Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A94F370CC93
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 23:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF48D10E0D8;
	Mon, 22 May 2023 21:34:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E084C10E0D8;
 Mon, 22 May 2023 21:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684791277; x=1716327277;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hP341iR1cF8Zn97A7/amA4zAIYZr/XbbXOJeZEI54OA=;
 b=cF6hRm8wcxTKXVoN77cCNOy4+ntJvWbEsB0xyJWLFjtOOz1M/qc0fy4L
 LSL8WGJtW9F7R825V71i02V+5prlPxcNspZvaMbGNQwdsMvkM7/809EMM
 ANjckM5k7QhgqePZiTbSjET/QI9seK0nRN1JgfVUn+haeglpILKNOPgLw
 0ogEa3dR+mG2fjs/Zm57lYdb4DqGxAACekZcqCN/TpaCfCiINsSABdJ9M
 c36xV+/usgIpVux6ifqcjn1TcpxSCvz0epBmUtu/mh5yZjHmJtyP5mBed
 NHPkUU0xcwzUBahXbnNVrxmyIk29lVpRrrlAF3umDxTOjFRxuLhNuphb1 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="332661133"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="332661133"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 14:34:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="703678655"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="703678655"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 22 May 2023 14:34:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 22 May 2023 14:34:35 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 22 May 2023 14:34:35 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 22 May 2023 14:34:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQX3JwH5Xpa7qj9FYYQt9i5bXdXE9bichxGRzrcH522mpdEtEVmHalS+LblK6V+nxSlLxBQOWUm+ZwhGjr8L4JXwYJDtATfjJ2Gluu6SZs5ULuUjazyrQophP8G9ijeXOFKSUGVlrpTMW5HHLg+3SLGHlEbbSFCzlUWRWEtBRvfJ4oytuaDF7Eck7k4jDEDz7TR4PnQNeyUxn+FCVkyIRIU9R2O1GQ4omAC4eVfJubpQtMCIWAiYVuf2QY9kj4p3RnG9oO1XDp88iSHisl49C55MzMWbgX0rk18UXOVxUXLHoUq81yxUn5AgPplj1Z2UcPG5lW0LczG9fnw9lhYb7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+3TcjYkJWWDGh4LQHPuNGtTb5WuoAqXZWs/gqDAXMck=;
 b=eZNTQyxq6ki3VUpXIb6K2B9DuCNhY8hz+YggHuY+P0851YX9dnAd2I6dCwWcgjxeNa80HGJhR4hFJo9m+FT2Dm/lLEZCaZsHrf1QsrbRxTDdBg4VtwlNU0iFfWiZFpZpaUiX2bt1PLkIEJl1Yw2Rk6rshnMEi0LoYhQwQ7HA2xJCCWYF8mh+IlNqpQkBwnpWtQ+CuTOR+cEgtPW4gnn7jJatAaQiaeWyA0fWzy22Qx1UAIrfoUInOhb9zLy1YEk2Q0/UPwxOIl814W4KzxlBvr+rIOVp0sMsa8X2iqLgV4AqQVY/T5AINJLP467RsUSNkbEjpNsl0iDfEO9v7d6G6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 DS0PR11MB7558.namprd11.prod.outlook.com (2603:10b6:8:148::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.28; Mon, 22 May 2023 21:34:34 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::daaa:41e1:8dc4:d281]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::daaa:41e1:8dc4:d281%7]) with mapi id 15.20.6411.028; Mon, 22 May 2023
 21:34:34 +0000
Date: Mon, 22 May 2023 14:34:18 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH] drm/i915/perf: Clear out entire reports after reading if
 not power of 2 size
Message-ID: <ZGvf2pYJkdEGZRLp@orsosgc001.jf.intel.com>
References: <20230522201749.4094742-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230522201749.4094742-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::19) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|DS0PR11MB7558:EE_
X-MS-Office365-Filtering-Correlation-Id: 216e8aa5-541e-426e-4f93-08db5b0c5589
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Po7skZ9WGZ/faE4kXRbUro/kniCuaNkw5fmXNRnPvvAHiBQwgvOJyM+poK0IJwpn28lYQtSXrZOKcf8uwske8F62iXgakDtuzrwHbRHfs+Ha2Fr9g25MF3ksoC5PFiiv7j9f1/KcuPpIbow3rVkTkfvCl43HqrRi5CnyNm5vY9C9cp7AczvZTt25dtFxeghn29W9x6r+QrdqZPO31I5M7cQsr46hTOPngAHVqmPgh/qclvlWhN4K5v1S18nGlEuRZFO2veGXySf5e/bmgXsJIQDHEtxtrC0ka4LgfPxQtPo4pJ5YAjkHnGLm38vWMn8w766+yijC7MM5dHojkEab/aa22H37ViAIiaapsKGhTJ/cFiW6Zcf6MakQc458pwWj2RQaKb527TGI8sKWG7rzv1RA2W+dJlNdM9CZ6JbPdXLmVV/ZfhenBgun89zDDMBTLiYsUhYlktPISCSXpJR/4my5geCAxsqh5hwTFjkOvkKy3biAXsIo02p0lHMfBXjCriTMPJUHWKdnGs/mpcVDUsYl47hI25q+bMY4uRIPdSL59iQSC6i5QoEfEYdah+Wc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(136003)(366004)(376002)(39860400002)(451199021)(186003)(316002)(86362001)(26005)(6506007)(6512007)(6666004)(2906002)(8676002)(8936002)(6862004)(5660300002)(107886003)(41300700001)(6486002)(478600001)(450100002)(38100700002)(82960400001)(66476007)(66556008)(4326008)(6636002)(66946007)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3V5aG0xQ2dxYWF4cWNvNnVhUVJwWnJsK3h5K05Td0tybTk4Rkx5aWc3dnI3?=
 =?utf-8?B?OVNoL3RuZFNmZmg2R3JTVXIwUlVPSnd4Ti9TcllUZVZDVWIwLzVFSUhPUFVR?=
 =?utf-8?B?OU9ic2xQRjV0WC95QUR0ZWM0YXNpa3ExUVc5VmExcFF5Q1RCTTJkRWZrRmFs?=
 =?utf-8?B?Wml6aS9JWTdyZ0Q5UnMySndYVXBWMGVIR2ZRdDFyblBCYzdUMnNvWkVCSXVk?=
 =?utf-8?B?M21SQjZ1SGcvYzB6MnJFdU01M3VLZVZRRXpLNUFId09abDNHRjVoeXRGdUhu?=
 =?utf-8?B?S3dtemg0SjhrUlRtcmdTNEJiUHJiVmhCNDBUblN5M2pQRzlJaGJKTXZqZFIr?=
 =?utf-8?B?NkY5M3lHVXRKUTQrTGpicm1qazBqQzR0NnBWdTdaNVNvNDFQOGVjRGtacklS?=
 =?utf-8?B?emFGczM2cWVId0RnQk9qNEtYY1ZndkRWY01oR0UwVWhSTUpNTVZqUTV1Tm11?=
 =?utf-8?B?OVVWSXNleHQ5eGpvenFWL3ZWZjV0RmJwcmZCQ0RhcUZCbWllVWNSTHBRTkVm?=
 =?utf-8?B?Qlp2YjVwK0NBUGRVa1cwdlpMVzM4dkQ0UnpXTjhMS3hwWnJpZkwxRDhuem00?=
 =?utf-8?B?ZmdKeld1UkpsNEFNZGNnbU5KNjY2ZHFXc25hRmxCaW1SSk1FTDRtUi9nS1Fz?=
 =?utf-8?B?UU92bkVwYzlDSzQreVN2amtPT0NSTXI3M1R6c0lDMmRpL0M3a1p2UFNuZnMy?=
 =?utf-8?B?K3NTbWhCVGEzVWVMaTYvTGFJblNxZE9sdzJFdkNpVy9mNWpQTDhxWmhUSjdC?=
 =?utf-8?B?MTQ0TERsODRwS3Q3d3VMeUg4d1ptc2pWZHF0UUs3N3IwTTV5R2YyZjhqNmlN?=
 =?utf-8?B?ckUzcCsyaWxzeC9NOFJhd1ZGNFBvbExHRzlzQzhvSTNOK1pQbWM1RmdvckZ6?=
 =?utf-8?B?UU5keUwvM0YySnB6NkdyMjU3Q05YamlyZUJlLzU0Q0ZwS2dOOVNnbTFtaEU2?=
 =?utf-8?B?M2IzbDUzbEREbXZydk9Jai9sSVd5KzFOalYyeFZoaEV6bzNwR21CZ0FRNS9i?=
 =?utf-8?B?dkpVYVZLekl3NWdhc3A5V1luZHBKTDMwbjZVUGpNQVVzd1FGcll1QzQwN0dw?=
 =?utf-8?B?M2N0T29ZVitqbHROL2xzMTdyWUYvaC95STVoc3lORTdEM24xWXplKzA5VVRa?=
 =?utf-8?B?ZVVXbkQ1ZmFmYWdOK1c5VmMxZkJsdUM3bUJGbkdHTzRhbm91QllUT0hzL3Z1?=
 =?utf-8?B?T2ZWdzBDWWJaZExxN25tb3dtbU9DMWFMd2luM1dERk9MZDIwYldUUVlDTndR?=
 =?utf-8?B?WVo4U1hRVTZ0bml1SEJ1eDJ1M1hNd1U2NFArblpsM1BvSnNLTkN0eDMxZTQ0?=
 =?utf-8?B?TXR1WHZYT0JURmhqa0paU1grSmJtelFXWFlBVWY2WFZuYVRyMnBZTm9Xa1FD?=
 =?utf-8?B?cXM3QWVwbzNXUjhMcGkya2tyV3QrN0lwWHA2UmVlK3V4YlBhYjloVThoTnV6?=
 =?utf-8?B?YXpNbThQNWRoYm1oVXJteE1kNWUxQThoYXllZGkzOGxEb3A2UElENS9Vd3Nl?=
 =?utf-8?B?RHZpbmpEVVRST0ZjMHYzV2RUWmtabnpIWUloUXpveERFRk1XcWhDWkV2elU5?=
 =?utf-8?B?dnJKV3VtcXU2VkdmclBXWEsyaDU1Mm9wS1p0VzBWNmZmZ1F3NHdrNWFwdFg4?=
 =?utf-8?B?cFhwUWlET1d2N3g2cmp6VGhDZWJWMWthanNQcVJiL1JxU0xENDQzRG15aEdy?=
 =?utf-8?B?MlBIS0RtOFErTFlSd2FLRXNUSkpCSm1xdlN1UkJoZ2hhdjBkQ0Z5MmVhZTVl?=
 =?utf-8?B?NWpTSGhlYTgyTyt0ZVFyOXE0ZFFOVHhuVDVQTFFGNkpEb2xHOFl0NmFINVhJ?=
 =?utf-8?B?ZFNtenhuU0Q1eituQmdjMFdqUDQ2ZldQMm9JeUFJTzlQSXg3YzgrSVlrSFJi?=
 =?utf-8?B?ekdhUGRkSmtLRlNNNW10U2hUWGZPRlRnQ2owVVdtQTlPbEsxOHVkTHJKQTgv?=
 =?utf-8?B?MDhpejU2UGpJZFpteHR3UU84c0RyR25OMWVWVW5wMytqS1MxUll4dTNXM0tE?=
 =?utf-8?B?REhWZlJ0M0h4b0dRUVlKTmFoOEpHQ0NqblEzQTZMN1JkdlVxWnBmTGRaZXp0?=
 =?utf-8?B?WWVEeDFLYVR4Nmk3RHMrQURuN1hRTldUQm52WElCMnduQmtGUnlVUkJFU3FZ?=
 =?utf-8?B?S0xFbWZTVm55OE5XMFRSczkwdmo3bEJLUGNWeWh4ZjVIaU1sUXlLaG1UVUIy?=
 =?utf-8?Q?Wx3jcQf70Rt6WpM/FuOXegc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 216e8aa5-541e-426e-4f93-08db5b0c5589
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 21:34:33.8753 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rcoXhN0TSZJgnWHKpodbEeTTM5EgeiYYEK0w4sEoFCSlFRVm66bA1Fr7wci68kbK82Us3Yhf0qeOkh900iPGx0/4RUiX2COvBf/afe9dK1M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7558
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
Cc: intel-gfx@lists.freedesktop.org,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 22, 2023 at 01:17:49PM -0700, Ashutosh Dixit wrote:
>Clearing out report id and timestamp as means to detect unlanded reports
>only works if report size is power of 2. That is, only when report size is
>a sub-multiple of the OA buffer size can we be certain that reports will
>land at the same place each time in the OA buffer (after rewind). If report
>size is not a power of 2, we need to zero out the entire report to be able
>to detect unlanded reports reliably.
>
>Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/i915/i915_perf.c | 17 +++++++++++------
> 1 file changed, 11 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
>index 19d5652300eeb..58284156428dc 100644
>--- a/drivers/gpu/drm/i915/i915_perf.c
>+++ b/drivers/gpu/drm/i915/i915_perf.c
>@@ -877,12 +877,17 @@ static int gen8_append_oa_reports(struct i915_perf_stream *stream,
> 			stream->oa_buffer.last_ctx_id = ctx_id;
> 		}
>
>-		/*
>-		 * Clear out the report id and timestamp as a means to detect unlanded
>-		 * reports.
>-		 */
>-		oa_report_id_clear(stream, report32);
>-		oa_timestamp_clear(stream, report32);
>+		if (is_power_of_2(report_size)) {
>+			/*
>+			 * Clear out the report id and timestamp as a means
>+			 * to detect unlanded reports.
>+			 */
>+			oa_report_id_clear(stream, report32);
>+			oa_timestamp_clear(stream, report32);
>+		} else {
>+			/* Zero out the entire report */
>+			memset(report32, 0, report_size);

Indeed, this was a bug. For a minute, I started wondering if this is the 
issue I am running into with the other patch posted for DG2, but then I 
see the issue within the first fill of the OA buffer where chunks of the 
reports are zeroed out, so this is a new issue.

lgtm,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh


>+		}
> 	}
>
> 	if (start_offset != *offset) {
>-- 
>2.38.0
>

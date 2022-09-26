Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC09C5E97EB
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 04:35:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 971F810E33E;
	Mon, 26 Sep 2022 02:35:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C456710E33E
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 02:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664159726; x=1695695726;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=IkBPuWH3eLwr4182z1SZUtgWQhQbnFiMZqTbok6Lii8=;
 b=ndetQLutFkQjSqPCC3Qex/EbQI3pCCF8BVG1DGxApJa87GGKdM+zporM
 fjx4Ks2B1gyc5kgceXGX7g1t4NwTSsK9WMyYzULaVcqQF1YcSvFBVRy9i
 /y99kiGpJPGkQtVZpdkOHk4FbSHi73Wd2iKa8bqd9FQRw0R70vmvcDing
 YzppNMX2WhL0zc0/4PHhAp9L2BTjf387NqpAeSgF+rMhJ2cFNG8sxfWIM
 eTx6eBL8qwsvNtdAquWbV4cWpgArJZ2//IiIoVM73sSRKbioyFc+V/WmA
 Nl62HzGie/RjJo4HENOUG2X+QiiWTxpeGTZ5liMoEz5F/6hDwHmRJ3Ke+ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10481"; a="301821461"
X-IronPort-AV: E=Sophos;i="5.93,345,1654585200"; d="scan'208";a="301821461"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2022 19:35:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,345,1654585200"; d="scan'208";a="796160513"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP; 25 Sep 2022 19:35:25 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sun, 25 Sep 2022 19:35:25 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Sun, 25 Sep 2022 19:35:25 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Sun, 25 Sep 2022 19:35:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bQ2AXwGhvtb9RplEy8Mct9gTO99gmIt9EgXfNNmxNnlu1bc2xhkejtkc7wrAoOra78DeVeI6zV8Ctnx/VyUfuSUiXEBM/Cgfwll98kkcNCykUNAYylCeDUnTZch7lxgHUZpekCYHA19qDuhQL7N3GfCsQfBTjJyKFqgGPZVbCPhLXDyNvpNlFzk6sRYX5bCaidS2X9BWlXveR7fgpm6NNlSP1tR52EzYv4WrP7ybGB2GHglNGq3s15FbTv1GW39g0wtJnaZthKE0yAra5uVI0R4pakZy5vlBrtL+Sta+j8n9KDUfsfjBCt8JcMLeg18N59Eww5tD2YemxssricK2Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vJYwp6GxSCLhz5IPphGAbwyTPelZKe+2N8UuoV/NSeg=;
 b=EViUUMLqdL5Ec8TQ0POIKNh3crO3rzBzG+OMbalifyA8g4CoDkIPFhawg+8YgTmcAlpDzRn2lJU9A/p2Ha8U6oBnf3SjdZ/fRksA70VMnkoLKsZe2OintGUE9Wa8XTQKPK/S6NLZWGhYKSmQnycP7+wsLtSx8G0JQNi6f90QLKSOkU9gXO+8HPDYtX9H92gbAD65jJg5b+Y7na1mRg9zy705lJizrUrZsDmtPdSZPxu3PdvjtVEoCPlEFFeD0V6/BwPk5RDJKzwMJeXDy1Bcp6hAuRKNK6nNRMDJpnAMxisM/7+BKzmdEp+IT4Oik3vROVJKHhOlYc8R7IBPxlddaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MN2PR11MB4599.namprd11.prod.outlook.com (2603:10b6:208:26d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 02:35:23 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::5145:64b6:db32:b424]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::5145:64b6:db32:b424%6]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 02:35:23 +0000
Date: Mon, 26 Sep 2022 04:35:20 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH 2/2] drm/tests: Split
 drm_test_dp_mst_sideband_msg_req_decode into parameterized tests
Message-ID: <20220926023520.7pwxotmzsa5pjeqz@nostramo>
References: <20220925222719.345424-1-mcanal@igalia.com>
 <20220925222719.345424-2-mcanal@igalia.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220925222719.345424-2-mcanal@igalia.com>
X-ClientProxiedBy: FR0P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::10) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MN2PR11MB4599:EE_
X-MS-Office365-Filtering-Correlation-Id: b249ef7f-5ae3-46fb-e8d2-08da9f67c33f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 41uoaVjh/cNI1tT4+9PPX9gU0ZgYO1xbfd+Y8reQrA1v4QfRaK6eAEgh3o2Kken/aBQiOvU6pW+EM4j2AAG+Yhwu7jzLZ0CsqnNRQvpZjqq2EthZ+QnP8cNRPrLSFKNa4G1CNYImCr+HQ9j+mJtmyuxvHdQexVq67Y4xuec6ojMVsdG5zGnpy4VmB/0/w8tvGMvEsCtgKaVpqBTf5lnf/KWq3d7rDg4P9DaP6QkbRzHRZBC2v4KbeEg34za34GeuDKkGV0J0UsbEYuweUyJozvIaZ7JQHyQwumFM01FpuEziiGf5aEY+eflYGblX5rG6T3ojollJD6qcgmOFFWxGJUR5RqNcbgaTiUZbkamgh0a9K2QPpS6nKv2N0bRhrcNx2jRtxj1RDE1wxu23hBa6Gt5L06fBrMqqoK9JJpfq11SwAY3TMxeIdd8Z3f/rN9IYRAd0K5ajNDOhs+LjE08v+l9DeXZ25zdh3v8qxYb/Fm9KblaQHB3EoJjUX6oReuAorwmTkMo+xkXb09s+vWL/MC3yu7w3XzbISF2ZG2UZDzok+jonZBB4Wcd/Utroiu/rAXzTvccFG0IDw5jTn5fmeMSLiSyTZhVp0BWgcuIEwpeJAhKBvoGHrrPoQ+GTx0fUjSnAeS3U/iavgAlVWiovtW4jkypRpE8xG76Re6PdzQILucu0DHJbn2q+zSVtRfwfOvyFuvIqz7lbwV8kru5KsA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(346002)(396003)(376002)(39860400002)(136003)(366004)(451199015)(33716001)(83380400001)(41300700001)(6512007)(26005)(9686003)(186003)(8936002)(5660300002)(86362001)(2906002)(7416002)(54906003)(66476007)(38100700002)(66556008)(316002)(8676002)(6916009)(1076003)(6506007)(478600001)(6486002)(66946007)(82960400001)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmNhV242a1ZCeU8rYWRpOUpzKzhkNlljaUZSUkkwL0t3ZG1JK0ZkUHgzSkd0?=
 =?utf-8?B?ZW1pSlJCOVRnaHBBK0dJcTduZTIrR1ByckJjZFZzSXVnSVZDQnNDQkFkYWRq?=
 =?utf-8?B?b2htOVdGMWc5aHFXeTlaeDYwa2ROZWpTUnFMOU9URTR4a21kK3pIYWFzTVlj?=
 =?utf-8?B?RWRHa3U5bkZOcW54ZVVpbTQ4b2NxK01RWG13aXJvcVBXT0Z5c2dRbktZQUpL?=
 =?utf-8?B?MUc2d2FDdXhQU21UMGZyZFg3dHZsL0NWUXJIdFVJZUJuOWc3Nm5VdVQ1c2M1?=
 =?utf-8?B?SEFySFlnWUYrem1jaThUekplRVArcVk2aDI3bXhSdytMNzJMQXZiU3h1NzNr?=
 =?utf-8?B?TmdiUTNnNGZMV2RFaEU0OGlwNXVkeVMvZytuKzVRT21ranFIQ0srd1YzcXIy?=
 =?utf-8?B?YjExa3BqN0R4eTJtMHdaUU9BaVZFNFNGdEsrS1E4QnRVV0Y1ZDlmSWVzeTBj?=
 =?utf-8?B?czZnSjVodTdacVVBRDhsVEdFRWpFMTVVWVJ2em9TNlRScENRclhNcDJRdDVF?=
 =?utf-8?B?OXNpeVljQnk4WTJTOFRMd1dQam5PdHJqYm5hL0ZENnNRSkUwMGFRTUFnTUpy?=
 =?utf-8?B?YlpRZ2xJK1FkUCsvT2k5djJYSG80YVpha3RZWStsTkJ3TGRnRURBMFR3TDFv?=
 =?utf-8?B?TGEvMUhadEJsQmxkNVZtQTRoRU5iSFVlaWU0R2krd3FJbjh1d0xwalk3azhG?=
 =?utf-8?B?RjRSejJTeXJUQ0dhdnRUR3N3bVRGRnhONlE4aDQxY0t1NlhkeUdIdmhydG1M?=
 =?utf-8?B?dDE0M2YrUnZ1MEl1QWwyQ0IwcVpGRnBPQmNaL2lFRjhJR2FOc0JlclRqQXlm?=
 =?utf-8?B?ZW1YQmltcUpLdk5YTkdqZ0xIZTFjc0JWQUFmblBNRENhQVBHVy9yN1l6M3pt?=
 =?utf-8?B?UDBjditNMjBjSXVpelNyRVhVZjlHV1EyeXR6elFQZ2w5cmZSM2FUTy9Ld3pv?=
 =?utf-8?B?Mnh4TDFFYytHd2ZkWVBid3V2aTNCbzlhMEVwVUo4SFliZ2Fta2VEaHFPSmsx?=
 =?utf-8?B?ek1YQlA1Y2ZRZG9tZjMxRUUyTmdUdUFaLzIrcHh1ZE1TUnU5dXRydytHTmFX?=
 =?utf-8?B?U3pkNnRkWVlZY0h4WDlkS0E0azZNdnZSb0NxVm1USlVLQ0xVWXRsQytYSllI?=
 =?utf-8?B?TytkbEU4TG9wOE9Nc1lVUVNpN3RUU0FaK05WNXNyaktiZ1BBNUVCWEEwRHI3?=
 =?utf-8?B?L25oeTgyaHZGVG5VUmdtK0twYy8vWCtjN2UyeGloWXc5eWdabHVoY2I4bTZk?=
 =?utf-8?B?d0FMdzZiVWZMUUg5ZklIelVuZlBnMHJlS2M3QjkxMjA4a015YlU2NElsdUhP?=
 =?utf-8?B?SHdHMVlTalFOVUtSSDhDV0JVaWIxamxleUxKR1l0L2dpRmtFaTVTUmVZa0li?=
 =?utf-8?B?S3ZkWEJTaklpajIxSXJKcm9YbnlMTjFuWHNneXFTeGN5aGFVNXlYcnlQTGMr?=
 =?utf-8?B?ckNhT0pTOFVSN0VidTdMUkJYSmh4UE4vY2JmaURuK0VwTHJHN2F5ZnhlUmlL?=
 =?utf-8?B?MlcxSndPcTJyamhLT0xoRjFGcEdBVXJnN0ZiUGU1dlp6UHlCZy9laW9PZTdx?=
 =?utf-8?B?RFlHVVlvK3oyczFtZVVvTEI5WXBadGtnblZZb3dkd09ubFRwTlMxeGtpR2RV?=
 =?utf-8?B?S2c1bCs5c0R1bnlaSU1zZENyc3BlQ0ZxN2pReTFCdHpBMHdzR3IrZ2Vla0p0?=
 =?utf-8?B?TXcxMGlkWEJOUmxUUnRzd1ZGVVZ3T1BsNUYrOWRFNDd0d1hLeStxRUZDVExm?=
 =?utf-8?B?MmdGQXZ3WDR4R2d3WjFSYTRpS1ZFR2pZNnIzRm03UGJWSnlSMzVZa2dkRXdz?=
 =?utf-8?B?MURCLzY5V0NacnI1Q2pWZnY1MnludmxabHV6RFhNQm52OGpoZzIrbERGb0kw?=
 =?utf-8?B?a3JoTFdNRUdhTWdES3h1eWtRbUNSSnFzdTRwaFdWQWRCTGRZbVJrYkYyNCti?=
 =?utf-8?B?NzN6VXM1VWlLZDJld3ZVcG5qd2pSdG1ocHNCMm9aSHFVc3lzT3lPeU1FUDIw?=
 =?utf-8?B?TlFKaXpDcDRGejg5QzUxN0VDdDN4YTVNUEJ4NG5qK0ZTS3oxZmgzS0hSVCtI?=
 =?utf-8?B?NlovMW9xc2NnbDlDV2pJTzZFUm0vaG9BMUJwTkxaRWZSYkQ2SGtPcm5GU1Vr?=
 =?utf-8?B?WnpjK1hSVi9KRHRsQzRYOTlhSFhQVzU0Rm1aa2k5K2FxT2ltMWFPd2VHUllW?=
 =?utf-8?B?dWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b249ef7f-5ae3-46fb-e8d2-08da9f67c33f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 02:35:23.4414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EG5zBH5uJVyIwCDbk3EipiO2gUcPtD+vUpIZIf6JD2wneNFHgYr23n6F1MC5mnuBHIebSAOCOJ2ZFYcue5ejU5xT86qDozpCduUmVmKLU2o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4599
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
Cc: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 David Gow <davidgow@google.com>, magalilemes00@gmail.com,
 David Airlie <airlied@linux.ie>, tales.aparecida@gmail.com,
 Daniel Latypov <dlatypov@google.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Melissa
 Wen <mwen@igalia.com>, Isabella Basso <isabbasso@riseup.net>,
 Arthur Grillo <arthur.grillo@usp.br>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Sep 25, 2022 at 07:27:19PM -0300, Maíra Canal wrote:
> The drm_test_dp_mst_sideband_msg_req_decode repeats the same test
> structure with different parameters. This could be better represented
> by parameterized tests, provided by KUnit.
> 
> So, convert drm_test_dp_mst_sideband_msg_req_decode into parameterized
> tests and make the test's allocations and prints completly managed by KUnit.

There's a small functional change not mentioned in the commit message.

> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>  .../gpu/drm/tests/drm_dp_mst_helper_test.c    | 370 ++++++++++++------
>  1 file changed, 243 insertions(+), 127 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c b/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c
> index 12f41881db6b..545beea33e8c 100644
> --- a/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c
> @@ -5,12 +5,8 @@
>   * Copyright (c) 2022 Maíra Canal <mairacanal@riseup.net>
>   */
>  
> -#define PREFIX_STR "[drm_dp_mst_helper]"
> -
>  #include <kunit/test.h>
>  
> -#include <linux/random.h>
> -
>  #include <drm/display/drm_dp_mst_helper.h>
>  #include <drm/drm_print.h>
>  
> @@ -72,6 +68,217 @@ static void dp_mst_calc_pbn_mode_desc(const struct drm_dp_mst_calc_pbn_mode_test
>  KUNIT_ARRAY_PARAM(drm_dp_mst_calc_pbn_mode, drm_dp_mst_calc_pbn_mode_cases,
>  		  dp_mst_calc_pbn_mode_desc);
>  
> +static u8 data[] = { 0xff, 0x00, 0xdd };
> +
> +struct drm_dp_mst_sideband_msg_req_test {
> +	const char *desc;
> +	const struct drm_dp_sideband_msg_req_body in;
> +};
> +
> +static const struct drm_dp_mst_sideband_msg_req_test drm_dp_mst_sideband_msg_req_cases[] = {
> +	{
> +		.desc = "DP_ENUM_PATH_RESOURCES with port number",
> +		.in = {
> +			.req_type = DP_ENUM_PATH_RESOURCES,
> +			.u.port_num.port_number = 5,
> +		},
> +	},
> +	{
> +		.desc = "DP_POWER_UP_PHY with port number",
> +		.in = {
> +			.req_type = DP_POWER_UP_PHY,
> +			.u.port_num.port_number = 5,
> +		},
> +	},
> +	{
> +		.desc = "DP_POWER_DOWN_PHY with port number",
> +		.in = {
> +			.req_type = DP_POWER_DOWN_PHY,
> +			.u.port_num.port_number = 5,
> +		},
> +	},
> +	{
> +		.desc = "DP_ALLOCATE_PAYLOAD with SDP stream sinks",
> +		.in = {
> +			.req_type = DP_ALLOCATE_PAYLOAD,
> +			.u.allocate_payload.number_sdp_streams = 3,
> +			.u.allocate_payload.sdp_stream_sink = { 1, 2, 3 },
> +		},
> +	},
> +	{
> +		.desc = "DP_ALLOCATE_PAYLOAD with port number",
> +		.in = {
> +			.req_type = DP_ALLOCATE_PAYLOAD,
> +			.u.allocate_payload.port_number = 0xf,
> +		},
> +	},
> +	{
> +		.desc = "DP_ALLOCATE_PAYLOAD with VCPI",
> +		.in = {
> +			.req_type = DP_ALLOCATE_PAYLOAD,
> +			.u.allocate_payload.vcpi = 0x7f,
> +		},
> +	},
> +	{
> +		.desc = "DP_ALLOCATE_PAYLOAD with PBN",
> +		.in = {
> +			.req_type = DP_ALLOCATE_PAYLOAD,
> +			.u.allocate_payload.pbn = U16_MAX,
> +		},
> +	},
> +	{
> +		.desc = "DP_QUERY_PAYLOAD with port number",
> +		.in = {
> +			.req_type = DP_QUERY_PAYLOAD,
> +			.u.query_payload.port_number = 0xf,
> +		},
> +	},
> +	{
> +		.desc = "DP_QUERY_PAYLOAD with VCPI",
> +		.in = {
> +			.req_type = DP_QUERY_PAYLOAD,
> +			.u.query_payload.vcpi = 0x7f,
> +		},
> +	},
> +	{
> +		.desc = "DP_REMOTE_DPCD_READ with port number",
> +		.in = {
> +			.req_type = DP_REMOTE_DPCD_READ,
> +			.u.dpcd_read.port_number = 0xf,
> +		},
> +	},
> +	{
> +		.desc = "DP_REMOTE_DPCD_READ with DPCD address",
> +		.in = {
> +			.req_type = DP_REMOTE_DPCD_READ,
> +			.u.dpcd_read.dpcd_address = 0xfedcb,
> +		},
> +	},
> +	{
> +		.desc = "DP_REMOTE_DPCD_READ with max number of bytes",
> +		.in = {
> +			.req_type = DP_REMOTE_DPCD_READ,
> +			.u.dpcd_read.num_bytes = U8_MAX,
> +		},
> +	},
> +	{
> +		.desc = "DP_REMOTE_DPCD_WRITE with port number",
> +		.in = {
> +			.req_type = DP_REMOTE_DPCD_WRITE,
> +			.u.dpcd_write.port_number = 0xf,
> +		},
> +	},
> +	{
> +		.desc = "DP_REMOTE_DPCD_WRITE with DPCD address",
> +		.in = {
> +			.req_type = DP_REMOTE_DPCD_WRITE,
> +			.u.dpcd_write.dpcd_address = 0xfedcb,
> +		},
> +	},
> +	{
> +		.desc = "DP_REMOTE_DPCD_WRITE with data array",
> +		.in = {
> +			.req_type = DP_REMOTE_DPCD_WRITE,
> +			.u.dpcd_write.num_bytes = ARRAY_SIZE(data),
> +			.u.dpcd_write.bytes = data,
> +		},
> +	},
> +	{
> +		.desc = "DP_REMOTE_I2C_READ with port number",
> +		.in = {
> +			.req_type = DP_REMOTE_I2C_READ,
> +			.u.i2c_read.port_number = 0xf,
> +		},
> +	},
> +	{
> +		.desc = "DP_REMOTE_I2C_READ with I2C device ID",
> +		.in = {
> +			.req_type = DP_REMOTE_I2C_READ,
> +			.u.i2c_read.read_i2c_device_id = 0x7f,
> +		},
> +	},
> +	{
> +		.desc = "DP_REMOTE_I2C_READ with transactions array",
> +		.in = {
> +			.req_type = DP_REMOTE_I2C_READ,
> +			.u.i2c_read.num_transactions = 3,
> +			.u.i2c_read.num_bytes_read = ARRAY_SIZE(data) * 3,
> +			.u.i2c_read.transactions = {
> +				{ .bytes = data, .num_bytes = ARRAY_SIZE(data), .i2c_dev_id = 0x7f,
> +				  .i2c_transaction_delay = 0xf, },
> +				{ .bytes = data, .num_bytes = ARRAY_SIZE(data), .i2c_dev_id = 0x7e,
> +				  .i2c_transaction_delay = 0xe, },
> +				{ .bytes = data, .num_bytes = ARRAY_SIZE(data), .i2c_dev_id = 0x7d,
> +				  .i2c_transaction_delay = 0xd, },
> +			},
> +		},
> +	},
> +	{
> +		.desc = "DP_REMOTE_I2C_WRITE with port number",
> +		.in = {
> +			.req_type = DP_REMOTE_I2C_WRITE,
> +			.u.i2c_write.port_number = 0xf,
> +		},
> +	},
> +	{
> +		.desc = "DP_REMOTE_I2C_WRITE with I2C device ID",
> +		.in = {
> +			.req_type = DP_REMOTE_I2C_WRITE,
> +			.u.i2c_write.write_i2c_device_id = 0x7f,
> +		},
> +	},
> +	{
> +		.desc = "DP_REMOTE_I2C_WRITE with data array",
> +		.in = {
> +			.req_type = DP_REMOTE_I2C_WRITE,
> +			.u.i2c_write.num_bytes = ARRAY_SIZE(data),
> +			.u.i2c_write.bytes = data,
> +		},
> +	},
> +	{
> +		.desc = "DP_QUERY_STREAM_ENC_STATUS with stream ID",
> +		.in = {
> +			.req_type = DP_QUERY_STREAM_ENC_STATUS,
> +			.u.enc_status.stream_id = 1,
> +		},
> +	},
> +	{
> +		.desc = "DP_QUERY_STREAM_ENC_STATUS with client ID",
> +		.in = {
> +			.req_type = DP_QUERY_STREAM_ENC_STATUS,
> +			.u.enc_status.client_id = { 0x4f, 0x7f, 0xb4, 0x00, 0x8c, 0x0d, 0x67 },

Before the conversion - client_id used to be random (different for every run of
the test).
Even if it doesn't matter from test perspective, please mention that in the
commit message.

-Michał

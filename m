Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1101152CD6C
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 09:45:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA5C911AEAB;
	Thu, 19 May 2022 07:44:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A09111AEA6
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 07:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652946297; x=1684482297;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CYrawXBtkpWnDAZSpiKNfBst/qJLa8FWH6Yxv3/c0XM=;
 b=YRQL4zMJKt409blwFfpd3DkF+Y8EOn1RaYvo3tIg38v44fM/amou77oe
 QlkWoPgFTiYcqTXmhx4+vKM/7R64uhkWgk99R9/JcQAu6KWouYKMguIE+
 EQxcGNEeqM3hlXthqda2yk22iwfCKfm8XwLZLZIdIcGhd5g7CC3UW78Mu
 cvLvas/HH088QU+PXI0jK/FgabYyXygbtu0Bj8oOl23IfGqw+A7w8GroU
 OBF9rlZaqaFjbKQyUhgkxnYNc6AmFc7IcDs+eCaDgLkB1wzK8lUgHi+LX
 7PG9arnzvbbeOr53TTUABnq/55sEAP6iAvRYWyuYmJJ/HNwscks8PSytt g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10351"; a="252594179"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="252594179"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 00:44:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="575479815"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 19 May 2022 00:44:44 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 19 May 2022 00:44:43 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 19 May 2022 00:44:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 19 May 2022 00:44:43 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 19 May 2022 00:44:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UUIYfwXIbLL+ZgETIyrCOVmeXOULdHXLSqVxVRxapddnwOBt/URb6Z+xSVwSqXXfCmPZlo4P2dBpR3DfpAlrIXh/fF7DnGQzrS7bdBPAo7GWHq8uN5oVF9uFxsvY2SwvDjCbMZ5mVCEsZIUvIR2Nj3cO3lwl/nZjR5PZ8ySohNjGP4R9xIN4FykVc1G6GIMNNE4+4NtQ6soV2AixYb1co93+1nCEigG5EemAiKpk7JT/x5TeK7PsMykkJaPIlZwvNT8qJqWUlv89BrxK6fUySUXq4Fh/L8H0UH6/9j3ZSPkJj46ZAhAgpob6sWQqrQ0zq/QiLI+unTvPdI08FVSEcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/FUEGQl89wOGTTX78IV2d3hP0blPAoGfR7MgIUq/Dg=;
 b=ZpsybO+1tpq4TXYsdvkl4GNJP7jST1scbhwR7W968o5tNJZM7zy90GU/4Ax2d1WTjHITIr8hUV/KyMVuqejeZrZs1orp07HBlz8n8FP+ovUkecc1/Tr4TwM5NKBrcc8F0X8dsVLbNZmPHqPH18ec6Pr6xaKUYwVLyDXnJSbIFvpc1jlgKYsq4R2pREHuQJ4KDnEoasdHLwFnp/1/Uz6cGpLMoIVBvFm/7QCxMqSkB7OtUAK1T+1urScIdDS4Imdm7SG7OKr7kXNrLlgZbtGvJx6yTl9GPWHUzXh6r+HyJF/EyayMlo9tOqFHI8OvJhWrV2CzNyoz86rimcYKfZDygw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 CY4PR11MB1573.namprd11.prod.outlook.com (2603:10b6:910:c::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.13; Thu, 19 May 2022 07:44:41 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::b1fa:393c:9fb6:6871]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::b1fa:393c:9fb6:6871%5]) with mapi id 15.20.5250.019; Thu, 19 May 2022
 07:44:41 +0000
Message-ID: <5eca6289-1f65-2c42-fe24-679745200040@intel.com>
Date: Thu, 19 May 2022 09:44:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [PATCH 1/3] drm/bridge: tc358767: Handle dsi_lanes == 0 as invalid
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <dri-devel@lists.freedesktop.org>
References: <20220518233602.248185-1-marex@denx.de>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220518233602.248185-1-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0041.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::16) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a891af76-61c6-442a-5b6d-08da396b6edc
X-MS-TrafficTypeDiagnostic: CY4PR11MB1573:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <CY4PR11MB157373FCA8555DE687BDF66DEBD09@CY4PR11MB1573.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RgiT6PQ5mCH/ydY3xxfLdir2faNm8VjfaBrlTpmnXZzI7bo4KJWEwHxBjbB0hTnIz51GknOfp7jFXGz7ai4+uMzSUFksfDHcHjH2/SrfG0xdaqCJgxkgLGGSC/DASh24Bi1xAON9q7F4CcuyqsBd9ZPITZZeE2ug6GpIkSOWgEKaki5tYlHy2A6thIouCnH0XZfAZ3wC4hpEls381mGjoy91QHiM+16pxivTRU6olmFobLkvxaUsla9+ONpSTzBnkmnpnLX+Zs1Z2tKHwjqbyk41ZTCf1QO1FQt1MVqC5x2PUhohz/iwBuz21+UEAM5fdGTmegGhijY5AkDzZq6OQC3SdWXFivONKHHMipqKunZilCvOEsnMLVp3KiigtC2XD6L3MxEVuN6ANHs4VstNvFeXQMtLInJUZ9o4GQuPDmtEkgFov4zpdFnm6n5FD78xsCbA2TVjy3yaTBaGPcwVuIKQrnJv8UYubmq4/cbH1edfFIxqlcxph3NSyhUB6lC1EIZsN7kp5oQltFEpdbIXIxwg/N3AAiE+Vnq06O+HAA3dThoiATGJpcZ52+gloxXC/ypXWZa3AC9G0XM8bGCE0qXGmuMdIktVAJuZi+Z7y5GXEQ44NXDEKhqryKm2TSZz/fhFcGWyjtzyA/bNDOncnwTejeqEhiAXDy0mvM1jTFazFnqamz/q5z2/QOFpDD9onWR11ajM0e/ECmKQVZW3+kgp3Me/p8d8OFiDAUrDTwA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(66556008)(66476007)(508600001)(31696002)(6486002)(38100700002)(54906003)(316002)(6666004)(8676002)(86362001)(82960400001)(4326008)(66946007)(2616005)(31686004)(5660300002)(186003)(6512007)(53546011)(36916002)(8936002)(44832011)(6506007)(26005)(36756003)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUJNVTdIbUJBMmpHUklVVDd2OUlzajFGaEpTaTJvQk50OUFNMDN5RDNqNmh1?=
 =?utf-8?B?UjRkNzZYbUZYN202bUJYTDIvL21LRlpZRFBBNE9pYkJpeXZCZlc5UTJyeFZk?=
 =?utf-8?B?bEVLL3ZBU2RFQUFvcmlxSWlLSmtMcmExNU5ybDdXTzNUUCttOVQreXZqaXgw?=
 =?utf-8?B?ZVF3bDFaTStXeVlwb1NQYzdjaGxtVkwzZm1uOEM5alR4U0J4MHU3WDI2K1lJ?=
 =?utf-8?B?MGxneStkTURIZTNhMzFVS01PQXh4czV0Nm9PNnVpWGN5NWludVZiaDdOSzdV?=
 =?utf-8?B?blNBeC9abzJnZzFnRUZHRzBZOHhKSGVpeUR3UjFhNVkzMUs3RjlNMTczR1Yr?=
 =?utf-8?B?b25IeWM4SDVnNmtxT0ZXYkY0UVpBTHFmakJoMnJzNjk0ci93dENVcWxDRTE0?=
 =?utf-8?B?b1JuR093ZGlXNldEMDFKMVBlODZrRjZvOFVGZVlmblZjeDR1NUdrUkFLZmIy?=
 =?utf-8?B?K2lXMTcxczRrRmpldFR4aVU5T0hOMjFSbENUNThPUXE5Tm9Kb2kyZlFKWGor?=
 =?utf-8?B?Wm1nbHNjbzFVWjd2amsyQnVsS0VzSVVQUGFEOUpFRTAyNUZTYTZsZXZVd0p6?=
 =?utf-8?B?ZTNoOGJZblozaXBBSTZIeGlzOG9GTGRTSmpzYStqaTgvYlp0Z1FWWWRBTTY1?=
 =?utf-8?B?ZzFrekxIemlPc2dxdmlMOGxVY0RUMjg4Q2pIcGw5QStUbjl4SGVTWVJiV0dh?=
 =?utf-8?B?MytHeERiSkdyWGFNcmdUVFBQMHN2bkw1MUJZNmtOUEFaeHYwYmFuK2NpTTMw?=
 =?utf-8?B?Rk9ORnBjby9jSGd2dmk4ZGNrVEkxVGt0WUw2THlnb1JTNFhzVytpbVY2VHhT?=
 =?utf-8?B?UTRDSkpvb09MaDdzbFRiUWJrNklQRGxZaDR3a28wL0Yvbndhckhxelp4NW9H?=
 =?utf-8?B?TU5McHF1WVVmbjF3M1l2K29LdmNRc2IwVDQzSVk3elZxRGkzaXFLcGdBbGcz?=
 =?utf-8?B?UFh5NnhJejVDOHpPaGptTnZQT3ExVy9LdXBFN2dkc2dkWUpmQ0N6QUlxYktp?=
 =?utf-8?B?N3lyb1FpOFNKdThGT2Y4VEVHdXA4QVNEd0pRc2s5RGc3VmtSL2JGYnViVUZl?=
 =?utf-8?B?NG1sdVNKTWsxSXZEaXBrdi93R0p4OS9iRjlZNkhLeDI1TjlHU1VFYWQyRXVX?=
 =?utf-8?B?TGRxOXlIcGFjUEZTU0JVMWpIc2RCY1V4OUttSUdTd0IyVWVJMW03dVppSEFP?=
 =?utf-8?B?VTc2YlVqbkl5b3RPaWkxcFExSFMyT0VxOSs1TFJQaWRqQTdyamtBVGFMaTZt?=
 =?utf-8?B?d0o4M2JnOWJjemtIT1QzenJZclVSSlpscFFwYkgyV2V6K09UUGpxcDBNMDA1?=
 =?utf-8?B?SmdaZHhtbTdRNGFmdFRhNGYwc0RaNXcrdklaYmovU2IyMHB4UlBGeUxMbDJN?=
 =?utf-8?B?WEE0cFhVaU5GNUZIL2JMNjJteWlUOG9lUHJLckJzeDF1ZjRBdkw2OC8yOERj?=
 =?utf-8?B?dlh6cGFLelRTUzdpdHAydFBJa20zYUFMbUEyV21HdTVJaTA1NGdXVFlodk9h?=
 =?utf-8?B?T0xWNnl1djVSSDU3bHhkT0tHRnpUaVIrVXduZ2FhNHZNKzcwczJJZm1mZDVa?=
 =?utf-8?B?T0VnN2Y5Ny9lSVB3T0gyb3ZCSG1neFZ0RXgyYTBjWnZQWitML0FTbGdEUDZD?=
 =?utf-8?B?VWNWVWRUYU5OOEtEbjZPWE5VbThaOTNIb0FCbXFzWDVIeUl5cEZVYVFoVnlB?=
 =?utf-8?B?S1o1Mlk2ZFI4dzJGVFg1T2lqMGJqcThqcG9KRHFqdTYxNUUreU5EYitYMkVV?=
 =?utf-8?B?U3lsazQ0b0lCOUhYdHFLdVZGT0hCakpzUVlCcGJxTk93Z2hXQ1dGamRpcmFI?=
 =?utf-8?B?UkZPUnI5ZEorVVo3Ym1ZcXc1VlEzSXVLS2h1TElzRE94RTZ1REdudmpQRTRm?=
 =?utf-8?B?dWdkdysvVlk0UWtHN295ZXU0RElJZFNtdUJXS2pDajdHTlRDSTdnRENJZFRR?=
 =?utf-8?B?b1ZCY3Zpb2EzVVlCTi9DcjcxN2Y3aXUxcUFrYktqTEk5SFoxSHA2SUVNenNJ?=
 =?utf-8?B?dlBvN21QQVFWTzRhSlpxa2g3NlJYNXh2U1BWWW1NZU15c3dhVEwrbmkxQUkx?=
 =?utf-8?B?V29jS256S2FMcHJnQWY5bThILy9EbmlNT0V6SGU1eHBHd1NoTE9VYmZFbGZ3?=
 =?utf-8?B?c1NEV0UxOW03Sk5YVDl5S1pLWkthajg3M1lScUlneGRhM2lzaFNaTmdGb2Yr?=
 =?utf-8?B?YXNSTFZaZDhqalB2eXp0cExKOGh3VzNhRjl0eTUxU05TZ0QyUWd0K2xaWUlB?=
 =?utf-8?B?WWV5ZnhrQWdhd3Azd3BBeTVmY24zUExCOVJsbzlNWEpqRzFkRlNtaVZQdEE2?=
 =?utf-8?B?Sm1WY2hycG85Njl4SC9DUEpDSzZvSHB3b21LdmRCOFQwL1A5Y2lBMXQ0SXZV?=
 =?utf-8?Q?uM7qDXwpOFlRjVN4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a891af76-61c6-442a-5b6d-08da396b6edc
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 07:44:41.2909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iHUwfPOyFC1Mlyv5F26UmmpAU1R+Rg002WdibyKkQoWNtuIdGDoPG0Ygu4aYUEUn01qpns+W159FK3bXEM7rKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1573
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 robert.foss@linaro.org, Maxime Ripard <maxime@cerno.tech>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19.05.2022 01:36, Marek Vasut wrote:
> Handle empty data-lanes = < >; property, which translates to
> dsi_lanes = 0 as invalid.
> 
> Fixes: bbfd3190b6562 ("drm/bridge: tc358767: Add DSI-to-DPI mode support")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> ---
>   drivers/gpu/drm/bridge/tc358767.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index 7366968dd7b21..84e6b5aa8dd1f 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -1902,7 +1902,7 @@ static int tc_mipi_dsi_host_attach(struct tc_data *tc)
>   	of_node_put(host_node);
>   	of_node_put(endpoint);
>   
> -	if (dsi_lanes < 0 || dsi_lanes > 4)
> +	if (dsi_lanes <= 0 || dsi_lanes > 4)
>   		return -EINVAL;
>   
>   	if (!host)


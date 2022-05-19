Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 935D952CD75
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 09:46:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E8A511AEF2;
	Thu, 19 May 2022 07:46:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49F3211AEEF
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 07:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652946401; x=1684482401;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IBlnWyrW09i83wGQ3xZq6EN2YgHlATdjAwLfaksd1Zk=;
 b=c0m7YYsT8HQkoBjnrf4gaBU3ZpPI1HAWP8qAqxt8dJwqi3aN695DSoUB
 jpau+9ukWYvacOU1voh5WEV9f1svzMGctR9XMnVNeUSki/lls1edt1v6R
 9IDul/4mF4ykHkWZEMlNmEITeXsfSmslzpqyrVGTN66y3ZTTUnr5xEbd6
 5DRRFLdYqHKHlYdrRBYCUT/8o9VnewQ6BcT7stc6MzFKn2Yzc0pQEz9vU
 pVqJ1NMO1cQxAPkFRkeLiFUrqaDmNLyRC6UXZMVllJJysOAX1g8TqR2qB
 NXhqg5y/pLfxn5W47UX1K/6vSodLu+Tf7oh4nj7B8tp4pa/0w3YErZGTo A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10351"; a="332697325"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="332697325"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 00:46:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="575480524"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 19 May 2022 00:46:40 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 19 May 2022 00:46:39 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 19 May 2022 00:46:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 19 May 2022 00:46:39 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 19 May 2022 00:46:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XS68xhhK1efEaW7eBwv0G5DwO93dVR7q0JqRdEIqFgcejK14LFXrLBazjX/VBlBcL62pzJ9qafUWFhMHmDcCswl2KJByt0H5OaTxULiLXqt3CM57eNVEpWg36YyuthMCRn5H+ZDfbd7Emp6DZHsSvopUXHtZ0+c3f8gnAHOgy2kQyxrTd6kGfwacSF4Ov5YARy1t208Kvlww1cdrpndS7JaUVLWrhhOE+1ibPehhsGsv7QRCkd1wBhYpF9TzSuflVMsYoocgAEZq+cMTDDIXiQqlcTFmlD4B6ihdvYGWnyGAIeUaPLpS7Agy6lD1BuxUUEZDlK8p9Kz+2ailbu1VqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7T5+DijzAMKyIWtPTfq5iio9gHpq24C32vjfNbp1+uc=;
 b=Ah2s1Ur3+IXRs9px0Dqd7fPevKrGlIXuvhmZjQCbZbCf27JOQ4/n5+RSJx7R6L69RBwjca1Ri6E1D1p9ShcbazLhsyQpRQDwr3kzceIMhTDAcOzOEl1q7mlGDD5YKUi9R3HkoBrNSiWtcbWjGhyj5ghLoxVew50lSJK3yMnl5pPMl4UXlcBf1+X0nWRMi1mIH8f1dvt+X7LsBthlTuo6mCUIp9qW1/eBfop5d57ouoySMxF3sdIUoGIRVOexGUJGgvkzGGPa6G1QUJgtWyPaeFnGx4nOYNp8oJur6ZUs720YGSjDOXCV3Gs+blpSXrs2dvYsUJGco7S9rUXmgry0lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 CY4PR11MB1573.namprd11.prod.outlook.com (2603:10b6:910:c::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.13; Thu, 19 May 2022 07:46:37 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::b1fa:393c:9fb6:6871]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::b1fa:393c:9fb6:6871%5]) with mapi id 15.20.5250.019; Thu, 19 May 2022
 07:46:37 +0000
Message-ID: <f743b8ab-4b1a-b71f-e298-22d4f2b8edb3@intel.com>
Date: Thu, 19 May 2022 09:46:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [PATCH 2/3] drm/bridge: tc358767: Report DSI-to-(e)DP as supported
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <dri-devel@lists.freedesktop.org>
References: <20220518233602.248185-1-marex@denx.de>
 <20220518233602.248185-2-marex@denx.de>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220518233602.248185-2-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0155.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::22) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a6244b9-6808-4a5a-f6de-08da396bb3e9
X-MS-TrafficTypeDiagnostic: CY4PR11MB1573:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <CY4PR11MB15730F3390948381BF712537EBD09@CY4PR11MB1573.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NNR1KmdBftHTw6qKuhorB1N3X2wbBGCFrjIm6sPRV/i1DhvIF1C/iAeOgDMkRLsNWB7CsyIh6TLTstIbGhkXJzSlt46wlnOH2NEl6TE9HDqbpMKcI+M9RQqTzTl/Ol2+NuLw0O49PtiFdVdEM8/smoy5YBOPfQkqTNRvh6lnJ+Y63O5nrQx9ul9b8mQcluxwLlStkQ4js6ygjP7nzdebHnO4Ro7OV/akic7NBY30liby1+MZzBtvHK5SAbr0GPG/jKoOZ/l3ck/een8Oqz/N2ZpYyP/M8VOHQ9XTZEy0HgNC28qE4PZ/9aeHOFghYEZoiYyL6dAZakRg66bqYaztTwFnMtVspOj20CYKgxlA5kkPL/DnBDgIrYR8Y7HhpmprIAe+DKNc/lb5cQbmVAE3+/lAwLQIxgo/2OZL2y9TOeNEjUY9Affjb98rqcvJJ+EBFTsDIIEyYP0IEguNvxQnLDTFcm8ZNj7RxPxhENvKabKMMdJT38uhMqg1KXQXO65BrfyJr2xBc7ltMLk/M6uKedkvF9MZ36yR4ZraoOg7B0Q6xGE+xjCq62jrpdIFK9SQaYBiLm6etzQqNsYIb6PlfXQByviOLE9uG+sc64Sll/jyQkFv8epXjVaf1SOwcP/N9nldlag0/eOOwDVwxbWQiP/RRrmeSt5Hi9/2OudaXI/J9I9q0fd1g0qwGjow65Z052BssReLLE+YSpj9n5CDDS0Fu3XuKamtj1yla2CrEBobxvVtvrwEq8RDF5l91TxH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(186003)(5660300002)(31686004)(66946007)(2616005)(6506007)(26005)(44832011)(36756003)(83380400001)(53546011)(8936002)(36916002)(38100700002)(6486002)(54906003)(2906002)(66556008)(66476007)(31696002)(508600001)(86362001)(82960400001)(8676002)(4326008)(6666004)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEJUa2hKS1MvME0zcGlxSjMzc1haYmtKcmY3ZzRZU2I4YndVcStzNEVDSnY3?=
 =?utf-8?B?QTFlcC9ndGZjWlVVMk1DNlVwQkNVUzdKY0JXNDYveW5CSHRsdFVvb3Y3dmhl?=
 =?utf-8?B?SklBbDBUOUdXYiszK1o0SUw0Y09pOEdZaHVrM2Z6bEJ5K2pRKy9IdStmUE9W?=
 =?utf-8?B?R3BNYU9OYjBwWlVnanpzTjdIR05mREcxVS9TOWJtbmNDQmpJMHFwQ0NXYnh0?=
 =?utf-8?B?LzlVSmxHVzUrLzRmbGlZQUlHY3MvZHNJc2VLYmpiQjgzM0lRQkwvUVJhV1pQ?=
 =?utf-8?B?ZG56UkZkUXNMVENVaHpPYkJ4MDl3SUdYeTBRN0RPSGV3QmpQaVlVYVBIcVgr?=
 =?utf-8?B?OXlNL2IrMHE3d01JVnM4WHlPWTBGdUFOSHRzMFdTSVJSaC9mWFpmNVlqZlU0?=
 =?utf-8?B?bm4rejRaT04vSWJOWWdBN0xpK2x0VzdkUkNsTFFZSU5tUEZndGtGRHhLaXVL?=
 =?utf-8?B?NE8xZmVoMmR3aWVLbVVGRjZRaUpBVDhMVlZyNUxqdHczRkxtV1NXSUd3cHR4?=
 =?utf-8?B?bC81ZmlZRzg0aG5TMlJTUU5MOEd3QVFuV2FEaTBCazVKQjFxRVh3bXZNaXBC?=
 =?utf-8?B?ZGVjTGhOaU9udks2Q1JmdnE4VXJkSlVEQkFLM2ptN3o2ZzlsZlFBNGZFK1B4?=
 =?utf-8?B?aGs5Rmp5NWc4TXpQREFsRUk2RkRscTVlRjE1b1BzSEg4eXJXbXRPdUJiZVhU?=
 =?utf-8?B?YkVZNDc2ZnBXU2VxMjN2NHRDN0FKSDllKys5ZUhSN1g2RG5LWlpKdEx2RmtD?=
 =?utf-8?B?ZDh3OWJ4Z2cySG5EUUR6SlZUV3dCc3MzUDYzQ0JGdTFxeUZhT0t3dWlkSXhi?=
 =?utf-8?B?NS9ScDR6WUpIUWlhT1F4WUVjbUhYK2c5QVhSOWwwMXhJdjIyYWJ6NllYbUVH?=
 =?utf-8?B?a2p5RFN6b3ZaQVdHdFFTQWpia0t2RndFY0tDYnFjL1RxT3NWK3pwdSs0Uk1M?=
 =?utf-8?B?MEozeTBYQ0hydy9kREhyYStDYTBrMTRiSnVaZWN0SG42N0VuUmc2QlJOMVNB?=
 =?utf-8?B?R0VrS0ptc3pVMXlmMDhOcmRoMGEzcTBnbWdYM3FLWTZ0WkhuSTZMU1Zla3pH?=
 =?utf-8?B?VFZZM04vR05LOHM0dEVmK2s0VCtaaXROWUQ4VUIybHUvYWsySDFmOFpPbWMy?=
 =?utf-8?B?ZnRXcDRRek9sLzBRYWlzZ2U2ellac3J4a3AwcERaT1p5cXRXaEhSbFRjMzdU?=
 =?utf-8?B?bEF0a2ZHcWJDMHhhaHhYU1lNSmdXdUhJVG5SV055MFNhU2REZ3NkYzRkUnVn?=
 =?utf-8?B?TXpFdHVNbTEvOTFaY0xycDBDSHJuVnFJcGJmZEVZcnBWVXdNODg0bFRqU0ZF?=
 =?utf-8?B?N3ZZTGZFMGlHb2pIZWZ0KzY4Ni9lNVZRa25oTFg2cEgyYmlFZ3VPVXZRdjVH?=
 =?utf-8?B?dG9mK1lWTU5HS2gxNGpKVDVRcHZpVzZ1NTllRGJxQnFCOFZzdDdZbU5ETnBM?=
 =?utf-8?B?b0c4K2Y1ZjBZbU5jc295YkN2c01INDI5NW1jVlVHejlmM3g2NTMvczR0K3VK?=
 =?utf-8?B?V285Z3FwWENmZEV0Yy9Rb01YbGw2RUdrWUFkVDNnSFJMVHJTMm41TnhBNjBr?=
 =?utf-8?B?VmpPN3l5anZYbURWVDl5c3RrUk8rM1drTlE5SkRqWTdaLzlpK0xkTmkxY3hj?=
 =?utf-8?B?bTVXTVZhVjA5bzdwd043U2ZWQ25ycnZlZ1UrN3hCVHJ1WTd2ekw2VTVtREdS?=
 =?utf-8?B?U3RMSkxqeGt0eWhsR1piL1YzZmZGcGZSYjFUQkd5Vk9KRGFiQUJaWDdyVzJV?=
 =?utf-8?B?bUVPYnd3RkRTQnZRbnBYOEpRc1ZxbkNudldqKy9HWXBlajZDQThCQXRsRm0v?=
 =?utf-8?B?RHNWYkZCM1F5M2tLV0Q4NnBHd21XaWRSKzJiV0dmQlVYTW5QVEJtQWlkRDlF?=
 =?utf-8?B?blpGN0JMQ3QyZklJYXR2L3F0MXhBbE1YbDZQZE5LVUgrY3MzdE9EMEhiQTlu?=
 =?utf-8?B?RkdjcnBySHRuMHhEZDNwY0p3SVR2R3NteFZRc1d3aGZRV2V4YWJsdzBGaTRk?=
 =?utf-8?B?YlU1RjMzdG9NaFR2RzArZWI3V2xwM0R1RllpMitJU3RHZHBXa1ZQV1gvamxm?=
 =?utf-8?B?Mk13MFBIUzNQL1EyQnlBc2hZeENQWmRZWlJocTZLOE83c1ZpVzUvaC92Kzdl?=
 =?utf-8?B?VW9memhFa3NpNzZXd3lHcS84djROclZkcHJFOGdxRDJEU0F2dTN4ZUNscVJF?=
 =?utf-8?B?cGNsSFpDaktuV2Z4MUVUOUdWU29MUUowZmw5dTFyNC9mdDJ6VFF1cTU1cFh3?=
 =?utf-8?B?NnV4clZnWGdHaXVuZjJKM24rYVUwTFJnTEJrRHJxV2R6UktIMS9WSmJsWWRR?=
 =?utf-8?B?ZStlTnhXNnFFK3dkbWpBS3RUdy9ydDNQM2g2NkgwRGtWTWhxQkh2NUtOc0RT?=
 =?utf-8?Q?vuwydCyWAuLHwCR0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a6244b9-6808-4a5a-f6de-08da396bb3e9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 07:46:37.2834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sZ89VyPEnLMbsoIM/IXEwr+QZO9+HfwORdJsysyxW0kMv+7dv/Y5SMnzrh88ZhBXGUW+iuSbfJuqNKKJJrIJ2g==
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
> The DSI-to-e(DP) mode is now supported, update the driver comment
> to reflect this. No functional change.
> 
> Fixes: 3080c21a043ab ("drm/bridge: tc358767: Add DSI-to-(e)DP mode support")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>   drivers/gpu/drm/bridge/tc358767.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index 84e6b5aa8dd1f..a8bb6de9e600a 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -6,7 +6,7 @@
>    * The following modes are supported:
>    *   DPI->(e)DP -- supported
>    *   DSI->DPI .... supported
> - *   DSI->(e)DP .. NOT supported
> + *   DSI->(e)DP .. supported

Since everything is supported(?) this message becomes useless, or can be 
shortened. With or w/o:

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

>    *
>    * Copyright (C) 2016 CogentEmbedded Inc
>    * Author: Andrey Gusakov <andrey.gusakov@cogentembedded.com>


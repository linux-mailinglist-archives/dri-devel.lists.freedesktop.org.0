Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CA952CD69
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 09:43:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D307E11AE8C;
	Thu, 19 May 2022 07:43:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E20F11AE8C
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 07:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652946235; x=1684482235;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KPi1HlCXqqs3gunl9xzwYlTRLBasPnei7i5mFr/ov3k=;
 b=RlwJHT58wLfOgQJuRF74R8uEDgKx7L1346EqYyFaOq4+eEE91UZYUB5Y
 x2il2nQVMYhDTGL+vTXBhyxLJmUpUI3tFI2Xb8Q83kB3phQknmMmB1SGT
 LkTuf2VeFjkMlexADdB2AtvZkjes5/JGRQwNBXmE8hX4RsLfDgfr6yCCJ
 PrFSYl9fEibwv1SrzIhO0S9Qr2UEscQVz4OYwrrC6x2t8aImW50A+NAgz
 f8Bo3wtP9qj+ibP6iB/PrvdUbKuiF9XS4qiBoHXFT0WY3cwDeSYstlhcF
 Ofh5AkfiTw+eFxV75vhIhSAi7KgeTUDosMUjbr5x+j0XoAfh1IHqiJXiF w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10351"; a="271770292"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="271770292"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 00:43:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="575479642"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 19 May 2022 00:43:54 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 19 May 2022 00:43:54 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 19 May 2022 00:43:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 19 May 2022 00:43:53 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 19 May 2022 00:43:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UqdNivZKk6lN995gA78B+W7lD7WDKdtQ2Hm9Ny5zhBVgTJBHcdTY0h21Vyrj8H0Ct+E8nA+S7bvVcstL09x7Zb0PJ9ret4F1fA5Cpi8rSN+AcCoag2hnBYXlImGZgymW7M208kO6D7SjDBL9B6fbfszruVTBl34QyoXPldDuQAA3EOLdJtjTgx7B2noL5NIMYQvTRwWCJD8ni4IvyaoRZZxUVKC8/X//xZLPV0B71aCahrM70Tm01KzuCVE4jzWSvCuSkkgUN64oXG6HF+yGeST0yvtLH+HeAtPnCliVPfzyqQo1Pk7TDtR4A6Y3gQGqN97aZghPZU2tFReAibA4QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lBbeHEGeqm9wpRuYFDHXd9VdQ83HwBO9dzMKQvnM3iI=;
 b=mrIAKfHM8EPnOMUApRkuUKGBUdiBHcOW2UlSKWQ8gGvvjo0kzJL0Fgh4G8331omRl5sWLqBMNhNVifgjj0DMIk9gf3oHzz3VXKdMbCxmMxNVyCYrW2nWkJaMAV6UPctgBkPREl0QpObBn5V+3SanI4URppo2XPqpVuJrFzJest7PKllQr0h6TShe45qduwUyBHgx389dIpgF3hSOjyVd3SWnwiveMszMDYX5CP7YiFzUoLhysT+DdK42AQr061JElfVIHRUuAzI384x7C2R8LQQteFmpE9R2EXGvD+3b7jpP6uoSkUO/JX9YT0yfa1zukyUZ8l17BlkZJup8Mw1EmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 DM4PR11MB6165.namprd11.prod.outlook.com (2603:10b6:8:ae::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14; Thu, 19 May 2022 07:43:45 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::b1fa:393c:9fb6:6871]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::b1fa:393c:9fb6:6871%5]) with mapi id 15.20.5250.019; Thu, 19 May 2022
 07:43:45 +0000
Message-ID: <e4eeb60e-c694-cdf1-7ef8-e6180de20b1b@intel.com>
Date: Thu, 19 May 2022 09:43:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: Handle dsi_lanes == 0 as invalid
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <dri-devel@lists.freedesktop.org>
References: <20220518233844.248504-1-marex@denx.de>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220518233844.248504-1-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0054.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::29) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e884324-a21b-4b21-3707-08da396b4d77
X-MS-TrafficTypeDiagnostic: DM4PR11MB6165:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM4PR11MB616504E041FDC87F8FC9F6EEEBD09@DM4PR11MB6165.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wCyix7qaiALy4QIlhuUmU9cgNIVnFkr/RzXVFlcwzjodz3YJcnOVG/VUdS88idWcW7Spd5rXwiwKVx0G3BCNavxWJFk+yiKY3iL6LwfJndhp3afEGoY1jAIbt0hNbKAdQPhS8o/H8ay7W3Qnuqg4OJfb9Frqg0CfPtaCgX9P+nH1kllYzfLytmdVG2g+166sbfTSO3va6E/AHMP+KPLX/OcTav2ND61ONp7GBjoqN82X+qhhLEIS9++1lIB9lWvXod//AhouW42f8JTgaZdqVOSHL71nRB6SC4uEVSZTgIO7Wt2BIb0U/qrPWkdOD07Dcs0J8J+CFUdEIxsLuLJoiGt7HutnZJ5KpQxBl+/BUJ8edVDEAAxD7fveZPGCPGrEj4Z430rbtPa3nzuzerKIAyMGS90TkNco3ROAFeHhmtJF7YVPz/PaC01fOrC+i8Mv/xob3xAgF1W5lr5z0JKpgzN4tY/g+eZQnp+FoJummEbiHPNgy35FGlPXvxftFdO/cxknkFUtGtLUI79Kk9QlGAqaGKim9wjL3R3MvM5BIuy3lzYav/gvn3hfA1ZiZjXmBsN7ywc5wESwzJEsmR2p0WoKQ8cVfBIU39Wq/lMANi0PQP3XvjiANVTc8lABrlBIOCS2hmVN0q43lME0LVCxe1qYomkKvcfj9vzYh1zJQFbHOeO8vPi3pWVjVko8rCT55PvLv6LY/lUzZIAL7roL3Oy/44cIvVfAzgtfAJ+Wyt4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(66946007)(66476007)(31696002)(66556008)(8676002)(38100700002)(8936002)(4326008)(82960400001)(31686004)(54906003)(5660300002)(316002)(2616005)(6666004)(6486002)(83380400001)(36756003)(186003)(44832011)(36916002)(6512007)(6506007)(26005)(508600001)(53546011)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkRSRWdtQkV5TktwYVV5MzJUeGFQZzJONTd6dGg3UEdnelNsMTUzM3ZpcVZZ?=
 =?utf-8?B?T3ROVlNscldkcnM4UmJDcVpEN1RsTGRUR3owZ3JGMlEwQ0dJUVFicVRUc1c1?=
 =?utf-8?B?bndWbkN0Q0p5WVVkZC85TDZsM00yeXowUTRDc2phYm9lRUd0MGZOYTlJK0Ex?=
 =?utf-8?B?QU5QaHhjN1VLUFRmSnZNWXBFSm1od1VSNEdTK3U1WXQ1K3FPSzlrOEtiNzRS?=
 =?utf-8?B?S2VnZEM1WHFCTCs5aXl6V2JGT2R1VlZ4RkNpbTh6RythQXc3WS9QWkpuUnJ1?=
 =?utf-8?B?VWxIN0Q0cGJsWUcyd2Zlck1zbm1GaGx0ZnlLakpHT0h4UWdzQkFKUHpqMVVN?=
 =?utf-8?B?dmdsL3dheGYvZHdiWTZxT0dJV2FlOHFVcTY0Z0JRS1BHSjUxNDZhRTEva2pW?=
 =?utf-8?B?Yy9QUk8xNFBpL2JqMWZ3OFJhb2M0VW5Ra1FDYnRLSUlFNkJpak5rZVpacnI0?=
 =?utf-8?B?T2swdGgzMko0OVBKN1MrOW56MUdzc0FhWnNFUWJWcFZUdDFDY3g3N05tQlNF?=
 =?utf-8?B?M0ZLS1BUcEd0ZlFaL0FNNVhjSXpJVEgrR01nTUVpZ2g5T0lzUjNrYkx4N1hp?=
 =?utf-8?B?K0ZiVHdlS01NQzF1UzFrNHZkanZlb0Y4TUhoTVBSTVBsdTVjSklic2VTazZH?=
 =?utf-8?B?cCtGZmhyajlzNkw4RnJleER5MzRKdmpQakE2OUJRM2h1bkJ1SmVGdHBSN0kz?=
 =?utf-8?B?d2hnR1RnSFVoL1U2ZGdialViczh0Q20rcTVsY2pINVRMUXcwWlB6VWpZTXpx?=
 =?utf-8?B?RW52QjZERWkxcEZZUzA0TkRBdDJ1cTE4Q2doamliVWNPclo4UDBlMnJCa2Q1?=
 =?utf-8?B?b0FscDROd2ZsRnlQRlNQNytReHBCQVgweW8rV0g0NXlEVXpDRGx2UlhnaktG?=
 =?utf-8?B?K3hZNnBWT2JUejBNMFFHSlNMMFRJT0RtZTdnb05vbzB2VkJUKzhyUTRyclox?=
 =?utf-8?B?OWpEV05KRjV5K0UwQ0NEenk3emNtYTNaM2hpSlJUMWJhZTN1SFFmd01ka0Q4?=
 =?utf-8?B?VjVRM0Z2aDREdldzcCtUNFhFN1V4cWpvU2pONGRzKzc2L1N4M3psS3VHc2pl?=
 =?utf-8?B?eStoeUxtWDZSamhyTzI1cjd2Um1XQ1RtbFBGYVBidzBkMmlSRUpSanVVQzZC?=
 =?utf-8?B?N1hwR2F4NlVFZnJOWTZlRWNKeS92OUcxZEtqSHNvVVZDeWVsMG1OZWJ2eWRa?=
 =?utf-8?B?YUViaVdRQ3VnRWNpT0c1dzlVdUNEYlZjYWdHRzBzeHhzZzJteHZCMVExTncy?=
 =?utf-8?B?eWRTWUNydG9vQ0ZKKzEydWRaNFFOdytWLzRTYVJmTEhRYkpJZi9MQjcwbm5r?=
 =?utf-8?B?VkQzUStNVTc1dTFjZG1XcGEzQXRiMU9SZGdkYjUwNzdNRGhkN1RkRHJxWVhD?=
 =?utf-8?B?SHN5dkZ5WlgwQy92VXRJN3NaWkhIMG5GcStMMFN2dzNtbkJXaVQ0SzgrdGdi?=
 =?utf-8?B?ZUhhWlhRbVYzRmVsUDEvY2Z3UXBSbk5nL3NWQmk4SHhnVkJhVjd1STVUUVU3?=
 =?utf-8?B?K3orRTRtMXg5ejFDYm44UTBDaVNJY0F6bzcyUHl3T21iOXAvVktMdGNwYmxU?=
 =?utf-8?B?ZldjdGY0UzZESFRPdHNFd3cvWFF0MlhQYmdHYTBYMERSZmFnSkw4Rm1Kem1N?=
 =?utf-8?B?emc2Rk1xbHZ1NnR4S2puVm9xd2ZyNUVNZmY5bzJINEhBZnR6dE1HYm82bGl6?=
 =?utf-8?B?WDRoTG1uSnZ3ZzVCbC9vSGxXa3FCdENoQ1hDcjNZWjdlZkc2QTdYOUtnNWgz?=
 =?utf-8?B?bTRVMU44alNzZ01FeElqdENrWW1HYzdDelR6S2dLaE1Ka0sxbm9XOGVIT1N3?=
 =?utf-8?B?RGdpUE0vVTZYTkd3V2FKTFJtMkhZbkhOY2licXhVTmpjbFprOW1EMDR0a2FK?=
 =?utf-8?B?bEJsNExjSjNvMWJ4TWg1M0hmYU1HY1doV21HNmNPclpDQi85ME10Und6Z3NQ?=
 =?utf-8?B?b2hsbVlzY0E3Z3pVMklCUTVPUUoyb2hwcW1PeE5vaXdFSHpVUExqMHR1K09L?=
 =?utf-8?B?cXdyam4zV1VEN0s1OXNSR2ozUXZpRWdsMEdzYjEvZzNVWjIzaDhDS0lBUkpV?=
 =?utf-8?B?SS82Q0dKWEgvajZNWHkyT2Y4cWxpa1p3VDNiYTZpNU9mcW4xZUNiczZ4NDJz?=
 =?utf-8?B?NjlVVkxKcmRFVVVLbTZOT1ZnalhHMDJybHM0NGI5cG5rWStmakJzcDBaWjJz?=
 =?utf-8?B?bEI0Zy9oVWJud3NzVVFOeVBtaFlxLzhjZ1FyOS8raGxXeUgvb2NoT0xwc2xB?=
 =?utf-8?B?SU9EWGJ4RHNIN2Q4U1BxbUdYTmpPZ3hsa0MxaUxrSUVaYjlpMmprSFZKbWlP?=
 =?utf-8?B?VytxUGhacFdva0FFbXZlOHIzcFFnZzN4SWJrSEJ5STlOTGMxY0hlTnlrWnho?=
 =?utf-8?Q?/0Cjdsdv83I+0JTk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e884324-a21b-4b21-3707-08da396b4d77
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 07:43:45.6694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8JEu/MMwZVtyhi1MjM8+Nz0Lxcir1AWvJFLPv28Rsi8wNgnOQPExN+56JlvkA5byGablJe9V4ahIdC/QOP9z3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6165
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

On 19.05.2022 01:38, Marek Vasut wrote:
> Handle empty data-lanes = < >; property, which translates to
> dsi_lanes = 0 as invalid.
> 
> Fixes: ceb515ba29ba6 ("drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and SN65DSI84 driver")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>

I wonder if you could not make common helper to get number of lanes with 
checks included, quite trivial, but maybe worth to standardize it.

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> ---
>   drivers/gpu/drm/bridge/ti-sn65dsi83.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> index d64d4385188dd..dc65f424e7f3c 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -585,7 +585,7 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
>   	ctx->host_node = of_graph_get_remote_port_parent(endpoint);
>   	of_node_put(endpoint);
>   
> -	if (ctx->dsi_lanes < 0 || ctx->dsi_lanes > 4) {
> +	if (ctx->dsi_lanes <= 0 || ctx->dsi_lanes > 4) {
>   		ret = -EINVAL;
>   		goto err_put_node;
>   	}


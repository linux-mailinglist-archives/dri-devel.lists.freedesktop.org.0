Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PcME7A2eGl+owEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 04:53:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D158FC02
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 04:53:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A60D210E19A;
	Tue, 27 Jan 2026 03:53:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="BfH6xCA4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010010.outbound.protection.outlook.com [52.101.84.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CEAC10E124
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 03:53:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e494ba3neqgXjhicfxTZfabi7l0oZJN/KY3EMNwtsrZze6g+i3byDDQ2zcEiOTR7NgU2No80NstOWJndiA+pMOnHMXj6SXn4dm3k2BfLjcCT9lDbR0J7oO7OZWkpx7Bzy1+67NS/oEm6le8vp/eZXGTrixXrtUXYUYMpvFPjbqlC1u7AhKElck1E6j75smi3B1pQas8QJW3pJ7ReiAfb2Xk1b1H/FYevbCNCzEMc0J5v9Ut9AUROfZBI4laB2DVyvOx1fuMj1zRp6tz2I326okbd4UwfsTE6POA+CHmojR2HVuDYMyDRSEdUBv7DLFOgeC/r4RpiSdTiN4UzjC/c/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cSAtq3IkSsu4R02L86S8dkC/d00q0NAE5uZ3XeXaAZk=;
 b=p+0GPLVAlODyeECM5GEOxz8GJc3MGN4/x7o+3iM0of2MAAb79IvsnnxJwg8d8ecuPk41cibRnh6HouX36BgYDU1LiLffeZTAPvjRcCY8qT/pvRLHxrsbCc3AXNUaG8xj7YikykckaytxBme/penINY9boukBro5CBgRwZbBCyzuMCd3Q1qTpEaaJxqJjnxkGD99wBS/SWzrJAAdIX5KVWQhBzRhi6/WvuudW2mYH+/69E2KYmDQFEP0NvxiJJYax1l0gpflfSrZQPXduOi5CIOVtPcK9qzd6hRLH9rdipJzr3e8bGKnrr7m4Bbz4daaw4+PPYTCPXMzaVSzvs4SJSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSAtq3IkSsu4R02L86S8dkC/d00q0NAE5uZ3XeXaAZk=;
 b=BfH6xCA4jeWYeUA/aiIjodqV3hqZOLWr0aiAGG7G6WZYQzpWSEnQH53OJdo+0hOtDV9WmRscjvIUmrgz0FZnhHLaesErzYJkK2S8HYCVY89hGWxRrpiyrPBaFs02Thoj3/0fr1upB5PDxeQbZfkzun/Mk9D9ZEYDQL27U09S5Dxbh2AuvLL88dJN5A2YSpKUY43gVjzwFOzMMuHb7ZzIiZ/mf9uzhLGoDd8Lzd/5lPyKY/w97ZdcdFIdsv0YcLWqXugPnTeQ9NXE97FA9nkUSgSJ9pC5kfsFfRa/hnMx6YJ3VYvOlD2kHF536eHzzX/mrZY2UazFQoxt0r568XrWEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI2PR04MB10786.eurprd04.prod.outlook.com (2603:10a6:800:274::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 03:53:11 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 03:53:10 +0000
Message-ID: <efeb3583-dd0c-4e91-bbfc-54b04644f2c2@nxp.com>
Date: Tue, 27 Jan 2026 11:54:00 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] drm/bridge: imx8qxp-pixel-link: get/put the next
 bridge
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-0-a62b4399a6bf@bootlin.com>
 <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-4-a62b4399a6bf@bootlin.com>
 <e2536229-f8d9-4d65-8211-cf445677bef2@nxp.com>
 <DFYQ7TS25SQT.2F7NBYOP8P5R4@bootlin.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <DFYQ7TS25SQT.2F7NBYOP8P5R4@bootlin.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SGAP274CA0014.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::26)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI2PR04MB10786:EE_
X-MS-Office365-Filtering-Correlation-Id: b366e9e2-94fc-43c5-d92d-08de5d5796cf
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|19092799006|1800799024|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WHI5Z29uWEs1QnM1NHhnRU1MZVNGdGpnMyttZU53d0JXY1ZGYmZoSHdqeE5E?=
 =?utf-8?B?N1Z0QU5NbVNqcVVsUUJ3ZnBwckpLTDQySXdyaFBaTE04WHFyeXhFTC9BU3ZR?=
 =?utf-8?B?ek4veGVYYlREOHNKdVA2WndwYyswNGVKL0dyaUQwL05LYjM5RkRvc0JoUEFo?=
 =?utf-8?B?ZU1QRWtOaUR2ZjM3S0pBNVBWWEVOd0NTUlVhQ1dEMjE0emllOUkvRkc5bnht?=
 =?utf-8?B?ZW5LVnRnNE9WRS9rZ01rdU5XZ2RWaG1IdmUyT3dSOVhmb2MxREphcnY3Y0p0?=
 =?utf-8?B?bW5EekxOZ0VCdDlYbnN6OFpySG5nRzFQRlZaazVtZ0s3S0U3SXBSYU1VUTNy?=
 =?utf-8?B?ZnE1a0VCYXZJbzdVQzg1ZTA5VHRpNkZnbkRUWVdmWjJNZ0V2MWtmNDZvRUFT?=
 =?utf-8?B?SVl1Vy96Ly9vUEM3Y3A2WDQzZnB3ZHVmOVB6LzU1V1YvTFZJWWhKbzJwZ25G?=
 =?utf-8?B?T1N1WGQ3b3lWUDR1eFEwbWVteVdocHQremZsQkpucXV0NXY1V2J6bW4wZ0Np?=
 =?utf-8?B?OVd0OGN4RGhlb1d5Y3BFcUtWVUI3Q2xXM1R4OTFsalVCYkZYN2ltYUhRWnJX?=
 =?utf-8?B?UDhiSXFIUlJHMm1ZNk8xQkpBdjJEU3VJd3JLcENoNWhhT05MZ1VKeXRBTTlK?=
 =?utf-8?B?cFhYSE4rZ3YrTFNpWTZpZFdaOVU5bjBGbVdHNWZJY2k5VlZ5bmRlWkJsRTlY?=
 =?utf-8?B?NVdFRDloc1kxNUpSTHUxSWcza0doeU1IVFNPcXRRKzI1ZVVlbVBsa0Y5Zjli?=
 =?utf-8?B?VmJmMSsxTkkzdU16dzNmNkhrOEV0bWFDanA0bGNMOXBMTk9iWXFhZDlUamtq?=
 =?utf-8?B?aTNySXlaLytHblMzbE5JSnVNaW5XV3oyaWRiKzVibHA3S0hzTHh4aGlrQnBS?=
 =?utf-8?B?bURkbWVwNmpKMDM5WlV5ck5qTEhYU2ZpaGFJdlI0cURoSkxBdk5uSG1mN2dn?=
 =?utf-8?B?b05NcWxkUmMrVGNEdkhRc0RJU1lCQzRiWDRxREtsNnowcTk3NUtlUnk4RW04?=
 =?utf-8?B?U200SElhUmVZcXNkRnlNaXZPRzFkL3NIWG9YRG1zdzNFdTg1SS9uUkVnRFlm?=
 =?utf-8?B?NHEvVDkzQ2x0NmtFdUJrN2k3ZFlzUUlEMkFsM2dCNkNkWWxBTS82YzhQL29I?=
 =?utf-8?B?NlhGVUJCUFJBbFdGMTV6K21uZjNUTG9qQm5leVdwcnpXQjFjV0xFYlF3Yzly?=
 =?utf-8?B?Tk01ZjB2OVdVT2kyb3hVM2EzMVpGWnNVYzBaOHBqMW1vQ05XYll1ZDVTU29R?=
 =?utf-8?B?WXY4SFgxeHJVU1BVMXI3VnRySUlPcW84YWxKMEhHNVZTeXVSRmdNc3FraG5T?=
 =?utf-8?B?WUVxZmIwbkdvWVhvVE9kZjRVQW81Y04wOHRqc1YzamRMa1V2djBOUjIvYXZk?=
 =?utf-8?B?eGNoTWdheUZGa3Fwa1I4aG4zWVMyRnp3SVZXeW1QR0hQNFF2Yy9LY3JOY2ZL?=
 =?utf-8?B?MmtGdnJldzBUT2dEaXZ1Q1BpY2pZOXA4QWZldzgyWGx1T3JIOUx5Ymt1ZkhK?=
 =?utf-8?B?SWhwNkJWc3hvU2pIZ2dMNkU4OUIzTENnWi9kM2FoUzBxUzVRMUY2NmhXaTRi?=
 =?utf-8?B?Zk9IK1F1RVgwUGQ3SzVVaWhKZEZVVlREaGI3UW92dEdmTVVFbUVrUHJ6L1hO?=
 =?utf-8?B?N1BiRHBCYWZQZ3ZOam9vT01WVFN5K0Y3eWJudHlwdWVJTGNOazNIRUh1RnZz?=
 =?utf-8?B?MlBGY2RLQjdDR2pTejlYaDNGTU9mUzU1SG9ON0h4NTExTk1Rc2M3QTFla3ZE?=
 =?utf-8?B?L3VsMmE0NGhNelpFdnNGZmFrUWVDS1JEVmhUWkNGK2V2SHJURU96NTZUQ3dt?=
 =?utf-8?B?TmdHVnY5TDNIRUZVcVFoaGd6b0Zsa2pDb1k5N3lNUXlRWTVDS0pld3ZRMXR0?=
 =?utf-8?B?UTZGM0ZHTWZ6WGkwZDZzRTB4anRnYUFkb3NvOEVvV3Q3emFGMlZyUEJOQzVR?=
 =?utf-8?B?MElNSUFwRGI3dlFQQy9RNUFxWWM3eTEvbk5Hay9WOWc0WEIzOUpWL09LWXBn?=
 =?utf-8?B?VVdKUEVsZGJESTVKdG1ZZU5YQ1NrLzBKU2Jvd1VpMndmYjJmN1JycldSNUl6?=
 =?utf-8?B?S1ZITytkK25vWmluVmIxUXBGRUlqTmNpaXRtVHB1bVVYbkhRVmdRby94YUFx?=
 =?utf-8?Q?kyvU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(19092799006)(1800799024)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlRhQzdlb29PcUFnY09tR2RqTmxIbnBmU1lqc2Naa1BYOUIwTlpkclhzc2hv?=
 =?utf-8?B?elU1MHpDZUNiY1M4TVZCVGZrdnA3MTQ2aEVFeVRudG1mUlJaa21GbW1GckR2?=
 =?utf-8?B?dk9rZDJSbDVWYnpwYkJueE5jWkdBK2NFUzdETk8xNlQ2MkFKZ3pGY3haaG1w?=
 =?utf-8?B?TTlFcUVic2tLemJnWFBHaWhBWXA3MXFkWFdrMVNqdEJTQ0NKRHh0SG1xRm9H?=
 =?utf-8?B?RzB6anF4RytUZzJoZnI2VVNJZmxMSExPRnNMMkY3T0lZS3lIK1lMaG0vQWJr?=
 =?utf-8?B?ZHZKa28yZkYyUXI0ZTF5d0RlbnpaalpjSlV6WWh6cCszMVNDWXI1b1Z1QVVV?=
 =?utf-8?B?N3dLeno0VDA1cmhERU5HR1pFQ1g2ZE1UYU0vTEhhOG4wdDEwOGx5SGJhanVS?=
 =?utf-8?B?K1d5ZllacTR5Q3JJU2orbXZjcHR0bCtneG5JbHczRVkwQ2J0ajlhNkpxcEJj?=
 =?utf-8?B?bFhtQllpdiszMENlOWZ2VEI1dHZGcHBmZm9ud1NpYmQxVkU0aDhHVUxCTUdB?=
 =?utf-8?B?MVpROVhTTTIrdUVhRWlEaWZFMUxhL3ltK2lUS2tYdmFSSWpWZlpsSmVQZzBF?=
 =?utf-8?B?TE9ONVhqdmRPZkcyay9YT3d0blBUdGFSaVBNUmR0bTMzM1dLbVNlM1ZCK2sv?=
 =?utf-8?B?MXBaSlZvWTQzTTJTcDNtVTcvOHMzNXdtL3NZL21uUFRFQkx1RDlSa1lpWUJa?=
 =?utf-8?B?eWJIUlBRRHQxK0ZJVTRpNkVJazcxTDVjZ2VMVGY4MTBuWExHMjkzOC91Mk5z?=
 =?utf-8?B?QkVjc0JycTlaUlNLZjdUVlF5YTNQZ0YyZFRVZ3RwVVYxS0Y2R2lORnl6TzdE?=
 =?utf-8?B?MWZXM1FaTG9ISEJNa1d5dzlzalVHQ3kvWFRKVFc5VmhiZTNkNVdYeDZNbUNh?=
 =?utf-8?B?VnBSaGhIb05hZDQ3S1ZUeHdqd2xMMzBjZWczQ291akxmOTU5anZJUVpPcVdq?=
 =?utf-8?B?RFovbXBsd3JpL2Z0YTdxVHFRd1FYcDhDL1VMT3lNYXlESkNMdWJxMkZ4cVFk?=
 =?utf-8?B?MXNHUzlmK1FrL1k1dHlZSUc4MXd0ODJIK2tqcysraXFnalNGK3phS2hiQnp1?=
 =?utf-8?B?OVZhd05KSjBaeUswMUNaYm5ZQlFNZzlQMjVWOE00MTl4MzVQTDh5TEIwMnB6?=
 =?utf-8?B?TUIzalBvaXN4YjRSK3Y1anZIb1VBUTdRNmt5WmFaWjc0MzJ1bmJIemdWWmlw?=
 =?utf-8?B?UXdoM1hhV1FtckM0QUgzR013WU9acnBWSG5zc1hwbEp3MlQvWmJ3SkhvK3Rk?=
 =?utf-8?B?UENTbnhSQ1B6TlpGbTNNcjNnTmlJY3BGaS9jVDVIWG9KZkJJSmhkTDZINnBS?=
 =?utf-8?B?Z0xvYzR5SnN1eGQ5TGlWNm90QkFFQnlzNjVMdUFCQlJzMHhaaXNiVHQ1N05j?=
 =?utf-8?B?Rm5vQ2lWR0Z0TjFiMDgrT1RXcDNaNzdoQW1nalhrTXhrdE82VmtIU0EyZFY1?=
 =?utf-8?B?aVdnNVhjMlJSWDhnVzIxZm12cFF5TjRhUjdTc0VZNFFaaXBpdUFWQXRpdFB5?=
 =?utf-8?B?MEs2aDV5VUFJY0FTOGIxbFBuRnY1UjNBSm95VlpBdE5pbW9sWnRTakZRY0ps?=
 =?utf-8?B?b2dHU2tjdk9vblI5UXRjL0lXdlFybllyTWpuQUsxS2laWEJFSktudVJab0dJ?=
 =?utf-8?B?SmtNbldQQWg1d0ZsNGhubmJpK3NMVEZiZEpINDBTOTE0VW92eklvWTZaVWVh?=
 =?utf-8?B?OHQwNzBFQjRIU1BzSWdJeXJYVlBtVTVwQnUxSmVBamozVFlvU0sxK0VmcUQ0?=
 =?utf-8?B?VmlOVExTZFRUQUpqSDNPUTcyR1FYbk5pc1FkNXUyTFlXQWZuMWhyRWpaNXh6?=
 =?utf-8?B?a2w2SXQ1RFVjQ3JwQStXeGlNNGxDNUdxU1VOVHVBZ2g4VnNlM1VUNGEwZWhw?=
 =?utf-8?B?c1V5NVVtZ05MWk5iMTF5RDNEakNoR0J4M3U2SFhBZVBTRU5tYXpMTWhxV0Zu?=
 =?utf-8?B?bE4xYms5S0dJaUV5Wkh5dkYyd205V1oxby9iWTZ0dWFZbnpyc0lGckdqOHlt?=
 =?utf-8?B?SEF0QU9uQ1A1NEZOM2xXcDBpbjM0SEJObHd0ZFZOZHg1T2t5M2NKVXNlbkk2?=
 =?utf-8?B?cVlORXlqdkZjcENha09aWkt6Vm5XcFFpaXBqbmhlNk44V1loN0hCa1RvdjJC?=
 =?utf-8?B?SExFemlLUUl6UWRFeTVQN1FZa1NETVVCcUsvaW02UXRYNUdmSmtzR05HaDhx?=
 =?utf-8?B?U2hrMmE1M2pPaUxZTVVtL2tuQ0NsYlRJUGlJdUVvZlNkOE5hamFja3N0VnFJ?=
 =?utf-8?B?Y2FYQXdXMXJ0KzhiZkpNalJTVkF5VTFPdklYTDgyTmpGR1VMWkt5cExaK2Ji?=
 =?utf-8?B?V3pYTzROVUtHcmtEdmgrWWNwYlF2QmREWkprNCtjWFlwb1d5M1BoUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b366e9e2-94fc-43c5-d92d-08de5d5796cf
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 03:53:10.8371 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a8dUAaFptjb7DOwu5m1nb79779by7HuWnQf+uD485oJ3ZZ0qJNYfRziLOrVLSWOyy9PhnJyHBQ+HoF6boniblg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10786
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:luca.ceresoli@bootlin.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:Hui.Pu@gehealthcare.com,m:thomas.petazzoni@bootlin.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[bootlin.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER(0.00)[victor.liu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[victor.liu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,bootlin.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D3D158FC02
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 07:18:47PM +0100, Luca Ceresoli wrote:
> Hello Liu,

Hello Luca,

> 
> On Mon Jan 26, 2026 at 9:06 AM CET, Liu Ying wrote:
>> Hi Luca,
>>
>> On Wed, Jan 07, 2026 at 10:56:29AM +0100, Luca Ceresoli wrote:
>>> This driver obtains a bridge pointer from of_drm_find_bridge() in the probe
>>> function and stores it until driver removal. of_drm_find_bridge() is
>>> deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
>>> refcounted and use bridge->next_bridge to put the reference on
>>> deallocation.
>>>
>>> This needs to be handled in various steps:
>>>
>>>  * the bridge returned of_drm_get_bridge() is stored in the local temporary
>>>    variable next_bridge whose scope is the for loop, so a cleanup action is
>>>    enough
>>>  * the value of next_bridge is copied into selected_bridge, potentially
>>>    more than once, so a cleanup action at function scope plus a
>>>    drm_bridge_put() in case of reassignment are enough
>>>  * on successful return selected_bridge is stored in bridge->next_bridge,
>>>    which ensures it is put when the bridge is deallocated
>>>
>>> Reviewed-by: Maxime Ripard <mripard@kernel.org>
>>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> Thanks for having found the time to go into the details and provide a
> careful review of this series!
> 
>>> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
>>> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
>>> @@ -23,7 +23,6 @@
>>>
>>>  struct imx8qxp_pixel_link {
>>>  	struct drm_bridge bridge;
>>> -	struct drm_bridge *next_bridge;
>>>  	struct device *dev;
>>>  	struct imx_sc_ipc *ipc_handle;
>>>  	u8 stream_id;
>>> @@ -140,7 +139,7 @@ static int imx8qxp_pixel_link_bridge_attach(struct drm_bridge *bridge,
>>>  	}
>>>
>>>  	return drm_bridge_attach(encoder,
>>> -				 pl->next_bridge, bridge,
>>> +				 pl->bridge.next_bridge, bridge,
>>>  				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>>  }
>>>
>>> @@ -260,7 +259,7 @@ static int imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
>>>  {
>>>  	struct device_node *np = pl->dev->of_node;
>>>  	struct device_node *port;
>>> -	struct drm_bridge *selected_bridge = NULL;
>>> +	struct drm_bridge *selected_bridge __free(drm_bridge_put) = NULL;
>>>  	u32 port_id;
>>>  	bool found_port = false;
>>>  	int reg;
>>> @@ -297,7 +296,8 @@ static int imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
>>>  			continue;
>>>  		}
>>>
>>> -		struct drm_bridge *next_bridge = of_drm_find_bridge(remote);
>>> +		struct drm_bridge *next_bridge __free(drm_bridge_put) =
>>> +			of_drm_find_and_get_bridge(remote);
>>>  		if (!next_bridge)
>>>  			return -EPROBE_DEFER;
>>>
>>> @@ -305,12 +305,14 @@ static int imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
>>>  		 * Select the next bridge with companion PXL2DPI if
>>>  		 * present, otherwise default to the first bridge
>>>  		 */
>>> -		if (!selected_bridge || of_property_present(remote, "fsl,companion-pxl2dpi"))
>>> -			selected_bridge = next_bridge;
>>> +		if (!selected_bridge || of_property_present(remote, "fsl,companion-pxl2dpi")) {
>>> +			drm_bridge_put(selected_bridge);
>>> +			selected_bridge = drm_bridge_get(next_bridge);
>>
>> Considering selecting the first bridge without the companion pxl2dpi,
>> there would be a superfluous refcount for the selected bridge:
>>
>> 1) of_drm_find_and_get_bridge: refcount = 1
>> 2) drm_bridge_put: noop, since selected_bridge is NULL, refcount = 1
>> 3) drm_bridge_get: refcount = 2
>> 4) drm_bridge_put(__free): refcount = 1
>> 5) drm_bridge_get: for the pl->bridge.next_bridge, refcount = 2
> 
> Here you are missing one put. There are two drm_bridge_put(__free), one for
> next_bridge and one for selected_bridge. So your list should rather be:
> 
> 1) next_bridge = of_drm_find_and_get_bridge: refcount = 1
> 2) drm_bridge_put(selected_bridge): noop, since selected_bridge is NULL, refcount = 1
> 3) selected_bridge = drm_bridge_get: refcount = 2
> 4) drm_bridge_put(next_bridge) [__free at loop scope end]: refcount = 1
> 5) pl->bridge.next_bridge = drm_bridge_get(), refcount = 2
> 6) drm_bridge_put(selected_bridge) [__free at function scope end]: refcount = 1

Ah, right, I did miss this last put because selected_bridge is declared with
__free a bit far away from the loop at the very beginning of
imx8qxp_pixel_link_find_next_bridge() - that's my problem I guess, but I'm
not even sure if I'll fall into this same pitfall again after a while, which
makes the driver difficult to maintain.

Also, it seems that the refcount dance(back and forth bewteen 1 and 2) is not
something straightforward for driver readers to follow.

> 
> The idea is that for each pointer (which is a reference) we get a reference
> (refcount++) when the pointer is set and put the reference when that same
> pointer goes out of scope or is reset to NULL. "the pointer is set" can be
> either of_drm_find_and_get_bridge() or an assignment, as each of these
> operations creates another reference (pointer) to the same bridge.
> 
> Does it look correct?

Lol, I guess I need more coffee to read your logic of refcount get/put.

> 
>> I think the below snippet would be the right thing to do:
>> -8<-
>> {
>> 	...
>>
>> 	struct drm_bridge *next_bridge __free(drm_bridge_put) =
>> 		of_drm_find_and_get_bridge(remote);
>>   		if (!next_bridge)
>>   			return -EPROBE_DEFER;
>>
>> 	/*
>> 	 * Select the next bridge with companion PXL2DPI if
>> 	 * present, otherwise default to the first bridge
>> 	 */
>> 	if (!selected_bridge)
>> 		selected_bridge = drm_bridge_get(next_bridge);
>>
>> 	if (of_property_present(remote, "fsl,companion-pxl2dpi")) {
>> 		if (selected_bridge)
>> 			drm_bridge_put(selected_bridge);
>>
>> 		selected_bridge = drm_bridge_get(next_bridge);
>> 	}
>> }
> 
> Your version of the code looks OK as well so far, but totally equivalent to
> what my patch proposes.
> 
> Do you think splitting the if() into two if()s is clearer? Would you like
> me to change this?

Yes, please.  Two if()s are easier for me to read.  Also I think the
"if (selected_bridge)" before "drm_bridge_put(selected_bridge)" improves
readability, though I know drm_bridge_put() checks input parameter bridge
for now.

> 
>> ...
>> pl->bridge.next_bridge = selected_bridge;
> 
> Based on the logic above the drm_bridge_get() is still needed here (both
> with the single if() or the split if()s) because at function exit the
> selected_bridge reference will be put.

Can the refcount dance be simplified a bit by dropping the put at
function exit?  This snippet is what I'd propose if not too scary:

-8<-
	struct drm_bridge *selected_bridge = NULL;
	...

	{
		...

		struct drm_bridge *next_bridge __free(drm_bridge_put) =
			of_drm_find_and_get_bridge(remote);
			if (!next_bridge)
				return -EPROBE_DEFER;

		/*
		 * Select the next bridge with companion PXL2DPI if
		 * present, otherwise default to the first bridge
		 */
		if (!selected_bridge)
			selected_bridge = drm_bridge_get(next_bridge);

		if (of_property_present(remote, "fsl,companion-pxl2dpi")) {
			if (selected_bridge)
				drm_bridge_put(selected_bridge);

			selected_bridge = drm_bridge_get(next_bridge);
		}
	}

	...
	pl->bridge.next_bridge = selected_bridge;
-8<-

> 
> Luca
> 
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com/

-- 
Regards,
Liu Ying

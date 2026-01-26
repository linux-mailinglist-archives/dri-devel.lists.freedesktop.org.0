Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKNrBDMid2lmcgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 09:13:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C99855ED
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 09:13:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65DA310E068;
	Mon, 26 Jan 2026 08:13:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="miKSLd/7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013000.outbound.protection.outlook.com [52.101.72.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79DDD10E068
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 08:13:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KGNZErzd3eemuR9XWYu9tjO0W2ipUH2pFllUEzdogip4Mb5Mq10tUh2WYyxqLOkmJvbG+2h5RcYiVztgdFCs/ItU29QUaccU1y+vGeLQMM8KRa5RplJ7XvtwFhjoxoOxRZ1VY7WrkYag9cBdk/+MoVd9KHaPUCPSgH9uRG3wg6ynJG3V3kXXFM5MR2KnePpcV7IyyEwr3qDHMnwXecuU+PiQkvnZS9O2/HBZsGXcy388ANidNWeIDUOfvrhJtJRhGILmuviEhXfQ+HjAMpyl/lUbFXcYJrMjS0VmYm/DggaW4a5zonqHYrhZxJQeaK+LneWgQx+kcE9iOTr/ch2sGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GKPQp6p15wYoRznPToE69OBre95bqu+lbTLqDz21dDQ=;
 b=L1vzmc9ByLR4u5p5WimcGRJI58JMQ7Q9S1K4AcUDGqUOUYCeONoEq43tLoHRacoyfKrppjQthtF1aNXBMbNdrOUmeofiu/XcKJairLfJ58diJWeEI2cCmtn/Nxr98rJKoA29hQSevbtFuNcvuc1cdZxo+5jv2uMHEftUkZmh4Pl3G+9UkNvH5rEkRDCaPOJT6L1B7am8LLrbMbRQUjAV2qBlPe/9Dx51+wzuQvp6lKG3nAnVTMabLyeNNJsCi59EeEhqv5yfVFMsvLupJ7uxJJW2skbvbHXuyjFGw+rI7xq1Jr8nzp6tNuVhlYLoWg03tyewU+VUsZAE0fOyNaEoeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKPQp6p15wYoRznPToE69OBre95bqu+lbTLqDz21dDQ=;
 b=miKSLd/7BplJJGcQteEMnefRbB7bU6kbu6yGAnUUDfcYxMk4t7fO3wGQGj8qC74eroK6FKfNEZ1dWkoYRKpjbpnlLffJUFUaur4Fyz81Bk8RzV3gOgbMc5X/1snw0L84xFaJ/GS5jq7eLg9DOznOSDYRomAQvP4KLNbQ5sFn5iy6nOEUgnDWFmDb2fWE72o/COiLDXywLjkpT02Z2KnZ+Tq8i9QrtfgbcaQgLdDbpz3fidQ1e1Vl5P3Z7HVZ20o1J+G9dNsEOdhvDviY6A4uuMp3nsTs7gMPe2ZuC6HlgoBZCGPJhPk9ZqpxdqYUnXJ3mKB0ft+olcjR+8DhoAm7fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU2PR04MB8902.eurprd04.prod.outlook.com (2603:10a6:10:2e1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Mon, 26 Jan
 2026 08:13:32 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 08:13:32 +0000
Message-ID: <516e24d3-511f-4fb5-9274-a20639618d4e@nxp.com>
Date: Mon, 26 Jan 2026 16:14:20 +0800
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
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-4-a62b4399a6bf@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0240.apcprd06.prod.outlook.com
 (2603:1096:4:ac::24) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU2PR04MB8902:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c87ca61-dcca-4f1d-c492-08de5cb2cbaa
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|19092799006|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QlV4R0FXOTRTL3MySjM1OWtxbzVzVnNwMlFwQzlpSFc2Qm4vRHVLNTlIVUJl?=
 =?utf-8?B?MmNGS1F5MG1NeTJtTmhOKzhVQldhdldBNVZmSkcyVGc2MEZIcHY0UlQ5Q2pK?=
 =?utf-8?B?dnZZVVRZWHd3RjNpbXpHNlNpajdYUFY4ZkoyS25DTjNSOUZtTzZ5cm5QT2Iy?=
 =?utf-8?B?bm9lU0xidU9Td0dxR2tubGhVc1UvRzgvcFMraEpwWkRUNEdqRm1NRG85SUdL?=
 =?utf-8?B?US83OGtvMVdOdmZ4YnFTSzl4ejJPNkptMzl1bzVPZWVYcXpSbVZETlBVNzhY?=
 =?utf-8?B?RzdRaEtGNHVNNExVN3RIRDYzcExoWmRoSWxwb24rbmxjQ0VMZWZpSTNBQktY?=
 =?utf-8?B?M1I2WTdxZWxWcmxseGg0Wjc5T0VqM3dFa3I0TVMrZkljNEhVY0lacnB0R3R6?=
 =?utf-8?B?eDkxYnlCMkdTL20vdDRQME9pdTNwdEVOa3BrR1ZQVTM2YStSWHM3aC9sbXJQ?=
 =?utf-8?B?aXZGUzdXNzZwd2Q5MmkxNEVaZzRKRzd2Ym1oNmtDb0ltRDdsbG5FSVFuaWdz?=
 =?utf-8?B?aGpEN1ZCeEwrSTZ3bkJ1eTFMcG1RTnNrSFhZVmszbXVSOUlPNnduM0hiTndS?=
 =?utf-8?B?SUgrTkVWOWg0STdqdmlMVk1KTnBMTFVueGkvV3NEMk5CRDZBSTZ0eEYvSStI?=
 =?utf-8?B?cVJXYmw1RjUrRnR4NyszUFVGWDV6V2NYNk5ncUVkbEVCM0MyRGhaallZQnhM?=
 =?utf-8?B?SUpURG9jRGhCMHBWVDBEK0ViVk5oUVBwZDBqUTREanY2ZXBkWk51dnRsSzNK?=
 =?utf-8?B?Y2FKSmFSRENSZnN0eGZBdmxqNzh1MUFFS1ZEZWJxempreDZNVzM0aVBod25l?=
 =?utf-8?B?VlA0Z3g1V25iK2RYY3pOKzRPWVB4Nzl6YkRCT3JJSTRSWjQ5bDFHQi85NFZp?=
 =?utf-8?B?d3RESXBWeUU4ZnBUeHc1Sk1zaCtBK21CcW1NYlp1VU9tVS8vN0VjVEFDZWRZ?=
 =?utf-8?B?YTZYUGhMRUxCcytIa3hGVi8yT2ZFanFXandxc3hjU3c2RWFMUTF1cDFRQUtw?=
 =?utf-8?B?eUg5ZlphbUcrbHBJeEZTMDVJaXRYWWV2MXlaM3c2SnNIN3pOU0Q3Rmg1WnRk?=
 =?utf-8?B?Rmhqd0Z3MTQ2UXErOWV0VHgvNnBybzU0RTkzcHpDS0UwczJWaWRGbTBkTWtr?=
 =?utf-8?B?RGhXUWVES25PRXJEMER4aDNrTGxrZk1La3U4d2I1TXZZcmJvNFh6SzVuUnZH?=
 =?utf-8?B?VHl5VVNOb0lxVjdHTlpWWG1GdW85MFYxNmZOTGRnV2RkRGhUZ3c5bE9hSFcx?=
 =?utf-8?B?OW01T0xPdEtNTFN1NStCdlJQaGkwckNJdTYySUpRYkVQcEZibGN2S2ZmaFBi?=
 =?utf-8?B?eGVrblRZVUljMTVRTHQxZGxiTlZHSXRDRzZ3N1JqL2tDaThLSlRZWWFOblE5?=
 =?utf-8?B?WlIydjNXR3lqYXkvd0s2SEV3L3Q3ZFI4TVlFd0hybXZDTC80UzBDckZhdzlK?=
 =?utf-8?B?eXk3eHNJRW1OM25qK1EzRGlwYU1Va0pwbXhtS3ZEbU9TT1dLb2ttR29ZR002?=
 =?utf-8?B?aEd0cDlIcGxUWTZwa0w3K3dyQ0JzcTY2RlFRVGFSMHJzSVp2b2ZTWGhSbDdO?=
 =?utf-8?B?VGJLOWtxVExLTU1qcVYyS0tNK3dTQzMrT016MlB5alVQczB4cndneHhZeG1T?=
 =?utf-8?B?NXgyZEs0c3UyV25KRXFLM3NBWlNkcVNHNHRHeFl1V3JReWY5RHJRc2c2UmZZ?=
 =?utf-8?B?TEp6eFEvRjFJZUJXVTdPdkZMRG9USTNDQWxzaHZHV2JtZnNpRDZ1NStRYk9R?=
 =?utf-8?B?QUs0dmUrNllWbUVsUzYzNEVML0I2U2Q2eTZ0eFV4bzhzL2ZjazRoS2I0UEto?=
 =?utf-8?B?SkIzck1paVBpYWVpKzg3cDBMZlR3VmVrb3kvVENDUHc3OHB3Yyt0ems4MDlh?=
 =?utf-8?B?QzYwb0xhM2JrZUtUdExEV01BZjRhS2VubjB1WTlRNHRFMENPTG0vV2d5VlJx?=
 =?utf-8?B?QnhuRUxoYmhQYTdyZUwvOXZ1eURWUVR3L2s2b0NTbEtOR2tMaFM1QVFVR0sw?=
 =?utf-8?B?QmJCR2JPbjJiaGZDYnE0VWQzM0YwQzRRNER6RzZFL1VyeTRqSmxOS2cyWHBx?=
 =?utf-8?B?cE9sYkZROExhSUowUmlQRGZnQ3MrWmJ6K0dCWnM5bzdML2J4ZVN4ejlkZUJY?=
 =?utf-8?B?cWFabXRuN1lDUXluWUhBSDhHZm5JNmlSSEtEeFc2ZVRIeUsrcDR4Tm4wcjRv?=
 =?utf-8?B?bHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SCtFb0o5bjRjMEFtL3RVMUI3aUQrTzJtZU8wVUEvakhKaUF3czVHVkNsWHpz?=
 =?utf-8?B?YURoYVRnUW0yTlIrMVROVTVHajBIL05tWjNJa2hRM3NHV3h2T2FLeGpuNUF5?=
 =?utf-8?B?U2RyN3JCdlhhdytVeW9IVGxRdWRLQkNOWXNSOTFrUVoreW93d0lqbzVTaGNl?=
 =?utf-8?B?dE4wRkZLRFZLZUNVb1l1Z1ZLZkhlTVo3cWhLeU14d2Y3UGErcGJDMWZQemY5?=
 =?utf-8?B?RVJ2TWtqRmZIWVZ0RDNWczF3K3ZIVjVadElJNWpvdGFXUDc2NVQ1Q3lyWVU3?=
 =?utf-8?B?YTZsMTNZdklOdkZpcFNGbzdSbzhDdUxUYjhUR016aHByNjVYWDRWdGJDWFVX?=
 =?utf-8?B?ZVdFTEJOa1c1UHY3VlBLN2ZQcWYzd2xoS2F4N0Z0VzZDR0RzaWhuQkVsL1JY?=
 =?utf-8?B?MFNSQXdUYnc2VzBYNnlHTUxDTlBPWVE2cGdmTzdZRUg3QXVLRTdpbzhyMmNo?=
 =?utf-8?B?Ym9lT0RtNDJpQ1AvR2djZHA2N1kwa08veTFJZWlraG5pRHlNRXF4ZW5TQ0lr?=
 =?utf-8?B?YnhteW12QUNLUU9TSEJUaVhPMFlmS0VFVUYyejNnenY5bEFoOHpFU1pjTUVx?=
 =?utf-8?B?ZTF6RklEaFJ6V1kwQ0VkOUhNb1B1ZmhLWnB1SUExTDRsVzU5eUxVbHVjcTlV?=
 =?utf-8?B?cjgvaDNJZFhGanIxMFJWWW9ydTZtYlNpWmx0VHl3cTk2RHFXU3kydTBXa2NO?=
 =?utf-8?B?TFhybEl1NTg0N2duV0hQeTM0TUVPUi81cEdFQWNmaVpWL2JXdCtkQ1lZc2pL?=
 =?utf-8?B?UWM0cnZMYUkvczIxOU00N0hKWjEzYytzM3ZrN3RrZElLU1cvYWJRc0hXRllx?=
 =?utf-8?B?Yzk0OVBLb2hBSmtxY3kxZlM4OGlva3g1M3h6eTZ4TlU5NTN3TGlTazNBZVo0?=
 =?utf-8?B?OTFOOExQVmsxYkVDNWpuK3lsK3ZyVWNEMnN6MUZ5UUE0c0hwaGFyY2dLaE0y?=
 =?utf-8?B?VytZUWM4b092RTh1YUdmMldJNFV6RjM2SEMveUc3NVVzbGxlOHNTbnBQQ0Ry?=
 =?utf-8?B?Z0FGRDBwR2tmcTJTOFRaVWtsREw1TnErdUlISytFckVjTGtVVFZFTXZITkM3?=
 =?utf-8?B?QzJMNzdHOFc2dTdxRXVNNkhRZTZHR3IzRnJ1cDNCNjNoOXNsbnBEUXNSem1i?=
 =?utf-8?B?amlvdUhWdWw2a3V5R2lPYkdvbW1ZSk9jOHJVV211YlVBeFgyUzRzYWRCZm1G?=
 =?utf-8?B?M3BZYzkwWE91Y2NmbnpXbHE0d0RyK1YwQlFHcWFEbHNZUjdCOGo4d29iSkMw?=
 =?utf-8?B?WDlJVUNEMzJ6L3VZdG03dTFyYnE5Z3htcktESko1MUk1REFzR1JnVVJ6ZG1i?=
 =?utf-8?B?ZzBNTDY4Si9vYUkyaGlNSXNFd2ZsS3hjeEhQNVJFK3VZZERKalZ4WlQ5SUN0?=
 =?utf-8?B?MGR6bmRWY3Fva3dicFBvQUxGekNnQ3ZmdFFqaDJZNDJLUVNOeDlrc1NvNUhZ?=
 =?utf-8?B?QktqYVhIRU5zSVlQUGozUnZNNWVFcXJQejVGT1FHcUxjaHpKMi9XNkNvUmFW?=
 =?utf-8?B?Q1Q2aCsvRmlvYnlvd2lxWEYxRnRDb2xDT0U2TXk5aWNmZ0NpS0srN0VrMEts?=
 =?utf-8?B?KzZsYi9SN3V2SnpFdHlOMUVBcTBMektIeE1CcEI3K2YxSEVBMHltZUtrdHRC?=
 =?utf-8?B?ZTdRd3h2SklHOGJxUnZ2bVFCUkttNG9sQWNFS05GNXlRZVhGcnVoU29wZHZy?=
 =?utf-8?B?VUhtQ3ZVNkZodmlZMk9Cc1YwQ29SbGhGSFRHaWFDM0h0MWd3bmdJcUFHbXFh?=
 =?utf-8?B?V3I5aGZndy8wWk0rZWJ3dEFKODJIMmwxeFpoUlEwWUlRZ3NlUUhlMFc5aG1x?=
 =?utf-8?B?dUdkditFemtOdVB6UjRsZUVlZXFTZEx2OWU1R0FRdWdSZE50cGwrK0tZRmh2?=
 =?utf-8?B?SS9vTGo3WE1ERlp3cU5OVGRjNVp2aTJaUW9lS0lCZFE3SXJEL05TcXRraXBW?=
 =?utf-8?B?WXNRWmJWdmN6MHdVT25OMG0yWTRxdWxNV2dkRkEvM09RLy83RFA4dFJPZ1hP?=
 =?utf-8?B?eGhDSnc0bThibHIzSDVpWFJjSTVZemFRM1dFUHVza1ZDWTFYeCt1Zm11OTRx?=
 =?utf-8?B?OHllR3RJNThXdjlzRTNLR1BFUjYzQ3oyR3V4Mys1Y2F0Um5KODhNdm5mY3JN?=
 =?utf-8?B?SlF6NHh5SHZjUU1BMCs0N1l6amgzREJKYUVmRTBMM1Ztem9oSlZnN2VjS0Zy?=
 =?utf-8?B?QlozcWtKVmxiM1d0MTBzSi9qb3VWd1l5NzlUWEdQRVlSbXNWSkZPYW95MUFW?=
 =?utf-8?B?Qllid2xDMlMzMXBjTzJLR3FpeXYxOS9jdUJjUk1ySUZBOFFiSGFLL3Jxd3Js?=
 =?utf-8?B?a1lWaFo5MHhlMVk1MGs5NDNGN0JjZVM4cUJlZ01HNGxsNmMrZXFDQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c87ca61-dcca-4f1d-c492-08de5cb2cbaa
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 08:13:32.6623 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EwbHEjvc6D6RbLX7Hlz6a5pWJj9vTWqIAyeXcRnvIzTIrEW3r18ms8johf8kxpULJHpfhIcl/QNARgMh0piHiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8902
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
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:luca.ceresoli@bootlin.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:Hui.Pu@gehealthcare.com,m:thomas.petazzoni@bootlin.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[victor.liu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_TO(0.00)[bootlin.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[victor.liu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 62C99855ED
X-Rspamd-Action: no action



On Wed, Jan 07, 2026 at 10:56:29AM +0100, Luca Ceresoli wrote:

[...]

>  * the bridge returned of_drm_get_bridge() is stored in the local temporary

There is no of_drm_get_bridge() defined, so
s/of_drm_get_bridge/of_drm_find_and_get_bridge/ ?

-- 
Regards,
Liu Ying

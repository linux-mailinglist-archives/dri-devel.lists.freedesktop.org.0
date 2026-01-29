Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFhdHq4Xe2lCBQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 09:17:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE2FAD623
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 09:17:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4471110E328;
	Thu, 29 Jan 2026 08:17:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="YvCCb931";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013011.outbound.protection.outlook.com [52.101.72.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF2910E261
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 08:17:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=khRvwL4XlZiQUtDt7tU/6AFdwV+6MMb2RPGKnJZXQ+WFX9F2UhEIHQiR5wFLxLt20a0hzFJeywKl6CVsWj14eVsy5x5OrOBKAsN4FAOV9hqbNQz3IK3LaRA/0BpNOQPvsdAFMbbgZKOAKc1f9sOvpOgbf+xZEAYM7A6eGoks7dAj/svaz+q73L8glP+v3pO4u3uIADMl9y/CwC3fMEROMrLEZ5jHYcVuuMf2bdKUTCFnNs7E38+6YoGqMGBSUXUkNXVF9fkqLD+RC1sKkFlGS5a+xmm6425CcJfoX22zZoa3Wjli1oXewVcE2R7F6fXo6tF8fw20vuj5m7VG4CUBNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UqQOPGvdpY3l6BeCWA62Ap34qnXLD9NPD/nFIvLHwkM=;
 b=QyDrVPuOSLR+iUTLpDJJQ+vurHru+GTHZLFbju0805ZLbecacjFngxpv4zas/+SENs3CSuElH9RX/Ph3eezcEvIWQwMMdC14peSp0yJXCw7yUXyS95/qx6PbufLVEw19AQ0ySM4bLWQL7P2v3yf+qQtkyl0StDRzlzq7cctgbTEzR4cSJ/kauLpe9A3fox55GItvoRvtVrrgtTpW1ODb8ekAXC303NmBXv4loczUapj0YUBFObZICrBJ5mFyiqGO7zFlZoMdspzGIAvkAIRkodRJO8QktotMw5TDC3yFEU+VWNmik71lOCSIc6T8NI51ikA1dLcUYgeq9fc/jC0cCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UqQOPGvdpY3l6BeCWA62Ap34qnXLD9NPD/nFIvLHwkM=;
 b=YvCCb931LOLDvbxmlQjSOujAH9o4MfoItRWIrfImBiyMIhO1pmzl1oh8YqOnNvrHP1xrsLisqef7z2NpUXEdQ9M7bE0vA6/deMcEkUYXyeS0pH4rWoB7e6wR//FfXNAtqz/PjV9v7dKId9rt1E8zqLQmVLnHEBr7pt8WNyiuvA4aWl0KQwgu+oz045jsTEw94dSN3UH7d4SzT+3DdpppDzNo5DL0ht3uCLaZeF5IvqoclYRwtqCfm8qZQBpnQ37IZ3b2U9b6KMSBGaXMsg84/JVyVlm8luNtz3j693vjGWy1gV7PJGvxFfbTW949odmDvytRbB6Y2VfLsrmV7RgwQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV2PR04MB11681.eurprd04.prod.outlook.com (2603:10a6:150:2a7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 08:17:42 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9542.015; Thu, 29 Jan 2026
 08:17:42 +0000
Message-ID: <aff6f95e-abdc-4253-8724-eec4a98bb268@nxp.com>
Date: Thu, 29 Jan 2026 16:18:32 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] drm/bridge: imx8qxp-pixel-link: get/put the next
 bridge
From: Liu Ying <victor.liu@nxp.com>
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
 <efeb3583-dd0c-4e91-bbfc-54b04644f2c2@nxp.com>
 <DG0CHD0TAH9A.27UW4KKY2O9V7@bootlin.com>
 <d0836d04-d15d-45de-a765-bacad9e7759a@nxp.com>
Content-Language: en-US
In-Reply-To: <d0836d04-d15d-45de-a765-bacad9e7759a@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0024.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV2PR04MB11681:EE_
X-MS-Office365-Filtering-Correlation-Id: 45853d47-c724-47d6-8b6c-08de5f0edfc8
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|19092799006|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OEwyMTFkY09sbXNzQkdYK1JxRFlIWTR4aUtLSjRxN1RmSUYweUxveGdObnlt?=
 =?utf-8?B?TzhKRGlTM3BjWENNQ3lWK3Y4L2R3U0tEaW1CRGFnREpLVFlTWkZpaTgreHJr?=
 =?utf-8?B?SEtGMmJzV3I4UHczTDF2c1M5cU41bXd6dUtadFZWSU0weUFrSVB4UFl2K0lq?=
 =?utf-8?B?aUZ2d3VJYk1qenUrUWpubSs5U2djT0czVjZPZlBiazVEZUxNbE1WZFFnUkhz?=
 =?utf-8?B?dWhCUmJoczVzdzVDT3hhbEZUOGs5cndHN3FHWTFZVlV0MUs2dUIyZG1PN2VP?=
 =?utf-8?B?UWNBS3FLckFxaFcwb3VQNUpWS3h6QkZTOVhNQUdxMkZTK2dHZmhNWkVXaFZW?=
 =?utf-8?B?eTBYdS81M1ZnK3A0dFcyRld4NHVsWGxobHNrVEJtbkh1UUdZdERQVS9DVENh?=
 =?utf-8?B?YUpPeDBBcjVHanoyc1loWWtHdk14dk83UjIwalMzVEdSdFdmUFlqaDFOb2dm?=
 =?utf-8?B?dmovRzFITDUvbzRxL0sydGZaWEZRYkdlZjNPOElSWkdjbnRFdzZnb3B5ZzZ0?=
 =?utf-8?B?WlR4d3hPeGtIZWxCaUNYQkdLM2RSVFpxaTFZVElMUzJwLzJIRGNqMFo4a0Zn?=
 =?utf-8?B?eXI4SmxOblBqcGhHRWVvMlNZSW5HQ1FKakJOdEtCb1dVNGp3dFZqUHRtNGhJ?=
 =?utf-8?B?cFFpbEdyb0N2b29FL0xtMVRDOW9LcE5jK3dRa0o5ZHVzMFgzSW5DZUtjSDUy?=
 =?utf-8?B?NGNkZjJjRXdlWUpPVDkzRHpyVW5FUllRemptSWVRdG95K0Z1RGRhbFBMdWVX?=
 =?utf-8?B?QzdFUHVoV1lmK2Fncm1BNXRYMFgydEt1Y3lLVkJLMGNPbHVSY1VVcGxmVlBj?=
 =?utf-8?B?ZmhKeUIrbkdUVDE2eWk5M0JoOVB3NEQ2ODlyYmk0eXZ5TUsraExQdmptVHVr?=
 =?utf-8?B?bnFJN2lMUUJqdmxaZmphdTl2eklFaTEwY1E4LzBOaDVoZVQxOERJVHB5NktI?=
 =?utf-8?B?YzlTWjQrb0s2RDdwbEpuT0w2RDZpN0tJRVRuaHlUVXprdHNuNWNFVFBOYTBG?=
 =?utf-8?B?UmV2ZFZkVzdwOU1lZ0MvMDZKWVluS2h2a1VONFJJUWxtYUxidlc5WFpTaGJu?=
 =?utf-8?B?OGpEYmRmSGVLMk9SOGxBSXlMd2lJUmRiSEw4TnJIWHNpcExHR3lsOEQxZTZ3?=
 =?utf-8?B?dnR5VG1CNUF5OUpzZWJOdUltaEx0d1lIVTJmY20ya09KdHhPZG96c0ZBOFlj?=
 =?utf-8?B?UEJId0xmNG9HcDlHQ0g4bzVLcVlBZXlPM2lBYmJOU0NCRmJpQUVCZllFWlgr?=
 =?utf-8?B?TWZVQWN1M2MyVnFzR3oyQVlOOHFDSVp1T3dtbk9iVWo0UTl4NkRPRVVTTkZF?=
 =?utf-8?B?MC9uVU5zc0FXNnpuakJRUEJ3eStHZW9yR0VpVnVNNHJXajNIcmRvV0RpRWsz?=
 =?utf-8?B?TkJiRHlZVE5RMkRQa1hBRy9HdmVxZ0NoRHBWeVpscXBzR1lHYlV3Qy96bEl3?=
 =?utf-8?B?dmczblJ4MkpPK0ozN0hnejRvcGdaVlBYMEhSOG14VGtHNnVjYUFQckNyWkFM?=
 =?utf-8?B?clB6MSt3cTdCcjhHWHB5Z0MvaGdXMVBjZTR2MklrTk1RL3JnTzJjVW0rTEZN?=
 =?utf-8?B?ZzMzbHltdEo4dmJHdjREek1mMHlvUHhWMnliT2NoV0FmcXdhd2UrYnBDZ0Vh?=
 =?utf-8?B?ZGYvTkVRTm9OeG40RjNsc3NDY1F1U0orekNsZDRZU3NFaTlTSE1qR0ptNmk3?=
 =?utf-8?B?a0RYaU1XWGJIVVhMUnlWbGZ2alEyUGl1QlFHNnFlYWV1bjR2ekVEMDRndmJh?=
 =?utf-8?B?UTRmSkZSVzZhdEEwN1ZUVUlNdjQ0ZGJYYUVhQXU3c3NqTlFjeTF5SWRWcjBi?=
 =?utf-8?B?WXNBdlRNcDBrRHA0TlRvbTcrNmliL205RjdHRnZFRDZDWUVseEh0TDRVa1RS?=
 =?utf-8?B?dWltN0FMckZ6RlAwd3h0TkNZeWxTN254dTE1ZGFOeWZNVExNRDZTRGNBaHlL?=
 =?utf-8?B?TmZEYU8yWTgvbU9YdkVwN2VwcUxyY09XT2lQSFpHV25iV3p2L0ZkQ0N1N2pw?=
 =?utf-8?B?SUY5ZjJZekdxellkR3lhMkVtZXdvK1BsaFFidDJvelRnWFo4aXRCNGYvSE1H?=
 =?utf-8?B?VkZsa2owQkFPaW5saDRSekdaUk9MRTZ0RWhZNlAwTnRnYzF5Q05tem80R0pj?=
 =?utf-8?B?Z2JYbjMyZUo2RnVBR1JScTd5c1FYZk5yZitWTm4rbEgxazcwL0h5Y0RFK0lt?=
 =?utf-8?B?SFE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(19092799006)(7416014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFMwRWloclNmWHc3a1NJYVpLVlNleTM1YUwwYjNWV0pac1FEMlFYR1RCSHR3?=
 =?utf-8?B?ZXBPekMyV2VQN1VjZWw2SmRDWlp5YmF5cE4rczM1OFp0ZGNURlBnZVVzL2h3?=
 =?utf-8?B?TG9pQzhpakVwU016N2p3ellXRFVqV2VndUtoUGVCcEpQcU9MSkFKbUE1NkJW?=
 =?utf-8?B?QUlxemw0UmFMNGJ0QXN6dHA4UG1EMExXcDkvU3hOamVwKzNxNVQvVFJBRUdy?=
 =?utf-8?B?am93T2FiOGQ0TWM2dnh0dnl1RkQ4RDhPZXRYRE9DMGtZa0x3L3F3MTF2djlI?=
 =?utf-8?B?V2lkTDlwWmNIREJoUHlNVUlUTlNZY0VwR0dIUm8wU09LT3lqYnRoRUxINVdp?=
 =?utf-8?B?Tkl0SXV2Ym91NXlFWWYxMGJiNjhtZlRxUmtUTVNuWURSVzBBbThrVXFnWnFq?=
 =?utf-8?B?Unpkb2xSY3FSS3hQQW00VmovSUkrcTRQOUJCRkNYdUJzMk52eDNJNytuUGFS?=
 =?utf-8?B?anlMbnAxcTN5Q0hHZlRTc2ZjQUl0RnAvY05VN25YRFVvQnNlczJZay9uaXpY?=
 =?utf-8?B?ZDZPa1RVZ1U5cTR0T2tSWDNxQ1hLamNiUFVTem8wY3Frc1NPZjVlSVlOM2hJ?=
 =?utf-8?B?T3Z6R1VZN1JoQ2hnd1ZJM0txNkRKb3hFYkZCVmxjYURYUERscU9kcVBRQTFE?=
 =?utf-8?B?Z1B0Kzl2NlkxSEdyUHJ6SnptbXFuYnJEV2FuemJDd3NjRHQ5ZDkrQVpHSmxx?=
 =?utf-8?B?MmxrMXhYaVdDa1dvcVJWODB6WTJkbzh4OExVRy9wZGRZaDcxWXhLZ2VGZDlG?=
 =?utf-8?B?NEtJSS95SG1mVG4rOUcxL0MxWWMzWXFsWmV2bGdTYjdKWFNiOUI4cXYzRWJL?=
 =?utf-8?B?UE1xbTVTREsrVDM3QkdDcTdTbEsvazR4N3RLcUo5VGhyOW5RUHliSjh2aHN6?=
 =?utf-8?B?NmRJazF3TFNQTVpCTklIZlh1OFVJVkJaTTR3dVZ1WFVScmxDMVJGdlNBT3Uz?=
 =?utf-8?B?MnRoN2FJMllpcTBrekp1REFmd1pyN1JFVmVhNk9meVhmZXM1TUVKVGhSMTEw?=
 =?utf-8?B?K09lWFZVR2xPWG5QVzk5Zmt4Zjl3VERweDBqSkxHa0RheFBTUkdEc2NleFc1?=
 =?utf-8?B?UGg5MzN4UERhaUJFVXBQQnZmOGlHQUJQUUxsYmZyeWZjTlI2UjllOTFKRHM5?=
 =?utf-8?B?ZHkxeGcxWkVRQUsrYjMzT2o3N3FwclBWb2RyQnU4VktTTStTSEE3YnhXU3BU?=
 =?utf-8?B?RDR2QWU3dnUvYnd5T2ZHeFlmQit5NWpMK3hQNjdtKy8vVU5oeHFCZlhORFJt?=
 =?utf-8?B?K0VqbDVwRWprMHFKYmlJaDZGRkRYWDhRRlJEemJnaXhjSWR3MFJrdzZmZEhG?=
 =?utf-8?B?bll5dWFnR2VkY2lTRU1FbVZTZ2gydkloYjFGcWRYc0JiYmpON0gzcmgxUXNq?=
 =?utf-8?B?Y0U4a0l5V0xidjFUc3pldlBzdTJ2ZVBhMnZzQWVOcFh4R2N2SWo2d25JWith?=
 =?utf-8?B?WHE3dkswM0hTRldmOVpGTzIvcHpYQzcwR085NEUyYjlXSEtMcmt1TVhIVktJ?=
 =?utf-8?B?SnNyYmJDckpWV0c3enRMR3Q0aUhhQ3A4S1dzY2swMlJrZWFTTmI5a1BteHdY?=
 =?utf-8?B?a3E0dzhvSGc0K2RBTDl1OW4rWEU3V3JTaXNvWlUwUXZRdWRNYnVKaHM5N3ZX?=
 =?utf-8?B?eXZIbU9oaFZXa2V1WERLczZLWWFZV0NpaHBDODlWbU01bWZCMzFESzFsdGtt?=
 =?utf-8?B?NjZwYnRzSVdmOEduTkI5WEVLV3hRSnVWd2pwc3FsTGlpZVhpSVRsVUd5aGFv?=
 =?utf-8?B?UDFZcFhJbEZuVklWU3EzVW1hemtxZWpZZHpiMVI4dkZqaERKeDA0bTRMS3I3?=
 =?utf-8?B?K0loVzJDeVY0dVZ2SlNFbEg1cEhkL2p1K1BSeDYxdTBCSlppSE1hbDhWWkxu?=
 =?utf-8?B?M0NmeDVJOWtyb01IRm13dk5VY1RvUHZjUkpEdmczZTNGeFFoQXFLSTdrUzhR?=
 =?utf-8?B?Q2YwZTRiL2pPSnU3c0IyU0V3a1VkbldVZlUrdFVqU2pjbnFydTNnVlpzelJC?=
 =?utf-8?B?MzFFdytHeDd0QmxZVzBObUJTU1JjTHZxRENudnZBcHA2ekw2cEg1eGxOQ1ly?=
 =?utf-8?B?YkJuMndYK0lnRFRhSVJDbzIxMUpVSkVpS3pvdTlPdSt6Y0hEMXNJNDNZaXhm?=
 =?utf-8?B?WVVrTU1tbGRZU3JFR0NFNU0wM3J3YWpBdVVaYURyR2cwUmsvcUxUa1ZhM1JI?=
 =?utf-8?B?aytKZTFqZG5HQzlrbGNXUTdIU29uN3A4QitIR2dvOXUrb2FHWkJ0QlBEWGl5?=
 =?utf-8?B?c2xVRzkwQTBFMllRamZ3NXZJSThCYndKWmF4YU1xeWdyRXFzK1ZqK1llQ0FS?=
 =?utf-8?B?WWVtVVc3cW4yQzdhNDRTQVl2MHk2WnRuZlNma1E4bkJzT1FQamVqUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45853d47-c724-47d6-8b6c-08de5f0edfc8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 08:17:42.3657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DhmwDTOxutj0Xem6iTUZW8dkGyVjhGxu+RoKF4ZBRs+0VSh9ftXKF4MJrFZrkwZcLFcqUqvL2969BPEtkGfcnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11681
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: DBE2FAD623
X-Rspamd-Action: no action



On Thu, Jan 29, 2026 at 03:49:38PM +0800, Liu Ying wrote:
> 
> 
> On Wed, Jan 28, 2026 at 04:58:18PM +0100, Luca Ceresoli wrote:
>> On Tue Jan 27, 2026 at 4:54 AM CET, Liu Ying wrote:
>>
>> ...
>>
>>>>>> @@ -260,7 +259,7 @@ static int imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
>>>>>>  {
>>>>>>  	struct device_node *np = pl->dev->of_node;
>>>>>>  	struct device_node *port;
>>>>>> -	struct drm_bridge *selected_bridge = NULL;
>>>>>> +	struct drm_bridge *selected_bridge __free(drm_bridge_put) = NULL;
>>>>>>  	u32 port_id;
>>>>>>  	bool found_port = false;
>>>>>>  	int reg;
>>>>>> @@ -297,7 +296,8 @@ static int imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
>>>>>>  			continue;
>>>>>>  		}
>>>>>>
>>>>>> -		struct drm_bridge *next_bridge = of_drm_find_bridge(remote);
>>>>>> +		struct drm_bridge *next_bridge __free(drm_bridge_put) =
>>>>>> +			of_drm_find_and_get_bridge(remote);
>>>>>>  		if (!next_bridge)
>>>>>>  			return -EPROBE_DEFER;
>>>>>>
>>>>>> @@ -305,12 +305,14 @@ static int imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
>>>>>>  		 * Select the next bridge with companion PXL2DPI if
>>>>>>  		 * present, otherwise default to the first bridge
>>>>>>  		 */
>>>>>> -		if (!selected_bridge || of_property_present(remote, "fsl,companion-pxl2dpi"))
>>>>>> -			selected_bridge = next_bridge;
>>>>>> +		if (!selected_bridge || of_property_present(remote, "fsl,companion-pxl2dpi")) {
>>>>>> +			drm_bridge_put(selected_bridge);
>>>>>> +			selected_bridge = drm_bridge_get(next_bridge);
>>>>>
>>>>> Considering selecting the first bridge without the companion pxl2dpi,
>>>>> there would be a superfluous refcount for the selected bridge:
>>>>>
>>>>> 1) of_drm_find_and_get_bridge: refcount = 1
>>>>> 2) drm_bridge_put: noop, since selected_bridge is NULL, refcount = 1
>>>>> 3) drm_bridge_get: refcount = 2
>>>>> 4) drm_bridge_put(__free): refcount = 1
>>>>> 5) drm_bridge_get: for the pl->bridge.next_bridge, refcount = 2
>>>>
>>>> Here you are missing one put. There are two drm_bridge_put(__free), one for
>>>> next_bridge and one for selected_bridge. So your list should rather be:
>>>>
>>>> 1) next_bridge = of_drm_find_and_get_bridge: refcount = 1
>>>> 2) drm_bridge_put(selected_bridge): noop, since selected_bridge is NULL, refcount = 1
>>>> 3) selected_bridge = drm_bridge_get: refcount = 2
>>>> 4) drm_bridge_put(next_bridge) [__free at loop scope end]: refcount = 1
>>>> 5) pl->bridge.next_bridge = drm_bridge_get(), refcount = 2
>>>> 6) drm_bridge_put(selected_bridge) [__free at function scope end]: refcount = 1
>>>
>>> Ah, right, I did miss this last put because selected_bridge is declared with
>>> __free a bit far away from the loop at the very beginning of
>>> imx8qxp_pixel_link_find_next_bridge() - that's my problem I guess, but I'm
>>> not even sure if I'll fall into this same pitfall again after a while, which
>>> makes the driver difficult to maintain.
>>>
>>> Also, it seems that the refcount dance(back and forth bewteen 1 and 2) is not
>>> something straightforward for driver readers to follow.
>>
>> I thing the whole logic becomes straightforward if you think it this way:
>>
>>  * when a pointer is assigned = a new reference starts existing -> refcount++
>>  * when a pointer is cleared/overwritten or goes out of scope = a reference
>>    stops existing -> refcount--
>>
>> In short: one pointer, one reference, one refcount.
>>
>> If you re-read the patch with this in mind, does it become clearer?
> 
> Thanks for more explaination, maybe it becomes a bit clearer, I'm not sure:/
> 
> Anyway, to simplify things with another try, I came up with the below
> snippet in that loop, which drops the two intermediate bridges(local
> next_bridge and selected_bridge) and uses pl->next_bridge only.

Fix a typo:
s/pl->next_bridge/pl->bridge.next_bridge/

> It looks ok to me(at least, refcount dance is much simpler).
> 
> -8<-
> if (!pl->next_bridge || of_property_present(remote, "fsl,companion-pxl2dpi")) {
>         drm_bridge_put(pl->next_bridge);
>         pl->next_bridge = of_drm_find_and_get_bridge(remote);
>         if (!pl->next_bridge)
>                 return -EPROBE_DEFER;
> }
> -8<-

-8<-
if (!pl->bridge.next_bridge || of_property_present(remote, "fsl,companion-pxl2dpi")) {
        drm_bridge_put(pl->bridge.next_bridge);
        pl->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
        if (!pl->bridge.next_bridge)
                return -EPROBE_DEFER;
}
-8<-

> 
> What do you think?
> 

-- 
Regards,
Liu Ying

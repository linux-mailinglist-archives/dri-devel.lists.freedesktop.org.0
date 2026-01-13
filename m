Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85220D173C1
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 09:16:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA5210E465;
	Tue, 13 Jan 2026 08:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="UxfOpXIM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013012.outbound.protection.outlook.com
 [52.101.83.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBDD510E2B4
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 08:16:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HoJ0JnLum1TbSCl4Nsbx0eTp2kFuwj93Sb5x6qYo06QSf1xHjA967tN5aa8N3gyeaV4HQ56mW1NGlF6QYHAg/TGvYIFTWS4s8XLyZXz6HtHq1rlrtjYRyvbl4+N30wYzfMzu3+c7Qz3ObSt6gyzVmuWbnb3tLGLo3GzqDBjiN7QWCa/7ZakcGhKGWwR+xvj7gbRlL3e9WrutBKI/jhuHBHnizamvWRAtcLpY2hp5dzoCX59kRXKXOmpbkl/zd7NaVqhjQQplK3vPR8P9W3AAGQAA86bxhEr85fBCHIRLHVqAMgRfP1vIPXFgoBKLXTZ5Ogcs4gZ8Zs/IJ7wvM0lykw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2Tzb9oO2ZFXSFNJBKacscVkIn8W/r6oLEHp7d4mfqk=;
 b=IkaHAc2Zt8bJX9FA/zeQ4KSX9TjJnXZeXX+qFYY0K0WwhA4V12xj01ZTHu3Xhh+TGIp9aSPsCuL1ZjmhgS4S1aOBqk8fYRjPXSci9k2glSiXVS6k5+qZLWNb+ttueG7r1ZbBa+EXY835qNfU5TOXqwcVUEZQm6tEWYOfoUdHO/0woDBabsLvfbH71qS0oUEk4i1Y+spz7JMNswSt7LPita93iAaakGwm1fpC8q83JMz+OTPrTSN0mYshBO8uNrhb79I8pZkhI5eXBriznpSuBfEpYt62cB6BlT2kTL2nmeiWq8/IfxiLKqeANJXgJWzesID1TqTJpEmVibJwARGBVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2Tzb9oO2ZFXSFNJBKacscVkIn8W/r6oLEHp7d4mfqk=;
 b=UxfOpXIMNMlvnxPGdClK5O97BcjwjRqA61oLkh2uKLMr7/Y5X7TmFCMfVgPXbTdRBPfbVtR/3eO5MPjXP0BqrUafDKTmCh1Kk+g6WFvqGcFqa7MG2cI5fowoJQdWquaU6EUXG+zu+aDH7hy4RgKPiq+LTVczTDhM3vlE4c0O30dUDttgoSK1s++vSDb3AhLgRJ7hySVmZ2mW9S87Gur2adNWUJ1TbMSCagCaW/fjggx/edemzd8wGc514C09jrPTOvC0rVvAnUUP55XYqOKiTRWcxCBdDijTTgjSPg3bptdD+KLUnuqDNB1gMjb+9G/P9L/L2zjfG5gmDVygL1AgvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from MRWPR04MB12117.eurprd04.prod.outlook.com (2603:10a6:501:97::14)
 by GV1PR04MB9515.eurprd04.prod.outlook.com (2603:10a6:150:24::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 08:16:08 +0000
Received: from MRWPR04MB12117.eurprd04.prod.outlook.com
 ([fe80::9a10:5b39:708:7f43]) by MRWPR04MB12117.eurprd04.prod.outlook.com
 ([fe80::9a10:5b39:708:7f43%6]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 08:16:08 +0000
Message-ID: <409cdcf0-af9b-4084-845f-d863ad6303c5@nxp.com>
Date: Tue, 13 Jan 2026 16:15:57 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] [PATCH 2/2] drm/bridge: waveshare-dsi: Add support for 1..4
 DSI data lanes
To: Marek Vasut <marek.vasut@mailbox.org>, dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260112234834.226128-1-marek.vasut+renesas@mailbox.org>
 <20260112234834.226128-2-marek.vasut+renesas@mailbox.org>
 <773b6e43-4f86-4b11-8e6b-a9f2561a75de@nxp.com>
 <65ccfeb6-4962-4964-be1d-cfb0ed41773e@mailbox.org>
Content-Language: en-US
From: Joseph Guo <qijian.guo@nxp.com>
In-Reply-To: <65ccfeb6-4962-4964-be1d-cfb0ed41773e@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::18) To MRWPR04MB12117.eurprd04.prod.outlook.com
 (2603:10a6:501:97::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12117:EE_|GV1PR04MB9515:EE_
X-MS-Office365-Filtering-Correlation-Id: 9556bbb5-b4a5-4e46-fd55-08de527c010b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|19092799006|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TEMrRTAyaDRFdEl0a1ZyRUZUMzU1V2RoK0dUdXI0SkFRdGluMEFmWlBWUE01?=
 =?utf-8?B?cjVFUHpobHhDVnEvUWgvZCtaZUZSTmRNZEs2RjdXWTNaeS9SUkErRkVxK0dN?=
 =?utf-8?B?aXJaNW1JU1phWWZmVnlOR3V0TERBL05RNXZLaWxjd0xxVnAyY0xIbzJWSS9D?=
 =?utf-8?B?NURkZFV0OXlEVEsyVm55SmdLSmF4Q2REdmk0RGlKakU5N1RXZjFVQnowdGdv?=
 =?utf-8?B?ekhnMnl0MVhwK3lRYlhZaXFmeG5nUEhGQklQc3lzQmlQMGZPemxHWnJLcUpv?=
 =?utf-8?B?RG5yUFp1VmhJOWg5QUE1ejN3cm4wSFJUTzRGL2RmYUR1UmNweUsxdXI2YXVm?=
 =?utf-8?B?cGxoNm9VUm0yUUxqa0l3bTVJOTFyQXh0ckhsS1NGVWpMMWxwNnhLL01GeGgv?=
 =?utf-8?B?bi9mZmNjc09OVWQ3Z2lEWVdOSmFLZSs3aXdLZGFTQjVRWVc1RWRtLzU5U0h1?=
 =?utf-8?B?VUxGS0luRUxCbG5UdG9SQlRndEdmbEZuQ2dDWDE5Tm40ekJsWTRMeXdjSDhV?=
 =?utf-8?B?NCt1OUhNNld1dXQ3bXhLa01Ia0k5U0taaXNieG01dDAydDViczBGSXdpV2N0?=
 =?utf-8?B?aGJrdXBNK3FwSVcrTVI3TU02ZkdMVXZJTUcvZzdrelkvWSsyb1hGQ2xqM3cx?=
 =?utf-8?B?aEhZQmc0cE96UmxIRlZ0bDlmSVova0t0VzJseERWdjNocVZIM2tBVk1ESUFo?=
 =?utf-8?B?cUNYODFuZUFKY09FZDhIdHp4WGdIYWFrZU1yZHhvSkRqZnZHSThXYXg2NWZt?=
 =?utf-8?B?WTZlcUpERCtNNU9nTHdibllWQkQzaW12RlVjZExTSnVzQ3IvanMrcHhpbllL?=
 =?utf-8?B?bi9QUVNpK2lrYWFpMGQyRVI0RFYxcHZFaWVGNmU1czk5UnR3Q09ZaWx2R2t4?=
 =?utf-8?B?WkxBRE9pOFVCQ1dFTytjOEhaTW1RVUtiNEkwbGpSUzdZZGNMbnNycGN5elU5?=
 =?utf-8?B?RGt0T3k0UmZLWFFRQUxmaEpPUkw3bzMrRnEybGdwdkhOWHVNYTUxenBMbUhZ?=
 =?utf-8?B?M2JNdlk5cnVXczY0K2wwL3FNZlphVWlSSE85MnU5OCtaODhORGVYR1hsTkhl?=
 =?utf-8?B?UkRXTTR2Qmlzd3piemlrZnZ1ZnE2Tmp6amcxL0pDK25TYTVRYUFLa1AyUVly?=
 =?utf-8?B?dW93Vk5haXVXTW5YbUkzTHdXRjJ1dG10Z2ZiODJYbmkrc0kxK2VidTdLT2Qr?=
 =?utf-8?B?Z01QYVJadkNvWUZ2eGFtRS93TnhGL1U5Qk5uYXRNRElaNGxvU3dBTEllMWly?=
 =?utf-8?B?WGhCclBtKy9nK3FKTForZGFPbXVsTXZoci91N1BBVjN6MWsxZ1pWQWEzYjFo?=
 =?utf-8?B?cTE4bTFGSExGTVYyVkdYNy9XbTRsV2thZFJUcStlY21xVEFHTU5zMFlyYVNz?=
 =?utf-8?B?SHJhL3ZoeUUza2NBSFZ3T2tZODgrQ0tJZ2ZJM1UyUmd0ZjlqL3BjdHBpMU14?=
 =?utf-8?B?bEg4dlJBNTlTNUptUVJUYnNmeWx4SG52aDQzV1g5aUhJSzhoWVVMc0FUQTg2?=
 =?utf-8?B?R0pzVVhkNGFWSmc0Z2JBK0FrUFYwMlhKVUlIbnlwRlZvYkF1RVVvTnVnMEVZ?=
 =?utf-8?B?TFFZQUc1OGRnQ2xBdFp5Q3FLemM3Zi90S2VzZHo1dlBLZ1ZvQXVBRG40UlU0?=
 =?utf-8?B?ODlQOTJydjRvUGwwSDZTOUJBUUJBSWVUd25tZGdCSEpVMktSUm9Hc256d1hu?=
 =?utf-8?B?aXhCSXNPTWg4bTZWUWpkMTVyaERYRStvN0tCTGFQZG9PWWd5YndaS092cXU3?=
 =?utf-8?B?Rm8wTkpESFpyWmVqSHNwT0pNcngxZkFQWHV5azIzZm44VlZPTm15SlBEeFpl?=
 =?utf-8?B?ZExucDJmdUVDTHdFdmgydDdjN2pSKzZ1MWw4aVF6RGh5MkFZc0xpTDhURHN2?=
 =?utf-8?B?RDlkWUJFUUppbk1SS3FKQVFQc2NabFVibytsQm95enJDSzhMVWRUTXl5Ry83?=
 =?utf-8?Q?pVG0XMnjnJ7nWIHsfqNkXTwVk7ZWaXfZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRWPR04MB12117.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(19092799006)(7053199007)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UG1iczBHZ3RGRGdGelNFcCtIZDI0VlA0eExOYXRrbVY5Q2NHUDQzTkVGclZa?=
 =?utf-8?B?R3M5eVJXVkVxSmVqOHFnVWRvd05ubGhRb09FbmRUZDN6ZDh0dzdNVFJSQnNB?=
 =?utf-8?B?L0VJSmZxM251OFlNdzV2YndHU1pnc1dGaGZrRWpNcUMzTVFFeDhqcTRsbXBC?=
 =?utf-8?B?QU05eGxaS0FQV1BFWDhiNDJhYVNHUGVvaUlPbU4xYmdJRXpQNC9TTDJqektn?=
 =?utf-8?B?aHRmZDM2OWhjeTcwQ1cvK1g1blBKM2x1VkZIbmk4TVFQTXhWN2ZKelZhN1Ja?=
 =?utf-8?B?US93OXg0MmVQNGVoU3huRUVodHZuSUtpaWNPQmZJVU1sOVRTbGJnQkNLVit0?=
 =?utf-8?B?eENYOE85ajlqdHBpWmZKaTRVUTV4b0NYdVZyT094ZnFLbUd2bHRMV2JTUXJJ?=
 =?utf-8?B?WmdtRmRReW1jeHF5Q2pTeFFuQkQ2UGxDM29SU0I0b2VMTVAwWE8zUS9tLzEw?=
 =?utf-8?B?aFVLclUwS1IvWFg2RkNhZTh0VlhCRWdDWmVCU1o3VWQ1Yk8xSzN0dy9ZRytE?=
 =?utf-8?B?MDZ1ZDFWRlg1ZjFiL1J5NEg3REVodTFZRFhHY3FpRktPL2xMY2RvamtMU2Ny?=
 =?utf-8?B?d1JpbTRPQ1RoOTMxWFcvdGtVQ0plVDlyNnJqdXNZTFF3WEpFbFIrZXY4WWJy?=
 =?utf-8?B?N3J4OEQ1blErUVV2WldnekpHU21tNmg4N3dEbzROallYSUduanhMejNZREtK?=
 =?utf-8?B?ZXRhVWpEcncyVExwVHlyNFVVSTV4NmF0NGh6ZXdwOWsrYmVieElnMWpTL1Jx?=
 =?utf-8?B?VzB4cGFjUjlKYlY3UVNwZkZHTEhZWGZlMjlMRFVzSFZnMzVidEZtcUEzWUx2?=
 =?utf-8?B?WU5ReHF0YTVCV3gxMVMxS3VBOEtmL1NVdDdsKzBvNDNBRVIyZFVKTkFCTFJC?=
 =?utf-8?B?c1hodDJMZnhBbkdFVUpobWRNbU9xUmpnc1FPNm44SzN1UFc3elBQS3YvQXc3?=
 =?utf-8?B?b2VHdlpKSXJPLzVpYWt1Z3ZJd1JmMWRzZkI5eHgxZHNBeUdFd1lETkVLSlJn?=
 =?utf-8?B?cG5Ca2FvUllrUmd3WDdmbGhQaFNBS1FTb2Q4bXpwVWpOdUtrRGFCOXVkMkYz?=
 =?utf-8?B?a0ZWeWZQSVJDeFFnUnVieGI2UCtWTEk3R2VuWG9MeWl3dmpDZW5ReVhoRXBD?=
 =?utf-8?B?MHhINFFnUFluRHNWaVRwd3g5VldTdTZsaXJhQ3JlQU8xL20zb3R1MVVxaVhP?=
 =?utf-8?B?V29LOGRIQXl4bGFrWXJwV2hFQnIwZ1p0cDRqclorWkh3MENvVUFvMzZCQXpm?=
 =?utf-8?B?Zzh4N2JRWjFWaUtFS3d6MUI4T1FKVnh2VXVxV3lKbU1kZE0xYVZmKzcxMkhs?=
 =?utf-8?B?eEI0MW9CRUQ3aEh0QzFPanpkN1Z3MmdFQVpjY3RhMDF3K2pFWmNqZjNTY001?=
 =?utf-8?B?YjhIbnFiR1ZCSVN5K1FJUDBjaW5mdXNRckxXM1MvWk5sTjA4NE9Kd0hPbGow?=
 =?utf-8?B?NnJQTGtGSlZxSDlyVXpvdk9JTGNMYy9XclNXV2R2VUtLbVVlMjZVbkVSNGNJ?=
 =?utf-8?B?d0loV3ZIZHZqb2ZQZlNqd3lWY3pXWVc0WkhHd1ZDczBTcmlNU2FWNVVuWkhy?=
 =?utf-8?B?MnRTRzJ1blgweXkwOGh3R1BsWVhvb09xbFpBTmM2YkdXY05sMGJTUTBiUEhO?=
 =?utf-8?B?Y2lzZTNDSm92eWE1bTVIZm84c0hrdkJydGtWMmVxT29WcHhndzNqRzJqV2E4?=
 =?utf-8?B?dDRhbXU2dnBmN1ZpenU5Vmkyc0ZlZ1NDQlY1WU82aktYakR2M0podUQ0WXlm?=
 =?utf-8?B?anowMVovdnlicVlZT0tLcGR6Mlh1UWNhQU5uaWl4VWhpRFVBSUVnQlV1VnRY?=
 =?utf-8?B?YWc4cmYzc2E2NVZoV2hKVEtHV0ErR2R3QjdQMkVjNGpnSy9CTWFZOGNVV0lF?=
 =?utf-8?B?cWRSbHg0Rm5OZmdvZVJmelE4dWJNbDlRUU91cGRSRHVnb0ROOTZLMjhGMXhP?=
 =?utf-8?B?QjhJY08xQnBsR1gyMW1VSnRFRnllbmlRL1RSUkV0a3NuYnVFYzhKVVJMNHFL?=
 =?utf-8?B?ejJLZFB4dldqZjdzL0xYSytHWUtzSzNOY1pDT054bk5aNitLZjNPc2tabDRt?=
 =?utf-8?B?MVBEdkw2NGthUDFJdTg1emRvcnR1WlFsTTQ4YUdpYzFMSDRSanJzOVJEb0tE?=
 =?utf-8?B?SFZkRTZEOGs4UGhjN3N5b1FTTnMrK2V6WDBRZURnajVaVWVteVBaQXVWYzAz?=
 =?utf-8?B?QlF6TS91clE2dW1zSDJzZHFSQm03VTZrRU9yaDR2QWtocTJIanUzK2RCMjVN?=
 =?utf-8?B?c25NOG5OSkR1YkVBMCtpVmtySE1LK2V2dlNyWVVSYTMzRlhjUFE5STIwNEdr?=
 =?utf-8?B?NDFMRkc1Q3dzbm1vbk03aXFqWnJicEQyekw0WjFrQ3pqdE9QR3pTUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9556bbb5-b4a5-4e46-fd55-08de527c010b
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12117.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 08:16:08.2694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 29E29JSpyd1xyor3FA5Sqibec7b7IrqmpbUBiHnxyp3kxk+7f76VZL7HOK9MivB3UOIqMToEFWUwFqyZz6GYVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9515
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

On 1/13/2026 4:04 PM, Marek Vasut wrote:
> [You don't often get email from marek.vasut@mailbox.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Caution: This is an external email. Please take care when clicking links or opening attachments. When in doubt, report the message using the 'Report this email' button
> 
> 
> On 1/13/26 7:41 AM, Joseph Guo wrote:
>> On 1/13/2026 7:47 AM, Marek Vasut wrote:
>>> [You don't often get email from marek.vasut+renesas@mailbox.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> Caution: This is an external email. Please take care when clicking links or opening attachments. When in doubt, report the message using the 'Report this email' button
>>>
>>>
>>> Parse the data lane count out of DT. Limit the supported data lanes
>>> to 1..4 which is the maximum available DSI pairs on the connector of
>>> any known panels which may use this bridge. Internally, this bridge
>>> is an ChipOne ICN6211 which loads its register configuration from a
>>> dedicated storage and its I2C does not seem to be accessible. The
>>> ICN6211 also supports up to 4 DSI lanes, so this is a hard limit.
>>>
>>> To avoid any breakage on old DTs where the parsing of data lanes from
>>> DT may fail, fall back to the original hard-coded value of 2 lanes and
>>> warn user.
>>>
>>> The lane configuration is preconfigured in the bridge for each of the
>>> WaveShare panels. The 13.3" DSI panel works with 4-lane configuration,
>>> others seem to use 2-lane configuration. This is a hardware property,
>>> so the actual count should come from DT.
>>>
>>>
>> Hi Marek,
>>
>> I don't have 4 lanes waveshare panel on my hands. Have you tested with the 4-lane panel already?
> Yes, the 13.3" DSI panel is 4-lane
> https://www.waveshare.com/13.3inch-dsi-lcd.htm, I have it connected to
> Retronix Sparrow Hawk board which has 4-lane port.
> 
> See also this patch I submitted, that is the DT binding for it:
> 
> [PATCH 2/2] arm64: dts: renesas: sparrow-hawk: Add overlay for WaveShare
> Display 13.3"

OK, thank you.
Reviewed-by: Joseph Guo <qijian.guo@nxp.com>

Regards,
Joseph

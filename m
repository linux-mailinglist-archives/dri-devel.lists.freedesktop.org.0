Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0ACB83124
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 08:01:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A3110E0A9;
	Thu, 18 Sep 2025 06:01:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="GbEO+1tH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010065.outbound.protection.outlook.com [52.101.84.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E7110E0A9
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 06:01:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B2EC8MXKHDW+AnauK02xjKL8PEbao5/Yp+VPe3iywpJ/d97cAQMdSK0O4rpYs6DPSUeI7555/53DzQuXg22iriY7FPGAJNxGIUIa+2HNQkO/nRtLBEESllvmQa9BrP0uVPTYEUhq9MDuj+aOnrcBD8C1QIFF1bg6CObmangt7kUbyzeJzouVPswYCWpGJpi0L43YwVOxWIt9AEQvrmWnDcR5InRHj7aW0AQG3tX5W9J0gq0JS0c7FFQ/t2z1AaNEyBcXt6iwxV/rTqaOspbdqNu3b3rT+ppZxj9oVLjJCkJmzcTg7RO4L8+MDqRYuBDkeqhMSajlarFiUbLKptzNew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TMwnIZNavAeBn7btyuDbyw3MkvpaTVXAF964Xmz7g2E=;
 b=hxnQdE1SDMwT6WPXESGlO5wXZT/lRA71adPeGua5P66GsKz/fT0GF0BJVvG8zPRfSInZI+IlZVUPzCyl9K9xFDB3K35IRflAa99XtLKaErbdce5S6YCjqKiS+jJ762BS4O0R/IkdIWExd4pdC7pWUSyJUQKwutrEuRw2UEjW1n7o6+xP5qgqALd/zNUHKz3Wse+vnMDrvC5rIRt1dz6gTo6ekXPRuTCrnWm3BHjYnemFFpS8fjvXmVEakK3rhe1mH+GRojIQX/XT5sS9HGwPKjA7rna0lWFr96Ig/HaDv0n3s5q5ioTUgVeaKP8Hw80Fe5vPET4ibWqkDaV7oiqOpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMwnIZNavAeBn7btyuDbyw3MkvpaTVXAF964Xmz7g2E=;
 b=GbEO+1tHb6G5UE8+jLeWtynuauTTxDt3cMBg9YFshBS5LXYE1VvUw+DJsR4YgcjDp4jYN75YbOGOjT2ybe0T5wZ1I3Qydd4vwCBeVu+etr7u8Ft9FeLROTVv/0IVRBoFzi9UB/CxrUy9wRjrEHy4qnQjAwjEVXsqHwNMUgtyOtoR7DeSH/AGeBh4WAIHhYWq+ztAeJu/JBNIsWAQ0IoCnlMyWQzL/VoLArOAZ2CFNJg6YJKwi+itEXNQXBGedLL2Hm10bP9f3az9pwUo/Iu4Hd/Mx49XQMa5OJUi7SbbizlfHLhd4jRrYTY+gOBgZ9DVkk+H/gojWJJxjzd/KdHcPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8908.eurprd04.prod.outlook.com (2603:10a6:20b:40b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 06:01:03 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 06:01:03 +0000
Message-ID: <cb6dd5ca-f5ae-4acb-8154-d9725ea80ce4@nxp.com>
Date: Thu, 18 Sep 2025 14:02:34 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: waveshare-dsi: Fix bailout for
 devm_drm_bridge_alloc()
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 qijian.guo@nxp.com
References: <20250806084121.510207-1-victor.liu@nxp.com>
 <342ce13e-0c6d-43b8-a4fa-e9b29c0f8f96@nxp.com>
Content-Language: en-US
In-Reply-To: <342ce13e-0c6d-43b8-a4fa-e9b29c0f8f96@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8908:EE_
X-MS-Office365-Filtering-Correlation-Id: 141f0e09-a3b3-470f-e34c-08ddf678bfbb
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|19092799006|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWlLT2lmMEd5bGtRUkxSQVd6M3NWYjN0NktUUUIvKzNvaDk2U0M1VFpNT0pO?=
 =?utf-8?B?QWJkeXZ4M0NYYjdJOGFrVHhkVy9jSTB6bGNhRWtxQmgyYmdQTHBneENHTjJa?=
 =?utf-8?B?TUVLTktkbXpBZWNBQ2NPL2ptejJRb0NEcTRkNzFmRnhFdkt6eE1uSlptUitq?=
 =?utf-8?B?Y05ZQ1NNbEE4UUhpQmtWNmVOdTdOSUh4VGxqN2pEa3NvS25RMkM0UjY2OGk3?=
 =?utf-8?B?MW9rRFBHUGoyU1h2UFdJZVN1RjQ2dHJiRTJVdXRYbkVDN3pjdmZLZUVDNGRG?=
 =?utf-8?B?SzF4MHorME82RVJEeGdNMnl2bk85U3BJT2ZnMXVuVGFSLy9mdVh4NXpUT2lz?=
 =?utf-8?B?OW9LdjdMTXkvMCt2WlF3WWtPRElXMEZleWJMRkFKeXh3YXBKMVUxVG1yd3Nk?=
 =?utf-8?B?YkVWMExyOFcwVThSTGMyMXVNS1pyS2l2YjZFa0tSbERpampHZWlYRWx4ODVw?=
 =?utf-8?B?MjUvT01KMXJnOU9XK3JnV2NWZ1l6WVdObXkyRzRhTHZwcGJlWHFiQ1czb0ox?=
 =?utf-8?B?c2lCZ05QVXB4RG5USmY3U3ErTDRNQ2M0dVJYR3pYN2Z2MzZSbkpESkgwVE1D?=
 =?utf-8?B?Q2V6VG9hL2h0QnIyUkpjNXNYUHlKb1RVQzJLeitqRkhRb1JoTFhQTGhmRXVl?=
 =?utf-8?B?YnpYS2tSNFNzUWV1cWk2bzZTeUthcm9jcnJRL0NvSzF5akZUWmRZS29wOE9p?=
 =?utf-8?B?UlA5OFRodU56VzRQN0Z2cEt2UERGVDBoVmpja3BsM3BXdTB3dG1hd2RIOU0z?=
 =?utf-8?B?bWQ4aUoraUVabUg0bW02MWpqa1l3b21YS2dvOGhJc3QwRXRud0ROZHdzZFpa?=
 =?utf-8?B?VWNjUlZsalI4UXY2UHFxbC9XRVdPWDVVTW03ckd5S0VOMmVUZko1V1JKZ2sx?=
 =?utf-8?B?N1VZNGQ3Q3JPbng1b3l0dHNOSFM1OFhmZmE2ZDE3NUdnQXRxQ0lBUjY1cHFS?=
 =?utf-8?B?NVV1WmpSUk1EWWxrdnJVWG5HUU1hNVdJUU10bFV1anJ1QmxNZ0JlcE1vTDR3?=
 =?utf-8?B?S2hzeHQ5Um5xSUREajIrVnoyNnhkbnkzcE5LN3dDNTNXMXNEY2VudURnTEov?=
 =?utf-8?B?OHROcTg0VkV4em9MWThuVkUwdkY5cDlLSzdIejFRQ2xLVlh5eDRxaW1VTUVQ?=
 =?utf-8?B?MXQvdGt4QW50bHBEMmtpYzZuOUgvcmxyUzRKVS9KT1VPSmpxeE9kR3doTVR0?=
 =?utf-8?B?cE14clNzcElHMjJDdXFjSkZnMHV0NUtneGhzMnNPMmkxanE1R3YzUHNyTEV1?=
 =?utf-8?B?bWt3VmN1N2VjazR3eS85RHJHaVI2MWkxcmFmRnhDbllwL2lISVc3SjQwcGs2?=
 =?utf-8?B?TnJKZFNxMHdNaHRLV0N6dzNDeG54dStKdDJqcDFWQTFKNkNpWEd6endQTDM3?=
 =?utf-8?B?QnIzd0V2d1MxVUliS2IxMS9hM2NhUjBGSnhRNk9ZM2dOZ2NWaGNZN3JsUjU0?=
 =?utf-8?B?SDFiZzV4VXRMdWdPWldEeTdMQlp2N2F4QnN5dlQwdG02Ti9PWnVlZlFCaUVM?=
 =?utf-8?B?TzJhN1YzZnR3RDVnWUZCY0tPVVRQR1Q2TGEyRDQ3MUZGUFNSdWZ4bW1iOG14?=
 =?utf-8?B?Qk9HZW5OZWswc2ZTWDVWOEFFc0JHbVU1WmxFeThZV0V6NEZUVGtWVGFqSExY?=
 =?utf-8?B?MEVqa1JJNDI1TGFrVGgyOWE4dEVpUy91RXdOTkJ4TkpuZTY1d0lHT2paTnYv?=
 =?utf-8?B?NjFvOVAyeHErV2hhTTJKNTFvWUpMZERCdGVQZWJhSmdGYjNyQlZYUzV6Z3hw?=
 =?utf-8?B?ODVVTlgxTXVFUGJyNTFmY051ZS94V1Jmc2VlZGhoVFl6aEczcHYweHpKcXJk?=
 =?utf-8?B?aitvNlg2UGl0T1NjRXNDOXhidUMvWXg1aWVvQ2V6RlNBODJYOUdqc0xwaFd2?=
 =?utf-8?B?blhrRnhFQzExQkVtNmlFL1plRW9HS3pzSWpxL0lSMzBLaWJVdHFkZFJKMEZu?=
 =?utf-8?Q?OuS2Wcv8Q48=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(19092799006)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WE1CVU9ka0NOZ3RsMThZdUVyaFBaakk1cGRvV2owd3dzNEsxa0tXWVFPV0tQ?=
 =?utf-8?B?V2ZucEd4cE1LQVBGMjlHZkVwVEVPbkU5d0Fsb3lpc1JDUHJtcVd0ejlpZ2s2?=
 =?utf-8?B?OWtDc09mN09BQ1Rkd2RxdzJoWTlXZndROXhkWVFnVXNEWktRcUVLRFVLTEwr?=
 =?utf-8?B?UW0vL2hrSWZrMmRVTUQrcVlxMzdZY2FZL0szVTdEMmt6ZEx2SU8wdDJGaTRv?=
 =?utf-8?B?WTBNK3hiWXhHOUFxeVpYV0kraWRWVk8xaENRR2h3dEJYWVA3UDU0N3ZsbGVZ?=
 =?utf-8?B?RE1MTlRsSWhmYkFEa1RZUFprcWFPYnNCVzRQa25FRi9SOWZab3RXSjVQQjZy?=
 =?utf-8?B?WWRQcGtiQ0lRU2g3UE1kbUdFeCtEa3BTMXZic0JmdDZHaktqcy9MODBYR2Ux?=
 =?utf-8?B?NE40Q1BQL01RN1FKeVBJR1BzcFlOWkxPWHJaVjhncnNLalk0WUVUSGtRUGZi?=
 =?utf-8?B?dmM3bWluWHB5aW1BcmdDTFhHMjRIM1BTMDB1Tld2YW1IamVIQy9Fd2loMUJs?=
 =?utf-8?B?bDVlaWxTZVh2KytTaEZxRjlQdWRaWmhnejgwWXcwZTNMVXV5YlR3MkwyWVJT?=
 =?utf-8?B?TjAydUV3VCtJaHdVZUh4akhIL2V2YnEzdURaQkxKZVdoSWg2bmVORiszb1Vz?=
 =?utf-8?B?TFJWRlNLd1FCSFp6UmFUcVJ1MTFPeWdLaVp4OGtQTmJPNWNRdnFsRHdWTWtn?=
 =?utf-8?B?TWkyc2NwamJ0OGdiaVY5VzFBZ0IyS1VadXNlanZnOHBnRVdSSk9qdWtFODVx?=
 =?utf-8?B?aGxYeGxPTzRLd05EaVY0QVNrS0JJejZPdDRUSEZwWUZXRVpTYjR6d3B3QXF1?=
 =?utf-8?B?cGVwd1hMK2c4QS84K1o4bnpUczRaU3dRUjdHT2dsWXNWQXNMOTI3T0t3TVBT?=
 =?utf-8?B?NTIrbGR5U1RRRzE3ekViNS9RdGxJMVNIWmllalQ0a2V5YkVqTHNpMkx2YW1s?=
 =?utf-8?B?c0FuSkxLY1dRd0paUkpjZkpxdXdRRHgxQkRjaDJYcmhnL01xWmpISXNXNExu?=
 =?utf-8?B?c3lrOUxOUk5wUUQ5VjFrbjJ1OERjbXh2bFM2WmdtR01kZkpkSHdzbStvYmZp?=
 =?utf-8?B?RFY0ZUM5Skg1c2llN1dGalp0Z0FVTDdSVmJJNEorU2IxNDkzMERpZjBBWlNS?=
 =?utf-8?B?dk9wVnB4Q2duSEFRTGgrTWMxc1greEJRTGhNWnRqY2hLTmlvODk5a092dDNP?=
 =?utf-8?B?WHZDK1lIQUo5MUxBYUVZcFo3VXdTZ0ZCSFhqa1d6c29IeDBjZTlxeFB1aDhH?=
 =?utf-8?B?TC81T3BqZGg2b2hHa3NTamtPOHBzK0pQczNSeG5pVEZPUnFMR1dCS3FoanE2?=
 =?utf-8?B?OXlDcENJNUNtb1lwNlJ2TFdwWFlTcXFmSzBtNGhwRVA2WG5McUVZV1hUTU9n?=
 =?utf-8?B?ZWVBQlljY01kZ0g4TXZmM1hOOEZTdCtNdUlRc1lEN1R0c1hLN1IvUklsWGNY?=
 =?utf-8?B?VitMdmlJVWpMcDl5NjNRMVZpelhWY3JudDc2c0g5K2ZidWJId3kvdThXa3k2?=
 =?utf-8?B?WmsxVTVEOTA2OCtxL1NDeWYwT1NXVWVFUWQ0R0xGSkV4c09RRmJCVkU5c3pj?=
 =?utf-8?B?cGlwQmFWZUp1alNyTmN2NmE2ZXZFSWp3bmprVXljQ3RUdUNQVnpSa2x1Ly9T?=
 =?utf-8?B?aFJ1OS9oMmVzemp4ZUxtQ3Zhcy9OZnNQcTlXRE9PTlV4VjYzR2hMUW5IYy80?=
 =?utf-8?B?bkZOYnNvYnplV202WFcxbGFqdUhIL1pTb2YvRngrYitCS1lKUSt2eG1KaFQv?=
 =?utf-8?B?M0hpYmpPTThYSlU1SG1PVkROd1ozRDQ2dVowSDNBZGJvTjZsdmJGNG1ENDE2?=
 =?utf-8?B?THgvWnJ0ekJNM1Z2V0dob1lBU0xNVEF1SnpnWTV2ZVhDSmUxQkdsVDROTm5T?=
 =?utf-8?B?bm1icTNzL3B5c25KajdGakR5eUxSUU9HQUFuejVRUlp6WWVEbGw4bXVKK1ZQ?=
 =?utf-8?B?VHBoQ2pHR3E4c1lmbjJwS0RCY3crY1VsRU5yeUVyaUtDekJ0dnJLQXFiTEI3?=
 =?utf-8?B?Si94Ky9LaFRLYjhGdnBOdU9lc3c2T2R0M3hrbG1MU0duWDY4eW1aWXRwTlBH?=
 =?utf-8?B?OWp2Q1RSd1o0R1RVUFJTVjk0NS9nL3pXTEhiNjRjdkpSeDlWL241SVJjMjY3?=
 =?utf-8?Q?Qhbm6OOGv5JdFOhi0QMCdTn5K?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 141f0e09-a3b3-470f-e34c-08ddf678bfbb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 06:01:03.4755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xx5dDjzFsK54wlF440nsXNU+f0YUzoXI/FvNIgkKmGSgOiD5NwDVw+WzBjRl4LPeM5p2U+deIWwxpbDDEHO35w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8908
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

On 09/05/2025, Liu Ying wrote:
> On 8/6/25 16:41, Liu Ying wrote:
>> devm_drm_bridge_alloc() returns ERR_PTR on failure instead of a
>> NULL pointer, so use IS_ERR() to check the returned pointer and
>> turn proper error code on failure by using PTR_ERR().
>>
>> Fixes: dbdea37add13 ("drm: bridge: Add waveshare DSI2DPI unit driver")
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
>>  drivers/gpu/drm/bridge/waveshare-dsi.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Gentle ping for review.

Ping again.

> 
>>
>> diff --git a/drivers/gpu/drm/bridge/waveshare-dsi.c b/drivers/gpu/drm/bridge/waveshare-dsi.c
>> index 01c70e7d3d3b..43f4e7412d72 100644
>> --- a/drivers/gpu/drm/bridge/waveshare-dsi.c
>> +++ b/drivers/gpu/drm/bridge/waveshare-dsi.c
>> @@ -147,8 +147,8 @@ static int ws_bridge_probe(struct i2c_client *i2c)
>>  	int ret;
>>  
>>  	ws = devm_drm_bridge_alloc(dev, struct ws_bridge, bridge, &ws_bridge_bridge_funcs);
>> -	if (!ws)
>> -		return -ENOMEM;
>> +	if (IS_ERR(ws))
>> +		return PTR_ERR(ws);
>>  
>>  	ws->dev = dev;
>>  
> 


-- 
Regards,
Liu Ying

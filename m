Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1FCC2F5E3
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 06:25:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22E4010E23E;
	Tue,  4 Nov 2025 05:24:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="BFClKTU5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013009.outbound.protection.outlook.com
 [40.107.162.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EDF110E23E
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 05:24:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ivhFVZ5cvBLBMks/EUoiM6MwtD/cgQCq1cWeG1XWRNLB1OqnoHKHDTf3jRvyDzR+s/Ud8EFT4zfAia2VvI3VfItJrX2Hy8udPmI+Mwdb4DMFUUdr+BFhoQrwGGFeDJp/VCHijDzLqlF1RjZd5LcXU7FWyzHYGUQAx6uuPfKDAvui6mJcuo2hVOrFmQnBfkb97j9fRANB9N//ghe1GKr61enk8QZZGBWFX7R5dDwofxDbjsjlZ4umRGfzn0svI7KJiU3R+WJuEuZgJ9hMKZkyIqWFzIs11p1rOqL6XUI2YIO2FpjZpfFc+d082Dk3e9Qh4C4AevMCmkl/3V9jdKFmcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H7LXzk9S7lDIBO20S8d+YIgPB+6a+4RBOFooXnx+ALY=;
 b=X5wEUeV1rWdukc/kVWVFN15MQBcDM1/dAkWrzUczb4pytc/+GBcjxe5daxBM27YQ4PD94iGzVizbLPwAeJoc6yTM6kkMeANPM6tggx8DH9NwRXB3wQ/njpK+VCm4JsGJNaOv5x6jJB2JsNeAm9G+eIrC5BncL53kD0+FOIbVYrWV771J34lHHbABJAAQPhaDXUhaJaclfusYQjJRPckY7Ydq37os//vflsPf6UIm+K1MCyfFqK69gLoCccbG6T1KzN84l/hquBWPrLflWbO95N5w0YPKIDThI+zY0nnFNigKLCO43qTLo2rttYKgiNBpWU11wnkmp9DMqezMMe1gxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7LXzk9S7lDIBO20S8d+YIgPB+6a+4RBOFooXnx+ALY=;
 b=BFClKTU5M613jZXAsvygdaAEvvIyDdz6c8r41zNvahuhHkK/UbASqaraqtih40gzGjE857ysPDGz3wvh6/QafGJIy7IGTtSLDlm2FNR2cpOgbpKUFVe8dBPu7lUW0B8yhVmdQOOyMS4wmJBWSSFBVseu6wbQwvDHQMLEgU9doGNzbIATKYtS4k1coDBX01s7eDTg0ryVa9YKRz+XKsoa1/h7QKzQ4JKx/PaWeIWzqhQWTLuNy6fKRIop4MAFb6YyV0ycIvUwPqT3vMgtSu84KRUeo/CNLSdQfMavSMl14pWP/RaJQHrhwQbe14T+DbhzGWNXkA79DAOksUqS7vPSGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8071.eurprd04.prod.outlook.com (2603:10a6:20b:3f9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 05:24:51 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9253.017; Tue, 4 Nov 2025
 05:24:51 +0000
Message-ID: <ac21053f-21d9-4844-9049-09deb3708a6d@nxp.com>
Date: Tue, 4 Nov 2025 13:25:17 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: fsl-ldb: Parse register offsets from DT
To: Marek Vasut <marek.vasut@mailbox.org>, dri-devel@lists.freedesktop.org
Cc: Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20251017154029.105099-1-marek.vasut@mailbox.org>
 <dc4b1b65-542f-4bd2-bd91-af3fe4223b63@nxp.com>
 <55d44163-4f37-462f-b860-c862cb5ada5a@mailbox.org>
 <b65d9221-bdb3-4e69-beed-6b7646c5d5eb@nxp.com>
 <3064e20f-92c8-4e3b-82bc-ef949f312826@mailbox.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <3064e20f-92c8-4e3b-82bc-ef949f312826@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR06CA0018.apcprd06.prod.outlook.com
 (2603:1096:4:186::8) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8071:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d3477be-0122-49cb-be33-08de1b627a6b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|19092799006; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGl4V213WWFCY2l5T3o1NllOZEJMK2puWkZoblFkWUR6Wld6VDJ6NkR0Z1FE?=
 =?utf-8?B?RnNJY1JJZTZaMGFHblVmbEVWdGZ5dFpyYW5DRGdwNXpMN25EU1JvZ2dDb28x?=
 =?utf-8?B?SWEzTmZ3S2NhdllMaUd2cjFQaENIRVA0c21EKzlZSVRCSmhkTUErYlhidXJY?=
 =?utf-8?B?VXhjYzZaWFRhNjlsalJsekI5emMwZjllOUhYM0d0aXFmTjczSnhGR21TUURH?=
 =?utf-8?B?M1c0cDFxL2hNMkNsQmJVcVJnRWhBVG16dERySHRTY2R6QnMrUHdBQ2hOWEVH?=
 =?utf-8?B?TERaVDM2Rk85RzlxbUtScHlpWm4rb1pyN1k1bHpnMFFSL25EeWkvcTRmNG1O?=
 =?utf-8?B?bCsvQllkODFNbVIzMXBUQ0cwWUZOQU1JK2NOVzlBS1UraHZtV0RvZUJyUDRj?=
 =?utf-8?B?eE1hYXdpWHdyTWkrY05waDBhN2F5R1RCbVBVQnZPNmV6cmRBQ3VBTG91ZEtV?=
 =?utf-8?B?dmVZdlBuaW9MQkRxMTluUVpoSGRVNE5MaEZuSDA2bFJTaHZRY3hNb092RUhL?=
 =?utf-8?B?S2xxYjNDK2Vzb3dzdjhXR2hobU5Vd1ZsYks4U3JEWjdrZ3hwTzM3THdlZlR3?=
 =?utf-8?B?Q1RxQ0NoME1ZeXFmRnFmL1VLeU9mZ0xTbVNoV0xCVDlidTAzbDBDOFJpTlJu?=
 =?utf-8?B?MUh6Vk4yS2JIS0NpTTYwU004Y1EySnJVbGdzVFp2U1RrOVFSUGRweU5hMUU4?=
 =?utf-8?B?LzR4bXdBQXQ2MjBERGppSTlMdlJ6RGs0OSt0TDdSdmF2dVhYeEhrOG1lMlRl?=
 =?utf-8?B?V2tVVTN6QTBPMGVMcDFJMVprNm13WmJQU3FiakNiNVFzaGtRVmk5WkJpdXNr?=
 =?utf-8?B?bDJ1ZWdpUHliWHlycStyYUROdlhjVFFqMjI3Q3BJcXRFclhEOGRqMmVzdjlq?=
 =?utf-8?B?OVVXMmFBM1lwRzZYTTBRU1FhdEk4UjNOdU04Z2V4NUdXZW1GL1Rib1ZnT2Vm?=
 =?utf-8?B?RUdSUDlkd01IN2hIVmxJQU1HMkNabk1zai8rMnZFTHp0Z2NhejNicUdDcnRs?=
 =?utf-8?B?eUIwT3QrcWxrcXg0NURXdEN0b09Hb3ZRcENEaTh0MnJRL1FETlJsY3oxbTl3?=
 =?utf-8?B?SWkvMDhwUjNPNk01RlRvUVBjclRML2dubkxSSk1VYUlqMkRra0NjNElRcW5L?=
 =?utf-8?B?SDJJclRjbHRDY0ZBOU4wL09NbittcGpzK1orYWF0OVdTYy9uMFY5dHRwMzBw?=
 =?utf-8?B?Y3grY2g0NVlKWUtLZnRkNzR3TlZ0V2NacFlWekN5SVk2VWhrNDdzWUh3YlRk?=
 =?utf-8?B?TUdZMEcrQVhoSVBTZzZEeXNIUEFOcVdhMlB6ZHRVNkN3S0tvU0VQRytSek13?=
 =?utf-8?B?WWRUd2hZNy9QRUdSbGNvK1lUTUIyeG4xQi9GbnJrNU9OcWN5YXVLcjg5SjZp?=
 =?utf-8?B?dEt0SENGVjNaTXBDVWJ6NTgvRkVmNkJnLzJ4aU5vamFVY01iRFhyT3FJWkFa?=
 =?utf-8?B?Z0g5aXBIcG1JVlZ2Ny9DMHMyM3dJOTJDTzhTZFZzV1pWaGZ3SUxZaUtHUkdx?=
 =?utf-8?B?VGR0YmcyMlIrZHhwTmp6WW5VVDhRUHpzUzNDVEVsWXdJUmlPS0txazJUUVVx?=
 =?utf-8?B?WW5PNlZvanZ5T2x5b0NGMWprVjdwMW5sLzZuMXJqTWlCdnRmTzBCSTZhTWZ1?=
 =?utf-8?B?QWU1bkFZZlB0MVdwNjdhakRpTW5KTVlzb3dnenhqWnVXaVJjQ0xwUnY4Zkc2?=
 =?utf-8?B?Y0RzOUVQK0pwb0xqbkthdGxZVDRxcXI0UDIzNVNIS1RKelFyOFFpc0R4eUla?=
 =?utf-8?B?WGw3eVMxZ3VVczJpdEdWRldRUjRRVko2dHI5NXlJT1paaUduTm9BUlBvSSt4?=
 =?utf-8?B?elhmSGpHTG1RTnBnUTJjcHozQmZkb2RRaWp0SytVQmlMOWNleklzbDlPS3hD?=
 =?utf-8?B?OU9RYXNHL2dicmJKUGRGOG9JQVkwL1BmT1dGZ2NNYURtNHB3azJTRTIzQ0dL?=
 =?utf-8?Q?dOF4USg2PlcBzKG8oJxxmLUUy4gv9QYx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(19092799006); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWx6NWtad0ozOS8zWkpRT3lnMWdJTEsxVmxralpkQThvZkdjdko0T0VldFBV?=
 =?utf-8?B?dE5qS1kzaWlXY0FHYSt1Y3ZRYkxvb3BEOGFkbzhrWDdzMS9QeVU2RGM0Smk1?=
 =?utf-8?B?eVJnQTZ4R0VWR3V1QXpBaWpYMW9PNkQ2ek5hQzFaTUlTR2l4MURnMlU3Wjky?=
 =?utf-8?B?NllIeHc5ZzJDcnlqVGc0cm1LaDFhdEJjSkRvN0VGQW9RSndFKzBkeWRlUHlQ?=
 =?utf-8?B?UkV3MzlFNWJCTHp5VkIwVzExcHRWb080enU3NVp5Wjl6ZWFtNGRJRG4reXpU?=
 =?utf-8?B?TzR5NzFTUW1GSXpVZ3pyN1JXQjFPK3FsdTlxNDdDcGQ3SDAyZ0VDZVBZQzNC?=
 =?utf-8?B?RktvOGc3L2VNd3YxZEd3WDAzWFYwNHFodDdzVGhvbnM5amEydGFpc05KUUgr?=
 =?utf-8?B?dFBoeUtzOTJxU0lBTDd2dU8wdHJDakxvQWdibk9IcjAxMFFTV1ZTWmFYYVlu?=
 =?utf-8?B?T2M4NzhzbzZwOTJKZFFZTDhneGhTK0VZNVU2OUxYMCtXODBNZ0FDOFBBeDl1?=
 =?utf-8?B?Mi9qUTF3NnlaOXdYTFZlS0VlU05malF6NmxSRkFDaE13b0I3ZHFnbmFWOHVJ?=
 =?utf-8?B?clZXNFhyVWdmU28xQWVWWHlnQ2p3YVRmZG5IYmppQXNZZU9MOWJhdGVMR2Vm?=
 =?utf-8?B?Zmh6TFRQbWE2UVY3Q1RDWkxZdGQ3MTRsbVVGaU83NmV3T283OXJMT0cvelpp?=
 =?utf-8?B?YW5LSndWYktweVhCWnVOTWRTMzlkajJSZGhjM1FQOEFleEpHNVhTdWVGUFVv?=
 =?utf-8?B?aDI1di9GVnV3TXhoOTZFaGZ1OGdDbzhCTUNIWWxqMmJOTW92anhuWWRuby9G?=
 =?utf-8?B?R1MxZm9pRUJiUFZwWjZSVGhFSGduUnhvUmgyYmZTK0FlaDBCMm1tYzNQMzdN?=
 =?utf-8?B?eGxEait0Sjd5VERxRXhKUTZ3VHc4dW5QUXU4TmVXQmhGK1crdVZQY2F1UGhG?=
 =?utf-8?B?Z21BNjh6aUY0Q1pITTZNdHhxc21ROTAzNHE0S1ZZbmdkQ3JjMW9Za3cvUElR?=
 =?utf-8?B?YXpoaDFnOWJPc09LWXVmV0F0aWdlUUgyZ2xIbDNpc1lxS3kwbnRLTjJNMER6?=
 =?utf-8?B?endUeDdxSXZVTGdLME1qVTRWSnB6OXJRcUszZlZkNzluR0oyci81emQrOER0?=
 =?utf-8?B?MEhQc2tzRUgrdGdRa29zQ2ptb0tJQXNkY0pSVnNKTE4zTUlXbytwN2kzaCtI?=
 =?utf-8?B?WGUxVzQ1Wml4Y0ZrVERpVXN2MGlkUFE4cDI5OVJNR3BIa2xMRnBiRzNSMjBa?=
 =?utf-8?B?ZVBaVjE4MzBUZ3VMdEZUNkp4VStsSi9sRTh4WlZvTjJlelJ6bnVTNUlNMjlF?=
 =?utf-8?B?VlQ1OTFwMkFUYzIwQ1NIaS9sbUpJQk1DcEJkb3VGZjZhMEZEdjByM1pxck9h?=
 =?utf-8?B?SElrYnFObTh0SEJCSFhFWlg4VDdjSzFLZ2FOSkFIcm40MDRzUXFBa3Nzd2h3?=
 =?utf-8?B?NS9GSnBaNWJ1R0U1SHZrV0RTemVQN09ZWU5XTlErVjlvRWF3YllnMjcxb2dt?=
 =?utf-8?B?N3hYS2pnSks2V1ZGeTN5cS9QanBTYzhEOEoyU2hLWTFzMUIzd1BWblJNTE50?=
 =?utf-8?B?ZVhMb1AzUllJTk1HNzNwMlpaTWd1YnM3ZFdHNjN3ZDRaaHZNRkNqWmYwRWdv?=
 =?utf-8?B?YVU2WGJVZ2VuUml0eWVTMDR6Yk8wa2cxVjRFelhFTm0zdExYU3FZYmFJc01D?=
 =?utf-8?B?UTVBWnVaa2FacmVWUXQxWkNmN0VYcWwyODV5eVlKWUlSUlpGYjZYcGpBMmNV?=
 =?utf-8?B?VEY5L05vUEtFTGV4Zkk4RGxBWjYyV3Iva01BeEkxWklWbGljWDJPc3pPOEtL?=
 =?utf-8?B?R3hUQ2MvbEZ1SWpneVh4bXd1bHVMN1FRT1Y0YUF4cVFJOW1DZUVtcE5lYkZY?=
 =?utf-8?B?RTd0S1JIOVkxK0JkNVhRQUtZZWp4VjRVNThOZ3J3d0kvWDN4bU11Z1pEcm85?=
 =?utf-8?B?V1lEdGJWeGVlZXFqVDUrbTdNMHExRGNubDJQZ2FyamVzdkYrdXluMjVvY3JD?=
 =?utf-8?B?Mnc1dXlVUk5JMDNuSmxXcWVFblU0L2E0Qkx6LzVPOWJSS1pWb1VEZ0g4NVBk?=
 =?utf-8?B?djFaV1VUa0RnUk1iQzdKNkRMQmlJdjVjMG9xZ0VsYXJrTjRBMmkvZGc0ZExL?=
 =?utf-8?Q?ZuiO9MYDG/A+Ob9R/tyR6g2ot?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d3477be-0122-49cb-be33-08de1b627a6b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 05:24:50.9377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +/DTIOu7El9UB+PE2Q9yKWkecMUekutukcnR+kbR2lImCsNWHnQGHYdDcynhgsCvUasP6BAlXU6WQsnW3B3d3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8071
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

On 11/04/2025, Marek Vasut wrote:
> On 11/4/25 3:26 AM, Liu Ying wrote:
> 
> Hello Liu,

Hello Marek,

> 
>>>>> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
>>>>> @@ -61,24 +61,16 @@ enum fsl_ldb_devtype {
>>>>>    };
>>>>>      struct fsl_ldb_devdata {
>>>>> -    u32 ldb_ctrl;
>>>>> -    u32 lvds_ctrl;
>>>>>        bool lvds_en_bit;
>>>>>        bool single_ctrl_reg;
>>>>
>>>> single_ctrl_reg can be dropped then, as it can be expressed by failing to
>>>> get the second register.
>>>>
>>>> Furthermore, with this done, lvds_en_bit is the only member left and hence
>>>> struct fsl_ldb_devdata can also be dropped, as IIRC there is no need to
>>>> use a structure for device data with only a flag.
>>> I plan to add more bits into the driver match data when adding the MX95,
>>> so I would like to retain these instead of removing them and the adding
>>> them back.
>>
>> i.MX95 LDB supports two LVDS channels.  Two DRM bridges are needed in single
>> or separate LDB mode, while one DRM bridge is needed in split LDB mode.
> 
> What do you refer to by "split LDB mode" , some interleaving or some such
> thing ?

I mean "Split Channel DI0" and "Split Channel DI1" use cases in the below
table in i.MX95 TRM.

+------------------------------------------------------------+
|Table: Channel Mapping                                      |
|------------------------------------------------------------|
|Use Case           |  LVDS Channel 0   |  LVDS Channel 1    |
|------------------------------------------------------------|
|Single Channel DI0 | DI0               | Disabled           |
|------------------------------------------------------------|
|Single Channel DI1 | Disabled          | DI1                |
|------------------------------------------------------------|
|Separate Channels  | DI0               | DI1                |
|------------------------------------------------------------|
|Dual Channels DI0  | DI0               | DI0                |
|------------------------------------------------------------|
|Dual Channels DI1  | DI1               | DI1                |
|------------------------------------------------------------|
|Split Channel DI0  | DI0 (first pixel) | DI0 (second pixel) |
|------------------------------------------------------------|
|Split Channel DI1  | DI1 (first pixel) | DI1 (second pixel) |
+------------------------------------------------------------+

> 
>> Also, each channel connects to a standalone LVDS PHY.  All these could make
>> it intrusive to support i.MX95 LDB in fsl-ldb.c.  Maybe, we could discuss
>> about this later, but IMO this patch should remove struct fsl_ldb_devdata.
>> It doesn't hurt if we really need to add it back.
> OK. The current integration seems to be working fine. Which exact case are
> you concerned about, do you have an example ?

At least, "Separate Channels" use case on i.MX95 EVK to support two IT6263
LVDS to HDMI bridges(see ite,it6263.yaml), meaning two active HDMI monitors.
That also means "Single Channel DI0" and "Single Channel DI1" should work
with one single HDMI monitor.

-- 
Regards,
Liu Ying

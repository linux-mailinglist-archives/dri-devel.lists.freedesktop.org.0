Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A53CC952803
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 04:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5479310E29B;
	Thu, 15 Aug 2024 02:53:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="kpDaF/Ir";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010071.outbound.protection.outlook.com [52.101.69.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D98CE10E29B
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 02:53:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qzz1GTXrKXcslFM6qarTby8YVMMLsk2yMruabwB9w/ISSQN6Q1wsKbqslde8/M+5ZjjTkYqJKiMzcl1xo+wYJ3DH9cYKMCrqTJ+yaiGdzk5l7nEXYtG2FaRsEFNMnMIBAnbx5eKTRKy8TbS48zwzSw5LSzTNCEYw0EN0u3i4r6tOZQOx9WKTsc3yJ9NWEztl9KMxjmFW9Nb7l1Lf/vsENHlEXmlItp/ixAv5v3GcGZG+lUlxOcstm8f5ZARgUoeuUJZNbDzKZXMfPFO9BjCHMzu8uB/aDdsxhkl/oNVlR6FcHi734zCc+JF9O83U5+tVei1KlROpJmZsz2j/Efrvtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OGCibN3VKXKjU3m0pItuCLtUivxrYq67xc7K2XI3GHY=;
 b=Y5Gf9rdkJcYSNhQtdlYwn1Gb3b2EaHn+i5euoRnIcf1XhayFWAvhReI1niyYRHQpLZty41lcFw5xpKS/nOxhX6ePTKoVWJ5HoYcbgbEeIGepfF7vz8cmN0U8RX0/PXp6mrwQWJHBBbyW0ogd+ggYS0IvVpyXN7Vdt7O4Hl6AWEMBs1nFRwW2OUSfebD+P4gfvBi1YOlf5tP9jrugEH71KvSD5mvWvVJ3qt9+so6R0RWNWXIFqazF32tvFaCiOVBmX0IByDuV8hu5/JVgDnEl+JzM9vpDJx5tNNI9MDlEhkc71CLncjqUAPafYGbv1WIFZ25WvyYCME2VsqhlFvh1bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGCibN3VKXKjU3m0pItuCLtUivxrYq67xc7K2XI3GHY=;
 b=kpDaF/IrJT/f/5nxop0Vue9T4Rln6Tn5EVuuXO0pgkxpSqE8e2hMJPaYqdqYI6KzXIH/g2wxHiWSXQkY91ufjlNOgDHNRVJ/WdDC13+KuPm6Z8skzrIAbp9KOvYQLv1pqQSDoB9va5ygNXQa5HCnLGC7ofXkR/avVWA1HQkS32rrWAQFc/v5r8fJNN0PnB/6IXmByrwrfpFXz2eMT4ZiKbHKmBhJGSCNembO32ZQmff9HepeHxheodud7UoHRgqXDNnfmu25A4kMquyhcI0mJt1Y+iY880u5O2eYCtfEE2+89AAInvsVzvUtgUB3OJ4PdzCT4xI39pt+y2w0M+aVrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB10319.eurprd04.prod.outlook.com (2603:10a6:800:231::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Thu, 15 Aug
 2024 02:53:21 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 02:53:20 +0000
Message-ID: <3e16040b-58a9-456d-9531-ba1a557c415f@nxp.com>
Date: Thu, 15 Aug 2024 10:53:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] dt-bindings: display:
 panel-simple-lvds-dual-ports: add panel-timing: true
To: Frank Li <Frank.Li@nxp.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev
References: <20240814191656.4035551-1-Frank.Li@nxp.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20240814191656.4035551-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0057.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::10) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB10319:EE_
X-MS-Office365-Filtering-Correlation-Id: 12399f8d-47bc-42d8-a643-08dcbcd56beb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUdudEFyM0JoNHE5ejhiTm5idWhWazhHVzNJTXRvRzhwNVlXVkMydkg0ZUZ2?=
 =?utf-8?B?L1VsRlBidDcrK1AzNTlvRTZ2MjRzaW5iSGlJVEVnVXBaWURWbzNiZ0w4MER2?=
 =?utf-8?B?L0ZOejhDSSt5bnQyNmxERXpTWGVFeE5jWWpTM0kxNHNtNnR5NytSci9WeGFQ?=
 =?utf-8?B?RnBXalpKb1FxUzh0allyWFJHRnZBdjEwZVFZeS96VHJqOGxlbmFXUmM0VjVx?=
 =?utf-8?B?elkvSktHUW9xMEpua3hLaDQwRGhNRHRVeVp6UHVtNzhCUmFtZ21mYmdmbW1z?=
 =?utf-8?B?MjI2NE9wbkxSMWZ6dXBUS05za0VIRkUzMDVVWFNMRWx2bCs2d2MyTi96anhi?=
 =?utf-8?B?aEw1Q0ZNZVIzTjhWRTBSWWxqUndYUENVU2lhSDN3QTNnZ1ppa2l2YW91SVFD?=
 =?utf-8?B?Y3g5ZG0vVkJiQ0F6bEVGUC9VQ0MvTzEzb1dBQUQ5U05halNGSlFrVnk4NUJu?=
 =?utf-8?B?OGRMcENOS0wzNGRxanpJb2N0SFNmMVEzY1RLTzNyUUlOd21PdEVzdkU0SWh2?=
 =?utf-8?B?VlFyR3VDZkRPSEhYMjFENnowOEFsTktPd0o1VXhtam9SZzBzeldhMUI2V2dJ?=
 =?utf-8?B?S1QwaFJreHkybStCalY3ckdPazc4UzgyakFGWnJLQW9pYXFLdlA0dHFCaXVZ?=
 =?utf-8?B?c1FST3I4THlBcDE2S0FteDZ3UjJjRnlhQU5mWlBNZ0JVNUFkOXFqalZmZ1Rh?=
 =?utf-8?B?Y1ZTWk8rSWQwdWhES0NFVENkL0hWZjgzMzZlWHFIUjY4QitDL3gvUHFUaDlq?=
 =?utf-8?B?MWlkMFp5a0VTQkliZDlHUkp0eEdxb045QmFQbjFicDZHM0dqUEVncXlTY2hE?=
 =?utf-8?B?K29ha2JBczRYWlpLaURlT05tZGlRWUNxbC9ibkdVYlBrclo3Wk04R3hYZEJS?=
 =?utf-8?B?YXdFTURjd3h5K3l1NUpST1l6ZGV6MHF1SGlFY3pOemw0TTVMdGw4Qkc3dXZL?=
 =?utf-8?B?RmJFNEZhQ0VXMXRob2JMd1NyOW93Y3U2cHhha2xLUHN1T2lEOFFtdTBVYi9m?=
 =?utf-8?B?KzZISFFmTnZkMnJkQnNTeVIwOTZ1V0lBamZFWmFaTDU2ZVFzSkFzRFpxTnMw?=
 =?utf-8?B?eVQ1MW5JRUwzeWdZckRDNUhsY0djRGFhdDdKSzAxUW9kQXdMTTdFZ1I0cTRv?=
 =?utf-8?B?NHhoKy92TWIxYmV1WXhsaDE4VlBqK2dmMkpLVmtnVUR5TVpkaVI4WUNhUnRC?=
 =?utf-8?B?RVpJRVZZai9DVVZ3T2ZIK3FxQzI2S2s5L1Zick85Z2tkalpBUTh5UEU1NmxD?=
 =?utf-8?B?RFlsUXRzQ0RKOWtNT0Q4a2svMHFNL0tEdmFIMUFaN2dmL3dVam9ZUjFRdkpV?=
 =?utf-8?B?VGFxb0ZSZkNRSkxCdEZ4U0pWVzhuOWg1bExmSU5XL0szUGI4ODZ2Wm1iMmJp?=
 =?utf-8?B?QUVjanZzZE4vR1RoSFF1eWRod3hzL1BDb2gxaXVYVXFLaXQxZXRIMkdwTWJw?=
 =?utf-8?B?WTJ6UmhYWDN6SkRvNTR3bE5lUXk3YTA0Tk9MUy9mQS9pSjZIRzdhUy9WbVJC?=
 =?utf-8?B?Zk5JUzZYcEl2K0krZjZJVm01Qm9Na2JmS0cySS85dk5iM09iWC9qUUpRZWkv?=
 =?utf-8?B?V2Y4cUpLbkJWZStVV25ld0R1NWRKQTdIcGNjcmNHSlJaYnZNSXNjUGZGcENw?=
 =?utf-8?B?eS9ReE5FREMvWWN6d2xQT2ZWckxUbVZodm5DdDlTQ05IdHVOeFlrNm1HTGJF?=
 =?utf-8?B?Q0FOb3g3Nzk5WXd4MWttT0FVYkFwYTJ5RjRpMHhMbGRNMERJVFhDYWpXQnhx?=
 =?utf-8?B?dWtYUHdSbVExeWxiTXExRWZMUTBZcjFzTFpkVjloeVJrdGQ1eW9wV2FUd2RH?=
 =?utf-8?B?N2xLOXVrTEZRMFJJVURuUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkxQV21BWGV1MTlRSUJwaUd5WXFjWk9UYlNMSDZLUG1WTnRNY3lNVlVYOFhi?=
 =?utf-8?B?Qm9OVC9QamRoUlgxa3F6eVltTVhuaCtIdVRlanRic2xnbGtkVXVUeVB6UndU?=
 =?utf-8?B?by9qVTJGa2FiME0wWlpwMEE0dnY5MFF4R2kwSnlWYXlRKzVCbndVUjk4cUNC?=
 =?utf-8?B?Z0EyZi9ES2JwNnVjM20za1JHc05XNlMybU9ydm1WcHhLWEFiSGhXdzNDZWZC?=
 =?utf-8?B?VTlWZS85NmUwV05KK0d5K0Y0VjR0OG1tTjRaSngyR3ZORGFpZE1KaVI3RnZP?=
 =?utf-8?B?RWJ6QXRnUkFuTEsrYzZIaUpqMDJsK1R3WGNPQnRCWFZLa1dHOWlYZWpjeTNX?=
 =?utf-8?B?T2drWm0zMjUxQkdPK2JIRmlMaUE3dWc3MGliV1RJbmJseS81ZEVROUo4QlpX?=
 =?utf-8?B?amNQVlcyLzA5T0prdFh2bTBqVnBiRjdTMXM1OWdmY1Y1dDc1UTNqS3Y5RUFY?=
 =?utf-8?B?dHVSa0tBNnJIOGlyZFJmMTM3ME5VWUdCcEN3Tm16UGhpemIrVmNKTHYxTkhS?=
 =?utf-8?B?UVZvM3RKbVdaeW1TVkl4cFd6b1N3cHFoZUVlYUZNejRiakxjbVM1TlgyeUNt?=
 =?utf-8?B?VWRnSDE3ZGU2RlhENmZOQmI0U003VlNYYWJRMjI3blVHZzhLRzhzSVhvQWt3?=
 =?utf-8?B?ZkpYWVdYOFZtcURxMm82dTJ0OU1kMURpWW1IMldxR3lPd3piZTB3QUtGRHZK?=
 =?utf-8?B?b1Zkek53RU5KTTBMN1NWTDVkNHUzR0h5Y3htUVJZeUxwZis0ODBMU1pneGJL?=
 =?utf-8?B?aFRCMldCc3Jsam5rend6ZXpKZnNWaXNFTHE1cUVqMVBINGRxVE5zNDcrYTZI?=
 =?utf-8?B?VkNPYU9PcjQ4M0lXOWQ4VmRobGxscUNGNnFTemxzV0pDcVhMT0NEM1FSSTRK?=
 =?utf-8?B?eGVEVzV3UzVNMUVNcmRYZkRJRFlJbmtzdUE1c3hFQ3lwSHdUbjRiZW9NQ0FO?=
 =?utf-8?B?RURsZGlDL3l4S1kzM1BrSzRwYnl5ckFaUnB0MWlrVk9TOC9wTkNDWTR1YThO?=
 =?utf-8?B?TG55amc4aUM3OU5DSmxLVzN0R3VKSG9sMi9VdHdxWU5ybXhoM2xjSmNMRmly?=
 =?utf-8?B?SXQxZW1lSGZ5WEdnS2NiTEVCMjliSTJGSzFqN3RjNExuR09DWVFHQVJvY2lB?=
 =?utf-8?B?bEgzQzF2a3FmeFk5VnZzRWJ6b1hSMm9kT3BsLzlRcTZ4NEVIZEIzclFyNGN1?=
 =?utf-8?B?Vm94SWxOZDdPVkhjNkdSdUF3VUhWU09JeE13c2Nqb3MxYVE5TkFVTW5HK1NK?=
 =?utf-8?B?TkEyMkEzbWljOXVTWkxZSk55SFZJc201OHQxY1UraXpoRVdjNDRRTnpmQS9M?=
 =?utf-8?B?VytnUGdVcXE0c3NZbXZmbEUyU0xtdldRSXlIQkxQTmp0MUU2R09DUjdBbEtk?=
 =?utf-8?B?VGRNcjFHbjJkYm9NaGIwQXpJK1dJYWJudGQwemlJMTBuc25SckYzQmhDQks3?=
 =?utf-8?B?dnJMMXBZeXY5dThTWlpYaXJ2Vlk3ejIvbU5pL1MyblVPQXdOUnVaUnRtMGM1?=
 =?utf-8?B?TFVBNDZBZUNFREhxdEYvWFE4d2NQaWlRbHIxTExTWEc0Q1ZUaFNKSTFBamRW?=
 =?utf-8?B?MXpCbS9WQm5Xa21ORE1Sdm9tR2dXUUtTNUw3UzFtR1VFZFFhaXFJYXBXeFpI?=
 =?utf-8?B?b3lCd3pGREVBU3A3VVJzVEY3LzNPY09HSjdzeVViUjduM2grU0JDOEhlRFNq?=
 =?utf-8?B?MFBVN0R6SmtpdU1WMTl2Q1Nac0EwMm4xRHJLRnBtcjdBZi8zckhWZmFEOVpL?=
 =?utf-8?B?MmZpRWxYbktBU2ZOeUtlTDlJU2M4Q1IrK0tFVGdVK2RaYUM2ZWx3WnJTUE8w?=
 =?utf-8?B?QVZpRlBud3pkeWVHZkdvY0FBUHo1Und6RUY3YWg3ZGRXQVo5bm0xN21YVFRQ?=
 =?utf-8?B?ZVpSL3YrUzhzMjd6QktwMnhYLzJscnlpMEQrMTFjdm5WTU94ZUVlYTBUdHgy?=
 =?utf-8?B?WkFsL0RNVHkwdk42bXU5V2lyNnYrdllMWW1HOG9DUkt2OElwTys0c1RaWThP?=
 =?utf-8?B?U05OSGUxQ0p1UFhuUHAzYnBhemxpbThPUmJYUC9jaGFjc3ZudFoxNllxeEhH?=
 =?utf-8?B?OGlLamJoQUZoY2hnNCtqaXczVWFTY1ZKWVpQaHRMcG5DOHVTRHZPV3UzZ0pZ?=
 =?utf-8?Q?p1XbYmtipB+xEuRsI7x68YFsb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12399f8d-47bc-42d8-a643-08dcbcd56beb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 02:53:20.6247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4SxjH3rohQMobz7LB0nMf74/EXieH+zkQoSaP7UWBC3SIX4gIoCNRwbHDpLQLxfiG+c1cNoVz/HzViknAiVwTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10319
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

On 08/15/2024, Frank Li wrote:
> Add property panel-timing: true to allow use 'panel-timing', which defined
> in panel-common.yaml.
> 
> Fix below warning:
> arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: panel-lvds: 'panel-timing' does not match any of the regexes: 'pinctrl-[0-9]+'
>         from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-ports.yaml#
> 
> Suggested-by: Liu Ying <victor.liu@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change from v2 to v3
> - move it after enable-gpios: true' to sort the referenced properties
> alphabetically
> 
> Change from v1 to v2
> - add panel-timing instead of change to unevaluatedProperties
> ---
>  .../bindings/display/panel/panel-simple-lvds-dual-ports.yaml     | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
> index e78160d1aa24c..bf6a2e5bb9d2e 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
> @@ -86,6 +86,7 @@ properties:
>  
>    backlight: true
>    enable-gpios: true
> +  panel-timing: true
>    power-supply: true
>  
>  additionalProperties: false

Reviewed-by: Liu Ying <victor.liu@nxp.com>

Thanks.

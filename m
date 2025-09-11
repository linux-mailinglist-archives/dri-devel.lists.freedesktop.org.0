Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6EFB530C1
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 13:37:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D57010EABA;
	Thu, 11 Sep 2025 11:37:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="IDO2a+ws";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010016.outbound.protection.outlook.com [52.101.84.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC89110EABA
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 11:37:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yyY74arM0U+o6QburdcqtN4sy4ul2/A3n/QLLZShkXnLrB5EUuTK5dtNmwpk7BmwDDqJWia1DRABrMEkV0CncId2dc5vLb/0E6v5+9kxVExUNLyb7294mJ1Id8rbamRk9+mbMsuSbrW9yHjPc4Vw8aPyFJyK+NHh/3e7shN9fo4WS+lsf43Yh2TP+hrGtxk1r0kBvU2zFjJL6oYqZrgtz3QZFSDAmseIWDdZUF3/OK0hVbyOmsFlNw95XoSD13gOCKraIQMldbN2lidjqIOHqkprE8u6hfqPq31d+xS/GLDOq57wwDmpsvQiDWfj1SOIo7ZmIRBCGK7QJNi0ThGMtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OOhpEuCCsNUzM9wWMw0XFDbqtdUXyM6vS4/g0OVDEt8=;
 b=Ej7djl1i9Hd7pA3fRnr+O2kUFROCOMBv66nZmXDo520FBwwvcMvsVIOyw5PNCM9LPos/GtXgBf+P6OD+nCkS0bVIzb2ZgIMOjYdsxRmskxkea9DiDz+yxZ61waezPD701f5UMPkl3spYew7B9b/GI4H38qqwV2W+qDUSMLAUlym4JPVsp5RTAK3fURjZFMtECCLI0VlftYYLflTeK1Nigni7t0MzeK2drJEbzPTNHtPst07Qw2LzhpE3qxZeWzQXapeymmT6awQRQ1XLxTMfjAwM9KmCIIgWCVeB54+oH/I0ygDkNSigqZygoTt4hSP3UrDbhCPcYVnWhs0K3x9DYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OOhpEuCCsNUzM9wWMw0XFDbqtdUXyM6vS4/g0OVDEt8=;
 b=IDO2a+wsQhzh7Fzmag7U4ufGm968daTu2cmipDCk8LdTEm19pttUEWrZGlJ48U+M1ChzK8QfPw8yHgvA3zfOrglHS7kKXLVcEQnRuGMRiGWbl1dA/rzk5P/19YnITwYlQP/LLY4GXH5a56h0twpdVBxUDABuaZXJZnR3Zv1+jn23C5U4sMSOiL+JvXrM050Ai42zU9tvU1du7iyXNxRk5A7FO6XHWM4en2uIrYmcVZs8oFD8y+p39wyRGIz1f2PqpNph8t8UFYPhSlvdd/yvLAZEyuX2B0ixbrWXM3RMhWOMT/6jF3aqx4ZWpwBadO5jP2u+GclfcP65H+Mw6TepUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by DB9PR04MB9961.eurprd04.prod.outlook.com (2603:10a6:10:4ee::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.14; Thu, 11 Sep
 2025 11:37:31 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442%5]) with mapi id 15.20.9115.010; Thu, 11 Sep 2025
 11:37:30 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/9] Add support for i.MX94 DCIF
Date: Thu, 11 Sep 2025 14:37:00 +0300
Message-Id: <20250911-dcif-upstreaming-v5-0-a1e8dab8ae40@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250911-dcif-upstreaming-3e16d89c3385
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR04CA0108.eurprd04.prod.outlook.com
 (2603:10a6:208:be::49) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|DB9PR04MB9961:EE_
X-MS-Office365-Filtering-Correlation-Id: 7afff23f-116a-41bf-88a0-08ddf1279753
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|19092799006|376014|1800799024|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGFNVGRVT1d6ZjdZSUgrNU0rdm1yRVh4UExxWHpXZmw3QUF3RUdRSFl2Z0di?=
 =?utf-8?B?NDlvY3FtZ0cxbVloUGxlVDFSTENycGpqanpuUElUNnZVanRlcWtUUFhVQUF3?=
 =?utf-8?B?Mzd3bDA4SmtSNTl6Q3JGR3pwYW4xdDJPWTd6SEV0WWUxN1dTODhtejJuQXJt?=
 =?utf-8?B?cG1ObXVuWFFCTXdWRzlSdDRZNUozeTgzOE9WbEV1cXVDc3Jsc3RKbkpTRWFm?=
 =?utf-8?B?Zkt0N0dPLzlnaDBySTJWWm0ya1dOVXk3Uzk0c0VPVjdGVjZydE1YZDJrU09p?=
 =?utf-8?B?NGg0aVZESmI5WGNZYWd4dWNMSWdBaXM3ZGFFYnd3ekJkQ3FXS2hVUmYzanpV?=
 =?utf-8?B?Qit6bEhBblExd2JvenU0Y2JzMUNFaG42aHBxbzB4bjFScmovWjRVOGcyRDZX?=
 =?utf-8?B?c09vNFBuWk4rTHA4bmJ3am5zL2RDWUEvT0VxQVdkNVJ1Zkwxd0tjTndQZkQy?=
 =?utf-8?B?OGRIbmRHV1BnVWVIaERHOXloYlBHLy9UV20xWElWcUsyNlVYRkZXT1pWVU05?=
 =?utf-8?B?dzFpNGNjZmpFS0kyS29CbTJ0Tit5Y1hveXFwQlZicjVaQTZSRzZoM09JYWsv?=
 =?utf-8?B?K3RWbWVXQkEwNmE0cUhzcit3ZkVlOC9DYkpaRG04VFFnZndpcWQyS3NMZ1dM?=
 =?utf-8?B?YWdpbnNEdEsxZFVVQlBlcDQ0NlM1SHVBQkNBL3hneHBFYTRjbkxmVFY4ZVov?=
 =?utf-8?B?bVB0cHc5cGNpdjE4V3VhdmlML0ZQeVhrckZxSEVlQ0Q5UWdFTXplK3drUXhy?=
 =?utf-8?B?UnptOG1PNVdlWDZwR2dXK0Y1a29sZ3NGN08rTmtBUmV1OXhSSmk3VHZXWDVa?=
 =?utf-8?B?b0JtZ3k0ZWtSTUh6SHozdThjMWsrVVkvRzgybUJIZW1XT3dIclpHejhCNDhQ?=
 =?utf-8?B?MVBYeHZMb1BuZHJ0b0w2ZlZjdERnRU1QZTFFWG04WUF5V09oVGhBWTlPSFE5?=
 =?utf-8?B?RmRmb1F3ajdva3pMSXZjVGhKWmdZMzV3WVowK245SXlHRzlyemY2ODM2bkUw?=
 =?utf-8?B?ME5yak45dU8vQWM0Q2Z3UFB6QUxMN2doWThqcWNsNEVCL3h0STNudDkwMWpW?=
 =?utf-8?B?dWV4QjkyL0dJT05wcmxOMXpLbjgvaTZEdWdTdVR4YkZ6OGxEbFJrSnU1TXFR?=
 =?utf-8?B?Z3pQbFQ2cGhCTGlLSjZJbHAvOHJBWU9BT0Z0U2pLanBNMEtIOWsyaFVJdExP?=
 =?utf-8?B?cHpKcDhJaXcxVEcyUkUyZE5sOGNob0trM3ltTDc1ZkNDUmJPQU5QMGZpbWNq?=
 =?utf-8?B?U1orMG9YVm5zc3EvSlRkVGg2cnM4WHBMenMvbDhQTTRPUW12SGhKVmZ5TjFJ?=
 =?utf-8?B?STY0aksyTlRIVHVTZDlJdlRGTG1aeThmcUxOeWRFNE93a3RqY1IyQTBEL0pI?=
 =?utf-8?B?cXhjY2RZOFlHRUFVSmlMN1V3eHFtb1V0bVMyQ2xkMTYyR0Y1OU0xNGpHbXN6?=
 =?utf-8?B?TjFVWHlCcWpMa3BsdFBQeU4yUlNkVEM5VnJ4MVhUVHRBOWNYRUovUXl2Wkpy?=
 =?utf-8?B?TVNwR0JoYyttcC9CczNRWm92NnlqSE13ajRwRW5rT2xza2xkbFhkWGNZOWE3?=
 =?utf-8?B?bVNkWjA0ZHVqVjRBV1V1SThpR3pxbWV1cGZlMXZJMStJU09UbUpucUtrY1ZS?=
 =?utf-8?B?WUVPaXNTV2ZCaEpFYktSb2Z2UDNRWi9xaEhpWk1MVFl6OHIrendSMXcrVURW?=
 =?utf-8?B?aUUyVGUwUERaWnhXcTNuaDVzU1BUYVhmakxNQmZsQ1VGRC84NDdJZEhwT2Ex?=
 =?utf-8?B?NDVqUHdmNE9ZWnU1aE9SU3VvOWdTSUJOMkZIRWtGWWpzSVNMREVEVWFFclVW?=
 =?utf-8?B?WjcwQ1JBampBNVB0NENRZlg2SlNRTjJTbXZ2Qm1ybFIwQWFjcy9RdDR4S0Mw?=
 =?utf-8?B?S0NTOXg1c2RqWWNVY1lZTGU1SGs1OFlaRjRVOWU5R0phY2ZZb3lpbTB3T2o4?=
 =?utf-8?Q?T1uCP1q15VI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR04MB9135.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aE5rNUJBNVBxOVBEZDlteldUS0s5TUM4T2ZOeVg1NEdyRTVhMlZuUnl5OXR4?=
 =?utf-8?B?bGgveVVReTdOWkhNUkxLdEpFZjBVM1JDRFkzN2Q1RmhIV2ZwU1NoN1BVRmJy?=
 =?utf-8?B?N2ZSNXY5OFpsdWE2MFlNbFlZWmJWQVZpVldjcjlhcXIxQ2FDalVUaXcyckxy?=
 =?utf-8?B?dGVyNW1La0VvM01Zd1ZINjNlYmVkNEVrWjZxbTMzM1JZRHp5ZW5ESXY1djRy?=
 =?utf-8?B?d2hkOFBFaUdvNjNmZDN1a2RFRDdwMFhRV010dFEzRjh3N1dROW1OSWx2dm1h?=
 =?utf-8?B?SDhFYmhoMmVULzVXVmVZeGZnZVpObHFKYVdEY3VsZndITHJUZUkyK0Vaemhl?=
 =?utf-8?B?K2tLaTZFR0lPU0RZL0xVT0tKWWV2b3ludkhxRkhvcnhpQzlZaWloV0QrU3Nz?=
 =?utf-8?B?TmhIWDgxVlRHeFc1WjhxOXlLdGYxcGFEWVJLVUlrRzFWTklCRHZ3ekM5RVFU?=
 =?utf-8?B?OEExaENkOFpTTlZNd09HVm1qdmpXRTF4NGhtTlhyWEttNk40M0dRWTZsSlpY?=
 =?utf-8?B?ZkcrSGtPV3oxTTllODlNZ3FETVlUajV6cHhqNEhjOS90MmtaWElYb1JxcWpv?=
 =?utf-8?B?ajVBQzdxNFJMUWV5b1o0Q0lBWG0yQUxERDBNKzRla1Bsc0lGWmRoVkJQMzZj?=
 =?utf-8?B?cTBtejBVU0NTbmNBbGcxVmNtUzQ3MEZ1T0Z0WDZCWm9mR3l4dGxOTFFaVmNS?=
 =?utf-8?B?cDhGbVdoTjZzTW9Lek1qMHdPYVI5Qmt2dEZ4aFg4b2w4dHd6Z05BUVJLaUs3?=
 =?utf-8?B?eEh5L0xHTUQ3UFFvOGk1WG9VVXQwTTJaM0xHc01OMGErdzJ0YVVTN2JXY2wz?=
 =?utf-8?B?U2V1YmlMRE5pN1J5MXlpUmhGbExlVVhmcUhYOU1oa080eFQrYmJYLzJXYUhI?=
 =?utf-8?B?aUF4WGNHb1Z3RUdYaytBZC9lQzhGbTNNektaWU5oWldQV2NvekgzR0xTOFhn?=
 =?utf-8?B?dHozUjdyWHhlSjBGdTNpUjZDK1pUU0g4aTlTeXAwV2tQbzVQdnVNMzBVMUdP?=
 =?utf-8?B?Z0ZWMUxoSlh1STNGL2gwSWh0SDdDMlhvVU93alpwUUwzV1JuYU5BWm8xMnhx?=
 =?utf-8?B?Q2d1TkJ6V3BSMmV2K0d4OUFiTEUzOS96RWlqMEdIOU1qd0w0SHVqQXdKbmxo?=
 =?utf-8?B?RmtvMXdVS0Z3dEN3TXhrQzVBajRhSVVKMWVKamQrVUNkMGprVFlQWVpocFd5?=
 =?utf-8?B?NWhoaHVaOFFOWG9NWFBqazZrYVJlUk9lcU9maElqZXdsMEluVTdvTmZncVdT?=
 =?utf-8?B?UmE2SWxpNHVHSXNVNTQ5MEcrcTZ4RTJGcExBaVFURFR6dnZ3Q3YzMmRvdHFN?=
 =?utf-8?B?WU9XWXNpQTdVOFNwWS8wNHVoNHlxRVRzd3ZIcGQwVGNydjZLLy9tYVlXVVM0?=
 =?utf-8?B?ZXVjWGx2QXFxYVdNc3VhRERscDZYUjB6QURPaFJER1BITWg2TzZOMStwL2o3?=
 =?utf-8?B?dlZyU0tKYWRWSUdrZThCaC9LUnZHVEYxSVB1ZDd2aCt2bU1QK2N3cGgxeEt3?=
 =?utf-8?B?UzVOb0hDNlhjcURrZGdDN3hBMUdJaW1kdmhranhtS1NqdUZZeVFLZnZROE8y?=
 =?utf-8?B?WEZEalBLeWM3L3VYZm1aUDdYMlRCSlJITCt5TGorekh6UWxMNTZiZjZiOUJn?=
 =?utf-8?B?bGgwUis4cTdQdloxR1J1ZWcvUG9qQkt0aVVibDNsYjFXVWJ1Y1VKWDhqVmx0?=
 =?utf-8?B?cTMvYXMvVHNDOGJYUFo2Z1c1TlVaZDQyRnNrOXNJY0ZxdSttbC9mVXQvL25I?=
 =?utf-8?B?bEhDTU1VL21rQTZaQkhWRjFXalVENDc1VzZod3Q0bldnbUdaQlg4cUR3QWNx?=
 =?utf-8?B?SkdLSC82WHZYYTVMTU1tV01uNVphVVpndld0SW9Xem9jWWRHT3daNGhUT2NX?=
 =?utf-8?B?OHZNYklRSTFCUzF4U0xieDdibkwzUEsrZ05pR1hXb1p3Vi81Qk45Wk9zcUhI?=
 =?utf-8?B?ZFQ1TThBenNJcU1FL1dRbDNoS3MrMDlVbkxRL0VFQVN3M2xXSFJwMEh5dFFJ?=
 =?utf-8?B?MHlwT1kzRi9yQnhWWlNjUFZVRE9lV29ma2RWR0N6ZWpTUi84eXdkVjRrTFEx?=
 =?utf-8?B?dlYzUnIzaGl3SW9mNEIrRXlEV3ZqcWRtQjJ2cEd4dVB1UjhWemN0RXgwQ3dn?=
 =?utf-8?B?dG9KNDNtZzBYdU1rYmN5aEowak5nT1hkaXlvTDN3dU9vMFduS0gybSt1VkJT?=
 =?utf-8?B?OHc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7afff23f-116a-41bf-88a0-08ddf1279753
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 11:37:30.5765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i3dvn8xZmP/B6ZfR6hzNj4SiKsgIzKzegMo/XB5muiW2XdUc79RwNSWiJdT5CB6JOVbcXuo4hi1Qef7gsVIrpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9961
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

Hi,

This patch-set adds support for the i.MX94 Display Control Interface.
It depends on Peng Fan's DTS patch [1] that was not yet merged. Also, it
needs the BLK CTL changes [2] that I spinned off from v2 in a different
patchset.

Also, included in the patch-set are a few extra patches that the DCIF
driver depends on for functioning properly:
 * 1/9 - 3/9 : add support for i.MX94 to fsl-ldb driver. It also
               contains a patch (2/9) from Liu Ying that was already reviewed
               and was part of another patch-set ([3]), but was never merged;

Thanks,
Laurentiu

[1] https://lkml.org/lkml/2025/7/7/84
[2] https://www.spinics.net/lists/kernel/msg5791546.html
[3] https://lkml.org/lkml/2024/11/14/262

---
Changes in v5:
- 4/9: Removed "bindings for" from the title, changed the port
  definition and simplified the example;
- 6/9: Fixed the way 'ldb' child node is declared: declare the
  'ldb' child node out of if:then: block and set the property
  to false for compatibles other than nxp,imx94-lvds-csr;
- Link to v4: https://lore.kernel.org/r/20250903123332.2569241-1-laurentiu.palcu@oss.nxp.com

Changes in v4:
- Addressed remaining DCIF driver comments from Frank;
- Limit the 'ldb' child node only to CSRs compatible with 'nxp,imx94-lvds-csr'
  in the binding file. Since LVDS CSRs are a minority, I chose to
  use the if:then: construct instead of if:not:then:;
- Remove the '#address-cells' and '#size-cells' from the ldb node, in
  imx94.dtsi, as they're not needed;
- Link to v3: https://lore.kernel.org/r/20250806150521.2174797-1-laurentiu.palcu@oss.nxp.com

Changes in v3:
- Removed the BLK CTL patches and created a separate patch set [2] for them;
- Collected r-b tags for 1/9, 2/9, 3/9 and 9/9;
- Removed the DCIF QoS functionality until I find a better way to
  implement it through syscon. QoS functionality will be added in
  subsequent patches. Also, used devm_clk_bulk_get_all() and used
  dev_err_probe() as suggested;
- Addressed Frank's and Krzysztof's comments on the DCIF bindings;
- Addressed Frank's comments on dtsi and dts files;
- Added a new binding patch, 6/9, for adding 'ldb' optional property to
  nxp,imx95-blk-ctl.yaml;
- Link to v2: https://lore.kernel.org/r/20250716081519.3400158-1-laurentiu.palcu@oss.nxp.com

Changes in v2:
- reworked the BLK_CTL patch and split in 2 to make it easier for
  review;
- split the dts and dtsi patch in 2 separate ones;
- addressed Frank's comments in DCIF driver;
- addressed Rob's comments for the bindings files;
- addressed a couple of checkpatch issues;
- Link to v1: https://lore.kernel.org/r/20250709122332.2874632-1-laurentiu.palcu@oss.nxp.com

---
Laurentiu Palcu (7):
      dt-bindings: display: fsl,ldb: Add i.MX94 LDB
      drm/bridge: fsl-ldb: Add support for i.MX94
      dt-bindings: display: imx: Add i.MX94 DCIF
      dt-bindings: clock: nxp,imx95-blk-ctl: Add ldb child node
      arm64: dts: imx943: Add display pipeline nodes
      arm64: dts: imx943-evk: Add display support using IT6263
      MAINTAINERS: Add entry for i.MX94 DCIF driver

Liu Ying (1):
      drm/bridge: fsl-ldb: Get the next non-panel bridge

Sandor Yu (1):
      drm/imx: Add support for i.MX94 DCIF

 .../bindings/clock/nxp,imx95-blk-ctl.yaml          |  26 +
 .../bindings/display/bridge/fsl,ldb.yaml           |   2 +
 .../bindings/display/imx/nxp,imx94-dcif.yaml       |  82 +++
 MAINTAINERS                                        |   9 +
 arch/arm64/boot/dts/freescale/imx943-evk.dts       | 121 ++++
 arch/arm64/boot/dts/freescale/imx943.dtsi          |  53 +-
 drivers/gpu/drm/bridge/fsl-ldb.c                   |  47 +-
 drivers/gpu/drm/imx/Kconfig                        |   1 +
 drivers/gpu/drm/imx/Makefile                       |   1 +
 drivers/gpu/drm/imx/dcif/Kconfig                   |  15 +
 drivers/gpu/drm/imx/dcif/Makefile                  |   5 +
 drivers/gpu/drm/imx/dcif/dcif-crc.c                | 211 +++++++
 drivers/gpu/drm/imx/dcif/dcif-crc.h                |  52 ++
 drivers/gpu/drm/imx/dcif/dcif-crtc.c               | 695 +++++++++++++++++++++
 drivers/gpu/drm/imx/dcif/dcif-drv.c                | 226 +++++++
 drivers/gpu/drm/imx/dcif/dcif-drv.h                |  86 +++
 drivers/gpu/drm/imx/dcif/dcif-kms.c                | 100 +++
 drivers/gpu/drm/imx/dcif/dcif-plane.c              | 269 ++++++++
 drivers/gpu/drm/imx/dcif/dcif-reg.h                | 267 ++++++++
 19 files changed, 2246 insertions(+), 22 deletions(-)
---
base-commit: 0c73257677576a103139866657ffea304020ff74
change-id: 20250911-dcif-upstreaming-3e16d89c3385
prerequisite-patch-id: b2acaaf7e92a5c8e377e6b56f3a9ee7409f64b00
prerequisite-message-id: 20250804131450.3918846-1-laurentiu.palcu@oss.nxp.com
prerequisite-patch-id: 74ddb42797e7438bcfca4f3157a81b1164c65ea4
prerequisite-patch-id: 087fb2ec68d73c4474cd5b850c299e38a2d58eaf

Best regards,
-- 
Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

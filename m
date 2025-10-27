Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 118BEC0C6B4
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 09:48:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C54CB10E3CA;
	Mon, 27 Oct 2025 08:48:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="fsOIFMTw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013041.outbound.protection.outlook.com
 [52.101.83.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A057110E3C8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 08:48:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zwbep589tfpIOFH09yKO3JFClTu8D+aJTQHbXVFttUvCnzuDAkgd+rnXpP9wpG19TXBw75PGWz2fqMmkkA0GEVvFpZbtX/z5+1unQe6+G+i0inGxjl3FnXXlfc4vtNUvlDHS0bWPR/ycTeLXA7JQdoriByQSfVVk6vxVrM9ihk7gyWRNxI/9c8Ic5wTyFq1KPOFcFMSUcr369bhMi/LfDPrrvFOlf9YDGRLxM8M9a9CMNV1/PpmMOgCtaprwqLg4lpDcw0CmFrFNYW1Qcgjt+RFqe77XhgdldbghIysXeN/oedChII+Tw3dnj3/Fzj/Md5iRxU7Vv89yHMPB8MSdmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LTXXlP3QIRYMAKI1fdpP+lKIhFDFQ+qnBBWBxQuAtLc=;
 b=Asnp2Hsc785MelTbUmJls14tDG4CBpC6oR/WaD0O2NyfnpYaIUvKXsW4W1z+tGBe5FMR8JigXile7+JpL3qZuxRF0dfUOd1GR2av9yo6oiDhdDZh3NY5TNCxLr/VH8SFCgQyvkVre43RA74/vwUE1bqoaP5uo8zUp42ZkFZDb0X8T9Fl8c7KwpjDGQqsmEBlz0wr4OLDC5Mof+LrxRsiHFpNj02q18xD47gF0sTYp+x+gknL1t+hM3XHWzy4F1si8IZX5PFByhj0eDiJ8l90B41EyUxCHJR4g+R9tZjeCUk3y3XYxF3d0a9JKU6W8QjiiusT/oo/YsjlqPPZ/0Jgng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LTXXlP3QIRYMAKI1fdpP+lKIhFDFQ+qnBBWBxQuAtLc=;
 b=fsOIFMTwsrG/IVgdJ7Q0y4YRselTDo9au3nJxKq8Ckf4+IlamobFJNycpELFOlbUxtMj7rMPQX3g2s/2OvlmkpAW35nClFGF0wkWGEg46a+riheEDn+JkTbPkHNu5vSRERMomdoHMR/K+3BmiXB36wBsayPFgK7uj9c3xi/kuDEzeTPXUI5lNUqY+V3ztL1gEtKZUAXwIa4d9iK1A28Oj7SHdaNk+RPX1pvXb9DyYwHGySwWVvLyIn+kjMOj3i92HT+PmQ7Zb8qu1npCJNZtf1DJNUoX9eAJC59AC2F9kAhQM9jXmcsSaC8oHXkQFCnrU6otRtsdoupdswYvACN6Ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB8432.eurprd04.prod.outlook.com (2603:10a6:10:243::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 08:48:04 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 08:48:03 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Mon, 27 Oct 2025 16:47:02 +0800
Subject: [PATCH v5 12/13] drm/imx: dc-fu: Get DPR channel
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-imx8-dc-prefetch-v5-12-4ecb6c6d4941@nxp.com>
References: <20251027-imx8-dc-prefetch-v5-0-4ecb6c6d4941@nxp.com>
In-Reply-To: <20251027-imx8-dc-prefetch-v5-0-4ecb6c6d4941@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@mailbox.org>, 
 Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:196::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB9PR04MB8432:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f9aa55a-97ca-4fd0-2755-08de15358aa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|376014|7416014|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wng5cGx4OVBhUis4eTVpeWJBcnUvSDVBeWplY2gwa0pFUGl3Z3ZtMEZUckY4?=
 =?utf-8?B?U3djSzU0K1VGbTF0dUs0NDV5OTJoRnRCeGFsejkrWFNlNENLeHZQNDViZlJQ?=
 =?utf-8?B?VGhpNnVEdG1PdEVGUkZndFZyRENKOHFuL3FNVXl6SjVLZU5lbU9pMGRVOFF3?=
 =?utf-8?B?c0xsZUZwbVllNXRMaWw0cXN3aGk2aHZuS1JSTmZSM1ZCNDY5aWtDU2o4c095?=
 =?utf-8?B?Uk9pc2tTb2hRdWFLckg4KzlkQTBTRUt5SXhvUU5OZDVZVGpPbXl5TzEyWXYw?=
 =?utf-8?B?Qm9Wc2JsVTVmZTR0eXNYNHlCQk5BRFB2Nk5TQS95ZGVBSXhqKzFPOGl2TGdP?=
 =?utf-8?B?V0hsNGR6a3YyVkxBWnRFNWdCRHcwVUt5THFQY2h0ZDZtbVJhcHgzR3ZKaW1M?=
 =?utf-8?B?L0JTRktnNlcwdFhZNTBzYXkrTXM3THJPTnlUdE5nMEsxekdGSmZlbVVGTURS?=
 =?utf-8?B?bHI4OGU3T1E2b29BOEZLMnB2ZSsrV21nbTNkcXhYbDlucm5WTjFNUit3Kysz?=
 =?utf-8?B?Q3FwUURuUUV0d2pIYmFwWVhZT0svY2VjT0x0WlBXSWFubW5WYncrRUlRaE1V?=
 =?utf-8?B?VVozMjdybE1VaW5UUXd2ZlFkU2orcEEwdUJ1bG9NYWxwd3N4UnlQMTJLcjhI?=
 =?utf-8?B?TU90T21MYTN2citJSHRkTWUvQTFtNnZuYk42SXRXM1JUZnVxT1BzMDZ3MUJp?=
 =?utf-8?B?SHVzdTgyUEcxeEg2UGpnY1FiWTdocmZTbHozcTg3RCtWbld2bEEwZnFxK2Nh?=
 =?utf-8?B?KzJQNFRuNXRZRGFub3M0ZE4zR0l6TDgyaXJlVUVuNzE4K1F6Q05hcGh6QzVW?=
 =?utf-8?B?a2dlc05SZHd2UHg0alNhNmxXNHc3OTQvZmFFNEdrU2wwTXJyMXlhaDdNYW94?=
 =?utf-8?B?OWVLQnI2c3pjUVFBVUdSaFVxaHdiQ0FvbndrZnUrTHFFbkhoZjNZQnpvWjNG?=
 =?utf-8?B?ZjhaeisxL3gvbGlYdFRPaVd0Y2IvRTY4N1lsVStiMnhHamtYU01hdi9QR2kv?=
 =?utf-8?B?SGhSSGMvQmEvV3lIejhsb292OWJQaWlTSG1KbWo0ajhwTitqdWxNUUw0NUdz?=
 =?utf-8?B?NjM2RWVTSHVWcEYxTjNXbW5nemJYM0x6dExIc0lrdTU5bHZtS0gyM1RuT2Qw?=
 =?utf-8?B?T1RSZktCcnRNWnJybDFHT21wNWhCRUo0ZFF6M3dEZ1FoL1dMd091blJZOWs5?=
 =?utf-8?B?WXRueVlFVUMzREY1NytYNmhTc0VGYkFGQ3pMRWEzRXpKV2pXUFZWMkM2QS85?=
 =?utf-8?B?RU51eG1jOTNxT1cxaC9DUktBeG1ndE0zUjNCZmNDcnVDN3Z5K2hJTFFOS3FJ?=
 =?utf-8?B?TmltZjNDL2lOWjJiMkRsZzV3Uld1ZFV1bk5GWmNKZWxZRHlwZk1MZ0xuRGNR?=
 =?utf-8?B?dXFsdmw3czdzS2k2MWxZMnpFTUlwZHRGQktuTEdNdFZsQXY0emtUazg0bFlx?=
 =?utf-8?B?ektDYW0zQUs3L1dJOXc3bERFY3ZyK1ltSEVyanJhcXkvQmkzN2lSTGltTmkw?=
 =?utf-8?B?TlM4MTdGTlB4aFVUeUtOWmpBb05YaG9kVHg0RS9jYkwyOStLV1JhUVlDZllW?=
 =?utf-8?B?T25xMUVibzNPQjRlTmJkMnZGV2lxN2kzNGc2TUUrK285WDBERkg5a200YVJV?=
 =?utf-8?B?eWpRTGdUWUZnWGRKZFQxV0RpTmQva3lOakQyTng4NUtrWDc5cXhwcTBobmVk?=
 =?utf-8?B?V0xZbmFMazNWSDhxUlBMR2tKZWV6d2RPb1BTdHBPRFNSZlh4Tm82TktpSHRp?=
 =?utf-8?B?N280SElhbmNvZWN2SHZlYmZxckdDWnVUeTg5aENzRGJwdjZpK0VkRWJPZ1Zo?=
 =?utf-8?B?V2pqTmcyby9Udy9RWVdlN0ZRNUxkMFlMRzAxd0htV01WUVRmLzBhb3MvYXk4?=
 =?utf-8?B?Z2RtTnBWdWt0ZWFPL1EyS0N1eDhRRGRNUWgzZ0tUTkhwWFJUMS9YUkRUVjhs?=
 =?utf-8?B?TXVyYXdacnRja3hCZWgvczNHcjNISkx2dGw4UThpN0NWVXZxQm9adDFBVHVT?=
 =?utf-8?B?Syt3SEFGZTRqWWRISVFRNlVLNFVYeXI0Uk1NQXE4Mkx3eEhvZEEyODdtYi9n?=
 =?utf-8?B?cXUrR09CL0NlYmsvdnBvbUNzYkNCaC9DWHJMZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1c5OHRIVVJzclEyT2IwZkFKWnJRVEtFb2crZnltYW1NVWw1dnFNVnN6dyt1?=
 =?utf-8?B?OVdEcUMxdlJIZEJmWmVCVktLVUttSHRUdmJvS3BhNGJQWTFTZmh4Z2ZkRy9i?=
 =?utf-8?B?NGpmZE4vbVhlWTZDbGVjSUlPUmFLZnEwSTdVVmhWV3pnUWx6TTl0S0JnZDhi?=
 =?utf-8?B?dnY5a1ZZTGtxTzBkQXQyTTk5aFZ1WklRSkxDMzVtRitCR2h3UUZqVTVXQndG?=
 =?utf-8?B?ZmlUeFkvd0llSzdSRTl0OFlBcyszMVFVYy9Ub3M4dWlnTDlVUFJTZVJBSkpC?=
 =?utf-8?B?ZVdMTFlqNWhUSGVGYnlrVXpvQjhZaSt0L3lyRlAwdVcvckF4Z1dwakM1dXd5?=
 =?utf-8?B?RFRLSDNHRnY1VThieTArT3AvaGU2VjBFTkFFbjNZT0RkUHg4d2d3UWU5Rk40?=
 =?utf-8?B?RnlXNXFteWthOUZKcXNUYTk1RUROcG5RNXJ1ZlVoR0IyMXRqYjhPaGUzc3Uz?=
 =?utf-8?B?ZGcranhOaXJQR1FkWi9OdXA4U1k4ckxGTXFtamZxbE5tdWtzYWZJN3c0RWd1?=
 =?utf-8?B?SENLbmthUS9jdTFTR2Y1RWdHZXZ0dytUaFNKd0hibVdWM3I0VDU1SGVBV1M0?=
 =?utf-8?B?dGJHM1hYdzhYSDQwR2xjWWxTT0tRcGltMDBlYVhzRjE0YzNEV2o0aUY5dWpX?=
 =?utf-8?B?am1lM3hCYU5JajNEOEpEcE1GYkdFVVZHai9uU2dqWVVUbEhRQnFQT3E1TFJT?=
 =?utf-8?B?N1QrYlo1UDgyRndLZ1d0ZGlXOEJscDRKR2lYS3lQbHBBUzJXOEMrbldlTmg3?=
 =?utf-8?B?S3MvZ2MwQjRkMFpsM1Z5NzFmcmhrem50ZEFnMm03YW1uOWwxaTRwQktYR09Z?=
 =?utf-8?B?NnZ0SUJKOXFxa0xiWXNiUE51Sk56SHdoQWJYMFVnYUlUTjIxQmdlNWE5elFR?=
 =?utf-8?B?b0VaV3d4aDVlSkpWQ2QrN0NYR284eWxzT2QzZ1VIcFEzOHdTTll0L2dGcUFM?=
 =?utf-8?B?MW5GM3RMcktWS1ZtaHoyVHIwdnIveDN2WUdPUWNvYkJlZytlWEpyb05oWUFB?=
 =?utf-8?B?THRvU3krb1FtR3E0YWVuWFBvdHM1ai81RHNSY1JLVmhENHlsbUZLU2tXM0ZD?=
 =?utf-8?B?a2c2cm84U1k4cUNPOUNmdVZJemNIcFBIOUwzQk95cEJDYndLWnBXcTBna0Fr?=
 =?utf-8?B?d0Ira3lsQ0J3cGEwOEJ4Q0dJQU9NdEhOMzQyUzVDYWtuTzNaYjl0VmpRNGkz?=
 =?utf-8?B?c0l6MU44RTFzbEluQzV4Q3J0bzlpTnY0Zk1iOHlQQTUrUkpWaWNQRUJMOHQ0?=
 =?utf-8?B?Y0dXZjlpeDVsNkNLVzJWQXYzTjlrTjlEd3B0bHNwSUI5b3FWTncrbFBDTGc0?=
 =?utf-8?B?OEZjN0ovR1NUSFJIRm9MdjYxQzJ5dDlVbS9PTzRQNHcyRXBEQjhWWmFoY0xB?=
 =?utf-8?B?ZlZMNENNWFlFVmxrSnlOSmJDL1V4NlljR2tyM0ZWUXJZdGhsQ3A3NGFWdW9D?=
 =?utf-8?B?aC95VEpYa1dXdHVkS0pDdmk0LzNub2hjMjltQjFZYXV3M25zS1pnbU9XWGNt?=
 =?utf-8?B?NERDMFJYNndzakxoUG5kaDNkUURINnRTeHhrbnlRd3lya2srVTdEUldpeEVK?=
 =?utf-8?B?RFc1UWlHQ0JnR255cnhBVEhnMWc4NTB2NlVRM2tGM3RlZmp4WXBFK3FQMGdG?=
 =?utf-8?B?WXVKdWxodUYvZk5PVVZUQjdUUTFmTFBxbExYcVZYUkRpclliMkdFSERaVlR1?=
 =?utf-8?B?c0xaeEtXWnNXS1dvZnhZc0Q3LzBoZ2M4MGlDaGE2ZGd3dklSaDhrZGRHUjVo?=
 =?utf-8?B?WWptb3I4U1I2SU5FVHRVQlBNcHZ6MEtlcjBQWVliRmFzRnBkeVRLUHJ3UUFC?=
 =?utf-8?B?YytlejhMUXBXMTFVYzJjZ2ZjR2FzeWtpQkdOMUdtYXdzV0YxaFBZYXVJYno2?=
 =?utf-8?B?NVRiTXlwTTFwdktQT3RKTXlwcXRtNFdyaFRTWUhhcW9MS0pqRlVIZkdRL1VL?=
 =?utf-8?B?K2ZsN1VpaWxNaWJkbzRMbHJoaytHaVI3WUlTVmpla25YMkR3eTh4RGVpVXlu?=
 =?utf-8?B?Yy8wcmNGckJ1bFlRN1AxcHVGYVlPeUlhWkQ3ZWN0V0huUnFBVm5VOTZwcnl6?=
 =?utf-8?B?ZnJPZzQ4dDNlR3A5NDNGdDZzQ2FvN0dkYVpqSHlZeHVZdGNIa250ZVlrOEpw?=
 =?utf-8?Q?37EZuro/lSX48wSYPLL3JOZVN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f9aa55a-97ca-4fd0-2755-08de15358aa6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 08:48:03.8900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2jxGGmCGmVIJZiiBxTEwkBrXJwOQ3drIz14/hHVbMi5CIZzmNW12kEGzafpwdgvt+o19p0d3HIMcTABrBqlqvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8432
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

Add a helper dc_fu_get_dprc() to get DPR channel for FetchUnit.
And, call it from dc_{fl,fw)_bind() to get DPR channels for
FetchLayer and FetchWarp.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2:
- Collect Frank's R-b tag.
---
 drivers/gpu/drm/imx/dc/dc-fl.c |  7 ++++++-
 drivers/gpu/drm/imx/dc/dc-fu.c | 18 ++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-fu.h |  5 +++++
 drivers/gpu/drm/imx/dc/dc-fw.c |  7 ++++++-
 4 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-fl.c b/drivers/gpu/drm/imx/dc/dc-fl.c
index 3ce24c72aa13e8aa150c0152a5a1ea3d0fa90b7e..a1835f43da0dc5cf0c83d93f16658b485011e285 100644
--- a/drivers/gpu/drm/imx/dc/dc-fl.c
+++ b/drivers/gpu/drm/imx/dc/dc-fl.c
@@ -101,13 +101,18 @@ static int dc_fl_bind(struct device *dev, struct device *master, void *data)
 	void __iomem *base_cfg;
 	struct dc_fl *fl;
 	struct dc_fu *fu;
-	int i, id;
+	int ret, i, id;
 
 	fl = devm_kzalloc(dev, sizeof(*fl), GFP_KERNEL);
 	if (!fl)
 		return -ENOMEM;
 
 	fu = &fl->fu;
+	fu->dev = dev;
+
+	ret = dc_fu_get_dprc(fu);
+	if (ret)
+		return ret;
 
 	res_pec = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 
diff --git a/drivers/gpu/drm/imx/dc/dc-fu.c b/drivers/gpu/drm/imx/dc/dc-fu.c
index 2e197b3344bd12491c1f7bab0e5304190ed84356..8339f44c0091918c796c478d968e0640391781d9 100644
--- a/drivers/gpu/drm/imx/dc/dc-fu.c
+++ b/drivers/gpu/drm/imx/dc/dc-fu.c
@@ -10,6 +10,7 @@
 
 #include "dc-fu.h"
 #include "dc-pe.h"
+#include "dc-prg.h"
 
 /* STATICCONTROL */
 #define SHDLDREQSTICKY_MASK		GENMASK(31, 24)
@@ -256,3 +257,20 @@ void dc_fu_common_hw_init(struct dc_fu *fu)
 		dc_fu_set_pixel_blend_mode(fu, i);
 	}
 }
+
+int dc_fu_get_dprc(struct dc_fu *fu)
+{
+	struct dc_prg *prg;
+
+	prg = dc_prg_lookup_by_phandle(fu->dev, "fsl,prg", 0);
+	if (!prg)
+		return dev_err_probe(fu->dev, -EPROBE_DEFER,
+				     "failed to lookup PRG\n");
+
+	fu->dprc = dc_prg_get_dprc(prg);
+	if (!fu->dprc)
+		return dev_err_probe(fu->dev, -EPROBE_DEFER,
+				     "failed to get DPR channel\n");
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/imx/dc/dc-fu.h b/drivers/gpu/drm/imx/dc/dc-fu.h
index cc93317e300134a0f8c378a155fb7c67dc6689d5..9fbd7aadd26426d797e89a954e7e4cfa3e597b62 100644
--- a/drivers/gpu/drm/imx/dc/dc-fu.h
+++ b/drivers/gpu/drm/imx/dc/dc-fu.h
@@ -8,11 +8,13 @@
 
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/device.h>
 #include <linux/regmap.h>
 #include <linux/types.h>
 
 #include <drm/drm_fourcc.h>
 
+#include "dc-dprc.h"
 #include "dc-pe.h"
 
 #define FRAC_OFFSET			0x28
@@ -99,6 +101,7 @@ struct dc_fu_ops {
 };
 
 struct dc_fu {
+	struct device *dev;
 	struct regmap *reg_pec;
 	struct regmap *reg_cfg;
 	char name[21];
@@ -114,6 +117,7 @@ struct dc_fu {
 	enum dc_link_id link_id;
 	struct dc_fu_ops ops;
 	struct dc_lb *lb;
+	struct dc_dprc *dprc;
 };
 
 extern const struct dc_fu_ops dc_fu_common_ops;
@@ -123,6 +127,7 @@ void dc_fu_get_pixel_format_shifts(struct dc_fu *fu, u32 format, u32 *shifts);
 void dc_fu_shdldreq_sticky(struct dc_fu *fu, u8 layer_mask);
 void dc_fu_set_src_bpp(struct dc_fu *fu, enum dc_fu_frac frac, unsigned int bpp);
 void dc_fu_common_hw_init(struct dc_fu *fu);
+int dc_fu_get_dprc(struct dc_fu *fu);
 
 const struct dc_fu_ops *dc_fu_get_ops(struct dc_fu *fu);
 
diff --git a/drivers/gpu/drm/imx/dc/dc-fw.c b/drivers/gpu/drm/imx/dc/dc-fw.c
index acb2d4d9e2ecd6d36dbab050f25b560d9ec9aba5..c2e60741bc871c6976ead53f132b60f19352aab3 100644
--- a/drivers/gpu/drm/imx/dc/dc-fw.c
+++ b/drivers/gpu/drm/imx/dc/dc-fw.c
@@ -131,13 +131,18 @@ static int dc_fw_bind(struct device *dev, struct device *master, void *data)
 	void __iomem *base_cfg;
 	struct dc_fw *fw;
 	struct dc_fu *fu;
-	int i, id;
+	int ret, i, id;
 
 	fw = devm_kzalloc(dev, sizeof(*fw), GFP_KERNEL);
 	if (!fw)
 		return -ENOMEM;
 
 	fu = &fw->fu;
+	fu->dev = dev;
+
+	ret = dc_fu_get_dprc(fu);
+	if (ret)
+		return ret;
 
 	base_pec = devm_platform_get_and_ioremap_resource(pdev, 0, &res_pec);
 	if (IS_ERR(base_pec))

-- 
2.34.1


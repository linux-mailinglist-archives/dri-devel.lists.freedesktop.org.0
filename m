Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03496AF8D42
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 11:03:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C84510E9A9;
	Fri,  4 Jul 2025 09:03:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="B30q7qZj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012007.outbound.protection.outlook.com [52.101.66.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89CB310E9B0
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 09:03:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LdjE9U6FLRQMs+z9RJ1z8y/UBEhpRUQYL/UvBYu5zcNz2r7Cat63v6J/BCFCK4qhiX8RMiND5QaCCLOsdc8+c4y8iMSkwh5+dA2E+qMg8eT3++9LVjfOq5KakhKo+w2WprJ+DZMDvHqL5uct7Ysn5tbwMC5s6UXz9CqDwq/yFPO8n/NZCXkTkT7PBDffYFwbELdXzz6NRXaRaGjLVmNaE98FG3fvvBBpFswsL4suwjmLBPNwqCee4muU5i+ATy9EODRNmPt0Nak6Z9incaKSJeb0+ECMNWBnlaUyG/eSFca07UFQP1djaqbbPHvZ2FBx/ke/4tmB2bVi0qgGZ5hkGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=22o5WVTKBD6sRAtxjBg/sHqwuoSMqlIfhKv30d8ePyg=;
 b=yHm5YbxjsN2ltH1hc/11GJqgS7yFye3bIUdvKpriwdv0hEKjXMnXccgKahunTPukKGR0lrS7tnTv1YowycQ6MRJh9QYYqFBKY5VRHPEK6s6UppwQUizbF8yBiLbXViVRqEfvzZc2xEefcfQw5OgvfIQqx9Dr/2gpufp9enmPsuIncGYRB8Oh7Szo3S0ScL+pW//AEX6fFrPzFHzhQxXvuS9tEqi9H+e4pKWyqDktSJjVvLUYsdISeqw1IqaU88zNMbaNR+CS9h+xVpNBaK2L8PMlBa4egfZm8SuekwRgGd3qaaZkM4DPyiXassFud0kiGgCJyZcGrLmhrbKxrQj32A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=22o5WVTKBD6sRAtxjBg/sHqwuoSMqlIfhKv30d8ePyg=;
 b=B30q7qZjv4EJ01hlAAUpeo7iRdQtl/9f7M3xnLfJwNTkXqn1T9EPN4GJWMEJqRIGq39fpUnIepSRKoI6L626OLgfO7xw70rhJihKqv7k16HtUuzZ4g0RCK8FeHfj5o/j0nKE8NyCj8Fm67Kv78MK3d2O8QWUfc+JWduAhMpXpLWiTK5wzs6I6YIoEHo3Fr7EC812ZnopyTDTiqdcJjoVF7CphcwYDIBFfRCQFDcpu/oPyqJ/Zzb5WYu/cm91iJLYXRh1fyWn+djP/YY/1I+IZkDtgk8vVSrPWlJRSeetK7b75fHyAc3IsbBibpVJc6GbGMQXbL+dTwzJTE8WypbdRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS4PR04MB9289.eurprd04.prod.outlook.com (2603:10a6:20b:4e4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Fri, 4 Jul
 2025 09:02:58 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 09:02:58 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Fri, 04 Jul 2025 17:03:48 +0800
Subject: [PATCH 01/14] dt-bindings: display: imx: Add i.MX8qxp/qm PRG binding
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-imx8-dc-prefetch-v1-1-784c03fd645f@nxp.com>
References: <20250704-imx8-dc-prefetch-v1-0-784c03fd645f@nxp.com>
In-Reply-To: <20250704-imx8-dc-prefetch-v1-0-784c03fd645f@nxp.com>
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
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MA0PR01CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::16) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS4PR04MB9289:EE_
X-MS-Office365-Filtering-Correlation-Id: 77869aad-9d9c-4574-9121-08ddbad99256
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|19092799006|7416014|376014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWZ4VVl6WDE0K3EzcWR1ZGpMbHorbTVGL01IUG9hdGFLUHh3MkFYZWNaQUV2?=
 =?utf-8?B?UnJ3cDY0L2NoRkxUS3FSVndYWExZaTdESFlma3NPbEs1Zlc5cUt5V1o5SXdj?=
 =?utf-8?B?RXFOa1hmMDVnUHhSVTcyYWNmK2ZaV3N2S29ucHk5ODIvSnBVV0xiYytjdjJY?=
 =?utf-8?B?a3p6VUJLZnFPOFB6d0g1WTh0S2dBbHdhY29iSU5ESkZGdno0bmc5WE1ZQlIw?=
 =?utf-8?B?QzdUQjQ1TklkYkk4bGk3SW5Pd3dwbmtOc1pXQVdoWFdmSGdiY1pFU1g0cDl3?=
 =?utf-8?B?WHlRUjgrT3JWdzFxd0RiZVNpRU1UZUZlUm51NGE5VHdHMGRORHhGSVprNkdj?=
 =?utf-8?B?TjhmS3VHSzdFbU9JUzQ1eHdVenVHcGNjTGdpUWJPM2hHb0YzaGoxc0ZKaVdP?=
 =?utf-8?B?a2Z0MTlEZXdzZ1M0aFc5SkJIbDBweDZTT0ZPWkVMT0xVVzQrVStLQ09jUGZq?=
 =?utf-8?B?MXl2ZUtQcFJqM1VBMzdCZHVTUzNKQVgraGtEbkxjTnNEZ1RBTUErZDFRZlVi?=
 =?utf-8?B?TityRDBPa2pjVVBDdEUzUFo0Y3krNFFvWEU3VHArWWVUOGI4c3BIa0RXeWdq?=
 =?utf-8?B?SWhEU0JCaU0yU1hsTTBtbjhCcGErR3ovSmtteTJJRmRGN3NEOTZXN3ljSnVI?=
 =?utf-8?B?bFd2UFJlZUZVRjJnbzk2dFQ0WDJJajAwRkRMbWl2bXJYaC8vYVFMbXVIWWg3?=
 =?utf-8?B?VVY4SDRnVlBHV0xaY29GWHpIL1lVbmdscHROWmZra2p2SXZNSUlObjlmYmJm?=
 =?utf-8?B?TWJpdmppYkJoa3p4N3I4UTNCUEFMOWxKSGRpWmxvSXMxcnBaZUhRRnlHZWRC?=
 =?utf-8?B?akRLa0xpYW1EeThWYVRBMzdqTzdid0JNS045K1diSHlDR0pmUTIvNXVzYUR6?=
 =?utf-8?B?eFp5NDJienp1NWM3Vnd2NmE3MVBudjBoNVJVQ3RlaGpDT2t6VTlrcmlSSVRX?=
 =?utf-8?B?WHg4TFZ4bkN6aCszSU9sVysrR1pDZTIwWTUvWTJlaDRMMGhKdkY4ZHFoZlZG?=
 =?utf-8?B?V3VmYjduR0V1V3Z0TWhhUkQ1RnZuOTQzcEZKcVNYemk0Mk41bWU1bmhIVGxP?=
 =?utf-8?B?cFpsbVcyVldTcnA3MzMwT0k5cFNpYytBOThVLzJQTlh3ak5sU2IrUzZyV0xw?=
 =?utf-8?B?TnFiSFBISXpzdlNIZG5SaS9jQVp4Y3IvYXR5N1JpWHNIeEpFU1lzRFFqc3Jj?=
 =?utf-8?B?d3VYNXo2Z3IrdW40VmFvT2t0UXZMTElmMTBmSDZIZDhPbE1pa0RTZFZyd0I0?=
 =?utf-8?B?ZUhCR3lrZXhmY2sxcEd0UnRkTkhtM3FkYmxWTlZSSDRwditScXJIc2RJRzhN?=
 =?utf-8?B?RExLK2ZyWUVNVFhXRVBhNm9VMWxtV0tkRW1wQytlRTRRMEFmTjU2TWJFMFBs?=
 =?utf-8?B?bDhGM0phQTZsblZVZzBvN2RMZ202cGR6WlN2VXBTaG9OVGZFMWhPYkU0RmVj?=
 =?utf-8?B?T3Mxb3dOdkpueXkxOCthb1ZDOEV6aXVMNFlHNlpuN3V5S0ZFbmkyd3VDSHQw?=
 =?utf-8?B?Q1lNVVhieEFCa08rWVBXaldBRnViMzE0SUR0QU9UMkpjZkFJelZtTG1uTEdy?=
 =?utf-8?B?eTRHdUdRYXgva09TSkRhc3l3bk9IQW4zU1BXcUJUWC9URWJSdllsRmxqS0wr?=
 =?utf-8?B?aVpJY0srM0UvaW1qVURHNVppVFNuakVVNTNua1RCQ3RINnkwZmNQSXBFTDlD?=
 =?utf-8?B?T29uZzhnYzlrRzNvYlFoK25xaU1aT0RDd3JWYUpiek92K2Y0SzVoOUNxY1Z6?=
 =?utf-8?B?VVBSRlJKMjY0Ky9CM0daTFRibmhDeUs1TWROdEFJKzlOaDVUMG85dVdWM0xT?=
 =?utf-8?B?bVFmeHgzalhNQ3lUcms3ZVh2S0twdDNPa2JtcHJ4VGtsbGFiV1AzRDdDNWli?=
 =?utf-8?B?WnlWRVZjWmZhS2NXTGdnTkdSRTg3U29jSDVPYXhIWXAwLzJIYXhkSURrVmtM?=
 =?utf-8?Q?YyQseVXG3Y/zmxhLfpHvysqDeoWQFay9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(52116014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTRyS09ncHdXYnA3T3pXdVZtUjF2TkxLSmRINkRpVHduUlZDQ2RweDN1U3lY?=
 =?utf-8?B?ZmtSUUtnNzhlaHpYRmVLaGNCQ05xVUhKMG1Panc0RjVRVHJwQ3E1SXhOZ2Qz?=
 =?utf-8?B?ZzBUQklUMjVsK3VQS1lnTEE5dmZxUTdYVmlKeWFGYzVyMU9xUlFIM05sN2R0?=
 =?utf-8?B?RFEyNXRjdlJyRkdQT25wU3VuOFkrQ2ludXIvQUVFendIZHFkR1VaM2hSTTRo?=
 =?utf-8?B?Q082MExaUzZjSnAvckUxVjNPRUtKY044TWNVcWhrb09ucTlEMUQwekxjQXdu?=
 =?utf-8?B?WGFadlFoaGtIUUZsUzdPK3FQcjBrTUFLWFFVZlU1czRKL1FidVZOZ21jMnRU?=
 =?utf-8?B?RFNIc2JyRGhVdUZiTG1VZUhHcGlVWlhMOTV3R1FUR3ozbFZGNmJnc3MvR25u?=
 =?utf-8?B?VnlNUmx4dDFhR1J2dVhvQlEzOStUdk45K3pRbWR0QU1wVFhjbWUrZjlIUyti?=
 =?utf-8?B?aXo2M01Od3pOc0lidXR4WEY0cG5YNERJR0QyL3pNajg5elBzUEE3QWpCTHFM?=
 =?utf-8?B?d3NEQm94dTdhYTNyMVZRQWg3bjE0YURvZitYVXdyZnkzdjhwSTNqSU9JTkVv?=
 =?utf-8?B?U2oyc3ZuczFiNmZGNU5GQmZpSzNoRlFBVStyeks4cWFzZTBSTVo5b3Y0UCth?=
 =?utf-8?B?K01GbVY3M1B5djlVMUdacWxhVlh5ZDVvV3pFQUcvQ1Q1WGxaMW0velJlenFa?=
 =?utf-8?B?K2s4Q05tRjZnMDByZkova3dBNWFHblk0dEpHeUY5UW1INm1FVzVLZmliUTVY?=
 =?utf-8?B?amxCZ2VJUmZobnE2cGtlZitWelNyUVloZ0JMT0xUbjc3VlM2L3JlZ0hwY2dB?=
 =?utf-8?B?eERFQXByRW9Od00xaDJSSmQzd3hyY3l4Um84c2xQelFleFJpS0xmcnY5ZUdn?=
 =?utf-8?B?N2N3R25wNXI3QmRpcWFxUUh1MzVuNTRHaHVDMXFmdjVVQ0hoOWl5TDEzbkZv?=
 =?utf-8?B?R0VldmFsU3pSNjF6aDJ5ZnF1SnR6cWYrbXZuTDd6SFFEeGN6UENoZlp4UUN0?=
 =?utf-8?B?V2I3dU0vTi8vYjhxSC95UVl4Lzc1dWdsZTVFSVE1RXVKc2w2VFRmTlcyYko2?=
 =?utf-8?B?dFUwb1ZtcGw3MFIxcjdIZCtzTzIwanJlcjVvaWk1c05KY1llQTh6YXNCSFRZ?=
 =?utf-8?B?WE15ZkRheWl0b293TWIweGhaVitBR0IwMU9QYW9jUEY2dHo1aW0wOFpDZkFx?=
 =?utf-8?B?NVUxSVkyc0tURFR1TWpqR0x1TE1KUGdOVnNwOFBXQUpNYkNldkdqMEwwVW54?=
 =?utf-8?B?b3BYNVY4Z2xRTCtwWUR6RmdOdmFhVlAvYmVNM1Y1NFF6WWE2VUtCY3JoenQ1?=
 =?utf-8?B?RGh0bkM5SmhyZmY5ZDdXWXhVSDlZbWI5R1ExUFVpUWlLaTQ3NkRGRmprK0pz?=
 =?utf-8?B?V2M4cFlyVzJsWVlaSHdtSnRYYk1yVHFjM1d1ajBhQ2VWaE1zaWpxc28rUWl4?=
 =?utf-8?B?R2NhZFpWbFlDaXVBS3JBY3dCa0JjZTZhKzdDNnFFNUIrTnZZcVFyRTl4ZEJs?=
 =?utf-8?B?eVVXNkFhSW9HTjNQUjFOTFR1a0ZJaGRsVW1FRVJqTmF4ZW5wZXhQSFVoakJ2?=
 =?utf-8?B?N0lHMSsrSU9CRmNmcmxmOHZ1REFCeXZmeGh5RzVGQll0UUtkdHowT0tseUli?=
 =?utf-8?B?am5VRW1waEh2MG55eUpOZmxkeERMVTNjSk1qY0ZIdm9PT2pqTjVTMkZnMHdG?=
 =?utf-8?B?UWVTNTNtZDNWT211UXYrMHA3eDBrNDlOaFBncUZKU1cwV0cySlliN0paN2w5?=
 =?utf-8?B?b3ZCdVBKdjFra0dwWDZtS3B3eEFHK0pRb25aaE1LZ2I0NmViNHJMSkF0Nnc4?=
 =?utf-8?B?QzE4am5iaVlKQzJsWUZ2TkxlZExiMHltNVBqNEgrZTJNM2J4UHY5NFc2QzlC?=
 =?utf-8?B?WTQ3MWp4b0ZrTEJ5aHN4UFRpRThuRjROTGt3bzFaRkx2aWNmL0QwUCtZaDZC?=
 =?utf-8?B?czRZSzR0OFd6ZXpOczBxTDN5ZEgyWEFWdm04QlkxTkNMdSs3OWZFTndTWGpU?=
 =?utf-8?B?cUg4UUQ0Q0pINHlpVUY0RzZBL2ovRVVuU0dXKzZBNWN0VkJSZyttRGYzd3hB?=
 =?utf-8?B?R1BvdFhiVnR2Zk50aTd0d3JFMDQva3Y5bndNM2ltckVFYVpWc0ZCeG1jbHp4?=
 =?utf-8?Q?86PT9p0nKWxF8nv2KUby0dQcM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77869aad-9d9c-4574-9121-08ddbad99256
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:02:58.4708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0363q1nnibaa7XLT49r3i3/+itrE4eap85F4C/5wkK3CeeeLQLmQLwkZODKPQxVSRj+gBU1AObw36YR2pz4IOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9289
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

Add bindings for i.MX8qxp/qm Display Prefetch Resolve Gasket.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Changed commit message to use imperative mood.
---
 .../bindings/display/imx/fsl,imx8qxp-prg.yaml      | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..3ff46e0d4e73488f8a3ed538830570b1ec71b50c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-prg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qm/qxp Display Prefetch Resolve Gasket
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description: |
+  The i.MX8qm/qxp Prefetch Resolve Gasket (PRG) is a gasket interface between
+  RTRAM controller and Display Controller.  The main function is to convert
+  the AXI interface to the RTRAM interface, which includes re-mapping the
+  ARADDR to a RTRAM address.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qxp-prg
+      - fsl,imx8qm-prg
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: rtram clock
+      - description: apb clock
+
+  clock-names:
+    items:
+      - const: rtram
+      - const: apb
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+    prg@56040000 {
+        compatible = "fsl,imx8qxp-prg";
+        reg = <0x56040000 0x10000>;
+        clocks = <&dc0_prg0_lpcg IMX_LPCG_CLK_0>,
+                 <&dc0_prg0_lpcg IMX_LPCG_CLK_4>;
+        clock-names = "rtram", "apb";
+        power-domains = <&pd IMX_SC_R_DC_0>;
+    };

-- 
2.34.1


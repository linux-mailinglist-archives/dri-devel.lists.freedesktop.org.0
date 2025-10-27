Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E305C0C68B
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 09:47:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF0510E3AB;
	Mon, 27 Oct 2025 08:47:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="adEVeqYq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013040.outbound.protection.outlook.com
 [40.107.162.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9790410E3A1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 08:47:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PbJclnm7TJtfSI7MNfaRJOK6cLM82lfyqMFwNemL96vyalbPGsf/hEomv06DpqGL5YCAk6kdaLml/5NWPbJ7R+kMK9uyfXXpoUVpI03Q6j03xlTNOcBNZNynIBi9H2ERxFd7bQRYwWuyB3hWdaUrFfnIEEIL47f2cxXFDcLobYLsK3BF/6xuKAPELafNENTF18MBKY9I2/qiguFwsn5dc6WBkTprPtbZhnPQhC5gDeYP5cPh27Z4vCIyRrhk3/Qt7CDNKM77QQMOYEGURtoFGDbQ98xTS4g2oip8e3aM0rlZZRmRAvjIrjfxG30KE3hRk9c6VNSI+gn/N0Ykw6jxcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oS6TF+u7c4xshNYyYM7oDUlz9q0Nj4rpnMipVL4m8cg=;
 b=dbolrDUyGyjexIkRtQ/q0SYbZxJrbYVDmZPeRxPymZdch65ucWN9zt2upR5+uEoiMkR+pOBA5U9+Nlq+vPAUDvxnAaNmPGn6Oxa9fndx9WZ9ryIiC5SUF+BvYVMvW8JCJjjT0/1VBIbN2lzYbZdyma53ORpY3VEgJfADOOXMyWIs8Ysdrc1WSnNf3mjnsFkhA0IDgOlvMNlG5FvGY263/PRN1225sbauufCRyEOR+bfOMVhSWabiA1P8D7z/69AGwt8z68PXciGwXG9I6rNxB0WkwW9ntMkXdGKh4Ns2yq6r8J1PMxc9OQHkWRBI27KdpUMjhelZ8sRAijtEWGjpbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oS6TF+u7c4xshNYyYM7oDUlz9q0Nj4rpnMipVL4m8cg=;
 b=adEVeqYquKxz+IiposqIUViWMmr1A+2UnuMo1q6YXXBh2Ii7dwGjPSSP/6X/2uOUYykZOyszts7xDuz3hfmU6kKMRsWLsEJx+Jjcv76KHvIa5HGEWWPlj51DEBbEPHNHwhiUnfomVI63bHKZ2IAriTsZgafo419UPCWLmGhqM/wGLLlqgOlCOl0AZ7XBAj0fraqZKdJfFbzqgiy8m1PF3/+com/fI1BdWwS1vkP8LWTgu+R/RmEHBSXSNUQvY9dovzTJV6agijDHklF5LCOmRAWzEPYlHFDETFQtEDAXP0r96FVlaraDgCV/AIK0yI7aD3h6adm/V14xKup45Whmgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8739.eurprd04.prod.outlook.com (2603:10a6:20b:42c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 08:47:26 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 08:47:26 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Mon, 27 Oct 2025 16:46:56 +0800
Subject: [PATCH v5 06/13] drm/imx: dc: Add DPR channel support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-imx8-dc-prefetch-v5-6-4ecb6c6d4941@nxp.com>
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
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8739:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d7c12ab-0a73-4628-27f5-08de15357425
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|1800799024|52116014|7416014|376014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWJETGxEL0VsRng4Qm5UTVlHNjhMOWUySVQyU0h6QnY5MW9iZlRReHZlZndP?=
 =?utf-8?B?VWdzNkdJZnM1RkFDdWxzUk44UFJPa2U5b1VPRERzQ1hSeFp4bVlJazhnY3M5?=
 =?utf-8?B?RTlhdktSRWpJalNYNFJac0FzaGw1U3hqRjFXTlZ0MmdBQy9nU2lpY1M3VHNx?=
 =?utf-8?B?ZlRjbWpQclVzdGMrZjhvZUljZVRLWmlTL2ROWHZYd0s2R1l0OUVrN0hLcE1l?=
 =?utf-8?B?MU1Ja3Nqd25EbXBZK3R4R2I3dGpmMnY4cEY0ZzUxckhEYmFJQ0RFdFJ5amNN?=
 =?utf-8?B?Y1l1dmdjNUs4YXc5aHUxK2poYU5tcFl6ZE9Wam10TkJiV1V1Y0N0WXNmSnhW?=
 =?utf-8?B?N3VWeHEvMVZzN1I2Z1BaOVlleVd0S2ZuU1JvK0RwYWFLN0JENDZDdFcrK2RJ?=
 =?utf-8?B?Ym1QQWRzdzNtbytLWlJLdFBWRmlnTFJZOVIrVHVnRVJEbGdiSTRzU1ZHTW5S?=
 =?utf-8?B?UWxZTEJKLzVlRWdhbHhVaEZIaEZRSWxTbWlKTkZWcjJVcUNHVXd0RC9lb2ZG?=
 =?utf-8?B?Rm14NnZ2QW1SQkM5MXd0Z29CVFVXdG1rMkF2Y0R2TnB6bnJNaU1pT3hPcGxk?=
 =?utf-8?B?OWJ3ckVzbndkSS9YVXhnWWRKOVNTa3pnOE8ydFFHWFI3aFl3ZmNlU2kzYzE3?=
 =?utf-8?B?UUN1ZVV5cnJkM0JIMCttY2tsWkZicTVMRUJuVHYyZzZRSHlicStrZytnM0c5?=
 =?utf-8?B?RWpEVGJDS0ZQOUhZY0E2STN4eVIyTldJSnZqd0w2cEVlRzQydGw5YndqOXFJ?=
 =?utf-8?B?WitnNmp4eXI0YUQvRy94cy9TRWt5a04wckdQTVE2UFp4ZzJ5dHlHZGw3QnNL?=
 =?utf-8?B?eDZmdTBUOHlhQktGOHJBQk9wT2xMYklnNU53MExjMU9NakkyN3o1VmNqWEQz?=
 =?utf-8?B?ejczRUhLYW5tWnNDanJ5VHpQc1k2UmxSdmJodmFHVVRJaC9YVTFlWDQvV2tM?=
 =?utf-8?B?d1FjNDh5REdGY09tN0x2S0VqN3dPL2JHVFJ6cUpiQjZNWjlrd1BHclpGN2ds?=
 =?utf-8?B?NDVoVGE1ZE9ZWHdvZkNBanFkdFpRYjhzcG5GL1BXK21oOCtxR0pvSWk2Q2Nt?=
 =?utf-8?B?Njg2ZEN2bEZtcWFOSlVITUtGQXNweWEyYXA1S0txTU5pWDN4VCsycU1ycU42?=
 =?utf-8?B?emExYVRKWlIwekFGOWFCa0w2bVBHQkJSRTNtY3NpMkRPd0xHQ1RjdmRWOG1F?=
 =?utf-8?B?d0RleThVT1NrdWxqTGIyZmIyOEIxdkRqcUwzRHR5Q0FWSmxqL1JJeDltMGRp?=
 =?utf-8?B?NCs5OWI5V0JoQ0E5eDZNZkhTemdBbGlJUExnTkVZTnFuemlRME9RazQ3ZE4y?=
 =?utf-8?B?akIxSUJDd21SUlpmTXRub0crV0tMWEkzdUM0dXZLNWpTaUdGenRqSXZSWEFU?=
 =?utf-8?B?V0pnbU1VdVZyanY4YWQxeXc2VlJZLzhIMVFhSW4zV2Q0a2tVVm0yU3YwTXhJ?=
 =?utf-8?B?amZlOEZhWkc3U2dxUmRXbi8wMUM0QzczSDYyUys0Wm03R0c2bERwMjZFT1hS?=
 =?utf-8?B?b2VIdHJIWHY2Tmd3djVOaW9vdDFMby9IYjY2VEVGdExWZkdZUGRWSjdFbjBR?=
 =?utf-8?B?Z3Nzb2FCZVc4eHVxb2VzcFJMY0RKWnc0L2xROXhWNkVHSmNxTWpNSFlIaWFl?=
 =?utf-8?B?eGxUV2xhTGtKMHpMRDZYcllxdXNZR0ovdTB3OGpmUE1EY2N0RGZaWEIycjU3?=
 =?utf-8?B?U0E4aXhKalJEUXdCU1I3WTRSZjZNM3NzSTIzWVI1eG90MkVpU09HYzN3L1pV?=
 =?utf-8?B?VnNQWVkvY3BZcWlrczJkSXFYU0lVVTVSRDdRNGF2U2xvY2FSRmFuS3hpa09j?=
 =?utf-8?B?QVZjOHc3WHdVVTNwN09PcWZGODJsaGV1d0dZOHZQZkRCcU1ZZTZIR3hiNUNU?=
 =?utf-8?B?WUZvdVJ4TWRab21BcmZQZ2N2b1VDUjBnaERTdmVpVnhQVnNvejVVeVUzNndG?=
 =?utf-8?B?UnBQcFEvenZ2cGFxU1o0c25TaklXYW1sTlJnMzNHQjAvdFAxQUhISzRoSHov?=
 =?utf-8?B?UDcxcEtGV3I3Um4yMzl0eXArWW1tYjVtaEJ4UTRnaThsTlFqRzJ4VURhOENp?=
 =?utf-8?B?SEpiWjdrWmtBL1dXbml6VFg0Q1BBSWhTdmwrQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(1800799024)(52116014)(7416014)(376014)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHNKZ2N3RkVuRE9wOWRYaGFtRUs4OHd2aDZvc2VJVjlTZmVxaVo0TjBQNytP?=
 =?utf-8?B?ajN5Qk5za1htWE4rRENDbldJVTZTd1FEbDYzSFJZQk16Z3RFR1oxV294RTFW?=
 =?utf-8?B?L1BiT3QxT2RZQzJudFhYS3BzNlh3SEdMRldOcStnU0ZlZ3VJUUM0eVkwZlN1?=
 =?utf-8?B?Yi9PaUdIU0VEMHUvRllJZjljUHRUd2s5RTFJMjdjRGIvOWMwTDdHNFhOWmN3?=
 =?utf-8?B?U3lWV0VDSGNvMVFVcXJmdGJnVHNOUVJWeTlZQWpVaDkrWlRMdERmOGxMMy9F?=
 =?utf-8?B?Y1dLdjhxd3hlRzlRTnlJN2NmUVdCakJjcDhaZnMxWGZ2K01SQzBzMzZjVGVs?=
 =?utf-8?B?V21XQjVkb2RzRmtrOFFnRmR6VTgwanE5UW1jT1Erc3ZOSHBSOXJzQ1hOQito?=
 =?utf-8?B?NWN2N05DZzhWRHNYRHdKK1pLcUxTZzlTODhoWTgybkdGeXI1cFpWZk5IOGs5?=
 =?utf-8?B?N1FFSlQvQ2hCbFFDWFFGZlBsUnpDbk85a1FJdTJDeDZmUHFFV0tmazRJeStC?=
 =?utf-8?B?c1VGcGNJdEl3cGRzODBIZytRNE9GVWRYM1FpY3ZEa1FCNlpsTGVLWFRxaUN2?=
 =?utf-8?B?MHlWZ2RpNXFqUE9td1B3MlRwOE5QWi9VMzdnNmZQd0pRWk9yMFgrWUY4SEdC?=
 =?utf-8?B?Y25LWkNrVHFYbG5uakhBek1uSDRZZE5HOFVUNXJWcjlPZVlHcmo1b2ZLd09V?=
 =?utf-8?B?TVpkRUNiYVBpNDBXblNQZHFJZElzVkRldDhtR0o2TlY2aVdZYWNzN3h0TlJS?=
 =?utf-8?B?U3c2MzJqRXlYTm5LTktNdTNKZVlNcGk1Si9wcGtKa3g4SXQvVFJ3ZUtkeVBu?=
 =?utf-8?B?RTVySGdTYnYwczEweStmYzIzZzBnM3YrWlRZbmNYdldhZDJMRmI0UUYwdWlr?=
 =?utf-8?B?cTJOVUNqSFlhQ2V2TnpKcHZIYlU3SkY0dmwwR3lIamdTUWhZRE9lcWFra2Zv?=
 =?utf-8?B?dDlFR2dpL3FSR0d2ZFMzYkJaMCtBWUJhdmtGVVlzUjlsTkFabjBFemkrTGRG?=
 =?utf-8?B?b3Y1TjJPUWVEVUJQeFNyYVFtM2Vab1QvQjIxcDNFNDgvYlVrOGdTTlI3cDFJ?=
 =?utf-8?B?cHdmcTFWaE9JUHMxRk01bEgrWU4yeXJPRXBWNFhLOERXYlZscDNWeUNlQ1hm?=
 =?utf-8?B?eDRoOUZuM2pISUp2Rmp6Vi93Zlp5SGxLdjY1VGVmclBDY2dkcmlJUEhEZ1pE?=
 =?utf-8?B?K050bjliUnlGVEt3TjczN2RodEZBVFBmUXpCMGZMV0dybC9DVDV1SERUTVNI?=
 =?utf-8?B?enluOCtzMnVmQUhaVkliV2Y5VG1iaHNlUFFEdFZ6U0VNc3dYT2NOdUJNdGVI?=
 =?utf-8?B?dHFQSU5TYVVrMk9JZFlYNDdPY0NnbFhhaml4bWhyQjRGK3F5STJId0RlUXNs?=
 =?utf-8?B?em5TQklqcEF4Nmh0Vmt2MEUvYWR3MXFkRktkdzlDQzRsZjN4MTZ5Z1BFWmE3?=
 =?utf-8?B?LzhtL3VZK3RCSzNORlUrOG1hN3VpV1U2RllIcHB6QittR1dxQmNTQWY3QWlK?=
 =?utf-8?B?VWdnUHFWTHVVY2VHT2R2KzFGWUpubWQxaUFFN2x4ZzUwaWc5OC9tN2J5QTJm?=
 =?utf-8?B?WEJLNDZkeGhHTStjb29IYTVJamRyTTB2TjEvU0o3cDQ3NVFXdVNUaWhXSUZv?=
 =?utf-8?B?UFJXUERLRk43RzNFZ2hhSURwUkNTMk1RQnEzdEpGRFgyRTRUM0tDak0zdnpE?=
 =?utf-8?B?bGIrV3RDKzFMaWJrUGMrNklDd0pSVDhsS3NWL0ZGSSsvSkhaekFZdjYxc2RK?=
 =?utf-8?B?UDR2U1FseUpBRFN2ZUVRY0NROFFWb25UYmJyTXVLYUlHSXJPa1RYdHZyME1t?=
 =?utf-8?B?RTVweG1zRlQrY3lraGdxUDlqbGt3cmdpVm5MeWZYWUp6WTJlMWlxaHVRUHBQ?=
 =?utf-8?B?Qm92WDllaWRhVXZ2YUNkR0FIMnhoL0JLeEtiNUJKWDBKL0JVc0R0Rk1DT21v?=
 =?utf-8?B?dEdtaXNxbHRzT1dYd3YvV256TFNWaGEzOFBMSVcvRGdocXhiTk1McW8yUk9j?=
 =?utf-8?B?VkFQZFpUMzNObEpPVG90RG5NQjNKRnMrNlN3OUlrcm1MZVNJbEpjck9mRmUv?=
 =?utf-8?B?RmF6VnNHRWhEZFlwTWc0b2w2WExIM1Z4dU1hbjRNRjVOR21IdzhjRVdXV2h3?=
 =?utf-8?Q?MeQHddUHekg9X4cv1N+sWqfGA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d7c12ab-0a73-4628-27f5-08de15357425
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 08:47:26.0876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rwcdonC+F/S4tz2b22xAWup/ulNLifA3E77lGLe9wk/7r3Tq/XadT9s8v8RE75ob/tXD/Y/6izM6/9zu+Cz7xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8739
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

Display Prefetch Resolve Channel(DPRC) is a part of a prefetch engine.
It fetches display data, transforms it to linear format and stores it
to DPRC's RTRAM.  PRG, as the other part of a prefetch engine, acts as
a gasket between the RTRAM controller and a FetchUnit.  Add a platform
driver to support the DPRC.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v3:
- Call dc_dprc_enable() only when start == true.  (Frank)
- Collect Frank's R-b tag.

v2:
- Manage clocks with bulk interfaces.  (Frank)
- Sort variables in probe function in reverse Christmas tree fashion.  (Frank)
---
 drivers/gpu/drm/imx/dc/Kconfig   |   1 +
 drivers/gpu/drm/imx/dc/Makefile  |   6 +-
 drivers/gpu/drm/imx/dc/dc-dprc.c | 466 +++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-dprc.h |  35 +++
 drivers/gpu/drm/imx/dc/dc-drv.c  |   1 +
 drivers/gpu/drm/imx/dc/dc-drv.h  |   1 +
 drivers/gpu/drm/imx/dc/dc-prg.c  |  12 +
 drivers/gpu/drm/imx/dc/dc-prg.h  |   4 +
 8 files changed, 523 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/Kconfig b/drivers/gpu/drm/imx/dc/Kconfig
index 415993207f2e3487f09602050fa9284fd0955cc7..507dc9a92d96be225cd9b10968a037dad286b327 100644
--- a/drivers/gpu/drm/imx/dc/Kconfig
+++ b/drivers/gpu/drm/imx/dc/Kconfig
@@ -1,6 +1,7 @@
 config DRM_IMX8_DC
 	tristate "Freescale i.MX8 Display Controller Graphics"
 	depends on DRM && COMMON_CLK && OF && (ARCH_MXC || COMPILE_TEST)
+	depends on IMX_SCU
 	select DRM_CLIENT_SELECTION
 	select DRM_GEM_DMA_HELPER
 	select DRM_KMS_HELPER
diff --git a/drivers/gpu/drm/imx/dc/Makefile b/drivers/gpu/drm/imx/dc/Makefile
index e3a06ee3ce1a5117d0a9a00fdf7655ee31be3caf..fd5d62783971d575cf18d3e27d742d91dee7623e 100644
--- a/drivers/gpu/drm/imx/dc/Makefile
+++ b/drivers/gpu/drm/imx/dc/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
-imx8-dc-drm-objs := dc-cf.o dc-crtc.o dc-de.o dc-drv.o dc-ed.o dc-fg.o dc-fl.o \
-		    dc-fu.o dc-fw.o dc-ic.o dc-kms.o dc-lb.o dc-pe.o dc-prg.o  \
-		    dc-plane.o dc-tc.o
+imx8-dc-drm-objs := dc-cf.o dc-crtc.o dc-de.o dc-dprc.o dc-drv.o dc-ed.o \
+		    dc-fg.o dc-fl.o dc-fu.o dc-fw.o dc-ic.o dc-kms.o dc-lb.o \
+		    dc-pe.o dc-prg.o dc-plane.o dc-tc.o
 
 obj-$(CONFIG_DRM_IMX8_DC) += imx8-dc-drm.o
diff --git a/drivers/gpu/drm/imx/dc/dc-dprc.c b/drivers/gpu/drm/imx/dc/dc-dprc.c
new file mode 100644
index 0000000000000000000000000000000000000000..22fc7d8210dd2bb15fd15bc0f42c2dc2fd7f57dc
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-dprc.c
@@ -0,0 +1,466 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/firmware/imx/svc/misc.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/firmware/imx/rsrc.h>
+
+#include "dc-dprc.h"
+#include "dc-prg.h"
+
+#define SET					0x4
+#define CLR					0x8
+#define TOG					0xc
+
+#define SYSTEM_CTRL0				0x00
+#define  SW_SHADOW_LOAD_SEL			BIT(4)
+#define  SHADOW_LOAD_EN				BIT(3)
+#define  REPEAT_EN				BIT(2)
+#define  SOFT_RESET				BIT(1)
+#define  RUN_EN					BIT(0)	/* self-clearing */
+
+#define IRQ_MASK				0x20
+#define IRQ_MASK_STATUS				0x30
+#define IRQ_NONMASK_STATUS			0x40
+#define  DPR2RTR_FIFO_LOAD_BUF_RDY_UV_ERROR	BIT(7)
+#define  DPR2RTR_FIFO_LOAD_BUF_RDY_YRGB_ERROR	BIT(6)
+#define  DPR2RTR_UV_FIFO_OVFL			BIT(5)
+#define  DPR2RTR_YRGB_FIFO_OVFL			BIT(4)
+#define  IRQ_AXI_READ_ERROR			BIT(3)
+#define  IRQ_DPR_SHADOW_LOADED_MASK		BIT(2)
+#define  IRQ_DPR_RUN				BIT(1)
+#define  IRQ_DPR_CRTL_DONE			BIT(0)
+#define  IRQ_CTRL_MASK				GENMASK(2, 0)
+
+#define MODE_CTRL0				0x50
+#define  A_COMP_SEL(byte)			FIELD_PREP(GENMASK(17, 16), (byte))
+#define  R_COMP_SEL(byte)			FIELD_PREP(GENMASK(15, 14), (byte))
+#define  G_COMP_SEL(byte)			FIELD_PREP(GENMASK(13, 12), (byte))
+#define  B_COMP_SEL(byte)			FIELD_PREP(GENMASK(11, 10), (byte))
+#define  PIX_SIZE_32BIT				FIELD_PREP(GENMASK(7, 6), 0x2)
+#define  LINE4					BIT(1)
+#define  BUF2					0
+
+#define FRAME_CTRL0				0x70
+#define  PITCH(n)				FIELD_PREP(GENMASK(31, 16), (n))
+
+#define FRAME_1P_CTRL0				0x90
+#define FRAME_2P_CTRL0				0xe0
+#define  MAX_BYTES_PREQ_MASK			GENMASK(2, 0)
+#define  BYTE_1K				FIELD_PREP(MAX_BYTES_PREQ_MASK, 0x4)
+
+#define FRAME_1P_PIX_X_CTRL			0xa0
+#define  NUM_X_PIX_WIDE(n)			FIELD_PREP(GENMASK(15, 0), (n))
+
+#define FRAME_1P_PIX_Y_CTRL			0xb0
+#define  NUM_Y_PIX_HIGH(n)			FIELD_PREP(GENMASK(15, 0), (n))
+
+#define FRAME_1P_BASE_ADDR_CTRL0		0xc0
+
+#define FRAME_PIX_X_ULC_CTRL			0xf0
+#define  CROP_ULC_X(n)				FIELD_PREP(GENMASK(15, 0), (n))
+
+#define FRAME_PIX_Y_ULC_CTRL			0x100
+#define  CROP_ULC_Y(n)				FIELD_PREP(GENMASK(15, 0), (n))
+
+#define FRAME_2P_BASE_ADDR_CTRL0		0x110
+
+#define STATUS_CTRL0				0x130
+#define STATUS_CTRL1				0x140
+
+#define RTRAM_CTRL0				0x200
+#define  THRES_LOW(n)				FIELD_PREP(GENMASK(6, 4), (n))
+#define  THRES_HIGH(n)				FIELD_PREP(GENMASK(3, 1), (n))
+
+#define DPU_DRPC_MAX_STRIDE			0x10000
+#define DPU_DPRC_MAX_RTRAM_WIDTH		2880
+
+struct dc_dprc {
+	struct device *dev;
+	struct regmap *reg;
+	struct clk_bulk_data *clks;
+	int num_clks;
+	struct imx_sc_ipc *ipc_handle;
+	spinlock_t lock;	/* protect IRQ registers */
+	u32 sc_resource;
+	struct dc_prg *prg;
+};
+
+static const struct regmap_range dc_dprc_regmap_write_ranges[] = {
+	regmap_reg_range(SYSTEM_CTRL0, SYSTEM_CTRL0 + TOG),
+	regmap_reg_range(IRQ_MASK, IRQ_MASK + TOG),
+	regmap_reg_range(IRQ_NONMASK_STATUS, MODE_CTRL0 + TOG),
+	regmap_reg_range(FRAME_CTRL0, FRAME_CTRL0 + TOG),
+	regmap_reg_range(FRAME_1P_CTRL0, FRAME_1P_BASE_ADDR_CTRL0 + TOG),
+	regmap_reg_range(FRAME_PIX_X_ULC_CTRL, FRAME_2P_BASE_ADDR_CTRL0 + TOG),
+	regmap_reg_range(STATUS_CTRL0, STATUS_CTRL0 + TOG),
+	regmap_reg_range(RTRAM_CTRL0, RTRAM_CTRL0 + TOG),
+};
+
+static const struct regmap_range dc_dprc_regmap_read_ranges[] = {
+	regmap_reg_range(SYSTEM_CTRL0, SYSTEM_CTRL0 + TOG),
+	regmap_reg_range(IRQ_MASK, IRQ_MASK_STATUS + TOG),
+	regmap_reg_range(MODE_CTRL0, MODE_CTRL0 + TOG),
+	regmap_reg_range(FRAME_CTRL0, FRAME_CTRL0 + TOG),
+	regmap_reg_range(FRAME_1P_CTRL0, FRAME_1P_BASE_ADDR_CTRL0 + TOG),
+	regmap_reg_range(FRAME_PIX_X_ULC_CTRL, FRAME_2P_BASE_ADDR_CTRL0 + TOG),
+	regmap_reg_range(STATUS_CTRL0, STATUS_CTRL1 + TOG),
+	regmap_reg_range(RTRAM_CTRL0, RTRAM_CTRL0 + TOG),
+};
+
+static const struct regmap_access_table dc_dprc_regmap_write_table = {
+	.yes_ranges = dc_dprc_regmap_write_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_dprc_regmap_write_ranges),
+};
+
+static const struct regmap_access_table dc_dprc_regmap_read_table = {
+	.yes_ranges = dc_dprc_regmap_read_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_dprc_regmap_read_ranges),
+};
+
+static const struct regmap_config dc_dprc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.wr_table = &dc_dprc_regmap_write_table,
+	.rd_table = &dc_dprc_regmap_read_table,
+	.max_register = RTRAM_CTRL0 + TOG,
+};
+
+static void dc_dprc_set_stream_id(struct dc_dprc *dprc, unsigned int stream_id)
+{
+	int ret;
+
+	ret = imx_sc_misc_set_control(dprc->ipc_handle, dprc->sc_resource,
+				      IMX_SC_C_KACHUNK_SEL, stream_id);
+	if (ret)
+		dev_err(dprc->dev, "failed to set KACHUNK_SEL: %d\n", ret);
+}
+
+static void dc_dprc_reset(struct dc_dprc *dprc)
+{
+	regmap_write(dprc->reg, SYSTEM_CTRL0 + SET, SOFT_RESET);
+	fsleep(20);
+	regmap_write(dprc->reg, SYSTEM_CTRL0 + CLR, SOFT_RESET);
+	fsleep(20);
+}
+
+static void dc_dprc_enable(struct dc_dprc *dprc)
+{
+	dc_prg_enable(dprc->prg);
+}
+
+static void dc_dprc_reg_update(struct dc_dprc *dprc)
+{
+	dc_prg_reg_update(dprc->prg);
+}
+
+static void dc_dprc_enable_ctrl_done_irq(struct dc_dprc *dprc)
+{
+	guard(spinlock_irqsave)(&dprc->lock);
+	regmap_write(dprc->reg, IRQ_MASK + CLR, IRQ_DPR_CRTL_DONE);
+}
+
+void dc_dprc_configure(struct dc_dprc *dprc, unsigned int stream_id,
+		       unsigned int width, unsigned int height,
+		       unsigned int stride,
+		       const struct drm_format_info *format,
+		       dma_addr_t baddr, bool start)
+{
+	unsigned int prg_stride = width * format->cpp[0];
+	unsigned int bpp = format->cpp[0] * 8;
+	struct device *dev = dprc->dev;
+	unsigned int p1_w, p1_h;
+	u32 val;
+	int ret;
+
+	if (start) {
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret < 0) {
+			dev_err(dev, "failed to get RPM: %d\n", ret);
+			return;
+		}
+
+		dc_dprc_set_stream_id(dprc, stream_id);
+	}
+
+	p1_w = round_up(width, format->cpp[0] == 2 ? 32 : 16);
+	p1_h = round_up(height, 4);
+
+	regmap_write(dprc->reg, FRAME_CTRL0, PITCH(stride));
+	regmap_write(dprc->reg, FRAME_1P_CTRL0, BYTE_1K);
+	regmap_write(dprc->reg, FRAME_1P_PIX_X_CTRL, NUM_X_PIX_WIDE(p1_w));
+	regmap_write(dprc->reg, FRAME_1P_PIX_Y_CTRL, NUM_Y_PIX_HIGH(p1_h));
+	regmap_write(dprc->reg, FRAME_1P_BASE_ADDR_CTRL0, baddr);
+	regmap_write(dprc->reg, FRAME_PIX_X_ULC_CTRL, CROP_ULC_X(0));
+	regmap_write(dprc->reg, FRAME_PIX_Y_ULC_CTRL, CROP_ULC_Y(0));
+
+	regmap_write(dprc->reg, RTRAM_CTRL0, THRES_LOW(3) | THRES_HIGH(7));
+
+	val = LINE4 | BUF2;
+	switch (format->format) {
+	case DRM_FORMAT_XRGB8888:
+		/*
+		 * It turns out pixel components are mapped directly
+		 * without position change via DPR processing with
+		 * the following color component configurations.
+		 * Leave the pixel format to be handled by the
+		 * display controllers.
+		 */
+		val |= A_COMP_SEL(3) | R_COMP_SEL(2) |
+		       G_COMP_SEL(1) | B_COMP_SEL(0);
+		val |= PIX_SIZE_32BIT;
+		break;
+	default:
+		dev_err(dev, "unsupported format 0x%08x\n", format->format);
+		return;
+	}
+	regmap_write(dprc->reg, MODE_CTRL0, val);
+
+	if (start) {
+		/* software shadow load for the first frame */
+		val = SW_SHADOW_LOAD_SEL | SHADOW_LOAD_EN;
+		regmap_write(dprc->reg, SYSTEM_CTRL0, val);
+
+		/* and then, run... */
+		val |= RUN_EN | REPEAT_EN;
+		regmap_write(dprc->reg, SYSTEM_CTRL0, val);
+	}
+
+	dc_prg_configure(dprc->prg, width, height, prg_stride, bpp, baddr, start);
+
+	if (start)
+		dc_dprc_enable(dprc);
+
+	dc_dprc_reg_update(dprc);
+
+	if (start)
+		dc_dprc_enable_ctrl_done_irq(dprc);
+
+	dev_dbg(dev, "w: %u, h: %u, s: %u, fmt: 0x%08x\n",
+		width, height, stride, format->format);
+}
+
+void dc_dprc_disable_repeat_en(struct dc_dprc *dprc)
+{
+	regmap_write(dprc->reg, SYSTEM_CTRL0 + CLR, REPEAT_EN);
+	dev_dbg(dprc->dev, "disable REPEAT_EN\n");
+}
+
+void dc_dprc_disable(struct dc_dprc *dprc)
+{
+	dc_prg_disable(dprc->prg);
+
+	pm_runtime_put(dprc->dev);
+
+	dev_dbg(dprc->dev, "disable\n");
+}
+
+void dc_dprc_disable_at_boot(struct dc_dprc *dprc)
+{
+	dc_prg_disable_at_boot(dprc->prg);
+
+	clk_bulk_disable_unprepare(dprc->num_clks, dprc->clks);
+
+	dev_dbg(dprc->dev, "disable at boot\n");
+}
+
+static void dc_dprc_ctrl_done_handle(struct dc_dprc *dprc)
+{
+	regmap_write(dprc->reg, SYSTEM_CTRL0, REPEAT_EN);
+
+	dc_prg_shadow_enable(dprc->prg);
+
+	dev_dbg(dprc->dev, "CTRL done handle\n");
+}
+
+static irqreturn_t dc_dprc_wrap_irq_handler(int irq, void *data)
+{
+	struct dc_dprc *dprc = data;
+	struct device *dev = dprc->dev;
+	u32 mask, status;
+
+	scoped_guard(spinlock, &dprc->lock) {
+		/* cache valid IRQ status */
+		regmap_read(dprc->reg, IRQ_MASK, &mask);
+		regmap_read(dprc->reg, IRQ_MASK_STATUS, &status);
+		status &= ~mask;
+
+		/* mask the IRQ(s) being handled */
+		regmap_write(dprc->reg, IRQ_MASK + SET, status);
+
+		/* clear status register */
+		regmap_write(dprc->reg, IRQ_MASK_STATUS, status);
+	}
+
+	if (status & DPR2RTR_FIFO_LOAD_BUF_RDY_UV_ERROR)
+		dev_err(dev, "DPR to RTRAM FIFO load UV buffer ready error\n");
+
+	if (status & DPR2RTR_FIFO_LOAD_BUF_RDY_YRGB_ERROR)
+		dev_err(dev, "DPR to RTRAM FIFO load YRGB buffer ready error\n");
+
+	if (status & DPR2RTR_UV_FIFO_OVFL)
+		dev_err(dev, "DPR to RTRAM FIFO UV FIFO overflow\n");
+
+	if (status & DPR2RTR_YRGB_FIFO_OVFL)
+		dev_err(dev, "DPR to RTRAM FIFO YRGB FIFO overflow\n");
+
+	if (status & IRQ_AXI_READ_ERROR)
+		dev_err(dev, "AXI read error\n");
+
+	if (status & IRQ_DPR_CRTL_DONE)
+		dc_dprc_ctrl_done_handle(dprc);
+
+	return IRQ_HANDLED;
+}
+
+bool dc_dprc_rtram_width_supported(struct dc_dprc *dprc, unsigned int width)
+{
+	return width <= DPU_DPRC_MAX_RTRAM_WIDTH;
+}
+
+bool dc_dprc_stride_supported(struct dc_dprc *dprc,
+			      unsigned int stride, unsigned int width,
+			      const struct drm_format_info *format,
+			      dma_addr_t baddr)
+{
+	unsigned int prg_stride = width * format->cpp[0];
+
+	if (stride > DPU_DRPC_MAX_STRIDE)
+		return false;
+
+	if (!dc_prg_stride_supported(dprc->prg, prg_stride, baddr))
+		return false;
+
+	return true;
+}
+
+static int dc_dprc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct resource *res;
+	struct dc_dprc *dprc;
+	void __iomem *base;
+	int ret, wrap_irq;
+
+	dprc = devm_kzalloc(dev, sizeof(*dprc), GFP_KERNEL);
+	if (!dprc)
+		return -ENOMEM;
+
+	ret = imx_scu_get_handle(&dprc->ipc_handle);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get SCU ipc handle\n");
+
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	dprc->reg = devm_regmap_init_mmio(dev, base, &dc_dprc_regmap_config);
+	if (IS_ERR(dprc->reg))
+		return PTR_ERR(dprc->reg);
+
+	wrap_irq = platform_get_irq_byname(pdev, "dpr_wrap");
+	if (wrap_irq < 0)
+		return -ENODEV;
+
+	dprc->num_clks = devm_clk_bulk_get_all(dev, &dprc->clks);
+	if (dprc->num_clks < 0)
+		return dev_err_probe(dev, dprc->num_clks, "failed to get clocks\n");
+
+	ret = of_property_read_u32(np, "fsl,sc-resource", &dprc->sc_resource);
+	if (ret) {
+		dev_err(dev, "failed to get SC resource %d\n", ret);
+		return ret;
+	}
+
+	dprc->prg = dc_prg_lookup_by_phandle(dev, "fsl,prgs", 0);
+	if (!dprc->prg)
+		return dev_err_probe(dev, -EPROBE_DEFER,
+				     "failed to lookup PRG\n");
+
+	dc_prg_set_dprc(dprc->prg, dprc);
+
+	dprc->dev = dev;
+	spin_lock_init(&dprc->lock);
+
+	ret = devm_request_irq(dev, wrap_irq, dc_dprc_wrap_irq_handler,
+			       IRQF_SHARED, dev_name(dev), dprc);
+	if (ret < 0) {
+		dev_err(dev, "failed to request dpr_wrap IRQ(%d): %d\n",
+			wrap_irq, ret);
+		return ret;
+	}
+
+	dev_set_drvdata(dev, dprc);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable PM runtime\n");
+
+	return 0;
+}
+
+static int dc_dprc_runtime_suspend(struct device *dev)
+{
+	struct dc_dprc *dprc = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(dprc->num_clks, dprc->clks);
+
+	return 0;
+}
+
+static int dc_dprc_runtime_resume(struct device *dev)
+{
+	struct dc_dprc *dprc = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_bulk_prepare_enable(dprc->num_clks, dprc->clks);
+	if (ret) {
+		dev_err(dev, "failed to enable clocks: %d\n", ret);
+		return ret;
+	}
+
+	dc_dprc_reset(dprc);
+
+	/* disable all control IRQs and enable all error IRQs */
+	guard(spinlock_irqsave)(&dprc->lock);
+	regmap_write(dprc->reg, IRQ_MASK, IRQ_CTRL_MASK);
+
+	return 0;
+}
+
+static const struct dev_pm_ops dc_dprc_pm_ops = {
+	RUNTIME_PM_OPS(dc_dprc_runtime_suspend, dc_dprc_runtime_resume, NULL)
+};
+
+static const struct of_device_id dc_dprc_dt_ids[] = {
+	{ .compatible = "fsl,imx8qxp-dpr-channel", },
+	{ /* sentinel */ }
+};
+
+struct platform_driver dc_dprc_driver = {
+	.probe = dc_dprc_probe,
+	.driver = {
+		.name = "imx8-dc-dpr-channel",
+		.suppress_bind_attrs = true,
+		.of_match_table = dc_dprc_dt_ids,
+		.pm = pm_ptr(&dc_dprc_pm_ops),
+	},
+};
diff --git a/drivers/gpu/drm/imx/dc/dc-dprc.h b/drivers/gpu/drm/imx/dc/dc-dprc.h
new file mode 100644
index 0000000000000000000000000000000000000000..f977858b57fec2f19775a97dc0baf011ca177c0b
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-dprc.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef __DC_DPRC_H__
+#define __DC_DPRC_H__
+
+#include <linux/device.h>
+#include <linux/types.h>
+
+#include <drm/drm_fourcc.h>
+
+struct dc_dprc;
+
+void dc_dprc_configure(struct dc_dprc *dprc, unsigned int stream_id,
+		       unsigned int width, unsigned int height,
+		       unsigned int stride,
+		       const struct drm_format_info *format,
+		       dma_addr_t baddr, bool start);
+
+void dc_dprc_disable_repeat_en(struct dc_dprc *dprc);
+
+void dc_dprc_disable(struct dc_dprc *dprc);
+
+void dc_dprc_disable_at_boot(struct dc_dprc *dprc);
+
+bool dc_dprc_rtram_width_supported(struct dc_dprc *dprc, unsigned int width);
+
+bool dc_dprc_stride_supported(struct dc_dprc *dprc,
+			      unsigned int stride, unsigned int width,
+			      const struct drm_format_info *format,
+			      dma_addr_t baddr);
+
+#endif
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.c b/drivers/gpu/drm/imx/dc/dc-drv.c
index 9bdcfc5aee976ef77bea6b3f6f3ac5f11249798f..17b9c4d0953d46be0a2cd276f06298d848fdcbdd 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.c
+++ b/drivers/gpu/drm/imx/dc/dc-drv.c
@@ -269,6 +269,7 @@ static struct platform_driver dc_driver = {
 static struct platform_driver * const dc_drivers[] = {
 	&dc_cf_driver,
 	&dc_de_driver,
+	&dc_dprc_driver,
 	&dc_ed_driver,
 	&dc_fg_driver,
 	&dc_fl_driver,
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.h b/drivers/gpu/drm/imx/dc/dc-drv.h
index 557e7d90e4ea8ca2af59027b3152163cf7f9a618..93a8ce4e7c314770b64ccb631628b7e79648c791 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.h
+++ b/drivers/gpu/drm/imx/dc/dc-drv.h
@@ -74,6 +74,7 @@ int dc_plane_init(struct dc_drm_device *dc_drm, struct dc_plane *dc_plane);
 
 extern struct platform_driver dc_cf_driver;
 extern struct platform_driver dc_de_driver;
+extern struct platform_driver dc_dprc_driver;
 extern struct platform_driver dc_ed_driver;
 extern struct platform_driver dc_fg_driver;
 extern struct platform_driver dc_fl_driver;
diff --git a/drivers/gpu/drm/imx/dc/dc-prg.c b/drivers/gpu/drm/imx/dc/dc-prg.c
index b72bb9154642c388db912450f7e9db973bb7fb87..972cb7cfd840284654d3d02f75dbac59a53a9a70 100644
--- a/drivers/gpu/drm/imx/dc/dc-prg.c
+++ b/drivers/gpu/drm/imx/dc/dc-prg.c
@@ -19,6 +19,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
+#include "dc-dprc.h"
 #include "dc-prg.h"
 
 #define SET			0x4
@@ -63,6 +64,7 @@ struct dc_prg {
 	struct list_head list;
 	struct clk_bulk_data *clks;
 	int num_clks;
+	struct dc_dprc *dprc;
 };
 
 static DEFINE_MUTEX(dc_prg_list_mutex);
@@ -216,6 +218,16 @@ dc_prg_lookup_by_phandle(struct device *dev, const char *name, int index)
 	return NULL;
 }
 
+void dc_prg_set_dprc(struct dc_prg *prg, struct dc_dprc *dprc)
+{
+	prg->dprc = dprc;
+}
+
+struct dc_dprc *dc_prg_get_dprc(struct dc_prg *prg)
+{
+	return prg->dprc;
+}
+
 static int dc_prg_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
diff --git a/drivers/gpu/drm/imx/dc/dc-prg.h b/drivers/gpu/drm/imx/dc/dc-prg.h
index 6fd9b050bfa12334720f83ff9ceaf337e3048a54..f29d154f7de597b9d20d5e71303049f6f8b022d6 100644
--- a/drivers/gpu/drm/imx/dc/dc-prg.h
+++ b/drivers/gpu/drm/imx/dc/dc-prg.h
@@ -32,4 +32,8 @@ bool dc_prg_stride_supported(struct dc_prg *prg,
 struct dc_prg *
 dc_prg_lookup_by_phandle(struct device *dev, const char *name, int index);
 
+void dc_prg_set_dprc(struct dc_prg *prg, struct dc_dprc *dprc);
+
+struct dc_dprc *dc_prg_get_dprc(struct dc_prg *prg);
+
 #endif

-- 
2.34.1


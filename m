Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5D8AF8D5A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 11:04:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B3E10E9B4;
	Fri,  4 Jul 2025 09:03:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="GhXDA2WQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011057.outbound.protection.outlook.com [52.101.65.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 306E210E9B0
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 09:03:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IoAxgoDzzIVS8wDDBtN0RRZWd+p+eJPDGhSV2AZNoBZNH2U2H5z2Eno5nPNUYmP5rJqMV1FPEKSjZSm4TQdfMKs9sj912+4/ur+Dx+H2w+fKvBwzTmX3XOJh6Au9/ts8TSzTCM9xICcpQPAFfewKkDAi3S1ZUCvqEOc4nakUH1V6ZRSIOlzaboZyF62SXoE2VxfQDxPfPZayUdY7P6TvVHUDn+avzxPEYhGlxgu9PCoehZKyShV1Ud/kmSfAjg6JikY6HfbCjY0nPbcW8SrFL1ViVkEAqjqpe1/SaQGHYf+6mLYD2euVH+GwKVhWORUsZpmqD7NiB7+N4tza7YLWaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T3JjbRWfiXtMSWB5lG82H9fXZSRyD8Ut+a5j27E6I/o=;
 b=sqQEqj1KoPLuiIg7Sedi0zJT9qi1KHBw+irlA3toNimU3EXyrcCh0761vL0aqwGuvAq5239gBjxJXvw5kYc7bgMSesszPDx1RcjlnLZKhKsey6UTNK43kbcDQiCYD9D0Btb/K24zmm2qotDFa6armN4P4ErqsfkW0ESWXGStUCEI5fzn7m3NtFXQaGW7D0Vctf7m6KljqHV/pp73DI+8OuShbavYXGB+HemFNRndKkHWtkfur8p1vkBxfCDFmZp0KefmyT9xdL0ZOh9juo6JLJVOEe6BFYMKvu9VgbaGhj5Jji9JzjkbMteQj4BakXV8wDus1YFGF2HL3YktFqIohA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3JjbRWfiXtMSWB5lG82H9fXZSRyD8Ut+a5j27E6I/o=;
 b=GhXDA2WQOnu7BY9cJD2/fNLknPoZ+Or1UtP5bWhU4aZx0EWCypTcRPjmosKdjCXHvUvbeNeCPDo1BbijSsTUrV0cZNJDhqBvhDmkyaph0CULoQdBtN1YpWHz8uPuWkjjGyvMlD9fGJBlMiXcazBsO1h6qPxs3PL/rf2R4QreLze7amGxR/rQop9dS8xELjAF4st5Nxws4v8PrYDW7i8jxvlo3pM0/j48keIpmKGr0KUWX2i9Kh73tBbHJPDUgNDVyVoisPo87Wi0DCGsYAnflfQthhiR1xSjfupTohRBlV19FFKWR2YctXJNA6NaBcU4O7kJVwPNARRjX8IWI3zkQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA1PR04MB11011.eurprd04.prod.outlook.com (2603:10a6:102:480::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 09:03:55 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 09:03:55 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Fri, 04 Jul 2025 17:03:58 +0800
Subject: [PATCH 11/14] drm/imx: dc-ed: Drop initial source selection
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-imx8-dc-prefetch-v1-11-784c03fd645f@nxp.com>
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
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA1PR04MB11011:EE_
X-MS-Office365-Filtering-Correlation-Id: 482c2842-d721-47e7-c567-08ddbad9b48d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|7416014|366016|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V01nWWxxWW5BazhLU0s2a1NDeWg4YWN5c2FoeGJNTm1UbUVLTmpqZGtzZEcv?=
 =?utf-8?B?RUtLcFlLdEdVT3d6ZSt5djY5bDJFY1dhYU1hUlROUnBMbngvMktDL2QzWDVV?=
 =?utf-8?B?UHFZOEFBcEp6WWlkQmp1cGtUeHBZMENKTjNVaEV1SDBSTUVkUHJ4U0pNd3Rz?=
 =?utf-8?B?MUNDRExaemVxMWJ5QUNPQ092R1J3TUNpM05UZHpKandEb0tITUpMZzhNa3l3?=
 =?utf-8?B?UHljS01KRzMwV2VzV2ROWFRQbVlFREx5TFFnOUdjbnJWSUpVRWtLdHVvWitv?=
 =?utf-8?B?bmdKaE1abWtYZDlERGhWK0lxMzEvSzhpeFJsTFRBUUpVbkJuN2d6SEFVY0E3?=
 =?utf-8?B?L2t2aEdHNmtnalZKZEN0blg4K2lDMmRYczFMaXhFOEt1cjdKOWdzR2xOZGFY?=
 =?utf-8?B?SHIwcDVERTFMNUwyVWF2OWppdHF2ZmVTZ0tlc0lCNXZIWVZFeFl6T3hzUS9w?=
 =?utf-8?B?dVVBRHNDelJJNDhBL2VwOGhQVWI4c2lxNUQyRjMrTEswU3hoS0NabnZHZVo3?=
 =?utf-8?B?bWxZQXB2WTJEYVk2OU1Tb2ZsVkVNRHVKUVRtaUZXemRoTUh6VlFha3Q4STJW?=
 =?utf-8?B?Z2kydVVPUDJTNEo1Qkp5MXQ1VVFZc0lyRVc1NDZET0g3cldaOGVMdEhMSElS?=
 =?utf-8?B?V2VNTDhWYWUxMXdTdW1SaWVsWm1YTER5QlV1SkF2UEpWMkdUSnZOcTVzQ2RW?=
 =?utf-8?B?c1NBU3lFVUJrRXM3aXdheUpQcFlHZC9BbFVSTFlLK0E2R1R6Q1V5TVRxQTdM?=
 =?utf-8?B?Sk15Q2RZbHNmWXJzZkxaYUJxaXlLamZVaUw1VHNyNG55Mk13ejFibGRBOXJ6?=
 =?utf-8?B?VmtZYVZvbVduejJqRWRMQU4yeWtNT0VZWmc5SllRUDk2ZHNnVTVub3JxS3JP?=
 =?utf-8?B?bTZ6KzlGeGxGdTVTeGdrV21jRXpNUkRLVGRtTEF3YzBiWEZuRUV6bXlQYkpm?=
 =?utf-8?B?M1FwWWtCMHd1OVl4N0dBYkNoUi8xeFdzSm5YT2UyN1Fxanh4MnExeUpoWUdL?=
 =?utf-8?B?MWtkRUlwQThSS2srZGp6eHBSUURkOXU1L0RsZ3RaU1NUTlRhSzBTbEFxSFBV?=
 =?utf-8?B?NW9BbjUwWHBVVEpZWkVyZmtHZzFQaU1iNUkrcmhLWmEvQVNQREkyVk4rVllY?=
 =?utf-8?B?cVcrQVZpK045aWQ1ZUxrQkozcDlkemRhVmJpTWpxbTlwMW4xYVdMK0toaDBl?=
 =?utf-8?B?MFAvRlhZZ3MzVWZOaGxneEYvcmQ0MEFjcGpIamw3bHMyRUlkWXBaNDY4dXdF?=
 =?utf-8?B?V3I4TEdseDNqKzJCc1RxaHJZQ2tuaytWSnhaMEVmb1ZJdFR1WXlENzBTRTFm?=
 =?utf-8?B?YjcvcG5VOTh5M1N0TC85ZEc5dHRWSVBaUnVQOCtINHU4MFd1MjJxcDUrUXha?=
 =?utf-8?B?azZTeGNPTHFqaHpydzhrUCtFemMxV1VxNzJEWVZ2c3BpY3RsL3RrUEs3SEZB?=
 =?utf-8?B?ZFJvUzh6ODM5UUpQN1ZmT2tZeGZMc0l0M0ZwTEJ0WnhsdEI2MmNrRmw0U2tL?=
 =?utf-8?B?L1lLSi80TVQzcE1vZnJIM09QWmZDSXZ2YkVZZmtsTTNDR3AvdDBYZGw2RmR6?=
 =?utf-8?B?NUZlSlU1a2VqRWo3TlhpUlN4Z1N5RHBYQU1QU2pqQ3BBWTNLZXVyeHgzblMr?=
 =?utf-8?B?dlphaGZZdDhpUFdPVEx1ZW5ZMDBVcHRORlRsbjltYkRtUHgwODlFTDVRT1Y4?=
 =?utf-8?B?R1dxeTRERVR0THlBR0RtejFaOGE0dVpnd1UyVXpFVEtNc04wMHNUWUNldFVC?=
 =?utf-8?B?UlRRc3BsOHI5NnE3SjZEMTFTMUJBWGhUS3haTXlZSzljcDg4ZzE1L0hzZzJh?=
 =?utf-8?B?TVNpSW14TDE4TzFRVk1UMnVLZHozWGZMZkFhOERXYjQ0TVlYWHpLZHZEdGxt?=
 =?utf-8?B?T1RxNjlNM0RRaTdyTk94SFJYV1JqZEd1emlNT2lyOUFueUhhTkI2UEl3NjlF?=
 =?utf-8?B?S2JMUGk2aGJCVXorMjIyRXJjckNVUEUrOTFvemJZRHFVajRpZzN3RDR4S2h4?=
 =?utf-8?Q?xCjlTuoyRZzgMagxH46MKVZT4OkGRg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(19092799006)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnpEejF1RkdLU2tDeFNXL1ZVRExIT3JnTm1IRWJpM0p3ZG1hVHhheGw3Mzcw?=
 =?utf-8?B?VVIxQUlQNkEweXkrWXloYm1LNWppcjl1TFhVUW54ZjQ4SmYrQmNrNUFja0dI?=
 =?utf-8?B?RHVpNjdtT21Ed3J5eWNHMkZNU2tjQjdjSzlyUHlOSm12UjZURVE4blZuWEJG?=
 =?utf-8?B?SEcvd0x5TVI0dys5MVFyc3ZzU3lvUEtyZSs5bWZ6KzcyclQ5Ykx5T2Jrb055?=
 =?utf-8?B?dmpNOCtXa1ZlL1VLL0JEMFh1VE8ybVN1SzkwakZuQzlrZUs0bGhFS2xuVjQ2?=
 =?utf-8?B?NkJMM0RrTm5NNExYcCtFRW1PQXFUK0xmdUt6d2gyY2RKT3NIQ0ROTzlLbkdG?=
 =?utf-8?B?S2xNWGViL3NCeURxMkJoSk8xUnIwQjZRdTJaWk0yL0hxR0gyMWlMN0dlemhK?=
 =?utf-8?B?VmlNckpBN3lWejJDU0ZaZWV6cEJHNEtlSDQ2Z2RMdVNYOGtWZE5xSXlmUEI3?=
 =?utf-8?B?cHlrOGdsWDhQckhKK2szVmtHZk9DZXVHSW5ld0NGY2J3MXFKU3FNWTBQeXI3?=
 =?utf-8?B?TDFaNGRpaHh0Q2RyQUVvZWtYOW5RQjNiRGFnNDlXOWRyQVg1alp4ZGFwS0lJ?=
 =?utf-8?B?d1liY1hscDgrVERlelgxOFNMa0xkYU91TDR6TXBpblJ5WnRSYUd1MmR6K0NO?=
 =?utf-8?B?V1liOFYxbWlRZ1NXSktjV2hZRkZVYUVIUDlLN1BDb003NDNvZVRraGp1by8y?=
 =?utf-8?B?Mm5kTjAwVG9oSXY0TGJITzlSODlOOEdkc3hDNDhyUlpLcndQdnFqU045TmI3?=
 =?utf-8?B?SUdKOXdVTjN1bUhiVmxTWnZFUHNIbFd0TlZ3eHpNbklpMGdqNVU5cU1pdnZC?=
 =?utf-8?B?dDdpOE40Q2lFOWcydkNoZGlrL1ltcUE4aFpGQjN5R0dVSm1RM1FCb29VSnJo?=
 =?utf-8?B?aHp4Q09sRFhvMTkrcW5jVkk2Vm1pN0NRczB1MHlRVmFETjhxVCtsL3BMRWM4?=
 =?utf-8?B?N3NnMFBHblBCV3RxOWtpUlVvR2ZrVkYvQ09IdzBBNml5bGdKaTZFVWt5Zk41?=
 =?utf-8?B?NUlXeS9aK0lGRFVPcnJLYi9WQzlRbGJhK01YU21wTWgrRDFEa1FrSHcvSWJI?=
 =?utf-8?B?UU1ydGlSbUxCZnVzZXlRb3VpeUo0MlFkaDkwN01WazdDUi9yUkYxUklPN3pi?=
 =?utf-8?B?RFdURWVVcDdMWm90STZkbVI0MThmRUlBUjdrTzNGYW9PVWw2RUdBMGR2RlZ0?=
 =?utf-8?B?THV2aFRZMTFqQy9kR0RGRjZOYldGR0pMZStSMzV3Uzg0cmxjQlo0UkdyTWtq?=
 =?utf-8?B?VmRjdVMrU3QzaTdTbEZjMml0T0dwS2VpWkJjQXJ2eWxORjMxWVpzak53OERi?=
 =?utf-8?B?VFN2Sy9ERTVDR3VZNDBVQjA3TnRHMTB4MDRnRUROeGNHZGRBVFZSQ0x4UWUx?=
 =?utf-8?B?a3RkekI4bUhVVFpXUGxZNlN1OUFIWFZyQlR5cFk3d0FzSFBpUUs1VlRzVFFZ?=
 =?utf-8?B?ZmMveWs2dXA2cEdJelhEMlZXNkpuSlMvSGR4ckNXREpEZUJRVGNYVWQya1gv?=
 =?utf-8?B?Zjd6WDBYUTdLdTJhQlNNVVFVZlhqV2VnL0JKK1ZMOWZ0NzlnYWRTTXJPVERV?=
 =?utf-8?B?RS9TcVF5WHkwQmF4M0J3YXpwUEhzQWpYam5mLzA5Z3lEcXFCWGxZWExFU05j?=
 =?utf-8?B?SVF2WHpJL1Rzbkpqb1VoenM0VEY5ZElMVFhQVW1BUmV3ZmdXeEg1cG5aTGZq?=
 =?utf-8?B?MGt6dnExR0RRd0JCREJmUzFjWXhuSWpDZDhnSXZTODhYUnh4dWJ5VzlSaExs?=
 =?utf-8?B?eHBENThvdGlJVXRkOUxIZ3dsQWVibWQyNVBJc2FYMW45TDNOM1A5S3Z5anhX?=
 =?utf-8?B?Nmk1S2lkWTB1WE11TGF4WW9SWWdmZG5SN0VkWCtTaGlhelh6QnM4WTRoOVpz?=
 =?utf-8?B?NTg2ckpJRXZWbGJ4Y0VWbkw3Ym5TTzBBbnZqNmI1L0VRUzd3N2FheXQwR1J0?=
 =?utf-8?B?d08zM3h0NmZCZ0xwNm55N3Z3MUFFMFgydmRYa3ZzQ1ZKMnZVMkNjajJ2WWxw?=
 =?utf-8?B?ZlloYXdhUkxRMytvekMzcWxMOUNKc0dxaU5QdHFYbFltZ3hnZUpSdXVvNEgw?=
 =?utf-8?B?ZmxpY2pDcFRxV1dXQnhlS2VvZ3FoblkyS3dvc0pCc2NJQ3JEaHRra1ZXNlR5?=
 =?utf-8?Q?rtSynvARCA3DcuoW8ZaA2AZBH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 482c2842-d721-47e7-c567-08ddbad9b48d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:03:55.7936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VIeNQCtlq2rgnbvaUEy3u0uSOwSV2LoR025tcdsyJsKEXfeIyYZbniyTkWqhqwD+kSL2Uf1hGEnmNW780hgtoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11011
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

It's unnecessary to set initial ExtDst source selection because KMS
driver would do that when doing atomic commits.  Drop the selection.
This is needed as a preparation for reading ExtDst source selection
when trying to disable CRTC at boot in an upcoming commit.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/imx/dc/dc-ed.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-ed.c b/drivers/gpu/drm/imx/dc/dc-ed.c
index b514790bb765329295553f89d16ee1167ef411dd..1b141ced57b895c24b6358332cbe5e308dad7c01 100644
--- a/drivers/gpu/drm/imx/dc/dc-ed.c
+++ b/drivers/gpu/drm/imx/dc/dc-ed.c
@@ -203,7 +203,6 @@ static inline void dc_ed_disable_gamma_apply(struct dc_ed *ed)
 
 void dc_ed_init(struct dc_ed *ed)
 {
-	dc_ed_pec_src_sel(ed, LINK_ID_NONE);
 	dc_ed_pec_enable_shden(ed);
 	dc_ed_pec_poweron(ed);
 	dc_ed_pec_sync_mode_single(ed);

-- 
2.34.1


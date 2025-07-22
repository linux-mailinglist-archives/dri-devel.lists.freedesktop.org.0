Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3787B0D266
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 09:17:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E72C10E2EA;
	Tue, 22 Jul 2025 07:16:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="WmoZ4vXg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazon11012051.outbound.protection.outlook.com [52.101.71.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0121610E2AB
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:16:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OyX2atmbCOIEQCTTsLBNJwYUN7gJDUoFYPW0WklY4RGaVZHFFgXvsGyWPxT4V76duJNNJWW2WTLuNDpWwgrAK+uB/0MA3uawjLsJHNiwEfAcj75DJnAZ/kS8gRXh0+63u/TfqAcFMA/PGqddw7RBYNJf4bQqkPKGGKzqLKbWUrKwipBM9SqZnx1DJQUfvfC3aftRi/vbQ+KY/xv1KyesDhjjP6Kxm+Ia9AbVWurDtGRPGqCw/u/rFgTqzPyd725i8q/UyaIecIynD2oGJTRgW8lpr8/cvaQ1my/1Z9ph4PSs9DF7hR2oqbaHRFkMgk83c9nke+4WwNg5gcZFzKs16w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Q/Sgz/MXcNAhRvlXDa8DzYklUDDvsPpKwfBdTbKPgA=;
 b=Rv8hwSuh81sA8yjdibxYJ0XSEHIk0VyZza8mikG2Fz8k1yvL634+AbHnyBoMR3FWyAMJLaMqTrzccIH8GpiSDoQiKApcGSg3PeBJ3ogLmS3CJEwTGsHIOh6TfdXR4OFr8OlqAFdgOWwZsIkqpQUQPYuQkoYkC8qXyFY/D+nD/wakaURFFhv/m+LjB098SHhjVC0KvW+9BHTdow8UbFpM6Kugqc20Mrt5Pz3jv4v4djU/E+nwJZ3cT3PLeG5V1LWPdk+e1y+AJPQtCNPJL5w+NfsrAStapyxl56wvNnrEI90KbXXpxoqUwWvfon/+hq7E/1wZZVZu8vF2anh9yQd4FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Q/Sgz/MXcNAhRvlXDa8DzYklUDDvsPpKwfBdTbKPgA=;
 b=WmoZ4vXgVDT565Od0I///icybz8mawVrOEeCQEY7EJBeoYwQwcR9cTUi8ain7aZ6PUlY1lFzOy+99WuVkxdoRSTQsI1nTLxjgkg/OnKMeonvPi70Q/qcBSJDAn13gxx9sA+gcW4vohbhIWDBkif/aLCjC1v/upcFHzOtxAYu28sELfMjaF+gzvz4r276qHBfvhiugH+qDz7kJ1kfkHPvhE7GQRv5+2IT2munMpEh5r3BhvXynBf9JK/HRWX79Ut6OAF8j8Djb4N+P7XXsnCagmKEEQ2HVHzNNKC9n51vLgQuUWgyw80WVshRm7m/3ExkshovfzNS31ybNr7Xsg1Bzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI2PR04MB10286.eurprd04.prod.outlook.com (2603:10a6:800:21e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 07:16:53 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8922.037; Tue, 22 Jul 2025
 07:16:53 +0000
Message-ID: <a5621775-5032-4422-80bb-5f8f60351dbe@nxp.com>
Date: Tue, 22 Jul 2025 15:17:37 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] dt-bindings: display: imx: add binding for i.MX8MP
 HDMI PAI
To: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 lumag@kernel.org, dianders@chromium.org, cristian.ciocaltea@collabora.com,
 luca.ceresoli@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 l.stach@pengutronix.de, shengjiu.wang@gmail.com
References: <20250718101150.3681002-1-shengjiu.wang@nxp.com>
 <20250718101150.3681002-4-shengjiu.wang@nxp.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250718101150.3681002-4-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0021.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::13) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI2PR04MB10286:EE_
X-MS-Office365-Filtering-Correlation-Id: 646a0c9e-29f3-4d32-f177-08ddc8efbbbc
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|19092799006|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U3pZV2pjRmxUMEZXT2VxODNWdVhtUFNXSXdJb0F3S3RvcWNOYytlT3JyTnFI?=
 =?utf-8?B?OU82MGR5ZEc1VnhKSkkzazgvNFBJL2RWZ3FpNGVWY25vL1czQXNITTJSSEJK?=
 =?utf-8?B?VkVRdEhjUWRBWTVEZk5SK3NubXd3M25rOTU0S2dvU3hsOWJQaVVXNWlEV25v?=
 =?utf-8?B?amhnK0ZzNkRZZ3ZXUVVNcWttOWsrZUYzQnVHWFg3MGExTXlHaEY1RS9uL0hZ?=
 =?utf-8?B?aVFiMFRlbVlwS3lxQzdiNG1iVFd3VHRsbWFOeWFHU2V0RUp4aHhLQktRV2NF?=
 =?utf-8?B?TE9mTVNlbGhPS3FkYk0zZUJrTWc5UTFwYi9mM2pjSTY0bFkwWTB3M1A0S0U1?=
 =?utf-8?B?WDFFK3Y1S2xxN05HT1A3NWRtN0JGZ2VhellsLzRCaTZXNzRUcmZrSkNVMC9M?=
 =?utf-8?B?NjNjZ1ZnVFVnM3kvckp1THZZUlJadHB3aHhaZFdDalk3cWFqZTZaR25PKzlJ?=
 =?utf-8?B?bW1qVzg1N0hIOVIxUlhrY0pxNWl3RUMzRXF4b2htbk5mYzV3a1VIODFmVmU1?=
 =?utf-8?B?UUdXNkVaaDVIY3ViaURXMk54dWNDVjRjNjVJS3lJcFN2cGtOQVJabS9WYU5E?=
 =?utf-8?B?Kzd1Rm8rbHNGajV0YUR4WFRJaHh5c2tOaW05YjBlUHhFcUROcVhQTy9BbjFO?=
 =?utf-8?B?M2hYWjZVa3hkc0labnh0a1pvS01vcWJKSEtTS2Y5clRKaVBDN2NuT0M2ZWhS?=
 =?utf-8?B?TGRqajNXMldsYVZyUUV6RnNDME5qRW1Vc3V3UDk0RjNkL2ZhWEZxZ2Z2VDFD?=
 =?utf-8?B?N3JTTXd3cXh3RVVnNSs0ZGo5dEZVbi9qanR2Qkl5QzZqcGhKMmZ0V21wOHFS?=
 =?utf-8?B?akcvUXJBNlBJZlF4dnBxVVRjRkw2R3QyK2VZTU1uNy85QVdKVHVhSjZ5dW9R?=
 =?utf-8?B?QWRBby9WN1FOOE9Eb1ZycithWGpib3BNRmY1LzR5QkRRaVpRRXo2ZWo1aUFB?=
 =?utf-8?B?cU1vd0cvTkdoTnpXRmlKSms3c29WeUdVVVBsTlFlVWVPcGlwY2NveExiNHBC?=
 =?utf-8?B?MzU0VWtOMTRNZVA2ajgwNkNweStsYlJuYmtZS09yZXFXQ1JyQjl4czdXWmk1?=
 =?utf-8?B?T3lJSktKOHV4SnEzUGF0S2x6QWFHREFCMHkySHlwdlN4L2ZVYWpmaGpDekdX?=
 =?utf-8?B?bTFsb3Nib3ZNZjFZK2J3TWFiNVhyOWpQTDJSSG1JenF5b2FxaGMwdHIvQ2Uy?=
 =?utf-8?B?NTNESkoyZGhrUWpLRGhORFhOem03elVUQjRBOVRLd0R3MGxZSVRDU1FkQWR0?=
 =?utf-8?B?cUZIV2d0NldJRWJmbXZzN3BiNkMrS1ZCMlpIUnNJZlV6ci8yR2FZRFNYSThG?=
 =?utf-8?B?MjJ6Y2k4NWJBWXBwWVlOYVJqdElGUzNxRmtQazNGQTF0N25UeUdVUThLb0xy?=
 =?utf-8?B?eEp5VTVhYm9PYkRQcG5QNVdkRTZtMGdJeWtoRStLVVp2QkpIVXhsTFdCdjlq?=
 =?utf-8?B?N05yeFJoajQ4NFRyc2VHVGpnajlodUxKd0Zpa0Y0TVRpMzhHYjZPUCtDV0xM?=
 =?utf-8?B?NUVuY3RtdE94N3J3aWx6YXJ5cE0yeFc1NTNCMHpHaklhQlZyTXp6M2dCalda?=
 =?utf-8?B?bXYwV1JjYzIvWHpYQVhkNjNLV25OTzV6bXBJRk81RXlmN0U2UnR6NFFad0lv?=
 =?utf-8?B?ZGg5eHAzUDc5RTZra1hTRnNFVjNDRWJsanhCZkNWdTFqL1dhUWNXTDAwQ1Jn?=
 =?utf-8?B?UGRWdUlSVHdqNTNjVXl3d0xFTkt6R243am5DU0NTV050WWM0dGtHSXczRWVy?=
 =?utf-8?B?WUNycHRDUGNBSnVwTjR0ZWloUVBiNG9pcGtCc1JyZGNLZ2dxUlUwVGdoS1pH?=
 =?utf-8?B?RFV1NWVZVkRhcDA5YTVuV09odXdZK2VFS3JLUzVqUE9Oa3ZwL3lZbldsa0pr?=
 =?utf-8?B?VTFlcERaQmpMelU2VUZGWkJqN3NTYURTMzI2L2hObTBQZHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2lNRjEvTmMzZnFCRTJ4VkpkUHN5TmlXellRV2Rwd1FWVmxyaTFvMVJ1elVk?=
 =?utf-8?B?dE5kLzltRUVxc3dwcmRBWHBwT0ZyTWJnQ1I4SjZKanhpQnEvQTZHKy9RT2d6?=
 =?utf-8?B?b08rbmgwL2NaRGVWYXprWW9rS09tQUN2eVRLKzdmZ3ZoMXhiTmpHUVQwRVBw?=
 =?utf-8?B?LzhuRzhwNjZFSm93Z1RDRHRxdjlJZE5FdVo3S0UrV1kxVVk3NTRwUnJjRm9p?=
 =?utf-8?B?aGxCTjNGcFFLckVTTDFDMXpXcFo4UzVzVmlvTTVGTGxOQ1lYV1JaUFlzMGtl?=
 =?utf-8?B?dTVoNXdoeExsWktSK04xaHVPalRtenJKZTdFdGJlWmtvdU5paGYzblFvVWxW?=
 =?utf-8?B?L2w5aVRPbklnKzYwb1NEeHB0elZZZFZlNnV4emdTdzVvbmw0NXZBQUdxWGg2?=
 =?utf-8?B?b0g1WWEzOE00MG4wUFVSREhUbEMxSHVEWEx6aWkwcC9KRFM0aFFzMkJrRzIz?=
 =?utf-8?B?elM2RlVucCswVjl2Zng2T1VrTy9sc2ZUdC96RGtiM1gwVENhUnUyb3UwV3Bu?=
 =?utf-8?B?aklnQkU5MmxFUXpHeWZJM3BRM2RtY1BFWHhoSmlzMHlmN2k2V0ovejJlaUdy?=
 =?utf-8?B?MVQ5MnJaaUVSNTZzUkdHcWFFeGZyUjZRQS84dDVkeWNabjVOc3YyUksrYmRm?=
 =?utf-8?B?WUl1SUsvaVd6dHh3UlFRNTZ2Rk5oSnFyaEhZTklTaDhKTHRCb2FTakphU1hL?=
 =?utf-8?B?VUdRQ1ZXOFNzQnQvN2FybUozK1l2VFBpbmphVUZxZVNLekVlcWZKamFoMWx2?=
 =?utf-8?B?VE14YTlzcjJwSWJpM25HT3dNQTNDRFNLV3lXNWQwQS9TOGlHL2JMM1hUSUNu?=
 =?utf-8?B?cWZuVUZ3UC96eTJwUEpQUHV5Qyt2QzlSRlYxcGZQOGxCY1hUQVd4dXdBckpH?=
 =?utf-8?B?Z2Rma041RlJsa21qRVZUcUhRWms1WmVibWVib0puREhSUG4yKzMvOEJXUmxL?=
 =?utf-8?B?cTh6NGlKL2R4QVppdHc5T2gvZWU5NTE5VVI0bjdyQnU2UW9IcTQ1Vit2UkFP?=
 =?utf-8?B?eDlZNFFmb00xQXJPb2l0VkNERGdRU0ZGZW9rY1N5VVVMbmJIN1Y4SmlnUEdl?=
 =?utf-8?B?VzNuUUhqRVJJK2NQMzFPa1NTZWd2SDg3SUwzdDNYMVhtM3pyN3hGRDY1VW9Q?=
 =?utf-8?B?OHNkLytvcDAzUlJPeitENkdXYzA4OFA1Q1ViY2lLUW1xT3ZnR2VCSHBldkI0?=
 =?utf-8?B?RmpicEdQNmUzZVdUejM2WW5pcUtoZC9EWjF1T0RHUk9waGV2ajNiN3JxZlIw?=
 =?utf-8?B?cHFjWkorK0dZL2RYMjIzdWdmMmlIOU1UMVYrSHF6cDlvQzQ2UTVIL2NJYjVt?=
 =?utf-8?B?cEgzdndJWjIrRjNGaEI2Tys0NDh0ZmFRbjJjdWNaQzFUcm1iZWxMd2FLcTBM?=
 =?utf-8?B?dDJISitQVmJ1Z0pLMDBBTzdFNWRxRTFmOE9IUC8rWnMzTTUwcUQ5SWorQitG?=
 =?utf-8?B?MW4wbzlvdEJzbFBoQmVEeEh0MFYyeDVRWDR6d0YvYWhBOXZBRXAvTmc3My85?=
 =?utf-8?B?eVZRNm1TZW5mSTVEcXIrTUg2SjdvdEFXWUozeWsxaXBzVlh4bVgrWTNNTHB1?=
 =?utf-8?B?M2NCRUQ0Z1FyUGJmeUhNVWlSZk56R0FPT1J4aTNkRk1EU2JzYmFXOUgyLzBv?=
 =?utf-8?B?amQ4L01IeUxZU0Q4T0lzVU5IVG5BZUlobThsYzhFb3pDRDdRd1N6b25DUFVQ?=
 =?utf-8?B?Qnl1Mmg3WU9DUzVOcnhTNEtRenVsZTRlV1RvQ3dXMWJMT1dPNlhScldDWnYr?=
 =?utf-8?B?YkhxUFQwSkFOMmFyZGJFYjNpTlIrVEIvaTNIWkY3TEZDTlF1dUdJQlZsTEhn?=
 =?utf-8?B?YndUU1ZVNkMzL3JPRTV3RDU1dmUya1R4WFoxZzBaUjRLREtYdkNieS9yMmpB?=
 =?utf-8?B?aWJWeGFzVzlyWUE4ZGpvK2daeXliaTNLeXEyS3JtalVqZlB1M2gvenVWQVJP?=
 =?utf-8?B?b1RkS1N4Z3pzcFVYTXk3TXJSQVpDeG1YRXlCRU1wdzlBSndiVDBaMWRXUGZx?=
 =?utf-8?B?alRLQmNFK0VqRlN1YmxKcU1RQ05yMnhCbVUwTXRBbTdaRHBJQWlNRFRpbng4?=
 =?utf-8?B?TzlaV3dEblgvNHBreldWZDRob0w3QkgvblNTcWJxRnlRVmVPeVNEQjc0SUpa?=
 =?utf-8?Q?bDAQEb9p1d/OY09uB95QZB7pM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 646a0c9e-29f3-4d32-f177-08ddc8efbbbc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 07:16:53.0957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pSUAJs1bYU2DBlCjIIs/nyyrgMM8BwrGW4wKr4q9Yq36v41Z/b+l5DBQYpOAhfYkU3aIEt1MUpsxRVNgmkqTfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10286
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

Hi Shengjiu,

On 07/18/2025, Shengjiu Wang wrote:
> Add binding for the i.MX8MP HDMI parallel Audio interface block.
> As this port is linked to imx8mp-hdmi-tx, add port@2 in
> fsl,imx8mp-hdmi-tx.yaml document.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    | 13 ++++
>  .../display/imx/fsl,imx8mp-hdmi-pai.yaml      | 61 +++++++++++++++++++
>  2 files changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml

Usually, to add a new driver, a DT binding patch comes first.

> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
> index 05442d437755..cf810b277557 100644
> --- a/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
> @@ -49,9 +49,14 @@ properties:
>          $ref: /schemas/graph.yaml#/properties/port
>          description: HDMI output port
>  
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Parallel audio input port
> +
>      required:
>        - port@0
>        - port@1
> +      - port@2

Can port@2 be optional?
Note that video output can work with only port@0 and port@1.

>  
>  required:
>    - compatible
> @@ -98,5 +103,13 @@ examples:
>                      remote-endpoint = <&hdmi0_con>;
>                  };
>              };
> +
> +            port@2 {
> +                reg = <2>;
> +
> +                endpoint {
> +                    remote-endpoint = <&pai_to_hdmi_tx>;
> +                };
> +            };
>          };
>      };
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
> new file mode 100644
> index 000000000000..d2d723935032
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/imx/fsl,imx8mp-hdmi-pai.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX8MP HDMI Parallel Audio Interface
> +
> +maintainers:
> +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> +
> +description:
> +  The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that acts as the
> +  bridge between the Audio Subsystem to the HDMI TX Controller.
> +
> +properties:

In i.MX8MP TRM, HTX_PAI block diagram mentions an APB interface.
Does it mean a clock is needed?

> +  compatible:
> +    const: fsl,imx8mp-hdmi-pai
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description: Output to the HDMI TX controller.
> +    unevaluatedProperties: false

Why do you need this line?

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - power-domains
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>

Unused. Drop.

> +    #include <dt-bindings/power/imx8mp-power.h>
> +
> +    hdmi@32fc4800 {
> +        compatible = "fsl,imx8mp-hdmi-pai";
> +        reg = <0x32fc4800 0x800>;
> +        interrupt-parent = <&irqsteer_hdmi>;
> +        interrupts = <14>;
> +        power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PAI>;
> +
> +        port {
> +

Drop this blank line.

> +            pai_to_hdmi_tx: endpoint {
> +                remote-endpoint = <&hdmi_tx_from_pai>;
> +            };
> +        };
> +    };

-- 
Regards,
Liu Ying

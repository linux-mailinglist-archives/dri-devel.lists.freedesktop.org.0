Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDB4C45CB9
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 11:03:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4058010E044;
	Mon, 10 Nov 2025 10:03:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="5HLBTpOt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11020085.outbound.protection.outlook.com [52.101.84.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 085B510E044
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 10:03:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ezaa3Dmm7ZgzyCxPTha+gg9/puW1KdCS4oIbUc76AL85hZxvx8fYNIgJPZhAABaobeTybdBgB30ZxqKMYNsh7dWDNx6Q0yMTSEaM8E6sc0QFmeyP+EWh0hK9W9Q8EkLjVbMbLmRZWYw4IsDfPqLTFW4iv7jb7CUVcmU1WVbyWbUrSZLw769BbgVumqRdAsUgMK1Rvf7yCWYxJbH6jAHoG1llT0pjSzMZdOU/yeuS1acOl7lQp3aKuAi42ykeyywzrRPuDMznyvU1bRACCeLosF6/fvi9/JNbtT4ifU7RZyyFjkaPefAg4Ft3G/heBaaD2dxCZbX5UmSseDHW0HlAhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UHIk90k0NZLsfLS2kFuNikfaxGt5MDeIpfx45IdwXWk=;
 b=aBcVrv3BH6dAFr1JAzETcDolhNy0KDldAhxs9zTGp8FjsM/LoKKbRrOfRDRSxLEqkkzIfGHTQCec267HCXqFHLj63ntTwqTCfOeWxmmB5nLEEljbSEnm4nQl2TkJw2lmjG/thRNB6jy2yh5WQ3sOTTtWb1pe4XGohcUrCOX9vnueBqhW2/NdWreqZGl3Jm3KviDe8rFpdHRQmTV5QjIQbRZlzXRiLJEZAtp9UIFynThddpYVBs9kEH/LmDI8zC0WhHLqcDZEbhhNj6zQJGB0I619Fo+hI8aqiUagYGmyvaekol2pIXD3E5Hf1Swyq0atVSBN0Ct9hUwKiCrTc7wI8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UHIk90k0NZLsfLS2kFuNikfaxGt5MDeIpfx45IdwXWk=;
 b=5HLBTpOtFfbSVxYxn+r4TooKH7XR+z7Izf/PKsNTiLM9VbaItd04vmr5N+nZ9Cp2PvZuFcUOkw6kxb3fCkCoObgiDz8lg3CPPkVw5tb/429syz/NdpO1Vfn6w8nFIuSZVjRfslYwlytlEXXuGpnMEINTRIFwj0wykodm1usn36FhIcAjlExiODSvy3qk8p6byfPPX0L8ojULrH1hXAixifyldvDKYGUVjJstbUUIh9NDtiwA3KKS2bKWfp6ktGOFjAOzsPvcYzODYQ1svwl8URILg582IXiMlb1f1VqAAqFfv7LEAxyAnh+HAHpWjsmu8sKfFGV19EjwBHUnImkcrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
Received: from AMBPR04MB11741.eurprd04.prod.outlook.com (2603:10a6:20b:6f3::7)
 by VI0PR04MB10782.eurprd04.prod.outlook.com (2603:10a6:800:25d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 10:03:29 +0000
Received: from AMBPR04MB11741.eurprd04.prod.outlook.com
 ([fe80::c39b:dab3:ae88:c5ba]) by AMBPR04MB11741.eurprd04.prod.outlook.com
 ([fe80::c39b:dab3:ae88:c5ba%4]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 10:03:29 +0000
Message-ID: <59c36699-ee54-467f-9342-6756a0092a98@gocontroll.com>
Date: Mon, 10 Nov 2025 11:03:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] backlight: add max25014atg backlight
To: Daniel Thompson <daniel@riscstar.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20251107-max25014-v5-0-9a6aa57306bf@gocontroll.com>
 <20251107-max25014-v5-2-9a6aa57306bf@gocontroll.com>
 <aQ4a2SBDldYgQb56@aspen.lan>
 <f4e52cc1-9c5f-4069-9079-83be794ab2b3@gocontroll.com>
 <aRG359gIeP48V2ZZ@aspen.lan>
Content-Language: en-US
From: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <aRG359gIeP48V2ZZ@aspen.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P191CA0047.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:657::22) To AMBPR04MB11741.eurprd04.prod.outlook.com
 (2603:10a6:20b:6f3::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR04MB11741:EE_|VI0PR04MB10782:EE_
X-MS-Office365-Filtering-Correlation-Id: 602c95a2-a31d-4baf-e0cc-08de20406605
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S2NLTmh2SEJFek50MHNOQytXVlNvRUs1d1JXZGNoM3hXOG5WR0I2NGgxSzFO?=
 =?utf-8?B?RjVZYUpaUzlMZmdxRUZPL0phY0VtWGd3ZDc1RlgvKzFCK1NBc1Jnb2RmUk5z?=
 =?utf-8?B?QnNkVnlDT0w4WHAxZlNDTEp3Q0k5YmYrTE9aSSsyZVQwZlk2K2E1alpUYVdB?=
 =?utf-8?B?QVkySlo4Z1F0THFKSGtCOHdFbXlldjRlbGdJelE4RmM3U2Fyajh3cEc4TGtT?=
 =?utf-8?B?VzFFY2FqTmFQS2F6NGpsS0tRUy9QV1R0Q1dMeDA1SlREMzYyTzIyRUwvY1Mr?=
 =?utf-8?B?VFlqNjhuR0xXR3JoWUREVzRRSDFOVXdMT2hiUFJCS2xlR2dsWnpuU3pkYVgx?=
 =?utf-8?B?TkFoYXdkNVBpd3ZHckpBM0RYWTJqaUt4YUxyNTVqV2lhS0xKcHJ6QlhqNDFv?=
 =?utf-8?B?WEkvT2M3aTE4eTRXZUlVWlZueXNWTUo3UnhCU0ovaUE4RzV4ZTNXSlk2NC8x?=
 =?utf-8?B?ei9iTy8zUXFoWG8rODZzZ3JSS3ZLTEh5NEtOWmVBbUM2eVBMTVZTMndOSlhJ?=
 =?utf-8?B?dm9VK0JUa1ZhSkZPcHNUdkQ1dDk5bURYZmRSd2lidlpEQU9KRlBsdjUwLzdh?=
 =?utf-8?B?aWVMbWpwWFpVQmNRdjlqYXlwUXVQQVoyOTJFQi9QNXlEYURnb0FLdURJU2d3?=
 =?utf-8?B?dGpkcE8wZ2VkVzFFMDFGRDlXYzNjZzdoZGZocHVzNUcyL0MveWV1U3FOYnJp?=
 =?utf-8?B?ZGV0SUViSXkvRTdNWm1aeHpPUHc2L0V2aWxwTkRwNmNNTW92c3VzWFpCYmVi?=
 =?utf-8?B?ejdMbjA5YTgydXZOcGpVcmJuUzhWcmt5NFZ5K1E1a0gzd1h2R0ZaY2JKUWRW?=
 =?utf-8?B?THNvZyttNEtnNDl0dlF1T0hEQVVaN041MWlzekxyeEt1TTEwTXdHeUZxRHZJ?=
 =?utf-8?B?c283Vklsc3N5dzZReHZUSnV4NmdDSUhOY3hjb3JlS3RkZHYvZk1KczhTTkpN?=
 =?utf-8?B?OHNoMGpOa2hWUEd1dVZHdUpnRFNPdlAxUUdrWDg2N1lZdnRaVjVLazhRdjFB?=
 =?utf-8?B?VEx6TnQ0UWxDdEJocEJ4K3dZV2dRNC9OTEg4dkY1WDNDN2JOTjhMaFJMK3U5?=
 =?utf-8?B?cWRvWmhEbkwzZTVlWTdyMGJOdk1OWCtXNDRFV0grRE9RRXNvUG1tNE5vU2Yr?=
 =?utf-8?B?WlYxWHdkUjA1TWVEYStrc3NTRHkvOU1sWjVycG1pV21TNUpDaU51d0VGbFBR?=
 =?utf-8?B?UjQ5ODZKOFVTLzhmWE95dlFQdnBEWXk5YVFld01DRDVOdHo5THFocktWdmxy?=
 =?utf-8?B?NlByVjJJd2tUQk9NTkdWOWVFTlFXRUgxVE1KTXVHYlRHbHFSalVyN2xVWGZ3?=
 =?utf-8?B?S05TcGxlaWtmM3B2TFV6Vk9qd2tpTW1MbUw0cDhzK0IvNS81WlViYVUxQVU5?=
 =?utf-8?B?NFpQcjVjN3BUcmNVaEZ2NlRqZnU2RFBmN05nVG5lNzVmOGt6c05JNGpSbFZ1?=
 =?utf-8?B?cExZK1BFckxmMDFETG9MSUJOZk4zaUVnUlZTdERLY0Nub242YW4wVUhVRklS?=
 =?utf-8?B?S2xDNEQ0cUtrbjBMV0tTWEFpQmRwbjRsMFpVOUk5QVB4bjFHK05laG5vTXk1?=
 =?utf-8?B?Tm5OaFNVWWZCTUZVZTRtNGpSTm9FQnlqTEpjTzRXRzJiMkFydVVTeFlBL1lk?=
 =?utf-8?B?Vll0OE44R0pPb1BHL2NEQ2Q3SnNTc1ozUldIUElud1kzVDZyVDdsWFh4T2xR?=
 =?utf-8?B?MDFUVm11U1Bya0d3QXlHR01jNXdZOVFIMlRNVCtDNk9ZV3FGMHh5a0Z1YWNB?=
 =?utf-8?B?VURjTmdBT3QzaWZYUHhNZk1BVVp0SGxkL1VYbG84bk5ldUFTWFhrWHQ5akcy?=
 =?utf-8?B?MGN4VVpndHV6KzZBemh6eGFaWERKek1JU1VnKzc4RGNQa0MweStUQmV6bDJN?=
 =?utf-8?B?WXpPenpPay9LZFc2cmRtM2FpWllhZnkrcGw1L2hTSVEreUpNdW1PNjBYU0d6?=
 =?utf-8?Q?8+6eVy94tzymNDc0NqQSHzJr/GXFKSTA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AMBPR04MB11741.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eW5SNWd3SnpKQkxCNDNUZE56VXJxYTM0WEExeE1TODExc3ArYmtDNmU3aVRP?=
 =?utf-8?B?dGEzU3htS0xuQlYrU3JNZnZ3ZmNmWnNvTjZlamMwcVI1TDR4ckc0dnk5bkJ6?=
 =?utf-8?B?aXRxeDI5R0lvWm4vNzd2UTFTM3JwQjUzV3NVK3ZpTXhlU3ErZXVmVkhLMWZl?=
 =?utf-8?B?S1RMTWROY2JYaXJKVWtpY1BvWVFCRkMxVTlCd2M3aS94NkZPdStkd2N5S2ow?=
 =?utf-8?B?dnQ4ZXVTS3FLSnJheDMxK2hjNXdiQjZXRXNyb2VwQ0Mvc1poYVNzUzNaVWFN?=
 =?utf-8?B?K1VkMGI0NDgvalI5eUE0MU5UVWh2cEhZN2NjQzh4Um9SNGovd0ZmRUVVeitR?=
 =?utf-8?B?NHBWNzI2dks5UkFibmVQdEY3Q2plZlY5b1YwV01yc0gyOFlGZlo5K0dsWjhZ?=
 =?utf-8?B?MUxIVThLWmhDeHhFcFU5V1hRL3lNTUlic1lRY1UwbGpIZ1lqTFliWUlnSnF3?=
 =?utf-8?B?aEluSHJ2TG1NNEIrbUg1dDhrNGJEdS9pajhDUVBMdE15MnlOOGtDWDB5c1cr?=
 =?utf-8?B?NEg5MkUyMm9NZW5UenhLdU1JaFJ6Y0ZOL0FRaFVodXpKL3ppSWhlc0JCcHhW?=
 =?utf-8?B?UUJZYXpHeW8vL2E3UW5kT0tSb2ZFTDNJTmxpbXdDMStrdndMVUtFN2NjWDFL?=
 =?utf-8?B?Q2psM05qc1ZRditlM3g2MlI3Nll3c2ZLUzQ2ck5VNlpEUGlObWV4RTd4bGtr?=
 =?utf-8?B?Z2hVTXJha2tzOHFsNGZ5RjVlc25lWFIzVHNnSklIZlpKNUdhOWdQOCtaYnlp?=
 =?utf-8?B?QlNJU3Rld2pBbjQzdHNsME9IbzRSMTVTWEs0QlpxNmF2WkhRV2Ntc3lGM3FT?=
 =?utf-8?B?Wno2Q1U1dmdkT1plWU9XaFpoVUNoTENxWnEwY3FGdW9HSnhNckRmWlpmQlZQ?=
 =?utf-8?B?V0hsU3Z5QnZwd3gxTldTZXpNRUZOME5ma0ZtVlJ6WDJDMzZ5RFVVOWY3dFRD?=
 =?utf-8?B?RjJJK0xuTkVKMGxSTnZibmwvb2I3KzQwVDZ5bm5TbkpNZ1pnczNzVmZ3NGNt?=
 =?utf-8?B?YTFpVnRFZEFPN3o4SGFjZmZvTUh6SitoVG0rcTdkVkZHTEpPN1lZdENZZVd6?=
 =?utf-8?B?RFUyNVc2TTZpMjhvTHRTNk4xOWRZK2Y1cEZrL1poc1FycjJKN0JKTUtVQWxY?=
 =?utf-8?B?TG41ZWtWV2h1UzNvZmtaTXpVNEFLdHcyV3ZnRjVPZWhsOHdUM1FMY29GeEJQ?=
 =?utf-8?B?bnMvQ0F4dHNqcHBEUmFxMWtPdjh4Uy9xQnl2QmtYcnBqRmNBRUZNdFM0KytN?=
 =?utf-8?B?Zi9vOVFSSmZsY3dBQmZ3dnI5Z1djRlROM2tPTzNicEtSQytWZ2lsaE1jVWR0?=
 =?utf-8?B?ei9waGIvUzlJSkNDYWxoZlpjOXZBTkJ4dk90bEpiMG9rOXFQd2xFdzhlUGlh?=
 =?utf-8?B?djByaXU1dElXK0RSdXh4b1dnNGV3dWxNYXZyRG1TNmg5amp5OEdGVUtGYjh3?=
 =?utf-8?B?TUZqWHpIcTU0aHk4ZzRPd2diRXJtRkhCTHdNUU14QzZhVlNaSWNrTGVBcjFW?=
 =?utf-8?B?L0laZFNrVjlCeEMvT1l3b2tEM21ISjlxdVBSY1dVVlRNOTgwU1VhVHhFWEFK?=
 =?utf-8?B?SjJYOXVKSkYvSFc2cGVTVWdtNVdqbW8veGlUUTRsSU1KcitPd0hKcFFUMzk4?=
 =?utf-8?B?RlNKUDY3ZzBxcEUxWVFNZmdWUEpBcjdzVmxiWTAvMXZSN0ZBNng3clRBdjZP?=
 =?utf-8?B?UXZ1c1BHY1FxWSthWVlSaGNvZGhRbWxGcDdVakNLL2lMdVVzSkV0UlpxNDR2?=
 =?utf-8?B?RndudVd3dVExYVJYcWFWd1Q0aDBQZ2dabHk4V2d1WlNSQTNERkk0dXZZR2x4?=
 =?utf-8?B?QWF0UkR5R2k3dnJyc1RwOUtPRWI1UVVXcjFTV29qU2JvcFpmSkZlMUwrai92?=
 =?utf-8?B?TnpkZ1A0azdvMlpOTVpaZ2N6T1l5U0RPbWJrQXVMcXBpQVRud3QzbnNNMW1R?=
 =?utf-8?B?VnNhcDBWU1JoOUI3cmFvZDFMeSt6Zk14SHZ3RW1Uei83K29EQ0c4M1NzL1cz?=
 =?utf-8?B?aXZWVGFIODRONmlDSXVwYkpzUUdSRm1KcnM4YW95ODI2WnZvUkJ0WlgyWFEw?=
 =?utf-8?B?MTkrRFNKRzg2b1RhUHl0UXBhRDV0MkZWWnpEN1JkWStONGdkR3NvTi8vUjFT?=
 =?utf-8?B?cExFQUNEVFJyc2t0Q2FpRXI3YUp3SHpMbUh2ekJ2TjFaSWljenBydVkwbEV4?=
 =?utf-8?B?aSt0VmZ5OGpMUjNmMVFFZDRhQ2NiRzVPZmszQUJMK3ZVQ2srZUJMTWlieEhl?=
 =?utf-8?B?WHlUbnlRZjFJV2F5dXp0OHlFbkl3PT0=?=
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 602c95a2-a31d-4baf-e0cc-08de20406605
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB11741.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 10:03:29.6099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FYfSnpRhNaNVIsdF8ZZqrrrhDY83ZBIhpJXPNC9B8SF/FSd7m2rMMkEBz3Zeg7gIX9aUIylCnJkNQIShUCMxCx2pyPn8NB+7Ha4g9TOzAGg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10782
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

On 11/10/25 11:01, Daniel Thompson wrote:
> On Mon, Nov 10, 2025 at 09:40:07AM +0100, Maud Spierings wrote:
>> On 11/7/25 17:14, Daniel Thompson wrote:
>>> On Fri, Nov 07, 2025 at 01:49:59PM +0100, Maud Spierings via B4 Relay wrote:
>>>> +/**
>>>> + * @brief control the brightness with i2c registers
>>>> + *
>>>> + * @param regmap trivial
>>>> + * @param brt brightness
>>>> + * @return int
>>>> + */
>>>> +static int max25014_register_control(struct regmap *regmap, uint32_t brt)
>>>
>>> This isn't a good name for a function. It doesn't really say what it
>>> does. Please find a more descriptive name.
>>
>> Having a lot of difficulties find a succinct name that fits better,
>> max25014_register_brightness_control()?
>> max25014_i2c_brightness_control()?
> 
> I'd focus on what it does rather than how it does it meaning something
> like max25014_update_brightness() would work.
> 
> However, at present, this code is only called from
> max25014_update_status() so the simplest thing to do is to move the
> code into max25014_update_status() and remove this function entirely
> (then it doesn't matter what it is called ;-) ).
> 

Perhaps this could be seperated out if/when pwm functionality is 
implemented. I believe the brightness may also be controlled that way in 
hybrid mode, but I am not entirely sure.

> 
>>>> +/*
>>>> + * 1. disable unused strings
>>>> + * 2. set dim mode
>>>> + * 3. set initial brightness
>>>
>>> How does this code set the initial brightness? It doens't set the
>>> MAX25014_TON* registers.
>>
>> Yep forgot to remove that, I discovered the backlight core takes care of the
>> default brightness, so I removed it from here.
> 
> What do you mean by this? Are you sure you aren't relying on another
> driver to enable the backlight rather than the backlight core?

Not that I know of, there is the systemd backlight service, but I am 
pretty sure I can see it first turn on, then get switched to the old 
value by the systemd service. Unless the simple-panel driver controls 
it? The backlight is linked to that.

>>>> + * 4. set setting register
>>>> + * 5. enable the backlight
>>>> + */
>>>> +static int max25014_configure(struct max25014 *maxim)
> 
> 
>>>> +static int max25014_probe(struct i2c_client *cl)
>>>> <snip>
>>>> +
>>>> +	/* Enable can be tied to vin rail wait if either is available */
>>>> +	if (maxim->enable || maxim->vin) {
>>>> +		/* Datasheet Electrical Characteristics tSTARTUP 2ms */
>>>> +		usleep_range(2000, 2500);
>>>> +	}
>>>
>>> If you really want to keep the devm_regulator_get_optional() I guess
>>> maybe you could persuade me it's need to avoid this sleep... although
>>> I'd be fairly happy to remove the NULL checks here too!
>>
>> Just wait unconditionally?
> 
> If you think it will be unusual for the driver to be used without enable
> or regulator then it's ok to wait unconditionally (all examples you
> have added so far have an enable pin).

I think it may actually be a very common implementation to have the 
enable pin attached to Vin, we don't have it set up that way. But it is 
displayed that way in an example schematic in the datasheet.

Kind regards,
Maud


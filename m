Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uK2XDOL4cWmvZwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 11:16:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4076B651A6
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 11:16:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C307D10E0CD;
	Thu, 22 Jan 2026 10:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS8PR02CU002.outbound.protection.outlook.com
 (mail-japanwestazon11022078.outbound.protection.outlook.com [40.107.75.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6992A10E0CD
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 10:15:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YyufKJqF38zjivLfEBUu2KJWAEhGgJwgqAEIvq+8tRs+v0JxXuPbrq4OZVDFaPbjk2Q3RpO6VXDE3jqHIATEzX61zF2Cv312j/MlT6MkNowbt6ePsn3ckuNVH+MDpAj1VULVHSBr7yw2fXLA/6/Bl7X7zX5V0NeON3mTt3NJgSuY3eaf3f37I7eskvUiYbMTIAc9R33tXD3H0TfKpwobVb1KEDwpNsbpXtux2oQ8oUXHG+ZHbBSBpoBwFHWBo7zijy5BxJRHAFULpmYAiwDgrakGQS9DtY9bnqS2vYEqyMb/zedpEhk2gv/BLls3KQhurDzNqQN7VNpCcBBbqaUC2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=peii8Ggb7SGWOg6fXNcTJAG19niEhzEQI6P42wroAF0=;
 b=TgEPYhVQIW9Wk3N4Ssy3J0uQmbMYRbvfxgVwpYUN7Ub3MaNrTeOl0J53qnVJ2raTQoTZBUvtdszCkqpkPEd3fiGzC6caNF1Y3nyJkboVxBA1VV5Gczb95Rwp+U12TtPs16AJsnSwVx86++OBK2GbkJ8aqMpoQ9CQkAS+i9dZ4CJIdBU8qFXza0wezVQZm6DWLZsgwBS+oI7Cn0DM8sBV1FxbTHlBAMYX+O242ZsmHw76WRNTTb/XXUJbTQWok00OfxtHiaVva6/Lzd9CtSEuDxKNuF8sSFJ+9uTMpnmeReQkE/gHvZqBnSm1Wq+R7ddKFSOFs9uFSoR/r44I5B06uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=linumiz.com; dmarc=pass action=none header.from=linumiz.com;
 dkim=pass header.d=linumiz.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=linumiz.com;
Received: from TYZPR06MB6935.apcprd06.prod.outlook.com (2603:1096:405:3c::9)
 by SEYPR06MB5790.apcprd06.prod.outlook.com (2603:1096:101:b9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 10:15:47 +0000
Received: from TYZPR06MB6935.apcprd06.prod.outlook.com
 ([fe80::30b6:5b0d:1b00:5a01]) by TYZPR06MB6935.apcprd06.prod.outlook.com
 ([fe80::30b6:5b0d:1b00:5a01%6]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 10:15:47 +0000
Message-ID: <8479971d-a0ee-4fb7-8cea-82e5f86d3b8e@linumiz.com>
Date: Thu, 22 Jan 2026 11:15:39 +0100
User-Agent: Mozilla Thunderbird
Cc: parthiban@linumiz.com, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 paulk@sys-base.io
Subject: Re: [PATCH v3 1/6] phy: allwinner: phy-sun6i-mipi-dphy: Support LVDS
 in combo D-PHY
To: =?UTF-8?Q?Kuba_Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>,
 Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20251116134609.447043-1-kuba@szczodrzynski.pl>
 <20251116134724.447131-1-kuba@szczodrzynski.pl>
Content-Language: en-US
From: Parthiban <parthiban@linumiz.com>
Organization: Linumiz
In-Reply-To: <20251116134724.447131-1-kuba@szczodrzynski.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXP287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::15) To TYZPR06MB6935.apcprd06.prod.outlook.com
 (2603:1096:405:3c::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB6935:EE_|SEYPR06MB5790:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d416b34-d450-4a8e-abb3-08de599f359d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OW0zVkRMSHg0bFNwbUlzaXdXWkdjVzNuY0Q5Vm1YbFhmL2QrWVZWak9vc1lZ?=
 =?utf-8?B?U084cDh5LzRBRjM0NHBLN09kTnBKL29YdTB5Nk02Q0JqRjJTaDBHOEJwMFRI?=
 =?utf-8?B?UVc3UTRZelR3cjhpeWRFN3QrNjAxaTJ4MWxrRElEUVNzaUdQUUtxT2NRM3Rj?=
 =?utf-8?B?aGZEQmNwTE14RFc1dTZVMlhFM2hUVzVqd1FYb3dsVloxTGg0cjNJOURDcS9Y?=
 =?utf-8?B?S0JQYnlJd0JPWUd0SzF2aVZnb3JCcjdMNEtlaVJiTGVhdUliS0gzMlQ1WWJw?=
 =?utf-8?B?Q0liMDl1bEE3K1VzT2JySjRwR2t0MEpYekJ4ekR5RTJlZTNSWXp1NWhsb1Jn?=
 =?utf-8?B?SS9YOS8rcnMyTjUxNnZNU0RHb2pVMnh0eFdXOGFUclJsVCtXVkd6aTRlY3BL?=
 =?utf-8?B?OE52cmk0NmVOdG92NFFQeit1RDFLMkpBNVgxdjNDdGVDak4yRXdwOHZ6akJz?=
 =?utf-8?B?OU5OZ0wrTTBVRDRuUmFCeURhaVUxNmw2bmtKRktiZUNYZnZoeFpQSk1wLzBo?=
 =?utf-8?B?UWNPaTk4bGI2aE4xZ3BQR3Y2b0swYllSWnZDRy8zbU9rZE00MytaZlVMVGtu?=
 =?utf-8?B?NVVLVmJaZGZsYllzZTFwKy9vazlQbVZXVU9IUzJWeE9lY21JYVhqZEhpaVBy?=
 =?utf-8?B?RFVqMWhVeEkzSmMycXdEOWZIdVB4ZDhabXEwU0RrZ0N5akJEaEJSL2pYU3Fr?=
 =?utf-8?B?dmN4WGYzaFg3SGRiblFRZlZEUXp2dndxQXRTakJ3Tllrdktpc3hTUEg3bHpq?=
 =?utf-8?B?eFEvQWFxS1YybEIvZXBUOWVlUXFiRjM5SXc5NFNLVDMvUGNoWERrYmxxdGU1?=
 =?utf-8?B?SGtQVXZYN3VtZ1pLVC85cWtRd3NiVkNlZzRHK1hnYkpQWWN0VDY4Zmd5KzdZ?=
 =?utf-8?B?TjBHdVVJY0IrV0xpeU9RcGhtUHRGbmxYQWNQTnE2cVVuR01IZnMwZ2prcmpp?=
 =?utf-8?B?eVdjeXA3YXV5S1NMOHNobWZQZW5NN2ZsZndUdHFTTWJRek9WWVA5L3VPZGRS?=
 =?utf-8?B?Y1hGcU5idXZVZUgzZUlzN3hiSHd1OEtISG9uZ3oyVG1WZU9wbVVGeklVcWUr?=
 =?utf-8?B?ckJueDhXb005WEFWM3VCVTg5RUMydDZXWHRKMnJHWHVEWUsrRlpyNiswQTdr?=
 =?utf-8?B?TFFKQTJMMUMxTTQ3Q0RwNE15N09DOVVnUlR2Z01nM1Q1a2hzMjRhQnA1eHYx?=
 =?utf-8?B?YVVzYzlDamVPWlpGckNIek4rMmpoVU40b3NTUUVKT2U5S0RCcjhZY05pUDF0?=
 =?utf-8?B?cmNzVXNPeVV4czFLRzY3dENTcnpIK2I2ZmdtUmc1VGFxekl3V2lGNlhMTEVG?=
 =?utf-8?B?MWZDMHFXYWY4eE9tZGk1VVViekl4dUluZEJ6REd2bk5wbnp0S0NObXI2Q2ZZ?=
 =?utf-8?B?ZExlc3hWT093cVRsZjM1cEZiTVU1c01OenB5bXNPdTJ6RzRSQnBHa1hZOUk5?=
 =?utf-8?B?QUswb09IWDBXREU5ZmpaRXNrT3UrSFN3dm5yYVNrZlJWaXRkazVNaXF3b2t4?=
 =?utf-8?B?T2VTZUJaeUpGandVN1lSYzlPa0xEQStxNkt2QS9QRjhuMjkvQkpkQ3NvUEVa?=
 =?utf-8?B?TTFzWk9vOWR5R0lhb01xeFB2UHJVc1l1ZGQ0MkNaM29uajZZY1ZaNGw2SlN1?=
 =?utf-8?B?OXlUSHltZkpaK1NLZ1BmNmFWQTZOc29lTWRRQzNjOUlJZTRwR0EwbHBueTRq?=
 =?utf-8?B?TjVJTmc2RWtXaGRMOHE2WjNUdFNMR3RET29wNmVjZUZhY0FLVEFPbU9Fb25z?=
 =?utf-8?B?dlVFcFRnZnY2TUpDdy9RUTM3aTVXY3BNOWN1MDhJRTlpUG55VjFJeXRNVnVY?=
 =?utf-8?B?dmtGWFYwbTVwc0FWbHdUZXlTUDBLdTlUc3Z2VTVJUU5OMUZsOVNVd1UwRTRJ?=
 =?utf-8?B?aTN2NGt3NEpCUGVrblcrUEJ3MUxDSmYxaklTWUo5K2c4cjhmb1BMRHVqTndt?=
 =?utf-8?B?cTFoZmJCUTBiN3BFczlYRkZNSjAwRmEzWG5aRmVVb1RaWUp3c2t4M3Rud0dj?=
 =?utf-8?B?Zk52RFFMQnlmVktDcFhYQjUwZjRSa3cwK0Y3aytIVWhFQVB1SDlVNUhtd0ta?=
 =?utf-8?B?clE3SmhVV04zc3FseGJlcDBOK1VrQjlvTFRXMTJHd05UZDA0eHlhdlI5cW1r?=
 =?utf-8?B?Yk1Ma1c2Rkc0SC9OSGFpUE42bVBpNStLY0xFM0w1Z2R1bElGaDhJYys1dVdn?=
 =?utf-8?B?WGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB6935.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(7053199007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUpFNGY3Qzh2V1RZa1pDU2k3UzJQL1BrTmlVQkdXSGJxMm9SRjhwWC80ZGZi?=
 =?utf-8?B?VEl2Y2loUDlDZ0lLc1dkQ1dHVkJTSVZ5ZVZpWGpyVmlJd0djZHI4dE5kMnNM?=
 =?utf-8?B?cjVENWJtZ3BJV1FER2RocmUxa25HZ2RhbEhOREord2k4NXM3d1RZWTNNaU5u?=
 =?utf-8?B?aEtLOUhhblRGNW9lZlVvL0orTTE1RWlVU3liWWxjV0tkbEMxUS9WM3hjaGE2?=
 =?utf-8?B?WVozeWlSNk9aMG9hMW53WWx2M1NVZnNpZmgxb3ZYRzRaVHJtSzlHSUNFTW5l?=
 =?utf-8?B?QUUzL2ZqQlFTODlJd0pWMkMxVThlZ1B5bUNwektQZHV3eGRhNUZHYjRmOUR0?=
 =?utf-8?B?dk95OHorOGc3Y0dET05YTGpydkFkTThDcG1kMzZtZzcrOVlCaUtlSldHY2dY?=
 =?utf-8?B?L2FpUnljeko2ZXpmQndNekYyQzRQcloxVDhWYWxIckFJNFFLb0ZHZHFXM2I0?=
 =?utf-8?B?MTBQZStlVHBzOWZOMDhWL2JoZkRTNTNTbmdyV0hHbDRydHY0MnNLZFhYVkVI?=
 =?utf-8?B?LzN3aVFXNEsxOGxyWDJaRXFIcStYVHREbDh4TS9lQWlsVENXR3IzbnZ5T0h4?=
 =?utf-8?B?TTRGWXo3ZGhIVnM3a1VabTdVeUs0bTFVZ2pYcmFYeXFBZGJPaS9PdGdraGlo?=
 =?utf-8?B?a2NGMnVCVG5PS3psUzEycnlZWm9nTHBLN2Zlb3NmZG05Y0Z1dGRwVE1pTkI0?=
 =?utf-8?B?NVUvOXBhNmJyWm90eTdzYlB6cnhFT1hXMklKdS9FN1Zhb2ZRTDA2dktXbHRv?=
 =?utf-8?B?QWtQYzl2NGFsTjlseUI0TU5FVkVoVHR5VWF2RE42TVA5ZjI3a0FLakgrZ2FW?=
 =?utf-8?B?UXUwWE9RZmNXWS83M2tISFBqaWd1YXl4KzRHUUp1R2kyS29iOXRrYlhyMERM?=
 =?utf-8?B?czkzaWVHNnpMSmNGQ3NPdU9tcEtieUNHY2N5RW5vdFpYVHFlOVgyUWxQdXdD?=
 =?utf-8?B?VHN3cjNVcHlEM0dETXVQMGRTNFNaNFB5WGZ6WkFKWE0vWE9qMEk1NjNDbkhS?=
 =?utf-8?B?aStpZ0o2SDA2VE9ScGNoWmdlSE5FL0YrSXNWZ0l5ZGZjR2ZzT0dwQ201ZXcw?=
 =?utf-8?B?ZUUyODBCbWhZYVZJd2Y4TGYrbHdJUXMwV1VURFlFSjRLemRhWFpCVlZ5ZzVB?=
 =?utf-8?B?NTg2ZUhkTThSZHB6WmNsUktYRTkrWmNwQzBxNGhpOFg4R1pEbURGWmo3eFpU?=
 =?utf-8?B?TWw3STdMSWp6N0xkR1hJZlUvQk5nRU92ZGdHZ0NmaWhEV1ZjVk15bGw5VDRY?=
 =?utf-8?B?dzFvY0U3STFOcjlXL0h6RzJhc05hRG5Xa0luallaOGoydDdDWXRBTnpyMVdI?=
 =?utf-8?B?VDZPeHM0c1psWC9oaHFEcGh4SWR1NHN5aW5CK1JSSWNwendlWHRJZ0JWc2lO?=
 =?utf-8?B?UTVsSE4zRmdXSHMxaCtMRlRNK0F6YkJ2Y2hOc0prbHh2VkhlQzlIeHYxTlFO?=
 =?utf-8?B?WFR3R3lyVlRMSm0wTEZvR1VRQXo1dzFQeEZ2dVVDV3VaRnNia1VGOU9zN2do?=
 =?utf-8?B?QU11Rkl2QkNOaVY1WWd6cE1WVld2RENpQ3FIZHdiSEhJd0phUlluaUV5TjlH?=
 =?utf-8?B?b2pHY09YQ1hJd0hrRFNNQWZNTGZ0SzY5Yk0wVUMwWHhIbXVKbjU4WVd4dHJx?=
 =?utf-8?B?TVZzdFkxc1dSYXZQM2NhdUwzWmhZVUdOQ3hwZGdVdVZRako3TG9EN25RU3R3?=
 =?utf-8?B?cGZJeTRJbVEreHF2emR0cFJSRmpIL2hreVA0a2huVi9qUW54ZXMrN0lmVjA0?=
 =?utf-8?B?VHI3ZDFnWnp5SmRHZ0tLeWpMd3NTM05QVlBZTEYvVVJhcnl0dllBYnh1TFFY?=
 =?utf-8?B?V2Rod2tORDU0TUJybUVrSWYrODBacU56OGZMUGttT21yaEVzNWJuS21hSGlz?=
 =?utf-8?B?WU0wOVNGWWFzRVEwU3pJWGxmQU9rbnkxMklyNWRkSGNpejlHdERqMGxHWmx2?=
 =?utf-8?B?WWo2SCtqemxtYnN1aVpXK1FGMDZrdVZYTkNQM0czUU9iTk5xeXl4ckVaQlNN?=
 =?utf-8?B?di9vcUsyVUVLS0VnckFQTzVUa0orQ05PSmlHT2dJL3lzRnJvMmMySmhVL3dp?=
 =?utf-8?B?aHBPWTNmWWJkY0hqTG9DYko1bWZ3czRyRjNYcnpERHg5WU0zaU85MEVSR3Zw?=
 =?utf-8?B?RkZPQjl5b3ZVRG5oUUpiOVdKSTNiMExpR3FxZ0hhWStSeENTR1graU5OQzda?=
 =?utf-8?B?MnhHSHhaREVtVVFlUGl2MnRsUURWenlMVkh2VXEyZHY2NWlrK3RHc0ltTEYv?=
 =?utf-8?B?WjhCUFZCa29oWldDeVNlOWcvcHUrTVV6SWcxaFBCQmVSRXcrRVdXZk9jSUZp?=
 =?utf-8?B?Q29meHBMVFQrcVdYdzBJWVdQZU1XVkx1QzlSVHZjVWtkT2VoK1k4UT09?=
X-OriginatorOrg: linumiz.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d416b34-d450-4a8e-abb3-08de599f359d
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6935.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 10:15:46.9403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 808466aa-232a-41f4-ac23-289e3a6840d4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xZS28ABboNn50kAevuHRdSUpyY/U5ifRPywiiwarsHjN+2IFpsWT2/dOnZnyCfez5hilToa5u1FC3f4NHY0+5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5790
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.11 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:parthiban@linumiz.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:paulk@sys-base.io,m:kuba@szczodrzynski.pl,m:mripard@kernel.org,m:samuel@sholland.org,m:wens@csie.org,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[linumiz.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[parthiban@linumiz.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_TO(0.00)[szczodrzynski.pl,kernel.org,sholland.org,csie.org,gmail.com,linux.intel.com,suse.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[parthiban@linumiz.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linumiz.com,gmail.com,ffwll.ch,lists.infradead.org,lists.linux.dev,vger.kernel.org,lists.freedesktop.org,sys-base.io];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 4076B651A6
X-Rspamd-Action: no action

Dear Kuba,

On 11/16/25 2:47 PM, Kuba Szczodrzyński wrote:
> Some Allwinner chips (notably the D1s/T113 and the A100) have a "combo
> MIPI DSI D-PHY" which is required when using single-link LVDS0.
> 
> In this mode, the DSI peripheral is not used and the PHY is not
> configured for DSI. Instead, the COMBO_PHY_REGx registers are set to
> enable LVDS operation.
> 
> Enable the PHY driver to work in LVDS mode on chips with a combo D-PHY.
> 
> Also change the SUN50I_COMBO_PHY_REG1 macro names to reflect the correct
> register name.
> 
> Signed-off-by: Kuba Szczodrzyński <kuba@szczodrzynski.pl>
> ---
>  drivers/phy/allwinner/phy-sun6i-mipi-dphy.c | 70 ++++++++++++++++++++-
>  1 file changed, 68 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c b/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c
> index 36eab9527..57035b3a4 100644
> --- a/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c
> +++ b/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c
> @@ -166,8 +166,8 @@
>  #define SUN50I_COMBO_PHY_REG0_EN_CP		BIT(0)
>  
>  #define SUN50I_COMBO_PHY_REG1		0x114
> -#define SUN50I_COMBO_PHY_REG2_REG_VREF1P6(n)	(((n) & 0x7) << 4)
> -#define SUN50I_COMBO_PHY_REG2_REG_VREF0P8(n)	((n) & 0x7)
> +#define SUN50I_COMBO_PHY_REG1_REG_VREF1P6(n)	(((n) & 0x7) << 4)
> +#define SUN50I_COMBO_PHY_REG1_REG_VREF0P8(n)	((n) & 0x7)
>  
>  #define SUN50I_COMBO_PHY_REG2		0x118
>  #define SUN50I_COMBO_PHY_REG2_HS_STOP_DLY(n)	((n) & 0xff)
> @@ -181,7 +181,9 @@ struct sun6i_dphy;
>  
>  struct sun6i_dphy_variant {
>  	void	(*tx_power_on)(struct sun6i_dphy *dphy);
> +	void	(*lvds_power_on)(struct sun6i_dphy *dphy);
>  	bool	rx_supported;
> +	bool	is_combo_dphy;
>  };
>  
>  struct sun6i_dphy {
> @@ -222,6 +224,18 @@ static int sun6i_dphy_configure(struct phy *phy, union phy_configure_opts *opts)
>  	return 0;
>  }
>  
> +static int sun6i_dphy_set_mode(struct phy *phy, enum phy_mode mode, int submode)
> +{
> +	struct sun6i_dphy *dphy = phy_get_drvdata(phy);
> +
> +	if (mode == PHY_MODE_LVDS && !dphy->variant->is_combo_dphy) {

At this stage mode will be PHY_MODE_INVALID by default. So the consumer fails with set_mode by
default.

IMO set_mode shall set 
+       dphy->mode = mode;
+       dphy->submode = submode;

in the sun6i_dphy and retain for the next calls like power on.

> +		/* Not a combo D-PHY: LVDS is not supported. */
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  static void sun6i_a31_mipi_dphy_tx_power_on(struct sun6i_dphy *dphy)
>  {
>  	u8 lanes_mask = GENMASK(dphy->config.lanes - 1, 0);
> @@ -329,6 +343,43 @@ static void sun50i_a100_mipi_dphy_tx_power_on(struct sun6i_dphy *dphy)
>  	udelay(1);
>  }
>  
> +static void sun50i_a100_mipi_dphy_lvds_power_on(struct sun6i_dphy *dphy)
> +{
> +	regmap_write(dphy->regs, SUN50I_COMBO_PHY_REG1,
> +		     SUN50I_COMBO_PHY_REG1_REG_VREF1P6(4) |
> +		     SUN50I_COMBO_PHY_REG1_REG_VREF0P8(3));
> +
> +	regmap_write(dphy->regs, SUN50I_COMBO_PHY_REG0,
> +		     SUN50I_COMBO_PHY_REG0_EN_CP);
> +	udelay(5);
> +
> +	regmap_update_bits(dphy->regs, SUN50I_COMBO_PHY_REG0,
> +			   SUN50I_COMBO_PHY_REG0_EN_LVDS,
> +			   SUN50I_COMBO_PHY_REG0_EN_LVDS);
> +	udelay(5);
> +
> +	regmap_update_bits(dphy->regs, SUN50I_COMBO_PHY_REG0,
> +			   SUN50I_COMBO_PHY_REG0_EN_COMBOLDO,
> +			   SUN50I_COMBO_PHY_REG0_EN_COMBOLDO);
> +	udelay(5);
> +
> +	regmap_update_bits(dphy->regs, SUN50I_COMBO_PHY_REG0,
> +			   SUN50I_COMBO_PHY_REG0_EN_MIPI,
> +			   SUN50I_COMBO_PHY_REG0_EN_MIPI);
> +
> +	regmap_write(dphy->regs, SUN6I_DPHY_ANA4_REG,
> +		     SUN6I_DPHY_ANA4_REG_EN_MIPI |
> +		     SUN6I_DPHY_ANA4_REG_IB(2));
> +
> +	regmap_write(dphy->regs, SUN6I_DPHY_ANA3_REG,
> +		     SUN6I_DPHY_ANA3_EN_LDOR |
> +		     SUN6I_DPHY_ANA3_EN_LDOD);
> +
> +	regmap_write(dphy->regs, SUN6I_DPHY_ANA2_REG, 0);
> +
> +	regmap_write(dphy->regs, SUN6I_DPHY_ANA1_REG, 0);
> +}
> +
>  static int sun6i_dphy_tx_power_on(struct sun6i_dphy *dphy)
>  {
>  	u8 lanes_mask = GENMASK(dphy->config.lanes - 1, 0);
> @@ -492,6 +543,13 @@ static int sun6i_dphy_power_on(struct phy *phy)
>  {
>  	struct sun6i_dphy *dphy = phy_get_drvdata(phy);
>  
> +	if (phy->attrs.mode == PHY_MODE_LVDS && dphy->variant->is_combo_dphy) {

+       if (dphy->mode == PHY_MODE_LVDS && dphy->variant->is_combo_dphy) {

compared like this.

Thanks,
Parthiban

> +		if (!dphy->variant->lvds_power_on)
> +			return -EINVAL;
> +		dphy->variant->lvds_power_on(dphy);
> +		return 0;
> +	}
> +
>  	switch (dphy->direction) {
>  	case SUN6I_DPHY_DIRECTION_TX:
>  		return sun6i_dphy_tx_power_on(dphy);
> @@ -514,6 +572,11 @@ static int sun6i_dphy_power_off(struct phy *phy)
>  	regmap_write(dphy->regs, SUN6I_DPHY_ANA3_REG, 0);
>  	regmap_write(dphy->regs, SUN6I_DPHY_ANA4_REG, 0);
>  
> +	if (phy->attrs.mode == PHY_MODE_LVDS && dphy->variant->is_combo_dphy) {
> +		regmap_write(dphy->regs, SUN50I_COMBO_PHY_REG1, 0);
> +		regmap_write(dphy->regs, SUN50I_COMBO_PHY_REG0, 0);
> +	}
> +
>  	return 0;
>  }
>  
> @@ -533,6 +596,7 @@ static const struct phy_ops sun6i_dphy_ops = {
>  	.configure	= sun6i_dphy_configure,
>  	.power_on	= sun6i_dphy_power_on,
>  	.power_off	= sun6i_dphy_power_off,
> +	.set_mode	= sun6i_dphy_set_mode,
>  	.init		= sun6i_dphy_init,
>  	.exit		= sun6i_dphy_exit,
>  };
> @@ -619,6 +683,8 @@ static const struct sun6i_dphy_variant sun6i_a31_mipi_dphy_variant = {
>  
>  static const struct sun6i_dphy_variant sun50i_a100_mipi_dphy_variant = {
>  	.tx_power_on	= sun50i_a100_mipi_dphy_tx_power_on,
> +	.lvds_power_on	= sun50i_a100_mipi_dphy_lvds_power_on,
> +	.is_combo_dphy	= true,
>  };
>  
>  static const struct of_device_id sun6i_dphy_of_table[] = {


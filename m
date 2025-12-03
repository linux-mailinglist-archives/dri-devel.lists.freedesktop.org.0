Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BC3C9E27C
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 09:11:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4942F10E72C;
	Wed,  3 Dec 2025 08:11:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=amlogic.com header.i=@amlogic.com header.b="hd6ljuc+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SEYPR02CU001.outbound.protection.outlook.com
 (mail-koreacentralazon11023086.outbound.protection.outlook.com
 [40.107.44.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2D9910E07C
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 05:56:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qZPY1TFVvd+axomoSNG6MANdglc6eshL4V42ORsalwVrNfj4dgTKunm8aAxaW1y8SJXGsk5og7v4n6/okEBgvYamCWW3SSiaG/+8mRDDSQV/YOXitYApLPlD27XU2TdhStLM3S6EAUa23+kTsNeQpV4t5+WZbMMsZ8od1C+lkxovgKLB6siCjUnZtCvULohAfNK5eGa49rbjApjF4PPDHLkjsjK/CXN7gPLcnbr1sLuaIcLbuS7xV0M2xuM2vhVT9Y62oKMdMgtfNx5cvn3INKQSjcljVfPtT5jlkJKWzNhes1fPPxfEbwEQQRLQS69W+7AF6w8E8GV9SJ3MEGz/QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CRn4zCETQm4Rb/oWWWFg/WTlFsdLaejUaA04/aetPus=;
 b=gjbHLFQRpWHCLC+zPHsOe0VOKUxjNrTqQSTU2e7CLnnJMj8y1xeS/wXo8XzRfNiFCJK7nP4ezXBDAnBSeO4YC2/+mgnMFS4WdzTVCNqhCujU8dLEbo9zDFw6EoGBfvkc+6vzPuB9fbJrDwPHjHOevu9ThzH/YkgoVG+tqP+YsYCL3ytxTOVVfmCktRXsbh8q8+5HRHrByTILipMm4NwRInPV4TGxFW1hWTKs6nROKCKSZnfuNh9+ens4sI/zANOfmkzJ5/uEs6oXB1xFVsRWOFe1rr9wc3FjoUtK6UBCVizXtwMYKvslQlaaKf2diCyg41d7QsYY1hPqNecIWiRsMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CRn4zCETQm4Rb/oWWWFg/WTlFsdLaejUaA04/aetPus=;
 b=hd6ljuc+V2qGhNy8X0NHGKLxv/P9yf5x9RMe1ymdKkjJGontgXdP+fkDEIcSBtS+qyTbF1QqqxGFeVD1BH7Q4pFQi/Uc54/ixOYKoAkQHp9QJ5l8DQZwffKCP6tJiQa6WeXRflM5AgEpslwr8vAPHoppHVVpvhj3RXHi01vjSlmmWVn/DIaY+qrF22ij8G1SjBdJinj9xzzLywiigJiwraLwwZ19rHd/i03wKHEewNgVZ2mM8AMA6kmxkUeMdObqvNngpAklW2PnoqtqMHjb3f+l5ao1GX1rRYtN+VE8vy+Xn0tuaYC5H6VJBn/JWiMMr42HoUOmWtAJB8Jonlwj0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB7155.apcprd03.prod.outlook.com (2603:1096:400:33e::5)
 by TYSPR03MB8446.apcprd03.prod.outlook.com (2603:1096:405:60::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 05:56:20 +0000
Received: from TYZPR03MB7155.apcprd03.prod.outlook.com
 ([fe80::8d2f:b8cd:fdec:5724]) by TYZPR03MB7155.apcprd03.prod.outlook.com
 ([fe80::8d2f:b8cd:fdec:5724%4]) with mapi id 15.20.9343.011; Wed, 3 Dec 2025
 05:56:20 +0000
Message-ID: <070eb0a3-2f6e-41ef-8310-0c592a2816dc@amlogic.com>
Date: Wed, 3 Dec 2025 13:56:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] dt-bindings: display: meson-dw-hdmi: Add compatible
 for S4 HDMI controller
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Cc: Chuan Liu <chuan.liu@amlogic.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
 <20250110-drm-s4-v1-1-cbc2d5edaae8@amlogic.com>
 <3AC316FA-A633-4B6C-81BA-CCCA290E7F03@gmail.com>
 <8c3b9fa4-326e-4791-8154-07b268faa132@amlogic.com>
 <7703796D-35D4-4AD2-B7F8-B75D2BE0F7AD@gmail.com>
 <a71f24c9-1f40-45a1-8fdb-6075bbf89930@amlogic.com>
 <F04DC684-AD64-447F-87EC-F503D411F25D@gmail.com>
From: Ao Xu <ao.xu@amlogic.com>
In-Reply-To: <F04DC684-AD64-447F-87EC-F503D411F25D@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0025.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::16) To TYZPR03MB7155.apcprd03.prod.outlook.com
 (2603:1096:400:33e::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB7155:EE_|TYSPR03MB8446:EE_
X-MS-Office365-Filtering-Correlation-Id: db2a618c-6a3e-43e0-f5a3-08de3230ae8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|42112799006|366016|1800799024|376014|7416014|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SnRGenVXL3VFUXhYaFU0ZHBzaE1VWW1GUlVvY2hCZ1NHQ01IMkpZV1k4bm9n?=
 =?utf-8?B?ZTB4cHRCTFJBL0NocndvbEhvVmxGVU1nc29WcFJJUC82MlBKSVRzZ0tQdzZY?=
 =?utf-8?B?YTIxanZWV0gyOGRWN0tyWWgvc0VMUTlaOEhrc29peVV6RlRscnhmL1I5cTFy?=
 =?utf-8?B?dXFrNW1QQUhLSW8waWswSWRmWXNjZmgySUgzTnFpVndwZDIzSjBUT05XVFU0?=
 =?utf-8?B?SmRKUElRaWFQWmg0RjNZTW02UEVFSEJVSVpQL0w5NlJLaUU5eFFIbStEOHVJ?=
 =?utf-8?B?N3E4cUxuQ2psMjZsWC9qQzRaamIwWmhSUC9UdTZmQWxuM09BQ3Z0SWZ0ZVEv?=
 =?utf-8?B?c09lcFVCTEt3QzBQN2UxWENOVldhWUFkN3gzUFF2NGF0WmZ1WDJFb1YrUmZm?=
 =?utf-8?B?YW82OVpJT1pZODJDa1NwRXl1N1QwQjY3Tnk3b25xQXNoaTFWQURLZmhDTzhs?=
 =?utf-8?B?cEtPOG5iQi8zYWxmUlRhcHJzeUhyMlg3MXFiaEduRERjZko0UnJRa2tmTnYv?=
 =?utf-8?B?V3pEWGtCMEYyMFVjYk1icEF3Y0pwRFhxMnhsWGppY2lod2JBMWJSMlFYYUZW?=
 =?utf-8?B?eXdhTFNnZlV4OGpTbjJvcG9mQmlnM3NlenhFM0lHTlJTYUxmNCtFNGcrZ25D?=
 =?utf-8?B?RXgyRXJxMnlDaDdkNWpCeDA1cGEvZkxQb0kreE9aMStjZFg5dTA1Zk5DTkQ1?=
 =?utf-8?B?R09IZzduUk45M3pyRzM0RjRZSC9nOFVFbzFDMVczMUthbi80SG1ZbTRreTVX?=
 =?utf-8?B?T1FnZUhPUVlXWkh6d0h3Z0NGeEdhbklKcXgyUE51bUhNNFFUKzVod0NheGNo?=
 =?utf-8?B?b0lFZDJUYTg4ZWRKUzM5Wmd4VTZ1aWxQR3lMNmZEWmJjc2pXUFhVSjV5SjFh?=
 =?utf-8?B?YWVVcHNPSU5uZ3ZjTzBWRVUyNGg3K2ZPdk4xYjgyaTRPTW9KSEUrQWQ1bUVK?=
 =?utf-8?B?Vm9NaytEMDFXUndsT01VRTJvd3BwU25YZmVveUtZR2JhbkVpMFZaeEEwODhj?=
 =?utf-8?B?RWs3UGRqWmgxS0lZMGsyenhZdjFydnQzakttR3p6QlcrMVg4Q0ZFZTlsVWhz?=
 =?utf-8?B?d0JROWszeGo5a3R0dHYxZVFhWlNBaTJsQmFjYlE5SlUzYzJQanUxVTNoR09D?=
 =?utf-8?B?dDNnUUluSUZraTREajN2dHJJTmd4UmpjZDc1RzJKcnN4b016Ykl2dStsODJI?=
 =?utf-8?B?ODMrZFE5MlRNRjA4WGUzVDg4WGhxQk9aQ21ZYytSangxZWZ2MVM4bDlnNnJE?=
 =?utf-8?B?bEEzOThBZmxFSlA2bFMyeG9qcEVyN3ZlTTI0UHM2dU5wTEtSd0hBUnNReFNY?=
 =?utf-8?B?TXNuM2NjanZGVWtkem5zdXVkNlVlSHV4aGZvdWRaWFFGa0lXalZqeUVRQndG?=
 =?utf-8?B?YUpKNlpONUowTWU0eDNTQ3BjeTdSd082WUJuOVQ2VDdkSHEzQzhkTkV1Rk00?=
 =?utf-8?B?aW1VUEhOSTloR2F5VEpkZ2Via01rLzMvZlAzSE5ROGVnMXhlcG9oWkllOHBt?=
 =?utf-8?B?YUtKd2l2MjVuS3ZjVDV3d3V6K1RUTmNzZ3c2YTMrdzVmNVI2ZDY4bERWYXp3?=
 =?utf-8?B?N0RETGFlZlFGNld2RVc5akhJMGJuWXFaNndYaVZQelBQb0RwUFp4WFVlbUdu?=
 =?utf-8?B?ZThYTlRhUzdWVlU4TS9wWmRNQ08wa1R1Z0VHWVpTME1FYnJVMjlxWHEvTllU?=
 =?utf-8?B?WExoYmh1eGpaT0VucHFyTk1jV2JHRk9jNEExYWx1V1BXbHJzSko1dnhiU0Yx?=
 =?utf-8?B?NXFuMERqQk52dzE5ZFZnR3VzQ05RdnorUVlRR1dzZUN4N2p3em1KN0U5d015?=
 =?utf-8?B?Rm5oTXlwSzFVTHB5Z280MThURTgrSURuSVRjZjhKbFYzOHN0MjVNUnhPUVpx?=
 =?utf-8?B?WXpxZ2thTU5MSGhhWm4vOGgzWkhXRWdqZVRNWkVtYW5aaFE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB7155.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(366016)(1800799024)(376014)(7416014)(7053199007)(13003099007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkZTcnNBeVQ1bDRrUU5GeHBEUnlRZHlsNFZmd3dkbGVkbVZMRnh2cmVTS0dT?=
 =?utf-8?B?bEc1cmgyc2pnV2w2NkI4YVphczVTY1F3Z1JqcXg4VjIrUHF4T0krR0JweHND?=
 =?utf-8?B?eVA1VDdtZmEwWHBZM3pOYWJ2ZkloK1VGdGhjSXpwTm80c2E2SVZ2Q0pKd2Q1?=
 =?utf-8?B?V2xQa2pUR3F3K0x1UDdHRVdHbEN4eHkrN0sweWhPVjNzclExK0dWZWRtbncy?=
 =?utf-8?B?dHJxR2pGS2Nwcjd3THE5YWIxQWtjTmgySmhTTE54Z0lydGo2SHlHQkxEUkE5?=
 =?utf-8?B?NU5PSGZPWld1U09tY3BXREw2MGlMRmZyRWV6UFZwaWljZjRLN201UGovd213?=
 =?utf-8?B?Sk55QW9EUXNERzdmVHIxWHRUY2hkUk5Wbk5zdW5GTW1kaHBKb25ZKzB0bTc3?=
 =?utf-8?B?VkhoSzZzTmxkTnNteERUWStodHl1dEpxUTZJcm5Cc1N2Ri8vNCtBanBpUmZp?=
 =?utf-8?B?eEVkYWFJVUgwNi9wUHpUZjNGMmtOTzIxRjZwYUczZHRQcEQ5L1pld1VRd1pV?=
 =?utf-8?B?bzc0aTJiTkM3bFNSZlpPVUlSdTArVUxyWk9SSjBLYlcxTGRhalFOb051SmJD?=
 =?utf-8?B?ZExXUG95ekN3bVVPb0h2RVdnbVd2dnVkNkZ5bWZSUXhNRzVpTGljKzBYbmJP?=
 =?utf-8?B?ODRyMTg0NGxNM3JwUUNnU3BjdzVuL3NJRlJmL2Iwc09EZm9yQWEwd3RlZFht?=
 =?utf-8?B?bWMxa3p2WVZEa3gyT3hpVDlwMUtqd0ltRjd5UEFRU1hQeitwVEZ0eFhydjZG?=
 =?utf-8?B?OTl4dHp1QlVzT04yb3JLQUVSY2RuVlc4YThWUkJkSDVFU2NUQlF3MWNsQ0RG?=
 =?utf-8?B?aWpIRGtEK01yV0N2bER6KytOZzB0OVByTXQ4ZXRxNTEzMVkwdkhWdjhqUFc4?=
 =?utf-8?B?SnRFVXFFVEFDWEdrRktBbzJCOU81TFM0QnRvTThUT1k0aGszcy9HQytoTGZN?=
 =?utf-8?B?V0drSTYwUkpLVEFXTzU2TTAvT0R1c0hzSVBTSStsM0F3aVVhUjBDQ1NlSHh5?=
 =?utf-8?B?NzVKSG5jVTVtV0hxRVl1VzAyOE9MclcycHBiZUlPdUV6MlZ6ZTdzMW5Dd1Zj?=
 =?utf-8?B?NDlGbGxIcW9udXBQN1ZScGljbC9BZHI1NkZidGl6b1JPN0xYWUo1YTZ5bTRU?=
 =?utf-8?B?V1VzbUFNV2hWcWZiNE1IV1FJY1JyQzVKdEQ1RFF4Q2dxd3k0K3NaVmV3OHYx?=
 =?utf-8?B?bDVXMWxEdzR6K1o1UGpmZzFhRU44THAvZTd4YU8wbWlDWU1RdU1TZGVzUFRs?=
 =?utf-8?B?TUw1elZRUHpYb0IyLzJ3NDdyT1BWalhaYktIaUxhcHFaL2s4M2hUQ2hEQTlT?=
 =?utf-8?B?OWtobis4UllOTnFKYnlPZXNYc29mNG1OMGpMM2hLUm91RjU4bGlvZUJqR3h6?=
 =?utf-8?B?bVlUN2svQzBMbVZqRFpzcjkxZysyNUdlc2VWQ2p5MjlOM2dJMnZic1EzRFJz?=
 =?utf-8?B?OVBjbE1MWXlPOGVBWGtLK2drWTlzZ3Q4WUp5ZlZoYWdDdTV2YjZReHMxUmpE?=
 =?utf-8?B?UkpaVWQrWkcwQzNmK1FLMkQ2U2ZrWWwzN0ROa1JRSUJsUW4rV2VTKzRyVktU?=
 =?utf-8?B?eWdIN2R2SXRBRTlVeXhRZE45VVNGMHE1S2k1SWpwVmZMZ1FBRDBEMFpBK0dF?=
 =?utf-8?B?ajNtc2Z4eGx1YVVteUdhSHlGQTJFb3F4VkZ1RExoYjRXVFJMZURnTVpLd29Z?=
 =?utf-8?B?WWNtc2ljWnJ2U045SkhoN1YvcWNGZ081aHNHaG04cGJqeEhhK2l3bDI4OGdO?=
 =?utf-8?B?cTJ5aXFxeTVpYURrUUt3ZFl1VnBHMjdZbnpicGdpUzhUYzRvc2tnTm0ybXBn?=
 =?utf-8?B?TWNaeTduNFk3RmpNb1FMRzVMTTBRZ0xJR0tuZi9QbE50Zk04ZVYxOHFyUWdw?=
 =?utf-8?B?b1pkWmsxUXRwQTNtVWE3UTFXakxweG1BL09wK2pJSkdIb0puSmN5dVljNTVj?=
 =?utf-8?B?LzROR3FwakJPdk1PZzk4T2U2RVVpNmVFQVhpTWM3TDVSME5SamJ0VjNQQkl6?=
 =?utf-8?B?NGFKc1VSTFh2Q0VGS2JyTkVqcUZJYnRBbHdHdS9SQWpRbTFFZ2xuZnVKaHhs?=
 =?utf-8?B?ZkJKTmIySEJKeXZMbng4WHJ0eUFhb2pCd0M2YjJVQzJYdEJ5enB0emM2Vitp?=
 =?utf-8?Q?uV59gNFeEt7csP6m7ytQ/KaKY?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db2a618c-6a3e-43e0-f5a3-08de3230ae8b
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB7155.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 05:56:20.4635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8NZODBmQlp8VJ1H4xFWl3x+kHB8FQIcQAdMK/G9vlEGIx89XNAZfdJ3cKpFseh/X+2+Ciim0vBGvLTdhKG91hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8446
X-Mailman-Approved-At: Wed, 03 Dec 2025 08:11:25 +0000
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

Hi Piotr，

     I will need about two more days to look into it. I will follow up with you ASAP.


在 2025/12/2 16:29, Piotr Oniszczuk 写道:
> [You don't often get email from piotr.oniszczuk@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> [ EXTERNAL EMAIL ]
>
> Ao,
> Any chance for updated s4 hdmi series for 6.18?
>
>
>> Wiadomość napisana przez Ao Xu <ao.xu@amlogic.com> w dniu 21 lis 2025, o godz. 03:55:
>>
>> Hi Piotr，
>>
>>      I will check this issue
>>
>> 在 2025/11/19 18:27, Piotr Oniszczuk 写道:
>>> [You don't often get email from piotr.oniszczuk@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> [ EXTERNAL EMAIL ]
>>>
>>> Pls see inline
>>>
>>>> Wiadomość napisana przez Chuan Liu <chuan.liu@amlogic.com> w dniu 19 lis 2025, o godz. 03:57:
>>>>
>>>> Hi Piotr,
>>>>
>>>>
>>>> On 11/18/2025 10:50 PM, Piotr Oniszczuk wrote:
>>>>> [You don't often get email from piotr.oniszczuk@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>>> [ EXTERNAL EMAIL ]
>>>>> Ao,
>>>>> Is there any chance to get this s4 drm hdmi series for current 6.18?
>>>>> (i tried backport this series to 6.18 but have some issues with reparent vpu_0_sel to sysclk_b_sel)
>>>> Why do we need to reparent vpu_0_sel to sysclk_b_sel? is there any
>>>> background here?
>>> Well - it looks it is because bug....
>>> Martin Blumenstingl had perfect eye and catch typo in patch https://lore.kernel.org/all/20250110-drm-s4-v1-11-cbc2d5edaae8@amlogic.com/:
>>>
>>> By replacing:
>>> assigned-clock-parents = <&clkc_periphs CLKID_FCLK_DIV3>,
>>> <0>, /* Do Nothing */
>>> <&clkc_periphs CLKID_VPU_0>,
>>> <&clkc_periphs CLKID_FCLK_DIV4>,
>>> <0>, /* Do Nothing */
>>> <&clkc_periphs CLKID_VAPB_0>;
>>>
>>> with:
>>> assigned-clock-parents = <&clkc_pll CLKID_FCLK_DIV3>,
>>> <0>, /* Do Nothing */
>>> <&clkc_periphs CLKID_VPU_0>,
>>> <&clkc_pll CLKID_FCLK_DIV4>,
>>> <0>, /* Do Nothing */
>>> <&clkc_periphs CLKID_VAPB_0>;
>>>
>>> dmesg is like this https://termbin.com/6020
>>>
>>> So i'm getting hdmi working - but only when device boots _without_ connected hdmi at boot (and connected later)
>>> If hdmi is connected at boot - boot hangs at:
>>>
>>>      0.341676] meson-dw-hdmi fe300000.hdmi-tx: Detected HDMI TX controller v2.01a with HDCP (meson_dw_hdmi_phy)
>>> [    0.342750] meson-dw-hdmi fe300000.hdmi-tx: registered DesignWare HDMI I2C bus driver
>>> [    0.343660] meson-drm ff000000.vpu: bound fe300000.hdmi-tx (ops meson_dw_hdmi_ops)
>>> [    0.344832] [drm] Initialized meson 1.0.0 for ff000000.vpu on minor 0
>>>
>>> FYI: It is after applying https://patchwork.kernel.org/project/linux-amlogic/cover/20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com/ on mainline 6.18 (with some my adjustments on this series required by changes in 6.18).
>>> For VPU clk changes see https://github.com/warpme/minimyth2/blob/master/script/kernel/linux-6.18/files/0312-drm-meson-add-vpu-clk-setting-for-S4.patch
>>> It is 6.18 adaptation of https://patchwork.kernel.org/project/linux-amlogic/patch/20250110-drm-s4-v1-9-cbc2d5edaae8@amlogic.com/
>>>
>>> As kernel hangs - i have limited caps to drill where root cause is.
>>>
>>> Maybe above hang is reason of my backports or missing any pre-req required to get s4 drm working?
>>> Anyway - it will be good to test with updated to 6.18 series of Add DRM support for Amlogic S4 (plus info about any pre-req required to get s4 drm working)
>>>
>>>
>>>> The vpu_clk on S4 doesn't support sysclk_b_sel as one of its
>>>> selectable clock sources, so this reparent operation will definitely
>>>> fail. This has nothing to do with the kernel version.
>>>>
>>>>>> Wiadomość napisana przez Ao Xu via B4 Relay <devnull+ao.xu.amlogic.com@kernel.org> w dniu 10 sty 2025, o godz. 06:39:
>>>>>>
>>>>>> From: Ao Xu <ao.xu@amlogic.com>
>>>>>>
>>>>>> Add devicetree document for S4 HDMI controller
>>>>>>
>>>>>> Signed-off-by: Ao Xu <ao.xu@amlogic.com>
>>>>>> ---
>>>>>> Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml | 1 +
>>>>>> 1 file changed, 1 insertion(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
>>>>>> index 84d68b8cfccc86fd87a6a0fd2b70af12e51eb8a4..6e0a8369eee915fab55af24d450a6c40e08def38 100644
>>>>>> --- a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
>>>>>> @@ -55,6 +55,7 @@ properties:
>>>>>>            - const: amlogic,meson-gx-dw-hdmi
>>>>>>        - enum:
>>>>>>            - amlogic,meson-g12a-dw-hdmi # G12A (S905X2, S905Y2, S905D2)
>>>>>> +          - amlogic,meson-s4-dw-hdmi # S4 (S905Y4)
>>>>>>
>>>>>>    reg:
>>>>>>      maxItems: 1
>>>>>>
>>>>>> --
>>>>>> 2.43.0
>>>>>>
>>>>>>
>>>>>>
>>>>>> _______________________________________________
>>>>>> linux-amlogic mailing list
>>>>>> linux-amlogic@lists.infradead.org
>>>>>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
>>>>> _______________________________________________
>>>>> linux-amlogic mailing list
>>>>> linux-amlogic@lists.infradead.org
>>>>> http://lists.infradead.org/mailman/listinfo/linux-amlogic

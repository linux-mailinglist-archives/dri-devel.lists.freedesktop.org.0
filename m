Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F22E6CA828B
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 16:21:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A4D10EB50;
	Fri,  5 Dec 2025 15:21:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="WsRG/ZiC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11023128.outbound.protection.outlook.com
 [40.107.162.128])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2093F10EB50
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 15:21:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AeWyeV/qG5hjABfctxtbxmsKhwSLWtx1zUt746FR8FFpKeckYyTqBtbWq9Df/h0mSq1jMxI/WWoDmDc1RbPjd94VjP3YE0PsfXs7rwz++K6Kw/8hxLk/Vn9NulCTJMHRSOIu+5kCbO6TAX9DkS/T8S5QostcYCxVdInjZOHtZImloLmeG5nMsm22yvDVl0Eoani6GaSBShHVWWlmTObfM9yXpMvpwugEwxL7epzGP7n93qweI4RxC7z/LwPNZqf9F73opMGwQ3iC7M7Z1ir1VuWvlcqg2qqCImhjcErHAz2+wfbYpv9oI7gTxMxDuOjBDWetAji1agOOxBpq97yLkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKmd1cpMnAgue3bjcfieKp4AbSot7Ju6Go9z+y4NcNQ=;
 b=gZVGRdfvwtHTX5nE9rWj22s5iqpsY/V0MWqKGhLky8y2h4sR6+wFsnZHkzZj40eT4dYOj9njCYLf3eB3UDghw8mWzRcDGBLUrJkfIpBFu9CSDG3qHJ+vDTQiub4yFnud7Nhak4BYbpB5JU315pu3reYwqFCNZEqkJU2M9mAxCs0odxN54nyrFBCNjiTn3HJxuHUaQD2rlrgJOTAyQMvg8yYWO/bKfUOljWO4h5Remy00it9ZXNgYHZbyIMv6BK9fTeEmnTBJ6BZ4eU0ZWjgSIE5WL7//WxNf8isGQDgG1gtAva95ItOMU3IPV5YLQ2Wru9GJgzomC2emPzNBDLcghA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKmd1cpMnAgue3bjcfieKp4AbSot7Ju6Go9z+y4NcNQ=;
 b=WsRG/ZiCvyoKf/TJ3LJYbI42MNqMZR8ha/eHptawawAUqPPW24NKunRLUTIpeTLboZ70yarMtm2YHFXRiPyW/+kc8GLsolOKNY6GW0hxXis+ECFX93BWD/6pj1TMBRP9gScHoF/eRCCH1bXfMpLKmE6HCdPck4870ZvzCRhCiFhVRWDcOsrnFLmTjy0OUaM6GJE+6Z2sF6lsr3KmZcK+gDK66TBmRKUCMwOIoa/Z9+Fc9Jh28cYqE/gxI4G0IQ3V59fESfWkVaBEuO0ikoDqId2VgUkcay/TQ+F/0iJhWGHLDkBwhwDqpS5I+XjMguEt8Jz4TbUVz6X6VjUkd3hSfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
Received: from AMBPR04MB11741.eurprd04.prod.outlook.com (2603:10a6:20b:6f3::7)
 by PAWPR04MB11572.eurprd04.prod.outlook.com (2603:10a6:102:50d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Fri, 5 Dec
 2025 15:21:00 +0000
Received: from AMBPR04MB11741.eurprd04.prod.outlook.com
 ([fe80::c39b:dab3:ae88:c5ba]) by AMBPR04MB11741.eurprd04.prod.outlook.com
 ([fe80::c39b:dab3:ae88:c5ba%4]) with mapi id 15.20.9388.011; Fri, 5 Dec 2025
 15:21:00 +0000
Message-ID: <8a9a59b8-d5c0-46b3-8f86-a4cd910b7af3@gocontroll.com>
Date: Fri, 5 Dec 2025 16:20:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] backlight: add max25014atg backlight
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
References: <20251201-max25014-v6-0-88e3ac8112ff@gocontroll.com>
 <20251201-max25014-v6-2-88e3ac8112ff@gocontroll.com>
 <aTG0EK_zuSB-U_bb@aspen.lan>
Content-Language: en-US
From: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <aTG0EK_zuSB-U_bb@aspen.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P192CA0022.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e1::20) To AMBPR04MB11741.eurprd04.prod.outlook.com
 (2603:10a6:20b:6f3::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR04MB11741:EE_|PAWPR04MB11572:EE_
X-MS-Office365-Filtering-Correlation-Id: 54dd9a15-a0a0-4e63-0532-08de3411e55f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|376014|366016|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXU5VUZ6SEY2bHZhb2NUcTdSSVRzM0J3elMrKzdkSmg5eHRVcU5aLzQxb1Jh?=
 =?utf-8?B?Rmc3VGwrbjdnVm1lSUs1QWJSbG9kbmpRYW1mQ1MxSlVyeW9yVk5WYUJNeVBp?=
 =?utf-8?B?V1VnNkRYYmlDQkFDL0pHdkxaNHEwUDZLZWtodjQrTys1ajBxNVpWcGF2Vkg3?=
 =?utf-8?B?bVZJRFJXS0pvMldLdlJvZHRVL29oMFRZbTd2aFpDcmRPdXBnZ2Z6dm9waVR4?=
 =?utf-8?B?L2dZRXRDcW9PcmJjd3V0c1FXVDhRNlIzUjU5S0VTS1FaMU9YbEN6MEtwa1lD?=
 =?utf-8?B?Lzl4N3AzL3JoSFdOS2h1U3BUeGdOem5oTEtnaGJqSkExS2ZtTUZ0SjZnVE85?=
 =?utf-8?B?MHBXRFE5ZzVPeTg1aWRpcGp6eDlOTEFRb3VnVWs3eHNUK1RsN0dGMXV6OWtQ?=
 =?utf-8?B?Y3o0MWZvYm9hdFBjeW9GTHVYNlIxQzJEQ0ZydFNBVGsvUTd1RVdsWUI4dzhz?=
 =?utf-8?B?L1dMWXhtdy9XeWFxdkdRYUNDUTlubzJKaFhlSUFZbWd0SUNIMVV3RkpTK1BF?=
 =?utf-8?B?M0xRa1dwbVdZSDM2bnFsKzUrRzNJYVM1YTdpZkRQT1BUMzNramRFWlpZbFpW?=
 =?utf-8?B?NVl5NzhFUnlKOHB0QjBNa0dzMWxTa0t0V1l5MFpiclhPR0Yxb1dXWWJsRzQw?=
 =?utf-8?B?SElpeU50VlVTbm56NDFNVzJBQ1QrMm5rVTB5OUFSUUVVRy9BOFZvME1LY0pn?=
 =?utf-8?B?VkxuTjcyejVPTHR1YzAwNFA3bFJVa3E2cFV6WjJTR3haQmhjYmNJbWdaWHpZ?=
 =?utf-8?B?RkQyblY4Qzg0dDV3emNqVGJxb0xZZmU1aDJBS2hYeU9CSmlLWm0zNGgyYm1K?=
 =?utf-8?B?TTRGSnJrb2oxSm5rN0hwUXhyTndkM3duMFpDTE9Iemxhb2tGRjhMSCsxVVpP?=
 =?utf-8?B?clZDRFhZVUtwSXp3VXd3bnVNSWRhT25UNiszYnB4MWI3OFRwSHNPVGo5eU5y?=
 =?utf-8?B?azdRZWdISzU5ZGdKQ0pXYi9wYWs0S3RFVUh6ZGhJck1UVVlXZDdDenN5bDlh?=
 =?utf-8?B?ZzNzL21OUHpUSThyeFVmOXFyTEtOLzQwMEg0Z3R6TndickRVdHJQVzA0STJ4?=
 =?utf-8?B?Z0xkbUt6eEFReTk0bEVkbnNJb0wzSGViTnRSZWtEOWkxbUFGMGRER3pYS2tn?=
 =?utf-8?B?VGdqNzB3NlR1bC96M1pQbzUxc3paWWtCM1lpN3ZORGRTSGNCK3JRajgyWVFr?=
 =?utf-8?B?TkEvQTdVZTFrVTVlSWVvUk5OQkV3ZWpQY3VEbnNndEw5OUNJVnNGbXFaRDhH?=
 =?utf-8?B?VHZ0MVlmcmRqUUdhUDN5ZFJLMFpoM1lKOFVHRDZ1Kzc5RFJSb250S2lUM0RH?=
 =?utf-8?B?cjdYZWRvRS9mbGFGSWQ0UXhCc3dyenhkVThRS0k3MnRUMHJ0anRqL3drdmQ5?=
 =?utf-8?B?TURWT0dUQU5vVUNvZHYwZk42Z0dqL1NQalpqeG9Cd2p3MytEWnpmUytZeFY2?=
 =?utf-8?B?ZlcvWVo5QlhoWjE4MVA4NUdDTUtub2U4NSt3YjNmdk5TTUkzSlA5NlhvcjRZ?=
 =?utf-8?B?ejI4c3RMTUl3U1o1K25FZ21mck4xV0hVTTJsRHIxNXRtczdiNWxUaGxaa3JD?=
 =?utf-8?B?dnNFWnhLa2Erd0QyWklXQS85KzBmVlNnVjNPdGJTTWpiL29tVTZwaEFuOU9Y?=
 =?utf-8?B?ckZBVjJNZzI4amRJc2JLMFBkYWhWTFhHWTVGeUhObnFwRitMVjFzdzV0UjRZ?=
 =?utf-8?B?eHZwWFJ6ZDJFM1V2cXRjbStrMnloWDRDUkFiTUVDVGxsOE40UUt4TWVDeVVU?=
 =?utf-8?B?TUZQMjNGUE5lelRKUU1vSmxEcnI2TTVab0lSY2FmdnFTZGRDczllTUMweVZ1?=
 =?utf-8?B?amZUWmNFVjFvWk8reFhvYW8yMTBUSitBM2ovMjdKQzlFM3I0M1NuenVTTG1D?=
 =?utf-8?B?QW5DL0ZyYVJ5Y3A1M0JLVUViV3JMVys4aGxwaEhGNnd5MzhRV0RKQXVnckhN?=
 =?utf-8?Q?SKU/aobMYG9w0ptIw2agiu3yafSpiDrf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AMBPR04MB11741.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(7416014); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3FRQlk2b0Q1YzFXMSsrbkszaHJNU0NmazlRMUtHbmRpYWlRYVpOVmdwR0hU?=
 =?utf-8?B?QVVGN29rWlEzeGsrRVlKVGV3Zzg0SkVSdHhJcmM4VXowT0c1cThlQk94OHpm?=
 =?utf-8?B?UHZqTS91RFcxVGQyZzZqTk4yNU0zTVZxcDdmVVJLMXBJK2pQVi9ldlRNcTVY?=
 =?utf-8?B?d0tmS2R6bVcxcnhFRk1sL0FkQSsrOWJaRVZic2htMlBqeXlOUmp4VkNZOUZ4?=
 =?utf-8?B?ak05SGtmdHhZK0duOE5PYVVUcWtkVU54bVFkbExoenhNZFBQWEVpUVZyQkho?=
 =?utf-8?B?T3RCYk93b2ZOemptejRZUStPZzdtUyttMlRCbWlYYWRFZ3RORE5hcFphaWcw?=
 =?utf-8?B?enloR2JnMmhYd21PYVN5NHF6b1hqc05lYkhHSlZNbHhZR1pWaVhBdmk1czJ5?=
 =?utf-8?B?cVBWa1dmdUY0TWpRNGdKQkNpT1M1aExrTjg5ZUFZQ2hHRUpoa2hsTEtTeitR?=
 =?utf-8?B?UDFWVDZwUlNhbU1UQUhnQ0htc0VWWTNzTEo5c3lIa3hsRm1KS3pHSnJ6cjg0?=
 =?utf-8?B?ZUVQckphTU9abko1V1M0aCtNTTNjeFlXc0IxRTE4WWx1TWx3TGkyb2VsSG5E?=
 =?utf-8?B?RjgxUkZQVUF3V1NHZzUyak56YmEvR2UyNzhSUndVZlFXYUdBQldwQjBIVUwy?=
 =?utf-8?B?OEdKays2dG9CckMxL3hsVlUwbVNRSlFkS29PVjVXY2ZEQ0MvQzBTSGdpL0Yr?=
 =?utf-8?B?REM4U2llc1NCTk1iNDZjTWNyN2JwS1JNWGQvRXNwYlZRQjlLeFB4TWV0UDVK?=
 =?utf-8?B?VW9SMXpqL2Z3cHZLTG9HNE5IZHhHTnNyenBsQ3hDeGdpVkcyaGVTVjJWVUlj?=
 =?utf-8?B?YXNRRitqWlF2ZWNOUStvSXcyVEJtNHBXNUlTcmNyRVhmVmF5L1NEWDNWYURt?=
 =?utf-8?B?QWhscVJLYSs0QXhyRmo4Tmw0K25ONlhCM3FsWXFubWxTZWF1UXUvYnJJWFJm?=
 =?utf-8?B?U3c4MmRzaFgrUThkN3lDWEtNb0ZaRjdpcWFrVllLazVyN2lLSU5zSGw3R3J4?=
 =?utf-8?B?Sy84YnI4V2IrUDgzUjhQemlDakFPYldhTGZzblBpYlp0Vlk3V1Y3b09Qb3lz?=
 =?utf-8?B?UVZqM3REVzFreVMxNS9pOU5HbWltYWNyLzZkMTlmbjc2ZzVYenovWVEyY2M5?=
 =?utf-8?B?RG5OQkNaN2F4TjZRZjlDRG50b0hCb21PODhvRk9US3haQkpGQTRvL0ZrNlZI?=
 =?utf-8?B?SGwrak5BREtGZmVEd2VxU1N3bUJwcGRDdzF6Sm9ZaWo4UHk2VFRYTkk3SzNN?=
 =?utf-8?B?d0R0WStJbTU0SmVsYlVGemwvWm0rUFE2bno5cklmeTVXUWRQLzFpbksvMGlJ?=
 =?utf-8?B?VER0RXczenZJMkRzbGhlcWpDbVl5Ny9EMkdBMFdYckN3UjdhU3Y4cVg2Mk8x?=
 =?utf-8?B?ek1RTk9RZTEwclVtS3dYZWxRUzNUTVF5OXNGbS81TUNHVHRVbXVTOVljeE0y?=
 =?utf-8?B?V2R1V2JSMFZLSk54VmhZb3ZzcG81b3NRR0hEV3dNM29aOEFGd1VScmZSUHVZ?=
 =?utf-8?B?NHRrcnU5K1I3bEV6YWlWenZMWnZLeWZkT0s1cUppT3dneGZYYUZhK1FpWW9Y?=
 =?utf-8?B?RlJEaEtVTFNHTGJJWEJVcHg2cERyZ0xhWlU4a2sweXVOYTBvK0kxb2tTKzZj?=
 =?utf-8?B?SU5pSjRKeFdmaFpMVmZWRzF1QnRQNHNlVDBvOFI4YmpOSmJiMUdLcUNiY3FK?=
 =?utf-8?B?QTlmNWNFWjYzM0RyNVJGd0pRTytqRXFnT2dtRVBDUGEyZFRrYnhNRjFYbkdw?=
 =?utf-8?B?MnJXWlovWUJEMjNFS2l0djBPVlhXV2pOTXJFT25VV3FjYzBQUTd6bGdXdHpo?=
 =?utf-8?B?b0YwUWEyWVJTeHRxUG4vUDFzenpaZEJVQXh3N1doQzViYk1WK3VjOEg2Y28w?=
 =?utf-8?B?OU15Qk1KalloSVRvMzZLMy9ueGpPczdoSDRmbXlqOFdDVi9CeGliZFNIVnlp?=
 =?utf-8?B?ZjN0UmNGVmdkdE1VZjJDM1Fhc2o1cFNqTFNSbEZFOGE4WDBHaDJGNUxFY3Fr?=
 =?utf-8?B?WmU1Z1pkbWJVczErZG9USldtMlQreWhwK25GS0JmUytGMzhUWHRmYzdIcHY2?=
 =?utf-8?B?anIrUDNYUDI0M2x0aXFOWkt6VUVvVWY1WTRQdnJwTjYzS0J3ZE5TVzByOHlr?=
 =?utf-8?B?MFlGZEZESkxFVGF4WUZ5NXg5aitKSXhkdlZLZGM2UVBJUXh0NW5UVjBhTDhY?=
 =?utf-8?B?b3R3dCtaS1VURnZZdEdjZ0N3cTMzZlJCNEk5TjBRQ3NENUlSMk83MDc0NDF6?=
 =?utf-8?B?bURsNEo1b2lQTnduTzdhODdYamNBPT0=?=
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54dd9a15-a0a0-4e63-0532-08de3411e55f
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB11741.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 15:21:00.1298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WDyBov8CLTpSRnLQ2TOYpranuSsB91tWbbiW0pehR63UNsVoYumzpeatfdf3GF4cf9wztpfIdfHR2oRakLcqrPaaLLuZ5RxC4kKOv7YFz2o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB11572
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

Thanks for the review.

On 12/4/25 17:17, Daniel Thompson wrote:
> On Mon, Dec 01, 2025 at 12:53:21PM +0100, Maud Spierings via B4 Relay wrote:
>> From: Maud Spierings <maudspierings@gocontroll.com>
>>
>> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
>> with integrated boost controller.
>>
>> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> 
>> <snip>
> 
>> +static int max25014_check_errors(struct max25014 *maxim)
>> +{
>> +	uint32_t val;
>> +	uint8_t i;
>> +	int ret;
>> +
>> +	ret = regmap_read(maxim->regmap, MAX25014_OPEN, &val);
>> +	if (ret)
>> +		return ret;
>> +	if (val) {
>> +		dev_err(&maxim->client->dev, "Open led strings detected on:\n");
>> +		for (i = 0; i < 4; i++) {
>> +			if (val & 1 << i)
>> +				dev_err(&maxim->client->dev, "string %d\n", i + 1);
>> +		}
>> +		return -EIO;
>> +	}
>> +
>> +	ret = regmap_read(maxim->regmap, MAX25014_SHORT_GND, &val);
>> +	if (ret)
>> +		return ret;
>> +	if (val) {
>> +		dev_err(&maxim->client->dev, "Short to ground detected on:\n");
>> +		for (i = 0; i < 4; i++) {
>> +			if (val & 1 << i)
>> +				dev_err(&maxim->client->dev, "string %d\n", i + 1);
>> +		}
>> +		return -EIO;
>> +	}
>> +
>> +	ret = regmap_read(maxim->regmap, MAX25014_SHORT_GND, &val);
> 
> Shouldn't this be MAX25014_SHORT_LED?

yep you are absolutely right

> 
>> +	if (ret)
>> +		return ret;
>> +	if (val) {
>> +		dev_err(&maxim->client->dev, "Shorted led detected on:\n");
>> +		for (i = 0; i < 4; i++) {
>> +			if (val & 1 << i)
>> +				dev_err(&maxim->client->dev, "string %d\n", i + 1);
>> +		}
>> +		return -EIO;
>> +	}
>> +
>> +	ret = regmap_read(maxim->regmap, MAX25014_DIAG, &val);
>> +	if (ret)
>> +		return ret;
>> +	/*
>> +	 * The HW_RST bit always starts at 1 after power up.
>> +	 * It is reset on first read, does not indicate an error.
>> +	 */
>> +	if (val && val != MAX25014_DIAG_HW_RST) {
>> +		if (val & MAX25014_DIAG_OT)
>> +			dev_err(&maxim->client->dev,
>> +				"Overtemperature shutdown\n");
>> +		if (val & MAX25014_DIAG_OTW)
>> +			dev_err(&maxim->client->dev,
>> +				 "Chip is getting too hot (>125C)\n");
>> +		if (val & MAX25014_DIAG_BSTOV)
>> +			dev_err(&maxim->client->dev,
>> +				"Boost converter overvoltage\n");
>> +		if (val & MAX25014_DIAG_BSTUV)
>> +			dev_err(&maxim->client->dev,
>> +				"Boost converter undervoltage\n");
>> +		if (val & MAX25014_DIAG_IREFOOR)
>> +			dev_err(&maxim->client->dev, "IREF out of range\n");
>> +		return -EIO;
>> +	}
>> +	return 0;
>> +}
>> +
>> +/*
>> + * 1. disable unused strings
>> + * 2. set dim mode
>> + * 3. set setting register
>> + * 4. enable the backlight
>> + */
>> +static int max25014_configure(struct max25014 *maxim, int initial_state)
>> +{
>> +	uint32_t val;
>> +	int ret;
>> +
>> +	/*
>> +	 * Strings can only be disabled when MAX25014_ISET_ENA == 0, check if
>> +	 * it needs to be changed at all to prevent the backlight flashing when
>> +	 * it is configured correctly by the bootloader
>> +	 */
> 
> Attach the comment to the if statement rather than the read.

will do

> 
>> +	ret = regmap_read(maxim->regmap, MAX25014_DISABLE, &val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (!((val & MAX25014_DISABLE_DIS_MASK) == maxim->strings_mask)) {
>> +		if (initial_state == BACKLIGHT_POWER_ON) {
>> +			ret = regmap_write(maxim->regmap, MAX25014_ISET, 0);
>> +			if (ret)
>> +				return ret;
>> +		}
>> +		ret = regmap_write(maxim->regmap, MAX25014_DISABLE, maxim->strings_mask);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	ret = regmap_write(maxim->regmap, MAX25014_IMODE, MAX25014_IMODE_HDIM);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = regmap_read(maxim->regmap, MAX25014_SETTING, &val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = regmap_write(maxim->regmap, MAX25014_SETTING,
>> +			   val & ~MAX25014_SETTING_FPWM);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = regmap_write(maxim->regmap, MAX25014_ISET,
>> +			   maxim->iset | MAX25014_ISET_ENA |
>> +			   MAX25014_ISET_PSEN);
>> +	return ret;
>> +}
>> +
>> +static int max25014_update_status(struct backlight_device *bl_dev)
>> +{
>> +	struct max25014 *maxim = bl_get_data(bl_dev);
>> +	uint32_t reg;
>> +	int ret;
>> +
>> +	if (backlight_is_blank(maxim->bl))
>> +		bl_dev->props.brightness = 0;
> 
> This isn't right. Why would you change the backlight level just because
> it is currently blanked (and sorry I missed this one last time).

so just remove this bit then jeah?

>> +
>> +	reg  = TON_STEP * bl_dev->props.brightness;
> 
> The correct way to honour blanking is just go call
> backlight_get_brightness() instead of reading the property directly.

will do.

> 
>> +
>> +	/*
>> +	 * 18 bit number lowest, 2 bits in first register,
>> +	 * next lowest 8 in the L register, next 8 in the H register
>> +	 * Seemingly setting the strength of only one string controls all of
>> +	 * them, individual settings don't affect the outcome.
>> +	 */
>> +
>> +	ret = regmap_write(maxim->regmap, MAX25014_TON_1_4_LSB, reg & 0b00000011);
>> +	if (ret != 0)
>> +		return ret;
>> +	ret = regmap_write(maxim->regmap, MAX25014_TON1L, (reg >> 2) & 0b11111111);
>> +	if (ret != 0)
>> +		return ret;
>> +	return regmap_write(maxim->regmap, MAX25014_TON1H, (reg >> 10) & 0b11111111);
>> +}
>> +
>> +static const struct backlight_ops max25014_bl_ops = {
>> +	.options = BL_CORE_SUSPENDRESUME,
>> +	.update_status = max25014_update_status,
>> +};
>> +
>> +static int max25014_parse_dt(struct max25014 *maxim,
>> +			     uint32_t *initial_brightness)
>> +{
>> +	struct device *dev = &maxim->client->dev;
>> +	struct device_node *node = dev->of_node;
>> +	struct fwnode_handle *child;
>> +	uint32_t strings[4];
>> +	int res, i;
>> +
>> +	if (!node)
>> +		return dev_err_probe(dev, -EINVAL, "no platform data\n");
>> +
>> +	child = device_get_next_child_node(dev, NULL);
>> +	if (child) {
>> +		res = fwnode_property_count_u32(child, "led-sources");
>> +		if (res > 0) {
>> +			fwnode_property_read_u32_array(child, "led-sources",
>> +						       strings, res);
>> +
>> +			/* set all strings as disabled, then enable those in led-sources*/
>> +			maxim->strings_mask = 0xf;
>> +			for (i = 0; i < res; i++) {
>> +				if (strings[i] <= 4)
>> +					maxim->strings_mask &= ~BIT(strings[i]);
>> +			}
>> +		}
>> +
>> +		fwnode_property_read_u32(child, "default-brightness",
>> +					 initial_brightness);
>> +
>> +		fwnode_handle_put(child);
>> +	}
>> +
>> +	maxim->iset = MAX25014_ISET_DEFAULT_100;
>> +	of_property_read_u32(node, "maxim,iset", &maxim->iset);
>> +
>> +	if (maxim->iset > 15)
>> +		return dev_err_probe(dev, -EINVAL,
>> +				     "Invalid iset, should be a value from 0-15, entered was %d\n",
>> +				     maxim->iset);
>> +
>> +	if (*initial_brightness > 100)
>> +		return dev_err_probe(dev, -EINVAL,
>> +				     "Invalid initial brightness, should be a value from 0-100, entered was %d\n",
>> +				     *initial_brightness);
>> +
>> +	return 0;
>> +}
>> +
>> +static int max25014_probe(struct i2c_client *cl)
>> +{
>> +	const struct i2c_device_id *id = i2c_client_get_device_id(cl);
>> +	struct backlight_properties props;
>> +	uint32_t initial_brightness = 50;
>> +	struct backlight_device *bl;
>> +	struct max25014 *maxim;
>> +	int ret;
>> +
>> +	maxim = devm_kzalloc(&cl->dev, sizeof(struct max25014), GFP_KERNEL);
>> +	if (!maxim)
>> +		return -ENOMEM;
>> +
>> +	maxim->client = cl;
>> +
>> +	ret = max25014_parse_dt(maxim, &initial_brightness);
>> +	if (ret)
>> +		return ret;
>> +
>> +	maxim->vin = devm_regulator_get(&maxim->client->dev, "power");
>> +	if (IS_ERR(maxim->vin)) {
>> +		return dev_err_probe(&maxim->client->dev, PTR_ERR(maxim->vin),
>> +				     "failed to get power-supply");
>> +	}
>> +
>> +	ret = regulator_enable(maxim->vin);
>> +	if (ret)
>> +		return dev_err_probe(&maxim->client->dev, ret,
>> +			"failed to enable power-supply\n");
> 
> Can this use devm_regulator_get_enable()?

Yeah guess I'll just switch to that for now, if ever power management 
gets implemented it can be figured out if regulator control is desired.

> 
>> +
>> +	maxim->enable = devm_gpiod_get_optional(&maxim->client->dev, "enable",
>> +						GPIOD_OUT_HIGH);
>> +	if (IS_ERR(maxim->enable)) {
>> +		ret = dev_err_probe(&maxim->client->dev, PTR_ERR(maxim->enable),
>> +				    "failed to get enable gpio\n");
>> +		goto disable_vin;
>> +	}
>> +
>> +	/* Datasheet Electrical Characteristics tSTARTUP 2ms */
>> +	fsleep(2000);
>> +
>> +	maxim->regmap = devm_regmap_init_i2c(cl, &max25014_regmap_config);
>> +	if (IS_ERR(maxim->regmap)) {
>> +		ret = dev_err_probe(&maxim->client->dev, PTR_ERR(maxim->regmap),
>> +			"failed to initialize the i2c regmap\n");
>> +		goto disable_full;
>> +	}
>> +
>> +	i2c_set_clientdata(cl, maxim);
>> +
>> +	ret = max25014_check_errors(maxim);
>> +	if (ret) { /* error is already reported in the above function */
>> +		goto disable_full;
>> +	}
>> +
>> +	ret = max25014_initial_power_state(maxim);
>> +	if (ret < 0) {
>> +		dev_err_probe(&maxim->client->dev, ret, "Could not get enabled state\n");
>> +		goto disable_full;
>> +	}
>> +
>> +	memset(&props, 0, sizeof(struct backlight_properties));
>> +	props.type = BACKLIGHT_PLATFORM;
>> +	props.max_brightness = MAX_BRIGHTNESS;
>> +	props.brightness = initial_brightness;
>> +	props.scale = BACKLIGHT_SCALE_LINEAR;
>> +	props.power = ret;
>> +
>> +	ret = max25014_configure(maxim, ret);
>> +	if (ret) {
>> +		dev_err_probe(&maxim->client->dev, ret, "device config error");
>> +		goto disable_full;
>> +	}
>> +
>> +	bl = devm_backlight_device_register(&maxim->client->dev, id->name,
>> +					    &maxim->client->dev, maxim,
>> +					    &max25014_bl_ops, &props);
>> +	if (IS_ERR(bl)) {
>> +		ret = dev_err_probe(&maxim->client->dev, PTR_ERR(bl),
>> +				    "failed to register backlight\n");
>> +		goto disable_full;
>> +	}
>> +
>> +	maxim->bl = bl;
>> +
>> +	backlight_update_status(maxim->bl);
>> +
>> +	return 0;
>> +
>> +disable_full:
>> +	gpiod_set_value_cansleep(maxim->enable, 0);
> 
> Why is this needed? It was only ever set by devm_gpiod_get_optional().

oops thats a leftover from before that change, good spot.

>> +disable_vin:
>> +	regulator_disable(maxim->vin);
> 
> This is also not needed if you use devm_regulator_get_enable().

jeah I'll drop this then too

kind regards,
Maud


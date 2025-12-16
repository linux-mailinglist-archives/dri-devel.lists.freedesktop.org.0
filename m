Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E20CC181B
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 09:20:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D2F710E68F;
	Tue, 16 Dec 2025 08:20:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="Bo0cXp2P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11023138.outbound.protection.outlook.com
 [40.107.162.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2756D10E68F
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 08:20:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QLDqUXk+arfQZd59G0BreR6yzMsufHgs5XotuiKJ/ZrT1uNT702olYxXrpGMzUrUrBxFL+Sq23FJMspTVdy2MaR3e0F9P+13z/uzo80mBC1G+NRIC1wMSYc29VPHbT86WhYyJeRQoQxCJjdQeOCeRJXrsgieNoyhphdvBwhqsZLbRdAEUhOWLRx4q60khBrL/D0x3tbXSEmd2yI48IaZ0ZyLIKYPJ7FJBRGAt60/3leCXK7E6rT5qhOLSapb666oDROOWe8ekvzlHrk8390U2zc0v2uNmBfckC3oCxWx+tZ6j6govoGB2SVE/whZqOBzFVQ5Mhbr682gOO32bXuXLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29oPxxF8b8COhPsQ7LYjKYUXHLsQGuWb3suQLprLhQ4=;
 b=aD4Q/XFGuYY5jER4x/6OICGVxfEqWdux9up/tn6BfyvcouQijAlUZjQ9bNVIbiM+0ZS034V+l7rPp6K2GPPNSijKbsga3Lj3at60p7ck/SZgATI6y/Hk6RsE15ABefaKSIFLRZNe1AVRSc5MkvMNCVHuTgn/J6ZHG0UtVv3XlnAvHn68Q5Q+9xkZZ2L3u4gJEHCBhttozq3vq7fxGkElK+PbQEeq6K+kGqJmtxTgTR//XWj4kKFSIWh1mQz3sAweug8hUqu8xSIJhjcd2qT9IKu1kMvLb0w9nhIYs8/sFC8u5j1y/o/3zUQoShERWRBjLLx5/RUKBgknikVeacOlvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29oPxxF8b8COhPsQ7LYjKYUXHLsQGuWb3suQLprLhQ4=;
 b=Bo0cXp2PuZAU19OExuvBG/W7pTNwLInB2FSNbD9p1ky/rTvM0Pm2bUXFpAo7idtXvUd1C0KEiOaVQg3hDGzz9968VxjUIN0tS+dtG1F2iTmkxjtddyvek+Sk+3xbXOaQrwh5yytTdrk2Abg3FaxXPC5QREnprWp03Rr3c/ZIBm2e15YXq11zdw2KanvuoPWy+WY4fKf+0YMeU9Mrb3QNpNmHb268Bh+YKLeOA4FoSWVoj4l2BHIeXAlUkbTSXbfKwS43cKns1OzaOA90QJyZllI1L62SbKOH3VRicpeN2E4jPWPICGShYS9T1DXQHfGEc1LT9yw0GJJC/afY/Yov4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
Received: from VI0PR04MB11748.eurprd04.prod.outlook.com (2603:10a6:800:2eb::6)
 by PA1PR04MB10283.eurprd04.prod.outlook.com (2603:10a6:102:463::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 08:20:27 +0000
Received: from VI0PR04MB11748.eurprd04.prod.outlook.com
 ([fe80::5a4c:391:3df:9ffd]) by VI0PR04MB11748.eurprd04.prod.outlook.com
 ([fe80::5a4c:391:3df:9ffd%6]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 08:20:26 +0000
Message-ID: <d1d83ca2-d856-4e30-b53f-6b601a287768@gocontroll.com>
Date: Tue, 16 Dec 2025 09:19:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] dt-bindings: backlight: Add max25014 support
To: Rob Herring <robh@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Pavel Machek <pavel@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20251201-max25014-v6-0-88e3ac8112ff@gocontroll.com>
 <20251201-max25014-v6-1-88e3ac8112ff@gocontroll.com>
 <aS3H1qzSMKHamqpP@lizhi-Precision-Tower-5810>
 <b9fe6df7-fdc6-4a32-919b-8f3b44eace7d@gocontroll.com>
 <aS79eKc9Ac4np6Nf@lizhi-Precision-Tower-5810>
 <e428c3a9-49e2-4af5-b597-2cdfef7028f5@gocontroll.com>
 <20251209190722.GA945742-robh@kernel.org>
Content-Language: en-US
From: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <20251209190722.GA945742-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P191CA0002.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d5::6) To VI0PR04MB11748.eurprd04.prod.outlook.com
 (2603:10a6:800:2eb::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB11748:EE_|PA1PR04MB10283:EE_
X-MS-Office365-Filtering-Correlation-Id: ee2d8b14-35cd-48d5-21b3-08de3c7bf760
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dnNiLzZ0WndhMHpNMXlYb3lOYUVtelROdDQxcXR4U0N0WmhreG45MDNtVEJN?=
 =?utf-8?B?R2VtMWNNaU5YZ0E4N09qN0VJQXo4MkJFRENjRDFtSmhRRTN6TWVUOVNLemhH?=
 =?utf-8?B?OVkrRWZCSUhyZ0UvT2lPY3Y2ai9CSTlhazVEU0ZhUGFENkV6NVJXRjdya2dp?=
 =?utf-8?B?UWwwUTRxUmg1bHdTenFHbmt2eUhJMStaSEdyTFM5WEFmRk96T3QvbTNyT2JH?=
 =?utf-8?B?bTViVlRjMG52NmZFei9mK0RJVFd3RUc5VEZqcmtGU3JuUnpjREo4VUErbGpW?=
 =?utf-8?B?Skdpbno1UXFhTU9sUEJjR1gzVUhoeFJNWEFWMm9xeVBJWVRLdnptS1ZBZ2s0?=
 =?utf-8?B?V0pHSHFlenBRU3BTUGd1VlovQXYwL2QwczhwQ21zOWl3UGY1ZEo4czdCUi8z?=
 =?utf-8?B?R3VSWFpzOFlESVNyd1VUUVI5SGVjZ1N4dG5ZcVZWM0FZVC8vSHhwbnZWRXlm?=
 =?utf-8?B?VkJqczVzdytHM3A3MVBvcjRuRmNHemxuc2M5Z1EyQzFwNmVuZXAzWXpscXcw?=
 =?utf-8?B?TjhSb1RiMGNiWHdHNzZZdHorUEdjNC9MVyt4bXpUclVuSTN4WVpkSCtBTmRB?=
 =?utf-8?B?REh3NXBMRGJtZDgwRVFyM1RibnA0R0xXTlBFbnB6ZWsvUVhsRzFrMWpvWE1W?=
 =?utf-8?B?bkVKWmlYam5DZWlYZXlaN3VvT3BzeEcwMWxVcklsRm50b3BQWkRMZXlZbmYz?=
 =?utf-8?B?OEhBWTZFVDVoUXRyVFduU1lUYUFTUzNJMXVseld2bFVWb1dWNlAvSDlPeVhu?=
 =?utf-8?B?aCtVMk9iZ3hiTFY4b21TenNueUs1QXN6YjMzRU5kcGxuLzkxV1BVYkZUWHBz?=
 =?utf-8?B?L3lURzlCOGVFWUdpcCtsSE5MVDkyWU9URzAwVXhKS0ZqMUJ0SlBIcWFhdmw1?=
 =?utf-8?B?Uk9PNEZUeEd3ZXdRRVN5NWV3M1RSbCtjWU5jbHRkWU1PZzZpWjU3S3dKMTlz?=
 =?utf-8?B?RUFzU1BnaUdJTVhXRlBaS1hwV1QrVUhsc1NXWjloVFhJNW1BV3ZtZ01Wbkd5?=
 =?utf-8?B?eE1GN3g5UHRVRDI1UTJobThRV0gxOTByMFl4RnBDcHY1WjJhaWJwbnI5WWFE?=
 =?utf-8?B?U0NCU1lXS09YSmhLZVpPRmUxaitjZW51REpoODZCbEJxcERLU3p5ZEtmV1d2?=
 =?utf-8?B?ZGNnT1QwODlqUkpLQ1lzditLaXM2VXEvbktSNFNBd2Nab2RDM0lXU2JEUW9C?=
 =?utf-8?B?d1NKNkdxRHNkRk1TUjVBRDFlNUhTVnB0MWQ3enNXWTNwRklIZTJrMVpjR0tM?=
 =?utf-8?B?NEVDUDBpWFpRL2duWE5USDZMeGs3MW9RVGpYbTJHaGR5S2Iya1lrVFV1Z3Yy?=
 =?utf-8?B?S2tiT0ZFTk5tUHpPaE5PeEo5aEdxbnd0Mjl0Z0VQOGpWZVI2ektpWVV2aWk4?=
 =?utf-8?B?UTc5MzdTUXhQODBmbVFOVVZsNC91NVBqRnhzZWFocS9jQnpTSlpmZEFiSUtS?=
 =?utf-8?B?UmtQcFJhbFFVWDhGMlQxUWRaU0orZWwrd0lGMWtXY0ZYSkdGWEZiN1VMRHlY?=
 =?utf-8?B?NzF0STZ6U0kzeUpqdXR6bGNRSVZvaG1CU2ZHaFJFSDBLVlFOYVU3UTBobVND?=
 =?utf-8?B?UDVnMHhDdTlENGxhSnp4aWRDdzV3ZGVrd2R6ZFBWZnpmSVFXWmJiTU9Cc0FF?=
 =?utf-8?B?cEtYVWlnbk85RHg5Y3hUZmZZMStzcDlDcmNTQTZscGVNdERLUGREek5QR3NM?=
 =?utf-8?B?QlIrT3VoWXJSU3dsS3pyN3NCUUJIUTFLUzEzQ1FJWS9NWmxSczNCUlBONlFa?=
 =?utf-8?B?TUJvUE1rMFBUV1BOY2t1eFJUQWMxMFlkSURvbWxPSXhwZFB6UGpkcGxVaWd0?=
 =?utf-8?B?eThjaUJrNlJKWDEvalBWbXFQVFBmNmExNWZEVkE2V2IwYi95TmlXcVU1QWs4?=
 =?utf-8?B?TlhKQjVyQS9XTXowY29YdVFVaVJvQTBPeDhuZU0yYkptSXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI0PR04MB11748.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDliYzdEbDZMK24zcGVHNmNJWDd5c1lSN2Y1ZkNmZ0FodnVPM2VKZk9GQkFB?=
 =?utf-8?B?UGdOempHQ3phZWN5WmNWNnlDN3htcEIrNXdXVkhTRDRCZnEvVk1UYTltZ0pk?=
 =?utf-8?B?SFpnM1c0THdTM0k4dkZNWFlrYU5iNWNsSytFbmdsdGhmN0J2MVkyMEFINjl5?=
 =?utf-8?B?dStrNlBxZjgyVzJ4dmoxMUFFN2pJckVycFg2MDVSSTYyUndVRFlQTjhMSWhH?=
 =?utf-8?B?UUZnZFMzTDhyM2JmakZOTzVILzFwZGpaVlFpc1p1eURoM0NZV1lOVExBaklV?=
 =?utf-8?B?aGZTWE5sT0gxWmc3RGJKRytLOElIaUVIdU9uc0w4SklNWUp4dEdzMlJYekdJ?=
 =?utf-8?B?blhUWExZVDRkcnpEanlFVzFsc0UvL0hFd1F3YkVVekhRMUxodnMxRmtPTkF5?=
 =?utf-8?B?RDhZUGxxZlNrNzgxZTRidzltSVpIejBvR3AvUGI3OWxSWEpDbXhCZm1sa1lk?=
 =?utf-8?B?K09EaXVvank2NnozRkQxejhhT1pyWXZXNkN4RCsvNEtQaWhuUXp5SFUyTHZk?=
 =?utf-8?B?QlE5VUxGNjcvYnREbS9LVDBxSC8wTDVMYjB0UlMzTFhtQ2ErRFpXV0RJZTBS?=
 =?utf-8?B?bWhJQTNvWDRlOFRCMDdDYzBPMTVVcXNGOTcxV05NSWE3Rzk3OXRFbHFxNjFa?=
 =?utf-8?B?ZEQ5SnNOSm5hWnlyUFRmRHI1cUNaOTVCbUlmQ3ZVMVlYRUtGNXFpMHBqSkVa?=
 =?utf-8?B?MTQwUHpaTlVtYzY0NDM2OVVvdVNtUVJRcmQrbUdkdXhwZnJ0T2JpeHE3Wjlz?=
 =?utf-8?B?ekoxTEoxdW5aVitDZEdMSWNINGRDOHpjRkdmR2lrY2N1L29xaU5HbjR4Uko5?=
 =?utf-8?B?T1NYNkRrZ21nUVBWeG1QS254eldoYms1MzNyN3R3ZE10Yktodmw5RVRaMy9k?=
 =?utf-8?B?WmVxbk84d3pnTWF0SDArdWg1R1BnN0tQbXNPZ0RjS1A1RWVValF0TzhZbnFy?=
 =?utf-8?B?Mmh4OC9RTW1rNXBZRkJZdDJFdlNRMmp6TnNDTzc3TjBPUGJ1ZldMSFpxUzBw?=
 =?utf-8?B?N0QveDNpN3A4L1VHcm80VytVbENYbWVpWnRpL1EyUEFudm9CQlNnKyt4dW9N?=
 =?utf-8?B?M3hnaEtDVStQRSt6R1hDK0JNeUdNcmhZWkpST1k3S2tZZ25samN0TTBrNHJl?=
 =?utf-8?B?c2hFTkdZeHF3UG9PQ1Y3UlAvcEY4RXBpSHNCcWxZMlRPcGFyZk95VVRINGov?=
 =?utf-8?B?RE9UWVRBMlNIQXZQUHJ6Tjc0YUJnZHkvOGx1RXczMS9PU0dlR2NCT3ZyZlE0?=
 =?utf-8?B?bmZsejVod0tOUW5DU01tQkRjTlRIQnhHUEFCQ3RQSmg0WGJnd0ZicVIzTjFX?=
 =?utf-8?B?SXlBb3g5UVYzNTJOL1pPL2ZnYUhvd1ZNbUdzeWdGb2pkZGFVV0ZVVmEzYXNt?=
 =?utf-8?B?MGhyWTFCZUprT29oQ2U3UWZXWWl6UDdNb3lVQU13c2QxaEJ6SXdCQ1loOEJk?=
 =?utf-8?B?aTA1TmU2aWk2bGVXWFFzUkVjLzdTdmM0RGhEd25HZ3ZrQzJITnRyMTB2VHh5?=
 =?utf-8?B?bndPb01zWW5Yc3BtZjlrNVlRck5YSEdlWlZCbUdDNDVXSFF5YXhKNzhlOVhK?=
 =?utf-8?B?WUNiVDVWbm9DMFJ0QlJMcFJVOWxLWnFtaEFaQ3dSNkNGVTVHZ0NMaEMyY1FK?=
 =?utf-8?B?OTdsZ3BQZkd2M0E1a1BaVHRobnNBRXh2T2tUTWNORXYrV2lKTkdzQktBbGJ3?=
 =?utf-8?B?R2h3Nm9jTlliWW5mQzJEQXczZjlveWMwd0FCNlZCaXVGN1UvNEFCUW1CaThx?=
 =?utf-8?B?aWwyRDZlc1ZycU45VjBDcXI3QkZzTjNld1JyRGpUL1BvVm5BdWtzbDBEUjd6?=
 =?utf-8?B?MDBWN2laTzJoYk9PSlo1cGNTSnFyNE5NZGNRdkFpSGlmYlFqYlpJcG5xd1ls?=
 =?utf-8?B?R1NRbWJmM2VmWFdiNlA5QUhCbnN6VXpzNk5GRzhyWFdoejF6WGwxZldRWW11?=
 =?utf-8?B?bEFiMk0xcm53b1F2aEhydnRIMXBWSUhabVFvQjUrNzFJclExcC90YkZKOCs3?=
 =?utf-8?B?UXlMR3g4c0tVSWpjZkNyZXMrT09pQU94T1VSRUxmN3M3N0RPc01KTkkwNmNZ?=
 =?utf-8?B?VzZDdHhrNW03czdabElYUTRxRTNMZUgvaVRkci9WcWFUQlNFN0h6bnhTa0pV?=
 =?utf-8?B?eEMrWFhKUEZrZkw1MkVMUU1FMExPd29lUS9JcmV0cFloWlJhYVZwSk4wUmZq?=
 =?utf-8?B?S2VkTkpZUTMvWEx0Z2EyZDdyeFpmWnVtUGkrZGFRemNkblBQT0tmUEUrVklh?=
 =?utf-8?B?bTI5M29Xck93b0NXSDMyR3ByR1hnPT0=?=
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee2d8b14-35cd-48d5-21b3-08de3c7bf760
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB11748.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 08:20:26.4334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hC/KmwaHeGK6IMalqf3FY3i+elfxSvC9BQcXZNh5vEPaxav9zVEMFlmn6JNRA8OWmYHW87A95JQsAW3eZR58rW20nwmASYtFW6LODUajcDU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10283
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

On 12/9/25 20:07, Rob Herring wrote:
> On Mon, Dec 08, 2025 at 02:56:50PM +0100, Maud Spierings wrote:
>> On 12/2/25 15:53, Frank Li wrote:
>>> On Tue, Dec 02, 2025 at 08:46:21AM +0100, Maud Spierings wrote:
>>>> On 12/1/25 17:52, Frank Li wrote:
>>>>> On Mon, Dec 01, 2025 at 12:53:20PM +0100, Maud Spierings via B4 Relay wrote:
>>>>>> From: Maud Spierings <maudspierings@gocontroll.com>
>>>>>>
>>>>>> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
>>>>>> with integrated boost controller.
>>>>>>
>>>>>> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
>>>>>>
>>>>>> ---
>>>>>>
>>>>>> In the current implementation the control registers for channel 1,
>>>>>> control all channels. So only one led subnode with led-sources is
>>>>>> supported right now. If at some point the driver functionality is
>>>>>> expanded the bindings can be easily extended with it.
>>>>>> ---
>>>>>>     .../bindings/leds/backlight/maxim,max25014.yaml    | 107 +++++++++++++++++++++
>>>>>>     MAINTAINERS                                        |   5 +
>>>>>>     2 files changed, 112 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
>>>>>> new file mode 100644
>>>>>> index 000000000000..e83723224b07
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
>>>>>> @@ -0,0 +1,107 @@
>>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>>> +%YAML 1.2
>>>>>> +---
>>>>>> +$id: http://devicetree.org/schemas/leds/backlight/maxim,max25014.yaml#
>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>> +
>>>>>> +title: Maxim max25014 backlight controller
>>>>>> +
>>>>>> +maintainers:
>>>>>> +  - Maud Spierings <maudspierings@gocontroll.com>
>>>>>> +
>>>>>> +properties:
>>>>>> +  compatible:
>>>>>> +    enum:
>>>>>> +      - maxim,max25014
>>>>>> +
>>>>>> +  reg:
>>>>>> +    maxItems: 1
>>>>>> +
>>>>>> +  "#address-cells":
>>>>>> +    const: 1
>>>>>> +
>>>>>> +  "#size-cells":
>>>>>> +    const: 0
>>>>>> +
>>>>>> +  enable-gpios:
>>>>>> +    maxItems: 1
>>>>>> +
>>>>>> +  interrupts:
>>>>>> +    maxItems: 1
>>>>>> +
>>>>>> +  power-supply:
>>>>>> +    description: Regulator which controls the boost converter input rail.
>>>>>> +
>>>>>> +  pwms:
>>>>>> +    maxItems: 1
>>>>>> +
>>>>>> +  maxim,iset:
>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>>> +    maximum: 15
>>>>>> +    default: 11
>>>>>> +    description:
>>>>>> +      Value of the ISET field in the ISET register. This controls the current
>>>>>> +      scale of the outputs, a higher number means more current.
>>>>>> +
>>>>>> +  led@0:
>>>>>
>>>>> define whole binding, allow 0-3. binding is not related with driver's
>>>>> implement.
>>>>>
>>>>> it'd better put unders leds.
>>>>>
>>>>
>>>> so like:
>>>>
>>>> backlight: backlight@6f {
>>>> 	compatible = "maxim,max25014";
>>>> 	reg = <0x6f>;
>>>> 	enable-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
>>>> 	pinctrl-names = "default";
>>>> 	pinctrl-0 = <&pinctrl_backlight>;
>>>> 	maxim,iset = <7>;
>>>>
>>>> 	leds {
>>>> 		#address-cells = <1>;
>>>> 		#size-cells = <0>;
>>>>
>>>> 		led@0 {
>>>> 			reg = <0>;
>>>> 			led-sources = <0 1 2>;
>>>> 			default-brightness = <50>;
>>>> 		};
>>>>
>>>> 		optional led@#....
>>>> 	};
>>>> };
>>>>
>>>> right?
>>>
>>> yes.
>>>
>>
>> I am feeling a bit weird about these led sub nodes, because it is not
>> programmed as a led driver, it is programmed as a backlight. I am trying to
>> figure out how this would be used later when the led strings are
>> individually controllable.
>>
>> it isn't possible to link the seperate strings to different displays because
>> it is only one backlight device, so I don't seen any reason why it would
>> ever be used in another way than what it is now, were all strings are
>> programmed by one register.
>>
>> The only way I can make sense of it is if instead I program this device as a
>> led driver and then use the led_bl driver as the actual backlight.
>>
>> Thats a pretty big step in a different direction, but then the led subnodes
>> at least can be properly used I feel.
> 
> If you don't have any use for anything other than driving a single
> backlight, then I'd just drop the led nodes completely.

Theoretically with how the registers are laid out, it should be able to 
control 4 led strings individually. But as I said when I configure led 
string 1 it will also affect all the others seemingly. I am not sure if 
with some other configuration you can indeed do individual control.

Before I start converting stuff back to how it was several versions ago. 
Frank, do you agree with removing the led nodes in this case? I don't 
want to get stuck between two different paths.

Kind regards,
Maud


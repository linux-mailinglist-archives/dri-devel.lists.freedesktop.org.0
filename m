Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE44B2C3BE
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 14:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B7DB10E15D;
	Tue, 19 Aug 2025 12:35:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="ZqOOQKYv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11021112.outbound.protection.outlook.com [52.101.70.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B28A10E15D
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 12:35:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MpP8vWpS97rVQUEVdcH3J3oU+faJ2SGQZLgWgZQoeTstg8bDd0OSfWqv5bF+q0WmXtEtHoYILOvwBB7A/pvB36Aj+cwh9wbieEumcUVHpT7pf9ZfxFK3v7XE+ZVufIS/VfTWWGC3wOwgtBsY4BOek3pqSvClUCH8fPIDDgjI3d0kbYtVl24jRuBi/1yXazW2J/R7G/BFT3Swoc9yutPUws7ZoLjDxaO4MmFczbiWbl66aNn0K2IhHNIGL/rEpLXo5BDQ2oPn2HXeSW6YXnsARtk0LgwkmaUfvURUuXNaTMtEDjieDGpla58J8TCTv1IKOr90mflxsFfwCyV9wxeggQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1NjRegXfIMQY609EyTKt+vx/RFgDJ2TPpnE125XBWhg=;
 b=mM/5apTqqN6/m9rdOaDxw9RrdKaJMBnpC3fl67VMPYdIR7auIywL5GSfWaYWKsgsE2O0bwqoTu3GNtfOxaBoYRukozHoGYC5oZd+PWExmXNVckkyL2ovRxA1PN9ShCSBlYrBz4uo9Ot2vu+fjJ4M/nPnFPTjvlH39mKlYcefkTGupBXxON8aSyMdZKAu3K5h64k3BydAJw25bmXvbYYFoudIYOvs4+hLD428ZXyd7LVmYhrDVt9JhQv6h4nKPHvT4pAlq+vaNhjrDWAbZTpFdqL7m10fp6A+kzZsr54GjYk1nzNwfHG4cecfwUodvM6+h7xJt6v00VWclYjf2znNGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1NjRegXfIMQY609EyTKt+vx/RFgDJ2TPpnE125XBWhg=;
 b=ZqOOQKYvsBGMVpM/+63hy2ri6EracLrZCL63GhHpzvj6uYuunGZBa7KAjQM9Ljp+9UO+ubYZmjPozhidrlKa4DZAh/7LM9YPfPzTh5WsaXJ/h4iAafgfDl9/j869m448veLP6L3Q8YUFvpbVIIr65fur/VPo0m4/868zsWrCqyGIwJMD5CelH1xvrqoP1E+Wqda9H2epLdtLjOUz4ihfehA6lCkSORDLtGwB1zQfg0vAVHZh1c8uGVcXIHuhU7UbRf5DhVFBt7KgGHPhlJd2cmF6Qdk5+r/24wClqAIodhxTUB+dEYZI5hCBsiqWgNy0FzRUyc3OseInHOyYlrZ8kw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com (2603:10a6:102:ec::16)
 by DBBPR04MB7850.eurprd04.prod.outlook.com (2603:10a6:10:1e8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Tue, 19 Aug
 2025 12:35:49 +0000
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f]) by PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f%4]) with mapi id 15.20.9031.014; Tue, 19 Aug 2025
 12:35:49 +0000
Message-ID: <32c9454a-9d57-46b1-b43b-8bba1b28c231@gocontroll.com>
Date: Tue, 19 Aug 2025 14:35:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: backlight: Add max25014 bindings
To: Fabio Estevam <festevam@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20250819-max25014-v2-0-5fd7aeb141ea@gocontroll.com>
 <20250819-max25014-v2-1-5fd7aeb141ea@gocontroll.com>
 <CAOMZO5D6m3V2ZpFOtabrkvf6+SGE+3-xpAE=PZo+Ak=49ozyLg@mail.gmail.com>
Content-Language: en-US
From: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <CAOMZO5D6m3V2ZpFOtabrkvf6+SGE+3-xpAE=PZo+Ak=49ozyLg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR01CA0085.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::26) To PA4PR04MB7630.eurprd04.prod.outlook.com
 (2603:10a6:102:ec::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7630:EE_|DBBPR04MB7850:EE_
X-MS-Office365-Filtering-Correlation-Id: 753e3bc4-4d4e-4e89-cd46-08dddf1ced38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?azlUek1DQUFKajE0OWsxUWpGeHFWRUxKclNCTFdtNDRHV01rcWdJL0p0UTdU?=
 =?utf-8?B?MGd3UVM5MHI3RTBVdzNFZDc2Y3ZxVU5WeEpmRk9LUDI0WFNEUmNhMU9HNjY2?=
 =?utf-8?B?SmRBZmpZQ25NMWg1VDNZODYxLytOUGVDV2NlYytla3h4RXFnVnVCNjFJaEdF?=
 =?utf-8?B?NGlTR2Z0TlJpQ3pvMzlGcWxERmpxS2h4MWJsSjFxTzBlY1NxQzhKSkFTUmVJ?=
 =?utf-8?B?bUk0b1dBcktMVi9nN2N3TzB5RmRqZFdIMzVkL2J5dFFsZTdNZ3hkU0VqcFlx?=
 =?utf-8?B?OEgyVXl1Vkw3RXUzVURlc3hYeForekl2UjBoNS9Zb0dXWEdiQm84YWYyYjFN?=
 =?utf-8?B?bXVmSEk5cEM2ZXNKZkY4WjlVWVR2L2s2QTl2MDArd1IrVWZnVFdzUDl0OEtq?=
 =?utf-8?B?WjJDTG8wSTJXdWpwVXJET1JSc3BaUEJqOWFscTZvRXdqQy9Na1BkNmE5Q0ND?=
 =?utf-8?B?aFQzTmdZRXJaZlpZeE15UEZrYUJxZm1EdVFKbUtRTEw0V3dpa2wvc3JlMG9t?=
 =?utf-8?B?WjhpenZZYzRtRDRva0U0ZDJIaFcxZUU2b2cvbW5qQ3M1WFRCNytwcVlzV3kv?=
 =?utf-8?B?SkFhbUFUOVh0MHBuNzlWMlY2OVlMNmtLaGpmb04zUklHSmErcTdYWEdxeTFO?=
 =?utf-8?B?Szkva2NBa2k1VzZqNWFybTAxeFBDeitRVUJ6VGhmcHVDd0xyMGJBRXJvTGJr?=
 =?utf-8?B?SVhGNHQ2d2NpM3ZtV3NTMExOdStHZHhoblJ6NlM1bkZlVkI0VllhS0lnak93?=
 =?utf-8?B?OHFFT05udHQxQ1UxdTlMWWlqRjRIbVYxdGN3YUwrYlhqTFZHN2VWVXRrOWFx?=
 =?utf-8?B?dXVZdVpuVU9SK3BDVUZQbEcxaFJWWFJ0dlRQZkxMMitPU3RBS0RibGZoWjNF?=
 =?utf-8?B?NVRpeE9oNVBST3JRL2VvdlRsNVF6Z1NPZG9ZY2YrNk5yaldMQ3lDY1FTZG0w?=
 =?utf-8?B?aWpBZHMrM25NK0thVnZUSTl1d0NOZkZDdzBFZnBpbXBVTUVpZVVFVGpBQlUv?=
 =?utf-8?B?OHc3b0ZFRFNXYXY1bFpSMXpRZy9Ha1dzUzVWK2ZGVnEzV0lzb2hjWDhQSHBk?=
 =?utf-8?B?SER3ZytOZEV2VTVyQ05PaVJWbjl2eUQzMEM5VER1cWlwSWhWMXAremhveGtT?=
 =?utf-8?B?ZGdSckZabUQ3KzIyeWlQbTJZNWlNeTY4dVlIbThVVlRFUm9qQk4yZFo3WktU?=
 =?utf-8?B?R2pqdDNMNXducGFRZHQwcUhvYkYzSWYyY0ttVmM4RWJqN0loQTRCVENsby9U?=
 =?utf-8?B?dVg2bjNTTU5GOSs2MHhFZ21lTnkycmVYOWJNK0RvUFJJclRUdjg3UGhaZGFO?=
 =?utf-8?B?Z2UybFRITWFONDV2THBEdzB0SHB6b0FqRWQ4SWtrMlRGcks0YkpaSEZod2Yy?=
 =?utf-8?B?bUxMUFBlT0FmS3JlN1R2MTlNbnFWQWRuZ1FyYlJpZ3hqMnN5NEQ3Lys5MndH?=
 =?utf-8?B?UGhyekRIVGN0dVBBeXFwZHhXNkhmK25iMHpIMFZkM1JRamMyQjdUWVY5Szdv?=
 =?utf-8?B?WjgxMURDQmxIWEU2OXJreEVvbU4zb0FNVjZIbHJGL0JyNjd6dDBaUzZtYjVU?=
 =?utf-8?B?b3MxZmlSSWhUVEVhTVFzKy8vdVhXWDBUS2QrNHZEcmRQV1JsOUxMTmlVMzB4?=
 =?utf-8?B?d2JSbXZHZUVjNytKZ0pnS3FHdmdzeVJDVDROSHhVWkVKTkd5eFcrNlE0NGtN?=
 =?utf-8?B?UklZNXk4cEN4ODU0cVhCaC9Wb3RVSzJwV25uenNLUlZYelUzQUhEdUZtdmNT?=
 =?utf-8?B?MzlYTjBjbDdDMkJoWXJXSnBQV1ZMcUNNQ0ZlbEoyVEdhbWJhTzlBMWJlUkpF?=
 =?utf-8?B?Y2lpS1pFWFdBenJzM0J4N2xrcExPanQrRy9HSi8yVm15cVVCZ05sZUFUdjdJ?=
 =?utf-8?B?UmdLVlJrTENSb01VQkEyR1ZFUVRRc1p2OHBuTVhMR3hyakZnWS9EV25NbUNK?=
 =?utf-8?Q?R+Q4yiD1ioM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB7630.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTJBM2d2dEI5bkRaSEpWOVJESi9PK2R4UWxndkZuNkdtRlFBa3dqWXRsUVNa?=
 =?utf-8?B?RnR0Ymw3V2M1NXJ5QmJLNUhHY0ZveVhRYk14SjN3V013RnU1ZEw3UDg2TXpK?=
 =?utf-8?B?OWlBRlB6SjFiUVk5elBudDg1NmxTc0ZSUW1LcjFGeFZ4eHpBZVdDamUvaEdV?=
 =?utf-8?B?OTU1empVYktjREpHbjEzcTNHVFhXUEJMNnhiNDZNcGtheFdhVG9ST0YyMHNS?=
 =?utf-8?B?QXJKVE96NTRsTEErMUVlMktJdGN6ME16ODR0K2pVSnlZb2pGTGFxNUMvWnpy?=
 =?utf-8?B?VDlqNUc5QUN5L1ZaTThyTWU3VEo0VldPWjFDb3ZheEd6cklUWEF0KzI0Unh1?=
 =?utf-8?B?VHk5RkpzWjFmUnk2bFFqNlFDQVJNNmpTMHBuWWt5QUthK21EWE1aNlcvK0cx?=
 =?utf-8?B?ZU9jdkJTbjBPeEJ4K1QwcDc5MG1HVW93bGRZeEhmd3pYcDlLbVJnREtMU1VG?=
 =?utf-8?B?ei9ON0FOVjRSblRkNC9tSTVVWVJuZDhTanh4d2dmcW5yQlVGRXJrTXlWekM1?=
 =?utf-8?B?NUlFT1p5SUJZbEpLT0FFWHEyaURDVUFEdGJyZm9tZVB4V01maUZLMlV5dnAx?=
 =?utf-8?B?MEVkd0lvTFhJNURPWU5aTjBuN1Axa0l0aUt4WnFzSmlnbmR0bTgrWXpEQVd2?=
 =?utf-8?B?amhNeGQwK1dQQTFBczg5UHRXOHRGeTJ0UXcyVzk2OGQ0UGU0dkRDVVJhaVM5?=
 =?utf-8?B?MUQ5eFcwTTl1MmlrOC9pTm4yaDFyMy9LME9oTFRCSG44bElCVDB1cEVzZDlW?=
 =?utf-8?B?c3lSVENGSXl1MVNBbE84L1pFU0FFZkhrRk5WU0hWNmxiNCtjNzRXdU1UZmZC?=
 =?utf-8?B?a1IvTjdCR3Y1T2ZFbFk5MC8wWHUvYnFDZU1yMko1L0tkM0pOYmlkaEQzMmV5?=
 =?utf-8?B?RDdRNERnajY2RzRmTEtobnRGNUhnUDBKQVR6Skg1eks4VVd6cUdPQkhsSDR6?=
 =?utf-8?B?OEZ2WlIvZzR3dmtjbEo1N1RZS0l2cnRmYW83N2pidVVreWxobXRKOUlUTnlQ?=
 =?utf-8?B?WVRxQk5tQVk5K1ZoL0pqUmtpWWRzYlBoaUFVbTZiK3hZalN0VmJRckZrQ2tP?=
 =?utf-8?B?aG1majM3UHZSVHhPZUljaVMwVTZQUGtnd2JjN2RYNkpBdmJaVDN0a3BXYlBQ?=
 =?utf-8?B?d1RHczB2VkZZR3l0MnZaTGlhSjJmRTA5VWoyK1J2NElwZ21qSXNqTHJNeElI?=
 =?utf-8?B?NEZwa0E2Y09qS2xrd3RQWTB3V3dEOUM3TTBZVjY1ZlVOTHl5UURNSlZodmk3?=
 =?utf-8?B?eUFZaTE0blRMcEFOZTBVbWJ4dEUzeTNGTmdBZVdVRVdVTWl5Z0pjNTZkSXBy?=
 =?utf-8?B?emtQWXZkeXc4eU9JOUxEL0pSUW5JMmZpOE1hSW5NTVNoMng5SXFUSnd5L0Z4?=
 =?utf-8?B?dDBHS3Y2aGQ0MHJWQ0hYV2NnK0NYTVJyU2FWajRiWXJuamgrV1czanVXbmts?=
 =?utf-8?B?V0xiNEhPSXh4bkQ2SHRCRVVYbWZHT3kwOVU0RFk1dUxDVXNXSDNKN2JrK2tB?=
 =?utf-8?B?TWh4NUtLRWZxMU5pMkM2eGJxVUhGejJTV0sxUXVRQXk1anA4MDFZNVBIRFNX?=
 =?utf-8?B?aU11Nkt2MXNkSHhBeno1dU8wTnRycnBtVEplcGpRdnM4UHVjQlkrMlMyNFo5?=
 =?utf-8?B?cERkR2p3QXRsOG9GMjNDeWZ6MG1VaE9sdm10WCtWME9oVGZtNkJoT1plVXVX?=
 =?utf-8?B?TDA2Tm83VEdQYzJtZXNxMlRNYmJCSmMvNFo2ci9wUHV4eHI5aWZ3TnFJQUpq?=
 =?utf-8?B?WEorbW9na05HR0RLRG9taTF0L0NaSUhlTFkrOUE2SzFGQkJ5U2liZHhuLzln?=
 =?utf-8?B?L2h0ckw2QnFGeTdlY3VKa3gwZU5abW1uNFIzVGZWTmRpa1BDbExvM3ZVaTZM?=
 =?utf-8?B?cHNxSUJNc2FvVWduVVhTM3poODN5S1czY2M0ckg1VzZyZFowa2N1N2dTQ0tz?=
 =?utf-8?B?dVQvUStTTFJsd2UxWFF1UnNETGdLaVAzbzhsT2p4Wm5yc1U4M1JLTjRxdTJH?=
 =?utf-8?B?Si9KVzRmQWJiK09GNmhDWnpZanpvZ29OL0F6RS9NbDZjS05BeUN4SUFQOHV5?=
 =?utf-8?B?dC9SM3MxVklCSGlTR2VNdlp5WjlOUGludFVEcVBRc0wwcGhKNGFWcGlNclVP?=
 =?utf-8?B?SnZwVmdSUGhueVhjVG1rVHFqS0E2RUY0MHQxbC9CMVljQng4a0xMQjNSeGhE?=
 =?utf-8?B?a1dveGFMZ1R5UDMrUGltVFArWW1IQTlQVHQwVU9XOXRET0kydDE2RUI4dWht?=
 =?utf-8?B?d0NCN0p0V1Zhb0UyWks4aVFJS293PT0=?=
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 753e3bc4-4d4e-4e89-cd46-08dddf1ced38
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7630.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 12:35:48.9628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jjq5rz8nAeu/H0xRAmshTruXLyo4xyOtOwsHSPAFctyS6uQzfWszRKvkBf38K9NaspWG+tO4USxYdVk+u+aWU1/EdVl2Qs3bKx7ZCMYk/XY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7850
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

On 8/19/25 14:28, Fabio Estevam wrote:
> On Tue, Aug 19, 2025 at 7:59 AM Maud Spierings via B4 Relay
> <devnull+maudspierings.gocontroll.com@kernel.org> wrote:
>>
>> From: Maud Spierings <maudspierings@gocontroll.com>
>>
>> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
>> with intgrated boost controller.
> 
> Typo: integrated

oopsie fixed, ctrl+c ctrl+v in patch 2 fixed too

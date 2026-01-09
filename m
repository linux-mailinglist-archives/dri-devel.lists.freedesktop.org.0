Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE41D0800C
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 09:55:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C3E310E84F;
	Fri,  9 Jan 2026 08:55:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="df3H5sBM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11020143.outbound.protection.outlook.com
 [52.101.84.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C53010E84F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 08:55:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pUg/A6cunQ1Q6nEk1c86SCednXAmTEen6606rxLvMdgJMcBe+oNCTzUzzlDu+YucokJXM/xXjAtDsKHSIqbo6v75QMO5asgFEC+wUkYQpZPQA6j/4H1eb7XSDvyIi0vQYDVcTGCS5Nb6CKYrGt/9royXAplibgKqmSsO2nTXJ9+4KY983l7G5DwaJwgxsDyrwVhmih0e/3FW1DtH3dDelE139vxWKIHi2T6Kj5FG5r+ZKrZKWhrKsiamK1Y5LaWB9rNyc/KpYf5aueCXczoOMEeyLa/C3iTe1XYVPPhRkU3IT8AarP2sGbD0eZdtj6oucfo3lpiJbVHHlbmzmVKKWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LV8rXPj3w+Xd+Kr4SaVocr4ESLPg85B+FZ1f05w/FsI=;
 b=c4i2kwXuZeOpnv9kcM0m4cA3mtDf4FXcqMVGd3blM4pDnCjNe1YI9J30rpY6vecTd1aHuNBylL0pp5FGc03yz3cgr8c6g3lWYWBXgNFL5C9FggLMk2IeGo6Ubqlmk9b/YW5Lfl1eO4h8YTtBITyPdK+CZ5l6suXH6LvA5GYJIp+JJ6g+7yrZdpFpRvlswN4kxjjf3yoqJrxVUgGZEpDvd7x8/NYT4XKusfoz+r+kuyHrR/iLGcEDlW/5tLVTVZWFwTRHQC0K04EiTdWbY7TZVJ+EuytrwKaVolv5xnz9ynm54MPs9tU1Ajiq/3hKZdyD3IaDllzowTOp6QNjj2vrhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LV8rXPj3w+Xd+Kr4SaVocr4ESLPg85B+FZ1f05w/FsI=;
 b=df3H5sBMBZqHjuB0EpLZlfWv1KXtIQ3ZOZAx0goqLJJ+qOzbh0H2uezimn6+6HfXQQOCE9nkhBDa78Rkorst4Q5hSFNGskXT/ivJ+HUgXM6+PlDTIGxNNiXXmxFVOLFjFUZafSYTlcTBadzAk0FCvHfTkQ3Jto+gXPElePoEfue3W7UrsIPbp/KJ+d6G7HuLd5lH+jU2pGQZCRLRiKiEL6rwRW40tUFQyuqq03Fx3+jVLxk48DoZYxpQWP5pRudxoQLPAq05NXyiBab+xD9et0qwxXcwtpFsxBhdMx2c6Ypw/+ivYiPAWAZzbkplNdv8mXbQcu2ntEHYquGVqaFBFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
Received: from AMBPR04MB11741.eurprd04.prod.outlook.com (2603:10a6:20b:6f3::7)
 by AM8PR04MB7218.eurprd04.prod.outlook.com (2603:10a6:20b:1d9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 9 Jan
 2026 08:55:32 +0000
Received: from AMBPR04MB11741.eurprd04.prod.outlook.com
 ([fe80::ee70:7a62:e9f:12b7]) by AMBPR04MB11741.eurprd04.prod.outlook.com
 ([fe80::ee70:7a62:e9f:12b7%7]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 08:55:32 +0000
Message-ID: <fc5aad54-08fe-453e-a3cf-621414c8a060@gocontroll.com>
Date: Fri, 9 Jan 2026 09:55:18 +0100
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
 <8a9a59b8-d5c0-46b3-8f86-a4cd910b7af3@gocontroll.com>
 <aTaqCxsGj_waN92Y@aspen.lan>
Content-Language: en-US
From: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <aTaqCxsGj_waN92Y@aspen.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4PR10CA0004.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dc::8) To AMBPR04MB11741.eurprd04.prod.outlook.com
 (2603:10a6:20b:6f3::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR04MB11741:EE_|AM8PR04MB7218:EE_
X-MS-Office365-Filtering-Correlation-Id: 694bdcaf-0c66-4133-aaee-08de4f5cd84b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7416014|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aTk0UU1MNFZUWUpUUXl5eGxxdEtkTm44b2RQbVk3VWV6TTFsYUtacVduc29z?=
 =?utf-8?B?alBkS1ltRU1zUEE5S3JQL3lzSXlUMzZvV3M3MnVVK2JucDFoVWVzQzFDSHhY?=
 =?utf-8?B?UmJpU1RzMW1CTEY0YlJkVGZaRVROQ0hIUDcwY3lLeE5UTlhvVjB5M3dweVhs?=
 =?utf-8?B?b0lqQXNkUFdOdG8vRnVLVVNIUldYenhranZrUzl4Wi9wYzNSdTVYczB3NGRS?=
 =?utf-8?B?YVJRVlNyZTFKd2t1WmxsY2tseTlKR1ZmU1l6UXhER3BNN1hkVURzWXpNWXlv?=
 =?utf-8?B?SGtRWUFpamZ6blFrVEtoTGhCNWtwS0JubWs1UmNzRnErWlg3TGc2SkRYTjdD?=
 =?utf-8?B?R3l4eElXeDZVVjdHRXJLODl2N0lxZEVMVUxEeTNydmNNaERRS1N6dGhrbG9J?=
 =?utf-8?B?OFNrTlluLytLL2pySTFCcnlVQ3dLaE85ZFJqRHAyWjJjVVk0QXRDWkUwUWdZ?=
 =?utf-8?B?VDRlNEdjZ3hVcnNQUWRGNmsrMHdzQ3U2cTU3WlE1cUVRRWV3RmI1QnNBcHVo?=
 =?utf-8?B?dTlYOEZwUy9QTXBjYUZ1MjhtbG5NTmNGM3ZvVUROR3dUYVQ4SFY0NGlZYytV?=
 =?utf-8?B?VUtQVmhYbUllS3hZdkttOFN4NHJteTBiODhZVFpBMmR1cGp0bjArblltLzBG?=
 =?utf-8?B?YUdaY2RyMTFFT3ZHbVE4ZHlndTVSMWl0NWtUMXoxaTRNa1lVc2JwZGJRZ05i?=
 =?utf-8?B?STdvVUZqbmZJYUV1S3dNUmNOdXk3YTZHTVNoOGZ3UlBaaVZON2J4cXV3UGFV?=
 =?utf-8?B?R0ZhcWY1Rm9rREZwcUVnbC8wU0h0LzRKLzgxaEtwdGJONnF1MTVFcCsrc2da?=
 =?utf-8?B?Ykg5RHdLdG1CRzh0RWhCbUdmR1NILzF2QzZ6WmhwNjdVSUpmOStyMGRMeHZh?=
 =?utf-8?B?K1pEdTBmbWZid2FXYnNNeTBXM3ZVQi8rTkE4bkNxZUFUWVdKUVJMM3pZQ1ho?=
 =?utf-8?B?TWRTa0pZc1pIWXFFeWsrVDN5azBoZWl0eXJrRlZCc3dWTEpPR2NqVXZpYWx4?=
 =?utf-8?B?aWhJMWpjNDIrYUJ6S3hZVm5rWkl0NWhSUXd1S2MrWWFyVjN6Z0QvdGpxTjBW?=
 =?utf-8?B?enloWXh3MEIyYUw3QnQxLzMvVW5lcEhGTVUzMTBjK2JoSU12Y040Wklpd0kw?=
 =?utf-8?B?Z3RQWHpCSEx6eEp0MSsrTWpHM3gxbHFGRjdFeURpaStjckpZb2tCNDczUExP?=
 =?utf-8?B?Wk4vSWJIS3VvSFVNNVRPeTNJNWJKTFBvOGRTNXQvOWxwVXR6NG5jZFNwOUxR?=
 =?utf-8?B?emU2NURoQmdIUzJlM3NPZno0SVpUZXVaQ2ZiTjQvOVZjb2dQSFNlMEh4TEVo?=
 =?utf-8?B?c2pkanQxbDZRYVZkdDFRL3Y2NGhFaEdjakxBV3YzU0VRTWorOFNyakhuTmhZ?=
 =?utf-8?B?SEc2d0VQamF4WkFVR0lNTE9Sdm1HQXM1cUpIUFNMWXVhM1pBMWd0VGJscUxE?=
 =?utf-8?B?bCtNVXlYWllyaFhWcGRWU2lwajFZY0VOQ01KNjNYVVgrNFFuS1phRWpWbVIz?=
 =?utf-8?B?aGZpY0xhdzFhMXZXbDVWZDlNSDhPSGJ5VlN5NU5pU1JNL2RzRThlSlZ2Vm9N?=
 =?utf-8?B?bXdyWkJrMUdHTFF2OWVKYlVYWVI1MGUzMXNjbkEyVVNXamloMWxuRUZ4cUdX?=
 =?utf-8?B?WmN6WWl5elpmVHRVSlRER1RmZWFQS1QrWE5mQ01ZRFdGb1FMT0lvOHdYU2U2?=
 =?utf-8?B?bjdGM0x3dFVIams3cEMwY2JEeUNnZWU2WDlTb3NRR3JlUXV1WHBxZjhvTXZM?=
 =?utf-8?B?dFFMdmg3OGg4T0IxbDNNbDFJZzZSMnlrTWVtRTlQbnlDc05Ma2VtVnRRZkE3?=
 =?utf-8?B?Zjd6MmxyeUgvR0ZvRmVyeE5KNDFoY0g4Mi9Id0xhZHJGT055N05jQmdKdmZl?=
 =?utf-8?B?VDBJdERnTEdXTmVBaGI4QlptWlE1Mllybkl0Mi9RNWJUWitwUm5BcjdGc0RJ?=
 =?utf-8?Q?krrGe6ylVYpQGtDluEKuIIPjmbf5uMyR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AMBPR04MB11741.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7416014)(10070799003); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TG92NFFvb3V1M1RaYlcvVXFtSEpSMVRocTlhNzhXaTlIa292bFdlNVpsYmFE?=
 =?utf-8?B?QnhiUkdHYllTZjN0R2NBZ1htWGZia2dhNFNVVkJzbXZsOExjWGRSSVUydkJD?=
 =?utf-8?B?WHNnVmhZaE44bWE2V2VuaW1qWVFZbHJsc0JFVTRjWitWcExiSmRCeXNhcTJw?=
 =?utf-8?B?dTRIc1cyeEdwMXN4aVNNblVteWo2K1A0QTdlK1gwekxRTS9tcnU0bUg2dkVJ?=
 =?utf-8?B?S0JXa2I1MTJwSDl3Z2pIVVl0QWtpQnNiQ1J1VnNQRC9BelRSVHBzK0NFeUNo?=
 =?utf-8?B?VmRWdFg4OVBZRXB5aFpiMTVtd0NJOXVDZ0gwWnJxRWx3WjMwUUFwV0hVTVdC?=
 =?utf-8?B?THlVeWZtR20yeG5IMGFCV1gvREtndkEyNmcvSS9sNEFYVGQydGwxVTlDVXpn?=
 =?utf-8?B?eTNaQ0Q0YjgrK1ZTV3luWlJWMzJnVnltdFlHYkw4dzZiWmV0Y3dOdkowaDd6?=
 =?utf-8?B?TU9CeitZY0J0TmYyWjZEeTlsM1dmWXIyTnJUanFxUVpYNU5NQytDaUt0WGI1?=
 =?utf-8?B?Q2FsTW1wbkoxMUZZbG5DN0s4clQwQVU2MzVlN3ZUSWpsd0hEbnNWdHVUZG9t?=
 =?utf-8?B?aEdXZERSQU42YW8rMndwb2hmUVN6SkQwNFJiTWR3ZWY5WXMrNUFYUDNrdXky?=
 =?utf-8?B?bmE2OUtwL3ljRmwwTjdPV2gyci9mTXZMVkVEWmhQM0gwem5PTGRqM0ZyTTdY?=
 =?utf-8?B?NXdQaEtYeHNmRzNkTHZqRnZ0VEdCRUlTQjhkQlJ6YnlYVU9VUmpTU1VwZEdi?=
 =?utf-8?B?L2FKd1I3VndjSVRVODdhenE2SDFpWitKazFsTmlBNitpNk40SzZ5WmZHZ1FY?=
 =?utf-8?B?ZlY5bVA4TVRJU1dNZlAvVXh2QXo3Zi9VMmNmTXVUMXdXTFNNcXdqa0l0TExY?=
 =?utf-8?B?cHFTQnR1bHp2UTlUakJiMVh1VFd1eXRuNlNEcTUyY2xNRCtONThpdldpcEpx?=
 =?utf-8?B?NG5YTTUzUVlpaGdvbVZDRzJEakVWUlZuZFlveFg4MUl5WFZTczVjamk4azc1?=
 =?utf-8?B?VjhXL3Rzd3JJNEZjSW0xakR4UG9laFVoem44bTRsLyszL0dCck1ubzZCRUtS?=
 =?utf-8?B?Yk9TczBSSHpoSW5SRG5QbmJBRDZscURnOU5JZHZJdUY2akVBT2JqMlp2b3hQ?=
 =?utf-8?B?OUZxdWovd1JWYWtCS1JCZndlenBqaDFSRGRuOUptNTJkYUVIWGx5SUwrRU9K?=
 =?utf-8?B?RE10d012SnNSeFhQUCswZlRlUUpOd2tpa0NGdkVRVmlZL3hSRlppV21jRVYv?=
 =?utf-8?B?OFRubVFtL1FKWDJZRnVqL25USVNYVU84dEkybkFmQ2ZpOUlReGFpUU5qYVUr?=
 =?utf-8?B?YkNnckdDUk83QWxlUkxuNXdBU1F1QXV5RnJ5akNPMmpHYlJVNytMOFZoejJX?=
 =?utf-8?B?NlFQMFM0c3hrL2IraDc1aGRHR3Rqa0V1WG0xOWZDSjJJY25wemFsTnU0RVpW?=
 =?utf-8?B?bmN5SXdhRDYzS0VJYXMxQzJTU1J0enRYUTBGRU9hczlWOWw2d1pmL01XdU1Y?=
 =?utf-8?B?ZTdHcTZZcGdmcE8rR2M1cTlmVW9xWkdPaHNuREdzYTV3UE5BU09vSjMxOXRW?=
 =?utf-8?B?TldDV1k0aW1rVklrNm81a0ZDd0lhMEtOcFpGV29Fd1haWHpneXFxdmJaME9t?=
 =?utf-8?B?WFFJTzdXV2oxRmx2YlZCdFQ5ZXZnRjVqaG5ZZ2lwczFQZWsvNzYyOE5Vc0Fw?=
 =?utf-8?B?M3k5SjJDb0xBSW9iRVBOdGgyM0tGTWZoVmFrZnJRNDZJZ25BeC9TaUt5RFo1?=
 =?utf-8?B?WXFxalhBWHJjRzFxSXBnRFk4N29JS1RNV1BGZ1dTYVdrQlhrTEZpQVNTZ0ta?=
 =?utf-8?B?MktOYXZnWGhaZHk3dDVzWnBwYlRrTzdPVXZlWTRTT2c5UURJaGd3SlVvWG5G?=
 =?utf-8?B?RFZoQ0RveGMzL0pqc3JYbnlPNTlXYUdMRjMzdlluSVZwelVJYnZwWVBPaU5q?=
 =?utf-8?B?NE90bVpEVEpjSEpkb0w5UkNIRDZReFJRbHI2MzVpbTQ4NVNwRGk2VWNIS0Vu?=
 =?utf-8?B?b1pmNXdCeFdvNk5NVEIwSERhdjM3OVBFb2pWN0M3SXRVTlcwVkRtTVJZaEdz?=
 =?utf-8?B?Zk5IUUNidlFrOTRHSER3RFBEYVN0NWpYQUd3TUxHWVBXRW9nY3BRd3NFMGY5?=
 =?utf-8?B?QWx6RERKbDhOOWdYM0Exd0Z1Nm4zNFExdlNVMTMreTZpMEJNbXhSY3ByZk9j?=
 =?utf-8?B?QndURzUxc3M4L3hmdm9PQkZqTmwvMVNjcUxrcnYvczlKZ2g4cEh4bXpMcjho?=
 =?utf-8?B?VGJlL1FzdFNqZ0FCOGNNSnYxWlZmcXRCNkg5Yk1ON0dYQmhEU3dGblBDSURp?=
 =?utf-8?B?a25FN2plSndtdENKbTVobnJackxxVGg4QjVJdWxPRmQya05OMUdWdVhMdng3?=
 =?utf-8?Q?HeqBBy06ULfKlomUHejyj3NXTrPIDn6myj7iztGfJziQx?=
X-MS-Exchange-AntiSpam-MessageData-1: 2UKOxadQYWQMYcTt4JzF62zXPwPfG6PjmMQ=
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 694bdcaf-0c66-4133-aaee-08de4f5cd84b
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB11741.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 08:55:32.0303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wz4cVAO0IbVSmKYSIKvnJFJLz5Gh1ICGKHHfGk3nZ+Isg1sE3UhvBOXyXbtcgezzBWYbNpgfMDIQg9UuJnd5hgrRVbcVV2UzcviFgmYmtm8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7218
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

Do you have any comments about:

> +static void max25014_remove(struct i2c_client *cl)
> +{
> +	struct max25014 *maxim = i2c_get_clientdata(cl);
> +
> +	maxim->bl->props.brightness = 0;
> +	max25014_update_status(maxim->bl);
> +	gpiod_set_value_cansleep(maxim->enable, 0);
> +	regulator_disable(maxim->vin);
> +}

I'm feeling like the setting of the brightness + update status maybe 
should be a call to backlight_device_set_brightness() or maybe it 
shouldn't really be there at all?

Kind regards,
Maud

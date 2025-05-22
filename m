Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A479AC0379
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 06:46:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4795894994;
	Thu, 22 May 2025 03:52:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="FE2AvsRx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2069.outbound.protection.outlook.com [40.107.21.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C21BC8D552;
 Thu, 22 May 2025 02:59:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l+2o9EjMpd3/lEbjFSffm/79OspB3wLd/nUuVutKvVMeel/UWZGz5Y3A7NWe5l89jOnsIcZ4bmI07FsT3H0C331uCpPhBXB70CuAdHmHT/SSHJFtF9hmeJzBKVWqAItFXQ+hv5RAIPgkHtXb8ZncqOhf6fjOEqOQZi51p1716Hd61G6PHqc4Sg+U5TX2/Uesu1py5VNEqiwXKOj+uJcAI9ZzH7JoY0wmJ3ih/mbLY2Yxv1n4+kK4eeLau6xMjCwr9a+wzDsPykaJl7nuxXbYitTi0/PG52C99Tbj8zlHy6rO9GHVO1oIpFgLskI5cCZewYQS2upZIn7wa41w4cUPEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lRhdB+p/PFB3mSvLMpBcs1TLFWsemknoxqCqF68Kod0=;
 b=r4p8KYzwSU129f4QHD6TJBwfnIcS4XBIlgd8bDcynC6RVVfTr6Idz/G76jjLadkSO5s+LV4Sk2gHFBFitEFHQs5l0v3WQKUMqBLuPI+AOFWyYCajGvhDfCn92rrpB+o827fiPdhHuFWeGsU/5v90nJCrLRiJHJxqbxHQMwJZA8T24u/UhyJXpJvpcaKEM/eDy1dj7m5pR/9BlTuwl3SlMX2hNtzmeJbvEYhx3Xf4UXXleosTPo/gfSxGTivocQP+Q+UUavSV0ifrWsiYg+cZJwBuP2h9G6gqQikpF3tS8VaJFL+qrN8fHAU/8ZkEF0Ah2XI2IJAcQKLxPFjCoLF5Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lRhdB+p/PFB3mSvLMpBcs1TLFWsemknoxqCqF68Kod0=;
 b=FE2AvsRx80CEhk5z4qtWdXzr2YVUOPJYW/B/eqPvtpuzR/cT9QeDjGcVFUHeBuDqgfmFi2+gOGbhp4YI5GANysClqfjRqUtFXqAkLMcHy0FmLnn1TXVTN1P2unsTHFrJ32TQxmTSFXfVbCyvcgsldfMz0/upPmyLzKZWb/FNWqs4SyRs3zKUYOYjDxKMidp1S3k+ryIszDcLCJVnImfHfQwIN55RbkQBCF4L/fihwCu2Fm9BfWtLSlCWHXdKCu47wmjm1ipB103W1xzTM+L0PEVU2zb4+ByprJo6TssjmE1wQfu5Q3Ha1W/wLI5p6PoG+JzKfVSwTr2iLIl3nc0guQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GVXPR04MB10899.eurprd04.prod.outlook.com (2603:10a6:150:225::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 02:59:45 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 02:59:45 +0000
Message-ID: <67252c36-8b31-4c40-9d89-4f502da4a087@nxp.com>
Date: Thu, 22 May 2025 11:01:13 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 30/34] drm/bridge: imx8qxp-pixel-combiner: convert to
 devm_drm_bridge_alloc() API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Douglas Anderson
 <dianders@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Anusha Srivatsa
 <asrivats@redhat.com>, Paul Kocialkowski <paulk@sys-base.io>,
 Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-30-8f91a404d86b@bootlin.com>
 <553d62ed-976a-4e17-9678-cdc3d40ce4a7@nxp.com>
 <20250430112944.1b39caab@booty>
 <f71d18d2-4271-4bb9-b54f-0e5a585778f3@nxp.com>
 <20250506224720.5cbcf3e1@booty>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250506224720.5cbcf3e1@booty>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0003.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GVXPR04MB10899:EE_
X-MS-Office365-Filtering-Correlation-Id: dc020111-7e3a-4b19-bcc6-08dd98dcb4a2
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVVrN0hRN3owNHZhNmRhS1BTUVZhVzR3VkRubG9wSHZxK1lFS3p2RUhNSEs2?=
 =?utf-8?B?TGFUaDBvdUxmQ3h4MWt2czZDOVhzeFMyam9ScnZxVGNUQkRFYWZDd3hJaTc1?=
 =?utf-8?B?bUlRT0xLdEpKVk9WOUtqcklyb1RqZ3dTWk1YZ2hTaVlrNUJjN09Ialc5ZUZp?=
 =?utf-8?B?N2FyTkZHYjB3VzE4d1JHR0VPTEh6TzdpM0J4NGJPNGRsVEZ3RklMdVJ3NnBW?=
 =?utf-8?B?OFIwaW5qbHlWQklPcnZXZGxra2NkUVpRWnQvbjBBV01ncTd5ZXdGOEdRTnFq?=
 =?utf-8?B?d3dpbWNmZEZhRHJFeU1mRlRxNUcyTTlrUXZGRVhxVjhYNHJyaDRSTm1TbzJS?=
 =?utf-8?B?V0RyQUgva2I1WW9OSytMNUQzdUxRWkRmYVdiWE5hZXp2bkJvWi95bjJtZkhx?=
 =?utf-8?B?N29hSGxxMGlZaGU4MzZjemo0a25PNUtWdmR4WjMwOTZBZlg0N3FMNHNHWEk4?=
 =?utf-8?B?MnhNRElzTHF3YjgvbjlhRExEZ2VQYy9SZVlzMnRTLzJPMDJlUFV6K3lmYkJo?=
 =?utf-8?B?YjhSTHgrYW1QUE1mQlk4L3JsMkMwa09DNzd4QksyL1IrME5rLzlLYkJPZXdh?=
 =?utf-8?B?NllYRVlpaUF6WmloSitzZ0l5YllrV2hma3gxZmdGcDgwQk5rQlFySzJPMmdh?=
 =?utf-8?B?MHVjTTY1a1RoSFpiVDdobTMwWG1qOGQyanFudVJERmo2TGFEeVlNVnNTc3Fl?=
 =?utf-8?B?ZjI1YzlwRVY2dVpjbjMwVmNaejZ5VWxMdGVYNVFUd0EvbmVrcVhHQkZ5VlNq?=
 =?utf-8?B?TEpnWGZiNmVmNWV5TjVJZkpDSklDc2JJWnNDL1ptSnpMeVIxVXdTWG9ld2Nw?=
 =?utf-8?B?dlhPemlCRTZ6T1hzbVlvZXNzcGZrakc3V2hzY0hTTWY5YiszMUEwMjlMMDE5?=
 =?utf-8?B?dE5BTlhYWWZ3V1JJa0hKUFBsU1ZaZDE1MlVOMEhqNnA2UEFuUzBCNWdSek1h?=
 =?utf-8?B?UFU2SlpDNkk5UzdRZWFMb0RyQ0tOWnE0OG9mR0V1YTkrWjEwbHRlQWNLdE8y?=
 =?utf-8?B?dnI3YUY1empJZkQrY2VjV21ISndjMlBzZmRXWkhoeVVzY3dTb2xUM2tHbXdx?=
 =?utf-8?B?UVJxNHY1VW1WK1VRVDlGd3QrZUgvNlR3MVMxUEkwNEc0bHY0REpQWUhBOTkw?=
 =?utf-8?B?dWRzcmdXRjZtK3kxOGcyclBQTkNGSU5IdW04OE9hSFA4cE5MbU9XY3ZwcEt2?=
 =?utf-8?B?SkV2MWVycU5MUGoxZEN4TTRhSVVTbVI1WjlSZXB1RUJOb2xMNlB0L21HbFlk?=
 =?utf-8?B?YWxWWjQ1TUFjQy9DMnlKTm12amNqM2VSYkFJOTFESXFKRy9uM1UzV2diOVAv?=
 =?utf-8?B?VmhLT0ZRVlF5VVFFcnM2b2MvQkxtNWxkRVlzeEhrNlBEbENLY0pISkJQN1lJ?=
 =?utf-8?B?ZTBSYmVnWlJtNnd5dWxqWGtSMURtaTZxWnBreDZpZ0xLZkhaNjhlRnRaWTBM?=
 =?utf-8?B?SHZBTDZKbFBxZXRmS01tRWJESExuRVBNU0ZHcUY3UnMwMG1qYVJxSXZPWXFP?=
 =?utf-8?B?dWwrRkV0eEpYVDBwdkd1dkxQMGZZVTVmZElNb1U3SjIyTkVnelRsVjNaVSt2?=
 =?utf-8?B?TU85enF2cWpDQmNLSEJiS3Q4UVYzenV0SUpIMmdPbGdDM0dRODdvYVAxVFZk?=
 =?utf-8?B?TGJLVFl6UnBXcU8wSHJOY08rM2wvVndKNEZqYUV4K0lNbThoaXFoZ3NXdVdJ?=
 =?utf-8?B?cHJETXVDemlzbzVaWTlvbW9Ld1VsS0NycXVFbnJQV1NudE1TQWVkS0FGVWpz?=
 =?utf-8?B?OVhxQmI5bFA5RTZERzlsQ2xTYmVRQWhWKzlQSHJpSk1nTFR1ZFo5N3lkWVhs?=
 =?utf-8?B?cFhmR2ZVazRJOVVHRWIyNjhENkdvWTNFSXBKcDFTOVlkMGUyd1A4Z0t5UDdB?=
 =?utf-8?B?eVBFbE1DcThrN28wRllTdU10ZG8wV21Kd2FFeVRWOWZReGttTHVYbDM1Z1I1?=
 =?utf-8?Q?eN7Mh6S5LVc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MU9UaVR5T2Fwd3czNzRidVlyYVg2MXF0eFJOTmZCMUtOZWVKa3NkcS9JRS9r?=
 =?utf-8?B?TTV0cFV3MFRDcmNudGFaWG1Ydll0WlhZVEl4TzJMSnBkN0J0SC9SME0yNGhQ?=
 =?utf-8?B?VDVLYjJoK1RieWxZVFNTN1lSaEpjRmdycW9WQXRoOVg0SkNna1VUTkR0aWNP?=
 =?utf-8?B?RnRrbTE2THRNcUZqTTFlQ3JKZDVLdmE0NVVPRlg3QXl0MTMzN1JaalFmRnlq?=
 =?utf-8?B?T3F4UWpDcDEza1dCOU53cU9HbVgvWjFUTGJtTGM2bXlQSXcyenJ0dEJmR2ZX?=
 =?utf-8?B?cUlQc3UrWVo2OVJ4VjVtY0ttSFRybHVUbzBaNlJrK0xzRGV5Smcva0VHRVRn?=
 =?utf-8?B?bW55elVLTVprZXpNTkY4K0hqaG50TmthMG90eGlDcktQd2d2bjVNTFFwc1Zk?=
 =?utf-8?B?U3ZBTFhHUzRvd0VXdGxrcFpodksySmxWbk40dmZXL1Q5L3BNQkF1OEUzdVlO?=
 =?utf-8?B?ZFBiVHp6cGlhSG5hTEJJQWhyNXg5bmV4bnRoWWI2cjBueDVndzV0bURDOWRo?=
 =?utf-8?B?RHBhU2xReDJrUUhMR1A1dGlJSFllQVhDMjM1OGlBY1BiZDRFeXVaRXJCeE5H?=
 =?utf-8?B?RTR6NXkwQkRCSXcxZERPMHEwUlFqOWMxdmlzZlRNY1ZKS0p4UkQ1cExLQnF6?=
 =?utf-8?B?ZWFOMkNWR1JZZU9LaVBhTHVHczBWR3RxSnBqR09vVmNFRnlRUzl3VXNLSVdo?=
 =?utf-8?B?cWpDM3FLKzBVbDVEcDdrU3g4M1drd2RwNSsvaFppM0NyK0VtdHpkazZYUkNw?=
 =?utf-8?B?NUdYVmhsbXRTYk4vaGRyZDJmeHlkMkNma3FMYlZQcCsvUWoxdkVHNWdlM2Fr?=
 =?utf-8?B?eVFiL204V2w2SDF0OE1hd3h4RzZ1TlJlWjR6TzNXWEoxVk5FNTR2WnNSVytJ?=
 =?utf-8?B?ZEJiWXZQWnVha0pYUU5oZUxIMk0zdUt6THpCVkNTUmJHeFZ0YzF4MjkvM3ZD?=
 =?utf-8?B?emFuMjFHNHdUREU0NWtUR01vak1XaVZIZTNSUUlSV0U4eVM2OGt4Z0FVV1Uv?=
 =?utf-8?B?QkhqMmFsMkJ0WHZQRlRsQ25oS25PdHYwRHFHbzJFbFV0MTViOTh1ekYvUmd1?=
 =?utf-8?B?a29waVJvOGt6VHZkZWRza1pLdVBXc05nSkNqQ2NUbGRxaXltRDN2UEJOWlNw?=
 =?utf-8?B?cGRZckxTSnVYNUhXbG9ZWDlnZFp5OTRId3I2NEZFMnEzeUdYQUNlU0V3SE9v?=
 =?utf-8?B?UU92SGRnM0laSERxRTVjS1I5Q21kREhLdERZajNJTEJVOUhqOUNVTEloRDA4?=
 =?utf-8?B?SkwyUWlpZmhOU2w3WWgxeWVhZlBzNGtSblhNaTF3Vy9pK3llME5DdmM1Y0F3?=
 =?utf-8?B?U2NLK1F2cUJNVzJ6OWpweTlsdkJNOHVRMVB1eVVGN1ByVWY0YmEvbjFzTVJp?=
 =?utf-8?B?alNXYUkwclhVdDBWOFFGaEljTXUyb3Fzelh6Sk9Ta3c5bmdJTkN4QjFvQStu?=
 =?utf-8?B?UUd3bFQ1aWFXYjMxY2dPVWdkRmFYdGNzV05NeFRjbHp4cnMzUkF0ajB4aCtq?=
 =?utf-8?B?enYzSzRXUUQ0UXJiWWJyNExjTktZdG53THZMalpiV1o1bStuTytoWVRXWVNM?=
 =?utf-8?B?V3lkdWdEcGYzc2dRYnQrNi9maERWWjFMR0c1L1VGODk1NW1DMGFCZ2dNVkVv?=
 =?utf-8?B?MWpwWXIxdHJTUEwxQndYNXZQNytpSS93T3p6cCtRL3F0M3FnbEtZY2VBWlRl?=
 =?utf-8?B?UFZhSW5yMk10VVNyRGlKdDN3RUtPT3RxWUxaSWttczRqRDVkZDlIRERGMWJY?=
 =?utf-8?B?V3gwVGpldjBJOFdoa0hrMmhJM2xnZXhVRjdLRWxPUVVXcEZPYU1IZ0V4RDRB?=
 =?utf-8?B?cjF0Z0NOYUNiYjFiRTk4U2dHS3VlVVFKNG5KMHlxTm8vRTRTVFZuOWE2Q1ZE?=
 =?utf-8?B?d0RiM1hTZWwrMlpyVGRLSFE1VXNEMEpiYlhmUUV5QXhuUFFlaXBULzlqLytX?=
 =?utf-8?B?amVYTTlTamdRTmFqRlZUSW8wdEhVM0syZlpwbFVvY0pxSjQ1OGpxampmYlo2?=
 =?utf-8?B?a2VaTERxdXhlamJHS1k2dlNvQm5ITlV2c0prcHFoUFVqNUk0L3dlM09sM2FT?=
 =?utf-8?B?alRuSlRHaGc1WXFINDRvUEVjMkRlenlhMnB2YjJ1WHlLOE9SUmJvdVRWamhw?=
 =?utf-8?Q?+Tu4RGMePQ/0U0pmBcAJpIIeb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc020111-7e3a-4b19-bcc6-08dd98dcb4a2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 02:59:45.1266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v0gHnvJ2YeyLuPQQQ8mcski1SO2z9xfCS02HFJP96rKtJrCx/3P+cSaeO5gPB65j0Dcdva//2HXAEu0BqnX4wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10899
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

On 05/07/2025, Luca Ceresoli wrote:

[...]

>> After looking into this patch and patch 31(though I've already provided my A-b)
>> more closely, I think the imx8qxp_pc and imx8{qm,qxp}_ldb main structures
>> should have the same life time with the embedded DRM bridges, because for
>> example the clk_apb clock in struct imx8qxp_pc would be accessed by the
>> imx8qxp_pc_bridge_mode_set DRM bridge callback.  But, IIUC, your patches extend
>> the life time for the embedded channel/bridge structures only, but not for the
>> main structures.  What do you think ?
> 
> I see you concern, but I'm sure the change I'm introducing is not
> creating the problem you are concerned about.
> 
> The key aspect is that my patch is merely changing the lifetime of the
> _allocation_ of the drm_bridge, not its usage. On drm_bridge_remove()
> the bridge is removed from its encoder chain and it is completely not
> reachable, both before and after my patch. With my patch it is not

drm_bridge_remove() only removes a bridge from the global bridge_list defined
in drm_bridge.c.  drm_bridge_detach() is the one which removes a bridge from
it's encoder chain.  It looks like you wrongly thought drm_bridge_remove()
is drm_bridge_detach().  So, even if drm_bridge_remove() is called, the removed
bridge could still be in it's encoder chain, hence an atomic commit could still
access the allocated bridge(with lifetime extended) and the clock_apb clock
for example in struct imx8qxp_pc could also be accessed.  That's why I think
the main structures should have the same lifetime with the allocated bridge.

> freed immediately, but it's just a piece of "wasted" memory that is
> still allocated until elsewhere in the kernel there are pointers to it,
> to avoid use-after-free.
> 
> With this explanation, do you think my patch is correct (after fixing
> the bug we already discussed of course)?
> 
> Best regards,
> Luca
> 

-- 
Regards,
Liu Ying

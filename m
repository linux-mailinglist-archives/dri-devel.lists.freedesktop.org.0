Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F029A9970
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 08:13:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F227E10E5E0;
	Tue, 22 Oct 2024 06:13:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="YN69C1kg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2040.outbound.protection.outlook.com [40.107.247.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 666EA10E5E0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 06:13:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n5N5J4Gz9zt3Rw3yUD8XDpXA2I3IiPqBbINWT153PKM9jIHRdFP8F8fM/qFecpBzoJxLUVc7McwT/G6xUNEBodbr0HB+TvMAFfhEIcFBZOEtlE/YOgVtoJMjKP0hH0NMvl1JNC0TsDwmk45wPxSdfzmTBoBZyXrWSjCfK0juij+i+jjgxn53p1WpvOQeYsxOzFicMrS5/xj926xGLruyrpWJxPKhwzqAG8ljkAQYDWcy+0xjTQRbg9OrRu+j9BjKY0L79p9aEtpfXcIfQzm1gmNDLoa+BzyRHkG3ObdBn9+wT6nJi9lkaaOEcW8b+4ztQ0NO30+tkyLIPL5HpAhI/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yMZ6J+KrDL383SQx5fQMDmQFkPqdP2fbmoiSbSk6jeU=;
 b=Wib1tkqSXklF8oJN37t9yN1YbHTWEcXAy4uvv5MODUalT9WPJeM5Pf7CcPsrcnQdOeJBCc9ENlk0JwlZ1ClQzLtqHF3bfyVlUtNwIjRLeDZiv0LyLTzUPNVpl6n5rDdLDOW/XrlEDIz5XKrsQGmfU/IFaQVDGSrKYEUQj3iqQeopdOksg/tAHWUbR9SE+t8J9E0yw3CDDcfT50WY0J1YEgIjnm3PObXCmxMFBukQ4Ocmdz2pSm4QSSMNVZQGudNCiBoEDXUQ/xfpfg+XOSHt5y32kD5aucD3Q0E2glBqhpB1HHna6nmBkNYAmVEXPf5L01wXkreDrrHJUvoy3C2kpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yMZ6J+KrDL383SQx5fQMDmQFkPqdP2fbmoiSbSk6jeU=;
 b=YN69C1kgYUELxeHv1HoABdap0xvXUPnCCZILO1LFuVePO6Uuk6KImPNxKVDPpJuxRx/O4rdcIDxfxOkFs984YR4NRM83hETIw3hLA8yyMQ2ta8iFkwm59amM4fpXfHrb7Yx+hVFZX8CNCRAE2ZeQb98YQHZJm5neupZVhWhz13m8270klAwqXYalGhZzFzszb6XsM+Hf25zOIyrea9oEAP1mHqMRpVvwJu5Cd5twiDUkUSn6cAGz0HUyk4M/C5a/1EZBDBVWb5l9WXF8P2g5DitrOXYI3SOTujRg1FAQjy5hVwIAwTcjih3xFH9mtzHlXr3wLVQJrKWzfrjUBDm67g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GVXPR04MB10491.eurprd04.prod.outlook.com (2603:10a6:150:1eb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 06:13:32 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 06:13:32 +0000
Message-ID: <d1307426-9a86-4356-93b8-9a10c8369ad8@nxp.com>
Date: Tue, 22 Oct 2024 14:13:57 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: imx: clk-imx8mp: Allow LDB serializer clock
 reconfigure parent rate
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Cc: Abel Vesa <abelvesa@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Isaac Scott <isaac.scott@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stephen Boyd <sboyd@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, kernel@dh-electronics.com,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20241008223846.337162-1-marex@denx.de>
 <dbede671-c97b-4ad7-8a54-f1b381fea082@nxp.com>
 <00ffd38c-b01a-40cd-9130-19c35a387ca0@denx.de>
 <819380c3-d13f-4989-b305-388fc60d30e4@nxp.com>
 <d99e0021-3253-4312-9b50-6031ae0f8d8e@denx.de>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <d99e0021-3253-4312-9b50-6031ae0f8d8e@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0166.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::22) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GVXPR04MB10491:EE_
X-MS-Office365-Filtering-Correlation-Id: 0db1b79d-da56-47f0-6b3e-08dcf260a76f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUxjc2hjaXhlMk5QV05ETFFhY2RTSTFPNEIwTlFOQTQ5cFBOamRnaFN5NXcz?=
 =?utf-8?B?Nk5CY01JTWI3eG5NUmtrQWF2VVZNL1BhYWZ3T1VXRVhuRnltVUovdGoraThu?=
 =?utf-8?B?U0YyRkhEcnFyOUZOSTN3ZXZxbWRrRFE4NG4vVnVyUmtpMjRDTEVtWkdZWUc4?=
 =?utf-8?B?YU5Eak84VlJuQVMzQkhkb3dmS05Ea1JKNjduakZzV21tbnhSK1VZK3lLNm5S?=
 =?utf-8?B?TUlwUFNTVTJQUDRBbEIzelBZVVRzRWFDZUhaMFNPbVdYSnNoSVpDdHB4ZnpJ?=
 =?utf-8?B?OEt0NXJDT3k1RkRlTDM0NU1pYUwrUHc1azRjVlhqSzhqdnZtamNyYXVsRjc4?=
 =?utf-8?B?RWxmRWdrYlpnZ3VIS3pQSHYzRm9KV013RHVscDdleXdoZ004bG43OHBrVkpt?=
 =?utf-8?B?dTNVVDdJSURPeU9WbnZVU0tsNy9kNnhuc3p0V1JoN1VtTzdVME5jeDdPcTdU?=
 =?utf-8?B?U0NZZzY2dTRxMUxjWEZVZkVCbXIxQ25PS2pHZmZGeDRDTnBlc3dvVGU2RnZD?=
 =?utf-8?B?VE9Na1RnZmV2TGwyeW5xRFVQUG1kQmRTWFg5cXZiNEZhMjJlTTBUOFo2S2Ji?=
 =?utf-8?B?VkRvWDZPRDVTVENPUEx4YUNzV1NHcjBnaGxidjZLNXN1d2RoWVJRU2JhaFl0?=
 =?utf-8?B?R3BGSHNDVlY1Ly9LeFFwVndxZFpwYU1PQzVSMTR2NWhqQTFWVjlsTEVRTkc5?=
 =?utf-8?B?alFLSTV5RmgzUnlSa3RuOVl5TUVuREJNZjFocm1KVG04YUdaU2hKbng4dVhy?=
 =?utf-8?B?bG1KTDQ5WThrMkU3R3FZUWwrNFVjbGpQSWpSZTUwVDhOMkhpRVI4aEVsbWd3?=
 =?utf-8?B?Y09FalFNelB3K0FsZTdTZWc1T0dlamxCcEVDZnFoWjRYWDZ2bUp3cExqQjRL?=
 =?utf-8?B?THB2Y0pRa0VjMWlObko5Rzc1WDFpT2NVVjdKaFE4eDNnc3N0U2tEamJHZTJN?=
 =?utf-8?B?R1FVNmN1S0g5SSt4aE45MEJMNWg3TURLMzJqQ20zN20wTEhEK3J5NmhySklo?=
 =?utf-8?B?YlRjenoyc1VqMmQzSlE3QitZa1Zyd0Z5MXVYVEJwVDlsMnhieTduaWVscVJV?=
 =?utf-8?B?ekF0WVd2Z3VlbG1NSEs4ZnpVWVV6RUpHU2w4alBKaFpqQkRhQVROQWZ5d0ht?=
 =?utf-8?B?djRleWxmWXJrdVoxeHBvUk9ONGxhaER0UVdBT0RtRW94K3BiMXpyaUEzWmRo?=
 =?utf-8?B?WmZPaXA1dWJlNmVBbnBlWkhzUGE0bEpuR3RPOE9FVU9GZkwvRzQ2R3R4U1RT?=
 =?utf-8?B?Mkd5ZWpYbHJMTXRkTlF1bTh0eUsyWlZzVkN1L205YjBXdEdxVkQraFFMQ1M1?=
 =?utf-8?B?ZmFVYzVVQmNvcVRnWkh5L0lkVnd4QkJvMUlmMnYrMVozL2x1ejlEcTE4Lzc0?=
 =?utf-8?B?UVRMSkI2azIxZTVLUk1FcTF3N05nSXNSbElRV1lSNzVVWndOcnJ4ZUpQTW1n?=
 =?utf-8?B?N3hCbVV4K3l1OEtrSHJORTg2SEVFQ0U2dzM0WERINzZEYkhtRVBsMjBhUERa?=
 =?utf-8?B?SzRiNmJUSmVxTm1TOTNudndBUmRUL3BDemRGamFvenAvRDRoRkVrL0tSZmtu?=
 =?utf-8?B?Si9lSUlLQXl0bkpoRG9qZ1pCa0VFMHdRanhkeFZrVUxKMEtZUENQL0lZTGgw?=
 =?utf-8?B?YWlNZ3dVd2pxbFUvOU1XUUtSRFh2Vk5HMzRpRE1YTk5kRlhXbG9Kc3g0TTVh?=
 =?utf-8?B?SldTWDBNSUFIV0wyNVRQcnlJVVdDTFJ2bENMb0ljTFlOKzJraXZqcVhvUnFj?=
 =?utf-8?Q?WLGCF0xlkE3kbidzQpC1GY/VMirzg/pONAAVteX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVBsaWFpSFNaTmUrL01iODFrYnJLMnBGRU1ka1dTbUw2TncweEVjN2F3NUJp?=
 =?utf-8?B?VlVBZTA0cUVoaVc2N3lnSWxnVVNwZmszbHBkbm0yMnVlQWJYa0FVektJVzh6?=
 =?utf-8?B?ajhzUlA0OWE1VlNuV3l1Qno3RUFhZExGQnpMNCtaUVFtYzh0cnZQam5vSmxP?=
 =?utf-8?B?VndUM3BSbXNaZEZQRWFRZ25GSFI1aWZFb2ZTZmhpTnZaWHhZVHFxQXJXeXZq?=
 =?utf-8?B?amNhcjJVcXdrSmtobU9VQk9URzdOamNiZzkvQ1VaUVlMYXpMMmFXd04wZjFL?=
 =?utf-8?B?U3NROFdvYUVYWk81STRCSXFXNTRydXM5MVVacGt1WUNNeFR3a1UrSEdEaDhu?=
 =?utf-8?B?LzFjd2dlZm8rWVMraVg0WUM0VnlOaGt6bXh5dnhCeUZQZ3gxb1U5U2twQ0tZ?=
 =?utf-8?B?bEg4OVNSd1EzeFR1T3RHT1dUWTc3bUw2dnNwdHNmZnZlQW14MVJ0aUp6TTI5?=
 =?utf-8?B?d3Q2Z1p6c0JxUW9VTGxjYWxTUFdRY1VhZ0UrcGJ0ekxMRUZyeHN0TWVkTzEx?=
 =?utf-8?B?UjVLUkZNOVlLazI3c29aaTF6dTRhMDZVQS9QVHZmQ3Y4VEt0NWtlOFBicGkw?=
 =?utf-8?B?YlN5SVpscjFvQjZIemxqVEhVNi9mS29FdTV1WUt5QlVkL2wxQ0Z0OXZNa1cr?=
 =?utf-8?B?TDkrUVozMkhMNWE2K3BuT2JCMWxnb3FqWlBDK3JyVDdjWUtKQnRFL0hJcEpo?=
 =?utf-8?B?SWtnSDRPaCtLRjJLdmZPcHIzYjEwcnZuZEJGdWw3VmI1ODFld2VDRmhkRS8z?=
 =?utf-8?B?dGdPem9PWTdqRFhOV3hSSXFoN1kzMS9YZEJZQ08raUY5Q0pIbHRRS3JDcENx?=
 =?utf-8?B?Rnp4eVdCOTdtenVjc082NWNBUUtnd3g2cHpqYk1MSTlVWFMxMkN1VHAvN1JK?=
 =?utf-8?B?VEFtNnF3RWJWMEdna3RWbnBES2VBZmhiUmsvUlNkdDJncmNjK2lieTR0TTJ4?=
 =?utf-8?B?emJSYkVCNGJkdncvMXdCMCszRkFrK2tWbWVKZ3d4cWdrMG03SDV0K0J5cldo?=
 =?utf-8?B?NVU0Z2k4dlJpSW1PNk1xb1lnRVQxQWlnc091cktLRld0ZHpkVTIzdnFIeHN4?=
 =?utf-8?B?d1liZ3g0S3ZVcUFNNWswSURsVVhab2t6SitpR3RTak9vOXBaSHJaYnNUZ0pk?=
 =?utf-8?B?MFYrb3MrcjRTSjJ5UUcxMWJsSzVWS3ZKYlJrQmRqUk5WK0I0UHFHSjAyRjBl?=
 =?utf-8?B?dldPV1JzNFdXckZmd3MxOG9JMHB5L2ppa3JDeWNRU2E2RTFFeEVpTDltaDRS?=
 =?utf-8?B?OVIvTkNzTHUvdHlaR3YwVFMvVFJCcGxtT0JUZzJJR3p3bnlJQjYvbWIvYlJF?=
 =?utf-8?B?VkdmaitXdEswSmtENmp0dVJ0SW1KRi9nN3lsZjZlNWM4WHpWWDNWeUNYdy9l?=
 =?utf-8?B?TUpoTHFmSzVNdnZhZEVZWm1adDhteUc3NnJocTU3cTJsY1l6d0lhUlpKRUJ1?=
 =?utf-8?B?d1dtaGlZWlIrVXRseDVMNWU1RGNDZXlXVTNQVU55QnloK3ZHYlZJdmRoQ2hy?=
 =?utf-8?B?a3NpamMxSkEwdzcwWGhZR2F3MFpqYU5kRStXTjhLK2VzaHhyN1N1THVTdHR3?=
 =?utf-8?B?Y1Noc25ZTy9uQW5uc1RuR3ZvOWF2RGZCMENUbHBlZUZ4TEYxQjZ1M0xkZFdM?=
 =?utf-8?B?dlpTelBGbFVUNGIyRmhEMmVzdFVDV0NSVmhzT0dQUTlzUHJ5L1dkd2g0S2s2?=
 =?utf-8?B?RytBcDlWdURLRSs0dmVIK3MxcjRURXRlV2NZOXR5d0hmamZudFpGMzB1WERw?=
 =?utf-8?B?b1hNYmM3Z1JvZU5JSlpvUjR5dHUvbUhhRzI2LzJUaG9zREY2RGs5YXhGZ1R1?=
 =?utf-8?B?TDZZbkQvcUNQYTBWQjlhYzBCQ3VtUGxqWTY2clh4Ylh1dWJqTFNFaVFxcDhh?=
 =?utf-8?B?Nk9aWnhvWWlVR2NsbjBlamtva2l4a1NCNXk3SW9VSHBMU2RSK3NGNWJ6a3ly?=
 =?utf-8?B?b1lHYzllZm0xem13T0RiY3RUeExYVHVjMzRlK0xxNS8yUTA4S1N4KzdCS2sy?=
 =?utf-8?B?T2R5cXJVc2d6RmRiTHdpeWIxVjVEc3VXNUhuYVZPMjhrSE15NkRhWktjRXNU?=
 =?utf-8?B?ZU84WTlKQ1dNSC9yS0hXVXFaVE02QXBMbU5DVG1PUC9DRS8vM2d5RC9zMmxm?=
 =?utf-8?Q?nQP7Fr8pWn1Z7pNICURlP3IEE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0db1b79d-da56-47f0-6b3e-08dcf260a76f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 06:13:32.1128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iow9MVFZpWZBRVI79DkVbpzimhK8oMzsNS+mdyH/HD0GTFb9XS/tZ88Hvr1PncqjPNGFLa5+rnycZXPdZVzX6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10491
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

On 10/13/2024, Marek Vasut wrote:
> On 10/11/24 8:18 AM, Liu Ying wrote:
>> On 10/11/2024, Marek Vasut wrote:
>>> On 10/10/24 7:22 AM, Liu Ying wrote:
>>>> On 10/09/2024, Marek Vasut wrote:
>>>>> The media_ldb_root_clk supply LDB serializer. These clock are usually
>>>>> shared with the LCDIFv3 pixel clock and supplied by the Video PLL on
>>>>> i.MX8MP, but the LDB clock run at either x7 or x14 rate of the LCDIFv3
>>>>> pixel clock. Allow the LDB to reconfigure Video PLL as needed, as that
>>>>> results in accurate serializer clock.
>>>>>
>>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>>> ---
>>>>> Cc: Abel Vesa <abelvesa@kernel.org>
>>>>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>>>>> Cc: David Airlie <airlied@gmail.com>
>>>>> Cc: Fabio Estevam <festevam@gmail.com>
>>>>> Cc: Isaac Scott <isaac.scott@ideasonboard.com>
>>>>> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
>>>>> Cc: Jonas Karlman <jonas@kwiboo.se>
>>>>> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
>>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>>> Cc: Maxime Ripard <mripard@kernel.org>
>>>>> Cc: Michael Turquette <mturquette@baylibre.com>
>>>>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>>>>> Cc: Peng Fan <peng.fan@nxp.com>
>>>>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>>>>> Cc: Robert Foss <rfoss@kernel.org>
>>>>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>>>>> Cc: Shawn Guo <shawnguo@kernel.org>
>>>>> Cc: Simona Vetter <simona@ffwll.ch>
>>>>> Cc: Stephen Boyd <sboyd@kernel.org>
>>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>>>> Cc: dri-devel@lists.freedesktop.org
>>>>> Cc: imx@lists.linux.dev
>>>>> Cc: kernel@dh-electronics.com
>>>>> Cc: linux-arm-kernel@lists.infradead.org
>>>>> Cc: linux-clk@vger.kernel.org
>>>>> ---
>>>>>    drivers/clk/imx/clk-imx8mp.c | 2 +-
>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
>>>>> index 516dbd170c8a3..2e61d340b8ab7 100644
>>>>> --- a/drivers/clk/imx/clk-imx8mp.c
>>>>> +++ b/drivers/clk/imx/clk-imx8mp.c
>>>>> @@ -611,7 +611,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
>>>>>        hws[IMX8MP_CLK_MEDIA_MIPI_PHY1_REF] = imx8m_clk_hw_composite("media_mipi_phy1_ref", imx8mp_media_mipi_phy1_ref_sels, ccm_base + 0xbd80);
>>>>>        hws[IMX8MP_CLK_MEDIA_DISP1_PIX] = imx8m_clk_hw_composite_bus_flags("media_disp1_pix", imx8mp_media_disp_pix_sels, ccm_base + 0xbe00, CLK_SET_RATE_PARENT);
>>>>>        hws[IMX8MP_CLK_MEDIA_CAM2_PIX] = imx8m_clk_hw_composite("media_cam2_pix", imx8mp_media_cam2_pix_sels, ccm_base + 0xbe80);
>>>>> -    hws[IMX8MP_CLK_MEDIA_LDB] = imx8m_clk_hw_composite("media_ldb", imx8mp_media_ldb_sels, ccm_base + 0xbf00);
>>>>> +    hws[IMX8MP_CLK_MEDIA_LDB] = imx8m_clk_hw_composite_bus_flags("media_ldb", imx8mp_media_ldb_sels, ccm_base + 0xbf00, CLK_SET_RATE_PARENT);
>>>>
>>>> This patch would cause the below in-flight LDB bridge driver
>>>> patch[1] fail to do display mode validation upon display modes
>>>> read from LVDS to HDMI converter IT6263's DDC I2C bus.
>>>
>>> Why ?
>>
>> Mode validation is affected only for dual LVDS link mode.
>> For single LVDS link mode, this patch does open more display
>> modes read from the DDC I2C bus.  The reason behind is that
>> LVDS serial clock rate/pixel clock rate = 3.5 for dual LVDS
>> link mode, while it's 7 for single LVDS link mode.
>>
>> In my system, "video_pll1" clock rate is assigned to 1.0395GHz
>> in imx8mp.dtsi.  For 1920x1080-60.00Hz with 148.5MHz pixel
>> clock rate, "media_ldb" clock rate is 519.75MHz and
>> "media_disp2_pix" clock rate is 148.5MHz, which is fine for
>> dual LVDS link mode(x3.5).  For newly opened up 1920x1080-59.94Hz
>> with 148.352MHz pixel clock rate, "video_pll1" clock rate will
>> be changed to 519.232MHz, "media_ldb" clock rate is 519.232MHz
>> and "media_disp2_pix" clock rate is wrongly set to 519.232MHz
>> too because "media_disp2_pix" clock cannot handle the 3.5
>> division ratio from "video_pll1_out" clock running at
>> 519.232MHz.  See the below clk_summary.
> 
> Shouldn't this patch help exactly with that ?

No, it doesn't help but only makes clk_round_rate() called in
LDB driver's .mode_valid() against 148.352MHz return 148.352MHz
which allows the unexpected 1920x1080-59.94Hz display mode.

> 
> It should allow you to set video_pll1_out to whatever is necessary by LDB first, fixate that frequency, and the LCDIFv3 would then be forced to use /7 divider from faster Video PLL1 , right ?

Yes, it allows that for single-link LVDS use cases.
And, __no__, for dual-link LVDS use cases because the
video_pll1_out clock rate needs to be 2x the LVDS serial clock
rate. 

> 
>>      video_pll1_ref_sel               1       1        0        24000000    0          0     50000      Y      deviceless                      no_connection_id
>>         video_pll1                    1       1        0        519232000   0          0     50000      Y         deviceless                      no_connection_id
>>            video_pll1_bypass          1       1        0        519232000   0          0     50000      Y            deviceless                      no_connection_id
>>               video_pll1_out          2       2        0        519232000   0          0     50000      Y               deviceless                      no_connection_id
>>                  media_ldb            1       1        0        519232000   0          0     50000      Y                  deviceless                      no_connection_id
>>                     media_ldb_root_clk 1       1        0        519232000   0          0     50000      Y                     32ec0000.blk-ctrl:bridge@5c     ldb
>>                                                                                                                               deviceless                      no_connection_id
>>                  media_disp1_pix      0       0        0        129808000   0          0     50000      N                  deviceless                      no_connection_id
>>                     media_disp1_pix_root_clk 0       0        0        129808000   0          0     50000      N                     32e80000.display-controller     pix
>>                                                                                                                               32ec0000.blk-ctrl               disp1
>>                                                                                                                               deviceless                      no_connection_id
>>                  media_disp2_pix      1       1        0        519232000   0          0     50000      Y                  deviceless                      no_connection_id
>>                     media_disp2_pix_root_clk 1       1        0        519232000   0          0     50000      Y                     32e90000.display-controller     pix
>>                                                                                                                               32ec0000.blk-ctrl               disp2
>>                                                                                                                               deviceless                      no_connection_id
>>
>> Single LVDS link mode is not affected because "media_disp2_pix"
>> clock can handle the 7 division ratio.
>>
>> To support the dual LVDS link mode, "video_pll1" clock rate needs
>> to be x2 "media_ldb" clock rate so that "media_disp2_pix" clock
>> can use 7 division ratio to achieve the /3.5 clock rate comparing
>> to "media_ldb" clock rate.  However, "video_pll1" is not seen by
>> LDB driver thus not directly controlled by it.  This is another
>> reason why assigning a reasonable "video_pll1" clock rate in DT
>> makes sense.
> 
> I agree that _right_now_, the DT clock assignment is the only option.
> I would like to see that DT part disappear and instead would prefer if the LDB/LCDIF could figure out the clock tree configuration themselves.

I think we'll live with the assigned clock rate in DT, because the
i.MX8MP LDB and Samsung MIPI DSI display pipelines need to share a
video PLL, like I mentioned in comments for patch 2.

> 
>>> Also, please Cc me on fsl-ldb.c patches.
>>
>> Ok, will do.  BTW, if MAINTAINERS is updated, then you'll always
>> receive fsl-ldb.c patches.
> 
> Thanks
> 
>>>> Unsupported display modes cannot be ruled out.  Note that
>>>> "media_ldb" is derived from "video_pll1_out" by default as the
>>>> parent is set in imx8mp.dtsi.  And, the only 4 rates supported
>>>> by "video_pll1" are listed in imx_pll1443x_tbl[] - 1.0395GHz,
>>>> 650MHz, 594MHz and 519.75MHz.
>>> I disagree with this part, since commit b09c68dc57c9 ("clk: imx: pll14xx: Support dynamic rates") the 1443x PLLs can be configured to arbitrary rates which for video PLL is desirable as those should produce accurate clock.
>>
>> Kinda ack - that commit does open up many more clock rates.
>> But, the commit just says dynamic rates, not arbitrary rates or
>> any rate.
> I am fine with that.

-- 
Regards,
Liu Ying


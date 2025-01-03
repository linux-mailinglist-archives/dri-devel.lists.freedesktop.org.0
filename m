Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAA8A00732
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2025 10:42:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32FEE10E850;
	Fri,  3 Jan 2025 09:42:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="kRHZ13jU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2051.outbound.protection.outlook.com [40.107.22.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B4B10E833
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2025 09:42:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ay4Su3Rp3o7lXuzezW0p55CfB39bBTtofBU/fksnoeUJGBbie5WSdwWJzgitfyCmgkYam5mTSs2XAJzIT85p7Cuo47GqJP7mopx9Ga6jcQlFUS+NWoyZ6MaWvwvxjfvYVwRuFPw88QIA1nrXtvWQrTi7qrzVcTsfmsfyAgQQJxBBdNrR9pFXPHVgDfb2+cBOzf8zNiOSUAfkVvZq7qrrYIf2OXuVCh8bKAcLu7xCXwPEfSs+6glz+LG453lRj8dOM/u6i081gLlGQYVSCLkBxzM8JioyfR2I5d3sGp9KKKWjHRlmckFGpPx7ZaJdtFB4TRuoKv3plNOgatQi/3fMqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ur9fVBsRlBZrQZPYJ4wG1TMCoiPBL7pTpm+rrjvX/uk=;
 b=xIFpnJw7dBlPniiqkkOXmwRlay8u3fwWWQvPgQ7qTQ7GFBNON+coqGseB1OTS1iTbCoHLFCWRPIwefzT9VbQTBtsZuxuFsFk5+Q8VxK5vVaWl0XBYSRfEqVB5mvHNinUMDPwoqEpkLjp/rrhWioHQwXiskvmFwP0w5S6PMPwRokvuJZ3J5/Stl6xF+9Pk+S3xC/AIlRNihJZmSMCR/A1M1dRZaDgTQu3HdUvE+Sck29y321XukJjcHdOnNRH7piFbcm8LoF963btbDaynbvMwrHJlMYP13fa1pLH6pPb86IkGtsqSvm9F5Ier2DCnrBZdh3X2K+hE6Shhg10P9WpsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ur9fVBsRlBZrQZPYJ4wG1TMCoiPBL7pTpm+rrjvX/uk=;
 b=kRHZ13jUKXRodsOJ/vUO/tTGUcUJQMGviPV8qQfPqeGX0NDGTe+06xzldR6KMPm4w/LOcYRsxkAq4hkAMSIKgxYStY+X/5Wip0qSiVWMZ/9ktrWHiKr4n43B8VoSTk71xo9vXor8hRMtk4Erzyn4BPEWAo6ATm5dcvVsFOmYY8y2KKP/DwIZjUjQbgYzrzReY5iI8Mu4jeIKt6YTk9uG/+HTyx/M8YNG0xe8bcc+WeOkszUv3uE451Gg/4HCm+/C9Y1xe46bNYrLgZzWaS7VIJH6IdxYjMiyik7Qc8ioJtDJ6CkbP4oZZv8zwMB3Mv/RIDWc/K7brQSaiL6VTfQWwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB7934.eurprd04.prod.outlook.com (2603:10a6:102:ca::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.14; Fri, 3 Jan
 2025 09:41:59 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8314.013; Fri, 3 Jan 2025
 09:41:59 +0000
Message-ID: <f8572239-1398-4737-af8d-d920f089bb49@nxp.com>
Date: Fri, 3 Jan 2025 17:42:47 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] drm/bridge: imx8mp-hdmi-tx: switch to bridge
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie
 <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 alexander.stein@ew.tq-group.com
References: <20241231192925.97614-1-marex@denx.de>
 <20241231192925.97614-2-marex@denx.de>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20241231192925.97614-2-marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:4:194::18) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB7934:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fbc768d-412c-4c3e-b8c5-08dd2bdadeb4
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NXBTOGl2empGbUFMamxGeFFsS2FFa3poaVRJMnhKdVZZYTJPUEdOZjZMUUxK?=
 =?utf-8?B?M0phbFgwUUpuSTNiMHBnRm1NWHQrTkpQeWs3V1BMcnpESE9adXo1dXRoSVBy?=
 =?utf-8?B?M2JMdm1Ra3k3azlPVkJtZzFVQnZBT0p5MTdGblFRUTFpMHZYaFBzRE0zUGZC?=
 =?utf-8?B?Sjc3Z2s4NnVBQ1ZyODI5WWFPelNBUVhMd21JQVZ5Uk94bFJkYU1vZEc3Tkov?=
 =?utf-8?B?R1lGV051VWFNd01USS82MEs3Q1VCTlllNmtPWTNaU3NxVUpnOWZjaUNPVHg4?=
 =?utf-8?B?M3F3a2EzMzVaRHFCZkZLYVVyejM2TFhJVVFFZXRmbDE0ajYreWNVMVVJY1FU?=
 =?utf-8?B?K1NxU0dqOWtydGpSazFKVlN2Q2ZKNHM2b1loZDBlbUpBc2NZMXl2bFFnTmhP?=
 =?utf-8?B?ekZFeE1mUnV2L0k0Y05QQXJZakZTWUpZdzJyQ3phWFhwNEVVeE5NRitsK2Ny?=
 =?utf-8?B?OW52cnZNbHlib0E2b3NKQzV4SWszcmNXR0w4Q3MzaTBVYktnZ2dEdjJhbm1P?=
 =?utf-8?B?alJGZnJNM3ljUjBiK0ZsT1UwTVJxU2FBN2RMaHg1V1YxVzVqTk11cmRwWU9Y?=
 =?utf-8?B?ZDdlMmFMMFptV1NVVkdzb1NFZ0FRR05UV05oWlpiZ0hEL3A2SFUyM2dPMTk1?=
 =?utf-8?B?Q1BtRStmUHlDNnJtemU3dUdSMys3aUZnQWxkeFRMRTdNWUlYakZ6NGc5VVA0?=
 =?utf-8?B?Y2dEQ2lGUUhuUVNpTUJZcWZYMk83YVRvUUxiQ01pTDJDeWNWWklMU2xQY3BD?=
 =?utf-8?B?RWlZdUs3cmtDbG84SDFCZlhESzM3ZUkxRWpvVWM1YVVYSjhtWHN3UWdRR09S?=
 =?utf-8?B?SkIzdVV4c0RHWWFDQllsZzNnUHN4NEhYdTh4RjVjZTFQb0NKTFZEQWJIRS9B?=
 =?utf-8?B?T083a1o2dnZFMi9GWDhLN01wSVo4TllPekdlbzFxb1lKL1l6cjFVcGE4V0Ry?=
 =?utf-8?B?M3RVbFljZUEvdWpXRk9uMGZtZTJUbzkzTmFGaVkwaDVhUG9nRUhtQkdadXd2?=
 =?utf-8?B?QWlQS3VCY2cvaVphZHlsZmMrYUIvcWlqcHU4VHl2OW5WcHl4YU1OaGJaSkhl?=
 =?utf-8?B?VmxwYW9LMnREQ01Pb1JIQjl4bS9YYkdLS0w2S3I5bFB6UWVYZG9iNGZDbXFF?=
 =?utf-8?B?ZmJQUXovVll6SmZJd0c2V2g2MEdaK01ncjc5TEIvam1wMWFXUVpyc1BvbVFh?=
 =?utf-8?B?QWlxWFN3bW56R1V1NnRWWjc0c1F0QTRxdWN0RmVQcnB4SUk0OVlYNXhwcjU3?=
 =?utf-8?B?d1JTVU1TSVo3MkFhcis0RXA1UkZrK1BjVFNHT3dSYitOT0xVMmJRM3ZaSkNr?=
 =?utf-8?B?QkU0QUlDZEQrVmxRUXArVTgrSkN1K2lHbElZVzJsQ0xDTzh0bFNZSHdTVmgr?=
 =?utf-8?B?UTBTbHZ1NzdoWHpxTndIT25pdEJFc0VFKzhYZXZPNnhlTDRDcjZ2UjJmU1Na?=
 =?utf-8?B?VDgrNDBqK1RxcTNsNXZvM1BxYkd2b0NxeTRUTG1tN3dkbERKNXY5Q1VTem5N?=
 =?utf-8?B?dERuNWRaNWs4VkJsSkZaUkRQYnBJUjBoeFZwMXpYNnVOZ2E1Qm5aTU03OFgy?=
 =?utf-8?B?NVgzYkl6M1FBWXJNYUZyR3o0aWZFZ2JpREpzSTlmZ201V1V5YW5Ka0pJRTNE?=
 =?utf-8?B?ZkNmTVlNNTR3Y25Ec0NadnZLU0NhNFhuTVN1WmtlbTNpMmRiVXBoU3A5bzJW?=
 =?utf-8?B?VllaY000T0M0RFhOT1IxYkhCd0EybjlqNlpjdVNNYTdiTlo5NHJsclYwL3Jw?=
 =?utf-8?B?Nk8rVVE3aTdMeEU4eUk2K2RiejdpdDdSbzFPbGRyUUJGaExnYllrQXZ4eVA2?=
 =?utf-8?B?WUoxaEFZczNoNEZCMEZFektRRUhYdnpiUWZJbVV4WlZnNG5TOUgzQS9UTi9C?=
 =?utf-8?Q?zimtU1JskuO15?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDVNSlNwdC9xN20raCtxY3lKanlJREZ6UmszaFMyL0xNNVRLc2lJbTllVGRr?=
 =?utf-8?B?dmY2TWtITEdUSi85RmdVUUhZQmV5Q0J5Tk5DM0pQamo4SEovcFNwZlBpMmRo?=
 =?utf-8?B?NHYzaW04UERRSkVxc3VidXV4RDB2Q1JoSGYyd1BlUXZWNWpxV3JRa0Ywakda?=
 =?utf-8?B?bHZLMmhkMGJWMGs3YkxhVUU5eGdqejY4QmZxUmhEaThBNTFjMDZ4YWRqUURj?=
 =?utf-8?B?WURTWEprN1hUNUw1ZVRVOVJ6Lzl6aCtnUDlEWDZyYThRUkFDYk13allqUlhs?=
 =?utf-8?B?T2dkc0dDdW9RNjQ1N05hM2piYjJSQ0MyNVVUbWo1M3Bib0hUMEZwak5iQ0Ja?=
 =?utf-8?B?ZFZ0UkxROFB0VVdNS09TY2tFaXAyTjhDc3FIV1Rla052TzAwOTAySHRBY3o4?=
 =?utf-8?B?aWJWL0M3dG9FQkRzNlVZdm1peEVidGtkdWZYVy9OK0J4NXk4akhmNEtabm9T?=
 =?utf-8?B?bGJOL2RzUk9Qc1Y1N21FWWl0NS90ZEF0cVY5a2IwTjVQYTZ0QWNYbCttb3lq?=
 =?utf-8?B?UmRqSmN1Vlg3Q0ZhVVdUcUtFQnRsTGxYaGFpYkhyOCs1Sm9QcUpONmNaazYw?=
 =?utf-8?B?SUxqU25malpSd2RFdUlUL280aFpWeGlCcHdLOXFpdnRRWjVXa2hMTHJTNE01?=
 =?utf-8?B?T3paK2wxbGNkbHJzcEIrcVcrRmtVdFNPNkFyNE9rN3VxNnozZ2RZOFg0bHNG?=
 =?utf-8?B?eGordnlLdVJ6NVdockNBMFk0Y2s2Mll6SEh0cVh2TVFGMTRZQVhQbUNMR01R?=
 =?utf-8?B?S2pvRWlRaU5kN09Wb2RiK0VIQVlmTGZvbHBZUVAyd0JxbWZnT1FGNGdzRk9P?=
 =?utf-8?B?ZmMza1hUVEFQY0tURjFSMlZzRXlZNExra0xtS3Y3Ri9yM29RT3FwOTFVQ1Rl?=
 =?utf-8?B?TXo0Z3NGVWYrY2FjR1BtS1lKUU5mdE5XRldGR203aG94ZmFDUDR2aTFiNU84?=
 =?utf-8?B?ekhoZDZOcVcxakJyU002VnNsanpJQzVsV1NMQ1dUcVA5S0JXS1ppVzQ2R1dj?=
 =?utf-8?B?NHRQNTVCeDIzcFdEUEdjYlRqWitWM2I3VlFJWXh3N1FPNXkxZ2RQN214UjFM?=
 =?utf-8?B?dEdvcTdCU25kZmY5Tlh6ZGx6eVRNWktOcnRXQTU2aEFwcHBHOE5Vdm82RVJ5?=
 =?utf-8?B?UzYwZW1iMElaL3o1M045MmJHcVNORmhQOVBFYUhxdEpYb3ZqT3g4OTljU1Ry?=
 =?utf-8?B?aUJsVzBXWEM1WnZ6WVd5bWRERHA2RURtY3hrYlhNL01Pdy83N1BjNkQyM1BV?=
 =?utf-8?B?cnMyMmwxN0RqNEpBL0REazZzU3RvMW9wZEFPL0tRWHJaWXF3Sno2ZDIwNVJJ?=
 =?utf-8?B?ZUozR1ZRUnhkZnpVWFhUbDkrUjNrYXZIY0cyQ0hBTzhKMDVWR0x2Zmg4RHdU?=
 =?utf-8?B?YThjY285TmU4a2ptMVpCaXdReHp2U2xSK3JaVXJqVmFMSGlZanEzY1BLSFVu?=
 =?utf-8?B?YTBjditNcFJrWHg1RFVOaHdzaWpVM0ZTck4yWmZpY1l1VWlhMlRCaWl1Z1o4?=
 =?utf-8?B?ZEo3WlRUdmxpaU1mRHhpN2NRSkhzdXVjazhSbDkyMXZQVlE5eFZyaC9kSTll?=
 =?utf-8?B?N3N3TFNxMjJ5eTlMQ1I5cDRPS3AxdzhYV3E0UmJkUGcvcWhjVFJRcFJwVTZa?=
 =?utf-8?B?NjVUVHZpYXZzTFAwYTdkNE4wS016ZDMyRGM5YzN3UjNxOFBlaDV4YWIrc0x4?=
 =?utf-8?B?TnNDVmRLUE4zMVlMNyswVS9STDQ0SWVXYWMxZTlHczhwUWRmcWY2eVNwa3ky?=
 =?utf-8?B?VlFwbWp6L2hMRDZXVkJlbytnZHV3RFpERzk2Z1N4SVE1Rnl0UTFPY1hPNmdQ?=
 =?utf-8?B?bnpOWWNRYXRabjFIcTdLSS81TFZQNDBXbXdBeFFBc0EzTXluM0tnRmRBN3li?=
 =?utf-8?B?WE5DZlhhUlZpbmkvZ3pZRElHTm1DM0gwTFkrRjRqRnp4QWhHQ1FZVUNqMkhY?=
 =?utf-8?B?cnZxc2RXZmtZUzZQR3pQR2xVK2lTTitvV2luM0lCVVd3N2tRUlRlUGYxNmdu?=
 =?utf-8?B?RUxjbi9ERTNuK1JKdzltVXozQmFMeE13UnZjWW5qbXBVV3ljcGxrN3c0clp2?=
 =?utf-8?B?VU5HL3Jjbk9zeUx1ZlJrcTJSVzErWWpJYlFqL2ZQWUZsR2VYMFlNTjF5RWJI?=
 =?utf-8?Q?UYrbsdaeXBXPm3/Am1bqCPTvS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fbc768d-412c-4c3e-b8c5-08dd2bdadeb4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 09:41:59.7225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ZMFYZ9xKC6/ScIS9MGMEBKtIp9mRDXFbGAx5ZHAEFHLrqG3VvCzCvboGDzKSoAJA8lkoGqXiLA0YZ4txJoIuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7934
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

On 01/01/2025, Marek Vasut wrote:
> The dw-hdmi output_port is set to 1 in order to look for a connector
> next bridge in order to get DRM_BRIDGE_ATTACH_NO_CONNECTOR working.
> The output_port set to 1 makes the DW HDMI driver core look up the
> next bridge in DT, where the next bridge is often the hdmi-connector .
> 
> Similar to 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR")
> 
> Note that looking at the upstream arch/arm64/boot/dts/freescale/imx8mp*dts ,
> the oldest commit which adds HDMI support is commit:
> 
> 3e67a1ddd56d ("arm64: dts: imx8mp: Enable HDMI on TQMa8MPxL/MBa8MPxL")
> 
> That already contains the HDMI connector node. Most follow up additions
> of HDMI support to another devices has been a variation of the same commit,
> including connector node, which is the proper way of eanbling HDMI on the
> i.MX8MP.
> 
> The rest should be covered by output_port_optional which should make systems
> with DTs without HDMI connector node work, but such DTs should be updated and
> the HDMI connector node should be added.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
> V2: No change
> V3: - Update commit message
>     - Move select DRM_DISPLAY_CONNECTOR to DRM_IMX8MP_DW_HDMI_BRIDGE
>     - Enable output_port_optional
> ---
>  drivers/gpu/drm/bridge/imx/Kconfig          | 1 +
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
> index 9a480c6abb856..db5c8a76193ac 100644
> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> @@ -17,6 +17,7 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
>  	tristate "Freescale i.MX8MP HDMI-TX bridge support"
>  	depends on OF
>  	depends on COMMON_CLK
> +	select DRM_DISPLAY_CONNECTOR
>  	select DRM_DW_HDMI
>  	imply DRM_IMX8MP_HDMI_PVI
>  	imply PHY_FSL_SAMSUNG_HDMI_PHY
> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> index 1e7a789ec2890..3d63200e468bf 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> @@ -101,6 +101,8 @@ static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
>  	plat_data->phy_name = "SAMSUNG HDMI TX PHY";
>  	plat_data->priv_data = hdmi;
>  	plat_data->phy_force_vendor = true;
> +	plat_data->output_port = 1;

I mentioned Dmitry's comments in my reply on v2:
https://lore.kernel.org/all/vvsj6ri2ke25nzocbq736yv7rphzma6pn3yk2uh7iu43zfe2sa@2fwye4k4w6he/

It looks like your patch set still fails to keep the behaviour of
dw_hdmi_connector_create() as part of those comments. Note that it won't be
called when the connector is created by the display controller drivers. CEC
is impacted at least in theory and Alexander tried to test it with my previous
patch set.

> +	plat_data->output_port_optional = true;
>  
>  	hdmi->dw_hdmi = dw_hdmi_probe(pdev, plat_data);
>  	if (IS_ERR(hdmi->dw_hdmi))

-- 
Regards,
Liu Ying

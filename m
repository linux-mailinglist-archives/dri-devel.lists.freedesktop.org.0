Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0C2A93E5F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 21:42:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F321010E248;
	Fri, 18 Apr 2025 19:42:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="g7++W+kq";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="KyFHIE6y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB84810E248
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 19:42:44 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53IJfr1A002494;
 Fri, 18 Apr 2025 19:42:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 corp-2023-11-20; bh=YCWzrmjBiF1chZwvYMASReKEW7NEfIDfC0/4L2ph3as=; b=
 g7++W+kqUcLNfaKYhKOL4uPlcQ+g4GVm7WinLQjTOXcix+if1NwPLHSIqdBfqn0+
 yjuGr8HllKqO6xvXq9n4KL8tYrIU9gEGtzouKK8unvK0xRQDUHVEnDsZfWjsvQ4a
 vqN41M8VkjKaQ7D7928GnUrc5JcltTfFquXwi8VVp7ajfz0Br9N3iXvaP46QJwp/
 GZEtDQhD5r8f1XG55m3rjr+s8gdXhZVzOwsuUiRSdyL2OMWBWu4Cp+R2O6R2s9bu
 D0ljqbGVz1CSbqykDlOGck3IxgSQ7EbnWKtNN16a8XWORniymw27XXc6BkV9fy67
 1aVtVZ4BYlDL5CLDkdVwSQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 461944gh6v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Apr 2025 19:42:26 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 53IHd79i009177; Fri, 18 Apr 2025 19:42:26 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com
 (mail-northcentralusazlp17012051.outbound.protection.outlook.com
 [40.93.20.51])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 460d3pytpn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Apr 2025 19:42:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VYZP5LWZtYsSKl+DV+7FSQuiHzbyNc2tI8JVrywhMEDmZ2so2++sf7YYc9DbtptTxV751Tt23+Wx91w8ppqif82SGR0AF7o/bQ1UISzoFw9LrI8Fkj3zBbNzq4/ZuwO4t0+JbR56x6XOUO0tqhUEndQqvj3Fo/PgHJKk/NXJEYpR7Kj4j+g8ll7+t/GIgJIg7KAZGoUUVSzjycAe+jbqeRHT7DNR2y0uC/e8YLj4v5fwWKel40xf1NqU4X4lnpJVpdb2yUbD9nUi18YyCcItZdW1hjXVkuX741rtbiCgP19/SV5ytfAf+DfkTgNO9BkYqfw+HYSPjVY49RV9CAsg3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YCWzrmjBiF1chZwvYMASReKEW7NEfIDfC0/4L2ph3as=;
 b=wB/z119F3tGLY+Jn2CdmsFmaGLGedo/e20VFLKbAmszaPv69agBFBYlOxPag8RS0/5cXCTuNs3u1614gG+QBV+Z2QijVf2UOpTtC6lDAKnkDE1CESlOtWgrqwfPKhjQa34taSCR/dHY+J+RUxCggOdNk1pQMU4/EHjAHDSmxDtM4DSYLAWN5ztZGRO11N57cT2s/adBA0mBFlDgwjGHEyPI10RHxbVCUgB3uGl+UlTovY/Bk0UVf2j07lquxywebaIXdCDbRCqNu9sRr3j4h7TFTD2/U1f3jqG61oXE+IvC6dnjRawkU/JefV5Tlb+ajfj+3PCKMmXBK9g2ld4WbaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YCWzrmjBiF1chZwvYMASReKEW7NEfIDfC0/4L2ph3as=;
 b=KyFHIE6ypVoH8gnOM6ZZZLuStzXULNd6PQUrNUe717wEdIxjZyqjIXBd1ZjIttHC6EMXaBa6ivPr7nawACGOAFuHwOvYMA2EAMDOYJm6EIAdJtS96QN8WJ02KYtXYT3fVUD3vdpj1d5ipZaFNoxcCACCPDhGKYVX7TaGkfYH1SY=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by CY8PR10MB7379.namprd10.prod.outlook.com (2603:10b6:930:96::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.31; Fri, 18 Apr
 2025 19:42:23 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%2]) with mapi id 15.20.8655.022; Fri, 18 Apr 2025
 19:42:23 +0000
Message-ID: <82fcce46-53c1-4bd5-af62-f1bfa4ca5d4d@oracle.com>
Date: Sat, 19 Apr 2025 01:12:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/15] clk: renesas: rzv2h-cpg: Add support for DSI
 clocks
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250418184658.456398-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250418184658.456398-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250418184658.456398-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0224.apcprd06.prod.outlook.com
 (2603:1096:4:68::32) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|CY8PR10MB7379:EE_
X-MS-Office365-Filtering-Correlation-Id: c043a782-c5b6-4c3d-12e6-08dd7eb123d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OGRrSXVMdzg5bENVMzNQMUxQVk9UVXRObGFMMGEwKzRNZVJvTCtKSlVnaTFs?=
 =?utf-8?B?dWFYbjlhMWdLN2QxNkt2ZVFmVFN6OGZONHJVazJlY1NvM0tEUDloOXp4WjBn?=
 =?utf-8?B?RzRPUGQwQUM0RGdtZncraExIT0dPS3lCOWtsOFZRZ3p5UmR0dnRUdldKV1Fl?=
 =?utf-8?B?SDNwOXRBNnNBdEdSK2VLTlBJNjQzZjU3QkpUd0lOcFJ2ZFpybnV6NW1mSTd6?=
 =?utf-8?B?UWRFeFhDTk1qTFc0V0ZLWVhGMVMvZEhUZ2Y1MU1jd25zaG55am5zKzdJTCt5?=
 =?utf-8?B?WjZPcXFGQkowY2p1U0ZaY1Z0Q0UxRVpTL0U3OGJOV2xqai8wZXdUWXV5NHh3?=
 =?utf-8?B?WDZyUE5leFBsTlVTbUQ4YkJkK2FrdkF0S1dDeVJXRUV5ZVhZSXplN2l1Z2RR?=
 =?utf-8?B?aHZ2MTI0SHFCL2dYZXNjVTZjdkJaVnhqMDlkRDVyV2JWa2JiR0JnN2NXbjdU?=
 =?utf-8?B?bkY5VDlRNmMyQk9sbHIydjBoWmFOamUrVnhmK1ZFNklMT3JKOTFJUU1oNm5o?=
 =?utf-8?B?N3R1ZjNyMGVSRll2cHVnYU1SWEg4Rmp6ODRsaHZvQWpQYXpWUzUvNkprRlEr?=
 =?utf-8?B?NHJEeEdQMUNlVGp1V2lWNVd2eTcyejhIOStQTHBEbElNRFMxM0RXMzRNcG9x?=
 =?utf-8?B?NnFVMDJ5YlgwVEZ2cHVncWoyNVpIUGdlVkZWc1lRbWpwdXhzYkt4ZWVrR3ZK?=
 =?utf-8?B?bzZUUUJ4MmhvL3djWktoSEtZN1FkbzZyZzFHS0ZxMEhJOXdoQW96WjlaUUVG?=
 =?utf-8?B?MWpMVEFZazZJbmVhYTRqbWkxRHorWEU3UnNHbGxYVTE0MFdCWnh6RC8yK1FO?=
 =?utf-8?B?VHVMbS9KR0ZzYzhwSmtNcUE1WFI2TmxuTG5VS0s0MFNTbWlqc2Z3dXQyVjdV?=
 =?utf-8?B?Qnl2V3h0UitEaHZVQjkzYkdtU2VVMStxbmNna1J3YTd3djIvWisrczY2UGdq?=
 =?utf-8?B?OHdrTU0rbm1qdk1HMWtJSUJJc3NhWENMRytLWDNORkw3UGViK2doQ3NBTGVm?=
 =?utf-8?B?aDlRcHlBUjBxVzh6eGZ4UVF4Q1B5QU94Mkx1WThvSU96ejFkQnpqWmlRR09S?=
 =?utf-8?B?ZUNYdEdaTnI4NG81NHlydDdMWmlvbmJ3QnRMN1kwUFJ1TUdIL0dkV1EyNmhz?=
 =?utf-8?B?K1g1N2h6ajZBWmh0VTI0YU93VjNCSTIwaldXZzdpVDVIeDdLOXY0dkw5MXJW?=
 =?utf-8?B?b1hPVk5IeXBuVis0VnhNOURGY1lHU0llYmY1ZStUcnBLaXA0ZTVJQ2I3RHM2?=
 =?utf-8?B?cEpXWG5nd1Q1eVlSM1AxbmxQbUJSemhhcE9xSDlCSUxDaTFtdTVVU3lWOGFE?=
 =?utf-8?B?WThQY0pESFZ0c29hVWVIcjl4bmQ1akk5elk0ZUF4K3JNYVFVQTIrNTU4bUFq?=
 =?utf-8?B?Sk1GMEpDcWNzektmUDBUa1ducTREMUxmVVJYUjFKTnlEQm5veFpMZXd6R3Rm?=
 =?utf-8?B?MUlkNzJEZWRqcHJyTkxjak11NENWQXdQbmdLeU9ja04zMll2Tmd2eUg5ZVhl?=
 =?utf-8?B?aXJvYXNQMjY3VnBrT1FPMkVkeEVSRmhjTklXZmN5UXQ1VVROd1NYUURXalN4?=
 =?utf-8?B?dHltZ2FabjdHZ0xxUklxQkQ0ak1IRmNqdDh4R2VXblczNXZ3YU8xK2FWOGtn?=
 =?utf-8?B?SUZic251N3lZRE5OS1VHWXlrNEhTamNtUGdZaENEVVhHeEc5MFlCQWJjNTY2?=
 =?utf-8?B?QXRnR201dFNRaGI5UGhvY0JvYUF3dFR0cVdSNnYvd2VzYzRGcnM5WTJaOHBX?=
 =?utf-8?B?a0U4WnJlU3I4NDZZaDIxQ0ZIWm1rRi9UU1h2MVgrdkhlSGROYUZWNnZxcWZV?=
 =?utf-8?B?VWxLMnVqVFptNnFvUm5nM055eTEzWkdoOXhjUDluVDN2MTRqVVFHWHpsUVJm?=
 =?utf-8?B?OEREcnBEcmgveWdJa1hxQXloRTlIWTdJRkJjY2NpUHdUYlhzZDVUOS9sVTdt?=
 =?utf-8?B?aVRybHNxRms1NDhwVVY5SS9BZSsrNWdjMmMyM2YwQmFvMmd1VVhUQjVZdll6?=
 =?utf-8?B?Tjc4RXBwNElBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR10MB5328.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c25udWhjSTY5Ri94L3JTUy9LUlI5Nk80anU3VnlJV3AyZFFjNEN3MFdQUmpm?=
 =?utf-8?B?MzJ3WWVRd2FiNU50MUYvZ2xPZTFYblVONE45T205UTNidWJqbkpXQ0czR2k4?=
 =?utf-8?B?N2ljSTIyNnNMYWpZd3VlSHQ5V0d5TmZDTjU0L0YyZmtIQlkrK2x3RnMrcGtU?=
 =?utf-8?B?L2RTR2JVT2JOUjk5aEEwSDd0UGxEUy9sVEZtU0dqaGtHbkpkc094RkcwZkdS?=
 =?utf-8?B?TmlsTWRuWlJXMllpMHR6SnRUY1J6bURNa3AyVE1KcEZZSmdTSTJMWlNod1Fy?=
 =?utf-8?B?UlA4aEZqVHozSHhONnRacW9kYXBFL1gvRlRpWEFtVElMeE5ESDc1Nlo0SDU1?=
 =?utf-8?B?aUlEZWJVdVVkeUFQOEJ5U0RUMjd5YzlGRm5tK0tHQ2Q2SlJGYklXWTYwalRx?=
 =?utf-8?B?U25ySFY3VVR6bFZyUHZ5WmhJd2s4Wmt5WDRqbC9CQ2ROMVR3a3VwY1VLQUZV?=
 =?utf-8?B?VXZPZGh1SkROb2s4WjFlYVV1bE85RFRsS2JnTDhuRlUvdHZwQzVLSXlodDY4?=
 =?utf-8?B?RjdsQWYrTHdkc2JsZ3NRTllMNXRObEJrb2R4OVROV0xFcll6QVY2NGtZUlB3?=
 =?utf-8?B?U3dlT0tQQXkweG8xUGpyeXc1M2dsTTlyOTdVZnpLUWZQUGVwcnNOQ005RDlp?=
 =?utf-8?B?ay9idXJackZCbnpIUWxza1dPVXR6dW45RDhjRzJRVi8yOVdMNjE4Rm5WVEVz?=
 =?utf-8?B?RjYyNW0xSzRXekJHUXc3OVNISjRuVmVWZkgwbEhKWDNOWmJmbEdUKzBQUGdq?=
 =?utf-8?B?eWVNeHYzU0RRR21TZHlpOUZGcEhKZGRJMkFJdEp1Q2pUczc2UTltTkplSmtp?=
 =?utf-8?B?SVNBT1B0dEtJNmxoUlRhZnBMVnhIN3BUbkpsN2tNNVdqR25YU0trMVRhQm1F?=
 =?utf-8?B?WXJ0SnNOV0VzcFZqblRudEJVODR1eFhrVXkxWWJ2ZjJzWUlHRE9RSmZxMzNC?=
 =?utf-8?B?Zyt1bFRTc0xvSHV4aGxEK1BQdzZZcTNndU9xNCtJSUpDTmFOZkhocUN3a1dB?=
 =?utf-8?B?S1BGR01yQ09wUnovN0cxZzV0UHJXdzN2ZFR1SERBRU9RK1JvcW1xaDUycVNO?=
 =?utf-8?B?QmEzeGxyNldockZ4U0IvV3BGbmJidzc3ejd5SHMyQStpTEl3ckNoVUJyNVlI?=
 =?utf-8?B?Y1cxYmhiandJYkNSUXJHajRoZnNRZUliMC90VlRzODBOaDg1aEdGZzUvMk5Z?=
 =?utf-8?B?UEhaNGg1OVcwTmtsa0szR2RzM09mNUF4MUxNRkJqTFVtUGhrZldNQURaT0Zp?=
 =?utf-8?B?RVp0ZDVSd3pCM0xwZUFQZkxYRTFvRFJ2UEJ3dkxpcGNXYjVydnBiWnZ2bzVq?=
 =?utf-8?B?NU5MU21yeU1CWHg4Q1BDNnQzR3JOT0ZpWDFuRjQwbWdSWXdCZVFINEJGU0Iy?=
 =?utf-8?B?RFdnRUo1S0NhNDZGeUlDdE1YSzdPV2NkZVcyTzcvUXpSNlgzVlZOcjV5VlYy?=
 =?utf-8?B?cTZ1TE1JWG5ndmFwYjJiRFY1SUdEM2xJTjdXaDFSNmN0OWkvOEZjdmZNeGdX?=
 =?utf-8?B?cDlIbm9HWEdiRTNXRTNBamlsNkhESmFTZlhjWHdZdENrUUF6NWduV3p5SVpa?=
 =?utf-8?B?K1ZMdHhpeVgzV2VVWUdBOVRQbUVQS2h2MDNtTVpGWVU4MEVZdGc2QklSVjds?=
 =?utf-8?B?Vk13YTFQTU9lM21sNDF4THl6MXRJcDg5aTFBWmVKeEg1Z2hLYnEwN1dOT0VH?=
 =?utf-8?B?Mlh2VkJjREZET0JFWS90SkhtMEQ4Tk12eFBMWTU0VitOR1VvQWRPc2pBQUR4?=
 =?utf-8?B?bXB0eE90b0RjMjFHOHBLdWttM0c4WEZKeWJKSy9GWU5aMmRYRmtmMWQwRUNN?=
 =?utf-8?B?YlBpYk5ZR3FVUll2blNsd3BPRUErRG9IeGxvNkloYzMrQjNNMitEb3RqNklY?=
 =?utf-8?B?WjhBaXRmNlgrUnRqUWVjc3gySTJLL1p4Uk44c3pCbUM5Z1FUS2JZOUc0SmVS?=
 =?utf-8?B?TzFrWVptYm80Y0g5SUdaUHNCWHhpc1o3R2RCL1ZlQVdiVDhRcVJTZUJuTytm?=
 =?utf-8?B?TXRjVUhnVzFacmVlVTBvY2pPTUxkR2FnRENsUlZ6NWVkWUFWbHVLUGFCVnUx?=
 =?utf-8?B?Z0xnNE1YdU9zY09zelRua3ptM2pyMVg5UmZnSGEwdlNPeElHSHNjT21peldT?=
 =?utf-8?B?N1IxSTN3MENkOE5SMDBjMk9iZFFLRlcwWUJycWhnWjJxMHlMRkdaT0dNeDI5?=
 =?utf-8?B?WGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: aDXUqaGQCowwwvE4Uf0oC1/mTrmrS7cTBbV6MCH9qfLX77Eb47OC1z16uFZPuuheE0LJvopFGfAWar0pga8TxaNDCECC0bvwu39cQ79k4BVmuIjdYcX3uPpnVTzhkgyV9bNNMbwvxnkrXbonPlSUzlUJIX9tCsTpcBQry4J7D4zIn6nSHqKdQQtCTLzcFyTRFQojuxsx/cX5a/Y1lsd1hcYGxZ8BndnFqtdnCKddORdMBZZ7+i1McAWcA1yVNWZCcv38Y6CXMwX5MVzd85QUVK7+JnrezcjgnfQkaTwDjqKvFOkUp1ZeR/7elNTxxbLDrmzGbBRtplvEfmi0haMedsbxQKbA1xiBuHZeNsAuzXWcUz854/5QLV3puKWQI0OpXRU+N0wIVTyTVEtQjZeHWD/znzqQUZ31PYq4lrt1XmhEoB/SFpTF1OKOmKKq8cOPwbyfMH+mKtQiPOGtnnoFyPGUXBKY0hwdAfwvSmxZBFEejELsbwt/cqxELIIzGD5mtTTpL23lZNIprmAS0RZlkV6otdr5/a90DtPefF+uQbKzvVSXGUQlOaNtIQkRWo8/iSQqppKq4GCw8OrFrgbVE9zM8uS/EuCEDKbRub82JtU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c043a782-c5b6-4c3d-12e6-08dd7eb123d3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 19:42:23.3043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YEY0I0dc+0YaME61SuQMVumDkf1j+e8HiGgth5yyIAtyTpSFxZB1MGGHvt0VLfvkDMR2aig0xhvOFJF+mIhzxdxs7MX2+TauLTU9+H83+t0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7379
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_07,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504180148
X-Proofpoint-GUID: zRbiw58NE0WMWlVfACI5YTX8lKLW28hJ
X-Proofpoint-ORIG-GUID: zRbiw58NE0WMWlVfACI5YTX8lKLW28hJ
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



On 19-04-2025 00:16, Prabhakar wrote:
> + * @freq: Target output frequency (in mHz)

Do you mind checking this one

> + *
> + * This function calculates the best set of PLL parameters (M, K, P, S) and divider
> + * value (CSDIV) to achieve the desired frequency.
> + * There is no direct formula to calculate the PLL parameters and the divider value,
> + * as it's an open system of equations, therefore this function uses an iterative
> + * approach to determine the best solution. The best solution

Thanks,
Alok

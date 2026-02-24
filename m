Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCDhBVzQnWn4SAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 17:22:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 677D4189C15
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 17:22:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C454910E133;
	Tue, 24 Feb 2026 16:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="D/mSNkk+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011027.outbound.protection.outlook.com [52.101.65.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E6B10E133
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 16:22:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O/1vce3e2NYNJaWzydvf56cegveVNgOGcH3zwedqoYUdW3tMGE3jHANvEgNuJnvlSB3hGcJJboWSFyTImeLqBYOjGnYnQj1jUOpKDlgxLAQ3zYT1F7YzGdyG1IWhf37YSZqMExYcJY81UunRoCbJBG4xBSsjSZ31uM/KwErdQa5ud5/76IFFYk3fBtuAFSTM84UtbGhqG4nhROCTMFUfGNR/jdlCvtdN/sn+/bv87shsBtM028kGYdim+i1jq1I06Naa/kE5wA1gdS73ADS/qyyEHmRn/6fGvOUL0nPbVtDOxv/q7crXEpHCxlYQuleSesaMQzyqyA0+wKUUDNY8hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lE9gRoeF7jSpVv6Dfr/mhOAJey0Z6gAkoW51CiibBKU=;
 b=BUlgxQF2xMmTpiFczMy/nBywMGhUD5Iwov4HQsSvP3JpQgVOo1MW7LTLjarlQbfWluwlcrBBAnkzbPzY6IOR9YsdZtkg6EJTJyE+Nes57jnxGsDvTp05m1JnXkAdQLIu5GI7g/BeSeNTPgyakx1AFZiGlsNuwEgCMLlN610RtlREoN0542XbJiLkSi4z5E5U7wNPsyv/mz3Z1nw4gBjrmFfRy5blKEN1/hq1CSGpIvaoCfMk6lCeHjkDLC9WOyM5487uJdvjfk0uUmw2hx19a4MXi4BRGs0THUhTk4+jg1TD7rtkx2ky7sXSDRik+AyP0W554dHN3ryPWzSR87Psgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lE9gRoeF7jSpVv6Dfr/mhOAJey0Z6gAkoW51CiibBKU=;
 b=D/mSNkk+elxiHr1cyFI4dUmJQr8Qgco3M/NS4qO24kCS/9v4qmAJhLsjKda+iefHSOAIpz1cSuIMG3tZNyP4Ffil+fa+HUCMsOLgo3u5b1ccB5xJwAAXfqqrz9kI8lQeiNpJDZ5ZIjE+nexAgz1++RUupPPlcPPf5vXeK4RFtkRQ4patmOLq8niHdcEZwUNIaTZ/SpZ7+LMXJtyY+x+g1VASx+WjxpMCoJh3h3+16TiXl+wwC9MuYEODMTK6uOrqzNbuomogVjJb4ZjhUOjkBn2tabKkUqFaFcpw9vlWEPtS/v8sXteMNcjfWSTnVN3+mUOCQKEkp6D1lFhqrC55YA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by GVXPR04MB12105.eurprd04.prod.outlook.com (2603:10a6:150:335::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 16:22:42 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 16:22:41 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, luca.ceresoli@bootlin.com,
 Marco Felsch <m.felsch@pengutronix.de>
Cc: Frank Li <Frank.Li@nxp.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: (subset) [PATCH v9 0/3] Add i.MX91/93 parallel display support
Date: Tue, 24 Feb 2026 11:22:14 -0500
Message-ID: <177194938893.2825317.7723579862581869219.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260115-v6-18-topic-imx93-parallel-display-v9-0-2c5051e4b144@pengutronix.de>
References: <20260115-v6-18-topic-imx93-parallel-display-v9-0-2c5051e4b144@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR10CA0006.namprd10.prod.outlook.com
 (2603:10b6:a03:255::11) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|GVXPR04MB12105:EE_
X-MS-Office365-Filtering-Correlation-Id: 846d2579-afe4-4aa9-e38d-08de73c0eec4
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|376014|366016|19092799006|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVh4SkZ4WVZuQWcxQVNnUlcrZHUxQThzRWN0NElWYS9zeS8vZVRwUWIrYUhR?=
 =?utf-8?B?ZXVUQXBnQktnbklIZlJYYkl3QjVwb2JSaHlXN2xmY3pYd0tjK3BKaFUvMGtk?=
 =?utf-8?B?eFE4NThDTDRidmtmSUlPUGpJN3Q5LzdTd3FFa0JycDRXMXVJUk5Qekc1TVhM?=
 =?utf-8?B?ME9XYzRxVkJIdjZvYXhwOXJja1BWR3FVZkJndHlsV2xCTktacWFVYmM5VzMy?=
 =?utf-8?B?WFVLOXVDQ3ZNcDYwNEcyUkp4SzcxN1Jxdm85MGRuR1NMbUtsZkcvM04yQ3Nv?=
 =?utf-8?B?bHpsdUtMcm00NHdXKytFZ2Z4MExRMDVwOHhxWHhHWDd1U0EybW9wM09WTGx4?=
 =?utf-8?B?WGR2UDVhUmFtRU1SVG9KcmZBNUk3MGR1OHhYWjVJV1RqY01CWFdONmJBdW9O?=
 =?utf-8?B?cmd3bGhlK1gvUDRNMXk0d1U1emJxUWVma1VBU01zUWZZMHNOdlRVOU5GWDI1?=
 =?utf-8?B?MHpGMlM4TG83eURMWit2NThmVmpHZysxS1gwd2pCaEVwUlFORXBYNDVtbXR3?=
 =?utf-8?B?TlBDNmtaNGRzVnU1YUxmQkZ2ZXJQTTZ6SEdUa1JobkNGUTdBVGgzWE5maEc3?=
 =?utf-8?B?aWlRZ0dVMUVTN3RETjJySFl0ZWluRStDdE1MRkFpSDMrc25ZcDhyT0ptclJC?=
 =?utf-8?B?T2xESjdDVy80WHF6a05QVmE1Z0pPNHhqQjBsc1Q2MGxXdVRqbHRuSSsrbk83?=
 =?utf-8?B?T1oyM2psWGJXdU9zUkJ2K0dWWU44cG53ZG4vd2VUejY4amJ2STB4TlBNVlVS?=
 =?utf-8?B?dm5nb2cyd3BrTFZNZzllZEtUazhlTVpRSkl5QTZ2dC9FQkh0emNWWXZsTmNU?=
 =?utf-8?B?clhhNGtrZzNZSFFtSjNjUlVWS1JyQTFJb3IyT1J1aURBZlo2Tm03YTJuYUJw?=
 =?utf-8?B?WEs1U2ErVkJMSERnSHVxZzBKM0R6ZEdWZkNwbnVLeTRON2Z0SWpKTTF1WjZL?=
 =?utf-8?B?QklWdE5tODllOUFjbURMS25QWnlrbEVCbUQvOXd5L1VqVSt1T1MydXFYeUgr?=
 =?utf-8?B?TUxKS1pCRFk5UXdieEltT0NrQmoxMjdiSUV1bGc1aVU0TDRvQ3lxZGtaYytv?=
 =?utf-8?B?TUdQMlJSd1NtOEFEVVd6VStZTEFuY0ZUa01yL1dMelgwVkwvUGhoOE9OWGpu?=
 =?utf-8?B?VmlWUHU1bnluSCtodkllaUVoS3NScXZvL2p1NWR3Y28xRkVaY29velVXK0Zh?=
 =?utf-8?B?VmlQUVVsblpDTkdHb2Eyd2xYaW5xc2JMZW5KT0dSVzZVVm1GdzZYM1k3T2tC?=
 =?utf-8?B?alEvRmVFYXNzekRyVFluVVNPd0F5UDF6VkRVZWc0SkZSUkJ3TUZ1WWd5eVFa?=
 =?utf-8?B?eGhqWGRTK2JRZ0NYdEhOSzk4VUNqOHM2eUM5dFp0RndiS082ZkxCSjdzWTFm?=
 =?utf-8?B?NTJxbmRzYlBjZWhaRlNLMlkwVHJTZVZUSGdDbEdBa1ROY1h2NUhEMXh2Wkor?=
 =?utf-8?B?NUxCVGM3ZkxOYkh0bWJodGtzdEhEUEVFZ1B1bGl4Z2RxS0haWmNKYXRHMDdh?=
 =?utf-8?B?Smk2WXVORHNJSTB6SDZlY0tJVVdwK0o1M1Nid0dZYytXTjZCMHJkeWpjQTRr?=
 =?utf-8?B?VGl1WjN3aWhYL0kyM2RiRFhxSnhseWFsalRyeFg2V211UGxFNENYU0pPVTZv?=
 =?utf-8?B?Sk1DQ1ZOL3JyZCtyNk5lVTlNWHkzZ3o3allHWVJTY0pWTEx2eGxyQjFuK1VC?=
 =?utf-8?B?dkM4YVNLRURKUm0zMm8wZ09jOTlxKzcxSHhPU3ljUTJJNGdZTDQ1TmVkOXdC?=
 =?utf-8?B?QlFHQUhXZU54OHkwWjhmUG4rMlBES2s4eHd1NU81eC9rcjhFS0J4Z1Fva2c0?=
 =?utf-8?B?Q1N6NlR4WUNLdE84WCtKYW02MGIwZU52ekpHdXBnSWNKUzhrdDJ5TUhmR0lu?=
 =?utf-8?B?bzQ3a2RTS0c5VGl5RzdEcVE3WnlBa2dpajcyR3VMcnd1QWRCWms3UFJTUEtl?=
 =?utf-8?B?VHBxK1gwRTYwcEY5UWwwcHE4OGE2T2JMcC8wNzg4amoyNEpEcmx5SFpNNE51?=
 =?utf-8?B?VkI4OTRWeUxJdEdWeTJRRTkyMnM3MDZqajJXanBJM0RUeUtWTWY5ejNnVXp1?=
 =?utf-8?B?Q05UdTh6bytMNVp3QXUwZ3Z5ZXpvbXRvR0puTHh0MXFjUzM4YWxvWnltUEQx?=
 =?utf-8?B?NWNTUjdvb2JQVG10eUV6aTZOV0xuV0E3R3VsSGo5cUNzZ2VaR1djaFdXQVl5?=
 =?utf-8?Q?mJUu80QMrQNq/PrSEzThERn9ekI4Y81GhDNyIMHO39xK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR04MB9372.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(376014)(366016)(19092799006)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlRBakxNQVJ6SVkxdEU1WXI4empzNGFtOGQ4YU9wS20wOForUzVtRVV1R2hn?=
 =?utf-8?B?VVZVeUVzaGo4dXJHUml4S1BXVVg3R21xZmdCa1F3cTNwT1JVMHJSNlU2dXF6?=
 =?utf-8?B?L2VsRUI0dnlBUFNtQ3BTVkpWN2RTd3BEWTBING9FVHlwT3c3QkZPZldvS05t?=
 =?utf-8?B?cFQ4VjdCOTJGUEtpTkovNTNhajl6S1NjTGFSWWNzMGhwK2wxMWd4bFhiOXNZ?=
 =?utf-8?B?WE50cWRWYjRXNkswSDBYbitUNGcrTkdia0RKL1hqZW5rRnNETk1SQnQ4dFdE?=
 =?utf-8?B?V1RlVzhSU25qSU9kRk9oTi9XRWllMUxYN21SamRMTlVoYnd0ZTVkV21mZFpW?=
 =?utf-8?B?YlZIR1Y1Skg0OWxFZkJuU2M4eHc1MmsrN1ZwSlpQdDhXQzBNNGZjTGwzZEtz?=
 =?utf-8?B?RlpMK0FLSWRMbnNBcjJKK1lLZzRkalkrMkN6b2hVMUIxSnFQUTRYQmd6ZFc3?=
 =?utf-8?B?bk5TY2pqNWd3akJ0c2tTNTFOSVgxM2dBQkNjZjhrQTBJNTI2dkpEeC9BY2xJ?=
 =?utf-8?B?a2F3Z2Zhd1c4R3FodUNXTjVxeVBzSFFUekt4SGxCWkFDTWZadWNybWp5WXJs?=
 =?utf-8?B?bzZhZXVZdFFya0lURjg2Q1hZRTV1Rkp6SG1jYTBPdXZSOHdBN0tTY1p5MndV?=
 =?utf-8?B?R2NpWmtPZytmQXpPK09MMTNENjhSWFBSUnVXSGc2L01MYnFXMytNOVpwSERx?=
 =?utf-8?B?ZGd0NkcwV3c1SHk0UEFDT01iYVkyc0RybEFRZFU0aFJCYWJIeXRRUjBQUDRm?=
 =?utf-8?B?VnVvY2lHQXdqUXZZTkFGUWV5cGdad3VSOHdqSXBpdE44eWw0TXRkeU1sVjZt?=
 =?utf-8?B?MkZyUzlhL24xRTNVL2x1UklIVCt0MlA4VFRITTlkL2JXSjdPb1B3TjdWRmZ5?=
 =?utf-8?B?VHNFZkhuKy9UdlgvZm9sZ3VmSDVJamkyVVpXeGhnaHBYYXdYUXBkVGZ6bW5k?=
 =?utf-8?B?SS9PcUVFYlAzQmRSZjZlM3pHbEE2eDRBaXUrVVJoQUp3dktmUkUyTWZWcHFS?=
 =?utf-8?B?ajdneEVDSm95TFFqRXo0RmZhVFZ4Z1lsS3l4Z0xDdjJoN0lMN3Y2YXN2RXdI?=
 =?utf-8?B?WmZ0L2lMbnpnalR2OENmYzlwREQrdXNkUWVDUFRtRFBhQXhiKzhWRHg2RDlU?=
 =?utf-8?B?K3pqeWh1NnVLcWxhNW95d0REd2lraXhtc0JUNFVzQnZBQ2hvcFJUYnRybFc5?=
 =?utf-8?B?NzlKL1RnN0tsZWZMQUZxcGpWWHR2aEN0UkI2SlFsN1k3Rnl1eHBYeFpwYUtp?=
 =?utf-8?B?Vzd5NkxYQ1dzR1NVUENKVXhXdTQySjBNb1ByQkhRdEhDanpmdHFrOVMwejBI?=
 =?utf-8?B?K1FxWTVQRDRSNUViczRwRnR1VHBDZFlvK3MyOEVhcndscVAzM0Q3SHo2V3E0?=
 =?utf-8?B?NlhHWXJtSHc2TU9pVHI5NkdrWkpLSkx2QnB6QW1UdjZOaVp5eGlQUHZMRnZa?=
 =?utf-8?B?YzJRRGZiVi9wRlZOcHlvVEh4Q05DRXNzNEEzQ0JFK05MZlF3Wk56dmxxZi91?=
 =?utf-8?B?aG5JR0Z4a0tUYnJEWnNTc2ZOREQ1cWl3TkthaS9kbk1teFNnZVJJbXRCQWp1?=
 =?utf-8?B?U0o2YlV0QWgyS2o1L1NUZXFPZS9nc09CT08wT0kybFVXUnduS3Y0cE1LdzBV?=
 =?utf-8?B?UU50eDdwQS8zQmJZLytMTFo3WW1ZUmhTYVJPV2FTQmNuNllhcVNjNmwzajcy?=
 =?utf-8?B?eFlMc0J5QjVwMzBxL3Btei9GeWZXLzhkeTNNekQ3WkdFTFpWUG5haUhOa2hr?=
 =?utf-8?B?QXViRmpTaGNlTDRLY1ZZeGNGZFQwREVUSE4rQlBWUEdZVzhjWDBwMkNEWk9U?=
 =?utf-8?B?ZkQ2VEN4NS9ZbTdNckU1c2FzYVlIS1UzaVhYQW53d3hqRzlubWthMDBsa0dI?=
 =?utf-8?B?cXFNM3EwYW9YZmsxUnNZa2VremlDMEtmWExiR1BnMmR3K3pzamxkWkVpUHow?=
 =?utf-8?B?a2huaDNmdDBoTHlqdHdPY0J1VTFhVXBEV2doVkg1aURWb2I1V2VWVk8zaWNk?=
 =?utf-8?B?Ny9QR1lSU1RzbGNIL2U5S0trNGN2a1ZVRWZlSjFpd1p2Vkk2THpUSzFoMEhV?=
 =?utf-8?B?SExPQyswNW5ta1NFTnprclBMbWpaUVduRHZnU0pJSVZGMnhaY3RsdmdpcEx6?=
 =?utf-8?B?bFdHQ001ai9wUTQ5ZFl0YUh6K3NxWVkxeHBQVGdtZ0hTbStOQlI1aVltc0gy?=
 =?utf-8?B?QUVjZFY5OGJSRDZzOGpYVlFTb3RGOU00aFdVVHBhTXlMbDJ2MjlwOFlIYjNC?=
 =?utf-8?B?VzNTWld4Q0hrYm5wKzlHK1JZUWxaYlRxbURNMlZOaGdqNy9wZ0c4T2U2WXhB?=
 =?utf-8?Q?yL7FeJhrhvxjqOSGXG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 846d2579-afe4-4aa9-e38d-08de73c0eec4
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 16:22:41.7994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t0PFnsJnF96+ZIUvfD0ZoIanSyOTIJZEIA2nl+OukiJEX+lUwO6tIkGlf5nXiUoxAbU7jlcJA0MRYEaMafztZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12105
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:peng.fan@nxp.com,m:victor.liu@nxp.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:luca.ceresoli@bootlin.com,m:m.felsch@pengutronix.de,m:Frank.Li@nxp.com,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,nxp.com,intel.com,linaro.org,ideasonboard.com,kwiboo.se,linux.intel.com,suse.de,ffwll.ch,bootlin.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER(0.00)[Frank.Li@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nxp.com:mid,nxp.com:dkim,nxp.com:email]
X-Rspamd-Queue-Id: 677D4189C15
X-Rspamd-Action: no action


On Thu, 15 Jan 2026 16:24:50 +0100, Marco Felsch wrote:
> this patchset adds the driver, dt-bindings and dt integration required
> to drive a parallel display on the i.MX93.
> 
> Since the i.MX91 register layout equals the one from the i.MX93, I added
> the support for both but tested only the i.MX93 case.
> 
> This patchset depends on:
>  - https://lore.kernel.org/all/20251201-v6-18-topic-imx93-blkctrl-v1-0-b57a72e60105@pengutronix.de/
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC subnode to schema and example
      commit: 43709eb5b0d4feea230568707c6be027babbe047

Best regards,
--
Frank Li <Frank.Li@nxp.com>

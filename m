Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CP7WHYnximmwOwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 09:51:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D73F1118671
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 09:51:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 847FE10E4EF;
	Tue, 10 Feb 2026 08:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="WEwxIlHv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11021087.outbound.protection.outlook.com [52.101.70.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D9210E4EF
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 08:51:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E1P1zaHKZcQ+jc28wU2NhfliY6kciVrc7lBwSnAgoaNp/DxPvAu8JpzaA+rWsd6AdysUe7LFj/UbJwKvn36ZECseP14ed4dlRRJGN9fRUCiIrpyO9CZV5sDlGGW8CQ5BfimQl1zPCgc1G35vZfA4DzpDocA2jNq191PoZYEGoBt+m8aiMusJyuV79MA7l5fvEIZ/2uoELgGxMk9zIQOIEWBBgDZpzLcB8lZ4mPMnj2GeADN5s+cUHbtmV5y9bUmeBGILDMfs13gj9XUp1BJCl9UIc0BhMPVTJ/xcLEskmLfjmtX8VwswSg6pgjgEnhXTGjAQlwHRisbhluNJp9wEsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/+Q3B2fBJZj0yDDU65mrnrFWpB5TgVCfI+Nd97/ZC4=;
 b=dVhStiP74lW1OwjPXv7N1Ygqc2IX21EgwZnSHzEbPL4fzgylF1i43/s3U5S1+L4WYH02xmnun+mci791YSZQUDRJoLMHFhS7KwV+A9gsxvN/Qyes8TAj/lJB+Yada9pRRA1sEEghoRIJktR8a3xcUO6OHPoy36L+yeedFG1Omi9x+pZfq7mk+uKEbJl3ZuEoLPAcSQ80m5g2trqHAmjSU/t60vClb7tQG/Ht1rZl9y33W0kF7kKr7Oc/5NxqhAuUHv30PuLjYx+FBU/rOS2sIbCiBr1bpSwSJ4RdLeznJJ1/wUiJqX5++Uz++9i600Efi6hn+WjWyX9XaSoIoIHCyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/+Q3B2fBJZj0yDDU65mrnrFWpB5TgVCfI+Nd97/ZC4=;
 b=WEwxIlHv6SIpR3GCjecb35Rnnp5o4h9OMvDatKrLLvM4S8wFbz4yE3kQGEK4UdymQJ4EmD0gwBPWTvYGi8GZZJNWybCH2UHWOtUCniCKS3Oe7HLEk39Z+w9jY8gVz/E4vJ0WSYY9yFL+jrT6/pPLjWTVlHLK/HNRtF6ueoFNw6z7S4h5nzlfJjubERBKuhXFD8X0EXJkHLrx8gbsWbDwMaIeetYPEH0MsbGXop6aFWi+vvo9zJjMaxfx5Z8yUmzlq3SKFuJs/UAOZi+uH9QonAW7GNBqdwtD+8GI6iwxhNWA8bTsXEwcW0QCwaTrdnGl+fXs1O8RRXgsGc45dPhSrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
Received: from AMBPR04MB11741.eurprd04.prod.outlook.com (2603:10a6:20b:6f3::7)
 by DU6PR04MB11184.eurprd04.prod.outlook.com (2603:10a6:10:5c1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 08:51:14 +0000
Received: from AMBPR04MB11741.eurprd04.prod.outlook.com
 ([fe80::ee70:7a62:e9f:12b7]) by AMBPR04MB11741.eurprd04.prod.outlook.com
 ([fe80::ee70:7a62:e9f:12b7%7]) with mapi id 15.20.9564.016; Tue, 10 Feb 2026
 08:51:14 +0000
Message-ID: <c1186aeb-70c5-4538-badc-f585002abb4d@gocontroll.com>
Date: Tue, 10 Feb 2026 09:51:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/4] dt-bindings: backlight: Add max25014 support
To: Rob Herring <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260123-max25014-v7-0-15e504b9acc7@gocontroll.com>
 <20260123-max25014-v7-1-15e504b9acc7@gocontroll.com>
 <20260129160418.GA1100798-robh@kernel.org>
Content-Language: en-US
From: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <20260129160418.GA1100798-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P190CA0061.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:656::22) To AMBPR04MB11741.eurprd04.prod.outlook.com
 (2603:10a6:20b:6f3::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR04MB11741:EE_|DU6PR04MB11184:EE_
X-MS-Office365-Filtering-Correlation-Id: c9a79f10-30f3-4e5b-5250-08de68818bc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|10070799003|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2Y2NGU0Wm1KVWx0RTVhSEF1VUo3TmNrcExZaWpBTERwQmJXZHRESzU1MVpL?=
 =?utf-8?B?d0dBMitQMW1jWmpnN0hmUytKeCtWcjhRSXJMUno5NG03Zk11cmhzZC9JV0Jo?=
 =?utf-8?B?d1J0T2JLUG54VXFDTS95c0pJT2I1Ykd0czBNR1NKb0txWlV6NDNTTm5PSHVN?=
 =?utf-8?B?Qm1UMkJvZThybU9QYTA2K0RrRVhUOWlFUUhHVHFOYUc1dUd4aXlsc3ZnKzht?=
 =?utf-8?B?K1h3QklXNVE3MllmbXBIY0hrN3Ftc1BzR0M3Z1dKYUhwcEFLRlkveFZTMFd1?=
 =?utf-8?B?OXphSWpkY1Z6cldrdUdTWm5qejk3YWh5Vi8wK0ZCdnl3S3kvdHJLUEN1VHdm?=
 =?utf-8?B?RDBhbVhPZ1hIdjJyVm10WGFKMmRKYzRCQVc3NW1qTVZzcWVMRWRkbFFGWjBi?=
 =?utf-8?B?R29IamwzNy9nY3k1dDg3S2xCajdCVXc1Y1owdVErbHh2a29yUlF3VzRXdVdq?=
 =?utf-8?B?SDFWa3JEUnFCdjVyTDlYQXp5anJDencvN3F4bVBWTSszZ05HQzJXWmFpVm9u?=
 =?utf-8?B?cG1YSzJMSjlCR2dncXdKRzVEWHJFdFFjckZMVmpJL0NDMVNPT0YzQVlUZ2Nj?=
 =?utf-8?B?M1puc1lEbG54ZVBlMGVXdk1ZOVNjeTRSREZYdExKVldlTzdaM25ETldHRFc4?=
 =?utf-8?B?UTc1elN3dkEveEFIWU5OVC9uL0JCcGtKQitZQWh4SmRsQm1Uc1FPOGRuL2lO?=
 =?utf-8?B?V0JST3RvQTFTMVRCZDlnT0IrSkFka0VYbkJibUNEbWhpMmF4em54TlhzWnlT?=
 =?utf-8?B?R3dFZEYwWlNXLzYwcHUwZXBxS3g4MGhHcFVRREE3anBaVGZOYmVtQ0o4eE9V?=
 =?utf-8?B?OVlCeGtabVhpTjNQNFVaRjhoMDRWWjI4QlI4N3MwUFFmWW1Yemt6N1JhdmR1?=
 =?utf-8?B?ZWNDQkpLWElqdy9NV1hxcThmOGZ1WlBkOUNCZWNtdDYrTWhad3hmOTlRdWpr?=
 =?utf-8?B?bEZpTGp0OVJ1bkcxLzdDSUtPVTFEVjhtTzM1WHhPT0hFbjNydGIycXEvdEYy?=
 =?utf-8?B?K0ZYZUN1cHZoZnE5Q0FSdFMyM09rTy82clhOVmxXdzhzZEplcU53VE1wRmIz?=
 =?utf-8?B?dUZXakZ6cDVKY1d2T25DbFd2d1hKeWxVVTFSYTNEOUlJVUwwSGhwYmRQcjd1?=
 =?utf-8?B?YUJubE51L2VYVjBCRnBUUmxGSjMxVkJFOTlyNnRLUEkzdUhFNm5MZ3ZydThq?=
 =?utf-8?B?bEJBdTVoT3l2ZDN1Q09wVXU2ZmdXQkw1RmMvcWVQUkowN2ttNlFTcGh2T1o5?=
 =?utf-8?B?dThsbS9yNDVIUEVpQ0k3RzZjTEl1a0VnREVxK2R4T1EzQWpFdE1BOFNRQlZU?=
 =?utf-8?B?by9BcncwbXdIYnNXREsxdEJsaFpTVVpNd1pkY3hDeUhmeTNiR3Vmb3BPWUxp?=
 =?utf-8?B?TG5BYnp4Vm9qbkU0cmROY3ZKVmhpNXU2MzJiN1pTcW1INzlwcjBlQ0NYWUli?=
 =?utf-8?B?a1FjT3dvSjZHSkNMREQ0VzJFMUdFK0JHYlNtUUtqRUtmblBPNmJSRURBeGFG?=
 =?utf-8?B?c1BPTi84dmJkcStRZjEzME0rQnVaV1BrNmpQNm9FYnIvMHQycXB2TzJUNjVK?=
 =?utf-8?B?a1VxRkthMUJXYk8wZlZFaXoyMzlRRVE0aHV3cER1TDNTcUJRRy9MdHlvaUcr?=
 =?utf-8?B?WVBFYjdvdTM1WnpaQkdvQU91eG5wUDVuZERnbmlPekZzMEFxazczMVAwcjFa?=
 =?utf-8?B?bDV5MUlsbUtTSjcwNXMyd0dMeWR0S2FTeEhOUE9EY21POHVpbDRhWStkQ0JD?=
 =?utf-8?B?VmdTdzBRdXlnUER0UUNKVG1KVUhkaWRaNjYzT0RIWm9IRklGOXlTY0JmNElW?=
 =?utf-8?B?dWErNVRMcFVndm9uU2twT2s3Zi9lV1dlMm91L1hQZi9ZcGQ1VHMvWlhSSkJz?=
 =?utf-8?B?RVd0Mk1lNHRHZXVCU3N1MzF3M3ByQUpOd0x1cExRVlhuR0EyVk0vMTVocGdW?=
 =?utf-8?B?Qm1oZHN2QVYwVmc0Z2Y3ZzI4aHd6YVh5bEwrc0M4TVRCbUpsNnp4YXg4Qitk?=
 =?utf-8?B?RGdCRnQvWXk4YWlCbm90V0RQb2lqS25CeGdLd0tpTnRXUHhieDE5SHJGenJD?=
 =?utf-8?B?dXprUEV6bCtZbVEydWl1LzFkcWZkOGU2Y0NqTkNFWVZhMzM0cVVLNGI5NDFY?=
 =?utf-8?Q?d794=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AMBPR04MB11741.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016)(7053199007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWdjb013b3NZdDhXTUdOZjZsOWtNd2x0K0hoNUVKa3FBT3JzM1JlcVN3S1NV?=
 =?utf-8?B?c2tabng2dXA4d2FWaTgxK2lrZlJjdFVkNFFUdlVERmpWcW9GYUZXSjFhdnZW?=
 =?utf-8?B?WnBzaEg5REZjRDNCYWJoWFBaODlaQk82V0twclk4VGNhK2xuN3VXMmxyclFM?=
 =?utf-8?B?eDU3cGJjc2dwbUVtcm42S3l6TmZHZmNIdFJsM3pMOGd5b1puNmRRU0daWmJl?=
 =?utf-8?B?V3NXWTFaVUdEcHRSaitpalRIelg2V0FPM3NSWThFLzl0dTZiY1BQYmkrV2ZX?=
 =?utf-8?B?QWtCblZxY0paZ0pYZ2k3K3VtV21yN1lPZ2g1WE1SUkRyUnN3R2ZhWFRpNmdk?=
 =?utf-8?B?MzJYdDlEZ08raEd3aUltZ0dLQkJYcElGODBHNWJsV1F0ZEJnbHFlNVBLdGUx?=
 =?utf-8?B?RFBNdnRYK2kvQ2dIVXhVZjNMVlhVM3I1dlBwODFMYzluMkVaL2ZWSzVxZk9M?=
 =?utf-8?B?NEprWjB0bjhqR3FJTUVnT09IVnl0a1hlbGpiaVNqa0ZTMERaNFJ1KzkzVjlK?=
 =?utf-8?B?T3FISFJ1WDJPZnVXekU2RlpwOXJxelJ3blFKVkN5OEhVbms5VGxLNEhld2xh?=
 =?utf-8?B?MldBdHpkVnZ3Y2g0NUxjT2xvZTRKV3A3QW1rOWVSTmFxYkNjWmdhNVEzM3Nm?=
 =?utf-8?B?Y2lLT2NIdHVvWkZaSjZqcVBONWR3V2hDdDFwZXhnV3hqdUFoMlFTWkorSzlt?=
 =?utf-8?B?b09QWVFKU0ZLZDFZcW5pUEpYMXFzOGNXeEhOa0ppeTdEOXJWVmVWQmtILzF3?=
 =?utf-8?B?dUI3eVlZUWVUMTkyUmtYZ3o2NnBNaWRmbE03bXFBWVlFbnhMODFGWGxVUTc3?=
 =?utf-8?B?YWJ1YThFNXY2Rm02a09MYVVsNUxaN2VuUEN0Zllva0ZTTnIwcXN6eXI1eE8v?=
 =?utf-8?B?cklsVjZjR0xFREg4dW9uTGt0NjIzbzB2RVM2R2IwNTdIZUoyMFNZNzhRaXRS?=
 =?utf-8?B?bk1SZWRDSlBLYVgzVHozUGRXcEluZitaYkhiOHVqdHB2alh4YS8zaXExU0Q3?=
 =?utf-8?B?VFV3NEVpYXdQU0IweDM2dDk0bWt6WStqdlYzeldwT0djV3p0bnBkWUd2bUFV?=
 =?utf-8?B?eHVTYmRkc3BWVm9LREJjcTVMa3hONkxXOVJmV0ZQSnJHZHRtOVVtL1NyVzdS?=
 =?utf-8?B?djA3MXREMlJ3Q25WcEtBQnNGVnBzY1Iyc0EwKzNPYmFYSTNic0p6Y2VzblE0?=
 =?utf-8?B?UHNuTW52ZWNjbG1hbHhVMmNueGluNjAwTjQrL21aM0hjZFNKWS8zTGVQSlFH?=
 =?utf-8?B?b2dRaXhPbE4xT1F1NkNHd25Ib2pMTmw0cjg5WnpYWVV3bjg0WWREaWMxZG1m?=
 =?utf-8?B?RzV6RGJISDhoTzlUdWtJNjgyMDltY3kxbFY1SE1BWVdTRlBRRG8rcFFxTzdn?=
 =?utf-8?B?dStFTDhKOC96MXpISWFxaW90a1NMWno4dDVDZlBQM2FQaFk0cjNSZVA5dEtH?=
 =?utf-8?B?dU45ZnFwWm10RnpYczRham8vb1owRmZhT09IdlZkMjkvY3FySXg1WkUrSm1i?=
 =?utf-8?B?M1VaZWdGc09jUlZiRHI1OEs3bXVNS1NHYjRzWU9sRXZ2RXRsd3hDTCtUVURZ?=
 =?utf-8?B?UWJvWjUzd29nZnlJN1ppY0gxRXl1cXIvRXUyWHNMTERQRU04amh2VWVROEhT?=
 =?utf-8?B?YVRPS0hqMUZoQ1ZMSGlHZm5ESElPSi9LTW9WV3RjWE94bno3SjNqbWRDSjZy?=
 =?utf-8?B?TXA5T0s2M1FYZ2Z2QUJyUFNabkk4Q1VFWlVBaDNDQnhoSXNQWThXcWF2RWRN?=
 =?utf-8?B?ZXFFa2pTbmhtWHJIYys0REhEQXFDbGxCQWNycVFtZmcwUzNxWWxsRHVrME5K?=
 =?utf-8?B?Nm9mTjI2WjlyM2x5MnIzTUhVZ3IyWUdaTjlaY3Q0aU94eEFEV2lMOVRMY01N?=
 =?utf-8?B?S3BodFo5b3lMSmRHQUJwQXB5S1F2SkVLOUd3OW5iZ3pOVmtQRUFxSWtEK25N?=
 =?utf-8?B?YjdjTXByNlZCVEFVZ3k2Tjg1Q2tLM1VsNng4WVJ0NmF3eU5VNDdDeW94TmVZ?=
 =?utf-8?B?ZlVBL1RIb0preEdBZWJiVkJndjZIUmx0R1NoYW9NRzJLRVd0d1B3T3dKOGt4?=
 =?utf-8?B?OHArK2RZMnl5VmFUaWZXZHlCZENEMDhTN09iUzFYUDk0Mit2cUtSb1NSNzZR?=
 =?utf-8?B?bEtYN2FaUnNOMEhnWlpGOXVLN3F6b09CVlZrSGpucjhkT293YjZOMWFmbWxm?=
 =?utf-8?B?ZkxoamVBdXpYdHV0K0Z3bWdCbkFJb3JyTzl6RXk2MU1GSGNJOWJGQ0h1SGQw?=
 =?utf-8?B?bWpuM1ppNFZMQk1Kc3E3dEpOekN2aE5SMzJmZ0JkRWd4L0EwVTJhUjYxTUNp?=
 =?utf-8?B?MlpjLzB6OWxrcExqQkZEdVRDT29DTzdyaHB4Um91b3hSUlZaUEtqaWh4eWpv?=
 =?utf-8?Q?YTDxWF6D+5sETIRPaGXCcCSmflJP6TVlhLZOedTzLBb+d?=
X-MS-Exchange-AntiSpam-MessageData-1: nIP1wMKgJ+mMMawCdcTri/eYizugevZP7yY=
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9a79f10-30f3-4e5b-5250-08de68818bc4
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB11741.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 08:51:13.9619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0B4va2fGKhLKXYfFOhqiluMMxwUcgLu88FyWTE9H9+l73615sYVu0IvU++RaOX7sP0GZBqjOaW6F0v2FyijhsbyaX1Wy1tenygf6nVvGx9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11184
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
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gocontrollcom.onmicrosoft.com:s=selector1-gocontrollcom-onmicrosoft-com];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gocontroll.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:deller@gmx.de,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[maudspierings@gocontroll.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gocontrollcom.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maudspierings@gocontroll.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gmx.de,pengutronix.de,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gocontroll.com:mid,gocontroll.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D73F1118671
X-Rspamd-Action: no action

On 1/29/26 17:04, Rob Herring wrote:
> On Fri, Jan 23, 2026 at 12:31:30PM +0100, Maud Spierings wrote:
>> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
>> with integrated boost controller.
>>
>> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
>>
>> ---
>>
>> In the current implementation the control registers for channel 1,
>> control all channels. So only one led subnode with led-sources is
>> supported right now. If at some point the driver functionality is
>> expanded the bindings can be easily extended with it.
>> ---
>>   .../bindings/leds/backlight/maxim,max25014.yaml    | 91 ++++++++++++++++++++++
>>   MAINTAINERS                                        |  5 ++
>>   2 files changed, 96 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
>> new file mode 100644
>> index 000000000000..c499e6224a8f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
>> @@ -0,0 +1,91 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/leds/backlight/maxim,max25014.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Maxim max25014 backlight controller
>> +
>> +maintainers:
>> +  - Maud Spierings <maudspierings@gocontroll.com>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - maxim,max25014
>> +
>> +  reg:
>> +    maxItems: 1
>> +
> 
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 0
> 
> No child nodes (with addresses), so these should be dropped. And in the
> example.
> 
> With that,
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

And in the actual dtso's too, thanks for spotting this, this passed the 
dts check but indeed is not correct anymore.

kind regards,
Maud


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EF7A0B272
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 10:14:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED3C310E43F;
	Mon, 13 Jan 2025 09:13:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b="idqLowgK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2091.outbound.protection.outlook.com [40.107.21.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C907110E43F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 09:13:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YWW1j/h8p+JY28OD4Z+Oj9c7mX3k73LHPsWZ38yX14OqZuMkwdeSFUPaywW9PQVeXTiXAxYZIZdC05XS2TK6Cr4kwrJ40/en3aIycwh5UOa9Av0CUL3mTEE7jQDpycKeqgSuR5RTW2P9PwOKgRVOPA8/iGVfOZRW/F6E5ZGqR9SiUtQDxADU3EX0sMm7IEhxlKShCW0uhCqKepcbdIn/x94SPUq92Yh8zjrU96V6zpis0xJDjHeuArC5eXoI7byHnzHtR4ZTZPvz1vb04CmaPIsqKLp+8DRkZknjQEOOoKPEVQCzzHAzkBrzjTnsiuwpcm1a0QaF5+zA4Txcjb7a2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=loJyIte5to3ds//hf6AqYkp8c1Pignl2NTtSL4wRa2w=;
 b=lT0rXmwLYqDmMAFidLeuXgyogfvSP2btFF21py0aJ/ZTBCmS5P4fk3bfr7FkTqdjuuYLdfVS15kSbiP88dPWMehziNTQfx+SIdr1+8lRp3B/NiErbZ4BSy4Qh+oQ7hz9MHNaaJmoJ7LdYrTBSncHTjyJT5E0tbeWjOqCyrlDE3ZMt0JNr8WloZ+J2+WmmTISV+XHBxntLZSkbMBvjWAZagEppqTtouV+4rGo7NcTHZD7izzos0C+rxNLDZ9hWHQgFZmMCC9ukXiI7D9uPb2U8T3BtiRBwRspqddf+xnGE1eQqpoZ/M1jFpDYymexvleR2OWjxjid9L9ccAfbN7dnBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=loJyIte5to3ds//hf6AqYkp8c1Pignl2NTtSL4wRa2w=;
 b=idqLowgKiCLle6YkP31t3A5hdCP2DCyeA54w19syS3zWgFHVq1yufm+IqYB+3pRi1pNPRC5SS3WaJEYTlYLkqEujo1mukx7JevXN+GTY4XXA9z8V0p0qbtTlmF/waH4AdSbQKd7mDyOwGjcN0HZOTsHJWQtDDMgE9S5Ff5Y3Lno=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by DB9PR10MB8073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4f0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.10; Mon, 13 Jan
 2025 09:13:53 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19%6]) with mapi id 15.20.8356.009; Mon, 13 Jan 2025
 09:13:53 +0000
Message-ID: <939e023f-2d64-41e6-9aca-025e19daba83@kontron.de>
Date: Mon, 13 Jan 2025 10:13:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/bridge: imx8mp-hdmi-tx: switch to bridge
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marek Vasut <marex@denx.de>
Cc: Ying Liu <victor.liu@nxp.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20241224014701.253490-1-marex@denx.de>
 <nehmmkv22ortkw6ngzlhjqo7emxsptt2dzoulln5ili52uswfp@h3acrwrad2y5>
 <75dc6f74-f828-49ac-8bf6-41fd4e197855@denx.de>
 <AM7PR04MB704688150ACD5D209290246A98092@AM7PR04MB7046.eurprd04.prod.outlook.com>
 <85d87cf5-26cd-4d71-b9ec-71d5e16d4e0b@denx.de>
 <z5so7ce7ufjrf4h7owoupimvo7qhdhqpd6ov7cjq4yoqvcmitg@2gdo2c222hfp>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <z5so7ce7ufjrf4h7owoupimvo7qhdhqpd6ov7cjq4yoqvcmitg@2gdo2c222hfp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::14) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|DB9PR10MB8073:EE_
X-MS-Office365-Filtering-Correlation-Id: 7906b6c1-c7f3-48cc-21c9-08dd33b29995
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SEFUYkw2cTVrVS9lTEYxM1pDNDVZQUszUW1idVZHK3A0U01iYlNmU3Rwb00y?=
 =?utf-8?B?RXFvbVllUkFLdnVqSGRxdWp1WUdxT01BMlVVNUtCY1NuZ3VEaTE5K0F0cUZQ?=
 =?utf-8?B?dk1nakVlMEgrdEFQdVM2T1R4dmRjdmdaUmFMc2hEUFV2V2R4aWJ3THA5L3FJ?=
 =?utf-8?B?UUZyV3JqVERBc1dSSTZ6c2J6bDd1aGw3NDlvclJCMkZyL294SDltbmlYQ1pn?=
 =?utf-8?B?YjhZSFlydVg1dHB0MVFla3BTbEJlSHdtNHd3dDZaYWxRNjlrbjZsL1VBWFpG?=
 =?utf-8?B?bWp3VG1sVUFqK1JvU1VHMkRxV3kwZkRBbDNFcXlVZ2d0SFFzSi9QZkFjbTJh?=
 =?utf-8?B?OVRRLzhkcURzVVI1NTNFek1zZEFvK2dSRml3MVZMSWVYQUU1elVMbXJOd2ZU?=
 =?utf-8?B?bkYvN01OdzhJUllsdUJGUzEwdlZRZUNhN2NURWVEMzByT3ZhTFJCbXdzcXB6?=
 =?utf-8?B?M0QyZ3BnQkxRSVliYVFJTVlsV0hta1h2WkxlNzFBNFcrY2JqRyswWDV5dFhF?=
 =?utf-8?B?NFgrc0dMWmdFWVFiTXYyamN5ZHMvS2JHZWFEVzB0STYwWnllQU14cGFNb0lj?=
 =?utf-8?B?WGhrNE0vTzg5a1UzUnZkalJIOUtkR2dkTmpBaUJCakE5TVAwRGRzV1NoUm1E?=
 =?utf-8?B?cUlxYUpDbEdyRkpIaFBveHAzaWtJeTFUZWhBRWNwTnZUTEZzNFVEblNJajFN?=
 =?utf-8?B?ejA3OCsxQkxlQ2dGdm1weWJ5ZTZ5bkk5UmNnWmk2YU5reTFoM1NBZnEybndl?=
 =?utf-8?B?MnBLWCtVY2o0aHpXaTV0TGYzRHJjNVZJNmM3STlTUnJ5cHBqNUptZ0xVOUNt?=
 =?utf-8?B?ZGxnVEVPNU5BMTJQYVNMMDFmR1ZTUXNYcHR1YlNUMEJuQXJJRnFXZFFYNXk5?=
 =?utf-8?B?cjVFTERENnBiTmdmTEtkbmV2RmE5bGdFT0R6S0pqR3NWNVIzMUpsaWNldG5o?=
 =?utf-8?B?M3dxdU51OGRvTEN5RXd4Tk9hYzdCNDM4ZmFWbFc1bjdoT3NQNjduSERjS05w?=
 =?utf-8?B?UGpUNTFiRWR2djB3MGovaExHSW5lNk5SMHlrcTQ3WmZVUm1ZZlpKUUw0TWM4?=
 =?utf-8?B?cnZiZ1JHVTdFbFp5VDdJSENJb0xXK3F1eU52Y0gxRkV3Z1FTdUZxZENoL2dj?=
 =?utf-8?B?SW1OeXpmT040WWhhalVxT3FJdHh1cnlOQ0hOUlJ2Q09lcDF4UkNuMkxjUFZB?=
 =?utf-8?B?UWhuTnZrM2NOOXorMWZiTTUrT01NYTN4ajVxYzlZV1YwczNTazZxNzYvM1pH?=
 =?utf-8?B?bUdyYXlHSmRQa1JDRTJhUHNzRWFBNXZNb01RY1FIM0xnV2tZa2RxMU1iN3Ru?=
 =?utf-8?B?Um1YYUEzNnJoamRwdzBVSUhGNC83NUFxTjFyL3VveHd5TXM4MVR3YzB3WWw5?=
 =?utf-8?B?QTR0dkpwMFc1Q0pJSmNlaUZiL0xvdTdZRWs2eDNoZ0ovYlZocTVVWHZxUWo3?=
 =?utf-8?B?VWJNS3NjOGRjNTkySHRXTERidGV3VDJ0VUI1L0hVWXFJOWRMK2dWV2dFeUZP?=
 =?utf-8?B?UkJXaFNZbDY1RVNUeUxVaTNlaWFVaXU2L2pUU290UG5KSGFxekNvUmFMUWJF?=
 =?utf-8?B?Y2FqN0Z2TURFSVRTMmx0TlZ1cFQ0OThPZHkvY01lbU5rakV6U0pPbWVIS2Zh?=
 =?utf-8?B?WmtvTk52UGdza2RhTE04ditTZ1BKdXAvVFpveTZ5cVo2dkJOOGNUcU5ReEJK?=
 =?utf-8?B?T2NPbUFDMUpDcTBUbmVBL0xqY2lubHdkb2dEMHpHd0RFbk5kakpoYXNVanU2?=
 =?utf-8?B?cERKNmdKMmZLUVFBN0NBWGJBOE96bkp2N09BYWZFRFFiK3RRa2RYdnI5ZFg5?=
 =?utf-8?B?SkdvNk9SNElzYWJTTFNteDRqa2pnOHRRVG4wUXJZZTB1NXhWT1lCK2s2RXBF?=
 =?utf-8?Q?jPWOFRQsdrt2Q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlRNSXNiSHNrSTduc0pzbHdDcjFsZXpoak1qelRremMyZFRpckZGUVdyY2o5?=
 =?utf-8?B?S29POWkxNEJmOWtNeFl6TWt2R1JzdkZZWk1ySXZ3K253angxYS96THFBSmhL?=
 =?utf-8?B?cklFMDZiMTQwZEYzK1h2S0cyRUx4TlZWWURJWE0zUG9UVGY1Z2ViOTNoeUlz?=
 =?utf-8?B?TjM3SWF2ZWVubk4vMWJUV2ZrMjB5TW1vblQyOHJXWlc3NjNSekZSTTlMbHRq?=
 =?utf-8?B?NVYvSElwdTBMK3lQMThjNFdTMEhrQTQ5U3BLc2gzT2ZvcXpDblRMcS91Q3ZQ?=
 =?utf-8?B?MnVTWFFDemNHaWVoVnZDUDZyYVlNUGE2RXNhaGZpMjgwS2U3ZUQrY0RWZ3F3?=
 =?utf-8?B?N3lWRjZUR09ZVThDd1NPMnNUd3gxZ1lmbTArM3o5cUNFZ1I1RFB2WCtxOW8v?=
 =?utf-8?B?ek95Zmk5MzJ5bXBqS3V0NmZpcW9zTXZ0cUNnSlVhNjVlK3JVVHVSeGFWTUFo?=
 =?utf-8?B?YVlic1VVREhHUVZ6SlNhVjZWZmRKaHM2aks4S3JEMEFLQTBYQTgzZlFqY1I1?=
 =?utf-8?B?RGp0NGVxOGp2bHlIRjRGTmJMVW1KTjgxSWUyN24xSnFKS3BDakRXSW93MmRy?=
 =?utf-8?B?Q3BwR3k0WGp4Y1NWb1NpMHVrdmpJam1BQTVhV3luTTdQaEtUemNhOU1Gc1NO?=
 =?utf-8?B?a3A0UVhUN2lZWHJ2akRIa0NwK0JPcWs3c2ZXVE5waVV0VGxQblRxVDVrVzJW?=
 =?utf-8?B?bEozZUtFU0E0SHJMSlh4UlFuWmNpeklOZEkyZCs0dEI4aFRzd3ZGaFRUczln?=
 =?utf-8?B?Y2drZmFaYTFnKzRXa3ZhaHo4M1p1RkY2SVNXTEFBMlUwVC9lNENvL3M4MzdM?=
 =?utf-8?B?b2NGNVJWamFoZUYxZE9nZmF0THVLZWZIM1dtTXp5YlFMMnN5b05DcFRSNnVs?=
 =?utf-8?B?R0pSUG1KK1Z1UlZyTWhxTWdzNnpFVThKRjdCSkh2SFQ3ZkZjMUp2RFJJK2d5?=
 =?utf-8?B?Q2NuL3h4aWhPa2pycVk5dHllRmFGUmRONC9QOU9JcVNXN2dMRjhPelR3ZnV0?=
 =?utf-8?B?QTZCOHlUS1pPWDA4cCt6N3ZwR1Zla3Z4QkJQeDl3ZURZUEUzaTZmT01aaExB?=
 =?utf-8?B?MDZ4S0hGZHVuOG5CR3RWK2JNbFBCNWdDZFhnQWJja3lHbmsxV0YvaUFBMWpB?=
 =?utf-8?B?Zm9pMkhuNFhveEZhU2w2dHRWaU54eTlOc3g0aGdXYW1qSGQrdDhDSGl5blJj?=
 =?utf-8?B?elZRZjB4MHRYbnJNQlNEMzR2RjVPWmJ5T0h4YmJYMjNNRkdHOXBkcWkxdWxG?=
 =?utf-8?B?aDRqMXZXSVlncnZWQmsyYmUvalVVeEdERzEyelRoTEZtVzlhTTZFZEF2MFgz?=
 =?utf-8?B?Q0xXVVo3MDRYb1hvY0ZnRGxRSHVJYThraVFiaWg5dytGRU5rdWwvZzRyc3JI?=
 =?utf-8?B?dGEvVmZrSWxPOE5nZHY2cjA5OTZGWWtxTlQva2k2YzEwNzVpRmV1S2o3VVdi?=
 =?utf-8?B?SkNaY0QvcHJaRGNnSTBYdms0eFU4VDJXSlgySHQvQ2UrY1BDc1haOFNjQjlp?=
 =?utf-8?B?WWNEWkNJR0lRejEyVTNOcW5NY0R4a2lyQlBFM3ZoWXZNVFZOMUVCaXcyeEZF?=
 =?utf-8?B?TERoN2EyV3dSa3NNWWZZZ1p2bFJHS1dBeWpGa0E1dGlhWkdWcWZlMlMyZU9v?=
 =?utf-8?B?aGNSY3I0Ti81ZUlJSHdLQ0h6bHNQNXlMcGdMNlJ2V1dTU3Rzb0ZRUHN1RFNB?=
 =?utf-8?B?UHZhb0dzaFpWeEZHOHlSaGRDd2trakRYZ2lnNnNxTTEzaUlMS2hsbFB3Ni9w?=
 =?utf-8?B?b1JhVnpNY1pyRktJMkZnY3NyY3M2aHdjVzFwcHNZUjZyblZaQWszZEVkMzZI?=
 =?utf-8?B?TUkvY0JNTEcxbnE2ZFB1a05xalUyR0h3SkYycHpUS3doUTlUNDFlT2RFVmlJ?=
 =?utf-8?B?NFg3RWhRSEd1YjZaTnNXNTJzY3RKRVhUcU1tVjFMdW5WdWNISTRBNEdVYktx?=
 =?utf-8?B?NTM5dzQ2YlpreDdmNWxFZ0RpQVdqZ01QcU1nQlFDdy9YOTR4MXQ5Q0N0VElX?=
 =?utf-8?B?S0VxZlZFdXlPZWhTUmFSVXBnQnhodkFCUmJ0a3V1OCtzemdFZFIzcVhCeXdO?=
 =?utf-8?B?TGRxUUlxbzh5QXNTYWtaRzdJVkhLM0wwemxsMHQ3bFdEZjVMcW96UlR5eERP?=
 =?utf-8?B?bmdXb0l4cWtVRklvamRmdklmbklNQmNEUE5ZWHJUd01VVlpkWlZaTUhRaGdn?=
 =?utf-8?B?TlE9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7906b6c1-c7f3-48cc-21c9-08dd33b29995
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 09:13:53.1801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 46jKYoK8ODyNDvyvUsn/qb/eJ6rpXC88j00j9dlU/iNM3amSCg4Tu5osKBrzMW44n+maFn+xPC+qNbAL7N854dyCAUi1ZKLYIXne8RES6Ac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB8073
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

On 31.12.24 12:48 AM, Dmitry Baryshkov wrote:
> On Mon, Dec 30, 2024 at 10:44:25PM +0100, Marek Vasut wrote:
>> On 12/30/24 8:04 AM, Ying Liu wrote:
>>> On 12/26/2024, Marek Vasut wrote:
>>>> On 12/24/24 5:21 AM, Dmitry Baryshkov wrote:
>>>>> On Tue, Dec 24, 2024 at 02:46:14AM +0100, Marek Vasut wrote:
>>>>>> The dw-hdmi output_port is set to 1 in order to look for a connector
>>>>>> next bridge in order to get DRM_BRIDGE_ATTACH_NO_CONNECTOR
>>>> working.
>>>>>> The output_port set to 1 makes the DW HDMI driver core look up the
>>>>>> next bridge in DT, where the next bridge is often the hdmi-connector .
>>>>>>
>>>>>> Similar to 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge
>>>> DRM_BRIDGE_ATTACH_NO_CONNECTOR")
>>>>>>
>>>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>>>> ---
>>>>>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>>>>>> Cc: David Airlie <airlied@gmail.com>
>>>>>> Cc: Fabio Estevam <festevam@gmail.com>
>>>>>> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
>>>>>> Cc: Jonas Karlman <jonas@kwiboo.se>
>>>>>> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
>>>>>> Cc: Liu Ying <victor.liu@nxp.com>
>>>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>>>> Cc: Maxime Ripard <mripard@kernel.org>
>>>>>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>>>>>> Cc: Robert Foss <rfoss@kernel.org>
>>>>>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>>>>>> Cc: Shawn Guo <shawnguo@kernel.org>
>>>>>> Cc: Simona Vetter <simona@ffwll.ch>
>>>>>> Cc: Stefan Agner <stefan@agner.ch>
>>>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>> Cc: dri-devel@lists.freedesktop.org
>>>>>> Cc: imx@lists.linux.dev
>>>>>> Cc: linux-arm-kernel@lists.infradead.org
>>>>>> ---
>>>>>> V2: No change
>>>>>> ---
>>>>>>    drivers/gpu/drm/bridge/imx/Kconfig          | 1 +
>>>>>>    drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 1 +
>>>>>>    2 files changed, 2 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig
>>>> b/drivers/gpu/drm/bridge/imx/Kconfig
>>>>>> index 9a480c6abb856..d8e9fbf75edbb 100644
>>>>>> --- a/drivers/gpu/drm/bridge/imx/Kconfig
>>>>>> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
>>>>>> @@ -27,6 +27,7 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
>>>>>>    config DRM_IMX8MP_HDMI_PVI
>>>>>>    	tristate "Freescale i.MX8MP HDMI PVI bridge support"
>>>>>>    	depends on OF
>>>>>> +	select DRM_DISPLAY_CONNECTOR
>>>>>>    	help
>>>>>>    	  Choose this to enable support for the internal HDMI TX Parallel
>>>>>>    	  Video Interface found on the Freescale i.MX8MP SoC.
>>>>>> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
>>>> b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
>>>>>> index 1e7a789ec2890..4ebae5ad072ad 100644
>>>>>> --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
>>>>>> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
>>>>>> @@ -101,6 +101,7 @@ static int imx8mp_dw_hdmi_probe(struct
>>>> platform_device *pdev)
>>>>>>    	plat_data->phy_name = "SAMSUNG HDMI TX PHY";
>>>>>>    	plat_data->priv_data = hdmi;
>>>>>>    	plat_data->phy_force_vendor = true;
>>>>>> +	plat_data->output_port = 1;
>>>>>
>>>>> Quoting my feedback to a similar Liu's patch:
>>>>>
>>>>> This will break compatibility with older DT files, which don't have
>>>>> output port. I think you need to add output_port_optional flag to
>>>>> dw_hdmi_plat_data and still return 0 from dw_hdmi_parse_dt() if the flag
>>>>> is set, but there is no remote node.
>>>> Looking at the upstream imx8mp*dts , the oldest commit which adds HDMI
>>>> support is commit:
>>>>
>>>> 3e67a1ddd56d ("arm64: dts: imx8mp: Enable HDMI on
>>>> TQMa8MPxL/MBa8MPxL")
>>>>
>>>> That already contains the HDMI connector node. Every follow up addition
>>>> of HDMI to another device has been a copy of the same commit, with
>>>> connector, so I think it is safe to say, no upstream DT is going to be
>>>> broken by this change. Do we care about hypothetical downstream DTs
>>>> which may be missing the connector ?
>>>
>>> These have no HDMI connector nodes:
>>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi
>>> arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
>>> arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts
>>> arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dts
>> Huh, I missed those, thanks.
>>
>> Would it be OK with you to fix those DTs up and add the missing connector,
>> rather than introduce some optional port workaround for them ?
> 
> I can't say for iMX8 particularly, but usually we try to keep backwards
> compatibility, as DT can be coming from device vendors. So, I'd say, we
> need both, the fixed DTS and the workaround.

FWIW, personally for the Kontron devicetrees mentioned above, I'm okay
with adding the connector node and break compatibility. Those
devicetrees have been added recently and I forgot to include the
connector node.

Of course I can only speak for myself and for Kontron, not for others.

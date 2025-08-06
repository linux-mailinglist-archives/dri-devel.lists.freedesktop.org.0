Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D18B1C0AF
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 08:52:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9478210E3AC;
	Wed,  6 Aug 2025 06:52:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="lZOW0coX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010007.outbound.protection.outlook.com [52.101.69.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3792A10E3AC
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 06:52:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cslO+NjbmjJgdpbQSeNZYcYdwmyH1vn51Lac1G9L3+i8HH8JU1BuJtH2iC4w1zLShQRECGNBdPFtoxGtKpzQ95VJ7xcqLigBdmZt2xug7pcXSnpYbA9jJyJ4lNSOrgCmJok+50mMoBcYvmLSFY3rhKBvNBWOV5Zzs9LlbxE5QEp+JJTrAmCjNTcI6JZes5rbzhTILg965YpqhDQ4rx9ryXNcnEKcWpsayVuRUYFBekJ+VGpJkR59cJU4mfgxHao7cmz3LwdE5C2UGxUNTPGkmAbab7oJP64X41Y6ITJolBsMqPP4M8wfNQUU9l9OWvAR1WUoymyPXFHKAGdksSYw9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DxUYqBMxAGPoqz8bJZ0xhZPpw/h2AXBdi0YPZ52rdEo=;
 b=YL7GQlcYqhIfx3dduary4sWWH4JJJs/TjwyZ4EU9OPzuW9nQkd40BY0oyuG9TH9QPnDmVerPlj8WZXqH5+C2jwszwilsqx8D1+LHcB346+8k4HA+vcIOk3waVcPAU6KAQL5dToSMvzjd2SgEdELh8lglIv1C5L8Zt6jVFMBQM0KzatWaYC9E/mdwiRUFepj7Qge1AVPjNCpk4LOFhqFLx0Idgi/GQs9gijt3sMBmn0/Lyjet4bBFitxQismJ9TlO5TzoMAdvb9n5WoYlTERZz8t23t93VXHALQ6IJeKMdBRJjxCr2ugny9+/bAmow05f1IYxk89WcPESiVgEsUoVww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DxUYqBMxAGPoqz8bJZ0xhZPpw/h2AXBdi0YPZ52rdEo=;
 b=lZOW0coXxOMDmmC+/1TzMJY1RmPRpqshY/o9I+KujaRbvFQr/5kcrqGW+LoXJN+WaTTqExf/S8b6RfVF1OwxAjahldkUZ7ZxCjxAl5ZxLNsFOo2VycZyp3tIWz/0o1vuGMtsgBXIxidOewnSmtcBHqIPIWvJxHPUKjMI3xwSu7RG9VuSAg4BDhAdWkZEDuXCmrrejyILN60nlloFXOc07hUYm+OnQljKtDP/3oKe7FN/jlMVUI0/nhMgA5eStS89kKywolNoYzTC2ZDj+7DOAc75RhUZtJksbpjvo1ClAOxSWWdD0ZqklMx9gDYXcd27MHRydz9D8LLBjScJJeiMXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 06:52:41 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 06:52:40 +0000
Message-ID: <ba02693b-8ad2-4297-ab89-5b39d5c4315f@nxp.com>
Date: Wed, 6 Aug 2025 14:54:08 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] drm/bridge: imx: add driver for HDMI TX Parallel
 Audio Interface
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 lumag@kernel.org, dianders@chromium.org, cristian.ciocaltea@collabora.com,
 luca.ceresoli@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 l.stach@pengutronix.de, perex@perex.cz, tiwai@suse.com,
 linux-sound@vger.kernel.org
References: <20250804104722.601440-1-shengjiu.wang@nxp.com>
 <20250804104722.601440-6-shengjiu.wang@nxp.com>
 <fa455148-a071-4433-8c9c-26add3872604@nxp.com>
 <CAA+D8AN4n0H6M_0EqX4z_37ViSCyThKbmtMgqPmipintJ8Wtwg@mail.gmail.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <CAA+D8AN4n0H6M_0EqX4z_37ViSCyThKbmtMgqPmipintJ8Wtwg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB8PR04MB7065:EE_
X-MS-Office365-Filtering-Correlation-Id: e1ca7cf6-6d93-4b80-e05d-08ddd4b5d5ff
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|1800799024|366016|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L1lpOWprOUNXdTU5bDRjWTllRm1XcTJuT3VyakN3TW5YYUNaNlJiUVl1bFZp?=
 =?utf-8?B?UE1aZVJGcFNBa0dCbkNPUGQrZTNPSnVJT2dHTTBxWVYrVkk4YURuUGdTTXEv?=
 =?utf-8?B?ZXZaNVRhU0ZRMHhsbWNVMlc5bnZUSlVwM05jUCt5NlBLUm5tTS95Z2xJZEJ4?=
 =?utf-8?B?bWQxRmwveG9rWHJGcUltRlNKSXcxZngrSmFUdDhaK1J0QU11NXNEeTMxblZE?=
 =?utf-8?B?Z0RtMUZxa0ZFdGpkVWZEdm5EVWxocEN6UzBjcDlPcmtWTSs4ang3RUM1TzNZ?=
 =?utf-8?B?ME9KMlZHd21qbk11Nlo3MllvUFUzWUg5cHJYNHNUY3hzdUMvZHVvM2RFUFBJ?=
 =?utf-8?B?YSt6VHZaWlVUVElqbFp4MGhJbnpPYkpIdTNLblpmZXJvS2VtQXBJbU5tN01N?=
 =?utf-8?B?K2lsRDFncU5ON09nU3p3OHlDZWxReEpwbXBWUjNsRzVRMU5JWndkVkVkMjhW?=
 =?utf-8?B?Q3lqczVWMGNzT0dZd0ZuV05CdDg0TUZpaHZMcWxyZGNDdnZRQStWczQzNSti?=
 =?utf-8?B?L3hrOEE4RENDV0RMTTkzSHBDNDlRbmxpSDl4K2FPeWFkckp5b2RsZVE2RkhP?=
 =?utf-8?B?c21uQ1VwWW4xc1pBdWVpVW1ZV1dZSWJ0NnFlRkswazF2SlNhR1F6NjJZQllo?=
 =?utf-8?B?K1hqR3J4RnR3Y1J1MnNQL2NNdWNZVUhpWC9Kd2ZXYlJKQ2srMG5QZE16L0p1?=
 =?utf-8?B?T0NsM0xvUlZnUXRodDJPbk9OU3JDdzRHNzJvK1pFaENRZkl2UXN0OU1Jc0xv?=
 =?utf-8?B?dmZZdytCMUVrYytJOTQ1YXppcS9tT2NRSkxPM1dRNStITEdhUXo2YlhMSlFq?=
 =?utf-8?B?TU9rYmYyVFc3ZitpVUVxUkVnc2JTOUxQd1pDelZNbnMvbWYxbU1RRTRwMDJX?=
 =?utf-8?B?UHpEcm9HL3BUaHc3dUFhV3A3V28zdWtaY3MwNW85bUxqbGZFWXJsU0VZbURm?=
 =?utf-8?B?bTh2eDFuM0VzRHBZVWVJTzltTTg1LzFuQTdIdFRqRXp5YW5Xblp5QWNzdUxZ?=
 =?utf-8?B?UkJQVWhTMkFpeWdMOUtCYWhDQmRyRm43OVgwckdGdFovVmtwNENCUzc2b0VH?=
 =?utf-8?B?eTV1MktKUHMxN2tJdEc2VWxvWkJmSXpONER2dXEyeUxXeWZkNFV1MUEwN3Zz?=
 =?utf-8?B?VEp2YUVvVzdkN2wrYk1CaUtPUFprWDcwWUp2NnRMeGk5MVl5RlhUOTFuSGs1?=
 =?utf-8?B?eWtJbVNpNXpLZ1lVOVZ4S2F6RXJ4ZW9QVEhXS0c5K05DMzlHK2pIRVZZN3ov?=
 =?utf-8?B?MGRZSHZSZTRkQVdGeklmUVMxNVBnYWI1YTN4WnNvQnZjMFl2OWdxam1CZTlZ?=
 =?utf-8?B?MWsyOHJjMC9OZDQxdWVzU2ZPUlpZK1lwTjdXS0Zwc21tY0lUU09rTWNEbEpC?=
 =?utf-8?B?ajhsL3JtaURiQ3owT2FWVWorWEZ0QzNad1RjWnl3NGIzUWVjMnVlTEEvdDFz?=
 =?utf-8?B?VHRGcFJsTXNNWWp1UGdSa1ZsZ0RWQTM0dDRNOFc3Tnorb3JhbnhncGd1N3ha?=
 =?utf-8?B?aytuWmRlTFNYVTVFb1Vwc0lvV1hBUVpVWXA0K0pTamt0L3l5N0xqSk5DNGl6?=
 =?utf-8?B?N01xNlFqTlpUU1ZYbVVRUWUvZ3c0Zm1Jayt4YldESVVtcFJ5aFFDaW1PRERV?=
 =?utf-8?B?ZldydFRyWmVqTCtNR1RLL3JMdzVKUkN4TE11Qzd3SDFnREo5QTcyQWgzNHI1?=
 =?utf-8?B?QUhWRzlPOWpFSXhrSjA4U2dnL214dXN0UVUxblRwZUtIOEFNUTBURFRsOVBC?=
 =?utf-8?B?QjJBcjBUOGpyc01JU2hEY0cvQ3NSZmRCZVdLbEVSSitueXAxc1RvdEd3cjhy?=
 =?utf-8?B?bmNoS2dkUmNvaTlhUU4ycWE3SXZzeStHdXVmUGRsYnhZMm9hUGdsQnpHU0xB?=
 =?utf-8?B?c0ZjSnVDUkVZVFNLc0FtdStVdDg2b1FHTXQ1QitsaEk0ampTN2dnVllzOGt6?=
 =?utf-8?Q?lpLzy0+0IoE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1hrc3hTTXNyKzhPVy9Ub3l1bkZ6LzhyK2ZLeDVtR3hUZStQRlZkSzRtZE9x?=
 =?utf-8?B?em1pOHRyTkNRdzZXK1EzL0dlTysxa3MxdHZjeUxuQlMxYjdjY0NZMERJOGJr?=
 =?utf-8?B?Tld3eXROM0NveEhGS0kyUWJTbjJ5Mm9WQmNJcGJucTJuK3BaamNYWDg0WWpw?=
 =?utf-8?B?L3pVM2FySUFpcnlsak5yTmV1ZGhYTU8vdURLZ0Vlb1ZQWnF4TjRNVEVTZXFl?=
 =?utf-8?B?aUVoME1NMGlOYzVGbzUySmZ5U1AvR1ZrYVVaUFJDUlpLYktKM01lKzFja20x?=
 =?utf-8?B?Yi9vdTYwVkxDMDMzSXU5cmI0VUtxSlpKcnlMenVKbStVR3Y1dllzajlsSWwy?=
 =?utf-8?B?cnNFNXFGWDcwZ3hKVkRQMUtaTjlyWTBOaStxM2trVDZoV0ZCTUwrUFZkUmZo?=
 =?utf-8?B?UCszZHpVNFJseGc4ZWdiTTZvY1JlZytuNVNrSFZGZkxvSEJ5aHBhYWhNa090?=
 =?utf-8?B?bVdHYjAxWnk4TFB3eGZUYkNSdmJTVWVPVllXaG9tK2Z2MzUwK1B6M2RDWVZY?=
 =?utf-8?B?R3JWeUl3SzQwN0VVVkt2bmRJMFFYRG43UkNraUxpdTdKSzNTdGIzaWJlY1ZC?=
 =?utf-8?B?d3RQZEJQTVFPZDhnNStMS0pZVzVwRXFtMmpmcFpjc1RyendKOS9lL3A5VEFl?=
 =?utf-8?B?QkZ4UWZhaVR3MDFteWNNSStMVTZ4SG9peUx3Wi9kaEcraVZhZXEvRlRWZ1RH?=
 =?utf-8?B?azlFR1hCUUNwSkNGd3NtY1hMZVptamtmVEZqd01aUksrZlUwU1NEczVQeHBS?=
 =?utf-8?B?ckFNVVhDc2Z2d0RWMXpScFA1TllOM2RzYTc1UHNpT1lqWmJxTUFWQkVyTER4?=
 =?utf-8?B?SmN2WUZXK3Bsa1oyTmwzQXBXdEI0c1NTK0tnUFV1Zmt5SkJpWWN0Tk9uYkx2?=
 =?utf-8?B?NjZ2ZjJnTXAvS3NJUy9keEoxcUpQUzNhd0x3MU9nbzJ5WkdMZWZZQ2xseGZz?=
 =?utf-8?B?WW1nbkkxU3o2OUp3ME82bDJvNkR6ZDdmNXZ3K0taZUcxekptS0VpdU5hNGps?=
 =?utf-8?B?bkNtajFOcmtnZjF4Ri9iakMrQXliZVk2eDh4Y0N4bjFjbjZSVWVON0hoMCtK?=
 =?utf-8?B?RkRRTXI3NGZ6TllGQXpHeGxCYTZpUXdTSG9MdTg3QWs3RWNGM0xrOHZadzVw?=
 =?utf-8?B?Y1A5QnIxc0tKYkhNSWZZUk40TkdVWGdUM2M2ak5aL3ZLT0EwRzNSL2N5Lzdy?=
 =?utf-8?B?WTJDa3UwQmZlVlp1VlNyckJJbTgyelJwbHhmTktRcVpPSDNNeVplWjZ0c3FC?=
 =?utf-8?B?MEw5M1Y3bDhkSHVYTjZleDY3TlBzaDA1K3VzU2Z5ZEU4SVQzVnJnTUNrRllp?=
 =?utf-8?B?TlA0TW9NSlFSVnFrMUdLTXZaZHN1VnpLR2NHQUcxeGk1WHc5ZGVpRjMrMWo1?=
 =?utf-8?B?WUk2eU0rNTlOK2dsNkVZaDhBc2Yxcnk5VTBuM0N5ZG1ySFR5dVk1MXM0dE1j?=
 =?utf-8?B?SjZHTVZCNWR1bjBoQ1JLbUJuTkFONDRpMG9ZM1RZY0dRYVJsSnB5SlVQNGd6?=
 =?utf-8?B?OWd4NTJzdFNFWW45cDdyS2tiS2ZqdUpGaVpDZ2JvOU9GK0lFQzBJVFJJdVRX?=
 =?utf-8?B?VUNkOXl2MEdpWU1mcGRrSmxOR2MzUlNxWWZ4SUhzZ1o3VzNVR0RtUVlWc2wx?=
 =?utf-8?B?b0lZdVFIWFR6R3YwdEczdGtWcUNsTlh5ZTJSd3d1UUxZSUIyMEE5bW4yNCti?=
 =?utf-8?B?bFhUMGY2V3cvclgzYnBXNTR3SEQzRXljL05PSlpaWVFhbnBMalBaSm53dU4x?=
 =?utf-8?B?ejdzcjQwdlJST3JLMzBCSEhJV0pxdHI1bnd2bVBtSVNpajNGeGFMQ0d3YjZJ?=
 =?utf-8?B?WWN3UWdhOGhCQUtsTGllaC9oUHJ5SXRJZE1jRG90aTdLTlBWa01rVGpuOWZM?=
 =?utf-8?B?ZEJjUGJLTWVjcy9RY3RQejc2UUcwZm8zc1N0NVhBWVgvb2pQbDJqS2RJS0tN?=
 =?utf-8?B?RmlzdWpYeFZ4TkNtU0V2VmlJU3g4N1VuQmFra3pUMmVFQ2p3Myt5ekdSalQ2?=
 =?utf-8?B?cDB5VE5hUURKOWdDNkdCMjJFbHhVY05JVHRaRDZ6TkdILzREZVlQNFhicDls?=
 =?utf-8?B?d2NYR3ZsTWRGWkRYNm94RXZmRjRMV0laakg4R1RzVVRTYVFaMXU3aVlhazJG?=
 =?utf-8?Q?ORXEXfpU5pRDn9Lay0eXnk6uc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1ca7cf6-6d93-4b80-e05d-08ddd4b5d5ff
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 06:52:40.8176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CHNYW6JFkybwGLjlveh1zY1jCHaqvxMXMjyrTQHzf8MSiSbCz8Qc6fpdmxTD5rWHpTOCVhlQC5WwnbCiEkmqgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7065
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

On 08/06/2025, Shengjiu Wang wrote:
> On Tue, Aug 5, 2025 at 4:55 PM Liu Ying <victor.liu@nxp.com> wrote:
>>
>> On 08/04/2025, Shengjiu Wang wrote:

[...]

>>> +static int imx8mp_hdmi_pai_bind(struct device *dev, struct device *master, void *data)
>>> +{
>>> +     struct dw_hdmi_plat_data *plat_data = (struct dw_hdmi_plat_data *)data;
>>> +     struct imx8mp_hdmi_pai *hdmi_pai;
>>> +
>>> +     hdmi_pai = dev_get_drvdata(dev);
>>> +
>>> +     plat_data->enable_audio = imx8mp_hdmi_pai_enable;
>>> +     plat_data->disable_audio = imx8mp_hdmi_pai_disable;
>>> +     plat_data->priv_audio = hdmi_pai;
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static void imx8mp_hdmi_pai_unbind(struct device *dev, struct device *master, void *data)
>>> +{
>>> +     struct dw_hdmi_plat_data *plat_data = (struct dw_hdmi_plat_data *)data;
>>> +
>>> +     plat_data->enable_audio = NULL;
>>> +     plat_data->disable_audio = NULL;
>>> +     plat_data->priv_audio = NULL;
>>
>> Do you really need to set these ptrs to NULL?
> 
> yes.  below code in dw-hdmi.c use the pdata->enable_audio as condition.

Note that this is all about tearing down components.
If this is done properly as the below snippet of pseudo-code, then
hdmi->{enable,disable}_audio() and pdata->{enable,disable}_audio() won't be
called after audio device is removed by dw_hdmi_remove().  So, it's unnecessary
to set these pointers to NULL here.

imx8mp_dw_hdmi_unbind()
{
   dw_hdmi_remove(); // platform_device_unregister(hdmi->audio);
   component_unbind_all(); //imx8mp_hdmi_pai_unbind()
}

BTW, I suggest the below snippet[1] to bind components.

imx8mp_dw_hdmi_bind()
{
   component_bind_all(); // imx8mp_hdmi_pai_bind()
                         //   set pdata->{enable,disable}_audio
   dw_hdmi_probe(); // hdmi->audio = platform_device_register_full(&pdevinfo);
}

> 
>         if (pdata->enable_audio)
>                 pdata->enable_audio(hdmi,
>                                     hdmi->channels,
>                                     hdmi->sample_width,
>                                     hdmi->sample_rate,
>                                     hdmi->sample_non_pcm,
>                                     hdmi->sample_iec958);
> 
> 
>>

[...]

>>> +     return component_add(dev, &imx8mp_hdmi_pai_ops);
>>
>> Imagine that users could enable this driver without enabling imx8mp-hdmi-tx
>> driver, you may add the component in this probe() callback only and move all
>> the other stuff to bind() callback to avoid unnecessary things being done here.
> 
> component helper functions don't have such dependency that the aggregate
> driver or component driver must be probed or not.  if imx8mp-hdmi-tx is not
> enabled, there is no problem, just the bind() callback is not called.

I meant I'd write imx8mp_hdmi_pai_probe() as below snippet and do all the
other stuff in imx8mp_hdmi_pai_bind().  This ensures minimum things are done
in imx8mp_hdmi_pai_probe() if imx8mp-hdmi-tx doesn't probe.

static int imx8mp_hdmi_pai_probe(struct platform_device *pdev)
{
        return component_add(&pdev->dev, &imx8mp_hdmi_pai_ops);
}

> 
>>
>>> +}
>>> +
>>> +static void imx8mp_hdmi_pai_remove(struct platform_device *pdev)
>>> +{
>>> +     component_del(&pdev->dev, &imx8mp_hdmi_pai_ops);
>>> +}
>>> +
>>> +static const struct of_device_id imx8mp_hdmi_pai_of_table[] = {
>>> +     { .compatible = "fsl,imx8mp-hdmi-pai" },
>>> +     { /* Sentinel */ }
>>> +};
>>> +MODULE_DEVICE_TABLE(of, imx8mp_hdmi_pai_of_table);
>>> +
>>> +static struct platform_driver imx8mp_hdmi_pai_platform_driver = {
>>> +     .probe          = imx8mp_hdmi_pai_probe,
>>> +     .remove         = imx8mp_hdmi_pai_remove,
>>> +     .driver         = {
>>> +             .name   = "imx8mp-hdmi-pai",
>>> +             .of_match_table = imx8mp_hdmi_pai_of_table,
>>> +     },
>>> +};
>>> +module_platform_driver(imx8mp_hdmi_pai_platform_driver);
>>> +
>>> +MODULE_DESCRIPTION("i.MX8MP HDMI PAI driver");
>>> +MODULE_LICENSE("GPL");
>>> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
>>> index 1e7a789ec289..ee08084d2394 100644
>>> --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
>>> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
>>> @@ -5,11 +5,13 @@
>>>   */
>>>
>>>  #include <linux/clk.h>
>>> +#include <linux/component.h>
>>>  #include <linux/mod_devicetable.h>
>>>  #include <linux/module.h>
>>>  #include <linux/platform_device.h>
>>>  #include <drm/bridge/dw_hdmi.h>
>>>  #include <drm/drm_modes.h>
>>> +#include <drm/drm_of.h>
>>>
>>>  struct imx8mp_hdmi {
>>>       struct dw_hdmi_plat_data plat_data;
>>> @@ -79,11 +81,46 @@ static const struct dw_hdmi_phy_ops imx8mp_hdmi_phy_ops = {
>>>       .update_hpd     = dw_hdmi_phy_update_hpd,
>>>  };
>>>
>>> +static int imx8mp_dw_hdmi_bind(struct device *dev)
>>> +{
>>> +     struct dw_hdmi_plat_data *plat_data;
>>> +     struct imx8mp_hdmi *hdmi;
>>> +     int ret;
>>> +
>>> +     hdmi = dev_get_drvdata(dev);
>>> +     plat_data = &hdmi->plat_data;
>>> +
>>> +     ret = component_bind_all(dev, plat_data);
>>> +     if (ret)
>>> +             return dev_err_probe(dev, ret, "component_bind_all failed!\n");
>>
>> As component_bind_all() would bind imx8mp-hdmi-pai and hence set
>> {enable,disable}_audio callbacks, you need to call dw_hdmi_probe() after
>> component_bind_all() instead of too early in probe() callback.
> 
> There is no such dependency.
> Maybe you mixed the hdmi->enable_audio() with pdata->enable_audio().

As the above snippet[1] shows, once dw_hdmi_probe() registers audio device,
the audio device could be functional soon after audio driver probes, hence
hdmi->enable_audio() would be called and hence pdata->enable_audio() would
be called. So, you need to set pdata->enable_audio() before dw_hdmi_probe()
is called, otherwise pdata->enable_audio could be NULL when is called by
audio driver.

[...]

>>> +     remote = of_graph_get_remote_node(pdev->dev.of_node, 2, 0);
>>> +     if (remote && of_device_is_available(remote)) {
>>
>> Doesn't of_graph_get_remote_node() ensure that remote is avaiable?
> 
> No.  'remote' is the node,  not the 'device'.

See of_device_is_available() is called by of_graph_get_remote_node():

struct device_node *of_graph_get_remote_node(const struct device_node *node,     
                                             u32 port, u32 endpoint)             
{                                                                                
        struct device_node *endpoint_node, *remote;                              
                                                                                 
        endpoint_node = of_graph_get_endpoint_by_regs(node, port, endpoint);     
        if (!endpoint_node) {                                                    
                pr_debug("no valid endpoint (%d, %d) for node %pOF\n",           
                         port, endpoint, node);                                  
                return NULL;                                                     
        }                                                                        
                                                                                 
        remote = of_graph_get_remote_port_parent(endpoint_node);                 
        of_node_put(endpoint_node);                                              
        if (!remote) {                                                           
                pr_debug("no valid remote node\n");                              
                return NULL;                                                     
        }                                                                        
                                                                                 
        if (!of_device_is_available(remote)) {                                   
             ^~~~~~~~~~~~~~~~~~~~~~
                pr_debug("not available for remote node\n");                     
                of_node_put(remote);                                             
                return NULL;                                                     
        }                                                                        
                                                                                 
        return remote;                                                           
}                                                                                
EXPORT_SYMBOL(of_graph_get_remote_node);      

> 
>>
>>> +             drm_of_component_match_add(dev, &match, component_compare_of, remote);
>>> +
>>> +             of_node_put(remote);
>>> +
>>> +             ret = component_master_add_with_match(dev, &imx8mp_dw_hdmi_ops, match);
>>> +             if (ret)
>>> +                     dev_warn(dev, "Unable to register aggregate driver\n");
>>> +             /*
>>> +              * This audio function is optional for avoid blocking display.
>>> +              * So just print warning message and no error is returned.
>>
>> No, since PAI node is available here, it has to be bound.  Yet you still need
>> to properly handle the case where PAI node is inavailable.
> 
> This is for aggregate driver registration,  not for bind()
> 
> The bind() is called after both drivers have been registered.  again there is no
> dependency for both aggregate driver and component driver should be
> registered or probed.

Sorry for not being clear about my previous wording.  I meant since PAI node is
available here, component_master_add_with_match() must be called to register
the master and if it fails to register it, imx8mp_dw_hdmi_probe() should return
proper error code, not 0.

-- 
Regards,
Liu Ying

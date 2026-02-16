Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNZtLQGnk2ly7QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 00:23:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E7C148107
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 00:23:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03CAE10E40D;
	Mon, 16 Feb 2026 23:23:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="IVU2yros";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011070.outbound.protection.outlook.com [52.101.65.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D27510E18A
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 15:02:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Arg9wXk7/hmmS8mvXQtSoOq5t/bPwJPZbouKAV4vUIbH6nbifA6sKOzj6N+h+oIjfbcF5M99qSXCAfd1Gl8wNf9GnLxZWiLQ8Wekcb9M8pd8ha2YYu3nNbj1kXssj3H03ViueVxO7dfEMg5lo+/N4ZCXnh/p1iJStroQePDmwVikrGFCyNkdoRmBgxM6Dog4ufNAmhsNqYDt7Nh69CTkYHK3o4G21ILmNnDBFwSbnC2CZh/JlQjkxxKPBUjrQ9bwPbc6H+/wePJn0uwlrGXftup6CTe4AiE6YpBzGkXqdXNA2erYZXa8TuOyinBs9tvFITx39kxVKXDVXIO1pilNMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W64Q13eCvXOVwz2qaZ+ugzyvOrLsOaHt3rdulLfSpQY=;
 b=Kxhw3dS+WvbSIxLatOfcGBEMP03zafTGBGSfkZhn8qwALm35Pqt7DZBRMCt52okqVXnwsOnGmFY0siLxpz83iAS7jsPjiQyIqJ20HDrvq2b17+H/lAVccHYG9gfbEoo9JEuV5EMNArMDS830yq60SNHDK2oCNcggwgj1ickRH0Y+ixjFoz0OLwyFxZxXKWeTMg/6tTQ6XS/mqK00yUjg23vqvXYqwgo6H7iEk4dKGVZuYJyVlXQ5dywpic2sNxU0jrWjUjXCX2Oo7nLWKvmoiYfkn7IVH3Y5EdpmZ3Mu4DvLF4ZylAQpa34NFR9EKtCMyIqVwTp+YsNH6jgiFibigw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W64Q13eCvXOVwz2qaZ+ugzyvOrLsOaHt3rdulLfSpQY=;
 b=IVU2yrosu1Z2AYLIdi52J7qRch3lhKI4aGyqKeEzWg/oxnZlV9fpAKcCcSDxZ0st8CQ971JEOKazCK7mj/vU3+AYKclOOAPP367vpyu84U7hBfS/U2Imwubk71E9L1jqowoiQ1fI6yZQk/quhfXApSQrY4RS0OgDHAlBknBLEmoqW4UU8/Hdxm0g74nALGnLEVCdAaP4MXFDrsnAunfg+fMZPQttXFT3qNADLvrgSRHrba7X5qNzz1kIG9JjiEZgaI7gZGzPJO3gcxWlUT0uZWu2cYLO3SY38elUTacTnVPo+5D4qFTUM1ysi2oinlwDiUgZ/4KltmJ0qEktrzHgzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA4PR04MB9224.eurprd04.prod.outlook.com (2603:10a6:102:2a3::5)
 by MRWPR04MB12380.eurprd04.prod.outlook.com (2603:10a6:501:83::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 15:02:29 +0000
Received: from PA4PR04MB9224.eurprd04.prod.outlook.com
 ([fe80::8e54:4d38:df79:fd63]) by PA4PR04MB9224.eurprd04.prod.outlook.com
 ([fe80::8e54:4d38:df79:fd63%7]) with mapi id 15.20.9587.017; Mon, 16 Feb 2026
 15:02:29 +0000
From: Larisa Grigore <larisa.grigore@oss.nxp.com>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, chester62515@gmail.com, cosmin.stoica@nxp.com,
 adrian.nitu@freescale.com, stefan-gabriel.mirea@nxp.com,
 Mihaela.Martinas@freescale.com
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 s32@nxp.com, imx@lists.linux.dev, clizzi@redhat.com, aruizrui@redhat.com,
 eballetb@redhat.com, echanude@redhat.com, jkangas@redhat.com,
 Larisa Grigore <larisa.grigore@oss.nxp.com>
Subject: [PATCH 07/13] serial: linflexuart: Revert earlycon workaround
Date: Mon, 16 Feb 2026 16:01:59 +0100
Message-ID: <20260216150205.212318-8-larisa.grigore@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260216150205.212318-1-larisa.grigore@oss.nxp.com>
References: <20260216150205.212318-1-larisa.grigore@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P250CA0008.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::9) To PA4PR04MB9224.eurprd04.prod.outlook.com
 (2603:10a6:102:2a3::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9224:EE_|MRWPR04MB12380:EE_
X-MS-Office365-Filtering-Correlation-Id: b3bd6f17-d50b-4dd5-b935-08de6d6c670f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|19092799006|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UU05bkVLSm4zMnFwbzRURk9nditPYlJZRWlGaUhvSkdOc0xsMzFFRWlDckRZ?=
 =?utf-8?B?Nlh5ZmhEWVZMSVBWSFRRWTVaWWdhbzJkR0pDMHBJa1RrSjR5akp0cFk1ZGpW?=
 =?utf-8?B?MDBCdy9zTHI1NTBKaHJFMkRxS0pyekRZV3B2QVBFUXgvZWxoaXR2NUVtbyto?=
 =?utf-8?B?K1RqcXhYc2hXUmNSb0pLK2h3NUlmNjh0NmJvbXdsWXVsclRtbXRTWHExSzlv?=
 =?utf-8?B?T1FpeWFIYjRlYTRtUTBzbzVWaEI3Y1N5aFJIN1ppdlZpVU8vZ0RPVzJEb3cx?=
 =?utf-8?B?amtvZjFNb0ZlZnhJM29rT2lTK0ppVm1BYVluWmdkTTl3V0VqMWV5ekJzbDho?=
 =?utf-8?B?aktUcm0vV3NmdURkbkFjSVkxaFJNQ1ZZQ0RVeFRUekRnUWZCM0RCZVhqZkZp?=
 =?utf-8?B?WExHS3ROS0pxRDJxZXdIelF0N1V4cE5zLzArN0dLOWp5SHF6Rmp0Mkg3SWFQ?=
 =?utf-8?B?Zzl3RmllN29Jbm4zejlIR0V6VkE3ZXRTTll5N2ZUd1lDNEpuTEJTTDJTNmRL?=
 =?utf-8?B?UmlybklqZkhnRHRjMlU3VTBxSVhuTU96WmtKRGcrdDZYMEFOdTBOYlhMR24v?=
 =?utf-8?B?dzhMVjMvSHFsQUVKM05TQ1krZWEwd2YrYjNuTnNBeUJlQUZ0VTU1ZDRxeC9n?=
 =?utf-8?B?MEZxZHVVRWZkczIyQU8yd1A4TW9VVmNlY2U1c1RnNDNBMTVja3Q1QkxyeGp0?=
 =?utf-8?B?cGxMRm1aUit5R2FHZ0lvTmlBU3BkZlc5bnlSMEFpNmRFUUZLZHRleDdsSWlW?=
 =?utf-8?B?OGkyNjRGU3BTaWdjZ0o0dlVRZUdCTUozZnBzVFdZRTNPTGZxZFV5WkxaeDhs?=
 =?utf-8?B?SGNZMmtvVWQ3b2pHRk1MOWRhU1BEcWN6M3dJZGR3c2U0UzFxS1J0b3VWMmo0?=
 =?utf-8?B?a0owUkUxSlJ1NXJQNU9ONkpyQlpUVzhjQ1MydHd3WTFtcktVNiswYVdxT0ls?=
 =?utf-8?B?cGM5OXJ3UEIzbVpWY0lUTDFHOWUwY2JPWE1TUDIwWnQ2bmZFcURhRmFQZHRy?=
 =?utf-8?B?TFhLM2VpeEhMWXZTZUJhQjJnNDdjQ1RFL3RVdHMxM1pqVEkwd20vMDFTdFNJ?=
 =?utf-8?B?K24zN3Bpeno2bHVlVHBSVTFveGkvZWs3YzNwdGQwY0xNUVJOTjRTNDVQNW01?=
 =?utf-8?B?UjViSmpDZjdwQVZjRXBMU1d4WGFJaldjaElyRGtSSVIwUElBNUJnS2grZTdm?=
 =?utf-8?B?aGFVT1hkOWwxUjFrbUtUOEYvQ1hleGhBV3hxam9na1hoM0tyd2JoRDFEcGNO?=
 =?utf-8?B?SVk2QWx4TExvRENTQkhiR3hxL2M1UHZJTmNOSzJLRlVaT3FKbzJ0ZFl3dHlz?=
 =?utf-8?B?cDZlQlFrVG56OU9HVEsxdEpxS24zNXVYYUlJZ1haSGhFNHQyWUkwYXozYUZw?=
 =?utf-8?B?V01WTVBNS2ZtWWdZUDNWTVh1dFh3bCt5WTBTd2VYeVRpZHk5cjJMZXVUZ2o1?=
 =?utf-8?B?U1F2K2ZhZnZlRDZjRFl6WUkyOXp2TjZ1SDRBV2svNzZTMEhGOWtkd2NxMjVS?=
 =?utf-8?B?QlYvMW4wUk1FR0twRm5jSTVyVUx0Sml1Z0Y4ZWdIQUxINHBDQUc5NVMraDA2?=
 =?utf-8?B?dFAxaGg2RGRiYTlvYzcwMjFucXY1V0xzckh0ZDE1blZUU0RqV0krRUt3NUkw?=
 =?utf-8?B?RG9MczkwZDNNdGY1MkdkbnhNYlBXVjlSOXREM2xSaHZ2S1owdWlZaDg1WTJ2?=
 =?utf-8?B?YjgrVXBrakJmVlNmQlc0S0RoSzhWNXkzbHQ4TzRyTkp5OUZHeU9pR2hobUxp?=
 =?utf-8?B?bTRvVzdKa0JHLytDYmRsUnpFaUlSR3dnaDhESVlMYlF1WFBCZG9BRXV2VFdE?=
 =?utf-8?B?K1krb1ZPMkxZQWF0Vm5PRGxHOWtjaHB4RElDTTEvcjVYU3EvdzBhVmNIdFJG?=
 =?utf-8?B?d0pUd05LK3pvZ3BQMDFRSlRSUGtUNmErT3RodFduTnllNWh4STBablUzMU9M?=
 =?utf-8?B?SUU0aU1QbU9yaGgxYWF1dWVEU3FTaitMUkZVNWJDVTdXS253NXd1NWpaYzVT?=
 =?utf-8?B?WndaZk9mS2FVbFBLU2Y4MTMwcG9TMWJ4QlBmazUyem9zUFhCVWptTlFsWjlF?=
 =?utf-8?B?WVV6L1ZoWlFFbkFRT01PWGlnUmt6bzZWMXlET1NDWHhBUzB2LzA1TkNEOHdn?=
 =?utf-8?B?VS9NS0xzWmRLUDlvd2lYRnpXaVNHTy9mNU9qbkVjZExQSUhUVWFsY0ZxaHA3?=
 =?utf-8?B?UUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB9224.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(19092799006)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THpVcGV3dlVYUnEyVUxUYUo0Z2FBM1hMUkNnaUppQ2hWdXBwb082LzJpVG40?=
 =?utf-8?B?WEV1TGVMdEEyUzFpZkt5YktFWG1INnozbndHWDkyVCtWQk43TXFWTllYQVR0?=
 =?utf-8?B?OWZsOXhiWkxvakhGemxLVm16eHpOVmNWS2JGN3BGUHh5b2M4VjNGL2RjSU9k?=
 =?utf-8?B?Z0kxQmRxVGx4N094SndaaXF1eFRQa3V6WVFWdGRmeGU5UjhjeFpBSEJ3MWhu?=
 =?utf-8?B?anZ4RktCVzk3dVFTakRFQnBBVTRiRXZGVUlWd1lrdWppbGs2L05jQ1Q3OXh6?=
 =?utf-8?B?Z0dsT0V2QldXY2xMUXg3RGtBbDlucXFxS2pkRU93UGJJdGNodkhEbXJkbm1L?=
 =?utf-8?B?dkZWTnNXemtRQkdMdTlkbkxGNFNuYlBGN1NOMUFGcVJ0UWJuRURkQ2E3RWhZ?=
 =?utf-8?B?MkhpTjFPMnZRV3ZsMWc2ZCtFM2Uxdi9yNWtONk5wandYMi9LUVZaV3BFMjFt?=
 =?utf-8?B?NTBXMkpOQURoaWhTTys2QjJvQmM5ZEQrNUt0MlMyZmlCSlVRdFZEWTZTNHNz?=
 =?utf-8?B?bUR2ZzJSSVl2VVhIRXNiSmFydTBVaG5VZGlJeEdPYzh1S1RKWjhiU1I1NVd0?=
 =?utf-8?B?ZzVTblE1Yi90RTVSeTd4LzlCcWJvQm1EMU1Nd2MwdGs1cUh0SmliWmN4TXhU?=
 =?utf-8?B?emJLcm91UkJYZjBPRG1Nc2Z1RnpvL2djVjFFNWdMWGpqa1lSZjBBbnJXdUgz?=
 =?utf-8?B?MDJVeWgxS083NWc2R1A3MkM5bXlmTW5sS1paQVlyaXczL2h3ZlVJekRBcFh1?=
 =?utf-8?B?RzBRMjJ5VFczUzRVTXREMnVmZjYrUFBzclFZKzZYdlNqeEc4VnZxN3RmelFt?=
 =?utf-8?B?ZW1jTTZRNW9ESzFORGZGZzJsckJOR0hwUVZOVkxoMjhWckwwTm54TUtuUjF4?=
 =?utf-8?B?Y0F5VFRHT1I0WnN0ODMza1NDcHNrRElqVkdOSm5IaHdldmEzekQ0YXNnUU8r?=
 =?utf-8?B?djlPSERzeDJoTGJuckFqUGlUU1lPeHU4bVZQWVRXa3hCbHFHWW9HWnVSczlJ?=
 =?utf-8?B?RExNeHpQeHBSUU1WanhLOWR1blhkQmJiWmVLZ1BXVU13WUdvUzVYVmRFS0pP?=
 =?utf-8?B?Q3dYMkF1MTlUNFE0WU9VVUprbldFMnhwRXdKVFVkT0NtRVdDU2EwN1p6ZTE0?=
 =?utf-8?B?STBOQnVZVjdHN3B1ck9rcjM2TzdqYk43T2NiR1Rhd05QeitveDRzZDErWkpa?=
 =?utf-8?B?THJOKysxMzE4Q01GTms4T3liS1FLNkdReUxpa1Zha2I2dEIxR3hMcGo0MTNt?=
 =?utf-8?B?dnk0QUtRUFJ0VFVpTFNpRnB4YmtBK0NnS1NzZVhVcG9EL1ZpRjBvbGYzSmNq?=
 =?utf-8?B?cGc5a1ZVRE1sTHVBK292cklhRElteWlLZVdlMkR5TmNoUWRxa1VhRzRQRnJ4?=
 =?utf-8?B?Ymt0ci9BTXU1OFd5YUxHT1hZbFEzV0NEaHBGV0ZJdS9OZktkanZxY2JOUGto?=
 =?utf-8?B?S0FaM3hQSzF3cjFiWGc2SDI4Q1NsRU5MckthdWJ0MTMxK3ZUVk9tUFJmTlpa?=
 =?utf-8?B?dlVEMk15VnN6eURiN2VSUzljYUMzWnNXcFVSb3k4UWhsSld6Ny9JUUtlSjhV?=
 =?utf-8?B?Y1o0MXFRd2duRk5WbVM5T0NiOTBObXdySEVCYTI5NmdKWUZrNVdxTThOdXlW?=
 =?utf-8?B?T0dPN1FkRlkrb1lCSjZIMjNwL1pOUjhXL1dEUDM0N0hYbjU3eE9kdkFPVzg3?=
 =?utf-8?B?SUxsNW9xVVgrY0NGZEFxZXhPS2t6Vjk5VWROZHZ1TjJYWjE1bGprQ1B2R3B2?=
 =?utf-8?B?cFU4OG8rNzlDYlFHY21XenczQzc4Wll1NUZWaEdUWU1QMnhNSVl4VkNUWlVr?=
 =?utf-8?B?dGtLblUwVGhqMmxDeGk1NHVyWDZ1Z2ZjVFFyVGZzK1VMeFpjOEVxNHJ6N2Ji?=
 =?utf-8?B?RjBuNzJBK1MvOW92ak1oNHpIc0ZadmVzc29tdGV0QWNIejFScnZwV0xzS2Vq?=
 =?utf-8?B?NFBCM1krMXp5OVpnTHZuOTFXVEpmRmhqMVJQR1NRQm56VTdOTzhHTXNjK3VF?=
 =?utf-8?B?OTVrcHk2U2VtMS9mUUl4YzU1Z2tQZ2tVTUxFb2kzcTJydkExeDNVSXVscGI0?=
 =?utf-8?B?RHdkUW1WY0NTV1BvSGRoM1AybXNpOUhyRkV6VmZnR1lrWHJLbDVUZ3F4WWpk?=
 =?utf-8?B?UkdneFg4QVF3eCtuSTZKVG15ZDlzalJ1R1FPTnN0VWRxVjZLZFVTMWl4TlJr?=
 =?utf-8?B?U1FYc1prR0lYU2c3U2Z0NEc4VDNuWE9NdlJ6aWVxdFF2eVdTbEcwQytkRlA4?=
 =?utf-8?B?NWhqZ0pZMmVpamtmNjlGUkZGakVRR3B3U1BUQTdhMll5MDZFems4em8wSUJj?=
 =?utf-8?B?ekRqRWJRODk5emNrWjE4ZWZTcEdQMFgzVGpHZ0FDdkh4cTIwck02VmtBQUhF?=
 =?utf-8?Q?QJGAv3smVVYXiaBM=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3bd6f17-d50b-4dd5-b935-08de6d6c670f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9224.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 15:02:29.1313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4mwPtI6bropyOQJwKTHN0HGtQf/aRmKMesPJw4O7OYjVHzes3OnQIEsmTLPEVXDKEqeJa/AHSSr1mLF9oZxfgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12380
X-Mailman-Approved-At: Mon, 16 Feb 2026 23:23:19 +0000
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
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:chester62515@gmail.com,m:cosmin.stoica@nxp.com,m:adrian.nitu@freescale.com,m:stefan-gabriel.mirea@nxp.com,m:Mihaela.Martinas@freescale.com,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:s32@nxp.com,m:imx@lists.linux.dev,m:clizzi@redhat.com,m:aruizrui@redhat.com,m:eballetb@redhat.com,m:echanude@redhat.com,m:jkangas@redhat.com,m:larisa.grigore@oss.nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,linaro.org,amd.com,gmail.com,nxp.com,freescale.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[larisa.grigore@oss.nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[larisa.grigore@oss.nxp.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 69E7C148107
X-Rspamd-Action: no action

The workaround is no longer needed, as we now wait for the TX FIFO to be
empty before entering INITM mode.
This ensures proper behavior without requiring the previous earlycon
workaround added in commit
09864c1cdf5c ("tty: serial: Add linflexuart driver for S32V234").

Fixes: 09864c1cdf5c ("tty: serial: Add linflexuart driver for S32V234")
Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
---
 drivers/tty/serial/fsl_linflexuart.c | 87 +---------------------------
 1 file changed, 1 insertion(+), 86 deletions(-)

diff --git a/drivers/tty/serial/fsl_linflexuart.c b/drivers/tty/serial/fsl_linflexuart.c
index c1d069dc8089..fb5f325416c0 100644
--- a/drivers/tty/serial/fsl_linflexuart.c
+++ b/drivers/tty/serial/fsl_linflexuart.c
@@ -141,14 +141,6 @@ MODULE_DEVICE_TABLE(of, linflex_dt_ids);
 
 #ifdef CONFIG_SERIAL_FSL_LINFLEXUART_CONSOLE
 static struct uart_port *earlycon_port;
-static bool linflex_earlycon_same_instance;
-static DEFINE_SPINLOCK(init_lock);
-static bool during_init;
-
-static struct {
-	char *content;
-	unsigned int len, cap;
-} earlycon_buf;
 #endif
 
 static inline void linflex_wait_tx_fifo_empty(struct uart_port *port)
@@ -619,48 +611,6 @@ static void linflex_console_putchar(struct uart_port *port, unsigned char ch)
 	}
 }
 
-static void linflex_earlycon_putchar(struct uart_port *port, unsigned char ch)
-{
-	unsigned long flags;
-	char *ret;
-
-	if (!linflex_earlycon_same_instance) {
-		linflex_console_putchar(port, ch);
-		return;
-	}
-
-	spin_lock_irqsave(&init_lock, flags);
-	if (!during_init)
-		goto outside_init;
-
-	if (earlycon_buf.len >= 1 << CONFIG_LOG_BUF_SHIFT)
-		goto init_release;
-
-	if (!earlycon_buf.cap) {
-		earlycon_buf.content = kmalloc(EARLYCON_BUFFER_INITIAL_CAP,
-					       GFP_ATOMIC);
-		earlycon_buf.cap = earlycon_buf.content ?
-				   EARLYCON_BUFFER_INITIAL_CAP : 0;
-	} else if (earlycon_buf.len == earlycon_buf.cap) {
-		ret = krealloc(earlycon_buf.content, earlycon_buf.cap << 1,
-			       GFP_ATOMIC);
-		if (ret) {
-			earlycon_buf.content = ret;
-			earlycon_buf.cap <<= 1;
-		}
-	}
-
-	if (earlycon_buf.len < earlycon_buf.cap)
-		earlycon_buf.content[earlycon_buf.len++] = ch;
-
-	goto init_release;
-
-outside_init:
-	linflex_console_putchar(port, ch);
-init_release:
-	spin_unlock_irqrestore(&init_lock, flags);
-}
-
 static void linflex_string_write(struct uart_port *sport, const char *s,
 				 unsigned int count)
 {
@@ -739,8 +689,6 @@ static int __init linflex_console_setup(struct console *co, char *options)
 	int parity = 'n';
 	int flow = 'n';
 	int ret;
-	int i;
-	unsigned long flags;
 	/*
 	 * check whether an invalid uart number has been specified, and
 	 * if so, search for the first available port that does have
@@ -758,43 +706,10 @@ static int __init linflex_console_setup(struct console *co, char *options)
 	else
 		linflex_console_get_options(sport, &parity, &bits);
 
-	if (earlycon_port && sport->mapbase == earlycon_port->mapbase) {
-		linflex_earlycon_same_instance = true;
-
-		spin_lock_irqsave(&init_lock, flags);
-		during_init = true;
-		spin_unlock_irqrestore(&init_lock, flags);
-
-		/* Workaround for character loss or output of many invalid
-		 * characters, when INIT mode is entered shortly after a
-		 * character has just been printed.
-		 */
-		udelay(PREINIT_DELAY);
-	}
-
 	linflex_setup_watermark(sport);
 
 	ret = uart_set_options(sport, co, baud, parity, bits, flow);
 
-	if (!linflex_earlycon_same_instance)
-		goto done;
-
-	spin_lock_irqsave(&init_lock, flags);
-
-	/* Emptying buffer */
-	if (earlycon_buf.len) {
-		for (i = 0; i < earlycon_buf.len; i++)
-			linflex_console_putchar(earlycon_port,
-				earlycon_buf.content[i]);
-
-		kfree(earlycon_buf.content);
-		earlycon_buf.len = 0;
-	}
-
-	during_init = false;
-	spin_unlock_irqrestore(&init_lock, flags);
-
-done:
 	return ret;
 }
 
@@ -814,7 +729,7 @@ static void linflex_earlycon_write(struct console *con, const char *s,
 {
 	struct earlycon_device *dev = con->data;
 
-	uart_console_write(&dev->port, s, n, linflex_earlycon_putchar);
+	uart_console_write(&dev->port, s, n, linflex_console_putchar);
 }
 
 static int __init linflex_early_console_setup(struct earlycon_device *device,
-- 
2.47.0


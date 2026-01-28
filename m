Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMuHLEZreWmPwwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 02:49:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E356C9C0AA
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 02:49:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DAB010E5E1;
	Wed, 28 Jan 2026 01:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="PGLCBTGy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011040.outbound.protection.outlook.com [52.101.70.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36CCC10E5E1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 01:49:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dtczWgs4M3uStbLoXF0xvdNJVMB8AzCkd1Hvw0ID3plwAJdcv45HljRGiVDvVj+N+Ph8Bax5XeDHoGTJoC2Z8oq/asiVW+O8ZKdVRuqa2O4T40dZSfP5OwigsSPxa5Q8A6cpaEUuBG4tw6nRgGoUB8m8Lm2mSTv4HvH9IQ/yeaGSG33pjeaU6izPkekSirB3oR5UnYkgYNNyLMXjeqkQo9DiLbfL6jHmmLre5/PGYoXPWDWxEySeG5z/n+5s396c5ctvEqzVbNr9NRoLjwtL81v3ARl+Op4l2G9aRE4z4fEtbQ076jKsdKj4VXPDaUhavLL7/n6Ks6PURWD/mNmLxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQ5hl6wodZ1nqUFjX+7oNh1cxV7h6TG5eWtn25Aj/Jo=;
 b=mQRVXwT8INHbaT2EsKsBCE/zSL0Hpd/Np2mKESyIuzmQ/eWJvURJf2olupEQ0HjTNwGNRQYZsJwsxg1sGy5qFWrlvyd6iNhy7clSOOP3Z7SEbbajs8n9H0PO/gjJSLzrI8Dowed2IJDxjX8AgppPhj8bPcsykFXO+lT6LMCh6LuuGjLnEpCVMEU+K2vvb4z/K6pisQF78NhKHz2rHAxMFPUjHaG4dW7KyPpw8vl6nBxMd8XtfG/11r4B8LG/GHqD0XUlUdafi1An3oJGnoBjz0shf+KnEG1Mq/lj4Z9sJ+yc/ojGZ3tqM2y4UVMvd/FonpWWpVt2cwgsgrVz7tGKnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQ5hl6wodZ1nqUFjX+7oNh1cxV7h6TG5eWtn25Aj/Jo=;
 b=PGLCBTGyPUJ2HzLrqUhKG3fBLvoimWQBcDK1xbxqkBUxmomwoX0LSuNgXGBrxHAyCRM+UUfAi1WlluTpx3JDF2M+1KyCY2945h3IJyKzAS5SJKO7P3/gEY1IvLAjVt/zQcNxfFpU4wbEyASnQJchNaspwna63JRL+susoBaE2amOeHVDR9ZCpJqaDT4gsZQOUA1eDcdc6uiR9q31gy2TgQH6dJPc4zIAosHxZ2upqdHA3E++c2ZL/3rCfcSirKxZUdC2ndPYYvqws9Qkl15vLEW2/jiFE7rn909P1Ej1V5ePE+nJ/Pbi88U2JXcyRWm5274SoHwwn0dSncvBegtLRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB10209.eurprd04.prod.outlook.com (2603:10a6:800:244::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 01:49:48 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9542.015; Wed, 28 Jan 2026
 01:49:48 +0000
Message-ID: <f11d4407-9951-40a3-bde5-583ca1ca5bc5@nxp.com>
Date: Wed, 28 Jan 2026 09:50:38 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH 0/3] drm/bridge: imx: A few fixes
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260123-imx8qxp-drm-bridge-fixes-v1-0-8bb85ada5866@nxp.com>
 <176951374753.94588.10653964166300906894.b4-ty@bootlin.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <176951374753.94588.10653964166300906894.b4-ty@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0038.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::15) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB10209:EE_
X-MS-Office365-Filtering-Correlation-Id: b3a47369-f1e8-46cf-2c1e-08de5e0f850a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|19092799006|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Yk1LQ0FVR1h6R05YTzVCWk11b1lEK2dUZENGUjF6R3VzK3cwQ1VmR0xHM1Vy?=
 =?utf-8?B?d1lreEQ2cWVLNjl1L0ZwUUE4K2R5Z1ZQZXQvRVNYd0t2bVVyR1I5dzNtdDJn?=
 =?utf-8?B?Vjgrbk45NGF2VXRSSFBucVRpbFpDelI0NWpScUs2ZDd0L2dtUzlEM0NMSjNB?=
 =?utf-8?B?NEcwa1h2NjV0RXIvR2dsK0pFNjhPV053Q3ZqMUlsT2gyUEhTcVc5K2tiajRL?=
 =?utf-8?B?dDN1L1djZGo2Z2NtMVRFWGlPc1lhUE1GQkZFT0pVQVhYdGlNeDE1WHRnMEM2?=
 =?utf-8?B?Y2RZYzY5aWdxSDFvZGxWVGd1TC9FYmpCYVdoZDFMblBMbTkxdG51T0ltRXZK?=
 =?utf-8?B?K29GMHFwcTNCMnVDelNlUjdYMWlPNnNKYzFTWVFRZ2FqZEpDSW51ZFJjRUlN?=
 =?utf-8?B?NVlGczJ3L2hmU0Ira2E0eHIvUCs4blNEOWl0WVFhenE3c2VBNWNvWGdqVU13?=
 =?utf-8?B?L1FCelVMcjZpc04wUXAzd2Y3bmxoNUpVL2NBNmY1MmJaaGRPYjlxODZ1VHRk?=
 =?utf-8?B?Y1BLekZpekJVVGxhK3NRUURBY1Q3dTVrWnJwb0dZMldlK3pldXBOdmEraGY0?=
 =?utf-8?B?d2ZiUzJKeHk5eDBpaWpJWGkzR2loUWpsbjNqeXZDaHpmWlN2S28zK3cxME5C?=
 =?utf-8?B?d2NpOEdEVGFaM0IrV1RUQlBGM2NKRTM1WUlKeVJIODcrTVljbVJKZU9HRmZi?=
 =?utf-8?B?NWM4alJLMmFEYXZhOEllWHJEWVorOElTNnBqWDN1T1MvM2U5T0d6d1FFdnl1?=
 =?utf-8?B?WitXb0VzSDNrRGVtTE5KSHRza0NiK0JOaXhJSkNsRU9iQU1RM3IvVUhYSUZy?=
 =?utf-8?B?NDF4WmpOOHc2a1N0R0pnZTBtVGtYKzlzdVViWEkrZXVOaVIxcUQyWW4ydzhj?=
 =?utf-8?B?OFV4bFJ2bnh3N24xOENoWGRvTFRTcjRKcWpzY2ZZNm5aM3lxK1pRTHJLMEha?=
 =?utf-8?B?MDZ2K0NKYm1YZW5WZHFqbDJFd1R3RkdYVVFMQlRlQkIzajhvODVNdVBlUmVt?=
 =?utf-8?B?dHJOZk4yS0JuQlh4VHhOSHdTdENGaVNjVFlIUVBvdkpXYmFhMWlyWDdCQTBy?=
 =?utf-8?B?SWE5R1huclJhN0paNHRGQ2kyS29lc2hDakFlN2haSXdhd2xZV2xVVUh3VXJ6?=
 =?utf-8?B?dDJJdnRTV1BuT2ljS0NoQXE2UWRrTDcrTURIMEdpaVlRd2Frb0YvR1Zrb0d6?=
 =?utf-8?B?YnVDR3VMSC9lNERmeVpwRHhub3BHUXVoUytKVi9RVVNTaWc5cGhEQ29INWJa?=
 =?utf-8?B?QUN0Z2czVlFNZE4yWm9PcmJDQnlWaC9uMi84Tnk0U1FheElLeEJjK3crcmZs?=
 =?utf-8?B?MEphMGpHWGQxb3hIOFhwaHM1WlJSbXNMZnI0eGlCbHQ1SGxkaEJCbllObXhB?=
 =?utf-8?B?ektidlhrQVpSUm4vN0NFMk93cXFBRVY1bTE5Ym5VZ3RjY2R6QTQ0SWR4K3Vn?=
 =?utf-8?B?SnNWaG1PN2pYVjBKQWlmK3cyeTRrajVjeERsTjFjcWNrVmcweFlRYzNPOG03?=
 =?utf-8?B?T3U5UXpTR2hRV0Z2ZWpVdlhJdVNyaWQxMWlQNCtzRE5GU09mTGl1dU5waGt3?=
 =?utf-8?B?d25VWGNHenAyeHZKdGNGS2NEUzBQaXRpQ1cxdUhIalRHY3k1YVBKbUg0eGJY?=
 =?utf-8?B?QytqVWZoYXpKenNhQ1JyZ04zS094c1MzMWFHVmE5OUE0RWZQMnhOMDZOT1U4?=
 =?utf-8?B?clhTRzk4MTZqNzBldUlzM2lHVmh2c1ZPVjRlYU5Ic0hKSm9ZaUNyWGRKRU9n?=
 =?utf-8?B?TU81TGRIUGgvaXlGM3AvSVVhN09WMHh6ODFoV295RTdkdUsrc2h5MzhVeC9B?=
 =?utf-8?B?RW00TUJySTdJUnppZkVQMmVHRUtsSUo5SVdLem5GeHRodkZFU0JzSTM2UkEw?=
 =?utf-8?B?ZTlCUXZld2dYWXZpK0RaQ2IxdFJHaEx4Z25hbDNnaHdPVzlDSlVGcXF2RHh0?=
 =?utf-8?B?WTc2amg0VFRCY04wTS91Qk9yVFlqV1Jrd2pGK3dBQ3ArQmNJM1MyVHRENUxs?=
 =?utf-8?B?ZEtRQndmbzNEQmFqQVZNSEpkUDQ0LzMxeVRwNWxNTFIrdzdOa0lrRG9udTNO?=
 =?utf-8?B?MmJ1bjVSeTJYeXJ1T253b0NjZWY3eDhzM0ZRaGo2NXBmcVdDb3FEaUcwQmdF?=
 =?utf-8?B?WG5CM0tUNlJNMWNPSWVFZmF2djFXRit0WDltYTRrNm0xNzlJZlR6YThhV1di?=
 =?utf-8?B?MEE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(19092799006)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N25QdktJQ09JdUl2bndER2F6WFdVaDcwelEwb2NLQ2RRSEJFWlNmV1B1Z1A5?=
 =?utf-8?B?NTdkWjFLR1dLNWRRYkI3NXNwV2U3RGIwVm14NFppTnJRdGpSYXhmNVhVczRO?=
 =?utf-8?B?SlhKZy9oN3dsWmxnbkgyalBpbURoQWpib01xNEg2Q3BTT2tiSjlsQmZMM29C?=
 =?utf-8?B?Ukp0MHBMSnVNR0daYzBTU0wwS1JVK2tYelpkdzRIb1hFT0hvNDNyeTNqa2Nx?=
 =?utf-8?B?YmM4UmxMMTEyanBQay9USFV1T3hCQTdiMkh6Nys5cmdXeUhRNjR2TzBpV0da?=
 =?utf-8?B?QU5RSDAvU1RJVlRFUVpJNDgvUmdFcGF3U3l3aGV5dW4xTXRINHdlTlNKMm50?=
 =?utf-8?B?czg3M052cUVmSVdGdEtzaWdzaHpLNjIwN2FzZXlTV0ZMQzlZT29IZHVpUTRP?=
 =?utf-8?B?OHZzR0gyR0xGWklFNjkvQkhOTWlZZ1Q5U1o4M0hrVTBETTlHdjlaUlNZVVQ5?=
 =?utf-8?B?TFNoY202QklUd1FFZ3V3WXo1SkQxak93NGV5OXhseW4rQVRlNU1nYis2cHJX?=
 =?utf-8?B?eSs1azQwSzVWS0xNREFZSVFYaE4vS1lrTWhjRk5oalhXeStHZCtNc3V4KzJh?=
 =?utf-8?B?eXlHVlRaYWRjQTM5QVpkRi9MMW1yYTZxL0ZaeG1YaHg0czFWVFhFZVhxeWYw?=
 =?utf-8?B?M2VCZmwweUZleGpMcTFFZGQxNG1wSS8wVGd3cE5WRG13L1ozOFFZZFdUZlJw?=
 =?utf-8?B?RVgxSUl1U1d5QXNGVXdZODFHQUdzM0JVMGxBT0JBMVo1TndrS1hOSUpObzJQ?=
 =?utf-8?B?VzFBdHhIeE1Gc2U3T1NSTWdYZWhtcnM4ZXArMndSZXpnc2QrL2c1SEdrSkUz?=
 =?utf-8?B?ODFrd3JOZDhjdGx2ZU5UZUg5eEdBNVFEaHdRODRFRHY5T2gxQVU5akZjWGhm?=
 =?utf-8?B?RkZWRnhoZUxlYzVkVDI1bU5LV3hlUzJEQlhQWnlFQU0rbnhpaUpadEF2a1do?=
 =?utf-8?B?SlhDdisxUlFzWldreDJQaWhvTTl6REZEWmlDM1h6bll4ZEVLVmV0UjRuSGJa?=
 =?utf-8?B?cS9OY2w4Zm5KTlM3S1BKL2UzRDhIdWlnRjZtMGRPdVpoMXZuaDJ6S2hBRGJ1?=
 =?utf-8?B?bUpaQlpIVFJpS2gxeEVnay9pZzFtVlA5aytLZFlhRU1jYmI1REpmblYzUUp1?=
 =?utf-8?B?eWhoOWEzajFIZlZGV1EvbGFEMDJqK0xESVIxYmNMQWwzb3MraTRJR1F4OUFy?=
 =?utf-8?B?QlZMMWFrTUpoRnpJSTNrS3o4cHFvcmJxTk94WkRtMUZNVHN5VXYwMFJZVjRG?=
 =?utf-8?B?UStSYlRTOHBrcjlqeFloek9WV1BGby9jRmJESFpaTVVONFRzejFwWkxER2FS?=
 =?utf-8?B?aG5kRmxsaENHUzhHWkN6OFp3YjZXdmxQRGNpZVRVMFRMUHBVaDdtak5nKzRh?=
 =?utf-8?B?VndsWm9ubFJ5Yk9lc2I1YWhHcytQM0Nza1ZCYnpGTEZYZjl5TWVwRWxIdCty?=
 =?utf-8?B?dDk3UTZyYkNjY09mY092L0cxOVYyTE5TQnBoejFVVTVGalhxTXB2ai82a0d1?=
 =?utf-8?B?NzY3RFJ3ZVRHL040bmdNaFAxQytQY2N4N01Xa3diZS8yS1RrQWw1UXlQR2xs?=
 =?utf-8?B?U015VEcyVVQydkNUdUExaWtLVy9GME5GQmc0YWh3SUNyOU1IUE5YcGtDTlYy?=
 =?utf-8?B?RFF2LzkxZUhIVDhVeDVhcURwM0pKMCt3c0RINms1bk5DQWsyZWxTVUpCelFE?=
 =?utf-8?B?YjFBZEZUUngyOS9PY0JWbTUvK3QyNTdDWm10ZW1raW01ckVGRDVlWW9KdFA2?=
 =?utf-8?B?VzByRDUrTWJCdW1CMnVreTJxOSt3bUJsMTB0UXlqd05mak5rWVZ6TEp5YlNw?=
 =?utf-8?B?OVpORzE3c2pUck9yVjROSHROQ1NGRDBzdnZJNGV3UThDM0pxRGx3WWJnY2o4?=
 =?utf-8?B?SUs4R1MyYVFraDVLZStyUlQyK0dLZHdSZnJCOFVhSUhvVWt0RGtHT1RpMHBL?=
 =?utf-8?B?ZWRudjBjTWJaWGJwTzhIb1Y1NEtkQXFQUjBEMENJT1pRaU9CcG16OVVUWkpV?=
 =?utf-8?B?WVM5RzdmejJGVFlwS0lsTE0vOFZBNXdjQ29raXlwVzVBNmQ4VnpsaWVacHVa?=
 =?utf-8?B?ZW1xemkvZFkrQllWQno0cWFScmlZeTh3OURlaDBMQTFVV3BBeGFHdGl5UnYv?=
 =?utf-8?B?OWw0MVlaRlFQanhudFM1UmJwNzM4MExySGJMREVTMTRmVU4vT3JHL3ZpOGQ1?=
 =?utf-8?B?RDlDb2tiSUt6d0cvYVFtdHp0RC9XU3lOY1FGQ2lORlJIRVFpYW9FeFVZMXpr?=
 =?utf-8?B?bDQ2Tk1SQWc3Wm13bTI0MUpTcnB5UC9paTRnMlBjdUpIam1wazRNSmtoRWVN?=
 =?utf-8?B?eFdIWUJZVmtxK1FIVzhRcVZjaFZCc3lqWkdiaUcwTGt2K1Y2SE9uZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3a47369-f1e8-46cf-2c1e-08de5e0f850a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 01:49:48.4514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tUOJpMmbf49VmKKbAXVFW5rKiBOHEO/fLxcWY0J70gtLhbFFotMJpKvIvRQ748EX8vfWHeZwOnIAVUjlH98aCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10209
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[bootlin.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,pengutronix.de];
	FORGED_SENDER(0.00)[victor.liu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:luca.ceresoli@bootlin.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[victor.liu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E356C9C0AA
X-Rspamd-Action: no action

Hi Luca,

On Tue, Jan 27, 2026 at 12:35:47PM +0100, Luca Ceresoli wrote:
> 
> On Fri, 23 Jan 2026 17:22:14 +0800, Liu Ying wrote:
>> This patch series contains 3 bug fixes for i.MX8QXP DRM bridges.
>> Each patch fixes a NULL pointer dereference issue and stands alone.
>>
>>
> 
> Applied, thanks!
> 
> [1/3] drm/bridge: imx8qxp-ldb: Fix NULL pointer dereference in imx8qxp_ldb_bridge_destroy()
>       commit: 852c68bf42965ee38b465d2d6f7b965eb0b5dc1d
> [2/3] drm/bridge: imx8qxp-pxl2dpi: Fix NULL pointer dereference in imx8qxp_pxl2dpi_bridge_destroy()
>       commit: db7e7ea838c916ee4cdf26bee126fd36f58295dc

Any reason why patch 3/3 is not applied?

> 
> Best regards,

-- 
Regards,
Liu Ying

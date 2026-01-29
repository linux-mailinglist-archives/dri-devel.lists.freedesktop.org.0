Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODCrAOkQe2nqAwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:48:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 635B4ACF70
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:48:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C12D310E309;
	Thu, 29 Jan 2026 07:48:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="EeXhvbq7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013004.outbound.protection.outlook.com [52.101.72.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F21B10E309
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 07:48:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ibA2cjE01qMLPWpovzkdWwFQIQKfprNpuwx6+sU9uKPHvzdRKJdsrMrELFfHcQF4jzRNPRJL4vDTKHW3HXmNYSw1132sG8MHtU1XsW+b3phOqIngT835qUEPMWp6Nme5Pb/ZAFEd2U9PoznAyf8nDBYJhJIGGE42kDxTjVs3HtFMXFt9FgOA2Hpe8laQj3gEgDYV4INpYij85+Uu6KXgeEZ8MSD4D3A/TdroxkC3vQlMR6wRXV7974nDoZ1XGMy++zo0xoly14F0Y91d+plf/O0/IN9TucKsxFhn5ZM9pcSC0M/pbPnli1TUGfI3tKgGfDAFL5eA7UN7X+BJTro9Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EYmJDKfOyvOm7RckdRLEcfelenkthBapr4l3QtXebL0=;
 b=f7JkbqjIdvwWiYmpWgOChHHvVjdoV+/NKWcUeSiE2zHam3DpqO/LAccWeBVO6yhAU+XD962asA2yfTWspVgc2UHpTsnJu0hV9XrmN4rR7fE7F+EH5eJoC2I8kDs63BQtuVae+i/eLMO0mrH8fJf8Zf//UUSy36sC4lfKbELJEWabJ5ZFDFEFmqkeFrhNzDxh6D/AkzAvY0HpADiw8n3k1SkJ/M8ZAwKFRAxe8fGAetM6ERjjE1pYmsIRx492eDstaKuGUc6GaE+DCKxHlPv7Vdjh82FVimybE/3HiPLjlecJ0zwWnF5Ii2Jm787zTBgnATFYtqgLJjAwZ8OngLF7Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EYmJDKfOyvOm7RckdRLEcfelenkthBapr4l3QtXebL0=;
 b=EeXhvbq7NK9rYi8B8q3ymQX+77xa8tXtq5JRz6y0MRyhvMZBxf8S8XXyzEHetpVSD2bFsDtDjte1cbmThYmB5MDJI7BaGbH7glpYWj8LB0KHiIhM7fciK+yr95H7aBNhPXgMWYlpBhcshY/niCF1anAbm4PIdAjUETnN3p9dhA3EIAwW9rRQwM0+Z3W+Ne4o6ZUFmxf8YsoLnA8qg5WWh0Z5py2V8r2wu1OcGnlFsvPvHjCfAaT/08GEhyvWoIXkSJ1AnVf5DiuN+zGtfDynmegT9tAtI1gS082sCJNszmzvNuPsIZyyBF9j97YO2vMmwo2eLvnY1UVPgIwRdgSW0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8948.eurprd04.prod.outlook.com (2603:10a6:20b:42f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 07:48:49 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9542.015; Thu, 29 Jan 2026
 07:48:49 +0000
Message-ID: <d0836d04-d15d-45de-a765-bacad9e7759a@nxp.com>
Date: Thu, 29 Jan 2026 15:49:38 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] drm/bridge: imx8qxp-pixel-link: get/put the next
 bridge
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
Cc: Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-0-a62b4399a6bf@bootlin.com>
 <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-4-a62b4399a6bf@bootlin.com>
 <e2536229-f8d9-4d65-8211-cf445677bef2@nxp.com>
 <DFYQ7TS25SQT.2F7NBYOP8P5R4@bootlin.com>
 <efeb3583-dd0c-4e91-bbfc-54b04644f2c2@nxp.com>
 <DG0CHD0TAH9A.27UW4KKY2O9V7@bootlin.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <DG0CHD0TAH9A.27UW4KKY2O9V7@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0070.apcprd02.prod.outlook.com
 (2603:1096:4:54::34) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8948:EE_
X-MS-Office365-Filtering-Correlation-Id: e0b1dee5-5e61-4ce4-84ec-08de5f0ad6ab
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|19092799006|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N3cyWWw4bmU1TWgzTTAyaC81UHIvd3lPVXYwcTgyTXc4M241K0xnMkJvLzl6?=
 =?utf-8?B?bEowV0tka1QwLzFGbzBadXdkdG5MK28wekdaVDlYbUxxczVSM0JFOURkZzdC?=
 =?utf-8?B?eld5bHhXSnpUZTJOUXdQNS9mME50R2RaL25YUVBCK0lPT01ZbUh6R1grd1Jv?=
 =?utf-8?B?S2VrQ3lGMUR3K3FJMVZSR0hKTVA5ZVppWkY4YmlOUEdJK0pkZUZxWjJUSWR2?=
 =?utf-8?B?WUcvY1ExR1Uzam1hS0JHYWJTbzVsajZDdjBuSW9waUlITTlqNkdmNlMyeDFt?=
 =?utf-8?B?aTlweDBreEZwVE5wZEtkTy9jTkNTdFgrT2c5Mzc1Ukc4YXhHcHhuV2RyVmJP?=
 =?utf-8?B?aGJWQTBoT2ltNnJYbWYybXVpdlVuTmdDRmVUbmZUcGhZYTloWHpKeUFNak9H?=
 =?utf-8?B?MWhIL0J3Wk4xMFU5Z2pGZkdLL28xZmJhcDU2NEV0dHdXdmZweWhoWGpYWFdK?=
 =?utf-8?B?R2IxRWs3VExmWVR3aklKbEJYcmd6Yi9saXpwWDNMRy9sMHRsTEMxZE1rTzYr?=
 =?utf-8?B?MVRKZjNXZW5QYm11TUxVeWoxeEkrYk8xWkRyT1VLeHhZeFR3eTdaZ0Q0TDhw?=
 =?utf-8?B?NFY0Y0ZGNXpOZkFheTFwdVZ5MnQ5cUI5ZnRiL2gvVE5lV0lBZUM1dDE0Z2F2?=
 =?utf-8?B?VUptSXJXbDhwOHRIN2hJQXI5WXB6dWljaDUxaUpRWlMrbmF6dTNxZWFPc0pU?=
 =?utf-8?B?RkU0R2hYcDNlNXkyMGRTQ09kTFR5dkdmOUJzZmpMNG5LVnZPdjF2SmpObUlq?=
 =?utf-8?B?UE45U1lYQlpjeVdYeTV2NXJNUldYTkVTV2JVTzhsRTZRclUxQTh6UnNUZ0JV?=
 =?utf-8?B?Wk5wSldTNXdZQXF2UEsvaUZCWHlReGFmQmNBSlpGYkhVYXgxTnJMTXR3eWFp?=
 =?utf-8?B?TkF1Tk9oN3JnS3dEaFRwYUdGSmVtc2pCU01NY25zR2dEeEtkVzVuYlJWY1Zp?=
 =?utf-8?B?UGlqTUtOdDZSMXgxT2VjalAyRTFINHhQaHlHSTdIUHVMUUNMQytXNGsyN2l5?=
 =?utf-8?B?Q1FRU3JaNWpsUjVNcFhvdU1rLzVYZEs2TVBWdWs4cFo2Q0wyOGg0bS9nWi94?=
 =?utf-8?B?V2tGSHV4QVhKaEdUTUJ0Z09nb1ZRRENQcWt6R2lyYTA1SUNEQnhHQ2l0aVBk?=
 =?utf-8?B?emFLQmIvOTZEK3BSOG9xOWQ4WjFFY0g4WmVaQjNwbndQUXJEc25CdWRPeUtH?=
 =?utf-8?B?aEhzcFpvd1VBeDloVFVlaHpDU3BUOE44WFlDL2w5NXJCRnQwOVFhV3pVZDZ3?=
 =?utf-8?B?d1NvaHJwcWI3UU9CT3Y1WWdPVk5BUjlwSzIrRDVoUGlIVVJtSkJTa3JxeUw1?=
 =?utf-8?B?ZVkzRytyeWFuUXFUVExNeEduclc0eThyOG9FL2J4S0hZR2QyOVRZZmI2R1Ny?=
 =?utf-8?B?cE5qMEFrNThlZmg1a3QxQmMybTVnMEN0OEErNmlhSjNqMnNqSFJBSmhKYzFO?=
 =?utf-8?B?eXJ4bnJWMUdlbysybW53bEhoaUM2YWV2clVTdi90LytFWnJZMmlkOWdaSHBE?=
 =?utf-8?B?NkwraUZLMk9iQkpYcSs3R0tNd1ZGeXZza1dMbkd5THFnSDZsYk5keUNwL1lz?=
 =?utf-8?B?RFMzT2hNdTdQd0lMMjk5U0lmL3Vmdm1kWHEzOWJLQmRMbk9BSXZoZFg1TUVz?=
 =?utf-8?B?bEg1OVhKM0t0dTlOcnFQUnhuRlFsemZldmkxL011MXYyMlpRNTAxZnR4aFZW?=
 =?utf-8?B?MTdYcE51alRNSU1mQWZCVzJEUkFmc0t0bmRES1QxUm5pdHVoS09WNGpZbTNv?=
 =?utf-8?B?WXRaL1FSZEIrKytwWjBOUUVtMGFWNGdOS2dZeVpvOFRvV29tcVc4aFZ4Sk9h?=
 =?utf-8?B?TVk0WURhZXc1Vmo1Tm80WllURVIzVDNXVGRJb1hsMUhCaFJvZ0RPaTVtckFH?=
 =?utf-8?B?dWZ3T0hNV1ZGQ001ZUExWEtqUy83aDU1OUs3TUpFOGtId3NMN29VaG53TG5L?=
 =?utf-8?B?aE9WWCtvNStZVzFGaWtEMk5pSlFrWnBSajNyWVRITUd0VkpHOHp2VXhJb3p6?=
 =?utf-8?B?aGl2WkhvZks2eVJvUUtOenhaWGFOUml2NU55ci9rVms3VVBHQ0F0emtHNTVs?=
 =?utf-8?B?Nk1XUjhtUlRjZ1NpOGYrcDlvOHU1TFFXTEZHS1ptS3UxSTdvSnR2clp5L2Fh?=
 =?utf-8?B?b3cxemdmZ2N6OGIvbmFlbEx0UzhqYmZaSmJ1MEE4VzV1RlRnYXphRWpTaHZn?=
 =?utf-8?B?UGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0tRSUZ3OG13Z3BQVHJiZHEycWcwalZTd09SeitqV2lnY1doMlp2R0RNZVor?=
 =?utf-8?B?ZERrQ2NqK1ZDY3o1Nk9rOFRobi9MYlB6SEl0WVlRTXFCSmxMMm1HeWE0MUZn?=
 =?utf-8?B?bU9YYlpaZ0NMazFVSWRLQXpES1FTOVZyWWs4TFZERkJSa3o5WEM1OEFjbjZk?=
 =?utf-8?B?aTI3aHR6WEpNMXc5S3I0VWw2aDJBNDNjMW01aXBUMGRSYWgvMGxtTlV0UzlO?=
 =?utf-8?B?MkN6MDg1bFl3bkI3R3Y3MmJtbVI5NnRpY2NWUFNleUd4VGJoVHc4TXpGeWJQ?=
 =?utf-8?B?bFM0NTQ5VHdlSXVCekxWL2YxNjVzaDN5Z1BHRUFXd1d6U0NzSHBiWTVYZE9y?=
 =?utf-8?B?cDhjWUxtTEFzVS9TTStoT1c5eVQxaUhYcUNSZi9uNS82U0lsSVE3c3phM08x?=
 =?utf-8?B?RE43cFRqeDJOMnZVYnowUmR5QytkdEhDNHA0d2RNL3VkQXdGMUVVRitlYXlC?=
 =?utf-8?B?K1o3Um4zR1VsQ29CQzJNcURJYzY1NmE5M3VaZmc3K1dNUEhsSU1xUjlwUFJI?=
 =?utf-8?B?bGtTVGtDVnhpcDYwNjNwUzQyNDNreWphSXF1RFBaSjVDbG1vMjdzcFJPZXll?=
 =?utf-8?B?ZXN4RDIyWk5aNTFRblYyTm9lQjVWSUhjN0Q0NUVYWUloc3d2OHVkdVh0ZEI3?=
 =?utf-8?B?L2hyWHM2TEhhWjR3SVdaYU5WTjUvWFBIL2c0cWY2NDhPWUF4Q1F1ejFwcXlS?=
 =?utf-8?B?bWxDSDY0Mi9JeVpBOVRONEhONnpsdGhHMEM2a00wMmkwN1VTaGpsb2gxTDBH?=
 =?utf-8?B?cFd6SGRGZ2l4MjJ5L0Y4cmdLMGJabG00YW1FcHlDdFA0dUQzM252R1FaTklG?=
 =?utf-8?B?T1lqWWF3YmZYMExyOURvQW5hQlFZcUgyTWs0QmdscDhXODBSY0RPWXhPU0xn?=
 =?utf-8?B?L2djUHRsRXVuMytIaW9WMzM2dzl3S3lDZVZkM3JCYkZ6cVM5TU5IL3NFQUVv?=
 =?utf-8?B?dTZjMXpVelpueWVRN2JQVmFFOUFkb1AyWXlqNmN0WE1LV2VXRU9scFpPUWZt?=
 =?utf-8?B?TGZ0THJ4aHVoRUV3NXRTc1NramgrN0NKZldIa21XWmlWS25KQzJQalhENDZU?=
 =?utf-8?B?OW5Nd2R2RGdOMll4WnhMeVhjNXlpWXFyY3pmMzJGSmhmazlORGx4dk5BNm5k?=
 =?utf-8?B?UjV1WlJtSWkrSG4wbUVYMldwdVFHWGZGZFArU2NaYXBNK09CUkI3TzZjbVV3?=
 =?utf-8?B?aDlMVnovT3QzNzdHdWRSL3M3RGQrWEcrQS9uRnN1dEtoN1FKTmxOUitIUDZL?=
 =?utf-8?B?MlFiU1VDSUZGaURCanljNXM2cTJlZGVycFhBOS9FcitqR044aU5BVVR1aklS?=
 =?utf-8?B?K2JUWjQyaGVva1RPOWdHNXE1K2VqR1VwU21qb0JoWUZMRytIKzdiRTJISEZO?=
 =?utf-8?B?VlprSVMxYzZ3ZXVpeEIwbEIra0F6QWQ5QU9lWHdBby9xUWxxVFFWZUZwRlh3?=
 =?utf-8?B?TElVd1dVbnNsNm5jMjlvMjVzK3NnQ2hIdkdTYjdaeW5qeDBpcS9ZQ2Z0bXk1?=
 =?utf-8?B?cmFTdzNJTzl2akV3Z3pSbVZtVUdXOFg1eCtBY0t2Wnh3eTU1blZWNWwxNVBZ?=
 =?utf-8?B?S05yRHZWRUIwb0RoUGRUNmp4VitrZG1FUzNZb25LR0pUeUtxZnZENldpb2Nq?=
 =?utf-8?B?UjJsWWg4Qzg4UFN5azEvazArRzQyTzhKWm16M2lldnp2dHB0K0g0QTV3OEJD?=
 =?utf-8?B?NTlKV2d1TGN1bFVwSXI3Uy9lWVZ4TnI5dkVLNW11Ym9XM0xxVlF2MnVERnFI?=
 =?utf-8?B?T3QxSVB3OG50dzZTMG1pSXNYRWZCSWtGRFdjeTN1N1N1ZHZBVXlxVzNocHBm?=
 =?utf-8?B?djhhWGI0MnR4Q0lsL2VwSlEyVGQzTjdBSjd5NjZSUXI5VFppelpLaVdqdXB2?=
 =?utf-8?B?TC9XcUFXWEpLdGNUWFVMM0J5YnVlVmVpYW43SksxdG4xZWJxdDB6NWIxcnVB?=
 =?utf-8?B?VzhvQ3ZlRjVzS1M5SS9Xc1dYRENQZFdzU0JpZmRMamhEcW5PWisrVlkxcVg3?=
 =?utf-8?B?YW42bm5Hd0VkZjFpV0hhTHd6YlZnMFk4bFh0c3YwY0RRYmsyNjF0QWkvbUM0?=
 =?utf-8?B?T3U2a0VYYzdYUWJWbkI5dkdmZkhKOHk3RlYzSzdrVFhpTFBSOUNWS3BNaVNZ?=
 =?utf-8?B?dmg1bnhQVkNyZkV0WFpvLzNRV2hnd0pPcWFaY3pKQy9lWnRzcWgxRmM5ZS9Q?=
 =?utf-8?B?SzIyWUMzWkowK0RHREd2YmZYT1I1cFpGU09rZmFmQjl1Si9xYlhTMVdVVVR4?=
 =?utf-8?B?RnZ2Qk5uRlllVlMzWXc2eWJkdjVISTJOQUpoL0Z1TUxWMlRaWWR0aGZuWmdB?=
 =?utf-8?B?WTlpQXRtQ2tNU2RrVnVadUh5aGRwdFpMeXJtbVhIemFRNVo5VHFZUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0b1dee5-5e61-4ce4-84ec-08de5f0ad6ab
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 07:48:49.1541 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LZs759cVNRx6ECOCN7ihSQ78c5r6mCuZRcspBB87BsC4VlNHAe+ecWpoQO5PdwC/OkiDGZ93/6xYkxtvM0eKEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8948
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
	FORGED_RECIPIENTS(0.00)[m:luca.ceresoli@bootlin.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:Hui.Pu@gehealthcare.com,m:thomas.petazzoni@bootlin.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[bootlin.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER(0.00)[victor.liu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[victor.liu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nxp.com:mid,nxp.com:dkim]
X-Rspamd-Queue-Id: 635B4ACF70
X-Rspamd-Action: no action



On Wed, Jan 28, 2026 at 04:58:18PM +0100, Luca Ceresoli wrote:
> On Tue Jan 27, 2026 at 4:54 AM CET, Liu Ying wrote:
> 
> ...
> 
>>>>> @@ -260,7 +259,7 @@ static int imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
>>>>>  {
>>>>>  	struct device_node *np = pl->dev->of_node;
>>>>>  	struct device_node *port;
>>>>> -	struct drm_bridge *selected_bridge = NULL;
>>>>> +	struct drm_bridge *selected_bridge __free(drm_bridge_put) = NULL;
>>>>>  	u32 port_id;
>>>>>  	bool found_port = false;
>>>>>  	int reg;
>>>>> @@ -297,7 +296,8 @@ static int imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
>>>>>  			continue;
>>>>>  		}
>>>>>
>>>>> -		struct drm_bridge *next_bridge = of_drm_find_bridge(remote);
>>>>> +		struct drm_bridge *next_bridge __free(drm_bridge_put) =
>>>>> +			of_drm_find_and_get_bridge(remote);
>>>>>  		if (!next_bridge)
>>>>>  			return -EPROBE_DEFER;
>>>>>
>>>>> @@ -305,12 +305,14 @@ static int imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
>>>>>  		 * Select the next bridge with companion PXL2DPI if
>>>>>  		 * present, otherwise default to the first bridge
>>>>>  		 */
>>>>> -		if (!selected_bridge || of_property_present(remote, "fsl,companion-pxl2dpi"))
>>>>> -			selected_bridge = next_bridge;
>>>>> +		if (!selected_bridge || of_property_present(remote, "fsl,companion-pxl2dpi")) {
>>>>> +			drm_bridge_put(selected_bridge);
>>>>> +			selected_bridge = drm_bridge_get(next_bridge);
>>>>
>>>> Considering selecting the first bridge without the companion pxl2dpi,
>>>> there would be a superfluous refcount for the selected bridge:
>>>>
>>>> 1) of_drm_find_and_get_bridge: refcount = 1
>>>> 2) drm_bridge_put: noop, since selected_bridge is NULL, refcount = 1
>>>> 3) drm_bridge_get: refcount = 2
>>>> 4) drm_bridge_put(__free): refcount = 1
>>>> 5) drm_bridge_get: for the pl->bridge.next_bridge, refcount = 2
>>>
>>> Here you are missing one put. There are two drm_bridge_put(__free), one for
>>> next_bridge and one for selected_bridge. So your list should rather be:
>>>
>>> 1) next_bridge = of_drm_find_and_get_bridge: refcount = 1
>>> 2) drm_bridge_put(selected_bridge): noop, since selected_bridge is NULL, refcount = 1
>>> 3) selected_bridge = drm_bridge_get: refcount = 2
>>> 4) drm_bridge_put(next_bridge) [__free at loop scope end]: refcount = 1
>>> 5) pl->bridge.next_bridge = drm_bridge_get(), refcount = 2
>>> 6) drm_bridge_put(selected_bridge) [__free at function scope end]: refcount = 1
>>
>> Ah, right, I did miss this last put because selected_bridge is declared with
>> __free a bit far away from the loop at the very beginning of
>> imx8qxp_pixel_link_find_next_bridge() - that's my problem I guess, but I'm
>> not even sure if I'll fall into this same pitfall again after a while, which
>> makes the driver difficult to maintain.
>>
>> Also, it seems that the refcount dance(back and forth bewteen 1 and 2) is not
>> something straightforward for driver readers to follow.
> 
> I thing the whole logic becomes straightforward if you think it this way:
> 
>  * when a pointer is assigned = a new reference starts existing -> refcount++
>  * when a pointer is cleared/overwritten or goes out of scope = a reference
>    stops existing -> refcount--
> 
> In short: one pointer, one reference, one refcount.
> 
> If you re-read the patch with this in mind, does it become clearer?

Thanks for more explaination, maybe it becomes a bit clearer, I'm not sure:/

Anyway, to simplify things with another try, I came up with the below
snippet in that loop, which drops the two intermediate bridges(local
next_bridge and selected_bridge) and uses pl->next_bridge only.
It looks ok to me(at least, refcount dance is much simpler).

-8<-
if (!pl->next_bridge || of_property_present(remote, "fsl,companion-pxl2dpi")) {
        drm_bridge_put(pl->next_bridge);
        pl->next_bridge = of_drm_find_and_get_bridge(remote);
        if (!pl->next_bridge)
                return -EPROBE_DEFER;
}
-8<-

What do you think?

-- 
Regards,
Liu Ying

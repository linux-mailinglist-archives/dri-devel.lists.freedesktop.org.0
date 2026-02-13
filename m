Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKkYFveUjmmhDAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 04:05:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2F91328AF
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 04:05:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9078A10E223;
	Fri, 13 Feb 2026 03:05:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="njn7tYHc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013045.outbound.protection.outlook.com
 [52.101.83.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A81B10E223
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 03:05:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hkz3cxQJmzGGk0WVf03ejMSfby7M5d/0Kii1vQUzEm5SJbvV0zuML8Q2uFbB4zuKrqmOQ70R4kMxjC1wp+yyG3d7dV2oz8kiWtaUk4ytx1ZNwuHq5MXp2TcbCegd3cfenjREyhnfZmw3oAUG80SB/esxpNJv2sNrtv8tQiUoABU0N6d4V164UmgRQVGd3Lo3GHfWdF0sIX3r23MptDepENisH0ySDGkHcCU2dgueGS5rVnqa7rLGv9sNjSMBF7Mqrzj1oToYkmKS+RjamKqC4e6I5Ae5rG5NWvfGV/qI2h+OqFw0Qxm2s2rmqSwUXdFayjZoa0TkvdRRhD3YgE9BfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hGxCZK1kM4jQQaQCNKGYRUOs7qXAxm2ul/ndBe5R5GE=;
 b=y5hnh3YbusLWY+eHOyiqAzPM/0wbslhtG+8N+J5yX9nU1Z+szGCdZam3okf9lTHaF5xyMzHn6PMQnoKL9EglJ8p2u7uYbEqqUNo25Hl6Yw5WDLZz6QxKxOGudCcXQ7X1c6g46Bjms4hEK1kkIGjBxuDIFwGYizf5RD/awp3HfMSbnJ1hyu+IK6A70P4Bxv5IGRkcS2QTgxp/qJzRfEwgruOUtj1OKGC5/iWFJbAQGVlidWpJXpAa+rUYYltvGZ4o4P1JQZCIoM6zc7jS9ItIMWEmHYxD2I3+PJPsk6swSwJ8YoeaSN8PDLgE+QsHU9uEFohihK3NRa4XZRngnIocnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hGxCZK1kM4jQQaQCNKGYRUOs7qXAxm2ul/ndBe5R5GE=;
 b=njn7tYHcW1ZR4iXM27SkccZFZq7pOuRDmiG03TIZrUnC3PXNI3V3TmKChY2/8xdfwVtsXRna13sbUjBNl5NYIjDbVt8LBBPGIMtFzU7MxRGvhRfx4N8CXDwDVgwMRC+i8dywLp46G69h+GNIHiP54nifnUd+h7PYgH8Rq5LxSkRbTcNpPTrydnBRpZYFuq1u2kaB55z9rFJUWSVsI7zkLv71anVyvZO/WB0sg93cxP8JJ5ST1xx8R7NcTj6EIpdwzwz2+IBEk6zr/iM5pWrfHJFr852Wdg5AUNIfEDBbttROYEtRPl/bzQEB0GI/SW+ud5m+jB9gwOBCc2FbjVsoUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM8PR04MB8002.eurprd04.prod.outlook.com (2603:10a6:20b:247::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 03:05:18 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 03:05:18 +0000
Message-ID: <575adb2a-e195-4f43-98c0-085445bd9de5@nxp.com>
Date: Fri, 13 Feb 2026 11:06:13 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] drm/bridge: imx8qxp-pixel-link: get/put the next bridge
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
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260211-drm-bridge-alloc-getput-drm_of_find_bridge-v6-0-651ddfd13bdb@bootlin.com>
 <20260211-drm-bridge-alloc-getput-drm_of_find_bridge-v6-1-651ddfd13bdb@bootlin.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20260211-drm-bridge-alloc-getput-drm_of_find_bridge-v6-1-651ddfd13bdb@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0032.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::19)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM8PR04MB8002:EE_
X-MS-Office365-Filtering-Correlation-Id: 9249f126-40ae-461d-892a-08de6aacb79b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|19092799006|7416014|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SS90TGpzejBlQ2NrY1VheG53bnNuMGJIbTdsV0s2UTBsZU94MU1NbjJqLzZu?=
 =?utf-8?B?L0RUblFScUh6RHlSb2ZNa00wQ1lKSmtBWXhCWmlUYWZrWEdJSTdkem1NRWZj?=
 =?utf-8?B?am4vRGhGdEJlcFUzVFJ4V09BWVR2cmNNUjl4YkVTaFI0R2dYWDdYY0RnTlA1?=
 =?utf-8?B?RWRlK09hcVlhZkdtSmdFWm5VcksrNG5qcEkrdG5abitpblBTYitIbTJZM2Ns?=
 =?utf-8?B?TnFBb2kyOWUyWXZCWWNiejdJa09zTGZFK0kydnE5a3IzOUFpNTArb1M3RU5i?=
 =?utf-8?B?YUx0aCsrYjgrdHo4Q3dNMTMwZ3BNUFAwSlhzbU03bTFiRGdSY21YTStLN2Vt?=
 =?utf-8?B?K256OGdNRzVGRUxFb2tVYURsT2Nmek44ZnZaejBpQnQ4c0dXVjZSNHVvTlYz?=
 =?utf-8?B?RVJVOFpjc2lLWS9GS29hamNrcDBGZ2tZcllacmJDdjB2RDNtVHpoeEFIR2lr?=
 =?utf-8?B?Snc5a0hrOGxMeHBtMm5RMVBnUDdSb0ozNVpEbkUrMVBzRk41aTVVTnhBYTd4?=
 =?utf-8?B?K3lTaGlvQjBYRm5uakp1QlBoVmc1WGIzS1YxbW16QkRNdzR0bU9tWTJFait5?=
 =?utf-8?B?V3RWaHcybndqY2gxOFBoazZpK1NGUGdXbERiNEJ6SEc3alBNOE42ckI3cUc5?=
 =?utf-8?B?NmJSTXhBaXdzbXE2ZjdOZEtJVStBRGltcUdUU2dRZTRzOW9XdkJsU1JGd0o2?=
 =?utf-8?B?RHJNV3RxRmUzUHBZcjRiek5wTGkvamR3TElVL0d5NVZvaGhzbG12bzFBYzVX?=
 =?utf-8?B?VnZHWktVUGZhdzc4aFZjZVBaWjl4VytQTzY3aXQ2bmV0N1c1R012VU1YNkl6?=
 =?utf-8?B?RnI3NUptYzZqcVBxUDJVNzRtclJhMWluQkFSanRqTHNhUWE1NDRSVExpRE1J?=
 =?utf-8?B?RGtqQWVPWmJKMFZsSGg5c0YxR1A3V0tHYmtlU1pmZDAyZVJEMGVEOG9zd3ll?=
 =?utf-8?B?UWJUYlpTSm9nbVJuRWo0enZoeS9DeFgrbzRGeURZeTllbnB6WUlTZFdvSUZz?=
 =?utf-8?B?a20zM0J3Sit0R3FhN0FUeGFZa2lMZlZvaHIxM2NNWHZlZmY4U1djaWoxTE5Y?=
 =?utf-8?B?a3ZzR2p1TTlqZVlXZUpQeGppZWZuUVNMMFdDNktMaUpRMmw3UG5SSzlrakhi?=
 =?utf-8?B?azc5TkxLQ3dVTkRiU0hkZ1gvT011TmJCY1B4b2w1Q3VJbHNjbDJuZjU2R2d2?=
 =?utf-8?B?bE5lMmRRVmZPQVZLb2RYaTlXQUtoRnVUUjRhMTFyODQxSUhnZGFtN3hHaFlG?=
 =?utf-8?B?WHlCT3pMTmlITFJVN2N0akljSUJyZ2Q5ek5CMXhlVXdBZGpuZzhsV1hqaHUw?=
 =?utf-8?B?SnFLUlY1R29IZUg4dTFhNHhZYjdhY2srOXJ5d2ZtU3ZhQnFIS1lablErS1NO?=
 =?utf-8?B?VzJVaGhaZklUaXVHd3RYSTkxSXBXR2lhTExtRWt1K1NIZHJDL0dFcThYRVRN?=
 =?utf-8?B?d3V1MGJKbTdtZDVtM2dCSmdKYWw5RytCdTVNRVM0T2dhaDJLVno2L0JQTjFT?=
 =?utf-8?B?NWFxSG5QcXBrdUFNRzBSR09PcldZd2tLSXN2Q3F1K2Zkb0IwK2l4bnBlM3Fh?=
 =?utf-8?B?T0lrV3pFTG82TzNpWDdmZ0taU216anVKbExJSWwvb2syRmdZZURrdXNBQ2Jv?=
 =?utf-8?B?dkhtWDY2eStGNGVxMCtNK21vS0hCcTVkTmMwd3VrMUFrazNUVkdiQ2dUKys4?=
 =?utf-8?B?K0NtOWpCSFJaWWZRTngwcHBYQXJlYnJZRUh1WlpiTzJoYmFvUlUyejRnUE5p?=
 =?utf-8?B?bTg4ZmJvUVVYaDNIZXoxMFdnNDZMWGNxSjVrbE5acjdpQVljSC9yd3dON3Bh?=
 =?utf-8?B?amQySFdEYjRGV0tMK0xNcGI5cW5tdGxWb3J2cWNiR0lZeVRSNDhIV0ZwQUNO?=
 =?utf-8?B?TEpGNG1tNEpMa0FYUE9GMVhXOVpEN1RtZDZUVldwa2c2UkpDSDBSS0FnTjMz?=
 =?utf-8?B?SHJHdkoySEovVW1OeGc3ckhuck1KUnFCd08yM3RKV001OWp3NlpjcmF2Ymlq?=
 =?utf-8?B?SEZId3RFZitwb2NmdDZIcVhTb0U5MS9veWFPdVZaRXUxckdVQnk1b0dFdDZ3?=
 =?utf-8?B?WFdLdHI2cWhFZ21sQUJ4cytJdlg4aXVZY1FrdWpaQ0lUTXVCOUpWUWhxZkNh?=
 =?utf-8?B?RldSeFUzUWxhUEUzS1JTNVBRM1VKVktLNlpNdTE0djlyTkVFUEkrV01na3FM?=
 =?utf-8?B?Znc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(7416014)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWhUdnE1U2RncTZGZ1VJOWpIdUZxS0NUQnFsOEJIZWc0dFBwNEJoZEdpQkRR?=
 =?utf-8?B?akROdmRCWDJTM2pDU2pFcHo4RHk3NEdwTGNsZjhXVXVobUxrYWlETTFsYVZG?=
 =?utf-8?B?dUQ5ak9zc2YvRGNhSlQ1dGV1U2xUYWJxUWxxWmFZQ0ZlbE8vZ0YwOXQ3STlI?=
 =?utf-8?B?a0JaZTRuUWhwcjRybWVkQU5wWVZSeXIxYnZZYlRDcXFMaGdsUkV6ODFBM29I?=
 =?utf-8?B?Y0R4K09Lbi9XaFkvRlhPSkRnRTZtWmo5WFVscURIWTJQK2liQ0JaYStJV21M?=
 =?utf-8?B?V24rektLaEttL1VRbERHQVNRQS9OZEJVZUczTUpFTEZtVFBQdmIxZXYrWDNk?=
 =?utf-8?B?N1Y3NXZzbTdHY3F6YjFwbkdpaEdiSFgrVFI0blFjZ2srak9BcWYxZ3dxeXFm?=
 =?utf-8?B?NkhVQ1Jad0NlL21XWkg4MG0zYnJwUkF3SG1LUWdmcXVrdlhKdmVvVlBqbXZO?=
 =?utf-8?B?a2kxTmFLSDZjcG0zbnRFckN6QVpITitSZ2F0MTZsMStMTW0rcVlwYkx3UVM2?=
 =?utf-8?B?eWhIbkEzdGszSlA1QmlSdmhLNEpiVUY2QW5RZ2w3dVRuRTdDSUU5SEgyM3h5?=
 =?utf-8?B?VG9pV1pkY1BUTThIYi9OR3RzYzF5RkRDNkVhYzBtTmdLeE1NMXlwa3RPRUh6?=
 =?utf-8?B?V05na0ZWVkMyaEljTkU0QjFzRHhFTGYwZ09rUFl1Y0xmY0tKNDVWbDIrSlhP?=
 =?utf-8?B?NGF6aVlPSnM2NEJQOGE0UTI1ck1IYjdieHg3YjQvaHplRFdiQW9EWnFOaStU?=
 =?utf-8?B?RDNzY3ZRUkNVdUVqS01QeVpja2l6L2pBTHNmeXB5QVdWZUpvVG16WlRwN2Qx?=
 =?utf-8?B?TUd4Um5QdUI2Vnd3dUpZYktOaHl2S0w0WUQ4SDZSL1RJeXhmK3V1VTJEbms5?=
 =?utf-8?B?b0tXMjhEQkZwSzlRaTI4aDdEQkd0a2t1NnRPTzNFbGR2cDJ4Uk9LTW5oNFZu?=
 =?utf-8?B?aWNRL0pweWxpTUlUSzJVbHhPeU53UXFtNUdBbFZkKzNwaGt0ZUdkTzdBd0pV?=
 =?utf-8?B?NElLQm4zam5JaXRVZlE4OGxFd1hsbnJmQ1BEcjJwWnNZVitFNEVxcmtyZmxu?=
 =?utf-8?B?N3FZcGlpQUJhV3I2bEd1aGlXYWwvaDBIakRBYlZHSTVHVEdFVFlTVXk5SFZ1?=
 =?utf-8?B?UWIvOVNtOE13aE92WlczbWNkUlBrSXNVcS8raVFpODc1bGxLMERuSkV2VEhy?=
 =?utf-8?B?WWFVWEI0SmVVYVdSY1pwMmxiUGQ0NmF3MzV5SFR3KzA0eWRMaVI1VTd2cHpo?=
 =?utf-8?B?b3VoZS85U2hhSmVjSWp2NzZMb3RMV2dnbG1JK2ZWVkNubkFQWmY0YW5FZWtR?=
 =?utf-8?B?eHVOSHlKZHdQZ1pHTGVDekRXM0sxOE1ZM3NOZXBuVEFQNUZSdTE3YVp5N3Jt?=
 =?utf-8?B?MTZOWU85RHMxM1BVZ054NStDRUdkampDM0krSW5oc3dxbnlNMFA2TGxOK0hD?=
 =?utf-8?B?R0ZPN1BVMkVGV2NuTzNIRHY0QnhhSTRnZFRoNkJxY3NTT05Pbmp6QXV2a3VF?=
 =?utf-8?B?WVR6aXRmVTJxdVB4UStnSktEUUNrQ21ib2RCNlV5eG1FaEx2N0Zqd3l6REw2?=
 =?utf-8?B?RFJneVNFT1M4bm1aQVZWam1kVmpGODRpZDV6VGF2dFVrVSt5aEVYK3haSzdN?=
 =?utf-8?B?Y1lteUVsd0VrWWNxYUZtSGZob2dhNjRIb01uL0hUb1VRUEZ0dVRZS09pZE0r?=
 =?utf-8?B?U0hxQkVraFlyaFkzQVR1cnF6bC9EQUF4MkZvemVOWnRmSEd1ZlFka1hQUUdB?=
 =?utf-8?B?NDhhQmQ2RXJXTlJ1NVNHMy9LZG83VmpXZy9FNlFLRGQ2RHQ1ZWhBTkxlNndW?=
 =?utf-8?B?YmFUMUtkWmFLN0l5elRONEZlNnRTZjl4VHF6ZVBySUVaV1lzY0tBRnM4ZUJ1?=
 =?utf-8?B?Z2dvRXNzeWYyc21RdG5aakhyNDlRVE9OQ1FvVnBvOW12cTc5WkkvVHFVd2NM?=
 =?utf-8?B?aHE2Z3U3U21wZjk3UFZSRi9qT08wK3VTR1Q4RHB3S1g2bUpSaFEzMjVYRWor?=
 =?utf-8?B?U3U3MVI2TVpuRnNMMElOSlluS25QYThlbzFYQmEyQ0J3Q1dOQkRSSTB4TDRo?=
 =?utf-8?B?QzRIdTNMOEc1ZFF5YXBOcTNhd3gzZjdHYzdZaUg4UG9CcHVZUERNZ1pMUjU1?=
 =?utf-8?B?RFlOQldLZHU1RUdnK0VKbnhuUkpKOGFpcWxyeXdZT21uMGlBYlh1VTB5c25o?=
 =?utf-8?B?eUtscFRZWTlwN2x4NVhIVFlKR3o3OHZpSzRQdVptV25rd0RpUWt6aHJvNGhW?=
 =?utf-8?B?blRvaTNsVGFjYjFWS0ZCOWh5VDgzcmZGTUQrTEF0NkhjSU1FdkdkMXdnYlVq?=
 =?utf-8?B?N0ZQNGhIR2g1NUsxdHVwQSs5TFRHSk9aZFoxcDJYemk0b2ZsU280Zz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9249f126-40ae-461d-892a-08de6aacb79b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 03:05:18.2835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2wdAASLx1DWzHAmcioXjZWqi2ntFyClNVeoNtRQn98CnwsrMjJ9tnh2mNyrs3wFsp0g6qXtrE74CnGhKMqJiuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8002
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:luca.ceresoli@bootlin.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:Hui.Pu@gehealthcare.com,m:ian.ray@gehealthcare.com,m:thomas.petazzoni@bootlin.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[victor.liu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_TO(0.00)[bootlin.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[victor.liu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:dkim,nxp.com:email,bootlin.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: AF2F91328AF
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 10:39:49PM +0100, Luca Ceresoli wrote:
> This driver obtains a bridge pointer from of_drm_find_bridge() in the probe
> function and stores it until driver removal. of_drm_find_bridge() is
> deprecated, so move to of_drm_find_and_get_bridge() for the bridge to be
> refcounted and use bridge->next_bridge to put the reference on
> deallocation.
> 
> To keep the code as simple and reliable as possible remove the intermediate
> next_bridge and selected_bridge variables.
> 
> Get/put operations on the remaining pointer is pl->bridge.next_bridge,
> which is tied to the struct imx8qxp_pixel_link lifetime, are:
>  - get reference when assigned (by of_drm_find_and_get_bridge())
>  - put reference before reassignment if reassignment happens
>  - put reference when the struct imx8qxp_pixel_link embedding the
>    struct drm_bridge is destroyed (struct drm_bridge::next_bridge)
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changes in v6:
> - rewrite as suggested by Liu, removing the next_bridge pointer too
>   and splitting the comment for maximum clarity
> - adapt commit message accordingly
> 
> Changes in v5:
> - rewrite commit message after Liu's review to clarify the per-pointer
>   get/put idea
> - split the if()s involved in selcting the bridge
> - remove intermediate selected_bridge pointer
> - removed Maxime's R-by, patch changed
> ---
>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 27 ++++++++++++-------------
>  1 file changed, 13 insertions(+), 14 deletions(-)

Acked-by: Liu Ying <victor.liu@nxp.com>

Thanks!

-- 
Regards,
Liu Ying

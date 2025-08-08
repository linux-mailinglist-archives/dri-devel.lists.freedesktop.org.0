Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C94B1E3CB
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 09:49:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75FC910E8DA;
	Fri,  8 Aug 2025 07:49:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="DRyH2RyS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013048.outbound.protection.outlook.com [52.101.72.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76CAD10E8E1
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 07:49:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FJhd3HfXWEjQmlaldhzEBNQqQ/ExEfqTb0SK8+vWtRPqLACTTnlp9TO2p/IoNbf5SGfvJpKTkxg5W2jwjQ9flnKJoydrlpWQfirApgL99ky6iKaZC+IF2OBn6rS23E65h/sNQpUe2mjbq7RmtpG1FR++buid3uc0rTw73MKjVGefq9dSxeHhnnfvOibk1NTg+4h7sO5W1URfRrrdq8tlKjkRR6CmRxycKX1YIqZmCZKvP0ZzkGrNCvus03OjALMk9RpZNsEV9QgrO/YhDSCPr8Qd9qiRothpgiInNPxnIU3NbFfj1UkLEU7Skqjmovew2JaHP9rL8nB6LH5RTi4MhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AVC+wX4pHkOlpu7HjK5fTqN+LXSzX6hjD0AITQ4NycE=;
 b=qwfS8IvQcnpU5D8LT+1d05K7VGyXrlq+WqWgi+W3BQL65bZoctU9AXiIu+qjEAdlK/gD86QwUJJhkrEnHN5W8eqdx1ELJteYlcF1bo9pec34qCiQeMs5PKvpuLlkYSTM4VGMB/aBXj6XjE1amHdkP3NXpI4CRAaZkT8hlAjNduvabOCq2YsI7cEk+SGqkSe4sXwY1BzmXzJvMhPAqL/QVeittfcmGbKNwgIipSMVG8mbn41naC28LXCDcY0gHpj/DDbS+IE4vgAQLV6/cw4Cm4H1kg7fRsaTLBBIBwjqaulMw3OsZ5GO0Y9bh4mkLxhIodeMJQnhbG5aenIm8ELo4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AVC+wX4pHkOlpu7HjK5fTqN+LXSzX6hjD0AITQ4NycE=;
 b=DRyH2RySDa2Pudv7DDJ+wetz0b+n9UkMz6mjQO93ynJ+oYp0i/xVnIYvuKfTlMFLNHafCzRkqw8OCf6G0ge00SLePM1xUDB5nKjc60Mqq6z6t6Jv77f1nByDFje6XhjxN6pCnVERyDD+9xrbljq0sKijE+NeGpbsWVzprZvFyA61hiRTP0pQB2cgDLOBJDnG8z0X9vVyTPk/L4oXZiHRnp84N3qfxADjXOWltwJtuexy6WCDiOa9CdKJj677ZtqxNcwZ14i4jOduKGhaB0QiDx3uYu18DJZRmhielWD8uGlrT6t1byEjwvp4slgtQUyWK+4vtR942yxmxTIBKLmfGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8561.eurprd04.prod.outlook.com (2603:10a6:20b:420::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 07:49:20 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.9009.017; Fri, 8 Aug 2025
 07:49:20 +0000
Message-ID: <0ee5fcbc-a553-4385-b930-b1a40693add5@nxp.com>
Date: Fri, 8 Aug 2025 15:50:49 +0800
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
 <ba02693b-8ad2-4297-ab89-5b39d5c4315f@nxp.com>
 <CAA+D8AN3VzFx1g=8wyxJROw96xS2-qoVs3X4vUfFnJtUCqFj_w@mail.gmail.com>
 <481c4a38-e638-49ea-88d4-765e581afca7@nxp.com>
 <CAA+D8AMmQo=TgaJTubLL6xRp0NV3GpeE0JKwhBjmhZjtBnBQjA@mail.gmail.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <CAA+D8AMmQo=TgaJTubLL6xRp0NV3GpeE0JKwhBjmhZjtBnBQjA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0096.apcprd02.prod.outlook.com
 (2603:1096:4:90::36) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8561:EE_
X-MS-Office365-Filtering-Correlation-Id: 68f36119-afa0-4ccf-84ff-08ddd6501530
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|19092799006|366016|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q2RNYmVXSHVVQVZKamxxNGZWNUgxM2ZwQk5NZURuYWRRL3N4YjEwZ3llU1Jt?=
 =?utf-8?B?NURWeWsyczRWaTQwazNGT21XR2NiQ1poOG1MY0Yxb1FZQzZKY2F6bjRvdlN1?=
 =?utf-8?B?eEhpZGxmdUJUR3NWUk4wNEwxN20vWmREUktKUTlDVnd6ZXNyRkIyN0liVlhj?=
 =?utf-8?B?WjFWY2pVak55YmVlblN2WTE0QXVrNnNkMmVyeXk0M2RPVUgzSmZJVTQyMXJ0?=
 =?utf-8?B?Sm54eVVZTDlJL29GUi96V3NjNnFDUGJLN1hDa2pCaGJUME9Lb0diYzlSQVJQ?=
 =?utf-8?B?elFLVDFpSE91dTIzSVFCS0o4NnlzbkVEWXFyaEo5dURrZ2VlR2NHbFNpNUhF?=
 =?utf-8?B?aFpxanRSZzg4M05JMmJBTitTWmtESWtycVVKSCtnQnlnSnZlc2R3UERVYTZB?=
 =?utf-8?B?aVVUWkVZZWVhM3o5SnBpSjgxOUswRjV6NG05YlVTTGt0TTRpNFNKbzhSTksy?=
 =?utf-8?B?QWN3c2xyWEh2S2tSaFFVdDRBTllLSWp4eTFLSyszekhzdTZFZUR6bktTeW1L?=
 =?utf-8?B?N0hzL003ZWJqTzZKd3dSVmZoODFCWU1ibTB0WE1YVFd5TG1wZ2ljQW1BWGcr?=
 =?utf-8?B?WTNhU3ZJaWtFV1hSNXlHTzk2WlFIZHl3Wm9RMUIvNld2UmJneXJWd1NybWhX?=
 =?utf-8?B?OTlsdmtvUTFRQVhxaFppd3B6N29ERnYxaVNIUHZSQ0M4K0VRRi9YL3JsWVho?=
 =?utf-8?B?eURWeW53bUM0NzJ4WFNTMUl6VDZJU2U3L2lDd2c3ZzhFcjNSRUFGN0tPMDRa?=
 =?utf-8?B?UWtZQXZmSVBXeFhRRkFYMFVlV256c3FiUkgrSys3VHdPcnNVcnpTczAyUHJa?=
 =?utf-8?B?ZmdYN0l0UXljWERzNmprUHp0STBPTTM1QXlQUjJKK2tGZ1BJUjNtMjBJbE8y?=
 =?utf-8?B?eWRnTzI4WFNkakpLeWszZ1M0LzRsUm1GTGtoUlhOb0daejZNMkNRQzBvSXpG?=
 =?utf-8?B?Z1V4Z3ZiWjVUdCtuaXJZU0lCRU1pakE0U1VJc3Qvc1l6L2ZjYzdlTGQ4WTkw?=
 =?utf-8?B?NlFzY0ZzZ0w1SFBtUjJhc2R1QWlMQlNEbm5IOW5nb0UrL1cyNWlNNm9mYnFN?=
 =?utf-8?B?OTdDSnNSeTdtNE1OMU4zdUNNN1pRZ1FSYWhOVWdmOGQvR0Y4K3lua3ZFRStE?=
 =?utf-8?B?TkJONVppZFczRWI5QW9Cbm1JNm1oRkpsdUVpY3RlaWV4Z0RZYzh5bDBpajl3?=
 =?utf-8?B?NWVQWFpEdlU4ZnlxY1c0NzV5WHQ2SldqVmxpcHBWdXU3WUhxN2EwU083b3dj?=
 =?utf-8?B?cU05cEJmU2ltN1BKd01abWxzSStyNzB1NS93czFwTEthVFJxVDVQcDFxTUE2?=
 =?utf-8?B?UFNla2FhZWhhb2lrVngyRnFmUnlGdFMyblZTVnRxaVdGNjEvMXU2OXNPUnZT?=
 =?utf-8?B?S2Y3RFgvT0F4TWcvN1NXRFlhanl3dHRsbWE0Q2UvN1NIRGhPeDhFdFVHalJD?=
 =?utf-8?B?d0NqeDdkeDNQMUJ1VlVrVk0vT3Z1b3hDRFdGSGg5K2NuZDN6RUhjYWl6dFJk?=
 =?utf-8?B?MmsrQW8vZkRPSXQ0YXdtSTBEckw4MnBtVFF0MkU2TFpadFlKeklkZ3Z1aUxa?=
 =?utf-8?B?UUE3N2xQUDdPMGJFN1hpRm5IZzIzWDBaZVY4WGdkOVlnN2J4dHZiU3ZGUnU2?=
 =?utf-8?B?RnZjRnRId0hVLzF2MHhlcEtXS3dEUDRZS3FLbDJQZ1FEKzZkbnpaSkIxSGZC?=
 =?utf-8?B?clpObXg1S0tzMEdDdlMrdDVUYUhJMkk1SkRrdDhMSmh5MS9nMzdZVDkyTm1o?=
 =?utf-8?B?a2tVaTVpN1FxcXVBUitsTVJIRHdaZTBITW5WbmVWdlc5MGQ0MCtNUWFkOFRM?=
 =?utf-8?B?Rm9Nd2pBamg5SEFacUNlbzV6M1gvSTZkTm8xNHQ4YmFvamk0TGI2TmRGSmNs?=
 =?utf-8?B?WlFPYXRsdFV2YzFnQk9BaGNiVHh2OXluY1FRdzhhUXZadys0VERzUmJYbXZI?=
 =?utf-8?Q?KWt0xQ3N1bM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(19092799006)(366016)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUNsOWU3eTA2anYzamgyUE5BVVcxZzRiMDRCdFhPQjZSYUU3dWhCYS9lNUNI?=
 =?utf-8?B?OU13OCtqRENta1FJYXlsa2lYcUpSY2s4Y040cGF2Sk5zVzhadTRzQUxxWFo3?=
 =?utf-8?B?cXROSVBKQmJPTFBKdG8xRTA5WGNJbEFjdTlsRzZpcmlmRVYxYm9lcXkzdGQr?=
 =?utf-8?B?T000MzRaTkpibkZuRUlHUnoweUxZRWYvbklyNjhaWWhvblpVSjJSWnM1WG82?=
 =?utf-8?B?Q2twYTZzaW1mR2tDS3IrVURXQWgwTWxwNzJLbmJ0K0dpYUQ5b0xDb1RVRms3?=
 =?utf-8?B?Y2xXSE00d01qV3hsYVROVmxOZ1hyWjdvdE8ra0dKc0NqUWI3SFJKK3JPOGk0?=
 =?utf-8?B?UWFZUmZXYnhMN0hFRW40LzlIWmM2NCtXQ0xzRXpsR2RxV0JOZlQ0YWE4MEU0?=
 =?utf-8?B?VVNpNGc0eVB2bWhXYVFJRFJ2SEMyQUtZejRZR2VMcEVDcFFVK2x6OSsrc09p?=
 =?utf-8?B?Yi9JenlQZlhDYUVYT0twWDNVRi8xaDlHR1FuQmZGaHRMVDg0UktQdjQzUVV5?=
 =?utf-8?B?Nzh5R3pGOC94TmgvOHppQ3hqQUJEV21QZXdMVGpkckMyQUZtRGxXYnVKQS9H?=
 =?utf-8?B?ZkJUSUJ1T3RyTFYwVFRpZnNVb1dvSlJzMWYvVTRZUU55VWo2Rk84OWN3Q1lv?=
 =?utf-8?B?MXBNb0pZQmN1bDFpYmw4VTYwMzFEbGtrRzllUnNSN2FCWE9mL09NV0lzNEdh?=
 =?utf-8?B?ckJpaDJuN2dSWVJNcWUxNDhNaHFDWFBQbkRjMWUycmludTZtY21lMTdTN1pq?=
 =?utf-8?B?andQVCt3VkdNbERXdlpRc2hRUlFkVVlUcERxbDdxRlpWUThiK1h5cnZ5R29C?=
 =?utf-8?B?dEVHQ2l6WFB3Rlo2enBZd2NkeG1tMG5hSE1ROUpVY0VsOXk2a0dwMjRMejYw?=
 =?utf-8?B?Z29jSWNiTVpsb3ppWUhvV1ZtQ3hPQytlbHNoQXRDZldESjVnclBYNWlHeVpp?=
 =?utf-8?B?Mld5ZG80NEEyY1pVbUwxWXZKV0FyUE44TDh6SFdicy9hY2FXRTNmY2dXNEdX?=
 =?utf-8?B?NzAwc2FlUVJtM0o0Uk9CM2pQVmZMMEZCZHFhRG42eTQzSFNibHpaZVNXbEtl?=
 =?utf-8?B?N21adnJXeFhTZ1BmMHZhTDBPZ2FtTFl3ZXB6K213WVJxaHVua2RGUTVTcHhU?=
 =?utf-8?B?bUxiNjVsS1JqRXJ4b2hXU0FRU29TR2FNdVByODdLTXV1R2h4SHB4RmtnNGFu?=
 =?utf-8?B?aEhuckJ2MGptVEpQRU9qWldYRngxandMd21YaG5jRVNvWTJyZHppcyt2MldI?=
 =?utf-8?B?dkNCdGh6VWZUNjlnZGcrSlJOckM3ZnNIaDdKSG0wVTZmeGUzZHBpQ2NtMHBa?=
 =?utf-8?B?c21Tb21zbC9CRE82YkVPUWV4UHZQM29qVW9iUUNwNmdrN2NIOXV3NkNZTmJL?=
 =?utf-8?B?cjhxU2VJWU8xQm5BZTRsNFJBMy9NREV5NExkU0t5VGpoOTJWZWNSbDFxbVB3?=
 =?utf-8?B?TnV1SFJMTDg0ZndBV0F5dmhwV0Zld1R3cnZ4aklmb3lpTHNNa0J4ZTRJQ2di?=
 =?utf-8?B?Q204UE5nd0FTNnZKeFNLRmpCQlJFQnlQUHJ2aFNId05nOTdkVEl1M2NIbG1T?=
 =?utf-8?B?dWdRa3dFb2QzYi9PTzZOMzlKa1llazFrZ3NMeVRvWEhlcmpIQi9qSHJKSkU0?=
 =?utf-8?B?T2pFZFRrd2c0cURhNllNamdLSVhpbnRpY1JCSVBwZGNoL2g5MnhSL3AxZjFi?=
 =?utf-8?B?dm9OcjRiQjg0QUh5dXNiRzE4TCtJZnJNcDlCRUdTanQ1NFpmWDROQTgvbXhm?=
 =?utf-8?B?RURWdDYrZjBoOGthRFNkektmUFZVbEI0N0U1bW85YjZpVHo0RVdaRXBuREpi?=
 =?utf-8?B?QXozTFdEQVdlS3NvbEFVeHgyOU5MdVh5SWFPN2dhMHJOZ0twK1RYS0J5SUg0?=
 =?utf-8?B?NlE4UXpHN3hiVWgrcDAwTHdNWU1TZzlDdnQ0elZBSjZjNGNUREJ4TnF0YVBH?=
 =?utf-8?B?UlhaL3ZCNHBuY0wxRWhpWmV2blRCcjBnMkVEZzJib0x1K3ZCSzNvTUQ0REVR?=
 =?utf-8?B?Zkh2Yk81amRWUW5MczJHdkJUZnI0NmsxRkFpaGZGam1LekxHWGlRb1FLUzJn?=
 =?utf-8?B?TmlVSE9pMlZSVjNWSThsL3JRbVpKOEtlTm5ESSswYm94VTVPMmNyWTFWR2lO?=
 =?utf-8?Q?U5UFRxkHvXlXuuwxbCc2YT93m?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68f36119-afa0-4ccf-84ff-08ddd6501530
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 07:49:19.9643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mhIM04Fej9aT4MNReqs6o8p/Qso9Hs5fu+ORHnqSeDO89X5Z7I+2kGGrc7Fs2Vqy/7HYho6D+BnfTGF9Cr8Lcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8561
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

On 08/08/2025, Shengjiu Wang wrote:
> On Fri, Aug 8, 2025 at 2:32 PM Liu Ying <victor.liu@nxp.com> wrote:
>>
>> On 08/07/2025, Shengjiu Wang wrote:
>>> On Wed, Aug 6, 2025 at 2:52 PM Liu Ying <victor.liu@nxp.com> wrote:
>>>>
>>>> On 08/06/2025, Shengjiu Wang wrote:
>>>>> On Tue, Aug 5, 2025 at 4:55 PM Liu Ying <victor.liu@nxp.com> wrote:
>>>>>>
>>>>>> On 08/04/2025, Shengjiu Wang wrote:
>>>>
>>>> [...]
>>>>
>>>>>>> +static int imx8mp_hdmi_pai_bind(struct device *dev, struct device *master, void *data)
>>>>>>> +{
>>>>>>> +     struct dw_hdmi_plat_data *plat_data = (struct dw_hdmi_plat_data *)data;
>>>>>>> +     struct imx8mp_hdmi_pai *hdmi_pai;
>>>>>>> +
>>>>>>> +     hdmi_pai = dev_get_drvdata(dev);
>>>>>>> +
>>>>>>> +     plat_data->enable_audio = imx8mp_hdmi_pai_enable;
>>>>>>> +     plat_data->disable_audio = imx8mp_hdmi_pai_disable;
>>>>>>> +     plat_data->priv_audio = hdmi_pai;
>>>>>>> +
>>>>>>> +     return 0;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static void imx8mp_hdmi_pai_unbind(struct device *dev, struct device *master, void *data)
>>>>>>> +{
>>>>>>> +     struct dw_hdmi_plat_data *plat_data = (struct dw_hdmi_plat_data *)data;
>>>>>>> +
>>>>>>> +     plat_data->enable_audio = NULL;
>>>>>>> +     plat_data->disable_audio = NULL;
>>>>>>> +     plat_data->priv_audio = NULL;
>>>>>>
>>>>>> Do you really need to set these ptrs to NULL?
>>>>>
>>>>> yes.  below code in dw-hdmi.c use the pdata->enable_audio as condition.
>>>>
>>>> Note that this is all about tearing down components.
>>>> If this is done properly as the below snippet of pseudo-code, then
>>>> hdmi->{enable,disable}_audio() and pdata->{enable,disable}_audio() won't be
>>>> called after audio device is removed by dw_hdmi_remove().  So, it's unnecessary
>>>> to set these pointers to NULL here.
>>>>
>>>> imx8mp_dw_hdmi_unbind()
>>>> {
>>>>    dw_hdmi_remove(); // platform_device_unregister(hdmi->audio);
>>>>    component_unbind_all(); //imx8mp_hdmi_pai_unbind()
>>>> }
>>>>
>>>> BTW, I suggest the below snippet[1] to bind components.
>>>>
>>>> imx8mp_dw_hdmi_bind()
>>>> {
>>>>    component_bind_all(); // imx8mp_hdmi_pai_bind()
>>>>                          //   set pdata->{enable,disable}_audio
>>>>    dw_hdmi_probe(); // hdmi->audio = platform_device_register_full(&pdevinfo);
>>>> }
>>>
>>> Looks like we should use dw_hdmi_bind() here to make unbind -> bind work.
>>
>> I don't get your idea here.
>>
>> What are you trying to make work?
>> Why dw_hdmi_probe() can't be used?
>> How does dw_hdmi_bind() help here?
> 
> bind() is ok.  but unbind(),  then bind() there is an issue.
> 
>>
>>> But can't get the encoder pointer.  the encoder pointer is from lcdif_drv.c,
>>> the probe sequence of lcdif, pvi, dw_hdmi should be dw_hdmi first, then pvi,
>>> then lcdif, because current implementation in lcdif and pvi driver.
>>
>> We use deferral probe to make sure the probe sequence is
>> DW_HDMI -> PVI -> LCDIF.
>>
>> LCDIF driver would call devm_drm_of_get_bridge() to get the next bridge PVI
>> and it defers probe if devm_drm_of_get_bridge() returns ERR_PTR(-EPROBE_DEFER).
>> Same to PVI driver, it would call of_drm_find_bridge() to get the next bridge
>> DW_HDMI and defers probe if needed.
> 
> right, probe is no problem,  but after probe,  if unbind pai, hdmi_tx,
>  then bind
> them again,  there is a problem,  because no one call the
> drm_bridge_attach() again.

In my mind, this is a common issue as DRM bridges are not properly detached
and attached again.
For now, only drm_encoder_cleanup() calls drm_bridge_detach().

Anyway, this issue is not introduced by this patch series, i.e. it's already
there.

> 
>>
>>>
>>> Should the lcdif and pvi driver be modified to use component helper?
>>
>> Why should they use component helper?
>>
>> BTW, I've tried testing the snippets suggested by me on i.MX8MP EVK and
>> the components bind successfully:
> 
> right, probe is no problem. but if try to unbind() then bind, there is issue.

I don't think the DRM bridge detach/attach issue would be addressed by
using component helper.

> 
> best regards
> shengjiu Wang
>>
>> cat /sys/kernel/debug/device_component/32fd8000.hdmi
>> aggregate_device name                                            status
>> -----------------------------------------------------------------------
>> 32fd8000.hdmi                                                     bound
>>
>> device name                                                      status
>> -----------------------------------------------------------------------
>> 32fc4800.audio-bridge                                             bound
>>
>>> This seems out of the scope of this patch set.
>>>
>>> Best regards
>>> Shengjiu Wang
>>
>> [...]
>>
>> --
>> Regards,
>> Liu Ying


-- 
Regards,
Liu Ying

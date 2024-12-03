Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2FF9E1176
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 03:48:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2347610E228;
	Tue,  3 Dec 2024 02:48:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="S22eKYSj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11013019.outbound.protection.outlook.com [52.101.67.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7DBE10E228
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 02:48:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r/OAXR8zo6bjuIzsRe1wl+Y+SJITDpWW9SRzMwvYROHUKCCxl/5cLUamIQR4jpsUtewX4caxKEp6rkZ7xkQ+MXjGAh3vNnRDZZAXJqcxOcCfG/aGmA7U0C36NpDROo3WiMzSPHRVH4Jqn1Qvr6hnUpMWTUGt22TwnwKbYJSpjJw20DN1rhmybnSfdFgoIaGrD0JGk3zM8A6vNJt+vTzVXN0Ytlwnmy0rvWfaA90itdMObowXpI3dE/rLd5VuKn5lfa7ZQSO3EECvXkrLELZl139ZiTlFb/GqW7FuXIsfoAw9M5IzJqfbcG2CgoLItuIcTHz9gcxFvJ6NF/Ua3dTapw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53SOCAeXGhXINmnXNYzNKd11ygZHmq95TMGe+x7FQRk=;
 b=hThRo6ugtM4ugXxplM0chIN5hLvO2aDsAaOwIQ+DDtJ+v2rlyGy/u+5Sybsy2fsnsN7CKBmgfm0PfZNFT2SfiKmdrMYgJD3agnwx2hbU6vDrl2er5q311OwERyhlThsGGi1rO1V7K/C7AEdOhlUsPeeWelEVHlNup3Cz/Hkyr3BWvW5MdMD+JEy/Izi7hS69Ovj1h0AlNf3oGN7vnwB1WhUzxizrH9u9ZOKIhk27bzAMu9MwwE0qbxffr3RoG2pEZ7lv/BRq5dchb4MGYNuPt6fT5X4Zg3i5GRbLho6cszvhYtlgVhm19s9GYEufGtb3vn6UD0ouG5ypDCPRMaUt1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53SOCAeXGhXINmnXNYzNKd11ygZHmq95TMGe+x7FQRk=;
 b=S22eKYSjAgVmA+Hswt8kb38w7uRMRLUHo0qovLyVnPfRVe/4NZAF8RoK+cMQMlLPoYg858t4cktBJth99qQ8fvPW/CcHv++slRdcuKnIcH2iFgpgRKn+jDgG7JNsKBkCZKpzUlXE/yN3RlBPScLTs6uwH8eO+8yoj0PWnNEySBQukwpyZZ0sFKr3zWj8HS9cWjcaifRH7HJ2hAzoXR+MiY+8/XI81M1CZ3pYxr5kpUnJzU4kFwgKlHxcQ49sZLDUS0jcsOmbtxARft3cv7gu/vxwwQ3SKkIu+dNoUoC13BbEquVh5Rd8jufmf8rnXp61myX4ensil51Px5I4wD0NHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.16; Tue, 3 Dec
 2024 02:48:48 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 02:48:48 +0000
Message-ID: <fcc54b2e-6e45-4f56-a918-bcd8b20c6331@nxp.com>
Date: Tue, 3 Dec 2024 10:49:13 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm: Drop explicit initialization of struct
 i2c_device_id::driver_data to 0
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Peter Senna Tschudin <peter.senna@gmail.com>, Ian Ray <ian.ray@ge.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Douglas Anderson <dianders@chromium.org>,
 Russell King <linux@armlinux.org.uk>, Sui Jingfeng <sui.jingfeng@linux.dev>,
 Jani Nikula <jani.nikula@intel.com>, Pin-yen Lin <treapking@chromium.org>,
 "Rob Herring (Arm)" <robh@kernel.org>, Hsin-Te Yuan
 <yuanhsinte@chromium.org>, =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?=
 <nfraprado@collabora.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 dri-devel@lists.freedesktop.org
References: <20241202114731.1005549-2-u.kleine-koenig@baylibre.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20241202114731.1005549-2-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0015.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::21) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI1PR04MB7104:EE_
X-MS-Office365-Filtering-Correlation-Id: 92e7731d-b1dd-4de6-c248-08dd134502d5
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bGQwWlVWYjJZYk9XbGtxZDY3NUtoOWxtWEVWOThNNktLa0orQ3QydXIyK000?=
 =?utf-8?B?cXcxWTZ1enQzby9oWi9mQUhSbHowMzZHQjdYWEhoV09tUzR3OEIvdkJLZjl1?=
 =?utf-8?B?L005Y3FRNzhMdEdhNUVtTzdjbzY5Ui9XYS80b0xLNm5OYll1b3ROSFpQQnA2?=
 =?utf-8?B?RU1USm94dzBHZkZXL1g5ZVRZajI5WmdzeGUxem5nejQwazRqV1ZtekVIOGlW?=
 =?utf-8?B?YTZ6d2dwUVlXMGZacTRkaUtzUzBNSU15TTVCOVhiTDUwMzdxVWp6WHpFamk2?=
 =?utf-8?B?ejYrY1kycFljTW1pL1R1SC9XWEYzVW5qekJBb2F6cVUwY2ZZSjVEU2VPMGVp?=
 =?utf-8?B?ZFJYS0JLK2RVTFlob1Z0aWNuVEJuclU0WTdCRGN6TndzdDR1QklDUDNhdE4r?=
 =?utf-8?B?OVJZNlFQNWNBcDN0NnJZc3E3dTNzemQvSUxjdUh2SVJQU21NeDJqSThLRFl1?=
 =?utf-8?B?SHhKZ2FHRXA2b05mWW14Y1VLLyt4N09qa2RNdG8yNTNSNDNrM3Y5VjBMVy9D?=
 =?utf-8?B?eXpyMFVFSTMxYkw1Q2lIR3p3bFF0dkU2bE1aWW9hNU9nYVc5OStLTHVxOVdu?=
 =?utf-8?B?alBZSjlUN1VGZGxhdjd1aXo1NHY1VmZwNDg2WUkyczQ3R2UwbVJyUkdWYlpv?=
 =?utf-8?B?MTJkajlVUnE4VC92eTNITXhQbzYzVG1JRStUY3FaaGVra2JzRkJabWRGeitv?=
 =?utf-8?B?TVNvcVl2VGpBS0hNK1MvVDc5ZjZEMWh1ZHNNUXE2NExUcFcvRHdCZUtRQ0pm?=
 =?utf-8?B?ZGVDSHZpOHhiMUJJNEd2ODhsTTFUYnBzQlVLZW1LdHdQOVFaNCtvWVlraVlI?=
 =?utf-8?B?SVJ6ZVo4dGNydVQwdy9RWXBJMDd6ZUFIZ2dkRmhUazRybGx6TnNmeFRoQ2p0?=
 =?utf-8?B?ZE5uUFBKSmZPY2NNUStpTWNhRk05NklUc3JubkxRbC9XUElwaGJraDZFZ2Y1?=
 =?utf-8?B?WDdDeGVZcE9vMVFlYzA3cXg5Qk1QZEt5RHM4OCtrdCswRWFYcHU5OXh3S21V?=
 =?utf-8?B?KzJIZlREb3Y0UDhVM2ZyUC8wRG9BMDhzb1IrVGMxcUp3b2NyR1Vwd0t5cVQ5?=
 =?utf-8?B?SFJ6T3I5YjNTOFQ4eEJwSHFzVGt1aFNMc3RDdXdmL05CaDdjb3BGR3Ric1Br?=
 =?utf-8?B?dDZ4NldrZzF3Sk9xRXl3Uzk4K1ZMekxNMXFTTkNRdUJ6SnZKR0E5ZXlOVlpB?=
 =?utf-8?B?MURaaEpjbDJ6WTZFckN4aUIvby85MkwvbXBhOGF4VDZKMXFYMHB5OHlWY3RH?=
 =?utf-8?B?M0tmRG1DQ0hjOFZZSnVLbDlaejBjbnZqdjkrOVIyOTBuakpHaVJpM3JCMEE4?=
 =?utf-8?B?ZGpwdFZxZXpLVGV5bG9GSWZDTkFUMW9pUjVNRVdvK1Z3SnN2djV2MDF4NWtK?=
 =?utf-8?B?cmtGSHpDSDVURnBrZVdQckExa0x0NGJpVVVmUUZPeUlRb1RXL2JtUUIyQWM5?=
 =?utf-8?B?cU5UQjRMaG5BL20zeEdKYWpNeVZ3R3pVbU9BVFcyMHljbGhpazh3Rmc5cnow?=
 =?utf-8?B?VzRkNzhwUS85RG1vSnJSbVZYaWtiMGM2U1hKSlRFd3c2OFpYZTVMMTFFa1Vj?=
 =?utf-8?B?N2hUaUJzS0tJUGNmdkRUMEx5NnNCajRuUnJUd1drSkY1UG03WmVNTEZIY0pD?=
 =?utf-8?B?a2oyTk5Id0ZWVExWcnNuUlJpN1NIMDVWclZ0NExlKytaNG55TlB3SWEwUlMr?=
 =?utf-8?B?YUY3VzhZQmx1OHdKWXp1aW81NjVrU00yNGZhLzdYL3dWK3V5VFo1V1orQSta?=
 =?utf-8?B?b3k2Q1R2bXBRa0RSSmtpRVdjbkpjUnhZTzJ5MlM2ZHo3SkVXaTFwL0FaU1RQ?=
 =?utf-8?Q?vXipFq+ry755u2Xo2W9qvw9gruGN1yNRBdWA0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUhmaUpOUjA1T0hCenhRRmh6Rk42VFFPZ05DclVXVkxXNEFHWTZxTmVFY3A0?=
 =?utf-8?B?K1daaEN1YVM2bXBQeVZMSnJWTWZGbU5hY0JMZlEraVNzdmgxMURocDdaVVVQ?=
 =?utf-8?B?NGVicFhxbmY5eW9qREhpMDk5RjFSUkxaWUVGYmlUeEM5bkNXQjlncGFsQ3Ba?=
 =?utf-8?B?VzVGRkJYR1c5WHdhcU1nUnJTeHk4a0haK1ZHektrdUh5QmZjbGgzTGh2clhX?=
 =?utf-8?B?UjNZMjErcFVkb0k0cDlWVSsyYXJabjZ3M0N6MEVxdm5XRzJWK0tTWWN0d243?=
 =?utf-8?B?M1Btc1M4K3ZBUkQ3eC9vQzJMWjkwbjhUdDZaYUVXYUNINmNtcEROYzlxd3dV?=
 =?utf-8?B?bFkyM3RNZGtaRFpwR3ozY1FFYThMa3FhdzRmSnYwbThFR1lMTkxkaERKdjFS?=
 =?utf-8?B?cEkwaE9FTCtXbFpSbDhMaTVmeC82dWI2VkRZQ0Y5WHY0Sm0weGJQdzBENDhI?=
 =?utf-8?B?dExzU2R0cjJnWlp4b2hDK1BKRHl3V0Y2K3o1bnlITEpYbUVZeG9oODFBUjcv?=
 =?utf-8?B?TE5uNEdEc2hVTFBRMzRHemJhbGdCUVhQNWVkSTd0QXMzTDJVU0x1UXIrQmNL?=
 =?utf-8?B?QmVTek1MRkNFbGZsVi9Nbi9STENOckcrYnRFeVd4Z1NIMU01ZWdKWnF5VC8y?=
 =?utf-8?B?MStEclZGNTE2U2pVd1BsaFFBWWRpaVAzckxmaFplWFdjUzltajJ4czdGREFF?=
 =?utf-8?B?Z3lXMzZhSkJqeWI2N1ZldGpjSTJnZFdJSFlScVlHWlpoeUxWUFRiLzQ0V3Bh?=
 =?utf-8?B?RmRwMXlvWWtFVENMbGYyUGYvZkNxUitBaWNvRWdOOWNhTzBuRlFOY1R5ZndH?=
 =?utf-8?B?Y01jYUlPbTBIa2NSRm1tVlVrdmk3WHVEVDVGcWtyRWN2c2lTNkd0TzJyUFBP?=
 =?utf-8?B?R09iWCtlQjk1Y05GSlh5RTNoUHFxR0s4VEJDQi9KWWpIODM4aG41NGR4N05N?=
 =?utf-8?B?Z25UeFlPUWVzWDhLNUdzTE9WdlYzc1FwRWpybi81Nm44VHp0RTFMcUM0RXRM?=
 =?utf-8?B?Q2Y2ZW1kSk9SOXllOUhENzlEK1YzejM4ckJwQjg4bW1HVlUwSGk5aEt5SENT?=
 =?utf-8?B?UnhWVm90ZDJvT1VIdUJkbkViNzNrbVFnTExKTXZyaldqdnAzdE5wdWI5Rm9i?=
 =?utf-8?B?OC9lZmZjdGdGSDd4VHNoMSs4Ukp3bll0ZlI3UHZDZmt6RWJzUlNaWHlkSWlF?=
 =?utf-8?B?SHdwNnJLQnoxTTBQekhQSXBLcnNRVW9oYjQzYWpqdGZtTnNLWFJuUjhxSXYr?=
 =?utf-8?B?YWVkck5lYldFV3FJcGc3ajJGa2FYcHNscW9rYm5QWDZzZHpEZmlPaVB6Y0Zu?=
 =?utf-8?B?d1QxQ2k3MzlQb285ZmhHejJBTmpJUm05WTVXbFVBdUhHYzdJQS9RMEZ2RVcr?=
 =?utf-8?B?NjVVT1JvRDliRGRPWTV1T0xicHhzaWVVWlp1ZjJzSnFYbVp6cjZPVUl0enFU?=
 =?utf-8?B?Zk1ZSUhGTGFoQk1IWi8xbklUbjNCZ09JZzdMZWVpajFBaThLRmRQQTkxUXNU?=
 =?utf-8?B?WW5iVmREYU81OHFKK3V1dlMyTjgyR0hzSU13bXArSVR5eHQ5R09XRU9vZ2VN?=
 =?utf-8?B?eisrcUZRUFEvRjN5WDBudEtLNk0xakRCcmJ3dUNyZnBhaVJiQnU0SlpickRU?=
 =?utf-8?B?WmNaRTZFalBMaW40ajg4bDYzM2dCWEVSTmVXcWY0dmVORTFJT1lES2Y1cnlB?=
 =?utf-8?B?a3lHS1U3R1BOTlJJdlpPOVlJL0NQMERxaEROMG9xeVpCcHNUTVc1RnJpUDlG?=
 =?utf-8?B?MDFnTEFzQWxHYStWZVJFSi9mTEs3S2NndXVGY0dNUlpuT1pNSnVjam8zWmdD?=
 =?utf-8?B?QzNxNU9oWHNRejlhT3pDdzBpZTVPK0VENUdmZUhTRVBrU3p1ejJlOGZEMHF5?=
 =?utf-8?B?VENhMUVXMkxPTFYxVjZPd1I3RWVKQlUxSlNLZE1kSE1wTHpXbDhNZjk3bS9R?=
 =?utf-8?B?SXFZTjdBZmVCWHJZbTJrUW1BZEU4M0x1TWlqZXFXUWtZMHVCT2FXdVJSdWZm?=
 =?utf-8?B?R2c4MVpMUmJVNjVCMURuZEcxS0d5eElMWisyLy9oNGdBMUJ5TTJBcnhjeTBt?=
 =?utf-8?B?aVl0MWp0dW51aXFNK3BBWWtwSTV1bTMzQURQOVhSL3NoZXVGZGFnb2JpMkRQ?=
 =?utf-8?Q?hllgBMVlDtp7VKp+cxRUFnNqY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92e7731d-b1dd-4de6-c248-08dd134502d5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 02:48:48.0338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ukmC8NIhqmUv5WdvKN9Cmz/SyCIQEj+N6pDzVYY4Or/6L2afVebRQwJRv7KD2K/M1sWzLpmNxiCc3yuMw71G4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7104
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

On 12/02/2024, Uwe Kleine-König wrote:
> These drivers don't use the driver_data member of struct i2c_device_id,
> so don't explicitly initialize this member.
> 
> This prepares putting driver_data in an anonymous union which requires
> either no initialization or named designators. But it's also a nice
> cleanup on its own.
> 
> While add it, also remove commas after the sentinel entries.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
> Hello,
> 
> changes since (implicit) v1
> (https://lore.kernel.org/dri-devel/20240516123837.81664-2-u.kleine-koenig@pengutronix.de):
> 
>  - Update author email address
>  - Rebase (trivially) to latest next
>  - Also convert drivers/gpu/drm/bridge/ite-it6263.c (which is new since
>    the series was orginally sent in May)
> 
> Best regards
> Uwe
> 
>  drivers/gpu/drm/bridge/analogix/analogix-anx6345.c       | 2 +-
>  drivers/gpu/drm/bridge/analogix/anx7625.c                | 2 +-
>  drivers/gpu/drm/bridge/chrontel-ch7033.c                 | 2 +-
>  drivers/gpu/drm/bridge/ite-it6263.c                      | 2 +-

Reviewed-by: Liu Ying <victor.liu@nxp.com> # ite-it6263.c

>  drivers/gpu/drm/bridge/ite-it6505.c                      | 2 +-
>  drivers/gpu/drm/bridge/lontium-lt8912b.c                 | 4 ++--
>  drivers/gpu/drm/bridge/lontium-lt9611.c                  | 2 +-
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c               | 2 +-
>  drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c | 8 ++++----
>  drivers/gpu/drm/bridge/nxp-ptn3460.c                     | 4 ++--
>  drivers/gpu/drm/bridge/sii902x.c                         | 4 ++--
>  drivers/gpu/drm/bridge/sii9234.c                         | 4 ++--
>  drivers/gpu/drm/bridge/sil-sii8620.c                     | 4 ++--
>  drivers/gpu/drm/bridge/tc358767.c                        | 2 +-
>  drivers/gpu/drm/bridge/tc358768.c                        | 4 ++--
>  drivers/gpu/drm/bridge/ti-dlpc3433.c                     | 2 +-
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c                    | 4 ++--
>  drivers/gpu/drm/bridge/ti-tfp410.c                       | 2 +-
>  drivers/gpu/drm/i2c/ch7006_drv.c                         | 2 +-
>  drivers/gpu/drm/i2c/sil164_drv.c                         | 2 +-
>  drivers/gpu/drm/i2c/tda9950.c                            | 4 ++--
>  drivers/gpu/drm/i2c/tda998x_drv.c                        | 2 +-
>  22 files changed, 33 insertions(+), 33 deletions(-)


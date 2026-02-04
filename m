Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJiLLMTmgmlTegMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 07:27:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FFFE24E9
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 07:27:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EC8010E0A8;
	Wed,  4 Feb 2026 06:27:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="a2f9KPOs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013036.outbound.protection.outlook.com [40.107.159.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6728010E0A8
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 06:27:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QvWgUeZLv1/JW0nr53T4ge3xRH5PY+8f4avOVGGVkwed2TUUW0SVPc6/URwfSvdO0o1UCrlNpQs08m+wk9Xivbgwx4R1+auC06lO55RzQfRRJtfTq72j3guevXNozMVA59Y7go+ZS1jUOlMP8ZfKdv4g5KbWt/K0bd1ZTi7T87tZRsDczYNragM7I28lCK5BKV8KiPnZ80dQRSCY+R0tsBRfMPMgvvlr60HGHN++bukTCSOEKlll5Hj3xqTIslvOobjbdHvhNttOjsdBagKJT8qcKDNk4zjp0fIMMz4DiS0zRieH4n/uRzHgZ/rWXuE+oHd9Cuag+4NH+pMULwynUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ddgNy7SSCIZX4V4ruKs9xS4XH9JdQo1DksL1o0V/wHg=;
 b=RGVC1TsUJomjfP5ey5fp5y/MMYO2GYhB0EV1zAVqUddjHxPDzguFA+bO1VBx7IgppMgVTg70deJ7IJD7Wm9PP9QqOrxyZLiOqw7TkuB5nid5lxVsx1B1zvvYpQCea9I4+6SYUi+elBFURVE468byHT/7khQ+9rzmbmsMS1xloMPBuK9fyM5LkogdHbk5mdeQzvldthwlivrnm/iaGp51Az3ICnPURLJtlP2V1ypmnWpFl4RjAEaEXckz17LeF7EU61KUlJcOhyEuTStW3sCcf3CX4e9vgTB+IJxoyU2mbVemN4VEcJ88OHgLvq3WS7aYp5Qs/EKTW7lvyy8E4MaIiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ddgNy7SSCIZX4V4ruKs9xS4XH9JdQo1DksL1o0V/wHg=;
 b=a2f9KPOsc6AD8Yk6khrfylFUE4RgrdW5zTcKkgwW3+AOySiKK9DvCBuiY7lMBvpdbOmPHUAQP9fpslyA1uYLzQqSbgrBjJgpKIw+FmrzU5oHkO+M7+tFbI9p1ljxgqByUCT+3a3xFoyj1sXSq1FoYJSdxBpYK9wyAuHECU4eE9E2gyV3lXH2IfhlaxYtc685GbAPkdNO+yIwn6II8OkWeV6QaNG5rFBeMNOCMug+0NTLkGTZ1h+HjzfxBaZmbNNtOFDwxqONEQ0Z5Rn4SnXeclD+QT9XwGOFusJEgq7j4PFBNs2srqi2H6ltvO997jVRyPldGVi/ZUL1F0RlQWKMBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV1PR04MB9515.eurprd04.prod.outlook.com (2603:10a6:150:24::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.13; Wed, 4 Feb
 2026 06:26:37 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9564.014; Wed, 4 Feb 2026
 06:26:37 +0000
Message-ID: <8d8e678b-bd3f-441e-9496-e1461a1289ea@nxp.com>
Date: Wed, 4 Feb 2026 14:27:31 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] drm/bridge: imx8qxp-pixel-link: get/put the next bridge
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
References: <20260203-drm-bridge-alloc-getput-drm_of_find_bridge-v5-0-66bda8d617b4@bootlin.com>
 <20260203-drm-bridge-alloc-getput-drm_of_find_bridge-v5-1-66bda8d617b4@bootlin.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20260203-drm-bridge-alloc-getput-drm_of_find_bridge-v5-1-66bda8d617b4@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0134.apcprd02.prod.outlook.com
 (2603:1096:4:188::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV1PR04MB9515:EE_
X-MS-Office365-Filtering-Correlation-Id: 98978304-e718-4d6d-be8a-08de63b659c1
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|7416014|376014|1800799024|366016|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmdubElkbnVMRWJaTGxIOEliR0FQY3JKQ2tpQVZwUzQrYXVCSEIySEU2aXRO?=
 =?utf-8?B?YVR2U3IxVW1BMGxEWk51TnJod1VQdkVtMWY4ZUpINjZ5dE80L3RhcUdVejR2?=
 =?utf-8?B?Y2JSNy9KUlZCckpObkMyNFZORjhYNGlWekUydnJNZnpORXU2V1NBaHhsbmtw?=
 =?utf-8?B?a3NXL0RSOHBtY0hLVVNGUUFBQkJVbXNnemhxM1VTMDV0RGpQeTZIWXFaamNM?=
 =?utf-8?B?Q2tOVEZsb0tOWnZoNGxMMFFLaFJOenpiNlY3QW01WUZodzEydzhrczB0RjAw?=
 =?utf-8?B?OFd1dW1ndzY5M0RyVlJnLzNzanVNeWpqTmtOWXhUS0xKeUJvS3Vsa2xjTW1v?=
 =?utf-8?B?Z3dROWo0RTJENnBaZlQrTlMwWEJEMUd0U2hnK3JrVzVvQlNpVWV3WUc5ZWdt?=
 =?utf-8?B?Mk1RU2NtQlJCV3Y1Znp3N2k4Skt2cERXVEV6b1l1WklXTHQ3TlRrYWVOVStD?=
 =?utf-8?B?MGdNc2h5RkRwanhzUHE1R2xaa2lpNUYxMlhoK25LcjVmcWI3T3FtRXYzdEYx?=
 =?utf-8?B?VTFtbi9GZzF4cWFIbnFJUnBCRWd6OWlhYm1jZkgxdGpiV013YXNjUGEvZjBz?=
 =?utf-8?B?NHM4VUM3Z0VoMnFNaUZJNTdvNitHQWxrN2ZBNElYSmV3Tk04bDQ2N3NmRkw2?=
 =?utf-8?B?WVMyUUE0Ung5SjNCY2hDVy9TR1Y3WEw4eWE0MzJkWjZpR3k2RGdvQXFnenZr?=
 =?utf-8?B?QTBRNldaMHcxZFhiWjZOVXNZQ0J5T29HWElsNUJuM1orL3RkZUdOS2lyVVpl?=
 =?utf-8?B?TGVwOWhyRWlhZVVVMTgrT3JjRUZxbXo5bStKOHJqN0hnK3d6Q3JzYU52dytQ?=
 =?utf-8?B?RlZEWm0yaSswTkNmcnhrc1NDTzFhb1gvTWVlalU5MkNoMUhTK01ET0Z3SU1E?=
 =?utf-8?B?aWYzUGlWWks5cnlCS2IvMHg0S01uNnBUS01ucFlXNUNuYUw3YjlFbmZpVTNO?=
 =?utf-8?B?cnVZVVVGSm1KempJaDJCeHJFVnVDN29wN1A0RjQzOVg5L3U2c3BDb0x0elVZ?=
 =?utf-8?B?eVViRDY1ZDZJeFp0d3ZrTVZyYkpyVy9aY01HVjFRM0ozbW1taTJVUWE2TjBw?=
 =?utf-8?B?OFFLczVqTDRPcXVub3NnTzhUUkdtamJMeXdzcXNKOEZrd0dlMEhqWEQxNExX?=
 =?utf-8?B?eFpxM3pqSWNjTmRSWmxFQXdzLytBbHBqcTg2NXA0L2c3bW1neTdhWURwWnh5?=
 =?utf-8?B?aUQ1MEhiUkQ4RjQxWnVQQTRUOG1iRVM4Qjd6SVBBY0NVWEhDQnlNazQvdmM2?=
 =?utf-8?B?UjNpYjRQZ1Q3ZjB2a1h2TkxUemt5cXA5bFB0OTVETXNkdUZtNmsyN2EwUitW?=
 =?utf-8?B?T1VwdnRDaS9xcE50aEt4YmthUHhwWU1kZ3BzclZnb2o0VE1sU3FkREJRWGpn?=
 =?utf-8?B?MjNQMG91R0UyeXNJeitrQjZhVG5FRnBvQStuNytrWUFnbjBBcElaZlpnTEY1?=
 =?utf-8?B?dStheUZYTnVUU1ZMT1NwQVFiRTc2SmZqQmZjMkp1YnhQLytoanlSbHkvVTNM?=
 =?utf-8?B?S3VBeXQ5YUY3Y3c5RFRkZnVYVVNQVmt6MVg1cWVPZnBuNzRtRFcreEs3M0JO?=
 =?utf-8?B?SDB5TjNtMkRJY0o5MHNUUGsyK3E3ejBHRXZ0cUNhVk44SFk4VlpRdldrd0pO?=
 =?utf-8?B?NFdwc2lFRHpyaTNCZ0E2ZkpHbzhPM2tkTjdMVTJYR3hITUNjSzh4ZDk4R3Bv?=
 =?utf-8?B?TmQybHpMbmtTTmNncmdIa0gxVHAvcFhEMjlnbW5Xa202M1lXQnpvN0FPYjRZ?=
 =?utf-8?B?YkJNcEhCMGNmWi9Gd1pReEE4dXhKNjc3ajVYMmFKZjN5c2t2Y2taQlhxOEJZ?=
 =?utf-8?B?bkoxcS9QZ243c043SGlPdTFBRitTTExTb2xDWG1XcHpDdlgxb0tTMlNvblBk?=
 =?utf-8?B?VmNnSm9TUGJxUUZVazMrRWNWbjUyaE53dkY0RzVRTTRLaEZreHlqMUR6UXB0?=
 =?utf-8?B?N1VRUmoyQUtCb2RHWWgreWdneE10Wkx0S0wwb2xFQmdGUlN5VnZEbFpDNlVh?=
 =?utf-8?B?R2I2VEdCVEZxdHdZL1l4aUgwKzZTdk5Dc3U0ZzQyWVNmNTliMUVnd1J1Q093?=
 =?utf-8?B?aUQvaU10cWR5WXp6VkVJNTNwVE9DcmZXU1d1ZTNsd0orVTNNYjBlUks3dkFG?=
 =?utf-8?B?Zy96L1Rvb2h1NFliUllMZDdiNWZMWDZzK3JIa1FlOUhpZVRFQ0xhOENCUHNS?=
 =?utf-8?B?L3c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(7416014)(376014)(1800799024)(366016)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGtvWW5yRDZZMnlpclI0SElwK0hOM2dpWENRQ2l0aEl5S0tQZUlkb2t4VmJq?=
 =?utf-8?B?c3ZDUDVkYXR4WjNpT2c2WUpjNkFiRGErdnljZkN2VlQ1alVVOG9sb3N3VElC?=
 =?utf-8?B?ZXpQMlR4dlZkN1ZRTUhhRTRkSnowZEhhQTQveDJtVENUSllDWjZmWG1BbEZP?=
 =?utf-8?B?YzRaVlBlaThkeURKRzhsRzk4dkliL0d4QW1iMi9jZTNadVZSRkxUUGRwT0Iy?=
 =?utf-8?B?QkF1S0I3R044dWpKcHZDRURBNngyc3pEaTlXdkxScms1YVNFVk03ZUU4NDdY?=
 =?utf-8?B?MEJROHRoZjBKRTRJVU9pYmEzRXY4V09mZlNROXlRY0dYcWdtM0daNkp5YnBK?=
 =?utf-8?B?OXBXMnNRRVlJajRXZTg1cGhxd0xoVDFsMHR2VGVIR0RkN2U3emxTNmlLMFE1?=
 =?utf-8?B?ZXNWa2R4KzVIc0pYNFQrMFRwa0pKK3FxK3FSZGJzYllCSC9tZWJXNlVsZFZm?=
 =?utf-8?B?RXMyUisvV2tlREwxU3liNnE2azlab2FnM0VVYXR0MlE1WjNHdGcxbm90K3p1?=
 =?utf-8?B?b0NLZHNOaUVzajlnM2tZWU1kcWdkaXZOUlNNVDM3VFJlQml6d3RSSU1vNVBM?=
 =?utf-8?B?clVBZFB1K2Vzb2hMRDFUMVlXKzhJYVN2VWZROGpIRXFnSERXUnFVS3NkQmlu?=
 =?utf-8?B?T2tVd2Y1dmQ1cnFiRk5FK1RFNHA5SmxBZS95WmJRS0VwMFVLbDRHRVovZEF6?=
 =?utf-8?B?dGlHQTFIYnRGbVg3K0l4Rm04Z0sxUTlSRGhyR250Wlk4OVJvMUZDQ09KYndE?=
 =?utf-8?B?RDM2MHZFSHhSWlEyOTNxTnpMQlQrRWlSZ3QyUFVGbTBmeWo1VTFlcmxraEtu?=
 =?utf-8?B?SGVDSUtqeWlob3k0ZG80NVZOUWJ0Z0dDRDgyS29vTkh0aFRBbU9xbXJnV2w2?=
 =?utf-8?B?cHRLMGZGV0FRc0twNk9LYTQ2WUM4L0tCWk5Eb1RtM3NjZzczVXNUc3VaQS9v?=
 =?utf-8?B?dFdGWkFRckQ1ZjFXL1o3Smw0c21Ed0hUN2t5M1o4aHJ0NHBnbkpsaTYzZlFj?=
 =?utf-8?B?NS9ZVUpsdEhaZ2J0ZHUxMVF4dDJHS0pEdmtJVldFOFZRL2lSemhWNUNUYmtT?=
 =?utf-8?B?MEpzNExHYWprOHFkeWRUWGkxUTlWcWVQaTJ4VmU2c3IzZUFkQjg0Qk9JNGpN?=
 =?utf-8?B?dGF1aS9EL2phbzhqY3krcVpVSFJZTytCR2JqSU91UEZNVnBMN1NLUWZDbjJX?=
 =?utf-8?B?aityNndmYUJWeCtidnFscGgveVp4U0x5MXk2U3QvTDh5cU9vcGQ5U2Rwb01Y?=
 =?utf-8?B?Q09YOE1yWHdzMVVPWVRQVzV0dVlsT0orVVNBQlJoTzA1TjNNWFZUTFJlOEZv?=
 =?utf-8?B?RG1yTHlxWS9rd2x1NTB2WXRMY25tUjJ2aFBQM0ZXbzFJTVJydjMzN1Jka2ZL?=
 =?utf-8?B?dVVOazNRUHdnNTJIL3h2dGd6SDRtQnVOUjBhNllZaXU5TEhZU3VtSzZQS1ox?=
 =?utf-8?B?QnBiaCt2Y1RmK2gvVVprckdDcGc5RnIvMk1mdTNSNzFLenZmUmVQVFFSUklY?=
 =?utf-8?B?azhXeHVMTHVuSWRsQnpQVDdtTTNub1c2Zi9OY0pyeTZ3YUJNMmNjNHhFNjVF?=
 =?utf-8?B?YzBhSDZoUDRScEVPN0dlc3BpSmExZEZmMFNaMlhWU3JqMWIyMExVRk54SEhZ?=
 =?utf-8?B?SmFqSWowWklzTFVtN2pFcXVsWGdHQU4wTE1haFlXbjFIUHlpZmVMU3JjM1FG?=
 =?utf-8?B?cHcwN1Z3Kzl5NXpseVJhUjZZYnV0K2pFYXREdnhMeVhSRUZLNWxNa2Nxam55?=
 =?utf-8?B?V1ZVc2JxZlR0VVU0NXRMOWtBQ3VyczJGSCtiNVlhS2I0TE9veUN2SkxFM0l5?=
 =?utf-8?B?NUFldkpkS0RjeTgwVGZaYjNkeHBjbmJXYTN4N05Wc2ZaR2RMc0hmOFQzZzY4?=
 =?utf-8?B?clVyS0ZacEMxbTNwMkFvSWhxSTB4RWxJVmpLSU1OTHFOcFlySDI1d0NqK2s3?=
 =?utf-8?B?ZVBMc0ZNdEJ4b25jcVk0b3lzTDdPRmQrOWNvc0pMdWh5UnZXNTVHT0VsbTF4?=
 =?utf-8?B?eXpyakpSamFXa0VTZm9ZRThKQlIwaVlNbjUyMnd0dldMNTF5VnBYZ0Jmc0E2?=
 =?utf-8?B?UDQ4VnM3TE1PdVVqcmVJeTUzZ2JtdXBEY0FLZ2piZGNrdjZ6MzhJdnI3ZCtX?=
 =?utf-8?B?cCs0S0U2eGhFQkVhTkFyK282bjEvNFN0cXRiMlp5T3lsNzJFSHVTZjNFTnJ5?=
 =?utf-8?B?NkJ3VUU4VG55YjdDR1IvR0tyNURtV0psWDdDbTNqblFsVk1NWWsyOEFIMHNk?=
 =?utf-8?B?OWRCRlQ1NHFRMUUwd25JV2RYeEMwWU92eWVBN21nQjFHK0x3b08xRUpNenhY?=
 =?utf-8?B?dzBueGk4RWhsRnhZaENjVEFuY0pFb0hSMjZKMmVPcTFCNE1HaGg1QT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98978304-e718-4d6d-be8a-08de63b659c1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 06:26:37.5532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AE1q9/sFrHDXUZQP5lGNDu2hEnY6IKw2mtQHopa8egyJKJJeTdoKOA1Nrb9wI7H375SwJ84QYyQ6YX9vY+tM8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9515
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
	FORGED_RECIPIENTS(0.00)[m:luca.ceresoli@bootlin.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:Hui.Pu@gehealthcare.com,m:ian.ray@gehealthcare.com,m:thomas.petazzoni@bootlin.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[bootlin.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 16FFFE24E9
X-Rspamd-Action: no action

Hi Luca,

On Tue, Feb 03, 2026 at 11:35:25AM +0100, Luca Ceresoli wrote:
> This driver obtains a bridge pointer from of_drm_find_bridge() in the probe
> function and stores it until driver removal. of_drm_find_bridge() is
> deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
> refcounted and use bridge->next_bridge to put the reference on
> deallocation.
> 
> To keep the code as simple and reliable as possible, get a reference for
> each pointer that stores a drm_bridge address when it is stored and release
> it when the pointer is overwritten or goes out of scope. Also remove the
> intermediate selected_bridge variable to reduce the refcounted variables in
> the function. The involved pointers are:
> 
>  * next_bridge loop-local variable:
>    - get reference by of_drm_find_and_get_bridge()
>    - put reference at the end of the loop iteration (__free)
> 
>  * pl->bridge.next_bridge, tied to struct imx8qxp_pixel_link lifetime:
>    - get reference when assigned (by copy from next_bridge)
>    - put reference before reassignment if reassignment happens
>    - put reference when the struct imx8qxp_pixel_link embedding the
>      struct drm_bridge is destroyed (struct drm_bridge::next_bridge)
> 
> Additionally, split the somewhat complex if() for readability.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changes in v5:
> - rewrite commit message after Liu's review to clarify the per-pointer
>   get/put idea
> - split the if()s involved in selcting the bridge
> - remove intermediate selected_bridge pointer
> - removed Maxime's R-by, patch changed
> ---
>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
> index 91e4f4d55469..e29e099b893a 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
> @@ -23,7 +23,6 @@
>  
>  struct imx8qxp_pixel_link {
>  	struct drm_bridge bridge;
> -	struct drm_bridge *next_bridge;
>  	struct device *dev;
>  	struct imx_sc_ipc *ipc_handle;
>  	u8 stream_id;
> @@ -140,7 +139,7 @@ static int imx8qxp_pixel_link_bridge_attach(struct drm_bridge *bridge,
>  	}
>  
>  	return drm_bridge_attach(encoder,
> -				 pl->next_bridge, bridge,
> +				 pl->bridge.next_bridge, bridge,
>  				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>  }
>  
> @@ -260,7 +259,6 @@ static int imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
>  {
>  	struct device_node *np = pl->dev->of_node;
>  	struct device_node *port;
> -	struct drm_bridge *selected_bridge = NULL;
>  	u32 port_id;
>  	bool found_port = false;
>  	int reg;
> @@ -297,7 +295,8 @@ static int imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
>  			continue;
>  		}
>  
> -		struct drm_bridge *next_bridge = of_drm_find_bridge(remote);
> +		struct drm_bridge *next_bridge __free(drm_bridge_put) =
> +			of_drm_find_and_get_bridge(remote);
>  		if (!next_bridge)
>  			return -EPROBE_DEFER;
>  
> @@ -305,12 +304,16 @@ static int imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
>  		 * Select the next bridge with companion PXL2DPI if
>  		 * present, otherwise default to the first bridge
>  		 */
> -		if (!selected_bridge || of_property_present(remote, "fsl,companion-pxl2dpi"))
> -			selected_bridge = next_bridge;
> +		if (!pl->bridge.next_bridge)
> +			pl->bridge.next_bridge = drm_bridge_get(next_bridge);
> +
> +		if (of_property_present(remote, "fsl,companion-pxl2dpi")) {
> +			drm_bridge_put(pl->bridge.next_bridge);
> +			pl->bridge.next_bridge = drm_bridge_get(next_bridge);
> +		}

Can you drop the intermediate next_bridge variable to simplify the code?

-8<-
if (!pl->bridge.next_bridge) {
        pl->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
        if (!pl->bridge.next_bridge)
                return -EPROBE_DEFER;
}

if (of_property_present(remote, "fsl,companion-pxl2dpi")) {
        drm_bridge_put(pl->bridge.next_bridge);
        pl->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
        if (!pl->bridge.next_bridge)
                return -EPROBE_DEFER;
}
-8<-

>  	}
>  
>  	pl->mst_addr = port_id - 1;
> -	pl->next_bridge = selected_bridge;
>  
>  	return 0;
>  }
> 

-- 
Regards,
Liu Ying

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCgcCP9UpmkbOAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 04:26:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EBB1E87D3
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 04:26:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 697C310E0D9;
	Tue,  3 Mar 2026 03:26:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="W8aTvgqG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011067.outbound.protection.outlook.com [52.101.65.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3432510E062
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 03:26:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HOEfvw8q0jIOwgkbncnHJ2GL5X7i6Tj7px7T1YnkbXbwsTMEsZOEpASMukxyzFJoRws5FdN5+WH/0LfcbPKWF3wJeabqj53LhZQiYHI7vgHHnmfw3Arv24Q3kZhCcESb1oV+f4FJ6x9QQ4X3fL+8AJgl7AfWRJxb0EQhoJFC7DIGR9mJAeB9UYKU1X1+zSGA0xXQn3VmAOFTNbrsKYn0PIU5e9LT/Hnd1jn24tVjS23MavJuCMtUViqA5r7F2ORXNro/xfvesxdK0JTe5b+mKtwdhKQz9CnL4fU8iOO59LdhzpMOuP2q8korawidbA6hL0HPRylL2ulw1hOzBpBNfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mIasAHDLSzISZzVhXZRcVCvTbpclaZPDamrTHxqYo0M=;
 b=UZYNkRK3uXyp6TTzrXpJfx1kG+4qwy8O80GTzOS215fgM92aax4MGEE9Eh5F76Ago/DYW2Ae/MvfvRP530UDOTKD2reHnTiaA0gT2Hls3T2uaAhzceMTbJ1Wnw83b2C6/RpjguoE3m1PADIbaYhsP8n0GDfu/Z8PW55YQxr8Yk0JOFGt4w1c1HFNxdm92OPNllyaMcEZVxJC4Jurw+Oi/XruAfrRQIXminp86zMdafXtqkjCPOW8zBvG+RJsxwX2oot02/pxMJ4H0oGibexfu3kCN/Vtx+Gtn30zxFmBiRionkuIwiocKvD9Bt6VYM8ZVakurEBAO+O+kE08+XmCyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mIasAHDLSzISZzVhXZRcVCvTbpclaZPDamrTHxqYo0M=;
 b=W8aTvgqGQzeI16vpQUv9iXTG9xW9fnabTbagjVwnhcmAoYczNwbWu3OmyemaTbFhQR3vmiYGgEEeGcWSpgnpHF6386MnyvH5NnH0LoTporCTapOvEyFTrB28OTQF+U1xhNzDxZ1njm87W/a6840h62CtShGO/uJR1Gxn6V7qlaKUKrRwtfz8L623LVbK6fiFsJPDHMHyhzkxZf1uYt51Ul0ZF+VgkPPwfT+O4fzSpKGoJMjgoxIhp9Edc8VjRn0EjlbuOSjZ3HbC1ma/4EMDq2UPaIo85fs+myyH1qC8hU3ajteeWDyxWJbab9hYo5K3pPRBKgc8NhU45uHueX8MBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB9664.eurprd04.prod.outlook.com (2603:10a6:102:262::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.19; Tue, 3 Mar
 2026 03:26:46 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 03:26:45 +0000
Message-ID: <d97a9c0c-bdda-466a-8131-73799cdb20cd@nxp.com>
Date: Tue, 3 Mar 2026 11:27:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/3] drm/bridge: imx: Add i.MX93 parallel display
 format configuration support
To: Marco Felsch <m.felsch@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 luca.ceresoli@bootlin.com
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, frank.li@nxp.com
References: <20260302-v6-18-topic-imx93-parallel-display-v10-0-634fe2778c7a@pengutronix.de>
 <20260302-v6-18-topic-imx93-parallel-display-v10-2-634fe2778c7a@pengutronix.de>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20260302-v6-18-topic-imx93-parallel-display-v10-2-634fe2778c7a@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0181.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::8) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB9664:EE_
X-MS-Office365-Filtering-Correlation-Id: 80949eb4-a210-442f-d4ef-08de78d4b279
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|19092799006|366016|376014|7416014|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: j6teb9P95moZJnKMPoRmgguumrJIpuoUBfRIpGaVBGFyb8seGO033kblbFIfXYrq31drGr8YBIGvUEM1KVaOinarng3gF6AHmEXibCEHEbt8oUg9bFOxk1TGrvIU0dOrZYWDIH5/Pap6ULrOBKM6uA3YxCTmMj4Sx0jlIm/dUYDBQhsd5M/pqyFf3vDr0GYhw4U7td6n9veAwvymeBVY6ozGa4UDeyP/8DPAPfhpxwXXLcxpZssy6RF6ADUdLIe8J4vTk66mwsZGRNbjtsCL7kEh/cFnKGo4eysHYdeU787blsO0QAGPsat9wA2CB3mJW8pgUXC9CsGY8yyTT1fDCcm7n5k8/AQwkcdm4J5oOKidIQEKdZQf/7hxh1iUcL8BtxQgu8fvc7peiB5OIWs5Z/9eb+dBjc+dl7G+4z8HkL2KVc22sZtyR9h9Ol1sjLIrbKNdY0ivU1GB+BNt3ibvft+EtdpmUYApv23TxgMrY4M1zP3hN9ViZFXvktpxImsvFv4+teAMK0GeFsixX9H0A+MfTgDEtgmup31Wt9Nfk71u4EG5qknP4AnvSUIaoSKLTtDp1n+edNp0jbo7sJpINs2YRsB78e7YUSMy4IFgjWWxYgbQnii+jcGqq4YtZjIEXh0WYwosvKBBh+HnzlhCLYWVc9d6S2T2kiQQSme1KA74qzPCpzwa+r+7brzThxOOppkNjGjjtzi6j7XoIImekSrxSOKHk3pB0jjVMGds9GPkoa7AQ8VqP6/2X5aDXxLSctFo6Z6O6mntCi3ju1v6tQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(7416014)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mmd6cnNyT0V3WEIxb2dMUVJwT1NIRHlUUkNGN1VyNkNCZHo1cDA1LzZ6bEth?=
 =?utf-8?B?K3ZOeTZwNnJYZXR0K2lkTy9IcENtbldPa1hPM2VhVEVQZmFWUHVDM0ZQdW5I?=
 =?utf-8?B?VHlTamwyNGxTODZ6bjdFZFBjMldZRk9tLy94eXhtaVBoZ0lOaHA3WTR6ZjBo?=
 =?utf-8?B?Y1lkUkRBdWRKRXN4RmFEbUh2SkdYdTBHMnJIMk5kYmF6WmZFUkhsd1pMb1ZP?=
 =?utf-8?B?UVhDdnB6ditsMkIzYi8zYXhweEQ0TGRBNG41MjdvcVJxekYyTW1Pa0VKRi9q?=
 =?utf-8?B?UnRQOTVOVll1NjdhRnJmZmFoakdRM2hjMER0Vi9STWtYNXE4K0ZVdDZDTWdD?=
 =?utf-8?B?cnpoV21SM0hDdXNCMjR0dWRYaXdIUWF6bnAvMUVDZVBZMmlqMEU3ZlE1VE9i?=
 =?utf-8?B?Q2QraktwQ0cvSmh5aUNiUitwYXJuSFV2RW5MYTJ2SERzUW5OOUwvM3VQYjFM?=
 =?utf-8?B?THdtUUlUdTQ3SGZCRW5WakVEV2IrZzlVRnd4VFkyaDFnY1ltdGNKWHRUNXJu?=
 =?utf-8?B?MGNEbkcwTjhxTVoyVTlLNndDWW14SmVtNXJMa1FvVk10MjlqVEJHMXQwZ1gw?=
 =?utf-8?B?em8wQUMrNVJwcm1HRFM2d1BMUEZNSEhDRlIxWTNEUGFxa0ZXY2xBdm5iU0E4?=
 =?utf-8?B?MDVENk1FOFF2WW9tZi94aEdvV3pQVUFOaU8xS2lGNUhCUmxLdkNQRG1FZTdG?=
 =?utf-8?B?UGptVDcwdEYxZm01THdnL0M3M2ZBa0xaZ0ladWdCQTY0WmRNOUhnaE8vZ3pO?=
 =?utf-8?B?TUxmb245UVdWaVpEQkh0YVRJalduOWVKQVFrUExGcEIzTnRKVVZVLzcrS0Rp?=
 =?utf-8?B?K25NcWZPTmhxV0ljd0ZhMjc4d2t5a283OVlQWEw5QXBYdU1DS0lhZnlGcG9Z?=
 =?utf-8?B?RHR0M1V3bU9yaW9WbVppb29FQXNKWDYzRUVjRlhHbkpNUERhTzdJbUpVM0Ja?=
 =?utf-8?B?WW03aThUbGp5YmZLbm9aRUoybUh5LzQvMW9YVTlsYk9aY0VPMk4xdkRGMVdp?=
 =?utf-8?B?MXh0SHAySVJmckxQcEdFMzJEeWI1M0JVbnZTRnBKZk5WV2FaOFIrU1BtcHBt?=
 =?utf-8?B?MXdINUpZQm9Rb0JsSjhWQlBkcG1VMHVHMUFrcTkrVHA2T2NyMWV2YW41c3h4?=
 =?utf-8?B?QXdJaEUrVWNVdUhBWkJ1My9EQWtCUzB2a0pjbXV1TlFValRKMDc2cnJvNy96?=
 =?utf-8?B?UTY2TngyeWpFVzV6V2tiVEJYSlVBMFJPMGdjdnRDd3NPTGVZY0d3OFRnUDBh?=
 =?utf-8?B?ZkcybFlnZHFuUlFRSi9TVk5VdUJSaGxadlR1eTdiczhVa2dBbWNFajhKNFZU?=
 =?utf-8?B?TWpDWUhXdUJmRmFGc0MvM3lrN2t2MVRzRFRKMmVZYVFMUkp0K0EvN051ZEVl?=
 =?utf-8?B?cFhuSXoyekJOUW0xMkpOd09pbVNrNVEzWDE5T1hNSFdoajMvVnR1eURMMXor?=
 =?utf-8?B?SjAwWWpXN1ZpYlBlNTNwUG9jd3VKUXQyM2J1aGkveGszRFlHK1BjeEY1V3o1?=
 =?utf-8?B?VEh3b3EyZDIwVDB0eGFqT0VoRVRrMElVY1NBR2dOUUJYNlRSWmdTOHJqYlow?=
 =?utf-8?B?aVhqODFhNncvd25vMXFkVnFhOVFIK2J5TFJzOVBlWmYrbzZzbzNrblJianVp?=
 =?utf-8?B?SVJNRVJsc0c4NGJtL3hMdmtBUDRLMyt4SDVHY1NVQlB4NUtoTCtaM05mb21z?=
 =?utf-8?B?a0twSG82SnJnakdRUUVsWUEyNVFhd0dvdk1IdGNnaHF2cUt0clV3VXNKTnhr?=
 =?utf-8?B?M25peEw1L2dvSmVlZVJxZEZMNXpBK3BndGVHNGREZFZXdjlSc053dmdOcDh6?=
 =?utf-8?B?c2Z5T3hRZ2I4aTMzSnNPM2tQQk0rcDV3ak9IMGFYOFZKN1dycVZNanVrRHNn?=
 =?utf-8?B?MHF4eWhiK1pQUlNxNVVkZlBVSWNPNFRYTHpxcHE5a1BNN2NGQktmU2tGS2x0?=
 =?utf-8?B?U09rakdZYnBxTlY0Ry96SC9xZ2xzU013VHlubmJIVlJwQVBMb3VFUjRCUHJ6?=
 =?utf-8?B?Uk16bEhTRFk3b25CQ0pvWWtFREpNaWorY2RxZFNxcmJ5K2dDVitzSTJTdGNr?=
 =?utf-8?B?dmRnK1VvUWNPVUh2L0V6bjJsYU9EZVdlZ2xtV3p3Sk1BdnE4SGNUa0lsSU5X?=
 =?utf-8?B?YUk0eHMvSXd2R2ZVRU9vcFRGcGs4K1JJcjE5cVU0VFNLcUVZNGQ4WERGTE1u?=
 =?utf-8?B?ckFwVGRxNmg5YUhRdzlWVjFScXJOb1V6SlA1dTNZNzI5ZzFnRDc0eHpkVURL?=
 =?utf-8?B?cEt1YktKRFdUbmZKY3FtTEM2dk1Ba0dEZHg3a2t6R0hIY0V4Vk44VjczZ1Nv?=
 =?utf-8?B?VStaODBuUHdlcUZPS1RhdlBmSTA0R2JqZkIyaWtXNGdYZTRiUmdoQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80949eb4-a210-442f-d4ef-08de78d4b279
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 03:26:45.8137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xDBI8ZQzPvJZ64j72Ie1em2bGzH+2NzNcJuLu1Z6PYPnnjf6VWQ/FzgbTxqNJ/Azvdphnj+JriDKjKSr/vGejQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9664
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
X-Rspamd-Queue-Id: 80EBB1E87D3
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
	FORGED_RECIPIENTS(0.00)[m:m.felsch@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:peng.fan@nxp.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:luca.ceresoli@bootlin.com,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:frank.li@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[pengutronix.de,kernel.org,gmail.com,nxp.com,intel.com,linaro.org,ideasonboard.com,kwiboo.se,linux.intel.com,suse.de,ffwll.ch,bootlin.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
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
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nxp.com:dkim,nxp.com:email,nxp.com:mid,pengutronix.de:email]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 05:10:41PM +0100, Marco Felsch wrote:
> From: Liu Ying <victor.liu@nxp.com>
> 
> NXP i.MX93 mediamix blk-ctrl contains one DISPLAY_MUX register which
> configures parallel display format by using the "PARALLEL_DISP_FORMAT"
> field. Add a DRM bridge driver to support the display format configuration.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> [m.felsch@pengutronix.de: port to v7.0-rc1]
> [m.felsch@pengutronix.de: add review feedback (Alexander)]
> [m.felsch@pengutronix.de: fix to short Kconfig description (checkpath)]
> [m.felsch@pengutronix.de: use "GPL" instead of "GPL v2" (checkpatch)]
> [m.felsch@pengutronix.de: add bus-width support]
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  drivers/gpu/drm/bridge/imx/Kconfig      |  11 ++
>  drivers/gpu/drm/bridge/imx/Makefile     |   1 +
>  drivers/gpu/drm/bridge/imx/imx93-pdfc.c | 225 ++++++++++++++++++++++++++++++++
>  3 files changed, 237 insertions(+)
> 

[...]

> +static bool imx93_pdfc_bus_output_fmt_supported(const  u32 fmt)

As I mentioned in v9, can you drop const?
I don't think const is needed.

> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(imx93_pdfc_bus_output_fmts); i++) {
> +		if (imx93_pdfc_bus_output_fmts[i] == fmt)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static u32 *
> +imx93_pdfc_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +					    struct drm_bridge_state *bridge_state,
> +					    struct drm_crtc_state *crtc_state,
> +					    struct drm_connector_state *conn_state,
> +					    u32 output_fmt,
> +					    unsigned int *num_input_fmts)
> +{
> +	struct imx93_pdfc *pdfc = bridge_to_imx93_pdfc(bridge);
> +	u32 *input_fmts;
> +
> +	*num_input_fmts = 0;
> +
> +	input_fmts = kmalloc_obj(*input_fmts, GFP_KERNEL);

With the below two commits in v7.0-rc1, I believe that GFP_KERNEL can be
dropped.

bf4afc53b77a Convert 'alloc_obj' family to use the new default GFP_KERNEL argument
e19e1b480ac7 add default_gfp() helper macro and use it in the new *alloc_obj() helpers


> +	if (!input_fmts)
> +		return NULL;
> +
> +	*num_input_fmts = 1;
> +
> +	if (!imx93_pdfc_bus_output_fmt_supported(output_fmt)) {
> +		dev_dbg(pdfc->dev, "No valid output bus-fmt detected, fallback to MEDIA_BUS_FMT_RGB888_1X24\n");
> +		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> +		return input_fmts;
> +	}
> +
> +	switch (output_fmt) {
> +	case MEDIA_BUS_FMT_RGB888_1X24:
> +	case MEDIA_BUS_FMT_RGB565_1X16:
> +		input_fmts[0] = output_fmt;
> +		break;
> +	case MEDIA_BUS_FMT_RGB666_1X18:
> +	case MEDIA_BUS_FMT_FIXED:
> +		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> +		break;
> +	}
> +
> +	return input_fmts;
> +}
> +
> +static int imx93_pdfc_bridge_atomic_check(struct drm_bridge *bridge,
> +					  struct drm_bridge_state *bridge_state,
> +					  struct drm_crtc_state *crtc_state,
> +					  struct drm_connector_state *conn_state)
> +{
> +	struct imx93_pdfc *pdfc = bridge_to_imx93_pdfc(bridge);
> +	const u32 format = bridge_state->output_bus_cfg.format;

Can you drop const?

-- 
Regards,
Liu Ying

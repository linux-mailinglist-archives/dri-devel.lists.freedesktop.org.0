Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEAEBrk9c2kztgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 10:22:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB0E732E0
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 10:22:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B22F10EA78;
	Fri, 23 Jan 2026 09:21:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Kz2+oNza";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013016.outbound.protection.outlook.com
 [40.107.162.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF15D10EA73
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 09:21:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XkL1FgC8yJ1BsnKYFC1PgAaCAUIfbITJMXc5E+0kjNyxX1udl0txmpQLdKE0+70HXHg8tczrX7cINkqoKfT3dOyJ4eG3H1UIlVu4imSddGktmahq6Tirq66zxD9LkoFz/sqBW14pJHLYlyWnMXOYzdus00qi+4S9VWYL+AK/j6SAHu7GGq4GNJp2LKWZ4hqYlR5LVsiLoU3bd6U2hhCLQdZoE++fZg8ibUa44JaImvjDz8BJPNlqc5dC/ReVipSqRfBeggluQxhH7uh+v0UdTAXREfUnzDT8L2bv7NevXy5tYfDgAaFXQViv2GYmo7k21CxJgzclhG4yWLoDAfZhbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3Od3wqA0Cr3b/+19APUOTOymd2Wp76UeVsxcEKyuqk=;
 b=YsdvNTmRoBf1NOD7rNfoLcHyPnwNKLgjqYygkzP4hC/Qck5xUOsUS5ceSPTOH9V/t8weH12IQfz/WFeKuhfyDLnuZqAB0NGpIOJRXoPeJVAveJ4VGl3LB6eQtmVAZxwrC1cPCMgEbJ+C4X/epYggPLWdV4CzgzWYMjhxq9R+JqOCpyMidyl8vHFwlz7hfC5JFnVFWqCtCc2zZFpHhutGPg42Yh6A9cJY3IYTEfN7Uh7muS+7GZmuX2UvctwTGqqwCXMvN6ZJrdoN9QgspD1pkhXDtPQefrepVFmCjxHHCUBtNos8KT21RJ3qY7joyzYGlWE3hksR23FCMZIodqUdeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3Od3wqA0Cr3b/+19APUOTOymd2Wp76UeVsxcEKyuqk=;
 b=Kz2+oNzaSiAoThbowJA6/Sj52AapKSq2yYJ5LCIPCRdBhfyw7/2VIolLWSdagceCbF81ZxD2U/kS9R92FLiqsxZflgr8lCca9CDMTYLZ+HGAJ9jxX8vR1eZ9WWrxS48jB4HTxzxQ/jQYTcJ2580tapFuojDvG+4n1GH+5l/Z8MA5gVKogWPL9B32936X4E5QqiTyaqKxdyXLNQXHTZhTPlwj4ViY89fliXWP76ZIpDdm/dzVQGnygahbEuWCcElq6WnRS40epjKPTS0j2Yl5V9He+PfinZmzYU0QT+4zjFnakX4dbCbCooMdTxaINHxYvCV0pS7L+omGD0kfAGlTyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB8282.eurprd04.prod.outlook.com (2603:10a6:10:24a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Fri, 23 Jan
 2026 09:21:54 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 09:21:54 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Fri, 23 Jan 2026 17:22:15 +0800
Subject: [PATCH 1/3] drm/bridge: imx8qxp-ldb: Fix NULL pointer dereference
 in imx8qxp_ldb_bridge_destroy()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-imx8qxp-drm-bridge-fixes-v1-1-8bb85ada5866@nxp.com>
References: <20260123-imx8qxp-drm-bridge-fixes-v1-0-8bb85ada5866@nxp.com>
In-Reply-To: <20260123-imx8qxp-drm-bridge-fixes-v1-0-8bb85ada5866@nxp.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Liu Ying <victor.liu@nxp.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: SG2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096::24) To
 AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB9PR04MB8282:EE_
X-MS-Office365-Filtering-Correlation-Id: 595b4c06-cf04-4241-a66c-08de5a60d92b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|19092799006|376014|7416014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TENkUlB4T0Vjby9weUJZTERMZmI5ZDRUaDdmeDA3Nm5nSDNJRTVVUE8xanEz?=
 =?utf-8?B?ZHE2SG1XdWRXV29KdlF4d0ZwcTUrWndTdHZhc2lhVUV5SGRqWlNlMjE4RjRW?=
 =?utf-8?B?R0ozVUhRM3VQMVdORC94V3E0eE4vODJsS2FlenZOWUxQOWVEMjlNNVlzaTMz?=
 =?utf-8?B?QzNFcXh5SU16NzFzZzhzdDhXdk5pRDNTRkZhejF0dUlXVUJMNnVYbDRmcjRT?=
 =?utf-8?B?cC9ReDhjdUVVQkVya2l4dDJ1YVB4b1ROV1VXeUdtVzNoTnVhZ0xYSGNVNm9y?=
 =?utf-8?B?RklxbE1IcmVJd1lhVmNNY1h1c1ozQXBqK3FXOU02YW4ycE90ZU5yVVdZMSt3?=
 =?utf-8?B?eHY0ZHIreUsvREhVYzduc0hDWXovVHo0dkU2NFN5bmdMWUoxTG41dGoxWGN6?=
 =?utf-8?B?OEo1N2oxNm5UbVhtUmFjbE5NTEZYbWVMWUZBeXNFNmsvMVFFejRjK2xNRjdC?=
 =?utf-8?B?T2VxRkwyTUVPZTZIc0ZKWEFNdnE1cnQ2eDFWSkw2Ni9mRlpYZmttUDdwNnlZ?=
 =?utf-8?B?L1pCSjNpM3NkS3AzSmlWZlNqak5XZSs4MG5NNDJYMmlSMVR3Y2JwUEhJMFox?=
 =?utf-8?B?RzRwK05EUG9PakdKaE9HcDNmUHZ2ME4xNW9GaS9iVVV0K1R1S2RjUW1DWmU3?=
 =?utf-8?B?MktTNkQ1NDRteUNjNWVqcFFyOHdvRDlJbkJoZDZ0VHgyRlJHQ3lBcXB4Qzdk?=
 =?utf-8?B?Nko4YTdESngzUGpDZHhIOGdCbERnSFRwbmhkN1BxZnBZRFlkZWE4dncxUzNn?=
 =?utf-8?B?WnhYZ0tYekNVSnBpc2d4TzNXU1lUYUE1WFVKQmdYaVNBTFNKbVpuMm0vQ2No?=
 =?utf-8?B?SUM0TjdmYnpRRFhUaytIdEk3bnlrVXJUZXQvMVlSVm1PZjNibmNvcWVJTWZX?=
 =?utf-8?B?N1JYM09ubjFWLzlpVTkxenhPMWt4QitaSWJUZUlwdUxDcEJncG11aEwvY0dJ?=
 =?utf-8?B?Wnd4V2YwaW9HZ2NhbmZEK2JOaEdwek9Md3ZlNkdid0RQK1pnN2Q1UHJsakNC?=
 =?utf-8?B?VXVJaUtySmlFbnBpbXY0NUVodzQ1Z05LVlBCQTFjQllWM2s1MnVmWTFvWFJt?=
 =?utf-8?B?WFNkbXRHWWVkVVhOQlQ4QWVldjFZWERhanhrNlN2MHZyUGJ6cklqckcvbXF3?=
 =?utf-8?B?QjlLdzZ1ZWUzOU11K2hZYUNnem1tQzhlVmtCS1lRSnExYi9NNER0NW16N3U2?=
 =?utf-8?B?V3NMQ1hLVGgyY3hZalFIYWxEY3ZwT3IrUkxTazVETXBYSnhKWXlYSmZtWVBD?=
 =?utf-8?B?ZjNQdkdCMWdnVzZFU0g1T1pYK3M0QXRJZjNENmNjNmw1RTVpaHM3SmQ4QVd0?=
 =?utf-8?B?RnFqMUE5Y1EzUHBwM0Y5RzVYQW5QZml2N3I4T25odWxHaWs2NEdFQ1o5RzRQ?=
 =?utf-8?B?RjdWL2dCTG5Sb2QvM3FhKzIrb0wwTklvcnNQOTl2MzdZRHZxaXd4eEF4LzJr?=
 =?utf-8?B?SVd1dzY0UEdycWJkSFI2TDBiQnYvNk82YnFSL3pydHNtTU4zd1p0RW1sOTM3?=
 =?utf-8?B?K2NNaDVUMW12bmtmdTlrVkpQbjV6OHVkanJHV2dMU0VoMU54UFNXL3FHb1Vo?=
 =?utf-8?B?RXlsK1lybFdtVm9xeGZPQ1JZMkg1V0JSMVdlK0NjeXVRV0FWSFhremtZU3pX?=
 =?utf-8?B?VXlPSlY2WUI5MXlLUWJOeTllSHFiUmc3VnlSWUxtdDdLOUM3Z0MvWjl6bmNi?=
 =?utf-8?B?WXUxMWhIenQxT0xCSHNnUFR4ZHFoM0Y5Sk1uSjNKZDNYN3dSb2czMTBQSWlZ?=
 =?utf-8?B?S05RbVNLVkhYZjFPTk55cUEwTFhOMWN1UWlCUG9melJRSVdVZitCMmJxVlRU?=
 =?utf-8?B?bnJHNWpPbk1XYmNWbWhkNTVBMUczWm5PenpiMGtXR29FYXZtU1U5R2xFK1Fh?=
 =?utf-8?B?RTEzVE1qdG9ZOXptT2I1aktEOGtMZUUvYTRidDRUbWxhOEFYY1pVR25LZlpo?=
 =?utf-8?B?NTFpdGdzWmhTK0x0VjFod1BxSFdqNzkzWWxicndBMCtpOUZtcENjQnpvTUdw?=
 =?utf-8?B?T1gvbHVhdWg1aHM2RXBDZG1qS2dwSS96ZEQ4bHNnVWR5ek14NFd6ZkpsU1FQ?=
 =?utf-8?B?QllnU01LeEhLRHMzTlJOSE5yYlBGV2ZtN1N5WUhMU3N6TUVnT2w1YjNRbTBE?=
 =?utf-8?B?VGhWK2JTWFE4aHlsbGFBL05ndGV4ZWcvb0haK0lxd1ZDOHVIZURIM3JuR2Iy?=
 =?utf-8?Q?Hb+1YjqQERB+UlUgFOsQFQPsrCta/Yz3/eHSaTDWwbVJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(52116014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVliRjhkTjZtNjZJeEhQODROSDkxWFdWYkVFQW1obkJUc2FBSFV4dHFGTlht?=
 =?utf-8?B?U0pwdUdSLzlSbngxWG43US90KzZBS1JXOFlkcUxTQ25TaEttdXd3M0ZjbnFk?=
 =?utf-8?B?aWJGWmxiL2MvSThzME9FaFlJZ3lUMHNWL0RPbVNPM2VwcVBjTHZjNHJwQ0xS?=
 =?utf-8?B?cmlIeWxKUXVlV09ITnFSL1M4enhvRmpRbjlTazF1aTZCZk1pQ3lmT2tXWnpi?=
 =?utf-8?B?amNnQm5zbmZsUnhKY1djOVNheWlKSUZsYjhBelg4M1lMRVlHYi9LNnFWRE1M?=
 =?utf-8?B?bGRTOWFJcWMzWmRtNVlLRklWaDRMT1FWbUhtbkVnelhHcWpmSzdualo2cHE1?=
 =?utf-8?B?eXF5S0ZZdHNZckJEZWgzdXhvWFdFME5KK2pOekZDa1VmRHBnbzlYSnVxdDBh?=
 =?utf-8?B?V1N0U1BvS1ZtdGhQYktCNGJUbDdMQ3NCYkpHR2JMaTgybERlNnRPSHh3d294?=
 =?utf-8?B?czlxUjJ4dW0zdkpoZEI1dXBZbHcyQURzcWxTSVFyMURjZTFSUGxIbnlwVkli?=
 =?utf-8?B?U09UMDAzb2dJM2dhTE45YjQrb09ZM1l6aGl4eks4a1AwMnZFc2ZJMHc5ajJD?=
 =?utf-8?B?VEd6R2szbFVTbUlaRlJxZ2txNnpzMC9tNkVBQzhoZ3pGQnIvaE5VdEtzbG5q?=
 =?utf-8?B?ZldtT3IyNzVZTEY0T1RjclhPN3k1UmM2aWJ1a3RNZHUwMlY0MUY2Qk54NWRj?=
 =?utf-8?B?UjVIODVsZjFZT0FVTkcwdm0rcHFtckpEYVNjaUVnRDlQenJ4VEYrQmJocFlJ?=
 =?utf-8?B?djVKOHRlK3RSWkNzdC9vbmxEeUNlbXFFSFlHNnNIb0ZVTlVZYjY5SGRKc08z?=
 =?utf-8?B?ZW5TcmxzU1dDU3k1TDhLb1ZTbW12aWtmc2FORkUzaG5HNTRJeXVZWGNyd3JM?=
 =?utf-8?B?cjFRTGM5UFJvdlJqZTQwNUg2akV1Tzh5V29ScTkrV1ZSeGtuUGliSEZMclR6?=
 =?utf-8?B?TlNkcEZmenJIaDdqbGFveXNPRVM5cGFYeWxqa3hnSXBHUjh0WnBmaU9LMGo5?=
 =?utf-8?B?eUFlYzRYaVdCUEE2U1ptbWQ4YmFlQkRQaklZTkt4dnpkOXBIeGltaDlOKzI4?=
 =?utf-8?B?bzZJbjZzM2RTS3hRL0RWOFVGbnBhbUdCZGd2VHlydlAzVUNSWFovQ3VYQXJN?=
 =?utf-8?B?Q3dJSy85cXhDRWVCWjNtenNsZFA2b0dFV0w4eEVwekpCcklwcXA0ZGdXUjdE?=
 =?utf-8?B?T0dFRndrdXJQMFd1UFdtLzV4bWNlbFVKV3dBSS92MGdQOUl5WkVqNG51VHhn?=
 =?utf-8?B?amJpUVVmWUc5UXJzL0pQaFVuQnhuK3R3NjBGclptcGVTRkI0Z0VQSW5YaFJQ?=
 =?utf-8?B?RTZ5eFl6SlF1NTkwKzRLVHBpZHhuaE5tWm1pcDZxdE0yVEl0VVFnSDBXRnhL?=
 =?utf-8?B?c1VjYk05eDFUbmtNR3hTV1RUOWM1RGpRS24za1EyaUJOWWFPdmN5bGErSzBx?=
 =?utf-8?B?T0k2TXFxVUlEcDRwYzdRaFpvQ0ppR0t3UkFpWDZhaGpSWDZEelltc2JpWE5j?=
 =?utf-8?B?TEE0NWZDS0NjYlZMV1lKSVRjNXU5VkpEZVY4V2FibTJUZWxKOHk1bzl5SmYr?=
 =?utf-8?B?dXQyMk5GMUhpMXF0OVJJNk5GeHF0RjJ0bWtUMlVaamZKTFBVNHdYanEwMDJk?=
 =?utf-8?B?SGFzcWd6dWJmUkl4bjhnUkFISnl2ODdLd25qazk5RUJWTFV5SHNDWHFEZWgw?=
 =?utf-8?B?MTJtL2YwemkyRjR0VEpTdTQ2dTJlb20rVjdDbjlvK2Y0TFFBczY0ZlRTdUFu?=
 =?utf-8?B?Z2hITU1GU2kxS0hROXg5SWJ6MEFlSW9udGxpM25NbHNDREhITlJUUGRqaG1K?=
 =?utf-8?B?SUgxK0lHVWJySmxrdlZyRjZTY2E3VjhmRXg4K2dHenJkMC85NWpybnVKQnhx?=
 =?utf-8?B?UTNBN1Z6blYyT3IwcGNLZzJ3WXdvOUhMMHV6VjZNaWZJN3pTTUlSelR4QU1D?=
 =?utf-8?B?YUdyZlNjWlJRaEdQcVd3U2dQWDlzM1R4bXlkR3BJOTd0TmVrcml4K0FxNllH?=
 =?utf-8?B?ZjN5SHFtNG9OWEVxSll1QU1sU3dQQnJRajZsRDBOcTFCWHFoOENtZ2p5TFlV?=
 =?utf-8?B?V3psWGhlVjBGVUlQM0tWc2VtR1lKOE5CSVVSMHlzSUN6SjRsNFB4OHpIME1Q?=
 =?utf-8?B?eGZCMk9YSE1CbUMweGNCVVYrMmQvVkFUOVNJWWV5ejllY0dsR1I4YTBIdlNk?=
 =?utf-8?B?WkR2WHd2OFBBRGVOYU9UVFdpMXpabmVLODViZVpqZUVNSWJYbXlKMFA5ODZS?=
 =?utf-8?B?UW5oR2RicnVKSDloc2ZYOXVTU25uWlpURzVLcXhwQnlKYkQ0OVMvQzlSQzk4?=
 =?utf-8?B?TW5CeG1mdUxMY0tKMnU4aGFmTUlKL3VwVGdiT1VnRjhIVHNBM0JVdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 595b4c06-cf04-4241-a66c-08de5a60d92b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 09:21:54.1430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cy3O+YfeavRGcB9Fa4t05s1mxRXGdtiBqunPob0EUR2a02obt+FgcZjYliXS0SsdtEkKx1JHlnJjCv9uhB65ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8282
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
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:luca.ceresoli@bootlin.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:victor.liu@nxp.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,pengutronix.de,bootlin.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
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
	NEURAL_HAM(-0.00)[-0.884];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,nxp.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: BBB0E732E0
X-Rspamd-Action: no action

Pointer bridge->driver_private in imx8qxp_ldb_bridge_destroy() is NULL
when a LDB channel is unavailable or imx8qxp_ldb_probe() returns error,
because ldb_add_bridge_helper() is the last function called from
imx8qxp_ldb_probe() and it doesn't initialize bridge->driver_private if
a LDB channel is unavailable.  The NULL pointer would be set to pointer
ldb_ch and then NULL pointer ldb_ch would be dereferenced.  Fix this
by returning early from imx8qxp_ldb_bridge_destroy() if !ldb_ch is true.

Fixes: 32529d384cea ("drm/bridge: imx8qxp-ldb: convert to of_drm_find_and_get_bridge()")
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
index 43b328cb5314..ada11eed13cf 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
@@ -65,9 +65,12 @@ static inline struct imx8qxp_ldb *base_to_imx8qxp_ldb(struct ldb *base)
 static void imx8qxp_ldb_bridge_destroy(struct drm_bridge *bridge)
 {
 	struct ldb_channel *ldb_ch = bridge->driver_private;
-	struct ldb *ldb = ldb_ch->ldb;
-	struct imx8qxp_ldb *imx8qxp_ldb = base_to_imx8qxp_ldb(ldb);
+	struct imx8qxp_ldb *imx8qxp_ldb;
+
+	if (!ldb_ch)
+		return;
 
+	imx8qxp_ldb = base_to_imx8qxp_ldb(ldb_ch->ldb);
 	drm_bridge_put(imx8qxp_ldb->companion);
 }
 

-- 
2.43.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EA8C0C67F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 09:47:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7CBD10E3A2;
	Mon, 27 Oct 2025 08:47:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="aAqwAoN0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013032.outbound.protection.outlook.com [40.107.159.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B179F10E3A3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 08:47:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E+f/zXCKqqWOHybFr31Ee2ti3PG5slr3EasqifWWo6sgMwMVzeqFV9ihBc6UdVCdB4wW9ZfpT2+BVn5gHnAoy1mDU1qlSYw7xRzT0gnwG6r/xQ8U0jL2bRHMQTp+I+IAbexxbtQXWWXsDat19FKzu2Ri4HV57QmR35OGQN+dtujBVVswzdwbtGvhnKfN23wI2lPq5cFWP3CyocQq6HUKx4W+etkrHx9/dVbDFoEI+WhXBjRnwuwlf2opoUKyjQHeI2sJXuicCkoSEjekoqR8i7hxxUd7gECHf4lDx5IAYYzPqAQIxep3l0BigRO1IAzKgYU9uxRQQuzsg97eyECy6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJDWuUoMeRaW1CEUs/x2kC9u1WcRhDUCnVdtmZwAPBs=;
 b=skieks9KD8UXI/B1ciqYn113WszmD0VNGzdkKQghMovvZ4TZUIDzIaBTi7N3imWuHEosiye3ueM/ECZCfpDAteqF+EuNRaBw1gGgvJ1smPgTcNiQdml0L1KVRRqj8Ag7zH0X0JAjKDQc3oRFTpYOPDqJ5JqzwPaXj3scpxxMkHHCSjxJ7yCkujBGiiw71RJKAhVTadWEbxsH+pyaYYGOp8bfzlHdnVGQfyDB/leosHaUWqDuNxwPFuzGZweRZv8FkcfG9cWgcxrjLl0CScniag/v3XPapvwppOQUItlcDxbX3N3sTZSCIBPc3Wb5bDzinrqKJG3mcw9KKJhPOdcW3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJDWuUoMeRaW1CEUs/x2kC9u1WcRhDUCnVdtmZwAPBs=;
 b=aAqwAoN0KD960cdeeLTuFqEuazCtTdv2zUcCJwTZO3hy3S/MOfpPLJG/taCUmldecB9ngZ+3YFkpmS+jCBEbwsETpDmwmFhNf2ZS8nyqJuuxEADcG/0bIlZE/zf/FQ1a/vohQbSz6PL+ZqwXJ2/cYxM2/QTeEEbyEku0DmeoZXLXRtMOhFNbREm5G9OQ3ZCOH0vpfUKrLBruNFCA5sBgmypjHgQgdDkWi5fNUVx4Wvw2cvBUj1hSC1kgqFsFq9ZQ1oYglKh2BFi9QWPrtajuWCb9Hsm52PQqJKVENYE/rBrZ3QIG2lfjfj7GKyTHfSWUn3oX5f1QEU6bjLEWwA6dIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8739.eurprd04.prod.outlook.com (2603:10a6:20b:42c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 08:47:13 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 08:47:13 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Mon, 27 Oct 2025 16:46:54 +0800
Subject: [PATCH v5 04/13] drm/imx: dc-crtc: Disable at boot
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-imx8-dc-prefetch-v5-4-4ecb6c6d4941@nxp.com>
References: <20251027-imx8-dc-prefetch-v5-0-4ecb6c6d4941@nxp.com>
In-Reply-To: <20251027-imx8-dc-prefetch-v5-0-4ecb6c6d4941@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@mailbox.org>, 
 Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:196::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8739:EE_
X-MS-Office365-Filtering-Correlation-Id: 3449e803-ce35-41e3-6111-08de15356ca2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|1800799024|52116014|7416014|376014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UG1tRkpXT3lwSG9wcWswWS8yaEdFMEtpd3M2SjhWTkJoQVdoZzZMeVZVY2hq?=
 =?utf-8?B?NVFjTkRWRDZhOCtLalVRTHU3a3NwQUl0bHQvUnNlb1BlakFubXJza0p3NlJ0?=
 =?utf-8?B?U0FoS3owaXhBWjRwOGcxeVpSRU50UFpRakUxTzhSaGJKdC9TL3p5VUNmMndU?=
 =?utf-8?B?dzZNV1cwakRqZmRBVUVLRU9mbWgrYWpNdWFDWWFvNTEvMVZEWExaSjhuak1J?=
 =?utf-8?B?U25vQXc1OVBGQjhpOUtzSXNmOEQ2RnBxZGVheWhnaHpDQndQZjJzS2JJUmVN?=
 =?utf-8?B?dks5WXF2UHhsanFyVGEvdGZWQ1lDY0ZOYzJXaXdFVnFoY25wUTJFVlYwNWRK?=
 =?utf-8?B?SmZjZTQwb080VE9Pa0NjaW9VZVZxd0FJWlVtdndZSWZOK1VBQnBVMzVVTUMr?=
 =?utf-8?B?N01ETEsybFlQNkQ4dnJkMUM3Si9iYXBNaSsrMkhZaDRtN3FFTTFrTGp3b1Y2?=
 =?utf-8?B?Z0NsU2V0ODc4MzJVQnBGZmNURHZWcm55UGxZUzZ0L0crNjlDaWpuakZqaCts?=
 =?utf-8?B?cVJpUUdGa1U5a3ZzUVdjZGFqQjEzWkthSG5XcEpNcDJZL1NiUUtFc093bEtZ?=
 =?utf-8?B?b1krZUE4ck1wOStQTUV5WDNBZXNtaVFWeWpZdkNZaVZPTzd5K1BTQ2tWWWRU?=
 =?utf-8?B?TlVZaDloZmFRdDI2QmlRZWg4anZjaTREbDVIQ0JpRGtYbEJlTHczRVNjc3Bs?=
 =?utf-8?B?Qk9kSDlHOW4xNVdRWVZrbGU0UnR5Z1lLSlMrc28rTlk0NnJ1QUtYdmF3Y0s0?=
 =?utf-8?B?U09kMGRUNnQveVMxNWh6MmpSQ3hGbnE5V3lia2RseE5RODFBNHhVQnFMQlhX?=
 =?utf-8?B?ZEg4WjZhcVNHUG5tMTVNZDhOZWZ2bHQ2VjhkUC9Nem85Q1E2TlBqenVHWTJT?=
 =?utf-8?B?MUdSeXhYL2xQUGt3NlQyMkdJVXRxYlp1Y2RxSXJrNTNXRWZiZldYYnkxd3NL?=
 =?utf-8?B?NzUzcXp0K2dRME1XUHEwa3p5OFljZGJsSlRaTkh1Z0ZjWHNHRWNyc2RtcHVL?=
 =?utf-8?B?d2NOeHRUbEgxT2VOYTQrVzRMaTZET2pBRm1sYi9mNXlpMDRsQUZRUUNINHBV?=
 =?utf-8?B?ZHdSZDAvV01DTS9tTTFmcXJ3Um16U2pJU0NLRHk0Y3BGeGtkTmJ6RXVkWVhG?=
 =?utf-8?B?QnhNc3FLVElvVWZmUllWTFN0ZzkzSHFJOUgwcmhnNVNRanlneVRJNVBxV1A4?=
 =?utf-8?B?bGt6b2VRMlU3OWZUR1NIU3l2OFZFNUNwNWI1Y2xsWC95bjcvTys0aW10NGFr?=
 =?utf-8?B?V2lRMGFlQkY1ZkhLOEtQT2RlZVhoT0kzelpQSEQ1bUlSMXRMd3hFcjhzd3F4?=
 =?utf-8?B?WlBBYmlOdDd2aU9CTEFZL0VqMDAxQ0RTV3BxeTIyb1phQWFnOGZMajBFYW5s?=
 =?utf-8?B?N0lOMWZQSFZnb3p5RTNhM21MSUR0NksxQzNTVFpuS2lvdUZ2V1BuWDlXcm4x?=
 =?utf-8?B?NzZXN2dEaXlRUm9mSEhCUDZybTFUT1IyVGRra0diRUFxZVBuUWduV1JOMDQ4?=
 =?utf-8?B?VzJIRG0xcUh1TU9vM2tyV3VUZHFWUTh6dUxjTWlndldEeXJSZU5rQmdpK1lC?=
 =?utf-8?B?MzBBc3BzbjdaWGg3NE9OejFZKzgveFFVTVJ2cmFUdUZWQ2pzZmJsaFZsSkU4?=
 =?utf-8?B?ZGdmSXNidyt5S1ZFUUlQb2pZWVowM1NGUTdwVlBWcVpMdWdtdHpVTVhmMFFT?=
 =?utf-8?B?bm9XK2ExTmpYOU5lSmd2K3EyWUZta1FoNDB3ZnI4akhSQmRtRGJ3LzhZVG1O?=
 =?utf-8?B?RjFXQzVpWStqTmIxSUFmKzMyQ0xnQXd1aW0yL2FjWGpWRzdrT2ZXRVpROU1p?=
 =?utf-8?B?aEs4RHNjUGN2RzdlcEY4cDRjeUlQa3VOUFIva2UranFCeTM0VVQzdzhidnQ3?=
 =?utf-8?B?d2FBbFJtWjE5QW9JVnArQjNRQ0VUTm92aGZSUUgySnc1MUdSdS9jNzhOZ0ly?=
 =?utf-8?B?Q3dpZW9BckhvbFFKUkNma3Bjb1U0allVMTE5aEpWcXd5TWIzd3NLcmRoRExG?=
 =?utf-8?B?T0dwRzM1dW9VWDBKTW9GeTVTVU10OWl0aGFFQ0lIdk12QlJnRG40TVNHc3pT?=
 =?utf-8?B?SU9GbHN1RmN3dVVGNERpNU5INzRSMjArZzZFdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(1800799024)(52116014)(7416014)(376014)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDZnc1dISEdYZElkdDlZQUo2bndwd1JlSldBRjAra2xDZUFlZjNRblF6ZlRI?=
 =?utf-8?B?aFFORDlpZWlTdW82azRpc2dsQVpWZEFOSXZoQ3owSld4TGtIMkpLTmRSeGxv?=
 =?utf-8?B?VldWRmtBRmwrOFA0MzNPVUNVWlNlYlJVMHhmVDdwT2ZOODI0UEF2SWtjMVNN?=
 =?utf-8?B?Qmt5eVBFa2k2Z3J6OFE4VEE2Z2ZodTdlZFRTbVUzeFppMmwwRGVWTlFLKy9Q?=
 =?utf-8?B?K1BjYXFTR0NFR0dBN2wxWVlIV3dUcnJIZWpscStLREdWSHhOSXhsM1hhZll0?=
 =?utf-8?B?aXBISUx1N0l2a01yUEhHQlAzcHdRS2srK0NJVkN5TGRpbGQ5NmRjK1hFaWFy?=
 =?utf-8?B?TXJJK2lVMGZZWitTMWhFSGJMTHlpRDdyWGZPcjArbStoZ2w1bHZuYkFETnNF?=
 =?utf-8?B?dGlqOFdtbFRnT0NQQ0RjSm94SXlJZ0QwWDRrNzBUMXdRblZ0eHRvUGMwUXRu?=
 =?utf-8?B?ZDRKV0s3WktpRDNqWjdEZEM3dHA3S3BETlRRZlBydktIMkpiMXgvRkUyK1V2?=
 =?utf-8?B?QUFsUzRKWkwrd2h5aDlpWTFmRTdyNDB2VWRPYUF6RmxsTEVaSzRZTzdlTUVQ?=
 =?utf-8?B?OE5ueDBQcWJuWlFXYzdBVGxiU3dNaGZXQk4xcHZJSTRBYkQzUC9jVWJGQk5V?=
 =?utf-8?B?cGhVK3hOaGNpRFliZzZvRnlUbTJlTk9mSHh1QjNuYjlmak81eE5qZlp4a3h0?=
 =?utf-8?B?WGtnWXFxU3VyY2ZWWGg2TXVCbHk0V3FaNVhVMHF4N3NlRjNzUEhSSmNiRWZv?=
 =?utf-8?B?Y0FlSStWbVhUYldzMUtFR2p4WHZxczl1Vy9zU0Nvd2N5QUxuWlllMnA5YWhO?=
 =?utf-8?B?cnRLc2pCSVM1NmFKZVlvUnNQdHZlc01IRmVhclNIcDZxNWtXcndvdXBldnJI?=
 =?utf-8?B?Vk1mV1FVOTBUTlk0NDJpbVVxRkhtKzNuMS8yK2Z2cEtkMmEyK0Z4eXBTNS9K?=
 =?utf-8?B?bHlMVXR3SHlZaE0zTUU3MzB6OTlZbm9lTUNGUTFHTXg1RnZpZ3pYc1ZneVFa?=
 =?utf-8?B?YU14UlRkNTZuRUJWOUZhaDdpeGQ1Z01wdHM5N1pPYkNzM1FhODFwNWswWmE1?=
 =?utf-8?B?dURZWTFUL2tHMUtGdjFCUVJ4bVNJNXNZczQ3ZEc1M1NIelZveUN1clAyUUFM?=
 =?utf-8?B?NkVzMnlGV0wxNllVUTM4bXdGQ1hrQm0rRmtINDZFNjhFVDVZSVRwVG1aKzVJ?=
 =?utf-8?B?SXhvdExmOXpaSW02cXAydUw3WTl6aDRwYTBKWmdQMHBHSUQxZTFWS0VSMy83?=
 =?utf-8?B?ZEgxcHpKTFZGYnhNSHZMWVdoNVdtOHR6V2JxVXVKdldDRXNEYkZjekZyVW5Q?=
 =?utf-8?B?VkgxVDVPUUV0NGxEQWlyZ2czZmNjZGVGQ1NRVTNxakdzaFlDMnNWR1RNRXVJ?=
 =?utf-8?B?c2tRdVcreURMRll0UWZuMGRWU29KaFd2dy9QL1kwdVVYUDBwYnJyVW9ucm81?=
 =?utf-8?B?OFBRMitjMXhBQmJ1QzFBVllhbWRmRUNFemVYMzFTS09temtUMUc1UkpFMVI1?=
 =?utf-8?B?cm1hRWFpcFJVYUhVc3MzVXdvNXZabnplMWtWQW9JZFZjM0tSYy82a05NNFVL?=
 =?utf-8?B?UGV4NjVsNUVXTDB2M2YyTFdobStZSjlGak5oSWhvSVpLdzVFWG94clloUHNQ?=
 =?utf-8?B?QUhPREpjOEZjcFJFS2lralhKdzVQVVdXcXVqU0pvWGFSR0FLL0RRM1lwM3dO?=
 =?utf-8?B?TG4yOVQzSW41V2l1ZExIWGVPRmw2WHlCRGgzZTJKUXg1QW1vaWs0NlRDN3NU?=
 =?utf-8?B?Z0l3YXdSTElZVDNnaEdYU0sxdytOME5YaDIvV2UrenRpK0ZhY0NiMTRiMFE4?=
 =?utf-8?B?bFJDMlF6UE1kemV4N1VUY2lVQ0kyS21mZ2djY0Nrcmc3L2ppaFhhZnpHK3Zw?=
 =?utf-8?B?YUF6RXVlb1FUQUxEUGNUcnZHR29nT2RscDhEL0JDajNGZC9SS0xYZUV1UHRn?=
 =?utf-8?B?NmJNd3dkTHhRamxyTjVsTG9QQjZFL2RCbFp0czk5eUVtNFBOOXplRVE2MVpN?=
 =?utf-8?B?RjA2SG9DTEtkb2ZkMWZoc0RqL2NHODNQOXd4aDNTNTlLaUVZN0hzbHFqR21t?=
 =?utf-8?B?ak52WUZKUUVsTEtSMEZOTkpKbVEvT1BEZGpGQXI3c1NzNlZLd2VYU2FZdmVC?=
 =?utf-8?Q?m4Gqpalc8IaTSFDJnJ31p9pp+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3449e803-ce35-41e3-6111-08de15356ca2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 08:47:13.4777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G2+rZYGRU1KTd20ZSjsqMUdhDLfpBEeUOpm+bKQux+m+3dYudnwT7gp29FU0XvyhcSlDKdt49CQaiHCYBgszBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8739
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

CRTC(s) could still be running after the DRM device is unplugged by
calling drm_dev_unplug(), because the CRTC disablement logic is
protected and bypassed by the drm_dev_enter()/drm_dev_exit() pair.
Hence, Pixel Engine's AXI clock use count(managed by Pixel Engine
driver's runtime PM) and pixel clock use count could be inbalanced
after removing and re-installing the driver module.  To fix this,
add a helper dc_crtc_disable_at_boot() and call it to properly
disable all CRTCs before advertising DRM device to user-space by
calling drm_dev_register().

Fixes: 711a3b878366 ("drm/imx: Add i.MX8qxp Display Controller KMS")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v3:
- Collect Frank's R-b tag.
---
 drivers/gpu/drm/imx/dc/dc-crtc.c | 50 ++++++++++++++++++++++++++++++++++++----
 drivers/gpu/drm/imx/dc/dc-drv.c  |  5 ++++
 drivers/gpu/drm/imx/dc/dc-drv.h  |  3 +++
 3 files changed, 53 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-crtc.c b/drivers/gpu/drm/imx/dc/dc-crtc.c
index 31d3a982deaf7a0390937285c9d5d00100323181..45a87df1ad6a8bd768aa5ed38d6f03f14052b3d7 100644
--- a/drivers/gpu/drm/imx/dc/dc-crtc.c
+++ b/drivers/gpu/drm/imx/dc/dc-crtc.c
@@ -293,6 +293,16 @@ dc_crtc_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 	dc_crtc_queue_state_event(new_crtc_state);
 }
 
+static inline void __dc_crtc_disable_fg(struct drm_crtc *crtc)
+{
+	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
+
+	enable_irq(dc_crtc->irq_dec_seqcomplete);
+	dc_fg_disable(dc_crtc->fg);
+	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_seqcomplete_done);
+	disable_irq(dc_crtc->irq_dec_seqcomplete);
+}
+
 static void
 dc_crtc_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 {
@@ -305,11 +315,7 @@ dc_crtc_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 	if (!drm_dev_enter(crtc->dev, &idx))
 		goto out;
 
-	enable_irq(dc_crtc->irq_dec_seqcomplete);
-	dc_fg_disable(dc_crtc->fg);
-	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_seqcomplete_done);
-	disable_irq(dc_crtc->irq_dec_seqcomplete);
-
+	__dc_crtc_disable_fg(crtc);
 	dc_fg_disable_clock(dc_crtc->fg);
 
 	/* request pixel engine power-off as plane is off too */
@@ -337,6 +343,40 @@ dc_crtc_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 	spin_unlock_irq(&crtc->dev->event_lock);
 }
 
+void dc_crtc_disable_at_boot(struct drm_crtc *crtc)
+{
+	struct dc_drm_device *dc_drm = to_dc_drm_device(crtc->dev);
+	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dc_crtc->de->dev);
+	if (ret < 0) {
+		dc_crtc_err(crtc, "failed to get DC display engine RPM: %d\n",
+			    ret);
+		return;
+	}
+
+	if (!dc_fg_wait_for_frame_index_moving(dc_crtc->fg)) {
+		dc_crtc_dbg(crtc, "FrameGen frame index isn't moving\n");
+		goto out;
+	}
+
+	dc_crtc_dbg(crtc, "disabling at boot\n");
+	__dc_crtc_disable_fg(crtc);
+	dc_fg_disable_clock(dc_crtc->fg);
+
+	if (!dc_drm->pe_clk_axi_disabled) {
+		clk_disable_unprepare(dc_drm->pe->clk_axi);
+		dc_drm->pe_clk_axi_disabled = true;
+	}
+
+out:
+	ret = pm_runtime_put(dc_crtc->de->dev);
+	if (ret < 0)
+		dc_crtc_err(crtc, "failed to put DC display engine RPM: %d\n",
+			    ret);
+}
+
 static bool dc_crtc_get_scanout_position(struct drm_crtc *crtc,
 					 bool in_vblank_irq,
 					 int *vpos, int *hpos,
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.c b/drivers/gpu/drm/imx/dc/dc-drv.c
index 04f021d2d6cfc93972aa8d9073be24d347152602..f93766b6bfbfae8510db05278d104820ca0719c4 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.c
+++ b/drivers/gpu/drm/imx/dc/dc-drv.c
@@ -17,6 +17,7 @@
 
 #include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_fourcc.h>
@@ -96,6 +97,7 @@ static int dc_drm_bind(struct device *dev)
 	struct dc_priv *priv = dev_get_drvdata(dev);
 	struct dc_drm_device *dc_drm;
 	struct drm_device *drm;
+	struct drm_crtc *crtc;
 	int ret;
 
 	dc_drm = devm_drm_dev_alloc(dev, &dc_drm_driver, struct dc_drm_device,
@@ -118,6 +120,9 @@ static int dc_drm_bind(struct device *dev)
 	if (ret)
 		return ret;
 
+	drm_for_each_crtc(crtc, drm)
+		dc_crtc_disable_at_boot(crtc);
+
 	ret = drm_dev_register(drm, 0);
 	if (ret) {
 		dev_err(dev, "failed to register drm device: %d\n", ret);
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.h b/drivers/gpu/drm/imx/dc/dc-drv.h
index eb61b8c7626933adc7688f046139e2167665dad1..68e99ba7cedbca1b8bdc0d8ced7a610a1056bfc7 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.h
+++ b/drivers/gpu/drm/imx/dc/dc-drv.h
@@ -50,6 +50,8 @@ struct dc_drm_device {
 	struct dc_pe *pe;
 	/** @tc: tcon list */
 	struct dc_tc *tc[DC_DISPLAYS];
+	/** @pe_clk_axi_disabled: disablement flag at boot */
+	bool pe_clk_axi_disabled;
 };
 
 struct dc_subdev_info {
@@ -96,6 +98,7 @@ static inline int dc_subdev_get_id(const struct dc_subdev_info *info,
 	return -EINVAL;
 }
 
+void dc_crtc_disable_at_boot(struct drm_crtc *crtc);
 void dc_de_post_bind(struct dc_drm_device *dc_drm);
 void dc_pe_post_bind(struct dc_drm_device *dc_drm);
 

-- 
2.34.1


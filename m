Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D468B483D6
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 08:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3809A10E0E4;
	Mon,  8 Sep 2025 06:04:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Qx6h/3Wt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013000.outbound.protection.outlook.com [40.107.159.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9583210E0E4
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 06:04:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pBSDvheRNFbqvF1RHbERtDrEboupeAxlb/Sy/cDfnCWv61vdyisQOMcDN2O1hdg7hsc0Qa0c6/vo8rkJHnZMZYRkVhT96MKXvraMSRPeLbI8QZXup0eoWH21otkdeIiEpVXXvVVcEqFBtYXet7nOWhsnDyjGLKccLeRPAUHJnpKQhef90CAC7h2j/kmYqcmbIyoX6NyHO9AcDa/8algU4ju8lRnftqTqbfnRBH0xvhp7KU3JxGsLNde4v/ZT2v/joCP5QLQilRK8bhWk2IC/BTt7F4nEQaGRkUL/n0+l5XpeOeMSYLxOMaxUWmV6zJH4ugTIvVMBuxQggbb2SOF+6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1y0k2xxFlArNQz7c2qrnmFAf5Pkte3/LPVGHpfKL20k=;
 b=PM6cnA6Tm9t17de/ecDzpBzDZENEu3pALkLLdtPvbv2dOsRYdmuo/jikyNa2fL9paRScL64YqIYk7MxNIodzFcAqQNMS0F9zMqYlTJbychMFsrMO/lSsVwVUg0SLBlcSLQZ/GEudBSx5U4/l5Y8j2tkC7amK/qLtuJivpn8L9iXWcCFWc2Qnf1plnb0v7OuIu88KrvSCuSVtAes4mt5mcAVwl915wuK7mZqhztfB+LTfFeeh65QxLS9IylsfZ5j6SPoB1rpPjUnWOdxvdFozBBjSesO5xseVlkpwK1T3KOJFdHhJOqQ7P+9OWaCrz53yJJtayLbMkNIFpDdAFOrEFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1y0k2xxFlArNQz7c2qrnmFAf5Pkte3/LPVGHpfKL20k=;
 b=Qx6h/3Wt2DhOeqTPJUkHfU20iZ0LuybyB9BTmMtpKYz/91RIRbX5DK2jlT/bbiFv1xx6DepamLkzAEYV4g0j5HgEuCsLGxp+Mma42BjTxCMPsWG8txkn6WVWmdyk6nvCm3O2RXCDzlBhpt7KaVU/hX4TPnbOSittLo55gAutEOmmxEkULM9pdMlLXHtnVPgWhm2wP0xJsUjAHYRRwozEticnE3qRH+icFqfemu7YqBIykMJOBpPhAVdrJNsd/fC2Apn2sKmR6F/vT3c7vW2paOmQLfkHA5L4DxddaJGna1jdZW0k2zUZz/U+I/+KEfzHBEpq5eA8s3Wc1DVzoPb8JQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU4PR04MB10838.eurprd04.prod.outlook.com (2603:10a6:10:581::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Mon, 8 Sep
 2025 06:04:39 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%5]) with mapi id 15.20.9115.010; Mon, 8 Sep 2025
 06:04:38 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Mon, 08 Sep 2025 14:05:48 +0800
Subject: [PATCH v2] drm/bridge: ite-it6263: Support HDMI vendor specific
 infoframe
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-it6263-vendor-specific-infoframe-v2-1-3f2ebd9135ad@nxp.com>
X-B4-Tracking: v=1; b=H4sIADtyvmgC/5WNQQ6DIBAAv2L23G0AkaY9+Y/GA8Wl7kEwYIiN8
 e+l/qDHmcPMDpkSU4ZHs0OiwpljqKAuDbjJhjchj5VBCdWJu9DIq1GmxUJhjAnzQo49O+Tgo09
 2JrRWCyW119LfoGaWRJ63c/EcKk+c15g+57HIn/0jXiRKNOTJdLp7mVb3YVuuLs4wHMfxBaJJ2
 4rOAAAA
X-Change-ID: 20250904-it6263-vendor-specific-infoframe-aa40214f41f7
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Liu Ying <victor.liu@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG3P274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::32)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU4PR04MB10838:EE_
X-MS-Office365-Filtering-Correlation-Id: f5e973f9-dabb-4d23-d1eb-08ddee9d9832
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|19092799006|366016|376014|52116014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V0g1MUFubjJPU3hja0dEVElTeExRRG9YaFJ3ZFp5SnpwNlg2dlpmTlFCY1Vp?=
 =?utf-8?B?b3pSeGgySW1ZUnV3VC9NUHNVMUFEVTB6RUlETUxFdjd2SGNxRGw2Y0s5UmxK?=
 =?utf-8?B?RVgwZm5rcjFDUkZTL055dEJmTUF0Z3dJUVUydUs0RTJQenlxQjBTV093WlFE?=
 =?utf-8?B?cXVCNXVEYUJWaGRBZ3NxMDhNZ25tSVlabVdmNTBobUpUK21kU2pUZXFNczN0?=
 =?utf-8?B?U0JwZFIzVUV6Yk5kSkhnU2M4RkFZSGtDeGp6RE1Sdnd6eFJuSVk4QU5Lby82?=
 =?utf-8?B?Q1FqTDBmZmZUWkdtU25rSXlGWi9HUnlTQTFhRHRFbFNYK1B2eXE0K3R3a3V4?=
 =?utf-8?B?bzNQRzE5SGlEeStTQk9EK2h4cTdGY0lPNjhMdFdFVTF3VGk0Z1NzS0JUY1hU?=
 =?utf-8?B?aVlTRXROdy9jQXdoYlc1Tm1QS3FNVmZaTlAxVWdvTmM2QjJVT1k4QWlZUlpr?=
 =?utf-8?B?eFJTOER2TDZOZkM1cXo1OUNhSnh0T040bE5EN21GaWEyUnpWTVNNOG4zK2R4?=
 =?utf-8?B?NXFXRFRxYVNHQ1RnajlCWXAvam9PVG0zZTZVZ0l1c1J4UzZUZ0RZNVlaTWow?=
 =?utf-8?B?bWlVZFBGVk9Ob0gzRXpsNjNybDFhVHM1TmZaM20wQy96dUp2ckEzTzhuUTJY?=
 =?utf-8?B?cHMzTTVwblJ6cW5zWGk4VDJIaHhhNUtXUGtFOXhsSXJ2QWxIQ0dsc1ZmTEsz?=
 =?utf-8?B?SmFnb0orVXhJV1UwbGgzWUd2N3ZNc2RpRHFwN291RHJZRXJIYWxHbytXc0R0?=
 =?utf-8?B?N00wc29uUlJpaVBwZjVibmkyN0cvVHk5RENaWDJxNWJXY1I2N2RJRnllMDNZ?=
 =?utf-8?B?alBSWDcwUGt6L2dLaTdzSHpWY1dTbk9jN0Jmbzk1WGVJN3VuT0lBS1BwSTFq?=
 =?utf-8?B?bWFxV3pYOGJvVUppVk5LZ2U3U0FtS043TjJOQStkKytZeEJRMHg3K0lDWXNt?=
 =?utf-8?B?LzBCdjAxL244aEprQ2lhdXNJalhLWUd0clk1dU9lL2p1NkU2eGZ3Z2VNdUIz?=
 =?utf-8?B?NGk2TXY4MGprOExZdkJveEZva3NIRDF1WlYxVC9QTkJreFBzdTR3cUd1VVJK?=
 =?utf-8?B?VWtRWTUzWEJ1R2RYRm1sMmZLMFZBQno4OWhPS1lHYVYrUHltVDNMSkYyNTI3?=
 =?utf-8?B?c2ZFUDQ1dU1ZUzJ2L2xKeGdoUGtZVmE0NWxhMy9Fa0VKUCthZktBWE9vUXZ3?=
 =?utf-8?B?REYzUjgzSnBDNEJxTmtreFk2WFlHWDVmNERLQ1JLSzcwVmdhanFTWTVDeFJV?=
 =?utf-8?B?dDRyd2dadzRQOW1tSVVBaXBueHJlWFhFa1NURDBUTml2ckRJNyttb0pYWUc2?=
 =?utf-8?B?bm8xOHZTSUNjRkdSQ2NjRmhKRWpOMktyUndkMTUzdENHU2xlZ2h0WG15ZW9m?=
 =?utf-8?B?QVJnZkFUMmtuNllPdit5dHdHOUFsQmRneFVwRWFHaEc3NktpcjJPQUk1SVlm?=
 =?utf-8?B?UHVEZmxxZ0g0MTVvOWlqQWVRQ2NWTERVZjhVWjJabEovNzZIdGNzc2JpVzhL?=
 =?utf-8?B?dS9sQUpkd0VWbUVhdGNLbmY4elN1K2lCVm00WjVnT1lHMjRVcjJUZXljQkc4?=
 =?utf-8?B?cm9BRWQzZGNKdlp6QllpOGsvSDVJSkRWeC90NHpSZVVGcmZTeE5BM3VzUGlF?=
 =?utf-8?B?Y0VKbkZHZ3diWkJFREpBWWoxL3g4bC9vdDRZMU5OTlpIWitMU1p3RUJKRGVm?=
 =?utf-8?B?V0NpeThGM0hUMlhzbEtLUk96TnNrK0tsZjBDdnRnMUNiYmhmcjQ5SktpbDdR?=
 =?utf-8?B?bnNtZEpzNzN0RjBVS3NKTEgrMlZDNnd4Uk5xSzBTbXZ5T0ljbVpIN0xOVUs3?=
 =?utf-8?B?UFlwakRkNXBGQUFNbjN4ZUZBOXZwd0k0SVQwMUJTV2FJeFhlZW00NkpyUHlO?=
 =?utf-8?B?dFpyZmNFbTU3cU5aaW9qOG5YeWNka3ZmQ3JtS0FrU1FoNXJOQkUrTHBCNUpW?=
 =?utf-8?B?RGwrcC9hUGVwNzRaYUpmcW1GZWZzeEg2cDFmcjZMWnp5bDdwNitpT3lyNFBn?=
 =?utf-8?B?YUNESVoxdHRVV3FmSlZVaXJ5SnZVWk9ZNEYxVi9ZdndZS2U3QnNJbjFmUjE5?=
 =?utf-8?Q?8tWr8b?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(52116014)(7416014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHhWTVoyRnhDU2tJaE95ZWxhbUZuSjY0ZzBGZHBaSXFXSjNKY1hCRnhvNmtW?=
 =?utf-8?B?VHZKMFFNU2V4RnJFeHUxSlRTZUF2S2phaWJyN0JPNDVzY1dPY2xFbHQrcURF?=
 =?utf-8?B?YzJoZnFmTldXSUF3UW55VElmVllhWDROWGxsNm1STW4yaFNra3lRdHppQkNO?=
 =?utf-8?B?V0k2VVpLOXBKNnJCMWFlZEx6RlJhMEtVZG85ZXgzZ1BnQmZFZE1uaENrcytR?=
 =?utf-8?B?UDlFektlcVpVVUVjazN3L0NtbDd6U1dWT2xnZExIZHIvSjd6Q1QxUnd1QnpK?=
 =?utf-8?B?bW1wY3o2bU9MRGMwSEphRkh2VUZaOVd4b1F2ZjZiNG1HSnF1OEJremZ1VzRB?=
 =?utf-8?B?M2VsL1YzK1Bpa3RLUjBPWWJpQjRuR05CaDUwS1BSUlZ4Uk5aa2s1Yjc4RW0r?=
 =?utf-8?B?QkhRSUpXUUh2dnJHYThhbGI5N1RZdjlZWXk1R2MxSWpWcmRWTEpjQlNCSldW?=
 =?utf-8?B?eEJmZytRUkE1bUV4Zk9oWnQ4U3llUXhsQ0FzbjlubFBGT283c3IwS0JWR0Fu?=
 =?utf-8?B?dUZvbkRqbXdqVk4wcW9wdnlFVWtrVGZLdU1nUzJIZGZjWFZCa3V2TytwTDhy?=
 =?utf-8?B?WVVyUURIajZqaThHRjcwODdxZDhSNHFCaTZUZWwzU3FxcXMybTFBSjh5Um5Q?=
 =?utf-8?B?dEwrQ0d1YitmS0FNemxoQVFOTzc4dndVaW50MFFXRmlPalVPNXhMRUNoQWZC?=
 =?utf-8?B?UEE5cS9Oc01OZ2pWNVRyYzNCaXM0RVhmSWVhalRFRDhDVm5udkJZb2M1MU8r?=
 =?utf-8?B?YXUzbmVycmNIbCtqSUl4MXlzQ3pEYmFjUTEwYjlLYXpTVkMxa1RXeUVJbjFM?=
 =?utf-8?B?dEh1WGgva21KaWZOVWFJOTZWT0RMR29NVGh5ZDhKYlVseGhKYjRHNHdBNzV5?=
 =?utf-8?B?UTFpRkxMNWM3aUFHUmhuTWU2QTloWXVaUlpORHZxakorZkFxbkE4M0tsb2Y2?=
 =?utf-8?B?SndUY0dNYURjclFzTDJKTnZ2RjI0SXFWK1BTRkJ6aU10Y1lGZ1lTSXYrZUhn?=
 =?utf-8?B?T0h1SVlUUy85Sk1hTkVHUngwbW9TWUxUYkxYc1lMUTlyZTdpc1J6TnhGamVj?=
 =?utf-8?B?MmEwSVV0TkdkSVpNZGNtR241TTgxaEVjbVVxamN5cVdrUDRFQ0IxY2d4SDZY?=
 =?utf-8?B?TmFDVzNya01JTFowVjhLR2U5RmpiUEVJN2g5U1lCRURlK0xBU1lSWTJvSXRa?=
 =?utf-8?B?NG9ic2IvRFdkaitzR2pkcmYzaDN5QVVmeGx5VVBwZ2pWQk1aZ21LV3BYU2Zq?=
 =?utf-8?B?bk50cjgxSlpVRXEyUDNGMjA2SHpxUmtMd2d1Y2k4M0xXR2o1aXRwMEwxM2xl?=
 =?utf-8?B?UGVFbHhXMEFBdzdjS0hHSC8zZEhLWUNRbVY1c1ZCZzVQN2wrUlpFbExIU3pN?=
 =?utf-8?B?RGdHd3ZidExpNVkrbnJObEUwanhkK1VrRnJEcDhUUTMrY09rWmYzV05yZlYv?=
 =?utf-8?B?d0FGT1U5RCthcnV3V01SVlhzcmwyYWFvWHhGUmxtVGFpdUcrZG5zRjRMSjY1?=
 =?utf-8?B?SVpFSWpKV1pndjRQbkxnY1hhZGxVdXUvejhRM0ZFVGMzcnlHdVd4cG41NlBO?=
 =?utf-8?B?NWgvbkVqREF6ZFl0eXFWZU5mQkVuTTF3OWNYR3gwZHpoazZTd3VPc0c5OCsx?=
 =?utf-8?B?Qk1SRE8zeE9Vb3ZGMllxUXVTay9YeCtES3JEU0QvWEVOSVBxTDNQaDYzckZV?=
 =?utf-8?B?bFAwMmI3VHJUaXByOHZRTXdibWhyOUQ4L1ZhMnA1RjRkbElxLzFiYUtsOC9t?=
 =?utf-8?B?b1d2WUdmVUVBT3pmT3p3OW9EVHAwNmh2c3hLOVI0ME1iaGpLbTd3TmczNkFW?=
 =?utf-8?B?UWZZZ3BjbjA2am9lRWloVmk0L3BtVlM0TWtnbGlodUxJRTA4OUd4aGwwU0RH?=
 =?utf-8?B?WjV1L24yVmEzYmdPVS90cGhxZ3c5cDRDQmE4M1lHbzVSNG1jVUttUDY3NnBU?=
 =?utf-8?B?Ykw3SlNGSzRCWm4waXRzakQ3cFFsZEVvbGEvT3ZmTURQMzlITUxPemJwRHBI?=
 =?utf-8?B?Y2dDalQ4blQ3TGtVU1IwdlVldXBOV0Q1NFdXM2JmQnI3cWtNZi9QdGRmKytE?=
 =?utf-8?B?SFJaRjJaZEdhTHlrNlBMeEdhQjBqSVEwVy9iSVgwWG4xZUI4T0xmWVZTeTYr?=
 =?utf-8?Q?ku3bWev4lBg33jNobq+kRxzmV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5e973f9-dabb-4d23-d1eb-08ddee9d9832
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 06:04:38.8370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UexVS/IAP1LDInnorN07m5Rbe73E3KwWPE9v0s59+PyE2N/BRhD/Nnal/RBiD3Zsdl1czbDkHb9wYdp2FsV0Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10838
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

IT6263 supports HDMI vendor specific infoframe.  The infoframe header
and payload are configurable via NULL packet registers.  The infoframe
is enabled and disabled via PKT_NULL_CTRL register.  Add the HDMI vendor
specific infoframe support.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Changes in v2:
- Drop zeroing out all NULL packet registers.  (Dmitry)
- Drop no longer used HDMI_PKT_HB_PB_CHUNK_SIZE macro.
- Link to v1: https://lore.kernel.org/r/20250904-it6263-vendor-specific-infoframe-v1-1-6efe6545b634@nxp.com
---
 drivers/gpu/drm/bridge/ite-it6263.c | 64 +++++++++++++++++++++++++------------
 1 file changed, 44 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
index cf813672b4ffb8ab5c524c6414ee7b414cebc018..2eb8fba7016cbf0dcb19aec4ca8849f1fffaa64c 100644
--- a/drivers/gpu/drm/bridge/ite-it6263.c
+++ b/drivers/gpu/drm/bridge/ite-it6263.c
@@ -146,6 +146,7 @@
 #define  HDMI_COLOR_DEPTH_24		FIELD_PREP(HDMI_COLOR_DEPTH, 4)
 
 #define HDMI_REG_PKT_GENERAL_CTRL	0xc6
+#define HDMI_REG_PKT_NULL_CTRL		0xc9
 #define HDMI_REG_AVI_INFOFRM_CTRL	0xcd
 #define  ENABLE_PKT			BIT(0)
 #define  REPEAT_PKT			BIT(1)
@@ -154,6 +155,12 @@
  * 3) HDMI register bank1: 0x130 ~ 0x1ff (HDMI packet registers)
  */
 
+/* NULL packet registers */
+/* Header Byte(HB): n = 0 ~ 2 */
+#define HDMI_REG_PKT_HB(n)		(0x138 + (n))
+/* Packet Byte(PB): n = 0 ~ 27(HDMI_MAX_INFOFRAME_SIZE), n = 0 for checksum */
+#define HDMI_REG_PKT_PB(n)		(0x13b + (n))
+
 /* AVI packet registers */
 #define HDMI_REG_AVI_DB1		0x158
 #define HDMI_REG_AVI_DB2		0x159
@@ -224,7 +231,9 @@ static bool it6263_hdmi_writeable_reg(struct device *dev, unsigned int reg)
 	case HDMI_REG_HDMI_MODE:
 	case HDMI_REG_GCP:
 	case HDMI_REG_PKT_GENERAL_CTRL:
+	case HDMI_REG_PKT_NULL_CTRL:
 	case HDMI_REG_AVI_INFOFRM_CTRL:
+	case HDMI_REG_PKT_HB(0) ... HDMI_REG_PKT_PB(HDMI_MAX_INFOFRAME_SIZE):
 	case HDMI_REG_AVI_DB1:
 	case HDMI_REG_AVI_DB2:
 	case HDMI_REG_AVI_DB3:
@@ -755,10 +764,16 @@ static int it6263_hdmi_clear_infoframe(struct drm_bridge *bridge,
 {
 	struct it6263 *it = bridge_to_it6263(bridge);
 
-	if (type == HDMI_INFOFRAME_TYPE_AVI)
+	switch (type) {
+	case HDMI_INFOFRAME_TYPE_AVI:
 		regmap_write(it->hdmi_regmap, HDMI_REG_AVI_INFOFRM_CTRL, 0);
-	else
+		break;
+	case HDMI_INFOFRAME_TYPE_VENDOR:
+		regmap_write(it->hdmi_regmap, HDMI_REG_PKT_NULL_CTRL, 0);
+		break;
+	default:
 		dev_dbg(it->dev, "unsupported HDMI infoframe 0x%x\n", type);
+	}
 
 	return 0;
 }
@@ -770,27 +785,36 @@ static int it6263_hdmi_write_infoframe(struct drm_bridge *bridge,
 	struct it6263 *it = bridge_to_it6263(bridge);
 	struct regmap *regmap = it->hdmi_regmap;
 
-	if (type != HDMI_INFOFRAME_TYPE_AVI) {
+	switch (type) {
+	case HDMI_INFOFRAME_TYPE_AVI:
+		/* write the first AVI infoframe data byte chunk(DB1-DB5) */
+		regmap_bulk_write(regmap, HDMI_REG_AVI_DB1,
+				  &buffer[HDMI_INFOFRAME_HEADER_SIZE],
+				  HDMI_AVI_DB_CHUNK1_SIZE);
+
+		/* write the second AVI infoframe data byte chunk(DB6-DB13) */
+		regmap_bulk_write(regmap, HDMI_REG_AVI_DB6,
+				  &buffer[HDMI_INFOFRAME_HEADER_SIZE +
+					  HDMI_AVI_DB_CHUNK1_SIZE],
+				  HDMI_AVI_DB_CHUNK2_SIZE);
+
+		/* write checksum */
+		regmap_write(regmap, HDMI_REG_AVI_CSUM, buffer[3]);
+
+		regmap_write(regmap, HDMI_REG_AVI_INFOFRM_CTRL,
+			     ENABLE_PKT | REPEAT_PKT);
+		break;
+	case HDMI_INFOFRAME_TYPE_VENDOR:
+		/* write header and payload */
+		regmap_bulk_write(regmap, HDMI_REG_PKT_HB(0), buffer, len);
+
+		regmap_write(regmap, HDMI_REG_PKT_NULL_CTRL,
+			     ENABLE_PKT | REPEAT_PKT);
+		break;
+	default:
 		dev_dbg(it->dev, "unsupported HDMI infoframe 0x%x\n", type);
-		return 0;
 	}
 
-	/* write the first AVI infoframe data byte chunk(DB1-DB5) */
-	regmap_bulk_write(regmap, HDMI_REG_AVI_DB1,
-			  &buffer[HDMI_INFOFRAME_HEADER_SIZE],
-			  HDMI_AVI_DB_CHUNK1_SIZE);
-
-	/* write the second AVI infoframe data byte chunk(DB6-DB13) */
-	regmap_bulk_write(regmap, HDMI_REG_AVI_DB6,
-			  &buffer[HDMI_INFOFRAME_HEADER_SIZE +
-				  HDMI_AVI_DB_CHUNK1_SIZE],
-			  HDMI_AVI_DB_CHUNK2_SIZE);
-
-	/* write checksum */
-	regmap_write(regmap, HDMI_REG_AVI_CSUM, buffer[3]);
-
-	regmap_write(regmap, HDMI_REG_AVI_INFOFRM_CTRL, ENABLE_PKT | REPEAT_PKT);
-
 	return 0;
 }
 

---
base-commit: 4ac65880ebca1b68495bd8704263b26c050ac010
change-id: 20250904-it6263-vendor-specific-infoframe-aa40214f41f7

Best regards,
-- 
Liu Ying <victor.liu@nxp.com>


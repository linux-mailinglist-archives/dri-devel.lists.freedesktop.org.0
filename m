Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AWOzM94YqGkVoAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 12:34:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 358061FF09C
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 12:34:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8671410E136;
	Wed,  4 Mar 2026 11:34:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qSRCZFnQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011023.outbound.protection.outlook.com [52.101.65.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED7FC10E136
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 11:34:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QzwTW2WMjztXbtbpCwZLeDqZjYupyshSshqurxEcXFuFz9GXr4UfpcrnDd8Y9zfSD+weiRpZ9/M7NH76QL89Cgc+mF6sWaeW4+Z4mG35DsG8/MaYMw8I/mrZWc1M02cls0ZdWiw8VNR3gXYqKCIAWNGvrTMxb0PjvJpAS1iCQ8RTX8EqrMHFLuVI8aUjqLP+G9RIIAs7SWyjscJuKWONoX+xSqypuz9HY2Dip9hQVKnjfgm1zDkjsTfSm7CJqsPoyifz/M82cTbDyqc833JhkdZ0LkXM5mV7SSG4G56DUfrgrhnkcZjZZxTGEWkH7keRuwkbPqblGSGF3CiLD8DzKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mb1k+uODIgtTD9ggaAVZagwJ9EPWaw3XkVMaESWInnk=;
 b=r+yOIVQfcGUU18Krfcz/eaXFY2AVuXxvd42Ll7+AD51shbICPrNCjRKbw/2pY2zY0LWdM4p0XDtXctnsCltPUxCq67xFY9JHdGOL7/60ihBWdg3Sg/wG2N60cvCtTNes7Iw1i4G2to5CLLMybpIGoA2urh8Aid8u2UQp5iPF+dQ12/okZDk+F0Rae/0yodpUA29KMw63NWZJZC0QSYZK999//oIl/B8iCg7QoIt2Id7yyoK54c4VII0c3MLwDLO8a3JYJmFN2luELhW9XMtXbMqx6yAdeWAMxLerH4hC6c5cB+uNKXNIjX4Lb4FNVxkR57UgdiNpmBcxtKkG+jLStA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mb1k+uODIgtTD9ggaAVZagwJ9EPWaw3XkVMaESWInnk=;
 b=qSRCZFnQdi7ep/JpRadzurVqyLiwz6yz5tn1UMzrrT2qGdP9ltrJ2v3PYc4pEHdDlndEsodDPKCBVyKo0NGzfvahOBHw591ml4w9LNyGn6VTOV4UVtcShK/xIhzbBmIZA6uqIkxA7PnPFRdDU4m0medO3jZS02JX1p6a0trPqeduY/byhi/ZUx5KeTIAB0a2RqckSQx2Qm7HNKqfTLVGApkLgSr8dlRYZFn50o4Ky0f3M3jNUPfLv5Yu1RyYpuPlUohkzV30RBeo5qRzIK9NdHJK0R2P2lhFAHs9VMVkw0HAU9apjp6GdNHHcaaCuk+oXWnlfT6tMvpflF5+u50K6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by AM0PR04MB7188.eurprd04.prod.outlook.com (2603:10a6:208:192::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 11:34:43 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2%5]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 11:34:43 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, Ying Liu <victor.liu@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Francesco Valla <francesco@valla.it>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v8 0/9] Add support for i.MX94 DCIF
Date: Wed,  4 Mar 2026 11:34:09 +0000
Message-ID: <20260304-dcif-upstreaming-v8-0-bec5c047edd4@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250911-dcif-upstreaming-3e16d89c3385
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0182.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::10) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|AM0PR04MB7188:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c7fab20-d55c-437e-f1db-08de79e207d2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|19092799006|366016|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: 54t52vr3FzQc9bVbOzO9DtdpSPO2taVGWiIfh3667IhaQFEkN0NSl8zn2OhS1CstmQ0aZIfT++xWQX9JzzO4iaE6IoKKSxTgPebOj5B3s+Nu7VIUDQMqEEYls1c9rb9wogiSYuZqKQCElqHVjlnY4UblmAzbz1sEkn3N6TEwuqX4xBtZ7nOZmurSlEoJPLbjj+/JVVXCE+CFc6qd53aiewB3NXqUx1iWaJoiYWwhU7uTn5PQNenyY94RwO+1f65yJpqikniEJ/qP+pcukEcT86v+bzDMfyKtzGxO7UTYGApm8gL3prZom94CBoqnnXFiOSH+FwrrqoCFE/4S464nm5NjgjJYiG9gC3UgJbzgvn3ZY5s9ZxotXpA2Jm18GlabmYmpwd7tu4jkevUVscfL+3cer9L8EJlP9IZmRfQa711z3BaynvpLT+bR+JelRTCSwaEHACvaZSGe5eQVMdwaW0/HhuwLx5uY2dz1cVAciSsz4KciB1PgBQRH7WXMVw9SceIi84N3jmq3x9zf9kTK185iD9zYsj8jIIyGPqFNWFI/rGnkoSi2AtLw2S1dZMOXOv/x3GS9xaShV1ERHpYAxofQK7il/TXWGjzfP8MnoUtPHrUdRx4ovsyAgLn4XWsnt9uWXLAVHUs33GUJfOBADPepkxke7TKASDNT4jjaVCvbzo/nOG8iAa5XfQSQLSOt+/GgUebEyVrWeMpRLoE/sAnvrwa20EWmnaKdKgigZvjUzMq3SROZi/2OLJZUQ3snKDuFWWgWR9SoVyiduUSp8RKCKUm3+EyCBXZ97suuWB8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR04MB9135.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0MxV3N5S1cvMnZEUlJUR3NZOThNUVQ4YUJNbCs4ZXoxT0lKR0pHZzYxcDhq?=
 =?utf-8?B?bEF3eUF1Q05jZGRmeDMya3gvWUxINllMKzhzd1lIYXpEQ0VxekdEVkVucXZP?=
 =?utf-8?B?RDNmUnFSWTVOMWZXcXRwQmxrR0pkNTQ2RSs5anhTZjVRNEhMTXpHdUNPQ2s1?=
 =?utf-8?B?R1RKWUZITXFnWVEwdndwU1d3b0xlbTNhdTdnNEs2RHFESWpCRFpqcVF2dU4z?=
 =?utf-8?B?VGFVN2RVTE1mZTZkZjlZcjdTR2xUWEVJTlZ6WWVraDR6aGJkeXlFSTM1VG1n?=
 =?utf-8?B?RWc1VUdnWER3d2F5WXNRTjRxZkNCcWRuV1IwelVpT0JRRy9QYlpQb0lhcHUx?=
 =?utf-8?B?V0FEYVh6UzRFUlZVbTlSck94WVd1N05rM1AzT3ZuWHVOZlZtMmtKU0I2eE9R?=
 =?utf-8?B?UEtTeSttK1Q1R2VTc0tIM1NyV2xPZlRKY1VDR3BGaW54TWtYUmpOS25GdmlF?=
 =?utf-8?B?S3R2ME5kbWI2aG1ZUktrYm56d1lMNmNkS2FxWWdPYUY4Tk16VnhBNUQwakF3?=
 =?utf-8?B?QWRab082OWUvakpqbmxRa0R1QVA4WGFuOW1QZllRYWJQSjlZM3BYWEgzeExY?=
 =?utf-8?B?a0JNTGVmYStoeHdTTkMrTHVobm1oM3h4SWd3TlljcEpFNGcyckNrZ0E1bDFY?=
 =?utf-8?B?SktBRi8vZ0w2eU1Bd2NuZUhhcjNwbVZLV1Nhd0lhdE1oUDkvMlV3N0tjdXhX?=
 =?utf-8?B?VG8rWTEwWUVlRm9sMW1DWG5xT3VvTkR5cHpWTVpTdk8vOVByenhiZi9PeWN1?=
 =?utf-8?B?SUo3bnhkb3FUSk1DVXc2Y0JmRDV1SGkyMUsxWjVsZkpIanlxeHlubzVQZnR4?=
 =?utf-8?B?blhmbDZsMXNuYTZxQWM5Q0tqNFFzVEhDREp5U0tkcnZJdGFXNmFuR3BBM3Ju?=
 =?utf-8?B?czFoVFRlclBRRldNKzBaWEdZK2NtSmZSbDhKWXFiTG0xeFVveUlWeXp2RW10?=
 =?utf-8?B?QndNYXNrZUU3Q2tvaGV5Mm5TUGFnSllKajRmeEVqZE82M0xlUmt2LzVEMm91?=
 =?utf-8?B?aEZaYUJWRFN2dDJoK1RXekNzNHNtNElmSlBuN3d6YncyNzlYR2NYRExXa1pr?=
 =?utf-8?B?T3dYYXdHTFJxaWp4SkRoMDgxNmp3QkMwYzkrRnJ5V00zUndHdmNaeGJNaTFz?=
 =?utf-8?B?U0VaTlVvaWFpQWVHd2xoQnhTdHpDeEkweTdDbXRHRUhhcC9UQUFqL2gzMzlv?=
 =?utf-8?B?ZUtOUVZ0R3FVYnBNaXFvNDFqajRTNXpVU1NQWTdqSWtibklLZFpwWW9RSUpW?=
 =?utf-8?B?WWNDSVcvK0VnaytEVGNDQk5mOTdoMkNYWVF1b2QzbHNXM0pHeGdsdGN0WWNJ?=
 =?utf-8?B?YlZwU2ZGdlJMeFY0Y0RpTmFzcGg5NlNuNHpzRVRKTldiNmpnR1JabVJPdXRB?=
 =?utf-8?B?dExPb1J5ZTZrdU9za3AwM2swZHltdG9taVorMjh6UjBCVVBTQnk3MDhoVmtI?=
 =?utf-8?B?UTJOd2UwaFBTenZBSTBwMysrakV4US9tWjYzVG5BeFpTdTlNUVF2SUIyeGdG?=
 =?utf-8?B?MTF2UERxenNHNkt1S2h0Q3g5U1YwNFAzWjlEM2sxTThFb0hZdTc2eVRKS3Az?=
 =?utf-8?B?b0JXRDNhUjNBQ0UwTFR4UlV3NlNsRWJrTEE5SEpDWUNnWXFkUHQzZWZMQURF?=
 =?utf-8?B?L0lzQXFzNVpMKytYM0JEcERyc1BGOVBzNUhKQ1p1QzI4WmRyenRueU1meVNY?=
 =?utf-8?B?MXdDazZmTFQ1dG12aWxiUDcwNmR5cGJ2U0dFVEdjYVptcmlvNTcyOFZQU1VY?=
 =?utf-8?B?VXptQkRsZzA3UzJKY0JFdVB1TllrbmtDMnBVOGw2UjVYQ0RQVkdIN2dlOTNH?=
 =?utf-8?B?OFVqdG5mVjZaQkJBdDdQK29GUlV2UzU3TVBmYXQxd0M4VVgrSTQzQ0c2aFkv?=
 =?utf-8?B?Y1hOOHhIT21NRmM3MmFaeU02T0dJNVR4c1BSYktJbjdxUW83NmIxNEJrWVF0?=
 =?utf-8?B?SFBDWVhjdysvakxHakExUE1EVDVaUVJiUm10QlNJSjNsaXhHdEJKekMxdmtn?=
 =?utf-8?B?TmMxOHBlbWxYQnRId1lzSGI5TXR2ZjRwcmltVG56ZGh3Sk9KZzZRbDlZYmJh?=
 =?utf-8?B?YVI5YnRTd1JDMzdQK2JaVkRxVjFueCt6YlJyYnpsOTZPdUFQTXhHNzkvaGhi?=
 =?utf-8?B?T3Q4Q1FxcmhhV3ZyOEp3ZjFvUDdwSitBbnk3QTVZVUEzVDRXdnpVRURleUk1?=
 =?utf-8?B?Um9VaXY1OW9uQ0xpMTFCZHAzeTA5cnVCSzE1T21BOGlvWlEwdzFXYUZRWlRZ?=
 =?utf-8?B?UGdBRWdJeHB5bERQNHU5OXp3MTNXVk96TWppc1JRMEQzODA5ZENCWlJEQy9W?=
 =?utf-8?B?NzdsR0xuK3BpUnBkUXMrZU0vRVo5L0E4WktOMzhUeVpCM2NldURTV0J6M3pS?=
 =?utf-8?Q?1n7EvWXJUCorE5IE=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c7fab20-d55c-437e-f1db-08de79e207d2
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 11:34:43.6840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rjSH5JGSLonZ2gyEontqyxP+QWtoxK+KWEHUZHUXdqO/cCr/zRNMRgguWH+mMnrzEQmKIej4ZWDIoLWyUs3b9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7188
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
X-Rspamd-Queue-Id: 358061FF09C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:imx@lists.linux.dev,m:abelvesa@kernel.org,m:peng.fan@nxp.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:p.zabel@pengutronix.de,m:marex@denx.de,m:victor.liu@nxp.com,m:laurentiu.palcu@oss.nxp.com,m:luca.ceresoli@bootlin.com,m:dmitry.baryshkov@linaro.org,m:francesco@valla.it,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[laurentiu.palcu@oss.nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	FREEMAIL_TO(0.00)[lists.linux.dev,kernel.org,nxp.com,baylibre.com,pengutronix.de,gmail.com,intel.com,linaro.org,ideasonboard.com,kwiboo.se,ffwll.ch,linux.intel.com,suse.de,denx.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurentiu.palcu@oss.nxp.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,oss.nxp.com:mid,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Action: no action

Hi,

This patch-set adds support for the i.MX94 Display Control Interface.
It depends on Peng Fan's DTS patch [1] that was not yet merged.

Also, included in the patch-set are a few extra patches that the DCIF
driver depends on for functioning properly:
 * 1/9 - 3/9 : add support for i.MX94 to fsl-ldb driver. It also
               contains a patch (2/9) from Liu Ying that was already reviewed
               and was part of another patch-set ([2]), but was never merged;

Thanks,
Laurentiu

[1] https://lkml.org/lkml/2025/7/7/84
[2] https://lkml.org/lkml/2024/11/14/262

---
Changes in v8:
- Rebased to latest linux-next (next-20260303). Patch 2/9 had a minor
  conflict bacause of a patch introduced recently;
- 8/9: Fixed CHECK_DTBS errors reported by Rob's bot due to missing
  regulators. Removed the r-b tag for this patch because it needs a
  fresh review;
- Link to v7: https://lore.kernel.org/r/20260122-dcif-upstreaming-v7-0-19ea17eb046f@oss.nxp.com

Changes in v7:
- Rebased to latest linux-next;
- Addressed some new checkpatch warnings: kzalloc -> kzalloc_obj;
- Fixed a couple of static check warnings in probe();
- Added Luca's r-b tag for bridge refcounting;
- Link to v6: https://lore.kernel.org/r/20251103-dcif-upstreaming-v6-0-76fcecfda919@oss.nxp.com

Changes in v6:
- 2/9: Collected r-b tag from Francesco;
- 3/9: Removed ch_max_clk_khz variable as suggested by Luca and added
  his r-b tag;
- 4/9: Collected r-b tag;
- 5/9: Call drm_bridge_put() automatically in
  dcif_crtc_query_output_bus_format() by using a cleanup action (Luca);
- 6/9: Moved allOf: block after required: block (Krzysztof). Collected
  r-b tag;
- Link to v5: https://lore.kernel.org/r/20250911-dcif-upstreaming-v5-0-a1e8dab8ae40@oss.nxp.com

Changes in v5:
- 4/9: Removed "bindings for" from the title, changed the port
  definition and simplified the example;
- 6/9: Fixed the way 'ldb' child node is declared: declare the
  'ldb' child node out of if:then: block and set the property
  to false for compatibles other than nxp,imx94-lvds-csr;
- Link to v4: https://lore.kernel.org/r/20250903123332.2569241-1-laurentiu.palcu@oss.nxp.com

Changes in v4:
- Addressed remaining DCIF driver comments from Frank;
- Limit the 'ldb' child node only to CSRs compatible with 'nxp,imx94-lvds-csr'
  in the binding file. Since LVDS CSRs are a minority, I chose to
  use the if:then: construct instead of if:not:then:;
- Remove the '#address-cells' and '#size-cells' from the ldb node, in
  imx94.dtsi, as they're not needed;
- Link to v3: https://lore.kernel.org/r/20250806150521.2174797-1-laurentiu.palcu@oss.nxp.com

Changes in v3:
- Removed the BLK CTL patches and created a separate patch set [2] for them;
- Collected r-b tags for 1/9, 2/9, 3/9 and 9/9;
- Removed the DCIF QoS functionality until I find a better way to
  implement it through syscon. QoS functionality will be added in
  subsequent patches. Also, used devm_clk_bulk_get_all() and used
  dev_err_probe() as suggested;
- Addressed Frank's and Krzysztof's comments on the DCIF bindings;
- Addressed Frank's comments on dtsi and dts files;
- Added a new binding patch, 6/9, for adding 'ldb' optional property to
  nxp,imx95-blk-ctl.yaml;
- Link to v2: https://lore.kernel.org/r/20250716081519.3400158-1-laurentiu.palcu@oss.nxp.com

Changes in v2:
- reworked the BLK_CTL patch and split in 2 to make it easier for
  review;
- split the dts and dtsi patch in 2 separate ones;
- addressed Frank's comments in DCIF driver;
- addressed Rob's comments for the bindings files;
- addressed a couple of checkpatch issues;
- Link to v1: https://lore.kernel.org/r/20250709122332.2874632-1-laurentiu.palcu@oss.nxp.com

---
Laurentiu Palcu (7):
      dt-bindings: display: fsl,ldb: Add i.MX94 LDB
      drm/bridge: fsl-ldb: Add support for i.MX94
      dt-bindings: display: imx: Add i.MX94 DCIF
      dt-bindings: clock: nxp,imx95-blk-ctl: Add ldb child node
      arm64: dts: imx943: Add display pipeline nodes
      arm64: dts: imx943-evk: Add display support using IT6263
      MAINTAINERS: Add entry for i.MX94 DCIF driver

Liu Ying (1):
      drm/bridge: fsl-ldb: Get the next non-panel bridge

Sandor Yu (1):
      drm/imx: Add support for i.MX94 DCIF

 .../bindings/clock/nxp,imx95-blk-ctl.yaml          |  26 +
 .../bindings/display/bridge/fsl,ldb.yaml           |   2 +
 .../bindings/display/imx/nxp,imx94-dcif.yaml       |  82 +++
 MAINTAINERS                                        |   9 +
 arch/arm64/boot/dts/freescale/imx943-evk.dts       |  86 +++
 arch/arm64/boot/dts/freescale/imx943.dtsi          |  53 +-
 drivers/gpu/drm/bridge/fsl-ldb.c                   |  46 +-
 drivers/gpu/drm/imx/Kconfig                        |   1 +
 drivers/gpu/drm/imx/Makefile                       |   1 +
 drivers/gpu/drm/imx/dcif/Kconfig                   |  15 +
 drivers/gpu/drm/imx/dcif/Makefile                  |   5 +
 drivers/gpu/drm/imx/dcif/dcif-crc.c                | 211 +++++++
 drivers/gpu/drm/imx/dcif/dcif-crc.h                |  52 ++
 drivers/gpu/drm/imx/dcif/dcif-crtc.c               | 695 +++++++++++++++++++++
 drivers/gpu/drm/imx/dcif/dcif-drv.c                | 228 +++++++
 drivers/gpu/drm/imx/dcif/dcif-drv.h                |  86 +++
 drivers/gpu/drm/imx/dcif/dcif-kms.c                | 100 +++
 drivers/gpu/drm/imx/dcif/dcif-plane.c              | 269 ++++++++
 drivers/gpu/drm/imx/dcif/dcif-reg.h                | 267 ++++++++
 19 files changed, 2212 insertions(+), 22 deletions(-)
---
base-commit: 11e703f54ac21f4dc609ea12ab578ffa47c87e11
change-id: 20250911-dcif-upstreaming-3e16d89c3385
prerequisite-patch-id: b2acaaf7e92a5c8e377e6b56f3a9ee7409f64b00

Best regards,
-- 
Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DF4C11AEE
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 23:26:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4729110E565;
	Mon, 27 Oct 2025 22:26:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="PY1mPrOU";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="PY1mPrOU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11023117.outbound.protection.outlook.com
 [40.107.159.117])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B28710E50C
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 17:48:28 +0000 (UTC)
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DaJggNcj6z0sprNFLhFqM1637PG4baylWApVRD4qhmBAREAo19Buj+KmYdMxEVDD5d4Wr0aZuSIiCKvftwnHrO3MDHsyPShmWPg5DImIpdBdVCr9PI4gD0H20SpvWk6RHWb9yOg84PpQGiTphQNjomBQQlPA0xGUASkW8aPvjhjOvJjjROrcvn2GxRNdYLrPi+h1BzRv1Iw/OoLfVKDyPK1AZXK5QHR7Rdz5ajMNBE+2FHhbeDV0pk57HC/eHOuUqs3TDaoKJVjx0qKOLHyFmLhj1GSNj8HTip9y+2qOMpR4CVXtamJVeNOA2QQvN1oh6iIc8YtSgwOinqouOSX8fg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGjvaMCMfaje2nCV+FCFgB7ju0NF0TRbRSgq3es6QTk=;
 b=aGIvwnHDFtEAmcvbVyThhq9xC9cx+248gPl73lKXHVrT/ZdDhsb8GsxP07xqEZd6khya3LmGiKaUZfwoKlorNlJNAe2u9t1AIceJpCnsZavnd4PPUfBX3yNuKCp7oBHFkZSjIUcLMfcmVH6DNu24Bl40Ty1UyQPYYqhhJohN7WqYQL7Z12A3o3CCdC473BOsOTXqaiz46G0M8AZDN9zKl2j6xO/2CrSNjcVyRBW/8BY+Op9GafmYJhJKIgLRJjmJzYLbSA35J2wZcJ4L+ZSeQIRLGD5pjmDEgULR3WtSgoBr/PwQfdb2XLFVDBVis2jCvXbeR+nUxyQ0MWHYaUX1Dg==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGjvaMCMfaje2nCV+FCFgB7ju0NF0TRbRSgq3es6QTk=;
 b=PY1mPrOUh120KGQFJvmu18dlEmAZIOFWHeWsn8XnXNAHwBCGiNiEuHVTdr/Z3yXMeTvFtOnQHNo7o2mzQEejkxYnbpN/cbj/pmzU30cC3ccCIgXub09rkgXYnYE3WtIrSYEpC4+JvVaQAsUYoa6s8u+YFyZe/6w9NCJRUJFwNuk=
Received: from DU2PR04CA0084.eurprd04.prod.outlook.com (2603:10a6:10:232::29)
 by AM9PR04MB8470.eurprd04.prod.outlook.com (2603:10a6:20b:415::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 17:48:24 +0000
Received: from DU2PEPF00028D02.eurprd03.prod.outlook.com
 (2603:10a6:10:232:cafe::b7) by DU2PR04CA0084.outlook.office365.com
 (2603:10a6:10:232::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Mon,
 27 Oct 2025 17:48:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU2PEPF00028D02.mail.protection.outlook.com (10.167.242.186) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Mon, 27 Oct 2025 17:48:24 +0000
Received: from emails-3807103-12-mt-prod-cp-eu-2.checkpointcloudsec.com
 (ip-10-20-5-121.eu-west-1.compute.internal [10.20.5.121])
 by mta-outgoing-dlp-431-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with
 ESMTPS id F32A4802C8; Mon, 27 Oct 2025 17:48:23 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1761587303; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=uGjvaMCMfaje2nCV+FCFgB7ju0NF0TRbRSgq3es6QTk=;
 b=ntf3q+hLZp/ZqAdWYRDIfFL+aP/gbEPa5ev7XNQn7CZIBDzoa/b9R7Xdz4fXNdkIYo0hv
 k8a8Hfbk9jAtfjanLDbg9l7n60JvJ3elVcn/ZdeyERrnk1IAV77cbZ3e3HJ+H+pKORkubaZ
 bfZHzf8tSU8BmykB5PmAEZWidoQItW0=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1761587303;
 b=CgSOSlREOQD2fzVWyT4WFAo63KrvSt8ryhtXtKbCWXQZfjKWCF3oYsOeLk26eS1nsgIJi
 6/z1CvX0PoQtR5Igh0eh2u1+bm+h2PJ3anhrlnjteRp5KMFFWdiahlf3fQHgoGTivjeMf27
 U/PG+/mq6Q5TGk+M6PSGas8iRLZGR54=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r1QuC3oqiKyS+4a7AfY4leeceC5ZWyRh5i8YmbpUhyXuW2V+y7pYxoitkm5WhD2b8Uh+JcpvnHnZkxKwKZjMbXIHJpzKN80xOIkD/FH3AC/56JWdpZBdstP0Q2BH1SSOyGQtkrxYoSec0vGYq6Wv48WO7CM8DvMZA7JKcIsUwvuscM2Pny+/z4p6X58YSzxRXyceVRounuM38PZ+e1kNt8bKoyPR0L9B38F1w/jVLr7q3kf3RZKd6v33XNUC1Scv6mUzH9LKKxhGmKHziE1IaWIAzOlfytz+gKAVYIXT5MJ6QOX66ZQXY52+ZEB1RpwCvjW5UbC1faaimpy29cL9uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGjvaMCMfaje2nCV+FCFgB7ju0NF0TRbRSgq3es6QTk=;
 b=DCXZ8rmg4B/CkVHbcj4ntNlUBfs6pxCDBu42K9Sy4WDUQxSMRPbOS3xvo6xNh+EHe9qvwKTvnBJzpymyjpqVOujVx0skQ4Q226zanFdGZILx1kzhTpq/FNfiyJvvARgC9vWLxZ5mxo5KpPkqnS8Ye3TIJxf2ibcx5U+V0vCJYq3T9ZfZ8SGDPPZWJmJeT0aPOq0wAU+CoOq8y5sl/N6ekK11NgENDgf58fxCArIhUJr09SOIT4kAR3fD6qCbsAXJ2UydpQKeyfCXWULPaRZUVym+3faxeJYSofy/2s6dOz6quYsaNw4QjZ68x6yTpatTVIBn58qoxLT67IFIoAG2xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGjvaMCMfaje2nCV+FCFgB7ju0NF0TRbRSgq3es6QTk=;
 b=PY1mPrOUh120KGQFJvmu18dlEmAZIOFWHeWsn8XnXNAHwBCGiNiEuHVTdr/Z3yXMeTvFtOnQHNo7o2mzQEejkxYnbpN/cbj/pmzU30cC3ccCIgXub09rkgXYnYE3WtIrSYEpC4+JvVaQAsUYoa6s8u+YFyZe/6w9NCJRUJFwNuk=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DBAPR04MB7365.eurprd04.prod.outlook.com (2603:10a6:10:1a2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 27 Oct
 2025 17:48:16 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 17:48:16 +0000
From: Josua Mayer <josua@solid-run.com>
Subject: [PATCH 00/10] arm64: dts: add description for solidrun imx8mp
 hummingboard-iiot
Date: Mon, 27 Oct 2025 18:48:09 +0100
Message-Id: <20251027-imx8mp-hb-iiot-v1-0-683f86357818@solid-run.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFmw/2gC/x3MTQqAIBBA4avIrBuwCSW6SrTQmmoW/aARgnj3p
 OW3eC9D5CAcYVAZAr8S5Tor2kbBvLtzY5SlGkiTaTVZlCP1x427R5HrQUPG684zO0tQozvwKuk
 fjlMpHz2Rx/VgAAAA
X-Change-ID: 20251026-imx8mp-hb-iiot-525b03beea62
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Jon Nettleton <jon@solid-run.com>,
 Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0080.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::15) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|DBAPR04MB7365:EE_|DU2PEPF00028D02:EE_|AM9PR04MB8470:EE_
X-MS-Office365-Filtering-Correlation-Id: d2e2084a-beab-43a3-9b77-08de158106c3
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|52116014|376014|366016|7416014|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?a2V3ZzRPN3hLZVh5aG9xVjVDalNidy9nSzZJNncySjljclpDSU1HbHBXZFRT?=
 =?utf-8?B?YldFL1dsWTFuQmNPNXNHUlRrNnN0ZlZoVVNqVWFYeTJGZHdjeU5UNW1JK2Rp?=
 =?utf-8?B?QlFNMzlmcUJodFI0SWRVSjk1OUZkeGtvZUY5Mmd4cWFTU0NEUS96K2V1SkdS?=
 =?utf-8?B?Ri9OQWYyMHkycVhWM0U1RmxqRmhMUTZiMG5tU1BYSEhmcTkyZlgyeHNvL0py?=
 =?utf-8?B?MCtzcVJVald0eklLcmkxTm9TZzZlV28xQjhzTXh1a2R1L2NpS2EraUI3U044?=
 =?utf-8?B?aHg5RHc2NTNNTjlzTlRzeWxoV1RpSytodURlVVZnZXdXVlpCdDREcC9wdElZ?=
 =?utf-8?B?aksra24ycXJxQ1hEVVNST3lEVERuNzdEZW1TbDhBODJRRlIxSkozdkl3RzRt?=
 =?utf-8?B?aW5PcGp1ckI5WG9Yc0tlSnN5ejB2SjlTcWY3cGJWcXhieTlLL1I5cjFxUEJP?=
 =?utf-8?B?anJOT2VJNUJ0OXUyMy85TU5ZSVgrVXFXVGN5ODZ4TmNxdUk3ZGU2VTVPRlM5?=
 =?utf-8?B?dnl5SFZnc3BWOG8zV3puVS81MVpnVmFwenJPR0Z1WldUYStsQU81UDlRZm4v?=
 =?utf-8?B?M0JtUEVjbjVIS0VQaXZRQWMvMWZ4VFJzTDVWNjNuZ2I1Y3ljOWVQcml3ZU1B?=
 =?utf-8?B?clZvcllnUW5OMHhRQmkvN2hmbjVITUFWYUk1QklDS1M4RDdCR3BMSHZZNmpp?=
 =?utf-8?B?V3laeGc3N1VlOGFRc0hpYkhQQkNzWnNNdExVc2dqN1R0VWZMeUUrQXJaR04r?=
 =?utf-8?B?VTBJdkQxK3MxSlV1NzByL2Q0S3VhNGFPNzBDUTA1RlBPaEhZUjRVTTl4N0tj?=
 =?utf-8?B?UW84VmE4T1dKVTg4WW9MM1dsYUh5M2V2Q2VpVEdwU1RwYy96RWZ4U09LVVNF?=
 =?utf-8?B?MUtuWVpKbTlJbk5qemlZMUp3VlNpVUxpSTlUS2NCVnVMZDJMelJwMTY2VjFl?=
 =?utf-8?B?THI1aElJZkVMb0tOYnNMSHBEbnFadDZBVkEwVUY2U0lYNHdpdzcwMnJlRURC?=
 =?utf-8?B?WUk1RHhKRGJMa3hmMXdLdDVXdGZzNm41aFJ0WmwzUmZUS0ozRG5aK0UwMFVF?=
 =?utf-8?B?cEZnT1ZVNDlwS01RbndQZlBRcmRTUEhTdGhBd3VVTEdXS3VJeUlnVnMyVktU?=
 =?utf-8?B?NEU2ejg5MlZ6eW1kYkkxOERlTjlWdW5XaEV2eU1xanNDZnBDaTFqN09Mcnh6?=
 =?utf-8?B?bFBidUJYSUYvL2hBN3ZrR0xnUm04QzlNL2lsbUtEcWYxL0FkMCtha3IrY2RB?=
 =?utf-8?B?cWtLZjkxMUNURkZ4c3h3MGNqRnduSzZjbS9xckdmcTczdFd3ODZCam95WFR6?=
 =?utf-8?B?YzNVVHRqQzc3RlArN0xBZ0FNWDBJVjdaRm5FTytOcG0xU3hXbEliRFN0dWI5?=
 =?utf-8?B?NW1pWDZOUU5uTW9OQkZmSlVIR1krQXBPTUdCSUd2aUk2VzRQL1htTU14K21P?=
 =?utf-8?B?QVdCbUZRNUZaSHNlOTRmbmtuQ2ZXeEdsUGJPd3JpTWhMRzFkNGdRbzdZaTBV?=
 =?utf-8?B?dXJwSnM3NjBYVFo3cVVOZkRvYW5tbHo0Vy9CYUZFSW1yWWc2RG5KSHVjV2lT?=
 =?utf-8?B?Q3lUYUdzb1FMeFVqUzRJVVloa2p4VHg3OS9BQXVod0JIWWVsSFVSd1dKdjB6?=
 =?utf-8?B?QUVOeHBvWVlvOFdKMUs2bm00c1AvRHp1QWxzb0hTOWZrZWRaZmFaTVZSVXR5?=
 =?utf-8?B?Q0VadHVvWS9veTR2NEJPUHJsZWdlQThvcWExNFNmbXhabFhrTnhnVi91dzR2?=
 =?utf-8?B?Z2pBNzRsZkF5aGF4SFl2S1Y4TXo4VjhuSXJPZUdMMThkaDNvc1pXVlJnUmJz?=
 =?utf-8?B?UENwTmtYcUN2S2JiNHFCejFCRjhXTVNlQWJVNlZ4OHN0cGVkM3RHRjVTWi83?=
 =?utf-8?B?a0V6T21XNTNKWHEzcVV2SHZzVmpWbW5SZHpESjdOdzljNkdHZytEQjlESmQx?=
 =?utf-8?B?ZFYxQnRHN1FZRTFuUTE3UVhhWUF1dko0eUVDL0dBb1J1aHJSaExLM1dnRC9J?=
 =?utf-8?B?VG9aMEtoaUlWVzNvZzVHMzhzRmNJK3B2OTBhbmlWMUVReGhUQy9ER1I1aDNj?=
 =?utf-8?B?QVNhZGFScUJIREZBa1d1K2I3N3M5eDhDelU0Zz09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB8749.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(366016)(7416014)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7365
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 052242c88b6f41019b6e99fd4b87a7fb:solidrun,
 office365_emails, sent, inline:debd18510902b80412e2749450943e78
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 16c28513-a441-48c1-bf51-08de1581015f
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|82310400026|376014|7416014|1800799024|36860700013|35042699022|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RDJBN2xrbGRSUndYb2VaaXN4Z0NFMlljdzAwUnUwTDVib1FaeGlyTzRhTy9B?=
 =?utf-8?B?aEFHSzFXa0V1R2hQZlU5bDlDazIwdTc4bldFcnlUcll4Y1lObm5TZHRBUU4v?=
 =?utf-8?B?SzNQdDM0UWtabXVrc3d0WEpPcTJZcWJ2Rzg1aktHV2h4T1RGNjNSVVBFbTJM?=
 =?utf-8?B?RVlnSmdVWnNlUHRWNmQ3Rk83cUswSGZneDBwVHBvby9rUGNKYlg0bjUzNHo5?=
 =?utf-8?B?SVNEakdWbk1QOHdZR3N2RlArMTZlUHM4YmV4end1WjI4MUduVzZyTGhIcUho?=
 =?utf-8?B?TTVkU1FRWWY3QlVaRmR4alpGVEh1aGtIMjlyY0thOE5aM01rV0JuaGdlb3Fu?=
 =?utf-8?B?dlF0VGFkZkR1VWFmdHlteUxyQmkvQ1JPNUZLTlBxdTlQWlRiN3pzN25od0Q4?=
 =?utf-8?B?NFQ3NDk3cWxkYmV4OGM5a2VTa3NCMW1mQnhCOTVwL3YyY3hYTS9Xbm5SRGxW?=
 =?utf-8?B?STJhUHNzd05ZRytOUlVTUUJIKzMyZk5ndS85eWRSaGRjREtHMjAvcnU1SHor?=
 =?utf-8?B?d29HSDdNa0VoQ1BKdnJMemZtWFVEb2RONUVRb2FRZnp2Y21Hdm5RUC9BYXgy?=
 =?utf-8?B?K1pHSU9vQzc0YTRLUmJId3p1V21pL0NBV0pRWDhjbjAxNWxCOGp4amE0ZXB6?=
 =?utf-8?B?Z3lBbFpkUjJIQVUxOGNsWTZ2cWdUOVg1aGdIMWl6MHgvSjNUUUZkbmNDcWhN?=
 =?utf-8?B?OGkxaVI5R3EwMm4xZXhFb1F0bmZMZzJCa1E4Qm56TUhxWnRLZiswbVkzNGZH?=
 =?utf-8?B?N3RtOVBEejd1WjNuSmswdnVwSTM1TXV4N3Bxa0E4MVNIbXB4RWpkY3dCZUd5?=
 =?utf-8?B?VlBnbGU3UGtETUZmcUU5Vmp4bnNmcTl1U1VDdHdlUUtob0ZxeERkVU1uMGxW?=
 =?utf-8?B?aGR2L1hBaUJVTnR4ZXdkN2RSWTlmdVlsM2wzbG0rL3pkeVR6SUtEN0ZYVXN4?=
 =?utf-8?B?UENHMU5abEpac1pwQjExUVdiTU4xbHNWZGszRnhTZDlOVE9TUDJsWEN6V0Ns?=
 =?utf-8?B?bThqM0ZpS1IxY0lOVjJydTNRcnljMmhsT1dCWC90NDBYQndubWx3L3VxMFNJ?=
 =?utf-8?B?YkNzQndGMEw4c2ExT2VDekk0SW53azgvUnBrNDlrM3g5bUFUc2pXM1ZSSTJT?=
 =?utf-8?B?TFhwZ0VpS2xBVzVaWTQzQ2RrdCt6d2xYRTQ2ZXZnMXlkNmFVWlZDZEVhQ2ox?=
 =?utf-8?B?V2IweVpCOTZ1dldQbzN2OWxHcU5RampiNFF0MjMvaVd4NWNvdjZHN0hGNTB2?=
 =?utf-8?B?dE1RT1JpWVVJUEpISnNKTEh2YnY3bldmYURzdkREajk5SXlPN1ZoOUpKNmRa?=
 =?utf-8?B?MXZ0dUljTXd0czlITHpCTCtPdUxOSVdoZFZ2MGx4RW9zS2kvMWlzNU1sb3ZX?=
 =?utf-8?B?Qk9HcE1kQjBzT3BIMGxnOHErckZUeUttMHpTYzRzU25kYXNEdTFReXgwWnVK?=
 =?utf-8?B?Tnl0T28wSUVKc0o0YUZlbkZFdWdlM3BxVXFpUSsvcHFZRGlsT1lLYlp4WXpL?=
 =?utf-8?B?UTJmWEtUMFBqZFRmQXdtOEJhRHZPeXlzR1RzUEpEQTN6YWx3OWlWcXNIeWlx?=
 =?utf-8?B?WTdqUER6eUkzZGJWeGlLaUwxY2FzKzRvbXUyZlVUTUxGUWFob1Vhcncxd0dn?=
 =?utf-8?B?ektycGJiTFVPVDFXRnQ3NUk4U1RCT3dsOVpWNS8rUnZqQVYxSk5YUndvVGFa?=
 =?utf-8?B?Ky8walRiMEJhTG1UTHBtTU5rdWVLY3lXUjhTSFFlL2dwcHRKMnZLZ1M1dm5y?=
 =?utf-8?B?TC81R3lvTU00TU8wTis1YUEzYzFReE9hZmo4cHVIcS9SMTB3SlV2U2RacnNW?=
 =?utf-8?B?OWtOVzBHcVFLaEtrTWRsdlRqR0JzeU9saGEwL08yWlJrNHhQTjlnRjNuckFH?=
 =?utf-8?B?NWZuWUc4d00yVXhxNlNlNDk5czhIS2pmdXh6a1hYMDhOd3pVMDBFNW1zL1Ri?=
 =?utf-8?B?UWNvZGNlUVFLbFB4RVNpUzR0U0lnTlVQT3JObk55NDV2RzlhVFpQaUsyWTZ4?=
 =?utf-8?B?QUgvOGhLUVpDQ0JnNFJjMHV6M3gvK0U3Y1NTb1BqbjJkZ01zZTgzNkRxKy8z?=
 =?utf-8?B?bTFSRC95eVo4anBUeTMyYVNFV1QwNmhCamNCMmNTcVFwdDJPWVVrQkJvZUEy?=
 =?utf-8?Q?iMecSE9lp3YZIMbxhpNy7PrjQ?=
X-Forefront-Antispam-Report: CIP:52.17.62.50; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:eu-dlp.cloud-sec-av.com; PTR:eu-dlp.cloud-sec-av.com;
 CAT:NONE;
 SFS:(13230040)(14060799003)(82310400026)(376014)(7416014)(1800799024)(36860700013)(35042699022)(921020);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 17:48:24.1231 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2e2084a-beab-43a3-9b77-08de158106c3
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82; Ip=[52.17.62.50];
 Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8470
X-Mailman-Approved-At: Mon, 27 Oct 2025 22:26:30 +0000
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

This patchset mainly adds description for SolidRun HummingBoard IIoT
based on i.MX8MP SoM.

This includes dt bindings and a range of bug-fixes:

- dt bindings for the board
- fix to dsi panel bindings adding port property
- cosmetic fix to ther solidrun imx8mp boards for regulator gpio
   polarity
- fix dsi hdmi bridge on hummingboard pulse
- compile dtbs with symbols to support overlays
- gpiod_set_value _can_sleep conversion for panel and touchscreen
   drivers

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
Josua Mayer (10):
      dt-bindings: arm: fsl: Add binding for various solidrun imx8 boards
      dt-bindings: display: panel: ronbo,rb070d30: add port property
      Input: ilitek_ts_i2c: fix warning with gpio controllers that sleep
      drm/panel: ronbo-rb070d30: fix warning with gpio controllers that sleep
      arm64: dts: imx8mp-hummingboard-pulse/cubox-m: fix vmmc gpio polarity
      arm64: dts: imx8mp-hummingboard-pulse: fix mini-hdmi dsi port reference
      arm64: dts: imx8mp-sr-som: build dtbs with symbols for overlay support
      arm64: dts: add description for solidrun imx8mp hummingboard-iiot
      arm64: dts: add description for solidrun solidsense-n8 board
      arm64: dts: add description for solidrun i.mx8mm som and evb

 Documentation/devicetree/bindings/arm/fsl.yaml     |   9 +
 .../bindings/display/panel/ronbo,rb070d30.yaml     |   1 +
 arch/arm64/boot/dts/freescale/Makefile             |  15 +
 .../dts/freescale/imx8mm-hummingboard-ripple.dts   | 335 ++++++++
 arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi   | 395 ++++++++++
 .../dts/freescale/imx8mn-solidsense-n8-compact.dts | 852 +++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts   |   2 +-
 ...hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso |  70 ++
 ...ummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso | 105 +++
 .../imx8mp-hummingboard-iiot-rs485-a.dtso          |  18 +
 .../imx8mp-hummingboard-iiot-rs485-b.dtso          |  18 +
 .../dts/freescale/imx8mp-hummingboard-iiot.dts     | 710 +++++++++++++++++
 .../imx8mp-hummingboard-pulse-common.dtsi          |   2 +-
 .../imx8mp-hummingboard-pulse-mini-hdmi.dtsi       |  11 +-
 drivers/gpu/drm/panel/panel-ronbo-rb070d30.c       |   8 +-
 drivers/input/touchscreen/ilitek_ts_i2c.c          |   4 +-
 16 files changed, 2540 insertions(+), 15 deletions(-)
---
base-commit: d105bf1b138560f0e45127578fd14cd0d70c679e
change-id: 20251026-imx8mp-hb-iiot-525b03beea62

Best regards,
-- 
Josua Mayer <josua@solid-run.com>


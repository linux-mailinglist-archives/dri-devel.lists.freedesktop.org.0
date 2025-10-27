Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 363FBC11AF7
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 23:26:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5583D10E566;
	Mon, 27 Oct 2025 22:26:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="Jwd13roK";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="Jwd13roK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11022075.outbound.protection.outlook.com [52.101.66.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F60810E538
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 17:48:45 +0000 (UTC)
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=nLt7VvqIpN1HG0ds93abrlRUYQGAZGtnU1oPUYba+voSkpV2EM4k/KZVHFsRfxp5tuBP9t+c0GFW9pbQD9xTqXzsBKBQZeNyh7W4e8TcN1cscJN2BHFi447JSAMccsvPHh5nzYHm8rKRXSfYUV1pt65dpzP9XaiWU7e3M45m+B+w5aZzhFS9EeibCB4saih0TRzi89NXUH6gVY3yFH0ZSwBFoH7TL28Ag7uGM63ZlzhySmBdN1pcSWs/5/kPAagRNeqzcrp6GCuvD+Wp77zpA6+oP6Vh5Gvj7YQ6OgMeDEIZd543e4QbE4rCx98Y0P8IG3bAWJ7SYqqtrBJpht+6NQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gKY9eab7xwiOVUsmmLvpEwWVHtzfn9XwQ+EnI6XyW6A=;
 b=KeWV37Mc9VpiECeM8yYi/oSrl7kw7mO8TMNew/Dy14uiCGJkvOWKG9CIf+i0aIj1yFnh+lSvyP/a+iOZEONMUOPEhJAHrPUBYjQWWWsVbs4nY1ZZKAFF5JZa+KM0/yADbdlTSfmsNFRnLrtJqSEkGU2bZGZZM9+F5iZmejY3eUk72iMfhlJ4fH0SzVm4pr+mTHDJOsmoetHysSGyY7kpTbshrlCs1sDkVWoHt15/ySEJ6QBk7xY/TFbt+61Y6CrYwCIdEhEIUE0FI8zMqzG+5gjV/gprd/Qb5P+5uUIwhvlh96T8zgsuy61L6jKZ3PrLO37998szgWEPQjIQ4gZH0w==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKY9eab7xwiOVUsmmLvpEwWVHtzfn9XwQ+EnI6XyW6A=;
 b=Jwd13roKkdf/j76QH5fRCynCqM2wQorfOr8Y6x/Jm2qEaqhMqkaGLjHTP8Y3ZWzWyBYwWZuxOkxUqQVZqUjBroQ9dMs7dwdFxIePpjrx0pVChzc2FBuD7GtqhO0IqwHbg/381XoGkdxRFta44LEsGcQB6h77NM3SKvd2SfbZJtQ=
Received: from AS4P251CA0003.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d2::9)
 by OSKPR04MB11440.eurprd04.prod.outlook.com (2603:10a6:e10:9a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 17:48:41 +0000
Received: from AMS1EPF00000040.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d2:cafe::d) by AS4P251CA0003.outlook.office365.com
 (2603:10a6:20b:5d2::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.19 via Frontend Transport; Mon,
 27 Oct 2025 17:48:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS1EPF00000040.mail.protection.outlook.com (10.167.16.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10
 via Frontend Transport; Mon, 27 Oct 2025 17:48:41 +0000
Received: from emails-527504-12-mt-prod-cp-eu-2.checkpointcloudsec.com
 (ip-10-20-6-148.eu-west-1.compute.internal [10.20.6.148])
 by mta-outgoing-dlp-431-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with
 ESMTPS id 11499802D1; Mon, 27 Oct 2025 17:48:41 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1761587321; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=gKY9eab7xwiOVUsmmLvpEwWVHtzfn9XwQ+EnI6XyW6A=;
 b=C6Tu4LE91qFkP+QvYtFVNKRU1KocCMMot2LQoQlmL0iwimAyYXD6/7tEtxuUhSJJyBby+
 5bniKuunhySeA4y6fZcK+5jDMAtPAuYN6tXzha/zETcjBHmVAJNEbQgWvveweeK1AD0k9mT
 K8MibM9C8qPU9m9Wt73QFBr/iGsxftI=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1761587321;
 b=Zs0B+nINx2QAwW5wmSpzOX8Nlo0rIhWQ6ekzDIPQX+mcFxWLHWID+FNJdtHNBFV6b8y9r
 Utuf4juCQ2kHgx7INRs3wWOcDG/bf3syvtcNotPZ9RySMhX0Q2WEUydKfv5XChLaARocK3e
 hY6dL+rauxE116PXHnPct7/dzzSkZe0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R2zJljuanYC7ARZM20+vsOmCjONYbhs7qHgTZ/PorhqLYq1FOkPg+fT9E7RDOskvYKJHmo8t9FkoTv2b7soAxAyItB5mS8oP6tpN8PL6NgtaHZVAJWIlieEQ5VPu2BPZeatPXOfpdiGz3upLW5Y2dyBK3YCNR6LtPxxMi1azkTd+OraEXNS3TLIYtktgoyDJK4jRyyfw6uOTQ7TGoZ5XnnhJ6CmIRu4TXkrzsgj7fTOMVcVcVRHUl/AxseZcn1g1GsHozbnN8GDS74zsaQMtiPsZ1A7Vb9/8rQUjjDF0mbLQJvq/NT2IjVjWe1D+BPnaLMm6mA7mu280k9QD+ymIFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gKY9eab7xwiOVUsmmLvpEwWVHtzfn9XwQ+EnI6XyW6A=;
 b=j8zvJYoWPjHPFMPMBtm4pH1ITxwinGHqfDI93sBEXjJp2RDEMvOpmI/wTPskPNIE1efOxq0v8zFExRo2mUt7XvucguYvg1tnL/ptam6RJ/76EylbxqZt+Ef92aTPhDVBTt68rcSc88oyJnTvQSEcNAEvPHBKOQEjuuRD7IEKYKSkQVK4fdTS0P7x1tckwUGTrKTSK1/geqL2CGCBqIEXQTeS/75bRZf9LKmkxcfHTkcWJD4p0vOmIju1Zxao7dv3t2kfSHoHctQguMkp0Ez6Lo3XS/Pyod0ynG3V/Au94/5dLfI0uutms7OqEhRqhDvF50ieFk8tZ0vK5cyb0W4YKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKY9eab7xwiOVUsmmLvpEwWVHtzfn9XwQ+EnI6XyW6A=;
 b=Jwd13roKkdf/j76QH5fRCynCqM2wQorfOr8Y6x/Jm2qEaqhMqkaGLjHTP8Y3ZWzWyBYwWZuxOkxUqQVZqUjBroQ9dMs7dwdFxIePpjrx0pVChzc2FBuD7GtqhO0IqwHbg/381XoGkdxRFta44LEsGcQB6h77NM3SKvd2SfbZJtQ=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DBAPR04MB7365.eurprd04.prod.outlook.com (2603:10a6:10:1a2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 27 Oct
 2025 17:48:23 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 17:48:23 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 27 Oct 2025 18:48:15 +0100
Subject: [PATCH 06/10] arm64: dts: imx8mp-hummingboard-pulse: fix mini-hdmi
 dsi port reference
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-imx8mp-hb-iiot-v1-6-683f86357818@solid-run.com>
References: <20251027-imx8mp-hb-iiot-v1-0-683f86357818@solid-run.com>
In-Reply-To: <20251027-imx8mp-hb-iiot-v1-0-683f86357818@solid-run.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|DBAPR04MB7365:EE_|AMS1EPF00000040:EE_|OSKPR04MB11440:EE_
X-MS-Office365-Filtering-Correlation-Id: c47754ff-dcb7-409d-9dc0-08de15811104
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|52116014|376014|366016|7416014|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?Vkhxbk40L3A3MlZrb1d0OEszdnluRi9WTE5WUndBVGF0WmVWWUVjLzAzUDY4?=
 =?utf-8?B?blpvVjBSWVo3TzQ2Y0Z2aXptODJzWFFUUWJrWUNZWi9sbTl0N3UwamQ0OEFp?=
 =?utf-8?B?OExIenp0RTcwcWNDYXJCSmJJRitvY3owNmFqOVFmTE9TRlNPZEhoaldZcEI1?=
 =?utf-8?B?UTFGZGFsQkw5emhDZTd5UkRRbUJoRFV2SjVvYzZQNHdVL1RlOEJVd3hWT0Y1?=
 =?utf-8?B?Vkg3ZGFCR3Q3Y2ZRMTYwQ2I5TXNPUy9VQnRYb3hTWURKN0cvS0ZnNUVsZ2lt?=
 =?utf-8?B?ZC84OStpZ3V3N0twak01YldTTFluN2s1MWFoaDBHSlNvYzQvcUV1MVFmNWMy?=
 =?utf-8?B?Wkp3QnY2T1NPOGNtMkM5cElEOHdaeDVYMjYxeVJUWVU3NlYwUlYrZEo1dEZI?=
 =?utf-8?B?ZXdDbG94NHhKbDArQk9qYXFodHRWNFJWQWJDd0FjM2pxbTZEZXFyZm9JejdB?=
 =?utf-8?B?VFFpUnlsa2ZUbER0VG1ka1N5ZzVVajg4NE5uTE9NdmlFYVMreUgxRXp2eGVn?=
 =?utf-8?B?S2dZa1JGTjdTbC9ndjVNOVRBUEhvTTExTURkZ1VDblc5NGhvMWVsWlFCdUNq?=
 =?utf-8?B?akFmWGdLRUZyL2Q0bjlhRTVRemtialpPd3I4bUlnSjA2bGJNK0pVTzBkelkw?=
 =?utf-8?B?RjhsRUR6alp2NnpHY3hnZ3JrSTVVZ29hZGRlSEFxTzJzbTNSNStUNE8reTU1?=
 =?utf-8?B?U2hNMUNOa09QZnYxSU13Y2htMnIyMUJ5UDVHaFFRWlRvY1RtWkx1R1RNbkJ1?=
 =?utf-8?B?eG1FbVBLa0VFZXRZdWhvTjE1WGJjd1JuTzQ0MDI0L0NNYXJqeWlhVm9reTA3?=
 =?utf-8?B?ZWI1M1pnaEg4UUp1ajc0NUJpZjVrYWI2N1hGcVdmRnJtV0pzWUpTcUUyaUVq?=
 =?utf-8?B?cDI5VThsUGgvRXFKQWt5L0QrVDZIek1HTUdFWGIxK3FScXh6QlkzTU13TDNy?=
 =?utf-8?B?YUM0VjlFQjFSY256Y2daL2VTRllCQ2M5amFlR3RLclA5cmhCUnhoRndScXk5?=
 =?utf-8?B?V1NYK1U2SllncVA1bVZPeEdtNGY4YXFUTWVUY2hqWitJUWg3STdLb2xmdU1i?=
 =?utf-8?B?UFY2ZnlOMFQ4N093Y2ZPbXJWOFVoM0Q2TEl4QXFPR1Q3YndCeEtRY1Z2OVI1?=
 =?utf-8?B?cXVQY3pIdnZQeUdOTnNmS1FBTVZnYVJHWkx5OVdNdTdVVEF1cUcwK0ZjbXdy?=
 =?utf-8?B?cmxCS1EweHQxaHp3Vkd6QVc4djJWVUpReDRlNXRMa2QvMnRBRTB0N1h1aUJv?=
 =?utf-8?B?ZW5aaTBxekk1S0EzUDlsOGVRSG9TWEt3eFdIUVVqQXJLdFNlVk1lRkRXOXh6?=
 =?utf-8?B?ZFl4SlNmc3NFRTRvMVdEeEQyRUE5ZldzWHczb0sxRnlCbDJBQStBYW5zcHdV?=
 =?utf-8?B?THU2L0dOczJJVGxITmUxODVaNkg0N0hzd1FhZWJma3VIRDEvbFFOMEZ0bGpR?=
 =?utf-8?B?cUErSFI1SDZtZ2JQYnpyc2x1OVd1VC9hNk5pOEtFRzh6ejJ5SlBER2J2MDJP?=
 =?utf-8?B?TjhHSGRmVE5KV09qMStoSkRvOEZ0Unp5MWZtZmkzNVZpRmRwbVJEMy9PenRH?=
 =?utf-8?B?K3dacVNEWk9BZklUaFdiT2Nic1BuVGIyYjlXSy9KbUgzRjhGdmVxenVjU29I?=
 =?utf-8?B?ckJNUEtYQmxlSElLOFJ1Y01OOVZJZHUxQjJzWEpESnd1OGZ2aGY0NDVnUTNq?=
 =?utf-8?B?YWZoZVluZnRvWXhLanFGQ0dOVXdoVmVxVUpjRk5DcXArMndSbmhjVkdnWmQ4?=
 =?utf-8?B?R0R3cHBWTjFNMEhMR2ZQK1ZtcEoyUU52SjUxZEpqVzVZUUk3ZS9ab3RsMTVS?=
 =?utf-8?B?a20wSGc0eUZFQXhMKzRkZ2JTQ1oybDRqa3h4Y28vckhzZThwK3RvN2NrbkhD?=
 =?utf-8?B?cjcrMUpOdUgrdmx5WTRITVF4c1JHb2NzMk5wSHBITVFVYlNtQ0Z2cHQ5TXVv?=
 =?utf-8?B?UUFYRGpEMFRlSk5kQzljNDF6UkpNUnpMY2F2Wm9yYVQ0YXBQV0cvZXRLTkFm?=
 =?utf-8?B?ZWRYa2hpMDdacTg0YmRWRnRGWXFqLzU2WmJjd1pDb1h2RnBvT1dISW1aYmNH?=
 =?utf-8?B?Yng4Y1pZZDJYRE9sTE9JSVdEa3FkbVdYb2tjZz09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB8749.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(366016)(7416014)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7365
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 098358be0e044f1fbb55c9b5d3012e7f:solidrun,
 office365_emails, sent, inline:debd18510902b80412e2749450943e78
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0d3ac578-9691-4a38-6d78-08de1581064c
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|14060799003|1800799024|82310400026|7416014|376014|36860700013|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ukl4UWFGbGUwN2tpeGdvRlBseG9NQWZoLzRJc0E0ajVOR2EzTWxtVDlwY0lh?=
 =?utf-8?B?aXE4dHNoajdvcSs2R1pRR2YvSFlZeUFpYjh2R0VwVFlONmpoWDdPbHJLT1Iv?=
 =?utf-8?B?ZjNPclBMNkYrUU02NndXTHVoa1o0WGlhU05sdjFvcEhmaURaUWszVm5QbDhi?=
 =?utf-8?B?ay9nNHpaRTFGM3Y5WUZVTUhoS1NOSjc2eG9CN09jdlFIbzR3a29TQ1JVMG10?=
 =?utf-8?B?c0tFajZBc2x0WTY3Y3VjR3hXQXpESURzdTdJNjM1a2NFR2pRR0lJMnVzSDd0?=
 =?utf-8?B?NUxaWlFZaDluNW1jR2JHa1J3UTJObWJhUUFEanBoMm1hZVN1aWxRc25QTVFG?=
 =?utf-8?B?VWZwSVBOMkV5ZDlJS2FETWNDajZaRjE4WGpMMFNzOVFQa2tPY2RQZmNWMTVD?=
 =?utf-8?B?MWNvMm1RbXplTUxuekxoSXJWR0ZGK2JzK0tRemZXZmlkUlBaYk9wc3FsZ3ZL?=
 =?utf-8?B?T0wwcFRmVUFJSG5QTFFtMGIrMGRJWmxwbmdxSXVFZ0orNVBaTEhIUVpoQkE1?=
 =?utf-8?B?YXA0KzhsSy9hQ2QwelVHQWlDQjBTOXZ4MkFVS0ZKL3FaUVpvWVpJWWRXV0pi?=
 =?utf-8?B?cXVUSlVNYVpaWFF3V0tNVHQ0b2Q5TXRhV1JQUVFvUUo0a3dYb1lvZXhncGdQ?=
 =?utf-8?B?NlUxaS9wTlFWbzdDbXJ2bXNaNG9MVDJUZEJlaEorOFhkU0FBZHRZU3E5ZXJ3?=
 =?utf-8?B?Nm5vd1hiMUkwbmgvODk2OW9TbHc2VEkrQTRuWnZRUFNMMy9QWFJHOXB1QzhE?=
 =?utf-8?B?eEE1akM0RTc5bEtmdDFTa1JuVE9PRUw2ajdwU1ZVdFVKME5GaHZMMVV6Q3Uz?=
 =?utf-8?B?UFQrMlNad20wNlFTY2ZEc0RleHZtTy92N3NaMUtHUUdSTGVkcmRUV3RoWHBC?=
 =?utf-8?B?c2VMVkNMckJ2cDVtSGwyd3kzMkNlS255YnZFdFNvWUNmZ01nN1QyOVk5SWIr?=
 =?utf-8?B?T01XZXR6UThaRVJYVUtXVUVjcXMyMzNDdXJGTE5qSHlMZUEzeXNZa3JWNkwx?=
 =?utf-8?B?cGlvNUNjM3JTZUIxWmUrNGUyUkkzOHh4SWpEOTBCZ0FlU1BBdGpjeWpsTEl6?=
 =?utf-8?B?bzRNa2lmL2hmK0E2NkxycnM2bTBRVmhqcEF6YTIrM3dMQjVKM2IxYStxdDVD?=
 =?utf-8?B?OHJLTEx1SHBYTDFYTS9CZ1oraTQ1TEpPQ0xBQ3JsY0lNRDBmMXptYkMyc3U4?=
 =?utf-8?B?VXBRZWkyTzhFZnYvZHJwQmk3SWc4dTNNb0QyYmh2TlNrcUh4bmlYTk00OEFW?=
 =?utf-8?B?VmdiU3ZRakJwMkVpN2w5eXNhdzlCeXhFUlpzNm9PS21tMFU4M0hFK1hiZnp4?=
 =?utf-8?B?REZRcDB5dUJuUm8yMkxwOEVsUnlkbUsxaGRyWGxHZUxHQlNkNmU5RHRDOW1k?=
 =?utf-8?B?NS84SVFTd25wbFNMNXZOZTRmblRkdWJxcjgvUElkR1gzQ2RkTmxJSGkvbFli?=
 =?utf-8?B?RVRxVnZ2NkdGNWVKa0prZkxUZlNWQ0VwYXJ0eEYzMWYwUzNqaFdaQVRIWUZO?=
 =?utf-8?B?VXB6VGpqNFlMMzZqZFU1cXZjclhQNWVGUENxSFFRSDlJaWFTeUlhUTBiSkkr?=
 =?utf-8?B?REd6ZnNEK1Zrd3ZCQkpEdk5QN09TZVNQUW1SYVpnNDlQeEtuL1UveFE4UmlP?=
 =?utf-8?B?enJKK1hvaUZlNUQraHcrRHVKZytyRzRXeHNmSXdhMjNLSmdrVVN3RUpDRXlE?=
 =?utf-8?B?bWlJaUN2UE1vRkNSUlQ1SHBHeE53SGRDNzhwN084UnJnRUptbzkzb3VsQ3Zs?=
 =?utf-8?B?OWNUeTEyYVRpL2RYNlV4U1o4dWFqWGJCMWdwbWVoY2VkT0pMR09CNmdmWnhl?=
 =?utf-8?B?bGQ2K1NlOUJLcWo3b05OaTNOZm9Id1FzeWlWem5GTFYrT0U2TFVmemhVMjE5?=
 =?utf-8?B?b0s2SGl4MC9PNmFCc3pOSGVvUnE4YTNnTHBzNWxqQTVmS29pRXhMbUxzNzV0?=
 =?utf-8?B?eXhGdnZRZ0R2ZE52U2h6M21talgweDJiaGFOL1A4RENMSWRDSjBhSDVyT3Vj?=
 =?utf-8?B?U2ZGSXlEdDN5dG9OaDNtOHBkcWl3Z09iUnAyVjFXS0QrNTBqaVhndWU5Smpi?=
 =?utf-8?B?S3ZrN1ZSR3d3Y1JoaGhKYjZvdStuaVZlODNteTlzOHphSExZRWlJQU1hVmNh?=
 =?utf-8?Q?yf+A8wNLX8m09RrxrGqW4XO1u?=
X-Forefront-Antispam-Report: CIP:52.17.62.50; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:eu-dlp.cloud-sec-av.com; PTR:eu-dlp.cloud-sec-av.com;
 CAT:NONE;
 SFS:(13230040)(35042699022)(14060799003)(1800799024)(82310400026)(7416014)(376014)(36860700013)(921020);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 17:48:41.2776 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c47754ff-dcb7-409d-9dc0-08de15811104
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82; Ip=[52.17.62.50];
 Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR04MB11440
X-Mailman-Approved-At: Mon, 27 Oct 2025 22:26:31 +0000
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

imx8mp.dtsi includes a default port@1 node with and empty placeholder
endpoint intended for linking to a dsi bridge or panel.
HummingBoard Pulse mini-hdmi dtsi added and linked hdmi brodge to yet
another endpoint.

This duplicate endpoint can cause dsi_attach to fail.

Remove the duplicate node and link to the one defined in soc dtsi.
Further remove the unnecessary attach-bridge property.

Fixes: 2a222aa2bee9 ("arm64: dts: add description for solidrun imx8mp hummingboard variants")
Signed-off-by Josua Mayer <josua@solid-run.com>
---
 .../dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi    | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi
index 46916ddc05335..0e5f4607c7c1b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi
@@ -41,7 +41,7 @@ port@0 {
 				reg = <0>;
 
 				adv7535_from_dsim: endpoint {
-					remote-endpoint = <&dsim_to_adv7535>;
+					remote-endpoint = <&mipi_dsi_out>;
 				};
 			};
 
@@ -71,11 +71,8 @@ &lcdif1 {
 &mipi_dsi {
 	samsung,esc-clock-frequency = <10000000>;
 	status = "okay";
+};
 
-	port@1 {
-		dsim_to_adv7535: endpoint {
-			remote-endpoint = <&adv7535_from_dsim>;
-			attach-bridge;
-		};
-	};
+&mipi_dsi_out {
+	remote-endpoint = <&adv7535_from_dsim>;
 };

-- 
2.51.0


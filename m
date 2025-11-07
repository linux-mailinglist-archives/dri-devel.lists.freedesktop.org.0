Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE1AC3FC76
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 12:46:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D54210EA9D;
	Fri,  7 Nov 2025 11:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="A73n2rXD";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="A73n2rXD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11023114.outbound.protection.outlook.com
 [52.101.83.114])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A812210EA94
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 11:46:47 +0000 (UTC)
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=GCtAsaeLAYi6nQIvqZQ1lNMdyz6VnKv436yznLJkDRD8QinVq76JA2efad4AFYgWO6uLH8kYdPdw3EqjZFOnLwrldbtVPBOf6KgRziWvw8f9RfybbQH2GJQ4PmM8e2ZdgE5hsXD8GCnkYzLIWzO0NkM9PLFRm01wsGdbEdyDEX3tlnXkw6xtLq4w0/dsBqHNfspWkdqECUcMW21tz4hao5ioVkiVmF1lueVMi7KmXK/OUbj7bcA63qoFX0pIIm0WsH+D4EyWrkgJT7kMqBI1ZYwuUAzwymoCaXAa1ol3uvjq0aCaqtcGBlrNR/+xbSm8zj+u+IJ7kH5oA2WlvGTVyQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XIjZDux1Xx02WLznYWrzLxZmx5Bs488C9xIr3arEYdE=;
 b=j194Y3EWdz30Pk2JCuWHtLCx4+MQ545IpAJKgRTP1YeuJQFYWaMZyLyVMnLTKaE4nt69enqTDsy3CEDNLSsJtrOsphZOlq71IAzzOz815VB8G5kkt1KMJshWvDEvzmuWBtx7DhF41X7aW95AXAvn6/J66SiRjuedEmY/ur+4SkgfBrUoWuSNPDZqc6eutec5JvrTVfTj1mFibxD0JOkil4T3C2uSovlyE6a5BU4/2cKO8fP9Up0kTW/XCJNNUiFIcgPAdWMwhbHCimIstBRMxTi779BK5ce3jCSE95FH5RI0coLb1iJtUhYr0AqaZO4pKMPRf92rr38Uigh1zJXDHQ==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XIjZDux1Xx02WLznYWrzLxZmx5Bs488C9xIr3arEYdE=;
 b=A73n2rXDyUS6LclYB5z1tMW6gmNEGsVM6cv8EZjI+GfFTwYdi8Z/qtz1ui83UMZQfe9zx9FRd+dIPKfYYQaPMy29590O5VJ8kC5LpBU1RErOJ8EoJ1MEHfp/fN9BLsGHlh6wYuGuriCDVYwEhdox2OBfH9Lp+eETY4fLTYb5dVU=
Received: from AM0PR10CA0055.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::35)
 by AS8PR04MB7912.eurprd04.prod.outlook.com (2603:10a6:20b:2ae::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Fri, 7 Nov
 2025 11:46:44 +0000
Received: from AMS0EPF000001AD.eurprd05.prod.outlook.com
 (2603:10a6:20b:150:cafe::34) by AM0PR10CA0055.outlook.office365.com
 (2603:10a6:20b:150::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Fri,
 7 Nov 2025 11:46:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF000001AD.mail.protection.outlook.com (10.167.16.153) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Fri, 7 Nov 2025 11:46:43 +0000
Received: from emails-4647514-12-mt-prod-cp-eu-2.checkpointcloudsec.com
 (ip-10-20-6-176.eu-west-1.compute.internal [10.20.6.176])
 by mta-outgoing-dlp-862-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with
 ESMTPS id 79BF77FEFC; Fri,  7 Nov 2025 11:46:43 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1762516003; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=XIjZDux1Xx02WLznYWrzLxZmx5Bs488C9xIr3arEYdE=;
 b=oPjEr5WuV8vTjpvfGUPiFPPoeegeEJurbde7or5ZSN3Rni8ZJsdy7r+riHOEipQRf1U5P
 Cbg2wa+ioLtj2pPgqkE8yP+WLZjbRIidZ/KBCnIHyY1AbriPva+PR+Wk64dA3kdg02wIPZ9
 +aJ65nt25o0EXqyHpSkP5wuisjZ/NiY=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1762516003;
 b=EoGbRFUT0noZBZfXyfRKEP/zVomw+qGNsTYZpUauNqyTCy2dcQqfhwzT/y5TXF6sOL4Wh
 gEpXaJuu0Vl7ZxouhK+gl63tRmFoJ+cJ9NgacBlcc2jIzV5nv7Ykel9KuqTqKdc9QPkUMBE
 V638tIb04cNgkRjj9YDtKuoz9X4x/Fk=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BVQHGOwQprO5f1GtYbHMmoeDaOPiraV3Ug5zJDHg3BR1bePKtwV6ukZ7bDa8oPtSZyUIFBa99PgXVe86eIYnMQnQIfe6GT7Yij8w+rd0SbvZkzSOQnSXXDYUp+tw/LbKWL1MR/FQ69aokCUd00FgRW5P0U6tQcFh8m8AXo1NiiIv3gG93TT3oAjxWAoi7SXwu86/vumlXKk0/Cil9stsvaDmRyTXRUc7E5N9aI9XijzBPMc6X6Dgi8JDS6vOyrNeF2hw2w3X8n9GJ743NzD6SKRsEg7hP8+aoJQeZsiGpDCSYi+Htl/2cupi2g/wQAdBRfO5hjTHSajqBfKxjLFBpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XIjZDux1Xx02WLznYWrzLxZmx5Bs488C9xIr3arEYdE=;
 b=AKQQuJYInypYivAqrakmezfC1H3UbLOiJHgtdbMlcJ6H9UyLiznEap/R0YEXl6+wpEVeqLZ8kpxPNL/8Q/B4hyhkSf0fuDIb8JEFz5JBtJYDvtzxt8bSD3SqIzUgaMnlrmXBLqFqDK0NGcrImj8b0OyxWW2/pSlv4B5XbWNqEFMylp6ogBqY9GiglIg9YviYZyE5CPylz3P9HHvVPo+HhX+IZZ8N+CiajxHHur8aDG+qlXDYoL7ucMSOYNAFnFEytGycKRjy1/D3CGxv/0ubDX5R5oECLa5gpVws0jpwMWT9qU9Ri5bvkfes6qO5w1Cxf2BmFnHdCuPuTVuwE9/51Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XIjZDux1Xx02WLznYWrzLxZmx5Bs488C9xIr3arEYdE=;
 b=A73n2rXDyUS6LclYB5z1tMW6gmNEGsVM6cv8EZjI+GfFTwYdi8Z/qtz1ui83UMZQfe9zx9FRd+dIPKfYYQaPMy29590O5VJ8kC5LpBU1RErOJ8EoJ1MEHfp/fN9BLsGHlh6wYuGuriCDVYwEhdox2OBfH9Lp+eETY4fLTYb5dVU=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by VI0PR04MB10095.eurprd04.prod.outlook.com (2603:10a6:800:246::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 11:46:30 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 11:46:30 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Fri, 07 Nov 2025 12:46:08 +0100
Subject: [PATCH v2 01/11] dt-bindings: arm: fsl: Add various solidrun
 i.mx8m boards
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-imx8mp-hb-iiot-v2-1-d8233ded999e@solid-run.com>
References: <20251107-imx8mp-hb-iiot-v2-0-d8233ded999e@solid-run.com>
In-Reply-To: <20251107-imx8mp-hb-iiot-v2-0-d8233ded999e@solid-run.com>
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
 Fabio Estevam <festevam@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Nettleton <jon@solid-run.com>,
 Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua@solid-run.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0116.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::16) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|VI0PR04MB10095:EE_|AMS0EPF000001AD:EE_|AS8PR04MB7912:EE_
X-MS-Office365-Filtering-Correlation-Id: 3575c6f2-68fe-4313-6cf9-08de1df352e5
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?TDRBNDI0c2xGTksyeWNMVHRra3VSYXdqOUhFZmlocGhRM0dJenp4UTdlRTc0?=
 =?utf-8?B?d3JPeUVRb2ZwZDVoc1I4bGdsT2paWGM4T3ZPK0xxMlZWZnRyUE16V0xYMnlB?=
 =?utf-8?B?bTlJMjZDdW56ZGJST3dUS1RzV2F4eVNoajBQVVRnaGtJMXEwMnF6VUQxWlQ1?=
 =?utf-8?B?Mm50TTJYL29jRzZmajZ0UEdUbWxhR1d1UlN6NzM0OWFwcVNUMGdvWG5kcFBG?=
 =?utf-8?B?eGJjTDdwZWZEbm16S2I5MFBMMnpCbmk3RjlhZ2hITEtEZjY2WHU4OXdwUE5h?=
 =?utf-8?B?Y29tRWpYWEhlQVozSTBqcDIxV0Y2L2I3bUZuVW0yTUtzUUJQK0dXZmRQdDJC?=
 =?utf-8?B?ZlB2bTh1c3ZVNlVpWlpzMVQ3ODQyUkJWZUZwM2lDM0FQU0pPREE0MVluSFhj?=
 =?utf-8?B?VUp0TW9oR05TMForSmFRTXZBNTltbkdQNDJHc1FtLzQzYitwVC9UNEtHWGFN?=
 =?utf-8?B?Ri92bHdOdTArM3pJNG0yR2k2QTNWSEpYZkpRY3lKZ243Mk1Qa21HVXYzYTdZ?=
 =?utf-8?B?ZVVUN29HZjRBUU8yZXdxbDg3dyt0OXV2KzdFeWQxK1BKY0tKT1FlbkF2RlZS?=
 =?utf-8?B?TWFrQ1huV2hnazdRTTR5TTdqcG1VcUgvWXJsWjJ0UmNWYWRPZTBoaHVabCtK?=
 =?utf-8?B?MGZxdlB5Y1pkd2pPbjJOaU1ndlZnUmg0cDU4eW1WRG8yOHRKb0NQeUdoYjVu?=
 =?utf-8?B?c2laZENmN3p3SWw2cHJDTnJDVnFKS1VIYW5YSXBsbGFtbWo5Zkptd2cwNjdz?=
 =?utf-8?B?Myt2RURYOTJBT3hMY0lwS0RBUk5ZeS9VWWVHYnM4TDd3RnR3ZmtYSGR1aCtS?=
 =?utf-8?B?WWJMQnNSbjBJd3o5Vk15UWZmTlpoaFdzTGVJdmtPRzBvN2Q3OFp1Y2ZlMmtK?=
 =?utf-8?B?SERUUDUrM293eU92UEh3anpnNWlFOVBHNi9QWWt3ZXU5Z3dKZ0NjN3pjaHNC?=
 =?utf-8?B?V0h3RHR3eHBpN09mZGl1R1h5dWxSaU9OYVRjT1l5NzRqVG1MK3dReEF4UCtW?=
 =?utf-8?B?cXByT3ZncXkzTFJRM2pyemFLUVc1OVQxWG5HTFBPQnZFUzFvRVdtTVd4dXAy?=
 =?utf-8?B?TXJXY3hibUZBYU8zYzZOdDRubGEralcrSTJ4b245SXNUZ2xyYmlNT2ZnME40?=
 =?utf-8?B?S095dEJpa09PdXcrRldLZ2tUM3ZxTVF5Wmp6TWNZZmNvYXFQbW9VRkJiamRX?=
 =?utf-8?B?d1YxNlhNNEV5Q3FLL1c2U3IxZjFXSndpZ3Z5bWN4aG42U1NQQnlLT3lwclVx?=
 =?utf-8?B?aldKcDN2blBRVXRzN3lZcG9XUS9Xd3BSb0oySmVsQUN2UjZEa0JONXlZVU1O?=
 =?utf-8?B?NCs5TzRwVFZvY3gvY1lqODZKamtMQTRESkVqNmo0MytCSW92S0lRN3V0SWtw?=
 =?utf-8?B?M1RFdEYwSWs1ZGJuVVZQWjluUmEwcjExUlNWWkZGU3RDc0FyNUJHV2VDN3o3?=
 =?utf-8?B?K1UrTHFNNEVwYWc2QVJxNGZRZlZoRWVpUnFvNlFORVZvdDdsVmdjUlJZbTg4?=
 =?utf-8?B?RzRBZ2JBc3dURFpYRC9vdEtFVCtxRDNVdFM1eXVrVVNjWEVsL01TTzNVcjVC?=
 =?utf-8?B?OWFadUVvRThPY1hob284MzhKVmRoeGlMMC9wbTJGdHRPcU81M2pyaGlUMXNP?=
 =?utf-8?B?elNSSXFaUlVNa3YrUWNqcGR2NWRTN0ZkU3orKzZIcW45M3pDYmg0VEFMaExh?=
 =?utf-8?B?Y2dEN2lBVms0SkRrdkxOclM5MitybE1aOUlSS0VwZjlBVytXTFYyM1VqNDho?=
 =?utf-8?B?bkdnam96TmRpQ3lTcWJ1ZUtyVjdlT1ZBZEZSN3Q2WmgxZU53N0FhWWJFK3lN?=
 =?utf-8?B?ZGRWV01YSGpHdDl0Z2xycXFWejRkOVcyMThZQ1dHdk9EL3RrYXpHNUY3aEhr?=
 =?utf-8?B?NFV3T2JMQWdmbnNXdlBWd3FGY1VqeFNlMUcyNDNGU0lsbXNIWHZKYW02SlZZ?=
 =?utf-8?B?U1RqTTBHV3JUOWNFQ2tsblpLWmlVZzZaaXFac0RxTlFMeG9DMWF3Q2QycjRE?=
 =?utf-8?B?Wm9LM1lDRlRxaDRZQVQxUnVEeDJmWjJLeWtnZEVxVXZPa01QM0xQV1Vtd0VC?=
 =?utf-8?B?OGJsTVI0QlZkYWN0elBJQUpZWUpxZWtzSTRlUT09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB8749.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10095
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: a25cb44f22164f88a3f6447e48280d89:solidrun,
 office365_emails, sent, inline:b46ed4a71357b7288f02988211e896ed
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001AD.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: c61c7d75-1f44-4b72-de19-08de1df34a89
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|14060799003|36860700013|35042699022|7416014|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TzJmeE1WazduWlBOdThFT2szSEJWdVhQRE5ienBKWVJlUzg1YVN6RUoyQ04x?=
 =?utf-8?B?WVZMUm53VkdlS0gzdno3dmloVzVEdFpwQUY2dmM3SVdxVXJQUEpPdDhFUytt?=
 =?utf-8?B?dHJpbGl5ZnhKOStPY3MwNnFJZk90YkdaR0N5bHdTVzY5RmRRUElxdGxqNHNk?=
 =?utf-8?B?bmhkRENLSGZWSDZIWTROZG9SbzViYW1WVlpmVHhNMHhzMTFzdVhpUFlhUU14?=
 =?utf-8?B?bExjaWxVVVlsYlVmcmlVRlcrbzNiUzRpdW11MnI3SjZOc1lOWTlUdWdvei92?=
 =?utf-8?B?a1ljVlNhUWJQWlhTNXRCNFhpSEpYOWpxeGxRdTh0UmhlVWhDb3FZZWF0RFNq?=
 =?utf-8?B?YzFOWXQrNjBxVDY5WUFDOUVra2dxdHdBbnBRUTBPWFhYZ05CVFlWQjRHZVhR?=
 =?utf-8?B?Zi9pWHNaVkpmbWZUSW5BejRFb3RpWmh6dGR6WUhwbFJQVWw0STlJM0VlMlJW?=
 =?utf-8?B?NjNPNUNwamo2bFJoVi9qaGhGWjFzZmphZld1bWFTbnA2aUwrMzVkK0NYR2g1?=
 =?utf-8?B?S1ljUlF4ak85NFRuWWtxNVhSVmV0dFRsYWw2aFFQWkdRNXV6WC9jblYrUGl2?=
 =?utf-8?B?RjVoM0hCTnAvb2RKVkU3Z29QdUFISkxzUFRMSnNDTm5wVHNBd3FpNGRkMTc4?=
 =?utf-8?B?S1FKb0s5VXVMUEVkMUhnNXNlbzR1SmRmcjE1OGVUQzFWYUl4N3NZbVFyNkRx?=
 =?utf-8?B?SHlCT3hnbFdwbGlaWVFjbTYremRDV0pLcUZUeHlyZCtRNDBYTmtaTTBoMWpL?=
 =?utf-8?B?NXZnTUxldzJWNHpEOE5rUllJSkJ6d1dnS2VybUZWRUNWaU5JQytQaFhkM1Ji?=
 =?utf-8?B?QStMTnBCR3VPMVJzN1haQkU5M0hDancwdWN2b2NPNUo2YWNEeEhsRm5qWGpn?=
 =?utf-8?B?dDN3dVNkaWlOMzZXeWgzOGlXRUZKUjRwZ2x1WTNYbU1RWkNqLzRlbjRBWnVY?=
 =?utf-8?B?OVZoTnhmUFJmNnl5ZmRkT1BML3BoRkJEajdoZU5sUnNvVTR6NnA2RVVqVzlT?=
 =?utf-8?B?UW94dTBMc1F6cHpjS0Zpb0lKRnZheGltaFdBQWVzeEpRb0VOZjI5cmtudnVt?=
 =?utf-8?B?Vm8rTjNLalFIckp1cDdaaDhGenExTFFrb2hIWVJPaWtkN3dCeEdHZlh4c0RD?=
 =?utf-8?B?bCt6Tm5reXM0WmFVVTJYbTErcUc3NTA2aDdXQWhFRWc0SUxEVW5LRGVISS9x?=
 =?utf-8?B?bTRydWk4ZFcvN1VWWGZYSzl5ZUpqc2lPM3J1MWIvTHVlRFRFSmFBS0RIZ1da?=
 =?utf-8?B?SWVhVVhFQ1JBMzkzaDdGLzZTaGI0NjRsNEVmdGxOekp6VEg4ZDBYQXZ1aXFD?=
 =?utf-8?B?My9rS3J5cS9yZCsyY1U1ODZRK05lVkVsM1lCL3VZd2xHTjZuU0hLQTJmNVIx?=
 =?utf-8?B?VjRuQkJySUsyNW1MbmsyclF6b1R0ak9talpvbnc1dFpvRmNqZHo3UVRrSVRn?=
 =?utf-8?B?ZmRnWnRydzQ3cDNqK053VmxYaWp0bXN4ZmNXZzlsL2ZtejNyR0hjR1N5bkth?=
 =?utf-8?B?MmpmVXVNMFUreDJYUWRNeHNkQjhSNmpvZlp2czRZRUxlbThjTmgxV0Y4cmlT?=
 =?utf-8?B?Y3ZONE5laUhPUXRKK3FBNmt1enlPaVFMYWZRVFlBQlZrRGg2YnBFV0NHSmJG?=
 =?utf-8?B?VnJoREZmRmhSTXg5TFVFR1JUYUJ5STJ0ei82QTUzUXdpQ1ZVbHpRM0FDbkpW?=
 =?utf-8?B?TDFRRk5IaUpGTEpLVkVuV09JZnk5YlhzNXJCNm1yYnBTUGxZTzg5SE0zNHJT?=
 =?utf-8?B?bTk0QXVvNUZjV2VkL0xCRzVpMkRtaEhMODZIcUREaVVsZEZ6MThsa2tyam10?=
 =?utf-8?B?MzJXL08rZHkrZXl6MG5mRkxxWmczTkMyeUd5aGEwRHZyRnNiUWExbWw1WlhY?=
 =?utf-8?B?ZU5RelJRRGdoTjE2enBHdFBJVDd4Z25vUmVzL0RsSjRCWjBtWEUyMU9kQ0kw?=
 =?utf-8?B?Tysvbkdja0h6ZUhDUzBLUElJTno3YSsxZzkrR2lzdzROUlBBQUhjYStWcE1G?=
 =?utf-8?B?ZXM2WWE3emlnZGd2aG4wVjk4Y0FuSWEvMlZLOURudW40TUNLejdrZi9ZSVFw?=
 =?utf-8?B?dUxnNkE2Wld4RUw0cmJHY2xtRWp6Z1d2clpSNFA1ckpMOHRqTGVDVVZrbzdr?=
 =?utf-8?Q?8X9s=3D?=
X-Forefront-Antispam-Report: CIP:52.17.62.50; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:eu-dlp.cloud-sec-av.com; PTR:eu-dlp.cloud-sec-av.com;
 CAT:NONE;
 SFS:(13230040)(82310400026)(14060799003)(36860700013)(35042699022)(7416014)(376014)(1800799024)(921020);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 11:46:43.7354 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3575c6f2-68fe-4313-6cf9-08de1df352e5
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82; Ip=[52.17.62.50];
 Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001AD.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7912
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

Add bindings for various SolidRun boards:

- i.MX8MP HummingBoard IIoT - based on the SolidRun i.MX8M Plus SoM
- SolidSense N8 - single-board design with i.MX8M Nano
- i.MX8M Mini System on Module
- i.MX8M Mini HummingBoard Ripple

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 00cdf490b0620..f70b933ce3746 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1041,6 +1041,13 @@ properties:
           - const: phytec,imx8mm-phycore-som        # phyCORE-i.MX8MM SoM
           - const: fsl,imx8mm
 
+      - description: SolidRun i.MX8MM SoM based boards
+        items:
+          - enum:
+              - solidrun,imx8mm-hummingboard-ripple # SolidRun i.MX8MM SoM on HummingBoard Ripple
+          - const: solidrun,imx8mm-sr-som
+          - const: fsl,imx8mm
+
       - description: Variscite VAR-SOM-MX8MM based boards
         items:
           - const: variscite,var-som-mx8mm-symphony
@@ -1069,6 +1076,7 @@ properties:
               - fsl,imx8mn-ddr4-evk       # i.MX8MN DDR4 EVK Board
               - fsl,imx8mn-evk            # i.MX8MN LPDDR4 EVK Board
               - gw,imx8mn-gw7902          # i.MX8MM Gateworks Board
+              - solidrun,solidsense-n8-compact # SolidRun SolidSense N8 Compact
           - const: fsl,imx8mn
 
       - description: Variscite VAR-SOM-MX8MN based boards
@@ -1205,6 +1213,7 @@ properties:
         items:
           - enum:
               - solidrun,imx8mp-cubox-m             # SolidRun i.MX8MP SoM on CuBox-M
+              - solidrun,imx8mp-hummingboard-iiot   # SolidRun i.MX8MP SoM on HummingBoard IIoT
               - solidrun,imx8mp-hummingboard-mate   # SolidRun i.MX8MP SoM on HummingBoard Mate
               - solidrun,imx8mp-hummingboard-pro    # SolidRun i.MX8MP SoM on HummingBoard Pro
               - solidrun,imx8mp-hummingboard-pulse  # SolidRun i.MX8MP SoM on HummingBoard Pulse

-- 
2.51.0


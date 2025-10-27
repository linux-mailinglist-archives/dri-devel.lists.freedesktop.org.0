Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E757C11B03
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 23:26:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E9FC10E573;
	Mon, 27 Oct 2025 22:26:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="THYe6hso";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="THYe6hso";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11020132.outbound.protection.outlook.com [52.101.69.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8194D10E50C
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 17:48:47 +0000 (UTC)
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=BBOtja/RekmPIN21IgTZpua8LmbehaEonHZi4jux9aAZx8ep+N2XteXmDX2GqcOq5988OdypMcIZvreOrbx7QjEGC8ELy6ysisvVKzxc3y2K1YHYifyOApoiyQ1ZCFcgwoaFo8adiSLMnRrGd6sCeJySf5A3nV+/Dm5nQDXKEeDr4Xd1A5Eohs/qa3NrZPNNeWXKyGkMtKt4PXzi2c5pKKJxgvoy1ShMwpg6NAAJPTjPcw9D2WEJ0/tiuC7oxDB5XYTrMgdPM3dvx762NqTmJbrsoSH1o0m37Yz5RtGmKN+PVYePoqbixXyySOttRBJVyZ2MWRP1BNwtue7W1RPg3Q==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2cQ/STiIYvdJq5aH1WpgJEZwLRfk849PS2HAxoW+H0=;
 b=Gg4H9T+Cgqe2MTq63Oi/i7QUUD6ScTYOOzXu0C9hBUYdSQzc2cuptqUmi9/dkW1RP/F8Q1MEfvAfeZwF7JaKPt2ON3GqShKFdIwUeVtAPXtN/l1iDLfzpsACPtEhpwcyzqxBWA/KyFDINQmS1S85MjUGWZi1/IEH1MF3T5VX1Iny1y+BenPvBMIimDWCAtMBVjXwuF6FYcorhCeqqruwzVKgkGJESAl5eDT4/0LBvUdx+XjC+y6rgdt9H1OoANlDkiPDSF3DZcf4nbefU6mBDyURxTpFMmTZcvQXLcKMMPT+zWWL5+MTD5prUXf6rNUFWiLPr8nl15CyT7v/3kSkHg==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2cQ/STiIYvdJq5aH1WpgJEZwLRfk849PS2HAxoW+H0=;
 b=THYe6hsoxwHJ7c1DkNmHiWSd76m7B3KkSN+Z05mGEh01sqDCmqXjH82SBF/XQOfwBmZvkEAVXcUe3RGyDNSnjOv4LrX5PvnRXCP2J/p8VNN8VRQ9h3F1BJy9aJOiRAln6QeyBWNdEZcH5o3zEztv8mmtD/yOtjakHpMytVc43tg=
Received: from AM0PR10CA0028.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::38)
 by VI2PR04MB10932.eurprd04.prod.outlook.com (2603:10a6:800:279::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 17:48:43 +0000
Received: from AM4PEPF00025F95.EURPRD83.prod.outlook.com
 (2603:10a6:208:17c:cafe::7a) by AM0PR10CA0028.outlook.office365.com
 (2603:10a6:208:17c::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Mon,
 27 Oct 2025 17:48:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM4PEPF00025F95.mail.protection.outlook.com (10.167.16.4) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.0 via
 Frontend Transport; Mon, 27 Oct 2025 17:48:42 +0000
Received: from emails-9354467-12-mt-prod-cp-eu-2.checkpointcloudsec.com
 (ip-10-20-5-121.eu-west-1.compute.internal [10.20.5.121])
 by mta-outgoing-dlp-670-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with
 ESMTPS id 925BA80355; Mon, 27 Oct 2025 17:48:42 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1761587322; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=w2cQ/STiIYvdJq5aH1WpgJEZwLRfk849PS2HAxoW+H0=;
 b=igXgFFPaAduYPWfS7Era1wJ5U292d4CAslViXu+9VaYhNfn5soCRjQgGzQgxi7G5f12wS
 7iWtRBbOcQa8661muNyGlnL+WevlpaC5ZawmH6/9fiZd/uAz6koyIUEPfTravEzyJD/tn3V
 MV1rSdAqhVR3it293F/isrotQuhr9Mw=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1761587322;
 b=eE2JFWFfcb+pVB9hE150HG5D21LYuEH+FlA/edtAAI7Gmy6MP/LTcScwXNodajcbjPfoB
 5/ogvoAWb4Ah4VfAQ8xlzgZdSG1vd3q6s3rKIx+NuuqhCDixgcAIQ0LLTPiL5ThMxtxZWa0
 3ETbFKn3iqmWWTmvEjYyhqNAuSR8F2M=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w9I5GLJI9DlfEqqTzla74EI0vIxv0xhIZztBknbWgk1Co+gzrh7894mHsPNPTV5s+Oi7fzfC/3IgINYf/yGC5rQeTpKH5BNNRI+n0c2qrW2cprX+K0OrMewxkv+2Rgap5LKCNvOrcUoHDEa1S0/K4qd15aS20UmNaTIX7JNiK7XcsE2EgIuwctzGaHI0ZzRXGZwl10NXfP1w0ILxDa2NOPQd/9jXdUQHUmqI5q3hBaJkKwq02VwtRBTDV0b6M+1Nr6KcTgcTiKnqQzrcMjnLS4LLneBJMMYE4m8oIsqvziOURB8DMyKZb76YvbM2J7DmSMc8BleUPiwOFKBc2LyoMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2cQ/STiIYvdJq5aH1WpgJEZwLRfk849PS2HAxoW+H0=;
 b=MstliT0sAueToF4Zao126FOM9dOBgKU0aa+gIoXNpnd5W5TB0YJgsqSKg/Mn6bYqbipfwmh0tcZ7WSXiI8mphAXwc3ZNtFmvz32O5MzZmdmrNbk+p1oNOjEMBFFDuIUZwwSjWDHa5C9zWAz35TmwlcWKDnSN6S8+cC6tAXJnG43BHlJ9ZVIIDqxpypoQK6eHNy7pbiY4SNCUC69JE44qlV/iEFaLhIu5qgUNTl827EtufChZTa/amsNgY+T5FLUcTEJxW+QFjyrxEH4bLAwHn3vYQU7w3obSZw38Rg8LRCdgu2JUXbEnRWOb/DNZ1x6iYWHO8AwiaexMmpbrxRlWHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2cQ/STiIYvdJq5aH1WpgJEZwLRfk849PS2HAxoW+H0=;
 b=THYe6hsoxwHJ7c1DkNmHiWSd76m7B3KkSN+Z05mGEh01sqDCmqXjH82SBF/XQOfwBmZvkEAVXcUe3RGyDNSnjOv4LrX5PvnRXCP2J/p8VNN8VRQ9h3F1BJy9aJOiRAln6QeyBWNdEZcH5o3zEztv8mmtD/yOtjakHpMytVc43tg=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DUZPR04MB10038.eurprd04.prod.outlook.com (2603:10a6:10:4db::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.17; Mon, 27 Oct
 2025 17:48:28 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 17:48:28 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 27 Oct 2025 18:48:19 +0100
Subject: [PATCH 10/10] arm64: dts: add description for solidrun i.mx8mm som
 and evb
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-imx8mp-hb-iiot-v1-10-683f86357818@solid-run.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|DUZPR04MB10038:EE_|AM4PEPF00025F95:EE_|VI2PR04MB10932:EE_
X-MS-Office365-Filtering-Correlation-Id: 6225dc21-f28e-4036-a47f-08de158111f7
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?UnhSTENRU254QmVabFRqSTlPNUhuME9mMVZNZ1hSbWxJT2xNOWhvSmxCd3VH?=
 =?utf-8?B?V2xvVytZMldTY3VHL0tBZUFxbENTdzd3K0t1STRaUEsxMlJ0a0JFaTdWM3JB?=
 =?utf-8?B?cHRnOWJ4aythSWVDMTExd0c5UW9TZVRoemIvZmZkRG5iTy9idndIZW1zOUgv?=
 =?utf-8?B?b3YzOC9ROEllR1QyR1ZtMk5CZUFiZEh6Q3VpeElUbkVjSVNuOVpPdVdFa3Jo?=
 =?utf-8?B?NUtKZnlzcHFIb0xkcldLeURIUUhQcEU0YXBSUlZoT3NiencxdlZWakRKemtB?=
 =?utf-8?B?bCttUms4bSthcHFYYU5kb2VGNElMbFNnWEpYSzhhckNzU1VzVndkV3YzMmxt?=
 =?utf-8?B?bjlXZHhzL092ZWxlVE9QSko2cHJFUE16ZXRLTWdHaGlvZENRWnluMzBMeWcz?=
 =?utf-8?B?UjVOZk1wdnBCckJER1NNbCtzTDFhMmZ0RHV6Qm9lWVBrWVlxb2duQ3pIT1h6?=
 =?utf-8?B?cUhydUlhRzd1ZjZlcjdwckVPcjlHWjZTNndrbzZBMlV4ZlN2VkVneWJ5NlBL?=
 =?utf-8?B?U2h4SDdIbzJBemgrekNmREt1enhJMWNVZXV0TXNzRVJHMVRxeXRsK3IvQlRp?=
 =?utf-8?B?U1lINmVhNHVFeTh2YVBzVHg5Rm4vWUJsVEtYNnJaUjgzRHBQSWMxcGpHL3d3?=
 =?utf-8?B?MzViaHBVOWMvSG91T2pqT000NTZvTVpreUdNQU1QZDlaNllsSUpwVHpKRXhY?=
 =?utf-8?B?NURMeFk4MHZHU20ycEdtdFZaMTVXQzdPeklvbHVIK2xqNUZEMUxuZDNRUURQ?=
 =?utf-8?B?dVUzWXN6THltbVlkUnN2KzNpalh5TlhiZFExT2ZXd0RQVSt2OTNHb1ZYWEEv?=
 =?utf-8?B?NjZqM2pBTmtWek82KzhlcXFHVGt0MVNaelI2K1h6dDZaNnlsMjV2QlFtSDQy?=
 =?utf-8?B?OHhUaDl5Rmg1MHROSks3SWhsVVBhYjIzRDg3WXQ4Q3lHRzh2TEprWlRCd2Vr?=
 =?utf-8?B?ZFZYRE1vQ3oyVzRWNndjY3U1aWNiLzF2REdzU1kvT2doNGExMmpUbktnb1RD?=
 =?utf-8?B?cWVHWDVralFsSE1vejRmWlkvSEZRc01qUHVNQjM3SXc0aGFjL2cwMVcxQXVo?=
 =?utf-8?B?VFVlanc1WjQwL2xRTlkrMzhmMlUvZjA5WmsyQkx3K1E5bU01OE1qZlIrTjhm?=
 =?utf-8?B?UHVRaVBMTEdtN2ZXWk1OT0hHb2RpSkM3Nm1sSHFGOGFBSTR5cDM2Q0ZIYW44?=
 =?utf-8?B?TG9nc3FDYW5JazNqZVptTm0weFhXcVJQUzA2V29CeXV4eXBGRFpyY3ExRFND?=
 =?utf-8?B?QmdENTlnckI1ME0zUlBnMk81UUJoSjE0cmx5SUZLS0tELzhqdnp6NUJVc2pz?=
 =?utf-8?B?YVJnN0YrZkRaNWdTbU9zdWloNjFHZkVFbGFNblRBNzYrTkptRnhqMi9UQ1JG?=
 =?utf-8?B?c2JEbXU5bGxuamV0T0J3K2wzUTh2SU1LZ3NzbzZxaCt2RHNNNGdONDNnVFNJ?=
 =?utf-8?B?d3JnSFlMQUdheHltMmRHQmc1TmwzMzNDckZCSVBpMlprVFg0cGlHZVJhcGE2?=
 =?utf-8?B?ZHVpbzNqeEtxM3pWN0JIUnArWEFucm9vSEQvRGhqUEhOUzlRdDltV09GK25M?=
 =?utf-8?B?RUxUTTdTS280OG9KeVlYODdGNmpJSHFCeUZDaVNsZkhrbnUvVlBOcVhoQnhX?=
 =?utf-8?B?ZHM2SnFYdkVqdWs0UUNWeXphUStRbURyMitLN2JxNjBVNVRMNUljUDZDVWQ2?=
 =?utf-8?B?VE1pVGkyWnI1cUFEbEdKMWxxVjZGc25OaGlzL004VXkyMWlaZHNISnV0YTl2?=
 =?utf-8?B?c3Y4WkMzNzgzTjVPZHlTaWowWXI4a05rRG9nU3ZiUndwbmJEODBudEh2QWJY?=
 =?utf-8?B?TUNkU05Zb1IzbDkvVTdKaWZJTm1WVUtvWTkyY1V6WmVtdTNUMks5aGUzbHdG?=
 =?utf-8?B?VnVJRlljbmRGNnoyVUlnNWZZM0hZYjZubGNGQVJoUVdGeEZ2NWV2eUZVdTV2?=
 =?utf-8?B?MFJVQnByMUJFdGJJeThkRVFPTHFGOTFmMWRNaEd5YjhSV3VNNFMzK3FoQVBT?=
 =?utf-8?B?ckZBUC8yQUUwT3hWbzdvK1NQRWhDc0ZQQVh1cDkydVk3bnhGY29nZVdsTTYv?=
 =?utf-8?B?eC8zTVdPRkVzL0hYcXdvbHJCNTNOeEpTSCthdz09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB8749.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10038
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 29abbf3945af4c58bff0ebcb6489a44d:solidrun,
 office365_emails, sent, inline:debd18510902b80412e2749450943e78
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0945a587-7071-4a65-d742-08de1581091e
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|7416014|376014|82310400026|35042699022|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b0QxZkdNK3FpWnN1UEZnSWpkY0ZrWC9kaVhGeW5Fb3U3TlY3QTN1S09yNGVJ?=
 =?utf-8?B?UXF3YVlqZnNnNnFxc3VURVBJNGJ4cnJFd0NyR21zVUZFcXAwejFYc0k3NCtO?=
 =?utf-8?B?RkRaeVhYT1doUGtkUGJsaUc3UTB4Y3gxZ09SWUJWMXE2TTFyQk1wMUV5NlAr?=
 =?utf-8?B?TXRYWWYxbHhiNlRRSjNSdFA1SjJWVlJrTVBObks1UzdlL29ENWdXb0Z4cU4x?=
 =?utf-8?B?bU1FTm9MQmZFaWovY0ZITXBSdDRmTmY1cUkvR3pkVTRoa1oxTlYrUWl0anRx?=
 =?utf-8?B?OGhtUlFTMDZPQVBOTXhBL0gyR0xtbG5YTmkvVW1QZkNMYndRVjN5NWtVWWhN?=
 =?utf-8?B?Rkp1ZFFscXpiaXM1dUNRM2VveisxWStIUHVJaHBiY3FmVWJER1B0b3dncXZt?=
 =?utf-8?B?V1pxVnJ2R0hvN2xzWEFJWnBlVkppVkhBUTlka2twODRKejdIK214YVFxYU12?=
 =?utf-8?B?WTd2V2NoU1FQaXhXVkpkM24yc0o1NStwL2t1NHVzSy9qUDNrNkRoeWs3d2Rj?=
 =?utf-8?B?U3lCSGk3M09FRG1oL2Z0bmVaL1VEQ0liV3hpSGJCY2Y4V1FLUEZVTzRnZVV1?=
 =?utf-8?B?TTRoV1crRUtyYTFCa1c4Qis2Q1ZUNU9SamZVdDF0eFJmbEN0b1pQYnVhNm05?=
 =?utf-8?B?cXhHSjRkZURKbndJODc2TXM4TWc0S0JFMm81ZlZCYUV4T2U3elhEK3p0WlFR?=
 =?utf-8?B?SVJTb0pPZ2xVMnhWeXBxcFRiOHpGQWRHdTF1RlJIT085TFBlRFo2NFNzRmRX?=
 =?utf-8?B?K2dUdUJPN05BNzNQVGYwdXZ3c3NTRldaYit2RTZkZlFEQkZ2L1dwK3pQNFU5?=
 =?utf-8?B?cjUxNGlKWHVQWDJmbm1UQko3eFJUcVp0emVKSWtTdnRNTEx6ZDRYZlduNkVv?=
 =?utf-8?B?L3lFaTZ1aDlXR3k5VVlXUW1WM0J6YkczbHJEVXdkaFAxSm9sUzJBL2p6dUdl?=
 =?utf-8?B?ZTlJY2NBSm4zWklwblhVdWJYZm9Bb1hFNU5IbUNSS1lINmQ3Z3dVMS9Vc1dK?=
 =?utf-8?B?YTJrYnZBVnVUSFJEK3pHSitBVG9tZWdJSDNrRnFVdjdOQ3hDQlBEdFpCYzRm?=
 =?utf-8?B?Y1NXVEdtN2puZlBsc3VSVmJCc08vYU5xNmNVRUtsOTh1ek9pMUl0djNEV0NX?=
 =?utf-8?B?di8xQytlaWQzeFppQ1VUVmtuWmdBc0hjRlhxQWpQUS9jSVcwWkZNMTlhZCtY?=
 =?utf-8?B?SE00aXM4c3NlWWZkYnVNaCs4d3NMOXhTM01BNERiMFFIQkkxWXRpUldiclFz?=
 =?utf-8?B?QzI1WTFrd211NFlzMnhVRVQ3cURCSHFxZDJuam9mempCeEx3MlQ0SHZuYjV1?=
 =?utf-8?B?eHhKVk94Q25zVFpJS2pTQ285M0ZqYld3bTR1bmJTNFN2RFd1T084N3B5djcz?=
 =?utf-8?B?R1hEVHRBTGZVVWF1UnZzMHg3UmllVHM2SkZtanN4YStXcDdWQWh3WTI5K2M0?=
 =?utf-8?B?Rjg2RnNMMjZpMEhRVDEwMlpucSsyM1IraFEvcFFGRUJZOXd0R2NOOHhnSm01?=
 =?utf-8?B?WFRFdU5PTEZkMWFjK0E3ZHBLVHFmMzhxSDYxeWNKd0t4ZmVvbzdwTmxTUVhl?=
 =?utf-8?B?MS92SDFnemNXUmNZQXRhaURFS2hXdUNpSWh0TWVJazVBc0NUOUVtc3gyeTdS?=
 =?utf-8?B?aXpqL294RWpIZDJocUNvcUNzVktVbUtVb2FndkxtYXpmRjFydU9Kc2JyWkc0?=
 =?utf-8?B?TG5QTjBsL2V0OWtrRERVQ0NtOVY0RWprbGd6anJzemFadzd2T0IybU1SUDk2?=
 =?utf-8?B?b0VwN2dWczMxeU1WZFdxMzh3b1NnV20xN1hmalNjVHorNGNNc2d0a1MxK29j?=
 =?utf-8?B?SW1yclYycTJQZTFkREE1MFB1K3o2TGxKM2c4VWpqcnlya2tKOXU5cnZQdG0r?=
 =?utf-8?B?U3I2VWxDV1Zzd1JyT0tiN3FuazNsZHpxS1BEeFZzQU5hc1pXWVE4bWo1ZVpo?=
 =?utf-8?B?eVdVc1VRNUNSc0JYZGc5NTNXK1V2MHBCVi9PM3Y5dVVEcUI0SW5lYlpsd1Q4?=
 =?utf-8?B?WThnM3NiZy9MN0ZZV2hyZEFnM05ad3NNY2pMQktTQXJNQW9qN1FaUExFeHA0?=
 =?utf-8?B?RzJxZEhnZjF4OUp2KzA4ZjNVdy83SnNyUG5McUs3eWFENjJ1dld6d01iNkR4?=
 =?utf-8?Q?oHBVoBAExIr7flkZ9gsoCL5Is?=
X-Forefront-Antispam-Report: CIP:52.17.62.50; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:eu-dlp.cloud-sec-av.com; PTR:eu-dlp.cloud-sec-av.com;
 CAT:NONE;
 SFS:(13230040)(14060799003)(7416014)(376014)(82310400026)(35042699022)(36860700013)(1800799024)(921020);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 17:48:42.8702 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6225dc21-f28e-4036-a47f-08de158111f7
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82; Ip=[52.17.62.50];
 Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10932
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

Add description for the SolidRun i.MX8M Mini SoM on HummingBoard Ripple.

The SoM features:
- 1Gbps Ethernet with PHY
- eMMC
- 1/2GB DDR
- NPU (assembly option)
- WiFi + Bluetooth

The HummingBoard Ripple features:
- 2x USB-2.0 Type-A connector
- 1Gbps RJ45 Ethernet with PoE
- microSD connector
- microHDMI connector
- mpcie connector with USB-2.0 interface + SIM card holder
- microUSB connector for console (using fdtdi chip)
- RTC with backup battery

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../dts/freescale/imx8mm-hummingboard-ripple.dts   | 335 +++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi   | 395 +++++++++++++++++++++
 3 files changed, 732 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index c56137097da3b..3fbc8a1a1bf6e 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -124,6 +124,8 @@ imx8mm-evk-pcie-ep-dtbs += imx8mm-evk.dtb imx-pcie0-ep.dtbo
 imx8mm-evkb-pcie-ep-dtbs += imx8mm-evkb.dtb imx-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-evk-pcie-ep.dtb imx8mm-evkb-pcie-ep.dtb
 
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-hummingboard-ripple.dtb
+DTC_FLAGS_imx8mm-hummingboard-ripple += -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-icore-mx8mm-ctouch2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-icore-mx8mm-edimm2.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-iot-gateway.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-hummingboard-ripple.dts b/arch/arm64/boot/dts/freescale/imx8mm-hummingboard-ripple.dts
new file mode 100644
index 0000000000000..110e7ff1ff135
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-hummingboard-ripple.dts
@@ -0,0 +1,335 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+
+#include "imx8mm-sr-som.dtsi"
+
+/ {
+	model = "SolidRun i.MX8MM HummingBoard Ripple";
+	compatible = "solidrun,imx8mm-hummingboard-ripple",
+		     "solidrun,imx8mm-sr-som", "fsl,imx8mm";
+
+	aliases {
+		rtc0 = &carrier_rtc;
+		rtc1 = &snvs_rtc;
+	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "c";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&adv7535_out>;
+			};
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&led_pins>;
+
+		led-0 {
+			label = "D30";
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpio5 29 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+
+		led-1 {
+			label = "D31";
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpio5 9 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+
+		led-2 {
+			label = "D32";
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpio5 8 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+
+		led-3 {
+			label = "D33";
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpio5 7 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+
+		led-4 {
+			label = "D34";
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpio5 6 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+	};
+
+	rfkill-mpcie-wifi {
+		compatible = "rfkill-gpio";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pcie_rfkill_pins>;
+		label = "mpcie WiFi";
+		radio-type = "wlan";
+		/* rfkill-gpio inverts internally */
+		shutdown-gpios = <&gpio2 20 GPIO_ACTIVE_HIGH>;
+	};
+
+	vmmc: regulator-mmc {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&vmmc_pins>;
+		regulator-name = "vmmc";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_LOW>;
+		startup-delay-us = <250>;
+	};
+
+	vbus1: regulator-vbus-1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus1";
+		gpio = <&gpio2 11 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vbus1_pins>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	vbus2: regulator-vbus-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus2";
+		gpio = <&gpio4 21 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vbus2_pins>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	v_1_2: regulator-1-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v2";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+	};
+};
+
+&i2c3 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c3_pins>;
+	status = "okay";
+
+	carrier_rtc: rtc@69 {
+		compatible = "abracon,ab1805";
+		reg = <0x69>;
+		abracon,tc-diode = "schottky";
+		abracon,tc-resistor = <3>;
+	};
+
+	carrier_eeprom: eeprom@57{
+		compatible = "st,24c02", "atmel,24c02";
+		reg = <0x57>;
+		pagesize = <16>;
+	};
+
+	hdmi@3d {
+		compatible = "adi,adv7535";
+		reg = <0x3d>, <0x3f>, <0x3c>, <0x38>;
+		reg-names = "main", "edid", "cec", "packet";
+		adi,dsi-lanes = <4>;
+		avdd-supply = <&v_1_8>;
+		dvdd-supply = <&v_1_8>;
+		pvdd-supply = <&v_1_8>;
+		a2vdd-supply = <&v_1_8>;
+		v3p3-supply = <&v_3_3>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&hdmi_pins>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <7 IRQ_TYPE_EDGE_FALLING>;
+		pd-gpios = <&gpio3 22 GPIO_ACTIVE_LOW>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				adv7535_from_dsim: endpoint {
+					remote-endpoint = <&mipi_dsi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				adv7535_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
+};
+
+&iomuxc {
+	hdmi_pins: pinctrl-hdmi-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO07_GPIO1_IO7	0x0
+			MX8MM_IOMUXC_SAI5_RXD1_GPIO3_IO22	0x0
+		>;
+	};
+
+	i2c3_pins: pinctrl-i2c3-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C3_SCL_I2C3_SCL		0x400001c3
+			MX8MM_IOMUXC_I2C3_SDA_I2C3_SDA		0x400001c3
+		>;
+	};
+
+	led_pins: pinctrl-led-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_UART4_TXD_GPIO5_IO29	0x0
+			MX8MM_IOMUXC_ECSPI1_SS0_GPIO5_IO9	0x0
+			MX8MM_IOMUXC_ECSPI1_MISO_GPIO5_IO8	0x0
+			MX8MM_IOMUXC_ECSPI1_MOSI_GPIO5_IO7	0x0
+			MX8MM_IOMUXC_ECSPI1_SCLK_GPIO5_IO6	0x0
+		>;
+	};
+
+	pcie_rfkill_pins: pinctrl-pcie-rfkill-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_WP_GPIO2_IO20		0x0
+		>;
+	};
+
+	usb_hub_pins: pinctrl-usb-hub-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI3_RXD_GPIO4_IO30	0x0
+		>;
+	};
+
+	usdhc2_pins: pinctrl-usdhc2-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x190
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d0
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d0
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d0
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d0
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d0
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x140
+			MX8MM_IOMUXC_SD2_CD_B_USDHC2_CD_B	0x0
+		>;
+	};
+
+	usdhc2_100mhz_pins: pinctrl-usdhc2-100mhz-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x194
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d4
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d4
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d4
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d4
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d4
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x140
+			MX8MM_IOMUXC_SD2_CD_B_USDHC2_CD_B	0x0
+		>;
+	};
+
+	usdhc2_200mhz_pins: pinctrl-usdhc2-100mhz-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x196
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d6
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d6
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d6
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d6
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d6
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x140
+			MX8MM_IOMUXC_SD2_CD_B_USDHC2_CD_B	0x0
+		>;
+	};
+
+	vbus1_pins: pinctrl-vbus-1-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD1_STROBE_GPIO2_IO11	0x20
+		>;
+	};
+
+	vbus2_pins: pinctrl-vbus-2-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI2_RXFS_GPIO4_IO21	0x20
+		>;
+	};
+
+	vmmc_pins: pinctrl-vmmc-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_RESET_B_GPIO2_IO19	0x41
+		>;
+	};
+};
+
+&lcdif {
+	status = "okay";
+};
+
+&mipi_dsi {
+	samsung,esc-clock-frequency = <10000000>;
+	status = "okay";
+};
+
+&mipi_dsi_out {
+	remote-endpoint = <&adv7535_from_dsim>;
+};
+
+&usbotg1 {
+	dr_mode = "host";
+	vbus-supply = <&vbus2>;
+	status = "okay";
+};
+
+&usbotg2 {
+	status = "okay";
+	dr_mode = "host";
+	vbus-supply = <&vbus1>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb_hub_pins>;
+
+	hub_2_0: hub@1 {
+		compatible = "usb4b4,6502", "usb4b4,6506";
+		reg = <1>;
+		peer-hub = <&hub_3_0>;
+		reset-gpios = <&gpio4 30 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&v_1_2>;
+		vdd2-supply = <&v_3_3>;
+	};
+
+	/* this device is not visible because host supports 2.0 only */
+	hub_3_0: hub@2 {
+		compatible = "usb4b4,6500", "usb4b4,6504";
+		reg = <2>;
+		peer-hub = <&hub_2_0>;
+		reset-gpios = <&gpio4 30 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&v_1_2>;
+		vdd2-supply = <&v_3_3>;
+	};
+};
+
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&usdhc2_pins>;
+	pinctrl-1 = <&usdhc2_100mhz_pins>;
+	pinctrl-2 = <&usdhc2_200mhz_pins>;
+	vmmc-supply = <&vmmc>;
+	bus-width = <4>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi
new file mode 100644
index 0000000000000..ce4a61408bfa6
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi
@@ -0,0 +1,395 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+#include <dt-bindings/phy/phy-imx8-pcie.h>
+
+#include "imx8mm.dtsi"
+
+/ {
+	model = "SolidRun i.MX8MM SoM";
+	compatible = "solidrun,imx8mm-sr-som", "fsl,imx8mm";
+
+	chosen {
+		bootargs = "earlycon=ec_imx6q,0x30890000,115200";
+		stdout-path = &uart2;
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0x0 0x40000000 0 0x80000000>;
+	};
+
+	usdhc1_pwrseq: usdhc1-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
+	};
+
+	v_1_8: regulator-1-8 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	v_3_3: regulator-3-3 {
+		compatible = "regulator-fixed";
+		regulator-name = "3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+};
+
+&fec1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&fec1_pins>;
+	phy-mode = "rgmii-id";
+	phy = <&phy0>;
+	fsl,magic-packet;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		phy0: ethernet-phy@4 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0x4>;
+			reset-gpios = <&gpio4 22 GPIO_ACTIVE_LOW>; // MX8MM_IOMUXC_SAI2_RXC_GPIO4_IO22
+			phy-reset-duration = <10>;
+			qca,smarteee-tw-us-1g = <24>;
+			vddio-supply = <&vddio>;
+
+			vddio: vddio-regulator {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+		};
+	};
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pins>;
+	status = "okay";
+
+	som_eeprom: eeprom@50{
+		compatible = "st,24c01", "atmel,24c01";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+
+	pmic@4b {
+		compatible = "rohm,bd71847";
+		reg = <0x4b>;
+		pinctrl-0 = <&pmic_pins>;
+		pinctrl-names = "default";
+		interrupt-parent = <&gpio1>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+		rohm,reset-snvs-powered;
+
+		#clock-cells = <0>;
+		clocks = <&osc_32k>;
+		clock-output-names = "clk-32k-out";
+
+		regulators {
+			buck1_reg: BUCK1 {
+				regulator-name = "buck1";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <1250>;
+			};
+
+			buck2_reg: BUCK2 {
+				regulator-name = "buck2";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <1250>;
+				rohm,dvs-run-voltage = <1000000>;
+				rohm,dvs-idle-voltage = <900000>;
+			};
+
+			buck3_reg: BUCK3 {
+				// BUCK5 in datasheet
+				regulator-name = "buck3";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck4_reg: BUCK4 {
+				// BUCK6 in datasheet
+				regulator-name = "buck4";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck5_reg: BUCK5 {
+				// BUCK7 in datasheet
+				regulator-name = "buck5";
+				regulator-min-microvolt = <1605000>;
+				regulator-max-microvolt = <1995000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck6_reg: BUCK6 {
+				// BUCK8 in datasheet
+				regulator-name = "buck6";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo1_reg: LDO1 {
+				regulator-name = "ldo1";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo2_reg: LDO2 {
+				regulator-name = "ldo2";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <900000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo3_reg: LDO3 {
+				regulator-name = "ldo3";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo4_reg: LDO4 {
+				regulator-name = "ldo4";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo6_reg: LDO6 {
+				regulator-name = "ldo6";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+&iomuxc {
+	fec1_pins: pinctrl-fec1-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_ENET_MDC_ENET1_MDC			0x3
+			MX8MM_IOMUXC_ENET_MDIO_ENET1_MDIO		0x3
+			MX8MM_IOMUXC_ENET_TD3_ENET1_RGMII_TD3		0x1f
+			MX8MM_IOMUXC_ENET_TD2_ENET1_RGMII_TD2		0x1f
+			MX8MM_IOMUXC_ENET_TD1_ENET1_RGMII_TD1		0x1f
+			MX8MM_IOMUXC_ENET_TD0_ENET1_RGMII_TD0		0x1f
+			MX8MM_IOMUXC_ENET_RD3_ENET1_RGMII_RD3		0x91
+			MX8MM_IOMUXC_ENET_RD2_ENET1_RGMII_RD2		0x91
+			MX8MM_IOMUXC_ENET_RD1_ENET1_RGMII_RD1		0x91
+			MX8MM_IOMUXC_ENET_RD0_ENET1_RGMII_RD0		0x91
+			MX8MM_IOMUXC_ENET_TXC_ENET1_RGMII_TXC		0x1f
+			MX8MM_IOMUXC_ENET_RXC_ENET1_RGMII_RXC		0x91
+			MX8MM_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL	0x91
+			MX8MM_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL	0x1f
+			MX8MM_IOMUXC_SAI2_RXC_GPIO4_IO22		0x19
+		>;
+	};
+
+	i2c1_pins: pinctrl-i2c1-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C1_SCL_I2C1_SCL			0x400001c3
+			MX8MM_IOMUXC_I2C1_SDA_I2C1_SDA			0x400001c3
+		>;
+	};
+
+	pcie_pins: pinctrl-pcie-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO15_GPIO1_IO15		0x0
+		>;
+	};
+
+	pmic_pins: pinctrl-pmic-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x140
+		>;
+	};
+
+	uart1_pins: pinctrl-uart1-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_UART1_RXD_UART1_DCE_RX	0x140
+			MX8MM_IOMUXC_UART1_TXD_UART1_DCE_TX	0x140
+			MX8MM_IOMUXC_UART3_RXD_UART1_DCE_CTS_B	0x140
+			MX8MM_IOMUXC_UART3_TXD_UART1_DCE_RTS_B	0x140
+			/* BT_REG_ON */
+			MX8MM_IOMUXC_SD1_DATA4_GPIO2_IO6	0x0
+			/* BT_WAKE_DEV */
+			MX8MM_IOMUXC_SD1_DATA5_GPIO2_IO7	0x0
+			/* BT_WAKE_HOST */
+			MX8MM_IOMUXC_SD1_DATA6_GPIO2_IO8	0x100
+		>;
+	};
+
+	uart2_pins: pinctrl-uart2-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_UART2_RXD_UART2_DCE_RX		0x140
+			MX8MM_IOMUXC_UART2_TXD_UART2_DCE_TX		0x140
+		>;
+	};
+
+	usdhc1_pins: pinctrl-usdhc1-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD1_CLK_USDHC1_CLK			0x190
+			MX8MM_IOMUXC_SD1_CMD_USDHC1_CMD			0x1d0
+			MX8MM_IOMUXC_SD1_DATA0_USDHC1_DATA0		0x1d0
+			MX8MM_IOMUXC_SD1_DATA1_USDHC1_DATA1		0x1d0
+			MX8MM_IOMUXC_SD1_DATA2_USDHC1_DATA2		0x1d0
+			MX8MM_IOMUXC_SD1_DATA3_USDHC1_DATA3		0x1d0
+			/* wifi refclk */
+			MX8MM_IOMUXC_GPIO1_IO00_ANAMIX_REF_CLK_32K	0x0
+			/* WL_REG_ON */
+			MX8MM_IOMUXC_SD1_RESET_B_GPIO2_IO10		0x0
+			/* WL_WAKE_HOST */
+			MX8MM_IOMUXC_SD1_DATA7_GPIO2_IO9		0x100
+		>;
+	};
+
+	usdhc3_pins: pinctrl-usdhc3-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK		0x190
+			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d0
+			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d0
+			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d0
+			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d0
+			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d0
+			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d0
+			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d0
+			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d0
+			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d0
+			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x190
+		>;
+	};
+
+	usdhc3_100mhz_pins: pinctrl-usdhc3-100mhz-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK		0x194
+			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d4
+			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d4
+			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d4
+			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d4
+			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d4
+			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d4
+			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d4
+			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d4
+			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d4
+			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x194
+		>;
+	};
+
+	usdhc3_200mhz_pins: pinctrl-usdhc3-200mhz-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK		0x196
+			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d6
+			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d6
+			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d6
+			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d6
+			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d6
+			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d6
+			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d6
+			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d6
+			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d6
+			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x196
+		>;
+	};
+
+	wdog1_pins: pinctrl-wdog1-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B	0x140
+		>;
+	};
+};
+
+&pcie_phy {
+	fsl,clkreq-unsupported;
+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_OUTPUT>;
+	status = "okay";
+};
+
+/* assembly-option for AI accelerator on SoM, otherwise routed to carrier */
+&pcie0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie_pins>;
+	reset-gpios = <&gpio1 15 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+	status = "okay";
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins>;
+	uart-has-rtscts;
+	/* select 80MHz parent clock to support maximum baudrate 4Mbps */
+	assigned-clocks = <&clk IMX8MM_CLK_UART1>;
+	assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_80M>;
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm4330-bt";
+		device-wakeup-gpios = <&gpio2 7 GPIO_ACTIVE_HIGH>;
+		host-wakeup-gpios = <&gpio2 8 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&gpio2 6 GPIO_ACTIVE_HIGH>;
+		max-speed = <3000000>;
+	};
+};
+
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2_pins>;
+	status = "okay";
+};
+
+&usdhc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&usdhc1_pins>;
+	vmmc-supply = <&v_3_3>;
+	vqmmc-supply = <&v_1_8>;
+	bus-width = <4>;
+	mmc-pwrseq = <&usdhc1_pwrseq>;
+	status = "okay";
+};
+
+&usdhc3 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&usdhc3_pins>;
+	pinctrl-1 = <&usdhc3_100mhz_pins>;
+	pinctrl-2 = <&usdhc3_200mhz_pins>;
+	vmmc-supply = <&v_3_3>;
+	vqmmc-supply = <&v_1_8>;
+	bus-width = <8>;
+	non-removable;
+	status = "okay";
+};
+
+&wdog1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&wdog1_pins>;
+	status = "okay";
+};

-- 
2.51.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7830CC6409A
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 13:29:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9387A10E383;
	Mon, 17 Nov 2025 12:29:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="Tc2daLBZ";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="Tc2daLBZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11021093.outbound.protection.outlook.com
 [40.107.130.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E67C10E35F
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 12:29:43 +0000 (UTC)
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=iQN6vexVXiZWBkpN1rjFL433cDBplvafoFpBkNt2s5ACExijjdQ3v/a2xoSg2Lzvu6+BkKOTxrI+TKrpP9DugDrsNhxaxKKOTp5ZManoFWHNH4jVDtUQrIB8t+XtJU05EhyOKW/iJVBNQf6pBQ/h/SpOXGjHGlr7rou6jCQPoHvZV/jqZp5U4Z0SHWhNxpdzqOfhGzc/4IaqI+HAjByzuXLu6HaRfzQe+8oGpfQ10I7hAy+YQfqz16MYZ3oCqvJiABYkZNd2/YdaR/Q6TF3/4fw0FfvxK35KKaArGP1mw+LMLRr2OatSe60FUd8zZX+eUvU2xAFXxSsfxi9DmHna9Q==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VHMJPBgiy9FigrSEao+Itrl7BLAeVBffNe8pcmRoqTU=;
 b=ROllnqh/zw6J/Hc2xpYfqxq2lrlT9bJ8rUPxpJVpkfb+rx8amPT7O/0dqGSmcreAA0Mp9gqU4Q9fhnXR/mdu4vx+pm0kYbN+ee6ZGlsqCKlnCbJrsde9CFu9QCRw+sYZRYh5Tsac29xjafo7+9ZbuYSjlCCGMHtfCldlFvX3u8lLwKGHv6sZhxPYCwX1cu3mbSLycJtwHI4WCrvkNhQ+Q9J02Lqh5LD4rvcciyJByNUAYu/fd+7mZGCsrUfQBUeYQwChskSqRQtK719ycOanCWRZjpi4Zb9NXvuK7USJHSDUMs/RtXzgH5TiqKmh3sxwkpUrnvwx4MCCwYjXoikukQ==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VHMJPBgiy9FigrSEao+Itrl7BLAeVBffNe8pcmRoqTU=;
 b=Tc2daLBZUiobANhWALZ2L/SMEAxL55L0c6Tvooli2kd5XPMobkrNohXKFIvAKIA4D90wX6uhBPT3Qdp6LAMVG7HFICYj05yXGkFoeFN/kKFfssiqKJdfkguZAUpgqpACcZSgeBAnc/scqHCR5rBOV9YdsR4bEit5wcUr8R7e3Hc=
Received: from DUZPR01CA0282.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::17) by AM8PR04MB7364.eurprd04.prod.outlook.com
 (2603:10a6:20b:1db::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 12:29:39 +0000
Received: from DB5PEPF00014B99.eurprd02.prod.outlook.com
 (2603:10a6:10:4b9:cafe::3b) by DUZPR01CA0282.outlook.office365.com
 (2603:10a6:10:4b9::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Mon,
 17 Nov 2025 12:28:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB5PEPF00014B99.mail.protection.outlook.com (10.167.8.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Mon, 17 Nov 2025 12:29:39 +0000
Received: from emails-2027864-12-mt-prod-cp-eu-2.checkpointcloudsec.com
 (ip-10-20-6-39.eu-west-1.compute.internal [10.20.6.39])
 by mta-outgoing-dlp-862-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with
 ESMTPS id C7998800EA; Mon, 17 Nov 2025 12:29:38 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1763382578; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=VHMJPBgiy9FigrSEao+Itrl7BLAeVBffNe8pcmRoqTU=;
 b=OFX/D0re32WTCvwOnIdmgFt8q1ngjJzAiy64m0bYR9lJG9Ug1ByhM9kXjO13ohW3Qabkx
 J6E4ug1o0nMuCaC5KEYga/liHAN8eFAvG99MUIz5cf36i3F/KFxcPHWoEbDF00ugJ7dlS6j
 w/On+F2v6vWPQZLTrqMLfM/ckHA+atk=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1763382578;
 b=U2uhoiyTYKQJYNeEwwLaGX1t7kX+/LUevoyb2CJu7Uw7Gs33fZd0F4/fNsqFIwLwDE8j0
 K5zUlRLEcV7F2A6Bz7nfBbTfMumbXKqxD6l+e7iEOXKTeyNLHuMGK/h9MxpOTrHxO/ssguC
 dTJPpYGyvQyNhia8p1MiZZ9VQdrxKtw=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B6Bu6NPF02UShKmQDsZmhZpRgx+3VxMK8rPDArCs1T7QC9o+X5FTh4vPJT2k+OlxaB1nsOVwOkzZEE0WgDe1UCTYBPOZen8cqhIUbZIN4F2y5kZKfU8ZZu2YMcChQDBHkmBYShzxv91A7XWOgPYHqcIgIAG6uZSm15/A6TOANRA0+scn8DS6rKZg/OP2sZg6biZhpspiFLzMYna2sQ64UTALHBU/qJB1l/eCvVy+1StfM5W5zVBycPdfQLRVOi+ZQsHgrvzaqThxLS+E9YogIuuaMVR1ZfGhywhVtDyQEte4SRDCuS9ifyh0aH3Zr+ntKbmYhXLNE719Iq/hMV6eyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VHMJPBgiy9FigrSEao+Itrl7BLAeVBffNe8pcmRoqTU=;
 b=myO53Td3RFdKnHX6niJyIjOluvS6uNTRCK6Syb6se7bag19ffTyjk5201xvwcC6YK58LrwSp5L7DfpRPVsld/Rocj3kjF5xXakTurl7ea3D2nA0/YYTk75TXZlAuIyuol29nRq1ExSxqyLKd3QWlfW0csMAIiU1mVVQUr1kmCU3TwaEvOw36rDWSEMmo+n9WgwnwGy0FAEHXXJBkXQi9XKotyf7hY7bJ6m5w7+9scsP8VEUKUJF5oJK8f/0z9O/ZqKPv3vYh/CDZBHbgLqFEG4/cbDcY2xHHTuye/5uM2mqWYKwvVpbEDDAun+vtA6dYxVFO2SD8CtAiu8eigpjVcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VHMJPBgiy9FigrSEao+Itrl7BLAeVBffNe8pcmRoqTU=;
 b=Tc2daLBZUiobANhWALZ2L/SMEAxL55L0c6Tvooli2kd5XPMobkrNohXKFIvAKIA4D90wX6uhBPT3Qdp6LAMVG7HFICYj05yXGkFoeFN/kKFfssiqKJdfkguZAUpgqpACcZSgeBAnc/scqHCR5rBOV9YdsR4bEit5wcUr8R7e3Hc=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AM9PR04MB8440.eurprd04.prod.outlook.com (2603:10a6:20b:3df::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.20; Mon, 17 Nov
 2025 12:29:23 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 12:29:23 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 17 Nov 2025 13:28:45 +0100
Subject: [PATCH v3 03/11] dt-bindings: panel: lvds: add Winstar WF70A8SYJHLNGA
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-imx8mp-hb-iiot-v3-3-bf1a4cf5fa8e@solid-run.com>
References: <20251117-imx8mp-hb-iiot-v3-0-bf1a4cf5fa8e@solid-run.com>
In-Reply-To: <20251117-imx8mp-hb-iiot-v3-0-bf1a4cf5fa8e@solid-run.com>
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
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0350.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::12) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|AM9PR04MB8440:EE_|DB5PEPF00014B99:EE_|AM8PR04MB7364:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d8e65fb-b7df-4dee-0924-08de25d4f9ff
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|7416014|376014|52116014|1800799024|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?YWZoMGE2MVIrd1RiRisrcEFVTHBLaVVjb0pIdTlpWm42cDJqbC94VCsxL0lE?=
 =?utf-8?B?T2l1aTJhVmp1SS8rYlIyTHdhRmdVSmRIRVJLcFhYRU1WTnVWOWl0T3hFcFJS?=
 =?utf-8?B?aVF2QXBDaXVneUZ2SmJYYS9FT1IyMkRWNERpZWkzRVZ4bWNDWUhiYnQwRUVp?=
 =?utf-8?B?cjBRb1p3MFlYc3ljbkxZZk9qMTZUR2doQmRmUjZWMGhIU24yQTlzUnEvWW9j?=
 =?utf-8?B?RWt3MUlUTDlwNkpkMGFybTVMZEVIcEFpbzNEQmtlSERsZHNNZ0ZsNldsT21W?=
 =?utf-8?B?NllKcU5LVFRua1doU2RkaVEwN2YrNUZqZDJ2blJMY2M0S3BqN2hrb3I0M1pi?=
 =?utf-8?B?eXJxUmJPbEEzS1ArcHF4bHg3Ri80ckN1WU9qNFhIMzBPVHBQU2lKcHEzNFpC?=
 =?utf-8?B?RlpTS3ZWZmVhWU9lbGlOK1RpSjh6QlFCWU9Gc1N3cmVvMkRMY0VaK2RaNkQ0?=
 =?utf-8?B?eWd0UmF4dnRMdEsveWRBbzNVVDd1d3pTWTdMalNmZkNsdzlzdnVreUJUdWIw?=
 =?utf-8?B?YUt4dG04MVpQVHkyUFY0WndCWFNPaHJvVkw5Zm5MYTREVG81Z1h5VUxNdHZx?=
 =?utf-8?B?WE1NVmdMaU5FN3dPeXhLa3VoNkk1ZnVUcGsxclZ4eTZSQzdTSnRZM1VnOS85?=
 =?utf-8?B?bXlZNzR5dDllMCtMOHR3NUttZExCZ3JvNjA2QWdBVTliNjFCMHgxU2g4T1Br?=
 =?utf-8?B?OG56cVJEeWU1c2ZqbXdjWS9zcEQ5MGhhSmI5cDQ2UktrVlIxdW1YcTBiaXJI?=
 =?utf-8?B?dnIvRnMxeWxwbjZjaHpJRW53YlNRVkhSV0hXd0RxZTI5TlFWbHk1WkhZdC9x?=
 =?utf-8?B?b1lnaGlCY2xxN2xBMWN1TDhLRXlmMDlyRFcvcDlZbFliZkhra2tWWUQycjdv?=
 =?utf-8?B?MXdEY1ZRQ3pCTXU4ejFNV1QwRFJiWjJ1V0pPekQ4Vmh0RDZHeXlRcXI5ZzJQ?=
 =?utf-8?B?MTBKUWx1SEhESFVCa1J3UmlCTmlzZUY0UDI3M0FYZENVaHgyemVPR0x6RUNw?=
 =?utf-8?B?YnFXYVhWVGRlZTQrK09oeVVsOWo0VFlUVlRKUy9uWlRsSGhJaFV5QTlVclpX?=
 =?utf-8?B?ckk5YUVWWEFyNUlGcUpTaWViUXc5UHBYeEhhdG1Td1BFYjBsdGIrUkRlMUxx?=
 =?utf-8?B?MUdBSDkyRUZvd3pVRlhEaEphQmZrbGZFTHM0MFRMY3hobllya3RHcitudGhq?=
 =?utf-8?B?OEpndXp2VDF0UWZtQkJlQ1I1QjJ5bkh5akNNdnN5Y1BCdFBnUWtMTm9CM0Zi?=
 =?utf-8?B?SUpack0xcTU3WXdBbGh4S0lEck9DRStXOWFRL2RDMXFTM3ZpaHVBQXdFYVZo?=
 =?utf-8?B?YU5tV29mVUF1a2xnNjZlbVlrMGsyd0JNajZJc0VIdVE4UkJ1dEtvTjlQL3Ra?=
 =?utf-8?B?WUlEOGVRSXVGcEN0OTd4L3FzaFpudkpNN29pa3pHVXFvZDZHVWdZaDRsOGdM?=
 =?utf-8?B?Mmc2MXhsWGtKd3FneUlJT24xRDhzZ210MG1tUmxRMUhwN1VhVUtYcFdLcWs2?=
 =?utf-8?B?Z2ZNU0dpUldTNU9MbFNqajdYMHF2Q2hVMEkvQ0JoVC85bzVVMjF3eENPVDZ3?=
 =?utf-8?B?SmRKallNUUtqWVFnd3ZYcXdHdG9sRW5DbURkMWoycTFTNlp0dEdlblNxalgz?=
 =?utf-8?B?dHE1T0tVMWZhclkyYTc1TCsyTUVHcEVWS0syS2xLeDNJeEhGL1lNeldOVDZr?=
 =?utf-8?B?eHhQdU1BUFJTNDExc0VHanZiUGVKK29RN0tEVnV3YitZTkJJcVdBRmEwcXJU?=
 =?utf-8?B?RDVDUDJ2b2lyRXU0eVJkaUdzWWYyMXpya0VtVGE2RU4yMjJhblc2d2M3UmZy?=
 =?utf-8?B?V0xKR2FIbzRQREd3eTFWa0hhZWRqUkdNcHdISEpLdkpIRFdCb29aYm9wTjJ6?=
 =?utf-8?B?RGVKYkNaY3krRTM0QlhtRXBsOCtqb01LYjhKcXUzQWNFek5lOHJFMmQwdjR0?=
 =?utf-8?B?UmdQM2lWOE1STFlva3haUEdDanV4UHhDMVIxQWZLV3RtWno4WTRRNEZDdHJs?=
 =?utf-8?B?bUJQRXBLYk04S0o4dW1PYnk5VVZEeXFsaXNERGMzdGQrbi91Tmk0Z3dneDVj?=
 =?utf-8?B?MzVTV0xBT3dhNmxjYTZkcnV2Tml4d0RyQXNGUT09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB8749.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8440
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: f05101377e7942f7892caf919daa519b:solidrun,
 office365_emails, sent, inline:420ed00615c24b21e2a97981d2008705
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B99.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: c12c4bd9-e3d7-4f4d-2b30-08de25d4f08e
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|36860700013|14060799003|35042699022|82310400026|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c2dab2x4NWd2KzAwdHlIZ3lQQmxXQmtmc3pPaVIrdGZlMXBsZjZnUVY2MWJm?=
 =?utf-8?B?NkgzaGgvSHlkVnROSlhybmNEN0ZKQ1VPZ0xrYng2ZXBPVkU5cXVoUGhhV1Z3?=
 =?utf-8?B?RTk3akpENmhPY3J6Vms0L0pZT0VPN1J2c1VDbnBGZ0cwWWFYMmJ6Um9xbTJM?=
 =?utf-8?B?UHBwZzY2Z0tEVlREWmw3VUg2RW9Xd1ZsTWJlUm44N1BrY3A5U2xlUEtMZTFR?=
 =?utf-8?B?TW0xRzlwZndGKytSS0MrUmZWYnVOQ01ISzk2S3RUYWpUODNCUVZkWmJxaUZO?=
 =?utf-8?B?UEYrS2QwVWRyME1qSUZIQ2N1UHZmSnoyVStxT3d2Y3dJWlpPai81ZXJzbHFp?=
 =?utf-8?B?aGJQQ1h2aDhQTWoyWDlqdXVWWDA2d3htTVdTTS9id0RsR3Y5dkwwbHBJTFg0?=
 =?utf-8?B?WHBhblcySGtCMm9HL2tqMWZKUmpaTVBHaWJaaXlubXJndTlXSWlxZk5iZnRO?=
 =?utf-8?B?RTIyZkZsZTVwWWlJNmlDVnJWamZsbXdwdHpYcklnZnNSMXh4ZW9BVTFJMEVk?=
 =?utf-8?B?MkJENGZ2emx6a3ZvQU9nR2g3Mmx3aFB4anJUVG5yTVJhK0NMaC9CUkVuL0FF?=
 =?utf-8?B?ZjliSDlDaG1TcEo3cEFHS3BlVisxaE0zUyt2WWhWM29tbGU3NUJ3VUh1Q0U4?=
 =?utf-8?B?V0lJS0diZ1lXaE1uMTN2eVp3MkVqSnZNUUNrK3duZ1BQWkFiaWV2dG56UHhJ?=
 =?utf-8?B?MTNTRDlPT243NElFT25vbDdjVGZaRWgyU2Y0d2UvRTdEWG5UZGp0elBxMFhu?=
 =?utf-8?B?U0xsWnlYc2FxOTQvZjRiMFJDUkdaSHgrVDkvdGpRblltOFRzYU15OGdwOEFC?=
 =?utf-8?B?WSt5ZHYwNjhmeUh0eFBuYzZvOXBWZHJOZFZnWWpmWkFIenBnVGFPWXBuSm8v?=
 =?utf-8?B?NEVyVXhoWmdUL282b3pWOWNyeDhUTERLSEpZTHJTUEx2NGZ1aWFZckIyR0VX?=
 =?utf-8?B?RW9mTlVBV0c5R20yUUQ4cWRpQWx2OGV0NjdrN1JJNnR1V2t3Z1BTNUFFRlNE?=
 =?utf-8?B?UlIySm1BUUZycFo4enMyRisrREs1MXJBaTFMd2srS1hDdmsxYjJTOE9XcVZo?=
 =?utf-8?B?ZnROOXVrRDlxL0R6TXRIdEM5YjBpZSsyUFNPb2U0c2RzL2EvOFJ4aCthdU1r?=
 =?utf-8?B?ZVl5L29DKzcyTUxDcWhaWHcxaGZWRUZMMyt3a215ZjdUbk9IZjZqeDZ5Z09Q?=
 =?utf-8?B?MVFWUDRlQVFxREovRGpDUmxtUk1ZdTVCU1RuOEFreGNZVDRJSWpKMmJuWm9T?=
 =?utf-8?B?b2tJVUdQd2dicEEzL2RiRzh0Q2V6NmpWQlByOUp6djE2RENxOUlMdkRZTmRI?=
 =?utf-8?B?MWhNaXlZZmZha1pFMW0wd2JlZ3lpdVRMZWt4RVU3NGdjdnFtdk9hdlAycmJ3?=
 =?utf-8?B?MVFVZkVxdUVPV2NYQkVBN28vRXg3TlFzRHc0Q2RNME5mTmd4KzBzbm5vS1Ax?=
 =?utf-8?B?d1Y5Vkk5eWZLWEwyOUhZUWJkKys2ckVzOTIrQjQ0bmNBb1BGa3lodDFhZzNo?=
 =?utf-8?B?OGc1bWJFZFNFSTU4OUR0QTlVLzFZeWY2cEJReWFzYTFCeGZhaXJ2RE1HRk9n?=
 =?utf-8?B?aUF5OFgwYWd3bm8waEh4UjRHbTB5cVc0UkFpaURxZlY3ODQ0T25WMGN3ZDZP?=
 =?utf-8?B?ZCtnajJtd25GcEdvakFvczM2TjVtOWhwVXdwamxMMmZnb09mUGUyQ29icFZl?=
 =?utf-8?B?Vko4alZFWXRMZlgwY1Z6VVpNbjBtUXY0SGtnSDhFMWpkalNCODFnaUEyUjZt?=
 =?utf-8?B?aFVlWmNISUx0UlFsNVhsN25qcXBjdmhsZWdKT1I5Y2h3QmRPMWtTK3pZWkJn?=
 =?utf-8?B?bjhaV0w2d0N4ekQ2SmJrdFZWQnk3KzM1Skh0RFUzNkVkUkIxdW1vMHUwcFVt?=
 =?utf-8?B?amNpcEdRWWRGMGMxZElVRDJyUXdlRjN1SFdUYlJ6SEVWOStMQUt2MGVhMHZC?=
 =?utf-8?B?ZG5jaEIvVzFGR05WaDYwYkxjVXdJOGxJZ2tWTWVDNWMyR1ExT3FtT3lmdnpk?=
 =?utf-8?B?UTcrTDAyZklrWG01bytGMHZXV3hQSzNYZS9HeW5sMmJaU1JmZnk3dTFsTDMy?=
 =?utf-8?B?VGtKR0lBY2p6ZXl5R0FrRlRIVlArS3NBbWpPNlRwQmYyQUpQaXp1UDd5UDgw?=
 =?utf-8?Q?I/AaMGGhpqDt/UTRFJdcp5WXl?=
X-Forefront-Antispam-Report: CIP:52.17.62.50; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:eu-dlp.cloud-sec-av.com; PTR:eu-dlp.cloud-sec-av.com;
 CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(14060799003)(35042699022)(82310400026)(921020);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 12:29:39.0226 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d8e65fb-b7df-4dee-0924-08de25d4f9ff
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82; Ip=[52.17.62.50];
 Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B99.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7364
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

Add Winstar WF70A8SYJHLNGA 7 inch WSVGA lvds panel.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
index 4388d5375851a..dbc01e6408958 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
@@ -59,6 +59,8 @@ properties:
           # Jenson Display BL-JT60050-01A 7" WSVGA (1024x600) color TFT LCD LVDS panel
           - jenson,bl-jt60050-01a
           - tbs,a711-panel
+          # Winstar WF70A8SYJHLNGA 7" WSVGA (1024x600) color TFT LCD LVDS panel
+          - winstar,wf70a8syjhlnga
 
       - const: panel-lvds
 

-- 
2.51.0


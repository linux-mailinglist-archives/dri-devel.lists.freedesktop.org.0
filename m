Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B3DC640C4
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 13:30:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A144310E3AB;
	Mon, 17 Nov 2025 12:30:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="YVpnyF0P";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="YVpnyF0P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11023088.outbound.protection.outlook.com
 [40.107.162.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B75B510E395
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 12:29:52 +0000 (UTC)
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=hSfLA2JgsZvbF8cN6GCVoWXEAnfw3swJRjvIQHuDeJhcc9yxbrTFBihbVswfrRE8kHpmqruiGX+/nOmnFXrCMTMVtihjVYrwmNtG7y6Gf4969ZoExv2YsyhQmgrEWI+kW4j6svJBgrMKeEkwHKS/hyP5XJJ5mZy3ryElO+cdkRYkaXRbCUybCX6JDmj282elWDdK4W8s0ai6VGflLImCjRIt9c7tenJRGFVb+4GOXnmC+DlHB22sNUR/edaRteP3YzvsLudXPY2U369YVy/B5EXYuXsIDjZF8BPJP2MkSS9jxoaNcYZCgdn4M+P+Nz4v/FwExG2k+953Yu+UZKyzBQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jxzG9pFKA4ux1gnSwCSmCFNXQ2stnR2b8ynC1z3PVdk=;
 b=yRwMd7A2P3Z7YOijmjlLgTbTyqmtlD4lutu+tCCyK3EeVQa50lhNurStQ6DHL9+Y6OraDbbGC5d7loujMT5KBIXxCyYda6UI9FZfZaMvGTXOxGc3n/n3wFBkCXvIH+127vENPjd5gs7avif/nFGq/JoAm8YD8EWVmiwuHcbkHOqWTVnO7XfKZ5qx4rR8v7JfJsFdciHPjkXVCq+wsinRKLfBiGN8pzBZ/K/b3PUNKgVZJO84MguLxdgtcZZtkXCz/3m+iGsvxjL6x6JdU8pY2//qwLbVrTEgc33CFGCntLYgpqQSbCvp5MPbZ+Fvwoww5GVjFVQNKZWNJdcK2mnH+Q==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jxzG9pFKA4ux1gnSwCSmCFNXQ2stnR2b8ynC1z3PVdk=;
 b=YVpnyF0Pvu6s7JxCeC8AgX9kAiQt+JDXwWa66cRA5E9jKKMR1MYTGonwEHJou/8cjisibCLl70FIWzPUuLGFSUUedKd49qX3nCOUpbgTeLk+WxTt1LPc2mYau1VWSGtSIWbFKKhMiRd94Ov6uGhqgGepcY59XT9EJHuwWVq90Vg=
Received: from DUZPR01CA0122.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::26) by AS8PR04MB8386.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f6::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 12:29:47 +0000
Received: from DU2PEPF00028D11.eurprd03.prod.outlook.com
 (2603:10a6:10:4bc:cafe::ba) by DUZPR01CA0122.outlook.office365.com
 (2603:10a6:10:4bc::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Mon,
 17 Nov 2025 12:29:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU2PEPF00028D11.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Mon, 17 Nov 2025 12:29:47 +0000
Received: from emails-5628556-12-mt-prod-cp-eu-2.checkpointcloudsec.com
 (ip-10-20-5-219.eu-west-1.compute.internal [10.20.5.219])
 by mta-outgoing-dlp-834-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with
 ESMTPS id EEB4780121; Mon, 17 Nov 2025 12:29:46 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1763382586; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=jxzG9pFKA4ux1gnSwCSmCFNXQ2stnR2b8ynC1z3PVdk=;
 b=OVSVtuQVj/BiM4Gtm/nOaXiu/YM4IZ0rSNSnIU2nMSKAQN3d3iIdUfkl1QPpgeT8zgZQW
 xZKWFUl95J1So6zALbFZCraYSVR9eWBdfAhwRrbEQAbpWnuKT56Krosgf/qXa2ZPtW0PI4D
 ujvDUDfP1lz+ZwK5uuTLWRXvlH5djgs=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1763382586;
 b=mH3ISMzR8pNxZQtKVF1co60RRlT2GKwYVWk3qwcONiztLs3fRnXrcaPh5R2sW5+dogesN
 HUmVEW/VUs0gz1bVgY/vcyzJEmELU1+s/frXx8Zog84rrc7Mm71AKt6qJAllwjfuynfEnlc
 DFSSrtw7TALh/Kxw3wlZnmwQvFAMuW4=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MdKib1nr4bmvOAYnDllKvPk1koj8nVYDk2dBz4XxGYhYwnuO+dLodl4wfugub/uODc+c6Wovey0GhGCNPLmF7BBaWC6OtrZw/0BkBvAbxa2QlVp7ZWg6vW4up1L1VaBWT0Kn+3hE1nJbXUEtRhnOX9aUazzwrovE9auvwpY5Uz6rl6ThEfyhf9nVrLsvDEu73JpVnH6VswRqPjH8nnDkEATSfheXZnjZTtJA2wvGgUpUviaz12gnGTZRAWbJ9SN+J5ELinO6PWa6s9hFNGB3mIf/z2Dx7TDTwiYrwrUManAtD1lcoztNnMkPNzNcXbpeohP6gArS/qmC06/cly8RRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jxzG9pFKA4ux1gnSwCSmCFNXQ2stnR2b8ynC1z3PVdk=;
 b=KoXr0Abm791sjFWZElu6wH55YHsSY+iFBOdL3jgY0b5aPy/uUCQDfmdgpwN2caPoOkcELpjR8Ai60q92WePAqj9L1KsKpi+kS4MlAAV6G3DTBO76v75TQLqz49OL7v0XXA2tidE3ltazVixXOkg2pmbtmxK/Bc6+srQ/oAaTYD3U058oNUa+foTQlYrx1KAxKBslhmNrL1yivM56ecu23dT3z2S1Zep+76oqMFLpQ5jppXaKWsuZTWOGFcajIseX5l06rMxcKflsvSAQMEobnMPZ/H9FKk2f31d9racNBUKBcwi8akmQj8VdCVVDBoFgXk3IBgzWodnS6dKLcwknHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jxzG9pFKA4ux1gnSwCSmCFNXQ2stnR2b8ynC1z3PVdk=;
 b=YVpnyF0Pvu6s7JxCeC8AgX9kAiQt+JDXwWa66cRA5E9jKKMR1MYTGonwEHJou/8cjisibCLl70FIWzPUuLGFSUUedKd49qX3nCOUpbgTeLk+WxTt1LPc2mYau1VWSGtSIWbFKKhMiRd94Ov6uGhqgGepcY59XT9EJHuwWVq90Vg=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AM9PR04MB8440.eurprd04.prod.outlook.com (2603:10a6:20b:3df::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.20; Mon, 17 Nov
 2025 12:29:25 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 12:29:25 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 17 Nov 2025 13:28:47 +0100
Subject: [PATCH v3 05/11] drm/panel: ronbo-rb070d30: fix warning with gpio
 controllers that sleep
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-imx8mp-hb-iiot-v3-5-bf1a4cf5fa8e@solid-run.com>
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
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0350.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::12) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|AM9PR04MB8440:EE_|DU2PEPF00028D11:EE_|AS8PR04MB8386:EE_
X-MS-Office365-Filtering-Correlation-Id: b30ecc6d-0ac7-49d4-24bb-08de25d4fecd
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|7416014|376014|52116014|1800799024|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?c2Q0MnRnUUFVaHJoYXFBMkQ5em5oMUg1THhrcGw4MFpCUmhDeTRCSzBxYTJK?=
 =?utf-8?B?ZmxxSE0yczBGazVEa3ppajFlcEhucFd2TDBrL1RVS0I2WWRybHBGak5FM25V?=
 =?utf-8?B?R3FaaUtCOVJFY0hSeSszRWlYeW9JVGtVOVZ1L3dzN3JSb2JONm83azYrZmJv?=
 =?utf-8?B?cmJpV2xzQ2U1clBXeG1lcnBYUmRBdGh2bHZSWENndG1sczRYQ3d0TUlRSy9x?=
 =?utf-8?B?bjJ5cVluYmNiay9PTzdmcXJWK2hhK0tScksxRXByR3kyV2JlcTJkRHVIUjR2?=
 =?utf-8?B?aDhxM2dDUjRMQVNXbHFEb0RCQ3BOcWdFUzMvRnZIV0laTDJBU1hzMGtPb3RC?=
 =?utf-8?B?ak9TRExHcnJpZG82c0puaFh4aU5yYXJtTWRLMVNSNWtCT09YQ0dQRktaUUxz?=
 =?utf-8?B?YkdmYnNnd29sd2MzRm5tdi81S3pNaVh0YUpSQnpHbVN0Z3VWZVp2d1l5MHBv?=
 =?utf-8?B?ZnhVVVZjaGZoOVpIWFBBN1orcXFVQUlJS3FWcDh4R2xEMmdRbEN3cGozVzRG?=
 =?utf-8?B?eWlnZkVKOFRVZjlJcEZYRGxPQklDbmUrTS8yODBhYUdZT2ZCZWtDSmc2UVRv?=
 =?utf-8?B?TUdRTFlpbm1qdm9qbUpqUktMTmhZVFJpbXQ4REduR1ZMVVlvUmcxVUpTRzl3?=
 =?utf-8?B?NmtMbCt3eDZ1Q0w3SnVPY0o0V3VEUmJIdnZDQ1FkeHlVeU90L2o4bldqbE9k?=
 =?utf-8?B?S0ttQUJNS0dsM1hQT3d3NlpHb0c2dEVoczhkbmx6aDdXb1FjWldsSjlRZnU0?=
 =?utf-8?B?TmtqdVVzbWdMZHNha0x4dnZHODVYZzA0alBwdWtJbENOeUtYZSttRTc5eDR2?=
 =?utf-8?B?R1dGeEJHdXhoYUdKbWNIVElMRlREcUV0MTNmZWVYZW5UU3Ivc0RWVU9UR1Ir?=
 =?utf-8?B?UkZTeFc0WGhqMHQvVFFwMTNtL0xkT2FMUi9CbXppY2x1UVBjZ2U3OEdNRjIw?=
 =?utf-8?B?d2VOZGRPR1Q1NGV5TXpBbFZtYXZhbC83L1RUVWI5aWEyZHNWTytaVWs0eUl4?=
 =?utf-8?B?UmJqeGQ3SkI5U285MXVIOFliRElyZ3JpbzhiOVdnQjJnekRzMUFCbnJtZ2k1?=
 =?utf-8?B?M0lyUGJhWFRuZTZFbVBSa0FrQnNRSWZCZHc0M1ArSmdZMytUZ0JkS0xTeFBr?=
 =?utf-8?B?K3NweXhyR3N5SVozRlhNNkdSUGROeEwzRDd0MDN3N1VBNWtHWUVCVTJFZDVa?=
 =?utf-8?B?ekpCbTFZcDBKRllMMTVIQ1BJMjQ4blQ4d1BlcHF4UVFwQ3VyZ2N2YU9scXVL?=
 =?utf-8?B?T1k1NzR6RFU5amN3Z2JNN3h0alNibjY1UGVNR2o0MjEyWXlwZnUvN1hqRUNW?=
 =?utf-8?B?SWtoM3VxdnlCaXR0bHM1ekc1SExBTXpRY2lqVFI0TkdxcVpSd3p5alNxWDV4?=
 =?utf-8?B?c0w1emxPU2QzNGM0d3VBTXUxUkJyZzdRcURFRVEzUVpqeTBYLzl5MkMxL0d1?=
 =?utf-8?B?YWtwamtNbDRJTlRpVVlwVUs2cFhVNlprS3A0bXZXM0lPN0p5Nzl1RWJ6MCtm?=
 =?utf-8?B?WCs3RGpxc1p6V0N6N0o2R0lVekVXbW1Ua2Fwbk01algrTHNRbkUvQTRmR3Qv?=
 =?utf-8?B?R2JDVUZXaHlrTnRsOERBblcrMFVOc2RHaWNIbXdMYldBL0ZoMGsrRldIcGp1?=
 =?utf-8?B?M3NTQ3VyNG1xTlVaS2JqQml1c2tPalhVaktFcHhhcHdsbW5ZYW1xUHowZlVp?=
 =?utf-8?B?OHRSbHlmaFc0WDUrdDNjeXQwOHRLR3c3OUJlVFZvYm5XektDT1RrMmJjRlZV?=
 =?utf-8?B?bHd5MEFjekM2WEgvRGlEdk4rcG54bFBtaEU5UzU0V2FEd2hieHIyYTNtdWpz?=
 =?utf-8?B?TFFHbjYyYklpUUt4bDJUTDFaOVhjbkZDTTFlRHJuczhYRWMwNk1GRC9LQXhP?=
 =?utf-8?B?aVFYa1ZvNUlRUnhKRWxZSFlJZ1ZJbEk0MWtIM3U4dHNlbWd1T21BS24vUlB0?=
 =?utf-8?B?cXlCbTNaSnpkR0JCWC9ZeE9xVTc3R1FNWUMxTXdDL3BiaHRCcGtOcFR4NXdz?=
 =?utf-8?B?NDg1VDQzQzVLYmpmMUNxU25RRnhTdkE3RUV2M1Q1MWhtSEVsZDRaZjlKNDl4?=
 =?utf-8?B?b3FORzAyUEF6Q1F6MHdib0NNWVNVRXNZbkI2dz09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB8749.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8440
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 8dbaa0ef68354886b545f87b7280b63e:solidrun,
 office365_emails, sent, inline:e63acf9d0091647e1c4ec6a3b065751e
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D11.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7a273927-fd63-4b9c-cf35-08de25d4f1f5
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|82310400026|35042699022|14060799003|36860700013|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGNET3NUNUNPRnBLMVdZVm1DYlJ6ZEUyR25KZUxaWm9iTFBhU0F4eStmakI2?=
 =?utf-8?B?RzlCYkdMak5yNSt0V29seHAyY0hFZElHbE0zUm5zLzdKMWY3VjQ2YlhCbThR?=
 =?utf-8?B?cFJDdWMvbkcwcE16MnpvSHNmYmVOTWlhOVAzRkJzeDdJQUp0RkRmUGl5S0cy?=
 =?utf-8?B?U2ZMbzhGOGlOaXlKYVNhRXdpWG5rdzJMSnZWbVpSOHZxN0J3aEdHSGFrQTAw?=
 =?utf-8?B?dS9HeDJ4ZDhUY2N0bUlmTkpoTEV3UjhzQ0ZNRmtpL2V2VkhIRXpRK3k5ZzdT?=
 =?utf-8?B?dUdQV0pwWDJKMTdsdHJyYXd5L0R4b2lxcVh3WDgvR2VzbkVDYW50U2pKa2lk?=
 =?utf-8?B?RmpmeS83YStWd3haOU1uMFhLRnJRc01QWGJMVDhRZEhJZmp0V0kwMjd1OXIy?=
 =?utf-8?B?MmQvYWMyZHZxMWlNZlhqQ082aU80ZFIrQUpJb3ZaU3luME0wdWRFOTFkZ3Fo?=
 =?utf-8?B?eHMrMDZSc00rL1hvYklONitxc1BndU9YTytpSzQzT3U5cUlpYlhrbVprcjdp?=
 =?utf-8?B?dnRXTnJDa0s4K3FEREhLNkdDdnB0NVphcmR5dWsyeTVOVHo5dlFUVndIT0Vv?=
 =?utf-8?B?L3BPakhyOUZZUTBUMUVYMjVJYXg2c0VnNzU3Uzd5UlREalpQNVVLa05tR3lL?=
 =?utf-8?B?WkNNdXRYL0hrN1ZvSjlHcXNZOFpYa1VOQUVYNm14V3BPRkNMa0tBOFJTMDNY?=
 =?utf-8?B?UXVJRm9JeDJUcUZrQVBLSjIwV0kwQVdtTFIzZFdpVmdCaXo5Z01nQW1IVUhQ?=
 =?utf-8?B?QmhsclhyUFo4bTN0SVB5elg1SmFONFAxZGlSaHhpVDBSTjFieWZBdTZ1S0g0?=
 =?utf-8?B?ejh3UGltSVJJUjB3ZFZZVy9oamFJQitNamZpd29aVDVDTnlmM2pJWXRNNDJ0?=
 =?utf-8?B?d3c1dG14dURTV2ptZkRQenhWdDZSY0JnZ3FhSXpLdWxXQnVBTzIvYjdRbkxX?=
 =?utf-8?B?RlU5alQ0dVZYRjM3RmZ6VUZuRzFveVBLQTVvMDROTVJraVFMWmw5YzB5S1Ar?=
 =?utf-8?B?SndzRnp1OWhoMFFBQlpuR1U1NnVXb2U0YVJQQkJnZCtRL0pKdk1XNlpwWDZV?=
 =?utf-8?B?b1dvcUt2c0h0TEpLUkNGVjhYcFhoK2duYmFYVkVqWm5zdG5oTTNrQzAyeFF4?=
 =?utf-8?B?K3d0YmlxSUExeHFsTEdvbDdoZjJxNlFwL1hqSnRYSGNaQXZ2UURzVU1tMVky?=
 =?utf-8?B?dnRiSlgreTBwYjVRcDIySS80ZGkxY2g4SWdYUVM3RStBeCtxZnhPVVFDb2NQ?=
 =?utf-8?B?NVVDVzY3YUhkcXJZZFQrRWdTNkNJSXROM0FFcitjLzgvYmVnUVkvdXUraDZa?=
 =?utf-8?B?c0xEdEh4VGJ4Nk9PRWQxN1RONFBnWlhkMW93T252TEp6eG9lLzFhMzRnSWpE?=
 =?utf-8?B?aUxrUHcxaTkvNDlsbzNrMC9QN3hMZk9oUU9HRVduNVNxekw5NnNyajlaRnhw?=
 =?utf-8?B?Y1IwUFh4ZUYrZjJkMjNyS3RPVG9BT2dQRXZOOUJ1VmpESjQ1TmxZTXpnNFdi?=
 =?utf-8?B?UTFBZk9Ib3JVeW1yM1E2NG1uZU9IRWROUDVmQUo4WTN0d2NUcXhXR3FCVXhS?=
 =?utf-8?B?dXpWWnhkSUZkRSs1bE40c21kV0xUcVk2Y1NJUTZURkFMdDlUalYzN2NueXE2?=
 =?utf-8?B?YktvWlcvQXNpYWJHczgzRGtUaWlUYTRuL2RrcHg3aEZYeTVZaTdwaHNkZWM4?=
 =?utf-8?B?SCtrYzFCUGdqSi9mNWljVThYcVlxNEhpRTUrT2xzUXgwcXFsZXU4QTJiNThD?=
 =?utf-8?B?d1FrbkY0K3VUek43SkFhbTlWSEswekJ0ajhSdUNIRXcvaDhvNDB3bkxsa1dm?=
 =?utf-8?B?UWRSVFo4NngzOS9DdGZYVTVOOWhUMlRSNGhsaXVMRmFoZksyTmRmTTBCL29K?=
 =?utf-8?B?c3c5MStvdGRYeWNRQlI4MmUwV0p6TGNCK2daNy9CcHJob2xGQVVMZzhHNUx1?=
 =?utf-8?B?VEo3UmttZ1dseVEzWjF6Si9KYW1JUjZhd3AxM0JRUXNXOWh4ZVZrazRpR1ZU?=
 =?utf-8?B?WTNWM2NudFlaL0xPYjBxbW9Vayt0Wml3YTk3UldEczFFNThQVUFkakpCQUdO?=
 =?utf-8?B?RHA2RTdyU21aNDh4NnRXRGpqL1IxNmxkSmFPbU84MkFMbHgrNi9DbXFLZklw?=
 =?utf-8?Q?H0e5iZGSccmrqLZF7w/fwEr19?=
X-Forefront-Antispam-Report: CIP:52.17.62.50; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:eu-dlp.cloud-sec-av.com; PTR:eu-dlp.cloud-sec-av.com;
 CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(35042699022)(14060799003)(36860700013)(921020);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 12:29:47.0894 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b30ecc6d-0ac7-49d4-24bb-08de25d4fecd
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82; Ip=[52.17.62.50];
 Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D11.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8386
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

The ronbo-rb070d30 controles the various gpios for reset, standby,
vertical and horizontal flip using the non-sleeping gpiod_set_value()
function.

Switch to using gpiod_set_value_cansleep() when controlling reset_gpio to
support GPIO providers that may sleep, such as I2C GPIO expanders.

This fixes noisy complaints in kernel log for gpio providers that do
sleep.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 drivers/gpu/drm/panel/panel-ronbo-rb070d30.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
index ad35d0fb0a167..c3fbc459c7e0d 100644
--- a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
+++ b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
@@ -54,9 +54,9 @@ static int rb070d30_panel_prepare(struct drm_panel *panel)
 	}
 
 	msleep(20);
-	gpiod_set_value(ctx->gpios.power, 1);
+	gpiod_set_value_cansleep(ctx->gpios.power, 1);
 	msleep(20);
-	gpiod_set_value(ctx->gpios.reset, 1);
+	gpiod_set_value_cansleep(ctx->gpios.reset, 1);
 	msleep(20);
 	return 0;
 }
@@ -65,8 +65,8 @@ static int rb070d30_panel_unprepare(struct drm_panel *panel)
 {
 	struct rb070d30_panel *ctx = panel_to_rb070d30_panel(panel);
 
-	gpiod_set_value(ctx->gpios.reset, 0);
-	gpiod_set_value(ctx->gpios.power, 0);
+	gpiod_set_value_cansleep(ctx->gpios.reset, 0);
+	gpiod_set_value_cansleep(ctx->gpios.power, 0);
 	regulator_disable(ctx->supply);
 
 	return 0;

-- 
2.51.0


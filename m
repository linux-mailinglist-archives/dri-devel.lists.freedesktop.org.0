Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8DEC148BA
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 13:11:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DFCE10E0CA;
	Tue, 28 Oct 2025 12:11:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="FkGsHQc1";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="FkGsHQc1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11021103.outbound.protection.outlook.com
 [40.107.130.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C393510E0CA
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 12:11:35 +0000 (UTC)
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=WYL3DY07+KZOWL1cuYKAYaA4+JcBpV7PtXAG8zRFNkSNuvg42XvPgFU5wwKwwBB9Kb+/IJF8D5nw/yaHjNkijwbqFstUbTo51/gDIx1QgbIHpB68zS5t7eFvtZ50iAXirN7GYo0Kd3l270kalhFkAqeKqrxSNB0TqvcYL2uaFV3qFO4Opl2arcr706hIzQJY3DjzZbkpblJ5OJ9GQ5VL5eGrksLdPdUIx7qSNbSuoQ0ZnXCPTpG8PvYI5XUfbpit2Gy4lNKySJ4pS8LZQR/gaEMiBQGkJwX6Y/pOciyCSdhcMkU7AcjasiOdrSKpVf9CXFRXLWP0v/VFVIOZHAxr2A==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OufEV9bI3zaiGrCbDrvyEkhGfRdlMhGF/EcXL5azGm8=;
 b=g6DtOyDkbasgeI6nRV5mopFSKRIXpptRLz6Maj0LHmc9865RIEqtK0U7OlPnG163UtppgWa7r4tDjejslDQGweVfcHYI//+pY43+uc69uYJYJA3UepFqmW21g2W+hlRMvKic0Ub+V5uFHrWS8DKjIc0a5NNF5OAqDg/9AohlHNzKwjqMmKthEF14DJfekM9EX18QeZqjnNXvi3Q9pCBC+M6Qgw2PZrUdzK4AX9ZAnDZunr8z2Ghg1rCxNXSrbMt5Zqb0Jus0CQkYKgLI+lvIc5N1N8t0HzI7cSt/GkhV6odC68K0fZTmqDLHgTDhgu3S7+LHyvD9chyZtiCI9yk+4Q==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OufEV9bI3zaiGrCbDrvyEkhGfRdlMhGF/EcXL5azGm8=;
 b=FkGsHQc1mPtUUwFuN0DikaZvmafwOoywy3V+jECoL5L7fyaxWN6TNe3D5NpbeNoT7k0ef/k5PL+bmMo4cAnYK+nQEx6NI8/v/Orjsye0vS3uGCPsf5rRnwKux359usrEcyMhWIiB19Y/QOR2lR9g0kO2/roLcoyaEbjLGIJxIKc=
Received: from DB8P191CA0002.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::12)
 by VI0PR04MB10461.eurprd04.prod.outlook.com (2603:10a6:800:216::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 12:11:30 +0000
Received: from DB1PEPF000509F1.eurprd03.prod.outlook.com
 (2603:10a6:10:130:cafe::fd) by DB8P191CA0002.outlook.office365.com
 (2603:10a6:10:130::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Tue,
 28 Oct 2025 12:11:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF000509F1.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10
 via Frontend Transport; Tue, 28 Oct 2025 12:11:30 +0000
Received: from emails-8536015-12-mt-prod-cp-eu-2.checkpointcloudsec.com
 (ip-10-20-6-148.eu-west-1.compute.internal [10.20.6.148])
 by mta-outgoing-dlp-431-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with
 ESMTPS id B3BC280410; Tue, 28 Oct 2025 12:11:29 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1761653489; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=OufEV9bI3zaiGrCbDrvyEkhGfRdlMhGF/EcXL5azGm8=;
 b=Y84jV9fLddI1xdFb0mR4xg4ZmD6BYv48iXazS1pSPMQ7U2rTVAWTJPH2WpYQMDA/KEg0m
 4pCRUJohYpYPN4EGtpDn59kCHkQPWCEfgFQdnxYvpRqCnSu8APjmq8AFRznElmwZE9TolQX
 xsBk4jmMUhwq04B4/Gyo7xkw2NtNN/Y=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1761653489;
 b=YoyLf5CUX4KrE8N7HiF4lg4crmozxphzXRQZUqR3x5refaVCcpMhTUAkt9cXLeriy3VUF
 B2rani1ZR2J+ZW/qCLSdN5jvXXaNpeMwSUcRK9+/oHaz+77gYvUlfW1uTGIYStgDj6mCemd
 s3ljbF4XtA6eSmPUEdBff9WiHdF95dA=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xtuDGwnSEKKIQu/mlowBuqq4k5uihr0x2lRiaOzV9zv0LHI74hVHnxJoNbN2Aay1Q6NEwZUJRwWCx+eSDj4GCgDiPVjGFGFtiTzYIrSLNtoEemJ+U6kw92YtGVHZdSRDdtgmWHcsITq5vrbLh0eQ+koGnNH42oHYI8YQJdMaBfVCbcHEGfmXPuHOmiyvcCU0JHWXAEPrFY1ye1oux4mXVqJkgBNjpsqlXk0s003GNmmfiQDJo7EM6cqFrp2JgbL9Gbr34x+WWpAclcDrdatjlt2kUURsvRrVrpXPqLr5jWs+dnMx5pMpqe+InMvrSmrWGvYbQS96mb/iZCXXMbtmrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OufEV9bI3zaiGrCbDrvyEkhGfRdlMhGF/EcXL5azGm8=;
 b=nqqyYStcY+LPspffPohmsWzHfWO0FdrH+wtSReggobgX8Hq/Viqcidqam+QWY6LLX/R6vXksKDxng4zi5rCYSSQ0bPbHvsfpaQms/t8EtmjNeEuc7yS/Hr+j1lmclhgzegLSujVsmlvu4pMUNRXdy6yFU/F8IZO2/Aa6vizNlZyJh9MNOjeeglp4P8M6fpox4EMMb0S9jcCUD5PjgH8NTx6YkDCzFUNAna4YN2oTDNU5INyCuuGzhBKcvxHyDi4JCsajgXehfsI414gG43IQtCJ2SSe2aKkDODNLFywzfDlWiQK6j+gly54+Lb/DNi8hkQWiooTAxBPu2tQEuy/QcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OufEV9bI3zaiGrCbDrvyEkhGfRdlMhGF/EcXL5azGm8=;
 b=FkGsHQc1mPtUUwFuN0DikaZvmafwOoywy3V+jECoL5L7fyaxWN6TNe3D5NpbeNoT7k0ef/k5PL+bmMo4cAnYK+nQEx6NI8/v/Orjsye0vS3uGCPsf5rRnwKux359usrEcyMhWIiB19Y/QOR2lR9g0kO2/roLcoyaEbjLGIJxIKc=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DB9PR04MB8074.eurprd04.prod.outlook.com (2603:10a6:10:24a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 12:11:14 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 12:11:12 +0000
From: Josua Mayer <josua@solid-run.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>
CC: Jon Nettleton <jon@solid-run.com>, Mikhail Anikin
 <mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 09/10] arm64: dts: add description for solidrun
 solidsense-n8 board
Thread-Topic: [PATCH 09/10] arm64: dts: add description for solidrun
 solidsense-n8 board
Thread-Index: AQHcR2nmzYy30O9qxkaygJNRRLOQI7TXeRGA
Date: Tue, 28 Oct 2025 12:11:11 +0000
Message-ID: <42565325-6626-4b83-ad08-7c014234a796@solid-run.com>
References: <20251027-imx8mp-hb-iiot-v1-0-683f86357818@solid-run.com>
 <20251027-imx8mp-hb-iiot-v1-9-683f86357818@solid-run.com>
In-Reply-To: <20251027-imx8mp-hb-iiot-v1-9-683f86357818@solid-run.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-traffictypediagnostic: PAXPR04MB8749:EE_|DB9PR04MB8074:EE_|DB1PEPF000509F1:EE_|VI0PR04MB10461:EE_
X-MS-Office365-Filtering-Correlation-Id: ee7754fc-56a8-4511-f2c0-08de161b20b5
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020|38070700021; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?aWVlT2EzcCtFLzdPWUlYMGtEVzhaUGErdHkyQnJNdzdSREFwc1lNVWpSVnZm?=
 =?utf-8?B?OXdOL25IN29veG95NzRZTVN5bmlQbWE0dXprR05INjFFRWd0d2VEUzQ0d0tQ?=
 =?utf-8?B?NTArZEdkSXBFZFlQNENPVzloM0Fmdnh6UCsyK0JDQWpLdXA0bVJYL056OVln?=
 =?utf-8?B?bnA0ckFVSGNDN2RNbzZHdWIrcFZialp2am1RYndNL2o0OFZRMnpyUUhJbFNp?=
 =?utf-8?B?SHFPLy9YYUZMZFJlKy9MVTU1NE8rZDBWSUZhVDZGMXFQNDFrWjE4RFJzUUVW?=
 =?utf-8?B?MWdMbmVuY3gwWVBFYUV3UXY1WTVBREg3N1ZuZzZuUTF2UG5QV0VwWWk3cnNn?=
 =?utf-8?B?bXplK3c4amQwNXVXN0w2bWx4Znc0R2QrTnBjWThUMW9uQWFhZFhLN0tZaVBy?=
 =?utf-8?B?TlF2UUpkNXEzK1BtYzJpdnJYTnBPTjNrZFo3c1h5dkd1a01XczBDOWd3dGRT?=
 =?utf-8?B?NFRoVHVGcVBPRW9tYXQ4bFZLNEQ4UFg1N3Faa3lKMVZTVHhPbWhDZzZjRk94?=
 =?utf-8?B?ZlFpQ25FWXBGOVdaRnZ2TWh4ZW1iNVNiSlpWbDJoTVBiTTBMZ1ZpNzlxV3Ro?=
 =?utf-8?B?cWtZT21lTklIZG9taXh0R1hvQ1V1aUc4ZVFZaXVLTzdKaFNtRmFVUUxtMDJE?=
 =?utf-8?B?R05QWHFZMEcxK1c3TGo2dVJFc0o2SHJHeW5WeEpZMTBYcmZ3QzkwbElyR3VU?=
 =?utf-8?B?b1A1VWVzbXlQYi8yOC9QQmhrQStUM1VNR0I5NW9oZndsRDFsZXdMQU9SNWJx?=
 =?utf-8?B?eW9vKzdNOUF4QkQ4K0pGSEtPOHRXQWFaTzUvL215K3AxR3AwbHJCM0Q2OVRz?=
 =?utf-8?B?Y29ONkExMXRFaldXdkx4cUJpVGdXM25LV1FleHdSL0pFWU5WTkxtOXc1SWNH?=
 =?utf-8?B?NTVoK1RHYXN2OWczaUpxSGlaTlJiNDNvL0hhMERCWWZQZzdtNWpyME1ONG1o?=
 =?utf-8?B?Y041c3FuZlhDcHpFQXZuVTlTODdhR3g1MG5NazhhVmdhSFhURXlHalZud0N3?=
 =?utf-8?B?TmRyMnNXTTF6cTcrR3pjTjI2NkJER0FFVDdwOC9GMTE5U0RLUXBjMWJjZ2d4?=
 =?utf-8?B?ODZZZzdaclNQSnJqVUNSMEtNRUd1bHZwYjN2YXlvZTRmaWZFR3o3NnNBYXU2?=
 =?utf-8?B?QW1nWkRqMnEyT0s1bjFOaHZoVTNKOFFPL2UyVWNZcUQ4aHZRRHozNTJSUG1W?=
 =?utf-8?B?MVorNWUxZjJwZVBwZW9ROVo5dC90WXVCZ0xuc1BTeWxibUJoU2tML0xLN0w0?=
 =?utf-8?B?WjhiRWIrdUNrTGJ1bG0zSzlSOStNSllmUkN5Z3cybytLOFRRbFN4M2hTdytZ?=
 =?utf-8?B?M01sUWhBeDE3d2dUUEREYlcxRUFKc2tZWkJOYkxnQmJVbDdOcTA2dEl0TWdi?=
 =?utf-8?B?S2hjOTJRREhLNUEvQkM2VHZzZlZyVWVqVTdmRnp3SmdKVHJselFjMU0vZUdE?=
 =?utf-8?B?SGk2bko0NFlaMmdLUzlWQjN1eSsva1pnYUVENDVmSWU1aS8xODB2dXlkc2Nx?=
 =?utf-8?B?RzJiZGx5QkU2aTNENnNjbVo1MkpPUENNL2ZvaStuVkkyMlp4V0hMSVQwUThy?=
 =?utf-8?B?akkxWm8zZXZYdmlDRjhLT3kwOVMxb0Q2WDlkMkx1c1Y1SHFJTTBoRi96bHFp?=
 =?utf-8?B?YnFGR0NGeDhkeEppSWFKYmRwVEpySDkzaVF4R1RmVWdpOTFVWks1UUd1Z1d1?=
 =?utf-8?B?R013MGU4QlpiQUp0dEJQblFNZkJZNzF4cXcwUHdxdmJ4aEVIYllEVi9vT2Vq?=
 =?utf-8?B?cFFUY3hPVGRDT0J3SUpXbDdOQXFGL0w4c1k5Rmd2N21id0pTV0syVjkxOGFt?=
 =?utf-8?B?WHZuSGR1RTVlQUptYzJ2OE80SzBHcGNXQ0xaYXpBbzVCZ3hUbkRLcWdlbVFh?=
 =?utf-8?B?cVExakhkZ1JjYjBPeEczSGFkRGwya0VIZU1OVjVhRW4xemJ5U2d4REdyQ2sv?=
 =?utf-8?B?Y0Z3eE1lYk5FY2s0T2ZZRTQ5T1k3MXZvRkxkbmpnSS8zemdmQ3R6cmFhVmEv?=
 =?utf-8?B?cC9YZHJ0Q1lOVUZBRHRGSXlXZERjZDlZNFFHWnZLL2ZvNDVuZGgzRzVUODJN?=
 =?utf-8?B?cytiSFhEMGFYLzBrdUIyY2NobFFHd2lEYytadz09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB8749.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(38070700021);
 DIR:OUT; SFP:1102; 
Content-Type: text/plain; charset="utf-8"
Content-ID: <A21C2848656456489C5504574752AB08@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8074
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: aeb29bc9e51c4f1a890b1b086dbb6670:solidrun,
 office365_emails, sent, inline:d2f983e1515754cdab4444136324b4c0
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509F1.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 52715506-d6aa-4a6b-a1f5-08de161b15f9
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|82310400026|7416014|376014|35042699022|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ei9BWE1VTTR5eFBPTFZuSG1PY29OdUdNN1Y4aW9JSDhCaSt4VzRndUpybkJE?=
 =?utf-8?B?blBYTXNHTVRGSEo4dnVtYXVhcU9tZFc4OWVYd0IrdG84U1oyTFZoNHpQcFBO?=
 =?utf-8?B?UkJrV1JMbEU2NjNXM1prWmV0NFlzWnNuc1hCTkVyUXNRZnk1NkhoS3JPQVU0?=
 =?utf-8?B?N0l4OGF0MHFwLzlqSXFBRXczbyt3eUEvNEtyaXdrdFhMQmV4OTJvbWNLcm4y?=
 =?utf-8?B?L3YvQ1FIN09DNFExcUVOaW44L0NwV1FXbEpTc1NpTnNURmNRbnI0TVhFUDZO?=
 =?utf-8?B?MlpFdnl3R0hiZ25Hb0V4T1dDSlpMWGtNQ2R5NERsdEpxVGRxR2wrWXdUeTBv?=
 =?utf-8?B?cDlmdjRiVEsxUm1DS2hoWDNaeHE0N2tOTllxeXgxaUxhZGl5SGgvODhraG1o?=
 =?utf-8?B?WXFkaGpMTWxORTJ0SmU1Yzl2SFptdHVYWHdUcXo4V3NxYlhsTXdTb3hMVVY1?=
 =?utf-8?B?ZklqbjdMZ1hYTlhWcXlEK2lEc1h1cHZQbUFzKzBvSnlaMU54VGc3cXVrc3B1?=
 =?utf-8?B?aVdPUXUyRlNLT1VrUFZpeXViTXg2blZ5Y2RITWs5dnRoNzVNWXVqc2hsZzZF?=
 =?utf-8?B?VzVFYWxUY0ZtSU12aXJNZ0FnWjN1VERRYXo3a3E5SHdwN2FHSWluVlY3UmRY?=
 =?utf-8?B?Tk9DelgwLy9oTmhpcFpmcEhNMndNcW9nSXFLUi9Hc1g5NGpNelNTbnFjQU9u?=
 =?utf-8?B?TUhJREJHR00vbFEyWFlBSVllRjBJUWZIS3duVkUxWVpkVmdhT3oxQVpRdzNJ?=
 =?utf-8?B?elRhT3pUa1VJY2dtaXMzVUgxNUVmQVZ4Q0U3bVREUk1aeEZHUndRdzhUTWFH?=
 =?utf-8?B?M2FIZnNQUysveXhGdWZlNkpNZG9LOTNBVmRPSzRFUXhhZWw3ZXllVENTdVF4?=
 =?utf-8?B?NEplRmNMMmpWVG14WU9BVUlmTCtxem9Qc3Y2dklzK2tubjI0eDZ3QlJoY1dQ?=
 =?utf-8?B?aTlTTjlmR1dQUCtISURuTjJxai9RLzZZbVlDcFZoMEgvWGdOWm45aS9aa1Bw?=
 =?utf-8?B?SjArSFJHVWtrb3dnODFkTGpwZzh5YjBMdWNPV0hudUg5NTV1SkRuU052dlho?=
 =?utf-8?B?b2FjdVlqY1cwQ3B0R2Z0NTVHVW40MlRnak5GMGFDOFkrRUJGNlpjUnFxeStS?=
 =?utf-8?B?MGVyVjViQUJJc05WWUVJV2NJaFk3aTFnWmFCMjNUL3VTTEkveTYvWndNRHIz?=
 =?utf-8?B?anB6WU1jK2pvR2YyQi9UbE04Z05vWDRjYVlqMlpwTThnbVZwSjhRS1graU5I?=
 =?utf-8?B?SXFSUkZIVmpFcUhoSzlvNzlWTEFkZm5aczZsZmRpYUhtcktLL3lCTVY5TVlJ?=
 =?utf-8?B?NytucnVNYXhGSkdNK1NrVkZKMHBQckFIeHFLME1La2tPL0o2aUJIVEdpOTc0?=
 =?utf-8?B?N01SZmYyVWxVcmtQclVVT3BoQ2J1djJYeUdybXdxNEVXSnl3WXBlaTByS1kz?=
 =?utf-8?B?VG5GU1BLUktRUjBuelV3NXRxL3RKUytSWHVlR3dORHZoY0R6Z1h1d3N4d3dz?=
 =?utf-8?B?SlVUZlQ2UWc4dzdVWkRvSkJHdjcyZ2JPM1FCSDRQNVh0NlZYSzZ6aW5zVHpM?=
 =?utf-8?B?Ry9nUFgwMktyNVpwSFJJODlXTTdlK2t0RzB1VXI2ZWoxM3l4ZXB0U3lNYks1?=
 =?utf-8?B?K3Z2bkFING5Ya1p2bHJ5R3l2MVFHTjJCdGNiVGJ1UXJUUGs1Q3BLbTNyT2ZJ?=
 =?utf-8?B?SFYvMjNKUkYvbmVlTUNyT3cwQ2YzQ3ZNK0o4S0RTUkJpSGQvdXE5U0gzYU1T?=
 =?utf-8?B?UTBkeEFFVDFPZUxmK2hHVmd5bm8wby9SWW1UWWxZRm5aODRLWGhTTlhNbTFY?=
 =?utf-8?B?YVR3bmQva3ZOMk9aQ3ZuM3MzNldhRHJzeFg0clNCVllTMGk5OG9DcC9FMVhT?=
 =?utf-8?B?aERET0FueE5LdXJudVU4VUxWSk1IdFRwUGt0ZHdOSzh3cmM4RWNsNVRCU2M3?=
 =?utf-8?B?UCtDZDFXL3Z2Tm1MeXNWWkhsclptUEl3QmVTVVRWRGswTUtoVklRTGNIZlNY?=
 =?utf-8?B?eS94V1JHOFpHNWdPYXQ3RUM2cHlUaTBXTVZ1M01nVUNSTjcrQ1pncXlYSnVk?=
 =?utf-8?B?MnhlOW1WOFpzaWNKVG9RVW1RckNaV1RQd1ZuVndoUkNmSGpZRytEUjI4QWVy?=
 =?utf-8?Q?TgzvMfQSorL1mXfXapKAY0Em1?=
X-Forefront-Antispam-Report: CIP:52.17.62.50; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:eu-dlp.cloud-sec-av.com; PTR:eu-dlp.cloud-sec-av.com;
 CAT:NONE;
 SFS:(13230040)(14060799003)(82310400026)(7416014)(376014)(35042699022)(36860700013)(1800799024)(921020);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 12:11:30.1486 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee7754fc-56a8-4511-f2c0-08de161b20b5
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82; Ip=[52.17.62.50];
 Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F1.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10461
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

QW0gMjcuMTAuMjUgdW0gMTg6NDggc2NocmllYiBKb3N1YSBNYXllcjoNCj4gQWRkIGRlc2NyaXB0
aW9uIGZvciB0aGUgU29saWRSdW4gU29saWRTZW5zZSBOOCBDb21wYWN0IFNWQy4NCg0KZHJvcCAi
IFNWQyI6DQoNCkFkZCBkZXNjcmlwdGlvbiBmb3IgdGhlIFNvbGlkUnVuIFNvbGlkU2Vuc2UgTjgg
Q29tcGFjdC4NCg0KDQpAS3J6eXN6dG9mIElzICJkZXNjcmlwdGlvbiBmb3IiIGltcGxpZWQsIHRv
byAtIGxpa2UgaW4gYmluZGluZ3M/IENhbiBJIGNoYW5nZSBzdWJqZWN0PzoNCg0KYXJtNjQ6IGR0
czogYWRkIHNvbGlkcnVuIHNvbGlkc2Vuc2UtbjggYm9hcmQNCg0KPiBUaGUgYm9hcmQgaXMgZGVz
aWduZWQgYXJvdW5kIHRoZSBpLk1YOE1OIFNvQyBhbmQgY29tZXMgYXMgYSBjb21wZWx0ZQ0Kcy9j
b21wZWx0ZS9jb21wbGV0ZQ0KPiBwcm9kdWN0IGluY2x1ZGluZyBlbmNsb3N1cmUgYW5kIGxhYmVs
cy4NCj4NCj4gRmVhdHVyZXM6DQo+IC0gVVNCLTIuMCBUeXBlIEEgY29ubmVjdG9yDQo+IC0gMUdi
cHMgUko0NSBFdGhlcm5ldCB3aXRoIFBvRQ0KPiAtIG1pY3JvU0QgY29ubmVjdG9yDQo+IC0gZU1N
Qw0KPiAtIENlbGx1bGFyIE1vZGVtICsgU0lNIGhvbGRlcg0KPiAtIFdpRmkgKyBCbHVldG9vdGgN
Cj4gLSBSUzQ4NQ0KPiAtIENBTg0KPiAtIDgwMi4xNS4xIHJhZGlvDQo+IC0gc3VwZXJjYXBhY2l0
b3IgYmFja3VwIHBvd2VyIHN1cHBseQ0KPg0KPiBUaGlzIGlzIGEgaGVhZGxlc3MgZGVzaWduIHdp
dGhvdXQgZGlzcGxheS4NCj4gVGhlIGJvYXJkIGluY2x1ZGVzIGFuIGludGVybmFsIGV4cGFuc2lv
biBjb25uZWN0b3IgZm9yIGRhdWdodGVyYm9hcmRzDQo+IHdoaWNoIG1heSBiZSBkZXNjcmliZWQg
YnkgZHQgYWRkb24uDQo+DQo+IFRoZSBzdXBlcmNhcCBpcyBub3QgY3VycmVudGx5IG1vZGVsZWQg
ZHVlIHRvIGxhY2sgb2Ygc3VpdGFibGUgYmluZGluZ3MuDQpzL21vZGVsZWQvZGVzY3JpYmVkDQo+
IFZlbmRvciBCU1AgdXNlcyBncGlvLWtleXMgZHJpdmVyIHRvIHRyaWdnZXIgc2h1dGRvd24gb24g
cG93ZXIgbG9zcy4NCj4NCj4gU2lnbmVkLW9mZi1ieTogSm9zdWEgTWF5ZXIgPGpvc3VhQHNvbGlk
LXJ1bi5jb20+DQo+IC0tLQ0KPiAgYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvTWFrZWZp
bGUgICAgICAgICAgICAgfCAgIDIgKw0KPiAgLi4uL2R0cy9mcmVlc2NhbGUvaW14OG1uLXNvbGlk
c2Vuc2UtbjgtY29tcGFjdC5kdHMgfCA4NTIgKysrKysrKysrKysrKysrKysrKysrDQo+ICAyIGZp
bGVzIGNoYW5nZWQsIDg1NCBpbnNlcnRpb25zKCspDQo+DQo+IGRpZmYgLS1naXQgYS9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9NYWtlZmlsZSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJl
ZXNjYWxlL01ha2VmaWxlDQo+IGluZGV4IGQ0MTRkMGVmZTVlNzQuLmM1NjEzNzA5N2RhM2IgMTAw
NjQ0DQpjdXQNCg==

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FFDC3FC6A
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 12:46:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AFC810EA9A;
	Fri,  7 Nov 2025 11:46:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="CxkMUiVo";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="CxkMUiVo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11021120.outbound.protection.outlook.com
 [52.101.65.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E9C10EA9A
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 11:46:46 +0000 (UTC)
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=co8kej3nbofiusx1cI8gilk8BtMUw76LKi6MTCON1VLgViY4H9lyPyKRvC0hGHw7hdB208U94A6NUzEkvuJvO5ZgNMUH+DKM9xAYvaVtSnxn4VtW8QWIqDmrxpTnOmYKjS2YZVFAWlOzTfM2HJprQnoqegwF+WAOEchWPK+4sHTrF0SrmxCdnHBxhBi5O2EPumgBwii8IWTruEk4WOS5xPmJdoZZEAYoBrmiCk7gQJ/5WESRX5EX7ZTcet/wjSXRswxxKDaNopGcCM3Jerms7ItXAUooRPoSG/fl0qAfBwnnWri4mfcjiqeEmoEC5Mlw8N2vlnhbqdo3+ryTHng86A==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K7VA3ImSrHBFW309QQeGCYHsMO3Eu2JJOTCxvyOh9Do=;
 b=G4yppRGWvl4Vx57rRQLN/hWnh5fIYupAldq+k9aXG5xB27+JGAfqcxQ1ueOYqL5DrCATU1Kypoc3GQ39q0LrMer61+fiFNV9ELsiu0sii7Owi/NUvfkRgYxc4HWQe3NrdpLbhWEcXtCgGnNtXTrn/r6pFaeFrR84Cz/Uy9zs8D4NcRyDK1m2eofsgrDE3HAP9sadUDl3zzFFwFEojfYouiQhywErxXwpavdzQJq0sI9bRiA4FbErcmznuAjMW2/j5hGtc2ueUIAYsfa2ZLjT4LojBh0An3BEpniuqUCDip6pTReWtxfhkQKlg51EzyA52m4Mk/V/FlYU2PqdIYRaiw==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7VA3ImSrHBFW309QQeGCYHsMO3Eu2JJOTCxvyOh9Do=;
 b=CxkMUiVoB9/o95AriI3oACAbOzNW+OCTM/UcyCFcPOntfz5Pgw+swyUTQozts7/rQWJKRfKH5T/WfHk3M/FIdEBQHSiYizc4XS5uUElIxxUlP628up6W/t44HZoeWywdMz+Y2Dr4K1yDf0W3PWBt7u5AjNqxwCAQcgATWrxbZZA=
Received: from DU2PR04CA0272.eurprd04.prod.outlook.com (2603:10a6:10:28c::7)
 by AM9PR04MB8065.eurprd04.prod.outlook.com (2603:10a6:20b:3ee::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 11:46:44 +0000
Received: from DB5PEPF00014B89.eurprd02.prod.outlook.com
 (2603:10a6:10:28c:cafe::78) by DU2PR04CA0272.outlook.office365.com
 (2603:10a6:10:28c::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.10 via Frontend Transport; Fri,
 7 Nov 2025 11:46:40 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB5PEPF00014B89.mail.protection.outlook.com (10.167.8.197) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Fri, 7 Nov 2025 11:46:43 +0000
Received: from emails-4647514-12-mt-prod-cp-eu-2.checkpointcloudsec.com
 (ip-10-20-5-203.eu-west-1.compute.internal [10.20.5.203])
 by mta-outgoing-dlp-834-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with
 ESMTPS id 6F93E8065D; Fri,  7 Nov 2025 11:46:43 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1762516003; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=K7VA3ImSrHBFW309QQeGCYHsMO3Eu2JJOTCxvyOh9Do=;
 b=IZXch2KNspK/vlIt2oMeg1waFyvNz/RNW0fFFyPmc/V7pouSr6K7YzE04LgaUCE3Ua+5T
 PuFEUphJat+E0krnlf1HMnZFy1yL+UQTNKHqlNJoPBAM8ZxSzS2saIF66te58nbn4+tgMnO
 HzZUMvTfaEzzAwhdkFZ2YBZ1ZlO+vjo=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1762516003;
 b=lAIN44aQC2MlPT19sAzcN7dobUDtc9DG0Ou3iZvvK1PdE5RFn2GwCDB8Em8wpsRDS1kKA
 kaCai0p/H35fdzou195ydEMKvDU0sEnsR4P0M3etvnvf7+efQskvEvhAZT60ea+/NMSE/qF
 gb/RuRxEjOOYRi6ouefvLfDMgHLf4cc=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L6m513al3RBKVYPqLr5LumwglPjchdCGdef/fVyyOW115n+gsveJQVBjZpnOEc2HCb9VtkOz6AXHBt68xhXyZHdoPpRWQVAPaZXvBKbD0SS6gH1Fvd6OPi6yFk3GyOP4BXBPr1spXVf1uN6a+EUkj+SC+rgVWUvVM1sbs/I0YpuvqXKnWp9f99D90pZRKuyCpZKqU+IbMiWUqHmt2iiJ2vu7Bun9wfsUKPD+XaQ8niECfc+JYpyHmxfbyOrovCZc51ekkQ5PWA2zzsC8Xw5Rah08TeZ7lVtdVCEtTPdqx4dNu28XRDf8QGhzDouRBSA4Ks4458TELEx4icsSMiFM/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K7VA3ImSrHBFW309QQeGCYHsMO3Eu2JJOTCxvyOh9Do=;
 b=MnI1sOJY2Z8DzwKsfuhuFbYfnch+enFIl2jfHo+hnQgdStMP28XShmOADhilhXX7Fi9/kcxuVB7l45Kiqd7KmasA3NMx0lRH1PTcbVvUSzflv+n/DuFlIzDkYfXXHNNY1DD8wSppUOdjzCy5QN1so9vyqMX0tPCjZSSnMb/Q5IJkb3TjaI+Baf07uYK5o6XtWSoY9KzZnc4vfa0VLGh/ZmkBluILR1MTO+1FUcvict3uc8j61DW56f/MyTpoeqMX5/XFYZDY/1PDptaCeKeRjZ4v2Ro1wMC64SbWOLGv+tJgkX+bvgQzAvOfuJ4NNUBg6WSXW79xHlPqSIsPy6Js8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7VA3ImSrHBFW309QQeGCYHsMO3Eu2JJOTCxvyOh9Do=;
 b=CxkMUiVoB9/o95AriI3oACAbOzNW+OCTM/UcyCFcPOntfz5Pgw+swyUTQozts7/rQWJKRfKH5T/WfHk3M/FIdEBQHSiYizc4XS5uUElIxxUlP628up6W/t44HZoeWywdMz+Y2Dr4K1yDf0W3PWBt7u5AjNqxwCAQcgATWrxbZZA=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by VI0PR04MB10095.eurprd04.prod.outlook.com (2603:10a6:800:246::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 11:46:28 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 11:46:28 +0000
From: Josua Mayer <josua@solid-run.com>
Subject: [PATCH v2 00/11] arm64: dts: add description for solidrun imx8mp
 hummingboard-iiot
Date: Fri, 07 Nov 2025 12:46:07 +0100
Message-Id: <20251107-imx8mp-hb-iiot-v2-0-d8233ded999e@solid-run.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP/bDWkC/13MQQqDMBCF4avIrDsliSSGrnoPcWF0bAaqkcSKR
 bx7U6GbLv8H79shUWRKcCt2iLRy4jDlUJcCOt9OD0Luc4MSSkuhDPK42XFG75A5LKiVdqJ0RK1
 RkE9zpIG3E6yb3J7TEuL79Ff5XX9U9U+tEgUaWw7WlLqy0t5TeHKP8TVduzBCcxzHB8Ju8vmwA
 AAA
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|VI0PR04MB10095:EE_|DB5PEPF00014B89:EE_|AM9PR04MB8065:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f159dfb-8778-4807-3a94-08de1df352d1
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?TmNYUEg0K3pUUXo5cGdHYVg0SW04VFBwVVVGVk9uWitiVFZjYmtpME0zdEJW?=
 =?utf-8?B?b0R5REJnSUE5MGpoUW9xMUhZbE5rVnBwbmdNaUFWWEpuOWt5WXh5ajdPQ093?=
 =?utf-8?B?aU4zS0Y2UVNEdUlPMWVtMW1UTjR6Z3hqTGtCcno5ajRSejhpSElLOGpVekhU?=
 =?utf-8?B?MVBadXdEejF3R0dyalZVelJKTnpFYUxGTVoyR0JmYkNDb2RPby9zdzFsVFdC?=
 =?utf-8?B?dDZDYlhzZ1F4Vm9CUVFaMDRwZUJ5SnNIVFg3RGszQlBVaTRBVzM5a1FsNzVT?=
 =?utf-8?B?VW84anZMVHg1bWQ0akZtWXJCdG9NQ0xORmdyWDk5cC9OOFh0U0JKKzQwYkcz?=
 =?utf-8?B?Z2FnR1pScHFZZjhzQVdSNHBSYjdoZlJZV1BMSk05MG15VWhNU1drWjB2QmJk?=
 =?utf-8?B?TXNVYThqcHdwSXp0RzNSMWIyczBVZm11ZGtqeDdTMnlSZnIwZW5Pamo1STJX?=
 =?utf-8?B?S3YwbkFKSUVubm9DQ2hFVFpOQkRkMExQZVFoaFNwTlFjVXhEKytDR3QwY3Bq?=
 =?utf-8?B?MDAraHJ2b2RZcUp2aWNDcUZoSXBRalJOMDh2M0VSR1dMeDFMd1VJZEdzTi9T?=
 =?utf-8?B?WThSU3N4M0FqOHBwdGhHc3I0NHoxZFVNZVlmZXBXR3JnMTNFb1N4aWcvMmQv?=
 =?utf-8?B?eUdhMGtuWE8yeUx6Z3Eyb3JmbXpVOFBoR1R5RGYvMWFXZTRMeTdpaUxBQlhW?=
 =?utf-8?B?NGxDVTJzN2w3VmF5Szh6MFlkZDRFOElXbEhXNWVIdHFYU1Jic2xJdzYwY2Fq?=
 =?utf-8?B?Z29jYlhJN3J0QWpwQnM1TjlhQkNieDFZRzRZS2lPZ0NtZHlUSE90Q0tKLzdq?=
 =?utf-8?B?UTBHU1ltQlVGZ05EQit4K2ZHdG5ZNXFKTXA2aVdBS3plejFpL1JtaWRNOFVy?=
 =?utf-8?B?RWNZNnZsQkU4eHN0YmFHVTVuZ3NCbVZvc0pwNS9SUUEwbW1hMXpvTEpMY1JC?=
 =?utf-8?B?Z2FUZFlNQjRkTGh2ay9aNVJkR3hleWlLR0dZL2dOY1VGWDZRbUJMRXlFNTdk?=
 =?utf-8?B?YkdScERxd1V3SmswemRnRzNIMTJhdHBvY1B1M0s3K21Za2M0SFJMNGQyZk5F?=
 =?utf-8?B?cUdKTjMxSC9Dd2Y2YU5HK3V2REIyOUlMb0VyckRGSVVZaEdxbXFjaXd5L3Q2?=
 =?utf-8?B?TWM1NU9ESThlY2J4UkdoUElxUUpycHZFSVlPcUF4ODJISmlkSEVKbFRDT0Fp?=
 =?utf-8?B?eW9sakt0bGVoMGtUQk1KOFR1NUhRREg5OU43ZzN0bTNoL1NmM3RPYndnUk8v?=
 =?utf-8?B?eVcwVDJScHIwWC9VaFVkWTVobVV5UHhZL01DTlhPR2FjTTVVY0FyTW41amdY?=
 =?utf-8?B?aVNkRWdCbzBBZTRKZWduclJxbmNEVStsRy9HSGloeW5KYWpydVZCWWNKcmlO?=
 =?utf-8?B?eVNwLzNHSTRYMVc5bUh3MWI1UnRidHZ1TklOM20zVmlYbjd6Z0tTaGxXMGk4?=
 =?utf-8?B?UG5UZUxWZUdLbU04M1JVVVVaZktud0lwZHBIbFRsSTdnYmJGNkJUODFxdUta?=
 =?utf-8?B?RkFwWmZjTW9zRVBpMHd1NENUMkNqU29Za1JQeTJTc2hlVkRnc2NqQnFEZUp0?=
 =?utf-8?B?M3RFSmJRZUJsZjgwYitxOXpJVXRTUTFtd3lacUloYUt4bjVLbHhPclNEb1VX?=
 =?utf-8?B?dDdua2JRYTdwbVI0RldTS09MLzNTcFZNcFluU0NpT1JRK3huQ2pwQTdXVDBY?=
 =?utf-8?B?bTFqRlhjZUxOMHNJcEt6bUNaNWVlUkhNaFNBUFhMVC9IS21SZU8vUnhad2ww?=
 =?utf-8?B?cEpkTVdwQmFuQmdsdVk5YkEzSHZ2aU0yTytTbGVVZDdGaHpvK3d6aFJ1R0po?=
 =?utf-8?B?TGFzQjQvL3c2NWd5dC9pUHRGbHp0Nnd5NVpKcjdER2pwTm80OTVkVHJUcHVv?=
 =?utf-8?B?cGJYVW1qaEhYTnIzYlMydTdCQnZneThZVGVZaUpUbk0rSTBuYnhncHhacEdl?=
 =?utf-8?B?UmRudCtqcGJONXRRNFVaV1hIZjFuOFBJUW5vTUsrNGJDdWJITWF5emk0Q1k1?=
 =?utf-8?B?VnprR0p3MW0wSlBFeHFaV2lYd0JXa1FUS0w3aXQ5TFcyUEoxZlBtclpFN3BL?=
 =?utf-8?B?a0VibzJsWjZ5QXRwTHVIU0ZVL0JIc2hqTDM2dz09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB8749.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10095
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 31ead2d8ee0a48ac862b4adf00a964f6:solidrun,
 office365_emails, sent, inline:b46ed4a71357b7288f02988211e896ed
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: ad348b51-0c0c-4f3d-30ac-08de1df349cb
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|35042699022|376014|7416014|82310400026|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OWJmaWVld2tLTmNVTXlRb1U2eEE3YXZwZXcvRVcyYk0yZ3BzYzFpVzlNQWk3?=
 =?utf-8?B?K1owTlkzcTZsTm9XQjBLMUNnZ1lySUdOYWFDcnE3SUNxSXNLekZlZnVEWE5N?=
 =?utf-8?B?dklvUlFiZWg0TTVsSk00ZnJVa0xaci9UN2l3Q3dYbmgzeVU0L0MxNHYwTW96?=
 =?utf-8?B?eDkrYlErc3BtODdtalNtckVZMG9ucDRER3ViZjgzL3p1ZmplTzQwOHFDRlJ6?=
 =?utf-8?B?QzNQTk5ETGF4ZHZKQTNZWnhmZGpuREZDZUs2UTcyOWxsM2NWU2tWalU3VUcy?=
 =?utf-8?B?ZlJpUTRnLzFCY1AyRlNyNmhOUFUvSExGOUtBMndMNi91cjFMZVRhT25HeFhm?=
 =?utf-8?B?WE56d0NYMHZjQjdIems1VkFiVnVZK29Vd3RnMExSRW9aU09RdG1nWCs5c1Q2?=
 =?utf-8?B?T1Qwd3o3ekRYWTRiVmQ4N1lqeitOL2RYVWJHVjJnUlVCN3phVTB6ekdKUkF5?=
 =?utf-8?B?c2s2bzVibjhhcVUrQWdXV0pTVkJkODAvT0RPbnorblpaNGg2OERFUXZwazdo?=
 =?utf-8?B?ZEcwa1Q5VC9XamN2ZVREYXVjd1hUcW1FNXFsQWtwQkNvdVdLUlJEeWdwTWhT?=
 =?utf-8?B?Q1V1ZytZNTNsMTZ5bUhvbk9WeEpTby9uc1FqUkkxeENDeVNLZTBsd213UXU5?=
 =?utf-8?B?YjFYWDJsbDFzaHFISEhVMmlCc3ZwT1U2OHdwVWZDbHk4ZUJTK0hXa1ZFNm43?=
 =?utf-8?B?d0o2eW1ZRitSdUtDSlBTVlBTakZudFU0VXZYQW5sRUROZ2FUR0duUHF1Q2E1?=
 =?utf-8?B?blNNOUJ1eXl6UFdVTjhIR01TYzQ1NXhWNFJYTExmWEVmdUo4N1hUdXN0TjZu?=
 =?utf-8?B?SVFYNDJhVDVHMm5ZbmNEWWdYT3Jya2lWblA4WWs0dGw5a05jcEdhbzNiNHBT?=
 =?utf-8?B?VFVRdGhzZ1lPNHV1dXNRaUsxSHphTzBkU0ZNN2x4L0ZUNUpqWHMxNnF4Y1Jr?=
 =?utf-8?B?N2lwMEpCeUl3RXVrYVpvR28yc056K2xBWFNobFZHSTZiQTdXeFhJRHFhZGQz?=
 =?utf-8?B?WkhzaWs4dXo4dGNVQW1ycXhKSk93aWE0QlZuODBGdmJvWWN6RUNhRWIxZGV1?=
 =?utf-8?B?ZVkzcE5ScmdWeWFUL1NVY2dZTzAwOTJVT2ZCMXJOSENXMVJBQ05vTld1Kyth?=
 =?utf-8?B?ZmJrR0lrMUF3UG5RRUZKTjRnZXExM3BQSER0aFBhemVPdUdWbGkybFFzWklO?=
 =?utf-8?B?UGV0d2VsQklWN1pWYWZ6a0FHcjZaMjYyQnVHaXJuNGZkNGJVU3o3dFhGbmlO?=
 =?utf-8?B?dkxYZGwxNy9GZ2JUWUYyMzVTb011Q3BUdEtEc1pXa2x2Snl3MmIxTHdFaUp5?=
 =?utf-8?B?Ui9GUU9YM2FJMFExK1VEZFZ1RjdTMlE0a252a1gyS1dOK3RiMHU5TXhjdklH?=
 =?utf-8?B?S0t6VHVXZVN4d1FSVTV5c3NXQWVEenJBVzAyTWNWTitIUTMwOGsvcWlPdEgy?=
 =?utf-8?B?Q1kyY09VaDU2a0VYOGNsUlJsaTRFN3d4dHh2dGlPdlJIYzQ2eEtFN2dXeUt3?=
 =?utf-8?B?Y2daRzVONDRUcDh3MVFBaVZhT3Z5SHdCMjZKMDREcWlVT0VrZWFPcDhrS0FN?=
 =?utf-8?B?djZRS1BnZ2ZyM2wzemx4Sm5ad1k4Y0QvTzZ6clBpbFdJLy8zczdXWWx5WFlM?=
 =?utf-8?B?VzZSMEhmeVdxSEo4MFpBVmFNT3Q4YUdOaEJQVTdPSHRaY3o3V2FRZVZ1OEJ2?=
 =?utf-8?B?WTkvSjFVRnIxamtuYU5FbWZ3eHhEVkN3b05HdWlBSklzTWc3MHhuay9aMVNq?=
 =?utf-8?B?M05OaDErTnJ6dzRsZm5yV2JUZWVtSGdVMzJ1UkEyNVNyVjU0Zi9Hb3Z0emlC?=
 =?utf-8?B?TlhFTzJmbCtzaFBxV3pEbzlUMk9sRC9sQWgvN0VkOWNleGljQlIyMGJtZElr?=
 =?utf-8?B?RjM2MUlmYkFIQ2tqREozK1lLNjdaZjM0K0V2aFk4TjhhWmpmYXV4WldzSkdo?=
 =?utf-8?B?S1gyRlFWQ2QrSUlZMzFXR2dSSWxzSlJ3RTJOSC9hZFRValpSZWIweWEydnNj?=
 =?utf-8?B?MTRvZ1FLSnBaZnlQTjRLbWdGUGNETGQ1T2lnTXovQkFNRkZLaGtNVC9EMW1p?=
 =?utf-8?B?aWhpRGRSUit1aFVlMzErbVVDVDlGd2Z5M3p5V0E4UXdIQTNhL3AxYVhiTUtj?=
 =?utf-8?Q?jTF9KtLqX7E6XyntTcbz/nm14?=
X-Forefront-Antispam-Report: CIP:52.17.62.50; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:eu-dlp.cloud-sec-av.com; PTR:eu-dlp.cloud-sec-av.com;
 CAT:NONE;
 SFS:(13230040)(14060799003)(35042699022)(376014)(7416014)(82310400026)(1800799024)(36860700013)(921020);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 11:46:43.6451 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f159dfb-8778-4807-3a94-08de1df352d1
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82; Ip=[52.17.62.50];
 Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8065
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

This patchset mainl adds description for 3 SolidRun boards:
- i.MX8MP Hummingboard IIoT
- SolidSense N8 Compact
- i.MX8MM Hummingboard Ripple

This includes dt bindings and a range of bug-fixes:

- dt bindings for the boards
- fix to dsi panel bindings referncing panel-common and adding port
  property
- cosmetic fix to some  solidrun imx8mp boards for regulator gpio
   polarity
- fix dsi hdmi bridge on hummingboard pulse
- compile dtbs with symbols to support overlays
- gpiod_set_value _can_sleep conversion for panel and touchscreen
   drivers

Open Questions:

- How to describe HX3 USB-2.0/3.0 Hub placed on a USB-2.0-only Bus
  (affects imx8mm-hummingboard-ripple.dts)
- Is "description for" implied not only on dt-bindings patches, but also
  dts? E.g. is this commit subject acceptable?:
  "arm64: dts: add solidrun solidsense-n8 board"

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
Changes in v2:
- fix spelling mistakes in commit descriptions.
- remove redundant "binding for" from subject:
  https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst
  (Reported-by: Krzysztof Kozlowski <krzk@kernel.org>)
- remove one useless comment from imx8mm-sr-som.dtsi to fix long line
  warning.
- change ronbo panel binding to inherit panel-common and switch
  additionalProperties to unevaluatedProperties.
  (Reported-by: Krzysztof Kozlowski <krzk@kernel.org>)
- add dt binding for winstar lvds panel
- fix dtbs_check for dsi & lvds panel addons
- change n8 board dts comment-style in header
- collected ack on solidrun boards bindings patch (patch 1 in the series)
  (Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>)
- added standard led label property to hb-iiot multi-purpose leds
  ensuring consistent names in case lp5562 driver starts using it.
- Link to v1: https://lore.kernel.org/r/20251027-imx8mp-hb-iiot-v1-0-683f86357818@solid-run.com

---
Josua Mayer (11):
      dt-bindings: arm: fsl: Add various solidrun i.mx8m boards
      dt-bindings: display: panel: ronbo,rb070d30: panel-common ref
      dt-bindings: panel: lvds: add Winstar WF70A8SYJHLNGA
      Input: ilitek_ts_i2c: fix warning with gpio controllers that sleep
      drm/panel: ronbo-rb070d30: fix warning with gpio controllers that sleep
      arm64: dts: imx8mp-hummingboard-pulse/cubox-m: fix vmmc gpio polarity
      arm64: dts: imx8mp-hummingboard-pulse: fix mini-hdmi dsi port reference
      arm64: dts: imx8mp-sr-som: build dtbs with symbols for overlay support
      arm64: dts: add description for solidrun imx8mp hummingboard-iiot
      arm64: dts: add description for solidrun solidsense-n8 board
      arm64: dts: add description for solidrun i.mx8mm som and evb

 Documentation/devicetree/bindings/arm/fsl.yaml     |   9 +
 .../bindings/display/panel/panel-lvds.yaml         |   2 +
 .../bindings/display/panel/ronbo,rb070d30.yaml     |  14 +-
 arch/arm64/boot/dts/freescale/Makefile             |  15 +
 .../dts/freescale/imx8mm-hummingboard-ripple.dts   | 335 ++++++++
 arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi   | 395 ++++++++++
 .../dts/freescale/imx8mn-solidsense-n8-compact.dts | 853 +++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts   |   2 +-
 ...hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso |  69 ++
 ...ummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso | 105 +++
 .../imx8mp-hummingboard-iiot-rs485-a.dtso          |  18 +
 .../imx8mp-hummingboard-iiot-rs485-b.dtso          |  18 +
 .../dts/freescale/imx8mp-hummingboard-iiot.dts     | 712 +++++++++++++++++
 .../imx8mp-hummingboard-pulse-common.dtsi          |   2 +-
 .../imx8mp-hummingboard-pulse-mini-hdmi.dtsi       |  11 +-
 drivers/gpu/drm/panel/panel-ronbo-rb070d30.c       |   8 +-
 drivers/input/touchscreen/ilitek_ts_i2c.c          |   4 +-
 17 files changed, 2548 insertions(+), 24 deletions(-)
---
base-commit: 607bcb1e539a7f2b2ba6832ba96fe3ad73b7401c
change-id: 20251026-imx8mp-hb-iiot-525b03beea62

Best regards,
-- 
Josua Mayer <josua@solid-run.com>


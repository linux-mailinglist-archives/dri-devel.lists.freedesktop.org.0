Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B80B7C22591
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 21:53:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E47DD10E8E6;
	Thu, 30 Oct 2025 20:53:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="dmqEmVDL";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="dmqEmVDL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11023091.outbound.protection.outlook.com
 [40.107.162.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 340E010E8E6
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 20:53:01 +0000 (UTC)
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Sw3zb/FBz5xVhe9FTlt9vMJg/BVvo1DEqOvS3eQ28beqTRKp0gcdV92D0OMpuw16k5Dv1/xZYLyK1Nzn9jiGD1nmUBHIvgwDKLGGbGGLdixowG1lNdOmGV1OygFoUU5gSoD0e6OLPhtnTV6qqaK2VTOeDO/vGCGK2Uuw/jLDZxv0UEazMKAQcvekOlp8cHOTUiZAVN1JrJH6Kr/MBy2Ld1CjXSCepFByal5CBs80MhECNmcXEodANHPoMTGERzsS7V8y7tYxnLXtDKDKwysMdd+YpepVkmuHP5TVprDaipCWiAqRm9UECkmwCESEC0qrtr1n0gKaXloSPOEi9S5anQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ClE2biO/aFXl6ubGVR2NMjqnMWwfTRQP548dpDPaQg=;
 b=ihEfJQDOLd3BAAEDSa7Asi8mUdwPNcnz1F3ouhrKofT554KtXREja9LqlMgZxixx8cftX0Jxnp4VAbE9RmUV94VxM2ehUt83GUYnRgebzibGOjvQ7ck4E6xsa2uZUshp07CZ95ulEmqWrJj3EeGNOQLHn61zwCy2sFmvOH0L7ag3C354V+CfF0QFwDlULRF1tYSVh8G97f/85IIFX1tThyE417GTaD8hblCH0t55ZKVRYtKV4rJ7MqnmeMhwLe5QpgaQc4lEVYIbeyESMQ92VQaAnJGayb5zonxZTUaCsk0NBQGbFBL/43BxQJGOS0DAPh2h7nJdaoebWxKeb0xFLQ==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ClE2biO/aFXl6ubGVR2NMjqnMWwfTRQP548dpDPaQg=;
 b=dmqEmVDLmUMT+km0qph2VfhSgkrj5/FW4I348Voy1SnbJ1XcvkdCBlmz4I8Wc1YAJoACr0uOfvYMAGTXjkHCjuoT1jYjrtabNtAB0JveDNyEcSCjFZ84xPm5LS8X8w/+iNOyu+W7rchGNcaUvx3px2CfxT59iMDLJGXp1JA1PiI=
Received: from DU6P191CA0016.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::10)
 by DB9PR04MB11625.eurprd04.prod.outlook.com (2603:10a6:10:607::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Thu, 30 Oct
 2025 20:52:58 +0000
Received: from DB1PEPF000509FE.eurprd03.prod.outlook.com
 (2603:10a6:10:540:cafe::2e) by DU6P191CA0016.outlook.office365.com
 (2603:10a6:10:540::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.15 via Frontend Transport; Thu,
 30 Oct 2025 20:52:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF000509FE.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10
 via Frontend Transport; Thu, 30 Oct 2025 20:52:58 +0000
Received: from emails-6337730-12-mt-prod-cp-eu-2.checkpointcloudsec.com
 (ip-10-20-5-121.eu-west-1.compute.internal [10.20.5.121])
 by mta-outgoing-dlp-834-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with
 ESMTPS id D958280709; Thu, 30 Oct 2025 20:52:57 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1761857577; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=4ClE2biO/aFXl6ubGVR2NMjqnMWwfTRQP548dpDPaQg=;
 b=GVrHMcnSwt6ZMOssoZ1RWJmXsYCPIMLBZjcDoB2/lPANyp2kiphWSM8FdltX648SxsqkG
 U6Jhj0dD8nZyISo4x9FH0Oyd+CVdI2bKrPnoMd1aqfsxwVXV+G9LS1hBUlDfrRHfZqMy2rL
 DX3C8Ay3KNnhhPNwNFHMoWHGJDHsXJ8=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1761857577;
 b=DCrtAPzncf60nnawld0GaLGoqehCmLxj13vGKC4RDlnq7JoO6EQp41wf6XpdN/Wf2r0Ed
 71nomVzuXUNHbONYVPVuFnTmVOASSZgNtZnnOL+UqZIldIttBQYXpkTRvcDVG9bPABeMNH7
 lR+tVtBIy1rPuEtD+Cwy6QizL4Cz2mQ=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b2ywYt9c8LD13uEsOWpkvvC9B7WspVhKUNspJUSqkJzGSvbk/8V2gDD8UStU8ixrIetLmZPJHmE8IRMpsdKs3fQI1ex+zgm4622tQgmDrn1zq40JjuLIo/0o/VnDMh5+F+v3ScgScHp5JxPJ5fOTzeMgB0Pm0hmgFJMcKr9SGgR1znGl1Hjjac7FKiq/B6poT4gUVm7keCyt3tcxGth2aiWxKk4tvuuAGYjfgGv7gDvClkv+V/ZQ9dMzaftz5lUgbFtkSrK9iz9wCI7FAjuiQrLuE3Qmb2Fo0XcYVAmHTBibAgKhd4IDFQMy2WMJVpP5jBXTH3EPG3LN1hAAD8YPwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ClE2biO/aFXl6ubGVR2NMjqnMWwfTRQP548dpDPaQg=;
 b=HT5leTserttaFfgIERSye48sies3ma7/p728V5c8ayDLTENsG6OycY+jWQt0M4lgs1ZGzsc0ZfmMM9FKkXn6ze2eK6uc8DXoAgqtxwh6I9dMjdpJKacN4GByU2jT75fM9a6Zna0yHrbDQbJFk7OQu6qYHFn1jsGvNXpNj76gU+fV9K3yshOxd5CGVkjkUX88RtMrxHNga6aDRPKiPrOWSZIgUzPbqIw4EB3Ov0HSzTBlfUgB/5HaPvo1ovM1S2fKQYB6OKb1STe7b2+3/XbZKmW+kykRlog/Xo0zzyqddenWm+ITPLJdsfrkyNgQO9Ac62nLgkD3biOV3hMI1i0x0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ClE2biO/aFXl6ubGVR2NMjqnMWwfTRQP548dpDPaQg=;
 b=dmqEmVDLmUMT+km0qph2VfhSgkrj5/FW4I348Voy1SnbJ1XcvkdCBlmz4I8Wc1YAJoACr0uOfvYMAGTXjkHCjuoT1jYjrtabNtAB0JveDNyEcSCjFZ84xPm5LS8X8w/+iNOyu+W7rchGNcaUvx3px2CfxT59iMDLJGXp1JA1PiI=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by PAXPR04MB8143.eurprd04.prod.outlook.com (2603:10a6:102:1c4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Thu, 30 Oct
 2025 20:52:45 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 20:52:45 +0000
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
Subject: Re: [PATCH 08/10] arm64: dts: add description for solidrun imx8mp
 hummingboard-iiot
Thread-Topic: [PATCH 08/10] arm64: dts: add description for solidrun imx8mp
 hummingboard-iiot
Thread-Index: AQHcR2nlqzlGSPiPPkOwWeKJPAELf7TbL3SA
Date: Thu, 30 Oct 2025 20:52:45 +0000
Message-ID: <696ce396-12dd-4fda-b51f-0f275b8a64fc@solid-run.com>
References: <20251027-imx8mp-hb-iiot-v1-0-683f86357818@solid-run.com>
 <20251027-imx8mp-hb-iiot-v1-8-683f86357818@solid-run.com>
In-Reply-To: <20251027-imx8mp-hb-iiot-v1-8-683f86357818@solid-run.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-traffictypediagnostic: PAXPR04MB8749:EE_|PAXPR04MB8143:EE_|DB1PEPF000509FE:EE_|DB9PR04MB11625:EE_
X-MS-Office365-Filtering-Correlation-Id: 78f51bf8-c2f0-440f-fe8b-08de17f64e94
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700021|13003099007|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?TUNKaFNoTXJncVBKQTdPbTVWM0tjdHZYYUVlNVc3QlZydE8xWEpzSTVxSXkx?=
 =?utf-8?B?UmVHdDV0ekZ0YUVRazZMZ2hIaEp4TGVFbEJFbHRMZE1Vem5KaGc0TU12L2pP?=
 =?utf-8?B?alhIVExkOVMzdytKbFNiSEdZOXVBRXQ5Rmg5SlhreDhTSm9nQlVwVUdwcXFi?=
 =?utf-8?B?SHJYM0p0S3JEcE92Wnc1V1hNbUQ0YjZuN1ZFNEZJSllEMGNXWGZvN1ZaRGFS?=
 =?utf-8?B?NUpWS1ZIalRMVjZQVklQQXdoaFdQM2liVVhVT0dzVVlxWDYrL2pXNXc0cTZk?=
 =?utf-8?B?YVpydEZBSUpxRVFWczFjNVJhOEhRK05OVmF3MjF1MFExRVdaN3FZWHhCNmdR?=
 =?utf-8?B?VXNvdGNYa0xhdk12Z0VrSTcwRlo4TzlvZ0R0Y3FMVjJycTJ5YktzM0YzZ1FM?=
 =?utf-8?B?em5ESjdDZndPRUVTUkI2cTRWN1hhK015TU44NUNySHN5MXlvWHZJSzRjdkRE?=
 =?utf-8?B?MThMeGtNdVVvd1pQQlNsZy94b1pwMkRYNFNOc2JjaUM2TDJKU2J6UXV4aG9F?=
 =?utf-8?B?ZnRXQ04zdlJ5U25QTzJUbXRremFiWlp2Q2syaXNsOEtoRE9yZ3JBd0FtYXZz?=
 =?utf-8?B?Q2c2ZnlybWpteTFsbVFmVElXbkpZRGppVGZMUXExamVYTFk1ZHJjNWlPREV3?=
 =?utf-8?B?eXpweEwrQjlRRVBRYnRQYlQ2czkrdnlNVm5sbnJLcnZXbWdrRUp0Z2F5czh5?=
 =?utf-8?B?RmM2WW40bGpVSjMxZkplTGJadEtqUFU0WVhqZ0YyV1ppaUlHb1lzY3NKeWlT?=
 =?utf-8?B?aDFZQkg4SVE4dTVQY2RzeHlRTHIxRHhWNVZLaU5YZlZxMWVNdThrZFMzbUN1?=
 =?utf-8?B?VUFUeFZCN3I5aFppY2JpT09ldmx5SkFQcTNtbXFiVjVEU3h6OVlTR1RUQkpI?=
 =?utf-8?B?QndGOWR1T2xnSFlYV1BzbVEwWjVXVmJyWUNHYlRyYkU3bXlOMVZBenlpUjhh?=
 =?utf-8?B?eVlVa0JxL3R1WC9GVzhDT3lYVVN0ZUFkQktOTDlmT1krL2JPK3ZyTmlPbWhl?=
 =?utf-8?B?QllGdE1aajVhYmYwOXBKNVcxeEV5K3lPTm1NK3VoNnhXNkM0TUFTZnhtcHE1?=
 =?utf-8?B?bXl4U2M1ZFNaUzNFbDAzaXFuZ3lpVG84OXNOSFV2Rm9vTkc4UkQ5b090OG45?=
 =?utf-8?B?UkZDNThGM1k0SnVBUjBpZklwZndhbFYyREhWTXBBYU9SbG50MDRtYWtJZWZs?=
 =?utf-8?B?ejFLU1FLWDZFc0ZXb2EwWVloWG5uMjdmY2t4a0w1TnhmcTR0NHZDM3BGZXhw?=
 =?utf-8?B?dnhsWDV1emIvYVNvWkpqVUt3R1laRWNFQTVKU2VWSjZqelZGYlFsd1lsTzFB?=
 =?utf-8?B?bXhSQjhRd1ZsNUFZRFJjMXZhSlZXK0NxQzN3a0Z0S3V6OVVJRWtraGk0dkNX?=
 =?utf-8?B?MjdmUmU1eUhxTUtOSGlmSERqNFI3RnhCOHhEM3hpdjMxRHZGeEVpdWlDaERi?=
 =?utf-8?B?ZDM1N293bGY4VmU4VXdRMWFlYVdZakVTcG5OOWwveHRyaENpOVZObzdreXhK?=
 =?utf-8?B?VVg5WFY3NExVNFh6RG9pQXJ6RUhyUlo0K2h3K2IrMDF0dDlFWlpHeTZJbC9S?=
 =?utf-8?B?YVRSaytJYWZ5SWJuUmVTenlsTkxjTkxlcENNYndhV01MaFZ0Y3dzVXRuZHVV?=
 =?utf-8?B?aEdlOGJ6UXY0andjVGMrTVNNbE5hRmFYN3Z3dnhLS3dVUDRwS0xxL1Z1M2pw?=
 =?utf-8?B?VDNxZmJGS1B3RHk5aEpQQ0ltRVo3T2xHcXUzUEVielB1TUVMNEtoNk5UL2Ri?=
 =?utf-8?B?ejZTZVpodHJHQWd2RUxPWUhHUXRFSkUxQnF4bXduWFhmNEsrWW04c1VheGJN?=
 =?utf-8?B?NEEwTjJUZHJwVUQxTXF3cjQ0QjNKK1ZoQitKMlhLbjRZZkV4OWM1VlVVUEQr?=
 =?utf-8?B?NUF6cEpmRCt5a0FLSE9MQ2xOUXJPVVRDUjRVZk12UE43TnFpRHg1NmNaTmZC?=
 =?utf-8?B?UlovbEttUUxQYjVocDUwYzBVZkdub0IyS0doSWhXdm85WmpDQUJXMm5vVWQw?=
 =?utf-8?B?eGpuUm9aTnVBPT0=?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB8749.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021)(13003099007)(921020);
 DIR:OUT; SFP:1102; 
Content-Type: text/plain; charset="utf-8"
Content-ID: <68D051B223D0A64589816C959296461F@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8143
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 5fc6639c16df48ee82e65b7b3c3a0dd1:solidrun,
 office365_emails, sent, inline:d2f983e1515754cdab4444136324b4c0
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8187cf36-dd98-4f5c-d60d-08de17f6472a
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|35042699022|14060799003|7416014|376014|82310400026|921020|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MHdlZ2tTRloyMW5ldVNwU0ptMzNleEczNkhJTlZWcGxsTTZpWXV1eitZYk9x?=
 =?utf-8?B?SzlQTUpzaHVWQ2ZOTW85QlFIcHQ5SzYwZGNVU2E4NGVla2I0a0d3b09CTTlx?=
 =?utf-8?B?RlluZkhNcysxajJuMGNBci9OUkJqRWc1L0FTQ1RmSGQzVlBrUWpYOEtvWVVj?=
 =?utf-8?B?OHFVaGFhWTB5Unl2ZHdTNFI2cGdtbUdkL3FpaDY4ZWNEbmdsbXEzZmJYSWhy?=
 =?utf-8?B?ZU0vUkNJOG1jdXVWaE1qRDRBVnpsVE1sRTB5VzYyc2dWVmUxK2lsbXFHUXRP?=
 =?utf-8?B?cEJaRGNKdXJ3UUJSd3BtdXVNK2dsellBVVQweTFQY2hDZms1N0NsbHY4ZW1z?=
 =?utf-8?B?QTMrMFBVcThjekRjbWduUlVvdkQvaWFzRXJWRS9saHZST1hLTlRidWVqKzk1?=
 =?utf-8?B?VWF3SGxneEltVyt5dTNNSTBjOFMxcE5CMWRobXZpNFE2YlJpc0wxMGp1QVo5?=
 =?utf-8?B?TlA4cHMvbVhIMm85U05jTHFrNDVHMnRNU05YdmZJSmtrSXYvaHVIdmc1bXh1?=
 =?utf-8?B?NmswSTVEQzZMZ09qbkRubHhENi9tVjY5dU51eHhieVlERjQ5bHR6eGNoaS9E?=
 =?utf-8?B?Y2VsRVEySXNQRkt5N1FzUGo4Q1BzSFA1TjJwTEFjb0RVWHh0SmhSZjVlWXln?=
 =?utf-8?B?RTBvdkdYYmdVcTd3SUhyZlVhUWN0K1BDM2k2eG16eE1rRUNTRTVvSWlnNWx5?=
 =?utf-8?B?TnVVMGdxaW1IM0ZTM3ZvQ1JycWIvdXp1RS90WitJM0JlcXBmdjQ4YUh2c1BM?=
 =?utf-8?B?Zm5aaS9SRGZUMklhekVqQk9heFhJS0U3YWhOOUdscEplS205K0VLcjlKMzZv?=
 =?utf-8?B?TVRVd2t6TC81SDZ6NW9KUUlRVExLYWY3NHR4cEJiK0llSUhXYTF2bHRCRzdw?=
 =?utf-8?B?ZTJESVZLQkdHNEk4eVM2bGFxVXZyaHBPZ3ZOejhQdlJYYzdTTUluWVBreG1P?=
 =?utf-8?B?bmtWQXFJR3A5UEswM0owVXgvN25QVjloMkZFeTg0U0VHeU9tSGxiSmt1cStJ?=
 =?utf-8?B?SkJ4b29Nd1hBcmZCdTRCZ3RMdmlDWXZ3VkY0R0tyUGJEM2o1dEJLY2k4UUEx?=
 =?utf-8?B?NExONkZvMy9aYUkzRjFQOEJYcWZFeGtMb25OWUdtNE9Kc1J3aG5nVTBHbmdx?=
 =?utf-8?B?QXJ2QzBTSGJ6QTlnSEpOYkRuaUJydDJ0OXF0NHNVSGV6OGNNMjd5QnJobUVV?=
 =?utf-8?B?MkVUY3B4OGxtQ1FsaFI1MEJwWmUvM2NlR0JxMFlubnY0UDFXNk0rdnlybzlC?=
 =?utf-8?B?YUJ0SldrUkkxWVI5NExpMDVJUWh2N3h5b3BVbWdaVE5WRHdzSlNhL3ZyYjhI?=
 =?utf-8?B?c3psVE9CVWFaY0ljVzdyaUsyV2dpVytnZG14VU55d1V0S1hLYVNmb1BHZUpQ?=
 =?utf-8?B?Y29Ca29rNW9MY0ZkSDdJLzRpUkdrTzZOUVorZzk3V0NxTGIyOXE3dXdVQjRH?=
 =?utf-8?B?QkJQdDh5bUNtZnR2SStVd3RVUFN6aFcwbWp6bm9jVjkvaERTM0hJZjk3SmRB?=
 =?utf-8?B?c3BsNityRXZlNUY2N21zTFliTHFpK2lLU3ZnWmVlbnVSMjZ1TXlWSG1kMWNJ?=
 =?utf-8?B?Yk9WckFwUTlULzJaUGVZNWptSUY2aEtrcEF4TFZ4YW5oeGRTK2JCa3g2SGo2?=
 =?utf-8?B?M202N1RUOGhNUFczR3ZCaFRGS0hoY1QrRVRPZ05uSURuN1hnb1lmR1hhZjla?=
 =?utf-8?B?d29ITjBNSm44aGE5eENSdVdoMStCeFBwMDNrOGU5bFRhT0FEbzdGbktrV3dG?=
 =?utf-8?B?Z1p3akZUM1R1cWV4MUlvVVhJeGljQnJCbVhTQXJxbVZBckd1SzgzZTUxNE1K?=
 =?utf-8?B?b1lCOXNJSU1IM09haTNLL0NxWGs5NDN6QTBsT1hkMTF6WWprYnVmb2pLZ3Av?=
 =?utf-8?B?SDlyT2JubDZzQzIxcTNsa1ZrS2d5cFpoTGJ2bkNlYm1UdlcyRFhnbk05dDdm?=
 =?utf-8?B?VFpVaUJlQkpRMDNXSXRsZExDWnlpVlRobXRHYmlwMk1mUS9reGhFVkxQV0JH?=
 =?utf-8?B?TDZEVmRtSTJKYkZ0Q09DNWswVnlJWE8xQWIrOXZOa3RaR3lMeEJLYmh4ZytM?=
 =?utf-8?Q?ll3Cqp?=
X-Forefront-Antispam-Report: CIP:52.17.62.50; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:eu-dlp.cloud-sec-av.com; PTR:eu-dlp.cloud-sec-av.com;
 CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(35042699022)(14060799003)(7416014)(376014)(82310400026)(921020)(13003099007);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 20:52:58.0562 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78f51bf8-c2f0-440f-fe8b-08de17f64e94
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82; Ip=[52.17.62.50];
 Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11625
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
aW9uIGZvciB0aGUgU29saWRSdW4gaS5NWDhNUCBIdW1taW5nQm9hcmQgSUlvVC4NCj4gVGhlIGJv
YXJkIGlzIGEgbmV3IGRlc2lnbiBhcm91bmQgdGhlIGkuTVg4TVAgU3lzdGVtIG9uIE1vZHVsZSwg
bm90DQo+IHNoYXJpbmcgbXVjaCB3aXRoIHByZXZpb3VzIEh1bW1pbmdCb2FyZHMuDQo+DQo+IEl0
IGNvbWVzIHdpdGggc29tZSBjb21tb24gZmVhdHVyZXM6DQo+IC0gM3ggVVNCLTMuMCBUeXBlIEEg
Y29ubmVjdG9yDQo+IC0gMnggMUdicHMgUko0NSBFdGhlcm5ldA0KPiAtIFVTQiBUeXBlLUMgQ29u
c29sZSBQb3J0DQo+IC0gbWljcm9TRCBjb25uZWN0b3INCj4gLSBSVEMgd2l0aCBiYWNrdXAgYmF0
dGVyeQ0KPiAtIFJHQiBTdGF0dXMgTEVEDQo+IC0gMXggTS4yIE0tS2V5IGNvbm5lY3RvciB3aXRo
IFBDSS1FIEdlbi4gMyB4MQ0KPiAtIDF4IE0uMiBCLUtleSBjb25uZWN0b3Igd2l0aCBVU0ItMi4w
LzMuMCArIFNJTSBjYXJkIGhvbGRlcg0KPiAtIDF4IExWRFMgRGlzcGxheSBDb25uZWN0b3INCj4g
LSAxeCBEU0kgRGlzcGxheSBDb25uZWN0b3INCj4gLSBHUElPIGhlYWRlcg0KPiAtIDJ4IFJTMjMy
L1JTNDg1IHBvcnRzIChjb25maWd1cmFibGUpDQo+IC0gMnggQ0FODQo+DQo+IEluIGFkZGl0aW9u
IHRoZXJlIGlzIGEgYm9hcmQtdG8tYm9hcmQgZXhwYW5zaW9uIGNvbm5lY3RvciB0byBzdXBwb3J0
DQo+IGN1c3RvbSBkYXVnaHRlciBib2FyZHMgd2l0aCBhY2Nlc3MgdG8gU1BJLCBhIHJhbmdlIG9m
IEdQSU9zIGFuZCAtDQo+IG5vdGFibHkgLSBDQU4gYW5kIFVBUlQuIEJvdGggMnggQ0FOIGFuZCAy
eCBVQVJUIGNhbiBiZSBtdXhlZCBlaXRoZXINCj4gdG8gdGhpcyBiMmIgY29ubmVjdG9yLCBvciBh
IHRlcm1pYW5sIGJsb2NrIGNvbm5lY3RvciBvbiB0aGUgYmFzZSBib2FyZC4NCj4NCj4gVGhlIHJv
dXRpbmcgY2hvaWNlIGZvciBVQVJUIGFuZCBDQU4gaXMgZXhwcmVzc2VkIHRocm91Z2ggZ3Bpbw0K
PiBtdXgtY29udHJvbGxlcnMgaW4gRFQgYW5kIGNhbiBiZSBjaGFuZ2VkIGJ5IGFwcGx5aW5nIGR0
YiBhZGRvbnMuDQo+DQo+IEZvdXIgZHRiIGFkZG9ucyBhcmUgcHJvdmlkZWQ6DQo+DQo+IC0gZHNp
IHBhbmVsIFdpbnN0YXIgV0o3ME4zVFlKSE1ORzANCj4gLSBsdmRzIHBhbmVsIFdpbnN0YXIgV0Y3
MEE4U1lKSExOR0ENCj4gLSBSUzQ4NSBvbiBVQVJUIHBvcnQgIkEiIChkZWZhdWx0IHJzMjMyKQ0K
PiAtIFJTNDg1IG9uIFVBUlQgcG9ydCAiQiIgKGRlZmF1bHQgcnMyMzIpDQo+DQo+IFNpZ25lZC1v
ZmYtYnk6IEpvc3VhIE1heWVyIDxqb3N1YUBzb2xpZC1ydW4uY29tPg0KPiAtLS0NCj4gIGFyY2gv
YXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL01ha2VmaWxlICAgICAgICAgICAgIHwgICA2ICsNCj4g
IC4uLmh1bW1pbmdib2FyZC1paW90LXBhbmVsLWRzaS1XSjcwTjNUWUpITU5HMC5kdHNvIHwgIDcw
ICsrDQo+ICAuLi51bW1pbmdib2FyZC1paW90LXBhbmVsLWx2ZHMtV0Y3MEE4U1lKSExOR0EuZHRz
byB8IDEwNSArKysNCj4gIC4uLi9pbXg4bXAtaHVtbWluZ2JvYXJkLWlpb3QtcnM0ODUtYS5kdHNv
ICAgICAgICAgIHwgIDE4ICsNCj4gIC4uLi9pbXg4bXAtaHVtbWluZ2JvYXJkLWlpb3QtcnM0ODUt
Yi5kdHNvICAgICAgICAgIHwgIDE4ICsNCj4gIC4uLi9kdHMvZnJlZXNjYWxlL2lteDhtcC1odW1t
aW5nYm9hcmQtaWlvdC5kdHMgICAgIHwgNzEwICsrKysrKysrKysrKysrKysrKysrKw0KPiAgNiBm
aWxlcyBjaGFuZ2VkLCA5MjcgaW5zZXJ0aW9ucygrKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9h
cm02NC9ib290L2R0cy9mcmVlc2NhbGUvTWFrZWZpbGUgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2Zy
ZWVzY2FsZS9NYWtlZmlsZQ0KPiBpbmRleCA4YmRhNmZiMGZmOWMxLi5kNDE0ZDBlZmU1ZTc0IDEw
MDY0NA0KPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9NYWtlZmlsZQ0KPiAr
KysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9NYWtlZmlsZQ0KPiBAQCAtMjA3LDYg
KzIwNywxMiBAQCBkdGItJChDT05GSUdfQVJDSF9NWEMpICs9IGlteDhtcC1kaGNvbS1wZGszLmR0
Yg0KPiAgZHRiLSQoQ09ORklHX0FSQ0hfTVhDKSArPSBpbXg4bXAtZGhjb20tcGljb2l0eC5kdGIN
Cj4gIGR0Yi0kKENPTkZJR19BUkNIX01YQykgKz0gaW14OG1wLWVkbS1nLXdiLmR0Yg0KPiAgZHRi
LSQoQ09ORklHX0FSQ0hfTVhDKSArPSBpbXg4bXAtZXZrLmR0Yg0KPiArZHRiLSQoQ09ORklHX0FS
Q0hfTVhDKSArPSBpbXg4bXAtaHVtbWluZ2JvYXJkLWlpb3QuZHRiDQo+ICtEVENfRkxBR1NfaW14
OG1wLWh1bW1pbmdib2FyZC1paW90IDo9IC1ADQo+ICtkdGItJChDT05GSUdfQVJDSF9NWEMpICs9
IGlteDhtcC1odW1taW5nYm9hcmQtaWlvdC1wYW5lbC1kc2ktV0o3ME4zVFlKSE1ORzAuZHRibw0K
PiArZHRiLSQoQ09ORklHX0FSQ0hfTVhDKSArPSBpbXg4bXAtaHVtbWluZ2JvYXJkLWlpb3QtcGFu
ZWwtbHZkcy1XRjcwQThTWUpITE5HQS5kdGJvDQo+ICtkdGItJChDT05GSUdfQVJDSF9NWEMpICs9
IGlteDhtcC1odW1taW5nYm9hcmQtaWlvdC1yczQ4NS1hLmR0Ym8NCj4gK2R0Yi0kKENPTkZJR19B
UkNIX01YQykgKz0gaW14OG1wLWh1bW1pbmdib2FyZC1paW90LXJzNDg1LWIuZHRibw0KPiAgZHRi
LSQoQ09ORklHX0FSQ0hfTVhDKSArPSBpbXg4bXAtaHVtbWluZ2JvYXJkLW1hdGUuZHRiDQo+ICBE
VENfRkxBR1NfaW14OG1wLWh1bW1pbmdib2FyZC1tYXRlIDo9IC1ADQo+ICBkdGItJChDT05GSUdf
QVJDSF9NWEMpICs9IGlteDhtcC1odW1taW5nYm9hcmQtcHJvLmR0Yg0KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1wLWh1bW1pbmdib2FyZC1paW90LXBh
bmVsLWRzaS1XSjcwTjNUWUpITU5HMC5kdHNvIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2Nh
bGUvaW14OG1wLWh1bW1pbmdib2FyZC1paW90LXBhbmVsLWRzaS1XSjcwTjNUWUpITU5HMC5kdHNv
DQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMDAuLmIzY2Y2Njgz
N2M1NzcNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVz
Y2FsZS9pbXg4bXAtaHVtbWluZ2JvYXJkLWlpb3QtcGFuZWwtZHNpLVdKNzBOM1RZSkhNTkcwLmR0
c28NCj4gQEAgLTAsMCArMSw3MCBAQA0KPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChH
UEwtMi4wKyBPUiBNSVQpDQo+ICsvKg0KPiArICogQ29weXJpZ2h0IDIwMjUgSm9zdWEgTWF5ZXIg
PGpvc3VhQHNvbGlkLXJ1bi5jb20+DQo+ICsgKg0KPiArICogT3ZlcmxheSBmb3IgZW5hYmxpbmcg
SHVtbWluZ0JvYXJkIElJb1QgTUlQSS1EU0kgY29ubmVjdG9yDQo+ICsgKiB3aXRoIFdpbnN0YXIg
V0o3ME4zVFlKSE1ORzAgcGFuZWwuDQo+ICsgKi8NCj4gKw0KPiArL2R0cy12MS87DQo+ICsvcGx1
Z2luLzsNCj4gKw0KPiArI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2dwaW8vZ3Bpby5oPg0KPiArI2lu
Y2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2lycS5oPg0KPiArDQo+ICsm
ey99IHsNCj4gKwlkc2lfYmFja2xpZ2h0OiBkc2ktYmFja2xpZ2h0IHsNCj4gKwkJY29tcGF0aWJs
ZSA9ICJncGlvLWJhY2tsaWdodCI7DQo+ICsJCWdwaW9zID0gPCZ0Y2E2NDA4X3U0OCAzIEdQSU9f
QUNUSVZFX0xPVz47DQo+ICsJfTsNCj4gK307DQo+ICsNCj4gKyZpMmNfZHNpIHsNCj4gKwkjYWRk
cmVzcy1jZWxscyA9IDwxPjsNCj4gKwkjc2l6ZS1jZWxscyA9IDwwPjsNCj4gKw0KPiArCXRvdWNo
c2NyZWVuQDQxIHsNCj4gKwkJY29tcGF0aWJsZSA9ICJpbGl0ZWssaWxpMjEzMCI7DQo+ICsJCXJl
ZyA9IDwweDQxPjsNCj4gKwkJcmVzZXQtZ3Bpb3MgPSA8JnRjYTY0MDhfdTQ4IDYgR1BJT19BQ1RJ
VkVfTE9XPjsNCj4gKwkJaW50ZXJydXB0cy1leHRlbmRlZCA9IDwmdGNhNjQxNl91MjEgMTMgSVJR
X1RZUEVfTEVWRUxfTE9XPjsNCj4gKwl9Ow0KPiArfTsNCj4gKw0KPiArJmxjZGlmMSB7DQo+ICsJ
c3RhdHVzID0gIm9rYXkiOw0KPiArfTsNCj4gKw0KPiArJm1pcGlfZHNpIHsNCj4gKwlzYW1zdW5n
LGVzYy1jbG9jay1mcmVxdWVuY3kgPSA8MTAwMDAwMDA+Ow0KPiArCSNhZGRyZXNzLWNlbGxzID0g
PDE+Ow0KPiArCSNzaXplLWNlbGxzID0gPDA+Ow0KPiArCXN0YXR1cyA9ICJva2F5IjsNCj4gKw0K
PiArCXBhbmVsQDAgew0KPiArCQkvKiBUaGlzIGlzIGEgV2luc3RhciBwYW5lbCwgYnV0IHRoZSBy
b25ibyBwYW5lbCB1c2VzIHNhbWUgY29udHJvbHMuICovDQo+ICsJCWNvbXBhdGlibGUgPSAicm9u
Ym8scmIwNzBkMzAiOw0KPiArCQlyZWcgPSA8MD47DQo+ICsJCXZjYy1sY2Qtc3VwcGx5ID0gPCZy
ZWdfZHNpX3BhbmVsPjsNCj4gKwkJcG93ZXItZ3Bpb3MgPSA8JnRjYTY0MDhfdTQ4IDIgR1BJT19B
Q1RJVkVfSElHSD47DQo+ICsJCS8qIHJlc2V0IGlzIGFjdGl2ZS1sb3cgYnV0IGRyaXZlciBpbnZl
cnRzIGl0IGludGVybmFsbHkgKi8NCj4gKwkJcmVzZXQtZ3Bpb3MgPSA8JnRjYTY0MDhfdTQ4IDEg
R1BJT19BQ1RJVkVfSElHSD47DQo+ICsJCXVwZG4tZ3Bpb3MgPSA8JnRjYTY0MDhfdTQ4IDUgR1BJ
T19BQ1RJVkVfSElHSD47DQo+ICsJCXNobHItZ3Bpb3MgPSA8JnRjYTY0MDhfdTQ4IDQgR1BJT19B
Q1RJVkVfTE9XPjsNCj4gKwkJYmFja2xpZ2h0ID0gPCZkc2lfYmFja2xpZ2h0PjsNCj4gKw0KPiAr
CQlwb3J0IHsNCj4gKwkJCXBhbmVsX2Zyb21fZHNpbTogZW5kcG9pbnQgew0KPiArCQkJCWRhdGEt
bGFuZXMgPSA8MSAyIDMgND47DQo+ICsJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZkc2ltX3RvX3Bh
bmVsPjsNCj4gKwkJCX07DQo+ICsJCX07DQo+ICsJfTsNCj4gKw0KPiArCXBvcnRAMSB7DQo+ICsJ
CWRzaW1fdG9fcGFuZWw6IGVuZHBvaW50IHsNCj4gKwkJCXJlbW90ZS1lbmRwb2ludCA9IDwmcGFu
ZWxfZnJvbV9kc2ltPjsNCj4gKwkJCWF0dGFjaC1icmlkZ2U7DQo+ICsJCX07DQo+ICsJfTsNCj4g
K307DQo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bXAt
aHVtbWluZ2JvYXJkLWlpb3QtcGFuZWwtbHZkcy1XRjcwQThTWUpITE5HQS5kdHNvIGIvYXJjaC9h
cm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1wLWh1bW1pbmdib2FyZC1paW90LXBhbmVsLWx2
ZHMtV0Y3MEE4U1lKSExOR0EuZHRzbw0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAw
MDAwMDAwMDAwMDAwLi45MDY3NGY5ODcxMDIwDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvYXJj
aC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1wLWh1bW1pbmdib2FyZC1paW90LXBhbmVs
LWx2ZHMtV0Y3MEE4U1lKSExOR0EuZHRzbw0KPiBAQCAtMCwwICsxLDEwNSBAQA0KPiArLy8gU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wKyBPUiBNSVQpDQo+ICsvKg0KPiArICogQ29w
eXJpZ2h0IDIwMjUgSm9zdWEgTWF5ZXIgPGpvc3VhQHNvbGlkLXJ1bi5jb20+DQo+ICsgKg0KPiAr
ICogT3ZlcmxheSBmb3IgZW5hYmxpbmcgSHVtbWluZ0JvYXJkIElJb1QgTFZEUyBjb25uZWN0b3IN
Cj4gKyAqIHdpdGggV2luc3RhciBXRjcwQThTWUpITE5HQSBwYW5lbC4NCj4gKyAqLw0KPiArDQo+
ICsvZHRzLXYxLzsNCj4gKy9wbHVnaW4vOw0KPiArDQo+ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3Mv
Z3Bpby9ncGlvLmg+DQo+ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xs
ZXIvaXJxLmg+DQo+ICsNCj4gKyZ7L30gew0KPiArCWx2ZHNfYmFja2xpZ2h0OiBsdmRzLWJhY2ts
aWdodCB7DQo+ICsJCWNvbXBhdGlibGUgPSAiZ3Bpby1iYWNrbGlnaHQiOw0KPiArCQlncGlvcyA9
IDwmdGNhNjQwOF91MzcgMyBHUElPX0FDVElWRV9MT1c+Ow0KPiArCX07DQo+ICsNCj4gKwlwYW5l
bC1sdmRzIHsNCj4gKwkJY29tcGF0aWJsZSA9ICJwYW5lbC1sdmRzIjsNCj4gKwkJYmFja2xpZ2h0
ID0gPCZsdmRzX2JhY2tsaWdodD47DQo+ICsJCXBvd2VyLXN1cHBseSA9IDwmcmVnX2RzaV9wYW5l
bD47DQo+ICsJCWVuYWJsZS1ncGlvcyA9IDwmdGNhNjQwOF91MzcgMiBHUElPX0FDVElWRV9ISUdI
PjsNCj4gKwkJcmVzZXQtZ3Bpb3MgPSA8JnRjYTY0MDhfdTM3IDEgR1BJT19BQ1RJVkVfSElHSD47
DQo+ICsJCWRhdGEtbWFwcGluZyA9ICJ2ZXNhLTI0IjsNCj4gKwkJd2lkdGgtbW0gPSA8MTU0PjsN
Cj4gKwkJaGVpZ2h0LW1tID0gPDg2PjsNCj4gKw0KPiArCQlwYW5lbC10aW1pbmcgew0KPiArCQkJ
LyoNCj4gKwkJCSAqIE5vdGU6IE5YUCBCU1AgaGFyZC1jb2RlcyA3NE1IeiBjbG9jayBpbiBsZGIg
ZHJpdmVyOg0KPiArCQkJICogZHJpdmVycy9ncHUvZHJtL2lteC9pbXg4bXAtbGRiLmMNCj4gKwkJ
CSAqIFNvbGlkUnVuIEJTUCBjYXJyaWVzIHBhdGNoLg0KPiArCQkJICovDQo+ICsJCQljbG9jay1m
cmVxdWVuY3kgPSA8NDk1MDAwMDA+Ow0KPiArCQkJaGFjdGl2ZSA9IDwxMDI0PjsNCj4gKwkJCXZh
Y3RpdmUgPSA8NjAwPjsNCj4gKwkJCWhmcm9udC1wb3JjaCA9IDw0MD47DQo+ICsJCQloYmFjay1w
b3JjaCA9IDwxNDQ+Ow0KPiArCQkJaHN5bmMtbGVuID0gPDEwND47DQo+ICsJCQloc3luYy1hY3Rp
dmUgPSA8MD47DQo+ICsJCQl2ZnJvbnQtcG9yY2ggPSA8Mz47DQo+ICsJCQl2YmFjay1wb3JjaCA9
IDwxMT47DQo+ICsJCQl2c3luYy1sZW4gPSA8MTA+Ow0KPiArCQkJdnN5bmMtYWN0aXZlID0gPDE+
Ow0KPiArCQkJZGUtYWN0aXZlID0gPDE+Ow0KPiArCQl9Ow0KPiArDQo+ICsJCXBvcnQgew0KPiAr
CQkJcGFuZWxfZnJvbV9sdmRzOiBlbmRwb2ludCB7DQo+ICsJCQkJcmVtb3RlLWVuZHBvaW50ID0g
PCZsdmRzX2NoMF9vdXQ+Ow0KPiArCQkJfTsNCj4gKwkJfTsNCj4gKwl9Ow0KPiArfTsNCj4gKw0K
PiArJmkyY19sdmRzIHsNCj4gKwkjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4gKwkjc2l6ZS1jZWxs
cyA9IDwwPjsNCj4gKw0KPiArCXRvdWNoc2NyZWVuQDQxIHsNCj4gKwkJY29tcGF0aWJsZSA9ICJp
bGl0ZWssaWxpMjEzMCI7DQo+ICsJCXJlZyA9IDwweDQxPjsNCj4gKwkJcmVzZXQtZ3Bpb3MgPSA8
JnRjYTY0MDhfdTM3IDYgR1BJT19BQ1RJVkVfTE9XPjsNCj4gKwkJaW50ZXJydXB0cy1leHRlbmRl
ZCA9IDwmdGNhNjQxNl91MjEgMTMgSVJRX1RZUEVfTEVWRUxfTE9XPjsNCj4gKwl9Ow0KPiArfTsN
Cj4gKw0KPiArJmxjZGlmMiB7DQo+ICsJc3RhdHVzID0gIm9rYXkiOw0KPiArfTsNCj4gKw0KPiAr
Jmx2ZHNfYnJpZGdlIHsNCj4gKwlzdGF0dXMgPSAib2theSI7DQo+ICsNCj4gKwlwb3J0cyB7DQo+
ICsJCSNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiArCQkjc2l6ZS1jZWxscyA9IDwwPjsNCj4gKwkJ
c3RhdHVzID0gIm9rYXkiOw0KPiArDQo+ICsJCXBvcnRAMSB7DQo+ICsJCQlsdmRzX2NoMF9vdXQ6
IGVuZHBvaW50IHsNCj4gKwkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JnBhbmVsX2Zyb21fbHZkcz47
DQo+ICsJCQl9Ow0KPiArCQl9Ow0KPiArCX07DQo+ICt9Ow0KPiArDQo+ICsmdGNhNjQwOF91Mzcg
ew0KPiArCWx2ZHMtbHItaG9nIHsNCj4gKwkJZ3Bpby1ob2c7DQo+ICsJCWdwaW9zID0gPDQgR1BJ
T19BQ1RJVkVfSElHSD47DQo+ICsJCW91dHB1dC1oaWdoOw0KPiArCQlsaW5lLW5hbWUgPSAibHZk
cy1sL3IiOw0KPiArCX07DQo+ICsNCj4gKwlsdmRzLXVkLWhvZyB7DQo+ICsJCWdwaW8taG9nOw0K
PiArCQlncGlvcyA9IDw1IEdQSU9fQUNUSVZFX0hJR0g+Ow0KPiArCQlvdXRwdXQtaGlnaDsNCj4g
KwkJbGluZS1uYW1lID0gImx2ZHMtdS9kIjsNCj4gKwl9Ow0KPiArfTsNCkJlY2F1c2UgSSBoYXZl
IG5vdCBhZGRlZCBhbnkgTWFrZWZpbGUgdGFyZ2V0cyBhcHBseWluZyB0aGUgZGJvJ3MgdG8gZHRi
LA0KbWFrZSBkdGJzX2NoZWNrIGlzIG5vdCBjaGVja2luZyB0aGVtIC4uLg0KDQpUaGVyZSBhcmUg
c29tZSBmYWlsaW5nIGNoZWNrcyB0aGF0IEkgd2lsbCByZXNvbHZlOg0KDQovb3B0L3dvcmtzcGFj
ZS9saW51eC9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bXAtaHVtbWluZ2JvYXJk
LWlpb3QtcGFuZWwtZHNpLVdKNzBOM1RZSkhNTkcwLmR0YjogcGFuZWxAMDogcG9ydDplbmRwb2lu
dDogVW5ldmFsdWF0ZWQgcHJvcGVydGllcyBhcmUgbm90IGFsbG93ZWQgKCdkYXRhLWxhbmVzJyB3
YXMgdW5leHBlY3RlZCkNCsKgIMKgIMKgIMKgIGZyb20gc2NoZW1hICRpZDogaHR0cDovL2Rldmlj
ZXRyZWUub3JnL3NjaGVtYXMvZGlzcGxheS9wYW5lbC9yb25ibyxyYjA3MGQzMC55YW1sIw0KL29w
dC93b3Jrc3BhY2UvbGludXgvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1wLWh1
bW1pbmdib2FyZC1paW90LXBhbmVsLWx2ZHMtV0Y3MEE4U1lKSExOR0EuZHRiOiBwYW5lbC1sdmRz
OiBjb21wYXRpYmxlOjA6ICdwYW5lbC1sdmRzJyBpcyBub3Qgb25lIG9mIFsnYWRtYXRlYyw5OTA0
Mzc5JywgJ2FtcGlyZSxhbXAxOTIwMTIwMGI1dHpxdy10MDMnLCAnYXVvLGIxMDFldzA1JywgJ2F1
byxnMDg0c24wNScsICdjaHVuZ2h3YSxjbGFhMDcwd3AwM3hnJywgJ2VkdCxldG1sMDcwMHo4ZGhh
JywgJ2VkdCxldG1sMDcwMHo5bmRoYScsICdoYW5uc3Rhcixoc2QxMDFwd3cyJywgJ2h5ZGlzLGh2
MDcwd3gyLTFlMCcsICdqZW5zb24sYmwtanQ2MDA1MC0wMWEnLCAndGJzLGE3MTEtcGFuZWwnXQ0K
wqAgwqAgwqAgwqAgZnJvbSBzY2hlbWEgJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1h
cy9kaXNwbGF5L3BhbmVsL3BhbmVsLWx2ZHMueWFtbCMNCi9vcHQvd29ya3NwYWNlL2xpbnV4L2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtcC1odW1taW5nYm9hcmQtaWlvdC1wYW5l
bC1sdmRzLVdGNzBBOFNZSkhMTkdBLmR0YjogcGFuZWwtbHZkczogY29tcGF0aWJsZTogWydwYW5l
bC1sdmRzJ10gaXMgdG9vIHNob3J0DQrCoCDCoCDCoCDCoCBmcm9tIHNjaGVtYSAkaWQ6IGh0dHA6
Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtbHZkcy55YW1sIw0K
L29wdC93b3Jrc3BhY2UvbGludXgvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1w
LWh1bW1pbmdib2FyZC1paW90LXBhbmVsLWx2ZHMtV0Y3MEE4U1lKSExOR0EuZHRiOiBwYW5lbC1s
dmRzOiBVbmV2YWx1YXRlZCBwcm9wZXJ0aWVzIGFyZSBub3QgYWxsb3dlZCAoJ2NvbXBhdGlibGUn
IHdhcyB1bmV4cGVjdGVkKQ0KwqAgwqAgwqAgwqAgZnJvbSBzY2hlbWEgJGlkOiBodHRwOi8vZGV2
aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L3BhbmVsL3BhbmVsLWx2ZHMueWFtbCMNCg0K

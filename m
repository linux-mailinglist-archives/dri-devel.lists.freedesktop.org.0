Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 229B5C149C0
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 13:24:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2218410E3E9;
	Tue, 28 Oct 2025 12:24:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="goAQLYaY";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="goAQLYaY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11023076.outbound.protection.outlook.com
 [52.101.83.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8062510E3E9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 12:24:53 +0000 (UTC)
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=aV9zT//uLoSuB46C2TJvxLQ1XC7rEFnWEWZCiu447ug5dLLevR5+regLVNJ2gvpPdynOIOLUtKj5EGD4w7ts+6unJ0BVdkNbXgh5+0T56vA3u55pgJ4il9m3gEtL/G1yVtV7A7WKirc/ksWajRbtQiLHquJ4fFpN1wJNDJiWViOVCzEtNnrzizXwFGiJ97maG9aamnVXtKGkeuEBD2poFJ4XCM2vCaeDHzbXXKoEGlKRDSg7k4293JR91xHRv5eiG23JyXBDjJfURjUXaiWKvAfNd8NtH9g1noaVCkoXIMa788KFHb0YisHZcCR0ACQKZKMBuFwSOIys0Myc7M3tdg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MiKEZijz4ropNVU8hfBsuaL2S7qA6rGjxqX4Wt9/Kc4=;
 b=bfr3tCT/OF5j0PWu8Yw6fUYncdV+fxqD5M4DO+fEnoYXWGKhLH8uzumsm3xoEMbwjCkGXUVWigwDjLPuCkHMo2U4O6BvgZAFVdiVEs0ImFA/SbKYVmpv2rum8udy0ZIOiprPn79Fp2yaMWUkg7B91oY5U+DD464sfzL11QmPD+bA2BKOz/mXv/swVUsc/TsncYDtyrwEvhqRN548yczDrCYapN0bmovLPscoevw0CHq+lHBoERskvNL+k85G3vO52ABHt1EquXKlHUHWTpH9jNF7zbmDHApANtVsFyY8TPlazaf8XRB7V1mQLBlf2+QCaJc4nEsAS6SafAP+iYnwfA==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MiKEZijz4ropNVU8hfBsuaL2S7qA6rGjxqX4Wt9/Kc4=;
 b=goAQLYaYo6PS8O8puhLtBgFr1n2rRLrCioqIiK4zTnqlmTQRRheH2KZkFm2SmrYEmBKOfI7IbXzvBsbywl/MgJruxY7Zul3L+q9KArH0EvqDZvMAeynrHAtINCEeGMn/MFNqL6FalGXiIyOFjhmROMjDUyfFHWuyinOFIqmzh/M=
Received: from AS4P190CA0026.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d0::13)
 by VE1PR04MB7439.eurprd04.prod.outlook.com (2603:10a6:800:1ab::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 12:24:48 +0000
Received: from AMS1EPF0000004E.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d0:cafe::7) by AS4P190CA0026.outlook.office365.com
 (2603:10a6:20b:5d0::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.20 via Frontend Transport; Tue,
 28 Oct 2025 12:24:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS1EPF0000004E.mail.protection.outlook.com (10.167.16.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10
 via Frontend Transport; Tue, 28 Oct 2025 12:24:45 +0000
Received: from emails-8904300-12-mt-prod-cp-eu-2.checkpointcloudsec.com
 (ip-10-20-5-121.eu-west-1.compute.internal [10.20.5.121])
 by mta-outgoing-dlp-467-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with
 ESMTPS id 8E47B80448; Tue, 28 Oct 2025 12:24:45 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1761654285; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=MiKEZijz4ropNVU8hfBsuaL2S7qA6rGjxqX4Wt9/Kc4=;
 b=dEhIgDpVDEZHU7av5hW3ccolGlqpjb/FL+kzpFoFMrFBhgIbcT/M0Tjnbcq10GggNGK25
 cS055p/lgvBGTBVaeF1SiB/Y6UmgcypNyMjiifeYxILa+oQC/KjSmNyhUjLTHmuYdTMvY9C
 PPdR2Od46jszm/uKgOMeN+H2JPtIYFw=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1761654285;
 b=OLz8BvY6pF8ecqFa6uzpm5CGHrQWSpc2gnN83AaxyN4RPvNTTchrnj14CeeIlaKVBAlT0
 aUqSNVlkFmrOB5IC4PUO+4VKH0EOMVAzTmF2fOBQJKoHuEejdZoJBm0iw7INqCVex4++G2d
 Odf7QBDEetwXha84cNvNGF4ntO6UiAw=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ma1xhYaB1LjZWibRqNVwEm+s8ocxbg/n0gdNM8xUgnJJsZQ2vB+8g5XQMimu3vvFsBgViYdjE8ZswDzev8HevF//gLAbp3hJCAJwRoVE48zeaH1n7+fYh90y74jLfcCh6P5SsPj00zvb/Ab69rbmXQcW9HpI/owW7UBECDGpyWberKbgrRefID85TInnlQrH7GNMmBRqVhQgchjB0RG1yEGn5wSy8P6szX2SxsnyhWbNC8/+9Smk7EJfJEeUBugCAEqnPZAc7XFds5PjAAauZY69yrNyLo2zjJrBQDwzqNDDxZ8mHi7dJ2DVsPfYZpwGNhMNFbZlwnRvm/8GodDwiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MiKEZijz4ropNVU8hfBsuaL2S7qA6rGjxqX4Wt9/Kc4=;
 b=J2f9JJVaKaavozWCPUwCSd4OZ8j9K1t0ywY/zJ2H4ao2f/3NTa6lhOEtT8N+Nzyfh88soyPbYGg3pFue2HaHarIUK2jW2Ie/m3CfKHQByeYMsktM4l1C9EC2Bylv3UrGds64N/4lrY9U1vyyyrWVwfCeNi7zeDaAPlVKZMZ1UOz9lgqYj5p74kxdrfnk4obyLSMAPodNA98DFz4DIDjROaJ5zeQqSirc6PMThv+w0Jpg+VykSvzYF8wU5oENaZ3Gp6U9xBmS63/DD5JalWeEd6KTB2INisMLMcksI0HdbjmqIxEEfa1mC3FqLGLmYeCWFsY0+lBqSwxFrbVRTP2aTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MiKEZijz4ropNVU8hfBsuaL2S7qA6rGjxqX4Wt9/Kc4=;
 b=goAQLYaYo6PS8O8puhLtBgFr1n2rRLrCioqIiK4zTnqlmTQRRheH2KZkFm2SmrYEmBKOfI7IbXzvBsbywl/MgJruxY7Zul3L+q9KArH0EvqDZvMAeynrHAtINCEeGMn/MFNqL6FalGXiIyOFjhmROMjDUyfFHWuyinOFIqmzh/M=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by GV1PR04MB9055.eurprd04.prod.outlook.com (2603:10a6:150:1e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 12:24:36 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 12:24:36 +0000
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
Thread-Index: AQHcR2nlqzlGSPiPPkOwWeKJPAELf7TXfNEA
Date: Tue, 28 Oct 2025 12:24:36 +0000
Message-ID: <2c54b7b7-4eb4-44a0-8025-8da16a28efd4@solid-run.com>
References: <20251027-imx8mp-hb-iiot-v1-0-683f86357818@solid-run.com>
 <20251027-imx8mp-hb-iiot-v1-8-683f86357818@solid-run.com>
In-Reply-To: <20251027-imx8mp-hb-iiot-v1-8-683f86357818@solid-run.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-traffictypediagnostic: PAXPR04MB8749:EE_|GV1PR04MB9055:EE_|AMS1EPF0000004E:EE_|VE1PR04MB7439:EE_
X-MS-Office365-Filtering-Correlation-Id: f09c3ae4-b195-4c30-98a6-08de161cfb05
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700021|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?Z3hBSzh1MjJYRGFaR3dFeTMrb1pJOHpkM0VjNGl5M2lUMld5WXJsVWxtOHVh?=
 =?utf-8?B?YlBqZzNnZFdDRHdvV3ROMGlsZHBmWWxCeWcrb3NLT2todHQyRGYreERwOWJy?=
 =?utf-8?B?cDkxRGtZQ01yY1hoK0U5Y0hMNWh1UHhSRlZtZEtyNVlrL0NrTUpyMFhvN2h5?=
 =?utf-8?B?ZERmN044bGZNcmhOVzBJUU0zN0owem13UkdxbzEvNzVCT0I4OS91eStGLzJ3?=
 =?utf-8?B?czhzaXQ3bkhoNUVNdWdEQzlGRXd3a090TXpDbWV1SlJ3OXYyb242d0YrWmFH?=
 =?utf-8?B?cFpUSHcwTzVZNHZmVlVFVUFlcFppTVhDanlyc0NvcGVVcE1xcFhFaDhDd05W?=
 =?utf-8?B?NENsUWszblhFekI1cTk4OU9ac0ZvWnNrZHN3djdMOG1kNHVyTEdqOWFncWtF?=
 =?utf-8?B?UkxwTitsWVp1RWtHNG10NkMwaDFvMk9QNUN2UUNYVVBaMjhSM0RncXA5TFZD?=
 =?utf-8?B?alRtYm4waXBCR1E0ZDEyNVFZMU9FV0xQd1NDQTRZVithYk1lOUcwRHFaS0N3?=
 =?utf-8?B?SVhTVkVxS3QwZVZwVXIvcWhwMFZhdjZ2czFYZTE2OFpDdVlzWDVodkpNM1dn?=
 =?utf-8?B?b1RJSlFicHpDdVZrRDlkMHY4V2FwRXkyL3VPUHBTWFRzaGNYQU9uNUV5ODlU?=
 =?utf-8?B?V2E0TGt3YkI2L09ERnN4RWd4K250WFlGKzRod2FQUEI4VHIvTUlFSEdOS1NS?=
 =?utf-8?B?bFpqeFJZdGN2NjZtUnRuMFRoblA4Y2x6ckxHbVVkejlZL21xNEwrSzY1blpW?=
 =?utf-8?B?UVFrZVI5N3ZpRStqSXh3ZzRIR0labm5JTXFtbEtwaUx0NUVqZmpVRnB1d3R5?=
 =?utf-8?B?SWsvS1p1d0dzQXRIMFNmK1Baa3hEZDQ0bnJ6QUtmL3BVWEZsczZEMzZ1bm9j?=
 =?utf-8?B?SE5qS1hHQTlUb2ZySEdhNE15eTlRQkNjN0htb3VwZVhZL2hoRktSTjVpb0x0?=
 =?utf-8?B?QkZWWGFzM21xdWczWmtnQWhpUlFyaFV0dm5mY2dNMjlacGs0Z3JLNHFUSVJt?=
 =?utf-8?B?enNmRGlhNEdaVDRTOHB6N2NORTFhZnNEb2ZMZDJ2aE5zODQyQUdqd2dyY3Ax?=
 =?utf-8?B?ZGN1MlBYNG82M3ZxUm5oVERTZTF2K2NyYXJYWFEvU09HV09GeFR6SFZ3dE9H?=
 =?utf-8?B?Uks5c2Zmc0RjZnJ3MnE5YzFzT1VvaVJiQ0ljaGxHU3lUL3laRzM3dXIrVHdn?=
 =?utf-8?B?WlNnRmJYWnFZOXFURDBDRWszSnN3TVlnVGlVNll1MXR2M3Jwc3h0YWp1b3Ay?=
 =?utf-8?B?TWU1TStseW9DeGxWM1g2bU1LSmdRTmUvZ1c1WFQ0RE1PYmczTXVabGZGM1pO?=
 =?utf-8?B?OW9ZVDY0eVlVSkhCSkozaWZEa2JrSE8wUVlmYTh3MW5aOTVPLzFWWDFDZDF6?=
 =?utf-8?B?andNZUNPV3hPS04vNXJnblVqdHBEb0g0T3pXTm9HQXNBRkI4NUVRcTQ2R2lt?=
 =?utf-8?B?TG5Sd2JiMlRId2dPaEpTaEI2L1NIR0RNSi9VKzh5a05pd2tIU0llRlhTaHlr?=
 =?utf-8?B?cllhT1I5MkNyalM5Nlc2MmpFQmhYMU5xODNDRHBleGhhVWw1MGx5alVwYy9Q?=
 =?utf-8?B?bk42WTMvYmE5MktZMHRUOTQrb1lEYk53NURQRXVXSXB5RXk3ZVlZazdXMWRN?=
 =?utf-8?B?TzJhRHY5eW9jMzBxc3hYS1VpR1VDRkFpVWtqQkRERjJDbGQzRFVaMEpTWG9m?=
 =?utf-8?B?Ujk0QWszRG9UeEVDa1NZeGlGZmNadkVtakpGUFhXNE5WekpEaXNROVJuUzVN?=
 =?utf-8?B?dS9PR25jY210ell0ajVwdVEyVmxBSGZQQjVyOE11bGYyVTdpcytCUU9wREcr?=
 =?utf-8?B?VXFZWUlEbEN5VGpEQ3ZGUEFVU3ArSXhqMEJWUGlJdVFwRDNLN2JhZFNwSml4?=
 =?utf-8?B?bVFhNUcybEJScGxsL0pnOHlhMUVnRHV1SVprb0ErakhxcGpEV2xEWEYrUWJv?=
 =?utf-8?B?dTYwMjJGcG5ndSt5eXd0SHlWNlN6aEZmNU1GY21uOHZmaWFoZjhrdTR6WXZy?=
 =?utf-8?B?T01oNVViVnFvN3E4bFVLVWc0NjBSQXV0Ym1XMEVOYVZHQVpNRURaZ2ErK3JI?=
 =?utf-8?B?aGJKdmtRZHNRMXpBRisxcmsxTTJ6TmFmOHIwZz09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB8749.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021)(921020);
 DIR:OUT; SFP:1102; 
Content-Type: text/plain; charset="utf-8"
Content-ID: <B39E0C24C0BD2442A38F9BFA01435BC4@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9055
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 17d8cd6288bc4156824db116b62601cc:solidrun,
 office365_emails, sent, inline:d2f983e1515754cdab4444136324b4c0
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF0000004E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: b9ab60dc-da40-459c-9e8d-08de161cf597
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|14060799003|1800799024|82310400026|36860700013|35042699022|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjhWK1JDRzBIR3FRM2U0cFJmRUtQczMxYy9GWDBVMVdERDF6WFRIS2kyTTFP?=
 =?utf-8?B?YVNEWjhVWll6R1lXcjhZK0YvZVArc2V0YkM4V2pwRlJCL3R3K3FvQzM4UzR5?=
 =?utf-8?B?YzRPMTRnQ2MzY3FkMmR4WVlmQ0JsM3UzNzZ3R1BQdjF4bFBHZnA1d0wxTDla?=
 =?utf-8?B?c21JendCeEtBelNhbCs4bUV1OExDa2VoWFVMWGNOVEo4aEVxbzBWVlBad2ZJ?=
 =?utf-8?B?RkR5ZUhiVzA0SzZ3ZEYrOTdkdXBpMDJJSG9mN3drTkhGa3pMWTlQMGdTWUZK?=
 =?utf-8?B?ZEUreGdjbVpiR0YraXVkekp2ZjNqSm5LMVhYcTJBS1pVNkVoL2Q0YXRXNjdF?=
 =?utf-8?B?ZmVHR0MraVVvK3NDbkJSYkM4WXhGdTFzMkk4NlFyTWVFeHB3WllpU3lONUNx?=
 =?utf-8?B?ZGVXR2V3eXNKclE4d1cxQisxc2gzWXVuWnQzeHZCSENlSzNTM3pTZXhiNmd0?=
 =?utf-8?B?dHRnMzgzMG9Kd2xEckZHUHkvUnBmak4vK2l0bE4yNC82NkZqWVJDRUZNQlBO?=
 =?utf-8?B?SUpja1ZjdTVSb2RaK3FiU2drWVk5SVdkNmFHcDlhYVE5QkVZYjBXa3RYWllL?=
 =?utf-8?B?ekZRek9SUHlteEQrdzZlWkY5anQwVG9XaWprMVlNL0Zmd0dBUXBtYzBnbEpC?=
 =?utf-8?B?WjRKRUFRWndHSHUzdjM3U2kvVVRCYktrQi9UT0RobHpaemJmNzlBUFB5Yk1p?=
 =?utf-8?B?M1BYQmc0VDU3cXM3cW9JWlExYjZBZjBaYlAyTlIxc0ZjeEUrRVk0WVdod2ds?=
 =?utf-8?B?WjVxcFMzSWJTNkxiTk12amIvakZZREZDNjFxN2hpU3NOWURkZGhKVnUwY0Ro?=
 =?utf-8?B?VnpTcVBnUXcraEtXczkxdjRtT20yem5hc1V1KzBTekFXSitMSWRGNXhBTEFl?=
 =?utf-8?B?OTNwbTRYYmRNQ2Z3YVk0M09tbnVmMERoNFd4b2V4UUdsQ0ZnT2M0YVplVXpN?=
 =?utf-8?B?TnJZNFBCM1JNTGEzaS9oRzc4Y0dFQUpsc1AyQ2RVUlpVazZuSmVsOXh4M1Iy?=
 =?utf-8?B?cmVFRzVNMTRNbHJrNnNzYUk2Y09LK2ZaUjZuTktjbXRWaS9Cb2RVeTlwYnlX?=
 =?utf-8?B?cGJTNkgwaFA3bUx1aHhKVXJuNitCMTNzWEliZE9qemltdkRLeUY0VnR2QnVx?=
 =?utf-8?B?aHlCa2tuMjZDNjhXV0FzcEFabUNKcHJId0szc01oeFdTNFkrMFcrNkYvNGRy?=
 =?utf-8?B?VnAvdmVHOWwvNTZvZlpjTXFoa21LZGs0RTJWRmZoamFSNlhpNXdhcDI3SFdP?=
 =?utf-8?B?OW14aGZWcXFZakVid0p3L0RMbUZxTkhweDhJT3pXb1o4NFYxaXNWQWJkY1k4?=
 =?utf-8?B?Yjh1MVZzRVdZeENicnJEazNCS0pwZXc3VjJPbi9jb3JZdU5oN1gybm9RaUlp?=
 =?utf-8?B?a0h4Q2RVdlpqOWJrd2JYQ3kwbG1wRnpuZVYxNzlOUjJTQnVYdmFwR2EwYWhQ?=
 =?utf-8?B?czkrN055S3lNU0l0Y3pSWWlIcGJHVXp5OGRqSERUbWI4dUU4djllRklsWVFs?=
 =?utf-8?B?bzVNUGs1bFFaUDk5U3dSWThDcDR5czUza0R0Q3pZY1JDRGZLbGFDa1doR2lv?=
 =?utf-8?B?eFJIeklBb2RZMU5Nc2FRZXllYzBYWDlCQitIL2V5R0Npd0grMG5LVXFHUUJP?=
 =?utf-8?B?YkNFaGhXSVhFbHlrbWErU1QwTlAvWDFsQ1dUSHIvS3gvWkRHN1ZyMlFobCtj?=
 =?utf-8?B?T1hlR25CbzVwTVlqd1pKS2VvSlc4RkZuWjBnMzlRcHk2VHB6S0tMN1M4dHdV?=
 =?utf-8?B?TVdUVW5sSlB1NnBSUjNOaFd3c1d1MWx4T0g4Rk53cXJLOUFka2JEMkhiVDJL?=
 =?utf-8?B?NmZSOGZXdkxVK3VrTzJuUTNKUHl4UnYyNHVLWU9uWnE2dVpQWmFKdXNBbzNV?=
 =?utf-8?B?TVo1N01KSEx4UVV1QWxrT1pJbUM2cE9vQndVeE43OWRMZjJsd3VnVXAxNlBB?=
 =?utf-8?B?Tk1Pd3pxZDVYSEJ3NFgzRmRZcHhGdVU1ekJQalVnaU00VS8xWjFjR3FjN0tL?=
 =?utf-8?B?MjBWbUtVL3RSdmRRakZWUGhqeEpod2duakJpanhYS0JYZTZjRjZqNWdMT0ZP?=
 =?utf-8?B?Ti9KYXFKZTFSdzRpMkE1djBmeWVkOWdMaEhJa3UwL1lCdENLdUxXMHpGN203?=
 =?utf-8?Q?cGwxzQHZfur/0fCEFhW2J3iaK?=
X-Forefront-Antispam-Report: CIP:52.17.62.50; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:eu-dlp.cloud-sec-av.com; PTR:eu-dlp.cloud-sec-av.com;
 CAT:NONE;
 SFS:(13230040)(376014)(7416014)(14060799003)(1800799024)(82310400026)(36860700013)(35042699022)(921020);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 12:24:45.8633 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f09c3ae4-b195-4c30-98a6-08de161cfb05
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82; Ip=[52.17.62.50];
 Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000004E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7439
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

QW0gMjcuMTAuMjUgdW0gMTg6NDggc2NocmllYiBKb3N1YSBNYXllcjoNCg0KPiBBZGQgZGVzY3Jp
cHRpb24gZm9yIHRoZSBTb2xpZFJ1biBpLk1YOE1QIEh1bW1pbmdCb2FyZCBJSW9ULg0KPiBUaGUg
Ym9hcmQgaXMgYSBuZXcgZGVzaWduIGFyb3VuZCB0aGUgaS5NWDhNUCBTeXN0ZW0gb24gTW9kdWxl
LCBub3QNCj4gc2hhcmluZyBtdWNoIHdpdGggcHJldmlvdXMgSHVtbWluZ0JvYXJkcy4NCj4NCj4g
SXQgY29tZXMgd2l0aCBzb21lIGNvbW1vbiBmZWF0dXJlczoNCj4gLSAzeCBVU0ItMy4wIFR5cGUg
QSBjb25uZWN0b3INCj4gLSAyeCAxR2JwcyBSSjQ1IEV0aGVybmV0DQo+IC0gVVNCIFR5cGUtQyBD
b25zb2xlIFBvcnQNCj4gLSBtaWNyb1NEIGNvbm5lY3Rvcg0KPiAtIFJUQyB3aXRoIGJhY2t1cCBi
YXR0ZXJ5DQo+IC0gUkdCIFN0YXR1cyBMRUQNCj4gLSAxeCBNLjIgTS1LZXkgY29ubmVjdG9yIHdp
dGggUENJLUUgR2VuLiAzIHgxDQo+IC0gMXggTS4yIEItS2V5IGNvbm5lY3RvciB3aXRoIFVTQi0y
LjAvMy4wICsgU0lNIGNhcmQgaG9sZGVyDQo+IC0gMXggTFZEUyBEaXNwbGF5IENvbm5lY3Rvcg0K
PiAtIDF4IERTSSBEaXNwbGF5IENvbm5lY3Rvcg0KPiAtIEdQSU8gaGVhZGVyDQo+IC0gMnggUlMy
MzIvUlM0ODUgcG9ydHMgKGNvbmZpZ3VyYWJsZSkNCj4gLSAyeCBDQU4NCj4NCj4gSW4gYWRkaXRp
b24gdGhlcmUgaXMgYSBib2FyZC10by1ib2FyZCBleHBhbnNpb24gY29ubmVjdG9yIHRvIHN1cHBv
cnQNCj4gY3VzdG9tIGRhdWdodGVyIGJvYXJkcyB3aXRoIGFjY2VzcyB0byBTUEksIGEgcmFuZ2Ug
b2YgR1BJT3MgYW5kIC0NCj4gbm90YWJseSAtIENBTiBhbmQgVUFSVC4gQm90aCAyeCBDQU4gYW5k
IDJ4IFVBUlQgY2FuIGJlIG11eGVkIGVpdGhlcg0KPiB0byB0aGlzIGIyYiBjb25uZWN0b3IsIG9y
IGEgdGVybWlhbmwgYmxvY2sgY29ubmVjdG9yIG9uIHRoZSBiYXNlIGJvYXJkLg0KPg0KPiBUaGUg
cm91dGluZyBjaG9pY2UgZm9yIFVBUlQgYW5kIENBTiBpcyBleHByZXNzZWQgdGhyb3VnaCBncGlv
DQo+IG11eC1jb250cm9sbGVycyBpbiBEVCBhbmQgY2FuIGJlIGNoYW5nZWQgYnkgYXBwbHlpbmcg
ZHRiIGFkZG9ucy4NCj4NCj4gRm91ciBkdGIgYWRkb25zIGFyZSBwcm92aWRlZDoNCj4NCj4gLSBk
c2kgcGFuZWwgV2luc3RhciBXSjcwTjNUWUpITU5HMA0KPiAtIGx2ZHMgcGFuZWwgV2luc3RhciBX
RjcwQThTWUpITE5HQQ0KPiAtIFJTNDg1IG9uIFVBUlQgcG9ydCAiQSIgKGRlZmF1bHQgcnMyMzIp
DQo+IC0gUlM0ODUgb24gVUFSVCBwb3J0ICJCIiAoZGVmYXVsdCByczIzMikNCj4NCj4gU2lnbmVk
LW9mZi1ieTogSm9zdWEgTWF5ZXIgPGpvc3VhQHNvbGlkLXJ1bi5jb20+DQo+IC0tLQ0KPiAgYXJj
aC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvTWFrZWZpbGUgICAgICAgICAgICAgfCAgIDYgKw0K
PiAgLi4uaHVtbWluZ2JvYXJkLWlpb3QtcGFuZWwtZHNpLVdKNzBOM1RZSkhNTkcwLmR0c28gfCAg
NzAgKysNCj4gIC4uLnVtbWluZ2JvYXJkLWlpb3QtcGFuZWwtbHZkcy1XRjcwQThTWUpITE5HQS5k
dHNvIHwgMTA1ICsrKw0KPiAgLi4uL2lteDhtcC1odW1taW5nYm9hcmQtaWlvdC1yczQ4NS1hLmR0
c28gICAgICAgICAgfCAgMTggKw0KPiAgLi4uL2lteDhtcC1odW1taW5nYm9hcmQtaWlvdC1yczQ4
NS1iLmR0c28gICAgICAgICAgfCAgMTggKw0KPiAgLi4uL2R0cy9mcmVlc2NhbGUvaW14OG1wLWh1
bW1pbmdib2FyZC1paW90LmR0cyAgICAgfCA3MTAgKysrKysrKysrKysrKysrKysrKysrDQo+ICA2
IGZpbGVzIGNoYW5nZWQsIDkyNyBpbnNlcnRpb25zKCspDQpjdXQNCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtcC1odW1taW5nYm9hcmQtaWlvdC5kdHMg
Yi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bXAtaHVtbWluZ2JvYXJkLWlpb3Qu
ZHRzDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMDAuLjJlNGNi
Njc2YmM5ZGENCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2Zy
ZWVzY2FsZS9pbXg4bXAtaHVtbWluZ2JvYXJkLWlpb3QuZHRzDQpjdXQNCj4gKwlsZWQtY29udHJv
bGxlckAzMCB7DQo+ICsJCWNvbXBhdGlibGUgPSAidGksbHA1NTYyIjsNCj4gKwkJcmVnID0gPDB4
MzA+Ow0KPiArCQkvKiB1c2UgaW50ZXJuYWwgY2xvY2ssIGNvdWxkIHVzZSBleHRlcm5hbCBnZW5l
cmF0ZWQgYnkgcnRjICovDQo+ICsJCWNsb2NrLW1vZGUgPSAvYml0cy8gOCA8MT47DQo+ICsJCSNh
ZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiArCQkjc2l6ZS1jZWxscyA9IDwwPjsNCj4gKw0KPiArCQlt
dWx0aS1sZWRAMCB7DQo+ICsJCQlyZWcgPSA8MHgwPjsNCj4gKwkJCWNvbG9yID0gPExFRF9DT0xP
Ul9JRF9SR0I+Ow0KPiArCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+ICsJCQkjc2l6ZS1jZWxs
cyA9IDwwPjsNCj4gKw0KPiArCQkJbGVkQDAgew0KPiArCQkJCXJlZyA9IDwweDA+Ow0KPiArCQkJ
CWNvbG9yID0gPExFRF9DT0xPUl9JRF9SRUQ+Ow0KPiArCQkJCWxlZC1jdXIgPSAvYml0cy8gOCA8
MHgzMj47DQo+ICsJCQkJbWF4LWN1ciA9IC9iaXRzLyA4IDwweDY0PjsNCj4gKwkJCX07DQo+ICsN
Cj4gKwkJCWxlZEAxIHsNCj4gKwkJCQlyZWcgPSA8MHgxPjsNCj4gKwkJCQljb2xvciA9IDxMRURf
Q09MT1JfSURfR1JFRU4+Ow0KPiArCQkJCWxlZC1jdXIgPSAvYml0cy8gOCA8MHgxOT47DQo+ICsJ
CQkJbWF4LWN1ciA9IC9iaXRzLyA4IDwweDMyPjsNCj4gKwkJCX07DQo+ICsNCj4gKwkJCWxlZEAy
IHsNCj4gKwkJCQlyZWcgPSA8MHgyPjsNCj4gKwkJCQljb2xvciA9IDxMRURfQ09MT1JfSURfQkxV
RT47DQo+ICsJCQkJbGVkLWN1ciA9IC9iaXRzLyA4IDwweDE5PjsNCj4gKwkJCQltYXgtY3VyID0g
L2JpdHMvIDggPDB4MzI+Ow0KPiArCQkJfTsNCj4gKwkJfTsNCj4gKw0KPiArCQlsZWRAMyB7DQo+
ICsJCQlyZWcgPSA8Mz47DQo+ICsJCQljaGFuLW5hbWUgPSAiRDgiOw0KDQpjaGFuLW5hbWUgZ2l2
ZXMgdGhlIGxlZCB0aGUgbmFtZSBENiBpbiBzeXNmcy4NCg0KVGhlIGJpbmRpbmdzIGRvIG5vdCBh
bGxvdyBob3dldmVyIHNldHRpbmcgY2hhbi1uYW1lIG9uDQp0aGUgbXVsdGktbGVkLCBhbmQgaXQg
aGFzIGFuIGF1dG8tZ2VuZXJhdGVkIG5hbWUgaW4gc3lzZnMuDQoNCkFtIEkgbWlzc2luZyBzb21l
dGhpbmc/IENhbiBtdWx0aS1sZWRzIGhhdmUgYSBjdXN0b20gbmFtZT8NCg0KSW4gdjYuNiBsZWRz
LWxwNTU2MiBkcml2ZXIgaWYgSSBzZXQgaW4gZWFjaCBtdWx0aS1sZWQgbGVkQFswLTJdIHN1Yi1u
b2RlDQpjaGFuLW5hbWUgdG8gdGhlIHNhbWUgc3RyaW5nICJENyIgLSB0aGVuIHRoZSBzeXNmcyBu
YW1lIGJlY29tZXMgRDcuDQoNCj4gKwkJCWNvbG9yID0gPExFRF9DT0xPUl9JRF9HUkVFTj47DQo+
ICsJCQlsZWQtY3VyID0gL2JpdHMvIDggPDB4MTk+Ow0KPiArCQkJbWF4LWN1ciA9IC9iaXRzLyA4
IDwweDY0PjsNCj4gKwkJfTsNCj4gKwl9Ow0K

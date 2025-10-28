Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B737C146AA
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 12:42:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F110210E025;
	Tue, 28 Oct 2025 11:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="epzoM7XY";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="epzoM7XY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11022102.outbound.protection.outlook.com
 [52.101.66.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 788C410E025
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 11:42:24 +0000 (UTC)
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=GJDZG2UfUusBD89FEOpb9gX4VlYKfIWPNRqKPOTH0EAhuiUssdVHK5pDEyqy4qk2OD39M0erwNrDwkkcIe6PGBy5sArFut+0gQ3BQ3aOsZPJlc6RA08hvk+CIP6g50ZIlhH4t9mEb9FMxmkRWZBdDX4seSNGtNCQgHFWMq9FqsuDaWWvzhMrWBjryT4Ux3CoX4YcfXyNOluYaueJR1i8L2a52EEi+OcChQSmH9au9uX8DtvpjR4TOBZ/PxepV7NGYBBNGYXmmceVDvGc1zWUHh7kEVWOq9c+IcC++0eg9Eeaup62y+/FMiT99aMd9Z8IaZoQ6I2iYu+qs3bqk1OJFA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fWja487z8KG0hO8EGXK+c0rj3MtZujG45rmZaSfHkLg=;
 b=qUHdkUuH+W8CRhC6jyjkYW0mem7ie3P5TIS4r9S0ehKpiIw9C5KgQHH6m5VrOZB2pK5lpRXB4nQqNt22QA1lg/9k9uerdXiab1TQWnvZyAvlxvJgzl4h13Y/PdnYUlLCh4h96bmWnkjTFPXMzjQ9DScKlX9n4rXEIW94X7X9dtbg9IaumU+RvPq138YL9mouoZyCDkqfl/AA5HjiUtGyrCUXo0JbFZ4X6m2umzT95DRG9OcdLBUg374sIRYJ2k/qnQqnkFy8SH4sGCmsm5Htd9Dw/Rmnrg3Ats0YEURXIkyXvz7kWKcPNobo0k2ab9G2LjrFNoOixYv1OxwR9iXnIA==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fWja487z8KG0hO8EGXK+c0rj3MtZujG45rmZaSfHkLg=;
 b=epzoM7XYUX/4Q240+4x8Q0yY9hebxL7HX4ziUqXC5zETmaxQfRY9UsaPMIaGYb9rNp0hstelPEpTVS9+SfiirF7yIcZanRWnLySf7ugnj8BCeWrONGz0yVpXIB/KPPxD+JEMCJZk82Xo67Koe+DwsBb/ySqH2Z+DMgsl+RwheVY=
Received: from DUZPR01CA0122.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::26) by PA4PR04MB9461.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.17; Tue, 28 Oct
 2025 11:42:20 +0000
Received: from DB5PEPF00014B95.eurprd02.prod.outlook.com
 (2603:10a6:10:4bc:cafe::3c) by DUZPR01CA0122.outlook.office365.com
 (2603:10a6:10:4bc::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.19 via Frontend Transport; Tue,
 28 Oct 2025 11:42:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB5PEPF00014B95.mail.protection.outlook.com (10.167.8.233) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10
 via Frontend Transport; Tue, 28 Oct 2025 11:42:20 +0000
Received: from emails-5661497-12-mt-prod-cp-eu-2.checkpointcloudsec.com
 (ip-10-20-5-121.eu-west-1.compute.internal [10.20.5.121])
 by mta-outgoing-dlp-431-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with
 ESMTPS id E9D0A8040A; Tue, 28 Oct 2025 11:42:19 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1761651739; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=fWja487z8KG0hO8EGXK+c0rj3MtZujG45rmZaSfHkLg=;
 b=MpsvKIofTv9WzNFheqwqsGeD64ISL56atNSuMsLGXHCGOBt51d94rZAbK3uWPYaJiJPIk
 MKLwj4dPDTiqzkqsZOOaow2EpVfCY7n1gqEe7wgNI1iNirMSM+/QrpgL594amHnqIuLgxsM
 8DyNt9CKMMVjMgbeh9wE0WFiapO3MYw=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1761651739;
 b=bz2jNhRbWXiUbTEfgHpwYrvS7JyFiGdpTkjE10JrfFic9A62OZ2Q0F6M/5mkpEKXH1Abk
 SVMBgYLxZwX18O/t0+yTdFiyJTjX7W1PQwv5wPW+w/KG+SP/ohAfzN4Mneqz0MlJqfuOHnS
 zY7uE2b8DCHQbB1zjNk1oGbozVf1sLk=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dXqPOSjMe9K2j4eUakzaMgOxJuX4JftQMPCx5Kt3g2v/zOQE/dmPL00R71LzBwbo26wC/1PhZ9tzdmBsh0bORNja6m1JDfkK23xGm+T8AjrwvwydQJ//1aLtdljDQjX8pk1lNWl6zwIFG48ePkEOMn6gDh5mnXF7jstjmRTZn/T9YSZL7dg46BcMq9PMO0yG7dVdPOBfs+9A27RQOOxN4jCDg2jRAju642U8GBtM3o/haHlCrTQ/fcIjvlZZFY/AzZ6nrqgKD7YBIBUJ7MzcgCsZoqWAPZxxdVkFn0IyjzqsP/VAtjAq3BNTmtzk74NML3Wn0s35rTgFmtjCOb405Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fWja487z8KG0hO8EGXK+c0rj3MtZujG45rmZaSfHkLg=;
 b=nN1eEiG2gwcyltL1vN4NZnLMm/Gm2KDtLHomRNEUm1OArIZgVtT5eh+Sndx0M1hVB6riHw3UIYQyETzHgJKpSrWMq6kh4v5CeyWDnta1o9FJHCO17vSyVy4ParprhJAe6Stx/iZ2CdIyMPLoTD9AhkiT5CuxmxUxr07Q28SyiRrJ1P1hI6aENnBvCfTaieVO3VYIoOD2smUazlGy2HFgWE4luXELpgARYHICF8XKsRef+ne8FhQkJFmiC4M6T3ruOCFxKcBYiC5wyY8UxqokPFkTtRNgvDgwK/owI7dyOoJxFMHrUnSiCLGvXx4i+N7kw1QXH3alrjY5G+K07/Sbbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fWja487z8KG0hO8EGXK+c0rj3MtZujG45rmZaSfHkLg=;
 b=epzoM7XYUX/4Q240+4x8Q0yY9hebxL7HX4ziUqXC5zETmaxQfRY9UsaPMIaGYb9rNp0hstelPEpTVS9+SfiirF7yIcZanRWnLySf7ugnj8BCeWrONGz0yVpXIB/KPPxD+JEMCJZk82Xo67Koe+DwsBb/ySqH2Z+DMgsl+RwheVY=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by PA4PR04MB9296.eurprd04.prod.outlook.com (2603:10a6:102:2a7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 11:42:11 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 11:42:10 +0000
From: Josua Mayer <josua@solid-run.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, Jon Nettleton <jon@solid-run.com>, Mikhail Anikin
 <mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 01/10] dt-bindings: arm: fsl: Add binding for various
 solidrun imx8 boards
Thread-Topic: [PATCH 01/10] dt-bindings: arm: fsl: Add binding for various
 solidrun imx8 boards
Thread-Index: AQHcR2ngHAXhUvqfzkCW8b5pOviz+LTXQ8yAgAAtKgA=
Date: Tue, 28 Oct 2025 11:42:10 +0000
Message-ID: <76635f9e-c622-4700-afb8-97afc996ca76@solid-run.com>
References: <20251027-imx8mp-hb-iiot-v1-0-683f86357818@solid-run.com>
 <20251027-imx8mp-hb-iiot-v1-1-683f86357818@solid-run.com>
 <20251028-truthful-dexterous-hyena-d3d4c5@kuoka>
In-Reply-To: <20251028-truthful-dexterous-hyena-d3d4c5@kuoka>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-traffictypediagnostic: PAXPR04MB8749:EE_|PA4PR04MB9296:EE_|DB5PEPF00014B95:EE_|PA4PR04MB9461:EE_
X-MS-Office365-Filtering-Correlation-Id: 609bcf55-6ef2-4032-23fd-08de16170da0
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700021; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?NTVZdnk5Uis4cUd4VjNlTDRHWTJmUUg2SnBTRS80cElHek5FVWkxY0wwWm1h?=
 =?utf-8?B?NzNoZll5am45OER2bi9PSWxBcHN3YmpzNWpDY3dLM0JZOHc5R1JuYjVHSDZM?=
 =?utf-8?B?cnYzSHpKeXNidWFBWVVoYlRCTW1DK0VXSHdqcXNPUDcvSVZXNVR2MnJaclZH?=
 =?utf-8?B?QkNQcUY2d2x1MllnNTUwTDdhYXF0NXhJMTMyUWlUd01qeFpuRUxEZHhhaDNW?=
 =?utf-8?B?WlpKL3l3YytZb0wxK1ZJL2taYzY1cE9xaERtdERwMzhlWElCVEtiUDJkT0F3?=
 =?utf-8?B?Qmh0Ujd0d0JvakZJaUd6d3hqdWo4K2l3TEFWVnNqYUV2WTZORURsV1l0SWpt?=
 =?utf-8?B?aVB1YSs4S3grR3pMOTNKWnZDWWxsNFBXSmd2UzdSU094Um13d0NnbU10ZDdm?=
 =?utf-8?B?ZzM4VGVwUEduWE9oSUxpZzdtY1h2MkY2MDUyakw4SzJzK0RFanNjZ1dKem9u?=
 =?utf-8?B?MjFTMGsrUkk1c2kwSXNRZ3hsdyt6WlJuMUVVVGVlOWQ3OEhQZFZTTzA5Lzg1?=
 =?utf-8?B?b0NKcDdjTExGc3Y1RVpyWkp0NXF2c3ZtUjVMQklBOFVYWU0vZGsvSzM4Rk9h?=
 =?utf-8?B?SFJaVkJjQ2pMaWlvTFZmS1U0NTJpdi9rVjVUMkhETlptOG13OHRpRzRIamY5?=
 =?utf-8?B?aEdIUnJlc3R5YndPNE9SMzJOSW50Sm1nZmgvbHRWcllRTThuT3ZkdTQwRDRJ?=
 =?utf-8?B?UE5xcSt0OVZzaTFXY2FEVUNGNm1Sajd4bVA0akF4UGNBUkdBdytDZUVFakxF?=
 =?utf-8?B?YkQyQi94S1pFcy9BS3VlMTBzUXZ3K3Q3YmcrbExPQ1ZRSC9CS2FJZnc1TzVJ?=
 =?utf-8?B?RnpaaE16aFo4YmZxQUhZYmlvbzJkcHZHa3RacmxhNmRoWFhxTUVFWTBTekF0?=
 =?utf-8?B?WnZKV1E4QTFrcTkrdHRxdkZCQW5sQ05TZXpFakpjdWE3Tk9qZGttS09PZDkz?=
 =?utf-8?B?VnQxWitVZXpTc3YzM3FMRm50VUplaWNTQW52Ty9vS0ZNRnpZQWxUcHZCNDlF?=
 =?utf-8?B?WjJXdUF4S3lQNStMa0p4MGQyZGo3dUhxSnRyMDI0Ung4d2MvVzJiYkx5cTYy?=
 =?utf-8?B?TE0zOHVxNXJucFBlNXQ0aVlISDlGNVdyRWw3NExTUlZxeldyNUZIOEZEZnp1?=
 =?utf-8?B?NGIzZ1E4NU4ycU1yL2VLYUkxVysrdk1wczNMRnkwRm0vZEt3S3U5emJ2TGtV?=
 =?utf-8?B?RHdxd2pUN1JVRzE1K0I2S1lBQW9USzZZVmxMbjJNaElWeEZWRnMzVkYvTlhw?=
 =?utf-8?B?S01CNXcyY2Mzck1YVHp6bEZhaXR1Ni90Y0VEb0t5ZWlMTW93MTZlUitNdUI3?=
 =?utf-8?B?MSthODZBRDVvRGE0N2VxNm1waHR0b3M4L1MwYSt4Y0FDUUxBRFY2cVhzSm9h?=
 =?utf-8?B?RjNMY09UaERXaVVNKyt2a0wwT3VLVFM0MGluZUY5aWt2eEEza3ZtaE5XOFhI?=
 =?utf-8?B?MkFTMFZLOUl4bEFveElkckpvOWRrbHVlbUpoSSs1QzJCRGxJdEtDbHZhVU8v?=
 =?utf-8?B?dE03ME1LODBYa1UxSW1ueU8zdGY5SS9YQ3krYVZoZkN5clZyeWs5UlVPOGRR?=
 =?utf-8?B?emhJZld5eklyS3pTOXY1cEhZZHJOZUlWRmJUUEZvUkQwQnVvY0NIaDV2VG5R?=
 =?utf-8?B?c3Z6T0pYcE8wbDBmdDNQUzVnRUhuSG9YaUJFdzVkcnp2TnNuMXFGcUNhZlp3?=
 =?utf-8?B?Y1M0SW8rNko5cVVwS3V6UGF2SVFLMXdGRFExS0JyZmJuOFVJMWhiMDk4dTFt?=
 =?utf-8?B?amt3bWlJWEt5djYwMDRHUmhHK2UxOTBtWGlKRGhzOXFPYlIzYVB6VHNZN2pX?=
 =?utf-8?B?eXVpWGVBa0prNXJmTVIrOGZOUjl6ci9SckFUUzM1ci9TL0ljREdjNEtpaUJ6?=
 =?utf-8?B?azhlOTF0OFF2UVJPZTluNEpWd1VGSUI2eDA5TlBSZFE5NTRYRmY5NDJEcGUx?=
 =?utf-8?Q?34A2ynLymW7GWPgamZA9wNUCvCd9H/BU?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB8749.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1102; 
Content-Type: text/plain; charset="utf-8"
Content-ID: <D3D44D430BA1FB4DB128D66FCEE02095@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9296
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 9bbe48a3c0ab46ee9f307fe1873fb835:solidrun,
 office365_emails, sent, inline:76fa2e8c87864c9bea8ab77815420b07
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B95.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 823a34d8-5195-4eb7-b4d7-08de16170800
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|14060799003|7416014|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SG1WTTRiZ0JKbkE4T3kwU3gxSmF2QUtHS3ByRzVYY2xQSkxvZ2EwbGM2bTVY?=
 =?utf-8?B?ZXFwYlZlSyt6bE5sN1RhTnhnSE01TWlOV1dnY0hBQ0FabThIVHl2U3RQMldp?=
 =?utf-8?B?N3pYOTRZbG44MVJvSFlvdFdPVmxhd3dvYzFOSFRTd0xJb1k4SlU2NFgyVEFM?=
 =?utf-8?B?b3A5SFU0K0tIYm9FMHJsK2VzeHRmYy8zTm14bmtlQTdzcUlRZ041LzlHUWZM?=
 =?utf-8?B?NFVRVHdLbTlwa3lqdGlyUEl5aWtRYzBQQWFHd3V5VUp1YjhYSzU2VkpqZ0hp?=
 =?utf-8?B?R0oyR20wcEpIOGlMY21EOXZocUZubDlBNktRTStUWkFQM0g5QUU4TDVQejBx?=
 =?utf-8?B?aEE0azZLUFZmcjh3ZDZkZ2VuMUQyTmRCa2FrOWZqVnRQYWFUNm5EYTZPU20r?=
 =?utf-8?B?eW9EcWVzdVZnS2lBeVNrL2RxTEkyZjVmdjBoZnowdW5vSG5nNlBXSVJYWGF1?=
 =?utf-8?B?bnhhQWZ6ZTdHOFZLeXNVQW1aSGFyV0M2bGpGdVhOejcwM3djL2NjdGNtUzBi?=
 =?utf-8?B?cnhlbzhxaDdMT3N5YXZhVHd4eGtNbVl6dnYwSi9Va2hMa081bGlTNFh0ZmpH?=
 =?utf-8?B?L1RSV0U3eFd0SEZOZmh1ckFkc0lTTTN2ZGV4MFJIMEFBMnhQaDR4THd4NnhF?=
 =?utf-8?B?L0ZMdldDb3VadDBjc2RFTHZ3YWNXRS9HOVFHRHhDazFhSEVsYmFLa1BoK3dJ?=
 =?utf-8?B?THpEMEhnc2NrUTVSV0JKQ3JLbHk3RlVRUlZZUXVZSGNnN0djR0V6UEREMGNC?=
 =?utf-8?B?NFdNOHRhV2x5M3ZtaCtDaklmMGw2aXlOR2xYOElSc3d6bnVkRkRjdWp6bWM0?=
 =?utf-8?B?MStXVEMvdm11RkthOFJOYWNIcjBOaDE5V3VkMTR6dGV6TGFaejNWa0lkTG82?=
 =?utf-8?B?eldlMEYvNktnRVNTdzJoaGVNTHBBOG42V1NLT1ZINEdvdjZlZlhWZUNHQVEy?=
 =?utf-8?B?VWI3WWQ5WnlIVmZEWWVOcFkwMjdVb2xPditTQW1vS3duVmRPNmVlQnArYSts?=
 =?utf-8?B?QmpmcCtCM29aN1lzcUQxcElOTEgwcmFrVHNtSWlVcVk0SzVyK0RlQ3YyVktL?=
 =?utf-8?B?UTQzOEx1MjRGUU5aYWd4UThNajh1ZUw4bHN3Qlo4UTRTdEhWL1NRMSszeFBu?=
 =?utf-8?B?SkdrT2JjT2cvbUcrWWVaUXZzOG9sUFNIeHNORXAwUkVSNnRUaXRmL09BU0Ft?=
 =?utf-8?B?L0J0NWJWcDhkc0oyckVyd2ZSYUl1aGZGOFJtRlNiQ3Q3VXk5TVJYa1B4QkRx?=
 =?utf-8?B?Z2hNdy9SdFhOR1lQM3FEZnZ2dGs4L09NK2VMRXlGNVpUM2U5TXZ6Unk1YUkr?=
 =?utf-8?B?R1l5dXlWYmEwQTFWNm1kUzdLQ0dUYWlBcTFqUFF0TXppVmRPZUhlL0Q5ZEdk?=
 =?utf-8?B?amtHOUdDS1cxZzFHelU4SFU0K3FLL2Vtd29KN2lKZGpMWVlhblZzempyNnhw?=
 =?utf-8?B?akFWOVN1bHBFMlVyNG5lNlNEK1hvVDdRYnFSRWpsR2FRSDZSTWlWakJlcEVJ?=
 =?utf-8?B?TnMrekx2dHhUd0ROd2toZ2x5T055dHNGb3krbU9oWHhOa1lIZFdKRHlXbzZ0?=
 =?utf-8?B?LzQxaEg3b0hFMTh2RFRWWGFCNDlnTmltZE9BQmFWeVBYZTNOaDVxTUFyeDFG?=
 =?utf-8?B?VlB0YjQ1RXRjb0tNRnJoejFiWlhPZXFFN1pYeEJtUFQrZEpQb1B3aUZiVVlN?=
 =?utf-8?B?VVBJRGhUWWRndWZrSStlaklIa3N4SlB5ZmJ0NjdsNWJNUFhhOXltc2pUY3BC?=
 =?utf-8?B?ajViR29KdlpwSjVwL1NSN1NiREdtTlFzaHJWd20zRjZJUVBsQms1Y0lqTTdJ?=
 =?utf-8?B?MitnZWhzVDFEb2V5OXVGVWJLeU41K1E1Wms0MlR0eXhuV1N5R0oxRk12VS9x?=
 =?utf-8?B?Tk5kQVdMZldRSVRLOEc3c3Y0UlFaZnhxTWU4T0NxcFhKOUpMdFBHSlhMaXlO?=
 =?utf-8?B?Z250Y0VOL3g1ak1oaXlZa1kram5WbGVPRk1DeXdlNVFMZ3NMc012UmJqM2Yv?=
 =?utf-8?Q?G1uSJlUMzWxJLysWwdMdJMRIB2IVJA=3D?=
X-Forefront-Antispam-Report: CIP:52.17.62.50; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:eu-dlp.cloud-sec-av.com; PTR:eu-dlp.cloud-sec-av.com;
 CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(14060799003)(7416014)(82310400026)(35042699022);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 11:42:20.0375 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 609bcf55-6ef2-4032-23fd-08de16170da0
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82; Ip=[52.17.62.50];
 Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B95.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9461
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

DQpBbSAyOC4xMC4yNSB1bSAxMDowMCBzY2hyaWViIEtyenlzenRvZiBLb3psb3dza2k6DQo+IE9u
IE1vbiwgT2N0IDI3LCAyMDI1IGF0IDA2OjQ4OjEwUE0gKzAxMDAsIEpvc3VhIE1heWVyIHdyb3Rl
Og0KPj4gQWRkIGJpbmRpbmdzIGZvciB2YXJpb3VzIFNvbGlkUnVuIGJvYXJkczoNCj4+DQo+IEEg
bml0LCBzdWJqZWN0OiBkcm9wIHNlY29uZC9sYXN0LCByZWR1bmRhbnQgImJpbmRpbmcgZm9yIi4g
VGhlDQo+ICJkdC1iaW5kaW5ncyIgcHJlZml4IGlzIGFscmVhZHkgc3RhdGluZyB0aGF0IHRoZXNl
IGFyZSBiaW5kaW5ncy4NCj4gU2VlIGFsc286DQo+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29t
L2xpbnV4L3Y2LjE3LXJjMy9zb3VyY2UvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3QjTDE4DQpBY2suIEknbGwgdXNlIGJlbG93IGZvciB2MjoN
Cg0KZHQtYmluZGluZ3M6IGFybTogZnNsOiBBZGQgdmFyaW91cyBzb2xpZHJ1biBpLm14OG0gYm9h
cmRzDQoNCj4NCj4+IC0gaS5NWDhNUCBIdW1taW5nQm9hcmQgSUlvVCAtIGJhc2VkIG9uIHRoZSBT
b2xpZFJ1biBpLk1YOE0gUGx1cyBTb00NCj4+IC0gU29saWRTZW5zZSBOOCAtIHNpbmdsZS1ib2Fy
ZCBkZXNpZ24gd2l0aCBpLk1YOE0gTmFubw0KPj4gLSBpLk1YOE0gTWluaSBTeXN0ZW0gb24gTW9k
dWxlDQo+PiAtIGkuTVg4TSBNaW5pIEh1bW1pbmdCb2FyZCBSaXBwbGUNCj4+DQo+PiBTaWduZWQt
b2ZmLWJ5OiBKb3N1YSBNYXllciA8am9zdWFAc29saWQtcnVuLmNvbT4NCj4+IC0tLQ0KPj4gIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnNsLnlhbWwgfCA5ICsrKysrKysr
Kw0KPj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykNCj4gQWNrZWQtYnk6IEtyenlz
enRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4NCj4NCj4gQmVz
dCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCj4NCg==

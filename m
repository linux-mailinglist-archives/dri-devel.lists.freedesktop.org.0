Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 727A9C11AE8
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 23:26:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E64810E561;
	Mon, 27 Oct 2025 22:26:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="mMDROZfL";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="mMDROZfL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11023079.outbound.protection.outlook.com [52.101.72.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54DA110E537
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 17:48:45 +0000 (UTC)
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=E7qzVuVhLgwfFKrXNe2VZwOFo2QsfSQAmg6YXPIddLQer6hkjD7s8EZ2lKoPnqnHLp+FRcuZ4P0rBG8OIA2BMShp2s3tilQ7KDKNJTbAR2CCiG5O6MSxkGfpysPi5tugByh1yb9knh7PlHZTILfmbBe5EmO0SLItSWurC8s1L+aL5nEk+2lKlr/bTcGd1aet1pj5syA2FpSk0TPp2MGtq3OFKSN871SnzPQbEFTW0MN1VIHA41p9yIC7RAzt8VdOLaYYrdklQYUNbB+Mg9suasT8FqxRpXu8nYNwuPkjcYQt5+NVmoAq5i/iqHfKdQJMxRTQfN1z+f2RVhGEzlDtOg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cWyL2VQlf2sqGUDJNav0ukW8b6dKw3K6ze74HDXMmRE=;
 b=mKaXqhWho+F2/rLQ2Sc8Qloq9p2vHQFKRDSPC4VjRbqUT6bqTQcLyZN31a8fc0MVp/3KRcxkk3ZKQg5UyxpLqsJv0OpnnCqpjK2VKsMaesMajCrp8mKvSmvnJz2oatM7Ug8ytHThYaGbMYl0to/oaPLgCfukUx1uX6vvdupe3GpclOk+WJY9lDxHw16/2Fu6KKkBcQk0KWz2KDE13qowRmtV6HmNdzLUMxVbVhZwUsfoZWDI4gzfWkDgcnfO8eecuRH8nNZACpXDNnxLml9lD4tPxHkiuXDZJEjH8esz8WsMkq2J86HarRm8/P8J4D1wMlBejCOoROIdE6DvR4PazQ==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWyL2VQlf2sqGUDJNav0ukW8b6dKw3K6ze74HDXMmRE=;
 b=mMDROZfLYHNIQoXIbzsEEI7oxg63ZD6UxESbIOw8U1daD61MYUD2ObOAZ4YLKGZ/Dj2Udqz1Te3jhNwg0CnNf8iqhiHPIrCmuhLDTosJEqPTxFXvIiwmv+aX4SxMALjrbSpGTo0IC+XqIEmsQvYAoLrzEyA6rhUFPNrGslKub10=
Received: from AM0PR04CA0069.eurprd04.prod.outlook.com (2603:10a6:208:1::46)
 by VI2PR04MB11169.eurprd04.prod.outlook.com (2603:10a6:800:299::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 17:48:40 +0000
Received: from AMS0EPF0000019B.eurprd05.prod.outlook.com
 (2603:10a6:208:1:cafe::da) by AM0PR04CA0069.outlook.office365.com
 (2603:10a6:208:1::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Mon,
 27 Oct 2025 17:48:40 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF0000019B.mail.protection.outlook.com (10.167.16.247) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10
 via Frontend Transport; Mon, 27 Oct 2025 17:48:38 +0000
Received: from emails-6569303-12-mt-prod-cp-eu-2.checkpointcloudsec.com
 (ip-10-20-5-121.eu-west-1.compute.internal [10.20.5.121])
 by mta-outgoing-dlp-862-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with
 ESMTPS id 786F9802C4; Mon, 27 Oct 2025 17:48:38 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1761587318; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=cWyL2VQlf2sqGUDJNav0ukW8b6dKw3K6ze74HDXMmRE=;
 b=EKdw+DtoaZw5tuhaSOMzqlRHn8SzkYtvDFpno6N69AwQED8UV1uhHL6sqL6F4+vGsIbyQ
 8yZxrp6IzxY6RXyB9T6KHLWBK70u5wvX2UcY6ZgWWGeu7vEPaV5twr5QRFgXZVVeSURfZce
 1Uq0/crix1OKVIRbE7tAPYP3kenvAco=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1761587318;
 b=JQfpMcKQpD55AUn+lKGgjYG3h8KReAQIvTs7VcnAClSrDAe21vhWAC50qdYVm55n0/4MR
 xaf5o1PuXBn2k4qOPmu3efqcG7eMxf2nyG5n6gnWzwOwIRlNCbHDOKrxWZDKdUvU/PW78f9
 kEDAUVJCDXl8cAqWn/YS886/gZn/+4g=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dOalUcfY8LpmnSuGWOzH/0ycR4XKUEv/VesB95TlDO3ogsw31fcFcViI+Dew6McmXSfGtGHf5GDVGEYeBvUgaqR8VqOtfiPyJwKfxJqwBJxQem61cnaJN/Pg6FHO2aU4d/hf5vXtpn551ep3GG6bai9POMQ99XFWgfWsuspbn10mYmQltZVb6XJBOv49y9pGZuKaySeHch9c2svhaT3j67WiDsXyQU1ucxq5VihE96mdEOlAiai/6CtcjwhudBdM3ZDmI3FJmaI34M9bZagIpW7M7paLis4eyMyj8XTIiv+r5s7v4km7+wPp1gelP9omSDOu4GC4vkxrQkvqq84awA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cWyL2VQlf2sqGUDJNav0ukW8b6dKw3K6ze74HDXMmRE=;
 b=fzqbHS3DwGZWESjtU52X09wtIjiIZM+gCVyErQ37Nd7FwFRe+8ZyCthCnfgGD9Fw2+4Iny1Qmr14f1EsoyV3xikxHyJNpLuCWfoeHy1CGxFlEYgN3JjB9635EbhkNaOQyX8sBYAaeWMLsGOip7kv9k7ZQURXK7sbfcAgKDhJ/GgvmYKk3mFkDT4k2R1LRN5bVCTbZ4jivg9LsRFHYcckSxQUo6FiJ9oaKoj9mButJlY5wUQkrYUsBIm3mGeSrQzpvEYnGHREOGGmC0S6PCskntiCyhuabkrgQzm/FMmYSSgIk2jCE1d7KBLy5TcudfsGnX0t+2IPkDYLqZQ1Zixi2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWyL2VQlf2sqGUDJNav0ukW8b6dKw3K6ze74HDXMmRE=;
 b=mMDROZfLYHNIQoXIbzsEEI7oxg63ZD6UxESbIOw8U1daD61MYUD2ObOAZ4YLKGZ/Dj2Udqz1Te3jhNwg0CnNf8iqhiHPIrCmuhLDTosJEqPTxFXvIiwmv+aX4SxMALjrbSpGTo0IC+XqIEmsQvYAoLrzEyA6rhUFPNrGslKub10=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by PAXPR04MB8320.eurprd04.prod.outlook.com (2603:10a6:102:1cf::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 17:48:25 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 17:48:24 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 27 Oct 2025 18:48:16 +0100
Subject: [PATCH 07/10] arm64: dts: imx8mp-sr-som: build dtbs with symbols
 for overlay support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-imx8mp-hb-iiot-v1-7-683f86357818@solid-run.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|PAXPR04MB8320:EE_|AMS0EPF0000019B:EE_|VI2PR04MB11169:EE_
X-MS-Office365-Filtering-Correlation-Id: 27081724-5b3d-4eed-9727-08de15810f78
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|376014|7416014|52116014|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?clRML0FwNXhCV0ZIUmNET1lBbnRsMVZ4Z2pmcGZRZHI0Z1hFTXBJS3ZFSEdw?=
 =?utf-8?B?d1JFWVVkMVBJTWJXaG0wV3Z0aFZLam03MnFBUHhaWHJKYjd0SG0ra2J3Snhk?=
 =?utf-8?B?YzdoL3d4UmhqL3RNSTlKZ1hocEFYREVxUXBzNE1HRjI2L3YwWDI2ak9Dak95?=
 =?utf-8?B?RStjU1hReVQ1eEJvM2Nzb0dCclc1Mzc2dzExYkI2bHJyc1NodHdsUDhtaVVL?=
 =?utf-8?B?NEdjaUZNV3JFcm9EVkVBRHBMcHliUEZnY0dVbU9GMkdsL0RnZWhiQ1pTdkJL?=
 =?utf-8?B?RmVxcTZIVWwrRkpJVG9xbXhqWmgwNlVHN3FjK2wranFFZzNBbzhqbGpyQS9I?=
 =?utf-8?B?WENSalFQczRTU3VqS2l6aVpZMkFCdmlSMjhOeFVqSjEyZDhVclRhaWdaQVdB?=
 =?utf-8?B?clVyVXNJTHAwbUQ1dGJ3ZEFwdlJyR256UTZ2T3kvKzR1aUMxZndlVnJXNFZD?=
 =?utf-8?B?MlQwK0xDZUJnTEhmZW5Vd2RRWHUvWHZ3TFZsVVRxMzRvaEpoY0szandmUW8z?=
 =?utf-8?B?aExQNmRzOEF1aGx0dXZOQjdTYmtVQ0hsK3BQR3BCZzFUZ3g1QWpzTG1JQjkw?=
 =?utf-8?B?U25pK0JXS2JhWFhmd0NqSitzZEI5TGtNU2JSbmMvYUErMVdWMVN3Wnhlcis1?=
 =?utf-8?B?Njc2NTdjbzBQb2V4dC9wN3VwdytxSWE0R0RWOUhKUmdNT1lMOStNemViam1F?=
 =?utf-8?B?MkVYaEp4Z2xiTmpQckw5enVtOTNaUVVtYU9yZ1hXUVBTeElNSnM1blJScFo0?=
 =?utf-8?B?OVFkcGM2bUc1eGlvR3grSEx3dUpKWHRkZEtFejF6eW5RVVRpSU4rWDhnT1hS?=
 =?utf-8?B?TGRtWlNHZGsxQzdhT2hnNjYyMG9zZ2ptSGRxS1lzYjhGYndsYkRsL2srTzFS?=
 =?utf-8?B?bjJkMEtKSm1LbFdISVZybGRoOG9lVDRIL0MwZmVaUEN3ZjM3L1FRSVBDcTdx?=
 =?utf-8?B?eHlHQStwaWtReW9LbXhtSCtnVDMyOFlvWTc0MUl1dTY5dzk5SForQ3hPTWtC?=
 =?utf-8?B?SFVWaE12ZW1JVEYrcXJ2ZWp5bms5d2RaM1FWaGFQWUJDaWtQY1N4R0dlclYr?=
 =?utf-8?B?ZzB2TjQydkMzZDg2VEYyelNPcXVuQTBIWjZpaDltVTlMMERMZDRNY3c5cWtp?=
 =?utf-8?B?b0M4TGw3SkUrY29XcVlXbnN3Mm9DaUs2VlBVaWR0MVZvakdMbFJJOUlwV21I?=
 =?utf-8?B?YVFVSncwaUR2bVM5K1JZaDNaQWswRDRDZThxT3ZjUDR5dzdLTm85UVR3M0NT?=
 =?utf-8?B?b2pQQmdUZ1VVTmRaU2g3RUJneTd5N01HNCtreGdIM0xNa1RobmgvZFpWajlF?=
 =?utf-8?B?dHVHTXZCWTNPVDc0NTlHZW1URUZqM2c4cFRvWkVDalJucklQTkVsOFhZYVBq?=
 =?utf-8?B?VUVvR3ZJc0s4aUcwZkxXbmxPTlhtZjg2THFHM3k2bHJLVjc2VGRLWDNzVnk5?=
 =?utf-8?B?ZWxNQWxLRVNLOW04M2plTHkxVmlaZVo3eTE4akltTkZ5RGVFdFo5RDNtNkpm?=
 =?utf-8?B?M2pROVpJdG93cHdrbUs1L1V0amw2NWZGQWE4bzBBd3B4Y01tajd1cDNBZUQ0?=
 =?utf-8?B?Z2E5T1dEUkEvelNBb1c5UkFvOTR1RGllQWROekVMd2tvMVUwakZlQkswNUlt?=
 =?utf-8?B?MkVxaGlwTTRDemNDNTFQY20ra2lvRFFWVDJwZlZNV2NzamV1eHJJVGhFV1g5?=
 =?utf-8?B?d0VvS1NiTkJWcE5UWFpVNkV1NVA4RmpwNlJ0c3NNaWlTUFA1cGxlOFJSSm9l?=
 =?utf-8?B?eHVuZmNoNnhmcUNNRVNWSHp2L2FCa2NiT0YvaGdCKzVvNXF4aGJGMUhuQ29z?=
 =?utf-8?B?b0JGTXlzQTV0bUlGS0Q5YXYwQlIvVGpzZlRNMjdyNG9Fd3doRDNyQ21FV3VJ?=
 =?utf-8?B?eFZiOUZEbHZOTXVUMmE5dDNKRDBoTTNKWTFSVGNBNTdOODBPbVRpY1lMR2Qx?=
 =?utf-8?B?b3BxQXYzRHBmcUtqblJnaUJlZVhMdXE2S0hid2tveHZzdlFucHVmTzJvTjdW?=
 =?utf-8?B?cFdGSlhpL09tWFRNQUFoblRNZlJzN25teEowN0NiZCttb3lMVUt5T3ZJZkhi?=
 =?utf-8?B?UEFqRFB5NzNJTUl2S0twWTAzYithYjF4TFRDUT09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB8749.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8320
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 4d5c6781d37749dd89f19535cf09f94b:solidrun,
 office365_emails, sent, inline:debd18510902b80412e2749450943e78
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 940cd654-5146-42e0-6ac0-08de158106fc
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|7416014|376014|82310400026|35042699022|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1I3eEEyT29hTzhISDc4MzZSektmTTFGbCtjWUdZVitnZmJscThsTUhOaVl2?=
 =?utf-8?B?Q3RiZkI1UzhzTHRab2svcDN5Nk53ckxsQUhqOXdYSks0N2tRZndsMUJoM0ha?=
 =?utf-8?B?NDU0MmYzSEt5Y3pQZy9FTVR6TFlhUWhJOHFqR0ZWYld1TVlHcjYvb1IzaVVK?=
 =?utf-8?B?ZkVBaFpoUDBEMXNod1hQUkxiMFpKRzQ1bDMrZnNMdTNDSkRMeW9JT2F5TGw3?=
 =?utf-8?B?RnBmSnpSQW1zZmZhOVdkK1RIZ0ZoMW9JYnVnQnA3MGQzV04rS002aS9FR1ds?=
 =?utf-8?B?WW00WHduQnMrRS9uWFB2YUNKL0RoLzdNUDhLK0pQSEE2QWdkMVJzdWVRS29H?=
 =?utf-8?B?WlU1bVFyczNWdndCeWlldjBiUFNCSHExbVc4MElQMDF0NHlYZm1mVGNraEx5?=
 =?utf-8?B?VWp4bzFzSTE4K3p1aTNnMFhoZStzQVF0dUNmZ1MxRzk1WnJFRGs3VXcxQ0ZN?=
 =?utf-8?B?Z3FvakZLMk5lZWFUZHdMcUhJWisxRjBGanEyRkRXNkxwMStEaWVacUlQZXBi?=
 =?utf-8?B?Z0cxekwzWUNVZEFRdkR2RS83d2p4VFJCbG9yVTQwZ1kzUzJ3VUhkMkhpYlFu?=
 =?utf-8?B?TFJacnVhWk43Tnh5TlJFTDdieFBEWVk5QlRnL2NXbS9uMEJLUVFGaTBON0lI?=
 =?utf-8?B?R3lUWXlmeHVwR3BSaFBWYUtlUTYvWkNiRVhyZWlaL2lRbzlYVFBILzBXbnVE?=
 =?utf-8?B?ZVZNL2Jkemh0QTNWM0VqZGhLb0xudU1uNnJvVUYxWEpDVkhrdFpaZ2VQTnNP?=
 =?utf-8?B?aVZXWVVTTjVjS0swS2IzdUpFVHMxNDROeTA5QU4xdm9qaW5EWmtuZHFIcTJz?=
 =?utf-8?B?cVpQNjVPcSsrVmRHU3Q1dHp3MmFPRWplQTVDK3BZSkRaMGRXN25FY2lvUElM?=
 =?utf-8?B?eHNSWFdnQThBTUp2ak1Sam9LcGR5S3VOMkM1NmFGcUhvM3JWMW9MOUtDYTJr?=
 =?utf-8?B?TUphTDMxYmJ4N05FZUxVajR5NFhoZnluYVZubVYyTFF3Y2FCeTNPb0ZlcExj?=
 =?utf-8?B?WU5iTjJFVnVkVDZ4MkhWQUFsRkpKQzRXV094L2xSTzhIcU9LMXlWR2JZWnBZ?=
 =?utf-8?B?S2t1TXpMMTlEMVdqSXI5LzlsTjJ6a3F4R1VaWmZRQXFXZkV5MkhPYVluVTgy?=
 =?utf-8?B?YTNpamZUZVNEOFFxWGtjRG9PdE1sNzI3TmZZbkNsOE9iaTdEdkQ3QUNNOHI0?=
 =?utf-8?B?RkRIVnVLSWZnU1R0aFM5OFdENFFNdTl6Uy95a1JNVFdzU1diSVlpV1pZVHFW?=
 =?utf-8?B?blhwS0dMZDVlMHpXdkpsL203SzdHc2F5bUhwTFJjNjdLV2txbGR2cE0vdi9M?=
 =?utf-8?B?UEtXVXZvbTV2aXlZMUJTdDhsZHNPM2hpamNRVEEydU5nQzF2NGFEOVZSazhX?=
 =?utf-8?B?VGozU0tOU2k4ZDA2TU9HU2RVRnd1enE3QzJWTkY4aCtjUm5TVlRObjI0Nnpk?=
 =?utf-8?B?ZGh2ZDQ0ZlBoUlI4RmIvVTlCZWZvVEVXNWhjRENUQ1BFcjN2V2JkSmZoNUhB?=
 =?utf-8?B?cThEQ3FZeE00cDJRZXVZY01OMXVxOTRxSFFtczkxbkpNeEdadFZxQVVObFNN?=
 =?utf-8?B?TmUyc3h3NzVXTkthbFI4ak10cGFaaG00WUhMamxZSE9SUzVXakVqYysrTWVz?=
 =?utf-8?B?QmN2TDJ1UHl1ZXlod0VZSkNUbXFTL3lXZXNlMGJKSFdrc2M1NkdlZ3N3M1RU?=
 =?utf-8?B?YkYrekxENC9kVnBaNkNqWk1hTUZSZFJsWmx5ZHA3bXdGaE4xcUJiSDJZd0cw?=
 =?utf-8?B?aWR1eGFQTUh3dmFyakkrQkVzczUzMVBpaUt2UjVrV1d1T0g5QTgralg1ZWds?=
 =?utf-8?B?Y0MyMVpFS3VHYUJ5Qm9BSkpnYnpmTk9MQVJHVFU0VnI2aXZMOUZrWE44cXFT?=
 =?utf-8?B?d0xYTGpSWEM4Q0g0Z0NLREVyRDJ0MXhMdzlOZXE4M21KWGlCVnFveHpmMjFP?=
 =?utf-8?B?NmkremxpT05hYWkvUzV4ZlNTMFFCbTlnYnJqM2JJMW85c0RFNnhCNVpsK054?=
 =?utf-8?B?cThJUHZkYS9EVjN5OHBUei9ER3F0cXNZcU0vSWNoUklJTmdDMW1rNGlJeDFi?=
 =?utf-8?B?Tkk3Mng0cUZnaU0zcUl3VXFtT1cxNDZUYXVRTndONzZjS0tubEgwTUQxdTZ0?=
 =?utf-8?Q?5QMNrQQulvd4COlDgkNTp8WQf?=
X-Forefront-Antispam-Report: CIP:52.17.62.50; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:eu-dlp.cloud-sec-av.com; PTR:eu-dlp.cloud-sec-av.com;
 CAT:NONE;
 SFS:(13230040)(14060799003)(7416014)(376014)(82310400026)(35042699022)(36860700013)(1800799024)(921020);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 17:48:38.6808 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27081724-5b3d-4eed-9727-08de15810f78
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82; Ip=[52.17.62.50];
 Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11169
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

Build all dtbs based on SolidRun i.MX8MP SoM with symbols (adding -@ to
dtc flags) to enable support for device-tree addons.

The SoM has a camera connector for basler cameras that can be enabled by
downstream dtbo.
Hence by extension all boards based on this SoM should support addons.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 525ef180481d3..8bda6fb0ff9c1 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -197,6 +197,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-aristainetos3-helios-lvds.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-aristainetos3-proton2s.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-beacon-kit.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-cubox-m.dtb
+DTC_FLAGS_imx8mp-cubox-m := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-data-modul-edm-sbc.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-debix-model-a.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-debix-som-a-bmb-08.dtb
@@ -207,9 +208,13 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-picoitx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-edm-g-wb.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-mate.dtb
+DTC_FLAGS_imx8mp-hummingboard-mate := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-pro.dtb
+DTC_FLAGS_imx8mp-hummingboard-pro := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-pulse.dtb
+DTC_FLAGS_imx8mp-hummingboard-pulse := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-ripple.dtb
+DTC_FLAGS_imx8mp-hummingboard-ripple := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-icore-mx8mp-edimm2.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-iota2-lumpy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-kontron-bl-osm-s.dtb

-- 
2.51.0


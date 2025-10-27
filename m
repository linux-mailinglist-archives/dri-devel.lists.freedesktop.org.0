Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A7EC11AFD
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 23:26:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F8E010E56A;
	Mon, 27 Oct 2025 22:26:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="eq3QSVau";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="eq3QSVau";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11021108.outbound.protection.outlook.com
 [52.101.65.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6798F10E50C
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 17:48:35 +0000 (UTC)
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=p9wiViJt+QjKC8sX6ojqj37SIWt5/rp01WkP//kPjRf0Nzx3hUUeRQMPahy6laLmkNMXhXG54XSiVlhNXI56lqxEsSaLSpYqKeHNnPQxDcZ2V2T4fdadk0hGfmNWaiKkZc+FZQodL5bS2FuvPEixaZFoZ/7tJnWj6kj0XhqEbgYTa9mkXX8/8ym7rP8XQDebmlords62vZAmJidAREbrMbXTIf2cUVsrxSuHGkudjWSPKa++yRrC9kNYpDmUeRyScnNLjT+n59b2v/c42YnuCT6lO7u9KsFjS2B5efzITnSMJWiZpyvhpN19eziTcwVQ2CEMh1kDBgWtwfctqoiGCQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ROHv63CEWcVv+UbhuIjz0kpZuxsxOktJ76qZtRH5URI=;
 b=FGZ1MzvFUVXlh4/jUaG1gW40PdbLj3HjoKgcWFykjwYFeIAeDjyq5OcZjQ8Dw4OqVbGvuDcRLLyuSvxFf5+pn5w1kdb9jgaCvhif+G56fdiAa+C6H4NRIkmDhWv2CObXGElpEwJgJgN3DQvEgI1lZSXVrImM4nrruI/OEq2J/JvcWSTT1sINX45ZYCikB+bWlwjzq0T+mhssY9TLtQ4wUUxHgXrStEwlUHbc4yXedJ9gqrY2lhwzCLCY+4qgcpkiqR6dtqwJyDXSirc1rNSirEl5ORfZO+bOm9NOlkiviCWw5nHoRC+2FfMjGKud/Y7YVUaoTloRAVlR7iEFW8i+Tg==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ROHv63CEWcVv+UbhuIjz0kpZuxsxOktJ76qZtRH5URI=;
 b=eq3QSVauNgTUyc9ZwiS7XS2EUI+uOzGDa42StNNSx0wRk5eggaYx6tYfN69WaZYwQIEaZhfcrK9E1htsspPyYRgCFiIUDCG3qw3zb3MIjj8IP/GDddpJRZddRBK5Ho0aD2o6E3EPJ0990BJOdEyUWptOB73g4cHl2YM1vbzxZ/w=
Received: from AS9P194CA0009.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::19)
 by FRWPR04MB11281.eurprd04.prod.outlook.com (2603:10a6:d10:19e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 17:48:32 +0000
Received: from AM3PEPF0000A791.eurprd04.prod.outlook.com
 (2603:10a6:20b:46d:cafe::5) by AS9P194CA0009.outlook.office365.com
 (2603:10a6:20b:46d::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Mon,
 27 Oct 2025 17:48:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM3PEPF0000A791.mail.protection.outlook.com (10.167.16.120) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10
 via Frontend Transport; Mon, 27 Oct 2025 17:48:30 +0000
Received: from emails-5633169-12-mt-prod-cp-eu-2.checkpointcloudsec.com
 (ip-10-20-5-121.eu-west-1.compute.internal [10.20.5.121])
 by mta-outgoing-dlp-862-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with
 ESMTPS id 5D0CA802C5; Mon, 27 Oct 2025 17:48:30 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1761587310; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=ROHv63CEWcVv+UbhuIjz0kpZuxsxOktJ76qZtRH5URI=;
 b=B4EDOKq0m0D17GCa1FL9AxxiSx5SmkoskwxTcrZCyGPoIfUHdXwfcczGM9XULJcS5iXWc
 hv5rt2wcRH32g9jvtoOhYVK+Cak88DErGWZOe66GTbnug9Wx2WwNGcAfUmXDlEhLf9ktsBl
 DQYhb3A7PrBJHOt12omdC+cFUsg1RUo=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1761587310;
 b=lUlskeTTHlikCXxoRP6fSrbAEnVgzNqNhiOuB9K1pOkVL7M8iDevKECK6Mel5zwMC4o67
 IYmKagZz8VesWz9dk+Nhyq5qKEmdNYk20tSaZxNW8oBY6jXuOBZUO6wy8w8K9a7mqErjxz5
 c/6FsCAkTQ46+BNxxoPaytsJ0ss/V0A=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aTcvBbnXiItNydpcmtKWNdlQXsYOTpTkCGSN2UsxACq0Lov70N0kxaVUqKnak71/o5BBT0FIPwucDbJPXQNJkvheKM9iuLehsrP9kbceoGrSxOi6hbDjyNAh+k9SdEVgxIFataQUNpGaV96QXML1HvGTbJ2jfrcnPDc899XomDDM9psCj8kfWV1427PUSr4Kv5SDc11bgxqdbOg3PCUyqHicl9LRVRm9gh+AbXi034H2QZlCpBFeyFygmtthczaqs0jw7spRnF01OlbElmHUFQpnu1dBx3bJAvnEDgtcxWTwzfqH/gFArgc7JWT8JZk0f3B07OxBRdJWNqm0hDjpig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ROHv63CEWcVv+UbhuIjz0kpZuxsxOktJ76qZtRH5URI=;
 b=LQavhhUseJ+Licijf0oTVxq20ZNT3Zmg/NEt1jSRzshuXZ9kf6htCAObEkp2eUWspwzRLwEUofSt8heEW+QwQeG9NutDXdfcitTwfY1ufDvMTDATOCV9HwUYLQRaOvWTw1j5mQAJ1N5pWbRWbsE1Pm7k/wAdRaA/2Il8S9VMXAzYgH+gCM7KMF+NPl76VW/c0zDl8KJel1dWzJJ1liT0iBKJEkmFyd01LctlKeGKYBq87KGNYhBLcgmBFi2HTy94T6Qe9FauCsDjvo4QI+oAs6R4ryBJ67JlLZAH0XvmwNiTSIK+4LcGetwGGC/IH+PCvCxyX3GftiFxfKiAyQ2Niw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ROHv63CEWcVv+UbhuIjz0kpZuxsxOktJ76qZtRH5URI=;
 b=eq3QSVauNgTUyc9ZwiS7XS2EUI+uOzGDa42StNNSx0wRk5eggaYx6tYfN69WaZYwQIEaZhfcrK9E1htsspPyYRgCFiIUDCG3qw3zb3MIjj8IP/GDddpJRZddRBK5Ho0aD2o6E3EPJ0990BJOdEyUWptOB73g4cHl2YM1vbzxZ/w=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DBAPR04MB7365.eurprd04.prod.outlook.com (2603:10a6:10:1a2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 27 Oct
 2025 17:48:17 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 17:48:17 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 27 Oct 2025 18:48:10 +0100
Subject: [PATCH 01/10] dt-bindings: arm: fsl: Add binding for various
 solidrun imx8 boards
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-imx8mp-hb-iiot-v1-1-683f86357818@solid-run.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|DBAPR04MB7365:EE_|AM3PEPF0000A791:EE_|FRWPR04MB11281:EE_
X-MS-Office365-Filtering-Correlation-Id: 661e24b5-6bff-45ae-d4dc-08de15810ab0
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|52116014|376014|366016|7416014|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?RmZZcFlWRVUwVWVldjhwOWdoR1Z0ekdBZ2F3c3c0SVJOdG5xZ3o1azF0dW53?=
 =?utf-8?B?OGkxTHJIWEEwZlM0Tm5jNms4bFJuQTdjVVkwYWtNeWcvR3BSTWtyK0tXVWRs?=
 =?utf-8?B?YmpRTC8yV1c4RkRlTU5wc0pJR1JwWGY1elhGOXRpRWNKT0xGR29NU1E5WDZW?=
 =?utf-8?B?N2NUSjRsWjU4UWpsMktseDNrMlBhZUtSUG1yOXZwLzhIVEdxRXc5TWR5L0po?=
 =?utf-8?B?WVpkc1ZzbUtVQXVIbWtFb3JIQ0F5Sy9iNWVvT1F1dzc4c3MvNW40KzBEUVpM?=
 =?utf-8?B?RUI3dWhTMmxvRElpaEhOQzZGNW02c0NPMlprN1lGZ0x2aER5T2UzSDlYNlAv?=
 =?utf-8?B?TjVObHUxRUVJM2NhellnZC9QalVVVFd5RzNJQW5DRTlKeEpjTDUxeGpGaDVj?=
 =?utf-8?B?WE5Xb2s3OFNPYVJUMzNteXpIOVFjMTJ1YnorNWNVcjRURlpGSmJ4YTJQbDhY?=
 =?utf-8?B?RU9tN0ZtcWpMV2tYSEY5d2FIMVZQK2kySHRaSzI3OFJwRHU5THZNOGdTaVEw?=
 =?utf-8?B?LzZZU3ZBUllMUmhmWDF2ZFBiNlBuNFBnamJkRklnVGZ5dkJrU0RMdTl3K2lF?=
 =?utf-8?B?bVJSL3dMTVRyTWFmZU9HU011a0hoRGZsUE8wYXlYQmEwYTEwNnFCL3lxTlVC?=
 =?utf-8?B?MWFFRlF1Q3dBbWx1RTRCaEVtYmxjaFdkWnlQdnh2UDFGV3dNZXRzZklZSVNy?=
 =?utf-8?B?NVBjbWszZUZxQjdZbktnSlpyM3pYeFhvOXVHMG1ZOWk4ckRYTFpTWjIxTkJ1?=
 =?utf-8?B?QlMvc0U4SUpCVkhUTlF3Z0hKcFVBN3NHRmovQmN5RkppZTZZcDViellaL2ti?=
 =?utf-8?B?cEp3MWFsYS9mS1hwSjdNeDFtVFJSZlJnb0w1NktQVE1QUWQvWWZBVjBTNjNQ?=
 =?utf-8?B?VEV3bW9rQlA0NktOKzhuVFJ2NzJ3bkVRbWpKSUtDUGlXNzVSaHVZbUFNQnR3?=
 =?utf-8?B?Y3o2K2N0eU1ra1MvN09kYmNscTVPd1gydjMrY0g4UzlSSHpmeVdBdlNmNXdO?=
 =?utf-8?B?d2RpYzFsVWREKzN0ZEdBcUQzMWs1d3o5ck4zZTZNTTdDOXJvRXloYVlYTjBN?=
 =?utf-8?B?OHR2ZFoyck5pZ3VaRkFoRWJ3UlZaa3hGK296VFJzOHhKVHNCWVR3Ny9iTVFw?=
 =?utf-8?B?bHFqeFNtVk00NTlTa1RPWXZhNVlZNTl2dWN0aytHRGhGUmRIOGxqL0tDcnNy?=
 =?utf-8?B?bzVraGMwdEc1S0M1KzBDam1yQWhTT1ZvbXdJZnJFVlhuTExhNWFNSkxNRXhw?=
 =?utf-8?B?RFd2ZTRURm9hK3ZNRU9adzdQdmRDWHhJWURZUkZHK2h2bWNZODRJSytVdksz?=
 =?utf-8?B?YUxpTVJJZjJPNUVrWGVJc3pBb0wwQ2RGaU13aGdZZlFKK0tsaGdpKzVpczBL?=
 =?utf-8?B?c2lmZWFZR21YcFhyc1U3R0o3MUJDdEV2QUw3Sms2K0x6UkhMeFdJdE55dHJP?=
 =?utf-8?B?L0g2bjVJZjFFOW1nSDhQV000TEpGTDdsdlphSDd0ZWVCOVFoMFV1bUQ3N0dP?=
 =?utf-8?B?YndCdUk4RTZjaXZLZzdFdnFzMSsrVElLbzlSMlRUMkkvU3RqRUVNT0ZvOU9x?=
 =?utf-8?B?ajhSQy93QVRsZU1XaTZ6UllhMXYxaE95SnhmbFloOFNDcU82dUthRVpadmpq?=
 =?utf-8?B?RFNxU1NnSnJQZktpK0xNYS9Gd0c0Zy83bEVKVkV2S3R2S25BOVZBbE1UeEZt?=
 =?utf-8?B?bXhLYVl0dzhPUzJzTDJ4elhNdXl3NkVqR1hPOXNFdEpaLzk3TUpKRWJ4NE1U?=
 =?utf-8?B?THNuZVZyMW0xWEJTVUMyVlBYNi9vZG10Vld2TytML2JkZVRMZ0dGT1ZCOUdS?=
 =?utf-8?B?S0haS1ZpeURPNDRCK1E1bDN2QmRPbTZNZXBXeXB0VWV0bWlVSG93OGpTRUZG?=
 =?utf-8?B?T1N6SDBodjcySWl5bGJBdVc3d3RNL0JwVm9FT2hOT2FrRnpqc2JYclVyMnBp?=
 =?utf-8?B?ejVEY1hFbGZlb0svc0RPY1hxV0NrdzNxQVplaFVlcHRETzlKb1BQeDF6L3pS?=
 =?utf-8?B?ZG03d3RpSjVFclFQQ1diTGlURlo2encrOVVTTUVLSWpDT0MrKzJaME14QUFO?=
 =?utf-8?B?aGltcG9CYWl4R0ZSN1c0MlM2eHlCamU1R3dGdz09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB8749.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(366016)(7416014)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7365
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 2f6240c4738042208eb27f6983294997:solidrun,
 office365_emails, sent, inline:debd18510902b80412e2749450943e78
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF0000A791.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: eb5dc2b0-2070-41fb-b390-08de158102c5
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|14060799003|1800799024|82310400026|35042699022|36860700013|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YlBsMUNsWHA2bmtoOVc0cDFnSmw1Q2RYVGl6N3VFZ3RxMXlyNElzUEF4eTV2?=
 =?utf-8?B?bU9YeUpad1FIYkx0S0F1Qnl6TUUyblNtaWtaYnBGVDUwbFFGRDFtcTVsNXJy?=
 =?utf-8?B?dTZqeDBiUnBLTVpmYndYSkFjVDFIOGo5MHRKREZXMGV6SFhLeWkzTWQrb0ZJ?=
 =?utf-8?B?TTVpeHhZVFBXS2htV0Z4UGdRUitCUkF4djdpOG5Sa1ZWdTNBcHZyQ0lHNTh5?=
 =?utf-8?B?dVRYeVEzMW9kSy9JWFlnYXNIUTRGbUJ0aG4rSjdvMTZHNmQrTythKzhPZng1?=
 =?utf-8?B?TmxkU2NGQnhtbGRzM3pYdmVlWDRYYWllTGJDTkkwNUMwVzdvM0NNdjhVR3ds?=
 =?utf-8?B?V0g1ZE5zZmgzN1cyNkI3NjIyNjltbVVnSHlZLzZNZmZUOHZXUi96Y1lsVEg0?=
 =?utf-8?B?cEhwUmNRTXE5Skl5MmpMSHB6ZDlyWmJRUUd5Q2pEakRHd1ZHOVFHRHhNZGpM?=
 =?utf-8?B?VXgyU2tXRHNOSlFkTTRzKys2S3VsMjN5M3FTTlhxTzVTM0I2UG1jNU8xbmph?=
 =?utf-8?B?YzlFU09rU1hiV0s1TG0xMXVYV3RpS0xXNlcyUFpiaE14Y1d6NEFpOEFXODN3?=
 =?utf-8?B?bHd6c3RzVjk3SERjdTU2ZU4vT2VJYk9ZZ0RNWlpDU29GWE5tZnBsd1ZoNUpu?=
 =?utf-8?B?dDk0UXlOTmIrUmNDMUtmK3dWU2xkbVBzNTQrd25lL1NEemlvUFprczRib2lK?=
 =?utf-8?B?N1N4VEhRcVp2Y1VVUFlMN0c4OUtnZFhrS1pNSjJhOWFXQ3Ixc2g2SnZzaFo4?=
 =?utf-8?B?Z1Z4TlhyQVNFMW9pSjlzMytmZTJnYldFMWhqcHRxcWJ0MHNydUdPWVRFV1J6?=
 =?utf-8?B?NVlYQUF1ZmhBRFEvUThJcTI5RFBwYVBJYW82d1l6b2tkNlFzanExTVpZT0Fl?=
 =?utf-8?B?aDI4aFpmL3BuZ2FHYmw2cUZmS3JMSW9zdkhwNmtkL3IxM1NPWFFaTTRvcmUr?=
 =?utf-8?B?OHhtc2swd1A0Z05SYVNJQ1FKdUhXUDk1bXhLaStMT0UzcTZVVkNQNHZheTBX?=
 =?utf-8?B?c1VaTnR5alhCWnI3ZERJNkQ5ODY4bXFSMmJiRjQrRS9CR2NlZGxtQ2Y0b3Vx?=
 =?utf-8?B?akZJeFY4N3MwemIvQXVwYS94R3RPamJ3RXN0d040cWY2NzFJTEdjUUZPU3d0?=
 =?utf-8?B?UHBaYVBwVmpDNkFXeGUvMk5IeHZ1WE1zMCs3NzJIZ1J0L1VBV09OVyszUU81?=
 =?utf-8?B?NzBUNTIzWVZHUFRVN2c3NVdqcHJRb1E1SDVtMVNMdTZsTHNMMHBNL0NBZDBF?=
 =?utf-8?B?dUZ1ZTVGMmVta2JjeS9sc1h2SUpPVDduVzQzKy85MWkrV2FqVVhFTWhVOVZv?=
 =?utf-8?B?OFJ1TWlvTHcyVGo3MEVDQTFhRjVCTGphaHJFT1lmRHFoQWVRUnh5aDFoRlM4?=
 =?utf-8?B?K0l0MUlpcmVYM3Q2cFo1V3hXOTEySkFFTVg4LzdKb3dVUVlZRUJ3OUxzRmYy?=
 =?utf-8?B?NkcraGRTeVJyc0xMejE2a1hRLzdoZHErVFlaV21rbldqSm41TDZhL0kvY3lZ?=
 =?utf-8?B?Tlcva1lsdXNFaTFId1A3WjYzcDVXQ1UrMG8zenBXeS96NEdMTmcwZzNRT1dK?=
 =?utf-8?B?b3I0MW9rM3pSRVhkWTVZVUI1cUZWRVFZb2dsUE9zcmNqSzNucGVKd3k3cnV4?=
 =?utf-8?B?L1RkTU9makF1UTJXU2d5Qmh2REk2RHFSdnd3RjVpRXlNMVBrNmZBNmhXZkNT?=
 =?utf-8?B?VDNlSEJqYWIxTzROV0ZoVmJwZFh1Q09aY0gwRCsrOE9qVlRCa3I1T0k3d21I?=
 =?utf-8?B?Nmd4bTVGV0t2YWc4T283MjZFbktMUHA5Y0N3RjhGMmRFODh5LzJCMTdlaGpi?=
 =?utf-8?B?RkJUNERXVnMxZ0JXZDAxQ0hHY2ZKeGM5RDE2a3JPTFllK2VoNDV6K2VDcUVZ?=
 =?utf-8?B?bGlGRkl6OHJYR3FrdmRrRExjS1htVDQyTEl2ZUxYV3lrdWdrRTA3V1Bjd2x5?=
 =?utf-8?B?SnY0dHhhQkJlanFPWkU3eFhEK3htVURLVDZOY2lNWVFjcjFtRGVTbkFpcFFC?=
 =?utf-8?B?Yk4vZmJ4Y3BDVGVFOFdEVEtyeFdodjU5MGFlYUgycEN1RHN6Q2dPNFVwbGwx?=
 =?utf-8?B?WXRyaXlRZFhCenVvOCtpRGh1Vm5DekxyNWRsdVhIb1NCNGtud1dXaVR6aElK?=
 =?utf-8?Q?cdWo=3D?=
X-Forefront-Antispam-Report: CIP:52.17.62.50; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:eu-dlp.cloud-sec-av.com; PTR:eu-dlp.cloud-sec-av.com;
 CAT:NONE;
 SFS:(13230040)(7416014)(376014)(14060799003)(1800799024)(82310400026)(35042699022)(36860700013)(921020);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 17:48:30.6644 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 661e24b5-6bff-45ae-d4dc-08de15810ab0
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82; Ip=[52.17.62.50];
 Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11281
X-Mailman-Approved-At: Mon, 27 Oct 2025 22:26:30 +0000
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


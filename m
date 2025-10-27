Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 496D8C11AF4
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 23:26:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E3810E56B;
	Mon, 27 Oct 2025 22:26:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="kC7RSRz6";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="kC7RSRz6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11022141.outbound.protection.outlook.com
 [52.101.66.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ACB810E50C
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 17:48:45 +0000 (UTC)
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=i37kNSQQDARMZHNSNUgBoTAmlstz2Zo5B3WjAWwXoYrz9VAsmtMSS5z4g9xneqEO5ITSNxTD44/2qTvFL2MNknz/7NTO4wq9H67U2wto2pamkWJIypb7BuiM3e7BeEd/eKywFXJl2IUY+6FeNMvWST4oB+9tvWFP0cPpoKSL1iknSdsCgEiRfTBV3A/ZAKyG/G8Kjx7RvT7IKRy7LRgMOjbusO+h0l4OcxExPAsgm3KWT9BRdJBb/rZEKoUckFKJQi+w1wviZKU9fbagCDd6Y8YyW/vOBXkCWI8yVf09hBTWxwZYMn+SdDfqChOwiz0lr+V1wz1RpAIHT6Q9la+mMg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lpdmdplC7PoI0BceoCEcJauJSfULSdSyl9h1cc9oS6E=;
 b=oLqbrz6NydMnHc8ihm0+wXiNgYAnqqHwPkMPCUOixwYIRWfC15jcLkggQW1Ndf1/XznbmSdgmnC1pPVjLQIhBsG3sZVhEMBxt0AOi0i7n87RJo9mOdh7HtztOt8LWBPCjCe1ZG4pHDaVZv79BAp6Mf1uOyPdyFbsUNGMZlfOM5L0FHCPuL2FLq0NdRKch9ukmCjMEgIhGlff4nNm1hNxwjLvGY7LN/qCIe0O5482hnVnqxipQ7M15eU13xj1UbR3l0B7eg/MnCH8ejymSB0WA3Ti/sy1r/JM7t7LpVhoMWJONjp7/DYjlok/kQlMTpl5F6id+mSB887npIpKU3j9lg==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lpdmdplC7PoI0BceoCEcJauJSfULSdSyl9h1cc9oS6E=;
 b=kC7RSRz62WKvwgzzYfM8VTIi5llqfDtXSwDClCk+F2zc/a8GfEbH/+hvC/K+G88u3v3jwAdiuRyjVIYDk+NmVnmvF2rO+W/xbsN+LVKy8eyxmsa300BJkNkXrnwlm0Smfm61NGQb013zUv+5CuVs1uCjcNF46AQSfjcmFy0oseE=
Received: from DU7P194CA0027.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::7) by
 AM0PR04MB7059.eurprd04.prod.outlook.com (2603:10a6:208:192::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Mon, 27 Oct
 2025 17:48:42 +0000
Received: from DB1PEPF00039232.eurprd03.prod.outlook.com
 (2603:10a6:10:553:cafe::e7) by DU7P194CA0027.outlook.office365.com
 (2603:10a6:10:553::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.17 via Frontend Transport; Mon,
 27 Oct 2025 17:48:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF00039232.mail.protection.outlook.com (10.167.8.105) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Mon, 27 Oct 2025 17:48:41 +0000
Received: from emails-2422334-12-mt-prod-cp-eu-2.checkpointcloudsec.com
 (ip-10-20-5-121.eu-west-1.compute.internal [10.20.5.121])
 by mta-outgoing-dlp-141-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with
 ESMTPS id 98563802A9; Mon, 27 Oct 2025 17:48:41 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1761587321; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=lpdmdplC7PoI0BceoCEcJauJSfULSdSyl9h1cc9oS6E=;
 b=C6o+IjWZZOj4sFPtq7vG1BuBBpLvK7mgSiKStxFYrHQ5Mbv7Uasy+IsfOPepFvWatlqzI
 XwqLzMo1yDsugjy7hXzG1L/NBLHvEwxLTqZ5zTX8+fH9qUtqAXfyMK0tdcTWUaDHeOr4OBD
 Fh+5CdJI0EWTEzrykm7Iq4DAGJs2OUQ=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1761587321;
 b=RLFlagc5xqrFUcPi9NX5dZ3V4M4OlZck5EP5dzzz5gf9m0iNxay9n8hKehd4fMnqiUGjC
 FiwYg5ssbuvkA+k5+eiQv5BmC0uURsd3pK3lKVzDD/zetCbb1+Mhq3be4OPqyyaIxlhkGi8
 LCzHDueHSSraqi4tJdfrP5RWjzkr6sQ=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kqmpZOB0QwZYRZsNsc39lwlNrgdk0QhMfjj2ggwpO7HTX6pugD5OFnd8kMsXOrKtIvfTZfUXbEMcy8QSum2punSl0v95QkyXqhaPeftm4XQXkn0GA8ZgYC7Ocbv+KkDJs5+8PdeXV3BUondrUGMYPklsvxczvsj9LW6zKqzQtt6X9Ia31jqjwF04ePRjFDAq9/yIBdM4iTVNWD7nWYV695Ve9MGHtjqbncv2hy8Oz8ZFCK9IQwlMJgR3J0F4Z4mgw/sCO4ezEQQisSQ8P6WbHVzAnWB0RVszEORRJ+EcmETwNJr3xC3sCD9E6ANN+XiWO6gyVoqnkhtGO4WlxDty7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lpdmdplC7PoI0BceoCEcJauJSfULSdSyl9h1cc9oS6E=;
 b=aT3P2cVUtclXg2I/rYpDXz6UPo/0QG1Y7o27rGJCuFOud1r3+O/x+QB41RZPt1vHT3m/1i19mrG0J9RePsPjG67xNsAGaUOPPr7mvWelFAzx8qnFNo9K+Um7LYxU3A6U50GEKfQCiqe6xLbUjAkaQlx3K7z4BcWl7sKuU9PYep9O5LmhTFozWkRf9FpkjK84qcKVhGjTXYsNC2sClecocct41T9O6hiQbdIXmET04r//JgLB8oQK48uv0FiTsCmkgSXwgL3Eky7b5AjSa8pfmVNmfgIDxb81QAaVMV+V7/yxcYvm+KaIFVwmRFO747jyG5kpS82LOq6qxbiBUkpv+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lpdmdplC7PoI0BceoCEcJauJSfULSdSyl9h1cc9oS6E=;
 b=kC7RSRz62WKvwgzzYfM8VTIi5llqfDtXSwDClCk+F2zc/a8GfEbH/+hvC/K+G88u3v3jwAdiuRyjVIYDk+NmVnmvF2rO+W/xbsN+LVKy8eyxmsa300BJkNkXrnwlm0Smfm61NGQb013zUv+5CuVs1uCjcNF46AQSfjcmFy0oseE=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DUZPR04MB10038.eurprd04.prod.outlook.com (2603:10a6:10:4db::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.17; Mon, 27 Oct
 2025 17:48:27 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 17:48:27 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 27 Oct 2025 18:48:18 +0100
Subject: [PATCH 09/10] arm64: dts: add description for solidrun
 solidsense-n8 board
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-imx8mp-hb-iiot-v1-9-683f86357818@solid-run.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|DUZPR04MB10038:EE_|DB1PEPF00039232:EE_|AM0PR04MB7059:EE_
X-MS-Office365-Filtering-Correlation-Id: 485e92f9-926a-4930-4dd8-08de1581113b
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?NUN1YjFxZ1hrRUNsekFaRFEzOExmUG44ZWk5eWQ4RE51S0t5dlNZRWk5Rmg3?=
 =?utf-8?B?RE8vOEJWNkpzQzd1QVF6R0NlaGxLUmNnRERDdmlKZWhFaWdiS2x6amxkRzA1?=
 =?utf-8?B?eTJqUEdtWXJueTNtQlY0cnVWbm50MEs1eUFKTTJuRURSamQ0YlI4RUhqVWlp?=
 =?utf-8?B?d2M3djlwcmtOM01zSWhhRmFTdFlDUlBNKzU1b0hLbEVIcVRPZHk0YlYvM1l3?=
 =?utf-8?B?RkdkS0Exc1RaaE1aMTJDcStFb1NOLzVNSHdCc0RqMW1UZnYwS3lVMndnTXAr?=
 =?utf-8?B?WXhQQU9CVFowSEhXTFduM0RpSEhhUEkzU3BXQjl2djhBdkt6dW9VRUVyK2kz?=
 =?utf-8?B?QUI5OTZRT0FEZ2NJSmpqQ0IrWTVyMHNhb1ZsVEtRaW53UWhTdEJ2enV5NFA1?=
 =?utf-8?B?TlQ1bzdIZUpqSUsxYW1QZGNabzRXeFBYNEJxOWluY3BaalFJTU1FNnBHM0tE?=
 =?utf-8?B?WlBGYytlbEw0Wm9JdkZVeEQ4d0s1WjlPTDBvalFoNlk5bGF1dkU3ZEZsTW10?=
 =?utf-8?B?VDN1RVNSRmFHQjhiVkxKT3hwNkVMUngvZWN1WGRzM1VaTHl3MWpCcmlBR0Jk?=
 =?utf-8?B?SnVEWmhWU3dJM2xiWlB3MmU2UG9vNmwxUDdiZHYvOHZtZTVsRmlpY3ArcU16?=
 =?utf-8?B?QnVHck1IZjB4MkFmMmFET3R4VFZaRURHalBtd0E0M3pVOERVbVZyeTNLZFpr?=
 =?utf-8?B?M0RkeEZGS2szVGRaQzBkcFZLVjhwY2gyYjNhLys4eVlrd3hrVnVjSHlrMGhQ?=
 =?utf-8?B?ZWJrdUx6YVROTXRPK3ViT2lhdnc2eFBSblVKTFNid0N4WWk5NjdCYkx0SkJm?=
 =?utf-8?B?UWpsZytwZ0R4TUZuWE1TbkpKSklTN1ZOV0FXeEhhMExMbVgweUtsWUxhR2Vu?=
 =?utf-8?B?ajB4TjJnak4reHp3YnlnOWhraVNPaW1MZjVlcGxWQkN1aGdiVXZXVGFNUXRO?=
 =?utf-8?B?Sll4YzA5V0pCbWxoSWNzTmxwWmRTV1VoVnZob3JlUndnRUp6VWw4WTQ0cy9K?=
 =?utf-8?B?M29Cbk9mVmd5SUI4dFI1SjR6T1BpY3pkdEIydFEzam1PTGxnd2lBWWtpRUda?=
 =?utf-8?B?NEcvc0xQN0E5cEs1Z2ZaU1lJQ25xS1ZkWGtQV1hkS09FQWdNUW9IdUdrVENY?=
 =?utf-8?B?VSt1RkxIVXp2NDlEQTJEakg2MHY4U3kvSVFjL3pXUC9ZVk9BbEJSaXIzWXkz?=
 =?utf-8?B?YUhyOUFJQjhlVkpmVURCZHJRczlFRWR5QysrMlhCOE41OW5DMyttTlFTQ0Qw?=
 =?utf-8?B?Nlc2K09wTHJ0SnRhT2RTWlpHVUFhRmFwcE82MnU2eHFId0tia1RVUFFrTVVP?=
 =?utf-8?B?cVQvcTdIRlR0czZwdHlKRlhsampmejRyN3Z6MHhqMG5NSDRzWnVJb0NpOHk1?=
 =?utf-8?B?MW5KUFJMT04vVTg3d2Fib045blN6elNhUi96T2oydlRxMjYvSTI2Njc0UWlV?=
 =?utf-8?B?dmY1MWc0aGx5OXNJVGZwak5tellrT2tJZVZYZlp5Mm45QVM3c3M0eVhVM2lU?=
 =?utf-8?B?WmtiVW85SlQ1MFdkTWZSanE2djVPdGlHOEpsb1dzc1Y2bk1ZUGM5alg1N2hp?=
 =?utf-8?B?OEpIZ3F2QTB5dkJyWXE1UzRvejFZeEx2TU5wZFEzN0YxejNnVkszSEJ1dEYr?=
 =?utf-8?B?SFZ6SXN6NWhKelVENXc0dk8rendFaU5SNWtWaTU5VlBvN2F2NEJvY1cvTGY4?=
 =?utf-8?B?dWNaOTVnRVRndDNydUtUYk9oZzZWa0xxMzQ5WHdvVlJWOWZOM3ZodXVSdWF0?=
 =?utf-8?B?YlZwdjNYUWpFZTN0RUFpRVJkdXRlU0xsTForZkVQTDIraC9qZ2p4VUVPV2Fv?=
 =?utf-8?B?dW96bmFRQXhvdy9UNEpnUTlxMmNyNDR3ZUNZOWR0TzNieDUzMWh2KzU4cjdG?=
 =?utf-8?B?ME9Wdm5ML3JGL1dDMGhuSWVld05ZYlNjM1FYNzFFSnRiVEpyS3R5K0tVNVpO?=
 =?utf-8?B?RnRDSG1kTzVPaFg0Vm5aVFVkcm1uVjZJWDFXMk5tbEErc052dnVMdHJvdmtt?=
 =?utf-8?B?THgveSt4c3VXZGo4TXZIdXgzYmtRK25CRVltRGxOZzUwb3NickVpODJCNmN6?=
 =?utf-8?B?MW5GczQ2K09oRm50bTR0RFNsK3J5WVdYeVhBZz09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB8749.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10038
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 17eab64cf9b74338b0be4a8c0fce093c:solidrun,
 office365_emails, sent, inline:debd18510902b80412e2749450943e78
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF00039232.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1fbaa56c-d3bb-44fa-7b86-08de15810866
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|14060799003|82310400026|36860700013|35042699022|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bjdSbXBFV3hSSGRDbFJweERIZzhqQWw2RFVETGp6M0hRRXJQdlhVWUdkcWcv?=
 =?utf-8?B?eDY4Q1MvS3l4RkV2NGg2K3JtSjEwZW5YMEdGVSs5MnZNQ2Fqa3ZKbDJKVGFC?=
 =?utf-8?B?N3ZzeTcvc3FsWS9uMGtXcHMyaHFiQzhKWmpFcC9LUEZVeE15MzdCVnJqbll0?=
 =?utf-8?B?Q2dLdE9WcVE1VnBmYXJKV25NMEZaaTBIeUhOK1ZaaFhOUU5xbWFseURCWnlO?=
 =?utf-8?B?ZDdxOVpZenNCTXN5QVFwZElGdXBBMUlFYklzZStoMDFObjNrWHluQmdLNWRQ?=
 =?utf-8?B?c0Q3dzlqcGpLUVpRaXBkN29pZGhZbjZkenNjMlFQYk5MQ0xzSjBoNzg0OUwy?=
 =?utf-8?B?MVJ3YWZ5UGJ0ZUkwV003bjNSend3ZTR6aDVVSTlDbXVOY1hXSXFHVktObUNU?=
 =?utf-8?B?N2txV1NWREJZOFV1U2ZoY01lOFVpd1lWdWI0bExOczFCWDNXeGFManJidk9Z?=
 =?utf-8?B?am1wRFhDQU4ra0doTVFIdTgwODRsQXc3L2VGWUxETVp6WXJGYXFyOVJzY3FF?=
 =?utf-8?B?TmZ6UmdOelBrQzJTQXk1djVIRmZrZ202dzlrQzZCZ1RMYnJKZXdRb0dNK1Rp?=
 =?utf-8?B?aXVTUW5YRUNpVGZ5MWJ2QlFZNEVwaVZ5OW1OYUNGZzZ3NGh2TmFTeHRKa0hs?=
 =?utf-8?B?VlVINEUvZmVCT0JlOEY0WWNBcWtDOVRKdloycGFNc2NXaHY1eEliV0dpYjBi?=
 =?utf-8?B?QlFoamlVUEFPSXJQRFFQUHNOWjVEMCswelgzSjBCcWJCUitWVlRTTGhUanRK?=
 =?utf-8?B?MEFsV20zUjlLVmpxUVR1UzVOK2NSQ3R6b0ovM1QyM0pwdVVFa0JIWm4vcnAw?=
 =?utf-8?B?SkNtS3pIdzRKYW1VMjdhMDkwVVdxWUNOZjEzYW5obzVkREtPN2hJN25aK3Rl?=
 =?utf-8?B?NGtxUTJJM0RNUUYxRWFlZUhYVjYvN1dCU3ZUTFZlT21uYXplandRVGpDRTJl?=
 =?utf-8?B?TjdCcENzYi8wUDMydHFkamlqTG5GUlJwNWU2NHpybEdiVmxwdzUrYjgwTUE3?=
 =?utf-8?B?VCt2UVF0MWptVkgyLzdqVVlNRDF1dlZsZ0I0NHhTT1JyMzBzMjhqblVESHIv?=
 =?utf-8?B?RGZ0Y3N4cFdYZ2N1TzRVNHR5cHl1dkxJc3IzZ2tzZ1RkWjNFZHU0bUtPcCtW?=
 =?utf-8?B?SzNjOUNKYldQVE50ZnRQNFh3S0JvK093ejNETWxFZW9IYk5PdGdqa3grL1BB?=
 =?utf-8?B?TVRWdEh2cC9wYkExNEkwcy9vNURLMjFqRERsanJKTzJVclNXVyt0NjR6NUIw?=
 =?utf-8?B?dkZNZStSeVNkdVBIS3JCeHRqcUtWVjVpM2pwVW1mL2ZIYXp3ZllpM1AwSXlP?=
 =?utf-8?B?c2FOSVE4RlBBSDh4ajlFYXFoZUxVMHltanB4UkF5M2ZzL2xjbllSVEg3QkVB?=
 =?utf-8?B?Ym50ZnJTRUlwc09nYXNrSklndGhMY212aDUyOW5Wc0o4QkpxK012R0o5QUgy?=
 =?utf-8?B?NnczSDUzUnFGK3ZzSEdwK2UzbmpneTFDYWRTeEo5RDFybUdEdmVpOHhFbm5y?=
 =?utf-8?B?ZzZhMnZ5WmtkN1Rad2owejJISmc1M2ZvM3JJeUpiTlkwSU5JSDBkOUdMdXNu?=
 =?utf-8?B?ZGJsVW04WVIyYXNUSGFtTUljakZ1QVFxSm4rQWtlaVhjT0NYWk83Q2I3cnFJ?=
 =?utf-8?B?RDNIajVyblRyVVlCSmdDMjErUWtzSTdoeFlJdVp5T2dGbzRNZ05qRitHWTFp?=
 =?utf-8?B?aGpaUWxBQ1NiRjQxaDhFSVJ2dTBZTWJtOExzbDVkQ3gwRzBndlBhV0V4YkJG?=
 =?utf-8?B?MklrWUxNZlF4ZWpEVWNSSEdaZHZCeHcyVmt2K2todUhkY1FxWm1mbnVXQ1VF?=
 =?utf-8?B?M0JUYjNlK0RGbGl1WkdyUU9ROVlrb3BTMytuYmQ0ZlNMTHcwYi80czdRSnQ3?=
 =?utf-8?B?eVp5cmFxYzJzcWhOajZxUjVVaDBMTjZtbTM1d0VPY2taa2wrZ3hDME1xaEdD?=
 =?utf-8?B?REgwR2dlNkpTYVpsNllNdThmM3kvYU5rR2JoRnU4Z3NHcUNLMmZmT3hydUVx?=
 =?utf-8?B?VHQxdENzamhUUWdQTDkvMnkzUFpoWDh0YXRaNW1ySnVsYnUyT3dVUms4WUdj?=
 =?utf-8?B?WW12TW5JbHVCKytNK01wRkxhRFo5YWI3R3hMemoyQmRTaG5hbGFNeTRyZ0li?=
 =?utf-8?Q?8IffY09tcmrZb8A3jyV7cDgzR?=
X-Forefront-Antispam-Report: CIP:52.17.62.50; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:eu-dlp.cloud-sec-av.com; PTR:eu-dlp.cloud-sec-av.com;
 CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(14060799003)(82310400026)(36860700013)(35042699022)(921020);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 17:48:41.6778 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 485e92f9-926a-4930-4dd8-08de1581113b
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82; Ip=[52.17.62.50];
 Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF00039232.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7059
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

Add description for the SolidRun SolidSense N8 Compact SVC.
The board is designed around the i.MX8MN SoC and comes as a compelte
product including enclosure and labels.

Features:
- USB-2.0 Type A connector
- 1Gbps RJ45 Ethernet with PoE
- microSD connector
- eMMC
- Cellular Modem + SIM holder
- WiFi + Bluetooth
- RS485
- CAN
- 802.15.1 radio
- supercapacitor backup power supply

This is a headless design without display.
The board includes an internal expansion connector for daughterboards
which may be described by dt addon.

The supercap is not currently modeled due to lack of suitable bindings.
Vendor BSP uses gpio-keys driver to trigger shutdown on power loss.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../dts/freescale/imx8mn-solidsense-n8-compact.dts | 852 +++++++++++++++++++++
 2 files changed, 854 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index d414d0efe5e74..c56137097da3b 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -181,6 +181,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mn-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-ddr3l-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-ddr4-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-rve-gateway.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mn-solidsense-n8-compact.dtb
+DTC_FLAGS_imx8mn-solidsense-n8-compact += -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-tqma8mqnl-mba8mx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-venice-gw7902.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-solidsense-n8-compact.dts b/arch/arm64/boot/dts/freescale/imx8mn-solidsense-n8-compact.dts
new file mode 100644
index 0000000000000..9165e9756da3c
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mn-solidsense-n8-compact.dts
@@ -0,0 +1,852 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+//
+// Device Tree file for SolidSense N8 Compact
+//
+// Copyright 2024 Josua Mayer <josua@solid-run.com>
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+
+#include "imx8mn.dtsi"
+
+/ {
+	model = "SolidRun SolidSense N8 Compact";
+	compatible = "solidrun,solidsense-n8-compact", "fsl,imx8mn";
+
+	aliases {
+		gpio5 = &expander;
+		rtc0 = &rtc;
+		rtc1 = &snvs_rtc;
+		usb0 = &usbotg1;
+		watchdog0 = &wdog1;
+		watchdog1 = &rtc;
+	};
+
+	chosen {
+		stdout-path = &uart2;
+	};
+
+	/* LED labels based on enclosure, schematic names differ. */
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&led_pins>;
+
+		/* D20 */
+		led1 {
+			label = "led1";
+			gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		/* D18 */
+		led2 {
+			label = "led2";
+			gpios = <&gpio1 11 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		/* D19 */
+		led3 {
+			label = "led3";
+			gpios = <&gpio1 12 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+	};
+
+	memory@40000000 {
+		reg = <0x0 0x40000000 0 0x80000000>;
+		device_type = "memory";
+	};
+
+	reg_modem_vbat: regulator-modem-vbat {
+		compatible = "regulator-fixed";
+		regulator-name = "modem-vbat";
+		pinctrl-names = "default";
+		pinctrl-0 = <&regulator_modem_vbat_pins>;
+		regulator-min-microvolt = <3800000>;
+		regulator-max-microvolt = <3800000>;
+		gpio = <&gpio3 25 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	/* power to lte modems behind hub ports 2/3 */
+	reg_modem_vbus: regulator-modem-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "modem-vbus";
+		pinctrl-names = "default";
+		pinctrl-0 = <&regulator_modem_vbus_pins>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio5 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	/* power to usb hub, and type-a behind hub port 1 */
+	reg_usb1_vbus: regulator-usb1-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb1-vbus";
+		pinctrl-names = "default";
+		pinctrl-0 = <&regulator_usb1_vbus_pins>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio5 5 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_vdd_1v8: regulator-vdd-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	reg_vdd_3v3: regulator-vdd-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
+		compatible = "regulator-fixed";
+		regulator-name = "usdhc2-vmmc";
+		pinctrl-names = "default";
+		pinctrl-0 = <&regulator_usdhc2_vmmc_pins>;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&reg_vdd_3v3>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		off-on-delay-us = <250>;
+	};
+
+	rfkill {
+		compatible = "rfkill-gpio";
+		label = "rfkill-wwan";
+		radio-type = "wwan";
+		pinctrl-names = "default";
+		pinctrl-0 = <&modem_pins>;
+		/* rfkill-gpio inverts internally */
+		shutdown-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
+	};
+
+	usdhc1_pwrseq: usdhc1-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&A53_0 {
+	cpu-supply = <&buck2_reg>;
+};
+
+&A53_1 {
+	cpu-supply = <&buck2_reg>;
+};
+
+&A53_2 {
+	cpu-supply = <&buck2_reg>;
+};
+
+&A53_3 {
+	cpu-supply = <&buck2_reg>;
+};
+
+&ddrc {
+	operating-points-v2 = <&ddrc_opp_table>;
+
+	ddrc_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-266500000 {
+			opp-hz = /bits/ 64 <266500000>;
+		};
+
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+		};
+	};
+};
+
+&ecspi2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ecspi2_pins>;
+	/* native chip-select causes reading 0xffffffff */
+	cs-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
+	num-cs = <1>;
+	status = "okay";
+
+	can@0 {
+		compatible = "microchip,mcp2518fd";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&can_pins>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
+		clocks = <&clk IMX8MN_CLK_CLKOUT1>;
+		/* generate 8MHz clock from soc-internal 24mhz reference */
+		assigned-clocks = <&clk IMX8MN_CLK_CLKOUT1_SEL>,
+			  <&clk IMX8MN_CLK_CLKOUT1_DIV>;
+		assigned-clock-rates = <0>, <8000000>;
+		assigned-clock-parents = <&clk IMX8MN_CLK_24M>, <0>;
+	};
+};
+
+&fec1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&fec1_pins>;
+	phy-mode = "rgmii-id";
+	phy-handle = <&phy4>;
+	local-mac-address = [00 00 00 00 00 00];
+	fsl,magic-packet;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/*
+		 * Depending on board revision two different phys are used:
+		 * - v1.1: atheros phy at address 4
+		 * - v1.2+: analog devices phy at address 0
+		 * Configure first version by default.
+		 * On v1.2 and later, U-Boot will enable the correct phy
+		 * based on runtime detection and patch dtb accordingly.
+		 */
+
+		/* ADIN1300 */
+		phy0: ethernet-phy@0 {
+			reg = <0>;
+			reset-gpios = <&gpio3 19 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10>;
+			reset-deassert-us = <5000>;
+			interrupt-parent = <&gpio1>;
+			interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
+			adi,link-st-polarity = <GPIO_ACTIVE_LOW>;
+			adi,led-polarity = <GPIO_ACTIVE_LOW>;
+			status = "disabled";
+
+			leds {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				led@0 {
+					reg = <0>;
+					color = <LED_COLOR_ID_YELLOW>;
+					function = LED_FUNCTION_LAN;
+					default-state = "keep";
+					active-low;
+				};
+			};
+		};
+
+		/* AR8035 */
+		phy4: ethernet-phy@4 {
+			reg = <4>;
+			reset-gpios = <&gpio3 19 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			status = "okay";
+		};
+	};
+};
+
+&gpio5 {
+	usb-hub-reset-hog {
+		gpio-hog;
+		gpios = <3 GPIO_ACTIVE_LOW>;
+		output-low; /* deasserted */
+		line-name = "usb-hub-reset";
+	};
+};
+
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pins>;
+	status = "okay";
+
+	pmic@4b {
+		compatible = "rohm,bd71847";
+		reg = <0x4b>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pmic_pins>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+		rohm,reset-snvs-powered;
+
+		#clock-cells = <0>;
+		clocks = <&osc_32k>;
+		clock-output-names = "clk-32k-out";
+
+		regulators {
+			BUCK1 {
+				// supplies soc vdd, soc mipi vdd @ 0.9V
+				regulator-name = "buck1";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <1250>;
+				rohm,dvs-run-voltage = <850000>;
+				rohm,dvs-suspend-voltage = <750000>;
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
+				rohm,dvs-suspend-voltage = <0>;
+			};
+
+			BUCK3 {
+				// BUCK5 in datasheet
+				// output floating
+				regulator-name = "buck3";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1350000>;
+			};
+
+			BUCK4 {
+				// BUCK6 in datasheet
+				// supplies ldo3, ldo5, muxsw
+				regulator-name = "buck4";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			BUCK5 {
+				// BUCK7 in datasheet
+				// supplies ldo4, ldo6, muxsw
+				// enables dram vpp @ 2.5V
+				regulator-name = "buck5";
+				regulator-min-microvolt = <1605000>;
+				regulator-max-microvolt = <1995000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			BUCK6 {
+				// BUCK8 in datasheet
+				// supplies dram @ 1.2V
+				regulator-name = "buck6";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			LDO1 {
+				// supplies soc snvs @ 1.8V
+				regulator-name = "ldo1";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			LDO2 {
+				// supplies soc snvs @ 0.8V
+				regulator-name = "ldo2";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <900000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			LDO3 {
+				// supplies soc vdd @ 1.8V
+				regulator-name = "ldo3";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			LDO4 {
+				// output floating
+				regulator-name = "ldo4";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			LDO5 {
+				// output floating
+				regulator-name = "ldo5";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <3300000>;
+			};
+
+			LDO6 {
+				// supplies soc vdd mipi @ 1.2V
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
+&i2c2 {
+	/*
+	 * routed to various connectors:
+	 * - basler camera (CON2)
+	 * - touchscreen (J3)
+	 * - expansion connector (J14)
+	 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_pins>;
+	status = "okay";
+};
+
+&i2c3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c3_pins>;
+	status = "okay";
+
+	expander: gpio@20 {
+		compatible = "ti,tca6408";
+		reg = <0x20>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_expander_pins>;
+		reset-gpios = <&gpio3 16 GPIO_ACTIVE_LOW>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "SYSGD", "PFO#", "CAPGD", "CAPFLT#",
+				  "CHGEN#", "BSTEN#", "", "";
+	};
+
+	light-sensor@44 {
+		compatible = "isil,isl29023";
+		reg = <0x44>;
+	};
+
+	accelerometer@53 {
+		compatible = "adi,adxl345";
+		reg = <0x53>;
+	};
+
+	/* battery-charger@68 */
+
+	rtc: rtc@69 {
+		compatible = "abracon,abx80x";
+		reg = <0x69>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&rtc_pins>;
+		abracon,tc-diode = "schottky";
+		abracon,tc-resistor = <3>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
+	};
+};
+
+&i2c4 {
+	/* routed to expansion connector (J14) */
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c4_pins>;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&tamper_pins>, <&usb_hub_pins>;
+
+	ieee802151_radio_pins: pinctrl-ieee802151-radio-grp {
+		fsl,pins = <
+			/* RESETN */
+			MX8MN_IOMUXC_GPIO1_IO05_GPIO1_IO5	0x0
+			/* VDD_EN */
+			MX8MN_IOMUXC_GPIO1_IO06_GPIO1_IO6	0x0
+			/* SWDCLK */
+			MX8MN_IOMUXC_GPIO1_IO14_GPIO1_IO14	0x0
+			/* SDIO */
+			MX8MN_IOMUXC_GPIO1_IO15_GPIO1_IO15	0x0
+		>;
+	};
+
+	can_pins: pinctrl-can-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SAI3_TXD_GPIO5_IO1		0x140
+		>;
+	};
+
+	ecspi2_pins: pinctrl-ecspi2-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_ECSPI2_SCLK_ECSPI2_SCLK	0x96
+			MX8MN_IOMUXC_ECSPI2_MOSI_ECSPI2_MOSI	0x1d6
+			MX8MN_IOMUXC_ECSPI2_MISO_ECSPI2_MISO	0x1d6
+			MX8MN_IOMUXC_ECSPI2_SS0_GPIO5_IO13	0x1d6
+		>;
+	};
+
+	fec1_pins: pinctrl-fec1-grp {
+		/*
+		 * Some pins are sampled at phy reset to apply configuration:
+		 * - AR803x PHY (revision 1.1)
+		 *   - RXD[1:0]: phy address bits [1:0]
+		 *   - RXD[3:2],RX_CTL: mac interface select bits 3,1,0
+		 * - ADIN1300 PHY (revision 1.2 or later)
+		 *   - RXD[3:0]: phy address bits [3:0]
+		 *   - RX_CTL,RXC: mac interface select bits 1,0
+		 * SoC enables pull-down at reset, PHYs have internal
+		 * pull-down, so pinmux may unset pull-enable.
+		 */
+		fsl,pins = <
+			MX8MN_IOMUXC_ENET_MDC_ENET1_MDC			0x2
+			MX8MN_IOMUXC_ENET_MDIO_ENET1_MDIO		0x2
+			MX8MN_IOMUXC_ENET_TD3_ENET1_RGMII_TD3		0x1e
+			MX8MN_IOMUXC_ENET_TD2_ENET1_RGMII_TD2		0x1e
+			MX8MN_IOMUXC_ENET_TD1_ENET1_RGMII_TD1		0x1e
+			MX8MN_IOMUXC_ENET_TD0_ENET1_RGMII_TD0		0x1e
+			/* RD[3:0] sampled at phy reset for address bits [3:0] */
+			MX8MN_IOMUXC_ENET_RD3_ENET1_RGMII_RD3		0x90
+			MX8MN_IOMUXC_ENET_RD2_ENET1_RGMII_RD2		0x90
+			MX8MN_IOMUXC_ENET_RD1_ENET1_RGMII_RD1		0x90
+			MX8MN_IOMUXC_ENET_RD0_ENET1_RGMII_RD0		0x90
+			MX8MN_IOMUXC_ENET_TXC_ENET1_RGMII_TXC		0x10
+			MX8MN_IOMUXC_ENET_RXC_ENET1_RGMII_RXC		0x90
+			MX8MN_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL	0x90
+			MX8MN_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL	0x10
+			/* phy reset */
+			MX8MN_IOMUXC_SAI5_RXFS_GPIO3_IO19		0x0
+			/* phy interrupt */
+			MX8MN_IOMUXC_GPIO1_IO10_GPIO1_IO10		0x140
+		>;
+	};
+
+	gpio_expander_pins: pinctrl-gpio-expander-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_NAND_READY_B_GPIO3_IO16	0x140
+			MX8MN_IOMUXC_SD1_STROBE_GPIO2_IO11	0x140
+		>;
+	};
+
+	i2c1_pins: pinctrl-i2c1-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_I2C1_SCL_I2C1_SCL		0x400001c2
+			MX8MN_IOMUXC_I2C1_SDA_I2C1_SDA		0x400001c2
+		>;
+	};
+
+	i2c2_pins: pinctrl-i2c2-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_I2C2_SCL_I2C2_SCL		0x400001c2
+			MX8MN_IOMUXC_I2C2_SDA_I2C2_SDA		0x400001c2
+		>;
+	};
+
+	i2c3_pins: pinctrl-i2c3-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_I2C3_SCL_I2C3_SCL		0x400001c2
+			MX8MN_IOMUXC_I2C3_SDA_I2C3_SDA		0x400001c2
+		>;
+	};
+
+	i2c4_pins: pinctrl-i2c4-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_I2C4_SCL_I2C4_SCL		0x400001c2
+			MX8MN_IOMUXC_I2C4_SDA_I2C4_SDA		0x400001c2
+		>;
+	};
+
+	led_pins: pinctrl-led-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_GPIO1_IO11_GPIO1_IO11	0x100
+			MX8MN_IOMUXC_GPIO1_IO12_GPIO1_IO12	0x100
+			MX8MN_IOMUXC_GPIO1_IO13_GPIO1_IO13	0x100
+		>;
+	};
+
+	modem_pins: pinctrl-modem-grp {
+		fsl,pins = <
+			/* RESET_N: modem-internal pull-down */
+			MX8MN_IOMUXC_GPIO1_IO07_GPIO1_IO7	0x0
+			/* PWRKEY: pull-down ensures always-on */
+			MX8MN_IOMUXC_GPIO1_IO08_GPIO1_IO8	0x100
+		>;
+	};
+
+	pmic_pins: pinctrl-pmic-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_GPIO1_IO03_GPIO1_IO3	0x140
+		>;
+	};
+
+	regulator_modem_vbat_pins: pinctrl-regulator-modem-vbat-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SAI5_MCLK_GPIO3_IO25	0x0
+		>;
+	};
+
+	regulator_modem_vbus_pins: pinctrl-regulator-modem-vbus-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SPDIF_RX_GPIO5_IO4		0x0
+		>;
+	};
+
+	regulator_usb1_vbus_pins: pinctrl-regulator-usb1-vbus-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SPDIF_EXT_CLK_GPIO5_IO5	0x0
+		>;
+	};
+
+	regulator_usdhc2_vmmc_pins: pinctrl-regulator-usdhc2-vmmc-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD2_RESET_B_GPIO2_IO19	0x0
+		>;
+	};
+
+	rtc_pins: pinctrl-rtc-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_GPIO1_IO01_GPIO1_IO1	0x140
+			MX8MN_IOMUXC_SAI3_RXFS_GPIO4_IO28	0x100
+		>;
+	};
+
+	tamper_pins: pinctrl-tamper-grp {
+		/*
+		 * Routed to physical tamper input (J12),
+		 * accelerometer and light-sensor interrupts.
+		 */
+		fsl,pins = <
+			MX8MN_IOMUXC_GPIO1_IO09_GPIO1_IO9	0x140
+		>;
+	};
+
+	uart1_pins: pinctrl-uart1-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_UART1_RXD_UART1_DCE_RX	0x140
+			MX8MN_IOMUXC_UART1_TXD_UART1_DCE_TX	0x140
+			MX8MN_IOMUXC_UART3_RXD_UART1_DCE_CTS_B	0x140
+			MX8MN_IOMUXC_UART3_TXD_UART1_DCE_RTS_B	0x140
+			/* BT_REG_ON */
+			MX8MN_IOMUXC_SD1_DATA4_GPIO2_IO6	0x0
+			/* BT_WAKE_DEV */
+			MX8MN_IOMUXC_SD1_DATA5_GPIO2_IO7	0x0
+			/* BT_WAKE_HOST */
+			MX8MN_IOMUXC_SD1_DATA6_GPIO2_IO8	0x100
+		>;
+	};
+
+	uart2_pins: pinctrl-uart2-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_UART2_RXD_UART2_DCE_RX	0x140
+			MX8MN_IOMUXC_UART2_TXD_UART2_DCE_TX	0x140
+		>;
+	};
+
+	uart3_pins: pinctrl-uart3-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_ECSPI1_MOSI_UART3_DTE_RX	0x140
+			MX8MN_IOMUXC_ECSPI1_SCLK_UART3_DTE_TX	0x140
+			MX8MN_IOMUXC_ECSPI1_MISO_UART3_DTE_RTS_B	0x140
+			MX8MN_IOMUXC_ECSPI1_SS0_UART3_DTE_CTS_B	0x140
+		>;
+	};
+
+	uart4_pins: pinctrl-uart4-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_UART4_RXD_UART4_DCE_RX	0x140
+			MX8MN_IOMUXC_UART4_TXD_UART4_DCE_TX	0x140
+		>;
+	};
+
+	usb_hub_pins: pinctrl-usb-hub-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SPDIF_TX_GPIO5_IO3		0x0
+		>;
+	};
+
+	usdhc1_pins: pinctrl-usdhc1-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD1_CLK_USDHC1_CLK		0x190
+			MX8MN_IOMUXC_SD1_CMD_USDHC1_CMD		0x1d0
+			MX8MN_IOMUXC_SD1_DATA0_USDHC1_DATA0	0x1d0
+			MX8MN_IOMUXC_SD1_DATA1_USDHC1_DATA1	0x1d0
+			MX8MN_IOMUXC_SD1_DATA2_USDHC1_DATA2	0x1d0
+			MX8MN_IOMUXC_SD1_DATA3_USDHC1_DATA3	0x1d0
+			/* wifi refclk */
+			MX8MN_IOMUXC_GPIO1_IO00_ANAMIX_REF_CLK_32K	0x0
+			/* WL_WAKE_HOST */
+			MX8MN_IOMUXC_SD1_DATA7_GPIO2_IO9	0x100
+			/* WL_REG_ON */
+			MX8MN_IOMUXC_SD1_RESET_B_GPIO2_IO10	0x0
+		>;
+	};
+
+	usdhc2_pins: pinctrl-usdhc2-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x190
+			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d0
+			MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d0
+			MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d0
+			MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d0
+			MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d0
+			MX8MN_IOMUXC_SD2_CD_B_USDHC2_CD_B	0x0
+			/* usdhc2 signalling voltage pmic control */
+			MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x140
+		>;
+	};
+
+	usdhc2_100mhz_pins: pinctrl-usdhc2-100mhz-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x194
+			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d4
+			MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d4
+			MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d4
+			MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d4
+			MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d4
+			MX8MN_IOMUXC_SD2_CD_B_USDHC2_CD_B	0x0
+			/* usdhc2 signalling voltage pmic control */
+			MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x140
+		>;
+	};
+
+	usdhc2_200mhz_pins: pinctrl-usdhc2-100mhz-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x196
+			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d6
+			MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d6
+			MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d6
+			MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d6
+			MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d6
+			MX8MN_IOMUXC_SD2_CD_B_USDHC2_CD_B	0x0
+			/* usdhc2 signalling voltage pmic control */
+			MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x140
+		>;
+	};
+
+	usdhc3_pins: pinctrl-usdhc3-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_NAND_WE_B_USDHC3_CLK	0x190
+			MX8MN_IOMUXC_NAND_WP_B_USDHC3_CMD	0x1d0
+			MX8MN_IOMUXC_NAND_DATA04_USDHC3_DATA0	0x1d0
+			MX8MN_IOMUXC_NAND_DATA05_USDHC3_DATA1	0x1d0
+			MX8MN_IOMUXC_NAND_DATA06_USDHC3_DATA2	0x1d0
+			MX8MN_IOMUXC_NAND_DATA07_USDHC3_DATA3	0x1d0
+			MX8MN_IOMUXC_NAND_RE_B_USDHC3_DATA4	0x1d0
+			MX8MN_IOMUXC_NAND_CE2_B_USDHC3_DATA5	0x1d0
+			MX8MN_IOMUXC_NAND_CE3_B_USDHC3_DATA6	0x1d0
+			MX8MN_IOMUXC_NAND_CLE_USDHC3_DATA7	0x1d0
+			MX8MN_IOMUXC_NAND_CE1_B_USDHC3_STROBE	0x190
+		>;
+	};
+
+	wdog1_pins: pinctrl-wdog1-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B	0x140
+		>;
+	};
+};
+
+/* Bluetooth */
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins>;
+	uart-has-rtscts;
+	/* select 80MHz parent clock to support maximum baudrate 4Mbps */
+	assigned-clocks = <&clk IMX8MN_CLK_UART1>;
+	assigned-clock-parents = <&clk IMX8MN_SYS_PLL1_80M>;
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
+/* console */
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2_pins>;
+	status = "okay";
+};
+
+/* RS485 */
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart3_pins>;
+	uart-has-rtscts;
+	linux,rs485-enabled-at-boot-time;
+	fsl,dte-mode;
+	status = "okay";
+};
+
+/* 802.15.1 radio */
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart4_pins &ieee802151_radio_pins>;
+	status = "okay";
+};
+
+&usbotg1 {
+	vbus-supply = <&reg_usb1_vbus>;
+	dr_mode = "host";
+	disable-over-current;
+	status  = "okay";
+};
+
+/* WiFi */
+&usdhc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&usdhc1_pins>;
+	vmmc-supply = <&reg_vdd_3v3>;
+	vqmmc-supply = <&reg_vdd_1v8>;
+	bus-width = <4>;
+	mmc-pwrseq = <&usdhc1_pwrseq>;
+	status = "okay";
+};
+
+/* microSD */
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&usdhc2_pins>;
+	pinctrl-1 = <&usdhc2_100mhz_pins>;
+	pinctrl-2 = <&usdhc2_200mhz_pins>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	bus-width = <4>;
+	broken-cd;
+	status = "okay";
+};
+
+/* eMMC */
+&usdhc3 {
+	/*
+	 * Use lowest drive strength for all high-speed modes to minimise
+	 * electro-magnetic emissions.
+	 * In this particular design HS-400 still works okay, no extra
+	 * pinctrl for 100mhz and 200mhz are required.
+	 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&usdhc3_pins>;
+	vmmc-supply = <&reg_vdd_3v3>;
+	vqmmc-supply = <&reg_vdd_1v8>;
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


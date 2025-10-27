Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB4BC11AEB
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 23:26:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E179C10E562;
	Mon, 27 Oct 2025 22:26:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="qkgoUHDJ";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="qkgoUHDJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11023093.outbound.protection.outlook.com [40.107.159.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08DFB10E50C
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 17:48:42 +0000 (UTC)
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=SQHEk3Pe0Gx/GpqFLoGBg8AW+3fucYKuttHafPVXyssruZy6kaYqsegYeEq4ana65TWllu7HqmnvwJ5FgFu3aWXZ9iygJnsSDcdxQYpnIzZelbXhPyqpaYjGT/XJ/RJxG6Jni6H31ErDCQ+LeG4GxYYAX0C4bJldXuBl/o2+QtIiZFe6/jKdc5Ek6K2/m+3ns7+ZxoSTSOhoEfctmkZR91R3cAEQVZqSN5ECwL7zFw/IqxMRcE2dVNg9vGfTFxbG332iilbuzLuYsZDq6BEcLIgGDPd5STxsY/EeQDg0U0ZFLOo6X5hekTG0/xXzqsx+Uiuiub6A7paShSDq4WPzyg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GIh1nuC5KAQLZQe/bSQW9XebN/sjX1iFRKyUrL81Xxw=;
 b=SSOtHbYU54cNDr+K9VJWoSiGRoU3HOR8W+P4im9cTaykhdsbgS5G94PRJBp+Kb0xyKemS00LHRXdEEwcoNNH1Ohg5p0VisHre7PLwdvgfZ+X4PRU4LhazRT2oT82LQf44JI+tPmpIvz1Iyf9tbvWagrfi4TVwaELK/3WB3q+0kjcoxb44JeLuColHev3ffLQC78FnvBdRoXbslCdhOQWR3D3aGb7WQV8audcSRPPh92rGBPr/RD+SYr9jcmIP382yGDOANlHG+T+wQhgjFH2TsCLli8D1/OuZolMvqE3NBpMDHW41YhhuAW3UTu+JePKSAh/6PqiPGNJ7D7HXwOx/A==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIh1nuC5KAQLZQe/bSQW9XebN/sjX1iFRKyUrL81Xxw=;
 b=qkgoUHDJWHEFnRIxPnuw3wpcPDNpqJ7JV3mBpWNAi6jLO60XoAJ9UIUvB8yQB26sV7t9nMpB32aXnONPkiDbJzcm4o9dkElUDes93cIQ2M8G2gUf8ykRZLxA+/E7k5Ab6/aJaB/yDsIleCZ/xosd8jX/gbgT4bA8248ajoiydSw=
Received: from DU2P250CA0003.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::8) by
 PA4PR04MB7805.eurprd04.prod.outlook.com (2603:10a6:102:c2::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.18; Mon, 27 Oct 2025 17:48:38 +0000
Received: from DU6PEPF00009529.eurprd02.prod.outlook.com
 (2603:10a6:10:231:cafe::c2) by DU2P250CA0003.outlook.office365.com
 (2603:10a6:10:231::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.19 via Frontend Transport; Mon,
 27 Oct 2025 17:48:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU6PEPF00009529.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10 via
 Frontend Transport; Mon, 27 Oct 2025 17:48:38 +0000
Received: from emails-918080-12-mt-prod-cp-eu-2.checkpointcloudsec.com
 (ip-10-20-6-148.eu-west-1.compute.internal [10.20.6.148])
 by mta-outgoing-dlp-467-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with
 ESMTPS id 0F2A98030A; Mon, 27 Oct 2025 17:48:38 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1761587318; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=GIh1nuC5KAQLZQe/bSQW9XebN/sjX1iFRKyUrL81Xxw=;
 b=DBcaNIwDBWqZWXKDkey5AjA90rDT4UzKUtJ1oQ96Ja8VDPxZvrnBWLBQpZx83J+GXiA2f
 sy6Q80w/DgCGXvqPzhFV6vbMFNcBTK79qfwVtOtkE6plnVHTx8GqVLW/he6sLZXxvzpPQ/d
 3Q2qZN9HENjjiJtbQTVjrbOPR47+An0=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1761587318;
 b=IjwN3YilXqItI+voWSdMB+fSfUSNJI0xnNapbWFcpSqqK5rK/IUfvoYE8vhto2bf2GK7a
 IzC3/3lRn+s9V/CBqCtyT6xCyTUGQmRnOl4AGJI6xQHJmgpDXTYeSCECFyVluZMCzyzhjiv
 O3V1Fb2WwACvEYBU00pMuQ8Ixjyq5GI=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mSjVE3imFCU47mp82W9XSuYkC2cRgZvodhI1af/U85wT+0SBHUPOBNm/4IstkQTATaP4K31GoqFAzAM7bYTgyFaH9b3JGG0UkGvBZZwqbJIZhyU0Z469ElCCs1f24fRyHxaUTwJhLfaBoGDAL11HV0oUG1Q9e4u3pdRNdM4wM8lzb+Mfu9SQauhpyvbzHifqP70eBZtFSOG6+tzYs+Mz4ETSklriB1iV1YSRSOfWC6zLMeh4BiltLypkWbMQ4uhZJun05bXU5e5NZlfzg3NtLQtIJ0pBsymyjfkRZyWg3Hss2jpNPl9OJwkU0LFNzV4r0ixJNnr03Qu8bHxmASNz3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GIh1nuC5KAQLZQe/bSQW9XebN/sjX1iFRKyUrL81Xxw=;
 b=pNdVkfcbgku6KXbIsvU5tPYwAAfMi3/F/XJHQ+cMVOY6v1pPL0H7OOLtvED+U8EJB0bWxJIhLjFSUOPZWqXhE3pw/9oiyJuVpSID6rtaQdWNdo/R5aNtBtnsoMTYgV4J3aTc0sn7j8skucNE50EngPkmZV5EpUb0CxCVxcC7zlItmWRVHeAiO7WVKfKCK4pXk63pxfEgbKJcS5kVNh6rOtttMM1qU2wAoi6ee3bJefIf3XUC2uDR9kgMCHBBtMYpcKpW+jb/HLe6CKqg+bHHcWmDykvdrRJwWok7vSn7sKvMEpEQzeQzgPehmGBOt7xScI/u8r+dQBKDu4S0x1oaMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIh1nuC5KAQLZQe/bSQW9XebN/sjX1iFRKyUrL81Xxw=;
 b=qkgoUHDJWHEFnRIxPnuw3wpcPDNpqJ7JV3mBpWNAi6jLO60XoAJ9UIUvB8yQB26sV7t9nMpB32aXnONPkiDbJzcm4o9dkElUDes93cIQ2M8G2gUf8ykRZLxA+/E7k5Ab6/aJaB/yDsIleCZ/xosd8jX/gbgT4bA8248ajoiydSw=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DBAPR04MB7365.eurprd04.prod.outlook.com (2603:10a6:10:1a2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 27 Oct
 2025 17:48:22 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 17:48:22 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 27 Oct 2025 18:48:14 +0100
Subject: [PATCH 05/10] arm64: dts: imx8mp-hummingboard-pulse/cubox-m: fix
 vmmc gpio polarity
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-imx8mp-hb-iiot-v1-5-683f86357818@solid-run.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|DBAPR04MB7365:EE_|DU6PEPF00009529:EE_|PA4PR04MB7805:EE_
X-MS-Office365-Filtering-Correlation-Id: f50317f8-b5ad-4b07-906e-08de15810f29
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|52116014|376014|366016|7416014|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?Y2t6RXFZeERLWk1rVzdYUkEzV0haMStJSEhYS01wU1MwQlBzUzZQUGFoZFVH?=
 =?utf-8?B?U1l1L1ZpTEhRN2QvSHFyREt3UTNISDNCLzRjZGZKaHU5YTBZb01oZkpyOFJs?=
 =?utf-8?B?RTVpc2ZHaXlTVUEyeEFyU0V3ZVFSRUV1Z2xERGk0R2YwSTUyRlBRRXRyOE16?=
 =?utf-8?B?VFNMSEdra2xjRlB2TU9NOVZDZkFGdDVzc1hEVmluaE1NRkpZWmllR1h1U2FJ?=
 =?utf-8?B?aEQwcFE4NHh6L2hESGdKYTJYRXdEbTB4VHBpcjFyUXQrQkYvSVVFMzJBVWh6?=
 =?utf-8?B?UWg3OU9JTGhQYlRqRkMwN2RZeDJPUWlNVUZWTzBHVzhPZE9ZLzFnWEQ3RkpN?=
 =?utf-8?B?K094YWEvQmQ5a05KMlNGL09WRzRxZUlVbm1LTUFVTDZvTmpsVjgxYzE4UHdz?=
 =?utf-8?B?UnRlNkxSQlRjWElvZC9rR1VWc256UzBacW02a3FwTWZ6OTNZdjJTVGcrb21t?=
 =?utf-8?B?VlV5dTN3eE5KdURSSkdOUnFzdGdVTmQ2cUFkRUU0ajVBaW5Fdmh3aGgyTkxP?=
 =?utf-8?B?ZlJPSEZpRGFvUTdRQkNWOCtRZUxnTitrT2dHSCtyMExaOGRrYTl2ckxXdGxa?=
 =?utf-8?B?dnRxT21RcE9EM3NEVlBaQ0xPaFVhY3MvcVFzQTd5VWo2OThEZDFPWHpVcmkr?=
 =?utf-8?B?OFJNL2VlZUE5c2c3QlVTRUZROVhjd0hqQ3dvM3NRbFgvK0Rnb3Y1ZWtSZlE3?=
 =?utf-8?B?aXJMRjBlK2pUUFFwYkxSNmxLWUdVclREOFphZWk3eHA1V1hwYVZOR01MODA0?=
 =?utf-8?B?dEloTzg0WEpyVGFwaXE0dWlGMytCdi9NM05Udzd4elhXVmZObUJYVnFPL1dR?=
 =?utf-8?B?RmE5TW50WjQxU21DeGFrRDFZNDh2enZTU0RJbVlyQ0J0U05mbXRvbEhIcXA5?=
 =?utf-8?B?aG9SMjNTdUJvYko5bDFMZHYyVlRHMmhzK01VbW1idFhwd1o4bklHYjNCSVJX?=
 =?utf-8?B?RWk4YUhlT3RsY3ZSRWlVVzFnQmZVYUs2SXVxU0N1andQaDZ6RzBtUmdzc0pl?=
 =?utf-8?B?OUdLMmE5clRLQ0JPb3VpQzJqZzJoZ2JMWTg2eXdVL3M5NXpDSXRVVnAveDBp?=
 =?utf-8?B?V1o3WWw2M05tWDVSMnUza0VnRis2ZnBFMFU5VThCdDlSVVdZNzJDOTdLZURP?=
 =?utf-8?B?YTRJZlZRRHpnZExRb0loVUJEeXlYeit4YUQ4dFF0cmJpRDdZZlFmZkczN09D?=
 =?utf-8?B?WktxdUJKNmR0V2x2VFZxeUo2bDFxcEdZa3V1SzhYZlk3ODZYZHZTSy9IK0Vk?=
 =?utf-8?B?OUtWeGNHV3h1d0RxTERySjA5R09PT25FSGpodDFzOHJSMjVNanZzT3NGblJT?=
 =?utf-8?B?VForUzZJQXdCeDRNb3lNcVYvdWJIU1ZnYmhzc1VBemZCVG1qMjdGT2pzOHpK?=
 =?utf-8?B?KzNIOW1EcjBoVnhKa01ocFIvNFB3b0Z5MmlJOGtlVTRLSW1pSGluRzZKcVFz?=
 =?utf-8?B?dTVaQkJ2QjhoNnF6NU1QdTZuREpWeUdDcU5ZV3RPQS91N3RpWDVLelh4dTFS?=
 =?utf-8?B?M096Q3M0QXpYZ3lZOXJHSHp2aEs0d0xiZThiN3drdklVUVFmbzJFbGdmcU1W?=
 =?utf-8?B?dS9ZMlE5M2psOHNDelpPRVZlSE1xU3dkTm93amV1b01YMER6UFVuRzJpUGsr?=
 =?utf-8?B?cUtvM2taaHpTSFNwTFRUNTdYT1FMYUo0NWNpSVNpOURhL2dmdnRqLzZQeExy?=
 =?utf-8?B?UnVranllN0tLQ3R4VmJKYWZvYmM2NEE5S253bm12ZHd4djM4OFh4emthbmto?=
 =?utf-8?B?K2JRSFg4Y2pxa3VKWDlmd1VHZ1ovSmx0K0ZBTmM5SHhMb0d1czBYeXdpOGVT?=
 =?utf-8?B?R2I4bHE0M2JLRzMraGJNckRwRkdXaEdMZDJqamU1am9YMUpmTm40ZC9QTnNh?=
 =?utf-8?B?QTV2Q3YzK2YrZ3BOdlAvODBTc1BSMk1ySkVuYjRIaUJvQjZweTRzbTF3Vkhr?=
 =?utf-8?B?Y3Y2SFg1b3VSdENZSEcxWUVsVFk2R1U3b3M0dXVGSTFXSGM4UnBBT2hGVFh3?=
 =?utf-8?B?bG90UmtaOHc1UDBzeUw3NUtuOFNXMWdnUzhaQU82VWl5ZElmSzhGUWc0UWls?=
 =?utf-8?B?Ti9xK2hxVTdwbCtoRDA5TDRLa2wzUHZsYXBHZz09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB8749.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(366016)(7416014)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7365
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 1673cbc8b0e6446f83d5fdca61f89260:solidrun,
 office365_emails, sent, inline:debd18510902b80412e2749450943e78
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF00009529.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 70c978e6-7cbb-4290-33f0-08de15810583
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|82310400026|376014|7416014|1800799024|36860700013|35042699022|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Um1CdnNaNDZ3NWtPaXFPR2lKeUlUaktYYTdEcU0rS1ZtbnZ5UW9DT0U0cFVL?=
 =?utf-8?B?c3BNY0NyWEtaVWM4aHVqYXc3OUdKR24yZU5oMlVzWFFlVUtOQ3RkUTJTRmc4?=
 =?utf-8?B?UzhOdkczRWJjbEFxcWxkRnY2QmtMUUJPYlk5MkwxdHVBSFdyL25FWHJQQ3Zl?=
 =?utf-8?B?MlpyaWRqSFpqYS9XSk1ObVNZcm5pZVR2ZGlGOVZrQ1ZJN2lOa3BUZWU4Ylh6?=
 =?utf-8?B?M1RNbS9ka1dHWGdRYkdqN2FpMEhaU2lqQmliMEx6YXZxeU5sNVp4Ymx5NHQx?=
 =?utf-8?B?TG9qVmFuanJxVjdGcmVWdHBINS9MaVhGK25FS1BvOFp1YnFMS1Q2VjVkYVVO?=
 =?utf-8?B?OTFuazhDalVrQ0ZBU1NKazEyTVpBeEdaMVZLY1dGYVFZd3VPUWMvYUgzQ0RB?=
 =?utf-8?B?d3lQZjQ5eHQxSkFFSFBWYUhQYXI4bWMvaGdUcCtoeFp4VkwxVFl2eE5CSkRk?=
 =?utf-8?B?RlAyL09NdThPLzVSNWhvUmhmMUljbEl4Si9DSjUwTkpTVlFEd3o1STJaaENH?=
 =?utf-8?B?QmVYOXE5emQ2ZEl0aGJ6ZkRGdEtETXQwaktGU1R5QVlLbTA3Ti9yVkZNZGRD?=
 =?utf-8?B?MXVWNzExbUZyUFBONUU4VzhoQ1JQaFpjY2k4VWJuL2JiR3NVaWtGbE11Vmg2?=
 =?utf-8?B?VlA3UGY4NW1BVFJ5Z29KeDhDR2xvcU9RMkF6bWtwTHdvSWJSTERSR0pFcmR3?=
 =?utf-8?B?Unp2c2RpT3o2Sm5wRnEwRVFBZFRDK2dHM2VyY3pJUStUazNTOTV0WlFrRE1l?=
 =?utf-8?B?M080QTFFZjBmd2R1ck83MmxVK1k3akllMHduRDYyVDRvRVBrKzU5dGFMUkdo?=
 =?utf-8?B?YmpISjFUdHdEMkd2dkViT05IbzRMVmM4eWFURFQyVy9oNlVSSXNraEN2SHRT?=
 =?utf-8?B?VkZISEFOWENhN21iRVhSUHdYWHEvN3FpcmN6T3NDVTNnSHByejMvK1FFOEN4?=
 =?utf-8?B?WGZaYmRVSW1ORXlmM3E2SU5LQ0JrYkFpY2NiOXNERHNablp3U1ltZk92SWxr?=
 =?utf-8?B?c0RkS3d0M1V4SWhycUREbXFKT3VqNGNhd1lXTEo0ZkJMZFJvWGlGNnltTTJo?=
 =?utf-8?B?dE5lMVM5TzFObGh5UmYveThCNDI4eTd5aVhicGlZcnBzeTArZTM3MnR6ek84?=
 =?utf-8?B?OTRGZGlwSHNKb214dGtFRXVOM3VJRVQyQUNtKzhXODFQVkQzdTJyeTQxQnFy?=
 =?utf-8?B?ajQ3enFrelU2RTJ1cTFMYzlCdGNGbDNaV2Rha1YxVjIwbGhkSDFweFE0VmxV?=
 =?utf-8?B?VGVLVlhIejFvNk40NHlpU2hUVDhvbytpQ0dXQ2h6OElaUGdyQ29aNitNSEZi?=
 =?utf-8?B?TjJQb3pXVERpR0FqTFdDNWFWMk56T1A0bnVnbmduNTdDQUFxK29ET0h3UndH?=
 =?utf-8?B?QXVtMENyaXVWTUliQllRQkx5MzluRzRyREl6TVBQM0lISENFc1prY0ZEQWRJ?=
 =?utf-8?B?alNycWU0bDgyekI1LzVNdVN0MytxZVVtNWhYUU9NSGFHSEo2MWJudTRHVEgy?=
 =?utf-8?B?NVBoSjZUWHo4MGVrU2xIMllsdldwM3YxNkFoclFMZ1MvdUtRcUZPUDgyVXh1?=
 =?utf-8?B?SzZLWm95bFZPOVh0NDVSaGNkSmJaMVFVcmMzOUhkOUk0QlpIYWdnYlZ0TFl0?=
 =?utf-8?B?VldGd3hhVHRiNThUK0VnU2VWRHNRUlQxb2I0Y3NQdGF5ZmJQZFVjRXR4ZmVn?=
 =?utf-8?B?ZFVrdGxkVW5wRXFhMHhBUWRTWUNVbWxkQTdFNU40d2lmellBSE9LTktkVWFU?=
 =?utf-8?B?U2JyTnhtM0dHZnZmaXBvSktMbzJ1V1VKdTNla29kcFJxUG1JWkpxdWtaS28v?=
 =?utf-8?B?Qm13TXRMYS95U2NWL3JRVDRDbHJVRDNoK0lzaUM3ZWkySjlBdWNXSDBWbUp6?=
 =?utf-8?B?bHNia2RibnhoSmlqU0FNSFBEdmZWWFJiSXhoSHY1Z1FhTmFNQ3ZuVGZlTm1q?=
 =?utf-8?B?WUlBNk1Jbm9NVnlueEZXNXhZdGdVZk1Kb29mV3FsUWcwd0tDd0t6QzNlemlL?=
 =?utf-8?B?akQzQkV6UVd1bCt4WUVPN0NjYTNsM1hlZ2EwQnhVUmRBbHN1cE9KOXFoSHBV?=
 =?utf-8?B?TXNtUTV0MWtKYTdBWmJGUmttaHlzSklIcXNKcUlMQkZNZ1VjY1pRbjhlUUZM?=
 =?utf-8?Q?us4POqHgAxw1aaRm/jdLMsIDT?=
X-Forefront-Antispam-Report: CIP:52.17.62.50; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:eu-dlp.cloud-sec-av.com; PTR:eu-dlp.cloud-sec-av.com;
 CAT:NONE;
 SFS:(13230040)(14060799003)(82310400026)(376014)(7416014)(1800799024)(36860700013)(35042699022)(921020);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 17:48:38.2105 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f50317f8-b5ad-4b07-906e-08de15810f29
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82; Ip=[52.17.62.50];
 Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009529.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7805
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

Fix the polarity in vmmc regulator node for the gpio from active-high to
active-low. This is a cosmetic change as regulator default to active-low
unless property enable-active-high was also specified - ignoring the
flag on gpio handle.

Fixes: a009c0c66ecb ("arm64: dts: add description for solidrun imx8mp som and cubox-m")
Fixes: 2a222aa2bee9 ("arm64: dts: add description for solidrun imx8mp hummingboard variants")
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts                    | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts b/arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts
index 8290f187b79fd..7bc213499f094 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts
@@ -68,7 +68,7 @@ vmmc: regulator-mmc {
 		regulator-name = "vmmc";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_LOW>;
 		startup-delay-us = <250>;
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi
index 825ad6a2ba14e..5b8c8489713c4 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi
@@ -73,7 +73,7 @@ vmmc: regulator-mmc {
 		regulator-name = "vmmc";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_LOW>;
 		startup-delay-us = <250>;
 	};
 

-- 
2.51.0


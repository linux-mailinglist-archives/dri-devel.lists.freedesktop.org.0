Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B346C148FC
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 13:14:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FF4010E3AC;
	Tue, 28 Oct 2025 12:14:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="PViOl+jR";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="PViOl+jR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11023133.outbound.protection.outlook.com
 [52.101.83.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F9910E3AC
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 12:14:33 +0000 (UTC)
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=s2/FYjrkeR5ohly/lC0EJqctkhq+ksrytNegiJ6YhIZrdb50iXCqYx7JCg85DZW4TVyEaiqaMRLWTpeJ2LO/p3bjCsUahIlSOr/txvHnFBZlfMIrjYtIF29fX5oZCojd8vz3y7U1ThSDsww4WaYmtRTHuGez5AEDcBNqTZdC4bNAOIRAVsLCgkd8OU9SlrJAFnwEPWNUmb3/87rvcld6UiehpoOUZuNcMW9+oBAdQNevHjLsaEc43DryyGopa/EX1wOL9wtk9EiD3NZw51lVLvpck1JPgi0Hj+BwGgTR5sXfbY1DVEXFkIa3bSmylDEJrO5Dbns11brnFgOiq/ZuUQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3LXlAtXMmVeuRkBx8rpAE7xrT1DHRIkduJP8gkxh0Nc=;
 b=ErjrFHwbGaS6p0VXij12FcL21QBqFYYBLN+WzyM5SAOb7HLY77nD2C24lRSl9UvFZse8tVVU50RqN0inOQ+Ey9UhSffihC151b1h8lT7tnGv5zXOQ+v86m7RLLU3Vj/b9bnS2oDmi77PeiyS+l/W2pPHyDIO/G5yYIvHaJC4vZ/GVWNk07J6ZgdqESWCCJ0UzqVzH/vwk7Z3SIO5USnoqUIA/2H63X/Eaw62T8gtcLZOsyxwvgPSKUggEnnS2GPfA7zMzbghuOY+n3pZ+GEKxwkZy2hQR/UIj2BnUwAPEca+v19O0q7bHM8fPdoYEqBYUvCNh6xgJwCB6soLpsdIoA==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3LXlAtXMmVeuRkBx8rpAE7xrT1DHRIkduJP8gkxh0Nc=;
 b=PViOl+jRByMJ//aw7ayUoPEK9yYV2Vtgidjb25ABX7EJCB4V2P33+wVP1IWY4okJeTU/PwsCjC9Blwy3ONkTBk90ODlVh1TYK0g/duhhU1exxV5f12R4MPqGCnDybVHef9g/hzjcxehW+d7Cx9EOKbmF2rPekfw6+RjBngGQA1U=
Received: from DU7P195CA0018.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::18)
 by PR3PR04MB7305.eurprd04.prod.outlook.com (2603:10a6:102:83::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 28 Oct
 2025 12:14:29 +0000
Received: from DU2PEPF00028D12.eurprd03.prod.outlook.com
 (2603:10a6:10:54d:cafe::2b) by DU7P195CA0018.outlook.office365.com
 (2603:10a6:10:54d::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.19 via Frontend Transport; Tue,
 28 Oct 2025 12:14:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU2PEPF00028D12.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Tue, 28 Oct 2025 12:14:28 +0000
Received: from emails-7199908-12-mt-prod-cp-eu-2.checkpointcloudsec.com
 (ip-10-20-6-148.eu-west-1.compute.internal [10.20.6.148])
 by mta-outgoing-dlp-670-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with
 ESMTPS id 4731780478; Tue, 28 Oct 2025 12:14:28 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1761653668; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=3LXlAtXMmVeuRkBx8rpAE7xrT1DHRIkduJP8gkxh0Nc=;
 b=FHluXELUI4WRZUwJAvt5KaCDl3Q4Xaj9banZOUMOj1kc7tSj3haqDTfqxbbjKjin86R/p
 1tuHf8TUZhFdk7VMCxUyksfpGmMVfVgNMghVjsu7wORYh64YvmS0qcBgLH8iPlL8ogM8Z4f
 BIj6zrL/GI9v/MSkvdZJ7deFumCWNCw=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1761653668;
 b=AJj26IU7omEKRfPLDml+yZQcOuF/3/b6sEL2q4cO29C5kyxQ5/3KGnycC0lxN7WuCUZZt
 TBrPQn4JeXdbI6stl7gwTwt2riEJLOGxZ3TIm7ZxHkdoji73gly2KJDv8B2mjcQftS4qZrC
 opGpjX2m5hIJp7idXxezhHaHYOxyOSE=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v3cIBxVR+5SPQIdsgGEzClizxkX8Rje/Tk7UyWoJwsSmb8L0tsjR5HcmhGdo5HTK3LET3S2gtTWkohmxhcYak2tY2ADPs/NHzOq1FFDa/aaOP0oCxApc7Bx6FJ3y4jD+0bLeIreVEnwx2XZmCg3lzRgHp3hZn4u6SpL0MnFrgBnE5LhJ5RGyO6ugjtvz+KujSX6SBPCEB6vABEVP/aiEZsAftrCvJdLHOeqEl29r03N2+P/UprdqJk+Y8r3UE4+VTQ2AkZvVDwb1qHZIHmIx8NnJ3c/Qbop0MsfQKJn607mLt8Ec/Wr2YMwzJnAc5s1uyMruZIcsm3V3Gt6FkflDJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3LXlAtXMmVeuRkBx8rpAE7xrT1DHRIkduJP8gkxh0Nc=;
 b=cmZnXIwDYv3aQ5ZAoeFLkpHMSbDYjJGBYJb03lVy/hibjhGTAEuiS3/K0HDTxYcyeYKEM7jJfL+7cOnNiPT6zcbtcYeTGtr3eHHh8ug3AelcEcSFK1zi+fdvCpGKCFcN2d/O9pyGBESit/5hizXECeYBPTUOpDuhBN2GuYdOUaccTcvUMpg81t93oCHsID3D0PBmWWzyLVD5QAUJwlvoo/7iznHn6v+2XcwK8WEhpr1crrRKlikaoYQsqyeDNLpLOJmBCJ9tDYr7jWE2TCylVL73VaWaGOgsOL9Q6h084+fPR2T8bDw0QEROmlcvZIiRYKCDTo2ibRNreQe+DuWOrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3LXlAtXMmVeuRkBx8rpAE7xrT1DHRIkduJP8gkxh0Nc=;
 b=PViOl+jRByMJ//aw7ayUoPEK9yYV2Vtgidjb25ABX7EJCB4V2P33+wVP1IWY4okJeTU/PwsCjC9Blwy3ONkTBk90ODlVh1TYK0g/duhhU1exxV5f12R4MPqGCnDybVHef9g/hzjcxehW+d7Cx9EOKbmF2rPekfw6+RjBngGQA1U=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AS8PR04MB7542.eurprd04.prod.outlook.com (2603:10a6:20b:299::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 28 Oct
 2025 12:14:17 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 12:14:15 +0000
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
Subject: Re: [PATCH 06/10] arm64: dts: imx8mp-hummingboard-pulse: fix
 mini-hdmi dsi port reference
Thread-Topic: [PATCH 06/10] arm64: dts: imx8mp-hummingboard-pulse: fix
 mini-hdmi dsi port reference
Thread-Index: AQHcR2njz9GrVChyxU6Sz4+uIAcGV7TXeesA
Date: Tue, 28 Oct 2025 12:14:15 +0000
Message-ID: <674127c2-edb9-4497-a76b-3e1b17d8804c@solid-run.com>
References: <20251027-imx8mp-hb-iiot-v1-0-683f86357818@solid-run.com>
 <20251027-imx8mp-hb-iiot-v1-6-683f86357818@solid-run.com>
In-Reply-To: <20251027-imx8mp-hb-iiot-v1-6-683f86357818@solid-run.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-traffictypediagnostic: PAXPR04MB8749:EE_|AS8PR04MB7542:EE_|DU2PEPF00028D12:EE_|PR3PR04MB7305:EE_
X-MS-Office365-Filtering-Correlation-Id: ed6ae3fd-a40a-4632-1f39-08de161b8af1
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020|38070700021; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?NUYyVXhFSDFGSkVNY3Fsb3lYUEhkUEZ2elhTcmI4RFBRMDAwdkU3MHVvSmdm?=
 =?utf-8?B?SjZhYTRwWWJMSkF0UWtUTk9zWFZvY01MMDgzeDBCT3c5dStvdS8xdGRzYThq?=
 =?utf-8?B?K2dxVUZhZVNFa0Iyc2tFbk15VjRIbENPYy9WTUVGbDVCeG0vQUVWYU8yZjZO?=
 =?utf-8?B?S3JWOHNteVM4QURpdU5kSmVkTUs0T1NlRVBXVnZhSWpsR1RmZFJzTUVKSkF5?=
 =?utf-8?B?WWpLNTd2dXQzT3Y5YTNISjFIR3NVRHFyeFRHWEFTazczeElhQW1yT2pCNzR6?=
 =?utf-8?B?aGVlb2plZGFjeXNaVGxQV0Z2bzQrMG9hZHJxWVg5SlBobUcvRUdjK3gyV2Vr?=
 =?utf-8?B?TUxSTnFVYXJmaFhtR1puTENGRm82QTBzT3ZweVBvdVA1SjNxN0VkQnpNYXNN?=
 =?utf-8?B?cGVhcEhoUUgwNjYzSCtFT1orb2I4OFNoWVpJVGoyQXhhUExnSUhwdnJKSEp0?=
 =?utf-8?B?ci9TNGFLUkt6blhNS2Y5bHlmbVpUMUZiVFN1S3FBc09QZi93TUlGdTFlbEs1?=
 =?utf-8?B?R3V2eU4wRi9OZFB1Sms0RXBialU3bi85Smp4RU1ZUEwyUlk4Y21LaXRFcW9R?=
 =?utf-8?B?aldmTjRFZzc0OFp5ZytMd3VGTjhlUFBlV3hrak5MT2xnQTNoTndqTzVNN2Ix?=
 =?utf-8?B?UnBFcHVXUHl3SGxuM2pDeFVQME8va09OV21yNXZVRFByMXVjQXZ6RFkxOENy?=
 =?utf-8?B?ZDdzWm1uNEpVSllGY2kxOE1TcHF6dkJIeWRNOE9aRXBhWG5uQkZRRFdVSUxy?=
 =?utf-8?B?dldyZjJoOWJubXl1ZjdOY25STFI0aTBRdlhsODJkZlpBOGFxNGZ1VEhQeG5v?=
 =?utf-8?B?UkRvOFZwc0xNcUFmY2thaGdKcEpNamtmVEthNDgxa3JWM1V2ZXJNbmEvUHE4?=
 =?utf-8?B?cWNCMnBRYkxlQnlpdEwwZ0NaMUpMdHRzVUQ2VGNxTTBOUTZDZWczdzExV0c3?=
 =?utf-8?B?eDZPdjY5Ulh1WkNQM0h6VzMydVJUTHJCb0FuSkZUR2phNm0zMmZocDV6VjM4?=
 =?utf-8?B?Rk9wU1J3RkxoUDFkdnVzTEI2ZG03b081dWlaZXJ2bUl3YnBTUlRUOXo5VXJx?=
 =?utf-8?B?OTNxWC9kazBIeDh5T3J0S281Rk9OVmgyY3Jvc2hXU0pINENJQUw1QWRyZXdo?=
 =?utf-8?B?bTgzQnR3dHBGSHNnQ0NMdXRyeHJDUUJZM3ZuQWtacDEzWnBlTHpmbWpLQkxu?=
 =?utf-8?B?c1ZJUjhXL1dLR0JSUXNNNGFrVWZlT1ZUT21jS3M1RHAwaGU4aGVYc3pOWXM5?=
 =?utf-8?B?NzFMdTZwaTZBWGZuY3piZXZ1ZDAvUnJaUUZ5dVdWQWlrK3ZJL1dPOWxqdm1o?=
 =?utf-8?B?NFZKcmpJTXZONTg2a1pISWJHdkNXTE9KVUpmcFF5V3o2UnF2KzVUdG9PSWNW?=
 =?utf-8?B?VXRQd056L2hrd2ZBUDN5TjJyYWFxNzJmV0M1a2VqKzNnd2c1b0FKdGJvdC9E?=
 =?utf-8?B?Smx1OHVEZHF4RURPR1RKcFdFbDRKaENta3VvNUI1TGVZTzVVbXVaQnRIeHdW?=
 =?utf-8?B?YkxqQlZLdTMwMnN5TGdNYW1YWHpHYW9SeEtPNEdrNlREd1ZFam1SWXQ5K1Nk?=
 =?utf-8?B?RUxHUDhNWjRnanB1Yy9qaGE1bEJzUDVKekV2U01CUVdQcUFDaUI4cGpPUnNU?=
 =?utf-8?B?bURYR1JocVMwNkZMNi9wR21jdFBBckNZcDhkRWlwN0w3eUNCcUJPalZ5WGU1?=
 =?utf-8?B?YkZhSGZ0L0t5Snd2ZWZNUlRpUFVYeVQwUkd0QXBRZnYyVEcwQ2lmcGNpTUk5?=
 =?utf-8?B?cDdYYmpXSm9lQzNWM1QzSTNLeDRLTG5zck9KUHlRa1JJbVpmQjlDZjdJWGhJ?=
 =?utf-8?B?MDJtK25IY2lFOEtNaFp3dEF5MTlBaWxlWWhCdlFjVk83T04zbXJNZVdnK3NF?=
 =?utf-8?B?VnNCaXRhL2orZGtKalJPTjJTL0h1TXJBY0dLdHBGRmRqUm5ObDZoR0xyQk12?=
 =?utf-8?B?WVdzRG5CM0dLdkxIY1ZUcTBHVnJqTHlOc1p3ditqT0h3WmJWVFJ3NXN6d3ZX?=
 =?utf-8?B?MkZaK3U1dnFqZDJkbndBZmxnUzBRbDd2MUlKRUVsUTBVWDlhV2pRcDVlN2k2?=
 =?utf-8?B?R3p3ak5EL2xGK3pQYkVpVTlhNjN3Z0srNXpQQT09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB8749.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020)(38070700021);
 DIR:OUT; SFP:1102; 
Content-Type: text/plain; charset="utf-8"
Content-ID: <0184C288264CDA40ABFDBB0D49149171@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7542
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 0041e281dcf34b45a71055d75310c35d:solidrun,
 office365_emails, sent, inline:d2f983e1515754cdab4444136324b4c0
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D12.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3f5e96a8-fa53-45fb-5184-08de161b8329
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|35042699022|36860700013|7416014|376014|14060799003|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZURKd1NUQmhpZkM0QTY3QUpxbnAvR3FyQ2FhbURxNmNpcDBKMVpsS3BzaU9l?=
 =?utf-8?B?N3lDbEFTWGVCVkl0ODcwZktaamYwb1FKT09qK1lRODh2ejlCU1czWElSQTZG?=
 =?utf-8?B?ZmdEaktTdkhwcGNZeVozYXhUQlBJeUxvOHBpSzY5eTliREI4d2FVKzQ1emxG?=
 =?utf-8?B?Unl2dmI5Q0srNTlETThJZk0vZTVnL25vZ2pBT3VRQ2t5c3lNK3dPck5ZOXRj?=
 =?utf-8?B?d3ZxNElwS25OdUkzZ1BabmlBQm9KU1dtQ2laaXI4aTNXb1UyQ0c1MHEvQ05o?=
 =?utf-8?B?c0hNY25pdG9mOExPLy9SbW5COXl5WjZoc25xWGFReE50N3lCVHAzd1Nhd0Zi?=
 =?utf-8?B?N1pJaWQzQzlsVWp1bmZQZHVYTmJSN3BlZlZYVkI3WWJXN0FFR1dweTMyUzd2?=
 =?utf-8?B?RzBLVzF1QU84VmxOWjNEUFlFQUl6eUZ3Y3l2d1dMV0NXbkp5ZnBnblBsU2hC?=
 =?utf-8?B?NlhwR2hlTU5WUFM1cE4zMFk2WWpnVm05bjBVcWRYcFJCbE5jL0RkNXBzS0I0?=
 =?utf-8?B?QmdNZkgyRjlEYVMyZmFQYmQvUU16SkVGVGFLYWQ0S2ZFUktmbHR2cTdSVmUw?=
 =?utf-8?B?aS8zUllWUTJvV1o0Y3hzaW9qdGdweEZqdi82NEhhZ2JaRVdic3N3ak8vY05i?=
 =?utf-8?B?TkxLbUovZmRYS1VkVUVGK3lrcjRJcUxHMlJzR0NaUjlOazJtbkpyQ2JNeWJj?=
 =?utf-8?B?bmhIZlBHZjJNaEEvRzZPOWFjcis1Q0l2eHlqamJGY0RtYVRjMW9xVFM3VXdM?=
 =?utf-8?B?YWdqNDRhOFVLWGFRWHorWkpRYmZRd0RtMjU2MitRa01TOVA3SWVpaXN5ZUVR?=
 =?utf-8?B?KytaOUo4WEg1U3ZxUGFRYTJMZjEySFN0RVhTYmNUTzVxYkNzTDdjMjQxUGVl?=
 =?utf-8?B?blVMK0YxQXdLeDROSU1RakRzSDdUcmltOHUyQmFUUXNkbDRZbTJPYnJ5Y1Bm?=
 =?utf-8?B?RVFPZ2lSejY0c0JBWXZEVnBWcEtTMGVibURDZWtqNi9sYWpZSWVZcXlxdlBV?=
 =?utf-8?B?Yys5SDdUZ0YzZ3owaVEzOUVUUHV0RU5OMEVkeDZ4RFgzcUg1dmVUbEIreFZw?=
 =?utf-8?B?cStWSm5xN29HSlVxMDM1T243UHBnclZzTzArZVk2dm4veVNUUjFuK0tIVFRH?=
 =?utf-8?B?TzN1SDBEK2E1NEJBWkFCb2xmMlB1Tk5GL0UyMWtmZDVBSEdiTzBGUUd3MEVk?=
 =?utf-8?B?N1R5bG5ha0lsNnBpeUxma21uTHVJUVd0cEp1aDNNZVBhOTV6Um9FYzc5MlZi?=
 =?utf-8?B?bmFUNVJmMzlIbXExdHlKRExIQ281Q3dmWVFhMmpBOEp6dnlzOHY1WjVHRmZP?=
 =?utf-8?B?cmt2VzVHbVhEY3FxZGJvK0pYNzJ1NWVEdk43STloVWVKeXBwM2Ixd0tReVU0?=
 =?utf-8?B?cW1WQ3hlTENtMHB0Z3JoZkp4UWEvcERlUW83aGVBL2ZwYi9jUG9LdEI4WW9R?=
 =?utf-8?B?d09xa0ZNNVZiTC9RU3ZPT1NiTUhuU0g3UnlhRGREM0JjSmlCdW4zUWQwWndD?=
 =?utf-8?B?UkVzbkk5Z2NUdU92TkV4NnZwbzhSWWZpeC9UZzFaU2ZXb2pNZTZSUWZwMkFq?=
 =?utf-8?B?cU5qQnVsaWRSZEdlVWs1eXBtQ2s5czBNeTBFeTh2QnlNNFRYS3p1SFg1dlVw?=
 =?utf-8?B?SE1xVEVCcFd2UnVtR1ZtWkMvMzlhN2dZd3dzWEVnK3U1Z2NLQUFaOERDUTd3?=
 =?utf-8?B?K2FMaW9ZUEoxWmJlWWxNQWNMQ2tSSXBNOC9CWVdIc0JuRUNDTDhUN2h4ZFNz?=
 =?utf-8?B?bGVoVC9GQmhZeWlZZnNLMUtrK3pZR1BaaWJkL1hmalVGVFZxZWJRNWErZm9x?=
 =?utf-8?B?T2p6SW5MM1VoSnY0MEQ0QVVXaXM0SmMvdWFtMStHYnY1ZGU3R1ArakVjcTMx?=
 =?utf-8?B?ZkJhWStHdkViNVlBK1VLMElnc1Z3UzNkOVBTZm42WTVwN1B6YVBuZVdtODJo?=
 =?utf-8?B?S3FBVUlzYUVJR3R6cktnWGNVc3JzMlZsUTAwbThWTThhRjFFcndPMk41Q1d1?=
 =?utf-8?B?dEdhUEw1VTVvYi9wL0J6bW1nNWVMdVA1RVZGY2hCY0hiU0Y4WE5SQzBxWHFv?=
 =?utf-8?B?NzQ3THlQWGFxSkdPdzhreUNSYzJHZGZMbjM0cFFRakR1dEM1SzhKMG5zbnNq?=
 =?utf-8?Q?P+YF2nEv94oaFpWm3EnqFN7gU?=
X-Forefront-Antispam-Report: CIP:52.17.62.50; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:eu-dlp.cloud-sec-av.com; PTR:eu-dlp.cloud-sec-av.com;
 CAT:NONE;
 SFS:(13230040)(82310400026)(35042699022)(36860700013)(7416014)(376014)(14060799003)(1800799024)(921020);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 12:14:28.3591 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed6ae3fd-a40a-4632-1f39-08de161b8af1
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82; Ip=[52.17.62.50];
 Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D12.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7305
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

QW0gMjcuMTAuMjUgdW0gMTg6NDggc2NocmllYiBKb3N1YSBNYXllcjoNCj4gaW14OG1wLmR0c2kg
aW5jbHVkZXMgYSBkZWZhdWx0IHBvcnRAMSBub2RlIHdpdGggYW5kIGVtcHR5IHBsYWNlaG9sZGVy
DQpzL2FuZC9hbg0KPiBlbmRwb2ludCBpbnRlbmRlZCBmb3IgbGlua2luZyB0byBhIGRzaSBicmlk
Z2Ugb3IgcGFuZWwuDQo+IEh1bW1pbmdCb2FyZCBQdWxzZSBtaW5pLWhkbWkgZHRzaSBhZGRlZCBh
bmQgbGlua2VkIGhkbWkgYnJvZGdlIHRvIHlldA0KPiBhbm90aGVyIGVuZHBvaW50Lg0KPg0KPiBU
aGlzIGR1cGxpY2F0ZSBlbmRwb2ludCBjYW4gY2F1c2UgZHNpX2F0dGFjaCB0byBmYWlsLg0KPg0K
PiBSZW1vdmUgdGhlIGR1cGxpY2F0ZSBub2RlIGFuZCBsaW5rIHRvIHRoZSBvbmUgZGVmaW5lZCBp
biBzb2MgZHRzaS4NCj4gRnVydGhlciByZW1vdmUgdGhlIHVubmVjZXNzYXJ5IGF0dGFjaC1icmlk
Z2UgcHJvcGVydHkuDQo+DQo+IEZpeGVzOiAyYTIyMmFhMmJlZTkgKCJhcm02NDogZHRzOiBhZGQg
ZGVzY3JpcHRpb24gZm9yIHNvbGlkcnVuIGlteDhtcCBodW1taW5nYm9hcmQgdmFyaWFudHMiKQ0K
PiBTaWduZWQtb2ZmLWJ5IEpvc3VhIE1heWVyIDxqb3N1YUBzb2xpZC1ydW4uY29tPg0KPiAtLS0N
Cj4gIC4uLi9kdHMvZnJlZXNjYWxlL2lteDhtcC1odW1taW5nYm9hcmQtcHVsc2UtbWluaS1oZG1p
LmR0c2kgICAgfCAxMSArKysrLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgNyBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9k
dHMvZnJlZXNjYWxlL2lteDhtcC1odW1taW5nYm9hcmQtcHVsc2UtbWluaS1oZG1pLmR0c2kgYi9h
cmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bXAtaHVtbWluZ2JvYXJkLXB1bHNlLW1p
bmktaGRtaS5kdHNpDQo+IGluZGV4IDQ2OTE2ZGRjMDUzMzUuLjBlNWY0NjA3YzdjMWIgMTAwNjQ0
DQo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtcC1odW1taW5nYm9h
cmQtcHVsc2UtbWluaS1oZG1pLmR0c2kNCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVl
c2NhbGUvaW14OG1wLWh1bW1pbmdib2FyZC1wdWxzZS1taW5pLWhkbWkuZHRzaQ0KPiBAQCAtNDEs
NyArNDEsNyBAQCBwb3J0QDAgew0KPiAgCQkJCXJlZyA9IDwwPjsNCj4gIA0KPiAgCQkJCWFkdjc1
MzVfZnJvbV9kc2ltOiBlbmRwb2ludCB7DQo+IC0JCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmZHNp
bV90b19hZHY3NTM1PjsNCj4gKwkJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZtaXBpX2RzaV9vdXQ+
Ow0KPiAgCQkJCX07DQo+ICAJCQl9Ow0KPiAgDQo+IEBAIC03MSwxMSArNzEsOCBAQCAmbGNkaWYx
IHsNCj4gICZtaXBpX2RzaSB7DQo+ICAJc2Ftc3VuZyxlc2MtY2xvY2stZnJlcXVlbmN5ID0gPDEw
MDAwMDAwPjsNCj4gIAlzdGF0dXMgPSAib2theSI7DQo+ICt9Ow0KPiAgDQo+IC0JcG9ydEAxIHsN
Cj4gLQkJZHNpbV90b19hZHY3NTM1OiBlbmRwb2ludCB7DQo+IC0JCQlyZW1vdGUtZW5kcG9pbnQg
PSA8JmFkdjc1MzVfZnJvbV9kc2ltPjsNCj4gLQkJCWF0dGFjaC1icmlkZ2U7DQo+IC0JCX07DQo+
IC0JfTsNCj4gKyZtaXBpX2RzaV9vdXQgew0KPiArCXJlbW90ZS1lbmRwb2ludCA9IDwmYWR2NzUz
NV9mcm9tX2RzaW0+Ow0KPiAgfTsNCj4NCg==

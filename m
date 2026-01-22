Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKkMHabncWkONAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 10:02:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE7C63B6B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 10:02:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D62510E95F;
	Thu, 22 Jan 2026 09:02:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lFLJZ2zR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013055.outbound.protection.outlook.com [52.101.72.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF8F10E961
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 09:02:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ME78lnyEI2bsw2nRC9xGcsN7pngiAeZw1kx/mN6mMtV3O5shbRzg81acv1txc2S8p2zmvR4PM+X8VeWq7OlCNYrd171MYksLp6xc3ZjXQ2T6Wk9e0bUZfdw/Nwzsvlk+YQxpZHKDFvvUe8tkdxD+p15tR04WVzy9RNuO3vLPfw8AfjdmLB26z8haa953qJpJFz+ssvqdbNAnh6pgp6oYCaMUY6zB2Gv7T7Y8qdr+ozneLymrE+ASXou49oDnZKaKTYx1QHeGPZwC/0YDma2HJS2SlSa3mw2UTLXdaO0Thj7XYL/OeMPbhZRGS6daee8r6UkSGJ3u8CxWsLv5n81iCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cyS8TUuX4MXVHmKaskfushTwe63n+GwlrTcTftS+bSA=;
 b=YKkvmWuQibVdRgCW8TB/09e11d7EJmsWySLRCP7RIZJOmtLoBIiSowHAZZcg4tDYGhNEsog20ccnbOdg+6oWg3ozxLzGe0rOWq6AeJZ3ncIjOiV1yN/Dv+im4dy2i1L01f5Ycrd1SEW6AMKPSycjf3XoUoGmyAX6Hb2lTvdBlq9wsdioqfVTVaJT+NaAIHBuTG1HxUTDV12yQul3BSeMhE5YLod2r2RuAlCTYdh2EwK7SgMuLJT+yPZnNKlEjcIHGtoz37PVrYQKYV/LsiJtu+uBOeiWXeW2fyHKrbLb/bEDJ/eHfUtUFkePzUO2I/D/u+ByYQq6zhfrAVN2Qrd/tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cyS8TUuX4MXVHmKaskfushTwe63n+GwlrTcTftS+bSA=;
 b=lFLJZ2zROjxqd+1iSaBc/DvjHuqvhhg6lHYyHZSJFZweU5MRvMGZ5GWVglEriNXDgam2kpPp4wmtpYowqJC6obtvCLLG8o6Mpbz8W3+WbnAa7RWUHP1G+xTdRAYdPw1TxKAMdYmVmcPmVFI047OQvjZtsJB4yG6+TnK4ksboxmBiMqQlnVsC2yvqk1K/SPUoB6NynfHtqstvxe5iJBcCe1Wd3LVZccZB8E7hYCE8KNPXLYKO7R+/DMeIu71m7b0xfsFJkRd2QoICyk1YNzrNDd7WcsCxDULGOUjetb22dzFk71JlBis304Xh3v+2p5MyNwlf7xzhWMsZhjXT1DA1JA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by AS8PR04MB7751.eurprd04.prod.outlook.com (2603:10a6:20b:2a2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 09:02:22 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2%5]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 09:02:22 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, Frank Li <Frank.Li@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/9] dt-bindings: display: fsl,ldb: Add i.MX94 LDB
Date: Thu, 22 Jan 2026 09:01:39 +0000
Message-ID: <20260122-dcif-upstreaming-v7-1-19ea17eb046f@oss.nxp.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260122-dcif-upstreaming-v7-0-19ea17eb046f@oss.nxp.com>
References: <20260122-dcif-upstreaming-v7-0-19ea17eb046f@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM9P195CA0022.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::27) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|AS8PR04MB7751:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a031b52-68ab-4842-97df-08de5994f484
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|19092799006|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?REF2UXphUjFhS0lHZXprWVJMRlY0VEVaOUhlV3laTjg5NklQelYyZXByV0Rk?=
 =?utf-8?B?OE1LeUNySG8yVDZZWkJ6OS9mV0hzcG5iOWtERC9kS1pnN2dNRDFGb1c2NElN?=
 =?utf-8?B?RklwcDZJSVRDRWEzeW9FZE1sQzhyZU1kaHVQTXllRWdQeE9zTmdvRUZRTDVp?=
 =?utf-8?B?Z1JKK0ttaGthQW43ZXpjbDMxSVA3V1dXSHlhRTdHN0JpV2s2L0M2clhCLzVw?=
 =?utf-8?B?VTBtaERqOXQ2Ly9TbFRqKzlPbnhPMWtDS01sZFFTQXhRRmYvSFNPc2ZYcnRV?=
 =?utf-8?B?THUxOXJGMTQvZ1FFMm5EOHo3UnQxZ05rSUpLQlZWd0h3R3U5TXFFUE5KMWc0?=
 =?utf-8?B?WC9OZkN6dVlWWHJjbTYwK3ZhRzNKaEdGZWJ2WEl5cUVkTTQxUnhYQ1BQOFVi?=
 =?utf-8?B?d0V1Y29hUDJJdnAyOThrbEg0b1kwWTB2dmNhODFwS21RN0hNYk4zVUN2cmtI?=
 =?utf-8?B?cFh6TGpwaFdISEdlNFludXNyMlFSOTVwaDFzTXp5V2QvblYyWEpCbnYwSnhD?=
 =?utf-8?B?SWxyVEkzNFFWMVY0YTlVTVpNTnVmYUJIeVRISzVLay9TTmFGZ0Nvb2M4WDRy?=
 =?utf-8?B?MThmdHN4QVdMNDE0Qm5Lcnc3L3VwT3VxTFJTSVdXZWlRT3JTWE1qQmRUZGFv?=
 =?utf-8?B?M1BWSFErUU9CTXVIeHZhZGsxakdRWG5iME9HQTJhVlp0c2VNcXdoRUoxR0FD?=
 =?utf-8?B?alRZa1NOZldQRkw1MEMrNlNIWHg3bWhkU3ZQM0U1enp0L0dHbkFJRmtVRjhy?=
 =?utf-8?B?ZGxOVE9qK2ZaUEVuZVd5RTl2T2lydC9IQ0luNDFyWFJJUGpBbUpFL1VyTEpo?=
 =?utf-8?B?WFNmKzJmUXdUUkx5ZURvYzF1T0JNMS9MR2N6b2xLV0YxUlc5eW84dndVRkV4?=
 =?utf-8?B?K3hmRXhOR3RHUmhCUTQ2VS9XSmZkNmdTNFdERWIvYUQzQjl4VzZqOFFndTl4?=
 =?utf-8?B?UUljZjZYUUlLb3R4SWRMMGVZVGRWSkpmL205UWRTOTI4c09oaXRzQjVrM0JE?=
 =?utf-8?B?T1VLMDV4WHJybE9JTDNZVE13Q1ZzWXBRVE8wcXMrSjV6Yy9INFRJUzBST0xN?=
 =?utf-8?B?QmdzdHZYK203ZG80YytTZmx2MndxRmlJQXJTcFNoS2tFRnFOUTR6MXRKNjdy?=
 =?utf-8?B?KzdxOHBXSVpTRW1vM1ErLzJEc011QURDQlNTcEE2c2s4MXZuUkljQUV5ODU0?=
 =?utf-8?B?SFZMeFFQOS94YlFON25Nb0pLYmpDemNjMjUxdHE4dGdWaExjdjN5cDhSQTQ4?=
 =?utf-8?B?czRaS3JxcFFVSVFJWFBqRkVaS0luNGFEU0Q5OFAwWDBibXloZ292dStzeklX?=
 =?utf-8?B?cmVMQ2s2L3RnOTc2YjhrU2Y4SGVTRER0WklYbStESlhGT3hXdEFJNTZyWDdQ?=
 =?utf-8?B?Z1U3WnlFQ250ZVJrUVZYSXNaTWRSTUVBWEhEZGRSUWJKNVdydnVNQy8xK1Az?=
 =?utf-8?B?V01oeVkydlhKb1JlSE5hbHkrK29qbzJkWmFEVkMrdUV3Q1IyNGJkM1dncWYx?=
 =?utf-8?B?OUdBVVZEZTBlaklIOVdCeTlCTjJZNGV0dkljcm9WWVhyYzdIVDFOWjJoYjg0?=
 =?utf-8?B?UGp0OFdaTk9WMGdiV1M4cTlEOEpjclZ6dEExMEh0bzNrWnM0M1RQRVREcmpS?=
 =?utf-8?B?VzdjdnBIUTRzK2ZpbzhGS2d2Uks1Yjc3Qis5SUY0cTBMUW1qL0JucmIxRmp3?=
 =?utf-8?B?YVI1ZWpkK1NNbFd2YjVtanY2Z2UwOWxuQ0hyMS80aS9lbVg5MStSTVR0OSs1?=
 =?utf-8?B?ZzRsbUdhMURKZWlJdUpXTVN6OHN0VkJSbGl0c2JHUFR6ZTZGUGtFbytnaUVy?=
 =?utf-8?B?V1BYVVkydTFQS0tRbWJZbHROSVJ6Z0Rvb0dNc0tmRFEvV3hlNW9DbHpJck9X?=
 =?utf-8?B?akVSTktEYmk2MjlyY2grN2MzNDVmejNKeE9wOWVIV2dPeVNXaHRFM0NJUm1P?=
 =?utf-8?B?bEZXczN1cGVnY3QzQmM1akFzdzVLUUJ3aHFndWF0TVlKRGQ3d1ora09lWWNr?=
 =?utf-8?B?RVhLTkpVQkdyL0Y4S2w0Ulh3cUxVSzAzaXJtVDFSSFFjTklXUEhWc1liQWda?=
 =?utf-8?B?WlQ4ajROd2hIVDl0LzNWeXYwN21xY25PZFhkR1JNNHY0c3IvM1hUbUMyT0Mx?=
 =?utf-8?B?QStCQ0tQQkExeWV1M3lualJJakVZa3FtN0NTR3piNkFoejNLU1FZL0VWcEVW?=
 =?utf-8?B?ZEE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR04MB9135.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3M2ZlpuNlcyY0QyYjdNcU5hS1o1QU44NXZsWm1ybVVIV05ya3Vab2t3REZQ?=
 =?utf-8?B?Y0dlOWFKMG9hMXZ0YytPUXg2Rm5Dc3NoVFU0NlV1alBwcjFETy83cStET0Fs?=
 =?utf-8?B?OVdFRkNyNzVUSitiZDRkbEgwcHJ3aDliaWdjWlcvRDZvTER6RmVKdU45bEdP?=
 =?utf-8?B?RnR0cDM0VWh1VW5BdDBDQTk0OTZoVGxrUFV4ODB0ZVFDZXBmaFk0T0o4VzR4?=
 =?utf-8?B?ODNXOE55QitDbDNXejZDWUp3czN5QkNLMms2VmhIYXo2Wko0bGRhWTgvN3Rh?=
 =?utf-8?B?Q0tsNjVFSE9BakNZT0dJZTJLbzBKNlp4TWJZRFJCZVhjREdqWWpxV0JycVFH?=
 =?utf-8?B?dFRzZGV3TEcwaUZWclRwWi82QlR4TWYxbk1oeDRPQjBJNUsrNVpzc2VpREla?=
 =?utf-8?B?NCtzU0V1ZTRONVZOUmVRZWhRYmo3SjlmK3dtU21RbmVEaUl4V05DQlpRSW9J?=
 =?utf-8?B?RGZhN3dFK3Q3NEhpRXY0ZW5ZV1kya2VIK0lvKzlMaEozc3pJa09kc0MxVDRK?=
 =?utf-8?B?bzBWcHdvanpOa2x0M01mNEpRQlRGR3NPNS9rQUM2UWZzWis4UGh5WWdUMkcz?=
 =?utf-8?B?WHdiSTA0aU1VS1ZtN1oreXR5Rkx4aUo5blREaHZaNzZHY2g1eE1xc00ybVgy?=
 =?utf-8?B?NHB1VkNveHhabTBweXNNMnViU2djTDFtTDVBaWRyckhJK0N3dm1Yc1Q5NXJ5?=
 =?utf-8?B?dmZTRUhWTitXUEhaVFByREZobnNTZ2ZVZXZWY0NWcmlMZFFJQkZ2bGJPWHJR?=
 =?utf-8?B?ZG1LMVhzVVBXeENmZ1E4ZlVmRkpWcVpDakhCWjNkSEl5dmZYMVh6RmhQNnNi?=
 =?utf-8?B?R1Z6dU5BNVdIRjZROGgxSXVxb1MzdFh0QUtYMzRlZHM4ME9TNGFDZXNDSmpj?=
 =?utf-8?B?RUJuZE9qcDV6a0t0UFl0SEtidlFwZmppa0syeXlPOG9kQzZuZTk5WG9LN0pn?=
 =?utf-8?B?Q010YXVYNDJzQ1BkTFBUamQvVTdheDVmNGkycVBrblg2VFJCQlo1V0p1RVMx?=
 =?utf-8?B?Rk90M2QzZVpGcnJnSU5Ja2NqTlJkSjMxWU5pZkNiTVBUK001V2NVUGJTMFZI?=
 =?utf-8?B?bHZ5TnpBS2ppYXJ4TXVnL3U0U0QrVUlIU0lMMS9pdUp1aVRMMjVIRERiL1VT?=
 =?utf-8?B?aGR0WDl0b0tmYjdsaEZSREc2VklxM0tVSld5UHIzajdrQk5TVHY4QWlpRmZw?=
 =?utf-8?B?U0JhZjFRK0RLZGVFdlpKVGRqOUVEa00vd1FrVXZoV0lwOEVmc21IOThJYzRk?=
 =?utf-8?B?TjNIK2dTMC9OOHExRE1QVnlBMnFlbkY1eDdQSmJoaSs5ME1HZWgxY3BjanJV?=
 =?utf-8?B?VC9mYmsrb2k3MTFVd3VLOFFxdkN1UGc5S1ZtaGJJM3R2UGNjOEcvS0NvLy90?=
 =?utf-8?B?RDl2Sm01S3BURFlIWTE3eVFPTjZJazhpOFpiV1BIU0Q2MW8xTVp6ZkcxTEpL?=
 =?utf-8?B?d082VHpNTTI0OStLZGtVdlo2cTRIZTk1U0loRElibkRHWjJPa2lGRzdkSUxu?=
 =?utf-8?B?VlV3andEQVIrK1dQdTNvVjB1QnNod3Nucy9vcTZUVjRROVNaN0E3dm9Xdjl4?=
 =?utf-8?B?bTNCVGt5Y2NTcktwVUZrUFlGSEIwNXM0czBlUittMEp5TzB3S01oWlVkWW1n?=
 =?utf-8?B?b1ovVmNKYXlwdStYZU9MREdUTW81UGwrOVBicnB1UVd5UEVQMHdZR1JRckgr?=
 =?utf-8?B?WTFEcGJXaHpZUDBObWV0TFRQRnR5YWk0TEc4MTM5NmNLbElwVU5LRnYwVEEx?=
 =?utf-8?B?cmpQd3cxbkErZ2VEYWxnVnBya3JUeFFmbVVydEVnZU4xdERwVkI0SC85RWkz?=
 =?utf-8?B?eUVLelJsc25HVU5iS01QbFE3NDFoUGQ5cGlLdkU1bjJuV2hibkVUK1FKNUhr?=
 =?utf-8?B?WFdsQkZUKzdJNFN6MERFYnRnbE5ubWw1THVJMHRWcGlIUjRCRDZ3RTVvcDhl?=
 =?utf-8?B?VDZsMGpSU01CaDNRQ3ZCb1U4MlhHWHNBblNxVitGaXhweXhvNzVuelhYMVFX?=
 =?utf-8?B?Rm1zQVB0N1Q0czY4K0FVejZuSmJudXdnQTZZUlFhbTlaOFR0eVR6eHd0SXRC?=
 =?utf-8?B?dTFackhCNm5xcE1TaE9KcFp1OFBFTitTa3VXaVdmOTBQZm5aMkh1VTVaeHZL?=
 =?utf-8?B?azRLanRiWDU5WjUrQlp3THBRaEp5VUs2QlM3b0NaVTBncnI5emh3TTdvUkRR?=
 =?utf-8?B?SEY4MDZ6dkJaZXdDbDJZVlA2b1BBcElaRGV2Z1FiMDR2bFJJc1ZRZDc4ZE13?=
 =?utf-8?B?bHRxVkxQZjNDQTh1b1NGR281OFphRGwrcWpVTzJabjhrRnBjclVTWllpdHpS?=
 =?utf-8?B?eE14Ymh6VXlBbXR3VmpYSjlWRDloTlR3TzUwVnhaMndDNzdYMGMxMXlaRi9S?=
 =?utf-8?Q?rCFQtMGuY/s+ZVgY=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a031b52-68ab-4842-97df-08de5994f484
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 09:02:22.7444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 56yNL0QOx9lV7aSZwRPJ+J882kuSfza45NFFGNB8tQWK+Guh2TTIkysSK297RyUlCryeDW0EqixJU1tXPCDwuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7751
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:imx@lists.linux.dev,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:marex@denx.de,m:Frank.Li@nxp.com,m:laurentiu.palcu@oss.nxp.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[laurentiu.palcu@oss.nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_TO(0.00)[lists.linux.dev,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,denx.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurentiu.palcu@oss.nxp.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid,NXP1.onmicrosoft.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linaro.org:email,nxp.com:email]
X-Rspamd-Queue-Id: CCE7C63B6B
X-Rspamd-Action: no action

i.MX94 has a single LVDS port and share similar LDB and LVDS control
registers as i.MX8MP and i.MX93.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
index 49664101a3537365c35a1ad76d540cc98cc480f7..4caab63e351b00e6f681ffb5b0813f870bf9d582 100644
--- a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
@@ -20,6 +20,7 @@ properties:
       - fsl,imx6sx-ldb
       - fsl,imx8mp-ldb
       - fsl,imx93-ldb
+      - fsl,imx94-ldb
 
   clocks:
     maxItems: 1
@@ -69,6 +70,7 @@ allOf:
             enum:
               - fsl,imx6sx-ldb
               - fsl,imx93-ldb
+              - fsl,imx94-ldb
     then:
       properties:
         ports:

-- 
2.49.0

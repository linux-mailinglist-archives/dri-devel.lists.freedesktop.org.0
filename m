Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDhKMrLncWkONAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 10:02:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1C56423A
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 10:02:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9570D10E961;
	Thu, 22 Jan 2026 09:02:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Pr662uM3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010033.outbound.protection.outlook.com [52.101.69.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F6A10E964
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 09:02:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l4hertIKbEUvIcTKnyc+tqprxfnPccRtLSgL6D8KBnI2OjPAELQorw+IYaDzE7rOPKQ8vHAY0TJDQvzLhRGLFMMqqX+8fn8dWjuSTb4cyKxFzBAXMYTG+1SXKWzFoVaPk54rTn5wR58eVhPO7JjWH5Zo3S/LLuHp+hW7oCMa+y/7s7j4bBlUxJK4ZTgY7yWUgg6cJEAblnGEIOSP4kUDD3BT1PDYqC6/PSOy5Rdm2Mecl2xihfvz6BCVDYQr1ZYWvicWlPRlYOGRFK81O3r9liqGk6UjmN2y0XW4SVM9fIIDD9l8B2KSmDBQvEVzvKFn5Qvc3G+eoWXvb007TUkL0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xGiUlQY6dmIjKILe1KV7IC9eh3m39BVSpZ9cBG/0IlE=;
 b=GMNuCAFb4VNk1gwsyyZZJ7rDmKCfRkClOdbqjz3Q84/AfcvNOnW3aMVc1aRl11xnJsHPd1lLfovhc3yyVems3V+wLMzDidkaEpc5pkKmqKmknJxnSAru2olWwh5V+GdX2G5Tth6PNJ+9nlsPOBvtuI1NYoq3AiosOawmLJ+HVbnl4Y9OrI9EYUjYj9kyIm7FfsTqKNk60M/TQwJuGRqElY0gWs4lNxRTXHV1R8fIIiAbE+Iwr6Jv1Mg0RZ8dADqNMLMAYvn4wvVLgEib4l7UE4BfRW+5E5kbN6cAnZe1dO3WP6U08MkZB/I+suTtVUm8hvr7e0DXesyd84rXNx8Wxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xGiUlQY6dmIjKILe1KV7IC9eh3m39BVSpZ9cBG/0IlE=;
 b=Pr662uM33rzGK6tbtYRqsOvWY0sgpOR75UXl73isdTWeTyotDDksVUQs+1hcdL3FgYcR/2suS048bK6JgvwZw1fQxyUcf/9Cb9Y/e8puy50creQUwCSi74ljG/G3xBOqNanU8jstkNUtBesMUf6IcdLBYabA8/dOYFrZNnGt5qZdS/9fDC/ryvMppij+yLhHkvS6UDFpiSNvy+B+mmEKc2hvmZnz3P+ql73daJqaRSXJLu6y220HOf4ffTYwc+Ffm7TwAiEHgwi+t7S92HKxm+y/6ImHxTv6ECe5lEB2tLBBBACAvdaDFmYce7aoiHdQY9jKxZV2ZY4tMQPyE3f9cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by PA4PR04MB7872.eurprd04.prod.outlook.com (2603:10a6:102:ce::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 22 Jan
 2026 09:02:31 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2%5]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 09:02:30 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Frank Li <Frank.Li@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 4/9] dt-bindings: display: imx: Add i.MX94 DCIF
Date: Thu, 22 Jan 2026 09:01:42 +0000
Message-ID: <20260122-dcif-upstreaming-v7-4-19ea17eb046f@oss.nxp.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260122-dcif-upstreaming-v7-0-19ea17eb046f@oss.nxp.com>
References: <20260122-dcif-upstreaming-v7-0-19ea17eb046f@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P189CA0041.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::15) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|PA4PR04MB7872:EE_
X-MS-Office365-Filtering-Correlation-Id: 86e40b03-d8bb-4032-eb9c-08de5994f94f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|19092799006|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?enpNMVRqa0lIUEpobkFUOSs1RnFINUNkS1BPWjJJVFlRZHpXOXAwZVFIb3FP?=
 =?utf-8?B?VkNqV0RMRkw2dkM3V3hyWXR3QWpzSmFpUDU1ZlNXMXg3SVNadS90Z2ovaWVh?=
 =?utf-8?B?MkRnRlRzZHVCQ2poR2ZWaGFTSERhVk1DNHNsbTVreGhBSUducm1wMXhRNUky?=
 =?utf-8?B?MXQzL3RTc0JDY3FuOVNtdkhNTWtraldRakZMbWtmYVdac2IvMk1BVU1RdDRu?=
 =?utf-8?B?OVZxNWFXeGFmcXZReFQ4VkR2dUtycjZBV3JydnZJSTBKMjY4K1pxSXB4SitM?=
 =?utf-8?B?VFdxMUlPd3NyaFI5RHBmdloxMHFHZXRTRFJKM3ZZd2xXa1pFS1dXM3ZJUkox?=
 =?utf-8?B?VVRvcG12QXoxNmJTdVlRblNXU2t5UTR4UXdIblN3TGcwWUdLTDZWNjVxUW5J?=
 =?utf-8?B?Wk1HRXFpZXI0R1ZqNkNsdVY5RWtoTW41VjlTeWYzamE3OVJjL3RDTGRYZnE5?=
 =?utf-8?B?emQ2OXd4ZWo4MkF5ZHNtYUpZZ3JKTUEwYnZkaUhpOHBwa29KcTZkUUFWcFkw?=
 =?utf-8?B?c2VrejJ5VGM4NmV4TGswOUV1ZkdoT3lWUnRENTNTTzNpM0FEWVZWN0gwZWhv?=
 =?utf-8?B?UzkxNWxlL2VHTEdiWmxnSy9RQmNwTVFEdEQ1MFhtQ0tuejVyQk1hV0grSGho?=
 =?utf-8?B?UzJ2S28wRWRYTWRuNkZadEh1a2xoMUNsczlIOHV4bnBMTjNQNmdZRUs0LzNz?=
 =?utf-8?B?b2Jzd0NIZzJRQ1JYVlVvd1ltTG1JRTJDRUhlNXphM3kveEVISWpuYW42ajdJ?=
 =?utf-8?B?U2JjWllnNWhNa0IvaG9ITGVYRjlxTDhqdHkzaTd1KzA1eTB1ZHhkckpteHdz?=
 =?utf-8?B?YXhISUhDR1dvSExsejMzK2d0QmpFaExPL2NPb3VrWWZLczFvQUxwODE2cnZa?=
 =?utf-8?B?dWJjUVZVQ1RUdExOOUhodnliWWdHSXg5UDBNUUhNZEUvT0FXZW9YN1JCK25I?=
 =?utf-8?B?cUw0QytleG5JdFBSM0MyY3JMaGxhdEp1RTArTUtUUE91dk9DbmVqMTR0YlVM?=
 =?utf-8?B?amlyMzBqUUpPRzNISXBWMGZPOVVnRG82Z3FaYnFYUndhaFZrVC9uS0hKdXVT?=
 =?utf-8?B?emFQT0ZNdGtNZE9QOWNBaHgzQXRyNWxSNnV0ZEFhczNOaUlLbVh6YStPeDBI?=
 =?utf-8?B?aEJkQzVwRENMTEIzVGFFOW9SRDEvMUZ6Sy9hMWgvM1NXZWVxZVZCbFA3ZFFD?=
 =?utf-8?B?SEpBV3dWV3NGMmx4QXFKbkhnbXRPb3ZmRjl6b1NURjhNYXZkWmk1S3R4MmJo?=
 =?utf-8?B?R3A0UW9mNGpUcWJoUUtTWW1sdUtFaDhPTVJpRTE3TDBKblBVb3oyd3RhWFBB?=
 =?utf-8?B?dVFCUDdUakxpMVU3VFFwYTlkKzZYd1lQZW5kSi9JYTBESmlRR1o1ZUZrei9Y?=
 =?utf-8?B?Q2ZkTGVzQnRIUVZpVnVjODY2bXFqZUxJTU9MTko3OFQ0TzZhNlhwTXlSU3B5?=
 =?utf-8?B?b2VTZVlobGRlS3FxM3MrNFZMVnVFOGZ3RS83MWRZMFMwempaQ3RnTExYZ2tr?=
 =?utf-8?B?MEE0VnRzR2trOTZRWFRlUXFFeXdpQmlUU0d5MkpFclJjWjZKalNITmRRYTI2?=
 =?utf-8?B?dkZUVlNiVmQ5cnV3R085eWhORkZ2RzJidVU3ajZMTlhhUWtCd0ppTC92MHR4?=
 =?utf-8?B?NmlPM3JqSVdrVndzcnl3eUhFNnY5M3V2NGJscHR2UFhtajlTZzBoRVlNSXZu?=
 =?utf-8?B?MkZpQjhNR3FGdEZnY2dQNnlPRnBweTNwWXFVRzhTYWJuL0d5a2VuMFJUNWpo?=
 =?utf-8?B?NFdCQ09STHlrQk0yVjVqM1VuZHBicThpN01vaXhOOXhPQi85RWZkOWRyZFRF?=
 =?utf-8?B?T0dFZUJNbElWMW40S2dZRm1Faks5SW8yUDMweWNZODEralMyelc1Y2JMZ21U?=
 =?utf-8?B?SFNzKzNxdERLQ1hwL0h4RlZRSWNoVFc3VnRVU2JvK0t3VXNVajFTcVNxYlpR?=
 =?utf-8?B?VGdJKzNLREwwUDFrRHd0VUZLTjJweFBlMEkrc3Q0cW00dFNVOENkQ0g4dVhJ?=
 =?utf-8?B?NkJXV1duNitaamt1ZTFnb05ib2lpQlIwS3lZVS9TdWhZclFFNDRobHQyMnIr?=
 =?utf-8?B?ZEtmdHF5dEFFdDZaSXZLWXhGd3J0WGJpbVZsdStHYmhjeGdLbHRlY1ZNZlJr?=
 =?utf-8?Q?qzEM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR04MB9135.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(19092799006)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGhHbzJiN1pIc3BWQlZPWnpsQzdwTmRPd1Z3RUI2akwyTnF5dTYveCt4Uzhp?=
 =?utf-8?B?NjJ2ejlnek9IcUtzSDg4eTFIYmRjaFRrYTRKQXc5TXdqWmhCUVhDOVJZK3Bt?=
 =?utf-8?B?WEloaDc4SS9Xc1NFLzBPNVM5S0xuTVIwMjNkR2ltVEsyUk85RGhWNURZM3lz?=
 =?utf-8?B?QnAvM0l5cElXUm1SRGpQaXYrQ2VHQlZwN2JEcURzalhRcVdYeUg5YW90MmJ0?=
 =?utf-8?B?dlpPWm9qRVNCZFBlUXcxb2VHTU5GOU43bjBBZVZHZzluOWNJMXE3OXJOOFg0?=
 =?utf-8?B?eXcyZ1FoRG5oSkxqVC9sdE02TURCTC9hR1Q1SUkvRXU3cHVlaVVKVkZrR0lh?=
 =?utf-8?B?OWcvbDJTUGJVY2dacWNsSkdXdWxhanhHNjZKN2NIaWo0VjZQVlNOY01DWUxz?=
 =?utf-8?B?dzNzeGMzSy9zTUNGVGNNM3F0TlpFMGh6Yml5YVFQTHV0bkZXWnVmTmtEOXd5?=
 =?utf-8?B?OFBoRXFWUnRHRXlURjZDVWRsZEtEZmRocEo4SXc3MktlM2RJdFFGNmRGVk1a?=
 =?utf-8?B?Z1BSVTAzcEhQZXYwR0JEZGE2NWJWN3JLQ0FuOHRYWDZTbUwxNDgvMkYrMi8r?=
 =?utf-8?B?Uyt4UEpieWYzQTR4eEtIRUFsMFdhVWNhaFdFNFdLQVBpSFJKZ200Z1lNZWFG?=
 =?utf-8?B?QUNyUXJBSGhLbENqZUJlS1BsL2JwVzV4MWt3TzNYbTc2bDV5bzVCNldGd3hE?=
 =?utf-8?B?Q2g1VHg4RzZsbk03eEJmR3BWZTNjZ29JdTBnUHdSQm9wZ3NiUFBNeEVDdjNa?=
 =?utf-8?B?RFJ3UzdXcTQ5a1V4dUt0VWFmTkRKdERtcGVwYUFSMWxHMEhJTWd0aHliaE9Q?=
 =?utf-8?B?MEtmV3dwMnNlUHVQSko1TFZ4U01TZkVwZjNKLzNoSG0vSkdYeENlRmpQMlg2?=
 =?utf-8?B?QVJ4dGZGTms1R3VETElwV25TSGlDOTF0T1QxRDRjd290ZFJmK3pxZkx3NFZk?=
 =?utf-8?B?aXJLNmd1RUxWdEtSNTV6ejRFMUNJRDhsbXYwcFNUYlYyQUZDQUl4U2JCTzJZ?=
 =?utf-8?B?S1dZKzRpYkJNb3hkZmpEeWFFVmdwcVZOTHExd0Y5UUVEbHMxL3hCM2hsRjJi?=
 =?utf-8?B?cDE2YmlwVzF4bG5qTDJqcUFrcCtNSE9RSXZzR04vTmN3aUVpREtlb01rMXhj?=
 =?utf-8?B?djZEaElEL0NtT29JMTg5a3cxbjBwK0FlaERiNHZtemZhaXhFa2RPbmVsNGVK?=
 =?utf-8?B?SHRLbSt1VjA4dnRIdDFJQjlvUVZFbm9CS1grbUNBRlZSMEdMVmV2cURucUs3?=
 =?utf-8?B?NTFyeURJcUNZWVN1NnZ0YjlqQnNKbWtiSWdiUUpQVjJhWC8yL3pkNDM0Y2Jx?=
 =?utf-8?B?eVlsR1NqWFNQMU9YQWp5SUE3bmoxbjZpRk13a1VjRmR3UW9EZ1ZscUJjNEZm?=
 =?utf-8?B?eVVyV0R6MWJFL3Awakt5R0RuVVlVRE5TeGdxNG1TNnh0UjQ1dTNyOENaYWhX?=
 =?utf-8?B?d2U0Z3R3dEZHR05GaGZCKzQxRzhmVTNQTnpvTkpFTUpHOEMwUjVyRVdwZXVT?=
 =?utf-8?B?Q1RyUG5SVkYzT3NEOXhwMEw3ZCswWmdxRDBSZmRZeG1oVndnMzNRcXJLNmY5?=
 =?utf-8?B?d0lORDc2cXJCNUIrUi9GSVFiV2VrdUFpSGw4dEZkcXl2ZkVwUUpreGtwWGpx?=
 =?utf-8?B?K0VhWVF2a3NNN2FBQUNOc3VFZXJ2eGV5aFBwZHhySW5nOE9MeDVWbERIQmlR?=
 =?utf-8?B?QnUxMHZ5Mnh4V0ZMbUxUeVlIalMvL3d5U1ZUZWs0S3pZOFFUTUJyQmdzbmZ1?=
 =?utf-8?B?Q3RnYlByMzlaNDdEZkxaRXFVTlRJa2tnSlFER1FpNUtIVHJJK2hRdXJyWmF4?=
 =?utf-8?B?QjRzZlh1UzczZmg1cDdGalZvQUc3bEZjcUw0cnFuSmlnUGsyWDExTjVNWDRI?=
 =?utf-8?B?b3liS1BOR1hDUVRVTldCYUhKNEdDVHVjNUFXaWY3eiswNUsrR211VjFPdDNO?=
 =?utf-8?B?VHdXNEJMU1p3TlRXbDN2Y21CSEgrSkIrbW9PWFRFL1huNGJRMVRBK3JzZktH?=
 =?utf-8?B?SjZlZWIvNjh5dTFwYllDbS9tVVlUMVpyd29XVzBwbFdmcFNpdm1FZndlZWxt?=
 =?utf-8?B?OWp0a1ZZZFlWWTl2WVBEZEtic3F5clZPNnEvcXBSTllBaXF5ZUxiN1FtV1Jz?=
 =?utf-8?B?dHZkM1RqZkpuWk5KNWdSVTJGWXFybFJZVUcwSmkrcS9ERHFrSlJ3ZlNNcHFq?=
 =?utf-8?B?NGNId3lXZWU5Zks0NzJNM3FkWnAzYXNLNTdPRGlWd1h5TTNBbkI4VzJtc3ly?=
 =?utf-8?B?Z25hdGNERkhINDNteEsrMkcyd1Rjc2dFV0xZMEl1ck14YjlxTU0yUkpqcmN6?=
 =?utf-8?B?eGJWZUYzRXcxTFhxRzAwalJYaG82TmFONFR5WXFzd2lGSHhYbjFkRyszSWc5?=
 =?utf-8?Q?1skjfGndANtRyidA=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86e40b03-d8bb-4032-eb9c-08de5994f94f
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 09:02:30.8066 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MvHgR+EZKd+RUz/x5wz958vn9W9DFqbJ2RRWrbbhvGOtOWZsGFrTO9z6egIlQlQjkm5eviEtTgJKXQ6BQRdmsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7872
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
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:imx@lists.linux.dev,m:p.zabel@pengutronix.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:Frank.Li@nxp.com,m:laurentiu.palcu@oss.nxp.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[laurentiu.palcu@oss.nxp.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[lists.linux.dev,pengutronix.de,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,NXP1.onmicrosoft.com:dkim,nxp.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.nxp.com:mid,devicetree.org:url]
X-Rspamd-Queue-Id: 3F1C56423A
X-Rspamd-Action: no action

DCIF is the i.MX94 Display Controller Interface which is used to
drive a TFT LCD panel or connects to a display interface depending
on the chip configuration.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 .../bindings/display/imx/nxp,imx94-dcif.yaml       | 82 ++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml b/Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..fb25300e25529699adeb4caad9837d7af23a3581
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2025 NXP
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/nxp,imx94-dcif.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: i.MX94 Display Control Interface (DCIF)
+
+maintainers:
+  - Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
+
+description:
+  The Display Control Interface(DCIF) is a system master that fetches graphics
+  stored in memory and displays them on a TFT LCD panel or connects to a
+  display interface depending on the chip configuration.
+
+properties:
+  compatible:
+    const: nxp,imx94-dcif
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: CPU domain 0 (controlled by common registers group).
+      - description: CPU domain 1 (controlled by background layer registers group).
+      - description: CPU domain 2 (controlled by foreground layer registers group).
+
+  interrupt-names:
+    items:
+      - const: common
+      - const: bg_layer
+      - const: fg_layer
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: apb
+      - const: axi
+      - const: pix
+
+  power-domains:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+    description: Display Pixel Interface(DPI) output port
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    display-controller@4b120000 {
+        compatible = "nxp,imx94-dcif";
+        reg = <0x4b120000 0x300000>;
+        interrupts = <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "common", "bg_layer", "fg_layer";
+        clocks = <&scmi_clk 69>, <&scmi_clk 70>, <&dispmix_csr 0>;
+        clock-names = "apb", "axi", "pix";
+        assigned-clocks = <&dispmix_csr 0>;
+        assigned-clock-parents = <&ldb_pll_pixel>;
+        power-domains = <&scmi_devpd 11>;
+        port {
+            dcif_out: endpoint {
+                remote-endpoint = <&ldb_in>;
+            };
+        };
+    };

-- 
2.49.0

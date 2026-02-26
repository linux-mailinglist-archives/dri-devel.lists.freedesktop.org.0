Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id II5ZIKzwn2kyfAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 08:05:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5431A197F
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 08:05:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E17EC10E877;
	Thu, 26 Feb 2026 07:05:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="RIT7pBed";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010022.outbound.protection.outlook.com [52.101.69.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB14F10E877
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 07:05:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FfZvWj+iFiQgsjOD8a+mT5g0vFJWnZlXZvSpNYIlAZtDddYnd7UPLGcL3G6U1WrTavJwd3g8bv4PyYZIEKTKm+vaKgHCHLX9u9AerPBHpxuVRB3m3ux187HVLfq1Svx7KbD1PVfOUSE4yxhzWYoBljrmMI4quxNjgeazK2Ln6Gmd1RxDrGo74gpTq7NAwXWPn2EKO2Iirz/KF6/aPmiQ5yFNQ8qO4hhpb56TerswftihYYDvfHj5CO7ieQa5u6e3McMADN38Vau9JJJMeuQKX0VFFfFQSgGu54YrnYEkjzVUpxx07D1jdqlG69cRZc5QvYDipEq6lg3PhhjuaDjs5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sdWImv1csvmaDEM7m1nRPCrqXz8PzRexGsPly/cQtsU=;
 b=PbIJwIQRLXOqm9wD254CyRvL/2ZIS5y9IWh23cDycDlQz59eQgpNMciQdAS01jMrCzTuxYmd+G+RTrMao5beH1gWVtU/25GPjFTK7Em3UQRTX+Ypwaksl/5DNVwUMzCw5tHhNrHe66QlC417VLkpCADUqlgzZT6/yRyyYBGDVkkGg5nk0SBAUMdWqi5Kasp3ohfhgdEhef6X78nFQoQJO01xhnM60mby7uSZ+Jmgz0N2xod6Dlra765PrfAGBUOhbjUanwlIFvQTCGGxbe3NcAJm1ElH1Od0t4W/5m3D8B19tlNYSjzxpq2TBvIshv7eLejlQNNHMrwreRwlkjAJ6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sdWImv1csvmaDEM7m1nRPCrqXz8PzRexGsPly/cQtsU=;
 b=RIT7pBeddCxY4LWI2EtmGzfGnka9ExSHnJRFHGwyEMYB3RYZsY6Di3rBEGrWQ78hGQJp2zFJNdT+hKfS31bO1IP2bgGfArDJ+GrsICgT3ZlxRUrklcSw7F0M4iXWs6+sriJR8WbRxDev3o0t60LcJEEtWN7qmNYf3+XfmL+liFU6PEaJINSBTDpG33QtTlS5yh+QKSmwMCRqAw8mDCuPCO30aaaO4zkg0KJKS2ERkpkpLwU9MWxgfD3bVyn8SFjjeWF6e/UUwYSPgo0Zn8Yy/+mUy6XGZLSogJJoUwoEEboJetXPr0Aljz1ckQvf5+BAyJlMqG+SoVfN2HEsm2gbrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS5PR04MB11345.eurprd04.prod.outlook.com (2603:10a6:20b:6c3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Thu, 26 Feb
 2026 07:05:09 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 07:05:09 +0000
Message-ID: <8bffb7b7-463a-4815-a471-725b9ef8d5fb@nxp.com>
Date: Thu, 26 Feb 2026 15:06:11 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/3] drm/bridge: imx: Add i.MX93 parallel display
 format configuration support
To: Marco Felsch <m.felsch@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 luca.ceresoli@bootlin.com
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20260115-v6-18-topic-imx93-parallel-display-v9-0-2c5051e4b144@pengutronix.de>
 <20260115-v6-18-topic-imx93-parallel-display-v9-2-2c5051e4b144@pengutronix.de>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20260115-v6-18-topic-imx93-parallel-display-v9-2-2c5051e4b144@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0006.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::22) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS5PR04MB11345:EE_
X-MS-Office365-Filtering-Correlation-Id: 643ae963-2517-481a-921a-08de75056078
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|19092799006|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: aazMnGovv53cxLlWYB62SLbCLyvF02UiiLK8Rn39YzcjNha8wnoHXXeT+YOyRjH9ZPPMdtO09YT1Pr1HRHO4ZFYGyA0GImEirGjXhIpninwwzB8/xbFhP7m2yi7oAnpGiTFGPERAUjTfQiPe1YmltRVtlgj5Q7dxaa7LeUY1uPH/DPnipXX9EDDrnYBvRBZAUAnOBjjanDNgxVprNZS6FL+PihC1AZsq3yVIMqZt/dja9w8YfPVZH25WV1hzSG2TDQIWwZelZMocu8l2kFbsQ2hs7OZvBVXgz3NkCqOGEW/fL98GHRZsGkk66PeZZeJl+F5MD5KhLEvgNWLuhtRN6xYabjVoGvplX6UQw72gQ8J/CZzv3cRDUz7a8cOjkltIt+7qRgMGUBSVI09wsy83Y8x6xYt9L0Blu4cKy083sf6PNRaS2ieWxdBRyVPniCAURoaOk3vG7rn1lKGbFFgjN3wppqSWZNDWPDMM98V3KKMcEPbNLIeMfLg3/qkGoM4CkelvP3mtb/n4LKjRNfA2K6cWzLKseThNUhQj2q1oTzN9wmaAA2d/GSFr0sBYMVjy/dxOPU78/o2Z6Yw/PFOpreGyvr425C3I7dpKPwJ7GcO4l8IPO2/zXtuxT48GAILAh00HjYtLj04jn9jDdpGEbcD+YEme9ICzbortlpQXvPEKBOXO7SzO9T/nhctWC8ef8gZQVOjnoecAA3V/4XbBH8mVA6lyiUWA6C0RivRp35k5UfHW4ON/vPbHGt0OJv94PRGePDK6gxFaQKFApVYZZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(19092799006)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OW41MUtZcHBMTjEzeEVpcnRZQXdZRzBMT1VJcG5LV3ZTRVk4VHFjbng0N1BU?=
 =?utf-8?B?Z01waUVJZithWDJZY01TcDV1cHI1S0hENE9XL0NCYkJIUGY1SjRNOER4dlRP?=
 =?utf-8?B?dTEwcVkxMXErcGpGdWg3aDNmbXZLUDhzTS9lTUduQythYkYrd1FXZUZFa3Er?=
 =?utf-8?B?T0NKZUNrcWFYVktwaUYwcUptNEoybXd0UG9tM1ZkckZremRUOFY1NURtWlUv?=
 =?utf-8?B?Mk1JWDdqZDBKb2FoNFNPSWw2eWV5OWtPM0RwYnFUeFB2Y21oMFFzTHVDdldY?=
 =?utf-8?B?UmIzcVZxT2MvbXdaejF3VW0xZHpjbHhqcFY3TkFPOHdqSzVKVTljSERFRTZK?=
 =?utf-8?B?MHBNVVJ0V1RCU3IvRS9XcWFlWS9XRjRDODFxeE9HMWM5TG5uUmNFT3plTmI5?=
 =?utf-8?B?bmUxTFpSRU9aV2dnTmpkVUNWRW1iR2srZ2NHUWdncjhXVW5tUUQ2Wm1EZ0xY?=
 =?utf-8?B?VDNKZ3ZJL2NXWW1URWdlQlJKbVRuWFFpdlRvdTdKRlh5UG4zdktsOW5nL291?=
 =?utf-8?B?R2FPMUVrekRxOUxCL3VnOUFMSHBpZWdkRkIrWERSNUhLL2xzck9BTUNFdEIx?=
 =?utf-8?B?amE0dnlibHZWS2RtZGptaXBYOGRDVUthMWkzVlNoZi8relJOQUlLQjVZS2pW?=
 =?utf-8?B?SnhKWG5lQlBlVDVmSGl5RW40YmhlM1JoSmpReERZdmRvNUdGZmloL1pCNU85?=
 =?utf-8?B?WFpaZnNUaXZ4OVZLMHNNNVJ4OEoyVGQ3c3RiK1Zva1M3SVdLVDloY0xORmxT?=
 =?utf-8?B?YU1CRVVpV1Y5ZGM2THJRM2dBa1RMTC9IVUNqUmpNMEcyODJBZmdzRHBGZjdE?=
 =?utf-8?B?bThidlBrOTZiWWszTWFYYmdGMmJWak1obUJkVElYcjBHWE5uQWZBQWhsa3FG?=
 =?utf-8?B?SXovbllJNEtnTDlXSUJialNUOUp4bDcyd1Z1ZUtCVkV5aXIwOTlGR21uVGFk?=
 =?utf-8?B?YzdXbFBQMER2N1ZzdW5OR2dVQlNGMnhVc1I0elRuendSaUxRZThrNm5xRzdm?=
 =?utf-8?B?Q2ZweFcwSjE5OHlkY2xsV3BjVmpnK000U3ZicUFDVEZNUDdjejZIaXNLWDVi?=
 =?utf-8?B?UXRNb0hQUkxhTWRwQmZDWDBGVTYwS1hUTlRUMVdvbHpTNDlvOUVYREhjeGZH?=
 =?utf-8?B?cTArRWlTS2gzWkpmNjdyVG93SmFTcElOZ21Sa2lNd1hnS0pUenhsOTlhTnBv?=
 =?utf-8?B?dC8veWdSbFNwWHZQSExwZEJNeW04eWVybHpnTzJjU2Q0UzEwUjBUemtpRzcw?=
 =?utf-8?B?M1IrMUJES2JRRTRnZytaVWNnQlBpVTFLVEpQLzgwUXhCM2lBYVhQWG5jSVE4?=
 =?utf-8?B?MUFPTUpsRnpWZGhmUDJhL3pLekcxSDZQa3Iza0JDNWtWT25GV1A0UVB2cnh2?=
 =?utf-8?B?YzNuVkZ0UWpybGVjMEFzcjR2TGJnL0c2M1pHS0RaaUtPMzl4MDdDVHNXVXgw?=
 =?utf-8?B?K3RBajNvRmRBN3VvMjRERkZJUEpsWjZEZUk0eExYcUFWUGtienBJOThUdTUr?=
 =?utf-8?B?cUQxUFc4K0hrQ1hyS3Q4OXZvbGhGN3R4ZjNHZ0EzV1JqNFEvSVdiRXdhSVhP?=
 =?utf-8?B?RkE0UmN3QkQramFCWXV2U2ppYm00U21ScVJGaGEvSHlPZU8wUFRRYjdabEF6?=
 =?utf-8?B?OXNJUUJGTEZ0dnhaOHpzdjFUbGVYcVB3MnRuV3lKS0x1a1lORytKZm9oMjFW?=
 =?utf-8?B?Rk9oVUZIWHNicDA2MTY1RWVNNVByUHh4aGJhdkVJMDBobkNjV2xtTGVQSUd3?=
 =?utf-8?B?TkU5ZE1rTEZwSmhlaXVib0pHNkR4YlRYaFJsWHgyRS9UYWRTRllGejlZMlBJ?=
 =?utf-8?B?SDZFR2d5ditpNHRBc3pTdzArT0VTUkJVNythZFdHTlE4RmZsbitIKzlZSXB6?=
 =?utf-8?B?NFkzZXNtRWVhTkFrWjF2R1hjUXJva0FPVUhwd0pZNzEvbzljS1FPaDlraFRE?=
 =?utf-8?B?N0k2REFsNkRVcEQ0a0lML1RJWUFDUHR1bmtKM3BzM0JZV3FHVGcrZGFrWjJp?=
 =?utf-8?B?Nkl3bjRoZXVTelVFeWU1eGd0bld0dVBENzRkc0JjYnNrYXlPREsvbjR3SFlt?=
 =?utf-8?B?NnlNK3M0bG50UTIwcTZEV0NKSTdOZmlmai9qOUhKbCtqL2RGREw3L2NFeDlL?=
 =?utf-8?B?d21sY3pTMlNHdUwvaHB0ci9GZzVhSmRNMUFTRmFpU2Ntd3g4ME5JcHZ0YThM?=
 =?utf-8?B?RzhYZ1EramNzTGFWUGR2eFZkNHQvelVyZjR1UERwc1FhK0NieE9Lbi9wRVZN?=
 =?utf-8?B?Zzk2WGEzSXNINmNsenZNSjlPM3pFaXl5K25Gc3JtMDZ1alUwbjRLQnFWbzcw?=
 =?utf-8?B?Z0plRlRSd2doSFhQRldqL1cxYUlVZStCdEpwdENVU3ZFTFZmZ0FHUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 643ae963-2517-481a-921a-08de75056078
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 07:05:09.3847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NPWUOR+ZpUhWpTgtyheMeCibn4b7CvPQXnkIoOOvyB3NSMpBl9Bc/2B+J8pfrg0jNxhvnsyqOS0wt6QPVNJcSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11345
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:m.felsch@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:peng.fan@nxp.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:luca.ceresoli@bootlin.com,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[pengutronix.de,kernel.org,gmail.com,nxp.com,intel.com,linaro.org,ideasonboard.com,kwiboo.se,linux.intel.com,suse.de,ffwll.ch,bootlin.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER(0.00)[victor.liu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[victor.liu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nxp.com:mid,nxp.com:dkim,nxp.com:email,pengutronix.de:email]
X-Rspamd-Queue-Id: ED5431A197F
X-Rspamd-Action: no action

Hi Marco,

Sorry for the late reply.

On Thu, Jan 15, 2026 at 04:24:52PM +0100, Marco Felsch wrote:
> From: Liu Ying <victor.liu@nxp.com>
> 
> NXP i.MX93 mediamix blk-ctrl contains one DISPLAY_MUX register which
> configures parallel display format by using the "PARALLEL_DISP_FORMAT"
> field. Add a DRM bridge driver to support the display format configuration.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> [m.felsch@pengutronix.de: port to v6.19-rc1]
> [m.felsch@pengutronix.de: add review feedback (Alexander)]
> [m.felsch@pengutronix.de: fix to short Kconfig description (checkpath)]
> [m.felsch@pengutronix.de: use "GPL" instead of "GPL v2" (checkpatch)]
> [m.felsch@pengutronix.de: add bus-width support]
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  drivers/gpu/drm/bridge/imx/Kconfig      |  11 ++
>  drivers/gpu/drm/bridge/imx/Makefile     |   1 +
>  drivers/gpu/drm/bridge/imx/imx93-pdfc.c | 226 ++++++++++++++++++++++++++++++++
>  3 files changed, 238 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
> index b9028a5e5a065c3237b404111d8df57e8e017f9d..47829300a4486a090514ebe914b7667a703039a9 100644
> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> @@ -99,4 +99,15 @@ config DRM_IMX93_MIPI_DSI
>  	  Choose this to enable MIPI DSI controller found in Freescale i.MX93
>  	  processor.
>  
> +config DRM_IMX93_PARALLEL_DISP_FMT_CONVERTER
> +	tristate "NXP i.MX91/i.MX93 parallel display format converter"
> +	depends on OF
> +	select DRM_KMS_HELPER
> +	help
> +	  On i.MX93 and i.MX91 SoCs the parallel display format output is
> +	  controlled via the MEDIAMIX BLK-CTRL DISPLAY_MUX.
> +
> +	  Say 'Y' or 'M' if you use the parallel display output path on a
> +	  i.MX93 or i.MX91 SoC.
> +
>  endif # ARCH_MXC || COMPILE_TEST
> diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
> index 8d01fda25451aaa1bf51a068da18948094327116..da57fde2d813b88cdde89115ca801b4cfc69afbd 100644
> --- a/drivers/gpu/drm/bridge/imx/Makefile
> +++ b/drivers/gpu/drm/bridge/imx/Makefile
> @@ -9,3 +9,4 @@ obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
>  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) += imx8qxp-pixel-link.o
>  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI) += imx8qxp-pxl2dpi.o
>  obj-$(CONFIG_DRM_IMX93_MIPI_DSI) += imx93-mipi-dsi.o
> +obj-$(CONFIG_DRM_IMX93_PARALLEL_DISP_FMT_CONVERTER) += imx93-pdfc.o
> diff --git a/drivers/gpu/drm/bridge/imx/imx93-pdfc.c b/drivers/gpu/drm/bridge/imx/imx93-pdfc.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..95a892abacadaedee86711ade225537ed65bd09c
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/imx/imx93-pdfc.c
> @@ -0,0 +1,226 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +/*
> + * Copyright 2022-2025 NXP
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/media-bus-format.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>

Can you drop this header file include?

> +#include <linux/of_graph.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <drm/drm_atomic_state_helper.h>
> +#include <drm/drm_bridge.h>
> +
> +#define IMX93_DISPLAY_MUX_REG		0x60
> +#define PARALLEL_DISP_FORMAT		GENMASK(10, 8)
> +#define FORMAT_RGB888_TO_RGB888		FIELD_PREP(PARALLEL_DISP_FORMAT, 0)
> +#define FORMAT_RGB888_TO_RGB666		FIELD_PREP(PARALLEL_DISP_FORMAT, 1)
> +#define FORMAT_RGB565_TO_RGB565		FIELD_PREP(PARALLEL_DISP_FORMAT, 2)
> +
> +struct imx93_pdfc {
> +	struct drm_bridge bridge;
> +	struct drm_bridge *next_bridge;

Drop next_bridge.  You should use bridge.next_bridge.

> +	struct device *dev;
> +	struct regmap *regmap;
> +	u32 phy_bus_width;
> +};
> +
> +static struct imx93_pdfc *bridge_to_imx93_pdfc(struct drm_bridge *bridge)
> +{
> +	return container_of(bridge, struct imx93_pdfc, bridge);
> +}
> +
> +static int
> +imx93_pdfc_bridge_attach(struct drm_bridge *bridge, struct drm_encoder *encoder,
> +			 enum drm_bridge_attach_flags flags)
> +{
> +	struct imx93_pdfc *pdfc = bridge_to_imx93_pdfc(bridge);
> +
> +	return drm_bridge_attach(bridge->encoder, pdfc->next_bridge, bridge, flags);

s/pdfc->next_bridge/pdfc->bridge.next_bridge/

> +}
> +
> +static void imx93_pdfc_bridge_atomic_enable(struct drm_bridge *bridge,
> +					    struct drm_atomic_state *state)
> +{
> +	struct imx93_pdfc *pdfc = bridge_to_imx93_pdfc(bridge);
> +	const struct drm_bridge_state *bridge_state;
> +	unsigned int mask = PARALLEL_DISP_FORMAT;
> +	unsigned int val;
> +
> +	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
> +
> +	switch (bridge_state->output_bus_cfg.format) {
> +	case MEDIA_BUS_FMT_RGB888_1X24:

Add "case MEDIA_BUS_FMT_FIXED:" here because 1) I still think it is a valid
output format since the next bridge could be not only a DPI panel but also
a bridge, e.g., a DPI to HDMI bridge, 2) RGB888 sounds like a reasonable
default output format.

> +		val = FORMAT_RGB888_TO_RGB888;
> +		if (pdfc->phy_bus_width == 18) {
> +			/*
> +			 * Can be valid if physical bus limitation exists,
> +			 * therefore use dev_dbg().
> +			 */
> +			dev_dbg(pdfc->dev, "Truncate two LSBs from each color\n");
> +			val = FORMAT_RGB888_TO_RGB666;
> +		}
> +		break;
> +	case MEDIA_BUS_FMT_RGB666_1X18:
> +		val = FORMAT_RGB888_TO_RGB666;
> +		break;
> +	case MEDIA_BUS_FMT_RGB565_1X16:
> +		val = FORMAT_RGB565_TO_RGB565;
> +		break;
> +	}
> +
> +	regmap_update_bits(pdfc->regmap, IMX93_DISPLAY_MUX_REG, mask, val);
> +}
> +
> +/* TODO: Add YUV formats */
> +static const u32 imx93_pdfc_bus_output_fmts[] = {
> +	MEDIA_BUS_FMT_RGB888_1X24,
> +	MEDIA_BUS_FMT_RGB666_1X18,
> +	MEDIA_BUS_FMT_RGB565_1X16,

Add MEDIA_BUS_FMT_FIXED.

> +};
> +
> +static bool imx93_pdfc_bus_output_fmt_supported(const  u32 fmt)

Can you drop const?
If no, at least drop a redundant space between const and u32.

> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(imx93_pdfc_bus_output_fmts); i++) {
> +		if (imx93_pdfc_bus_output_fmts[i] == fmt)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static u32 *
> +imx93_pdfc_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +					    struct drm_bridge_state *bridge_state,
> +					    struct drm_crtc_state *crtc_state,
> +					    struct drm_connector_state *conn_state,
> +					    u32 output_fmt,
> +					    unsigned int *num_input_fmts)
> +{
> +	struct imx93_pdfc *pdfc = bridge_to_imx93_pdfc(bridge);
> +	u32 *input_fmts;
> +
> +	*num_input_fmts = 0;
> +
> +	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);

checkpatch.pl complains:
WARNING: Prefer kmalloc_obj over kmalloc with sizeof
#173: FILE: drivers/gpu/drm/bridge/imx/imx93-pdfc.c:114:
+	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);

> +	if (!input_fmts)
> +		return NULL;
> +
> +	*num_input_fmts = 1;
> +
> +	if (!imx93_pdfc_bus_output_fmt_supported(output_fmt)) {
> +		dev_dbg(pdfc->dev, "No valid output bus-fmt detected, fallback to MEDIA_BUS_FMT_RGB888_1X24\n");
> +		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> +		return input_fmts;
> +	}
> +
> +	switch (output_fmt) {
> +	case MEDIA_BUS_FMT_RGB888_1X24:
> +	case MEDIA_BUS_FMT_RGB565_1X16:
> +		input_fmts[0] = output_fmt;
> +		break;
> +	case MEDIA_BUS_FMT_RGB666_1X18:

Add "case MEDIA_BUS_FMT_FIXED:".

> +		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> +		break;
> +	}
> +
> +	return input_fmts;
> +}
> +
> +static int imx93_pdfc_bridge_atomic_check(struct drm_bridge *bridge,
> +					  struct drm_bridge_state *bridge_state,
> +					  struct drm_crtc_state *crtc_state,
> +					  struct drm_connector_state *conn_state)
> +{
> +	struct imx93_pdfc *pdfc = bridge_to_imx93_pdfc(bridge);
> +	const u32 format = bridge_state->output_bus_cfg.format;

Can you drop const?

> +
> +	if (imx93_pdfc_bus_output_fmt_supported(format))
> +		return 0;
> +
> +	dev_warn(pdfc->dev, "Unsupported output bus format: 0x%x\n", format);
> +
> +	return -EINVAL;
> +}
> +
> +static const struct drm_bridge_funcs funcs = {
> +	.attach			= imx93_pdfc_bridge_attach,
> +	.atomic_enable		= imx93_pdfc_bridge_atomic_enable,
> +	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
> +	.atomic_get_input_bus_fmts	= imx93_pdfc_bridge_atomic_get_input_bus_fmts,
> +	.atomic_check		= imx93_pdfc_bridge_atomic_check,
> +	.atomic_reset		= drm_atomic_helper_bridge_reset,
> +};
> +
> +static int imx93_pdfc_bridge_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct imx93_pdfc *pdfc;
> +	struct device_node *ep;
> +	int err;
> +
> +	pdfc = devm_drm_bridge_alloc(dev, struct imx93_pdfc, bridge, &funcs);
> +	if (IS_ERR(pdfc))
> +		return PTR_ERR(pdfc);
> +
> +	pdfc->regmap = syscon_node_to_regmap(dev->of_node->parent);
> +	if (IS_ERR(pdfc->regmap))
> +		return dev_err_probe(dev, PTR_ERR(pdfc->regmap),
> +				     "failed to get regmap\n");
> +
> +	/* No limits per default */
> +	pdfc->phy_bus_width = 24;
> +
> +	/* Get output ep (port1/endpoint) */
> +	ep = of_graph_get_endpoint_by_regs(dev->of_node, 1, -1);
> +	if (ep) {
> +		err = of_property_read_u32(ep, "bus-width", &pdfc->phy_bus_width);
> +		of_node_put(ep);
> +
> +		/* bus-width is optional but it must have valid data if present */
> +		if (err && err != -EINVAL)
> +			return dev_err_probe(dev, err,
> +					     "failed to query bus-width\n");
> +	}
> +
> +	pdfc->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);

s/pdfc->next_bridge/pdfc->bridge.next_bridge/

> +	if (IS_ERR(pdfc->next_bridge))

Ditto.

> +		return dev_err_probe(dev, PTR_ERR(pdfc->next_bridge),

Ditto.

> +				     "failed to get next bridge\n");
> +
> +	pdfc->dev = dev;
> +	pdfc->bridge.driver_private = pdfc;

Oops, you missed dropping this as the changelog says
"drop bridge.driver_private usage (Luca)".

> +	pdfc->bridge.of_node = dev->of_node;
> +	pdfc->bridge.type = DRM_MODE_CONNECTOR_DPI;
> +
> +	return devm_drm_bridge_add(dev, &pdfc->bridge);
> +}
> +
> +static const struct of_device_id imx93_pdfc_dt_ids[] = {
> +	{ .compatible = "nxp,imx93-pdfc", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, imx93_pdfc_dt_ids);
> +
> +static struct platform_driver imx93_pdfc_bridge_driver = {
> +	.probe	= imx93_pdfc_bridge_probe,
> +	.driver	= {
> +		.of_match_table = imx93_pdfc_dt_ids,
> +		.name = "imx93_pdfc",
> +	},
> +};
> +module_platform_driver(imx93_pdfc_bridge_driver);
> +
> +MODULE_DESCRIPTION("NXP i.MX93 parallel display format configuration driver");
> +MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
> +MODULE_LICENSE("GPL");
> 

-- 
Regards,
Liu Ying

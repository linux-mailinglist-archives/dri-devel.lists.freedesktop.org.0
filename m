Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBhFEc2Pqml0TQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 09:26:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B1121D0F8
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 09:26:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C28910E185;
	Fri,  6 Mar 2026 08:26:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="g149O4q2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013022.outbound.protection.outlook.com [40.107.159.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3776C10E185
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 08:26:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F4Tz/38ZmrcbzhZoM9HTKQfZf4QYzGjVr3jdTv4GUqUuCsIF6/X3pPUssbXXZKobhgHLHW0rQRIhk2QT15dalJyh1lc4Onstvl4y502mm4X0d/PSTTQH695AS1tQWMuPJrGkwBykEKP9coJaHVjeOrGjOA1PV4i9/BRMUQu7urWMtaIONJlN+qYR89Fm+4L5m+RBu96pDtJgy4p9fAo+/h2rPU96puKU0i+0aB2vdHmWB1U9XcSCzVGf3mpxo18ZzPfigssAVSzsjTv9ytsC7MJ50jPYVyxH3IhbLEy+CYyOylO96ks7miuczc+XMUCdRCNOTLsF3I7r6LGs0dy/Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0gJssetRelVXwnqSvPfz+en0JHNaQgM1P5OQkEMuP0Q=;
 b=NzOc9bSmu0bzlW9RaqD/MAnQKixz/OJv4Mq1g/IVw2OTtc/2s7oW+Z1NKK6enV3UeVqdBg/r+No5Of3iD+AO3Cujgyw4xUWH+M487R6zjmSLieLvpgq+uR0RZ3ccZlFJRDu0gzUqgv0ieOfh9CF5rUGcSC8zYtqucI1zKhsN+JMYhcPGXdtGASpha9uBBdfkXF/sLLTHTlx2/pNOZZiT+LyZAIs3PRDuCeZMRsHPlq0DzoBtxHcatz6rDNgKX2wYsVEEbBfFMFxwd8FRtHgV7zanWx1WdPpQY0ZG/BxsDq5Bm32SifMU2eYzw9WmtGb/IhL/RTCSAyULpXn0IFtueg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gJssetRelVXwnqSvPfz+en0JHNaQgM1P5OQkEMuP0Q=;
 b=g149O4q2F/QPdOeS1JWehSiT2skCCDf69093cbhBdlSTz2kg5ygDh6RuG2/T4HMzDo88Tgyw/YWzJNTsP5gxe+BPNMSNJ6Yfl/pDrRoW1mkB8F7MLsYMt9uDV1NAVPbDXS0yrW/EiyXjbPyQYGW8cbNB8LKl6bJlNcQ8pHIoSyqOvpjL5+FQoFrEJQrwliJ1tcTRWo48saQ6xlBJHGqP7BuTxta4FoorD2jve40AK6UITM/s043u9XuxEjITX3VAoUrjd4X00va0bSV297RzPLuzYv+p8tWILfhxVTNzlvr0dJ40TIUThUZm51KSH9gmk1N7jUa1MPWz9SH9S+VkHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU4PR04MB10598.eurprd04.prod.outlook.com (2603:10a6:10:580::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Fri, 6 Mar
 2026 08:26:42 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 08:26:42 +0000
Message-ID: <43be372e-8177-457c-9d4e-a2ed69e79c8a@nxp.com>
Date: Fri, 6 Mar 2026 16:27:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 7/9] arm64: dts: imx943: Add display pipeline nodes
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, imx@lists.linux.dev,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260304-dcif-upstreaming-v8-0-bec5c047edd4@oss.nxp.com>
 <20260304-dcif-upstreaming-v8-7-bec5c047edd4@oss.nxp.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20260304-dcif-upstreaming-v8-7-bec5c047edd4@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0205.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU4PR04MB10598:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b85647f-d98d-4ddf-6646-08de7b5a18b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|19092799006|7416014|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: rN/X9XqGwcdvf3MFzg1AaV5WCLjcmnfNq1IsX1LLtrl1IJPzCcW35okxugFiybMwVzXMqKJs92QdXp0r/5fJYTeFeqX6LB/4pCz9OJYt0/ZDGsGZa0KGyN8QUZMg1762ZG074h67ASa+1G68Yf1Zv+Ao4tna+S7eFdZVObFztzuGRTnIfXl/2hUKlC5nbqCNnUoH9FvoRe5oqhgO4eyJiPiXDCza309pITIai+MLw+9xQF0E187qsEZGDTX0KvqAlFmw0Beef+SXD0KSnMmcsabIOQBrtY0t0Roqxgb5FrgrkGU+QBdinF1weSsG/ne2KvIriJrbJTlikKliSVEBQYyNc7zS+sFA+4L6q8/iJ6EbAasA8xhaB8gdMx4aeReQLi+z9O+ngv4sq48MOEYD/vvCp/kMb79SeZQBiMFCBUVxa/In3ir9Jad1Npx/0ODFxxqvZOfd9ew00U4SNENbYa088ppgFZ7uuGRJTuARUDZesAs0/j3Qog9/L9GPTPS7HJyhtoYwuvAhqJX1nFtUK3ZQtgfV2ij0Wivh71ogEX8VQxYf1f/IsVY8x1fMEb69It6++ZAJgBrGP7c5hpSt4dYvCwk1dHQ9WbU+dwefoidnDG53pI+pfCCUq9HvGGjngHNKFjrxWaRiB4+YCPtseOtDD82k+rWZyMsvXwfQHbzsWC9sASb+mW1DjZO9vnHVaMbefZcMTkhABzLMooekA7lck7bYnFsUUdShpGLGCfA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(19092799006)(7416014)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akJaSGxPMHVXY0NwdWlkS3NEeWd2ZmF5NlZXQitZWkNaWGNMYkM0NE9VRU1v?=
 =?utf-8?B?NHRKSnlGL203Sml0ZjhDMXFFSFpmVXRWYmw5U3FhVDU2NlRTejdnTnpIK3pT?=
 =?utf-8?B?RVhVclprNDRqQUlBWmVUbFp4WlhhRUdJL3JoUU54bEhObGtwSDA2WHp5cUE3?=
 =?utf-8?B?RFhibDdrVVp3cjFjeEpZVnUvNUdVMjlVcTIyVW9ZQVRlZ3owZFg1emFJcGh0?=
 =?utf-8?B?SHpPQXpJTDRLUXpqSWRvNVdiV1dDeldEMnR3cXIzWldaelhTQTg0MDk5RHpG?=
 =?utf-8?B?a2tLWis4VWkraUpySndEdVZSZTFKcWwwRjcvSEozVkVBL3FSdWE4OFVsVVNV?=
 =?utf-8?B?dWpkVXZPcWVnU0piVkZuM3NBN0JraEpMcUxjRU9LbUFiUTJsVURzNjhXVnp3?=
 =?utf-8?B?c2dhUXRUVUhESEdxKzBBaFJRK3VJbW9uUnJMMjlXQ1lhY3cwanJxSzU1bVJm?=
 =?utf-8?B?ZTRabVRTcnJIMzJNd3lHRERRN05iOWJWWDA2b3ZtUnBlQVQwRDhwSnZvb3pZ?=
 =?utf-8?B?K2FjN0g4MWpFRzlETDN5eTR0VmV3QkJiTDVqT3dlOGNWdFFhRkNaVStzUEJR?=
 =?utf-8?B?TmRSTzZ3bUMyQ3lJR1FVSStycVJKRlhQTWxTa2UvVGtVUnNMVzhLL2FpTzRr?=
 =?utf-8?B?QmNqYzEybWpYTWtVSWlMVDNJMFlaYjdVQ04ybS84S3BRRExISTVFckpHek5t?=
 =?utf-8?B?d3JlRCt3RkthNElTMmhxT2JEUnE3d2pSOTJHV2xFcm1OYWVOMmU3cDlWWFI4?=
 =?utf-8?B?emlhUm0rRURoelMzTm92OE85b3BNb0xJQWlQdmtPT0JUdnE1aEVRQUxMWVRu?=
 =?utf-8?B?d1Z2MFlCUmtINEd5azdpdWRFbHNXSE9OOXJIdEZnQkU2K0szTTFWb3l2M285?=
 =?utf-8?B?WjQ5cUt3bzVxM3pkVlhVTVh1UTBQVlptb3B4YWl5WWpBS1RXSHF4dkJPWDQv?=
 =?utf-8?B?MDduMjJIU0xxZ0xhb0JHSVU2QzY4bkU0SXVPSk1JczY2NEk5a3Q0aDNBT0V0?=
 =?utf-8?B?VStjTUFGN0NjOHBZaVkwMjBZUGxPUTdQbHJ4ZnQ3ZFlYVjhlVjFVcGdaY3dT?=
 =?utf-8?B?a0gveEV5Tnc2cUdyNGxmQm5KSkxkYnFZUXhyQ0RXNHhOckkrSEVtWTdsbnlY?=
 =?utf-8?B?ZUVGa3hTSEE2UDkrNjUxZVAwZFpYUytWeTJPOEl3T2x5VHUwUlhoTnhXVVhC?=
 =?utf-8?B?WEoyTDB4M0s0Nks3WVI2S1Y4Z1dQYVJpdU81VCtLeGg3RTg0ZG1VWlNiVTJ4?=
 =?utf-8?B?dmlEVUpEMmluMnptVE5tRXJNelRxSTNJVTBMRERXRGM5TEZqSHM2MGlFeVF0?=
 =?utf-8?B?MGh3UytDOXhXLzgrV0ZiRmtmQXJ6S05UeXdPTTN5bHBvSkFzZTZrdkZrbVVU?=
 =?utf-8?B?V2NQdFBrdVZOVm5LZWtvazRlcWhadnhXc01vQTF3UG9Rc1M3VStEeTVSMHd5?=
 =?utf-8?B?cmhmZ3VrNDVzKzh2K3E1R2p4aHBCYk5nWUJlcDNYMnJJcU4zYXQ0L2xpeDB1?=
 =?utf-8?B?MmlXRmtLOUV3RkJUb245UHNkWlFlRTd1dFBEV0dNVk5aOUQ1STMzdldJbHVw?=
 =?utf-8?B?NEJ4QU0wdjk2dFFVT3EwOG5wRzkwYTVPcTQ3aHJnUW0wakpsa0ZMYnl2ZnY1?=
 =?utf-8?B?dnhaNmdHV3JUY0JNT0MyRTlkVWpmeHo0dHV4bTU4U0x4bU10M1FDMU1WTHVG?=
 =?utf-8?B?NjVOUCtrSCtPR1ZjaExabHlBdjlldEpBcG9CMTlkTlZoeTRLc2o4L1p6S0pO?=
 =?utf-8?B?emNPdlVSanVrL29pWXJHR0llc25VTjlkYzZYOXhHSkxGWU5vR3h5VWhmdGx6?=
 =?utf-8?B?WmRYekt3bVpxSUVJVzZ0Z2RsU2pRTlNXL2RTb3hMT25KSVRwS3ZscHlyR0ln?=
 =?utf-8?B?QUtMQTl5S3VIT040SVhxSXV6M0FxRDlHQzMyM20zbkhyd1ljOGRVTzdFckZL?=
 =?utf-8?B?V24vaWgvaXFVSTRHbzRoMEpLSUQwZUhBZ3czRG9sSUVvUzFVeEx3b0NhNjh3?=
 =?utf-8?B?K3gvTTBrcWNpbVArZDI5U3l6VWFZbnkvNWVpdytUdlJBVVIwNlBQQkRoR05h?=
 =?utf-8?B?a3FJQUIvd1pqL0dxYUJRcit1a2VYbGhyNUZ4VHhVMVBkajNhM05SR1RIK24r?=
 =?utf-8?B?ZU9nVW5acDhkcElrZmwwb2QrbjIrYjB5b1RsUityZkdRemozSVRSYWo3cXBn?=
 =?utf-8?B?UDN5ZVpWQlQrUzROSVY2a2RzRkVBUU83NTBVRnl1N0JwYkpIM3lhQXE4OUtl?=
 =?utf-8?B?ZU45eE1IblJoTE5jTlJXZUlTZWw4bS9RMVRmdmZQL0VCTk1pZ2dwbi9JcWY1?=
 =?utf-8?B?ZFRJSEZXcGdiMHY4LzBlSnZlYkx1eUFvTW5vd3BqWVhPU1dxTkRVQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b85647f-d98d-4ddf-6646-08de7b5a18b1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 08:26:42.6127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RxztgvVFq7AI/tAam0RQneO7vo7XihVL4P5qcg9bZ5Il82JK2ZpiBEtR9cPSp+El2EuKXYKk0fcXF8qqD60gIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10598
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
X-Rspamd-Queue-Id: 90B1121D0F8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:laurentiu.palcu@oss.nxp.com,m:imx@lists.linux.dev,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.nxp.com,lists.linux.dev,kernel.org,nxp.com,pengutronix.de,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[victor.liu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_PROHIBIT(0.00)[0.0.0.4:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[victor.liu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,0.0.0.1:email,nxp.com:dkim,nxp.com:email,nxp.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,4b120000:email]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 11:34:16AM +0000, Laurentiu Palcu wrote:
> Add display controller and LDB support in imx943.
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx943.dtsi | 53 ++++++++++++++++++++++++++++++-
>  1 file changed, 52 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx943.dtsi b/arch/arm64/boot/dts/freescale/imx943.dtsi
> index 657c81b6016f2..9a91beef54e86 100644
> --- a/arch/arm64/boot/dts/freescale/imx943.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx943.dtsi
> @@ -148,7 +148,7 @@ l3_cache: l3-cache {
>  		};
>  	};
>  
> -	clock-ldb-pll-div7 {
> +	clock_ldb_pll_div7: clock-ldb-pll-div7 {
>  		compatible = "fixed-factor-clock";
>  		#clock-cells = <0>;
>  		clocks = <&scmi_clk IMX94_CLK_LDBPLL>;
> @@ -174,9 +174,60 @@ dispmix_csr: syscon@4b010000 {
>  		lvds_csr: syscon@4b0c0000 {
>  			compatible = "nxp,imx94-lvds-csr", "syscon";
>  			reg = <0x0 0x4b0c0000 0x0 0x10000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
>  			clocks = <&scmi_clk IMX94_CLK_DISPAPB>;
>  			#clock-cells = <1>;
>  			power-domains = <&scmi_devpd IMX94_PD_DISPLAY>;
> +
> +			ldb: ldb@4 {
> +				compatible = "fsl,imx94-ldb";

Should this be moved to imx94.dtsi, since the compatible string doesn't
seem to be i.MX943 specific?

> +				reg = <0x4 0x4>, <0x8 0x4>;
> +				reg-names = "ldb", "lvds";
> +				clocks = <&lvds_csr IMX94_CLK_DISPMIX_LVDS_CLK_GATE>;
> +				clock-names = "ldb";
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +
> +						lvds_in: endpoint {
> +							remote-endpoint = <&dcif_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +					};
> +				};
> +			};
> +		};
> +
> +		dcif: display-controller@4b120000 {
> +			compatible = "nxp,imx94-dcif";

Same here.

> +			reg = <0x0 0x4b120000 0x0 0x300000>;
> +			interrupts = <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "common", "bg_layer", "fg_layer";
> +			clocks = <&scmi_clk IMX94_CLK_DISPAPB>,
> +				 <&scmi_clk IMX94_CLK_DISPAXI>,
> +				 <&dispmix_csr IMX94_CLK_DISPMIX_CLK_SEL>;
> +			clock-names = "apb", "axi", "pix";
> +			assigned-clocks = <&dispmix_csr IMX94_CLK_DISPMIX_CLK_SEL>;
> +			assigned-clock-parents = <&clock_ldb_pll_div7>;
> +			power-domains = <&scmi_devpd IMX94_PD_DISPLAY>;
> +			status = "disabled";
> +
> +			port {
> +				dcif_out: endpoint {
> +					remote-endpoint = <&lvds_in>;
> +				};
> +			};
>  		};
>  	};
>  };
> 

-- 
Regards,
Liu Ying

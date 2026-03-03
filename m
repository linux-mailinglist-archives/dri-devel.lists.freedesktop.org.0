Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BtxK8+qpmn9SgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 10:33:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DB91EBE80
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 10:33:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E276510E748;
	Tue,  3 Mar 2026 09:33:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="H2fo5HKc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012044.outbound.protection.outlook.com [52.101.66.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D7C910E748
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 09:33:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Moa4mCcA5HPpH9bBHlK37bwTZ0rRnZcwr016ZjVIFnWQVpsLjnt1pdtOO8pUh7ah1fndStgmNeHEbWml2AQEczEI13+r4u03F8PciRUnkVRpIsWvbuLGRtWJyHHq6ptx88SJ/HoKURN0DIBTtFsOsJfCchNSwrx3fUVjcfOrIEzkmQAvk1vtsmtvLq1rKsccrYBUB1IrdmZy2p3RtvSg82QbBtK31IJCKILNMPclT/pGKNNvHOkT3zuVNt0R+x43rPZTff2R6qVnU6JCtz5FYVA1njbXBctZfzkmkQ6zYjQDu31WEBBshv4LHuJcbriRDmWEpnfA0U2Hx58oUwFJhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iFzZjcXoQXpYEO2IkBUKm02Llnp2DkCl6cANtVjFP00=;
 b=p6cgoE0oLPUlUhKgP1faleV7tD/EBDPkz9M34pQSTY5hmIeH1FjPv9f6ExPPLvB+SEQybq6qaniRmbQAZbOnDwzn07JrzGTQpf2Gb/z3k1wQtkRk0AuQFOVaB860dS3WuNMMPVVWORFkfufGGsmBzStsqBebzbiIMSc9xFlpOQhNYiB4FNu3n4CTLlIb3dShdGn0W4CKbgbrOZhCgjiASLiK9pr7PIeIlT471ef8eK/zpkAu0fJ4Q6KsQra7psmSkosX6jh/MP1noLYhFKrn94ZyZ4VP5H2JSSuBcqT1oljcNKkUzyLhQZp5B9p0UJg3Q7xFpT6cRPnGeBqc/NX34Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iFzZjcXoQXpYEO2IkBUKm02Llnp2DkCl6cANtVjFP00=;
 b=H2fo5HKc4Gih11F+AFDDyZIZsFtlvGHQa9Driz3MMIk28qK3xPQrL197EpgLNaDahpGXCksYqXNLdEXXhcVfkk4STrdt2xJhSQJT6aDKZHbTnNPjgO2vSg0aBKu+TTk/1+i9oOdDGexIRsKpOHlQ0m12ePTsXQHHVt9Vd2MRexwkKxBkyfche3Sxw5C7uU+GK6rR2NoEKoHFWxRZ6b+WiQPmZykWs/DErKxT0Pt/+VbJPMAD79LbJb/Pr8hsMjv26HWWi42WZUKAaX4Hf0ANgC3OFztAgE3TpPU67EKsM2j1mXTdkOragLfYSYVXmZmOF7vwYygdrMbQhpIKGcqnGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB7051.eurprd04.prod.outlook.com (2603:10a6:10:fd::20)
 by DU2PR04MB8726.eurprd04.prod.outlook.com (2603:10a6:10:2dd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 09:32:55 +0000
Received: from DB8PR04MB7051.eurprd04.prod.outlook.com
 ([fe80::a5a4:c92e:b316:aba0]) by DB8PR04MB7051.eurprd04.prod.outlook.com
 ([fe80::a5a4:c92e:b316:aba0%5]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 09:32:55 +0000
Message-ID: <edc74093-abe3-4782-8e81-afd87222c146@nxp.com>
Date: Tue, 3 Mar 2026 17:33:57 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/3] drm/bridge: imx: Add i.MX93 parallel display
 format configuration support
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
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
 luca.ceresoli@bootlin.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, frank.li@nxp.com
References: <20260302-v6-18-topic-imx93-parallel-display-v10-0-634fe2778c7a@pengutronix.de>
 <20260302-v6-18-topic-imx93-parallel-display-v10-2-634fe2778c7a@pengutronix.de>
 <d97a9c0c-bdda-466a-8131-73799cdb20cd@nxp.com>
 <jyawx2cllg2jecdvx6bdfv4qiinfiwb6cuuwdhditpr2g2evee@qiox37ahgczd>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <jyawx2cllg2jecdvx6bdfv4qiinfiwb6cuuwdhditpr2g2evee@qiox37ahgczd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR04CA0017.apcprd04.prod.outlook.com
 (2603:1096:4:197::15) To DB8PR04MB7051.eurprd04.prod.outlook.com
 (2603:10a6:10:fd::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB7051:EE_|DU2PR04MB8726:EE_
X-MS-Office365-Filtering-Correlation-Id: a7494d1a-5152-4dad-bd8a-08de7907d933
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|19092799006|7053199007; 
X-Microsoft-Antispam-Message-Info: StZ9jMr4WatIdJXo6jv9U/5uy8wqL25DtsUXwtfQMfshylsIPMMbCxBkhDqeiAg0+LoLpweK480XXHIUrk7YOqP4UdI2LfWzwG+niE5pUNlannZ7brKa0KaECN+vaIUb1U+bxGin+K6Nn1LHNQCN91Nq2TUMYNR+v8qtzEX7gsQvqtql2G1ji1ga/r/Jk1WjJFzKsvHYRTwA0UuqnALMVNIeb/xR+uJneu4PljZpXFQ/9tZ01n0vO/EGBDoljqvyctbuWZ2CzVgn5TKd7BhDTpKRVxtAJyPn0A5hfvl7nfEgtSw+NeXAAJhKjb71pgTNcIgPud260nbYCMtfNhP9N+NVsH6cabjGTQm2hB20R3CXFFoE09FYPLmcomh4X4PMCEAMpE45tgXfANoWIJieUSQIWK9ZQ+ca9g/vc3pTU3E7IFcVhlAnn0oxSgkRl9tpKTzjJK58NSZ5EebdCp5BFh9kjErnIqPWjA1FDBfzXlNjy2OVV0Jb+6Sq8NumleLcNaSxsbqyHn+dMinV56/Btai8SM/bvQHs9TaEcdLuy6V2D1EYX5RlmxKaVYLXiHkJ79mU/WuQXSXzx/xV0jeMtDz2Z1W4O5ob3lNDfosWvWkVAlStT6Ht826RabFYYHG73EdFHj17N+ibkgmIKRyX+FHrkpVbPHsGRn3VWcgdPKj20EHc0G1keFQqU07mNmQq1kGUvzDagOD81+OPNcvV64qw16tr6sY4PKQGlptgfjM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR04MB7051.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(19092799006)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?di8xS1JSeUwyT3N0VVBNc3BHQWxrTlpHdEJwRXhvaFZVWnpOTDFMeTBVc3d5?=
 =?utf-8?B?allKcXZXNnY5dXNaY0E1WDBKZTQ4S0NUcFZyZ1RIZkhaVng0cVZWUGQrRW5V?=
 =?utf-8?B?NmNGSjA3Uy93QzlvWEJTL1lJQjlzZ1ZNbXpNM2RINWYxZzN3NUJHaTdOMFRq?=
 =?utf-8?B?cHRMaHJ5ZFNySGtaOVhDRHZkN04xL0l5YVAzQzVOU3pIeGZRb2JuamxJdzJT?=
 =?utf-8?B?clRxaTJXOU1zWVNDOEtwTjJ2akpUTmw4MVN1Wmd4cnA1UjByRlYxVUpsaVdK?=
 =?utf-8?B?d05qdlhpdzJEU3BqRUFoeWhZNENrQVdrYUl3UnEyWkd1bm9YOGpicTE2ejNM?=
 =?utf-8?B?cHJNSHV2MGk3VnMvcnlFT3pGUFp1aC90Q1U0ZGhoaWhlUWhhT3B4dVpkRlQ4?=
 =?utf-8?B?bEtBVWNNM0xqS0w4WC9QUVUrRDlCMkNWbGh2MlZwWHI3UW1Kbm0wRmVJWnNn?=
 =?utf-8?B?MTZLTzI1YlVGbncydlBadVZqdFR1MldBWGpHZnZZV0p4SjFYMFgzU1Vsemwv?=
 =?utf-8?B?azRhc1lLN0gvejVvZHJ0STFLc2VOQ2ZFbHQ1WFdkMEp5OHMrN2lxNUNzVXdv?=
 =?utf-8?B?K0Y0WHpMQ24rVjI0YVJiL1p6dy9rMzl2TWNRRFE3amlPa1BPbXRxNDFDZDQx?=
 =?utf-8?B?dTFIajA4d2xQTjlFWTlCb1lGK1VpME0vbXdTRTd4TDRra1RZSjVQZS9ONFNz?=
 =?utf-8?B?S0tpakl4dGY3dXozWVpEYzkzUWdpeW9kaklTUFN4MUxnSVI1VG56aUtxU0lP?=
 =?utf-8?B?TlVMSlpCNHBSNDZMT2IvRW8xR0g0VWVtZURrK1JQK1cyQ3FUVElkN2xVZ0ZT?=
 =?utf-8?B?Uzh2aEtodHZrMEM5VkRQY1VKQmw5UWhaKzN5QXNwQTdpT2pLUGdkMGlIU3Uz?=
 =?utf-8?B?bVdtSnQ2VktjS3AwY1laQzUzTlc4SFJwd0VaQUJsdWRibTlHRHkzOGJBaTND?=
 =?utf-8?B?Q0dTTXk3VHBLQnZoaVdNRTdOMld5bzFpa0JDcjAySkdzMW5WUDZmZzhxdmRm?=
 =?utf-8?B?T3ZMWUFPNnRreUorV1ltbFl1UXI5aUhNUEczOTlsWG5RMjIwODRxQ2s1LzJv?=
 =?utf-8?B?WEdsYUNQZW92TGtuRzVXZWdrNU80WHFPRDlSUTFRRnB0VGpGZWVxdHN6OXZ3?=
 =?utf-8?B?QllQOEZWSkRsZFo4TUxUUm5VRmhCQUd6elpQTUd1N0ZDVStTVHpndW1CWGE0?=
 =?utf-8?B?dko0aXhkS2VHQUNBanNXV21tRGJDSUZoNjg5VmVrc3kzekxBQ0U1dHZVMGxs?=
 =?utf-8?B?ZVlnOWJLaHk1MzMrRFl2K0ZXSWhSTFU1eUl2RG94MCtWcHY1am9qd1pEOTRS?=
 =?utf-8?B?MWIxQVFKZDFDR2JreG5OWk1UR0pYeEN2citjQXg0KzVXOVhnc3NVVHloWlM5?=
 =?utf-8?B?bmdJSVg4aGw1VlFkRkJGU1Q4dHBsbmlPMy8vTlhVaGVmdTM2TXF0ckNNRTVk?=
 =?utf-8?B?dnZVK2JrVDNhdDFjKzIyZ2dIbHVyRWxORnFCdjhHZCtwdmRmMWVvb0k3U1Jm?=
 =?utf-8?B?U1gvV2U1R1RjNHdlbVBOaks5ejdrbFpFeHR2ZXE1cjY0WGpEV3hZNkwwbS8w?=
 =?utf-8?B?K1lKckdRN3JJNVY3dFJWMFYrL3hxQk11T3ZuU2FvcENFQ3o2Ym5Lczh6NGsx?=
 =?utf-8?B?MWhCOS94L1FsQVUxRm55WkxncUFiTjJIQi8rWkF5OUcxS0FubnJ4aXBDQ2pZ?=
 =?utf-8?B?RDFNVjlDOGRkTC9ySkxwa0ZienA3RFAxRHVzZ1NQTmR5ZDZWWkduL2d6QUtM?=
 =?utf-8?B?WWp4N0ZIeEhHclZuTG5CalpOQ0tEQlNxSGhIcHVRNkJOdDZ2bnF0NzFDeTZR?=
 =?utf-8?B?UTZOdjQ2aEZnM2JpajBSWGR0cSswZW8zY0I1VTVnSVJ5SlVmK3BHT1FjaDJY?=
 =?utf-8?B?eHhvQk5kZWhJbTIwUFBrM3NURDg3MklVUVhzSGVLOGNSc1FQTnc3Zm96ZXF2?=
 =?utf-8?B?V2VUZzl3Z29OQUJsYXcvNkdrK1g0eXZZK0F2cUFIT1BHeTJtd0Z0aDNjcjZP?=
 =?utf-8?B?Q2F3eUZlcEdtbTNCZm1FVUxnbm9jZnVCeWgvemZXelpXTlVOdGRXZDRuV0Iw?=
 =?utf-8?B?YUVtZGkzeE9hL3hhbHZRYmtXdEJZRmxoTk8wWVllYzlMQ1J5bkhaZTVkT0tQ?=
 =?utf-8?B?bU9BY2xWWTNuMkI0aEgzd0EzOXlEL0NvaDNlMFI4d0xUYUNSZG9helVCTnpG?=
 =?utf-8?B?MStHVWFHazgyMCtWcEVaaStDb2cxMEhBbmZ4M09QZUVJT0UxZHdjcStUbWw4?=
 =?utf-8?B?Mk9Ld3BZQTBNOFJKanZnMGJkeGJzT2NQTHNRS0lMZGRKK0E3aEdtZE82UGlR?=
 =?utf-8?B?TEFRamljUWRSQmZ2WEdhcXJ1elhNd2YrejB3VkF1OEtQQjIrREhpdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7494d1a-5152-4dad-bd8a-08de7907d933
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7051.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 09:32:55.2995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z+0WzFVfY81kgRQQJRTnn+DEudBt9jgwJ4GOVf0Y+yBLFQGOSkceCZAZt0NA27FLmL2qQ8AdzIaDUoWpP7MLOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8726
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
X-Rspamd-Queue-Id: 07DB91EBE80
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[victor.liu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_RECIPIENTS(0.00)[m:m.felsch@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:peng.fan@nxp.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:luca.ceresoli@bootlin.com,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:frank.li@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[victor.liu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,gmail.com,nxp.com,intel.com,linaro.org,ideasonboard.com,kwiboo.se,linux.intel.com,suse.de,ffwll.ch,bootlin.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:email]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 09:05:43AM +0100, Marco Felsch wrote:
> On 26-03-03, Liu Ying wrote:
>> On Mon, Mar 02, 2026 at 05:10:41PM +0100, Marco Felsch wrote:
>>> From: Liu Ying <victor.liu@nxp.com>
>>>
>>> NXP i.MX93 mediamix blk-ctrl contains one DISPLAY_MUX register which
>>> configures parallel display format by using the "PARALLEL_DISP_FORMAT"
>>> field. Add a DRM bridge driver to support the display format configuration.
>>>
>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>>> [m.felsch@pengutronix.de: port to v7.0-rc1]
>>> [m.felsch@pengutronix.de: add review feedback (Alexander)]
>>> [m.felsch@pengutronix.de: fix to short Kconfig description (checkpath)]
>>> [m.felsch@pengutronix.de: use "GPL" instead of "GPL v2" (checkpatch)]
>>> [m.felsch@pengutronix.de: add bus-width support]
>>> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
>>> ---
>>>  drivers/gpu/drm/bridge/imx/Kconfig      |  11 ++
>>>  drivers/gpu/drm/bridge/imx/Makefile     |   1 +
>>>  drivers/gpu/drm/bridge/imx/imx93-pdfc.c | 225 ++++++++++++++++++++++++++++++++
>>>  3 files changed, 237 insertions(+)
>>>
>>
>> [...]
>>
>>> +static bool imx93_pdfc_bus_output_fmt_supported(const  u32 fmt)
>>
>> As I mentioned in v9, can you drop const?
>> I don't think const is needed.
> 
> It makes sense to spot failures early. Albeit this function is very
> small, the fmt shouldn't be changed and therefore needs to be const.

If fmt is a pointer, then I think it makes sense to keep const.
Otherwise, it looks a bit over engineered to have const, since this
function is really small and no one would try to change fmt.

> 
> I forgot to add the double space fix though, thanks.
> 
>>> +{
>>> +	int i;
>>> +
>>> +	for (i = 0; i < ARRAY_SIZE(imx93_pdfc_bus_output_fmts); i++) {
>>> +		if (imx93_pdfc_bus_output_fmts[i] == fmt)
>>> +			return true;
>>> +	}
>>> +
>>> +	return false;
>>> +}

[...]

>>> +static int imx93_pdfc_bridge_atomic_check(struct drm_bridge *bridge,
>>> +					  struct drm_bridge_state *bridge_state,
>>> +					  struct drm_crtc_state *crtc_state,
>>> +					  struct drm_connector_state *conn_state)
>>> +{
>>> +	struct imx93_pdfc *pdfc = bridge_to_imx93_pdfc(bridge);
>>> +	const u32 format = bridge_state->output_bus_cfg.format;
>>
>> Can you drop const?
> 
> No because this function is not supposed to change the format. The
> function documentation says: this function can alter the bus_cfg.flags
> bit _not_ the format.

The local variable format is not a pointer, so literally the value of
bridge_state->output_bus_cfg.format cannot be changed through format,
which follows the documentation.  So, I think const could be dropped.

> 
> Regards,
>   Marco
> 
> 
> 
>>
>> -- 
>> Regards,
>> Liu Ying
>>
> 

-- 
Regards,
Liu Ying

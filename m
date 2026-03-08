Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPo+KBiErWkx3wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:13:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B04A2308EC
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:13:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A68910E14F;
	Sun,  8 Mar 2026 14:13:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Qx8np9pE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012012.outbound.protection.outlook.com [52.101.66.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0933E10E11E;
 Sun,  8 Mar 2026 11:43:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jHEXxeXJ4ACVCd5fCRUxtgDziAI4n0dsTXbk/si0N3zrZ9xb9pig0oLrB1QSvVBO579h8r5+kmUDPWElAh9Hvh63/S79yojaVS/oaPKkpZgmDBpBARW3B31Jlvq7O008DQakQp51RygvJDbfAaFjYOUPa5EzuKaz0RwJDSjIPMg/41OF7cFDrdtw421HR2c78KRCwngHMbFe7qPtLcHiWl/RQ+krD8DKsQ/n8Zp7LDfJ8+XCj2v8wTHs/OwQs0yYhXUYNElFNm11nQ+ztL0hmxJiphLLryDCrOnXsnj3LLUoCxYq80SdQFfo8hjJOlNObcGGIyAxPkbBehB1aPfpkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ab3ARAUpx7fssS4qiZyZNKkg0dNFA1rk3Ias2WIwOk=;
 b=AfP8xnIB/6fvabmXH4QFSzkfqIPoBMpZXJJt3oNXIRWTw17Z4EwTT6a15TZXX+gctmoPhI7AGS4oN1Hu6765dw+HrNR82+ItNM3YgxLq79EuHllMXadEFJr/67KsxL3SgUhW83x8E9AOfb/97biqSH6aoymEQtZ4kgHx/RWGy+0Xt+U2MsKlCkoYisgpgflR+Tldm3QRKP7NqiR+p2VrMOINgYBuFbDdBpqHUfNWeT4n8xlL0KVufFQMa4tp3CEItY2Dt4+SvHlzzL8Fwr/e9MPHvpwxkNwhJk2eEv1RJBWRKNt15wwse+WQi/eLewiJkYe9ry1u7c9FsF4/3dIEaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ab3ARAUpx7fssS4qiZyZNKkg0dNFA1rk3Ias2WIwOk=;
 b=Qx8np9pEglrpF2sMtvCnA+QFtvhKC7PTPEYwwzTFSJ7exNyl/fvGav3ORa+n4iSpW1etyZrDz01JksZ8PsIazo1cpPyL39gZBqGydap5ZULUwaolvJTw9AwGRpzsJfwa80tG0tMISBAehVUB3eDg4txb3wge3wje/ijI6x/hTgshtLaF0ejDg2LxJnVTtExObuKZGS7AS5zdQ4KlrkS4DcAuRxVxHCaxzTZ1LBVxtOAlkJyfpKIeWIAS+oN2HwHCtIslNu5ExoY4Nbp8GEbJBSg1VEzZaD+cPTC9qE1M3kKDNkaKSyP11ExblkJfvnqLF1+Vs0cXEABfOfO8J++xgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by DB9PR04MB12426.eurprd04.prod.outlook.com (2603:10a6:10:614::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.23; Sun, 8 Mar
 2026 11:42:59 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.023; Sun, 8 Mar 2026
 11:42:59 +0000
From: vladimir.oltean@nxp.com
To: linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Shawn Guo <shawn.guo@linaro.org>,
 Yixun Lan <dlan@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Kevin Xie <kevin.xie@starfivetech.com>
Subject: [PATCH v2 phy-next 02/24] PCI: Add missing headers transitively
 included by <linux/phy/phy.h>
Date: Sun,  8 Mar 2026 13:39:47 +0200
Message-ID: <20260308114009.2546587-3-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
References: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0038.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::8) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|DB9PR04MB12426:EE_
X-MS-Office365-Filtering-Correlation-Id: a64f8eaa-0de0-42be-a53d-08de7d07d921
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|19092799006|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: rMTJBrfrgCL4EMeg/HBFsYmPZMqtvizJDD0PymEIBTtktRUQFLeW/1JwqFObrWyuHXshtWoQbv1949kRjtkhMZQI3gB/Xr2wykQ3uPY1hOs5rcF0wi1HEDBJ/sygc65/2MVU7VfHGD0qdbyvCuFErc6KvQCrHpBVT7h56l6GTC0nToFMTsYSeEcRsFG8B1tHiZ2KT2t05TYb4lhbTDGhUoFA8AaDWyeLF5RsWGzrSaWI70XyF+gDRufZOEnQo+cckzAMNVULshYgzLSdXSZtvkFxzsRjEP6LpDpcf5oRE2G/Uvl+eWUwM20KliqYyYIyojTi0a9CGpu+X3gxGgiQODA1lbgg14KfdOTLryWHhHfVTPjBFDpvvOwcnDS30zbAbOaUSg2EPlWZx2Jpq6hR4w/Ua+CB5+PCj/QBKPweGMoPtvLyKPzTlgoRv95CDF56fsVGjzVR8IHEQTaXp+Jhx5YcDXQWo/FUdTebgGPMzpvhpRemKcu6dXXFxpysr6qX8Yqb8p3Z4YutL+6DZfkVrwYgV9lQ5FllzVVg39g6G22O3c59PBQf0Vg9B3kmc900eXFIzY42nYdJgLWG3D21AhJIc0PiotBcvLOuQfB0MtZYHOtsQ9dHhowCVm0NXzwHiLzHXE3ntdYKisawcC0myY37RRHgNl/5nTRG0zQ0tzhSUC1oXCIWAX8zp6598Z6Je80gRF/sAZbsdWGifaO1Kq4SoMEDM49Oz5kzSyJgJ24=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8585.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(19092799006)(10070799003)(1800799024);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUxxdUdxVzJNRVN2ZzZDUVg5TVM3SlNPUDZ0MUptUysvMzZWaWtUblBRbkR4?=
 =?utf-8?B?SUNqU0cwem5zbGdwaGNkZ0graEd5bVk1NnZnampkOHgzcW0yaFJwUzdxTUpr?=
 =?utf-8?B?WlVGdkplZEF6Ym9SZGpnK2xUZU1Fczc5WFZ4NjdTTEtpNUkzaVdGQSs1UWJL?=
 =?utf-8?B?TUNZQ1NiZTFrZUZQQjNzVGsxUGQ3M2pFdkhjUEdPLzU1RXdFcHFLMUVVWUpW?=
 =?utf-8?B?Ym4zamFxeU1zVmNsbVpvc2NzZEl2L1BmOGM4NnJnOHg3M0NleGQvVmNmaUVh?=
 =?utf-8?B?L1NER0xRcFVMekM0c2c3Y3FDL2hDNllhMGlqTmxkUjU2RTJPSm5Cd2hISW5s?=
 =?utf-8?B?b1FFeE1xZ1JvZlZZbDNjNmFGUU9VVVFBRTF5U2w4U1NSR1F2c3NqTW9LcC9z?=
 =?utf-8?B?bHA2UW9Yek1NN3k1TmtRbWFMVm52T0hTczJ4c2tzdDQxcVpiazNhVFFBN3cv?=
 =?utf-8?B?eEQ1bXlxUDI4STJ1RmI1RHFFT1B0MTdkT29zTElOZlAzMTVaU1RTK3B6a0FT?=
 =?utf-8?B?SHlGcldqRDdnM3ZGUUpHMFovZUpCTEt1Z2s3MFNzTlF3TmtRSU94KytXekZp?=
 =?utf-8?B?YU1SMDh0YUIvdGJ3L0xFMUpBMUVKQ1dYRktHd3pOeU4xMWNPWXhtSko0NTRC?=
 =?utf-8?B?ODB4ZGl4M3dXNmtwOU0zbEc3UFhPOFU5MGZiOG5NTVFHU1g1ZzVvSHVnNUQr?=
 =?utf-8?B?eWVoL1pvN2xaaktlaHUrZVVrd2NIWFJOd2EwRmI4RXRWTGYrYWtDUm8ybTFV?=
 =?utf-8?B?N0dIZmNHWUZ6aXNSaEFjdjhZenFrSXplZndvS2RYUWdtaEFpdS9FNkNUZ0VX?=
 =?utf-8?B?MkJ2ZVBpS1gzMzVoNXh6VTVmTkF0WENCaVRjTkFJY1pOckNvVzJSZWE3eG5Y?=
 =?utf-8?B?cVBJQm0wZnFLVGVYTUxBUFVRQnV5dy85dDdBTDNJYWtVdGVUMDJ1ODNvME9R?=
 =?utf-8?B?QmZoQVg0VHpaM0lhaGNPamhBWEpGWWVEUEk5MTdSRTU0ZWJHNXB5UWhIalh6?=
 =?utf-8?B?d2lMbUF5a0lSK0JVUE9uOU12SU5jQ1JQcVFFQklQby9aV1Y4cDFHY1hLSDFR?=
 =?utf-8?B?M3BQbTh1dXdWNWRuRW1jUVcrQkdXN1lMUkRldDZBM2RTVWprbVRRVG9MY2V5?=
 =?utf-8?B?eTh5cnhWTm5iTTVpNEsxMzhHWUFmQlhlYWRRTzM5bVVOc21DTEpTWDBKaHR1?=
 =?utf-8?B?Q0FmQi9OWGtBb3ltR0duTjZpWWhqdy9SQlk2STV0MnJRczRCWGQyRmgzSVJk?=
 =?utf-8?B?aEgzS2Y0UnAwR0VNQUdNVDRMcGNZVTZka3FCT0hpVHJlRWplOC9yT3hzWlY3?=
 =?utf-8?B?aERLV2NsSWZGaHVrODVNVzlPalpmUFF6Rysrajl2K2JGcElvZEw1RUh5bVRY?=
 =?utf-8?B?Tk9kZVF4dUo0UE1mN1p1bmlHQ3F3Tk5MZzY0VVZReXMxeUlqZ0JCWDlJb3Jv?=
 =?utf-8?B?OXFqb0h1WkNzT3ludlhuZURDV25qbkd5NEdwdU9lZVpudzlQQU1CakJPb1pE?=
 =?utf-8?B?US9tZFFnbUZJZExrTElveGZKdVdadWhDMWZpNjVCaWdKTkpiczJrWmFxZVNF?=
 =?utf-8?B?eExtaVFMTytsWVF2NnZkRFlVYnRVZHY3alpNNEV6WEF5Y1F6UWdsdW14NFpF?=
 =?utf-8?B?NVFZVi8yRlRNTmZCR3BRdHQ0eEIvNW5zNlRwdlBPWm1DZ09MOHZwVm05Q216?=
 =?utf-8?B?eUxqMGRjbFFaQXZUbHUyYi80Qnd0MXZQN0RicGc5ME16czkyZDBmM2YwSGNL?=
 =?utf-8?B?T3BuZ2NCZ1dLRjRUWVM4MXRyRjhGMERPL2lzVmdyanJYTENXWjIzcG1hMUNa?=
 =?utf-8?B?aTNBRUxrRXo2aG9wTWdmT0QwckF4clNzQ0d3QlRPMm5nRDNvT1lDckFhcVRp?=
 =?utf-8?B?M1lScEQxdkNBcEp5aG1hMVlBaUM2VmIzMXo1aW9ldHZmb0dWVGl3aW5kTlAw?=
 =?utf-8?B?SEVtVDQ1UUx4QmhsZGJBT2REYUltbEljRzBoOElEaFMzUFFIdXpaOEgwRDlH?=
 =?utf-8?B?UklYTnJlRnNIb3ZCOGw3bVhmTEZyUGUwSUhmM0hYcnZ0bFdSNTYxQXNNTkRI?=
 =?utf-8?B?OE1zT3l2YmphNDE1SU83cU9wRUo4OFIyaHZnOFN4Z2xyOGFMbnQ2U2ZlQXpE?=
 =?utf-8?B?REJkZWRKcHdtRnkvL3ludG5jalZkWDdmR0ZiTVpTZE45L2FiVHBSbng0T01p?=
 =?utf-8?B?ZjRBbmRaWUhXV0U0Z1ZmYU9qZmxwMWswK25iVm56N2JQdTVYMHVRalBwUTh4?=
 =?utf-8?B?cXpTaVJVc3JHMnF2MXRTTG5COU1mTWduN1FNemYwaXJOYWUwVlNsNVF5VWU1?=
 =?utf-8?B?Wk1JSXJWVWxFYlVXUHE2ckNiSTRsckdMeWszQUFLMXhhTXBvTjRmcytTeUlv?=
 =?utf-8?Q?zl6xzG8kx0X0kT2sM/FzERGW6BNaFUzR0gL6d7tAiZYH9?=
X-MS-Exchange-AntiSpam-MessageData-1: 4iipieBFgp8rSE6KI24EHvdie9zmfgs+7IY=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a64f8eaa-0de0-42be-a53d-08de7d07d921
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2026 11:42:59.5508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sFUQVrqXOqVsbov+Zd2xTVbFJ1gpfuYtSo2bW6XPP0PsoxsfZTlsbrn8IDcujBnaAFGHtmXYrIq6tVPr5ED/ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB12426
X-Mailman-Approved-At: Sun, 08 Mar 2026 14:13:21 +0000
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
X-Rspamd-Queue-Id: 3B04A2308EC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip6:2610:10:20:722:a800:ff:fe36:1795:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[35];
	FROM_NEQ_ENVFROM(0.00)[vladimir.oltean@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.983];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev,microchip.com,google.com,sntech.de,gmail.com,nvidia.com,rock-chips.com,starfivetech.com];
	ASN(0.00)[asn:6366, ipnet:2610:10::/32, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,rock-chips.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nvidia.com:email,sntech.de:email,nxp.com:dkim,nxp.com:email,nxp.com:mid,starfivetech.com:email]
X-Rspamd-Action: no action

The tegra as well as a few dwc PCI controller drivers uses PM runtime
operations without including the required <linux/pm_runtime.h> header.

Similarly, pcie-rockchip-host, pcie-starfive as well as a few dwc PCI
controllers use the regulator consumer API without including
<linux/regulator/consumer.h>.

It seems these function prototypes were indirectly provided by
<linux/phy/phy.h>, mostly by mistake (none of the functions it exports
need it).

Before the PHY header can drop the unnecessary includes, make sure the
PCI controller drivers include what they use.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Acked-by: Bjorn Helgaas <bhelgaas@google.com>
---
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Guo <shawn.guo@linaro.org>
Cc: Yixun Lan <dlan@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Kevin Xie <kevin.xie@starfivetech.com>

v1->v2: collect tag, adjust commit title
---
 drivers/pci/controller/dwc/pci-keystone.c     | 1 +
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 1 +
 drivers/pci/controller/dwc/pcie-histb.c       | 1 +
 drivers/pci/controller/dwc/pcie-qcom-ep.c     | 1 +
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 2 ++
 drivers/pci/controller/dwc/pcie-tegra194.c    | 1 +
 drivers/pci/controller/pci-tegra.c            | 1 +
 drivers/pci/controller/pcie-rockchip-host.c   | 1 +
 drivers/pci/controller/plda/pcie-starfive.c   | 1 +
 9 files changed, 10 insertions(+)

diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index 20fa4dadb82a..642e4c45eefc 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -24,6 +24,7 @@
 #include <linux/of_pci.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/resource.h>
 #include <linux/signal.h>
diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 5b17da63151d..e0079ec108ab 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -21,6 +21,7 @@
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 
 #include "../../pci.h"
diff --git a/drivers/pci/controller/dwc/pcie-histb.c b/drivers/pci/controller/dwc/pcie-histb.c
index a52071589377..432a54c5bfce 100644
--- a/drivers/pci/controller/dwc/pcie-histb.c
+++ b/drivers/pci/controller/dwc/pcie-histb.c
@@ -18,6 +18,7 @@
 #include <linux/pci.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
 #include <linux/resource.h>
 #include <linux/reset.h>
 
diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 18460f01b2c6..e417122da51d 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -19,6 +19,7 @@
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/module.h>
diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index be20a520255b..dbec159fd458 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -15,7 +15,9 @@
 #include <linux/mod_devicetable.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/types.h>
 
diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 06571d806ab3..3378a89580ab 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -27,6 +27,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/random.h>
+#include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/resource.h>
 #include <linux/types.h>
diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index 512309763d1f..a2c1662b6e81 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -36,6 +36,7 @@
 #include <linux/phy/phy.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index ee1822ca01db..46adb4582fcc 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -24,6 +24,7 @@
 #include <linux/of_pci.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
 
 #include "../pci.h"
 #include "pcie-rockchip.h"
diff --git a/drivers/pci/controller/plda/pcie-starfive.c b/drivers/pci/controller/plda/pcie-starfive.c
index 298036c3e7f9..22344cca167b 100644
--- a/drivers/pci/controller/plda/pcie-starfive.c
+++ b/drivers/pci/controller/plda/pcie-starfive.c
@@ -21,6 +21,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include "../../pci.h"
 
-- 
2.43.0


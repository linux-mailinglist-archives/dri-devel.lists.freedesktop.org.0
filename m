Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PdMMuk5qWka3QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:08:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA8220D26A
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:08:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC1510EB47;
	Thu,  5 Mar 2026 08:07:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="oHQFcF4y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013064.outbound.protection.outlook.com [52.101.72.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190E310EA87;
 Wed,  4 Mar 2026 18:00:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TUYdgzV7t08prSbTTkZWHg0ZZpcdq81KcezwJFiaFXlxyaxphoDiZT5nBGZsQgVCQ6pGvPXAFp0Gn+MbfvKc0gE1KynG811r2FAP3Ux5hJOndGojPJND6cBetZ+g0xIWcu0gJw6eKEennWJopvqw2sg3J5EcMND+1mwsH3joK5emAFKStncX+vVMsAV2KXgl9pxQMoTb5C3z6lugwwn7LeNNUwxKuG9tHyBXoLkC8yi67oeA6xOrGjFL9LmQFI4fDqMc3oi7Hp+vDf+axZ1QwbqucdiqTiCFPwKLFLx9xNj/wNQqEq3ZvXVKgyQxwS3jKJaZJ1GZtdqrVMZgARme6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wu8+juvPkgSTo1qlkiDDqLUNWPNXq/A6hQ/aJhPh6r4=;
 b=U+4Rg0A1rhWdXMviEtXXgmM6Jta9WVrUYpBfMVe4T5/0PLKRqibkM0yuG8/Rm5mMxmvkshGyjf0CpEvTN9Csc9Jcpq7g342iqn0XlWjL8IKvScwvDpFODJsl7dK3MyVXo+cxWOx2arLII0HDRqHY+1YHvXbTR+IXbpo7ilYB9U013frZG21Nqmc15jEv688uhYZBZseGSFhBy0CD/Cot0pIxnehdm3YYCc30qzarCdnGyXPBO11wfNnIyk3J3sTE3wBjOQGmIgLEhEp+PX3+OTwvh/1Ky4Y0j7PnF5N3W9z8Zy2FvXl/73hS4AEcmM9YL6+BiatwDjCgKOviQoWKtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wu8+juvPkgSTo1qlkiDDqLUNWPNXq/A6hQ/aJhPh6r4=;
 b=oHQFcF4yHJkng/Rp6u/sSh/Qc9O/3Jm+K3hpKG3AO3gLA0ei3hNwQ70pn30xWS9HYfDKim5JIcniZPzC5EpV7fHihgVxfKThb40L53r0EsdRAR62rRF6Jy6X19v9Fmv01/Hn0B27f+1CSt0f4XQuXGabVyAr4FKqFmXQPPgyI9xtQtzeOUYpStRMPHGn+5LNbSJ3I3uyqMarhGBgxmMk0gYXt1mW5FlJ9XGqWi9lH5T1J9NgcMm+65fAlaxdyF6FLyIYdfLQaz/EsaPv2Q/94eCoNlAc2jy85dzysp2jVavJuYpR2FNUQzYd7mzSBmxdGBcuMHjgXDNOqBV227vUBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by GV1PR04MB10275.eurprd04.prod.outlook.com (2603:10a6:150:1ad::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Wed, 4 Mar
 2026 18:00:10 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 18:00:09 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
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
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>
Subject: [PATCH phy-next 08/22] PCI: remove device links to PHY
Date: Wed,  4 Mar 2026 19:57:21 +0200
Message-ID: <20260304175735.2660419-9-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P195CA0030.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::19) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|GV1PR04MB10275:EE_
X-MS-Office365-Filtering-Correlation-Id: dabb9cec-f022-49fc-c266-08de7a17dfdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|10070799003|19092799006|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 2PA0Vsl992cRBLFD3SRaSnOP7tdoBiIsGWqLDRq2ZbyYSxWZFe1lnoy6JVtDaIvGtNmJR184KEqNJF+Vpqfwu3tv/p9S78ZpRBusVLSID85lPVjJzJDB74kfs7VjA6hhu/HDASG84visc4vcg8W5BowEetsS4DMavm2ejzOoVX8n+uH07NL6Z3xTF/pytcQ8VlrHv2WG20/IIabngFDOVP/CloHicWhH2oVJ+vaHLk/bZKXsQqP+SS193Yebsu02rnh6SkxUt3vOBPBkpC2jclz2gpSF0nAByMBJbUUwYAHuH4L1HvFD+EXKf6zyDOGDHgDyWO1Ca2G5QVZzXyUJijducGgQmrTY9NOYden6Mqx6AmIIKB75cdt4/PLcUxEZHjLhgc0lGcNhbEcZldQgHBwkTKM8Ex1UZOyczsiCM5PnCsFB/Qsi5gcwQVzp/05ulAJY4KTNmhS5/zoqJDoeGbORxsMf4Xe2ZYR2Ju9ZrtExWbI3sB1WHwvrZXtZCNjt1vYiWZczMeTW9/u30M3xn5sdsRWoQCxoVv5yeMSrvS0GmBYC3sC7m4SnPAxeNBIuxH8xqrIqcC7eAwTK2F0etzMqAKmQD4TbjChBUAhTQLEzkj/pZ3ANU69OPwxm5Hd8HMjgYM5EEGvOlmgJ1d+TMVpDGtMhyjras5RGvy782HTacAxlqu66U69VJvbx5y7rvqEjwj9b2zMF+pQMgtdnZw/Be9LBqWKUBwPEdQlbRBA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8585.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(10070799003)(19092799006)(1800799024)(366016);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUpqdzJWOHdxWHNEQm9vcnpKbENSS0JCRmg0enNTTVpjcHl0SUZXdHRPREM0?=
 =?utf-8?B?Q25mL0toMjVUd3Q2akJQYlYyOWkwVVhxVjhNNHRzbHBjcFhIUWxCK3RyNWpX?=
 =?utf-8?B?UTF2ejJZT1ZFYnNuVTUwVGhFZXBhSlIxbCtwMkdyUlRTUE1JOUlZMVlTK2RM?=
 =?utf-8?B?citMQnV2TW1XdnY1c0VTOTc2ckdmODM4bjJDaFJaUHhMTW9TT2U4dTdLQm1I?=
 =?utf-8?B?RGhEVGFQRVpSUHJqczc5eHpsOFUvOEpVUlVuUC95UUFMcXF2N2gzU0V6UnVm?=
 =?utf-8?B?b1QwNXJtdFdSY0YxR0F1QUVmdWsyUGxVOW92aWtNZEJLb3BRU0taaUtZT2hR?=
 =?utf-8?B?OG4yU2NIZzlFa0FrTFdUZjhiOWJ6THJkb1JBbDA5WTRBNnE0bEdlQVFmZjhk?=
 =?utf-8?B?cUNjSnZ4Mkh5NXp1REVyc0I5dVhDdU9pM2REREVDQVU2YzFISXAzT0krUUVY?=
 =?utf-8?B?OHZPR1YvN1B4WFhrN3BuMmIrVTF2U3NVM2dRaUFwb01sU081eVczbVBSMG1n?=
 =?utf-8?B?aEE4RHE1ZWJTZG9WVlltc3gydFczK2ZoK21XcmRmbFZKU3ZYVFI4STZDM3pO?=
 =?utf-8?B?M0dJcW1wUzBubVNnWkdjNyttd3AwMjZHalVjeWxvbjA1NUs1TFJRU3NOS2R1?=
 =?utf-8?B?aXJQSksxV2xHUXNwZFFhRW5xdG1URkVnaldhY3pjR0U5VTFnbkFSbGZmUHZX?=
 =?utf-8?B?aXV6S2Z2OG9JL2J6UmFjaUZhdVFXbEF0SWNGUktwc0h0Q2UvYXA1MjBHT21l?=
 =?utf-8?B?WC9mMGpNaVkxTEtyQ0UrajkzSXJlKzRCNkNuaEsxV21DNE1HR21tN1VCVC9r?=
 =?utf-8?B?a0U2NHYxTVpyUmIrZ2pHNjhkVmswQVkvUjl6THZ5ZEEydlAyaXNaVTJaL2JI?=
 =?utf-8?B?ZTBtb2xoRlV6ajN4K0ZlWWYxNjQ3TUtOaTBza1ZtWUM5T0dGYjRtNVl5akJN?=
 =?utf-8?B?TDc0bWNVWFNpZXc2ZDVQLzZmMk9KQWQ2YTBwVGpnWW91WXg1WEFqNERnektK?=
 =?utf-8?B?UWJJMGtRYk4yV290QzJ6YUhlUzg0Q1pnWEZjSHV4Q0U5SzdmYnZPSVgwS1BJ?=
 =?utf-8?B?ME5jL1EvUm85NHcwb0o5cVdOellDOHZrK0FSdU03K3NFUDJCaTkxb2JFYmln?=
 =?utf-8?B?V2R4ZGhlUXpMTXBxZlhxcUd3Mm9USG1PbC9yY2ZaM0I0MFFtWm5DazdGd0Jw?=
 =?utf-8?B?RDJBRTNNVlVzSkJVRHNtRFNGczlHK0pIY2djYmpSV1A5aFE2ZHNCbnRSNTM5?=
 =?utf-8?B?VzNwMGZKeHQ5RmZ5SjR4MnNIRXMzY3p3TXZna0dTbWNrbUNPM1B2NjBPUEFI?=
 =?utf-8?B?QlVqSjkvUE8rODY2ckxudmY3S3BQYzBrVkZlUWdZYUwrUGVQc1FCazB3dCtN?=
 =?utf-8?B?K1k0MVhCSlpzanlKSGJ2bzlWa2pFci9NL0xvbGxxclk5cmc0NWYrdXl0SHhx?=
 =?utf-8?B?SVBvaXhMOVF3cWxNbFQvRWJncW8xVjU3VXdFNVFuVGE3aE1tM2tEQWV5SHZq?=
 =?utf-8?B?d09HOW92Y0pXS2xGYnp1SUpVcEo2T3NHZzhPdTFUcE93RUsyajRNTk5CSDBB?=
 =?utf-8?B?LzZaQ1NEUXNiN3hScnF6eFlvdFVNY3ZMN3BLNjM4cGdXUndpYlZZbmZ0cVRR?=
 =?utf-8?B?cmtXRDhTVzI2M0FlZDkzV20vaURkd1lGQVdwN01sQWphYWVJSnljS3N4NGVk?=
 =?utf-8?B?aDVWTCtoNDlhNnB1M1RCNDVtSHJlKzZyUG5OdUlZeVo2T1hZZXhOR1cxeTdV?=
 =?utf-8?B?WVVSQU0vNm1ua1VhS3pVVGJXaGdhKy8yM2NYa0YyZ3RBYVJYY2VQSlBzemFo?=
 =?utf-8?B?NmtzK2ZCR0JPc0pFalJocUgzdUpJY0JwLzc1cXNLc3llYnByaGtqVzhpaHJQ?=
 =?utf-8?B?eWJjVWJsY1JHbVFMWFRXYzc5QUNkSE5wOE9pKzR0dGwreFF4cHluVlB1ckt2?=
 =?utf-8?B?RzNSczhGQUJwaHBUSVgxRVY0Rk1mYlh4VXU0bWNZS2VXbm5QOGlWWHE3bGFG?=
 =?utf-8?B?TUFVTjhlQ3hRa0NmWGpmU1hKY2VGM0k4YzRXNUtVWi9uMURGOFZqYUtuWkpU?=
 =?utf-8?B?VndUZGtpNm9aZFl4aUtPYW15VEtSemtmM3lvMlk4OTdlMjM3M1NFQ1NpK2xO?=
 =?utf-8?B?bEQ4S0JBeEMvMXEwWlVrWFhNeW8vRlNkd2VtOUxXa0JEUGM3byt4TGpOM2JH?=
 =?utf-8?B?VlErTnJLc2JZOVY4Y0RjQytrUlJDRnNET0VGVCtKNFUvNEZuR2pETzcwZkZl?=
 =?utf-8?B?UkxXTjVIODV4UytyZWxLUUNrT3F4T0tYS2ZSb3NFanByTS9yYTRKTGlSK05r?=
 =?utf-8?B?TmJUdjlmM1hqdnRnc0RyZW5lQ2Jpc0tZM0VYUWJGWWtYT3FUQXM5S0FJTVEv?=
 =?utf-8?Q?RS7pP+b+Mmo/yf0m//jvsl/8Wk8qYD9KAQbKExNVO0vll?=
X-MS-Exchange-AntiSpam-MessageData-1: KGhhKg0m8g0k1R+nZSzMYLFuKpTI7zCn0M8=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dabb9cec-f022-49fc-c266-08de7a17dfdf
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 18:00:09.9380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OOz510zNoXbotf9SyjbuOnfrAwSxk6mJ4fwMqjGLvJzqq7hZLf6JQjA2FfXtcqHMi+xwGtPtJ5cZo3jXmpS/Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10275
X-Mailman-Approved-At: Thu, 05 Mar 2026 08:07:48 +0000
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
X-Rspamd-Queue-Id: 5FA8220D26A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.oltean@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+]
X-Rspamd-Action: no action

This is practically a full revert of commit
7a4db656a635 ("PCI: dra7xx: Create functional dependency between PCIe and PHY")
and a partial revert of the device link pieces from commits
dfb80534692d ("PCI: cadence: Add generic PHY support to host and EP drivers")
49229238ab47 ("PCI: keystone: Cleanup PHY handling")

The trouble with these commits is that they dereference fields inside
struct phy from a consumer driver, which will become no longer possible.

Since commit 987351e1ea77 ("phy: core: Add consumer device link
support") from 2019, the PHY core also adds a device link to order PHY
provider and consumer suspend/resume operations. All reverted commits
are from 2017-2018, and what they do should actually be redundant now.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 drivers/pci/controller/cadence/pcie-cadence.c | 16 +---------
 drivers/pci/controller/dwc/pci-dra7xx.c       | 16 ----------
 drivers/pci/controller/dwc/pci-keystone.c     | 31 +++----------------
 3 files changed, 5 insertions(+), 58 deletions(-)

diff --git a/drivers/pci/controller/cadence/pcie-cadence.c b/drivers/pci/controller/cadence/pcie-cadence.c
index a1eada56edba..0ac980249941 100644
--- a/drivers/pci/controller/cadence/pcie-cadence.c
+++ b/drivers/pci/controller/cadence/pcie-cadence.c
@@ -222,7 +222,6 @@ int cdns_pcie_init_phy(struct device *dev, struct cdns_pcie *pcie)
 	struct device_node *np = dev->of_node;
 	int phy_count;
 	struct phy **phy;
-	struct device_link **link;
 	int i;
 	int ret;
 	const char *name;
@@ -238,10 +237,6 @@ int cdns_pcie_init_phy(struct device *dev, struct cdns_pcie *pcie)
 	if (!phy)
 		return -ENOMEM;
 
-	link = devm_kcalloc(dev, phy_count, sizeof(*link), GFP_KERNEL);
-	if (!link)
-		return -ENOMEM;
-
 	for (i = 0; i < phy_count; i++) {
 		of_property_read_string_index(np, "phy-names", i, &name);
 		phy[i] = devm_phy_get(dev, name);
@@ -249,17 +244,10 @@ int cdns_pcie_init_phy(struct device *dev, struct cdns_pcie *pcie)
 			ret = PTR_ERR(phy[i]);
 			goto err_phy;
 		}
-		link[i] = device_link_add(dev, &phy[i]->dev, DL_FLAG_STATELESS);
-		if (!link[i]) {
-			devm_phy_put(dev, phy[i]);
-			ret = -EINVAL;
-			goto err_phy;
-		}
 	}
 
 	pcie->phy_count = phy_count;
 	pcie->phy = phy;
-	pcie->link = link;
 
 	ret =  cdns_pcie_enable_phy(pcie);
 	if (ret)
@@ -268,10 +256,8 @@ int cdns_pcie_init_phy(struct device *dev, struct cdns_pcie *pcie)
 	return 0;
 
 err_phy:
-	while (--i >= 0) {
-		device_link_del(link[i]);
+	while (--i >= 0)
 		devm_phy_put(dev, phy[i]);
-	}
 
 	return ret;
 }
diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
index d5d26229063f..b91ab37845c9 100644
--- a/drivers/pci/controller/dwc/pci-dra7xx.c
+++ b/drivers/pci/controller/dwc/pci-dra7xx.c
@@ -9,7 +9,6 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
-#include <linux/device.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
@@ -683,7 +682,6 @@ static int dra7xx_pcie_probe(struct platform_device *pdev)
 	int i;
 	int phy_count;
 	struct phy **phy;
-	struct device_link **link;
 	void __iomem *base;
 	struct dw_pcie *pci;
 	struct dra7xx_pcie *dra7xx;
@@ -731,10 +729,6 @@ static int dra7xx_pcie_probe(struct platform_device *pdev)
 	if (!phy)
 		return -ENOMEM;
 
-	link = devm_kcalloc(dev, phy_count, sizeof(*link), GFP_KERNEL);
-	if (!link)
-		return -ENOMEM;
-
 	dra7xx->clk = devm_clk_get_optional(dev, NULL);
 	if (IS_ERR(dra7xx->clk))
 		return dev_err_probe(dev, PTR_ERR(dra7xx->clk),
@@ -749,12 +743,6 @@ static int dra7xx_pcie_probe(struct platform_device *pdev)
 		phy[i] = devm_phy_get(dev, name);
 		if (IS_ERR(phy[i]))
 			return PTR_ERR(phy[i]);
-
-		link[i] = device_link_add(dev, &phy[i]->dev, DL_FLAG_STATELESS);
-		if (!link[i]) {
-			ret = -EINVAL;
-			goto err_link;
-		}
 	}
 
 	dra7xx->base = base;
@@ -856,10 +844,6 @@ static int dra7xx_pcie_probe(struct platform_device *pdev)
 	pm_runtime_disable(dev);
 	dra7xx_pcie_disable_phy(dra7xx);
 
-err_link:
-	while (--i >= 0)
-		device_link_del(link[i]);
-
 	return ret;
 }
 
diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index 642e4c45eefc..07698c645e02 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -130,7 +130,6 @@ struct keystone_pcie {
 	int			num_lanes;
 	u32			num_viewport;
 	struct phy		**phy;
-	struct device_link	**link;
 	struct			device_node *msi_intc_np;
 	struct irq_domain	*intx_irq_domain;
 	struct device_node	*np;
@@ -1118,7 +1117,6 @@ static int ks_pcie_probe(struct platform_device *pdev)
 	enum dw_pcie_device_mode mode;
 	struct dw_pcie *pci;
 	struct keystone_pcie *ks_pcie;
-	struct device_link **link;
 	struct gpio_desc *gpiod;
 	struct resource *res;
 	void __iomem *base;
@@ -1189,31 +1187,17 @@ static int ks_pcie_probe(struct platform_device *pdev)
 	if (!phy)
 		return -ENOMEM;
 
-	link = devm_kcalloc(dev, num_lanes, sizeof(*link), GFP_KERNEL);
-	if (!link)
-		return -ENOMEM;
-
 	for (i = 0; i < num_lanes; i++) {
 		snprintf(name, sizeof(name), "pcie-phy%d", i);
 		phy[i] = devm_phy_optional_get(dev, name);
 		if (IS_ERR(phy[i])) {
 			ret = PTR_ERR(phy[i]);
-			goto err_link;
-		}
-
-		if (!phy[i])
-			continue;
-
-		link[i] = device_link_add(dev, &phy[i]->dev, DL_FLAG_STATELESS);
-		if (!link[i]) {
-			ret = -EINVAL;
-			goto err_link;
+			goto err;
 		}
 	}
 
 	ks_pcie->np = np;
 	ks_pcie->pci = pci;
-	ks_pcie->link = link;
 	ks_pcie->num_lanes = num_lanes;
 	ks_pcie->phy = phy;
 
@@ -1223,7 +1207,7 @@ static int ks_pcie_probe(struct platform_device *pdev)
 		ret = PTR_ERR(gpiod);
 		if (ret != -EPROBE_DEFER)
 			dev_err(dev, "Failed to get reset GPIO\n");
-		goto err_link;
+		goto err;
 	}
 
 	/* Obtain references to the PHYs */
@@ -1238,7 +1222,7 @@ static int ks_pcie_probe(struct platform_device *pdev)
 
 	if (ret) {
 		dev_err(dev, "failed to enable phy\n");
-		goto err_link;
+		goto err;
 	}
 
 	platform_set_drvdata(pdev, ks_pcie);
@@ -1325,25 +1309,18 @@ static int ks_pcie_probe(struct platform_device *pdev)
 	pm_runtime_disable(dev);
 	ks_pcie_disable_phy(ks_pcie);
 
-err_link:
-	while (--i >= 0 && link[i])
-		device_link_del(link[i]);
-
+err:
 	return ret;
 }
 
 static void ks_pcie_remove(struct platform_device *pdev)
 {
 	struct keystone_pcie *ks_pcie = platform_get_drvdata(pdev);
-	struct device_link **link = ks_pcie->link;
-	int num_lanes = ks_pcie->num_lanes;
 	struct device *dev = &pdev->dev;
 
 	pm_runtime_put(dev);
 	pm_runtime_disable(dev);
 	ks_pcie_disable_phy(ks_pcie);
-	while (num_lanes--)
-		device_link_del(link[num_lanes]);
 }
 
 static struct platform_driver ks_pcie_driver = {
-- 
2.43.0


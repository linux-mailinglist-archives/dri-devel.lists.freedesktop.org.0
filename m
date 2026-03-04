Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WB4MMuw5qWkd3QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:08:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B90620D281
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:08:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE46210EB50;
	Thu,  5 Mar 2026 08:07:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Lr04GwQM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013021.outbound.protection.outlook.com
 [40.107.162.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44DCC10EA85;
 Wed,  4 Mar 2026 17:59:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zVjxfQT52nb0MpOgoXSusonG7HV/0TICgegzgkmanT7fwewNLkQga3Exlz2jBswUycCUIxQHAphPnRHPuVB6eV3ANWauCTNAksCF+SpfT8Y8l8xhpaGXmvO1Zd+rJqlfwaDdHCSjxvybRyQoBZzlxjuoTrsOe0wuzl/wwKYzTkJoslulwQYH1Jt5qHrk2BNeA/0NNjdsfAh+LPq0fSbAKy6JX5IhF6wMgl/1IVUdrbcMswxB4XY+rm09USPTekcIn637IM38XVDZz2CWBpnnm6H+86Vd4Y78Ih0VUnCLGOE2h76F9S4g1fGYsv+gerij90vUw8ZSEaj0AQ4a9OGkNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ceHfKrwDkaVZ4m9zNZBUXFNT+TcYWEWBtyTjhfMj9cU=;
 b=n9M18o3GGwtF/Sl1H60TyTrdkEJdmzI71pe5hEvrHxZFdW16vHlcAdpyVlKfWMIZmPuQ47zbGJNNgnOjIFH5woDdDo2Z90Dq0srf+7mxWhnhDlI6jJBj7vSHNZYd9mynkPguIUMN+aST5s/af0J+sLgbf6dcyJsjYMPAAqmdn9CAALZGvFLHIasPd2G8/OVcjs9TZrov+cWdLresEy57dbXSAtgsAIhRwhy7AEjBJmC5go7nnnpWUG0IVhlh8mpJZ5nrVQqiKfl35mX764+e+raW2lyyCCR5KRE8spCH2SoqEuRd95Tw/2cqxGouadxKtZM5jn48R26IKVVnqHV27Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ceHfKrwDkaVZ4m9zNZBUXFNT+TcYWEWBtyTjhfMj9cU=;
 b=Lr04GwQMSMzAYALP5MctuqoXmXPdC4QQu4jILcU8JZSeiid+bQNXkyptHop1A/D3HOYvb1DfJsgH5mYE3TQhCjjXVRwx8xVkCZrmKdSro7wMJyuYs8EQAI34hgy0+GzVI7VC7r2QWndRuFpL2JkmkzbYpuhOLhGGYF8jNlafwpFwTJRm5hATmX+ha1XdtYG2ui9tutsaqdydxwFS7+7gO1PoH1SGc8tylzx/7JlSVPkpXblM7JfGZRJ3mMna3+Zgx9jzlTnmp9vZ57CIwUz7qfPX5b2egW61p7qXbCzybkSvIGavAHlCS0UmXDmaxKf7XQS2raYOHFy5Ik93Y0z+wQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by AM9PR04MB8778.eurprd04.prod.outlook.com (2603:10a6:20b:409::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 17:59:55 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 17:59:55 +0000
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
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>,
 Shawn Guo <shawn.guo@linaro.org>, Yixun Lan <dlan@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Kevin Xie <kevin.xie@starfivetech.com>
Subject: [PATCH phy-next 02/22] PCI: add missing headers transitively included
 by <linux/phy/phy.h>
Date: Wed,  4 Mar 2026 19:57:15 +0200
Message-ID: <20260304175735.2660419-3-vladimir.oltean@nxp.com>
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
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|AM9PR04MB8778:EE_
X-MS-Office365-Filtering-Correlation-Id: e527be39-3114-4308-110a-08de7a17d783
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|7416014|52116014|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: heHpzibL5yMUPRIdgqqyA/uh8XF6rOwwrWh8P/m60Mu8vDZueugso0NxEQSwJ2yg6GBxNo+m3xK8sc8V/OAVe+OE36IDqZEnBuM5+NrJSvMc7NsN1G23x4VvqZwsLbwJjuaFTxk+oZmhR5gIIxjEWvsV7KybvUJf8pkUyEnH4ZbHeqmYhM65JfK7+lbIRdk3BeLY4rCwV4IoH3RrUK0eGkQGa4iHtT+KahX1erhxFexE6/FZFtE0IfSDFdb/0C6JuEk9GeHaKxWj3ug89snhcX4ux9Ma5FgDxI1f9/NR+jndd5FkOdKE/ZQESTpMweokx0hBoF5ruOVVe1fAXh7HzrcIWA+aHEW0OmBhbpIR0UZEWraSMEQ4s6A+xYWtwKn+kYqL0ipiVs/M/+JH/i59pQanLpnzOYO/v3ITgdwzb7M0cvoIoOlwW8UoFrDBEgrYO7qPEILOkWIOYyvQxqJmeLc2eKT3IqxzvfHs4po1+J2FNp5T4buIGOsItykTGQ+xC4f7U4kTcNHonI+qO18EDFcUMBMSbADxDyccd4qO4iqoq3shkxGbCAxUTMyoW2352AAGueroL1YuLJZ7AdtTUMy4MNDyRrIJ/t4WVRRax0vi8/zcTpAPh3SlCuPKgTDdgo+RMVbKPj85aXjz3cDJ6CH7kp4BmeH7Qy7Fyhf3y0T4Pxz8eDjn3bm3ToJrD/6nUv0an60EfCtzT5F2PpJmUmErUDwx+29USuMYZSgmDfI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8585.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(7416014)(52116014)(376014)(366016)(1800799024)(10070799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmNnN0pYdm5VYWpTTGFkWFNSdThrV05PMnh6Szh6WVd6MW9pNGJ5cTBSRVRL?=
 =?utf-8?B?UUVHRGFUWS9CY1RGbkRERWgzTnU0K1ZyeER5M1ltUEdqODJSOVBPK1BlT2ZL?=
 =?utf-8?B?bVFFcnJPZk9RRUEzL3c0Y25BV0xRZk5Ud28zUGw1dDZEaXZqcE9ETWRvbFdW?=
 =?utf-8?B?bWhHbXFKQTBYVGxxUWMzWnZmZW1tTTJFSU5zSUdnRG9GQzJrYkdyME9GUXFU?=
 =?utf-8?B?N2tLYnpCWElLMFU1aXBrU2x0OVhrQUlNc29FRy9MSTk0SkExdTJNZ3pJTzBS?=
 =?utf-8?B?eXFoY1lGaGJvUjR5UE1MSC9lMXpQajgyQUpOUzhVRDRaU2dzdjNPb1FlQUta?=
 =?utf-8?B?aXdPSGNraHAycUo3eGdQN1pGbWMranpVbkFZNnAvNTFXTStoOVprZmFtY3hx?=
 =?utf-8?B?dFFrQ2xQTVhmODhTbUU5dmh5VkdUaXM3U00ybmVJMjRSWmd4UVZORUd3S0Na?=
 =?utf-8?B?VnVFdGZzTkgrVkI3aURNY1Q0VU81WUhlM0JrOFAvUkN1dnRudForV2QrajFR?=
 =?utf-8?B?akdPZzlTSGROMUQ0a2hBeldBS3dORUNubVpuMTF0TkNIaDV3dGMvaDA4S3dR?=
 =?utf-8?B?K3hxZnFqMWs1b2pPN3RSTkpaa3RIbVdlbVlsRU1LeklZOTRhZHpkZDVmT25z?=
 =?utf-8?B?Z2ZGR0N5Szg5QVRQTktseHd3R1dwViswZnFIWlJ0RjRoQkE5elNwOU81aWMv?=
 =?utf-8?B?NDRJOFgwWUEwUDRBRE9TUmNCME1LdStKSzg1Q2w5M1UyN3dYZG5qaDBKaWQ3?=
 =?utf-8?B?aDNZSmliR0pvV2IvMVRzYUw2UXZUOVRlYTBmVTZKNnBkT3FoVTFxZWdxSWZD?=
 =?utf-8?B?OUVPNE9weDdDYVZNM0RIWTlYNncxbkQvYmJtNjBENFdBQ0RYNnFJZ3ZnS090?=
 =?utf-8?B?TG90YktvRkFJRVF1NkM1QWtEWXhUdlFKWG9CaGJ0WUJBV1FmS0VKRExmK3BC?=
 =?utf-8?B?bmYyaE9ndURFWFNYKzRiaVZMRDBnMGFsaDkxZmgzMC9CK2s0QUN5ams1dU9U?=
 =?utf-8?B?L2FFMHpnSkkvWStlb1k5K0xud3hSZzVsNkZHS2JkQ0xTSmU4Ty9Ub1NKaUxz?=
 =?utf-8?B?SUtMQ0tiMFN1U05xTXpaK3V0R1M0NFRIeks5SHAwZDR2bFU2OVBmazRaQ1hI?=
 =?utf-8?B?NE52QkkvRllXOGtXZVpjL1RhNVVuNnhzRmMrcmVXTUZsYmlaUzBsL000Tm1l?=
 =?utf-8?B?cjhvb3hyZ2ZLYkhNaXZ3bWZCRjRtNzVpTnVDUmZ1YzBxOWtGWUY2NGsvVHJk?=
 =?utf-8?B?WnYzZEpackd1NlY1azhzUWR2cXB4UWNEWDFIdDRGUjlZMUhORVVkSXIyOEt2?=
 =?utf-8?B?VVdlVTB3MDBIWGxuejNyR1NSOTljT1I0Z1BnWlZaR3lvL1JrdWRrV25sWjBW?=
 =?utf-8?B?WHhhQVhtY0hUcFUwNjk4YkZCRUw0c081VWpjM2oxMnEyZ3BnOSs4bFN2N0FV?=
 =?utf-8?B?WGozM3hoRXVIZXlsMlcrQVE3UFBsbURYei8rYWZNN3FxWTY1WlZHcXQ0VkJy?=
 =?utf-8?B?Yy9Bd2hMdExRZzJHUE10b09hTjhjVG1YcHU2VjAvV0F5Undvdkt2ZlhWd1du?=
 =?utf-8?B?ZU5mTTBqL0FIaFVzVmJnUDVJYUx6Um1MaWN0TzhMMWhwZUltS29wYTlBZHAy?=
 =?utf-8?B?cmUrTlBCd3hyV3ZiV3V6QVp1VDJqR09SUWQ4V0l6QXFpTFJXM2RNRjlUMlky?=
 =?utf-8?B?WERCVnc2Tk1DeVdZZktFU3dZSjdHbzRTcjJIQkNJVWt1aEZGRkw0MjZwaHRo?=
 =?utf-8?B?a2ZwNjhVQUhvK0t1dDNPd3RtbWZxUFB2S2lQTFQzS21USkhDL2pzTisxNU5Y?=
 =?utf-8?B?SkN6c1JDenRZMG12TVkyUEdBRlNINjRuaEdHcS9tTXNaQXQ2UlhCUzdaWjJI?=
 =?utf-8?B?LzlGNXdPcStVZ2Z2Q1lmUFZJb0dKUHN5WlVJMGljRXF6L0V5WkMzaWNkaXpa?=
 =?utf-8?B?b2xtVmhVbjRWWkQxc1FNMXZRYU14UDNKQXdRM3ZsTGg5aVFsWU92OUc4TnJ6?=
 =?utf-8?B?OGtyMXFDMTRKMXVSajB6aHR3SXg2dHdscCtGV05pdVN4ejExcXA4aWhzeG9P?=
 =?utf-8?B?UE5sNWZRTmFQWlZDMmhrb3dyaXdHRk9DYkxlVk10UE02Qzh4SmdCZGNBV2lz?=
 =?utf-8?B?WVJFbCt0Qm5qZStoekRmcmZ5TlExd2tFU00wSEx5NUVLbUt3eDhWMTU0cGR3?=
 =?utf-8?B?VzQwQlptUkpkU3kvM2lMOEJNNXYzOVlqQ2lTL2kzOFFpUFVMdk5zb2ppQXBk?=
 =?utf-8?B?d2RnV0hBelU0RHk2SkdhSzhuc016WTMvakNFbVVXNGlpRmxGQmg2RDMvZldC?=
 =?utf-8?B?djAxam8vUVFlc2xJY1FteHRmZW53WWFpeEdlV09ZUzd6TWc5NHlFMjZDV0NH?=
 =?utf-8?Q?8R6L32K4+0acQw3mYde8m1WQ/1bI8go74d6MswJEXaG/Y?=
X-MS-Exchange-AntiSpam-MessageData-1: gKA0zf/rB60xVdvMek8KHBflZ0DvKLoyDCg=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e527be39-3114-4308-110a-08de7a17d783
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 17:59:55.3043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FlbY4RZo+pvONRpeWBWLMqWRt+EjQNkwOPrKJAoZao55rfsYU6rp6W/5LbvSYlXeeHg7V3BcVsKoBYC2eSGVzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8778
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
X-Rspamd-Queue-Id: 2B90620D281
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[vladimir.oltean@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev,microchip.com,google.com,sntech.de,gmail.com,nvidia.com,rock-chips.com,starfivetech.com];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[nxp.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rock-chips.com:email,sntech.de:email,nvidia.com:email,nxp.com:dkim,nxp.com:email,nxp.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
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


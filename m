Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MDUJZiGrWkE4AEAu9opvQ:T3
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B421230ACD
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E8E10E447;
	Sun,  8 Mar 2026 14:13:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="ZJzjd0po";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013014.outbound.protection.outlook.com [40.107.159.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7682E10E004;
 Sun,  8 Mar 2026 11:43:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yGzIhjuW1NsKGhEaLs79c19Ho4TjyHr1ShLEDPohJOMLPdvh3pgGn2XsdZ13UY2Q8XTt4eqLaNqx3J1PmGBKsDADRxYqeDhuLQXevS9dgZT1cSeggcx2qAQE7DMHrPlpMdvhuygbVvIam9riqDVn6EPPHRiHjfVgeCDfY2dfYySDdbYZEDkJMHrunyuD5huSieHYIUFO+29PEB99g9E/iB4fqh8pX/S8YP/twxM+g9DWbQCqrGbTBBsHrzXPGbbYZirn+Pj8r0oi/9ogbgWRrQaFzX0H2nr5xse3EZVLsU7mIHXnkJct76xAH06NdFize4xaOlY4k1PRwTRo/wDg8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OIuv7xfAiGi/g8HMIs+Sm5UJ2WMH+94b+U2ZPe3K2pk=;
 b=GEDFQpVP4Js1wShohGbiQUiy49rPHJwH3TUVkdN4T3vRHeWYGQQHoz3m84bohWlo38RkosM67ooS49b8ZJo+8y6WRDHV/aPd+0li0Cl3cG32pwnVNwQpTRGVNFtwQcnDkuuyefyG41NCTYFEK3bENG7j05NbeTbnVBW8FumXLllZE06fp6JCK3HFXUTJPVT1jQg21LDzfJx/jqz0DWu4qiOyd5Ab7w7tZRVEh5GVwuwn3u+VhmB/UzX/UPo1M5ZXp62jJAbk3+H58SJp7+zzvBq+PHg7FXEqVssH68oq1ot8l6DSReifwj2o6S1qXZOfjREZmF3YwiDUtiqr8gGesQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OIuv7xfAiGi/g8HMIs+Sm5UJ2WMH+94b+U2ZPe3K2pk=;
 b=ZJzjd0pog2puD2DIfkf/JcTIXjmfmFYF23lWE7yKFVHdCeHVfG2lwSB1TjWDhm0hahBBuwmlb98bNFNTDTRyPzwb7v0BcbtnFLjxrIwnVfE6DAiga4mUhJo3YCk9i5mU+tPaXMnBCcCM3F0tdX6OSmDe2ihlSDXNN2+re9a3iSSjeZ5LSEzZVbFvKnsuphXCl8unTaZN/4kiRg035LWrSDUCqshCQnHKunZIW5K84DLkd4Q5AfSUsdhSNqyGcHe64w5bYR9RJYHmn2ZQa7HoAW7JuaQ4Pa6tZlton3LuI5v7XWGPQ3Pilp4QTXmeLGdGu3Sn7IUDBX2BgEgVRwti3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by DB9PR04MB12426.eurprd04.prod.outlook.com (2603:10a6:10:614::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.23; Sun, 8 Mar
 2026 11:43:11 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.023; Sun, 8 Mar 2026
 11:43:12 +0000
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
 Vignesh Raghavendra <vigneshr@ti.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>
Subject: [PATCH v2 phy-next 08/24] PCI: Remove device links to PHY
Date: Sun,  8 Mar 2026 13:39:53 +0200
Message-ID: <20260308114009.2546587-9-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
References: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0031.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::12) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|DB9PR04MB12426:EE_
X-MS-Office365-Filtering-Correlation-Id: ab4e078f-bae5-45ff-6a1e-08de7d07e0b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|19092799006|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: tA7AggBo6pr42ZXpJ8096XcW0Y3zmKEd0l4mmbGp+sA98lCvd0WBNKB52OGBT7eOYptOg9E3XwTbfjprd9G3Kcwt5O10wqUyOIniTOk5sVsrS57HmQpvrRN/dJ9M8fdJjSLaJPZVcqTkxIJ8Qh15jOh0guX0/jvjWNPI62G+xVrwQk2xq1wa1WnSI2vrwMztBsBzxyu9iY/QXRD1Fb6t4ulz/OAV6IrTC9yIcWdkQnf4yGw7MLfLrxmuD62QbnU5RajSYZFhEM1TIiEQlA8V4WK8FbmWA3eAXG6XsK5gE8Nh6bWoK9Uuc31DbG8pyeHCLmVi+jDGdslBP2KkFsk8kKgYSYb6pm7UIHUPpgb99Tld7Q+EmfJUlCClD23p6Ui0MB8UU+E4tmZ99XqAbCp11j6OeYPXho8LJasE08xMCsvgun8fhstX7ckSrx3SxcAfxfXKOAmdFK+pYc+TIzAjaAQCSVcvOCnI+7uPXQMeSqjLDE0XRKrRETVUomEBL91Muvhk822FF5OV7y5LqGE7QzLcxrb/721Sy4v5kR122BOKfWJC+YubI8ZNkUAaTyWYih9ZH8LLPu3KmPJma2GI/PRw6Ec+y/tC47dk/+FxPSMD2AjtzMenDSlkdfGAJfWXidvVSRcdcD8a46hjG2jQbRkjpaF4fAOm7su+gYYxZYo/K20rFDgLwVDc5ShftqG4WwKxT91tSwShIJSW8Sxl7XnO5b2HxUxucRVU2Sq5rRI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8585.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(19092799006)(10070799003)(1800799024);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGgvbjRuR3BrckdYYXdoZGRVdmh6ZjRsSjJhU3pmY25GWjRSU3NJQkFnMWQ1?=
 =?utf-8?B?UEhIS0NjbS9KNVF5UzBpVGltNnR6WmtoTzFJNGNTRXVTMmRkOTZRMlFuMFRj?=
 =?utf-8?B?SytVMU1URm9PdC9kRzBtNGxKbGl5UzhkN0xHSStQUjlNcUJETEM1YUtmV0E5?=
 =?utf-8?B?cmtNdk5qbmpxOUk5R0FkODVrNm5nekdWa0FWenh4ZUR5VmNWSmR0SWozYVZW?=
 =?utf-8?B?cU1taDJDQzBJazlwR2FrQURWWEl4VGdQUUpMWXFHR21OWXZ3QVFsNWpISkZi?=
 =?utf-8?B?Y1VVbVdwcW02ZElUNGNaOUZDRnZmWWNqbDQwRHZYOHgyYnZFaDZ0d2d3Q1Yw?=
 =?utf-8?B?Z2IyRVpvRWFGOEFtVXZreDI5ZDZmWnp5Qk9kcmxUZlczM1BHd09zTmx3L093?=
 =?utf-8?B?TUhKMkFscUxzRzdZaWF1b1Btc09wYWhlYmt1dXY0WmFxelFOMG51R2VOdWh4?=
 =?utf-8?B?M1BSTU9OajhaV21RMXRiaDJyU2VYZG13R2gvL3lLYXVZM09PSEFTWTlSb2lN?=
 =?utf-8?B?aTVmVTErTmtRSkcrdUdpeGthOWNIVVVsaW9yZm4rK2dTNm55aGdhK2paNG8y?=
 =?utf-8?B?K05GTVF2Y3NKQ2dRWlk1c05KWUJEK2F2dCtvWnBCeXZnSlhpNS8wY3F5Ty9h?=
 =?utf-8?B?cGxieFkvSTV2b1lNVHZOK0w1M2hwR1p2WnVXQUlRUG9JR0JhSmxoSlcrT1VN?=
 =?utf-8?B?V1NZWFIvVTVJSUxhK2N0akFlejgwOVgxVVp0Q2hUY2JzclM5ckRVWDJ6eDNS?=
 =?utf-8?B?RFdrRFpneUt2MSsyU0l6RmljU0laOFBpR3UxTnp3RTdCK2lna3h3S283QWNZ?=
 =?utf-8?B?aVIwQ3UxTlB4aTU0b2JzSjErQjVraEdYMlphK011UlRybmp4WDJoLzY2ckw2?=
 =?utf-8?B?NWxpM014WWZndGZrRlBLTlJoaGR2bWFaUmxjQ2hubS9KaHJ3SDlWUXBuNXpp?=
 =?utf-8?B?QnVMVmFSVS9oWENVa2VmeTMyVEZEcEZPOStyTmNib3dFZUdsVGtXR1ZoaWpm?=
 =?utf-8?B?S2hxY1cxVUIyNVpLYU5TM0RMRnJKUG9kR0wwb2xIM2N0aHJadVBQWTF1NS9D?=
 =?utf-8?B?VVJObG41VmJtVFRCelZsZE5IUldGdGo5ZFFQZ2FTRDdsTlZCLytKcCtKaUdE?=
 =?utf-8?B?dDA5bE91MDR0WlM2NHgxTWgxNFpUZTloZCsyS3M2SzMvMjlmQXVFYmI0S2VQ?=
 =?utf-8?B?OVBrU0hmN0g3bjRhV25lYUs1NzRweTJPREVRTXhoTHRoOXQxdlBwSllhd0Yv?=
 =?utf-8?B?ZjRRb2FqbjBhNnJCQ0FLOStvOUVOOXFRSDdka0REN1I5azh0WWlhbE9EOUpv?=
 =?utf-8?B?Q3BpaVE5N21kdURFWFRkQ0Q2dS9JRW9IRWhRT1ZvR2JvOGwrMXhob3hETzhV?=
 =?utf-8?B?UGlwTGRESWJwaDU2SlF1dzgxUUN5ZnR5T2Y3WWdLVnoxeHdGT1dCTEJhY2pH?=
 =?utf-8?B?R0ZWVldxNVozdi9OT0ttRlZ5WjR1RFd4d09tK0NSaWFBUDNvNXpUODFNV2pN?=
 =?utf-8?B?eDlYUVkyVnhVMCt6SGowMk1wS255NngzdjZaQ3RHT1doVC9nQ0ZJVG9LczVo?=
 =?utf-8?B?RFhIOEprN0ZKak80Yi95clpPaFdhTXR3Z3cyM3J1bFZDWkFDTkxIeCswTkJ2?=
 =?utf-8?B?TnNnQXEwMm1hdXVqc2RHY3JXYTdHbzNBSU5Ha2ppUG1Ga3N0cjVwK21QNS9P?=
 =?utf-8?B?dk5UdVo2UVIvbnBqcjRDTXd1RXhCNVBkYktqWnMvUi80QnZ6MnVpTXdyUXFL?=
 =?utf-8?B?K0FyS2dvWUhVc1ExWGliL0xJcjlYOEgwMUVEQzMrMUNtdFdYdk1uZUJQaHVI?=
 =?utf-8?B?VjRZVlF5ajdGdHdVempFQXpKY1JxSWdtUWpkU1BMRHpSR1g4K2ZKdUxWOW9L?=
 =?utf-8?B?emIwbVNFWGdJbE1QbjRqRTdTWjJIbkZlbitBanM4dzZDZUplRkFYN1ZkK0VD?=
 =?utf-8?B?WlFLdnVFOXl5akF3U1BLa1k3Y2wxSXVLTnRGb09jY3VXQ1BKcVc2dDh2c1hZ?=
 =?utf-8?B?UFQ4Q1BUVFl1OEc2d3JVMHlYcWRZTjU4TjNDdngxdC92U0phN3h4UTZyM0dE?=
 =?utf-8?B?dDh6SkdMU3ZoU1I4UGJ4NFpwWS82UDF5Q0xLVmVlWm9KU0Y2T3VoWXM4WGxO?=
 =?utf-8?B?OCsrVjh4UFFvSEJxcFVWZ2hSL0dac3FFZERrWkNFeUovWjRQRjVuRWFjOVd3?=
 =?utf-8?B?U21JS0NzMnVMcGQwcDE3Z3pnQlFOZXZHSXJUSmxES0grbWs2VzV3NDg4Smor?=
 =?utf-8?B?bWlpRjZCREkxODJrWU0xTHhyL2kxRnpBV0VYbzllNzF2cEJrWkVrbDhOYk5I?=
 =?utf-8?B?elB0dmFoaEwwdkxRNmV3TFoxbFdCMUlPUHhJMWwzQURjQzdkZUhnNk5HUGhk?=
 =?utf-8?Q?MmoSbVMOGHxyzjEYBupsEDHc6d+Q99t/STDaKr1IRabd/?=
X-MS-Exchange-AntiSpam-MessageData-1: QyqwqrKmKDE8BG/nYx7PX7l/HHLdHVB5hVc=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab4e078f-bae5-45ff-6a1e-08de7d07e0b4
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2026 11:43:12.3094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FfB0WVqP9QZyFuDusDDwHp7T+9SQjeGbhdnJpOk/qCx06QlFFQ652wNiY8ZyfNyGhE9xz5PYgY4Mslq757pKRg==
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
X-Rspamd-Queue-Id: 4B421230ACD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_NO_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[vladimir.oltean@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.918];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
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
Acked-by: Bjorn Helgaas <bhelgaas@google.com>
---
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>

v1->v2:
- fully remove struct device link **link from struct cdns_pcie and from
  cdns_plat_pcie_probe() error path
- collect tag
- adjust commit title
---
 .../controller/cadence/pcie-cadence-plat.c    |  2 --
 drivers/pci/controller/cadence/pcie-cadence.c | 16 +---------
 drivers/pci/controller/cadence/pcie-cadence.h |  2 --
 drivers/pci/controller/dwc/pci-dra7xx.c       | 16 ----------
 drivers/pci/controller/dwc/pci-keystone.c     | 31 +++----------------
 5 files changed, 5 insertions(+), 62 deletions(-)

diff --git a/drivers/pci/controller/cadence/pcie-cadence-plat.c b/drivers/pci/controller/cadence/pcie-cadence-plat.c
index b067a3296dd3..54531f86bf45 100644
--- a/drivers/pci/controller/cadence/pcie-cadence-plat.c
+++ b/drivers/pci/controller/cadence/pcie-cadence-plat.c
@@ -123,8 +123,6 @@ static int cdns_plat_pcie_probe(struct platform_device *pdev)
 	pm_runtime_disable(dev);
 	cdns_pcie_disable_phy(cdns_plat_pcie->pcie);
 	phy_count = cdns_plat_pcie->pcie->phy_count;
-	while (phy_count--)
-		device_link_del(cdns_plat_pcie->pcie->link[phy_count]);
 
 	return 0;
 }
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
diff --git a/drivers/pci/controller/cadence/pcie-cadence.h b/drivers/pci/controller/cadence/pcie-cadence.h
index 443033c607d7..35b0b33bc6fb 100644
--- a/drivers/pci/controller/cadence/pcie-cadence.h
+++ b/drivers/pci/controller/cadence/pcie-cadence.h
@@ -82,7 +82,6 @@ struct cdns_plat_pcie_of_data {
  * @is_rc: tell whether the PCIe controller mode is Root Complex or Endpoint.
  * @phy_count: number of supported PHY devices
  * @phy: list of pointers to specific PHY control blocks
- * @link: list of pointers to corresponding device link representations
  * @ops: Platform-specific ops to control various inputs from Cadence PCIe
  *       wrapper
  * @cdns_pcie_reg_offsets: Register bank offsets for different SoC
@@ -95,7 +94,6 @@ struct cdns_pcie {
 	bool			             is_rc;
 	int			             phy_count;
 	struct phy		             **phy;
-	struct device_link	             **link;
 	const  struct cdns_pcie_ops          *ops;
 	const  struct cdns_plat_pcie_of_data *cdns_pcie_reg_offsets;
 };
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


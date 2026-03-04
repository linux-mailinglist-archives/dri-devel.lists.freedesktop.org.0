Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGXJAd85qWka3QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:07:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCB820D21A
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:07:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD61910EB39;
	Thu,  5 Mar 2026 08:07:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="U0B/q5cx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010007.outbound.protection.outlook.com [52.101.69.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665C510EA85;
 Wed,  4 Mar 2026 18:00:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NwXsjW18UBGoek/DjOrExq+RNurVwN9XmNGf8Oqc3eGaFUPLKpjDkintZPSIlYK1Fiw0H9VYJztO9iJVuTH/kGNdgXqSmZn5iYkt5ig1Zh0FyVnPQ98nlZHkqBTHaGyuiGkiko1AE1EwGW4We7pYbkJvbwWDdPtHZKLWVtyIeTt+X6pABxfqtkbO2JhdXR4eZZ9hg/z698gc5Tbxm1lQjCXCvxqwu80I3NWaUGR3er1Jx7F3uFEEHnipGbfzVcB093KY98MQz8AZ6A+APN6RbiB24n+WPtSFdXj+4eP6BwOci7ePcrcLOrRyRxPY+Ij0KlzjHwR5GgMXMzOJpNKa/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PD4BGf1TkPusr7YXKW8LP+9s2QXAEdxkjTjDTxFxLUU=;
 b=IWxllSrXb1O63X2b6RwSYJ2v9FSLEv+UERixgAHVjJHJue2LYB9PiMzJG6EblaoEG1DH+5oH+K0J/SLNelJbVpbq4zO4e/9RSQROOZhX/Da4cQX78yxZvHglUP8aByjNiIlyMNb6pJWItDLqTyXV/p4Qp+6WGwMNsScuhknodxukf3xjXbdhzjpt5U0M2PkUEngFYO90sCcvYd05lwSCgq4FYCjnOtKd270mpoyZid1C3p08qUV1mbBgX6shv3zyPNHf1x7s8Myk7wQ+zY4OIwf4SeHT/PU0fPMgRfSYADc/qYIfSaPHXDhkNHKYuYZV4V4oiKv5gcUk3ZP6E5JRAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PD4BGf1TkPusr7YXKW8LP+9s2QXAEdxkjTjDTxFxLUU=;
 b=U0B/q5cxLfZrQnePU3eq8/NXWV+a4HJ2G5OOdsNPR+r4pJKszrbYRTDUUev+p4a2a2cogI0fLVj5+6F+Ldc0pPRGg6BvJ+ORnMp/Te16/9jGT0zV9BmPrpQHge12WiqGgn9T2XQxuWnGj45iJa8X6ry68aYgJ+aSMVLAEIPDq+LTChtyZ4iAVXULPuM0aDbBNik8gOlX9f9iaJjvu9kAzyMgi0bLcX7IdWyrn3oIT1WjA0JvWuM3RuzBJLa8WeWIFBMZ5FNH2QqKBTusEMViXIvz+zREqTmqmJwWgDeXcT2A1R4R/bdiQQOU7FnWPs2gEedzI2q28NAPjd7Qbxv+cQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by AM9PR04MB8778.eurprd04.prod.outlook.com (2603:10a6:20b:409::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 18:00:02 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 18:00:02 +0000
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
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH phy-next 05/22] phy: add <linux/pm_runtime.h> where missing
Date: Wed,  4 Mar 2026 19:57:18 +0200
Message-ID: <20260304175735.2660419-6-vladimir.oltean@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5203a5b8-e8ca-4012-eb0e-08de7a17db7e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|7416014|52116014|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: WepYWwi1gJ+R7+TIO/6lVLtQ9/ytDpxlOwH4fXcaAvVLxLnz8TPwEMDlazlEXUbPipZFxv/1/WqXnikozyCctXEn6iwJp9bIdZaeDp5NCHHEu/tTNnOqDqB9KTkLuX2FqApGGebijQ7IJyqAyRGIaPAiW3DUrhGW+Bz1bIFaoSrvaUcdxP/a4wz8fhtBoo5r7c0j18AC3sVE0ogt+3p0CKjanV/11t1iA+imdP4MiU8bcDJTePsOn7dJWiH+DhY8brObUOGUg9FvTi7YtDUkfy8CbA/daF4JqC/Y4WBVuyznT0PZ7dnRnGNfYytsFXT4+zHbQyGNDhL9SjqSeEivTo1LAiICrqP0vNoQueJl3oYdpkVRwMoXTX60NpSuocIUVU8VX65vPaF55rMJoaBAH0YAG1bYqigYMI/BzYqiuS6E7SFZak/zWm+qo5lGgUDu0OmQo9HoL3AhG+LA9QNJos822xJ5xLjmgs7CgzqT8EnGLFnF62sbMqjW3A2Gp7W+wM+oUDexTsHod2Hv+63TCIMqDcmuSGadQyD5/PS+rXBbB/6+zGP5+X7YeI0tHvZgQdqosn5EW7aKgsVw/lDJbJkOiB6ghPMatADM+XSPzSpZeqV/sCxYnblOGeT2G+Lec9Nc2CRME6CJXCWlvjIsS24z4Gk5xKoyRDShDgbG/CGIkJ+OOVIvY9P3lqLbY8Syp3Bp4Xqd5JLO1oA3kWOxd54SZAbZy6dn+vqEgo5WRU0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8585.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(7416014)(52116014)(376014)(366016)(1800799024)(10070799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUF4dUcxazZoSVJZZXNrd1pxWGxMa0pGdmlOMmNLWGJULzkyRXhRb0gzRU5k?=
 =?utf-8?B?dWlTbmlqdUQ4Mm1pU0IxOEdSZVNSaFV3S0NHN0tHMThmSmRrSXdFU3pFaUNY?=
 =?utf-8?B?VEtlZnptc1NVVldlb1hydnc4NVlOeUdUN3c3bkNITys2VjdvNXo3VWZiTjBO?=
 =?utf-8?B?YTV0OTYzZmc3QlRIenFGT3VFRGJPZDlOQjNDRkM4NnNpRU84UnNjay9xSVpK?=
 =?utf-8?B?RlhLVksxZm5lc0J5UkF0SThyc0JXSXplNFFXVVlzb2psdTU5aEoydWlmQUVN?=
 =?utf-8?B?VWQ3elRrcGtVbWxxRDE3VDlmd2Q2Z2ZxazNLSi82YTQ2YnJoOUVJM3Y1RkVP?=
 =?utf-8?B?OEo0N0JNZGg0S1BmWFdhZ1hpMnRoVGcxQXo1UnVQNjVQVDE0UEE0bzgrZ29x?=
 =?utf-8?B?QUtJbGpIWWJZQXpSVVFyWFJnRldDM2tpNXBYS0w3TGRaZkFRMUs4MnU1QmpX?=
 =?utf-8?B?bXprdTMvdUNVTDVUTW9qdmpScFRESHZFbTQ3ekRQU0NlVWtCY1RDNFhib09H?=
 =?utf-8?B?cUFjRzU1YVpsTDlMMloxU05VNGFUMVNndkZ6eng5RDRoRldSTVdNSTNkWE9E?=
 =?utf-8?B?cmpJNDNJTXV5TFRZY212ZjZjdGZkUXBtWUdDYjIzTFR2WTJsaEFZZzRVWTlv?=
 =?utf-8?B?Z3dFQjFUcWp3akRZamdFOUJwYVkwUDNwSm50VnZaQUF4OElJM250aDNQajJO?=
 =?utf-8?B?SEZFSTVzcXFydGVTazNmbnQ1NXhlNnJiQ3dUMWF0MUx0b3krT0Z4MFluWDhP?=
 =?utf-8?B?Um45N040Q0E0SVNJOU5QSHV3WlRmdVZFdVBhbVFWNko0RTc2d2p5eWtXU1Bm?=
 =?utf-8?B?blBHN0Y3bWkxU2szVEN0TDhYWERkQTUwS1BrM3pKKzMraDAxT0srZFNmcDZY?=
 =?utf-8?B?NEZ6RFBVN3Z5ZUg4K09VazFTbzZtZFhxS1ZXUVFXOVRlakVTajBrWkZlME9z?=
 =?utf-8?B?ZlNYS1ovUVdSZW1zVHJzMDh2WElodis5V3FIcVlCRHJXOGdsejVjZXlZRlJW?=
 =?utf-8?B?UHlobjgzdlY0Vy83cEFKNXJzT2hlNzd3aCtJUnNrQkVNMzE4YWN0UWdaT1k5?=
 =?utf-8?B?V2NRUThabitpZ0J1aGJjeGRlNUlzdkovUGNzYXF0ZHdsU05RS3dYYnlpT2V4?=
 =?utf-8?B?SXVxcTFXMlBLdU9aLzh3R3dzY3lDUTV4TDcwRStiZEtzZHY5eWc1WXMvRW80?=
 =?utf-8?B?UmJNbXNFNnlZNm1mMFRtaUgyUzlmdEZZTy9IWDR0NW45SFp2U1dlRVVZdUxj?=
 =?utf-8?B?RkpLekhyZE9kZG5jaWI4eC9WdWVES1ZialNmK29uSFdMVEFEcXRZbXVqVThX?=
 =?utf-8?B?cjJNQVFLbkhVb25iM1JvdFFmZkZyazVnNnBFcnJ1NURrTXVCSnJtNkJ4MTJH?=
 =?utf-8?B?ZzBvUzY2OGw4WHNJdHhZNVRoOTVURTJKKzk4dVdnQVdxU29hUUdBOCtCZWZ1?=
 =?utf-8?B?NGxXQkdtRzRkekcrMnA4VnBVUDFEbmhTQWhnNHRaRkJUa2o0UnFGMWpJemxP?=
 =?utf-8?B?d0twTFN5bEszd1dMVEw3WlJLOFNOdFYrN3BuT3F5TXVlQStGWnhWRHoxb0VO?=
 =?utf-8?B?c2drOTgvc2gxS3lhaGVUVDFuQnRIY3BncldLT09qWmxrTCtZa0dKUllGc2FN?=
 =?utf-8?B?eVNzMmlQeFdUZWtwUkdDa1FJemtCZXo1NjVRTndWR2tqT1VSQkQ2MjB0Uy85?=
 =?utf-8?B?NEZBZDdXYmhhdjc4endvV0R4RFFIUnBmSjA2NlFDY2lJa2N4cVdFUFBOZXJs?=
 =?utf-8?B?cnVEZzVOMTNXZkhZbWxQdWFnd3M4bzBiQjdydUNYeE15dWh3ZGw4ejQwdk8x?=
 =?utf-8?B?bnhlVWFMbzAzL25XVkZKQlR0Ry9XWG5JWkdoZUN0UnJ1QlRrQjlxK1lRdmlF?=
 =?utf-8?B?ZjdkQzlrNUVQbmR6NTlQZUtac0tVbXlxcGhhQkF4N2JRWVRqVjVoVkhzM2F5?=
 =?utf-8?B?aCtDcXcxL2tGdUpKTnIvSDBJQVlxbnpTOFRGL3FSMk8zRDBVK2Y0d2pzam1K?=
 =?utf-8?B?bDFqQmNFYzM4aHlkMERmWG5uK1JIUlR4aTZycFJwNnpSNmFROERIM0JjNnNs?=
 =?utf-8?B?MEZpdDhJZE1Da3lyRG5FV3FYQmdGZzUwQnErdWlneERZL2lOYWRibFVOc2lF?=
 =?utf-8?B?clptbTAvZ0piYjM5STdVUnAxNktyMXRwWDQxVFIvb1Z0VmV3OExTckpzcFRv?=
 =?utf-8?B?VWp6dCtLNkVQLzM1bWhYTFlxWm9PT21MNmY1NWc0RFUreTFrODNCamJpVVQ5?=
 =?utf-8?B?TG1qaWVoN2pRNFRQc3hqZWZiQ0hVdDlBaXBEZXVPSzVET2o0b3MvN1JLSzlL?=
 =?utf-8?B?SWswbTJLdmpkRDFTWHRBc0FXdWhsbnp4bW53QnFrdTN2dk5YQ2o4eU5UK3pB?=
 =?utf-8?Q?qm2FIypNEot6oXW0VKyssinF1JhUMHzuU9ahVo80/HwGp?=
X-MS-Exchange-AntiSpam-MessageData-1: kqgIZxvHiapr/1hPnPOT1yexIuCk+zmSwS4=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5203a5b8-e8ca-4012-eb0e-08de7a17db7e
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 18:00:02.2697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +cKLrQ6+M0BpJOp1ysj9SbUOwgqu7mKfxYMhwTc4M6WqzKCsIZveZHJkFkYamArb+Efx1I3c+ypDTSR/4aUOig==
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
X-Rspamd-Queue-Id: 5DCB820D21A
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
	RCPT_COUNT_TWELVE(0.00)[29];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[vladimir.oltean@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev,microchip.com,glider.be,gmail.com,sntech.de];
	TAGGED_RCPT(0.00)[dri-devel,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[nxp.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid,glider.be:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,sntech.de:email]
X-Rspamd-Action: no action

It appears that the phy-mapphone-mdm6600, phy-qcom-snps-femto-v2,
phy-rcar-gen3-pcie, r8a779f0-ether-serdes and phy-rockchip-typec drivers
call runtime PM operations without including the proper header.

This was provided by <linux/phy/phy.h> but no function exported by this
header directly needs it. So we need to drop it from there, and fix up
drivers that used to depend on that.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
Cc: Peter Griffin <peter.griffin@linaro.org>
Cc: "André Draszik" <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>
---
 drivers/phy/motorola/phy-mapphone-mdm6600.c    | 1 +
 drivers/phy/phy-google-usb.c                   | 1 +
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c      | 1 +
 drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c | 1 +
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c        | 1 +
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c       | 1 +
 drivers/phy/qualcomm/phy-qcom-qusb2.c          | 1 +
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c  | 1 +
 drivers/phy/renesas/phy-rcar-gen3-pcie.c       | 1 +
 drivers/phy/renesas/r8a779f0-ether-serdes.c    | 1 +
 drivers/phy/rockchip/phy-rockchip-typec.c      | 1 +
 drivers/phy/ti/phy-tusb1210.c                  | 1 +
 12 files changed, 12 insertions(+)

diff --git a/drivers/phy/motorola/phy-mapphone-mdm6600.c b/drivers/phy/motorola/phy-mapphone-mdm6600.c
index fd0e0cd1c1cf..ce1dad8c438d 100644
--- a/drivers/phy/motorola/phy-mapphone-mdm6600.c
+++ b/drivers/phy/motorola/phy-mapphone-mdm6600.c
@@ -17,6 +17,7 @@
 #include <linux/of_platform.h>
 #include <linux/phy/phy.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/pm_runtime.h>
 
 #define PHY_MDM6600_PHY_DELAY_MS	4000	/* PHY enable 2.2s to 3.5s */
 #define PHY_MDM6600_ENABLED_DELAY_MS	8000	/* 8s more total for MDM6600 */
diff --git a/drivers/phy/phy-google-usb.c b/drivers/phy/phy-google-usb.c
index ab20bc20f19e..48cfa2e28347 100644
--- a/drivers/phy/phy-google-usb.c
+++ b/drivers/phy/phy-google-usb.c
@@ -16,6 +16,7 @@
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/usb/typec_mux.h>
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 93f1aa10d400..b9ea7d058e93 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -16,6 +16,7 @@
 #include <linux/of_graph.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
index 8bf951b0490c..2bd5862c5ba8 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
@@ -16,6 +16,7 @@
 #include <linux/of_address.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index b0ecd5ba2464..d88b8a415e85 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -15,6 +15,7 @@
 #include <linux/of_address.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index c342479a3798..f62e1f6ecc07 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -16,6 +16,7 @@
 #include <linux/of_address.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index eb93015be841..191040f6d60f 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -14,6 +14,7 @@
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index eb0b0f61d98e..8915fa250e81 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
@@ -12,6 +12,7 @@
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
diff --git a/drivers/phy/renesas/phy-rcar-gen3-pcie.c b/drivers/phy/renesas/phy-rcar-gen3-pcie.c
index c0e5a4ac82de..3e2cf59ad480 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-pcie.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-pcie.c
@@ -11,6 +11,7 @@
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/spinlock.h>
 
 #define PHY_CTRL		0x4000		/* R8A77980 only */
diff --git a/drivers/phy/renesas/r8a779f0-ether-serdes.c b/drivers/phy/renesas/r8a779f0-ether-serdes.c
index 8a6b6f366fe3..c34427ac4fdb 100644
--- a/drivers/phy/renesas/r8a779f0-ether-serdes.c
+++ b/drivers/phy/renesas/r8a779f0-ether-serdes.c
@@ -12,6 +12,7 @@
 #include <linux/phy.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
 #define R8A779F0_ETH_SERDES_NUM			3
diff --git a/drivers/phy/rockchip/phy-rockchip-typec.c b/drivers/phy/rockchip/phy-rockchip-typec.c
index d9701b6106d5..0a318ccf1bbf 100644
--- a/drivers/phy/rockchip/phy-rockchip-typec.c
+++ b/drivers/phy/rockchip/phy-rockchip-typec.c
@@ -49,6 +49,7 @@
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
diff --git a/drivers/phy/ti/phy-tusb1210.c b/drivers/phy/ti/phy-tusb1210.c
index c3ae9d7948d7..b7080403e649 100644
--- a/drivers/phy/ti/phy-tusb1210.c
+++ b/drivers/phy/ti/phy-tusb1210.c
@@ -13,6 +13,7 @@
 #include <linux/ulpi/regs.h>
 #include <linux/gpio/consumer.h>
 #include <linux/phy/ulpi_phy.h>
+#include <linux/pm_runtime.h>
 #include <linux/power_supply.h>
 #include <linux/property.h>
 #include <linux/workqueue.h>
-- 
2.43.0


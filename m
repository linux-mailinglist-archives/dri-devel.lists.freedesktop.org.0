Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBe5CZeGrWkE4AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DF9230A47
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C5110E375;
	Sun,  8 Mar 2026 14:13:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="RLbGRRPD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013024.outbound.protection.outlook.com [40.107.159.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50E9610E121;
 Sun,  8 Mar 2026 11:43:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fhvYQ4ViRRePLJP6TTyA6QVoI8+LHdQzPsSxGMbqErV6fCxxZwg7vAprMk7cm4z58/OlDm9g1/JMQoldlI/L+OQdOAlgw+RF0E8QA6NR912rjQqtIoS9MzOfyRSsbVwTUAHf3hAimWVRF1gPy0UpK2QzXtqRL3fnMsVDmFuc04bbQhUfupFipDaGA5XiHxHxMVDUnrBJbKYjMRbbiHelR3zMIPGbFQL34ONYgIy8HtiVyfXHAsaYANo3eZpMjvFB21lGQdAjTUxPIl59avGz2h07lfbxdgQOFNZIi+8at2q2BZhcv+1Qm9XWOPhIlst4N5laCDh0GHgQfGWUpPwnxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3tq6UW6ZXojHrjnIuE3HE/MqrIVaR97bCFVvoFODYOg=;
 b=ymLggWpYTb4Fm85P0LNJD/IyoZ7JfWJ6a1xqwliuNl2R+RKZyuaSjo3QFXr7bc3mDnSJ89NLiD3DvXI974OK+anSn1cC+aCSivCUuYH+P7t6rpRsNl8YdOj1koFnbUzQmxGHCSL4RcqjTI3e3Ru/OSsZbcVi7yQjg7Pq7Grh/QYu/G4xAs5IIhvdOI6LmHXpnkke9yofX868DMT8oam11rF0fUx6ZNy1c4pbnG6F2X08OQRzmVJdtUupVcTJEnhFyvlIKTreseIezXgfj1/QFMK2ykdzslAPOHtws5/SKAfHdnpNW+ar92nrgcNgM9dzzVO1AKYEiqg4/hwNYx5T0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3tq6UW6ZXojHrjnIuE3HE/MqrIVaR97bCFVvoFODYOg=;
 b=RLbGRRPDERN9eaCH77+tiQpKhf1Re8JI3BcRK/qkvqamr/ek0GxyOMLbvhxp9cRNFOUMlB00HDClVrm4XxVy9GgTB0CK/mPVEsiJGFwrm87GdJ0wDU7FaA+EMXx7q9n+/aoOW/W0e1MbBYBnWkmzCOkzLYJmK6PiHjJQ3SDuKn48koz9X2K/jsRJlbVGZtfISQ4XwsMIiqCTXTk64n2t2KBwJLPfC35A/P/L5Amc0D1ISNiPFDjCqe0nEwcJsj4xICoktY5woHXtLJTjAJHfu3G+4wxw/6dGgq0Kfu3X8DEfaMkxPBQJtpSbT7Bq7LrB7nE8GB3wv2dSOnTj0k0BIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by DB9PR04MB12426.eurprd04.prod.outlook.com (2603:10a6:10:614::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.23; Sun, 8 Mar
 2026 11:43:05 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.023; Sun, 8 Mar 2026
 11:43:05 +0000
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v2 phy-next 05/24] phy: add <linux/pm_runtime.h> where missing
Date: Sun,  8 Mar 2026 13:39:50 +0200
Message-ID: <20260308114009.2546587-6-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
References: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0902CA0053.eurprd09.prod.outlook.com
 (2603:10a6:802:1::42) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|DB9PR04MB12426:EE_
X-MS-Office365-Filtering-Correlation-Id: 962245e7-0a2d-4a80-0475-08de7d07dcb8
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|19092799006|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: 83X5Y/5OfXDxMggM+CHQQZZFxxjr6G1T9IW2cpBbWyVJIhI2uzJfMWksetM7PBNqwL0hzsOLCcUOM5mnt7PFMo44yATuaKbb0Wxpha2w5lmaxJd8dvBof1EFMl1qPglFBtldDKZPZBOsI3RmRgv50LEGr+Pj5Eifbyq+aagOeOHjZ4H8qSoOpF76RIQOTThFcPyi7R7E+NtOijhwoMF7ltzzKvn+J3fJ1SU65a05GuBkP+dUWkxQ/yntimUSl8Lo4bclD1z3botyvt1/wvR2QAUPCRjy0Uik9qVygogshxFuK+3aEFQzs6e5GBX8j+tyjoqQEHYQsNvv3+DFkPyIF2IBWUK0BnyvaRlNoId9MB5UarycrfJO2oG2fnqv3PMDGrM598eKqQyqu/jGHjOBmp2FUvitFiRZhsuq15Yja3WMHTlUzcbR2f503JBzlm27y+PBuT+JjiX8OeSbZaF8P5f3hMHKB0HlxcGNDnxXHkqZaIE0yUwPN1pLv0RPoMGzRAOTabipbUmZELNvSnaIYhr8YWbI5uzCrJaUFG20r1rxf8MPoHpzSQjMAM6Y8O9zEC1asPL/I00mSFXm9uM6TqD3v2OzQckIMQs3t/jS5IXkZ2avgrN3xlWasboXDF6R2cWbJSl4kW4m42/1prV5htBrRNBmRBpsWBFSDTgYLjiSPX3YyLkzI1afbd78FGdU11Ro3pqyaPWx7EvorT/wG2VgIE9AOsbYgmf5mQZbNXg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8585.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(19092799006)(10070799003)(1800799024);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVVYb2ZwaDc5K1lDc2MvZFVDMGR2anY3bndtQUdxM1Z0UEFkOVQ0MGY4cnZO?=
 =?utf-8?B?NWR4ckFodGZiQWN4amNoMnZ0WXluSEhIdTRoOHFSWDVKZGdNeGZuOUxCT3Yy?=
 =?utf-8?B?ZUxKYVF5K0E1RDZ3b2NJSEdCdVN3emVwTy95WTk5VG5rV3ZYUjRIZ0Y5bXpK?=
 =?utf-8?B?cVpPb1Q4TEFMbUg1cEtlZHBmRGM5MjRuYzE0bExCVUQ0aGFxNEdyY1pJcnJ4?=
 =?utf-8?B?dXFuek42S1RjVUgrRnd2N1NlR2d6Qk5GVWZhbm5mdVRFMG9qQ3lidm1qOFdr?=
 =?utf-8?B?N2dhaHlXajZ2bEtYV29iUGN4WW04ajNhT3cxM09ReWllVlBxWC8zcC9XeXYw?=
 =?utf-8?B?MzVOMG0wWEdIS0hpdXFURDJxaUJFeExBN3lldm9MdjJUVStHSXRCbk1GMHJy?=
 =?utf-8?B?dTZlZGoxYlN4ZlhxSmQ5cEJ4QWpSeGNPbFZMTG0zbndyems5ejJKdXE3V0Y0?=
 =?utf-8?B?dzFZbnpKdUwwQkhVNDYvZ0NzWFJhZFAxbi9MUXk1TndCbEtXMHJtSU84dERU?=
 =?utf-8?B?K2UzM0Vva0pUL0lhc3pJY2xnWnBhTVhYRzVXcHAxbmVBVVlFc3ZHcVUxY0h2?=
 =?utf-8?B?Nkh5R2J1TDdmNVBYTVFtQytuZ2hhZ2dkZ0ZZMzdDbFlLTElaazlFZDlUaUlG?=
 =?utf-8?B?MGdxem0xMU9oeEZNZ2IwQ20rb1lXSFA1WWQvQVp6RjRTTUFCT3Bnc3JaV3pJ?=
 =?utf-8?B?c09RRDV1c1piRHRzV0lUMmVUU0hLRHVsaS9sVjF5OHQyd0F2RFMzWnBPbVBz?=
 =?utf-8?B?M1NyZHBIT3JnSnFkMFF3MEtkdnhxVmlMNEhRMXF2L0RiSnNrMklSb1NNKy9q?=
 =?utf-8?B?cDZNRlgrT2czZ2NCRUFIYWRTQ1JtL0hyWFlWUjRwOEJ5UWpaR0V2aEgrYnNs?=
 =?utf-8?B?M2pJY0xORUpObytXQXY4N05GM1Z0L2ptQXJicVB0SHJodHZQY3hON3IrQmRW?=
 =?utf-8?B?QStlYnBqU0dHSC9lZWMwaVl4U3JjN2VwZlpNVUVNaEJnQTdIaHJlRTBnNnBW?=
 =?utf-8?B?Q2JtZjg0MU5DZlRGN1NvaTg1V00zTmErcW4yUmE5bUcybis4YmZuejlBLzFS?=
 =?utf-8?B?RnpObjlEc2g3SGc0QitPNW1PYkwzaXFJRTBVeHlSdXFvbmdJR0RJZFhWRTU1?=
 =?utf-8?B?WnJabUtPNHZpY1ZqWGZpZlpHZzgyenRHWlF3YVk3SkRpcWNhN0VCcitRaWh1?=
 =?utf-8?B?WGFQY3Y4enQxdUtTdTFFdUdpRlZFNmUvK3EzdnZYYVg1TXc4cWQ3bVorejg0?=
 =?utf-8?B?TkM3Ni9HQ0RheGJ5Vm1ZcDRKVndXRkd4VnZRbTZOTnNlekVMM29kSW9RRTJE?=
 =?utf-8?B?WDZJcTZVdWgzcHVGbmhOK1VqQ2tKNHFvRVlDdHROSGRQWGZNbDBMVEhlUTdW?=
 =?utf-8?B?ZFRPRy9Pa2ppWDFxVUQvRUxWQUFvaXQwOS9nRkNodm15MWVybVVWSGtwRm9y?=
 =?utf-8?B?ZXRsclNYVWdkSzRJeEI0V0Z0OWRkODA3N3lNOHo2Qlp5NGJjWk1ycGdrRWNj?=
 =?utf-8?B?R1VBckxSYmsyMXA2Yzd5YUR2WXgxODBTRFQxZEZpbEI1aytQNGxmT3kzNldH?=
 =?utf-8?B?blI2OFNyRk1GV1Z1UzV1Q0M2OEZvTEg2NDZFT1Vzcmg0MGJ2QmtRQlZCQVVs?=
 =?utf-8?B?NFdLYU5NaWkwUUdoWGtkUGd6TUFHRlNGVlArYWZrbmFwQnhMeW1KUnhTbjhu?=
 =?utf-8?B?bGM3V1N1K1EvVUs4YUV1bHpva09COFIrK3NieGNkUHE2Vk1VbTc4SHB2bjdw?=
 =?utf-8?B?eXdwVGF1Qm53QW1TVys5ZlJSOGtzT2JHU0Eyc2ZLT3RLTUJ1MVBBN0drMXpI?=
 =?utf-8?B?QVhGZjdOVURhKzNoSXRBMTBiMnNHNXVNT1B2NGgvcTJpdmpFeEFYNTJ4NGx0?=
 =?utf-8?B?L0pxVCt3eXVNLzZqMEJjYkNEUENpM05JSGVIOXRTZlFxT1VpN0tGbUE3T2tr?=
 =?utf-8?B?aUlWZlNwakVUV3ltQlpTWGtEQUxmSWhMNCtkV3c1YlI4dXZWMm5HSHJtbEJi?=
 =?utf-8?B?UEV5RlNYUTZzS0FLTGt1V0dBeU5FTUVNTU11TXFIak85VzV5TWppbk90ckd4?=
 =?utf-8?B?Qm9MeDRsejNLRTBXZllhR0xNNWlwWGRpT3d1TTlvSUVSbFVhNWFYK3lkYjlT?=
 =?utf-8?B?Y2J5QXdMMVNWMXVXRS9SNkdxbFB4ZmsreGtrNzN5VHFuWmdMUU83dGJkVXVQ?=
 =?utf-8?B?QStTU2pkWmo1TVIwWCtlNFN4ZFc5R1hPQlpVeHNadVhXbzVFR3dZU1ltaEFN?=
 =?utf-8?B?MDBRWkRuREhINmxDTXlsREdqMXY5UDRHOXNNYVMzVDdmU2pTZmQ5TU5iNDd0?=
 =?utf-8?B?ZlY0azBnK3dNYWZPRzhkZjJOZkhqVEd6OXJvbndPWFpLa2JQRmEyeDEwREJt?=
 =?utf-8?Q?NV2yOWW6EJXOt6JJ/e8fAjNmvK3Bo8gaUB/I6EB7ukmdM?=
X-MS-Exchange-AntiSpam-MessageData-1: ZQZ/TQDXkkGG3orqBZAiqVbQRe0L4TsHkqY=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 962245e7-0a2d-4a80-0475-08de7d07dcb8
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2026 11:43:05.5831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X/2B8dW1fPjaBTMnPdsKjEKehgkG+p8Y8LKBRzpSK0eJQ44pk+ykfHUEDlsOxTML9PkcBzedZRPFOG1ixpZGLg==
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
X-Rspamd-Queue-Id: 78DF9230A47
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.oltean@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,renesas];
	NEURAL_HAM(-0.00)[-0.984];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev,microchip.com,glider.be,gmail.com,sntech.de];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sntech.de:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nxp.com:dkim,nxp.com:email,nxp.com:mid,glider.be:email,linaro.org:email]
X-Rspamd-Action: no action

It appears that the phy-mapphone-mdm6600, phy-qcom-snps-femto-v2,
phy-rcar-gen3-pcie, r8a779f0-ether-serdes and phy-rockchip-typec drivers
call runtime PM operations without including the proper header.

This was provided by <linux/phy/phy.h> but no function exported by this
header directly needs it. So we need to drop it from there, and fix up
drivers that used to depend on that.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas
Reviewed-by: André Draszik <andre.draszik@linaro.org> # google
---
Cc: Peter Griffin <peter.griffin@linaro.org>
Cc: "André Draszik" <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>

v1->v2: collect tags
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


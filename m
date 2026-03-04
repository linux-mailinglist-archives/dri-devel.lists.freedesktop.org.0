Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gC54JAA6qWka3QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:08:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB6020D336
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:08:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C42210EB4F;
	Thu,  5 Mar 2026 08:08:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="b9Bl0o1z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012014.outbound.protection.outlook.com [52.101.66.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA6810EA87;
 Wed,  4 Mar 2026 18:00:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TTEoTjiD0h9XvP5epdDXApqMywGKcuAWYNYl1rZB3giIb81UoSYPvULlbi9dn5tOFqKlh40sYGKEWkWunrknohVgZdpmcbmL9sFK3H+sM3/H9zpovJnSse80gpyglwU0d8lrKwXvY4cXmLCAJCNSIy/7ffiFDD+p3J6emDg/dkgS5u/nMLvkhQOoBM/Oryz1JRs0KPKqlzIgEo7vGg/l4QinEOtoSyAdSojXWIPfOPetuUu2OvXrRuiFfg7t0QWHRZOA4OXSmX9MPNBM+ZyMjDOtFb8xkbjHlJrukz0aaRG2yU5Qx8JuGZaT/V80mgIsyYPead6e55Vw8r95LZP54A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ClwiCVu1IM3OlwEoGHemnbCtZhGroAT3y6zhN/ImBac=;
 b=Tis2r4LEODR58syOz0RbjO5R5oVKmPVjQSz9rmc6FvN/YBVz1EqPHo92W6dEO8YQXo/QpXkjfB2Vk2B6eKWwgbf7dyBQ5x614THAhkkpluVfnTHZrE/10Zczc1U+MNjttCzFHcoPirX/fU20ufbunRnmDUmykSedpq0Sv6CKdNuxp5iw0mtSYf+4C00jY603YMtkP8bfsZ6z0EpiUmVGccwO9sAyMpTGLZiBjd4aToqDnbP/AYe1z4YoHvm5kQOb9bs0twFzSyVXgzTnJdYyKMGfl51Jtct/3gosv4xuiNb1fHj9rjQy1CkuKKzovG74uyq5HLowIahoDKxaBTp8Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ClwiCVu1IM3OlwEoGHemnbCtZhGroAT3y6zhN/ImBac=;
 b=b9Bl0o1zqLlSoMuiUF4j4VP1SufLyEKL7K0jBpUkWEZhyLHvctc5xE3twS9Pd9ZKoCDQOjTng0TJ4+ggbU0ZJdsRZTWalQcB0ssM6uBcPvMakgVIxxmqaSY1RrlfsCII8XpJ3PKwGcXAnmEvCPjfxe43ngmjHE7/evd/vCBuAVhWL4qwHhDZeMzlysipISMIFyyVfa+5v1KFxgd8vPb0h6JxjV3p5ANxV7LTs+BTAaMMpq/mWHcyxfdw3cTVuJrBtxeoM8oxOJ3OjavBX9pxW3r914mpdSi7wgWsJSGTPw80bmLpEgxhpyh7Ilh+AO22XIlVpGEBVo7NGarETkKMQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by GV1PR04MB10275.eurprd04.prod.outlook.com (2603:10a6:150:1ad::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Wed, 4 Mar
 2026 18:00:38 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 18:00:37 +0000
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
 spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com
Subject: [PATCH phy-next 20/22] phy: include PHY provider header
Date: Wed,  4 Mar 2026 19:57:33 +0200
Message-ID: <20260304175735.2660419-21-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P195CA0030.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::19) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|GV1PR04MB10275:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fe40a89-d2da-4c95-86a9-08de7a17f088
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|10070799003|19092799006|1800799024|366016;
X-Microsoft-Antispam-Message-Info: lAv3E/gDHUIKqcALjHJvmvhdYlrdA4+r+KMdbM1O0/rslEuhsITb1xZrhmKJjaJfoPljtkl8xZZOOEIp2v2mlS6aWGUazo0tVKToDz5d1DUHPErkDoobrf/AwXMxV9tQMHhrQU1QAGpgIzuo3RBdhGLBG8OUds+3kvhj7ahYPgbhMbjBmSQKMv1A0vo1xKKh9kMCHHHGvOLhwVlG+HDWIDviys2Mh3uWWtM5ErqUGSegjM2GiDoKh5u5LVzoId8JP5aAep0/wN5JZcCgkjDLryPO/N3mcVkr9DrXFHepRNrrxG0jlv023C2RiYC1Gs28HwxnzAqScumSCmXuAj/d/yOUebBCZmZCbaHfkp6qxEIXfGijF+e+9d02PmKokOxLVq9bGSk/2pPNDbyGwiN7SKxDQW2lBMw+lWwBQPHS5QJDPRI266CCDAIeCOIi82lIUtdn8KSUh5srj9z4udHdxxAbhx3+DsdD6vDXKJ4smPuEminLH8yHhreecj0d4xeJg9Tgpkp26A1V3x2NLIuRZV+xdeInEbznZt3SX24oCua1DZkLeWUfzb0D06cvWEzQwCwgqe/RfS3MgubUVF9oDv5+m6GLMcP9iT8YxmS63WxMI6F6CNUNCFYABjuDXqt50jvab20i/sxWNr7g0WBdyqKZlENZu+WC5k49kfxXywAL/TbQFyzZ8IwSxS/An/dtzMDCDpZuNEa3XjQVOnPTiEIibZsjhdr2mNf1eL1hJvI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8585.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(10070799003)(19092799006)(1800799024)(366016);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GZmtUzvHJU+CnhMJLD5SG7kmdb5H+H4yIe1sHfxMa51Upxx0Ze49zSF9OFPJ?=
 =?us-ascii?Q?sfBXZoE0gu/EKNBoRbuwPbusk2+gc6NJki4Mw7AnzErKH0qRRYtkRbPSKDZn?=
 =?us-ascii?Q?tZe3cfg+fXIg0dgsm/+TCQ6gOIykRTsLtHpL/KsqJr+qa5QQ1AfEsoO/XoHU?=
 =?us-ascii?Q?MJdYuLAqeIQ2+dxzXsPzaDRqeoZ+cwVg6LBcWXJcTGDqjnL5Cm+ElTy8O2r+?=
 =?us-ascii?Q?QLyje/sv5IMbtQuIlPI24PYZTn5U4s9fJ9U/2OPIYKw9pHIFXLh2Sw4b6z/T?=
 =?us-ascii?Q?bovSg9cwDVBpLrWMidlekG5Qy3VIdqtvJL1Pg9zsBOp8erwDdXRpiZCcsyMh?=
 =?us-ascii?Q?Ao+rVRooQOdlKGZR/fXJH0wBPEMfpHvpP+PATl3EBgBZnEQDjvCeBTrMMzRs?=
 =?us-ascii?Q?ZXHfl+y+oXtVBRxtsMM0nRsSigwpBAye74I9m6xZASNKXPq0Jxb23oNQ0khz?=
 =?us-ascii?Q?b+9LBRx0/Fpe6On0ll50RNSi/PiC4iyd2BGNlkVP6zKYDKk+h9AanZ9MHD/D?=
 =?us-ascii?Q?tf90zZe00b4rnS3ggG9XZVrMUykdAvraXqd57SpHbXM95Dj+mfhHpmy5j/8s?=
 =?us-ascii?Q?JraXcebX1TuF797Xkn4ER/Nb5CZTJLh4NJ7CL7Rq+Tv9eMA9wW0zW1gy40wH?=
 =?us-ascii?Q?U1DnMAOa6k7J36ahJf2cl1TsVVmuJlk2AKepPOEYPBySgOU9SlUKaxbjpxqE?=
 =?us-ascii?Q?4m2tToijTx0/T1l64Jr4/dHZb/327m0RVs9PeysjQY62BqBzAWoTrQcI7m0s?=
 =?us-ascii?Q?dvFQqClCoisOfVhwlDgosrV5WwOmfkjDCDPyGQJW6BN8UWB+0C8Oxq7DR85d?=
 =?us-ascii?Q?pNpmfKxPX8O5R6qPdL04/c1t2d2jxGc7vUamkcSjCJ6VfVeDS0f5OEJ90UCu?=
 =?us-ascii?Q?X1k6aadXJnGnVRjsZ0xY7E1Mkd2XNIpH1w6BDjB+twW4Ulm3uS7Hr51A5O1l?=
 =?us-ascii?Q?Qb6AXwawcMqU4TrMOLsX162fQkTfz1PwvqUf2FFft2ZTRUbrik2Fra1ZBAoV?=
 =?us-ascii?Q?+Zrhhssb2wQlvbuBpmx9KHB+FlThweAnkowvfo/jvjcKX8hHqjNBw52qsQkT?=
 =?us-ascii?Q?ZP58xQgtb0e+m66pYffHX3wk9vvH0RWPb+ckReLJ4CqSEN4x4AjeD27A4kHP?=
 =?us-ascii?Q?wRgPc/z52jnoRjVmTbSNHAMCkr/rVON/qdWDm7uWuQ/fsY7CsHZ907SnwVRO?=
 =?us-ascii?Q?JQcY26DJ/ima1kH9LAU0H6Qy6GKZ1H2/faLVm/RbfnA8iJyOV5HoibgStmgH?=
 =?us-ascii?Q?J4AQoPtNXRNlQfIxldr7egdvr7zhxBDt5tMU5ohOovcA4BGzcjIc0R9PFiEc?=
 =?us-ascii?Q?1NUS1f7PdNOp0Adakf9JnF790SyJv1hQOzY15h4ysMdFET+e/WwLT0nFuucB?=
 =?us-ascii?Q?WuIGDWYZ533vulcP3r7JUZM2nR2XqlQBhUkvFZ0ec/jSBsV6n0bDVwVReWfu?=
 =?us-ascii?Q?jthYgy3JYq5qPZrJrwIm554+SEx+L071N6E7vxBs8ER8483Hqic1Ka4bVXWe?=
 =?us-ascii?Q?qSVD0B2zzYDXjHSoqOIm+j5AV2HpbBiDDmpuT9aG/ZRCSHIM5BLHOQtJ1MtG?=
 =?us-ascii?Q?PYQKOw0g2Mg3MEHq0LTXoD4RKzO4U740M+unlJDNWip4puRN8yqSa/AU7Yva?=
 =?us-ascii?Q?bVZiCv5edULvsmDFyIIEoeZbaGjs0oZfVeVoMeSUkGtFE06Akasy4mG+GCm1?=
 =?us-ascii?Q?DX85SYvGih2jFQwuULxlVWUFHXAMrVESgqOOfU/dVoNsut+HF16wDQhlIo5A?=
 =?us-ascii?Q?c/NsMZZZT4W7MXjUVpjl3vXMS5wr+fLuj1HMZrj/JiQkNtweeKX72naFW2M4?=
X-MS-Exchange-AntiSpam-MessageData-1: +0bK+ekqkODrkFyUc3EvSgrqF3WMh2CpBz4=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fe40a89-d2da-4c95-86a9-08de7a17f088
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 18:00:37.6946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7O+swUAH4mR3/YxNiCemF5VbNddfcdy2CzPhEQSvUzJK75e09FcSpmzsYAh+Ten0+pQjwH0cH8RxtPY8ykMLoA==
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
X-Rspamd-Queue-Id: DEB6020D336
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.oltean@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Action: no action

The majority of PHY drivers are PHY providers (obviously).

Some are providers *and* consumers (phy-meson-axg-mipi-dphy,
phy-meson-axg-pcie). These are the Amlogic AXG SoCs, which split the
physical layer into two chained PHYs: the digital layer and the analog
layer. The DSI or PCIe controller interacts only with the digital PHY,
presumably for simplicity.

The rest of PHY drivers which include <linux/phy/phy.h> do so because
they call phy_set_bus_width(), a consumer function.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 drivers/phy/allwinner/phy-sun4i-usb.c                 | 3 ++-
 drivers/phy/allwinner/phy-sun50i-usb3.c               | 3 ++-
 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c           | 4 ++--
 drivers/phy/allwinner/phy-sun9i-usb.c                 | 3 ++-
 drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c         | 2 ++
 drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c  | 3 ++-
 drivers/phy/amlogic/phy-meson-axg-pcie.c              | 2 ++
 drivers/phy/amlogic/phy-meson-g12a-mipi-dphy-analog.c | 3 ++-
 drivers/phy/amlogic/phy-meson-g12a-usb2.c             | 2 ++
 drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c        | 3 ++-
 drivers/phy/amlogic/phy-meson-gxl-usb2.c              | 3 ++-
 drivers/phy/amlogic/phy-meson8-hdmi-tx.c              | 3 ++-
 drivers/phy/amlogic/phy-meson8b-usb2.c                | 3 ++-
 drivers/phy/apple/atc.c                               | 3 ++-
 drivers/phy/broadcom/phy-bcm-cygnus-pcie.c            | 3 ++-
 drivers/phy/broadcom/phy-bcm-kona-usb2.c              | 4 +++-
 drivers/phy/broadcom/phy-bcm-ns-usb2.c                | 3 ++-
 drivers/phy/broadcom/phy-bcm-ns-usb3.c                | 3 ++-
 drivers/phy/broadcom/phy-bcm-ns2-pcie.c               | 3 ++-
 drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c             | 3 ++-
 drivers/phy/broadcom/phy-bcm-sr-pcie.c                | 3 ++-
 drivers/phy/broadcom/phy-bcm-sr-usb.c                 | 3 ++-
 drivers/phy/broadcom/phy-bcm63xx-usbh.c               | 3 ++-
 drivers/phy/broadcom/phy-brcm-sata.c                  | 3 ++-
 drivers/phy/broadcom/phy-brcm-usb.c                   | 2 +-
 drivers/phy/cadence/cdns-dphy-rx.c                    | 3 ++-
 drivers/phy/cadence/cdns-dphy.c                       | 4 ++--
 drivers/phy/cadence/phy-cadence-salvo.c               | 3 ++-
 drivers/phy/cadence/phy-cadence-sierra.c              | 3 ++-
 drivers/phy/cadence/phy-cadence-torrent.c             | 3 ++-
 drivers/phy/canaan/phy-k230-usb.c                     | 3 ++-
 drivers/phy/eswin/phy-eic7700-sata.c                  | 3 ++-
 drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c        | 3 ++-
 drivers/phy/freescale/phy-fsl-imx8m-pcie.c            | 4 ++--
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c            | 3 ++-
 drivers/phy/freescale/phy-fsl-imx8qm-hsio.c           | 6 +++---
 drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c       | 3 ++-
 drivers/phy/freescale/phy-fsl-lynx-28g.c              | 3 ++-
 drivers/phy/hisilicon/phy-hi3660-usb3.c               | 3 ++-
 drivers/phy/hisilicon/phy-hi3670-pcie.c               | 3 ++-
 drivers/phy/hisilicon/phy-hi3670-usb3.c               | 3 ++-
 drivers/phy/hisilicon/phy-hi6220-usb.c                | 3 ++-
 drivers/phy/hisilicon/phy-hisi-inno-usb2.c            | 4 +++-
 drivers/phy/hisilicon/phy-histb-combphy.c             | 3 ++-
 drivers/phy/hisilicon/phy-hix5hd2-sata.c              | 3 ++-
 drivers/phy/ingenic/phy-ingenic-usb.c                 | 3 ++-
 drivers/phy/intel/phy-intel-keembay-emmc.c            | 3 ++-
 drivers/phy/intel/phy-intel-keembay-usb.c             | 3 ++-
 drivers/phy/intel/phy-intel-lgm-combo.c               | 4 ++--
 drivers/phy/intel/phy-intel-lgm-emmc.c                | 3 ++-
 drivers/phy/lantiq/phy-lantiq-rcu-usb2.c              | 3 ++-
 drivers/phy/lantiq/phy-lantiq-vrx200-pcie.c           | 4 ++--
 drivers/phy/marvell/phy-armada375-usb2.c              | 3 ++-
 drivers/phy/marvell/phy-armada38x-comphy.c            | 3 ++-
 drivers/phy/marvell/phy-berlin-sata.c                 | 3 ++-
 drivers/phy/marvell/phy-berlin-usb.c                  | 3 ++-
 drivers/phy/marvell/phy-mmp3-hsic.c                   | 3 ++-
 drivers/phy/marvell/phy-mmp3-usb.c                    | 3 ++-
 drivers/phy/marvell/phy-mvebu-a3700-comphy.c          | 3 ++-
 drivers/phy/marvell/phy-mvebu-a3700-utmi.c            | 3 ++-
 drivers/phy/marvell/phy-mvebu-cp110-comphy.c          | 3 ++-
 drivers/phy/marvell/phy-mvebu-cp110-utmi.c            | 3 ++-
 drivers/phy/marvell/phy-mvebu-sata.c                  | 3 ++-
 drivers/phy/marvell/phy-pxa-28nm-hsic.c               | 3 ++-
 drivers/phy/marvell/phy-pxa-28nm-usb2.c               | 3 ++-
 drivers/phy/marvell/phy-pxa-usb.c                     | 3 ++-
 drivers/phy/mediatek/phy-mtk-dp.c                     | 3 ++-
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c            | 1 -
 drivers/phy/mediatek/phy-mtk-hdmi.h                   | 3 ++-
 drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c           | 2 +-
 drivers/phy/mediatek/phy-mtk-mipi-dsi.h               | 3 ++-
 drivers/phy/mediatek/phy-mtk-pcie.c                   | 2 +-
 drivers/phy/mediatek/phy-mtk-tphy.c                   | 2 +-
 drivers/phy/mediatek/phy-mtk-ufs.c                    | 2 +-
 drivers/phy/mediatek/phy-mtk-xfi-tphy.c               | 2 +-
 drivers/phy/mediatek/phy-mtk-xsphy.c                  | 2 +-
 drivers/phy/microchip/lan966x_serdes.c                | 4 ++--
 drivers/phy/microchip/sparx5_serdes.c                 | 2 +-
 drivers/phy/motorola/phy-cpcap-usb.c                  | 3 ++-
 drivers/phy/motorola/phy-mapphone-mdm6600.c           | 4 +++-
 drivers/phy/mscc/phy-ocelot-serdes.c                  | 3 ++-
 drivers/phy/nuvoton/phy-ma35d1-usb2.c                 | 3 ++-
 drivers/phy/phy-airoha-pcie.c                         | 2 +-
 drivers/phy/phy-can-transceiver.c                     | 3 ++-
 drivers/phy/phy-core-mipi-dphy.c                      | 4 ++--
 drivers/phy/phy-core.c                                | 2 ++
 drivers/phy/phy-google-usb.c                          | 3 ++-
 drivers/phy/phy-lpc18xx-usb-otg.c                     | 3 ++-
 drivers/phy/phy-nxp-ptn3222.c                         | 3 ++-
 drivers/phy/phy-pistachio-usb.c                       | 4 ++--
 drivers/phy/phy-snps-eusb2.c                          | 2 ++
 drivers/phy/phy-xgene.c                               | 3 ++-
 drivers/phy/qualcomm/phy-ath79-usb.c                  | 3 ++-
 drivers/phy/qualcomm/phy-qcom-apq8064-sata.c          | 3 ++-
 drivers/phy/qualcomm/phy-qcom-edp.c                   | 3 ++-
 drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c        | 3 ++-
 drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c           | 3 ++-
 drivers/phy/qualcomm/phy-qcom-ipq806x-sata.c          | 3 ++-
 drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c           | 3 ++-
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c             | 2 ++
 drivers/phy/qualcomm/phy-qcom-m31.c                   | 3 ++-
 drivers/phy/qualcomm/phy-qcom-pcie2.c                 | 3 ++-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c             | 3 ++-
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c      | 3 ++-
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c              | 3 ++-
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c               | 3 ++-
 drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c        | 3 ++-
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c               | 3 ++-
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c              | 3 ++-
 drivers/phy/qualcomm/phy-qcom-qusb2.c                 | 4 ++--
 drivers/phy/qualcomm/phy-qcom-sgmii-eth.c             | 3 ++-
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c         | 3 ++-
 drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c      | 3 ++-
 drivers/phy/qualcomm/phy-qcom-usb-hs-28nm.c           | 3 ++-
 drivers/phy/qualcomm/phy-qcom-usb-hs.c                | 3 ++-
 drivers/phy/qualcomm/phy-qcom-usb-hsic.c              | 3 ++-
 drivers/phy/qualcomm/phy-qcom-usb-ss.c                | 3 ++-
 drivers/phy/ralink/phy-mt7621-pci.c                   | 3 ++-
 drivers/phy/ralink/phy-ralink-usb.c                   | 3 ++-
 drivers/phy/realtek/phy-rtk-usb2.c                    | 3 ++-
 drivers/phy/realtek/phy-rtk-usb3.c                    | 3 ++-
 drivers/phy/renesas/phy-rcar-gen2.c                   | 3 ++-
 drivers/phy/renesas/phy-rcar-gen3-pcie.c              | 3 ++-
 drivers/phy/renesas/phy-rcar-gen3-usb2.c              | 3 ++-
 drivers/phy/renesas/phy-rcar-gen3-usb3.c              | 3 ++-
 drivers/phy/renesas/phy-rzg3e-usb3.c                  | 3 ++-
 drivers/phy/renesas/r8a779f0-ether-serdes.c           | 3 ++-
 drivers/phy/rockchip/phy-rockchip-dp.c                | 3 ++-
 drivers/phy/rockchip/phy-rockchip-dphy-rx0.c          | 3 ++-
 drivers/phy/rockchip/phy-rockchip-emmc.c              | 3 ++-
 drivers/phy/rockchip/phy-rockchip-inno-csidphy.c      | 3 ++-
 drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c      | 4 ++--
 drivers/phy/rockchip/phy-rockchip-inno-hdmi.c         | 2 ++
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c         | 3 ++-
 drivers/phy/rockchip/phy-rockchip-naneng-combphy.c    | 3 ++-
 drivers/phy/rockchip/phy-rockchip-pcie.c              | 2 +-
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c     | 3 ++-
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c     | 2 ++
 drivers/phy/rockchip/phy-rockchip-snps-pcie3.c        | 3 ++-
 drivers/phy/rockchip/phy-rockchip-typec.c             | 4 ++--
 drivers/phy/rockchip/phy-rockchip-usb.c               | 3 ++-
 drivers/phy/rockchip/phy-rockchip-usbdp.c             | 2 ++
 drivers/phy/samsung/phy-exynos-dp-video.c             | 3 ++-
 drivers/phy/samsung/phy-exynos-mipi-video.c           | 3 ++-
 drivers/phy/samsung/phy-exynos-pcie.c                 | 3 ++-
 drivers/phy/samsung/phy-exynos4210-usb2.c             | 3 ++-
 drivers/phy/samsung/phy-exynos4x12-usb2.c             | 3 ++-
 drivers/phy/samsung/phy-exynos5-usbdrd.c              | 2 ++
 drivers/phy/samsung/phy-exynos5250-sata.c             | 3 ++-
 drivers/phy/samsung/phy-exynos5250-usb2.c             | 3 ++-
 drivers/phy/samsung/phy-s5pv210-usb2.c                | 3 ++-
 drivers/phy/samsung/phy-samsung-ufs.c                 | 2 +-
 drivers/phy/samsung/phy-samsung-ufs.h                 | 3 ++-
 drivers/phy/samsung/phy-samsung-usb2.c                | 2 ++
 drivers/phy/samsung/phy-samsung-usb2.h                | 3 ++-
 drivers/phy/socionext/phy-uniphier-ahci.c             | 3 ++-
 drivers/phy/socionext/phy-uniphier-pcie.c             | 3 ++-
 drivers/phy/socionext/phy-uniphier-usb2.c             | 3 ++-
 drivers/phy/socionext/phy-uniphier-usb3hs.c           | 3 ++-
 drivers/phy/socionext/phy-uniphier-usb3ss.c           | 3 ++-
 drivers/phy/sophgo/phy-cv1800-usb2.c                  | 3 ++-
 drivers/phy/spacemit/phy-k1-pcie.c                    | 4 ++--
 drivers/phy/spacemit/phy-k1-usb2.c                    | 3 ++-
 drivers/phy/st/phy-miphy28lp.c                        | 4 ++--
 drivers/phy/st/phy-spear1310-miphy.c                  | 3 ++-
 drivers/phy/st/phy-spear1340-miphy.c                  | 3 ++-
 drivers/phy/st/phy-stih407-usb.c                      | 3 ++-
 drivers/phy/st/phy-stm32-combophy.c                   | 3 ++-
 drivers/phy/st/phy-stm32-usbphyc.c                    | 2 ++
 drivers/phy/starfive/phy-jh7110-dphy-rx.c             | 3 ++-
 drivers/phy/starfive/phy-jh7110-dphy-tx.c             | 3 ++-
 drivers/phy/starfive/phy-jh7110-pcie.c                | 3 ++-
 drivers/phy/starfive/phy-jh7110-usb.c                 | 3 ++-
 drivers/phy/sunplus/phy-sunplus-usb2.c                | 3 ++-
 drivers/phy/tegra/phy-tegra194-p2u.c                  | 3 ++-
 drivers/phy/tegra/xusb-tegra124.c                     | 2 +-
 drivers/phy/tegra/xusb-tegra186.c                     | 2 +-
 drivers/phy/tegra/xusb-tegra210.c                     | 2 +-
 drivers/phy/tegra/xusb.c                              | 2 +-
 drivers/phy/ti/phy-am654-serdes.c                     | 3 ++-
 drivers/phy/ti/phy-da8xx-usb.c                        | 3 ++-
 drivers/phy/ti/phy-dm816x-usb.c                       | 3 ++-
 drivers/phy/ti/phy-gmii-sel.c                         | 3 ++-
 drivers/phy/ti/phy-omap-usb2.c                        | 3 ++-
 drivers/phy/ti/phy-ti-pipe3.c                         | 3 ++-
 drivers/phy/ti/phy-twl4030-usb.c                      | 3 ++-
 drivers/phy/xilinx/phy-zynqmp.c                       | 4 ++--
 include/linux/phy/phy-sun4i-usb.h                     | 2 +-
 include/linux/phy/ulpi_phy.h                          | 2 +-
 189 files changed, 363 insertions(+), 193 deletions(-)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index e2fbf8ccf99e..9a03b5944b98 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -23,7 +23,6 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/phy/phy-sun4i-usb.h>
 #include <linux/platform_device.h>
 #include <linux/power_supply.h>
@@ -33,6 +32,8 @@
 #include <linux/usb/of.h>
 #include <linux/workqueue.h>
 
+#include "../phy-provider.h"
+
 #define REG_ISCR			0x00
 #define REG_PHYCTL_A10			0x04
 #define REG_PHYBIST			0x08
diff --git a/drivers/phy/allwinner/phy-sun50i-usb3.c b/drivers/phy/allwinner/phy-sun50i-usb3.c
index 363f9a0df503..d38b26e4bf95 100644
--- a/drivers/phy/allwinner/phy-sun50i-usb3.c
+++ b/drivers/phy/allwinner/phy-sun50i-usb3.c
@@ -18,10 +18,11 @@
 #include <linux/io.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 
+#include "../phy-provider.h"
+
 /* Interface Status and Control Registers */
 #define SUNXI_ISCR			0x00
 #define SUNXI_PIPE_CLOCK_CONTROL	0x14
diff --git a/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c b/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c
index 36eab95271b2..e96162d078eb 100644
--- a/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c
+++ b/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c
@@ -10,12 +10,12 @@
 #include <linux/clk.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
+#include <linux/phy/phy-mipi-dphy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
-#include <linux/phy/phy.h>
-#include <linux/phy/phy-mipi-dphy.h>
+#include "../phy-provider.h"
 
 #define SUN6I_DPHY_GCTL_REG		0x00
 #define SUN6I_DPHY_GCTL_LANE_NUM(n)		((((n) - 1) & 3) << 4)
diff --git a/drivers/phy/allwinner/phy-sun9i-usb.c b/drivers/phy/allwinner/phy-sun9i-usb.c
index 2f9e60c188b8..f667f3f4b307 100644
--- a/drivers/phy/allwinner/phy-sun9i-usb.c
+++ b/drivers/phy/allwinner/phy-sun9i-usb.c
@@ -15,11 +15,12 @@
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/phy/phy.h>
 #include <linux/usb/of.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 
+#include "../phy-provider.h"
+
 #define SUNXI_AHB_INCR16_BURST_EN	BIT(11)
 #define SUNXI_AHB_INCR8_BURST_EN	BIT(10)
 #define SUNXI_AHB_INCR4_BURST_EN	BIT(9)
diff --git a/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c b/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
index c4a56b9d3289..60d17973a38f 100644
--- a/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
+++ b/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
@@ -20,6 +20,8 @@
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 
+#include "../phy-provider.h"
+
 /* [31] soft reset for the phy.
  *		1: reset. 0: dessert the reset.
  * [30] clock lane soft reset.
diff --git a/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c b/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c
index c0ba2852dbb8..21e8e2a5563a 100644
--- a/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c
+++ b/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c
@@ -7,7 +7,6 @@
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/module.h>
-#include <linux/phy/phy.h>
 #include <linux/regmap.h>
 #include <linux/delay.h>
 #include <linux/mfd/syscon.h>
@@ -15,6 +14,8 @@
 #include <linux/platform_device.h>
 #include <dt-bindings/phy/phy.h>
 
+#include "../phy-provider.h"
+
 #define HHI_MIPI_CNTL0 0x00
 #define		HHI_MIPI_CNTL0_COMMON_BLOCK	GENMASK(31, 28)
 #define		HHI_MIPI_CNTL0_ENABLE		BIT(29)
diff --git a/drivers/phy/amlogic/phy-meson-axg-pcie.c b/drivers/phy/amlogic/phy-meson-axg-pcie.c
index 14dee73f9cb5..c4d9faf3a805 100644
--- a/drivers/phy/amlogic/phy-meson-axg-pcie.c
+++ b/drivers/phy/amlogic/phy-meson-axg-pcie.c
@@ -13,6 +13,8 @@
 #include <linux/bitfield.h>
 #include <dt-bindings/phy/phy.h>
 
+#include "../phy-provider.h"
+
 #define MESON_PCIE_REG0 0x00
 #define		MESON_PCIE_COMMON_CLK	BIT(4)
 #define		MESON_PCIE_PORT_SEL	GENMASK(3, 2)
diff --git a/drivers/phy/amlogic/phy-meson-g12a-mipi-dphy-analog.c b/drivers/phy/amlogic/phy-meson-g12a-mipi-dphy-analog.c
index 46e5f7e7eb6c..11626f4528dd 100644
--- a/drivers/phy/amlogic/phy-meson-g12a-mipi-dphy-analog.c
+++ b/drivers/phy/amlogic/phy-meson-g12a-mipi-dphy-analog.c
@@ -9,7 +9,6 @@
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/module.h>
-#include <linux/phy/phy.h>
 #include <linux/regmap.h>
 #include <linux/delay.h>
 #include <linux/mfd/syscon.h>
@@ -17,6 +16,8 @@
 #include <linux/platform_device.h>
 #include <dt-bindings/phy/phy.h>
 
+#include "../phy-provider.h"
+
 #define HHI_MIPI_CNTL0 0x00
 #define		HHI_MIPI_CNTL0_DIF_REF_CTL1	GENMASK(31, 16)
 #define		HHI_MIPI_CNTL0_DIF_REF_CTL0	GENMASK(15, 0)
diff --git a/drivers/phy/amlogic/phy-meson-g12a-usb2.c b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
index 66bf0b7ef8ed..6e599b933153 100644
--- a/drivers/phy/amlogic/phy-meson-g12a-usb2.c
+++ b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
@@ -20,6 +20,8 @@
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 
+#include "../phy-provider.h"
+
 #define PHY_CTRL_R0						0x0
 #define PHY_CTRL_R1						0x4
 #define PHY_CTRL_R2						0x8
diff --git a/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c b/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c
index 5468831d6ab9..60e9c3c1c449 100644
--- a/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c
+++ b/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c
@@ -12,12 +12,13 @@
 #include <linux/clk.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/platform_device.h>
 #include <dt-bindings/phy/phy.h>
 
+#include "../phy-provider.h"
+
 #define PHY_R0							0x00
 	#define PHY_R0_PCIE_POWER_STATE				GENMASK(4, 0)
 	#define PHY_R0_PCIE_USB3_SWITCH				GENMASK(6, 5)
diff --git a/drivers/phy/amlogic/phy-meson-gxl-usb2.c b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
index 6b390304f723..b8d5b12cffc8 100644
--- a/drivers/phy/amlogic/phy-meson-gxl-usb2.c
+++ b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
@@ -12,9 +12,10 @@
 #include <linux/module.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 
+#include "../phy-provider.h"
+
 /* bits [31:27] are read-only */
 #define U2P_R0							0x0
 	#define U2P_R0_BYPASS_SEL				BIT(0)
diff --git a/drivers/phy/amlogic/phy-meson8-hdmi-tx.c b/drivers/phy/amlogic/phy-meson8-hdmi-tx.c
index 2617f7f6c2ec..2a8c93dcda7e 100644
--- a/drivers/phy/amlogic/phy-meson8-hdmi-tx.c
+++ b/drivers/phy/amlogic/phy-meson8-hdmi-tx.c
@@ -11,11 +11,12 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 /*
  * Unfortunately there is no detailed documentation available for the
  * HHI_HDMI_PHY_CNTL0 register. CTL0 and CTL1 is all we know about.
diff --git a/drivers/phy/amlogic/phy-meson8b-usb2.c b/drivers/phy/amlogic/phy-meson8b-usb2.c
index a553231a9f7c..b288868b2d9e 100644
--- a/drivers/phy/amlogic/phy-meson8b-usb2.c
+++ b/drivers/phy/amlogic/phy-meson8b-usb2.c
@@ -14,10 +14,11 @@
 #include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/usb/of.h>
 
+#include "../phy-provider.h"
+
 #define REG_CONFIG					0x00
 	#define REG_CONFIG_CLK_EN			BIT(0)
 	#define REG_CONFIG_CLK_SEL_MASK			GENMASK(3, 1)
diff --git a/drivers/phy/apple/atc.c b/drivers/phy/apple/atc.c
index e9d106f135c5..de9453d13c0e 100644
--- a/drivers/phy/apple/atc.c
+++ b/drivers/phy/apple/atc.c
@@ -32,7 +32,6 @@
 #include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/reset-controller.h>
 #include <linux/soc/apple/tunable.h>
@@ -44,6 +43,8 @@
 #include <linux/usb/typec_mux.h>
 #include <linux/usb/typec_tbt.h>
 
+#include "../phy-provider.h"
+
 #define AUSPLL_FSM_CTRL 0x1014
 
 #define AUSPLL_APB_CMD_OVERRIDE 0x2000
diff --git a/drivers/phy/broadcom/phy-bcm-cygnus-pcie.c b/drivers/phy/broadcom/phy-bcm-cygnus-pcie.c
index 462c61a24ec5..e10274f53c10 100644
--- a/drivers/phy/broadcom/phy-bcm-cygnus-pcie.c
+++ b/drivers/phy/broadcom/phy-bcm-cygnus-pcie.c
@@ -5,9 +5,10 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 
+#include "../phy-provider.h"
+
 #define PCIE_CFG_OFFSET         0x00
 #define PCIE1_PHY_IDDQ_SHIFT    10
 #define PCIE0_PHY_IDDQ_SHIFT    2
diff --git a/drivers/phy/broadcom/phy-bcm-kona-usb2.c b/drivers/phy/broadcom/phy-bcm-kona-usb2.c
index e9cc5f2cb89a..356f42a08941 100644
--- a/drivers/phy/broadcom/phy-bcm-kona-usb2.c
+++ b/drivers/phy/broadcom/phy-bcm-kona-usb2.c
@@ -12,9 +12,11 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
+#include <linux/phy/phy.h> /* for phy_set_bus_width() */
 #include <linux/platform_device.h>
 
+#include "../phy-provider.h"
+
 #define OTGCTL			(0)
 #define OTGCTL_OTGSTAT2		BIT(31)
 #define OTGCTL_OTGSTAT1		BIT(30)
diff --git a/drivers/phy/broadcom/phy-bcm-ns-usb2.c b/drivers/phy/broadcom/phy-bcm-ns-usb2.c
index c5d35031b398..95331d08b367 100644
--- a/drivers/phy/broadcom/phy-bcm-ns-usb2.c
+++ b/drivers/phy/broadcom/phy-bcm-ns-usb2.c
@@ -13,11 +13,12 @@
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
+#include "../phy-provider.h"
+
 struct bcm_ns_usb2 {
 	struct device *dev;
 	struct clk *ref_clk;
diff --git a/drivers/phy/broadcom/phy-bcm-ns-usb3.c b/drivers/phy/broadcom/phy-bcm-ns-usb3.c
index 6e56498d0644..f2aa4014f197 100644
--- a/drivers/phy/broadcom/phy-bcm-ns-usb3.c
+++ b/drivers/phy/broadcom/phy-bcm-ns-usb3.c
@@ -19,10 +19,11 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
-#include <linux/phy/phy.h>
 #include <linux/property.h>
 #include <linux/slab.h>
 
+#include "../phy-provider.h"
+
 #define BCM_NS_USB3_PHY_BASE_ADDR_REG	0x1f
 #define BCM_NS_USB3_PHY_PLL30_BLOCK	0x8000
 #define BCM_NS_USB3_PHY_TX_PMD_BLOCK	0x8040
diff --git a/drivers/phy/broadcom/phy-bcm-ns2-pcie.c b/drivers/phy/broadcom/phy-bcm-ns2-pcie.c
index 67a6ae5ecba0..9c2c603426ca 100644
--- a/drivers/phy/broadcom/phy-bcm-ns2-pcie.c
+++ b/drivers/phy/broadcom/phy-bcm-ns2-pcie.c
@@ -6,7 +6,8 @@
 #include <linux/of_mdio.h>
 #include <linux/mdio.h>
 #include <linux/phy.h>
-#include <linux/phy/phy.h>
+
+#include "../phy-provider.h"
 
 #define BLK_ADDR_REG_OFFSET	0x1f
 #define PLL_AFE1_100MHZ_BLK	0x2100
diff --git a/drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c b/drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c
index 8473fa574529..7543211fb998 100644
--- a/drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c
+++ b/drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c
@@ -14,12 +14,13 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/workqueue.h>
 
+#include "../phy-provider.h"
+
 #define ICFG_DRD_AFE		0x0
 #define ICFG_MISC_STAT		0x18
 #define ICFG_DRD_P0CTL		0x1C
diff --git a/drivers/phy/broadcom/phy-bcm-sr-pcie.c b/drivers/phy/broadcom/phy-bcm-sr-pcie.c
index 706e1d83b4ce..8f4e44d1dea6 100644
--- a/drivers/phy/broadcom/phy-bcm-sr-pcie.c
+++ b/drivers/phy/broadcom/phy-bcm-sr-pcie.c
@@ -9,10 +9,11 @@
 #include <linux/module.h>
 #include <linux/mfd/syscon.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 /* we have up to 8 PAXB based RC. The 9th one is always PAXC */
 #define SR_NR_PCIE_PHYS               9
 #define SR_PAXC_PHY_IDX               (SR_NR_PCIE_PHYS - 1)
diff --git a/drivers/phy/broadcom/phy-bcm-sr-usb.c b/drivers/phy/broadcom/phy-bcm-sr-usb.c
index 6bcfe83609c8..4c863738bdca 100644
--- a/drivers/phy/broadcom/phy-bcm-sr-usb.c
+++ b/drivers/phy/broadcom/phy-bcm-sr-usb.c
@@ -8,9 +8,10 @@
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 
+#include "../phy-provider.h"
+
 enum bcm_usb_phy_version {
 	BCM_SR_USB_COMBO_PHY,
 	BCM_SR_USB_HS_PHY,
diff --git a/drivers/phy/broadcom/phy-bcm63xx-usbh.c b/drivers/phy/broadcom/phy-bcm63xx-usbh.c
index 29fd6791bae6..63099da486c6 100644
--- a/drivers/phy/broadcom/phy-bcm63xx-usbh.c
+++ b/drivers/phy/broadcom/phy-bcm63xx-usbh.c
@@ -18,10 +18,11 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 
+#include "../phy-provider.h"
+
 /* USBH control register offsets */
 enum usbh_regs {
 	USBH_BRT_CONTROL1 = 0,
diff --git a/drivers/phy/broadcom/phy-brcm-sata.c b/drivers/phy/broadcom/phy-brcm-sata.c
index fb69e21a0292..ab826f9c8678 100644
--- a/drivers/phy/broadcom/phy-brcm-sata.c
+++ b/drivers/phy/broadcom/phy-brcm-sata.c
@@ -13,9 +13,10 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 
+#include "../phy-provider.h"
+
 #define SATA_PCB_BANK_OFFSET				0x23c
 #define SATA_PCB_REG_OFFSET(ofs)			((ofs) * 4)
 
diff --git a/drivers/phy/broadcom/phy-brcm-usb.c b/drivers/phy/broadcom/phy-brcm-usb.c
index 59d756a10d6c..d660a0ed03ee 100644
--- a/drivers/phy/broadcom/phy-brcm-usb.c
+++ b/drivers/phy/broadcom/phy-brcm-usb.c
@@ -11,7 +11,6 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/interrupt.h>
 #include <linux/soc/brcmstb/brcmstb.h>
@@ -19,6 +18,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/suspend.h>
 
+#include "../phy-provider.h"
 #include "phy-brcm-usb-init.h"
 
 static DEFINE_MUTEX(sysfs_lock);
diff --git a/drivers/phy/cadence/cdns-dphy-rx.c b/drivers/phy/cadence/cdns-dphy-rx.c
index 3ac80141189c..7097ac17443f 100644
--- a/drivers/phy/cadence/cdns-dphy-rx.c
+++ b/drivers/phy/cadence/cdns-dphy-rx.c
@@ -9,12 +9,13 @@
 #include <linux/iopoll.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/phy/phy.h>
 #include <linux/phy/phy-mipi-dphy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/sys_soc.h>
 
+#include "../phy-provider.h"
+
 #define DPHY_PMA_CMN(reg)		(reg)
 #define DPHY_PCS(reg)			(0xb00 + (reg))
 #define DPHY_ISO(reg)			(0xc00 + (reg))
diff --git a/drivers/phy/cadence/cdns-dphy.c b/drivers/phy/cadence/cdns-dphy.c
index d5b0e516b93c..40bc18405082 100644
--- a/drivers/phy/cadence/cdns-dphy.c
+++ b/drivers/phy/cadence/cdns-dphy.c
@@ -10,11 +10,11 @@
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/phy/phy-mipi-dphy.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 
-#include <linux/phy/phy.h>
-#include <linux/phy/phy-mipi-dphy.h>
+#include "../phy-provider.h"
 
 #define REG_WAKEUP_TIME_NS		800
 #define DPHY_PLL_RATE_HZ		108000000
diff --git a/drivers/phy/cadence/phy-cadence-salvo.c b/drivers/phy/cadence/phy-cadence-salvo.c
index f461585c84c6..8ed74db50dfa 100644
--- a/drivers/phy/cadence/phy-cadence-salvo.c
+++ b/drivers/phy/cadence/phy-cadence-salvo.c
@@ -10,12 +10,13 @@
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/delay.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
 
+#include "../phy-provider.h"
+
 #define USB3_PHY_OFFSET			0x0
 #define USB2_PHY_OFFSET			0x38000
 /* USB3 PHY register definition */
diff --git a/drivers/phy/cadence/phy-cadence-sierra.c b/drivers/phy/cadence/phy-cadence-sierra.c
index 92ab1a31646a..fb44b8fc5e3f 100644
--- a/drivers/phy/cadence/phy-cadence-sierra.c
+++ b/drivers/phy/cadence/phy-cadence-sierra.c
@@ -12,7 +12,6 @@
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
@@ -23,6 +22,8 @@
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/phy/phy-cadence.h>
 
+#include "../phy-provider.h"
+
 #define NUM_SSC_MODE		3
 #define NUM_PHY_TYPE		5
 
diff --git a/drivers/phy/cadence/phy-cadence-torrent.c b/drivers/phy/cadence/phy-cadence-torrent.c
index d446a0f97688..974e12e34ae1 100644
--- a/drivers/phy/cadence/phy-cadence-torrent.c
+++ b/drivers/phy/cadence/phy-cadence-torrent.c
@@ -17,11 +17,12 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 #define REF_CLK_19_2MHZ		19200000
 #define REF_CLK_25MHZ		25000000
 #define REF_CLK_100MHZ		100000000
diff --git a/drivers/phy/canaan/phy-k230-usb.c b/drivers/phy/canaan/phy-k230-usb.c
index 52dad35fc6cf..4305763a5456 100644
--- a/drivers/phy/canaan/phy-k230-usb.c
+++ b/drivers/phy/canaan/phy-k230-usb.c
@@ -8,9 +8,10 @@
 #include <linux/bitfield.h>
 #include <linux/io.h>
 #include <linux/of_address.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 
+#include "../phy-provider.h"
+
 #define MAX_PHYS		2
 
 /* Register offsets within the HiSysConfig system controller */
diff --git a/drivers/phy/eswin/phy-eic7700-sata.c b/drivers/phy/eswin/phy-eic7700-sata.c
index c33653d48daa..387d5c8c11d9 100644
--- a/drivers/phy/eswin/phy-eic7700-sata.c
+++ b/drivers/phy/eswin/phy-eic7700-sata.c
@@ -14,11 +14,12 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
+#include "../phy-provider.h"
+
 #define SATA_AXI_LP_CTRL			0x08
 #define SATA_MPLL_CTRL				0x20
 #define SATA_P0_PHY_STAT			0x24
diff --git a/drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c b/drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c
index 0928a526e2ab..314aa227f753 100644
--- a/drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c
+++ b/drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c
@@ -16,11 +16,12 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <dt-bindings/firmware/imx/rsrc.h>
 
+#include "../phy-provider.h"
+
 /* Control and Status Registers(CSR) */
 #define PHY_CTRL			0x00
 #define  CCM_MASK			GENMASK(7, 5)
diff --git a/drivers/phy/freescale/phy-fsl-imx8m-pcie.c b/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
index 7f5600103a00..6197cfc9b9a4 100644
--- a/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
+++ b/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
@@ -3,6 +3,7 @@
  * Copyright 2021 NXP
  */
 
+#include <dt-bindings/phy/phy-imx8-pcie.h>
 #include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
@@ -12,12 +13,11 @@
 #include <linux/mfd/syscon/imx7-iomuxc-gpr.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
-#include <dt-bindings/phy/phy-imx8-pcie.h>
+#include "../phy-provider.h"
 
 #define IMX8MM_PCIE_PHY_CMN_REG061	0x184
 #define  ANA_PLL_CLK_OUT_TO_EXT_IO_EN	BIT(0)
diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index b05d80e849a1..9b938b446996 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -7,11 +7,12 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/usb/typec_mux.h>
 
+#include "../phy-provider.h"
+
 #define PHY_CTRL0			0x0
 #define PHY_CTRL0_REF_SSP_EN		BIT(2)
 #define PHY_CTRL0_FSEL_MASK		GENMASK(10, 5)
diff --git a/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c b/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c
index 279b8ac7822d..b274fd24b59a 100644
--- a/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c
+++ b/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c
@@ -3,6 +3,8 @@
  * Copyright 2024 NXP
  */
 
+#include <dt-bindings/phy/phy.h>
+#include <dt-bindings/phy/phy-imx8-pcie.h>
 #include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
@@ -11,13 +13,11 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/pci_regs.h>
-#include <linux/phy/phy.h>
 #include <linux/phy/pcie.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
-#include <dt-bindings/phy/phy.h>
-#include <dt-bindings/phy/phy-imx8-pcie.h>
+#include "../phy-provider.h"
 
 #define MAX_NUM_LANE	3
 #define LANE_NUM_CLKS	5
diff --git a/drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c b/drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c
index ece357443521..55c23bef5121 100644
--- a/drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c
+++ b/drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c
@@ -9,12 +9,13 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/units.h>
 
+#include "../phy-provider.h"
+
 #define REG_SET		0x4
 #define REG_CLR		0x8
 
diff --git a/drivers/phy/freescale/phy-fsl-lynx-28g.c b/drivers/phy/freescale/phy-fsl-lynx-28g.c
index 2b0fd95ba62f..c4df5966ddfb 100644
--- a/drivers/phy/freescale/phy-fsl-lynx-28g.c
+++ b/drivers/phy/freescale/phy-fsl-lynx-28g.c
@@ -5,10 +5,11 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/phy.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/workqueue.h>
 
+#include "../phy-provider.h"
+
 #define LYNX_28G_NUM_LANE			8
 #define LYNX_28G_NUM_PLL			2
 
diff --git a/drivers/phy/hisilicon/phy-hi3660-usb3.c b/drivers/phy/hisilicon/phy-hi3660-usb3.c
index e2a09d67faed..b66ff3be1aed 100644
--- a/drivers/phy/hisilicon/phy-hi3660-usb3.c
+++ b/drivers/phy/hisilicon/phy-hi3660-usb3.c
@@ -12,10 +12,11 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 #define PERI_CRG_CLK_EN4			0x40
 #define PERI_CRG_CLK_DIS4			0x44
 #define GT_CLK_USB3OTG_REF			BIT(0)
diff --git a/drivers/phy/hisilicon/phy-hi3670-pcie.c b/drivers/phy/hisilicon/phy-hi3670-pcie.c
index dbc7dcce682b..b7cf44078e0d 100644
--- a/drivers/phy/hisilicon/phy-hi3670-pcie.c
+++ b/drivers/phy/hisilicon/phy-hi3670-pcie.c
@@ -26,11 +26,12 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/types.h>
 
+#include "../phy-provider.h"
+
 #define AXI_CLK_FREQ				207500000
 #define REF_CLK_FREQ				100000000
 
diff --git a/drivers/phy/hisilicon/phy-hi3670-usb3.c b/drivers/phy/hisilicon/phy-hi3670-usb3.c
index 40d3cf128b44..004c51500597 100644
--- a/drivers/phy/hisilicon/phy-hi3670-usb3.c
+++ b/drivers/phy/hisilicon/phy-hi3670-usb3.c
@@ -14,10 +14,11 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 #define SCTRL_SCDEEPSLEEPED		(0x0)
 #define USB_CLK_SELECTED		BIT(20)
 
diff --git a/drivers/phy/hisilicon/phy-hi6220-usb.c b/drivers/phy/hisilicon/phy-hi6220-usb.c
index 22d8d8a8dabe..1b5a2d3e3e44 100644
--- a/drivers/phy/hisilicon/phy-hi6220-usb.c
+++ b/drivers/phy/hisilicon/phy-hi6220-usb.c
@@ -8,9 +8,10 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/phy/phy.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 #define SC_PERIPH_CTRL4			0x00c
 
 #define CTRL4_PICO_SIDDQ		BIT(6)
diff --git a/drivers/phy/hisilicon/phy-hisi-inno-usb2.c b/drivers/phy/hisilicon/phy-hisi-inno-usb2.c
index c843923252aa..4a4701d0fc9c 100644
--- a/drivers/phy/hisilicon/phy-hisi-inno-usb2.c
+++ b/drivers/phy/hisilicon/phy-hisi-inno-usb2.c
@@ -10,10 +10,12 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
+#include <linux/phy/phy.h> /* for phy_set_bus_width() */
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 
+#include "../phy-provider.h"
+
 #define INNO_PHY_PORT_NUM	2
 #define REF_CLK_STABLE_TIME	100	/* unit:us */
 #define UTMI_CLK_STABLE_TIME	200	/* unit:us */
diff --git a/drivers/phy/hisilicon/phy-histb-combphy.c b/drivers/phy/hisilicon/phy-histb-combphy.c
index 9dd0bd00b4e4..9b6ed1644d74 100644
--- a/drivers/phy/hisilicon/phy-histb-combphy.c
+++ b/drivers/phy/hisilicon/phy-histb-combphy.c
@@ -14,12 +14,13 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 #include <dt-bindings/phy/phy.h>
 
+#include "../phy-provider.h"
+
 #define COMBPHY_MODE_PCIE		0
 #define COMBPHY_MODE_USB3		1
 #define COMBPHY_MODE_SATA		2
diff --git a/drivers/phy/hisilicon/phy-hix5hd2-sata.c b/drivers/phy/hisilicon/phy-hix5hd2-sata.c
index 1b26ddb4c8a7..57994f69417d 100644
--- a/drivers/phy/hisilicon/phy-hix5hd2-sata.c
+++ b/drivers/phy/hisilicon/phy-hix5hd2-sata.c
@@ -9,10 +9,11 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 #define SATA_PHY0_CTLL		0xa0
 #define MPLL_MULTIPLIER_SHIFT	1
 #define MPLL_MULTIPLIER_MASK	0xfe
diff --git a/drivers/phy/ingenic/phy-ingenic-usb.c b/drivers/phy/ingenic/phy-ingenic-usb.c
index 7e62d46850fd..d656f97729c4 100644
--- a/drivers/phy/ingenic/phy-ingenic-usb.c
+++ b/drivers/phy/ingenic/phy-ingenic-usb.c
@@ -12,10 +12,11 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 
+#include "../phy-provider.h"
+
 /* OTGPHY register offsets */
 #define REG_USBPCR_OFFSET			0x00
 #define REG_USBRDT_OFFSET			0x04
diff --git a/drivers/phy/intel/phy-intel-keembay-emmc.c b/drivers/phy/intel/phy-intel-keembay-emmc.c
index 0eb11ac7c2e2..fdba1d050439 100644
--- a/drivers/phy/intel/phy-intel-keembay-emmc.c
+++ b/drivers/phy/intel/phy-intel-keembay-emmc.c
@@ -11,10 +11,11 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 /* eMMC/SD/SDIO core/phy configuration registers */
 #define PHY_CFG_0		0x24
 #define  SEL_DLY_TXCLK_MASK	BIT(29)
diff --git a/drivers/phy/intel/phy-intel-keembay-usb.c b/drivers/phy/intel/phy-intel-keembay-usb.c
index c8b05f7b2445..4e690f3eb560 100644
--- a/drivers/phy/intel/phy-intel-keembay-usb.c
+++ b/drivers/phy/intel/phy-intel-keembay-usb.c
@@ -10,10 +10,11 @@
 #include <linux/delay.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 /* USS (USB Subsystem) clock control registers */
 #define USS_CPR_CLK_EN		0x00
 #define USS_CPR_CLK_SET		0x04
diff --git a/drivers/phy/intel/phy-intel-lgm-combo.c b/drivers/phy/intel/phy-intel-lgm-combo.c
index 9ee3cf61cdd0..2a8b0caa0e59 100644
--- a/drivers/phy/intel/phy-intel-lgm-combo.c
+++ b/drivers/phy/intel/phy-intel-lgm-combo.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2019-2020 Intel Corporation.
  */
 
+#include <dt-bindings/phy/phy.h>
 #include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/iopoll.h>
@@ -12,12 +13,11 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
-#include <dt-bindings/phy/phy.h>
+#include "../phy-provider.h"
 
 #define PCIE_PHY_GEN_CTRL	0x00
 #define PCIE_PHY_CLK_PAD	BIT(17)
diff --git a/drivers/phy/intel/phy-intel-lgm-emmc.c b/drivers/phy/intel/phy-intel-lgm-emmc.c
index 703aeb122541..479a530dd630 100644
--- a/drivers/phy/intel/phy-intel-lgm-emmc.c
+++ b/drivers/phy/intel/phy-intel-lgm-emmc.c
@@ -11,10 +11,11 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 /* eMMC phy register definitions */
 #define EMMC_PHYCTRL0_REG	0xa8
 #define DR_TY_MASK		GENMASK(30, 28)
diff --git a/drivers/phy/lantiq/phy-lantiq-rcu-usb2.c b/drivers/phy/lantiq/phy-lantiq-rcu-usb2.c
index 82f1ffc0b0ad..eb6c201f7c87 100644
--- a/drivers/phy/lantiq/phy-lantiq-rcu-usb2.c
+++ b/drivers/phy/lantiq/phy-lantiq-rcu-usb2.c
@@ -12,12 +12,13 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
+#include "../phy-provider.h"
+
 /* Transmitter HS Pre-Emphasis Enable */
 #define RCU_CFG1_TX_PEE		BIT(0)
 /* Disconnect Threshold */
diff --git a/drivers/phy/lantiq/phy-lantiq-vrx200-pcie.c b/drivers/phy/lantiq/phy-lantiq-vrx200-pcie.c
index 406a87c8b759..70da76399e30 100644
--- a/drivers/phy/lantiq/phy-lantiq-vrx200-pcie.c
+++ b/drivers/phy/lantiq/phy-lantiq-vrx200-pcie.c
@@ -11,6 +11,7 @@
  * TODO: PHY modes other than 36MHz (without "SSC")
  */
 
+#include <dt-bindings/phy/phy-lantiq-vrx200-pcie.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/clk.h>
@@ -18,13 +19,12 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
-#include <dt-bindings/phy/phy-lantiq-vrx200-pcie.h>
+#include "../phy-provider.h"
 
 #define PCIE_PHY_PLL_CTRL1				0x44
 
diff --git a/drivers/phy/marvell/phy-armada375-usb2.c b/drivers/phy/marvell/phy-armada375-usb2.c
index 3731f9b25655..d5c100096c3d 100644
--- a/drivers/phy/marvell/phy-armada375-usb2.c
+++ b/drivers/phy/marvell/phy-armada375-usb2.c
@@ -16,9 +16,10 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/of_address.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 
+#include "../phy-provider.h"
+
 #define USB2_PHY_CONFIG_DISABLE BIT(0)
 
 struct armada375_cluster_phy {
diff --git a/drivers/phy/marvell/phy-armada38x-comphy.c b/drivers/phy/marvell/phy-armada38x-comphy.c
index 5063361b0120..9653863f90bb 100644
--- a/drivers/phy/marvell/phy-armada38x-comphy.c
+++ b/drivers/phy/marvell/phy-armada38x-comphy.c
@@ -9,10 +9,11 @@
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/phy.h>
 #include <linux/platform_device.h>
 
+#include "../phy-provider.h"
+
 #define MAX_A38X_COMPHY	6
 #define MAX_A38X_PORTS	3
 
diff --git a/drivers/phy/marvell/phy-berlin-sata.c b/drivers/phy/marvell/phy-berlin-sata.c
index c90e2867900c..4d4013d115ca 100644
--- a/drivers/phy/marvell/phy-berlin-sata.c
+++ b/drivers/phy/marvell/phy-berlin-sata.c
@@ -10,10 +10,11 @@
 #include <linux/clk.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/io.h>
 #include <linux/platform_device.h>
 
+#include "../phy-provider.h"
+
 #define HOST_VSA_ADDR		0x0
 #define HOST_VSA_DATA		0x4
 #define PORT_SCR_CTL		0x2c
diff --git a/drivers/phy/marvell/phy-berlin-usb.c b/drivers/phy/marvell/phy-berlin-usb.c
index f26bf630da2c..a3e58deaaa74 100644
--- a/drivers/phy/marvell/phy-berlin-usb.c
+++ b/drivers/phy/marvell/phy-berlin-usb.c
@@ -9,11 +9,12 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/reset.h>
 
+#include "../phy-provider.h"
+
 #define USB_PHY_PLL		0x04
 #define USB_PHY_PLL_CONTROL	0x08
 #define USB_PHY_TX_CTRL0	0x10
diff --git a/drivers/phy/marvell/phy-mmp3-hsic.c b/drivers/phy/marvell/phy-mmp3-hsic.c
index 72ab6da0ebc3..90498211431b 100644
--- a/drivers/phy/marvell/phy-mmp3-hsic.c
+++ b/drivers/phy/marvell/phy-mmp3-hsic.c
@@ -7,9 +7,10 @@
 #include <linux/io.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 
+#include "../phy-provider.h"
+
 #define HSIC_CTRL	0x08
 #define HSIC_ENABLE	BIT(7)
 #define PLL_BYPASS	BIT(4)
diff --git a/drivers/phy/marvell/phy-mmp3-usb.c b/drivers/phy/marvell/phy-mmp3-usb.c
index 5b71deb08851..ba67bcc2c3f9 100644
--- a/drivers/phy/marvell/phy-mmp3-usb.c
+++ b/drivers/phy/marvell/phy-mmp3-usb.c
@@ -8,10 +8,11 @@
 #include <linux/io.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/soc/mmp/cputype.h>
 
+#include "../phy-provider.h"
+
 #define USB2_PLL_REG0		0x4
 #define USB2_PLL_REG1		0x8
 #define USB2_TX_REG0		0x10
diff --git a/drivers/phy/marvell/phy-mvebu-a3700-comphy.c b/drivers/phy/marvell/phy-mvebu-a3700-comphy.c
index 1d1db1737422..3acfd74c3eca 100644
--- a/drivers/phy/marvell/phy-mvebu-a3700-comphy.c
+++ b/drivers/phy/marvell/phy-mvebu-a3700-comphy.c
@@ -21,10 +21,11 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/phy.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/spinlock.h>
 
+#include "../phy-provider.h"
+
 #define PLL_SET_DELAY_US		600
 #define COMPHY_PLL_SLEEP		1000
 #define COMPHY_PLL_TIMEOUT		150000
diff --git a/drivers/phy/marvell/phy-mvebu-a3700-utmi.c b/drivers/phy/marvell/phy-mvebu-a3700-utmi.c
index 04f4fb4bed70..c17ce28ceb0b 100644
--- a/drivers/phy/marvell/phy-mvebu-a3700-utmi.c
+++ b/drivers/phy/marvell/phy-mvebu-a3700-utmi.c
@@ -14,10 +14,11 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 /* Armada 3700 UTMI PHY registers */
 #define USB2_PHY_PLL_CTRL_REG0			0x0
 #define   PLL_REF_DIV_OFF			0
diff --git a/drivers/phy/marvell/phy-mvebu-cp110-comphy.c b/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
index 71f9c14fb50d..18ad172135ea 100644
--- a/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
+++ b/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
@@ -13,10 +13,11 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/phy.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 /* Relative to priv->base */
 #define MVEBU_COMPHY_SERDES_CFG0(n)		(0x0 + (n) * 0x1000)
 #define     MVEBU_COMPHY_SERDES_CFG0_PU_PLL	BIT(1)
diff --git a/drivers/phy/marvell/phy-mvebu-cp110-utmi.c b/drivers/phy/marvell/phy-mvebu-cp110-utmi.c
index dd3e515a8e86..f3e2ef54c37b 100644
--- a/drivers/phy/marvell/phy-mvebu-cp110-utmi.c
+++ b/drivers/phy/marvell/phy-mvebu-cp110-utmi.c
@@ -13,12 +13,13 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/usb/of.h>
 #include <linux/usb/otg.h>
 
+#include "../phy-provider.h"
+
 #define UTMI_PHY_PORTS				2
 
 /* CP110 UTMI register macro definetions */
diff --git a/drivers/phy/marvell/phy-mvebu-sata.c b/drivers/phy/marvell/phy-mvebu-sata.c
index 89a5a2b69d80..b9a9eca74789 100644
--- a/drivers/phy/marvell/phy-mvebu-sata.c
+++ b/drivers/phy/marvell/phy-mvebu-sata.c
@@ -8,11 +8,12 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/clk.h>
-#include <linux/phy/phy.h>
 #include <linux/io.h>
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 
+#include "../phy-provider.h"
+
 struct priv {
 	struct clk	*clk;
 	void __iomem	*base;
diff --git a/drivers/phy/marvell/phy-pxa-28nm-hsic.c b/drivers/phy/marvell/phy-pxa-28nm-hsic.c
index eff6dd6b2dd0..6feee8d1ca70 100644
--- a/drivers/phy/marvell/phy-pxa-28nm-hsic.c
+++ b/drivers/phy/marvell/phy-pxa-28nm-hsic.c
@@ -17,7 +17,8 @@
 #include <linux/clk.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/phy/phy.h>
+
+#include "../phy-provider.h"
 
 #define PHY_28NM_HSIC_CTRL			0x08
 #define PHY_28NM_HSIC_IMPCAL_CAL		0x18
diff --git a/drivers/phy/marvell/phy-pxa-28nm-usb2.c b/drivers/phy/marvell/phy-pxa-28nm-usb2.c
index 64afb82cf70e..39b8344803cb 100644
--- a/drivers/phy/marvell/phy-pxa-28nm-usb2.c
+++ b/drivers/phy/marvell/phy-pxa-28nm-usb2.c
@@ -17,7 +17,8 @@
 #include <linux/clk.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/phy/phy.h>
+
+#include "../phy-provider.h"
 
 /* USB PXA1928 PHY mapping */
 #define PHY_28NM_PLL_REG0			0x0
diff --git a/drivers/phy/marvell/phy-pxa-usb.c b/drivers/phy/marvell/phy-pxa-usb.c
index c0bb71f80c04..9a8ab813d001 100644
--- a/drivers/phy/marvell/phy-pxa-usb.c
+++ b/drivers/phy/marvell/phy-pxa-usb.c
@@ -10,9 +10,10 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 
+#include "../phy-provider.h"
+
 /* phy regs */
 #define UTMI_REVISION		0x0
 #define UTMI_CTRL		0x4
diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
index d7024a144335..ab3778447570 100644
--- a/drivers/phy/mediatek/phy-mtk-dp.c
+++ b/drivers/phy/mediatek/phy-mtk-dp.c
@@ -10,10 +10,11 @@
 #include <linux/io.h>
 #include <linux/mfd/syscon.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 #define PHY_OFFSET			0x1000
 
 #define MTK_DP_PHY_DIG_PLL_CTL_1	(PHY_OFFSET + 0x14)
diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
index 1426a2db984d..30015bac3f73 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
@@ -7,7 +7,6 @@
 #include <linux/io.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/of_regulator.h>
diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.h b/drivers/phy/mediatek/phy-mtk-hdmi.h
index 99d917e0036a..bfddd8dbe9dd 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi.h
+++ b/drivers/phy/mediatek/phy-mtk-hdmi.h
@@ -11,12 +11,13 @@
 #include <linux/delay.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
 #include <linux/types.h>
 
+#include "../phy-provider.h"
+
 struct mtk_hdmi_phy;
 
 struct mtk_hdmi_phy_conf {
diff --git a/drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c b/drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c
index 058e1d926630..5e008204ecca 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c
@@ -12,10 +12,10 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
+#include "../phy-provider.h"
 #include "phy-mtk-io.h"
 #include "phy-mtk-mipi-csi-0-5-rx-reg.h"
 
diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.h b/drivers/phy/mediatek/phy-mtk-mipi-dsi.h
index 5d4876f1dc95..676c8f78d9d6 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.h
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.h
@@ -13,9 +13,10 @@
 #include <linux/module.h>
 #include <linux/nvmem-consumer.h>
 #include <linux/platform_device.h>
-#include <linux/phy/phy.h>
 #include <linux/slab.h>
 
+#include "../phy-provider.h"
+
 struct mtk_mipitx_data {
 	const u32 mppll_preserve;
 	const struct clk_ops *mipi_tx_clk_ops;
diff --git a/drivers/phy/mediatek/phy-mtk-pcie.c b/drivers/phy/mediatek/phy-mtk-pcie.c
index a2f69d6c72f0..1ab7c1dc2753 100644
--- a/drivers/phy/mediatek/phy-mtk-pcie.c
+++ b/drivers/phy/mediatek/phy-mtk-pcie.c
@@ -8,10 +8,10 @@
 #include <linux/module.h>
 #include <linux/nvmem-consumer.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
+#include "../phy-provider.h"
 #include "phy-mtk-io.h"
 
 #define PEXTP_ANA_GLB_00_REG		0x9000
diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index acf506529507..6f98de067327 100644
--- a/drivers/phy/mediatek/phy-mtk-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-tphy.c
@@ -15,10 +15,10 @@
 #include <linux/nvmem-consumer.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
 #include "phy-mtk-io.h"
 
 /* version V1 sub-banks offset base address */
diff --git a/drivers/phy/mediatek/phy-mtk-ufs.c b/drivers/phy/mediatek/phy-mtk-ufs.c
index 0cb5a25b1b7a..de517fcc4f3e 100644
--- a/drivers/phy/mediatek/phy-mtk-ufs.c
+++ b/drivers/phy/mediatek/phy-mtk-ufs.c
@@ -9,9 +9,9 @@
 #include <linux/io.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 
+#include "../phy-provider.h"
 #include "phy-mtk-io.h"
 
 /* mphy register and offsets */
diff --git a/drivers/phy/mediatek/phy-mtk-xfi-tphy.c b/drivers/phy/mediatek/phy-mtk-xfi-tphy.c
index 100a50d0e861..036a4bb58dcf 100644
--- a/drivers/phy/mediatek/phy-mtk-xfi-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-xfi-tphy.c
@@ -17,8 +17,8 @@
 #include <linux/clk.h>
 #include <linux/reset.h>
 #include <linux/phy.h>
-#include <linux/phy/phy.h>
 
+#include "../phy-provider.h"
 #include "phy-mtk-io.h"
 
 #define MTK_XFI_TPHY_NUM_CLOCKS		2
diff --git a/drivers/phy/mediatek/phy-mtk-xsphy.c b/drivers/phy/mediatek/phy-mtk-xsphy.c
index c0ddb9273cc3..5e61abddaf54 100644
--- a/drivers/phy/mediatek/phy-mtk-xsphy.c
+++ b/drivers/phy/mediatek/phy-mtk-xsphy.c
@@ -14,10 +14,10 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
 #include "phy-mtk-io.h"
 
 /* u2 phy banks */
diff --git a/drivers/phy/microchip/lan966x_serdes.c b/drivers/phy/microchip/lan966x_serdes.c
index 835e369cdfc5..8769518f9708 100644
--- a/drivers/phy/microchip/lan966x_serdes.c
+++ b/drivers/phy/microchip/lan966x_serdes.c
@@ -1,15 +1,15 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
+#include <dt-bindings/phy/phy-lan966x-serdes.h>
 #include <linux/err.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/phy.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 
-#include <dt-bindings/phy/phy-lan966x-serdes.h>
 #include "lan966x_serdes_regs.h"
+#include "../phy-provider.h"
 
 #define PLL_CONF_MASK		GENMASK(4, 3)
 #define PLL_CONF_25MHZ		0
diff --git a/drivers/phy/microchip/sparx5_serdes.c b/drivers/phy/microchip/sparx5_serdes.c
index 320cf5b50a8c..09c22a6a2639 100644
--- a/drivers/phy/microchip/sparx5_serdes.c
+++ b/drivers/phy/microchip/sparx5_serdes.c
@@ -17,8 +17,8 @@
 #include <linux/io.h>
 #include <linux/clk.h>
 #include <linux/phy.h>
-#include <linux/phy/phy.h>
 
+#include "../phy-provider.h"
 #include "sparx5_serdes.h"
 
 #define SPX5_SERDES_10G_START 13
diff --git a/drivers/phy/motorola/phy-cpcap-usb.c b/drivers/phy/motorola/phy-cpcap-usb.c
index 7cb020dd3423..66a834c208fc 100644
--- a/drivers/phy/motorola/phy-cpcap-usb.c
+++ b/drivers/phy/motorola/phy-cpcap-usb.c
@@ -24,10 +24,11 @@
 #include <linux/gpio/consumer.h>
 #include <linux/mfd/motorola-cpcap.h>
 #include <linux/phy/omap_usb.h>
-#include <linux/phy/phy.h>
 #include <linux/regulator/consumer.h>
 #include <linux/usb/musb.h>
 
+#include "../phy-provider.h"
+
 /* CPCAP_REG_USBC1 register bits */
 #define CPCAP_BIT_IDPULSE		BIT(15)
 #define CPCAP_BIT_ID100KPU		BIT(14)
diff --git a/drivers/phy/motorola/phy-mapphone-mdm6600.c b/drivers/phy/motorola/phy-mapphone-mdm6600.c
index ce1dad8c438d..92f63e52bd1d 100644
--- a/drivers/phy/motorola/phy-mapphone-mdm6600.c
+++ b/drivers/phy/motorola/phy-mapphone-mdm6600.c
@@ -15,10 +15,12 @@
 
 #include <linux/gpio/consumer.h>
 #include <linux/of_platform.h>
-#include <linux/phy/phy.h>
+#include <linux/phy/phy.h> /* for phy_pm_runtime_*() */
 #include <linux/pinctrl/consumer.h>
 #include <linux/pm_runtime.h>
 
+#include "../phy-provider.h"
+
 #define PHY_MDM6600_PHY_DELAY_MS	4000	/* PHY enable 2.2s to 3.5s */
 #define PHY_MDM6600_ENABLED_DELAY_MS	8000	/* 8s more total for MDM6600 */
 #define PHY_MDM6600_WAKE_KICK_MS	600	/* time on after GPIO toggle */
diff --git a/drivers/phy/mscc/phy-ocelot-serdes.c b/drivers/phy/mscc/phy-ocelot-serdes.c
index 1cd1b5db2ad7..13f83876d954 100644
--- a/drivers/phy/mscc/phy-ocelot-serdes.c
+++ b/drivers/phy/mscc/phy-ocelot-serdes.c
@@ -12,12 +12,13 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/phy.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <soc/mscc/ocelot_hsio.h>
 #include <dt-bindings/phy/phy-ocelot-serdes.h>
 
+#include "../phy-provider.h"
+
 struct serdes_ctrl {
 	struct regmap		*regs;
 	struct device		*dev;
diff --git a/drivers/phy/nuvoton/phy-ma35d1-usb2.c b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
index 9a459b700ed4..520c86188fe2 100644
--- a/drivers/phy/nuvoton/phy-ma35d1-usb2.c
+++ b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
@@ -10,10 +10,11 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 /* USB PHY Miscellaneous Control Register */
 #define MA35_SYS_REG_USBPMISCR	0x60
 #define PHY0POR			BIT(0)  /* PHY Power-On Reset Control Bit */
diff --git a/drivers/phy/phy-airoha-pcie.c b/drivers/phy/phy-airoha-pcie.c
index 56e9ade8a9fd..d9817eed2631 100644
--- a/drivers/phy/phy-airoha-pcie.c
+++ b/drivers/phy/phy-airoha-pcie.c
@@ -9,11 +9,11 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
 #include "phy-airoha-pcie-regs.h"
+#include "phy-provider.h"
 
 #define LEQ_LEN_CTRL_MAX_VAL	7
 #define FREQ_LOCK_MAX_ATTEMPT	10
diff --git a/drivers/phy/phy-can-transceiver.c b/drivers/phy/phy-can-transceiver.c
index 330356706ad7..d1e90fe6b68b 100644
--- a/drivers/phy/phy-can-transceiver.c
+++ b/drivers/phy/phy-can-transceiver.c
@@ -6,13 +6,14 @@
  *
  */
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/module.h>
 #include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/mux/consumer.h>
 
+#include "phy-provider.h"
+
 struct can_transceiver_data {
 	u32 flags;
 #define CAN_TRANSCEIVER_STB_PRESENT	BIT(0)
diff --git a/drivers/phy/phy-core-mipi-dphy.c b/drivers/phy/phy-core-mipi-dphy.c
index f4956a417a47..770cfe2a2279 100644
--- a/drivers/phy/phy-core-mipi-dphy.c
+++ b/drivers/phy/phy-core-mipi-dphy.c
@@ -4,13 +4,13 @@
  * Copyright (C) 2018 Cadence Design Systems Inc.
  */
 
+#include <linux/phy/phy-mipi-dphy.h>
 #include <linux/errno.h>
 #include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/time64.h>
 
-#include <linux/phy/phy.h>
-#include <linux/phy/phy-mipi-dphy.h>
+#include "phy-provider.h"
 
 /*
  * Minimum D-PHY timings based on MIPI D-PHY specification. Derived
diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 89f7410241aa..a092c6290545 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -20,6 +20,8 @@
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 
+#include "phy-provider.h"
+
 #define	to_phy(a)	(container_of((a), struct phy, dev))
 
 /**
diff --git a/drivers/phy/phy-google-usb.c b/drivers/phy/phy-google-usb.c
index 48cfa2e28347..539732f4869e 100644
--- a/drivers/phy/phy-google-usb.c
+++ b/drivers/phy/phy-google-usb.c
@@ -14,13 +14,14 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/usb/typec_mux.h>
 
+#include "phy-provider.h"
+
 #define USBCS_USB2PHY_CFG19_OFFSET 0x0
 #define USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV GENMASK(19, 8)
 
diff --git a/drivers/phy/phy-lpc18xx-usb-otg.c b/drivers/phy/phy-lpc18xx-usb-otg.c
index f905d3c64584..554dfa55fe7e 100644
--- a/drivers/phy/phy-lpc18xx-usb-otg.c
+++ b/drivers/phy/phy-lpc18xx-usb-otg.c
@@ -10,10 +10,11 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include "phy-provider.h"
+
 /* USB OTG PHY register offset and bit in CREG */
 #define LPC18XX_CREG_CREG0		0x004
 #define LPC18XX_CREG_CREG0_USB0PHY	BIT(5)
diff --git a/drivers/phy/phy-nxp-ptn3222.c b/drivers/phy/phy-nxp-ptn3222.c
index c6179d8701e6..ae75b760a30d 100644
--- a/drivers/phy/phy-nxp-ptn3222.c
+++ b/drivers/phy/phy-nxp-ptn3222.c
@@ -7,10 +7,11 @@
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 
+#include "phy-provider.h"
+
 #define NUM_SUPPLIES 2
 
 struct ptn3222 {
diff --git a/drivers/phy/phy-pistachio-usb.c b/drivers/phy/phy-pistachio-usb.c
index 231792f48ced..8eed6f505a31 100644
--- a/drivers/phy/phy-pistachio-usb.c
+++ b/drivers/phy/phy-pistachio-usb.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2015 Google, Inc.
  */
 
+#include <dt-bindings/phy/phy-pistachio-usb.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/io.h>
@@ -12,11 +13,10 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
-#include <dt-bindings/phy/phy-pistachio-usb.h>
+#include "phy-provider.h"
 
 #define USB_PHY_CONTROL1				0x04
 #define USB_PHY_CONTROL1_FSEL_SHIFT			2
diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index f90bf7e95463..9062737bfad4 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -13,6 +13,8 @@
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 
+#include "phy-provider.h"
+
 #define EXYNOS_USB_PHY_HS_PHY_CTRL_RST	(0x0)
 #define USB_PHY_RST_MASK		GENMASK(1, 0)
 #define UTMI_PORT_RST_MASK		GENMASK(5, 4)
diff --git a/drivers/phy/phy-xgene.c b/drivers/phy/phy-xgene.c
index 5007dc7a357c..90a00498ec0a 100644
--- a/drivers/phy/phy-xgene.c
+++ b/drivers/phy/phy-xgene.c
@@ -43,9 +43,10 @@
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/delay.h>
-#include <linux/phy/phy.h>
 #include <linux/clk.h>
 
+#include "phy-provider.h"
+
 /* Max 2 lanes per a PHY unit */
 #define MAX_LANE			2
 
diff --git a/drivers/phy/qualcomm/phy-ath79-usb.c b/drivers/phy/qualcomm/phy-ath79-usb.c
index f8d0199c6e78..2f07241be600 100644
--- a/drivers/phy/qualcomm/phy-ath79-usb.c
+++ b/drivers/phy/qualcomm/phy-ath79-usb.c
@@ -8,9 +8,10 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/phy/phy.h>
 #include <linux/reset.h>
 
+#include "../phy-provider.h"
+
 struct ath79_usb_phy {
 	struct reset_control *reset;
 	/* The suspend override logic is inverted, hence the no prefix
diff --git a/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c b/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
index cae290a6e19f..dd73ecbb6c1e 100644
--- a/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
+++ b/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
@@ -13,7 +13,8 @@
 #include <linux/clk.h>
 #include <linux/slab.h>
 #include <linux/platform_device.h>
-#include <linux/phy/phy.h>
+
+#include "../phy-provider.h"
 
 /* PHY registers */
 #define UNIPHY_PLL_REFCLK_CFG		0x000
diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index 7372de05a0b8..faddba0f20c7 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -13,7 +13,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/phy/phy-dp.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
@@ -22,6 +21,8 @@
 
 #include <dt-bindings/phy/phy.h>
 
+#include "../phy-provider.h"
+
 #include "phy-qcom-qmp-dp-phy.h"
 #include "phy-qcom-qmp-qserdes-com-v4.h"
 #include "phy-qcom-qmp-qserdes-com-v6.h"
diff --git a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
index efeec4709a15..5783bdabc287 100644
--- a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
+++ b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
@@ -8,7 +8,8 @@
 #include <linux/regulator/consumer.h>
 #include <linux/regmap.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
+
+#include "../phy-provider.h"
 
 /* eUSB2 status registers */
 #define EUSB2_RPTR_STATUS		0x08
diff --git a/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c b/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c
index da6f290af722..f1c1c2969e37 100644
--- a/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c
@@ -14,10 +14,11 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 
+#include "../phy-provider.h"
+
 struct ipq4019_usb_phy {
 	struct device		*dev;
 	struct phy		*phy;
diff --git a/drivers/phy/qualcomm/phy-qcom-ipq806x-sata.c b/drivers/phy/qualcomm/phy-qcom-ipq806x-sata.c
index f5eb0bdac418..1a9d4dae6a33 100644
--- a/drivers/phy/qualcomm/phy-qcom-ipq806x-sata.c
+++ b/drivers/phy/qualcomm/phy-qcom-ipq806x-sata.c
@@ -13,7 +13,8 @@
 #include <linux/clk.h>
 #include <linux/slab.h>
 #include <linux/platform_device.h>
-#include <linux/phy/phy.h>
+
+#include "phy-provider.h"
 
 struct qcom_ipq806x_sata_phy {
 	void __iomem *mmio;
diff --git a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
index f22c0000479f..54144f0547f0 100644
--- a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
@@ -5,13 +5,14 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/delay.h>
 #include <linux/regmap.h>
 #include <linux/mfd/syscon.h>
 #include <linux/bitfield.h>
 
+#include "../phy-provider.h"
+
 /* USB QSCRATCH Hardware registers */
 #define QSCRATCH_GENERAL_CFG		(0x08)
 #define HSUSB_PHY_CTRL_REG		(0x10)
diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
index 68f1ba8fec4a..9e3a911023cd 100644
--- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
@@ -18,6 +18,8 @@
 
 #include <linux/regulator/consumer.h>
 
+#include "../phy-provider.h"
+
 #define USB_PHY_UTMI_CTRL0		(0x3c)
 #define SLEEPM				BIT(0)
 
diff --git a/drivers/phy/qualcomm/phy-qcom-m31.c b/drivers/phy/qualcomm/phy-qcom-m31.c
index 168ea980fda0..1a63a5807d37 100644
--- a/drivers/phy/qualcomm/phy-qcom-m31.c
+++ b/drivers/phy/qualcomm/phy-qcom-m31.c
@@ -10,11 +10,12 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
 
+#include "../phy-provider.h"
+
 #define USB2PHY_PORT_UTMI_CTRL1		0x40
 
 #define USB2PHY_PORT_UTMI_CTRL2		0x44
diff --git a/drivers/phy/qualcomm/phy-qcom-pcie2.c b/drivers/phy/qualcomm/phy-qcom-pcie2.c
index 11a2bb958681..4c74d8e7722d 100644
--- a/drivers/phy/qualcomm/phy-qcom-pcie2.c
+++ b/drivers/phy/qualcomm/phy-qcom-pcie2.c
@@ -8,11 +8,12 @@
 #include <linux/clk.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
 
+#include "../phy-provider.h"
+
 #include <dt-bindings/phy/phy.h>
 
 #define PCIE20_PARF_PHY_STTS         0x3c
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index b9ea7d058e93..04c54c229f08 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -14,7 +14,6 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_graph.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
@@ -28,6 +27,8 @@
 
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 
+#include "../phy-provider.h"
+
 #include "phy-qcom-qmp-common.h"
 
 #include "phy-qcom-qmp.h"
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
index a7c65cfe31df..df38d5b6d5be 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
@@ -13,12 +13,13 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
 
+#include "../phy-provider.h"
+
 #include "phy-qcom-qmp-common.h"
 
 #include "phy-qcom-qmp.h"
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index fed2fc9bb311..06680151360e 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -15,7 +15,6 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/phy/pcie.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
@@ -24,6 +23,8 @@
 
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 
+#include "../phy-provider.h"
+
 #include "phy-qcom-qmp-common.h"
 
 #include "phy-qcom-qmp.h"
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index df138a5442eb..75cd5b10fdb2 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -13,7 +13,6 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
@@ -21,6 +20,8 @@
 
 #include <ufs/unipro.h>
 
+#include "../phy-provider.h"
+
 #include "phy-qcom-qmp-common.h"
 
 #include "phy-qcom-qmp.h"
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
index 2bd5862c5ba8..a682b30db03e 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
@@ -14,13 +14,14 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_address.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
 
+#include "../phy-provider.h"
+
 #include "phy-qcom-qmp.h"
 #include "phy-qcom-qmp-pcs-misc-v3.h"
 #include "phy-qcom-qmp-pcs-usb-v4.h"
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index d88b8a415e85..3db0a5282dbf 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -13,13 +13,14 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
 
+#include "../phy-provider.h"
+
 #include "phy-qcom-qmp-common.h"
 
 #include "phy-qcom-qmp.h"
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index f62e1f6ecc07..b77007f8fee3 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -14,7 +14,6 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
@@ -25,6 +24,8 @@
 #include <linux/usb/typec_mux.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 
+#include "../phy-provider.h"
+
 #include "phy-qcom-qmp-common.h"
 
 #include "phy-qcom-qmp.h"
diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index 191040f6d60f..e5516099b911 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2017, 2019, The Linux Foundation. All rights reserved.
  */
 
+#include <dt-bindings/phy/phy-qcom-qusb2.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/err.h>
@@ -12,7 +13,6 @@
 #include <linux/module.h>
 #include <linux/nvmem-consumer.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
@@ -20,7 +20,7 @@
 #include <linux/reset.h>
 #include <linux/slab.h>
 
-#include <dt-bindings/phy/phy-qcom-qusb2.h>
+#include "../phy-provider.h"
 
 #define QUSB2PHY_PLL			0x0
 #define QUSB2PHY_PLL_TEST		0x04
diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
index 5b1c82459c12..4f8ffc6524ab 100644
--- a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
+++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
@@ -7,10 +7,11 @@
 #include <linux/ethtool.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 #include "phy-qcom-qmp-pcs-sgmii.h"
 #include "phy-qcom-qmp-qserdes-com-v5.h"
 #include "phy-qcom-qmp-qserdes-txrx-v5.h"
diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index 8915fa250e81..17a33e545008 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
@@ -10,7 +10,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
@@ -18,6 +17,8 @@
 #include <linux/reset.h>
 #include <linux/slab.h>
 
+#include "../phy-provider.h"
+
 #define USB2_PHY_USB_PHY_UTMI_CTRL0		(0x3c)
 #define SLEEPM					BIT(0)
 #define OPMODE_MASK				GENMASK(4, 3)
diff --git a/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c b/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c
index 324c0a5d658e..13828d4f788e 100644
--- a/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c
+++ b/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c
@@ -12,12 +12,13 @@
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/units.h>
 
+#include "../phy-provider.h"
+
 #define RST_ASSERT_DELAY_MIN_US		100
 #define RST_ASSERT_DELAY_MAX_US		150
 #define PIPE_CLK_DELAY_MIN_US		5000
diff --git a/drivers/phy/qualcomm/phy-qcom-usb-hs-28nm.c b/drivers/phy/qualcomm/phy-qcom-usb-hs-28nm.c
index a52a9bf13b75..ce317deaeacb 100644
--- a/drivers/phy/qualcomm/phy-qcom-usb-hs-28nm.c
+++ b/drivers/phy/qualcomm/phy-qcom-usb-hs-28nm.c
@@ -11,12 +11,13 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_graph.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
 
+#include "../phy-provider.h"
+
 /* PHY register and bit definitions */
 #define PHY_CTRL_COMMON0		0x078
 #define SIDDQ				BIT(2)
diff --git a/drivers/phy/qualcomm/phy-qcom-usb-hs.c b/drivers/phy/qualcomm/phy-qcom-usb-hs.c
index 98a18987f1be..95581926023f 100644
--- a/drivers/phy/qualcomm/phy-qcom-usb-hs.c
+++ b/drivers/phy/qualcomm/phy-qcom-usb-hs.c
@@ -8,11 +8,12 @@
 #include <linux/clk.h>
 #include <linux/regulator/consumer.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/reset.h>
 #include <linux/extcon.h>
 #include <linux/notifier.h>
 
+#include "../phy-provider.h"
+
 #define ULPI_PWR_CLK_MNG_REG		0x88
 # define ULPI_PWR_OTG_COMP_DISABLE	BIT(0)
 
diff --git a/drivers/phy/qualcomm/phy-qcom-usb-hsic.c b/drivers/phy/qualcomm/phy-qcom-usb-hsic.c
index 20f6dd37c7c1..fe9315a2f207 100644
--- a/drivers/phy/qualcomm/phy-qcom-usb-hsic.c
+++ b/drivers/phy/qualcomm/phy-qcom-usb-hsic.c
@@ -5,12 +5,13 @@
 #include <linux/module.h>
 #include <linux/ulpi/driver.h>
 #include <linux/ulpi/regs.h>
-#include <linux/phy/phy.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pinctrl/pinctrl-state.h>
 #include <linux/delay.h>
 #include <linux/clk.h>
 
+#include "../phy-provider.h"
+
 #define ULPI_HSIC_CFG		0x30
 #define ULPI_HSIC_IO_CAL	0x33
 
diff --git a/drivers/phy/qualcomm/phy-qcom-usb-ss.c b/drivers/phy/qualcomm/phy-qcom-usb-ss.c
index a3a6d3ce7ea1..17ca14a0b34d 100644
--- a/drivers/phy/qualcomm/phy-qcom-usb-ss.c
+++ b/drivers/phy/qualcomm/phy-qcom-usb-ss.c
@@ -11,12 +11,13 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
 
+#include "../phy-provider.h"
+
 #define PHY_CTRL0			0x6C
 #define PHY_CTRL1			0x70
 #define PHY_CTRL2			0x74
diff --git a/drivers/phy/ralink/phy-mt7621-pci.c b/drivers/phy/ralink/phy-mt7621-pci.c
index a591ad95347c..4865a264136d 100644
--- a/drivers/phy/ralink/phy-mt7621-pci.c
+++ b/drivers/phy/ralink/phy-mt7621-pci.c
@@ -10,11 +10,12 @@
 #include <linux/bitops.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/sys_soc.h>
 
+#include "../phy-provider.h"
+
 #define RG_PE1_PIPE_REG				0x02c
 #define RG_PE1_PIPE_RST				BIT(12)
 #define RG_PE1_PIPE_CMD_FRC			BIT(4)
diff --git a/drivers/phy/ralink/phy-ralink-usb.c b/drivers/phy/ralink/phy-ralink-usb.c
index 0ff07e210769..cc61139ce157 100644
--- a/drivers/phy/ralink/phy-ralink-usb.c
+++ b/drivers/phy/ralink/phy-ralink-usb.c
@@ -14,11 +14,12 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
+#include "../phy-provider.h"
+
 #define RT_SYSC_REG_SYSCFG1		0x014
 #define RT_SYSC_REG_CLKCFG1		0x030
 #define RT_SYSC_REG_USB_PHY_CFG		0x05c
diff --git a/drivers/phy/realtek/phy-rtk-usb2.c b/drivers/phy/realtek/phy-rtk-usb2.c
index 248550ef98ca..a0431f11972e 100644
--- a/drivers/phy/realtek/phy-rtk-usb2.c
+++ b/drivers/phy/realtek/phy-rtk-usb2.c
@@ -16,9 +16,10 @@
 #include <linux/regmap.h>
 #include <linux/sys_soc.h>
 #include <linux/mfd/syscon.h>
-#include <linux/phy/phy.h>
 #include <linux/usb.h>
 
+#include "../phy-provider.h"
+
 /* GUSB2PHYACCn register */
 #define PHY_NEW_REG_REQ BIT(25)
 #define PHY_VSTS_BUSY   BIT(23)
diff --git a/drivers/phy/realtek/phy-rtk-usb3.c b/drivers/phy/realtek/phy-rtk-usb3.c
index cce453686db2..3f565c4d96be 100644
--- a/drivers/phy/realtek/phy-rtk-usb3.c
+++ b/drivers/phy/realtek/phy-rtk-usb3.c
@@ -16,9 +16,10 @@
 #include <linux/regmap.h>
 #include <linux/sys_soc.h>
 #include <linux/mfd/syscon.h>
-#include <linux/phy/phy.h>
 #include <linux/usb.h>
 
+#include "../phy-provider.h"
+
 #define USB_MDIO_CTRL_PHY_BUSY BIT(7)
 #define USB_MDIO_CTRL_PHY_WRITE BIT(0)
 #define USB_MDIO_CTRL_PHY_ADDR_SHIFT 8
diff --git a/drivers/phy/renesas/phy-rcar-gen2.c b/drivers/phy/renesas/phy-rcar-gen2.c
index 6c671254c625..ca5498986120 100644
--- a/drivers/phy/renesas/phy-rcar-gen2.c
+++ b/drivers/phy/renesas/phy-rcar-gen2.c
@@ -12,11 +12,12 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/spinlock.h>
 #include <linux/atomic.h>
 
+#include "../phy-provider.h"
+
 #define USBHS_LPSTS			0x02
 #define USBHS_UGCTRL			0x80
 #define USBHS_UGCTRL2			0x84
diff --git a/drivers/phy/renesas/phy-rcar-gen3-pcie.c b/drivers/phy/renesas/phy-rcar-gen3-pcie.c
index 3e2cf59ad480..747a1cd74639 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-pcie.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-pcie.c
@@ -9,11 +9,12 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/spinlock.h>
 
+#include "../phy-provider.h"
+
 #define PHY_CTRL		0x4000		/* R8A77980 only */
 
 /* PHY control register (PHY_CTRL) */
diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index cfc2a8d9028d..48ae5a507752 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -19,7 +19,6 @@
 #include <linux/mutex.h>
 #include <linux/mux/consumer.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
@@ -29,6 +28,8 @@
 #include <linux/usb/of.h>
 #include <linux/workqueue.h>
 
+#include "../phy-provider.h"
+
 /******* USB2.0 Host registers (original offset is +0x200) *******/
 #define USB2_INT_ENABLE		0x000
 #define USB2_AHB_BUS_CTR	0x008
diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb3.c b/drivers/phy/renesas/phy-rcar-gen3-usb3.c
index 0420f5b283ce..3511831e95d2 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb3.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb3.c
@@ -10,10 +10,11 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 
+#include "../phy-provider.h"
+
 #define USB30_CLKSET0		0x034
 #define USB30_CLKSET1		0x036
 #define USB30_SSC_SET		0x038
diff --git a/drivers/phy/renesas/phy-rzg3e-usb3.c b/drivers/phy/renesas/phy-rzg3e-usb3.c
index 6b3453ea0004..1c9e2276bb73 100644
--- a/drivers/phy/renesas/phy-rzg3e-usb3.c
+++ b/drivers/phy/renesas/phy-rzg3e-usb3.c
@@ -11,11 +11,12 @@
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
+#include "../phy-provider.h"
+
 #define USB3_TEST_RESET				0x0000
 #define USB3_TEST_UTMICTRL2			0x0b04
 #define USB3_TEST_PRMCTRL5_R			0x0c10
diff --git a/drivers/phy/renesas/r8a779f0-ether-serdes.c b/drivers/phy/renesas/r8a779f0-ether-serdes.c
index c34427ac4fdb..807af518aeda 100644
--- a/drivers/phy/renesas/r8a779f0-ether-serdes.c
+++ b/drivers/phy/renesas/r8a779f0-ether-serdes.c
@@ -10,11 +10,12 @@
 #include <linux/kernel.h>
 #include <linux/of.h>
 #include <linux/phy.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
+#include "../phy-provider.h"
+
 #define R8A779F0_ETH_SERDES_NUM			3
 #define R8A779F0_ETH_SERDES_OFFSET		0x0400
 #define R8A779F0_ETH_SERDES_BANK_SELECT		0x03fc
diff --git a/drivers/phy/rockchip/phy-rockchip-dp.c b/drivers/phy/rockchip/phy-rockchip-dp.c
index 592aa956eead..63e972969379 100644
--- a/drivers/phy/rockchip/phy-rockchip-dp.c
+++ b/drivers/phy/rockchip/phy-rockchip-dp.c
@@ -10,10 +10,11 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 #define GRF_SOC_CON12                           0x0274
 
 #define GRF_EDP_REF_CLK_SEL_INTER_HIWORD_MASK   BIT(20)
diff --git a/drivers/phy/rockchip/phy-rockchip-dphy-rx0.c b/drivers/phy/rockchip/phy-rockchip-dphy-rx0.c
index e6a768bbb9b3..de7e00580e20 100644
--- a/drivers/phy/rockchip/phy-rockchip-dphy-rx0.c
+++ b/drivers/phy/rockchip/phy-rockchip-dphy-rx0.c
@@ -21,11 +21,12 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/phy/phy-mipi-dphy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 #define RK3399_GRF_SOC_CON9		0x6224
 #define RK3399_GRF_SOC_CON21		0x6254
 #define RK3399_GRF_SOC_CON22		0x6258
diff --git a/drivers/phy/rockchip/phy-rockchip-emmc.c b/drivers/phy/rockchip/phy-rockchip-emmc.c
index 5187983c58e5..fd292f063f48 100644
--- a/drivers/phy/rockchip/phy-rockchip-emmc.c
+++ b/drivers/phy/rockchip/phy-rockchip-emmc.c
@@ -13,10 +13,11 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 /*
  * The higher 16-bit of this register is used for write protection
  * only if BIT(x + 16) set to 1 the BIT(x) can be written.
diff --git a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
index c79fb53d8ee5..3b5d86b07564 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
@@ -13,13 +13,14 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
-#include <linux/phy/phy.h>
 #include <linux/phy/phy-mipi-dphy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
+#include "../phy-provider.h"
+
 /* GRF */
 #define RK1808_GRF_PD_VI_CON_OFFSET	0x0430
 
diff --git a/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
index 30d5e5ddff4a..5613b34958fe 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
@@ -15,13 +15,13 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/phy/phy-mipi-dphy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/time64.h>
 
-#include <linux/phy/phy.h>
-#include <linux/phy/phy-mipi-dphy.h>
+#include "../phy-provider.h"
 
 #define UPDATE(x, h, l)	(((x) << (l)) & GENMASK((h), (l)))
 
diff --git a/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c b/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
index 1483907413fa..82b5e7434f83 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
@@ -20,6 +20,8 @@
 #include <linux/phy/phy.h>
 #include <linux/slab.h>
 
+#include "../phy-provider.h"
+
 #define UPDATE(x, h, l)		(((x) << (l)) & GENMASK((h), (l)))
 
 /* REG: 0x00 */
diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index 8f4c08e599aa..f88e09f61994 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -18,7 +18,6 @@
 #include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/power_supply.h>
 #include <linux/regmap.h>
@@ -27,6 +26,8 @@
 #include <linux/usb/of.h>
 #include <linux/usb/otg.h>
 
+#include "../phy-provider.h"
+
 #define BIT_WRITEABLE_SHIFT	16
 #define SCHEDULE_DELAY		(60 * HZ)
 #define OTG_SCHEDULE_DELAY	(2 * HZ)
diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
index b60d6bf3f33c..2deb2666acb1 100644
--- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
@@ -9,12 +9,13 @@
 #include <linux/clk.h>
 #include <linux/mfd/syscon.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/units.h>
 
+#include "../phy-provider.h"
+
 #define BIT_WRITEABLE_SHIFT		16
 #define REF_CLOCK_24MHz			(24 * HZ_PER_MHZ)
 #define REF_CLOCK_25MHz			(25 * HZ_PER_MHZ)
diff --git a/drivers/phy/rockchip/phy-rockchip-pcie.c b/drivers/phy/rockchip/phy-rockchip-pcie.c
index 126306c01454..604ff00653b0 100644
--- a/drivers/phy/rockchip/phy-rockchip-pcie.c
+++ b/drivers/phy/rockchip/phy-rockchip-pcie.c
@@ -13,12 +13,12 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
+#include "../phy-provider.h"
 
 #define PHY_MAX_LANE_NUM      4
 #define PHY_CFG_DATA_MASK     GENMASK(10, 7)
diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index 0f69060aa5d5..78a0446b81df 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
@@ -15,12 +15,13 @@
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
+#include "../phy-provider.h"
+
 #define BIAS_CON0		0x0000
 #define I_RES_CNTL_MASK		GENMASK(6, 4)
 #define I_RES_CNTL(x)		FIELD_PREP(I_RES_CNTL_MASK, x)
diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 2d973bc37f07..01801a4dc436 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -21,6 +21,8 @@
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
+#include "../phy-provider.h"
+
 #define GRF_HDPTX_CON0			0x00
 #define LC_REF_CLK_SEL			BIT(11)
 #define HDPTX_I_PLL_EN			BIT(7)
diff --git a/drivers/phy/rockchip/phy-rockchip-snps-pcie3.c b/drivers/phy/rockchip/phy-rockchip-snps-pcie3.c
index 4e8ffd173096..029566330aa0 100644
--- a/drivers/phy/rockchip/phy-rockchip-snps-pcie3.c
+++ b/drivers/phy/rockchip/phy-rockchip-snps-pcie3.c
@@ -14,11 +14,12 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/phy/pcie.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
+#include "../phy-provider.h"
+
 /* Register for RK3568 */
 #define GRF_PCIE30PHY_CON1			0x4
 #define GRF_PCIE30PHY_CON6			0x18
diff --git a/drivers/phy/rockchip/phy-rockchip-typec.c b/drivers/phy/rockchip/phy-rockchip-typec.c
index 0a318ccf1bbf..4a9756ca4f68 100644
--- a/drivers/phy/rockchip/phy-rockchip-typec.c
+++ b/drivers/phy/rockchip/phy-rockchip-typec.c
@@ -43,6 +43,7 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
@@ -53,8 +54,7 @@
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
-#include <linux/mfd/syscon.h>
-#include <linux/phy/phy.h>
+#include "../phy-provider.h"
 
 #define CMN_SSM_BANDGAP			(0x21 << 2)
 #define CMN_SSM_BIAS			(0x22 << 2)
diff --git a/drivers/phy/rockchip/phy-rockchip-usb.c b/drivers/phy/rockchip/phy-rockchip-usb.c
index cef96739cf3f..0652f821332b 100644
--- a/drivers/phy/rockchip/phy-rockchip-usb.c
+++ b/drivers/phy/rockchip/phy-rockchip-usb.c
@@ -14,7 +14,6 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/regulator/consumer.h>
@@ -23,6 +22,8 @@
 #include <linux/mfd/syscon.h>
 #include <linux/delay.h>
 
+#include "../phy-provider.h"
+
 static int enable_usb_uart;
 
 #define UOC_CON0					0x00
diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index fba35510d88c..cf2abf29512f 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -25,6 +25,8 @@
 #include <linux/usb/typec_dp.h>
 #include <linux/usb/typec_mux.h>
 
+#include "../phy-provider.h"
+
 /* USBDP PHY Register Definitions */
 #define UDPHY_PCS				0x4000
 #define UDPHY_PMA				0x8000
diff --git a/drivers/phy/samsung/phy-exynos-dp-video.c b/drivers/phy/samsung/phy-exynos-dp-video.c
index a636dee07585..00d0ed82a620 100644
--- a/drivers/phy/samsung/phy-exynos-dp-video.c
+++ b/drivers/phy/samsung/phy-exynos-dp-video.c
@@ -12,11 +12,12 @@
 #include <linux/module.h>
 #include <linux/mfd/syscon.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/soc/samsung/exynos-regs-pmu.h>
 
+#include "../phy-provider.h"
+
 struct exynos_dp_video_phy_drvdata {
 	u32 phy_ctrl_offset;
 };
diff --git a/drivers/phy/samsung/phy-exynos-mipi-video.c b/drivers/phy/samsung/phy-exynos-mipi-video.c
index be925508ed97..ce8a258a104e 100644
--- a/drivers/phy/samsung/phy-exynos-mipi-video.c
+++ b/drivers/phy/samsung/phy-exynos-mipi-video.c
@@ -11,13 +11,14 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/spinlock.h>
 #include <linux/soc/samsung/exynos-regs-pmu.h>
 #include <linux/mfd/syscon.h>
 
+#include "../phy-provider.h"
+
 enum exynos_mipi_phy_id {
 	EXYNOS_MIPI_PHY_ID_NONE = -1,
 	EXYNOS_MIPI_PHY_ID_CSIS0,
diff --git a/drivers/phy/samsung/phy-exynos-pcie.c b/drivers/phy/samsung/phy-exynos-pcie.c
index 53c9230c2907..9dd3a4a90fa7 100644
--- a/drivers/phy/samsung/phy-exynos-pcie.c
+++ b/drivers/phy/samsung/phy-exynos-pcie.c
@@ -12,9 +12,10 @@
 #include <linux/mfd/syscon.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
-#include <linux/phy/phy.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 #define PCIE_PHY_OFFSET(x)		((x) * 0x4)
 
 /* Sysreg FSYS register offsets and bits for Exynos5433 */
diff --git a/drivers/phy/samsung/phy-exynos4210-usb2.c b/drivers/phy/samsung/phy-exynos4210-usb2.c
index 3898a7f58217..beb2f96bebbf 100644
--- a/drivers/phy/samsung/phy-exynos4210-usb2.c
+++ b/drivers/phy/samsung/phy-exynos4210-usb2.c
@@ -8,8 +8,9 @@
 
 #include <linux/delay.h>
 #include <linux/io.h>
-#include <linux/phy/phy.h>
 #include <linux/regmap.h>
+
+#include "../phy-provider.h"
 #include "phy-samsung-usb2.h"
 
 /* Exynos USB PHY registers */
diff --git a/drivers/phy/samsung/phy-exynos4x12-usb2.c b/drivers/phy/samsung/phy-exynos4x12-usb2.c
index b528a5d037fe..a402f80d0aab 100644
--- a/drivers/phy/samsung/phy-exynos4x12-usb2.c
+++ b/drivers/phy/samsung/phy-exynos4x12-usb2.c
@@ -8,8 +8,9 @@
 
 #include <linux/delay.h>
 #include <linux/io.h>
-#include <linux/phy/phy.h>
 #include <linux/regmap.h>
+
+#include "../phy-provider.h"
 #include "phy-samsung-usb2.h"
 
 /* Exynos USB PHY registers */
diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 5a181cb4597e..cb476d007e3f 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -26,6 +26,8 @@
 #include <linux/usb/typec.h>
 #include <linux/usb/typec_mux.h>
 
+#include "../phy-provider.h"
+
 /* Exynos USB PHY registers */
 #define EXYNOS5_FSEL_9MHZ6		0x0
 #define EXYNOS5_FSEL_10MHZ		0x1
diff --git a/drivers/phy/samsung/phy-exynos5250-sata.c b/drivers/phy/samsung/phy-exynos5250-sata.c
index 595adba5fb8f..0f85ae0a5901 100644
--- a/drivers/phy/samsung/phy-exynos5250-sata.c
+++ b/drivers/phy/samsung/phy-exynos5250-sata.c
@@ -15,12 +15,13 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/spinlock.h>
 #include <linux/mfd/syscon.h>
 
+#include "../phy-provider.h"
+
 #define SATAPHY_CONTROL_OFFSET		0x0724
 #define EXYNOS5_SATAPHY_PMU_ENABLE	BIT(0)
 #define EXYNOS5_SATA_RESET		0x4
diff --git a/drivers/phy/samsung/phy-exynos5250-usb2.c b/drivers/phy/samsung/phy-exynos5250-usb2.c
index 21b06072f866..04815633f290 100644
--- a/drivers/phy/samsung/phy-exynos5250-usb2.c
+++ b/drivers/phy/samsung/phy-exynos5250-usb2.c
@@ -8,8 +8,9 @@
 
 #include <linux/delay.h>
 #include <linux/io.h>
-#include <linux/phy/phy.h>
 #include <linux/regmap.h>
+
+#include "../phy-provider.h"
 #include "phy-samsung-usb2.h"
 
 /* Exynos USB PHY registers */
diff --git a/drivers/phy/samsung/phy-s5pv210-usb2.c b/drivers/phy/samsung/phy-s5pv210-usb2.c
index 32be62e49804..4d72559d29a9 100644
--- a/drivers/phy/samsung/phy-s5pv210-usb2.c
+++ b/drivers/phy/samsung/phy-s5pv210-usb2.c
@@ -8,7 +8,8 @@
 
 #include <linux/delay.h>
 #include <linux/io.h>
-#include <linux/phy/phy.h>
+
+#include "../phy-provider.h"
 #include "phy-samsung-usb2.h"
 
 /* Exynos USB PHY registers */
diff --git a/drivers/phy/samsung/phy-samsung-ufs.c b/drivers/phy/samsung/phy-samsung-ufs.c
index ee665f26c236..b55a726cd44e 100644
--- a/drivers/phy/samsung/phy-samsung-ufs.c
+++ b/drivers/phy/samsung/phy-samsung-ufs.c
@@ -15,10 +15,10 @@
 #include <linux/iopoll.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
 #include "phy-samsung-ufs.h"
 
 #define for_each_phy_lane(phy, i) \
diff --git a/drivers/phy/samsung/phy-samsung-ufs.h b/drivers/phy/samsung/phy-samsung-ufs.h
index f2c2e744e5ba..90f4d4cef631 100644
--- a/drivers/phy/samsung/phy-samsung-ufs.h
+++ b/drivers/phy/samsung/phy-samsung-ufs.h
@@ -10,9 +10,10 @@
 #ifndef _PHY_SAMSUNG_UFS_
 #define _PHY_SAMSUNG_UFS_
 
-#include <linux/phy/phy.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 #define PHY_COMN_BLK	1
 #define PHY_TRSV_BLK	2
 #define END_UFS_PHY_CFG { 0 }
diff --git a/drivers/phy/samsung/phy-samsung-usb2.c b/drivers/phy/samsung/phy-samsung-usb2.c
index d2749b67cf8f..362dd4ae3cab 100644
--- a/drivers/phy/samsung/phy-samsung-usb2.c
+++ b/drivers/phy/samsung/phy-samsung-usb2.c
@@ -13,6 +13,8 @@
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/spinlock.h>
+
+#include "../phy-provider.h"
 #include "phy-samsung-usb2.h"
 
 static int samsung_usb2_phy_power_on(struct phy *phy)
diff --git a/drivers/phy/samsung/phy-samsung-usb2.h b/drivers/phy/samsung/phy-samsung-usb2.h
index ebaf43bfc5a2..515c7938fccd 100644
--- a/drivers/phy/samsung/phy-samsung-usb2.h
+++ b/drivers/phy/samsung/phy-samsung-usb2.h
@@ -10,12 +10,13 @@
 #define _PHY_EXYNOS_USB2_H
 
 #include <linux/clk.h>
-#include <linux/phy/phy.h>
 #include <linux/device.h>
 #include <linux/regmap.h>
 #include <linux/spinlock.h>
 #include <linux/regulator/consumer.h>
 
+#include "../phy-provider.h"
+
 #define KHZ 1000
 #define MHZ (KHZ * KHZ)
 
diff --git a/drivers/phy/socionext/phy-uniphier-ahci.c b/drivers/phy/socionext/phy-uniphier-ahci.c
index 28cf3efe0695..6b3ce56c7f0c 100644
--- a/drivers/phy/socionext/phy-uniphier-ahci.c
+++ b/drivers/phy/socionext/phy-uniphier-ahci.c
@@ -12,10 +12,11 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 
+#include "../phy-provider.h"
+
 struct uniphier_ahciphy_priv {
 	struct device *dev;
 	void __iomem  *base;
diff --git a/drivers/phy/socionext/phy-uniphier-pcie.c b/drivers/phy/socionext/phy-uniphier-pcie.c
index c19173492b79..00f6cdf846f1 100644
--- a/drivers/phy/socionext/phy-uniphier-pcie.c
+++ b/drivers/phy/socionext/phy-uniphier-pcie.c
@@ -12,12 +12,13 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/resource.h>
 
+#include "../phy-provider.h"
+
 /* PHY */
 #define PCL_PHY_CLKCTRL		0x0000
 #define PORT_SEL_MASK		GENMASK(11, 9)
diff --git a/drivers/phy/socionext/phy-uniphier-usb2.c b/drivers/phy/socionext/phy-uniphier-usb2.c
index c49d432e526b..6ee566478be0 100644
--- a/drivers/phy/socionext/phy-uniphier-usb2.c
+++ b/drivers/phy/socionext/phy-uniphier-usb2.c
@@ -10,11 +10,12 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 
+#include "../phy-provider.h"
+
 #define SG_USBPHY1CTRL		0x500
 #define SG_USBPHY1CTRL2		0x504
 #define SG_USBPHY2CTRL		0x508
diff --git a/drivers/phy/socionext/phy-uniphier-usb3hs.c b/drivers/phy/socionext/phy-uniphier-usb3hs.c
index 8c8673df0084..a08db863223f 100644
--- a/drivers/phy/socionext/phy-uniphier-usb3hs.c
+++ b/drivers/phy/socionext/phy-uniphier-usb3hs.c
@@ -17,12 +17,13 @@
 #include <linux/nvmem-consumer.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
 
+#include "../phy-provider.h"
+
 #define HSPHY_CFG0		0x0
 #define HSPHY_CFG0_HS_I_MASK	GENMASK(31, 28)
 #define HSPHY_CFG0_HSDISC_MASK	GENMASK(27, 26)
diff --git a/drivers/phy/socionext/phy-uniphier-usb3ss.c b/drivers/phy/socionext/phy-uniphier-usb3ss.c
index f402ed8732fd..8829305e9d4c 100644
--- a/drivers/phy/socionext/phy-uniphier-usb3ss.c
+++ b/drivers/phy/socionext/phy-uniphier-usb3ss.c
@@ -16,11 +16,12 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 
+#include "../phy-provider.h"
+
 #define SSPHY_TESTI		0x0
 #define TESTI_DAT_MASK		GENMASK(13, 6)
 #define TESTI_ADR_MASK		GENMASK(5, 1)
diff --git a/drivers/phy/sophgo/phy-cv1800-usb2.c b/drivers/phy/sophgo/phy-cv1800-usb2.c
index 6fe846534e9c..1fd7bba498ad 100644
--- a/drivers/phy/sophgo/phy-cv1800-usb2.c
+++ b/drivers/phy/sophgo/phy-cv1800-usb2.c
@@ -12,10 +12,11 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
-#include <linux/phy/phy.h>
 #include <linux/regmap.h>
 #include <linux/spinlock.h>
 
+#include "../phy-provider.h"
+
 #define REG_USB_PHY_CTRL		0x048
 
 #define PHY_VBUS_POWER_EN		BIT(0)
diff --git a/drivers/phy/spacemit/phy-k1-pcie.c b/drivers/phy/spacemit/phy-k1-pcie.c
index 75477bea7f70..6f8f2f39f7f8 100644
--- a/drivers/phy/spacemit/phy-k1-pcie.c
+++ b/drivers/phy/spacemit/phy-k1-pcie.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2025 by RISCstar Solutions Corporation.  All rights reserved.
  */
 
+#include <dt-bindings/phy/phy.h>
 #include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
@@ -12,12 +13,11 @@
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
-#include <dt-bindings/phy/phy.h>
+#include "../phy-provider.h"
 
 /*
  * Three PCIe ports are supported in the SpacemiT K1 SoC, and this driver
diff --git a/drivers/phy/spacemit/phy-k1-usb2.c b/drivers/phy/spacemit/phy-k1-usb2.c
index 14a02f554810..f482b6c9b6d4 100644
--- a/drivers/phy/spacemit/phy-k1-usb2.c
+++ b/drivers/phy/spacemit/phy-k1-usb2.c
@@ -9,11 +9,12 @@
 #include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/iopoll.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/usb/of.h>
 
+#include "../phy-provider.h"
+
 #define PHY_RST_MODE_CTRL		0x04
 #define  PHY_PLL_RDY			BIT(0)
 #define  PHY_CLK_CDR_EN			BIT(1)
diff --git a/drivers/phy/st/phy-miphy28lp.c b/drivers/phy/st/phy-miphy28lp.c
index 43cef89af55e..e9792deb629a 100644
--- a/drivers/phy/st/phy-miphy28lp.c
+++ b/drivers/phy/st/phy-miphy28lp.c
@@ -7,6 +7,7 @@
  * Author: Alexandre Torgue <alexandre.torgue@st.com>
  */
 
+#include <dt-bindings/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
@@ -16,13 +17,12 @@
 #include <linux/of_platform.h>
 #include <linux/of_address.h>
 #include <linux/clk.h>
-#include <linux/phy/phy.h>
 #include <linux/delay.h>
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
-#include <dt-bindings/phy/phy.h>
+#include "../phy-provider.h"
 
 /* MiPHY registers */
 #define MIPHY_CONF_RESET		0x00
diff --git a/drivers/phy/st/phy-spear1310-miphy.c b/drivers/phy/st/phy-spear1310-miphy.c
index c661ab63505f..86acc2412c46 100644
--- a/drivers/phy/st/phy-spear1310-miphy.c
+++ b/drivers/phy/st/phy-spear1310-miphy.c
@@ -14,10 +14,11 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 /* SPEAr1310 Registers */
 #define SPEAR1310_PCIE_SATA_CFG			0x3A4
 	#define SPEAR1310_PCIE_SATA2_SEL_PCIE		(0 << 31)
diff --git a/drivers/phy/st/phy-spear1340-miphy.c b/drivers/phy/st/phy-spear1340-miphy.c
index 85a60d64ebb7..4dbd3158c060 100644
--- a/drivers/phy/st/phy-spear1340-miphy.c
+++ b/drivers/phy/st/phy-spear1340-miphy.c
@@ -14,10 +14,11 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 /* SPEAr1340 Registers */
 /* Power Management Registers */
 #define SPEAR1340_PCM_CFG			0x100
diff --git a/drivers/phy/st/phy-stih407-usb.c b/drivers/phy/st/phy-stih407-usb.c
index 7a3e4584895c..497f9aa4139d 100644
--- a/drivers/phy/st/phy-stih407-usb.c
+++ b/drivers/phy/st/phy-stih407-usb.c
@@ -16,7 +16,8 @@
 #include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/mfd/syscon.h>
-#include <linux/phy/phy.h>
+
+#include "../phy-provider.h"
 
 #define PHYPARAM_REG	0
 #define PHYCTRL_REG	1
diff --git a/drivers/phy/st/phy-stm32-combophy.c b/drivers/phy/st/phy-stm32-combophy.c
index 607b4d607eb5..8757b1993e90 100644
--- a/drivers/phy/st/phy-stm32-combophy.c
+++ b/drivers/phy/st/phy-stm32-combophy.c
@@ -10,12 +10,13 @@
 #include <linux/clk.h>
 #include <linux/mfd/syscon.h>
 #include <linux/platform_device.h>
-#include <linux/phy/phy.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 #include <dt-bindings/phy/phy.h>
 
+#include "../phy-provider.h"
+
 #define SYSCFG_COMBOPHY_CR1 0x4c00
 #define SYSCFG_COMBOPHY_CR2 0x4c04
 #define SYSCFG_COMBOPHY_CR4 0x4c0c
diff --git a/drivers/phy/st/phy-stm32-usbphyc.c b/drivers/phy/st/phy-stm32-usbphyc.c
index b44afbff8616..647fbbe5c734 100644
--- a/drivers/phy/st/phy-stm32-usbphyc.c
+++ b/drivers/phy/st/phy-stm32-usbphyc.c
@@ -18,6 +18,8 @@
 #include <linux/reset.h>
 #include <linux/units.h>
 
+#include "../phy-provider.h"
+
 #define STM32_USBPHYC_PLL	0x0
 #define STM32_USBPHYC_MISC	0x8
 #define STM32_USBPHYC_MONITOR(X) (0x108 + ((X) * 0x100))
diff --git a/drivers/phy/starfive/phy-jh7110-dphy-rx.c b/drivers/phy/starfive/phy-jh7110-dphy-rx.c
index 0b039e1f71c5..099a1ebf6194 100644
--- a/drivers/phy/starfive/phy-jh7110-dphy-rx.c
+++ b/drivers/phy/starfive/phy-jh7110-dphy-rx.c
@@ -13,11 +13,12 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
+#include "../phy-provider.h"
+
 #define STF_DPHY_APBCFGSAIF_SYSCFG(x)		(x)
 
 #define STF_DPHY_ENABLE_CLK			BIT(6)
diff --git a/drivers/phy/starfive/phy-jh7110-dphy-tx.c b/drivers/phy/starfive/phy-jh7110-dphy-tx.c
index c64d1c91b130..a5faf06b6d14 100644
--- a/drivers/phy/starfive/phy-jh7110-dphy-tx.c
+++ b/drivers/phy/starfive/phy-jh7110-dphy-tx.c
@@ -15,12 +15,13 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
-#include <linux/phy/phy.h>
 #include <linux/phy/phy-mipi-dphy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
+#include "../phy-provider.h"
+
 #define STF_DPHY_APBIFSAIF_SYSCFG(x)			(x)
 
 #define STF_DPHY_AON_POWER_READY_N_ACTIVE		0
diff --git a/drivers/phy/starfive/phy-jh7110-pcie.c b/drivers/phy/starfive/phy-jh7110-pcie.c
index 734c8e007727..d68d396ac3cc 100644
--- a/drivers/phy/starfive/phy-jh7110-pcie.c
+++ b/drivers/phy/starfive/phy-jh7110-pcie.c
@@ -12,10 +12,11 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/mfd/syscon.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 #define PCIE_KVCO_LEVEL_OFF		0x28
 #define PCIE_USB3_PHY_PLL_CTL_OFF	0x7c
 #define PCIE_KVCO_TUNE_SIGNAL_OFF	0x80
diff --git a/drivers/phy/starfive/phy-jh7110-usb.c b/drivers/phy/starfive/phy-jh7110-usb.c
index b505d89860b4..5762586e5c7d 100644
--- a/drivers/phy/starfive/phy-jh7110-usb.c
+++ b/drivers/phy/starfive/phy-jh7110-usb.c
@@ -12,11 +12,12 @@
 #include <linux/io.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/usb/of.h>
 
+#include "../phy-provider.h"
+
 #define USB_125M_CLK_RATE		125000000
 #define USB_CLK_MODE_OFF		0x0
 #define USB_CLK_MODE_RX_NORMAL_PWR	BIT(1)
diff --git a/drivers/phy/sunplus/phy-sunplus-usb2.c b/drivers/phy/sunplus/phy-sunplus-usb2.c
index 637a5fbae6d9..2ddbc37d09ee 100644
--- a/drivers/phy/sunplus/phy-sunplus-usb2.c
+++ b/drivers/phy/sunplus/phy-sunplus-usb2.c
@@ -17,10 +17,11 @@
 #include <linux/module.h>
 #include <linux/nvmem-consumer.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 
+#include "../phy-provider.h"
+
 #define HIGH_MASK_BITS				GENMASK(31, 16)
 #define LOW_MASK_BITS				GENMASK(15, 0)
 #define OTP_DISC_LEVEL_DEFAULT			0xd
diff --git a/drivers/phy/tegra/phy-tegra194-p2u.c b/drivers/phy/tegra/phy-tegra194-p2u.c
index f49b417c9eb6..467b6b97e53d 100644
--- a/drivers/phy/tegra/phy-tegra194-p2u.c
+++ b/drivers/phy/tegra/phy-tegra194-p2u.c
@@ -11,9 +11,10 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 
+#include "../phy-provider.h"
+
 #define P2U_CONTROL_CMN			0x74
 #define P2U_CONTROL_CMN_ENABLE_L2_EXIT_RATE_CHANGE		BIT(13)
 #define P2U_CONTROL_CMN_SKP_SIZE_PROTECTION_EN			BIT(20)
diff --git a/drivers/phy/tegra/xusb-tegra124.c b/drivers/phy/tegra/xusb-tegra124.c
index 70b6213370a8..21686c6fb2d7 100644
--- a/drivers/phy/tegra/xusb-tegra124.c
+++ b/drivers/phy/tegra/xusb-tegra124.c
@@ -8,7 +8,6 @@
 #include <linux/mailbox_client.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
@@ -16,6 +15,7 @@
 
 #include <soc/tegra/fuse.h>
 
+#include "../phy-provider.h"
 #include "xusb.h"
 
 #define FUSE_SKU_CALIB_HS_CURR_LEVEL_PADX_SHIFT(x) ((x) ? 15 : 0)
diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
index 1ddf11265974..e017cb1ff484 100644
--- a/drivers/phy/tegra/xusb-tegra186.c
+++ b/drivers/phy/tegra/xusb-tegra186.c
@@ -7,7 +7,6 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/regulator/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/clk.h>
@@ -15,6 +14,7 @@
 
 #include <soc/tegra/fuse.h>
 
+#include "../phy-provider.h"
 #include "xusb.h"
 
 /* FUSE USB_CALIB registers */
diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
index 1abc5913ec49..006aba47b93d 100644
--- a/drivers/phy/tegra/xusb-tegra210.c
+++ b/drivers/phy/tegra/xusb-tegra210.c
@@ -12,7 +12,6 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
@@ -21,6 +20,7 @@
 
 #include <soc/tegra/fuse.h>
 
+#include "../phy-provider.h"
 #include "xusb.h"
 
 #define FUSE_SKU_CALIB_HS_CURR_LEVEL_PADX_SHIFT(x) \
diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index 9d74c0ecc31b..07a2f5a4dbee 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -9,7 +9,6 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
-#include <linux/phy/phy.h>
 #include <linux/phy/tegra/xusb.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
@@ -19,6 +18,7 @@
 
 #include <soc/tegra/fuse.h>
 
+#include "../phy-provider.h"
 #include "xusb.h"
 
 static struct phy *tegra_xusb_pad_of_xlate(struct device *dev,
diff --git a/drivers/phy/ti/phy-am654-serdes.c b/drivers/phy/ti/phy-am654-serdes.c
index 5b6c27aa7e8b..8990b715525e 100644
--- a/drivers/phy/ti/phy-am654-serdes.c
+++ b/drivers/phy/ti/phy-am654-serdes.c
@@ -15,11 +15,12 @@
 #include <linux/mfd/syscon.h>
 #include <linux/mux/consumer.h>
 #include <linux/of_address.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 #define CMU_R004		0x4
 #define CMU_R060		0x60
 #define CMU_R07C		0x7c
diff --git a/drivers/phy/ti/phy-da8xx-usb.c b/drivers/phy/ti/phy-da8xx-usb.c
index 62fa6f89c0e6..261b65abd38b 100644
--- a/drivers/phy/ti/phy-da8xx-usb.c
+++ b/drivers/phy/ti/phy-da8xx-usb.c
@@ -11,12 +11,13 @@
 #include <linux/mfd/da8xx-cfgchip.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_data/phy-da8xx-usb.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 #define PHY_INIT_BITS	(CFGCHIP2_SESENDEN | CFGCHIP2_VBDTCTEN)
 
 struct da8xx_usb_phy {
diff --git a/drivers/phy/ti/phy-dm816x-usb.c b/drivers/phy/ti/phy-dm816x-usb.c
index d274831b731c..515ef7812bde 100644
--- a/drivers/phy/ti/phy-dm816x-usb.c
+++ b/drivers/phy/ti/phy-dm816x-usb.c
@@ -12,10 +12,11 @@
 #include <linux/err.h>
 #include <linux/pm_runtime.h>
 #include <linux/delay.h>
-#include <linux/phy/phy.h>
 
 #include <linux/mfd/syscon.h>
 
+#include "../phy-provider.h"
+
 /*
  * TRM has two sets of USB_CTRL registers.. The correct register bits
  * are in TRM section 24.9.8.2 USB_CTRL Register. The TRM documents the
diff --git a/drivers/phy/ti/phy-gmii-sel.c b/drivers/phy/ti/phy-gmii-sel.c
index 6213c2b6005a..ce7dc692d7be 100644
--- a/drivers/phy/ti/phy-gmii-sel.c
+++ b/drivers/phy/ti/phy-gmii-sel.c
@@ -14,9 +14,10 @@
 #include <linux/of_address.h>
 #include <linux/of_net.h>
 #include <linux/phy.h>
-#include <linux/phy/phy.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 /* AM33xx SoC specific definitions for the CONTROL port */
 #define AM33XX_GMII_SEL_MODE_MII	0
 #define AM33XX_GMII_SEL_MODE_RMII	1
diff --git a/drivers/phy/ti/phy-omap-usb2.c b/drivers/phy/ti/phy-omap-usb2.c
index 1eb252604441..318f51d09c28 100644
--- a/drivers/phy/ti/phy-omap-usb2.c
+++ b/drivers/phy/ti/phy-omap-usb2.c
@@ -16,7 +16,6 @@
 #include <linux/of_platform.h>
 #include <linux/phy/omap_control_phy.h>
 #include <linux/phy/omap_usb.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
@@ -25,6 +24,8 @@
 #include <linux/sys_soc.h>
 #include <linux/usb/phy_companion.h>
 
+#include "../phy-provider.h"
+
 #define USB2PHY_ANA_CONFIG1		0x4c
 #define USB2PHY_DISCON_BYP_LATCH	BIT(31)
 
diff --git a/drivers/phy/ti/phy-ti-pipe3.c b/drivers/phy/ti/phy-ti-pipe3.c
index b5543b5c674c..d63c8e872d5b 100644
--- a/drivers/phy/ti/phy-ti-pipe3.c
+++ b/drivers/phy/ti/phy-ti-pipe3.c
@@ -10,7 +10,6 @@
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/slab.h>
-#include <linux/phy/phy.h>
 #include <linux/of.h>
 #include <linux/clk.h>
 #include <linux/err.h>
@@ -22,6 +21,8 @@
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 #define	PLL_STATUS		0x00000004
 #define	PLL_GO			0x00000008
 #define	PLL_CONFIGURATION1	0x0000000C
diff --git a/drivers/phy/ti/phy-twl4030-usb.c b/drivers/phy/ti/phy-twl4030-usb.c
index a26aec3ab29e..67c9883691fc 100644
--- a/drivers/phy/ti/phy-twl4030-usb.c
+++ b/drivers/phy/ti/phy-twl4030-usb.c
@@ -20,7 +20,6 @@
 #include <linux/io.h>
 #include <linux/delay.h>
 #include <linux/usb/otg.h>
-#include <linux/phy/phy.h>
 #include <linux/pm_runtime.h>
 #include <linux/usb/musb.h>
 #include <linux/usb/ulpi.h>
@@ -29,6 +28,8 @@
 #include <linux/err.h>
 #include <linux/slab.h>
 
+#include "../phy-provider.h"
+
 /* Register defines */
 
 #define MCPC_CTRL			0x30
diff --git a/drivers/phy/xilinx/phy-zynqmp.c b/drivers/phy/xilinx/phy-zynqmp.c
index fe6b4925d166..db40594622da 100644
--- a/drivers/phy/xilinx/phy-zynqmp.c
+++ b/drivers/phy/xilinx/phy-zynqmp.c
@@ -12,6 +12,7 @@
  * PCIe should also work but that is experimental as of now.
  */
 
+#include <dt-bindings/phy/phy.h>
 #include <linux/clk.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
@@ -19,12 +20,11 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
 
-#include <dt-bindings/phy/phy.h>
+#include "../phy-provider.h"
 
 /*
  * Lane Registers
diff --git a/include/linux/phy/phy-sun4i-usb.h b/include/linux/phy/phy-sun4i-usb.h
index f3e7b13608e4..66612be0dac5 100644
--- a/include/linux/phy/phy-sun4i-usb.h
+++ b/include/linux/phy/phy-sun4i-usb.h
@@ -6,7 +6,7 @@
 #ifndef PHY_SUN4I_USB_H_
 #define PHY_SUN4I_USB_H_
 
-#include "phy.h"
+struct phy;
 
 /**
  * sun4i_usb_phy_set_squelch_detect() - Enable/disable squelch detect
diff --git a/include/linux/phy/ulpi_phy.h b/include/linux/phy/ulpi_phy.h
index 7054b440347c..0f9e8430d398 100644
--- a/include/linux/phy/ulpi_phy.h
+++ b/include/linux/phy/ulpi_phy.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#include <linux/phy/phy.h>
+#include "../../drivers/phy/phy-provider.h"
 
 /**
  * Helper that registers PHY for a ULPI device and adds a lookup for binding it
-- 
2.43.0


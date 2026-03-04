Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHHTG+U5qWka3QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:08:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB2F20D244
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:08:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D01610EB36;
	Thu,  5 Mar 2026 08:07:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Ux1D8bkn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010021.outbound.protection.outlook.com [52.101.84.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C0810EA87;
 Wed,  4 Mar 2026 18:00:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ClntI7OwB3gGorSMWbVbpHjxVLVVqIHGQTUyYpwY+J4IcWTTJ9DmBAoqvrf3CNFxcoEYCOfL3Nr3vj+it1NBux58xSC6WqvlbpsT219aYKW1NH7qCtyL2L7xgOJWvLUtp0xpJtPnezUntt23gVOwzhSlcTg7R+U5jjICdzUkhlR5V8+vPks48spJdFutMGe6TzQaH/J/vDgwv/XUT8tij6VAZlWV1fNgYS4dBQR4we09eDCoPu8Keugh9qN9yT8Dx+Dcz03D5sgGX+HTMpEfdztcRfqLb6A0KEqjXAWBvEuDZbPSPy28sJdshkfWRv4HLWAYjfSx2mxmdT1QgORsZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+b7aLpOq/iyD+vDQ1nroJ7GTYV+Op/wAwVLY4G3Mpg=;
 b=YYAwxnngpsVa5wLLGkHnT7RxG3XA7TU0oPrisftqYBkQP0w531DeLMtown0eWbG2Uaow8hZHdT7yvRQ3BVBIKEoCck+lzqRLlVFzVfrfTlgCzfr4kDvr0bEjCyERw6wMzul3DvmnLRC+yvPP9GuM4EpA0P49wt+zzpQCmi94fqQFCkPefyURAOdS+/1/pSbEUTVfhf9Z0ZgXuoLtnauNvmcGUpl21o2Ac4Y4jCQBjrbS83Jswb8n0rTGOGYJxbw47qdLMmEheMG4nV8VNk3ZUZJWLlwSoYKCTUww/Sg1oCxC14/fgfo3k+Re+Yd3GUNc3Y3UcCpdOkhk+v9EfZkZig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+b7aLpOq/iyD+vDQ1nroJ7GTYV+Op/wAwVLY4G3Mpg=;
 b=Ux1D8bkngPNU7GHM3v80ukIOcZVaw8MeZlyHIwP4sJtkRpeh6gGqS8BIQ6CqU931GUkC+Qe2JJRZGuLnMbfCUKni/Wn3j9YL7YAFhotGO7O6ahO4qkCqPbu/c1lE1Sa5E7BsTE9L7eqy2EgXPBOEKDXhbJGmAyZm6djV9UCrCLCrobT5xWZPNNAvSXKNkZitOcpmTyywYfWwpL5U24VCR4Cw1hCw+/p0z17S2PcXXgA12Uz1jFtfP9zKDZUFr5cmzpiJLdSiH8LpBIp+bapNLyVUSPQsSIRRPdwmGQaIygUjg+2wKnlNgDWMxnnG0dBxemAV+hP+VD0zyLV0MMpJ3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by GV1PR04MB10275.eurprd04.prod.outlook.com (2603:10a6:150:1ad::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Wed, 4 Mar
 2026 18:00:27 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 18:00:27 +0000
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
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH phy-next 15/22] drm: bridge: cdns-mhdp8546: use consumer API
 for getting PHY bus width
Date: Wed,  4 Mar 2026 19:57:28 +0200
Message-ID: <20260304175735.2660419-16-vladimir.oltean@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: f4275ffe-a90f-4c1c-acd1-08de7a17eabf
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|10070799003|19092799006|1800799024|366016;
X-Microsoft-Antispam-Message-Info: MlsE1jzbDg8IImEQ9ntOkhEwpTjV71ehH28FEH9UOMZGBvMJN1TD1FSHk37sUJ7qUM0GC5G1EtuvMr6/EJLOtsaGYae/rZUkR0X3dHrQh9ukveNbjyvvDLOegd5BkNrDWPneWLSErnZtQ/7hLLtRb4HLP8wj9qcaYXDHDvyP+7B8qKJqQaI8to4pkqykGiglddxv5Y34DviUIKtHx16Hsbmcr/BHNWKpQk40ZPmqO9vRfU2Ou9s1geIEtR2G/uFR/xoGO140OqUS2F9k7dScWI113jEF8zqgTBLReVAnUAyEyvjIYHjpTtfdgbS8AWyO8/D6PPY0kS7njC0Mu0N94Kha0Yj+JBB88c2MQZPO1NaWm5Rw/G6vwcU5PqxEbVOGrhdAe7+PgDi4uERwL1/5Jkq0TGgPeY/EQFTtOsHogiF6EIx7kfw1NRkI9DoxZ43wc11/ZALp6mcdAZxN3Ouahe2SUTVotWme7oPfcig7ygSc/lXHxnzWXwjmHEb+2R3QRkMv177fNWTQTxt4avia2zvUiJYMA9nj+u1WaNyGTVIhHq65PQdrWDaE4XP8DvfFMQHTeajCBa9BKGkmyrNHKOQJ6ck5/RqXZdfJpbmlsQDX5nUkAPtaQlORNhoQkgKMB4gvMTYqYoTMHKY1xoiykxIB1gRKxv4GD9PLKfXNlb4zqfu2raHLQnpyNhPcCYSiL5JFHE/o5ZUNGZNE0rQhzRDVqDbETFjtASe48X61pY4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8585.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(10070799003)(19092799006)(1800799024)(366016);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VWtfPzTMPrk6W0niL+C20gKr2cpvsjjdthDFzUvunYG8/NeZl4DLztq7AIBk?=
 =?us-ascii?Q?Rq/sBXGNWRZgZtv/hO8nyOYrlCPTO8JPeyI63Nwr/Z9U1XqFdzkhhOWOcQaT?=
 =?us-ascii?Q?JtfkBWfqKol0nF9ahnqdfFehFwpoT9ROK/qtqhUz1fuzOwmg6cPnnDaEt55s?=
 =?us-ascii?Q?/DFOqFdYXxmz7d27SN4n6xBRWiEtEiu0mtpSsYk9Nb+S7YEAfnH5BymmrOnr?=
 =?us-ascii?Q?pbBvkqM6WXIvICGFobLdibULSzhvnvUG/yHOAWCjWTqzWjKZ6xB2h03bYLXD?=
 =?us-ascii?Q?20RqZzIWSXoeabthGRQWUCw3lhvqZ4juEKQdWDKD8sbnhgY2Okunycq79b3r?=
 =?us-ascii?Q?Kf3eQkpktAzK3Rq+JUjX8AtOtqnuCDrzhhfsUh0bm2nvG89XSUcfQ4sAfLCc?=
 =?us-ascii?Q?w7yrt/TPTKK2DLebDyg1K2uGBpHYSh4qIvMxhHGmgYwdUIADtU03srFGDBV6?=
 =?us-ascii?Q?KhAu8rBFaL1KlXQ+wQJ3fn7mR3zI9HSmfeCPJID1hlaSqoF6TANIOxLzmFCb?=
 =?us-ascii?Q?G810pX4A/FOIHGWtHhCbl0l1jO/2Nm+yycf+4NrGZgYVH0UX5YYZ28RZjRWC?=
 =?us-ascii?Q?2zhXi3NjmYee7zgy+wSSGrNyVEFkRNsFXn0lbvHIu47Nbgyb3OS5/lZ7XG08?=
 =?us-ascii?Q?ZJfRIC2E3kZEbMHamR3Dx7346hPw9KzwW0lgcG5GsC0s2s4f1v/SW2aZv9/b?=
 =?us-ascii?Q?6Y9wtzIdS/Mk5Hhjs13Viq+wpUvH31hzggUqLjEK6RmERgiJe6ovc52pOZF7?=
 =?us-ascii?Q?dZ3NNt4pue9SvwGmzCtTFP/KeVRUCvaAGA0D+1Qu0AuHAlE+Q6vNJd1wFAuG?=
 =?us-ascii?Q?YDXSLn19BooZZPXFTDkwU8XS05Mu/30t6tx463+QxxOFPdhvoivBfRGhtKkp?=
 =?us-ascii?Q?lTtBmki9REVm2F4W1F0PA52ZTY+2q2FkZ3LxMGeinBQxpwWE6h/sGxo+NYHB?=
 =?us-ascii?Q?6gO7pjR44qjdCHg6ais9AsrtjHiBNdmfRzkwMivtaW228luM4bI5DO5HUPVE?=
 =?us-ascii?Q?NZlH4/ghg3vsTWwj6oBzp0OKsHmgsjD7UfYItNtrXI8gAMTOVpR8uDAqgqcf?=
 =?us-ascii?Q?aTiV1lfEMv9Ay/6rSyBwbPNwS5IbVhwVYtlcNwXtr7DyzxR2ReMwCNYSh1er?=
 =?us-ascii?Q?bZbxi7Mkr8m3UlKGIMmpwmKXIstHD9ie8jksP81SmML9vJg3ljd++vxTc1/Q?=
 =?us-ascii?Q?PmIKNFX00QLB0o2pFxP08rRtzMZdOBSZfYpyqbamjrTPM87BLwHYKgYxC0X/?=
 =?us-ascii?Q?gbsnxuWotpivvIk0IjIgCcsE+KfbBKw6qZ+lZftXZ+DF1hyYEA5GxN5syWhi?=
 =?us-ascii?Q?Y5QH9Yj8dBuQV662oqvSNdKCBsQCYZPOZzSruCny94Ji2A9dW83P3Z4xYyOJ?=
 =?us-ascii?Q?XrRxSpI8eAi0KC89X6W4Iwuym37xHhW5jxSHbqkrnRfsdCiBQnGSJB+iBjZ5?=
 =?us-ascii?Q?GRmZ0HTczvELUh0NHpKs9emFq6lAxXAdgYHTE2/hXMGmbQ8WMl4K8lASHMR5?=
 =?us-ascii?Q?+sMohRdDyXIHn/C/9FZnUFEIeU/gkwm+GyDGLTYZQR0PTpRz73SH4Gnaf4gX?=
 =?us-ascii?Q?R0nvygo38Ew6YusYm4T28nHqlQBESu5sPC/TkL7Hghk1c5ZTpAV9+yZGosW4?=
 =?us-ascii?Q?QWxrK3wgrebnJdy3Sl6wdPO7WN9HHaqW+qYsxgwHtXTNKn/Cu9bZiX6pZa9T?=
 =?us-ascii?Q?KzJng6vDLc5F+/6NhFhZtNwKsNl9ToO6/yy2h1D555oxYLLTvIXmOPnNNbQp?=
 =?us-ascii?Q?3STzu8cWGnbFhAnHghk6FP3hbaBwY7C+VztuH56Yt8j/pGxl3aqSduHZsXUh?=
X-MS-Exchange-AntiSpam-MessageData-1: kbP56DnpIjOyEn+HeK1BGGK19AykVt9cqEk=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4275ffe-a90f-4c1c-acd1-08de7a17eabf
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 18:00:27.7019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NOWzSCO4N0/ukqiTbu0ZX9yHP6NCjmYncqVY0UAh42+ILMTrOjbzND3AG99ejJ2j+JcykqGVVyhhZd1c+KZzjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10275
X-Mailman-Approved-At: Thu, 05 Mar 2026 08:07:47 +0000
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
X-Rspamd-Queue-Id: CBB2F20D244
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[nxp.com:+];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.oltean@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev,microchip.com,intel.com,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:email,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Action: no action

The Cadence MHDP8546 DP bridge driver gets the PHY bus_width attribute
(holding number of lanes) directly, but doing this will no longer be
possible after the definition of struct phy is hidden from consumers.

Use the phy_get_bus_width() API function designed specifically for
consumers.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
---
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index ed7ed82ddb64..e3f8a281f147 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -1304,7 +1304,7 @@ static void cdns_mhdp_fill_host_caps(struct cdns_mhdp_device *mhdp)
 
 	/* Get source capabilities based on PHY attributes */
 
-	mhdp->host.lanes_cnt = mhdp->phy->attrs.bus_width;
+	mhdp->host.lanes_cnt = phy_get_bus_width(mhdp->phy);
 	if (!mhdp->host.lanes_cnt)
 		mhdp->host.lanes_cnt = 4;
 
-- 
2.43.0


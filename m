Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D886211C0
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 14:01:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D481310E430;
	Tue,  8 Nov 2022 13:01:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130078.outbound.protection.outlook.com [40.107.13.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E413210E430
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 13:01:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eTsm0L7OC9RSsrlCGgtMktkqfW6u5Ii+w2076Ls9OLYJ4eNnIutPZpSU72Z5MpOqnmFAyLF5h5cxl1C8LKna0/lQWfJVm8BDNOruJy9c1eVgO+VcE19veUooyoY+AgRUDxa9mEYBrKzfP8OoHGbbpHcpUoUfFNi7idzkXUsNGtJqm2M7vKbHvHcmrpXxFiOjy7LmVvCXba66vM3yRcQ2xWyE31hyZkPZ+dq2LozqJoiP6TxL5AeoAJoKyYa+7N7t61/CbP2pCZXShnCNv4CbBIXUuNmJZ4IY4TyB/q3JYCH9KpjKpbUUmcSCPGi+JwdjYtpI4BUPb59+cqinWxY2Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CI6HiPRkfFukA+gvkjMZqgx2ImVxcURakl6FJilSdaY=;
 b=FpV35xO4+1jzyyu95gqQLbqm0iDcQl05muyaErZmHWiUAiN/ODqh83f4FMPY35n/JIVYwlWpRb7E5DcreLG+ArFGVln9jSsSQyLcee87CJbHNUksmEqasl4IeMowYQBSEp7bN3fBDnzLKfzcQgVlyT8YtZe+Nws+bZYM0sfBvG6F7O2M9pC7j9H8zseHPe+xRV+CkqijonucmhtTnSJTwy9HR9eNmMdQFKfV/bES8GwwboHvrd+tOnnX5afD7xfy1llObWEfSjTtJ1f5uNvOE+jzHsFxYGfnPyPvc55NLyzkqtf3NIZeFd6aqu9F6mF1zuFWxI4j/GmOKIIdPnQQ9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CI6HiPRkfFukA+gvkjMZqgx2ImVxcURakl6FJilSdaY=;
 b=Z2hazdQRwYM3RS60MlSlTmwqZmiqecQ+03oC9PESg4ZsKYoW1DrgWgveCk90FmI+rasrzgvDEhSKWiMlD4KHV38N+H9Q2A+/yH952MdxIvAruP68r3LEwMjLiNXKpe3vg/ym9nSDExsD70ITt+gyNXY3vdun5vyp05aPLJknS9g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by PAXPR04MB8895.eurprd04.prod.outlook.com (2603:10a6:102:20e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Tue, 8 Nov
 2022 13:01:36 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::60b2:4bec:7707:e196]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::60b2:4bec:7707:e196%4]) with mapi id 15.20.5791.025; Tue, 8 Nov 2022
 13:01:34 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, vkoul@kernel.org
Subject: [PATCH v3 01/10] drm: bridge: cadence: convert mailbox functions to
 macro functions
Date: Tue,  8 Nov 2022 21:00:04 +0800
Message-Id: <4fd5d644cfcc70e51df5c0bcaecc6cbb43c49218.1667911321.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667911321.git.Sandor.yu@nxp.com>
References: <cover.1667911321.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0136.apcprd02.prod.outlook.com
 (2603:1096:4:188::16) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|PAXPR04MB8895:EE_
X-MS-Office365-Filtering-Correlation-Id: 428ac7ed-32f9-41b5-8792-08dac1895d0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uTPa2WgT6ItX8mi58FjAt/jIidyefbCE1Nk1uL+RLkIRoumk0Pu00htCKU8tEnjDElQGso/PT3yZXq0UHXI/1lMTFV2vnCwmDrTs56MRVJhitU2HVIbrteVyU2I/18Xmxnbp7ZN7D5qzHRchQBrmEya2IWVUjQUbHqHIumh7CXT8gsRc9YMRbaJyQGJg4lH0zYeekCCrsdX4F1jIUMjunZ6zIenWEoCLCBj0vtCqyYNixQb16LuvIQg+zciVTbMXZ2bpLAEs6sLZ9w3CSAvUOMiBOQQxOp5YaLFcJtiwdRXo8R0n3icUQbkR0uOgqMFGFD/2gldRhnfX0T9SAgx3GEPpMWcYRNKN4rTxPLUBsi0lYw4RjHaSEDpNK2gXlzuL6eoFy1jesidMqB5kyyfLtevFu6bUVs49HPB5Bb59Pr5UpvdqmJ8aBPQYugRUruyyd6K21ovlHrtN2dvROsqiDc8OxFuQ5s1Lf3DZQ59CEtA5QJysViedoj1qUBsZeMj9avoyLA9HIMDiq0ccA41EQEp5RJ0C9OjFZ1sGLhNrKnRiUQtqKot8kkCJtvN4lKpTXwiTfixPLlHi4ajQKYByTWjyZOOPIvOVuvJurpJbEZCZOUjzShzLrGYVgrZhkGE6C5YFiSml/pP/FVdpw4FegYKM7OhYgG+gtYt2lGHTRl8AinYwHYDFkHl7MlQRsYeFLMaPxHQOh8M/jP+T64kCG4mUTQeRLsem9VqI1lN9LP9+iPoXs+07FDjJ/z22MWFKlnWr7ivsXyjwUK82XE37WA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(39860400002)(396003)(366004)(136003)(451199015)(66946007)(38350700002)(4326008)(66556008)(66476007)(921005)(8676002)(316002)(86362001)(8936002)(2616005)(5660300002)(41300700001)(6506007)(6666004)(6512007)(26005)(2906002)(478600001)(83380400001)(15650500001)(186003)(30864003)(6486002)(7416002)(52116002)(38100700002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TWswDK8DWz/yHj+Ujlr/khJ+PYlzzVInTYP2BTTj3XIpd0lAgZON0HO/yYIZ?=
 =?us-ascii?Q?4RJdpvI19ipsGZbOMmQOICx7wM19pYJP6f2vZZSBD3uIwFNRhj0rTSnbgp5Q?=
 =?us-ascii?Q?TlBpcwup2bl2LGRW9Sdu2JyJdkQrngGxP+5onbw1qqQzTCeSBBeUsgZB8CZ2?=
 =?us-ascii?Q?/MF0lmmdHX97bo2KjTBSiB1fq5N0ny3ya0ESC/yCgMfkGbIBSMowoRcjaYlS?=
 =?us-ascii?Q?kBYctYo3OY6guoa6n/6TpKDROdhA0nQSWewx18Qw0ZNxxMvbalbPsPu2h+5w?=
 =?us-ascii?Q?Os6aLa/1PwTkzpmU8bPBaQER4C+jO07lO74vm8h/0VKP6EZtUO1FU3uDOc+y?=
 =?us-ascii?Q?x55g5TOqBHTaxLEB/iCisyzoEa/Crg0I29KJZm0bKAYWCFFhJKvIF4ADOmyW?=
 =?us-ascii?Q?+ctb3Si+HTb7d+vaI+f6e7QKB7fZlatOsSDo2zAYiRgXEjc1uHEnxSA2sHsb?=
 =?us-ascii?Q?mCmHBRptzDaxStA1sooSLN7aYHgqgPpC/oaUiqbukELmqCMwb14KKpqSe1gN?=
 =?us-ascii?Q?n9LlhP8F21gtaSRzM79kHIYyUByzbfqVFoyuy9aglmAmPYKV/+NQrnAV6iz7?=
 =?us-ascii?Q?IY7+Xux94SqGN2H5WTayz1D2WCmcj/gQG0ZLhKX55Q9VKagVcjSsP4CpDrbH?=
 =?us-ascii?Q?dZOY4NyIhmIW238m5izGSD5cwyMSY18mCf/VXlsShijbZEFWOcNpbXC8oH3V?=
 =?us-ascii?Q?WVokJrlO19q+53bt29hRIDkeMnpVP2uC4nf2pXSVG80D5cl24WmtvqPO3bt3?=
 =?us-ascii?Q?EfXbzU3tDYcW4karTRoWGe/oY0cG5BGVmX7tvj3KrGUTaOuC7kEuCnlVrw3N?=
 =?us-ascii?Q?X53x9h/4mQ2W74pbAHIoCqa6KYXrDkZDQ+icg4LhWHxuf0jZby2L+kkjTge6?=
 =?us-ascii?Q?5hHEJlmXIDd68K5ONc3cYBsx6ZVZkRlTI1vNwCHZxiDrN+V3HemhW1wxufWJ?=
 =?us-ascii?Q?C/o3T0ykzF/92v7pZMjzTK/zsDP6rRLBrQtWrPk3CFuNo5dX8PzDC/cduhu/?=
 =?us-ascii?Q?X2hAHFdAbMizHAF1ooNXk52rUcxMuyPRcrBXEo8AyjcwEtmwYOXzDgl7dOW4?=
 =?us-ascii?Q?z7FJkelIkD2KzMcuxpAHnDvU797m95oEydiHSdI1fUhK4wLEhZgcC/eONVTB?=
 =?us-ascii?Q?xt3iJVu+725NSZkkx3YNVZ+kDaFX3ZXzgsHYYDy43Y3OegrbTgM6BJD6fM7H?=
 =?us-ascii?Q?i46ryOO83Y6eyKyp49esSOB7dDGaTIHfKtkQB5UbPibw7SPtGt2T3lmVIa1i?=
 =?us-ascii?Q?20QB52cA5qjJWb57uEqirCoCx20juYGrgDcALcYWocCjpqipVTVihoTVA1py?=
 =?us-ascii?Q?EKWqYbD0ypITeDGvmg87H1idiX8ApX/d9zlH2RE27CerVAcIzOojtWAPUg3z?=
 =?us-ascii?Q?GxuZCJ9JjywubOghHHGSaARKho6RHB9AeQnYe9Ibtqo+8qrTjsqvhdIF4KpJ?=
 =?us-ascii?Q?TEhau7gGptxZl4xWlDa5zT24MMF9jmIVvOjdaPLvjrp6CCK6aFygGIDpThg9?=
 =?us-ascii?Q?fwT4wfE5gmGKWc/AfyZjTzVNAMPnOiNpxPGa3Bqs3ZBzPpnGqvKf3Zho0Rhx?=
 =?us-ascii?Q?1V1WywMpQXFwePk17Hioc5RBfqleRkmjLKsrmpaG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 428ac7ed-32f9-41b5-8792-08dac1895d0a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 13:01:34.5278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5zE7b6HeLmJvr+ovEaDidcl+1O4DXpl0SjMbA4IX/LCyI09r3hk34JoG2WlI26Wj40zZMG9xeo6cVtrKX3RBGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8895
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
Cc: oliver.brown@nxp.com, krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 jani.nikula@intel.com, tzimmermann@suse.de, s.hauer@pengutronix.de,
 javierm@redhat.com, penguin-kernel@I-love.SAKURA.ne.jp, robh+dt@kernel.org,
 linux-imx@nxp.com, kernel@pengutronix.de, Sandor.yu@nxp.com,
 shawnguo@kernel.org, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Mailbox access functions could be share to other mhdp driver and
HDP-TX HDMI/DP PHY drivers, move those functions to head file
include/drm/bridge/cdns-mhdp-mailbox.h and convert them to
macro functions.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 197 +-------------
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |   1 -
 include/drm/bridge/cdns-mhdp-mailbox.h        | 240 ++++++++++++++++++
 3 files changed, 242 insertions(+), 196 deletions(-)
 create mode 100644 include/drm/bridge/cdns-mhdp-mailbox.h

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 31442a922502..b77b0ddcc9b3 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -36,6 +36,7 @@
 #include <linux/slab.h>
 #include <linux/wait.h>
 
+#include <drm/bridge/cdns-mhdp-mailbox.h>
 #include <drm/display/drm_dp_helper.h>
 #include <drm/display/drm_hdcp_helper.h>
 #include <drm/drm_atomic.h>
@@ -55,200 +56,6 @@
 #include "cdns-mhdp8546-hdcp.h"
 #include "cdns-mhdp8546-j721e.h"
 
-static int cdns_mhdp_mailbox_read(struct cdns_mhdp_device *mhdp)
-{
-	int ret, empty;
-
-	WARN_ON(!mutex_is_locked(&mhdp->mbox_mutex));
-
-	ret = readx_poll_timeout(readl, mhdp->regs + CDNS_MAILBOX_EMPTY,
-				 empty, !empty, MAILBOX_RETRY_US,
-				 MAILBOX_TIMEOUT_US);
-	if (ret < 0)
-		return ret;
-
-	return readl(mhdp->regs + CDNS_MAILBOX_RX_DATA) & 0xff;
-}
-
-static int cdns_mhdp_mailbox_write(struct cdns_mhdp_device *mhdp, u8 val)
-{
-	int ret, full;
-
-	WARN_ON(!mutex_is_locked(&mhdp->mbox_mutex));
-
-	ret = readx_poll_timeout(readl, mhdp->regs + CDNS_MAILBOX_FULL,
-				 full, !full, MAILBOX_RETRY_US,
-				 MAILBOX_TIMEOUT_US);
-	if (ret < 0)
-		return ret;
-
-	writel(val, mhdp->regs + CDNS_MAILBOX_TX_DATA);
-
-	return 0;
-}
-
-static int cdns_mhdp_mailbox_recv_header(struct cdns_mhdp_device *mhdp,
-					 u8 module_id, u8 opcode,
-					 u16 req_size)
-{
-	u32 mbox_size, i;
-	u8 header[4];
-	int ret;
-
-	/* read the header of the message */
-	for (i = 0; i < sizeof(header); i++) {
-		ret = cdns_mhdp_mailbox_read(mhdp);
-		if (ret < 0)
-			return ret;
-
-		header[i] = ret;
-	}
-
-	mbox_size = get_unaligned_be16(header + 2);
-
-	if (opcode != header[0] || module_id != header[1] ||
-	    req_size != mbox_size) {
-		/*
-		 * If the message in mailbox is not what we want, we need to
-		 * clear the mailbox by reading its contents.
-		 */
-		for (i = 0; i < mbox_size; i++)
-			if (cdns_mhdp_mailbox_read(mhdp) < 0)
-				break;
-
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static int cdns_mhdp_mailbox_recv_data(struct cdns_mhdp_device *mhdp,
-				       u8 *buff, u16 buff_size)
-{
-	u32 i;
-	int ret;
-
-	for (i = 0; i < buff_size; i++) {
-		ret = cdns_mhdp_mailbox_read(mhdp);
-		if (ret < 0)
-			return ret;
-
-		buff[i] = ret;
-	}
-
-	return 0;
-}
-
-static int cdns_mhdp_mailbox_send(struct cdns_mhdp_device *mhdp, u8 module_id,
-				  u8 opcode, u16 size, u8 *message)
-{
-	u8 header[4];
-	int ret, i;
-
-	header[0] = opcode;
-	header[1] = module_id;
-	put_unaligned_be16(size, header + 2);
-
-	for (i = 0; i < sizeof(header); i++) {
-		ret = cdns_mhdp_mailbox_write(mhdp, header[i]);
-		if (ret)
-			return ret;
-	}
-
-	for (i = 0; i < size; i++) {
-		ret = cdns_mhdp_mailbox_write(mhdp, message[i]);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-
-static
-int cdns_mhdp_reg_read(struct cdns_mhdp_device *mhdp, u32 addr, u32 *value)
-{
-	u8 msg[4], resp[8];
-	int ret;
-
-	put_unaligned_be32(addr, msg);
-
-	mutex_lock(&mhdp->mbox_mutex);
-
-	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_GENERAL,
-				     GENERAL_REGISTER_READ,
-				     sizeof(msg), msg);
-	if (ret)
-		goto out;
-
-	ret = cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_GENERAL,
-					    GENERAL_REGISTER_READ,
-					    sizeof(resp));
-	if (ret)
-		goto out;
-
-	ret = cdns_mhdp_mailbox_recv_data(mhdp, resp, sizeof(resp));
-	if (ret)
-		goto out;
-
-	/* Returned address value should be the same as requested */
-	if (memcmp(msg, resp, sizeof(msg))) {
-		ret = -EINVAL;
-		goto out;
-	}
-
-	*value = get_unaligned_be32(resp + 4);
-
-out:
-	mutex_unlock(&mhdp->mbox_mutex);
-	if (ret) {
-		dev_err(mhdp->dev, "Failed to read register\n");
-		*value = 0;
-	}
-
-	return ret;
-}
-
-static
-int cdns_mhdp_reg_write(struct cdns_mhdp_device *mhdp, u16 addr, u32 val)
-{
-	u8 msg[6];
-	int ret;
-
-	put_unaligned_be16(addr, msg);
-	put_unaligned_be32(val, msg + 2);
-
-	mutex_lock(&mhdp->mbox_mutex);
-
-	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
-				     DPTX_WRITE_REGISTER, sizeof(msg), msg);
-
-	mutex_unlock(&mhdp->mbox_mutex);
-
-	return ret;
-}
-
-static
-int cdns_mhdp_reg_write_bit(struct cdns_mhdp_device *mhdp, u16 addr,
-			    u8 start_bit, u8 bits_no, u32 val)
-{
-	u8 field[8];
-	int ret;
-
-	put_unaligned_be16(addr, field);
-	field[2] = start_bit;
-	field[3] = bits_no;
-	put_unaligned_be32(val, field + 4);
-
-	mutex_lock(&mhdp->mbox_mutex);
-
-	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
-				     DPTX_WRITE_FIELD, sizeof(field), field);
-
-	mutex_unlock(&mhdp->mbox_mutex);
-
-	return ret;
-}
-
 static
 int cdns_mhdp_dpcd_read(struct cdns_mhdp_device *mhdp,
 			u32 addr, u8 *data, u16 len)
@@ -2058,7 +1865,7 @@ static void cdns_mhdp_atomic_disable(struct drm_bridge *bridge,
 				     struct drm_bridge_state *bridge_state)
 {
 	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
-	u32 resp;
+	u32 resp = 0;
 
 	dev_dbg(mhdp->dev, "%s\n", __func__);
 
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
index bedddd510d17..10c878bf0e63 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
@@ -212,7 +212,6 @@ struct phy;
 #define MB_MODULE_ID_HDCP_TX			0x07
 #define MB_MODULE_ID_HDCP_RX			0x08
 #define MB_MODULE_ID_HDCP_GENERAL		0x09
-#define MB_MODULE_ID_GENERAL			0x0a
 
 /* firmware and opcodes */
 #define FW_NAME					"cadence/mhdp8546.bin"
diff --git a/include/drm/bridge/cdns-mhdp-mailbox.h b/include/drm/bridge/cdns-mhdp-mailbox.h
new file mode 100644
index 000000000000..0249322a74b0
--- /dev/null
+++ b/include/drm/bridge/cdns-mhdp-mailbox.h
@@ -0,0 +1,240 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Cadence MHDP Firmware Access API function by Malibox.
+ *
+ * Copyright (C) 2022 NXP Semiconductor, Inc.
+ *
+ */
+#ifndef CDNS_MHDP_MAILBOX_H
+#define CDNS_MHDP_MAILBOX_H
+
+#include <asm/unaligned.h>
+#include <linux/iopoll.h>
+
+/* mailbox regs offset */
+#define CDNS_MAILBOX_FULL			0x00008
+#define CDNS_MAILBOX_EMPTY			0x0000c
+#define CDNS_MAILBOX_TX_DATA		0x00010
+#define CDNS_MAILBOX_RX_DATA		0x00014
+
+#define MAILBOX_RETRY_US			1000
+#define MAILBOX_TIMEOUT_US			2000000
+
+/* Module ID Code */
+#define MB_MODULE_ID_GENERAL		0x0A
+#define MB_MODULE_ID_DP_TX			0x01
+
+/* General Commands */
+#define GENERAL_REGISTER_WRITE		0x05
+#define GENERAL_REGISTER_READ		0x07
+
+/* DP TX Command */
+#define DPTX_WRITE_FIELD			0x08
+
+/* MHDP Firmware access functions by Mailbox */
+#define cdns_mhdp_mailbox_read(__mhdp) \
+({ \
+	int ret, empty, val; \
+\
+	WARN_ON(!mutex_is_locked(&(__mhdp)->mbox_mutex)); \
+\
+	do {  \
+		ret = readx_poll_timeout(readl, (__mhdp)->regs + CDNS_MAILBOX_EMPTY,  \
+					 empty, !empty, MAILBOX_RETRY_US,  \
+					 MAILBOX_TIMEOUT_US);  \
+		if (ret < 0)  \
+			break;  \
+\
+		val = readl((__mhdp)->regs + CDNS_MAILBOX_RX_DATA) & 0xff; \
+	} while (0);  \
+\
+	(ret < 0) ? ret : val;  \
+})
+
+#define cdns_mhdp_mailbox_write(__mhdp, __val) \
+({ \
+	int ret, full;  \
+\
+	WARN_ON(!mutex_is_locked(&(__mhdp)->mbox_mutex)); \
+\
+	do {  \
+		ret = readx_poll_timeout(readl, (__mhdp)->regs + CDNS_MAILBOX_FULL,  \
+					 full, !full, MAILBOX_RETRY_US,  \
+					 MAILBOX_TIMEOUT_US);  \
+		if (ret < 0)  \
+			break;  \
+\
+		writel((__val), (__mhdp)->regs + CDNS_MAILBOX_TX_DATA); \
+	} while (0);  \
+\
+	ret; \
+})
+
+#define  cdns_mhdp_mailbox_recv_header(__mhdp, __module_id, __opcode, __req_size) \
+({  \
+	u32 mbox_size, i;  \
+	u8 header[4];  \
+	int ret;  \
+\
+	do {  \
+		/* read the header of the message */ \
+		for (i = 0; i < sizeof(header); i++) {  \
+			ret = cdns_mhdp_mailbox_read(__mhdp);  \
+			if (ret < 0)  \
+				break;  \
+\
+			header[i] = ret;  \
+		}  \
+\
+		mbox_size = get_unaligned_be16(header + 2);  \
+\
+		if ((__opcode) != header[0] || (__module_id) != header[1] ||  \
+		    (__req_size) != mbox_size) {  \
+			/* If the message in mailbox is not what we want, we need to
+			 * clear the mailbox by reading its contents. */  \
+			for (i = 0; i < mbox_size; i++)   \
+				if (cdns_mhdp_mailbox_read(__mhdp) < 0)  \
+					break;  \
+\
+			ret = -EINVAL;  \
+		}  \
+\
+		ret = 0; \
+\
+	} while (0);  \
+\
+	ret;  \
+})
+
+#define cdns_mhdp_mailbox_recv_data(mhdp, buff, buff_size)  \
+({  \
+	u32 i;  \
+	int ret;  \
+\
+	do {  \
+		for (i = 0; i < buff_size; i++) {  \
+			ret = cdns_mhdp_mailbox_read(mhdp);  \
+			if (ret < 0)  \
+				break;  \
+\
+			((u8 *)buff)[i] = ret;  \
+		}  \
+\
+		ret = 0;  \
+\
+	} while (0);  \
+\
+	ret; \
+})
+
+#define cdns_mhdp_mailbox_send(mhdp, module_id, opcode, size, message)  \
+({  \
+	u8 header[4];  \
+	int ret, i;  \
+\
+	header[0] = opcode;  \
+	header[1] = module_id;  \
+	put_unaligned_be16(size, header + 2);  \
+\
+	do {  \
+		for (i = 0; i < sizeof(header); i++) {  \
+			ret = cdns_mhdp_mailbox_write(mhdp, header[i]);  \
+			if (ret < 0)  \
+				break;  \
+		}  \
+\
+		for (i = 0; i < size; i++) {  \
+			ret = cdns_mhdp_mailbox_write(mhdp, ((u8 *)message)[i]);  \
+			if (ret < 0)  \
+				break;;  \
+		}  \
+		ret = 0;  \
+	} while (0);  \
+\
+	ret;  \
+})
+
+#define cdns_mhdp_reg_read(mhdp, addr, value)  \
+({  \
+	u8 msg[4], resp[8];  \
+	int ret;  \
+\
+	put_unaligned_be32(addr, msg);  \
+\
+	mutex_lock(&mhdp->mbox_mutex);  \
+\
+	do {  \
+		ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_GENERAL,  \
+					     GENERAL_REGISTER_READ,  \
+					     sizeof(msg), msg);  \
+		if (ret < 0)  \
+			break;  \
+\
+		ret = cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_GENERAL,  \
+						    GENERAL_REGISTER_READ,  \
+						    sizeof(resp));  \
+		if (ret < 0)  \
+			break;  \
+\
+		ret = cdns_mhdp_mailbox_recv_data(mhdp, resp, sizeof(resp));  \
+		if (ret < 0)  \
+			break;  \
+\
+		/* Returned address value should be the same as requested */  \
+		if (memcmp(msg, resp, sizeof(msg))) {  \
+			ret = -EINVAL;  \
+			break;  \
+		}  \
+\
+		*((u32 *)value) = get_unaligned_be32(resp + 4);  \
+			ret = 0;  \
+	} while (0);  \
+\
+	mutex_unlock(&mhdp->mbox_mutex);  \
+	if (ret < 0) {  \
+		dev_err(mhdp->dev, "Failed to read register\n");  \
+		*((u32 *)value) = 0;  \
+	}  \
+\
+	ret;  \
+})
+
+#define cdns_mhdp_reg_write(mhdp, addr, val)  \
+({  \
+	u8 msg[8];  \
+	int ret;  \
+\
+	put_unaligned_be32(addr, msg);  \
+	put_unaligned_be32(val, msg + 4);  \
+\
+	mutex_lock(&mhdp->mbox_mutex);  \
+\
+	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_GENERAL,  \
+				      GENERAL_REGISTER_WRITE, sizeof(msg), msg);  \
+\
+	mutex_unlock(&mhdp->mbox_mutex);  \
+\
+	ret;  \
+})
+
+#define cdns_mhdp_reg_write_bit(mhdp, addr, start_bit, bits_no, val) \
+({  \
+	u8 field[8];  \
+	int ret;  \
+\
+	put_unaligned_be16(addr, field);  \
+	field[2] = start_bit;  \
+	field[3] = bits_no;  \
+	put_unaligned_be32(val, field + 4);  \
+\
+	mutex_lock(&mhdp->mbox_mutex);  \
+\
+	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX, \
+				     DPTX_WRITE_FIELD, sizeof(field), field);  \
+\
+	mutex_unlock(&mhdp->mbox_mutex);  \
+\
+	ret; \
+})
+
+#endif
-- 
2.34.1


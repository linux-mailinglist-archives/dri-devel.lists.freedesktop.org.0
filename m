Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2498697083E
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 16:55:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D7B610E28B;
	Sun,  8 Sep 2024 14:55:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kwiboo.se header.i=@kwiboo.se header.b="cKDElm8h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F92210E28A
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 14:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1725807332; bh=ctgViwAoHsdszvG54A8azRGdEh0njwBKxxYrSAjOB98=;
 b=cKDElm8hkD5z4aDRmrjf1JCNcgRL4B5pCSs5R0UJigy1xpP45jYyDXBkE1nFaYhrYUs/2FKWA
 L+HlkMoh6YbZhuoHrmwJVurpAmo3teK3NvylohUiM6c8xYZ2kYc8xwOI19K/YOQUQ/QilKDn4b6
 BZtF+DqgGwoTkm/GFo0vPOJ0ZNMb7YHWjRUf36CBF9/FEywtBbvL/q/SGTw7PORtSjIU1axCQml
 GEWtk4VViZ/vrXBYPmeuP79/7Iecsv6LM3wEXjt6gn/qVHwTre7M3+6360b2rwa75eDyJRgA9pG
 GJxJdXUxKZtD+3en6+sVA/flh8HTI6qSPAqG9x3wsg7g==
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Diederik de Haas <didi.debian@cknow.org>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Nickey Yang <nickey.yang@rock-chips.com>
Subject: [PATCH v2 3/7] drm/rockchip: dw_hdmi: Add phy_config for 594Mhz pixel
 clock
Date: Sun,  8 Sep 2024 14:55:00 +0000
Message-ID: <20240908145511.3331451-4-jonas@kwiboo.se>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240908145511.3331451-1-jonas@kwiboo.se>
References: <20240908145511.3331451-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 66ddbae33c9877b459588eac
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

From: Nickey Yang <nickey.yang@rock-chips.com>

Add phy_config for 594Mhz pixel clock used for HDMI2.0 display modes.

Signed-off-by: Nickey Yang <nickey.yang@rock-chips.com>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v2: No change
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index fc5e87285a91..dffbae005a96 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -204,6 +204,7 @@ static const struct dw_hdmi_phy_config rockchip_phy_config[] = {
 	{ 74250000,  0x8009, 0x0004, 0x0272},
 	{ 165000000, 0x802b, 0x0004, 0x0209},
 	{ 297000000, 0x8039, 0x0005, 0x028d},
+	{ 594000000, 0x8039, 0x0000, 0x019d},
 	{ ~0UL,	     0x0000, 0x0000, 0x0000}
 };
 
-- 
2.46.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68525134E99
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 22:13:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F506E8D0;
	Wed,  8 Jan 2020 21:12:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from o1.b.az.sendgrid.net (o1.b.az.sendgrid.net [208.117.55.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DFBC6E8C7
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 21:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=from:subject:in-reply-to:references:to:cc:content-type:
 content-transfer-encoding;
 s=001; bh=l+ozEXcAcbxudZpKacgFo3ceEpSnl6xSv3pANc4ozyU=;
 b=VLIoJRoLLX6vp+0o/gTni8uvzBtky3Is0xxi4tlzNnK7kUf/Ae49zVMQ2jgR4BHUbHJS
 MZPiuf30fuSmtQqqvfKNHJ5bw2rzqTN/2gtlu/3eDMAX1xAwebb1sIqCRnr8daACy6/VZE
 euzThXCkZxiwuPgxZNITbJsQQDJwnw7G8=
Received: by filterdrecv-p3mdw1-56c97568b5-xjbx9 with SMTP id
 filterdrecv-p3mdw1-56c97568b5-xjbx9-19-5E1644A6-39
 2020-01-08 21:07:50.55100434 +0000 UTC m=+1974283.600906199
Received: from bionic.localdomain (unknown [98.128.173.80])
 by ismtpd0005p1lon1.sendgrid.net (SG) with ESMTP id 2iKuRjWuSoGvt9DqI_9m9w
 Wed, 08 Jan 2020 21:07:50.352 +0000 (UTC)
From: Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 08/14] clk: rockchip: set parent rate for DCLK_VOP clock on
 rk3228
Date: Wed, 08 Jan 2020 21:07:50 +0000 (UTC)
Message-Id: <20200108210740.28769-9-jonas@kwiboo.se>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200108210740.28769-1-jonas@kwiboo.se>
References: <20200108210740.28769-1-jonas@kwiboo.se>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0h338FT8hLbQuZn3EF?=
 =?us-ascii?Q?h3noMqyfEkSUfLuG04rziUH9YtKqSQPgd3OlYiQ?=
 =?us-ascii?Q?bBtqVjSu834dHYTOnUcRfTOS81p7D20pu6IVT9m?=
 =?us-ascii?Q?UjgsPdE7jjPeZHJWmVxHq56DF+yAktZSbLDQSgA?=
 =?us-ascii?Q?bbGeFNc2uBi0CfIQ3=2FFPYW=2FqvxH70dkTB9svJMH?=
 =?us-ascii?Q?nX743XyrkzTTOOYobJkKA=3D=3D?=
To: Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Zheng Yang <zhengyang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/clk/rockchip/clk-rk3228.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3228.c b/drivers/clk/rockchip/clk-rk3228.c
index d17cfb7a3ff4..25f79af22cb8 100644
--- a/drivers/clk/rockchip/clk-rk3228.c
+++ b/drivers/clk/rockchip/clk-rk3228.c
@@ -410,7 +410,7 @@ static struct rockchip_clk_branch rk3228_clk_branches[] __initdata = {
 			RK2928_CLKSEL_CON(29), 0, 3, DFLAGS),
 	DIV(0, "sclk_vop_pre", "sclk_vop_src", 0,
 			RK2928_CLKSEL_CON(27), 8, 8, DFLAGS),
-	MUX(DCLK_VOP, "dclk_vop", mux_dclk_vop_p, 0,
+	MUX(DCLK_VOP, "dclk_vop", mux_dclk_vop_p, CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
 			RK2928_CLKSEL_CON(27), 1, 1, MFLAGS),
 
 	FACTOR(0, "xin12m", "xin24m", 0, 1, 2),
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

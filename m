Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4572C1DAC4A
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 09:34:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D79A6E58A;
	Wed, 20 May 2020 07:34:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B8B6E2E2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 09:40:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id C65332A03BE
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/mediatek: mtk_mt8173_hdmi_phy: Remove unnused const
 variables
Date: Tue, 19 May 2020 11:40:45 +0200
Message-Id: <20200519094045.2447940-1-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 20 May 2020 07:34:33 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, drinkcat@chromium.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 matthias.bgg@gmail.com, Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are some `static const u8` variables that are not used, this
triggers a warning building with `make W=1`, it is safe to remove them,
so do it and make the compiler more happy.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

 .../gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c    | 48 -------------------
 1 file changed, 48 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c b/drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c
index 1c3575372230..827b93786fac 100644
--- a/drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c
+++ b/drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c
@@ -107,54 +107,6 @@
 #define RGS_HDMITX_5T1_EDG		(0xf << 4)
 #define RGS_HDMITX_PLUG_TST		BIT(0)
 
-static const u8 PREDIV[3][4] = {
-	{0x0, 0x0, 0x0, 0x0},	/* 27Mhz */
-	{0x1, 0x1, 0x1, 0x1},	/* 74Mhz */
-	{0x1, 0x1, 0x1, 0x1}	/* 148Mhz */
-};
-
-static const u8 TXDIV[3][4] = {
-	{0x3, 0x3, 0x3, 0x2},	/* 27Mhz */
-	{0x2, 0x1, 0x1, 0x1},	/* 74Mhz */
-	{0x1, 0x0, 0x0, 0x0}	/* 148Mhz */
-};
-
-static const u8 FBKSEL[3][4] = {
-	{0x1, 0x1, 0x1, 0x1},	/* 27Mhz */
-	{0x1, 0x0, 0x1, 0x1},	/* 74Mhz */
-	{0x1, 0x0, 0x1, 0x1}	/* 148Mhz */
-};
-
-static const u8 FBKDIV[3][4] = {
-	{19, 24, 29, 19},	/* 27Mhz */
-	{19, 24, 14, 19},	/* 74Mhz */
-	{19, 24, 14, 19}	/* 148Mhz */
-};
-
-static const u8 DIVEN[3][4] = {
-	{0x2, 0x1, 0x1, 0x2},	/* 27Mhz */
-	{0x2, 0x2, 0x2, 0x2},	/* 74Mhz */
-	{0x2, 0x2, 0x2, 0x2}	/* 148Mhz */
-};
-
-static const u8 HTPLLBP[3][4] = {
-	{0xc, 0xc, 0x8, 0xc},	/* 27Mhz */
-	{0xc, 0xf, 0xf, 0xc},	/* 74Mhz */
-	{0xc, 0xf, 0xf, 0xc}	/* 148Mhz */
-};
-
-static const u8 HTPLLBC[3][4] = {
-	{0x2, 0x3, 0x3, 0x2},	/* 27Mhz */
-	{0x2, 0x3, 0x3, 0x2},	/* 74Mhz */
-	{0x2, 0x3, 0x3, 0x2}	/* 148Mhz */
-};
-
-static const u8 HTPLLBR[3][4] = {
-	{0x1, 0x1, 0x0, 0x1},	/* 27Mhz */
-	{0x1, 0x2, 0x2, 0x1},	/* 74Mhz */
-	{0x1, 0x2, 0x2, 0x1}	/* 148Mhz */
-};
-
 static int mtk_hdmi_pll_prepare(struct clk_hw *hw)
 {
 	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

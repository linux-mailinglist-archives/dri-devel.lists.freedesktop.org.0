Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D087E2510F8
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 06:57:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE156E850;
	Tue, 25 Aug 2020 04:56:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0184.hostedemail.com
 [216.40.44.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0358C6E84E
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 04:56:58 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id F1CBB18224D86;
 Tue, 25 Aug 2020 04:56:57 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:541:800:960:973:988:989:1260:1311:1314:1345:1359:1515:1534:1541:1711:1730:1747:1777:1792:2393:2559:2562:3138:3139:3140:3141:3142:3354:3868:4321:5007:6261:10004:10848:11026:11473:11657:11658:11914:12043:12296:12297:12555:12895:12986:13069:13311:13357:13894:14096:14181:14384:14394:14721:21080:21627:30054,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: plate89_1a11d3a27059
X-Filterd-Recvd-Size: 2830
Received: from joe-laptop.perches.com (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf08.hostedemail.com (Postfix) with ESMTPA;
 Tue, 25 Aug 2020 04:56:56 +0000 (UTC)
From: Joe Perches <joe@perches.com>
To: Jiri Kosina <trivial@kernel.org>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: [PATCH 09/29] drm/gma500: Avoid comma separated statements
Date: Mon, 24 Aug 2020 21:56:06 -0700
Message-Id: <e96626cd1301ff44e5101e0e5913d8439b425c9f.1598331148.git.joe@perches.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <cover.1598331148.git.joe@perches.com>
References: <cover.1598331148.git.joe@perches.com>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use semicolons and braces.

Signed-off-by: Joe Perches <joe@perches.com>
---
 drivers/gpu/drm/gma500/mdfld_intel_display.c | 44 +++++++++++++-------
 1 file changed, 28 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/gma500/mdfld_intel_display.c b/drivers/gpu/drm/gma500/mdfld_intel_display.c
index aae2d358364c..bfa330df9443 100644
--- a/drivers/gpu/drm/gma500/mdfld_intel_display.c
+++ b/drivers/gpu/drm/gma500/mdfld_intel_display.c
@@ -824,33 +824,45 @@ static int mdfld_crtc_mode_set(struct drm_crtc *crtc,
 		if ((ksel == KSEL_CRYSTAL_19) || (ksel == KSEL_BYPASS_19)) {
 			refclk = 19200;
 
-			if (is_mipi || is_mipi2)
-				clk_n = 1, clk_p2 = 8;
-			else if (is_hdmi)
-				clk_n = 1, clk_p2 = 10;
+			if (is_mipi || is_mipi2) {
+				clk_n = 1;
+				clk_p2 = 8;
+			} else if (is_hdmi) {
+				clk_n = 1;
+				clk_p2 = 10;
+			}
 		} else if (ksel == KSEL_BYPASS_25) {
 			refclk = 25000;
 
-			if (is_mipi || is_mipi2)
-				clk_n = 1, clk_p2 = 8;
-			else if (is_hdmi)
-				clk_n = 1, clk_p2 = 10;
+			if (is_mipi || is_mipi2) {
+				clk_n = 1;
+				clk_p2 = 8;
+			} else if (is_hdmi) {
+				clk_n = 1;
+				clk_p2 = 10;
+			}
 		} else if ((ksel == KSEL_BYPASS_83_100) &&
 					dev_priv->core_freq == 166) {
 			refclk = 83000;
 
-			if (is_mipi || is_mipi2)
-				clk_n = 4, clk_p2 = 8;
-			else if (is_hdmi)
-				clk_n = 4, clk_p2 = 10;
+			if (is_mipi || is_mipi2) {
+				clk_n = 4;
+				clk_p2 = 8;
+			} else if (is_hdmi) {
+				clk_n = 4;
+				clk_p2 = 10;
+			}
 		} else if ((ksel == KSEL_BYPASS_83_100) &&
 					(dev_priv->core_freq == 100 ||
 					dev_priv->core_freq == 200)) {
 			refclk = 100000;
-			if (is_mipi || is_mipi2)
-				clk_n = 4, clk_p2 = 8;
-			else if (is_hdmi)
-				clk_n = 4, clk_p2 = 10;
+			if (is_mipi || is_mipi2) {
+				clk_n = 4;
+				clk_p2 = 8;
+			} else if (is_hdmi) {
+				clk_n = 4;
+				clk_p2 = 10;
+			}
 		}
 
 		if (is_mipi)
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

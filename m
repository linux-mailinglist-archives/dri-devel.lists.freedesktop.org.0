Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F358B3451D2
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 22:34:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA4E6E5BB;
	Mon, 22 Mar 2021 21:33:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from libero.it (smtp-17.italiaonline.it [213.209.10.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3BA16E5B9
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 21:33:50 +0000 (UTC)
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([87.20.116.197]) by smtp-17.iol.local with ESMTPA
 id OSB9lKwj3tpGHOSBHlyOiZ; Mon, 22 Mar 2021 22:33:48 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
 t=1616448828; bh=HwDL3lPXwnszf1LwCTHjd7ninm7N98ENSeeKeFboGic=;
 h=From;
 b=XIzPtv4SxZiEDfOsCc7DX90YrGlYtwCZ2rBoj/cEKyUiUSQN77ZUMn2ltwPszBaWw
 SvhKBR6G325ZXpuFVNYr8KwcHWJM6d7SJrguTGn7MzFcUQfc6AfLbcLkeE0X+39S7N
 zxrJTbwTtwtGCGqLKjt0Gf1c6MvZSGCcEIl9z5jXTTUO1vOoCNNiCpFww0Iecs2zYu
 cOt62uEF/yNokkzMudQu1pZpx9SL5X9hYkM8pfac24JyQj+eFQZqNB4jsiqHG9SUT3
 HZxWG6hFyoft+hYPfLiBR7dg498KgMdvPv9SU/LvnEppdM9KgtCh/LzgMglpNgeYr7
 am4uHFa3dElMQ==
X-CNFS-Analysis: v=2.4 cv=Q7IXX66a c=1 sm=1 tr=0 ts=60590d3c cx=a_exe
 a=AVqmXbCQpuNSdJmApS5GbQ==:117 a=AVqmXbCQpuNSdJmApS5GbQ==:17
 a=-grNfQwawjkoE-hAE8wA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
From: Dario Binacchi <dariobin@libero.it>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] drm/tilcdc: rename req_rate to pclk_rate
Date: Mon, 22 Mar 2021 22:33:35 +0100
Message-Id: <20210322213337.26667-2-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210322213337.26667-1-dariobin@libero.it>
References: <20210322213337.26667-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfAC5Flr2DXI/3y8tjQP1ykuGXiiK8y/WSYfF+QIHBOHrIa43VFbF5O6hDlBQyvABFoD7VhsSNvbvNGr/O5X3Qb3axwzL/ACPN/uzXJ+Q1mLUjXDYxvwB
 l3pcRdEgaEhtLL9usYBgZq1mY0p3SqfCrR2uXZHtOwfff6y/ZMgyixqI3rrHwp6aL6//csBTLrqzkRX8klLcjyNgs+FHexwfWzkKLBroY4yo3hMbFtToOUUr
 16TzWcpACvsG+IYd8VCNOU6oCvgN9ALx3QWdYzFyYJSNQuWYU4G7RKjVgwHsa7Lki7JiBGBheqbwNfN0IcGArO0ZMwK+xRfEk671GHNvTU7KDVKVLELixdiN
 0oRBd8BY5UdzAp8gKQtRhpW9ZJA0Aek3oklwNp7KeTclmX2o2AiARcDZ8H1YS8i3VDcyfJs+
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
Cc: Tomi Valkeinen <tomba@kernel.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Jyri Sarha <jyri.sarha@iki.fi>,
 Dario Binacchi <dariobin@libero.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The req_rate name is a little misleading, so let's rename to pclk_rate
(pixel clock rate).

Signed-off-by: Dario Binacchi <dariobin@libero.it>

---

(no changes since v2)

Changes in v2:
- The patch has been added in version 2.

 drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index 30213708fc99..aeec5786617d 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
@@ -203,18 +203,18 @@ static void tilcdc_crtc_set_clk(struct drm_crtc *crtc)
 	struct drm_device *dev = crtc->dev;
 	struct tilcdc_drm_private *priv = dev->dev_private;
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
-	unsigned long clk_rate, real_rate, req_rate;
+	unsigned long clk_rate, real_rate, pclk_rate;
 	unsigned int clkdiv;
 	int ret;
 
 	clkdiv = 2; /* first try using a standard divider of 2 */
 
 	/* mode.clock is in KHz, set_rate wants parameter in Hz */
-	req_rate = crtc->mode.clock * 1000;
+	pclk_rate = crtc->mode.clock * 1000;
 
-	ret = clk_set_rate(priv->clk, req_rate * clkdiv);
+	ret = clk_set_rate(priv->clk, pclk_rate * clkdiv);
 	clk_rate = clk_get_rate(priv->clk);
-	if (ret < 0 || tilcdc_pclk_diff(req_rate, clk_rate) > 5) {
+	if (ret < 0 || tilcdc_pclk_diff(pclk_rate, clk_rate) > 5) {
 		/*
 		 * If we fail to set the clock rate (some architectures don't
 		 * use the common clock framework yet and may not implement
@@ -229,7 +229,7 @@ static void tilcdc_crtc_set_clk(struct drm_crtc *crtc)
 			return;
 		}
 
-		clkdiv = DIV_ROUND_CLOSEST(clk_rate, req_rate);
+		clkdiv = DIV_ROUND_CLOSEST(clk_rate, pclk_rate);
 
 		/*
 		 * Emit a warning if the real clock rate resulting from the
@@ -238,7 +238,7 @@ static void tilcdc_crtc_set_clk(struct drm_crtc *crtc)
 		 * 5% is an arbitrary value - LCDs are usually quite tolerant
 		 * about pixel clock rates.
 		 */
-		real_rate = clkdiv * req_rate;
+		real_rate = clkdiv * pclk_rate;
 
 		if (tilcdc_pclk_diff(clk_rate, real_rate) > 5) {
 			dev_warn(dev->dev,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

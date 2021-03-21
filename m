Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3DC3431AB
	for <lists+dri-devel@lfdr.de>; Sun, 21 Mar 2021 09:32:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B30E89FD4;
	Sun, 21 Mar 2021 08:32:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from libero.it (smtp-17.italiaonline.it [213.209.10.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 272DD89F41
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Mar 2021 08:32:22 +0000 (UTC)
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([87.20.116.197]) by smtp-17.iol.local with ESMTPA
 id NtVMlAZljtpGHNtVTlqmNc; Sun, 21 Mar 2021 09:32:20 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
 t=1616315540; bh=4iHbx0OA+Ob50g3/bpCToNOi+mNatCRmmXL44JodfHw=;
 h=From;
 b=JQ1/P5JyB/0wSrJH1pjLOHp0TkfvPK16xXkUnYwrDyx0+c+2OlilGjMfCM9ydgjbB
 4iRIPnG1+3eTp3Tg3YpioRnbiyYNh4vlFdRFFta/os89Izlwx9qmj3dNlW25Axh5ys
 C2Hz7XiWx1HNfP+BX/TqKlHwNFEQwyqQ2DLVS4m4Sir8oRsupiibhitZ6qYmgc+MSp
 ta3NzM5wQ0QNy00yGpZDNzuy0OfK+x6MQGG199KnWeQCR0CNAAjBnf8nfpby8mqSkC
 aGwluPZGXXRkudZUsKsfnGJchRJ4Lj82D9yn5DJYZL5ZPO9BxDTnbbp8IYRrcaxaoA
 gZ/tlqeEydVgQ==
X-CNFS-Analysis: v=2.4 cv=Q7IXX66a c=1 sm=1 tr=0 ts=60570494 cx=a_exe
 a=AVqmXbCQpuNSdJmApS5GbQ==:117 a=AVqmXbCQpuNSdJmApS5GbQ==:17
 a=-grNfQwawjkoE-hAE8wA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
From: Dario Binacchi <dariobin@libero.it>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] drm/tilcdc: rename req_rate to pclk_rate
Date: Sun, 21 Mar 2021 09:31:51 +0100
Message-Id: <20210321083153.2810-2-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210321083153.2810-1-dariobin@libero.it>
References: <20210321083153.2810-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfGYuO55UauguG8LZNRcmyHroAcDp+2JpRvAFwgtJL1cKoBrLU9V2fNiObqSUPbu4ZYo8PS28SddIoww3mb/t2bWNQMSdoY1uMv+6l99790V1o0u5/Z+c
 Eacui1h0yJDRDk9cfJ4aOSUaeTMeb6tFKScfpOY7cJgTuy7f2DbDyECbWrcDffVfRmCOgDcpl/uPnajgsnTofFIkrTZCVL0iauZeCaCa7SV3q2G8OtojHLo/
 1A/WPIQ6bKBX5byBSwJsJJBX4wj6OuwNXc++i4weGDAjlEszd2LndS2hdHwRreuuM5dC/ewFysrCYFnMv7u68YfGZ3pVvGVh6jd8TeA/cD9mafh9irH4feCg
 QhU5NS5uxCBlLXs/PXxDR93C66VDv2p7gX+G5TD0h+ZcVpbogpzXhKbY0l/LXmoF/KFLS1wc
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

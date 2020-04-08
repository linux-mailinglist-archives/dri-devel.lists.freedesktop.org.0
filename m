Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 632061A2736
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 18:31:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1EE26EA97;
	Wed,  8 Apr 2020 16:31:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50E826EA97
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 16:31:14 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
 1N8XHb-1jHHhA1YYr-014Tax; Wed, 08 Apr 2020 18:25:53 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] fbdev: mx3fb: avoid warning about psABI change
Date: Wed,  8 Apr 2020 18:25:38 +0200
Message-Id: <20200408162551.3928330-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:a1SttS1sh0V8p8yNp3DZOBnM7t3XNhEBzBMwVVmOUCS7K8nEh0c
 8njey4uOCRCAK8sgTmZLVKJHFuADY6t12iLayYT208LdNpRm9Nk2tYvZpNj7E+Yc/U2qtcA
 ulytP8YPz81OEx7SWoYabgaStCwARP5d5nQqJ862NIg3i/L0a0t/j4a9gOK5SZYohRsPksi
 bNGUs6HQEWyFiT+EgxmAg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vPHKk0PwzhY=:d3y0ZG8zO1rs58mykCJZCF
 TPCj6A6KswBFUGQ4xtqjE2JJ2gIbMjkNNdbUX9XRJMf+vHvuM+4KwK182LYFBS1b25I3Cg1mQ
 ikF7eQ5vYhLlCKGot0SmKmGgc4iqzizbI48XyV5hCD0HdYIZuN7z8TvqmoGs8QRYtTCOzV5oT
 8D7t2Y37L//oGxSHBXcjB8Kf8dkUrNt3is7vX7feGyWRhXwdIqNwCeBJTUq5fHN1+bW0uEnl7
 gM+D9hI2sLYjEFLa4mnRKvwMCF4Zq+m3SSuCYhAtqe8ZZsiOdomuU02Vn/nNHarrbJmekACkM
 VA/uDyQGVDC0mVnJX01xg+GzzCWub2ZBoCCxVlLo0YrYA6ane6sD1Si307Xf9/ipnb7voA/Xc
 gloBw27FgqyTvmHWlrn9mbacx1NN6qB3vvpc0MHu+FRlLXxlXmcn4sC127M4jKvwob/xDZ7XC
 r+wfcxHX0R2+3sZnX7ekCc270yQHiZPANhcIQYOxD8ACWpk05cs1V/+gMpTrKRSIV2FmYcRRq
 Idu9A2sGK/bUZwkGZV28+g7qZ5P8X4j9hh5wzsG+vO+hUjMV1m6sJyMS9IxeLClZhWK8c4iFC
 DIae33+m9roAFfZnuZk9Oq9IDzXQpjg6dp2UsAsTqCeI+OsCkQNn0O/BQupZPqVX3zQTbvUqs
 c0GHdWF2ARvRJLk92OlzxnPGndO4JLWAYpPY78V8pvq8VF4gzWFTEQKAOgDdqGJnnaBOK3wtg
 f37PWlvimRL2XMMqO0liD5AlGura+nhxKyeVi39dVOHo//aiWN72JVY4AV19gHllRbtgvnwrI
 ns/pIqwpW6+svuVWUTb3AKQf4xq40TwuvuGmEZHavXolt5DgK4=
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Enrico Weigelt <info@metux.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The arm64 gcc-9 release warns about a change in the calling
conventions:

drivers/video/fbdev/mx3fb.c: In function 'sdc_init_panel':
drivers/video/fbdev/mx3fb.c:506:12: note: parameter passing for argument of type 'struct ipu_di_signal_cfg' changed in GCC 9.1
  506 | static int sdc_init_panel(struct mx3fb_data *mx3fb, enum ipu_panel panel,
      |            ^~~~~~~~~~~~~~
drivers/video/fbdev/mx3fb.c: In function '__set_par':
drivers/video/fbdev/mx3fb.c:848:7: note: parameter passing for argument of type 'struct ipu_di_signal_cfg' changed in GCC 9.1

Change the file to just pass the struct by reference, which is
unambiguous and avoids the warning.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/video/fbdev/mx3fb.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/video/fbdev/mx3fb.c b/drivers/video/fbdev/mx3fb.c
index 4af28e4421e5..e13fea3a292f 100644
--- a/drivers/video/fbdev/mx3fb.c
+++ b/drivers/video/fbdev/mx3fb.c
@@ -509,7 +509,7 @@ static int sdc_init_panel(struct mx3fb_data *mx3fb, enum ipu_panel panel,
 			  uint16_t h_start_width, uint16_t h_sync_width,
 			  uint16_t h_end_width, uint16_t v_start_width,
 			  uint16_t v_sync_width, uint16_t v_end_width,
-			  struct ipu_di_signal_cfg sig)
+			  struct ipu_di_signal_cfg *sig)
 {
 	unsigned long lock_flags;
 	uint32_t reg;
@@ -591,17 +591,17 @@ static int sdc_init_panel(struct mx3fb_data *mx3fb, enum ipu_panel panel,
 
 	/* DI settings */
 	old_conf = mx3fb_read_reg(mx3fb, DI_DISP_IF_CONF) & 0x78FFFFFF;
-	old_conf |= sig.datamask_en << DI_D3_DATAMSK_SHIFT |
-		sig.clksel_en << DI_D3_CLK_SEL_SHIFT |
-		sig.clkidle_en << DI_D3_CLK_IDLE_SHIFT;
+	old_conf |= sig->datamask_en << DI_D3_DATAMSK_SHIFT |
+		sig->clksel_en << DI_D3_CLK_SEL_SHIFT |
+		sig->clkidle_en << DI_D3_CLK_IDLE_SHIFT;
 	mx3fb_write_reg(mx3fb, old_conf, DI_DISP_IF_CONF);
 
 	old_conf = mx3fb_read_reg(mx3fb, DI_DISP_SIG_POL) & 0xE0FFFFFF;
-	old_conf |= sig.data_pol << DI_D3_DATA_POL_SHIFT |
-		sig.clk_pol << DI_D3_CLK_POL_SHIFT |
-		sig.enable_pol << DI_D3_DRDY_SHARP_POL_SHIFT |
-		sig.Hsync_pol << DI_D3_HSYNC_POL_SHIFT |
-		sig.Vsync_pol << DI_D3_VSYNC_POL_SHIFT;
+	old_conf |= sig->data_pol << DI_D3_DATA_POL_SHIFT |
+		sig->clk_pol << DI_D3_CLK_POL_SHIFT |
+		sig->enable_pol << DI_D3_DRDY_SHARP_POL_SHIFT |
+		sig->Hsync_pol << DI_D3_HSYNC_POL_SHIFT |
+		sig->Vsync_pol << DI_D3_VSYNC_POL_SHIFT;
 	mx3fb_write_reg(mx3fb, old_conf, DI_DISP_SIG_POL);
 
 	map = &di_mappings[mx3fb->disp_data_fmt];
@@ -855,7 +855,7 @@ static int __set_par(struct fb_info *fbi, bool lock)
 				   fbi->var.upper_margin,
 				   fbi->var.vsync_len,
 				   fbi->var.lower_margin +
-				   fbi->var.vsync_len, sig_cfg) != 0) {
+				   fbi->var.vsync_len, &sig_cfg) != 0) {
 			dev_err(fbi->device,
 				"mx3fb: Error initializing panel.\n");
 			return -EINVAL;
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

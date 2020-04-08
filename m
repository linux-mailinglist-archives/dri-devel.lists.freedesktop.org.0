Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF9C1A28B3
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 20:29:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97D4E6EAB2;
	Wed,  8 Apr 2020 18:29:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F61B6EAB2
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 18:29:35 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 1FA44804D5;
 Wed,  8 Apr 2020 20:29:32 +0200 (CEST)
Date: Wed, 8 Apr 2020 20:29:26 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH] fbdev: mx3fb: const pointer to ipu_di_signal_cfg
Message-ID: <20200408182926.GA21997@ravnborg.org>
References: <20200408162551.3928330-1-arnd@arndb.de> <87pnchhp2s.fsf@intel.com>
 <20200408180216.GC24828@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408180216.GC24828@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8
 a=QyXUC8HyAAAA:8 a=7gkXJVJtAAAA:8 a=ZTmiYS-oAAAA:8 a=hD80L64hAAAA:8
 a=VwQbUJbxAAAA:8 a=6NHAqQbvyHSTyVc_V14A:9 a=CjuIK1q_8ugA:10
 a=D0XLA9XvdZm18NrgonBM:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Bgfdu2smNuKfk3vLOmSO:22 a=AjGcO6oz07-iQ99wixmX:22
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
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Enrico Weigelt <info@metux.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Laurent Pinchart <laurent.pinchart@ideasonboard.com> and
Jani Nikula <jani.nikula@intel.com> both
suggested to make the pointer to struct ipu_di_signal_cfg const.

Fix this.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Fixes: 3f6c93ec9254 ("fbdev: mx3fb: avoid warning about psABI change")
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Enrico Weigelt <info@metux.net>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: linux-fbdev@vger.kernel.org
---

Again, sorry. I should have waited a day before applying.

	Sam

 drivers/video/fbdev/mx3fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/mx3fb.c b/drivers/video/fbdev/mx3fb.c
index e13fea3a292f..603731a5a72e 100644
--- a/drivers/video/fbdev/mx3fb.c
+++ b/drivers/video/fbdev/mx3fb.c
@@ -509,7 +509,7 @@ static int sdc_init_panel(struct mx3fb_data *mx3fb, enum ipu_panel panel,
 			  uint16_t h_start_width, uint16_t h_sync_width,
 			  uint16_t h_end_width, uint16_t v_start_width,
 			  uint16_t v_sync_width, uint16_t v_end_width,
-			  struct ipu_di_signal_cfg *sig)
+			  const struct ipu_di_signal_cfg *sig)
 {
 	unsigned long lock_flags;
 	uint32_t reg;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

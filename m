Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1197617B7F4
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 09:04:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F6B96EC87;
	Fri,  6 Mar 2020 08:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B3926EC54
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 03:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Date:Message-ID:Subject:Cc:From:To:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=o08bZPm/RS6A9C1jh4GWQzSm+/n79bG6xV2CG+lU8+w=; b=I0bxC8pLrA+EH6gd/iaXIZyDdE
 VbHS7Ag0gperjDyalKKLEcJ/Pup74p9O36tpqgFzJXHl89k8pDwdxCyOSdsCs88TbDgbeSN917Izv
 F93CsnajQFN7nQSgjmYitC3B4UloMvN2uzMxiFBjLi01V55cEZoqL0iveUJc4OWz720TINdo3V55P
 Xj4Bsz8Euok8q49KS5QCJNjouANuuh3nbi2hy+eGoDFJGnPzY3gjzckADF3BA/A2tUddsekEXe1Ar
 fwt4vV72TEdInyU1CC0TeT790zvZnhhndudq6Nd+nWTPBfip0RschhVSgRdeZIjux01++ZxUiGyj6
 vRnTnAJQ==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jA3Uk-0003vv-65; Fri, 06 Mar 2020 03:17:50 +0000
To: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [RFC PATCH] drm: rcar-du: make all sub-symbols depend on DRM_RCAR_DU
Message-ID: <4b50cc9f-1434-b78a-d56a-fadfd030f002@infradead.org>
Date: Thu, 5 Mar 2020 19:17:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Fri, 06 Mar 2020 08:03:01 +0000
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
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Randy Dunlap <rdunlap@infradead.org>

DRM_RCAR_CMM depends on DRM_RCAR_DU. Since the following Kconfig
symbols do not depend on DRM_RCAR_DU, the menu presentation is
broken for these and following non-R-Car Kconfig symbols.

Is it safe/appropriate to make all of these symbols depend on
DRM_RCAR_DU?  It make the kconfig menu presentation much cleaner.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Cc: Dave Airlie <airlied@linux.ie>
---
 drivers/gpu/drm/rcar-du/Kconfig |    3 +++
 1 file changed, 3 insertions(+)

--- linux-next-20200305.orig/drivers/gpu/drm/rcar-du/Kconfig
+++ linux-next-20200305/drivers/gpu/drm/rcar-du/Kconfig
@@ -24,6 +24,7 @@ config DRM_RCAR_CMM
 config DRM_RCAR_DW_HDMI
 	tristate "R-Car DU Gen3 HDMI Encoder Support"
 	depends on DRM && OF
+	depends on DRM_RCAR_DU
 	select DRM_DW_HDMI
 	help
 	  Enable support for R-Car Gen3 internal HDMI encoder.
@@ -31,6 +32,7 @@ config DRM_RCAR_DW_HDMI
 config DRM_RCAR_LVDS
 	tristate "R-Car DU LVDS Encoder Support"
 	depends on DRM && DRM_BRIDGE && OF
+	depends on DRM_RCAR_DU
 	select DRM_PANEL
 	select OF_FLATTREE
 	select OF_OVERLAY
@@ -47,4 +49,5 @@ config DRM_RCAR_VSP
 
 config DRM_RCAR_WRITEBACK
 	bool
+	depends on DRM_RCAR_DU
 	default y if ARM64

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

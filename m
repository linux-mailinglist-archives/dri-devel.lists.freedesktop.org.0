Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D878229FFB0
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:24:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD1DF6E98B;
	Fri, 30 Oct 2020 08:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C7066E8E5
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 19:01:12 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4CAE75807F6;
 Thu, 29 Oct 2020 15:01:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 29 Oct 2020 15:01:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=JzhV3jRhjKlTX
 DGRyjQ2prXEQjuxY/0Q7cDwYyAFExU=; b=UzG5aB846MQ+usSbmofBEVZGKgYAp
 +5paGAfcETsE+M6TlYjSV+MJYHJU2kPgKvomOoJmIgYAFgDFiU7aaMBfyaL/ldjk
 E+Uttl2mDaSNsw3GPIWlL6gjQ4oPdVADcpVT+sgjJtR3tuODpbY5hxWrTnOy7PDC
 uRMaCVFYyETkGJQX/RdYVwiK0ijGlfmx06nK7OaoasY3Ye5CdiTG+CEQRbrun28/
 NlYmQhyUWloRAzzOSMQ1F0TJ2ezuglGWv2h7mU0jbASBmY1jCkRW9XADUo+922SR
 fKGK0YQL2zagA4SGeAL1y4ESinNLAO4/nNA3IAU/bW3hJ8kXCB2zSyUnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=JzhV3jRhjKlTXDGRyjQ2prXEQjuxY/0Q7cDwYyAFExU=; b=nBAgJL8Q
 hbqnjtIu5brdJQqHX2eDBzhRIP9RDYbT/vTge9F3Ej7KQRuPYMp9BqSCBT9373me
 ti3ncJwkUdpErUIJLyVFlaWxmNcYX/Q+9sz3e6uCNE+xbPY6kCpBFi8KAM2wrVBb
 qwC02ZLlvKekoFYHKCeM3bS5+Nt5vzhQQuQrA+t3JtKZCYV2hZtvCrvvxU79B0+j
 wZD40oJH684/cKUbKWskL+Am7pVCfS88IsUEmqqP79aVF/SPK+M1BhUcWJJJ89ia
 vzHNxk5kaD6qOv4YfMeyk8FsZf6j2u7DQibHOWicJLv9VDMkVkl/Q7uVKqnJGAUQ
 vlugcGIbdaw00g==
X-ME-Sender: <xms:dBGbXxR8gDjOWXclHbHe42qp4TEpV7uiye_OG_qDWxaUgYBMHiHMfg>
 <xme:dBGbX6zolID5b1cxbJpX8NRYgi9xTkupIFZS9ePkiPYB1iFtEOXX2oBbtvY1NC4L5
 BXRHU3GlHmjq1Pfaqc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrleefgdduudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:dRGbX23xYSbxzHw0KtjygzkpVKAN1oCItNYR_t7kGs6H2pvxvtJKkw>
 <xmx:dRGbX5Al-7ElZobh1IpNKYJyioUVBdqTqSONNfmnwhCTMgvG8cnr8Q>
 <xmx:dRGbX6gisih6RfGyAf3CSF2T9y5sO2wN2Du8BJMwh-KlpUpz_cbb_Q>
 <xmx:dRGbXzUP1P-HRstbO0_1xsgBhXCoYoMxE9gMIrJW79AhWLQcumyb3g>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id AC90D3064610;
 Thu, 29 Oct 2020 15:01:08 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 2/6] drm/vc4: drv: Use managed drm_mode_config_init
Date: Thu, 29 Oct 2020 20:01:00 +0100
Message-Id: <20201029190104.2181730-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201029190104.2181730-1-maxime@cerno.tech>
References: <20201029190104.2181730-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 30 Oct 2020 08:23:17 +0000
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
Cc: linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using drmm_mode_config_init instead of drm_mode_config_init allows us to
cleanup a bit the error path.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index eb3fcd8232b5..0bcc541486a9 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -269,7 +269,9 @@ static int vc4_drm_bind(struct device *dev)
 	if (ret)
 		goto dev_put;
 
-	drm_mode_config_init(drm);
+	ret = drmm_mode_config_init(drm);
+	if (ret)
+		goto dev_put;
 
 	vc4_gem_init(drm);
 
@@ -302,7 +304,6 @@ static int vc4_drm_bind(struct device *dev)
 	component_unbind_all(dev, drm);
 gem_destroy:
 	vc4_gem_destroy(drm);
-	drm_mode_config_cleanup(drm);
 dev_put:
 	drm_dev_put(drm);
 	return ret;
@@ -317,8 +318,6 @@ static void vc4_drm_unbind(struct device *dev)
 
 	drm_atomic_helper_shutdown(drm);
 
-	drm_mode_config_cleanup(drm);
-
 	drm_atomic_private_obj_fini(&vc4->load_tracker);
 	drm_atomic_private_obj_fini(&vc4->ctm_manager);
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

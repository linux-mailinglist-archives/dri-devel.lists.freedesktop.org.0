Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AD836486C
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 18:41:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 179E06E40A;
	Mon, 19 Apr 2021 16:41:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 468 seconds by postgrey-1.36 at gabe;
 Mon, 19 Apr 2021 08:56:05 UTC
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 752C989E2A
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 08:56:05 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id C36EA58108F;
 Mon, 19 Apr 2021 04:48:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 19 Apr 2021 04:48:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=x1lvtnCvqnur4
 ESKPxZ8yfTy9HL79mbmCtNhz9bHNYA=; b=o3EJD316+0eqA2bfZkcWY0tV1TQoM
 BNPb6B17cvgaYMEksh3OKNLPwUuerF7ox/txIcZn+zfY0Gd8Z6sOZ0n9YQpeH649
 XsJWryZwAj6bK3apEbi9RZBQYYKYXEKKbSdbEDjPEd3PesH5OoN+eUDMozbKKoI+
 lg3sJideu6uwaA0HMNsDDJwsin1wnCvmx8LMKXmA1jLkuhjZf7EJN7LYNsA6588f
 aDBEqqaNnscKjlgvjhrLNHqy1frMGR8kLO573qPV1RKFtSIBffgvNbR1qWqcLUv2
 A2MMgW+j5a1pXCzkOteOQ9cw5VbGLKhZZGrV4yRcPqT5oYjfi4ZwQDDLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=x1lvtnCvqnur4ESKPxZ8yfTy9HL79mbmCtNhz9bHNYA=; b=KkZBDDnh
 j2qLa76zp6k+e7Ih/+DtOOCX24YsK0X3q9Fc5Pa91KTclfi+O32LxR0zXFilu3a2
 av+YFk6RJ3YxdaxsA7QCbYCxMgGmzrh/oCYejK5cIGaytp1z7oyMN5zjBXljMxF+
 tV1U0lw4xcBQXD5XatvV0lq8W6j/qaDF8fii81iyLSnnsLPlbWuhQDIUOcw6lFHj
 0Ok7Njp+WDXuX/I2rT/R72hG5ni6FbYX8Yx/qtG47G/6aYlddygmS29DYID35jGz
 7lw5ZopLfEuB3ZB9lhiWG0aN2zm601phupBTekYuyEAOPLNqWms7JUE9LpPllA9g
 DcmO2gPezrHsuQ==
X-ME-Sender: <xms:0UN9YAYnIdupBLHOK-7gBsq9nYG65KHguTktG3JEwbMhKqeV-lf3MQ>
 <xme:0UN9YLYdq4sK-SVkCSK0B0yx3bOMPUd60v5ZqyK0_axQe-HrVDs5Hjf78LEjmEnNs
 CSxQpCi7y2h8S2iGBA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddtgedgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
 ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeevjeelleejfe
 dvheeuieetfeejfefhhffffefffefhveetffeuudegudduhedtueenucffohhmrghinhep
 vghinhhkrdgtohhmnecukfhppeekledrgeegrddutddruddvfeenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlihhs
 thgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:0UN9YK-CtWN5PIGBGZQCLLAsUc_-YejsK1kqetzVaPdtMlTmxOlICw>
 <xmx:0UN9YKpK6QdEpVooG414pwkCyNql3XBsW_5VrrTnrps_Cg9pdSmgAg>
 <xmx:0UN9YLpKZXQFRkkJhj60gZ8-rr8HnO-QS8D9P5iV_bs2uAvk81GQ6w>
 <xmx:00N9YJjZHdFTvolqufRqbeEy3StaYt-fKFWWkrAugFjazIMWSnzarQ>
Received: from ThinkpadX1Yoga3.localdomain (unknown [89.44.10.123])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1691324005D;
 Mon, 19 Apr 2021 04:48:11 -0400 (EDT)
From: Alistair Francis <alistair@alistair23.me>
To: robh+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org,
 krzk@kernel.org, shawnguo@kernel.org, daniel@0x0f.com,
 linux@rempel-privat.de, kuninori.morimoto.gx@renesas.com,
 Max.Merchel@tq-group.com, geert+renesas@glider.be, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH 2/2] drm/panel: Add support for E Ink VB3300-KCA
Date: Mon, 19 Apr 2021 07:09:56 +1000
Message-Id: <20210418210956.3024-2-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210418210956.3024-1-alistair@alistair23.me>
References: <20210418210956.3024-1-alistair@alistair23.me>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 19 Apr 2021 16:41:45 +0000
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
Cc: devicetree@vger.kernel.org, Alistair Francis <alistair@alistair23.me>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the 10.3" E Ink panel described at:
https://www.eink.com/product.html?type=productdetail&id=7

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 4e2dad314c79..f1f6fd2517f6 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1964,6 +1964,32 @@ static const struct panel_desc edt_etm0700g0bdh6 = {
 	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
 };
 
+static const struct display_timing eink_vb3300_kca_timing = {
+	.pixelclock = { 40000000, 40000000, 40000000 },
+	.hactive = { 334, 334, 334 },
+	.hfront_porch = { 1, 1, 1 },
+	.hback_porch = { 1, 1, 1 },
+	.hsync_len = { 1, 1, 1 },
+	.vactive = { 1405, 1405, 1405 },
+	.vfront_porch = { 1, 1, 1 },
+	.vback_porch = { 1, 1, 1 },
+	.vsync_len = { 1, 1, 1 },
+	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW |
+		 DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_POSEDGE,
+};
+
+static const struct panel_desc eink_vb3300_kca = {
+	.modes = &edt_etm0700g0dh6_mode,
+	.num_modes = 1,
+	.bpc = 6,
+	.size = {
+		.width = 157,
+		.height = 209,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
+};
+
 static const struct display_timing evervision_vgg804821_timing = {
 	.pixelclock = { 27600000, 33300000, 50000000 },
 	.hactive = { 800, 800, 800 },
@@ -4232,6 +4258,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "edt,etm0700g0dh6",
 		.data = &edt_etm0700g0dh6,
+	}, {
+		.compatible = "eink,vb3300-kca",
+		.data = &eink_vb3300_kca,
 	}, {
 		.compatible = "edt,etm0700g0bdh6",
 		.data = &edt_etm0700g0bdh6,
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EBE9893B8
	for <lists+dri-devel@lfdr.de>; Sun, 29 Sep 2024 10:20:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F193710E05E;
	Sun, 29 Sep 2024 08:19:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="qS+hvdcP";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="N4Lu/5lR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-a1-smtp.messagingengine.com
 (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A97A910E05E
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Sep 2024 08:19:55 +0000 (UTC)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfhigh.phl.internal (Postfix) with ESMTP id D7C3411402B8;
 Sun, 29 Sep 2024 04:19:54 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-10.internal (MEProxy); Sun, 29 Sep 2024 04:19:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:subject
 :subject:to:to; s=fm2; t=1727597994; x=1727684394; bh=RaombYwqlv
 gTulaKHCH08DnQGGYc80B2ooKfYIwwmQ0=; b=qS+hvdcPnX1dbOFo/Ztak/2TL8
 MNiKm0YXAqF6wg5XByb3wNQNXTH7KyWxWP2wjwufhLaukYKDxtatP+kr6ywpAgsW
 SMk4FyFzIZ8IATl83uUni/+iaFxdIFMmL6YtozoJYE7M34mQNZe+bIWYNT+cBUFJ
 Rcus3YUSGI0za9d1s3X54Thpf14xavzXkpsfaq5b+jl0075rq58x2PhkXGs8If9K
 2271pFP3YbYtOCd93xKlQ9IrZKE6mh+w4217kmDHCbLqB1n1tacIwbx75VEMglJm
 y3zYZrGtg+XbcwRECiflbscGdJFCz8hL4w2Dm+G4GUX4jH/p0bwNdNeL6aSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1727597994; x=1727684394; bh=RaombYwqlvgTulaKHCH08DnQGGYc
 80B2ooKfYIwwmQ0=; b=N4Lu/5lRpkisN7XAmUSiSBHIztx2jT/FF8udt0GROY9G
 YikP8jotgYfiPGMGvXJiYDLU3MC/0hpezX/1hiH9wlzXvm6nVhfQG6u2enBj8T/q
 2qg8i8MYmxis7a/1NCPxj1Q7l2ETahCDAdrAnR9U5zL5ujpf8uS+vRlAKS8paHvH
 zPPFssLSA59UhfLu7xI037xQT57Fl+7/OxThgy1bUjLp4wg9lTG9Iu/JXv/hUw7u
 WxFUe70rFeYCoMGm+d5LTSAjBudIyxG6I6U054q/O3+bIDxZci1vuVdaDMtxsyUK
 bu6hyE2yShZd30Wb035Kc01AMNP7/T/uqCQAEbRu2A==
X-ME-Sender: <xms:qQ35Zns0uVxMpqv3xlBSPm1zL3uWPbYsC2qKFqg2BUGknEzgSrSeig>
 <xme:qQ35Zof2WzOfD9nVzXFVNw6LNjqFdGX7fF5nMbC313RoRGFlBIwHQx_D8837zvdgR
 PGblGQ-FYLmEO5ceg>
X-ME-Received: <xmr:qQ35ZqyZecsHEb83WCe0uaB3uUqzLFmmm2tUCf6PAhDnjOtaupahW10_S0t6rQiyjLJD5tLBcNk2Tux2EHA9scTTNAzerNP-_M0QjJ1wsajhddqf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddufedgtdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfh
 rhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtoh
 hmqeenucggtffrrghtthgvrhhnpeduvdeuudeugedtueffteevveegheehvdfhfeduudev
 kefggfeftdehgeethffhffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghpthht
 ohepudehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegurhhiqdguvghvvghlse
 hlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepnhgvihhlrdgr
 rhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehquhhitggpjhgvsh
 hsiihhrghnsehquhhitghinhgtrdgtohhmpdhrtghpthhtohepshgrmhesrhgrvhhnsgho
 rhhgrdhorhhgpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtph
 htthhopegurghnihgvlhesfhhffihllhdrtghhpdhrtghpthhtohepmhgrrghrthgvnhdr
 lhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrh
 hiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhn
 sehsuhhsvgdruggv
X-ME-Proxy: <xmx:qQ35ZmNiSvo-Y8hff1jkwQ_pD-ShFU88c3vq7Ef6m4LBlsirsVm7Sg>
 <xmx:qQ35Zn-amC9N8p6lfDrolHa2Lpkns2VnAG8XV6W5UONS8QTe1xBDbw>
 <xmx:qQ35ZmV-wm6TqE3Er4Ji9nnKGTFPNme6zH72nbCfVgEaVr0ujqpBtw>
 <xmx:qQ35ZocgGHSXPTlsq8LZj3dY7HHl_pQ91-VNIFZx7zCDzzoWn8UtZg>
 <xmx:qg35ZuepUG8LWPUT2N89THSOfjERrETKXJ0MScZOkzhg_FJjzZ-6786M>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Sep 2024 04:19:49 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: dri-devel@lists.freedesktop.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Chris Morgan <macroalpha82@gmail.com>, Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH] drm: panel: nv3052c: correct spi_device_id for RG35XX panel
Date: Sun, 29 Sep 2024 21:19:38 +1300
Message-ID: <20240929081940.823995-1-ryan@testtoast.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Anbernic RG35XX devices use an SPI LCD panel from an unknown OEM,
with an NV3052C driver chip.

As discussed previously, the integrating vendor and device name are
preferred instead of the OEM serial. A previous patch corrected the
device tree binding and of_device_id in the NV3052C driver, however the
spi_device_id also needs correction.

Correct the spi_device_id for the RG35XX panel.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Fixes: 76dce2a9 ("drm: panel: nv3052c: Correct WL-355608-A8 panel compatible")
---
 drivers/gpu/drm/panel/panel-newvision-nv3052c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
index d3baccfe6286b..06e16a7c14a75 100644
--- a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
+++ b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
@@ -917,7 +917,7 @@ static const struct nv3052c_panel_info wl_355608_a8_panel_info = {
 static const struct spi_device_id nv3052c_ids[] = {
 	{ "ltk035c5444t", },
 	{ "fs035vg158", },
-	{ "wl-355608-a8", },
+	{ "rg35xx-plus-panel", },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(spi, nv3052c_ids);
-- 
2.46.1


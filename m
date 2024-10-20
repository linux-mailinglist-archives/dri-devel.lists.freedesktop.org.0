Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABFE9A5328
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2024 10:38:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4988D10E025;
	Sun, 20 Oct 2024 08:38:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="MvGxRld0";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="SdU8FXd8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-a2-smtp.messagingengine.com
 (fout-a2-smtp.messagingengine.com [103.168.172.145])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6929B10E025
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2024 08:38:54 +0000 (UTC)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfout.phl.internal (Postfix) with ESMTP id 55B7A138024F;
 Sun, 20 Oct 2024 04:38:53 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Sun, 20 Oct 2024 04:38:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:subject
 :subject:to:to; s=fm3; t=1729413533; x=1729499933; bh=sKpH++97KE
 AvO07TgH6eUmUY+xGWIkr9L2yNLe7qN90=; b=MvGxRld0pBy8k1M6FydnyqlzlT
 Clv5i7b0iMlhz8VTrdhKaKmbZxcAJzZgdVePjwHTdWSAswWxaasIpC5mpyz9j/oa
 BJq/Z2mYMTdA2JxpmL2feeXLIRaPjQLsW/5JImBzRL3iQ0n/6FkdeI3OJT0LCIJi
 5oFJen43TahYXT7DbZ/us1+u0VJxiqtNQfmwGcfW74ZbjxVnEH35QWB7d7aDfPyn
 wiT45zX9Xr5F502nXScNPG6ALTPFqWw5vV0ZEQ4B/Wc/qLz2+oOFY6uc4PuGwVXv
 DVqTkWSZ7ncr2wol9kAisk1dLPsWvdXpDoSUFI9a3j0yGRHjXrRg0Vm3JN6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1729413533; x=1729499933; bh=sKpH++97KEAvO07TgH6eUmUY+xGW
 Ikr9L2yNLe7qN90=; b=SdU8FXd8cuivgm8FTYizFsJph6vnmyL5SB1F6BbQYejj
 eP/P8v0iiAff6keFfT8pNP0HI1utV0qHAGr0Ir+/3DzJZ76Y9NoVh5pVtSdtb7dq
 ZXhqdj7+JMyX601jqr9Beb2gYvchwuFeGUJh2J8feRuBT2l8poHdrHulMazogPiy
 BsyKHNzZotljuDxPnLQ9a4h58ub3HkS1n/PcCK1QbIv4ZeWuCZR5tRCqAMVgIwmf
 yPHyqqUrisW5rzfjJrBaI1oZQlKGjYSqdNwc/WHGR4UYQcpCOP0cDpqQZ/xmxyzx
 m9zJBQP5BvF5f9tNCK1YwtG8VZwEJK1rwYJ/aFrvng==
X-ME-Sender: <xms:nMEUZ4Vj_mbrh7yHAtyghnr42XTEF0DrIYObUyBkVWOYT5-4j77fJQ>
 <xme:nMEUZ8n5S8TZviOJP9n2H4IEyLqeH_YlsmDouY1zH4scnRCySC2TTPuSJVwPhseLB
 JMOz380AOXEC9K7SA>
X-ME-Received: <xmr:nMEUZ8ZIcGHw8mvZ1pqK2s8V-LcNSbYO1PR_Iie1rZOcgZWR7j0X5ktGqRD7p6iVrRT4YVzUhkWgcFZPmfkBMuMHx9I0b1z-47nT-Cel9iwBuT1i>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdehjedgtdejucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:nMEUZ3VMnG03KEi6tz-lKzET5Y93FJfs06JGKMAkmbIPTzxOZBs7UA>
 <xmx:nMEUZylwXUYZHZjadZlV0CM61XjrI98DTVp2SKyvHzy7aM955EI8XA>
 <xmx:nMEUZ8czQF39M1HccnmSDF92Nr6fF4o6obBPLLqF7Rv9NevBs4xC2A>
 <xmx:nMEUZ0Fn7CKsdQOAw5B3mzN_Pq6wIXw_DkIhYE4R63IxTP-G9ONA0g>
 <xmx:ncEUZ-l3phaCZsrLaeCqzUiP8nbhIvt-nI4mbBK89b-ckmnyOZn5-dip>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Oct 2024 04:38:48 -0400 (EDT)
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
Subject: [PATCH RESEND] drm: panel: nv3052c: correct spi_device_id for RG35XX
 panel
Date: Sun, 20 Oct 2024 21:37:41 +1300
Message-ID: <20241020083836.175733-1-ryan@testtoast.com>
X-Mailer: git-send-email 2.47.0
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
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
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
2.47.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3B396ADD1
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 03:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7949D10E67A;
	Wed,  4 Sep 2024 01:25:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="RQlVrmTG";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="EcGbOSMO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh1-smtp.messagingengine.com
 (fhigh1-smtp.messagingengine.com [103.168.172.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5799C10E67A
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 01:25:25 +0000 (UTC)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfhigh.phl.internal (Postfix) with ESMTP id BE6BE11401FD;
 Tue,  3 Sep 2024 21:25:24 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Tue, 03 Sep 2024 21:25:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm1; t=1725413124; x=
 1725499524; bh=ySdpGRKwjdXK/NH/+xLA0x29xg7PSI+xHGOxd1P4usM=; b=R
 QlVrmTGSIqxh/0L9NePwbAlQfGBVm6a4LttRcEoYbZyw4sJKgStFA03YNApvIB3G
 W/lViE5xl0x7432L+87ctWUGOWGxY/mgBeLH8EQb376EUNN2OqPZQBzz/pwwDKdJ
 UetKkQqleNPo0rsIfnxTd8WFR8hwYbHltbZLpcPhy5yM2x0QX0B8c78gVDn9GWbm
 zdNUbluOagU92Q6DvviWsPdXsO2OKhboiP4KE4OKJYxbOhD2Y6OSlwGMELKuc9el
 2AiLXk7SPGUK2N+QwwNqmrn1EFsgRY2j7Uala9giyEzOU69HCMOLqpu7dt/b2rzl
 HMommUR1q8/A/IWMQxGyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725413124; x=
 1725499524; bh=ySdpGRKwjdXK/NH/+xLA0x29xg7PSI+xHGOxd1P4usM=; b=E
 cGbOSMO+DzD20cvEI0y+HpNgtbQJfdZHIqL1Yqdquk/BsuGMeTLB57twqSN6cOnC
 JnzYHGI8gt6CilcsD8x9CNHDNNhcfx5EsErhTJr6It8KTzIh+v7ZZlOdMLqOzkVx
 et75zgVoy8vBx4RysaVY1pgM0MhXmpsqwGhg/Wb/yGbqFNSK62NrVvlX/sgrI6+s
 ++9BhGCQ1KjC6eZ1ZEp+LV1B0y9PFuNjDQTxDPnM3r+X2FvjDmeY1bUdJ8bBZkmj
 iE1O3J6KENFEH6Q0q5dUrfd4WZhbM5eT/TYwDWmC2iCsMrTfkUhaHI2Vr7ReV6Au
 0QXClpCd3rnQyAJB2tOdQ==
X-ME-Sender: <xms:BLfXZof1kuQ0dembmZ5pskEoilBqkyHZBclotZsjcLH5rbbvFSLgOA>
 <xme:BLfXZqPwkw1A8CLpnWW_to63ySOADddP23Yhjsk8SXyA4J6vOSS1HpP-Xh0gsTQUJ
 Xxzdpx6CjwSV6OfKw>
X-ME-Received: <xmr:BLfXZpg_1NnYNlXSPQUTHAXmVPhghBvHjjCo-hkTb2NnvOhE-8IaVDYIr59zXE1O4byh7-w4XcfWuzc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudehiedggeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
 ucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrd
 gtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeev
 ueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghp
 thhtohepudeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegurhhiqdguvghvvg
 hlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepuggvvhhi
 tggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgvihhlrd
 grrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehquhhitggpjhgv
 shhsiihhrghnsehquhhitghinhgtrdgtohhmpdhrtghpthhtohepshgrmhesrhgrvhhnsg
 horhhgrdhorhhgpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgt
 phhtthhopegurghnihgvlhesfhhffihllhdrtghhpdhrtghpthhtohepmhgrrghrthgvnh
 drlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehm
 rhhiphgrrhgusehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:BLfXZt8PhSX4GUyQ4rh5jLdj_zLLgdTVNEQ5Z4ZR_NWRbu61UGQl-w>
 <xmx:BLfXZkvgwcULl0O0nl9JV_18vbd3AI2liSHVd3nlQ0167kt614efnQ>
 <xmx:BLfXZkF-GrNN2im7WoBUPr_V5iEEKMpEdNxbSmfdsDCWaZbBuWDPQw>
 <xmx:BLfXZjO5P0TZaEFur1b5zF-aZsQ-LslurbpW3MdLQE7yoYNgqFd8IQ>
 <xmx:BLfXZl9MFq8meThRp9wMeFrXjTWNUyCKPLu8o5fgY6cczT3BK98iS2Ee>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Sep 2024 21:25:20 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
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
Subject: [PATCH v3 2/2] drm: panel: nv3052c: Correct WL-355608-A8 panel
 compatible
Date: Wed,  4 Sep 2024 13:23:22 +1200
Message-ID: <20240904012456.35429-3-ryan@testtoast.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240904012456.35429-1-ryan@testtoast.com>
References: <20240904012456.35429-1-ryan@testtoast.com>
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

As per the previous dt-binding commit, update the WL-355608-A8 panel
compatible to reflect the the integrating device vendor and name as the
panel OEM is unknown.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>

--
Changelog v2..v3:
- Use integrating device name with vendor prefix instead of OEM serial.

---
 drivers/gpu/drm/panel/panel-newvision-nv3052c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
index c5d3ead385550..d3baccfe6286b 100644
--- a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
+++ b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
@@ -925,7 +925,7 @@ MODULE_DEVICE_TABLE(spi, nv3052c_ids);
 static const struct of_device_id nv3052c_of_match[] = {
 	{ .compatible = "leadtek,ltk035c5444t", .data = &ltk035c5444t_panel_info },
 	{ .compatible = "fascontek,fs035vg158", .data = &fs035vg158_panel_info },
-	{ .compatible = "wl-355608-a8", .data = &wl_355608_a8_panel_info },
+	{ .compatible = "anbernic,rg35xx-plus-panel", .data = &wl_355608_a8_panel_info },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, nv3052c_of_match);
-- 
2.46.0


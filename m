Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7E35B3400
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 11:31:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 595E110EC38;
	Fri,  9 Sep 2022 09:31:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57AC110EC38
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 09:31:23 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 19F3E3200302;
 Fri,  9 Sep 2022 05:31:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 09 Sep 2022 05:31:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1662715881; x=1662802281; bh=gx1kilvRBl
 ZDP2uSlAR9v8ICzqHLQNiSJ3TnjZ88Bcw=; b=lloRYawTu4Z23Xjp0Rt484Jhqy
 WNK0c0K9FypFPiWvYWW7+gQJFkO4IklXzonGnY7m5nNzYUN+ESmssUxcz/sMX9Vb
 9Ulj4sUDnQTnW5mc2rlFJtmjwgQiXDX+WgjkfdOZ1WdGEEnCLaD4VQTKINnszE1j
 kVjO/iokRsLdoLXaeqkgg2lNzuwI7s0z92Jk2QwLLcNBVz3SOYi9zoDn9J9W/sUb
 99bbc/GNbxY3NvYLtuvYHlYSGKkHUJE/fxAbNQOEwULfKhetQYRtYT8e7Z7lmjsT
 IQ0xuwcmDq3TJtfXt5u1kN/Z9xLfuQdh06Yr4iV948c1gupv9slJJE1Cv1IQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1662715881; x=1662802281; bh=gx1kilvRBlZDP
 2uSlAR9v8ICzqHLQNiSJ3TnjZ88Bcw=; b=XMKnT8BqeyaY0DXAKXPt3yiGDpZud
 80D83zZII3nv5i6Ydr4zWNNeNYQSrTdxKM5dkvNxuH++FczTdWFnMDXoAjHBQ1Ys
 Ag2sM/VtkesWmsx+CMHHRy6TMdboJwxSdOT1P9YLHZeBn4wzdn3kcevFd4ovn/Vm
 87nMyH6ZZVgqKxl/rpyRG1rl3l2Jt04K8afwXQBF9ffJVxSbiNTxQF/pfvCxceGt
 n+MFqZu/s/dx6DgLLJDEtkD+MW6vS2KPs8rsTNIos2yVumRdwc2rk9gx9vzKfQTL
 JTD0zWAPcpsaWYftzh8L3kL2ZwqcitE51rfkTk9Vvx+IzY0EkRghm70vA==
X-ME-Sender: <xms:6QcbY61Dt-xOzd6pnqNSyyaKtb_Fd6MgV8K9CbOSgeJArG0z-JfaKQ>
 <xme:6QcbY9FaRyIRt0gQ-_UHLUPTrLltfGEw2QPGSe6SwDm4QGgcYwV14Vku8-S25-qlz
 cDoOcloC_ERdQ6V-mc>
X-ME-Received: <xmr:6QcbYy7JBaIPqDED_QaZbzFcHRMXp-ejvCX1UL5muZ3Mue5sbBBWOcv2Wp_j>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedthedgudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepgffgteeihfeiudetleeuleetffdvffdugfevkeduueelgfetjeehjefffedt
 vddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:6QcbY71ogc4DBcuOYBXV_KqJuWZRIhemKWXPgjvO6noRmo7l4_4bEA>
 <xmx:6QcbY9Eqs-H3G2MKXnNfIOdaidSPftOd8iOQtzCgNfONFf2cmKShXw>
 <xmx:6QcbY0-dU0mRXML45yTDPN1x3f7v8loL0swJyxM10RW6Rqc4HqD9gw>
 <xmx:6QcbY2MNzuYS_-X_DZevpuixUfYa5wy8jPYpoPF4kdDi-OSsM3tX2w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Sep 2022 05:31:20 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/sun4i: tv: Include drm_atomic.h
Date: Fri,  9 Sep 2022 11:31:16 +0200
Message-Id: <20220909093116.4141982-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: David Airlie <airlied@linux.ie>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit ec491291dc94 ("drm/sun4i: tv: Merge mode_set into atomic_enable")
has introduced a call to drm_atomic_get_new_crtc_state(), but didn't
include drm_atomic.h.

On CONFIG_OF systems, this is fine because drm_atomic.h is included by
drm_of.h through drm_bridge.h. However, whenever CONFIG_OF isn't set, we
end up with a compilation error.

Fixes: ec491291dc94 ("drm/sun4i: tv: Merge mode_set into atomic_enable")
Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/sun4i/sun4i_tv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun4i_tv.c
index 74ff5ad6a8b9..c65f0a89b6b0 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
@@ -14,6 +14,7 @@
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
+#include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
-- 
2.37.1


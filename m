Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCAC57094C
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:42:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD4399037A;
	Mon, 11 Jul 2022 17:41:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF9C190343
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:41:18 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 3AA1F5C0071;
 Mon, 11 Jul 2022 13:41:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 11 Jul 2022 13:41:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561278; x=1657647678; bh=tq
 R7o8W1+s3VR2O8JDnAU86ME1tKMshmvmxvU0K+ANQ=; b=IkIaTxk2N4EaockLU1
 DOQppIyR1ashC59q0wpui8Cg1UIKSLlVE7RzPOhr56QjtHH1dOLJU7axL6RJMQZ/
 X/mKRjz5KE7+l8HzzOmhzsC9JXPHhviEQtDXVyoTT13C646dLH4bsEBqER55sbow
 5Sy83v0hAPyyxJmgujQMlODBaSB+cZKQO8N/NrF2V4hncVYzT52ReRkRy97ZgjnE
 GRLlXjmMR/727pT3uqtmd5K71P8JCC1un+sj7ur++aqHP4AZTwcvKhqPXu8GnUst
 j+RWJX7MWGzuzCH+8Yj2esRveN4l4h7QGzSQ3VZNoqmdD/Wvivr/hO85jjv38BLD
 VaHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561278; x=1657647678; bh=tqR7o8W1+s3VR
 2O8JDnAU86ME1tKMshmvmxvU0K+ANQ=; b=en6gedjD1vcMDpkMmR4SgmtOrvYsN
 xOIlGhySsyuxU0bqgKJm2AWvr3wDuAKOwuT1sJ90UfZZG4NDnPnqqLj5jmRW4UWJ
 XHmYITXrwZNHzmSe6iHWNsLhi9CG9Ci+MfaVku6LLxGx5eshSNlYcF7I7B+WEolf
 1SQ+bcVTjXqCXPpsKmQNiVHWoojK7uYb9Bxd0GS+8jJA9e8D5kmEFQKbCPbRJrqJ
 Bgpk2gCrO/BkfFljcQ1A3XIt9t6yVMd3LcYnRsrpVXlks4H7EjfgK2a80JtCnjx3
 r53PhRbj6LMMNXQ7NO8aRgvjwWaUYoSFee4OHb5gZEQWzddawBu9EVhRw==
X-ME-Sender: <xms:vmDMYuj5OUtAqwHf8fL4Vo4PT_ph0wSsc2lZ2ECEa2MLnihFhZKPUA>
 <xme:vmDMYvDzC_jEeOuPY5jF8VdFzBy1s3YkzDmlWzzMr7z94vsjjWvWUzqRkVT54_oMi
 ezDhsAnM3xaXdP6lyE>
X-ME-Received: <xmr:vmDMYmHV4FJUZJxgcaJ0UaVDCmga_YYIK7TdCntyH27MNrMD78Yeaqgh6noLK9flpFZgLGP-obbDcibxxEwfZw7atzwaO153TaCptGU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:vmDMYnRsv2GvaSUqy1ldAJ-aa1jWzLE3fsgGEr-eJQF5duKpj17cbg>
 <xmx:vmDMYrwpJWlitUJiWr-d35GQCv_IW7ft0tsXJODXxxmE20RGqr2PiQ>
 <xmx:vmDMYl5JiCpZ60-y6pFFdhEHelsGs3PGyD6bVHAePGvFTn0unCKINg>
 <xmx:vmDMYtsWokclBOVMSdrplAme8WCN21eMxraBNWYiVIVqNQ25n6R0Xg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:41:17 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 56/69] drm/vc4: vec: Switch to drmm_kzalloc
Date: Mon, 11 Jul 2022 19:39:26 +0200
Message-Id: <20220711173939.1132294-57-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711173939.1132294-1-maxime@cerno.tech>
References: <20220711173939.1132294-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Our internal structure that stores the DRM entities structure is allocated
through a device-managed kzalloc.

This means that this will eventually be freed whenever the device is
removed. In our case, the most likely source of removal is that the main
device is going to be unbound, and component_unbind_all() is being run.

However, it occurs while the DRM device is still registered, which will
create dangling pointers, eventually resulting in use-after-free.

Switch to a DRM-managed allocation to keep our structure until the DRM
driver doesn't need it anymore.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_vec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 2c96d5adcf49..a051b25337c0 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -509,7 +509,7 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	vec = devm_kzalloc(dev, sizeof(*vec), GFP_KERNEL);
+	vec = drmm_kzalloc(drm, sizeof(*vec), GFP_KERNEL);
 	if (!vec)
 		return -ENOMEM;
 
-- 
2.36.1


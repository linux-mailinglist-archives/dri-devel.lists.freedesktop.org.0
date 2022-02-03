Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 836A24A823E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 11:20:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3770710F083;
	Thu,  3 Feb 2022 10:20:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9169D10F083
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 10:20:12 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id CF94E32020B7;
 Thu,  3 Feb 2022 05:20:08 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 03 Feb 2022 05:20:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm2; bh=sOWnHDG1T8A9g+lekWhh9nOp0CAfxOUzn591iMrIq4c=; b=V9YPN
 lc3XlJNQxNmLUaoo71cB1JWoZ04W6nONP1uWDS7AFFOOQuaZA18JXa7RNmVOXXWr
 p43W/0+s/srLJIg+LDhRepkwqgI6HIaessZTS5WgIi4MVUX6UeQV6/s973UozV2n
 lFRX32ZQTrZKvVBwjXOVuLDZc/MjiGHGp4ShP892MFZvSCx7/6/n1OHy4UsPVHwc
 En7QltlqSymM0DdS5V93tNOl5BoxWRk/lTEtPs1jgQfrrPCKHDe0BzYvs0xYAd8J
 LWm4sg+PcnlaoHhxBqfStYXC91tVFDScVteQFqXb1DZ6wWX7MUilXILQ3G0ERuY1
 Saxy5poy+E64xr1+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=sOWnHDG1T8A9g+lekWhh9nOp0CAfx
 OUzn591iMrIq4c=; b=d665ra5STxGhsKVaJgWm4X9nIXmQnU3pOMHwz0WALbG7/
 bEfXcfyWke0fSZxN8mPu9sbWvlMyPM6OkT6tNpiCBX9jq8sJqwRT5eyfKWLWmzIH
 8twjfhSxg0JLh+8DgyxcXtSwTa0uD1SDTgpGi1TsJlV0UASBedJUXJ0nUONuCOY7
 6sIkcJPyfbfVfcFkbRjpxF5wcKt6tRatl+MRGhbe7pjqyZW3MRnDDNQhxyHa6Igu
 L1uclKMprsCeNXqYshCzExVz3V98ZlF/gdugOPwhhPxMvWagx3beViLXi+4gB13C
 936Hb0hGhwUKDtFM80DNwYDA1bCVzWco2yNPLfXpA==
X-ME-Sender: <xms:V6z7YUaX6iPVEm4e6itR20WVQ70rDkodh9nNBh10Gj48zD9EwGeAzw>
 <xme:V6z7YfZoSX9YTLjymefaraW-BXRLrmOZbd4V39mw6TRJUJktGe538zCKVp_0II9GM
 ZGoAP40JJxazqGfsQM>
X-ME-Received: <xmr:V6z7Ye8MtzTW8v7qUk6UIL4mGqcH0qXHSMwOC4KbMHQecC3QMla0QabIe5IpoI3FelLK-SEkQKpIoMZaY806oPH7qd3DJjLYLXrU5NE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeejgddufecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeejgeen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigih
 hmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:V6z7Yeqnxlo0n4GwRVN4mBhC4YZ5_iJ-Qe0seBZyLocSBt1mea-CNQ>
 <xmx:V6z7Yfp-bRUC9ZcNz2JcI_Tv9dqFl1u7dpUJ_VwxJ5XILrIhq_odlg>
 <xmx:V6z7YcRIEtt6gfQbgm6yoy-Q3nU4mJpjAtsBGYshnbH-h5YirH1cPQ>
 <xmx:WKz7YTcPj4TrY2ACpcirTF3fPAsqSrQzZSQMHSAcCATSYRYGEE5IGA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Feb 2022 05:20:07 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vc4: crtc: Fix runtime_pm reference counting
Date: Thu,  3 Feb 2022 11:20:03 +0100
Message-Id: <20220203102003.1114673-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

At boot on the BCM2711, if the HDMI controllers are running, the CRTC
driver will disable itself and its associated HDMI controller to work
around a hardware bug that would leave some pixels stuck in a FIFO.

In order to avoid that issue, we need to run some operations in lockstep
between the CRTC and HDMI controller, and we need to make sure the HDMI
controller will be powered properly.

However, since we haven't enabled it through KMS, the runtime_pm state
is off at this point so we need to make sure the device is powered
through pm_runtime_resume_and_get, and once the operations are complete,
we call pm_runtime_put.

However, the HDMI controller will do that itself in its
post_crtc_powerdown, which means we'll end up calling pm_runtime_put for
a single pm_runtime_get, throwing the reference counting off. Let's
remove the pm_runtime_put call in the CRTC code in order to have the
proper counting.

Fixes: bca10db67bda ("drm/vc4: crtc: Make sure the HDMI controller is powered when disabling")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 287dbc89ad64..799aaf8c1abf 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -525,9 +525,11 @@ int vc4_crtc_disable_at_boot(struct drm_crtc *crtc)
 	if (ret)
 		return ret;
 
-	ret = pm_runtime_put(&vc4_hdmi->pdev->dev);
-	if (ret)
-		return ret;
+	/*
+	 * post_crtc_powerdown will have called pm_runtime_put, so we
+	 * don't need it here otherwise we'll get the reference counting
+	 * wrong.
+	 */
 
 	return 0;
 }
-- 
2.34.1


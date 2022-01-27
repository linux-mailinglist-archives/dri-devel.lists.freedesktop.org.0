Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A26649E3D0
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 14:46:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6590C10E13C;
	Thu, 27 Jan 2022 13:46:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F2DD10E13C
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 13:46:05 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id BD4405C010E;
 Thu, 27 Jan 2022 08:46:04 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 27 Jan 2022 08:46:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm2; bh=Sd1JzVQrh6g0oFaQ23Ec/3j//9ErGA3nd033ifOu2Ak=; b=FVVqK
 6fpw1EQ4mrpAnoQipM+wwvcGPn+9TpZq1mednOBuYuP3BVhf+0EvjNUWAIdd8ATn
 Tct/lQxttWtZ7kYh+CAkR44dYPYGfCPAC36t1FCh/6ko66pxUyl+VtrDdYJydOHR
 MVoOftPqGVFQjbeHd/te8MltoRmC2wTqhd887cAic+z1mfAESbBoy9iVaWWg7bV4
 ueDvm9ZbBijwQYteiqnx9Tp5u+h6FWdM6UdLR5XGD04qUV5zEUCeNTYJKVUtDO6S
 SAzTSkb7CpxLDx1MEVRue3gT0ktX7EavArMxk7aR5fd2/bgRjHA5lTN0Bwf0SeOP
 w8zApXVMhtuhUuFtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=Sd1JzVQrh6g0oFaQ23Ec/3j//9ErG
 A3nd033ifOu2Ak=; b=N/HjMP13NWc+lnY1/sNwkN8ZebahokLHdfYtVIHETKFVc
 t+MdAwF5klQYEThq0PGoiXNyUQzyOIhWppiTJndI6HRmVAAEZ7UFytgvJltIkjBR
 oPEiYDqgN/NdxbiFxkJ2GV7fs5gcs5+0Og1NzpLqaseLPDKBHY5dWR8Hzf7dLXkX
 77N559Xxu+tRKTPfxCavJgLRnW40eaMEwREMS96vpvFcyyedoLqMKbgg3YWqrgwY
 ByMk8ddYeFgNfRhcv+7247qgiLRQsY0B4lWS3eZ/OklBh29LwNeUXcBcCDFRy0KX
 hEWk+n1eKInhpq0cS+pc0ESuusDtdg9ZdkhFiOyrw==
X-ME-Sender: <xms:HKLyYXaATDVnDNyP8ZxnXnTvruPld6AX9N-yK1n5amhI13O4SxuHKg>
 <xme:HKLyYWbSunWAnuddBqTa_Yy-aIjCgACvmu-YYR1Nf9WNgW9G8pIhWnw7jKiKA4s0P
 GtEsg3Q2MpCV1Kmzl4>
X-ME-Received: <xmr:HKLyYZ-R-1pH-KgMj3HW8pLzcxwQG1Xcm247GMBbAMpChjgxylWMnn0_RwTT5aTk60LgwvLB61cVsrA9_mWJ-tnGgKYq6AwUBZBxsno>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfeefgdehiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeejgeen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigih
 hmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:HKLyYdpGaSd-bA2anAg_Y2FDCFV8Mf6GFHwWMsyiq4kEnekUifn2Eg>
 <xmx:HKLyYSrLtvbX0Eqj2RmjH4Xjjx2Km9mC1kc8km2qt1oMNcZRQa-ymA>
 <xmx:HKLyYTTZ-n2gqvhrb4mC82Fs1dP8DNe4OEA3bmAo9rnahQiOmC07HA>
 <xmx:HKLyYecfvuTzSOgnHLJJD-IEsTij2HC6zmHJOt3-XRRBAVsqLEbXoQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Jan 2022 08:46:03 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH] drm/vc4: hdmi: Don't try disabling SCDC on Pi0-3.
Date: Thu, 27 Jan 2022 14:45:59 +0100
Message-Id: <20220127134559.292778-1-maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The code that set the scdc_enabled flag to ensure it was
disabled at boot time also ran on Pi0-3 where there is no
SCDC support. This lead to a warning in vc4_hdmi_encoder_post_crtc_disable
due to vc4_hdmi_disable_scrambling being called and trying to
read (and write) register HDMI_SCRAMBLER_CTL which doesn't
exist on those platforms.

Only set the flag should the interface be configured to support
more than HDMI 1.4.

Fixes: 1998646129fa ("drm/vc4: hdmi: Introduce a scdc_enabled flag")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 33ecfa1e3661..0ee446df50a0 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2534,7 +2534,8 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	 * vc4_hdmi_disable_scrambling() will thus run at boot, make
 	 * sure it's disabled, and avoid any inconsistency.
 	 */
-	vc4_hdmi->scdc_enabled = true;
+	if (variant->max_pixel_clock > HDMI_14_MAX_TMDS_CLK)
+		vc4_hdmi->scdc_enabled = true;
 
 	ret = variant->init_resources(vc4_hdmi);
 	if (ret)
-- 
2.34.1


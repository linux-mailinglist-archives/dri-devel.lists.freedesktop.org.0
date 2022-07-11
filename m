Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C316570911
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C3E990304;
	Mon, 11 Jul 2022 17:40:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23453902F9
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:40:20 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 7EA5B5C0162;
 Mon, 11 Jul 2022 13:40:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 11 Jul 2022 13:40:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561219; x=1657647619; bh=wO
 w0QPjcoT28Jn/AcQofwFvgn93CX1N7DOu10LfM7O8=; b=l3HWpbqiVUVKRYMZbT
 7HGHHmzUahZScIuVckYPd/mMlzJqE95pkHoElJF01UoQGFnSHYTGqnZhOwxJCfJn
 rbxLnlgaU0a6sSPhgR6XsekVsww2XDtZ2vGB/mdjDgD9jAU7sus0PAPlPYX7FhPz
 dUnDFo35Q52EfZFqZLgp3Ub/U7WGVpU2M405LdPex3mQeDZMm7Nr4oYT+yTn6MIp
 QtmtNbU6uoMcT76P0928/qU7B4tCrrx/T2nlsx53+t6fQ9q0z74Ft8Dg/dSYZ/d7
 soY5dhvGY74PclJWHv+xHmJ6PmpZ7LigHlZ4DOlSBQxGzVrkN9UALbP9pgd+TKSd
 pflA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561219; x=1657647619; bh=wOw0QPjcoT28J
 n/AcQofwFvgn93CX1N7DOu10LfM7O8=; b=ADw1dGuXgGKavhjR+nbFUMfMd+Sht
 qgMoYZ9VAnCA8ovjun+evSSsR1ueyfZNpr7yYLD+0IZFQvh6W/kOEnI1woT/3SZY
 c6lvQL0TZ53AEGAf3Txu765qFX/MSRrnfwark36pBZXYcm7L9HTX+tpfP1+VnrH/
 0kDXHnEKu9H2g838YaX5QBRRH3v6g7xoc1kE5ByIKlkEAYmLy8INs6GLV1B1IQQC
 9AKl5+maiYOZASEeeraqIpwYSAJtBOnXv7aIP5jxTRfcNSw7ISdtnUGWqolidrej
 3RpBghw000rQ8DEpXZke6EbE/Z6XQtxMR1dn4wQUtmVpnsLcLoNIDaitQ==
X-ME-Sender: <xms:g2DMYnkAMPb5zuNTgrkF_klgCQ0ccZWmDCNHhvrWZ9XwsOI7rI71GQ>
 <xme:g2DMYq0FX5gwPqznC4x9odNCeIIwvCwMiIScoWGozyPcDVSfz2sZ6fwPBhlj9zVxv
 3Sf4LA0YVV2SlymiiI>
X-ME-Received: <xmr:g2DMYtowa3jHdSF2lX6VFOajOHjG_BeFsoSSXnvv_TxzUJhXH3vxyn7Laz3aqUJkgtIqfCcGC0NO8IGG9csW9FbWk9WkR3SSRD-hywU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:g2DMYvkUY-3btzYZGITtHjTXd6osccgQEsrVZMzWK4OGjRqh4pjoig>
 <xmx:g2DMYl1o15fC2aZXYG7s8VaJkNyPqKt21ZjwL1EXBh0S25edFCCOfg>
 <xmx:g2DMYuuZHYuoUT4GDYCSdbwHnaBi-M5iRvW91mTEGWaiCgPNJBNs-A>
 <xmx:g2DMYt_EEPnbV5jYpNEY3LZV8UKsZgoLZBQlsulHEszYOyyY2XEmjQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:40:18 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 21/69] drm/vc4: crtc: Switch to drmm_kzalloc
Date: Mon, 11 Jul 2022 19:38:51 +0200
Message-Id: <20220711173939.1132294-22-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
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
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index bcce61879d53..d5158a6c0f21 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1284,7 +1284,7 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 	struct drm_crtc *crtc;
 	int ret;
 
-	vc4_crtc = devm_kzalloc(dev, sizeof(*vc4_crtc), GFP_KERNEL);
+	vc4_crtc = drmm_kzalloc(drm, sizeof(*vc4_crtc), GFP_KERNEL);
 	if (!vc4_crtc)
 		return -ENOMEM;
 	crtc = &vc4_crtc->base;
-- 
2.36.1


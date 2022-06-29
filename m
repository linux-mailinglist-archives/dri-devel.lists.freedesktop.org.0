Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 819DD560014
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:37:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 424FF14A624;
	Wed, 29 Jun 2022 12:37:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5575914A617
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:36:55 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 18E13320094C;
 Wed, 29 Jun 2022 08:36:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 29 Jun 2022 08:36:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506213; x=1656592613; bh=CE
 1O6S185i26F3+46NUMmpXqd1aQAFrFqEAg4tLVvNM=; b=rotcjiDxc6Ssymsq1n
 +fl1MwTYLcRn6DympLeoijZ7Uf66oiHFNkcO9xr3Qwc3CNsWwG4dKe0513uNzz6C
 hZCgUvAxBLW93xR1VcZVdUuNFN7FKd+nuFeZyAESVnTgldsutxLgE4831LuKWt4a
 UuB51lX9wIAwXbXXOtsOYkwtoU9IxurIoogcpKKoe6e+7syGEmxIJKAxi98IXou4
 SNOw+cBQLq2roGVwVAGy8c0sGU0QQ1fS8Uk9VwYMGmFwr/4se6jtTPMeqXboLGyO
 W9xdotLhb/ye5PhGvo0yar8mtd6uCDFqVOrrN9NeW9FbptLfr89GdTwH7HXdy3GZ
 AKlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506213; x=1656592613; bh=CE1O6S185i26F
 3+46NUMmpXqd1aQAFrFqEAg4tLVvNM=; b=njoMKU6tElRjWFLIOrCq4hTi5UOeg
 hBeVCKgIhZIqmWyntNwABCUXVt2AFzXbV78y8YRQozbDyZA4WzZTxK23ceV8ee/b
 s+VJB/d8NfbcjRD30tMBwYThJx6D8sQSGna2wsM2gZPIGEBIQsBs0i61gdOopKK/
 4zQ7iBufERI2t6Eg+G1N0ky0c/xnysYHj2dJOIL0RH4rBl1oVLJ9SY8bcWn+Nz+I
 xeh/v3B3yaqaUCArBwvmGsY5Zjc3rzFBo5A+hbH0ltoxti50Yg7SaeeC1fR47wSi
 HPg+xcjJRI5Qkv2WfNAMN79RH0292+vtVCmRgF3FGuSR2VPQMOmcTny1Q==
X-ME-Sender: <xms:ZUe8Yh3fAwlwrbKlPeDjyL8uoIJcCMslGqjmQnlo7JOB0S3EricVjQ>
 <xme:ZUe8YoEpzG3fYXfcMaQOK6p_hNvOS4LCfCb3JR5kFSLJqnljjcA2MgujHxAGEwARp
 OuzNvlYtRY6coLHvD0>
X-ME-Received: <xmr:ZUe8Yh7qg0VtunZWIyAoQdI78DbJHPQFHEOeuGAaBEB6uKbP92cLA_EocSMXtJcw1HF5CkcoXa8HtAlxdBwJs_htQvQTjMr4brOst4g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ZUe8Yu0ODTrjEQQAGzlEY0ZOs4qFLtsffekBw08z_yhIhxNEDPf7hQ>
 <xmx:ZUe8YkENuPeShr3uQ08ALlBF66v_RtjivHiuabZcy7BX7nzSGn8KGQ>
 <xmx:ZUe8Yv-mGOygw2Kxp0MXFK3ZpYwspeP_6fRN9FbSdiL48T0wLK77VQ>
 <xmx:ZUe8YpPcD86KPPlpmMclIyKmPdYnrNRaI72384oFRBJw7ki-b8fA6g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:36:53 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 33/71] drm/vc4: dsi: Switch to DRM-managed encoder
 initialization
Date: Wed, 29 Jun 2022 14:34:32 +0200
Message-Id: <20220629123510.1915022-34-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629123510.1915022-1-maxime@cerno.tech>
References: <20220629123510.1915022-1-maxime@cerno.tech>
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

The current code will call drm_encoder_cleanup() when the device is
unbound. However, by then, there might still be some references held to
that encoder, including by the userspace that might still have the DRM
device open.

Let's switch to a DRM-managed initialization to clean up after ourselves
only once the DRM device has been last closed.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 72889524540e..1a55b7ea52a8 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -1687,7 +1687,13 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_DSI);
+	ret = drmm_encoder_init(drm, encoder,
+				NULL,
+				DRM_MODE_ENCODER_DSI,
+				NULL);
+	if (ret)
+		return ret;
+
 	drm_encoder_helper_add(encoder, &vc4_dsi_encoder_helper_funcs);
 
 	ret = drm_bridge_attach(encoder, dsi->bridge, NULL, 0);
@@ -1720,7 +1726,6 @@ static void vc4_dsi_unbind(struct device *dev, struct device *master,
 	 * normally.
 	 */
 	list_splice_init(&dsi->bridge_chain, &encoder->bridge_chain);
-	drm_encoder_cleanup(encoder);
 }
 
 static const struct component_ops vc4_dsi_ops = {
-- 
2.36.1


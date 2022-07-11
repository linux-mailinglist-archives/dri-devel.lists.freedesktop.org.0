Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC49E570920
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:41:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0BD69032C;
	Mon, 11 Jul 2022 17:40:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE899031C
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:40:41 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 3B3295C0152;
 Mon, 11 Jul 2022 13:40:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 11 Jul 2022 13:40:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561241; x=1657647641; bh=+z
 CUXkmF4tS8sqQ1rQ2w5YxcSkyBM2Wb6w6+V0uBnTY=; b=R9DvKcaGx4ydNlqAVP
 G5fKXkiqc1GRBvM8eEYreWZ7FjR/pDnPcQFjLB5Ja45OagCdQpf7dDh3gvuE85xE
 th7qPbfT32Pt5cUCt8EKsl/bFYwkohX357vFCmMgD5fjAWE5yFTVGi/JLnC/9T6Q
 tulrrRiUQEvvBtO7EGYNZnFtxR8ZimBZdOmQZnyu21l0YDv21WO0KzZ85WSe8s6S
 AXYHLvUMVbuQy7E0ZjA3aZ0UMyrHW/H22iOhVUNjkTcoMZZeeHj2zUMaFYv8ld4z
 Dtt8U9RWmNFSgqxujv7xacnPE6qvsR39jPawB8gIRHHE9TBym/3fszZhbP8RewzI
 YU2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561241; x=1657647641; bh=+zCUXkmF4tS8s
 qQ1rQ2w5YxcSkyBM2Wb6w6+V0uBnTY=; b=AUaz7ZVKhZ5Hzuip077ncTW7Fpvxf
 EkUwEQVG6ozZ6rsjtX/XRFDTpI7kuK0A7417755jYAo8p+u9Vjwdjp/XJqpXtqZn
 OCDMTPMNzMcbHBzs/RQaliK1LaL6hbKcZuFL3Xht/Rk2EkgG3R5NN/mC4DU18VEv
 fmV7LqhoDwHFougCmWL6MQE3Lv41lFg6mWq3a4g1tMI3O2TQ1QtZDWaBUBIwH+lA
 zpnsL5OECE+U47396d3eluF1Mm+njEXwWfNHbOvxda87rCT50ioCZPOFdNI9TP6H
 8tk5SggwWOwTMKaWhH6RdACNxlDTGCZj8Mz1MB/VTSNgQ81Z1FieRlQIQ==
X-ME-Sender: <xms:mWDMYj_cMQukwl0-Kvni-F3VDke669qNuaLq90bP3QHZel4RSyLcPQ>
 <xme:mWDMYvt8JYS9aylkV4U-iegee44Bb4Hcn_Q3LMP_mN1rJ-b-0eSxj-BE90oM97AKi
 o1-ZX_jopKdY-u_qEI>
X-ME-Received: <xmr:mWDMYhARBMtFV6w68xANw20SDonH7sFKtJT1hd-qClNA-NaNTA4GyqOjmEoz9785Ld9jrrnqmns_XChYtehl4_VXAUhV4q1ezclSeuE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepleenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:mWDMYvcPs_ccYZ6DxFCmuoDqECur9Upi9HpSDAQUt8LJyho7ERAMvg>
 <xmx:mWDMYoN6jX135yoUIwnfNKe7mp7HwqEXRmf9p6LKbt48gry5Ks-yDA>
 <xmx:mWDMYhl4-ZzaYYvOC3Xtt6vE5aaJc15-zP4iRIAPY8ACkJchL_mCEQ>
 <xmx:mWDMYn0v3mW527Zn1KHXufDVeqG-i4U2Ndnr0dJ_3mHfL1uNR1lGlg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:40:40 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 34/69] drm/vc4: dsi: Switch to drmm_of_get_bridge
Date: Mon, 11 Jul 2022 19:39:04 +0200
Message-Id: <20220711173939.1132294-35-maxime@cerno.tech>
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

The current code uses a device-managed function to retrieve the next bridge
downstream.

However, that means that it will be removed at unbind time, where the DRM
device is still very much live and might still have some applications that
still have it open.

Switch to a DRM-managed variant to clean everything up once the DRM device
has been last closed.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 1a55b7ea52a8..13266ff334d0 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -1672,7 +1672,7 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 	}
 
-	dsi->bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
+	dsi->bridge = drmm_of_get_bridge(drm, dev->of_node, 0, 0);
 	if (IS_ERR(dsi->bridge))
 		return PTR_ERR(dsi->bridge);
 
-- 
2.36.1


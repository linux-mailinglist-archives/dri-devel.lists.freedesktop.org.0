Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7088056B6A9
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:10:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD794113887;
	Fri,  8 Jul 2022 09:58:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 464D5113887
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:58:53 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 09F9E32009CD;
 Fri,  8 Jul 2022 05:58:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 08 Jul 2022 05:58:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274331; x=1657360731; bh=+z
 CUXkmF4tS8sqQ1rQ2w5YxcSkyBM2Wb6w6+V0uBnTY=; b=V89Z6yiK+q7hxPDwVE
 fNad3LaMWUOPEqKD2kwTiplh1C7ouFrYRGOWQ5voMVanv34TRskzSjt1jszD2LEg
 vWRoqknxCf9LC4gd6v1cctNapJUdknl1Vg7Zfmfzf2+D+JdKZhi8IMSDeAtYPl2U
 GBkzu9/Dz+aV3D4Jxm0sqfjW08GiDcynatJx8tWo0GUvVUWTZc2cCsvOoLYmId9p
 1gU3svF4dkuxuEy2p9fuy8THPmD0wnFx2b17q2YJqLUrES4vcjaVsrqmcGeeFkxo
 jkpzw55ZCt8Oq3jEvB59DfwP4bSESQg0TkGSLcuRg8qjdR3JumLGmeiWm8f9FMu1
 L4Pg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274331; x=1657360731; bh=+zCUXkmF4tS8s
 qQ1rQ2w5YxcSkyBM2Wb6w6+V0uBnTY=; b=zoQXXeJlfPQMUDHonJZDM40jWQfX9
 fBGpPiDqAeG39beueBahKYE+1yPl4fYHWCcbjQQvJzzCCzegdjvkAHCGFndLdu29
 PEV1E4Lm5fy2zZMSrZnCXJPbfufVQnmdAyfwznCV78PjVPUHL+xWc+lbCgeykEiu
 Wu2vJNb7GeNkIIjHRHO171AVCf8WSg2vnyCVykceCrI8Su6tdQ4FepZlBY7yJoAA
 i2dXEYF62akilUhvfuixqRBeq3jdT5dB4w+ShYYdYo9MDGyDrHmxf3QYOyhs81mP
 4WK4+FobmkOMUmrEn8BZ7HISlhcwBCDJ48qY3Jj8IGtDPdzYhL3Qtgl+g==
X-ME-Sender: <xms:2__HYgDFQ7KVmziu4CcbRlf31D_BEf-vrvufr3uyGUUpdXFdxIpiQA>
 <xme:2__HYij9zq31fuqCiwA7NNdgUcPcHKCtoHJVkCnQduZnktZfuGBvh7d3BCFgiSMjA
 VF7V8w3yOxMqgzzgYo>
X-ME-Received: <xmr:2__HYjkS1AAcfWNM73w_CS0ayU3Dis8g1pyyVkGie9eL7M4YEa17FEPkZ8OFseUec_ZZVvqFf5dxIwAJLNC5SIpwB39SafoYJWLDoIM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:2__HYmxkGmIFuOKo86kM8IPMuICPeyUlbvaXnrkfh-IjCKi3BVbADg>
 <xmx:2__HYlSOSfPcuOZ3uMMMSzbqmQXnYXcjAjW4wTBn-uxZjAuEVg3iSw>
 <xmx:2__HYhauhzr5KCpI8bGkzvRKluZmT2THMZLGYivvGMGKCNIv4DwTdg>
 <xmx:2__HYuJp3MkJCaKg_l2XNXb7lgvEBiEXxfA4GT3KI8xF1QeTxNAMyQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:58:51 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 34/69] drm/vc4: dsi: Switch to drmm_of_get_bridge
Date: Fri,  8 Jul 2022 11:56:32 +0200
Message-Id: <20220708095707.257937-35-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708095707.257937-1-maxime@cerno.tech>
References: <20220708095707.257937-1-maxime@cerno.tech>
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


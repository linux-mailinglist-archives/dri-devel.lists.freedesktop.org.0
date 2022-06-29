Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D31A355FFF5
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:36:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C89514A552;
	Wed, 29 Jun 2022 12:36:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D049A12B06E
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:35:40 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id A0C11320094C;
 Wed, 29 Jun 2022 08:35:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 29 Jun 2022 08:35:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506139; x=1656592539; bh=wv
 8B8IfW0EOBl6yuA8VBDbNPJpoo7CvIqlUjZkho9Uc=; b=FcF8KPnB9sj3mL+XN0
 J4yVE0FD0x+mwp4X+iUCWJ3TtXnNbDqZLbGVt1UM28T1juQ8VrfuGf11UIgwtZCP
 kDGYvYoNLfDf78gxspbCW/TESHo0EeZjQpkPjBIYU16UgrcHlbGLfiU+ny/h5BLU
 hiJ5OJAL6NPuRcpvypviXb2QwwyX3ApZ9cp30JjEgdr/ojhtmB6OTZZHZfzhT2/U
 SM4x1jZOGvB5NQ5E6p6urp1JFNeg3BcQmeybkrYjxwimRgbqtA36cU8M+GePIHBo
 RfWzuvbY+s4tlvjeKsOioOw/dSm03vms3lQfGiJeigUmchX65vI8O8B+BHxeNyax
 qzBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506139; x=1656592539; bh=wv8B8IfW0EOBl
 6yuA8VBDbNPJpoo7CvIqlUjZkho9Uc=; b=feONXYQCjinR/luqdMcYTaArqrPP8
 eRpCVfjTf+LydUDVmHhf5lvoZAkftVG+T7Rm7lc7oXBXP1/qg+2F83/Y+msO3GNC
 Dn2rL2uxH/UVCf+pZaQUDHa6BA0UJLAyrC/VNhFokz5GfUML4cgD4Z0Xi6GvhxIY
 07JW/Yw4e/bA2r5+hjrXApRCYh1NTmbNeJICbXiMpBMVbX+ZqFcvlHt7jtXH1/aU
 bUgrYxr7gReqQkHxl1ggBBzX5Ip/dFr5bLe34jehCOq7aN2rl6jAXbCt92s1dC/I
 S8CETMBgkwSOdIbrRx+dTb72uImKYREJ63ApXdzb5Uq5+3avJw1ZgsJzw==
X-ME-Sender: <xms:Gke8YpMxa_69JXL2ClG60OkRYtMIH1lnJbh57aXerO9Ll7gDo52iFw>
 <xme:Gke8Yr9JqBeOASjGlNNNaPkTsw5cwdfUTdhwmmzkE5IZWtJ4651C7uffoeh8I7f4v
 Yqmsr_544VxlgWMQsA>
X-ME-Received: <xmr:Gke8YoRYXdqbQ_t8nIod_40LKCdLzIsNDuoksYibDSt53eBw7eGhdoMKFuIc2pZYbjQd1ZW85kNYppw-l2_qfoGpLS3hFX4-hdY9_NM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:G0e8Ylu02C1XydF-JZapTmPT293qwIzkFI5AQz20wPP7wo4lrVow9w>
 <xmx:G0e8YhdRdqGULlg_Q1TN9W8JRV-NWiaIsJnuRvrIxtNCpp6YTUxA7Q>
 <xmx:G0e8Yh3NVUBSzc8QLs2jdwsl1-2TAQ_MFlvZY1dt42nWf3-mxiXLeg>
 <xmx:G0e8Yo6gq7h8Tn9Rkr9SACdRX4HWofdS6hY86ULAOGEbmqORZj0soQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:35:38 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 08/71] drm/connector: Check for destroy implementation
Date: Wed, 29 Jun 2022 14:34:07 +0200
Message-Id: <20220629123510.1915022-9-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Connectors need to be cleaned up with a call to drm_connector_cleanup()
in their drm_connector_funcs.destroy implementation.

Let's check for this and complain if there's no such function.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_connector.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index d7dab4242290..855267116e68 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -347,6 +347,9 @@ int drm_connector_init(struct drm_device *dev,
 		       const struct drm_connector_funcs *funcs,
 		       int connector_type)
 {
+	if (WARN_ON(!(funcs && funcs->destroy)))
+		return -EINVAL;
+
 	return __drm_connector_init(dev, connector, funcs, connector_type, NULL);
 }
 EXPORT_SYMBOL(drm_connector_init);
@@ -377,6 +380,9 @@ int drm_connector_init_with_ddc(struct drm_device *dev,
 				int connector_type,
 				struct i2c_adapter *ddc)
 {
+	if (WARN_ON(!(funcs && funcs->destroy)))
+		return -EINVAL;
+
 	return __drm_connector_init(dev, connector, funcs, connector_type, ddc);
 }
 EXPORT_SYMBOL(drm_connector_init_with_ddc);
-- 
2.36.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B30546224
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:29:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0B89113E8B;
	Fri, 10 Jun 2022 09:29:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A3B113E8B
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:29:45 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id C43725C01A5;
 Fri, 10 Jun 2022 05:29:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 10 Jun 2022 05:29:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853384; x=1654939784; bh=hY
 1j3K0vuStY0Qd3UHDId3KTQ1Q9uFreSge1oGwIB18=; b=0H7Wrj+d2+m4L73Qk9
 /Sx7Q/7oo9ofiI0ipobr/xtEC3v+rlYPh0tF1iSfQHuLTabkrk8MyCd1zucPPRSw
 thE3Br+04Tm3Ut1E3hcjtOKWXbarCszjoY+VMpBFpLDxbysn9O4T0fICdn6vtTpB
 X1M0Jt0iCqI/FrMs7kqNbIoltr0ioZ3kzO+KYI7thtuAJmg6cw5oLC61WdoAqLxT
 o93VrHmgNT1OVjHtxNLZH4WxfSu+1dGeRFPsQ4OInbAezyASxMX9vmXwabdoW/4C
 2A54S1YplmJo1Yzo38Yum5C1codIY07GzJzVrprZnFAH2ObvndiiGwHPKTR33dvu
 3QjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853384; x=1654939784; bh=hY1j3K0vuStY0
 Qd3UHDId3KTQ1Q9uFreSge1oGwIB18=; b=h6Gi+ltzYFHdDH6uuBpo0nuNo4VJP
 DiDYauYk59oM9+6hTIXvKqFXpY19rjgn5/UU2Z1BYt/VoUII864m32jw0W/TKpU5
 iujQ231sRW6KQX/uXEv4K1xT2vYjmc5VysG18+9FviViihpkIOG17UDQJbffsfGx
 EIgNHwJBmkKRYn0J8Gbx4ndKbZD6RVguDGjUeey6SYwgOVcnIyJe1L+yerKbaPoN
 WqFvbYhO2lirqt4rNVy5F9lUi5rPq4JmladyJ/P6tfKCxMT9oKwBZxTZ4vbzXeXW
 sAKaF+21S+t8YBpqMXLW/eMRl6iQzghsuAMtxiq+/WEJC4UdOCPOjEndg==
X-ME-Sender: <xms:CA-jYqKVJA5vzpVh34ahhM42tAt4w5JajHzwrjjWDXAJQgQKh5zLxA>
 <xme:CA-jYiJeUZktfbrIuip8pIkm84hWsfm3mH4UjCZeP6gqgCO8grFwYC6H8N-A_AybN
 gI2O9oiVrnm6eqEv30>
X-ME-Received: <xmr:CA-jYqv475w6VjzjOk9ZuLL2vuE353tSHB09IIsqSX1BjCyZD08VOY4Y6pTDT42pPOkKVtkVH5taJglhTm1nA4kUj_O6LZdZTnq_jkg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:CA-jYvbuHTiWx0eaTW8UCZflJBspC1zhw9WVGyVDd1KzMwQxnRnW8Q>
 <xmx:CA-jYhaHe6Roup8SU4qT3gMU1O5B3aO1sgwUJxql9jGJ4LyzbtX-Kw>
 <xmx:CA-jYrDkJCGvvBZNjPsgMJC-aaMAEYKdbwZaFGcmuk6xwHTp-VmABw>
 <xmx:CA-jYgX4Y6kd7H4k-uCK3FdP6cwR9b1Xz0vplF3We1PbiX3_wanxsQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:29:44 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 09/64] drm/simple: Introduce drmm_simple_encoder_init
Date: Fri, 10 Jun 2022 11:28:29 +0200
Message-Id: <20220610092924.754942-10-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610092924.754942-1-maxime@cerno.tech>
References: <20220610092924.754942-1-maxime@cerno.tech>
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

The DRM-managed function to register an encoder is
drmm_simple_encoder_alloc() and its variants, which will allocate the
underlying structure and initialisation the encoder.

However, we might want to separate the structure creation and the encoder
initialisation, for example if the structure is shared across multiple DRM
entities, for example an encoder and a connector.

Let's create an helper to only initialise an encoder that would be passed
as an argument.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_simple_kms_helper.c | 46 +++++++++++++++++++++++--
 include/drm/drm_simple_kms_helper.h     |  3 ++
 2 files changed, 46 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
index 72989ed1baba..876870dd98e5 100644
--- a/drivers/gpu/drm/drm_simple_kms_helper.c
+++ b/drivers/gpu/drm/drm_simple_kms_helper.c
@@ -58,9 +58,10 @@ static const struct drm_encoder_funcs drm_simple_encoder_funcs_cleanup = {
  * stored in the device structure. Free the encoder's memory as part of
  * the device release function.
  *
- * Note: consider using drmm_simple_encoder_alloc() instead of
- * drm_simple_encoder_init() to let the DRM managed resource infrastructure
- * take care of cleanup and deallocation.
+ * Note: consider using drmm_simple_encoder_alloc() or
+ * drmm_simple_encoder_init() instead of drm_simple_encoder_init() to
+ * let the DRM managed resource infrastructure take care of cleanup and
+ * deallocation.
  *
  * Returns:
  * Zero on success, error code on failure.
@@ -75,6 +76,45 @@ int drm_simple_encoder_init(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_simple_encoder_init);
 
+static void drmm_simple_encoder_cleanup(struct drm_device *dev, void *ptr)
+{
+	struct drm_encoder *encoder = ptr;
+
+	drm_encoder_cleanup(encoder);
+}
+
+/**
+ * drmm_simple_encoder_init - Initialize a preallocated encoder with
+ *                            basic functionality.
+ * @dev: drm device
+ * @encoder: the encoder to initialize
+ * @encoder_type: user visible type of the encoder
+ *
+ * Initialises a preallocated encoder that has no further functionality.
+ * Settings for possible CRTC and clones are left to their initial
+ * values. The encoder will be cleaned up automatically using a
+ * DRM-managed action.
+ *
+ * The structure containing the encoder's memory should be allocated
+ * using drmm_kzalloc().
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int drmm_simple_encoder_init(struct drm_device *dev,
+			     struct drm_encoder *encoder,
+			     int encoder_type)
+{
+	int ret;
+
+	ret = drm_encoder_init(dev, encoder, NULL, encoder_type, NULL);
+	if (ret)
+		return ret;
+
+	return drmm_add_action_or_reset(dev, drmm_simple_encoder_cleanup, encoder);
+}
+EXPORT_SYMBOL(drmm_simple_encoder_init);
+
 void *__drmm_simple_encoder_alloc(struct drm_device *dev, size_t size,
 				  size_t offset, int encoder_type)
 {
diff --git a/include/drm/drm_simple_kms_helper.h b/include/drm/drm_simple_kms_helper.h
index 0b3647e614dd..20456f4712f0 100644
--- a/include/drm/drm_simple_kms_helper.h
+++ b/include/drm/drm_simple_kms_helper.h
@@ -241,6 +241,9 @@ int drm_simple_display_pipe_init(struct drm_device *dev,
 int drm_simple_encoder_init(struct drm_device *dev,
 			    struct drm_encoder *encoder,
 			    int encoder_type);
+int drmm_simple_encoder_init(struct drm_device *dev,
+			     struct drm_encoder *encoder,
+			     int encoder_type);
 
 void *__drmm_simple_encoder_alloc(struct drm_device *dev, size_t size,
 				  size_t offset, int encoder_type);
-- 
2.36.1


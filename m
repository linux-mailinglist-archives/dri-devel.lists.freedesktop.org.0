Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E87F254621C
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B9A1122D4;
	Fri, 10 Jun 2022 09:29:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C7C1122C2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:29:34 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 17CB25C01A4;
 Fri, 10 Jun 2022 05:29:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 10 Jun 2022 05:29:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853374; x=1654939774; bh=eV
 lTRq+CSagFJdn5g9ShAViiQjBhVah36/Y3ttxxhyI=; b=IkFmMt7a77nRkKbLcI
 MJZ/U7IRxA8dkVVmt00LILuoFZIQrrOPy6mVz4tAWWprl5Si8A8JFwdQgoT0RzP6
 WGLXvX4CAOKw0Ptvp/yH3p0awGIfjH9XHUUqloprZgYHAckFc9fe165uQrg8XFWG
 fEi6MH3WNkuUUSkSJK1W5JWfeco35GcWccTqbPKEpLm+Nj5XX8NZMsgbz288MbIX
 M17MpqrptTXF8BG6dTROR1DyP6zSIt1H3d9NjlKtRZKn2Z3MWoZSpGHp37Vs3VaV
 2iy2UyFq3DOSTjYkDNKPZFvUVcQTmHWV7svCrPwvCO/P2Hkjre+cqTUGcbJ8+f8B
 294Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853374; x=1654939774; bh=eVlTRq+CSagFJ
 dn5g9ShAViiQjBhVah36/Y3ttxxhyI=; b=i0W44vCocwuyfFQmjq/KuCWIIPifL
 mPNV7qXeRpLiMzqDf3yXBS5KyZxKVwkSLNqJ8PhScNUPwYKe6hxndH3ilXS4M0jI
 e8ZjXkaUOioh1kRONMJ30lLzpPddRIWyzw2LJz+Q6lSaJ/RLjivTh88os5JMpq7W
 dIaQlP/EIeXYCd3NWdAnpxpZRz1tA80B/aIUx/4G8BHhB4DL7YgNKfGvW1yihbR+
 l6ntHD7IUtBnaPzPUqFqL8ouw4OU7KsQdsUlOjJyYM9umyudXnkw5R3qS5G6VWBb
 wkcazOVuJliaaDo4ggYDYvCzxhPX/jvnU/hGwPRhfYdXbJeyaezpxwJfA==
X-ME-Sender: <xms:_Q6jYmzyri4PpmXEWNkqiOUCZIU0g0tcZshR7RGpXI6jUCS3IokFIQ>
 <xme:_Q6jYiRc0HnTL8UfvURLiMF1bpdfU0-IWGJAcUAvn1HORXXC_p2jPXzsB3BmUMqa0
 H1a5trWHlEG0DPF960>
X-ME-Received: <xmr:_Q6jYoXrDzGXi0ak2PvrGbYYg7GJsP4oXxB9S5blk7SXpNtHreBaF2NtYsLsl9sLime1ab0FZyhRuVZYIOMKDarfeL7vWd5QqJOAr5k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:_Q6jYsgx4OpgL_2Fmq_ko_6puhIj6rAvfM3oLGsdsr63rDAj0NDSeg>
 <xmx:_Q6jYoCm0v5dfRmR2vyAfzxZQHqZeoz_028cd5V9OA2OWKkEPLBRbg>
 <xmx:_Q6jYtKALsC7LCATiY0EgwcKDptal_lX89DQQBh8yobhzWML3vDb0g>
 <xmx:_g6jYr-TgshkBNXqm6x4Fo6JFt6MG0LONBfhM4KLUuY1cvygOCUURw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:29:33 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 03/64] drm/encoder: Introduce drmm_encoder_init
Date: Fri, 10 Jun 2022 11:28:23 +0200
Message-Id: <20220610092924.754942-4-maxime@cerno.tech>
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
drmm_encoder_alloc() and its variants, which will allocate the underlying
structure and initialisation the encoder.

However, we might want to separate the structure creation and the encoder
initialisation, for example if the structure is shared across multiple DRM
entities, for example an encoder and a connector.

Let's create an helper to only initialise an encoder that would be passed
as an argument.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_encoder.c | 48 ++++++++++++++++++++++++++++++++---
 include/drm/drm_encoder.h     |  5 ++++
 2 files changed, 50 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
index a940024c8087..4b7b82f8c6fa 100644
--- a/drivers/gpu/drm/drm_encoder.c
+++ b/drivers/gpu/drm/drm_encoder.c
@@ -148,9 +148,9 @@ static int __drm_encoder_init(struct drm_device *dev,
  * the encoder structure. The encoder structure should not be allocated with
  * devm_kzalloc().
  *
- * Note: consider using drmm_encoder_alloc() instead of drm_encoder_init() to
- * let the DRM managed resource infrastructure take care of cleanup and
- * deallocation.
+ * Note: consider using drmm_encoder_alloc() or drmm_encoder_init()
+ * instead of drm_encoder_init() to let the DRM managed resource
+ * infrastructure take care of cleanup and deallocation.
  *
  * Returns:
  * Zero on success, error code on failure.
@@ -244,6 +244,48 @@ void *__drmm_encoder_alloc(struct drm_device *dev, size_t size, size_t offset,
 }
 EXPORT_SYMBOL(__drmm_encoder_alloc);
 
+/**
+ * drmm_encoder_init - Initialize a preallocated encoder
+ * @dev: drm device
+ * @encoder: the encoder to init
+ * @funcs: callbacks for this encoder (optional)
+ * @encoder_type: user visible type of the encoder
+ * @name: printf style format string for the encoder name, or NULL for default name
+ *
+ * Initializes a preallocated encoder. Encoder should be subclassed as
+ * part of driver encoder objects. Cleanup is automatically handled
+ * through registering drm_encoder_cleanup() with drmm_add_action(). The
+ * encoder structure should be allocated with drmm_kzalloc().
+ *
+ * The @drm_encoder_funcs.destroy hook must be NULL.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int drmm_encoder_init(struct drm_device *dev, struct drm_encoder *encoder,
+		      const struct drm_encoder_funcs *funcs,
+		      int encoder_type, const char *name, ...)
+{
+	va_list ap;
+	int ret;
+
+	if (WARN_ON(funcs && funcs->destroy))
+		return -EINVAL;
+
+	va_start(ap, name);
+	ret = __drm_encoder_init(dev, encoder, funcs, encoder_type, name, ap);
+	va_end(ap);
+	if (ret)
+		return ret;
+
+	ret = drmm_add_action_or_reset(dev, drmm_encoder_alloc_release, encoder);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL(drmm_encoder_init);
+
 static struct drm_crtc *drm_encoder_get_crtc(struct drm_encoder *encoder)
 {
 	struct drm_connector *connector;
diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
index 6e91a0280f31..6713fe1804e9 100644
--- a/include/drm/drm_encoder.h
+++ b/include/drm/drm_encoder.h
@@ -194,6 +194,11 @@ int drm_encoder_init(struct drm_device *dev,
 		     const struct drm_encoder_funcs *funcs,
 		     int encoder_type, const char *name, ...);
 
+int drmm_encoder_init(struct drm_device *dev,
+		      struct drm_encoder *encoder,
+		      const struct drm_encoder_funcs *funcs,
+		      int encoder_type, const char *name, ...);
+
 __printf(6, 7)
 void *__drmm_encoder_alloc(struct drm_device *dev,
 			   size_t size, size_t offset,
-- 
2.36.1


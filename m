Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1F655FFED
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7283C12B224;
	Wed, 29 Jun 2022 12:35:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D2D12B004
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:35:32 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id BF84F320091B;
 Wed, 29 Jun 2022 08:35:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 29 Jun 2022 08:35:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506130; x=1656592530; bh=H0
 KY7i+xTPVywKFp72ObfPG54eM38HUpWzBdewfA9K4=; b=0d9Ug4CN7KiMkVka5s
 EiRA8tQgGcamTKvdGSgq8I7Vz8/OQDqzZj0A1ev8EavMcOzwS1km5Pj7S/XdyDEi
 51z6DK9+QE/+UGzIYlGCeIhH8fkJmR2UQGg5GDymxKTI+Z2J852ba1eCpmIpq1YT
 xTIXXUvwZeeE/x3jigZgfxJys13LVxy45lZucPfswXgLngHek6+7meJMQh0AjhNT
 eMkpJkD5N9etUMpNWaHwRrUF1ZPywP2IDGK9tHjLanzv+4HrbxFrLA6WedH8BKrV
 yFmNcYzSi5UfshvY2BIsBr8Vx66zgatYBwSQqiINkDoQTb4Fvc7Kp/WqeNlF+N85
 K4hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506130; x=1656592530; bh=H0KY7i+xTPVyw
 KFp72ObfPG54eM38HUpWzBdewfA9K4=; b=iS7oUOVf/Q9D+nVaWnLS7i/Cm3D69
 5OUNunrU2ZlChbcBW1Rv160Rxjr2aX2UZS5VrjnA2uH1Vykw6HegVdO9A899njM0
 PykBhn3/se1aNzJnglFAIqFGT4xInmlnlqkbxnjnwQArerDSpKx0Px6vlhWJjfDv
 5OWwqEqIx6xSkRmkBFVPeFKFkcxjVDN3IvCMwWxeJkOa5w6zO3GdFAkA9WEAPw7U
 Q/vyp6ewrpN4F0OWOIgtm2xyBF+GVc13e1EHomScHR8PZBqG77vmUtICYaXZfFSQ
 5WL2aLQdiFYHklgU4vAkMiPGdEku5uuOKuOQlE+Y9kNJQ+huD/1EL6BwA==
X-ME-Sender: <xms:Eke8YkvM86dQ1-yOvrv8bHWba8pC61OTQ3id1IWPq74xfWCNL0ceFg>
 <xme:Eke8Yhd6czOcKADOYxBiIzGAEUwTdR_baOWIAFF0w4jtLGeJsXyHjwUx1H58qCh6M
 NbwtjOslRBf_abJHDM>
X-ME-Received: <xmr:Eke8Yvz9bx6QxsIdksQovXeBgFXXi2dsQgFpdlk6CmuvwM15d-Mj6YS2gYCEuqmR1RWejv1aw7dMvuuDQro1tEPWIFb0GT2OEuvf4bk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Eke8YnP4EoWTJxxjQQrTLX8NYCciOVsxCLTfVwG_6pLl2k0ohH5yJg>
 <xmx:Eke8Yk_fkrS3idr7vCdrNz-X62Hc6oqDiv78yBafGy4ZLs_HkjSFPw>
 <xmx:Eke8YvWq5LYy-qQMVfCce-7EMlbxAZ8f2Peo_rViHsahYtVz4pfZ0Q>
 <xmx:Eke8YjlvPl3AI5HTfJCGmqfkR9LHkaTq7UFdDak-TBsDrjzHmWIlCw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:35:29 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 05/71] drm/connector: Mention the cleanup after
 drm_connector_init
Date: Wed, 29 Jun 2022 14:34:04 +0200
Message-Id: <20220629123510.1915022-6-maxime@cerno.tech>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Unlike encoders and CRTCs, the drm_connector_init() and
drm_connector_init_with_ddc() don't mention how the cleanup is supposed to
be done. Let's add it.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_connector.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 77c33662b436..c8f23a3d9b03 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -223,6 +223,10 @@ void drm_connector_free_work_fn(struct work_struct *work)
  * Initialises a preallocated connector. Connectors should be
  * subclassed as part of driver connector objects.
  *
+ * At driver unload time the driver's &drm_connector_funcs.destroy hook
+ * should call drm_connector_cleanup() and free the connector structure.
+ * The connector structure should not be allocated with devm_kzalloc().
+ *
  * Returns:
  * Zero on success, error code on failure.
  */
@@ -346,6 +350,10 @@ EXPORT_SYMBOL(drm_connector_init);
  * Initialises a preallocated connector. Connectors should be
  * subclassed as part of driver connector objects.
  *
+ * At driver unload time the driver's &drm_connector_funcs.destroy hook
+ * should call drm_connector_cleanup() and free the connector structure.
+ * The connector structure should not be allocated with devm_kzalloc().
+ *
  * Ensures that the ddc field of the connector is correctly set.
  *
  * Returns:
-- 
2.36.1


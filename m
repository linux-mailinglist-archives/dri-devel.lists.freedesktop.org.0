Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF5055FFEB
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:35:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3CB12B0BD;
	Wed, 29 Jun 2022 12:35:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 101A912B06F
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:35:35 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id C2429320094C;
 Wed, 29 Jun 2022 08:35:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 29 Jun 2022 08:35:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506133; x=1656592533; bh=wj
 lvZmJclFoRLg2cDmW2YeGIe+bjBeTTtJmHvwtS3hY=; b=jJbwepy+DqKEYyzpIT
 XHsdlNaXqoSGb5um6jH6GGU8JaRdJnXFTOxNcc3msNtDiejdfFCvLy6XKF7eC7Og
 rn1i+fCFbMIJfholHc+BtcJUoSQRx9f167FRnRICgr3nOWbNN8E61Z/3k6HQ2cEK
 OHo9P40wIGpp0BKMgy5iyQNItxxWbvKBi3cTIXo4Yg6AmrwOC/HZwleDAAJlZDRs
 FgP4SXiEnvLv0dHkF25E0gzGOHqnC3PcJUhMNPeP/N/mJJ7nK1q6J0ZO8nwVlMga
 BH41a3HfT2ekMbXv0Z/CAy55sXzXi7jvhcMNvelEov8OzXnptOgGEpAQfapXyYeE
 8IAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506133; x=1656592533; bh=wjlvZmJclFoRL
 g2cDmW2YeGIe+bjBeTTtJmHvwtS3hY=; b=oqxwbD/F4qeppvid4RpegTjvKC+S4
 S6lCl/67wAstApBNR9uFzX/gbbC4iRa9bjnd5rFFQ2fatjSKBdsY3nPgLmLifX6m
 bxZZIhoV5U+dcm4IRI6Dgaq8PF/aQ80rBGHjOsNnuz29M2+SqOW/zOHYfG+vIcF3
 L86Y+zgzLjerXxoLSO0K6lEYDsZWjcLYseJ+1ffwxUmr8cuElWlsfdMZU+PweS5Q
 Y4tudrnGfanKZw3Sq/YHINHhvPXhtC49rSEcWB008x8Yt+ku2eRt1R4CiR30D6zT
 FZGkfPfZlbB+OKapyayXM4lCGC55khVCMrcaepIOeE3xQJuvYZVVYDwGA==
X-ME-Sender: <xms:FUe8YriKWxG_C-WL0NnS_P4948MMt8gCSLvu4d9zvLCdpPHM2HH_aw>
 <xme:FUe8YoB8MVzKFPoMOO-_Lczru7n_zPdrd3HIM2M9vevIrVDdX_P5YLHAKXzbXyo9t
 6UV7JtKe4iijd54ros>
X-ME-Received: <xmr:FUe8YrFaTXSu6ELkKyYaTKxz2dXQdrRRlmV31etCVxaOJlAuSYFFdl_X2qrWwXMHOrQqEoHq6GwKJtGMvRXgqaocyXxPmrAt1IJVdn4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:FUe8YoQPemJvgQ-Qyap5JfL0M7-TthKWPapxW31PrflSWP94TyVvbw>
 <xmx:FUe8Yoz33JmwoXCv4itLO-lqAvnKrBWHkd81rnISKETByAq2mfWsOw>
 <xmx:FUe8Yu7Kcyflma7OyXM0XzSsluBl-CP9VToqNi_F7A_xsVt9NGpzVA>
 <xmx:FUe8Ynqpb0QTwXOnaT61xoBa-k9CBzYuudX_dsRgm70zJrhWYzr6BQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:35:32 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 06/71] drm/connector: Clarify when drm_connector_unregister
 is needed
Date: Wed, 29 Jun 2022 14:34:05 +0200
Message-Id: <20220629123510.1915022-7-maxime@cerno.tech>
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

The current documentation for drm_connector_unregister() mentions that
it's needed for connectors that have been registered through
drm_dev_register().

However, this was a typo and was meant to be drm_connector_register(),
which only applies to connectors registered after drm_dev_register() has
been called.

In addition, it was also mentioning that connectors are unregistered
automatically when drm_dev_unregister() is called. This part is a bit
misleading, since it might make it appear that
drm_connector_unregister() applies either to all connectors, or none of
them.

After discussing it with Daniel, it appears that we always need to call
drm_connector_unregister() on connectors that have been registered with
drm_connector_register(), but only those.

drm_connector_init() already mentions that it only needs
drm_connector_cleanup(), so let's clarify the drm_connector_register()
and drm_connector_unregister() documentation to point at each other, and
remove the misleading part about drm_dev_unregister().

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_connector.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index c8f23a3d9b03..327e8cc076ad 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -524,6 +524,9 @@ EXPORT_SYMBOL(drm_connector_cleanup);
  * e.g. DP MST connectors. All other connectors will be registered automatically
  * when calling drm_dev_register().
  *
+ * When the connector is no longer available, callers must call
+ * drm_connector_unregister().
+ *
  * Returns:
  * Zero on success, error code on failure.
  */
@@ -580,9 +583,8 @@ EXPORT_SYMBOL(drm_connector_register);
  * @connector: the connector to unregister
  *
  * Unregister userspace interfaces for a connector. Only call this for
- * connectors which have registered explicitly by calling drm_dev_register(),
- * since connectors are unregistered automatically when drm_dev_unregister() is
- * called.
+ * connectors which have been registered explicitly by calling
+ * drm_connector_register().
  */
 void drm_connector_unregister(struct drm_connector *connector)
 {
-- 
2.36.1


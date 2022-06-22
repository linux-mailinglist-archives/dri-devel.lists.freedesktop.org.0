Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0391554D1A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:32:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E6601123C6;
	Wed, 22 Jun 2022 14:32:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D4A1123CE
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:32:32 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 8E343320090E;
 Wed, 22 Jun 2022 10:32:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 22 Jun 2022 10:32:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908351; x=1655994751; bh=Ap
 ADr6udxfVbbIuJ9jHo5Or6X160AvsQoECS97UrOM0=; b=QnNPRvhBWHDzmKwz9P
 VzZ9hpeIwA/u+0NUt+n+PCK68lttZV6vQ3Tvcocj/+110anW+LYBDwEvKbSWXoVf
 tkv20BJc+PIetABLs/5FLrJJmlet1ADln+T42TSuLfVXeZ6W6geycfzO7d4fazkG
 UC8Vjci7DGAyk2gUA1e+L7aRIwKTBzsszB3aSytjbzqt3uh7yxQ5b1bRuQxQFTl4
 mf46EmDRsNgFh1nh8jLj1IsEnjCtXrZSACWP5H8vsfBZh2ciQP4j1vGCzUS3Jg4W
 17K2vN/HyHiTEkedrHGN34DIVwvZxlwV7+fFAiTPgRQOcpWh83TKB4/uuHsbkHkg
 VpVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908351; x=1655994751; bh=ApADr6udxfVbb
 IuJ9jHo5Or6X160AvsQoECS97UrOM0=; b=YjvyZRyXlvdXW/7ltZjkhh5btnJPv
 +5loYpQm6OCJJETXFMffW6UX5xRa/HZA6AbpZaCUP8cKxeoHU7S1ZvJ2uGn+2AD5
 OKmb7BC7P+U6LvvDZx3JMPE7x5k3gQHe7Q4Qc58xLIuYX9/wpoV/XUnDgyGcJors
 LHAGjzYqAl4pqNdlCJgdjELIbyw8PQC+IYRiTiacDYPAtvTFo5PUtR8oYO/miWbV
 OQ0d5UATlO3C5uGjE4IetUGnHz75EKk6urXQlUwJJgiB6yp/AODQTyMYqdil+rUt
 SBHClq2nS1Fj+Loetq7emkJ7nKUnAbfWTZkLUwEJllrV4F26+IlZcderQ==
X-ME-Sender: <xms:_iezYlDLPancM6z5eR9JYww_heR3Fidmvt3CSWf8n7HF94VBJKzVKA>
 <xme:_iezYjiNr6lFqMeMTKFWTA2CGml3dUkr7yIhw7JPcRBUvdqXWybdDzzxaGhZWZ1pE
 EiF8gdPGLNKFTXyDuQ>
X-ME-Received: <xmr:_iezYgnJn69qHdnNZvQAmY5ol_z8wJX874NNXKdnpJUBQfl9lYWeOOzRXhAbreA-dvGdQbwaq9w2SjjZ8xrm1rx2SpIDC100cQ9P6No>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:_yezYvwa1rz42ENCBQQRwSWhozyYurUmnvDO5nW4bJn8B80e-C-yGw>
 <xmx:_yezYqSp-2ck0UxQHpfsOJoJCIpFDBiLSsquulOwiiV4OiMgmhtzsg>
 <xmx:_yezYiYvp3zvVt7N8KjB7XdXT9s6KxPfc4V2THil7ItK4Ae78Y5q3A>
 <xmx:_yezYgM65zqJk-GmC2iV0t1UZo942FlRfkzQ7IVN9uPjPzqe9OxSqA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:32:30 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 05/68] drm/connector: Mention the cleanup after
 drm_connector_init
Date: Wed, 22 Jun 2022 16:31:06 +0200
Message-Id: <20220622143209.600298-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622143209.600298-1-maxime@cerno.tech>
References: <20220622143209.600298-1-maxime@cerno.tech>
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

Unlike encoders and CRTCs, the drm_connector_init() and
drm_connector_init_with_ddc() don't mention how the cleanup is supposed to
be done. Let's add it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_connector.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 353d83ae09d3..f0c4665caf38 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -222,6 +222,10 @@ void drm_connector_free_work_fn(struct work_struct *work)
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
@@ -345,6 +349,10 @@ EXPORT_SYMBOL(drm_connector_init);
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


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA3F554D1D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:32:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4496C11253E;
	Wed, 22 Jun 2022 14:32:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE7E11246F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:32:36 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 92A62320090E;
 Wed, 22 Jun 2022 10:32:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 22 Jun 2022 10:32:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908354; x=1655994754; bh=c0
 0+tQ4+cO4Tgp0f3qVwm7W2QCOSFpwW3TMV4/tV8Tg=; b=aXQWU1QgGHX59DGQvf
 R8Oia6MTwrGPvDOdoBZM79hl9rvm9++LIi51IG98j2tn5umr4z5OKSZDx7362GB1
 N/b3Sor2YTxN5D+V7ncrgWPLKW7o7ULbA/UZfMfjbMqOdzXIezX+GoSMtbSfaaf0
 cD4mBYF/fMb5Mq5J3Mu8roacH1jAR3j0oj2ANswEN84FoBjshmapCeTXIyB6/Ooe
 c15nKfEpAeD5u4hE+xXAPM+kTOPLJy22K9OkFU3zZxJiWFU1+vEElLgfgDxfPJhe
 NKhYhxkY+gc4Qhi4HNeD+GBspMvGRu1hARX0/wvJVDrQ1Mrf+1s6ObH4d7MSbdXZ
 7u1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908354; x=1655994754; bh=c00+tQ4+cO4Tg
 p0f3qVwm7W2QCOSFpwW3TMV4/tV8Tg=; b=M7vZ1SfU3AKIHoA/sP8WcdUoub2J7
 6ah2XLD6UERnUn3Mv4Xg1BdL43+GLg7rdeAN8rviccw1M9doOAcw0aylSRVoZAVd
 Xm20/zjmz9FjsBwz0o1Hv06eYDDUPyOeQXlo7Y4c+O5P7HxH6EEuhjpar1Vpseq3
 2qgDQarqkmkETPynq6Ptfw33SHOfPBcVYJSiOwWSRo+OPsUo178BHsl7YNKRaMM+
 t/8vSmFtczLzy3+YM/LFINCIS3xiv5YQl4f8qs6v6TqiITsEQnJlhTVKTQFVl4Kq
 LWJEMvddW6yyyhI8otJxwsH9ie4M62geL/taomHhWCckGA+Vzp1BideAw==
X-ME-Sender: <xms:ASizYj61NwlN64M5v_guja2rsWM5rLJSKShdmfXwtzYCRztIfxGC0g>
 <xme:ASizYo77qxrRTBr7kVPURHOVu0SSibeZ4h5lI47rWWrWn8733hVnbwA96i5cVXrvs
 2X3YEZwJ_uqc7xC55U>
X-ME-Received: <xmr:ASizYqcHhOHYT7lZmPtY6fzJjMVfBUbxeXBMK3A7Lq7TzIQvTOlqjZtRzpEMMl3sMRHzhapo0PoybOvyqpojaMvN5uZX894ueFXGADg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ASizYkK47sggGDssMM2-9QLWRCjC46W3LreA2WHB1A5SwDwhsPhZ_A>
 <xmx:ASizYnKES1zouWjDe0YSIQl9GB46EbaEkZOJ1fAuteQVKu8ILmvdxA>
 <xmx:ASizYtxsJJuFbKtotG09RWA3ZC2FvjTn8pPF0RPQ-HfARLvplWH0Cg>
 <xmx:AiizYkGWB33S-PNCqDBh7T9f_DTIgs1Ezx9Z_mnC0DJ_BatePH7jMA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:32:33 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 06/68] drm/connector: Clarify when drm_connector_unregister
 is needed
Date: Wed, 22 Jun 2022 16:31:07 +0200
Message-Id: <20220622143209.600298-7-maxime@cerno.tech>
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_connector.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index f0c4665caf38..b9f22cc4ee67 100644
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


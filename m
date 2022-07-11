Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D88570905
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:40:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF62D902EB;
	Mon, 11 Jul 2022 17:40:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A858EF04
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:39:54 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 564155C014E;
 Mon, 11 Jul 2022 13:39:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 11 Jul 2022 13:39:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561194; x=1657647594; bh=fz
 hQuSz1VA0xvaifqzF95Yn7nUxp5MSClv+c6MvnBzk=; b=Z5P3m8y5pdUl0jutzc
 ZKhi8zhELAsNXhkZsZsSAuboLsye1z9myzTMuZkbP5w2+LQDfdXBqaz/KN0GRM3q
 VZEvbvDvAHMBNaOkpE0L6qXrmCSCdn2jxhp2bpugLtllW5HhzQyxv2DZ54RV0P/t
 zayNLLtuOUhTpbU+PIXxT74IlctJAyXBkg9mNIUBjs4+wR+0QAdUwTyCPdQAAOdB
 XKevxhjAJP+KovoFdXwqO6YRsYSSaKrezOwGGohRnZpcv1C+JLnvgZhlt5u01dYQ
 QReME3k2zLif9xzUHpXPvuzqLCjJq8L6BlPFVVY460hcYyImmexv83SgYvdm2f+i
 z8KQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561194; x=1657647594; bh=fzhQuSz1VA0xv
 aifqzF95Yn7nUxp5MSClv+c6MvnBzk=; b=Q6H9ZD6E7FuY5UlCpIh0HZ5iXKqwK
 uv1gqRsX0RnyOUfgAreizKBFqsjcST9P6Bibf6QYbWOhl7v9DeecNZsplBYctBmL
 3UZ6tpl5du+3m3ffwxVO/UTJJ+zk82gcfHMu+dIfX8LYkkW+pHUe/9fD2iTd40pb
 FqNotfHt9EGvJg9pOVg9urbQj+7LrnUXsWW5mychuBbkhGnWlH4Z743PRu1zeE5Z
 NpNAcaEoWRd7DT843Xo54/iVugtT+h012EdvaY07E9eRU5bpIjE3TUZSbEZyeyoy
 Qol+DDqLm86g5tHxeCk4DnlwTIyaN9yRaiREDXlaQ6PuVti9rC/e9KJNw==
X-ME-Sender: <xms:aWDMYmUOBumM7ESPiiN0dP44nwKArsxzdedaYEIcsrMZ5-OfGqbd3g>
 <xme:aWDMYin7lMuGVKH1d7TK_uo4sK7fCTFcy-IrAXhjb6MlfUltF-f3PyHIjjAEPz4Uz
 2HAsmttK4NROtnR0Xs>
X-ME-Received: <xmr:aWDMYqYeQpejKllapEVn03t3AKfijtT4v3oQYqZk-rCJ6Ub3ybC_nMmLAK1P5b80I_rX4bP6RunoQi_lSJDl1m_RD0oiT-eOrNBX_Cw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:aWDMYtWcm0j38hpREju6VsfnO61lZy9423g44j_9B0a6FRC4WO7-mw>
 <xmx:aWDMYgnpyD-27akpa5P7JkFUiUP0fUuqJUI52aLDuxav_br1uamlpg>
 <xmx:aWDMYifrG83G4MdWB2gxA20Hzae54iM0Jh_bkfB_rVTrNdjxYmfPBQ>
 <xmx:amDMYvuFZTVoyJopB6g_0tHLmOMcZekXrnz2M4V37p7MLLhlBuf-Aw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:39:53 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 06/69] drm/connector: Clarify when drm_connector_unregister
 is needed
Date: Mon, 11 Jul 2022 19:38:36 +0200
Message-Id: <20220711173939.1132294-7-maxime@cerno.tech>
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
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_connector.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 5e98e8651780..8818fd8fba88 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -525,6 +525,9 @@ EXPORT_SYMBOL(drm_connector_cleanup);
  * e.g. DP MST connectors. All other connectors will be registered automatically
  * when calling drm_dev_register().
  *
+ * When the connector is no longer available, callers must call
+ * drm_connector_unregister().
+ *
  * Returns:
  * Zero on success, error code on failure.
  */
@@ -581,9 +584,8 @@ EXPORT_SYMBOL(drm_connector_register);
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


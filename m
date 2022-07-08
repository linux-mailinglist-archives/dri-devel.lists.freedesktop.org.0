Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A59C056B60E
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 11:57:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF63F113808;
	Fri,  8 Jul 2022 09:57:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB361113803
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:57:28 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id A7602320031A;
 Fri,  8 Jul 2022 05:57:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 08 Jul 2022 05:57:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274247; x=1657360647; bh=fz
 hQuSz1VA0xvaifqzF95Yn7nUxp5MSClv+c6MvnBzk=; b=BELHPz07FbCBZXa+FS
 Nb5kQtCT2CBz1ld0B3uDlSGwx4ODEoil64zGSPKmol/POM/dC7jf3vJ/BszNi3Nd
 reP69Ni4GcqkaXNtQ/kyQI1ImX5ccJxEBji6ZQIBsfpclUh3hlKHHI+j63OE13EZ
 cG5Ax8gWFrtpnReIWlCo4TUgsdWorXPWfMHH/6M0qwq6NEZUbGcWFFgyCJPrTfub
 XJbo+ULNLJZsjeLXaGwfaOnJeulz31EgmGuOhJiw1oAxuj/tMZ+02zhyq1FzNSlD
 EhN0hTqirPKI+T2Pcd6yMhJv21swE7O20Z8sMxtcjPi6dvnOBIU8o2angvfp66h/
 3Rwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274247; x=1657360647; bh=fzhQuSz1VA0xv
 aifqzF95Yn7nUxp5MSClv+c6MvnBzk=; b=ZInsalaIjhcjwzqhpLK75UOM/Yl4c
 rPp1fxV9qkk3MYTI5Shhm/L9YbqCgpldQF7KZv8Qqau0uhaF2BvvA7M1DxWkcSwe
 HX7FYefOYT9FRfpH92gd+wqV2iEZ7cAtZ/hib3R0fMZdaS8q8oc74N9x/Zw9RJks
 I7d4Zcx863wk1b3u7Bxa7vg5dEKhpNlTZ0Bf/0Uq0mD4Rx0XHdUC/83F4bUG4E5h
 65j7nWLJeqP5ULHGWhyO+vvO9sYV3N1qWzJCIeAd1XVRUnf8GWM3N54gr8pkCXoD
 UA6E+IGcK94lmfE0FwFeC4sIQ14+2YT2cbARn2g0bcwGSSkJUqIzeTIdg==
X-ME-Sender: <xms:hv_HYqvWQFdvff4rWj_jfHVvmhCvaZwWLfc0uCpszv1kaPN5cFJ60w>
 <xme:hv_HYvckE98c2toKrbV_KaPRtNuaK3W4tO3XTmNUzAzAcb2f1ySHnjh6QvJFGFkvJ
 oVQ1AmLLWFh6LoqnSw>
X-ME-Received: <xmr:hv_HYlz_cGsRjytyluEM_MCx_d1HFKUw4lvdLSBen0sQLo5d3EIjGTjfs6l8_YS7X3tUD7yip9vbwSHLsMgK5_9Z22ti7uM3pgUoP5s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:hv_HYlPOPLqn76DQcnWAApDlVw93L2FdIS_fp8mgzxUs2V34PMVeog>
 <xmx:hv_HYq8vClgtislcHY-hVVUFJMlIAWCYYBwR4cqydV8kSXgEKXnd0A>
 <xmx:hv_HYtUjaNsxkW_sYoHiwCl73feFrl-A2bbUZi1RPWoelW3cWcAM4w>
 <xmx:h__HYhlfBlEnc9e1oDvzc6y27DaYNyiXgKBubf8UpHxDneeRfrPHGw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:57:26 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 06/69] drm/connector: Clarify when drm_connector_unregister
 is needed
Date: Fri,  8 Jul 2022 11:56:04 +0200
Message-Id: <20220708095707.257937-7-maxime@cerno.tech>
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


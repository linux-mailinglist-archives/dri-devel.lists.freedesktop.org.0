Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E0156B60D
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 11:57:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6AD71137F2;
	Fri,  8 Jul 2022 09:57:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 456AC1137EC
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:57:25 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 084C2320031A;
 Fri,  8 Jul 2022 05:57:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 08 Jul 2022 05:57:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274243; x=1657360643; bh=b2
 lACX3ORsYJ4KkIo/kn7agTOHjUIzWNHeNEP8gyFGY=; b=DBUNPhl95BnPsJhZpl
 gpVLX9Qp8BZDgr7MiUZf/uCpCXWkUZqHltuLaJ+B2lfL4an466OG0xlgzQVfUsGW
 7pzN1l5QnW2VjF7agXo86mjg49WqyYnm+O9uyWOXwYQt0XFagrZq2841uUdx038K
 oq6zSTEMhXp7bXs2ZQXelwyq59lvyevvfNmhHB8puX5RSU9XM+ysdzFCzW4HTnPx
 zh6EWwLch8enrRBWUNboBn1yhFH6F4XGbq8kV4D6YqxzNgOvxNDxM7Z9Jr0EsFxT
 WH9cWqEocU7fDwvU44LqV96QiYvMZXNNhsFD6ntF6hsTVEzPZ6hGINqpzRhOw04O
 L2Mg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274243; x=1657360643; bh=b2lACX3ORsYJ4
 KkIo/kn7agTOHjUIzWNHeNEP8gyFGY=; b=rV23RADIcWokMDdOd6nd+LG2o4KL7
 4B7GZE1R6bkbiMbkjbNFWPw/ZITmXLjbmpCqkCQ1I+f3qOTxpWy4sEnJPsyjljzU
 iSOYT+LxoevmD+nSjzoGc8MEGoVd+OB3vxAMDw8/jkOkNDkjXwfcTWkPwVK63Xfr
 d6EUNHg7CSpikcFdL6NbZZEXF6J0PYaX8zEbyauwaiHMOJq6eZTzA8AnNqp9u1CV
 00PCnohIbxrClWDLHJsF49JAIQ4NdHN7hbwxy23hweV9pcROqu3U2GkTjSloiQvv
 OqOZ8QVw3F/QL9q94AZTZTWfdrAXHTHeXY9ecZvem282uXh9WY4CXEWyg==
X-ME-Sender: <xms:g__HYkWVnJm0richgalIp0ebu-g6magZcNjm7s084ilTK_0nhKQutw>
 <xme:g__HYomoWc8dU8vQdQETEo5d-TzgOWNyFA_cg0oUiN9vtINAWIVoQDzXBc0eKJyUW
 ctRZbYnsGZlnKLC6pY>
X-ME-Received: <xmr:g__HYoYwRPqHfzPbmc1x913dhXwIXBuUaUvJ9fP5hqIhp8BrQu22Ybb-W1ngnDc0JGGozd9IGkC99pG4OxaLTlJBZjkP7agWLccESBw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:g__HYjV5DAcIo9KZZNM5qU3ekr96KZ2Ro35CzRCa9l-MnYujBXFPOw>
 <xmx:g__HYun9VCR7tStQOBS989FNZY_NBJ-Tlh0hQQb7kib-y7R3842EOg>
 <xmx:g__HYocOAnblcj0O6IJ7mj92618t0C9nnrvf_WtKIqy_5O5bGkxUVA>
 <xmx:g__HYlu0DZGLTUX25zUSMwxd75_d1wLQy7zGvs9CnHACQtHPKnfXKg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:57:22 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 05/69] drm/connector: Mention the cleanup after
 drm_connector_init
Date: Fri,  8 Jul 2022 11:56:03 +0200
Message-Id: <20220708095707.257937-6-maxime@cerno.tech>
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

Unlike encoders and CRTCs, the drm_connector_init() and
drm_connector_init_with_ddc() don't mention how the cleanup is supposed to
be done. Let's add it.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_connector.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index d64ee257330e..5e98e8651780 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -224,6 +224,10 @@ void drm_connector_free_work_fn(struct work_struct *work)
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
@@ -347,6 +351,10 @@ EXPORT_SYMBOL(drm_connector_init);
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


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3164657480E
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 11:13:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874B712BDAA;
	Thu, 14 Jul 2022 09:13:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0545C12B847
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 09:13:25 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 587F83200903;
 Thu, 14 Jul 2022 05:13:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 14 Jul 2022 05:13:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657790003; x=1657876403; bh=B8
 MmQjgvN3Kte8rKnlQUXlPSnSE9fZmKeYjsXl+OnXw=; b=r5QqIHujFCVO3M9M6R
 +wOwWwd9y+5YJAE66PzEf+j4R9WXIRLUUKFGfxlayyBDMuGjgnLL6P/slcTf7S0B
 jBNms9G6JCEOQlJGxE881Rbqo9+Up4XRDTsVSw1ISKKzsifpRj+rRzhEOEi0hPnG
 I3HLqU7UPu2UmmpvENN7A29eT81zRq4yvzQnQrwiC2SbbwV/va4NrlgW/nKDm5Dh
 Q8J/y+drxzW8eiqKiwxTdB1kjVB9Jy+T4MlK6oFhHflCBtFrGC1CYD6aDlgITkTZ
 R6fL5tOSY1NUNRd2zLYjGp7A8r14v94DFPW7R5yh2a2cXmBZ6Mk7vfun5Z09gIeY
 63Kw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657790003; x=1657876403; bh=B8MmQjgvN3Kte
 8rKnlQUXlPSnSE9fZmKeYjsXl+OnXw=; b=rGYi+WqNWVEkXQHOwGW3zVXSEYQGE
 KfKrnKc7QwuzCQ5+KjN3sCErf5QCZLEQq0gWLRRif33irK8xaBbYInRZQuxjl93g
 7TDIQZ7FaLGw77+N1SPkv5AVutL6oTycASO7layLBCzJhWX2wPRN3fRi0AwREywo
 Wb4uq3fWDnspCZSJTd3Umw5Lp0aLV6zG7wc5S3Rd9TLLcKVh2JujTZLh3hJCKKBI
 Iu0dgikAC0yUa5RCQ9xHCvggJMxB0YehildY78arAZLp+n+24Gn3TWWJOUVPCOdy
 N2aGzgt0mzQ3Xlz59FvvcSiKzNvZCWlSfCkoBGvUjLbFTLKx2UORAI6kg==
X-ME-Sender: <xms:M97PYhck31zIAn7i1WNzsSFIOy8umv2-WTp7z9wrL1xodrncZvwfhw>
 <xme:M97PYvMjmYQrC0PtRSHJduuhMEJTmIR_xWZq1-LW91dQUceyo222JpxmYHhLEYBRj
 TGMFxsngn1bY6HXv7o>
X-ME-Received: <xmr:M97PYqj45OCi6QOBrgvH9pH6WzmyoAan2fBxL4qCRvbucs4akDC4fg_v4skTQd_aNxeabBVn6RSJlcgOdB22I5fljz6VALe682Htx-I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejledguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:M97PYq87qKjl9Ug4jDBI8rczdAdMEOoUqgSK6jJ072c8ov0mDkoeMg>
 <xmx:M97PYttn2PgmVOpEszNdUV4D1OwkyqjqLN93iPqYF1OS_z306bcqOw>
 <xmx:M97PYpGWPYoISg1ONM4g1tT1z4sXXnsPcynEd3vlXd4vaKkA9NXYZw>
 <xmx:M97PYjKmj-uF0Ns6gv63lbHtrjQoENtOn4yBDynA4wqLKNwgjYFv9A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 14 Jul 2022 05:13:23 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 8/8] drm/scdc: Document hotplug gotchas
Date: Thu, 14 Jul 2022 11:12:52 +0200
Message-Id: <20220714091252.2089015-9-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220714091252.2089015-1-maxime@cerno.tech>
References: <20220714091252.2089015-1-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's some interactions between the SCDC setup and the disconnection /
reconnection of displays. Let's document it and a solution.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/display/drm_scdc_helper.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_scdc_helper.c b/drivers/gpu/drm/display/drm_scdc_helper.c
index 81881e81ceae..c3ad4ab2b456 100644
--- a/drivers/gpu/drm/display/drm_scdc_helper.c
+++ b/drivers/gpu/drm/display/drm_scdc_helper.c
@@ -35,6 +35,19 @@
  * HDMI 2.0 specification. It is a point-to-point protocol that allows the
  * HDMI source and HDMI sink to exchange data. The same I2C interface that
  * is used to access EDID serves as the transport mechanism for SCDC.
+ *
+ * Note: The SCDC status is going to be lost when the display is
+ * disconnected. This can happen physically when the user disconnects
+ * the cable, but also when a display is switched on (such as waking up
+ * a TV).
+ *
+ * This is further complicated by the fact that, upon a disconnection /
+ * reconnection, KMS won't change the mode on its own. This means that
+ * one can't just rely on setting the SCDC status on enable, but also
+ * has to track the connector status changes using interrupts and
+ * restore the SCDC status. The typical solution for this is to trigger an
+ * empty modeset in drm_connector_helper_funcs.detect_ctx(), like what vc4 does
+ * in vc4_hdmi_reset_link().
  */
 
 #define SCDC_I2C_SLAVE_ADDRESS 0x54
-- 
2.36.1


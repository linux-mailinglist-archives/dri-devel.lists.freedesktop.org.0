Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E601570902
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:40:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19BC28FE73;
	Mon, 11 Jul 2022 17:39:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 464768F6E5
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:39:51 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 9BE2D5C015E;
 Mon, 11 Jul 2022 13:39:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 11 Jul 2022 13:39:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561190; x=1657647590; bh=YP
 EDMy0rIk/gxi10eqHpwwkj5Tbki4hCqBkxghm0y+M=; b=BvFeZHRjsWLA/lZWvY
 +cKPX0x9k6uYVFGc+RV0M7aHDFfuLedt4uYQbUzOVUP6cZO8Oo7tl3VO8R76GQ5w
 634Q0MFL+wi+NoPuzkkZUzTFHt7l3EdMYyRQtbl9klpcUqwUPjAMw8gd7CCEX+GB
 Ug8upW+c8VaBUjlL9FpbtPoAdhFrzlTaHcdzgSQ5A3/6wFHq1OyA+1aMQnkyun0C
 BO9vRCjDv3XvmLxANv7dYFdXqhTFUMJYIUXzC0x0Um0XF7pO3iO779V2O0bT1etb
 aW85rzP35q8Qvi0xa3gFfFwAZQ89NbHNM269MCML0BcAxe0TNECNGKnj0IGC9DuN
 nNvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561190; x=1657647590; bh=YPEDMy0rIk/gx
 i10eqHpwwkj5Tbki4hCqBkxghm0y+M=; b=M6ZhHJYtFMdN9wNGyQZ0vPdDrVOZ3
 I+i9DSdirwYvpxek5xswL5wiFHPP3mOZlHy49EaA44DXBspN573wPT67Kta50p7s
 rCCH677+2usSeeO0NDC/Oh4QdFY6Qwi9NgKMdF5Wjbb6QwoeNxrFivnqXyOGuGiu
 20mZahMWuNIALVbqfJK9slDkPupJJMjzIyG4qZiQ/Xht0hhUpuGvvGLKvwlDruWN
 rpt6ZgSVMVNoa/U+5BJESSkXEgNeS7LfqF07WXwtFqmy/RK6spprqek3qVeZNaVg
 ZI++2Bg4d9RMSPftTRJZDk9CXYdmOu/sGeMNB14yIwGoOaYx2uL+2Vofw==
X-ME-Sender: <xms:ZmDMYvoAS5J8iIdga-zzoCgpWwmjROHVPGd0xSGg11hj9cXzbA52zQ>
 <xme:ZmDMYpoiPqeMDCl9gQ0Qx6Ms6jRmRnOCTFjTs0cimpJnAAFJ6-kU_9P2fMm05jqQP
 UpV8jgBdgP5W8tNCVA>
X-ME-Received: <xmr:ZmDMYsNv43GwL5qjbANn1pRaON1MZSmS9IT3US34Oj1nOkfoLXjOe8BsCfiO8qYKRx4jrMXlWyhuIcnXg8Yr1_00FLqAwXRgvQ1YOIA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ZmDMYi405zpR1iv0N1A2ktuFaY3YQwpIMkY9VCWEeSucs7jHk5uqpw>
 <xmx:ZmDMYu5P_gfrL1Cpd2z86q85bn5PWBU9gIK29KQIKvouLBPuRbNMoQ>
 <xmx:ZmDMYqh4ZndV0BW4McDNIrN_k6XYxbGDrm8QLP1niCo25nGmgWU9Mw>
 <xmx:ZmDMYgTOTZQSMoufFxlcdc2aA5JuH9f3T0WPWahrQ6KmE_3-lHqhCg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:39:50 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 04/69] drm/connector: Reorder headers
Date: Mon, 11 Jul 2022 19:38:34 +0200
Message-Id: <20220711173939.1132294-5-maxime@cerno.tech>
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

Unlike most of the other files in DRM, and Linux in general, the headers in
drm_connector.c aren't sorted alphabetically. Let's fix that.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_connector.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 1ab083b35e3b..d64ee257330e 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -22,15 +22,15 @@
 
 #include <drm/drm_auth.h>
 #include <drm/drm_connector.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
+#include <drm/drm_file.h>
 #include <drm/drm_panel.h>
-#include <drm/drm_utils.h>
 #include <drm/drm_print.h>
-#include <drm/drm_drv.h>
-#include <drm/drm_file.h>
 #include <drm/drm_privacy_screen_consumer.h>
 #include <drm/drm_sysfs.h>
+#include <drm/drm_utils.h>
 
 #include <linux/fb.h>
 #include <linux/uaccess.h>
-- 
2.36.1


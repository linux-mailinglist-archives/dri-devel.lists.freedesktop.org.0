Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7652A2A9163
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 09:35:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD09A6EA6F;
	Fri,  6 Nov 2020 08:34:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 378866ED64
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 13:57:02 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id E198558034C;
 Thu,  5 Nov 2020 08:57:00 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 05 Nov 2020 08:57:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=1qbN14mIek/JX
 3iS6saTd4OgwKK38+e/znp9ftVsrwE=; b=IISv2sIydF7hazIS49pvAg/DQeDg+
 HC6ciFEvlazhKxULi/ZsxJYxzkY5rGmB0qJAXDEitcmgU2ZPlFqhuLFFt8XN2RZq
 +1vr4taT00MHXxZE220SJg5+eE+sdpXwpsT5ySEqYGktE3jz88/GnONGAu3x30F4
 AWyjy6sgpqlS5Pf9aLZ6HyrMe8z+LW0eklF+JkrStwx+ZfAnfwj5FhZofgnYMf/j
 4fsMj1hhzfcemS+KziRouPy83yio2M72MWubMlnzbrhifCpZYvHJli4WYAYZcxDx
 ynZXXh687+hLKSyNcLXMC3S7+UfoWXpTDL8JoPmD4DPh3HZFriIMzKUBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=1qbN14mIek/JX3iS6saTd4OgwKK38+e/znp9ftVsrwE=; b=fXXZegtI
 VZQUBXr9e1cy83HC0EngeA/hSJEQ7yIRKNFEUduOZz/5wIDuujKfcIfWwnB0gZm5
 qAhnpeOCjKrXBJYbs8rgofiWx6YBKyW+JHlcDKZIF6U4Q1qgGA9MI3lVjdm7euo2
 80WHGo9NNb0VW79a90ze0/TdyRYYWbRL28jjCwFMByXwurgr2Ksfy6w8IR32pjFA
 eN0AXkczJDl3YOHaQOFcRbPm5eQsESg/Wq8j4vh7pSFQBLrtDruhMeigQx5Pd5Fv
 wQLZWGEqKOvZOptXYZql4a+kARqKsptlSXeiAzT8iGOaMuwMHEPiuD0jbCcbaNX6
 2o8PFNBpE4V9Yw==
X-ME-Sender: <xms:rASkX64hHlvHkwaSshA-RkVtOVZBRu8EQvpI9rXowgH6QyGvdxIfZg>
 <xme:rASkXz7HdBZ2yWh9zwv7pSC_mcY2Ey5MgYo92lH-ah9uqOFcTNR_WFr5oqxc6GQaa
 NIIqxR7uUbjRc_v_ws>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtjedgheelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:rASkX5fhQuNWdgWIw1SF8gpqgrBkLdUjCqcIjOMJZFymtrBqnNGg0A>
 <xmx:rASkX3IjPwiuOHta41AjKDy9sQdmqHiGVw7R1x3Gvcqn8dlSUVpyaw>
 <xmx:rASkX-JHFgJdVJ9wgSEdMIBzAaD5ZozLv91vkHrHvRwWiwWHAXg_OA>
 <xmx:rASkXz6OCXjX4Nohk7hSQHCCEWEEhy3FMjDuC5-C89cwpugLoLkbIg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 578C2306005C;
 Thu,  5 Nov 2020 08:57:00 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v3 1/7] drm/vc4: kms: Switch to drmm_add_action_or_reset
Date: Thu,  5 Nov 2020 14:56:50 +0100
Message-Id: <20201105135656.383350-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201105135656.383350-1-maxime@cerno.tech>
References: <20201105135656.383350-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 06 Nov 2020 08:34:42 +0000
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Even though it was pointed in the review by Daniel, and I thought to have
fixed it while applying the patches, but it turns out I forgot to commit
the fixes in the process. Properly fix it this time.

Fixes: dcda7c28bff2 ("drm/vc4: kms: Add functions to create the state objects")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 2b951cae04ad..44db31e16e91 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -113,7 +113,7 @@ static int vc4_ctm_obj_init(struct vc4_dev *vc4)
 	drm_atomic_private_obj_init(&vc4->base, &vc4->ctm_manager, &ctm_state->base,
 				    &vc4_ctm_state_funcs);
 
-	return drmm_add_action(&vc4->base, vc4_ctm_obj_fini, NULL);
+	return drmm_add_action_or_reset(&vc4->base, vc4_ctm_obj_fini, NULL);
 }
 
 /* Converts a DRM S31.32 value to the HW S0.9 format. */
@@ -657,7 +657,7 @@ static int vc4_load_tracker_obj_init(struct vc4_dev *vc4)
 				    &load_state->base,
 				    &vc4_load_tracker_state_funcs);
 
-	return drmm_add_action(&vc4->base, vc4_load_tracker_obj_fini, NULL);
+	return drmm_add_action_or_reset(&vc4->base, vc4_load_tracker_obj_fini, NULL);
 }
 
 #define NUM_OUTPUTS  6
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

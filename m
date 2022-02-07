Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D224AC5D9
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 17:36:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C9E10FA40;
	Mon,  7 Feb 2022 16:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7586310F9B2
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 16:36:24 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id CD31F580218;
 Mon,  7 Feb 2022 11:36:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 07 Feb 2022 11:36:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=RZoexX2BCdVjFU58qPtaJEg+XZOR4/
 Qrj3cJur5ov0I=; b=CsSJ2oUIl0cxViY7U8uHn1+K83UeKbvNIhwAjIAlZEYtIw
 Y4enMZ0+nbgx8JJINY9QroBuVU3lfnE2rbvfoIb/775uCZOLYbWoBsLbTGkjpN+s
 OllSc0K1NWNKqqMoQ7JdhnlmT9aXp7D2LN+6JkFASX3ARXOZEc47dcc7CHY377Cl
 cvCOc67L4p/45qVNoC/TIBcvDeDlBmpEGHpdsZyxxcacuUiBjnu5vnY0pe15MDzi
 PROLg7DddAWw/bJjQVf3+VJsvMayu7KPiY5nyfnlrY3jTaYjWtNegpmII+S8Z0+w
 RwJN4g9RW0nkrJNEwrI6iVG9Xu3+HtVanjUvuzWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=RZoexX
 2BCdVjFU58qPtaJEg+XZOR4/Qrj3cJur5ov0I=; b=BC5k2BD7UI+GNBmVb4AePY
 WcoVgG0ci6BkwJUTBD/gli1alscbdobEqcnwPiAKRttuuCX/dGie+rxnO4q4rrZj
 eL2HbcjAsbfySJ0qsbt1sN9FZ4X/a6GRPI3E68ooSPs0F3WaqDosZw/YLnt26c8R
 yilv21nx+HZ9dJNXwUuFAsNDl16/sgDT5PtLVr28ox3tdMTxIE/tRN4vakQHf6WL
 OZGCcnmrptPCYBSM+6HklO8q8FlVhfnU2pka1JSZ/jjk8xJaMvVMJkVspGNSk/vw
 yJMwxKNviyJZk3lcXevCnBD7D/HgJWobFNmj2DFrqfSxiWNCDC5CcfGq1c6Emo6g
 ==
X-ME-Sender: <xms:h0oBYkAXvh_V557_7caigv4CHDZ5AzcHwSG1hzR0KJSHM_ZGxpHYyg>
 <xme:h0oBYmiCyYN_C7SZkZcDaZ8BJqOG5dYQEqiUpmqD_qwCzvYhIjjYUoRCL45uyIuB_
 clo6oGommRnGKErbRc>
X-ME-Received: <xmr:h0oBYnlONoffEW0kBhkqucf4A-ihGUtZtx-xMCLnNt663CQr3p6UycswF6DLXcgWH3x2KmoPOOU9zrW9Ezo50pl-60DNFe69a6dURv4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheehgdekjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:h0oBYqyLD-cd0_lDCXBAa-QNi5AHKGYqAU3JFFhuXCDYf2zWY2NDLQ>
 <xmx:h0oBYpTE7n_mgq1OSHNMEChZKcNo0-LagtXZaEHu20hrziKq1RNPjw>
 <xmx:h0oBYlZHnQ6MSqvb6wso9MWSR9RrDH6DtWmrlfiQhXplwAtuOuixuA>
 <xmx:h0oBYoLGZ7EdEl_CJ90IAWgg-2DZBxCx96RtIWxyzPPYUsuVej2jEQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Feb 2022 11:36:23 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH 20/23] drm/komeda: plane: Remove redundant color encoding and
 range initialisation
Date: Mon,  7 Feb 2022 17:35:12 +0100
Message-Id: <20220207163515.1038648-21-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207163515.1038648-1-maxime@cerno.tech>
References: <20220207163515.1038648-1-maxime@cerno.tech>
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
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The komeda KMS driver will call drm_plane_create_color_properties() with
a default encoding and range values of BT601 and Limited Range,
respectively.

Since the initial value wasn't carried over in the state, the driver had
to set it again in komeda_plane_reset(). However, the helpers have been
adjusted to set it properly at reset, so this is not needed anymore.

Cc: Brian Starkey <brian.starkey@arm.com>
Cc: "James (Qian) Wang" <james.qian.wang@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Mihail Atanassov <mihail.atanassov@arm.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/arm/display/komeda/komeda_plane.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
index 383bb2039bd4..541949f2d44a 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
@@ -143,11 +143,8 @@ static void komeda_plane_reset(struct drm_plane *plane)
 	plane->state = NULL;
 
 	state = kzalloc(sizeof(*state), GFP_KERNEL);
-	if (state) {
+	if (state)
 		__drm_atomic_helper_plane_reset(plane, &state->base);
-		state->base.color_encoding = DRM_COLOR_YCBCR_BT601;
-		state->base.color_range = DRM_COLOR_YCBCR_LIMITED_RANGE;
-	}
 }
 
 static struct drm_plane_state *
-- 
2.34.1


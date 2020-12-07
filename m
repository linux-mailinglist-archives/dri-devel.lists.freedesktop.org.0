Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B308F2D263A
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:34:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC416E975;
	Tue,  8 Dec 2020 08:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C80889933
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 15:57:27 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7C39B580220;
 Mon,  7 Dec 2020 10:57:26 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 07 Dec 2020 10:57:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=Ed1Z0fpkyyaC6
 sMQpnbl/Y4aAtwtMQyTQwjmibZEsmU=; b=gUjTIyHdVxBTGdvOw3rQCEMIGEhsi
 sQLP0ZM3rUfNWtv8nG/gT/ppw6Vq6hKdJZ+BXFog3EHNdfPHOZcqohiV9SBrTkZd
 OSAd1hxM5/t8nrJUPELBjh6RLn7tOd1R6dXINFCQ150OgRaSBzXu/Quc1nPEP3pc
 KL0UJGgtwngXHM3Cn2WFJ1nFFIXusY/n9qih1CXFnp2GtRAvv/uxqmRrFs5tFfwa
 G5Iv10qkOTfd/Lg+Lvy5LLnx/Lti/Cq20SYO+CLZ9DXvGP1E7Ln4DIVoMMTTbYX/
 L/vdiuh6RbXy2lczv1Bt3jk1pWhIfWnjG2KMOu5U4sL43Axw5dOCkK6tw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=Ed1Z0fpkyyaC6sMQpnbl/Y4aAtwtMQyTQwjmibZEsmU=; b=ork0zpHw
 a9G+o9SHT8Fu9TAx7YgaUGzas7Bg8aVjnHxPgub4bIaagQuE/RyQbbw704pSFG2a
 ktVJSKL9VYQok/f43rvmyLh+jPWkyvDpnbqPyHgA0Ai93C84F9DMhrFna5eDAoVO
 YrPPbxHbNqH1nbes8HSRmTYy22s3ov9Im6r0tjFG8YLR22y/lnRWcT5JsUx202Ob
 kaMFTY3XjE8soEA+wy/eRnnBJYu/DE+QTUkIkC83pSOIxEkOL9J1XJSlDB/A9Jl3
 CN7icNjfbdxDJrY4Fhu6b4USGYV0jepTtvmaLjOtZsUR/pFsKPujwIV+BwCTX93U
 fzywHt7KnYh4Kw==
X-ME-Sender: <xms:5lDOXz_MK7WBnUR50_pIBTslXPTDv8f6pD4ehjmDqfWErw2Ja13nAg>
 <xme:5lDOX9FoWMWY-XId9ihNeJGqrU9gCbJiQYuu6VaCmKPoPVTuzTYfa_h7HcgC4ChGo
 teXoG4X4PC0JDX-PJE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejgedgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepvdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:5lDOX4XefixKg20qvqXX6pC7DIky5oOu-XEsEOjBXMEx7c1RckWgBw>
 <xmx:5lDOX5-lTPqjhoNnmUIhdT3m81gwguppM_nBiOXPqqzmeQUlo7-fMg>
 <xmx:5lDOX15vdcKL12SGfMJG0x5IQsmms7t0TmrAXjavT91YrRhQ3quAQg>
 <xmx:5lDOX5LQv_zmhgJEoS4ZlxRk9-Tf5dl_PtzS6_oDaCq_46Gth0R0Fg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3DCD41080067;
 Mon,  7 Dec 2020 10:57:26 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 4/9] drm/vc4: hdmi: Don't access the connector state in
 reset if kmalloc fails
Date: Mon,  7 Dec 2020 16:57:14 +0100
Message-Id: <20201207155719.17149-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201207155719.17149-1-maxime@cerno.tech>
References: <20201207155719.17149-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 08 Dec 2020 08:32:06 +0000
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
Cc: linux-rpi-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_atomic_helper_connector_reset uses kmalloc which, from an API
standpoint, can fail, and thus setting connector->state to NULL.
However, our reset hook then calls drm_atomic_helper_connector_tv_reset
that will access connector->state without checking if it's a valid
pointer or not.

Make sure we don't end up accessing a NULL pointer.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Suggested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index a88aa20beeb6..61039cc89d9d 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -171,7 +171,9 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 static void vc4_hdmi_connector_reset(struct drm_connector *connector)
 {
 	drm_atomic_helper_connector_reset(connector);
-	drm_atomic_helper_connector_tv_reset(connector);
+
+	if (connector->state)
+		drm_atomic_helper_connector_tv_reset(connector);
 }
 
 static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3969B518406
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 14:14:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1183D10F840;
	Tue,  3 May 2022 12:14:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B333410F935
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 12:14:13 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 65C043200992;
 Tue,  3 May 2022 08:14:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 03 May 2022 08:14:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1651580051; x=1651666451; bh=E5
 /YvoIeMkXr1FWkq/74hLSvbxSuTBUbUTmSWON5OEs=; b=ap3zgU4aG+hsosF+63
 sfxJW0QG3A89lImRujJXWEiSDb2/NzHamgDHSFnpcOnwk0+D70G1F9DrTjoHlCUx
 AtDXbYoo9RDVSdS8kwNa24TeDeuly7yh8dcOZ37RngJ6FlviNPwi+Uw3L3ehGxrL
 VzyY6+BugAJMUK18QiA9+L2c+Tp41azu2P9BTXAoqSivRBgnWGIfo6QpYWO3fjmF
 l+pGtXo7zwR/BK2LjNuWI17c7O/Lb18XS9Eru1zIr5iLlWvRwrMFLKjSEdNi/1fD
 dpZL72xLZFRrkbYlOI7wNfVKzEx2xjRNiDKip6Vn5c3nISSf8hCOR1qjdIdJRIb4
 Ak1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1651580051; x=1651666451; bh=E5/YvoIeMkXr1FWkq/74hLSvbxSuTBUbUTm
 SWON5OEs=; b=fjMIm/wZNfVvjWw6HYREkAjibyjN0zRwSMHQrUiVtDSj/6wcRVM
 UoVEoTdujvI2RIdFGbHEobkS3bljXQk57i9iICmNkERAsTirCbUs7GlZjelBKLJH
 XQ604Kl43tZAaBebS7+iqtHnQxtZtGjZPnI3tj7yD3ok14rcVW8vC7UouTDWCO3v
 MTkomukIrveP9p4vZxs5ScypdQ1Rol6OyaURhT+3IVnuOpWtenvzhAR6vqO2RCQf
 GKn3cr/qg+SHlE0LK17adRWMNVT0Q1i739vNNDV1gZBBswfiEYfiK91gfuefkmxp
 Q1iobQdZIEC6hUnr4Z62BVI9Itq82CYCD9g==
X-ME-Sender: <xms:kxxxYqAqI1QeQVfqG6yBUF41qceCW4Pm5oOUgQRnCoo3BIM0HD7y2Q>
 <xme:kxxxYkgCu76wJazL189cIWavucAnhEG5OvMkFSjkBHA2msFu40IQHBlcAx4zYMtww
 uzUUeH7aZTAyreTTGo>
X-ME-Received: <xmr:kxxxYtkAbbsBiLNU2ksc4wBKwVUBDgz62u-dFqvqfFyzASWUocHivF0VMBcd9hhi8uVILXHTr4COBuOL1EQVwXwkgin_hQf1LmsW_M8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejgdeglecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
 jefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:kxxxYoy-G_fS0cNIruMxtJbc0U5n20y7JWyuFG5vDAAC4zuavsgO1Q>
 <xmx:kxxxYvStVXH7bBi7IA1I5hXNttyxiO5mf8IKVh_bYLfM2NJGu7P93g>
 <xmx:kxxxYjblmrHDZU_F3Qhsllk95ZBvxG0E7XP8NPjxt2L8Ns5aDnU4JQ>
 <xmx:kxxxYgKqWB_XLqtp3KpirAh0zsaSv2zA1-FUdR7FZI1tm2B0ax44dA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 May 2022 08:14:11 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 07/14] drm/vc4: plane: Register a different
 drm_plane_helper_funcs on BCM2711
Date: Tue,  3 May 2022 14:13:34 +0200
Message-Id: <20220503121341.983842-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503121341.983842-1-maxime@cerno.tech>
References: <20220503121341.983842-1-maxime@cerno.tech>
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
Cc: Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On the BCM2711, our current definition of drm_plane_helper_funcs uses
the custom vc4_prepare_fb() and vc4_cleanup_fb().

Those functions rely on the buffer allocation path that was relying on
the GPU, and is no longer relevant.

Let's create another drm_plane_helper_funcs structure that we will
register on the BCM2711.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index ba7359516d75..1e866dc00ac3 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -1389,6 +1389,13 @@ static const struct drm_plane_helper_funcs vc4_plane_helper_funcs = {
 	.atomic_async_update = vc4_plane_atomic_async_update,
 };
 
+static const struct drm_plane_helper_funcs vc5_plane_helper_funcs = {
+	.atomic_check = vc4_plane_atomic_check,
+	.atomic_update = vc4_plane_atomic_update,
+	.atomic_async_check = vc4_plane_atomic_async_check,
+	.atomic_async_update = vc4_plane_atomic_async_update,
+};
+
 static bool vc4_format_mod_supported(struct drm_plane *plane,
 				     uint32_t format,
 				     uint64_t modifier)
@@ -1493,7 +1500,10 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
 	if (ret)
 		return ERR_PTR(ret);
 
-	drm_plane_helper_add(plane, &vc4_plane_helper_funcs);
+	if (vc4->is_vc5)
+		drm_plane_helper_add(plane, &vc5_plane_helper_funcs);
+	else
+		drm_plane_helper_add(plane, &vc4_plane_helper_funcs);
 
 	drm_plane_create_alpha_property(plane);
 	drm_plane_create_rotation_property(plane, DRM_MODE_ROTATE_0,
-- 
2.35.1


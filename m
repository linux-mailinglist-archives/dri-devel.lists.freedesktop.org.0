Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CDC4AC5CA
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 17:35:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0444C10E964;
	Mon,  7 Feb 2022 16:35:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04CA010E311
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 16:35:34 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5C5CE5801D7;
 Mon,  7 Feb 2022 11:35:33 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 07 Feb 2022 11:35:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=Wpd1pV4OsjXu8K
 McYu4OFX/LXZsN9ht6MuXhmtDiIss=; b=G3gXMr3hhK3OOVvFZPTeerAsvAvUCu
 kMSa5zdkFOj9aaeOhzi60jweTJmoCykNAaiHfw7fulEF220dv5rJCVNTJYnndgPd
 QbfU/GHkFdq/SqHGhQm0+L9eg66SmI2459Frurycm7dhpbibcQNIneGPGPB9AHU/
 mWW7pIvowLPNfLJhiMeel8NoWeGeTnkny2CrN0CDSizPcKCX2fMHI4tbTNfrGX4L
 tfLfqc484vOsdjj+mmEZcuJHDI5cA1rnUsnmBE98ej4LJo0oo2dJeafDAmGqieNg
 Cm+cpLceW3op0q2nGLHfhjGJpxIeS2tWMgI+Wtznl1huSaDjbEy521gA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=Wpd1pV4OsjXu8KMcYu4OFX/LXZsN9ht6MuXhmtDiI
 ss=; b=hd++mgzAKPZOLRfy1uneFgd6GEK9UpS28tHfJsl4slEo5OJ3Lvz9cCWQt
 HNZzfpOoAYPH5bYUHU6Vhn1Skmdyl2HvFIQR0Phl8LN/QPTx5PuK2un4NOPMhU2Y
 OVBtMK2NclveoGfX520xZ/3Q/RSg/ik+KksqhBaj36XSFmxeMMjUh6eRYUl5Nnl8
 vOwEHUs1A31ibgErbeYSYg5aLw5dYS8RLyXQ2uXl3hcS6oBxdlTFXabE/KHb5a1X
 nJzKfRKlBE4HhPKjgBv7fxEVxI6r/7Sz5oPbUhh7sPId+Z1Gl5VW1aPPaXxDePI7
 +lIfzAAA30eUw5rFo8P1zyIW01IXg==
X-ME-Sender: <xms:VUoBYpIpehjqCa6BjbCzT2ls3_ufHCfCItC769j43cFlncQMRjM-Tw>
 <xme:VUoBYlL76mOF9Oc3pCN63oE3kUdX7f40WC4yEa6xXVmzEoBaZVpI438hHGMPT5kKn
 TclXPRVwt3-px4wL6g>
X-ME-Received: <xmr:VUoBYhsG0WuKByK4SSVriFxXdSAmAnlkdJL6Q7IG7Kn6az3_babENcTCVqUePpAaovhMrvt8dduNKcjy3fIc7s0Yeu9dffu5q3tWBVM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheehgdekjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:VUoBYqZHQwMjXncR4bh3EW_0PFXmgyDW9bFelYCwDy1HwvVNbpRBlw>
 <xmx:VUoBYgZqUBOFp5xgkQtjdRAnvPE7-ommJuOThMzVallwpjO2uyVOdw>
 <xmx:VUoBYuAk7eq4pfRamPQ1AnljgOXXSNTU_jTCKWXKuzFF9P8xCdhRBA>
 <xmx:VUoBYtJ9IE3UyeMCROSBzPB7h0QnA-nYkRAA1K7StnCmMaEgrw687w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Feb 2022 11:35:32 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH 05/23] drm/amd/display: Fix color encoding mismatch
Date: Mon,  7 Feb 2022 17:34:57 +0100
Message-Id: <20220207163515.1038648-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207163515.1038648-1-maxime@cerno.tech>
References: <20220207163515.1038648-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: amd-gfx@lists.freedesktop.org, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The amdgpu KMS driver calls drm_plane_create_color_properties() with a
default encoding set to BT709.

However, the core will ignore it and the driver doesn't force it in its
plane state reset hook, so the initial value will be 0, which represents
BT601.

Fix the mismatch by using an initial value of BT601 in
drm_plane_create_color_properties().

Cc: amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index feccf2b555d2..86b27a355e90 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7914,7 +7914,7 @@ static int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
 			BIT(DRM_COLOR_YCBCR_BT2020),
 			BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
 			BIT(DRM_COLOR_YCBCR_FULL_RANGE),
-			DRM_COLOR_YCBCR_BT709, DRM_COLOR_YCBCR_LIMITED_RANGE);
+			DRM_COLOR_YCBCR_BT601, DRM_COLOR_YCBCR_LIMITED_RANGE);
 	}
 
 	supported_rotations =
-- 
2.34.1


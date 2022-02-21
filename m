Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0214BD8CB
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 10:59:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D62C10E315;
	Mon, 21 Feb 2022 09:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF02D10E30C;
 Mon, 21 Feb 2022 09:59:34 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 11AAA58025E;
 Mon, 21 Feb 2022 04:59:34 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 21 Feb 2022 04:59:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=5jbMvBKOooB/lW
 j7uJ4wxAWbNyVnkj0TRTyAtZi08Nk=; b=hucw/Cu6oXCXDrfRJMASYx+9qACy0d
 p7MKmT+rh3JbUpH+y/xYBf8oL05V5W/mGP99uzyGnKRD1x26vE4rHb4QImcCWboX
 aLATHROwfqg7gC4um9Epct6NzxFQ8tC7uljwl5FaoMLlevyJxzKBjz25KsElfr02
 U1zpGyaBsAeDWXvhI+nsIoSQrT5MPOyzpsM4PvObed3k9nNeMO7/s/ek4ft4BJOv
 TfJUzOx7omQqeOb8V67RehFQNLzYrJwg0MYLFu8HoDnUMHW8Cz/aOEI6ouKKc9Za
 +YVzpZ0IzrSMfAQTY89264Xb3UWe3vhrZwrrVL5EOMKQYS3V0lBG5W8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=5jbMvBKOooB/lWj7uJ4wxAWbNyVnkj0TRTyAtZi08
 Nk=; b=YJfCDao3ZChAkW7ALM/GGAPdf6HdpT4yraTIfqodn1NuchtK8BFWupQt1
 eMfDLn1zoctTUOeBfRch5T+IKkWR5qPtZDsbyo9x0vp7ev+dPvZy5+tnWiByszZ+
 pfG/X8s/2Jq7oyVfPJ2g9tJTdvqUJJJXyFXKOz2jd5IyYy8ShvQjHEmiXGgw8vVC
 LZ0da71GiQKr2vQ49Z9RiRwF8u+rbQT9d8FgZpeeCCI5Gb8ilbBwAkeXL1NIKCAr
 O8iugVx9hXBxz8+HT/CutLdmR0jAh3QxWg1F3+oyOrTsS2F4cB3a8/J7cghFhKeA
 TUlHH7Pvjpaf/TVf2GIkfnc2L/JRw==
X-ME-Sender: <xms:hWITYjNOJQpt2oAqnKr7KD875lsxNaRbtzNm6BzOrut5C5OAFzrQ4A>
 <xme:hWITYt85Hm_LDw70omxbNGsWTPaumWzrT6YgHXvPmctx1LDWfsEZ09nVTezyOgn7-
 FLCi7vpEu3posdfAR4>
X-ME-Received: <xmr:hWITYiRW0SoUh6AGYbhAf7pFCZfjZmPHHRWe__qbONkPMcxIQwuvkBA4gC8TqRNSYLkh1yekANVOFh-J17QEtzc5Ccbg0kx-QWBXXiA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeeigddutdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:hWITYntxmTSj78-gLaDJLYOgcCD1Z3-ek3rWrwaP-U0nQ7l1614zNA>
 <xmx:hWITYreX8cQcFazSURSws2rxTc_eU30XRghu5C4kgHDDGFeVEJFVNw>
 <xmx:hWITYj2fxvhOVpVANRErmgO-sZmvRSFtv06AvO1In5m8khzLXH90Hw>
 <xmx:hmITYj9GCWGBFKvMfOSFQgsoTaKIntiPTw0krVYBHZGel0q_841hxw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 04:59:33 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH v2 05/22] drm/amd/display: Fix color encoding mismatch
Date: Mon, 21 Feb 2022 10:59:01 +0100
Message-Id: <20220221095918.18763-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221095918.18763-1-maxime@cerno.tech>
References: <20220221095918.18763-1-maxime@cerno.tech>
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
2.35.1


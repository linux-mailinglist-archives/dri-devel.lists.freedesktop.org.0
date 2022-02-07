Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2774C4AC5C8
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 17:35:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB3510E2F6;
	Mon,  7 Feb 2022 16:35:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA08410E310
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 16:35:27 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 333BE5801D9;
 Mon,  7 Feb 2022 11:35:27 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 07 Feb 2022 11:35:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=Vq8s0JyC8s00ltpimMwBVyZ8K4H9T1
 h5mMPTBQXsouk=; b=YwVrjrzjdg53fsuxylT7gBbhDk7VZKP/pYcPCtqPqYP+Oa
 VVXKTkEgrtUGMA9e/fJlacXkXsvDCwQZ+VTiAJo/lCiwf2Znu3CguLSf9Wud4xOf
 BIPwYxyVkI3aVB9vwhRQgzManxEUmCG950FBo5w/i9rswob+G+VqjnCmw6zvVzcd
 oB9bOKXxegjMsdE25R9eTlTVRbnaxwo3pywMtjY5rhcvo9rJcZv7g1XbM4+tJ5ha
 ZDIkn6BV/N9xaEAbmchAMaZCXhHYBTV8Rb34Pttln6kxbJoQFWNSTHOW/Ou5G96D
 +mBK677LnsPkFV+nx6o7ebv1vqP7MVJ9SBCs5zeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Vq8s0J
 yC8s00ltpimMwBVyZ8K4H9T1h5mMPTBQXsouk=; b=SfkXjYjTuAfwmZ7sgCb8Ih
 3VQyzb+bFVo3SzriD54qnjX6HnG5rcCHvbZitBLm3/WY0NDf3ozmL8i+e9dawCWw
 ilPpLpQPQif68fjb+JHn33BTdqSvC92nNykCtfn4koBUjeP1YS4NlZYgBhasg9ti
 kHXxNVp7Kszj/7cDH7eMH+CPllEeUh+XID5jBAD7qG9OVPXRXKSqn+3YEmF2y1hb
 Kz9kpoJXnGBTa1PaQPWP4ZthMDz1XLN04ysUJlihdjoIVNTFkTdABYxNly6zfdQa
 k5TKHe7jtWl+A4IgB/FAe8fAzNByOFdSiD23O9abZg6bj2i/9n4z63vVjLmMK8Qw
 ==
X-ME-Sender: <xms:TkoBYlNIaOl85tUWiN_cIfwakQGuYvMdVrqNEJaJhTEGIt0yEUPZzw>
 <xme:TkoBYn952wB8ATR2yQMezAZaRJg9MISyJDLUo-ltp2uvnWNrhCTUA9KfxsdDMXKBP
 m8x37vLZgVDyL6Bza4>
X-ME-Received: <xmr:TkoBYkQtD6dbnh40RT9CGGWrjw1m0ZPm7s-pmrH6zX_D49J4MCRFawpda8caqr5DBYpPf1yXd--OM8MqaPkxRKBr00pE0PdGEbzutiE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheehgdekkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:TkoBYhvKtLtZBhRDj-QevElvjmUPDpR-DM8_SK6n4a-dBfdsYGIEbA>
 <xmx:TkoBYtcTtlAszQOmZVbrnoNpaKJAbRQYOoF_w_0BjiZtifZzRZsPRg>
 <xmx:TkoBYt04dDDVKGS2ZAVtxPUD8YsW5hWlAHKdXgpKYIbk_04xsHgZsw>
 <xmx:T0oBYt08rhh8E6v0Id_g6me6hUkax0IABPo4VmuM6l2vlatS7ymlRA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Feb 2022 11:35:26 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH 03/23] drm/tegra: hub: Fix zpos initial value mismatch
Date: Mon,  7 Feb 2022 17:34:55 +0100
Message-Id: <20220207163515.1038648-4-maxime@cerno.tech>
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
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While the tegra_shared_plane_create() function calls
drm_plane_create_zpos_property() with an initial value of 0,
tegra_plane_reset() will force it to the plane index.

Fix the discrepancy by setting the initial zpos value to the plane index
in the function call.

Cc: linux-tegra@vger.kernel.org
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/tegra/hub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index b910155f80c4..7f68a142d922 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -788,7 +788,7 @@ struct drm_plane *tegra_shared_plane_create(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(p, &tegra_shared_plane_helper_funcs);
-	drm_plane_create_zpos_property(p, 0, 0, 255);
+	drm_plane_create_zpos_property(p, index, 0, 255);
 
 	return p;
 }
-- 
2.34.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0165055BD4B
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 04:20:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9A1710EF26;
	Tue, 28 Jun 2022 02:20:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3859010EF26
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 02:20:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A0A1E617D7;
 Tue, 28 Jun 2022 02:20:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77254C341CA;
 Tue, 28 Jun 2022 02:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656382845;
 bh=3iPy89e4pvEBdGobMJlrcyFEDkIZtJfNhGqS/Dt9rPY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=seL917t3R5c/qEbIvKvy/paMpTFnQzEZ/YnOyLNTHdM8F3BPEtbWbfMFaEPro2G7l
 mbb9IbNh/KWxegFQeOMBghzPMZimfH3trcfA02iq/HGWW/b8DgpMKAcFiFk5HoLdjH
 tJNmemEztFTnoDlK+FrSeeQoZfDyekObnA4afOlx0E5VbUA45ZBj2ODAbrGVDccZec
 dg6sibtCGWySKapJerFx1mF6ZxZOND+5S0Rsn5qIYCYAimOObrMSvNT7qHsVmNztGt
 yUQ+XcTLdHqIZf03FurfPQ0arrCpYefHHVJwpBfqmBQ82tRMtDxvyF4hoysL/5i0At
 hOQmwc0B7kUDA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 48/53] drm/sun4i: Return if frontend is not
 present
Date: Mon, 27 Jun 2022 22:18:34 -0400
Message-Id: <20220628021839.594423-48-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628021839.594423-1-sashal@kernel.org>
References: <20220628021839.594423-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, jernej.skrabec@gmail.com,
 samuel@sholland.org, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 wens@csie.org, Maxime Ripard <maxime@cerno.tech>,
 Saud Farooqui <farooqui_saud@hotmail.com>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Saud Farooqui <farooqui_saud@hotmail.com>

[ Upstream commit 85016f66af8506cb601fd4f4fde23ed327a266be ]

Added return statement in sun4i_layer_format_mod_supported()
in case frontend is not present.

Signed-off-by: Saud Farooqui <farooqui_saud@hotmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Link: https://patchwork.freedesktop.org/patch/msgid/PA4P189MB1421E93EF5F8E8E00E71B7878BB29@PA4P189MB1421.EURP189.PROD.OUTLOOK.COM
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/sun4i/sun4i_layer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_layer.c b/drivers/gpu/drm/sun4i/sun4i_layer.c
index 6d43080791a0..85fb9e800ddf 100644
--- a/drivers/gpu/drm/sun4i/sun4i_layer.c
+++ b/drivers/gpu/drm/sun4i/sun4i_layer.c
@@ -117,7 +117,7 @@ static bool sun4i_layer_format_mod_supported(struct drm_plane *plane,
 	struct sun4i_layer *layer = plane_to_sun4i_layer(plane);
 
 	if (IS_ERR_OR_NULL(layer->backend->frontend))
-		sun4i_backend_format_is_supported(format, modifier);
+		return sun4i_backend_format_is_supported(format, modifier);
 
 	return sun4i_backend_format_is_supported(format, modifier) ||
 	       sun4i_frontend_format_is_supported(format, modifier);
-- 
2.35.1


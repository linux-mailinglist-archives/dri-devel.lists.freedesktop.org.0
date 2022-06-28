Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFCA55BD62
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 04:22:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB76710F080;
	Tue, 28 Jun 2022 02:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA6F10F080
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 02:22:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0884761856;
 Tue, 28 Jun 2022 02:22:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDA8EC385A9;
 Tue, 28 Jun 2022 02:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656382947;
 bh=E1KZbsvZDhKevxONtzdxRu8TU+GH1dIUzBdc48HTQ84=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WHBEcyG30ApwViyYY4f+uBncTFJXSrK+2lA05TcuEFLhi2VC9BxXY+fWQhsftft/H
 SbmTnXbatD502cPzAVQYf17NdYKLYcALZJ6NcWjI492uU41vQtzkexa5zMvWQptZh+
 In3JiNOmcY9ZvepuG2YSpAij5YMZSmuvqImRxw9svY4CrSmZY/gE9e1t3QL9QwoAG5
 4T6iGltSE+5zF2o6a+aPD9ItyrL9wBZdxCao1AFEMzLdfosC275HTdoebInYYYYTss
 gyCHemGzRPgckxTDgb8leFegASBFRL4IKKPzRp4CWiYsXDyJ5KmAVuh+X4dkk4mKoK
 nxilD+B3VcThw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 36/41] drm/sun4i: Return if frontend is not
 present
Date: Mon, 27 Jun 2022 22:20:55 -0400
Message-Id: <20220628022100.595243-36-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628022100.595243-1-sashal@kernel.org>
References: <20220628022100.595243-1-sashal@kernel.org>
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
index 929e95f86b5b..2036574e2cb0 100644
--- a/drivers/gpu/drm/sun4i/sun4i_layer.c
+++ b/drivers/gpu/drm/sun4i/sun4i_layer.c
@@ -120,7 +120,7 @@ static bool sun4i_layer_format_mod_supported(struct drm_plane *plane,
 	struct sun4i_layer *layer = plane_to_sun4i_layer(plane);
 
 	if (IS_ERR_OR_NULL(layer->backend->frontend))
-		sun4i_backend_format_is_supported(format, modifier);
+		return sun4i_backend_format_is_supported(format, modifier);
 
 	return sun4i_backend_format_is_supported(format, modifier) ||
 	       sun4i_frontend_format_is_supported(format, modifier);
-- 
2.35.1


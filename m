Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0527688AF
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jul 2023 23:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0456910E16E;
	Sun, 30 Jul 2023 21:58:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18DA910E14D;
 Sun, 30 Jul 2023 21:58:24 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-3491516c4aeso1416575ab.1; 
 Sun, 30 Jul 2023 14:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690754303; x=1691359103;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vu0ECoPsGxDrhExN3brXHjUi2LDDzR+FiP6BVL6w+Kw=;
 b=h2LpsYBPFywLz1hFWTqus0/HFnW3Z94Zi07PcYMQkZiem7z0ylk17/7KsTQPPlC49J
 WwWEMAsnKjGxik3r9XXI45OgJR2XTvUZ+dJRbDKGMNvD2iQdJkySUFNB3SnqG1jmV4Av
 ZNfDadE3pOeeTc3WclrdH2Fjw9mazeO0r+rBnVebI5Rvp0r7HhgpL9n0Kg5vzpnWu7mv
 wtwzKAbSxAHbXfPEEFYMrnL3Ky0XmLv2ukbzDgZkUBX1MPu3CX46st9FWTMU1vn0jJRA
 h/YUn7AsWV81jr8SmGici+CfPXznEghYrzftC3PmSbagKM+5dbAHRH2EHLFZhWm8HcZh
 D2wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690754303; x=1691359103;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vu0ECoPsGxDrhExN3brXHjUi2LDDzR+FiP6BVL6w+Kw=;
 b=Mc7/OP2bH9Y/CQxXeGaFBb2qXawVJxmem5G/CBdUkmI1uoKEwlAA1YIlDXkkSycoH9
 pRGOERs2oyP5lO+Ooi8KYvpEXPqw8o+jV2WxjX+RxzPOWfskQe9+yP9Vzp0OHPi3zaRc
 pu8WuUPar5eINKhv3Orosy7cuqSsMrIqncA/lrb8OMMtIAo6ojBOGvrsBnQU4w/azO33
 uaFzEtzZxoWmy5rF4LMhGSOxryljqwGNAxE8u4fkKGnrSrjX2U9EQxN0gExaJCc/vxA2
 bJ2XmOFQNy/5kFa3S7+0HDAihqDZDWNPjUxTFu9M8LBKzWYqnoauOfc0tPWsXcu97yah
 OYVw==
X-Gm-Message-State: ABy/qLYseOx27bDmONMG8HlYI+Tro5bvCGXt8T1R4NjSJpWN1DQ/mNkW
 P/qjJSyK1QViQcXgiG4xNwyK1YFlL0JT9w==
X-Google-Smtp-Source: APBJJlGFctHBx6g16uBxY6S5P569mXmHB6D7A2XcVTPreJQ0slf/YQc2sQUGDPhGIc2DYrEGBMMm2g==
X-Received: by 2002:a05:6e02:ed3:b0:348:1a1f:5542 with SMTP id
 i19-20020a056e020ed300b003481a1f5542mr6325346ilk.17.1690754303337; 
 Sun, 30 Jul 2023 14:58:23 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e18-20020a92de52000000b003424b3d6d37sm2747520ilr.24.2023.07.30.14.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jul 2023 14:58:22 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/5] drm_dbg: add trailing newlines
Date: Sun, 30 Jul 2023 15:57:53 -0600
Message-ID: <20230730215758.54010-5-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230730215758.54010-1-jim.cromie@gmail.com>
References: <20230730215758.54010-1-jim.cromie@gmail.com>
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
Cc: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index bef9d45ef1df..959123759711 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -592,7 +592,7 @@ static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
 	struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc, old_state);
 	struct drm_device *dev = crtc->dev;
 
-	drm_dbg(dev, "Disabling CRTC %s (%u) connected to Encoder %s (%u)",
+	drm_dbg(dev, "Disabling CRTC %s (%u) connected to Encoder %s (%u)\n",
 		crtc->name, crtc->base.id, encoder->name, encoder->base.id);
 
 	require_hvs_enabled(dev);
@@ -620,7 +620,7 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 	struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
 	int idx;
 
-	drm_dbg(dev, "Enabling CRTC %s (%u) connected to Encoder %s (%u)",
+	drm_dbg(dev, "Enabling CRTC %s (%u) connected to Encoder %s (%u)\n",
 		crtc->name, crtc->base.id, encoder->name, encoder->base.id);
 
 	if (!drm_dev_enter(dev, &idx))
-- 
2.41.0


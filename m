Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F48547BDFA
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 11:13:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8638C10F8D3;
	Tue, 21 Dec 2021 10:13:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6558910F1C8;
 Tue, 21 Dec 2021 10:13:31 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id t18so25761448wrg.11;
 Tue, 21 Dec 2021 02:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BFpZdmylFWaxjp/eKztb6USl6FN9U+6JIs/PIPKjnRc=;
 b=pr/JtJb6WF0mQRD4vOqRacTgAvypWKEfk5V8syiJ9sIDUxNN7jQrq1XKXDsBABqB3H
 DXLpsoP5dGydBjl/uyIiN40HdW11PvdjEe2DTpV9AvR7iiiSmPkvo6q5qo0QuYpmSn1b
 RkHn18uFSr0cv2V73JCTMQ5RsP2+Tpl8Opl/ZvaVRVPiKlvJqEZ9keLBs9oPJV9BQthg
 5qijCUVRCAZbuQzKWRfM8525TyNqDiqukLQhd6Ayr+oj3VAi8UBbl8moRwUl2PIwK05Q
 /liEv1cmO+FYYCWkD9PB9pEF1nKTnN65qxU23KALNBNKH9eFoDluBspEw9LtzjTGXd6w
 vXrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BFpZdmylFWaxjp/eKztb6USl6FN9U+6JIs/PIPKjnRc=;
 b=UtSxpjXuw9mG4fohvZpfTiuJ+yxXVJK+Pemr5zeN/VQVVKJCsXI69k5FxFLaPxIn96
 kEK0YGyY+S2KOhZBkissIoAQ1PLBixziiu1+ryvOF8gv811LFJVGGJZyWEEcMN552SVS
 tovM+UMtzp0aK6YPCOp1hBi3piXUYreQJniv1QKOjFN/1OjMHGGt51NaSPnKu0vN7AAp
 ZoCquQlBBErtqTJshHf61wNe7w3dHVryUNLOkEj9v9K0qkDRoHPtJ7vCZRgkGLJRWS84
 mxjk/PZ1ubyS6tsqyjIYNelg5ZNGFOopkyM7lKfwctRReQLOxBmSG3YHY4PA7Ue9WhAf
 PV0w==
X-Gm-Message-State: AOAM532rTnDB7C39ty6oKLykBWWK0u99K/bIcnKBeiACxU2mQgq0WD/Z
 RYjssFzUB04u1Eg+j5tia5E=
X-Google-Smtp-Source: ABdhPJzAPRTEhTqDe67YQMa1+RCtyyuXKyFuoRwZlIZMVBSj/As0a4YnwYmSvRWTIecaf4LuQzMRTA==
X-Received: by 2002:adf:d1e9:: with SMTP id g9mr2088396wrd.238.1640081609809; 
 Tue, 21 Dec 2021 02:13:29 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id m21sm18012267wrb.2.2021.12.21.02.13.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 02:13:29 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: robdclark@gmail.com
Subject: [PATCH 2/3] drm/msm/mdp4: Add format_mod_supported function
Date: Tue, 21 Dec 2021 11:13:18 +0100
Message-Id: <20211221101319.7980-3-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221101319.7980-1-jose.exposito89@gmail.com>
References: <20211221101319.7980-1-jose.exposito89@gmail.com>
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
Cc: freedreno@lists.freedesktop.org, jernej.skrabec@gmail.com, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, wens@csie.org, maxime@cerno.tech,
 tzimmermann@suse.de,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 sean@poorly.run, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement the missing "drm_plane_funcs.format_mod_supported" function
to avoid exposing an invalid IN_FORMATS blob with modifiers but no
formats.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
index 49bdabea8ed5..8809f1633786 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
@@ -80,6 +80,13 @@ static int mdp4_plane_set_property(struct drm_plane *plane,
 	return -EINVAL;
 }
 
+static bool mdp4_plane_format_mod_supported(struct drm_plane *plane, u32 format,
+		u64 modifier)
+{
+	return (modifier == DRM_FORMAT_MOD_SAMSUNG_64_32_TILE) ||
+	       (modifier == DRM_FORMAT_MOD_LINEAR);
+}
+
 static const struct drm_plane_funcs mdp4_plane_funcs = {
 		.update_plane = drm_atomic_helper_update_plane,
 		.disable_plane = drm_atomic_helper_disable_plane,
@@ -88,6 +95,7 @@ static const struct drm_plane_funcs mdp4_plane_funcs = {
 		.reset = drm_atomic_helper_plane_reset,
 		.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
 		.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
+		.format_mod_supported = mdp4_plane_format_mod_supported,
 };
 
 static void mdp4_plane_cleanup_fb(struct drm_plane *plane,
-- 
2.25.1


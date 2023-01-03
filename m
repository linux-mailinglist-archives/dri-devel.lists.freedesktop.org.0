Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4450465C2FA
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 16:27:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DEAA10E1F9;
	Tue,  3 Jan 2023 15:27:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com
 [IPv6:2607:f8b0:4864:20::e2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9663010E1F9
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jan 2023 15:27:41 +0000 (UTC)
Received: by mail-vs1-xe2a.google.com with SMTP id h27so18335983vsq.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jan 2023 07:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lYzp1sgJFzIzjeht/At2SP3CFYWumSuwKnH+2GC5NAE=;
 b=D+WW65t2fkGC+NXKatGmDTA4QkluHWXv2piKuETEy6ykakE1cnAiAkQwlyT9ivCuQi
 xoBJjTkEDN6Ko6OMYH2wDYNu7iNBOwqdK16+GmcLinRhaDhq9Tn9QKaN+r3tpaaTQHdJ
 7JJsPkMOGz9UNnDNHLFvVxo/RVA338IlwTp1byj4QTjiJ53fSmzc2Z+bea+/cI2ZAZKh
 Ff4DZu1cPpzaH49gi6bWaDgxB6DeeSMCC4fgUUncE6xT6sCVWamSHAR5nvXgbbusFRb4
 CWLF4EwnoZDiCviyPC2gBpHTICPdQbg+IVHZ8TIqhaFBOLKMgVabW7CQCdebqYQb8lat
 Fl6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lYzp1sgJFzIzjeht/At2SP3CFYWumSuwKnH+2GC5NAE=;
 b=rEqhXpP/xaF4BqkkmgVSLyDcA3rBv9Ei/HmJQfKk9DkG2eMkQuJwLvf11rlnCzlrVZ
 LsqepcYA1ltiNCDqVj/eLYSr08TWtwY5XfpbQYAq7I9yEjSnzBgMoOU+J4Vm9JED9pSc
 KO1aSwYL2Wp7XU9KLprOB9xbNVIBHipOgbB3/jDMcx1IMlYpi03giI9xstVx9KRCnD/4
 trfff0BxBfjgwkQQlLOSiL/+XWOLuvzbaSGNQZnXQOMhVNcIxX9+ubipoCzJmnq3ppqj
 Y4I0Jwpdm30DKmN6gT9pGtJFE1d6ckfCmIL5ghzfZREKFy6dlLQi8TamwoVXY5rIR2y1
 XaTg==
X-Gm-Message-State: AFqh2kqRKLxMXHCwiHC7RX4VZDH81dHIOvNWvyM6bZ22fNB1l0MikliL
 fEJwWLMcvm0xgA61f3fBjxNUWWb+XkhVHmVi
X-Google-Smtp-Source: AMrXdXuUejN2i/M+iPxnzkQ6f9kMoqvm/2f91BmH+39GP/a+DIRlO1GUT4LJMT7FqiBippMVLfNEwg==
X-Received: by 2002:a05:6102:a4a:b0:3cb:93d:406f with SMTP id
 i10-20020a0561020a4a00b003cb093d406fmr11924966vss.32.1672759659941; 
 Tue, 03 Jan 2023 07:27:39 -0800 (PST)
Received: from localhost (200.234.86.34.bc.googleusercontent.com.
 [34.86.234.200]) by smtp.gmail.com with ESMTPSA id
 s6-20020a05620a254600b007055fa93060sm2528510qko.79.2023.01.03.07.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 07:27:38 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/docs: Explicitly document default CRTC background behavior
Date: Tue,  3 Jan 2023 15:27:38 +0000
Message-Id: <20230103152738.1213785-1-sean@poorly.run>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
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
Cc: Sean Paul <seanpaul@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Add a paragraph explaining that the default behavior for areas which
are not covered by planes or where planes are blending with the CRTC
background, is black.

This is alluded to in the "pixel blend mode" property docs, but not
called out explicitly.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/drm_plane.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 33357629a7f5..24e7998d1731 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -46,6 +46,11 @@
  * properties that specify how the pixels are positioned and blended, like
  * rotation or Z-position. All these properties are stored in &drm_plane_state.
  *
+ * Unless explicitly specified (via CRTC property or otherwise), the active area
+ * of a CRTC will be black by default. This means portions of the active area
+ * which are not covered by a plane will be black, and alpha blending of any
+ * planes with the CRTC background will blend with black at the lowest zpos.
+ *
  * To create a plane, a KMS drivers allocates and zeroes an instances of
  * &struct drm_plane (possibly as part of a larger structure) and registers it
  * with a call to drm_universal_plane_init().
-- 
Sean Paul, Software Engineer, Google / Chromium OS


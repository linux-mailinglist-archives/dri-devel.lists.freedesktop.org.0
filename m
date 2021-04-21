Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A60E2367395
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 21:43:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 622A16E9E3;
	Wed, 21 Apr 2021 19:42:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BD686E9E1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 19:42:56 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id y204so21427014wmg.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 12:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ShTncdUzjrz6cNLv2EKSnQN/sv7lyGf36TiUA7bk/P0=;
 b=JhGwi36fjJc+zoWDVEAcd8lB5RGChTW67hYEkCOC1tUmIaOKPqs6rnKskCvBMnZFpf
 5yJA3OwFHq4WOCETMWUgYec55fTPCbFSU+jC18CLuvetf0yj+n7EQNZisWMcFu/nYbGp
 NCQDiuXgo+tvAK23b+z7iRoLHRJZRqA3teYaefAytAwg9/hsWCYG61AF3eyjdKLX+cFR
 uqy8MjhmOKF0zzGbfPdDtKe/piA7+lFKCJwC2kOkUWwd6b4RDyHRnacdwc/CxyCo24Cm
 /KXHz7sxjXjmHprM6h5KPF2uBK8beIqsEkKNkJ+aV6yaitcNzkr1tZOzJUR2FEdCKRCz
 hxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ShTncdUzjrz6cNLv2EKSnQN/sv7lyGf36TiUA7bk/P0=;
 b=Exs2qnz75gG1J7YH73MOB5Z68UEUxXZWrK/cXbEg14STKZDNNknOsrOnutU9gu3UPX
 9CnEV4lYLHxdhMotWVy5UOfjgl2aq10PKV/ccdxoHiaO6CfVU+jJ4dhNtJZ2cKnKkoGO
 1A93ZLGxkInL29tb68Qt/vJomcZziy2Cf8MMB1xoH99QDRccZTO5X4CUZ5Mcj8f5yYak
 3JlKwk2tkfIKvY9WTEX4V5OwpmdoE9gXPR4csCBMnLUU246Sef1WdHPRO+MUPu1hatWl
 3ptDvz0tx71dV9a7uiSyqVUSD79JZbOFxkcPlFzsJbq0bcUcgdrrWmMe/lZRzbU9E7zN
 VAlA==
X-Gm-Message-State: AOAM530NoyXUnue1QVOH6y+BwjI4ZHkpHwIV7vzqJJ7sFWcoN07iz3IB
 Fg/8s6sqdwmcFgF7tsr86iA=
X-Google-Smtp-Source: ABdhPJzdYSdyl7cnO5J1oIr2zrMu2Krywp24GqqGQ0qefC5fYcnsi8ZReoTLrjM0QPEQXbYRLmFNdw==
X-Received: by 2002:a05:600c:d9:: with SMTP id
 u25mr11619370wmm.151.1619034175119; 
 Wed, 21 Apr 2021 12:42:55 -0700 (PDT)
Received: from bcarvalho-Ubuntu.lan ([2001:818:de85:7e00:6d3d:2d8b:5417:831c])
 by smtp.gmail.com with ESMTPSA id
 o4sm484163wrn.81.2021.04.21.12.42.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 12:42:54 -0700 (PDT)
From: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 2/3] drm: drm_blend.c: Use tabs for code indents
Date: Wed, 21 Apr 2021 20:42:48 +0100
Message-Id: <f441188f84aac2f9f72f36a42c88623b16cd1f87.1618828127.git.martinsdecarvalhobeatriz@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1618828127.git.martinsdecarvalhobeatriz@gmail.com>
References: <cover.1618828127.git.martinsdecarvalhobeatriz@gmail.com>
MIME-Version: 1.0
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
Cc: melissa.srw@gmail.com, outreachy-kernel@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove space and use tabs for indent the code to follow the
Linux kernel coding conventions.
Problem found by checkpatch.

Signed-off-by: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
---
 drivers/gpu/drm/drm_blend.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index 26e2f2ffd255..ec37cbfabb50 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -328,8 +328,8 @@ unsigned int drm_rotation_simplify(unsigned int rotation,
 	if (rotation & ~supported_rotations) {
 		rotation ^= DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y;
 		rotation = (rotation & DRM_MODE_REFLECT_MASK) |
-		           BIT((ffs(rotation & DRM_MODE_ROTATE_MASK) + 1)
-		           % 4);
+			    BIT((ffs(rotation & DRM_MODE_ROTATE_MASK) + 1)
+			    % 4);
 	}
 
 	return rotation;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

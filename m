Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 018E75141F3
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 07:49:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E01DC10FB64;
	Fri, 29 Apr 2022 05:49:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3431410FB64
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 05:49:55 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id a5so4735473qvx.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 22:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=endm34N778Y0yPQpBj2UP5snb4XdIvtKjFf8w3OhWl8=;
 b=LLeap5fbMQ7b+CBIddQvpBa4S02DmgF9iWKlwwlY7N/Ft27Cf49xhkkH0FUBnoepSd
 yg2kvR+WLjB1EXt1DIp5XFbBMTOMYuts6P64qmU+fN3/kRke/u3r77g+atqGw9Ne6b3X
 f+HWlYDHVmhXMoKop4bbdBqyL+UgbHod2Y5HuaLbnx0AXMg23T6jwfHUYi6hfxZY+d6c
 P4e5BsNc6sozibBpMFDVLvCdij+x3IFCtgHc0seTmei1OZxmy2i3fq/5RoD/tIazF/7z
 nmyqLRu2GeTAwFVCYr+bLOiLCvNxB7J3ygB07QJ5YoDBBBo9i6ptDB7l2Yro46eMvRNa
 0fRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=endm34N778Y0yPQpBj2UP5snb4XdIvtKjFf8w3OhWl8=;
 b=FsOOSp95Mem3EZwYUqTznRASkOhbvqoMDE9bmox45H60zdLQg+zr1qV0LLsBfmR5AY
 iAAhNa3lPPZRCDcyD6BcGxOLr1+yXXJIA33T1hzv5T974hu0SkTJQqSHmfo04XbuTAjh
 kVEhaUULwZh+dHF2Bq28wZ+T83uThuuazHf9znB2CYS/pdhydEWrz1iBmcvEtZW5K4dy
 DhORW1gmJQcBaeApUGiblQbiDzc+QhJv5H8xBix8sxbATWwPsNhjkMwfgjnmRqQ4ZpR7
 y59MGslv9OAeUKqnxrzUjRJ++SSNpVMGQOaiK6uGOCVa1QQnD63IKLPVqw8XCdAFRdha
 9QZA==
X-Gm-Message-State: AOAM532CTclOLSfnuJDwOomAlU5kt65o9goitZsbrVRmekj/MI/XCrm1
 6zQ8VpUNW08kFQW1dC5oeyc=
X-Google-Smtp-Source: ABdhPJwBF67M3QN/ElCsgdd6o9uNM8BS8M4Da5QnAkLxYu3P+S576fZbIGm6W9QO+sY2j1Q+QAT6cg==
X-Received: by 2002:ad4:576a:0:b0:456:54f0:824f with SMTP id
 r10-20020ad4576a000000b0045654f0824fmr6965315qvx.31.1651211394421; 
 Thu, 28 Apr 2022 22:49:54 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 h23-20020ac85697000000b002f387e4000dsm1146595qta.11.2022.04.28.22.49.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 22:49:54 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: emma@anholt.net
Subject: [PATCH] drm/vc4: simplify the return expression of vc4_prepare_fb()
Date: Fri, 29 Apr 2022 05:49:45 +0000
Message-Id: <20220429054945.3852039-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: airlied@linux.ie, Zeal Robot <zealci@zte.com.cn>,
 linux-kernel@vger.kernel.org, Minghao Chi <chi.minghao@zte.com.cn>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Minghao Chi <chi.minghao@zte.com.cn>

Simplify the return expression.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 920a9eefe426..b3438f4a81ce 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -1350,7 +1350,6 @@ static int vc4_prepare_fb(struct drm_plane *plane,
 			  struct drm_plane_state *state)
 {
 	struct vc4_bo *bo;
-	int ret;
 
 	if (!state->fb)
 		return 0;
@@ -1362,11 +1361,7 @@ static int vc4_prepare_fb(struct drm_plane *plane,
 	if (plane->state->fb == state->fb)
 		return 0;
 
-	ret = vc4_bo_inc_usecnt(bo);
-	if (ret)
-		return ret;
-
-	return 0;
+	return vc4_bo_inc_usecnt(bo);
 }
 
 static void vc4_cleanup_fb(struct drm_plane *plane,
-- 
2.25.1



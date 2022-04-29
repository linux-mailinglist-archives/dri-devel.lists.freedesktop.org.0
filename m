Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B5F514500
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 11:02:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32F6F10FB9E;
	Fri, 29 Apr 2022 09:02:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D56AB10FB9E
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 09:02:15 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id 1so4919438qvs.8
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 02:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ftw/6Pk4qbemIBSil+khGkXsfOxW2R3zaTxbYT7tF+A=;
 b=g9I5NVSJ9ufUt1fbkyLlV3mWDiV9nFd2/RUyQGVUzcNDw9sl0UmRAWosE4/J4sazEZ
 8iWEoZ8Xx7QFktAcdgQJkezZLP6ZjvM5iVoHlj98+CHXnP7mm2DgzQNe79yqXjJt3B5l
 d9xYEkwbCpoMZ93dZXAvm5yNgaMjz5CiT4YLxKRTXCktZ8h+NLc9NbndeS5CkVnzr9eA
 SbJA2+Ryiq7ZFqqFlu9eBmDsUqDmRplRCb+SWSY6HcaIUHMDruLqyGVjEe2p8LYlrbtI
 hcoogv5MEsakduy4A1uIgDuKKYKEkt0VmtRAEJAhMh8hsjciDgAEjPwJd6iqnAIKg+sK
 g3sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ftw/6Pk4qbemIBSil+khGkXsfOxW2R3zaTxbYT7tF+A=;
 b=ut8XYKGaNTYOBeRRL807vd1FBQ1M/DuvwrILUJ3Z7rwV+K8/GYEpRDykndmCILmh54
 83HMT/JqHBNwv+8rMF8+n1/43aZvFU6HcOto9o92fpj4Dxx385OszYl/HdmPg0lDUuDT
 bBWxT/KsS/hCU9PR2yXp+ZuNhbiUlXeQXwR8Q4wGoIk08XnMuqC2qGDym5IGMuaiFYHt
 MpJbsN2TVKLZsuCS4HUPLKOqwy5nEEkeIm2RRs1AKd3LMaPB4KJqzjmTcLn/rF7cuM2M
 9K8cBxFv4jJ1VjuizxcP9YF3pyVhx82QPJb403jEbd0Rm2exnweTaVUhdDRAYYrSOt3H
 RViQ==
X-Gm-Message-State: AOAM530/tcInePsOFOiVFi9SoSKvqtQlSuk5t9PeNz1ISxuHzD+jYrdH
 Lqdv9CgiTZcMb1W8mwvfgTA=
X-Google-Smtp-Source: ABdhPJyn1R6CWyOXY9xNshd752lxFwFyqlwS8tg5kNtq/QkhdR372HrgV7iIUfVitFDTvN2FfKOdOg==
X-Received: by 2002:a05:6214:2485:b0:452:ce7c:2dc3 with SMTP id
 gi5-20020a056214248500b00452ce7c2dc3mr15545677qvb.9.1651222935039; 
 Fri, 29 Apr 2022 02:02:15 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 o21-20020a05620a0d5500b0069c59fae1a5sm1106657qkl.96.2022.04.29.02.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 02:02:14 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: emma@anholt.net
Subject: [PATCH] drm/vc4: simplify the return expression of vc4_grab_bin_bo()
Date: Fri, 29 Apr 2022 09:02:08 +0000
Message-Id: <20220429090208.3852879-1-chi.minghao@zte.com.cn>
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
 drivers/gpu/drm/vc4/vc4_bo.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index e451cc5bcfac..49c0f2ac868b 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -738,19 +738,13 @@ static const struct drm_gem_object_funcs vc4_gem_object_funcs = {
 
 static int vc4_grab_bin_bo(struct vc4_dev *vc4, struct vc4_file *vc4file)
 {
-	int ret;
-
 	if (!vc4->v3d)
 		return -ENODEV;
 
 	if (vc4file->bin_bo_used)
 		return 0;
 
-	ret = vc4_v3d_bin_bo_get(vc4, &vc4file->bin_bo_used);
-	if (ret)
-		return ret;
-
-	return 0;
+	return vc4_v3d_bin_bo_get(vc4, &vc4file->bin_bo_used);
 }
 
 int vc4_create_bo_ioctl(struct drm_device *dev, void *data,
-- 
2.25.1



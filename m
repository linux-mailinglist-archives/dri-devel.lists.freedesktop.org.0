Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC82F1C9409
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 17:11:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD4A6EA0E;
	Thu,  7 May 2020 15:11:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 789766EA0C
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 15:11:23 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id g13so6818200wrb.8
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 08:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GIQ4c/yY/MjQxSYXQx75OvaHXjlgUTNA67VrFmayfpM=;
 b=svaU3H6iVe9BnCtqT+h8Kwq2B++lTxjmDHIO8vZYhVYrM8OlbSwk7xJNI4d/8L7TIS
 sXMCI04A9VOyNGWBmNExSBwI5XB7iX0jZzWncBlN/PO6Z7XCWv9DAHoP1Se58NriE4+E
 P7besns2sZMc6VHHRoxo4a4Xxn2/ntfOZYyoUrNxJfKZUiOO8mUeK9FtPs8swCZX3kdR
 hUW4tYhE7rxlcvER8czOsYTqiaN2PxhZCpKcQmW9jdxKz+rVDtPBuwZpO6M3E4hXXTWo
 +YXArRFcezeStes6P4xhZ64Aof4tZ9OK8/kjzCKdVdSs5wH/moZ5wM7ftDFdCCqsllQ1
 O3Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GIQ4c/yY/MjQxSYXQx75OvaHXjlgUTNA67VrFmayfpM=;
 b=C/OyGaMzvm67aQX9T9R2nloNWETmDyhIr6XHPEnHqL6Z+JUEqBZJX81gSrWfVQCIJq
 pifkqo3XAHkg85TlmpC8w81EFTw1P17ZOpoJcBi5weQSvLSnMxHw4Hj6Gu46lxtKGEAj
 qdWVWYTYGNBkHnH4EnYrEUdF4DojvUu/BUK8C+91OhX7h83nz+0liDzq/+72Pnvt7bmd
 oQ2MPMPBGmDiv5Q3rN0CTtU/L4S5NszcCKKxR0YvHxszGzfrI/bU6Irgzc9NbCp/9uBf
 ovjos84SHGlDC6tHEKhmc2oBdsqew6xwm2wUlcaxpK6IELX1pfamibXkJex9N4HKeHAR
 r7+Q==
X-Gm-Message-State: AGi0PuZRygtf39jVUXX2fHXG4mVafswmaOMh+1b2HEmxEq3MO7Cx3r5A
 zuyYUfkRm+x+VfxHwld+j3GxZSzB
X-Google-Smtp-Source: APiQypItFY219sX6Ko9vEDhPAZmDmB+yYBfe03Ce2iSsRD3VNVPHVra32F/YmTuixIeY87N3gqxL/Q==
X-Received: by 2002:a5d:408b:: with SMTP id o11mr14803263wrp.97.1588864281618; 
 Thu, 07 May 2020 08:11:21 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id b66sm8704247wmh.12.2020.05.07.08.11.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 08:11:20 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 21/36] drm/mgag200: remove _unlocked suffix in
 drm_object_put_unlocked
Date: Thu,  7 May 2020 16:08:07 +0100
Message-Id: <20200507150822.114464-22-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200507150822.114464-1-emil.l.velikov@gmail.com>
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Dave Airlie <airlied@redhat.com>,
 emil.l.velikov@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

Spelling out _unlocked for each and every driver is a annoying.
Especially if we consider how many drivers, do not know (or need to)
about the horror stories involving struct_mutex.

Just drop the suffix. It makes the API cleaner.

Done via the following script:

__from=drm_gem_object_put_unlocked
__to=drm_gem_object_put
for __file in $(git grep --name-only $__from); do
  sed -i  "s/$__from/$__to/g" $__file;
done

Cc: Dave Airlie <airlied@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/mgag200/mgag200_cursor.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_cursor.c b/drivers/gpu/drm/mgag200/mgag200_cursor.c
index d491edd317ff..1a50836e003e 100644
--- a/drivers/gpu/drm/mgag200/mgag200_cursor.c
+++ b/drivers/gpu/drm/mgag200/mgag200_cursor.c
@@ -286,7 +286,7 @@ int mgag200_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
 		ret = PTR_ERR(src);
 		dev_err(&dev->pdev->dev,
 			"failed to map user buffer updates\n");
-		goto err_drm_gem_object_put_unlocked;
+		goto err_drm_gem_object_put;
 	}
 
 	ret = mgag200_show_cursor(mdev, src, width, height);
@@ -295,13 +295,13 @@ int mgag200_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
 
 	/* Now update internal buffer pointers */
 	drm_gem_vram_vunmap(gbo, src);
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 
 	return 0;
 err_drm_gem_vram_vunmap:
 	drm_gem_vram_vunmap(gbo, src);
-err_drm_gem_object_put_unlocked:
-	drm_gem_object_put_unlocked(obj);
+err_drm_gem_object_put:
+	drm_gem_object_put(obj);
 	return ret;
 }
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

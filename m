Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C7FB958A9
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 13:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F257C10E1F3;
	Tue, 23 Sep 2025 11:00:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gE6dz1Ja";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4AC10E1F3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 11:00:48 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-b556b3501easo150380a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 04:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758625248; x=1759230048; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J+d0uNuVR4m+R+a1nNiakMPI+senyqQHCOr95TAfxeQ=;
 b=gE6dz1JaqXdadKrvDvP2gWlgV5wK6pk4deKd8kVY1P/O2BHmhc3Ck/IZI1/ntzZTJP
 9z8QUExzDMaa9cPk5g5WrmB/sbdvQCaIfJLdxVNSsC5je11+WH4oN4r55W0gPqzTOaKb
 jQrI4u9atVMDyiWP92PNJ/d75Hw4FgzKEA7ObhY1cbJrGg+nN4MzHvTGsCuilhn3cydo
 IqohvV/buN6i/kySRuNK53WdI6j6p7rHgN6AXY3h0qi4VlzHXMF16QCto2zwx2EnY/UW
 kDFlvyiAsPG6KXDE3yOqt26Qvnc8nI6wBZ8elxsbBA/+yYR05iOuZtiJ1vPYJphvQPXp
 PiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758625248; x=1759230048;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J+d0uNuVR4m+R+a1nNiakMPI+senyqQHCOr95TAfxeQ=;
 b=opHwFKSoGPpjJbvzB/MDiGAN8IJAsmx3BpqOEGwXSvcSxiAy3nJd+aHDTxDiw2o6NZ
 rQruZvLjkFbl+7jMpt03el3pMWXBpKEXaqTuB5KKpZK29UWCl6yv1eJ3GHEet3QGVbud
 a06fho2BeqmnS+L589Xk0nnDlTvruKUrCP/AY/wEqgQMGBrJo47cbB+XNBoVb4KarE95
 4SiozwD6OU5amwGzatTEyD7RTACs8pO94IClKEK1//1Udg89TpTsmsjp+SlyZEiadojT
 ubZUDhrrPup2N6dbAZNB9YYOYZ6HydRY3f5SMZv45T1aPmZoBTkBIEg8wiDQ+1GmuTnq
 q/Tw==
X-Gm-Message-State: AOJu0Yw64NOXi7B7TK2mk6dNyvWfMuKnJSSmQsW659LLt7MVrcyeKX7t
 syunMpjf6YIN08hrj0tmrBZWjUCfhCs8H0uHo+GqiSuicxJ1zNOv0VL7
X-Gm-Gg: ASbGnctFzteqFykP7KWiKYJ47FLzNHFK7KeoH1Ec+Pn2vX8x17fzWOtVc6Hj5BTGFC3
 7jkyu7KRcPSGBUoiuZJrOyuqhuYeTYTbypZJvsbeK1JWiIxJvTZQMiTotWTtgj00OMa12SZNGfP
 rN1qXq9guJQyIv+43k1DTBJVCPHk++S8/dZvaDFuN8wa7vyrbNx1xHeojI647DagDWwNQZk97Cg
 Oq+qZHhmkCmeGSXtYIk+Z21QoJCR7/MKdNXYs2whTu4L3zQl2cHaAyE0a1qJgTN036ScpwQYaTz
 NAAJq94kFW11IxF5JSPdOMLCk3FaTf7N4Dp+GzWDFCSxo9rLOpz64T9WYUlOgeARR/6szpBQV8D
 ZjM0wlxjWyFmzv4wK7F+BS3KanVjodx0HHVkW9B1loD7nKPM=
X-Google-Smtp-Source: AGHT+IEYvec2VOJUIP0HzhEx0k08gqrbQ//jHK3lUuVH/vw6V0w+nLGE6iuJ0m4g0yvADc24CIGTDQ==
X-Received: by 2002:a17:902:e5d1:b0:274:9dae:6a6d with SMTP id
 d9443c01a7336-27cc5624d90mr26228805ad.34.1758625248034; 
 Tue, 23 Sep 2025 04:00:48 -0700 (PDT)
Received: from localhost.localdomain ([165.204.156.251])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2699363989fsm151910135ad.92.2025.09.23.04.00.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Sep 2025 04:00:46 -0700 (PDT)
From: Rahul Kumar <rk0006818@gmail.com>
To: lanzano.alex@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 rk0006818@gmail.com
Subject: [PATCH] drm/tiny: Use kmalloc_array() instead of kmalloc()
Date: Tue, 23 Sep 2025 16:30:25 +0530
Message-ID: <20250923110025.1358920-1-rk0006818@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Documentation/process/deprecated.rst recommends against the use of
kmalloc with dynamic size calculations due to the risk of overflow and
smaller allocation being made than the caller was expecting.

Replace kmalloc() with kmalloc_array() in drivers/gpu/drm/tiny/repaper.c
to make the intended allocation size clearer and avoid potential overflow
issues.

Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
---
 drivers/gpu/drm/tiny/repaper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index 5c3b51eb0a97..4d439a2d973a 100644
--- a/drivers/gpu/drm/tiny/repaper.c
+++ b/drivers/gpu/drm/tiny/repaper.c
@@ -535,7 +535,7 @@ static int repaper_fb_dirty(struct drm_framebuffer *fb,
 	DRM_DEBUG("Flushing [FB:%d] st=%ums\n", fb->base.id,
 		  epd->factored_stage_time);
 
-	buf = kmalloc(fb->width * fb->height / 8, GFP_KERNEL);
+	buf = kmalloc_array(fb->width, fb->height / 8, GFP_KERNEL);
 	if (!buf) {
 		ret = -ENOMEM;
 		goto out_exit;
-- 
2.43.0


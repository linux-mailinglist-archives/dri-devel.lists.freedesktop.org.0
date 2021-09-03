Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8458E400515
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 20:44:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B4DF6E8C8;
	Fri,  3 Sep 2021 18:44:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC226E8C8
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 18:44:05 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id i13so155376pjv.5
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Sep 2021 11:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eyojo/FU7HpdjFjjRk2IuNM8ZY2w6msCme6CI+gvloQ=;
 b=Jle+57j4upGPRjXNbaEqSztuj0f6Yb89G5etD5eu/MWSmTzSQLdcY9aSC4bvk9NgF1
 B73EHMp0Pq7oYRsGNjDHPw27q+AI884CvvWC9p7jgUJcDTgzICaum4nZtaMd7MrbRNea
 hwgSWjuXA6KaCHKFiRnoUs+GUO6C9k6BT5orBOzn5SO5tto3pQT6b6agrUIu5x84yjFI
 F+wSTLgiGfh/I9GRW99gmnjgXWe0cZ9mKY7t0dgwIRXzT324T1DgHgmlKMqjqG10hwq2
 4T3tIo8j6hkFjRsimIoWtUyCohrZr7uuZDfMDRa3lfpsHhz252Bt1AQqnT/Sh6IuUmbH
 vrAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eyojo/FU7HpdjFjjRk2IuNM8ZY2w6msCme6CI+gvloQ=;
 b=rEmlypPWTxRLJ/5JhvviC9StkURLQEXvoZjeBfS1kwLFarFWOoGXMgyCa4rb4DVjys
 JKLkK6LCHFq13qQyboZrJiVEqqg4GihiKhLfUWBgtuyEyWiwSbGT3Q/uUV3p5JGjvZAU
 A8uJon80T6W9x6FCPxuSGOxLOzmbVMYHJBLF3eBr8Tfg7lSIipuZlYZDUjjEzAAGCLIR
 EsMQAECPVjLc0vetCi1T1MTjBt/U9sAfz8+CUaMPZkw1CGHbMQh6dISfeE75Cvup1hb0
 06TXQHh4/zOlTiFOck+uuHyWDv+Lr2ecBWrL/W6QMCM7/Yl1sPV4DKZdAfQkgxeo+tre
 PvEA==
X-Gm-Message-State: AOAM5335ImHrYEmj3MjlE9/nk45gG87PbHDnlEik+eOK3azNX4kO35M7
 MOxcf6aiKO/69DcZhtTQfKzKb5Ah27w=
X-Google-Smtp-Source: ABdhPJw0FDzWhJ8bPwVk6QAaf2B4P6pM+LmBb405l9ks0Yxi7fG1rOZqawLmXuTs57n84BGKHaKfOA==
X-Received: by 2002:a17:902:7611:b029:12c:b602:5820 with SMTP id
 k17-20020a1709027611b029012cb6025820mr302389pll.6.1630694644565; 
 Fri, 03 Sep 2021 11:44:04 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 10sm110948pgd.12.2021.09.03.11.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 11:44:03 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Cc: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 Pekka Paalanen <ppaalanen@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 2/9] drm/vblank: Add helper to get next vblank time
Date: Fri,  3 Sep 2021 11:47:53 -0700
Message-Id: <20210903184806.1680887-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903184806.1680887-1-robdclark@gmail.com>
References: <20210903184806.1680887-1-robdclark@gmail.com>
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

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_vblank.c | 32 ++++++++++++++++++++++++++++++++
 include/drm/drm_vblank.h     |  1 +
 2 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index b701cda86d0c..ec2732664b95 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -980,6 +980,38 @@ u64 drm_crtc_vblank_count_and_time(struct drm_crtc *crtc,
 }
 EXPORT_SYMBOL(drm_crtc_vblank_count_and_time);
 
+/**
+ * drm_crtc_next_vblank_time - calculate the time of the next vblank
+ * @crtc: the crtc for which to calculate next vblank time
+ * @vblanktime: pointer to time to receive the next vblank timestamp.
+ *
+ * Calculate the expected time of the next vblank based on time of previous
+ * vblank and frame duration
+ */
+int drm_crtc_next_vblank_time(struct drm_crtc *crtc, ktime_t *vblanktime)
+{
+	unsigned int pipe = drm_crtc_index(crtc);
+	struct drm_vblank_crtc *vblank = &crtc->dev->vblank[pipe];
+	u64 count;
+
+	if (!vblank->framedur_ns)
+		return -EINVAL;
+
+	count = drm_vblank_count_and_time(crtc->dev, pipe, vblanktime);
+
+	/*
+	 * If we don't get a valid count, then we probably also don't
+	 * have a valid time:
+	 */
+	if (!count)
+		return -EINVAL;
+
+	*vblanktime = ktime_add(*vblanktime, ns_to_ktime(vblank->framedur_ns));
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_crtc_next_vblank_time);
+
 static void send_vblank_event(struct drm_device *dev,
 		struct drm_pending_vblank_event *e,
 		u64 seq, ktime_t now)
diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
index 733a3e2d1d10..a63bc2c92f3c 100644
--- a/include/drm/drm_vblank.h
+++ b/include/drm/drm_vblank.h
@@ -230,6 +230,7 @@ bool drm_dev_has_vblank(const struct drm_device *dev);
 u64 drm_crtc_vblank_count(struct drm_crtc *crtc);
 u64 drm_crtc_vblank_count_and_time(struct drm_crtc *crtc,
 				   ktime_t *vblanktime);
+int drm_crtc_next_vblank_time(struct drm_crtc *crtc, ktime_t *vblanktime);
 void drm_crtc_send_vblank_event(struct drm_crtc *crtc,
 			       struct drm_pending_vblank_event *e);
 void drm_crtc_arm_vblank_event(struct drm_crtc *crtc,
-- 
2.31.1


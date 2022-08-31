Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EAD5A8668
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 21:06:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A3910E032;
	Wed, 31 Aug 2022 19:06:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E71A10E032
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Aug 2022 19:06:07 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 t11-20020a17090a510b00b001fac77e9d1fso172557pjh.5
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Aug 2022 12:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=t9nkfZEyPsyobY4BF8QWflVAKFbRwcQ/dQ/3Tr/GPQ8=;
 b=lRzt2fZiaWLow8SiLm73H9pv8b9cRl7u+7+nwnwQ7Z0mkMQUznYorlPpHABLrcglg8
 InNdPtGVF2+ot1FxG9spMw/8yObsLBUJlA44b20855x8lH1rbSwew57f0eNpUArBZZHB
 QidKd8JfB1Ja0Ap3k9mWLvWGuITfFk27s2LlcH0SarQSxJHxSKheMH1NO0kUnQjmgafP
 eQ2qBkMqx8WOp22UYghY3Hl1pVzcBX4Ebz/IBYURByc3V23Nyz+hUjDv79lsjxunQR5I
 zk0REw/ud1Bu8kR5ZarYEExAhzJcMHuNFxNn7O/ZCe6DhmIPbEYNTZNDuQHzEv77wlY5
 /7jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=t9nkfZEyPsyobY4BF8QWflVAKFbRwcQ/dQ/3Tr/GPQ8=;
 b=m+DI2vvPN5yccVVlCYkWwEtO3rjViiLNUxo/CGoOR5syrGAluVfie4raJhorlMSy1Z
 57vZYTEU0FtKATnHxPo1PwQAEduB1bvjIlmCEJagt+gJ0O261+1lPaoiUd4B3avgSzGc
 RarY12aDcTrB9ftPLriVcggCqubE8u0gAfKGarLDGqhUKpL1iLqv5oxLb55VBLE6uVYM
 bMP1yxINKPa6EL8/3qS/ljsK13YmkqwT3v/WKk/KKENe2HCb8B+P7+ASEi2WGFDGOal+
 ifuR1m85ekhapYEiXQSejeqGhzb3Zr4NfkAsskHr//y7aI53Ivjo0ZQXUXWEOdWBQ7D0
 klJw==
X-Gm-Message-State: ACgBeo0S8O00T9pxg324m6PxXJz5CCBpimkfJXQ2pcWHahIExzznqJYh
 tUstgKuCEimJDRZcubqu2KUptFvr0+w=
X-Google-Smtp-Source: AA6agR7SDIMoAlSBJxWQT/X2ybX2wf4K1lJyY9hJUb5G5fk7kiBfspMw3I9UZZXBecrP7I+oYEAnQA==
X-Received: by 2002:a17:90b:1812:b0:1fd:d509:93e5 with SMTP id
 lw18-20020a17090b181200b001fdd50993e5mr4717865pjb.25.1661972767123; 
 Wed, 31 Aug 2022 12:06:07 -0700 (PDT)
Received: from olv-glaptop.corp.google.com
 ([2620:0:1000:2514:7dac:af8e:fd67:5cf7])
 by smtp.gmail.com with ESMTPSA id
 h187-20020a62dec4000000b0053639773ad8sm11686053pfg.119.2022.08.31.12.06.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 12:06:06 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: set fb_modifiers_not_supported
Date: Wed, 31 Aug 2022 12:06:01 -0700
Message-Id: <20220831190601.1295129-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
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
Cc: Shao-Chuan Lee <shaochuan@chromium.org>, David Airlie <airlied@linux.ie>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, virtualization@lists.linux-foundation.org,
 Tomohito Esaki <etom@igel.co.jp>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Without this, the drm core advertises LINEAR modifier which is
incorrect.

Also userspace virgl does not support modifiers.  For example, it causes
chrome on ozone/drm to fail with "Failed to create scanout buffer".

Fixes: 2af104290da5 ("drm: introduce fb_modifiers_not_supported flag in mode_config")
Suggested-by: Shao-Chuan Lee <shaochuan@chromium.org>
Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_display.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index 5c7f198c0712..9ea7611a9e0f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -349,6 +349,8 @@ int virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev)
 	vgdev->ddev->mode_config.max_width = XRES_MAX;
 	vgdev->ddev->mode_config.max_height = YRES_MAX;
 
+	vgdev->ddev->mode_config.fb_modifiers_not_supported = true;
+
 	for (i = 0 ; i < vgdev->num_scanouts; ++i)
 		vgdev_output_init(vgdev, i);
 
-- 
2.37.2.789.g6183377224-goog


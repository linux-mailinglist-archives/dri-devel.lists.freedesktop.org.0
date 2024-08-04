Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CF2946FED
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2024 19:06:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DDA810E0E2;
	Sun,  4 Aug 2024 17:06:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J+uNFdqy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B30C10E0E2
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2024 17:06:08 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-428035c0bb2so26869985e9.1
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Aug 2024 10:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722791167; x=1723395967; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4PeGkAqwlK/5hc67fq6/8GiQEA+H64FAGEN/Ha1SuCA=;
 b=J+uNFdqywvzzLFbuhyYA97gXJMW0yKWerg3rw07+lhzx/MltJmQOVOPiqoh/gNlZbM
 zpeVKduPH7EykGK7336fi3DvDkf7nbXQD4N+RbT3Z+SYbuzKCpdLxKcEedUDQXlqbXsh
 3SzV69PAEH4Nui6Cku8tbEy3Ooyyb8HYAgVz6f7ZiF/YNmnmun97G36plKN64xhM6k3A
 DP9DjWfPMGYvJ0gqDVKzFGmIbwkyEeaIXzVZqOC+gXfRlHzhXCLQABl38BtThpjwyz88
 tq7x2cbQOiR73axYg1Vkpid8oewpWnNKYUNTlOPO4GRu94GUwEd1NczdSYoeyr1zw7OP
 QApg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722791167; x=1723395967;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4PeGkAqwlK/5hc67fq6/8GiQEA+H64FAGEN/Ha1SuCA=;
 b=U8WAw/F3ZHJq4jhfqXe2sdiwo418l4ynvXRiDSe53Be+QPNBldPdvB24rr86uK3oOF
 koEVibNvVUB98lq5PXwhDKFSzN9pFhMxbgTWDlvM2kTYllg9jOcNa0xyxCHLeELy+59q
 aADYE77vcYgb7dyYFJ3dajX8kU3pBIWru3JqqWuLG3XG1GsxXqqV4Frz17kBsGh2pDnE
 xXXCVI6YVDPv2q27dj0gvhgpz2RiVFQlgZGcat8Cl3//tEEsNcykDW0Lh7Y5iZaFqQtz
 OuRjI9qF7HRdjPIb1ZiGCTACN/GLmeHqUpztutXPx93ai9H5JPxoriRH2DaP+iDn8b51
 lw9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnARd+FxAH2vdR2H0b9EQSF1BaGY0awXYk4c9YugmDTAqYWAhlvefLq4YMAiLa+OwEjKpfJbJPgd1atdgqovByPiTFd2gEJyZ95LRJOvQE
X-Gm-Message-State: AOJu0YxG3oEOfZs8O1PDNpz0bnBLwxhd3FRYaYauWQN8PsrWXqMot9k3
 GlsznqRBo40wIYoq+aMUiII/8SLlpvvj3ajdSw+m3K+No7dl6eu5
X-Google-Smtp-Source: AGHT+IEgVvrEgv7hcfvABXrrT21NZew/QZfcRx3nbNREQCfAWCnsVnqz+hurRUO/dy28W87dIgWm9g==
X-Received: by 2002:a05:6000:bc9:b0:36b:a9e8:6b5 with SMTP id
 ffacd0b85a97d-36bbbe3f759mr6977726f8f.10.1722791166290; 
 Sun, 04 Aug 2024 10:06:06 -0700 (PDT)
Received: from fedora.. ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36bbd059801sm7424502f8f.83.2024.08.04.10.06.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Aug 2024 10:06:05 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: maarten.lankhorst@linux.intel.com
Cc: mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH] drm/connector: Document destroy hook in drmm init functions
Date: Sun,  4 Aug 2024 19:05:52 +0200
Message-ID: <20240804170551.33971-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.45.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document that the drm_connector_funcs.destroy hook must be NULL in
drmm_connector_init() and drmm_connector_hdmi_init().

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/drm_connector.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 7c44e3a1d8e0..292aaffb6aab 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -426,6 +426,8 @@ static void drm_connector_cleanup_action(struct drm_device *dev,
  *
  * The connector structure should be allocated with drmm_kzalloc().
  *
+ * The @drm_connector_funcs.destroy hook must be NULL.
+ *
  * Returns:
  * Zero on success, error code on failure.
  */
@@ -474,6 +476,8 @@ EXPORT_SYMBOL(drmm_connector_init);
  *
  * The connector structure should be allocated with drmm_kzalloc().
  *
+ * The @drm_connector_funcs.destroy hook must be NULL.
+ *
  * Returns:
  * Zero on success, error code on failure.
  */
-- 
2.45.2


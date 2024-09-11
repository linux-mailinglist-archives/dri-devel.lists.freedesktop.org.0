Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6896974F77
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 12:16:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2ED110E114;
	Wed, 11 Sep 2024 10:16:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mArSSLHo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F26610E114
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 10:16:52 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5365928acd0so6250709e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 03:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726049810; x=1726654610; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tYeBhqn7rrFM95mddC+x7Jv95o0/aABHQuhJTnfgzyM=;
 b=mArSSLHozrEGKh2KDnYKErrhydB8rnq+Ovwgi3YVkxiZ8yb500vA+xxsCIeXgf1LC9
 dCXN6ggHsC7+GKYs2BnlUoKzoNGGCnAIxYkkghP6BbSI3+VUyF9tq7hQxLSdrmIP5WXf
 cX5zilUKE/kwj6Ef4PH7iVovbx3KZZBhPqPQn5WhvG+4Qx0LRyIRI34m7/HhJbIGfoml
 2B/cxWCdrh59n6q/g+usm/kNJddUq2iDsHqfvxnSUqaQLPsD1JEvqTn4dREOl+WpmkvM
 IPypoQuuVqgTlEy76i7ynt9B4MLA6f8mnbRHXyKKsQoJ9fl4cDO7YAG3JjyWIDFXyDmn
 TITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726049810; x=1726654610;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tYeBhqn7rrFM95mddC+x7Jv95o0/aABHQuhJTnfgzyM=;
 b=OneOAxQ3E46iOzruJ3BpS4it0CO78+a2YU3sGB7snBaAQhbwEu17IBShJRCqc48oqK
 QgPyn3Zogq3ah9/hwcfLZNDQWFnCWAieIDT+J1BVlp5pOUvLJb4NGf4QCOdt2VzFRpLT
 B+poY8QhWanlmYvEWXsImajUuq/R6PMXqMaJSkO+Fi+w/upuuUk9OidoUUjYKLCBbeZ5
 mbSursCtGEfML+JmEpR6+rCBvm1erx5eQ4GCPkA4xXynek+eHgN8PpU4aF6vGbDbSc0C
 TlzP33RP8+3OnaNNO5nA++o41023llv3Mqf/V/i4UALq7XCljoBxuDLXdHR4y7ba0pFG
 8PVA==
X-Gm-Message-State: AOJu0YwzhBrb7Oy+zqcDmq3gz4wiU5fQbVXG27bR10KEPlckH/v6T8Df
 GfM+3Xpx6ZfjNXCp/7iAVJamAqKmI1Nb+suriQi+Iwe+m3beureN9bJaghUzmzA=
X-Google-Smtp-Source: AGHT+IGXELmJbRST89dICSQxeFnjBfTuKPgNg+mDhPc8/fYAt0oCs3+SOBTh7+U7fWv7r3k2GQkLvg==
X-Received: by 2002:a05:6512:3e10:b0:530:aa3f:7889 with SMTP id
 2adb3069b0e04-5365880ff70mr11815140e87.56.1726049809549; 
 Wed, 11 Sep 2024 03:16:49 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5365f870d37sm1533542e87.100.2024.09.11.03.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 03:16:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 11 Sep 2024 13:16:48 +0300
Subject: [PATCH] drm/display: fix kerneldocs references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240911-drm-fix-dbc-docs-v1-1-ae5cb82fce1e@linaro.org>
X-B4-Tracking: v=1; b=H4sIAA9u4WYC/x2MMQqAMAwAvyKZDbSlg/oVcahJ1Ay20oIIxb9bH
 I/jrkKRrFJg6ipkubVoig1s3wEdIe6Cyo3BGefNaC1yPnHTB3kl5EQFh0DesSEnfoOWXVma/5f
 z8r4fwvr+l2IAAAA=
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1504;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=WGULIwGFcHMWpuzv6KqTEIotz3S5zoxm7qzdY8a1AAM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm4W4Q03q9xko897YbwEEJw1fJ77gCeuK0W7kkG
 nf32IA/TI+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZuFuEAAKCRCLPIo+Aiko
 1bAlCACzT9XTqNcd/KPlW/BLyf31kdx2OQTgUE0a1sWJgTul7hYi7tRirO1ipfQeCBGPFQjMua5
 Xs3kvObdElB0DkCiT/jwHn9RPF56r7Th7k1s8CUJ6kL9J2t1mTXDYlQ9WdIVtBvA+GMrmDZ8dJY
 ifedMx4EMoSqpCeJqAKCPsr5LSh0N8TPSFc1q314Q4LryJgQHW8iWSV5OTZrQAcH8YuYoFAcTBI
 dB0d6pK0s65Nf/j1igekbXx9fEaqPCJAbA0DctBUX446oCGtQfQhBu7wV4VTtBRjJZhD7gQ87Md
 ZvLEM22cKVHLzL3E5Lx8MScXncKH7bahCiJG5Vis8aVoZrSf
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The commit 9da7ec9b19d8 ("drm/bridge-connector: move to
DRM_DISPLAY_HELPER module") renamed the drm_bridge_connector.c file, but
didn't update the kerneldocs. Fix that.

Fixes: 9da7ec9b19d8 ("drm/bridge-connector: move to DRM_DISPLAY_HELPER module")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/dri-devel/20240904163018.214efaa7@canb.auug.org.au/
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/gpu/drm-kms-helpers.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
index 8435e8621cc0..c3e58856f75b 100644
--- a/Documentation/gpu/drm-kms-helpers.rst
+++ b/Documentation/gpu/drm-kms-helpers.rst
@@ -181,7 +181,7 @@ Bridge Operations
 Bridge Connector Helper
 -----------------------
 
-.. kernel-doc:: drivers/gpu/drm/drm_bridge_connector.c
+.. kernel-doc:: drivers/gpu/drm/display/drm_bridge_connector.c
    :doc: overview
 
 
@@ -204,7 +204,7 @@ MIPI-DSI bridge operation
 Bridge Connector Helper Reference
 ---------------------------------
 
-.. kernel-doc:: drivers/gpu/drm/drm_bridge_connector.c
+.. kernel-doc:: drivers/gpu/drm/display/drm_bridge_connector.c
    :export:
 
 Panel-Bridge Helper Reference

---
base-commit: 9aaeb87ce1e966169a57f53a02ba05b30880ffb8
change-id: 20240911-drm-fix-dbc-docs-8ac42d0c2e4f

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B015AA0A7D7
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2025 10:05:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D9C10E0BA;
	Sun, 12 Jan 2025 09:05:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IbsfkQhl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C3610E0BA
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2025 09:05:35 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2162c0f6a39so77375185ad.0
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2025 01:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736672735; x=1737277535; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DeWY5GrZ+oUsk5L6PZfCgkhib35kaMkIvOwfSxSW9Qs=;
 b=IbsfkQhlWLntP08bJWPryudg22G8lPhMOLzP3Xha2xPLJCtxVrmtiE0Iba0wqBSwEF
 x/7Mrk8P67JT2WYPZ/i569kMQYrGydmgdiZwOcJpo81seuRdm+PObhYVDhpEaVLiHaCx
 cKZC7dQH+BnAadi9oAf7bQTw1uUOo8t9qdJUcL8Tq1PZkSiVu+NuZNMwg0E6r0hUcqy1
 VbTPwzt4Bqy4wKvx8oL5+BrCMkLvQ9qJUPG8QHbKYPwTmdbv/5YzuI698NXLa4BfwdW9
 rWgS6yPBUi770pY3nu3/xd+quBirtRWw9exfnP0E26IzX4nQoEO9dT9is3KblsFrXfdr
 N9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736672735; x=1737277535;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DeWY5GrZ+oUsk5L6PZfCgkhib35kaMkIvOwfSxSW9Qs=;
 b=VfzueFKUZAaWDgvjdvvv5Jmk2QKnP1HxJrJ4Rq8bHtxjhSagQImPYmSkXe4tWaO68w
 DYwrhjSJKwct48uhCCmHuOh7uJS0wDiQlWnZxFRRGG0qG1Z6PipxsmQNAOPXEN7h4RCC
 gz8Lkm3oxqtI13KOkgW8Fc0bdtN66HeWLrVyRQ2IUKrjLxfSS6ZjDAwmWQznbXA0Z+m9
 QdFFvOm18CIRllShOe1MPAOTiag6dIDDrr8Ols/jGTlBrFHG/vZr7sYnTAayKXSZE9UP
 BLQlw1P9k19kqQPPMSSl5nyfu55uX28Oz3WPaMP6rbc8CJawK/rMm1bvIq2PGetHAJ/V
 pQLw==
X-Gm-Message-State: AOJu0Yz45mfM2WhllsIOvZx+XegWcXc8ou3L+l0xfUUjyjE3EFi3Ulsq
 zZoTEMhYU+RSgDJWa8HNtHXxswW2KYj4ZII7yeNoF0ZZvyUGjFQV
X-Gm-Gg: ASbGncuSKNc7wTcAovUfIFLj+T5K0J1ZY3aQsCxnKh+fd5qQ9dzgXmmzj+FzL/Rqyv7
 nqyPKT/A4SyXmFyIobAsrL/nDSO6Ggcad3gx/wcY2btV2sOJcPOr7Tsvy6w2K+M4SXaNFLlpHVe
 mUQM20qpq9iWJJHObc4vLl9PbYULqJvLzfHtBVkL9lDjKAXl5iNYsK6PxTVXK92aOY+NbCLEQDU
 JYc/S+P0xNwSRs7GO7hbEJfAdHQtccyu09TxI+89H2dLjq50gJpeGo=
X-Google-Smtp-Source: AGHT+IHu/GMQyrHeXHhW2IHCjlqDAL093DtUlydQHsY2SPkxdzqmE4DrqTy4VxiKykzwhI1RLWLgdA==
X-Received: by 2002:a05:6a00:3910:b0:725:41c4:dbc7 with SMTP id
 d2e1a72fcca58-72d324bedf7mr19906933b3a.4.1736672734679; 
 Sun, 12 Jan 2025 01:05:34 -0800 (PST)
Received: from Emma ([2401:4900:1c96:bd6b:5054:ff:fe53:2787])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72d4059485bsm3950996b3a.83.2025.01.12.01.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jan 2025 01:05:34 -0800 (PST)
From: Karan Sanghavi <karansanghvi98@gmail.com>
Date: Sun, 12 Jan 2025 09:05:30 +0000
Subject: [PATCH v2] drm/mediatek: Initialize pointer to avoid undefined
 behavior
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250112-uninitializedpointer1601557-v2-1-61ac4c80b76d@gmail.com>
X-B4-Tracking: v=1; b=H4sIANmFg2cC/42NQQ6CMBBFr0JmbU2nQEFX3sOwADrCJNCSFolKe
 ncrJ/Dv3l+8t0MgzxTgmu3gaePAziZQpwz6sbUDCTaJQUlVYJp4Wra8cjvxh8zi2K7kUUssy0p
 capl3lSo73RlIhsXTg1+H/d4kHjmszr+P2Ia/9z/vhgJFZWSudU01Fngb5panc+9maGKMX9SW+
 yrGAAAA
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Sui Jingfeng <sui.jingfeng@linux.dev>, CK Hu <ck.hu@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Karan Sanghavi <karansanghvi98@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736672731; l=1803;
 i=karansanghvi98@gmail.com; s=20241017; h=from:subject:message-id;
 bh=iKs2YT/O6O3hI6dqcd/Y4shirDLatC1bZ5lLLSgXYAk=;
 b=lVFZMQ2xtvXWpRGLSvR+s3AhcVB23qGM6qUFxsgC7Lmm1L3bGimUR3y+L/VRjXJNE1G5+XN7A
 bfG6MOMZjtdAmYBZBCgSTZnzk8UpmSGnoyrhrJcnCUjRhYr5KxeLxN1
X-Developer-Key: i=karansanghvi98@gmail.com; a=ed25519;
 pk=UAcbefT1C06npNVDJHdgpPqTm4WE9IhaA1fmJb3A37Y=
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

Initialize the `next` pointer with NULL as the function
`mtk_drm_of_get_ddp_ep_cid` might return early without assigning a
value to `next`.

Dereferencing an uninitialized pointer can lead to undefined behavior,
as it might point to an invalid memory location.

Coverity CID: 1601557

Fixes: 4c932840db1d ("drm/mediatek: Implement OF graphs support for display paths")
Signed-off-by: Karan Sanghavi <karansanghvi98@gmail.com>
---
Coverity Message:
CID 1601557: (#1 of 1): Uninitialized pointer read (UNINIT)
3. uninit_use: Using uninitialized value next.

Coverity Link:
https://scan7.scan.coverity.com/#/project-view/10043/11354?selectedIssue=1601557
---
Changes in v2:
- Updated the patch subject and summary log
- Link to v1: https://lore.kernel.org/r/20241111-uninitializedpointer1601557-v1-1-7d03668e8141@gmail.com
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 9a8ef8558da9..bc06c664e80f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -900,7 +900,7 @@ static int mtk_drm_of_ddp_path_build_one(struct device *dev, enum mtk_crtc_path
 					 const unsigned int **out_path,
 					 unsigned int *out_path_len)
 {
-	struct device_node *next, *prev, *vdo = dev->parent->of_node;
+	struct device_node *next = NULL, *prev, *vdo = dev->parent->of_node;
 	unsigned int temp_path[DDP_COMPONENT_DRM_ID_MAX] = { 0 };
 	unsigned int *final_ddp_path;
 	unsigned short int idx = 0;

---
base-commit: 6d59cab07b8d74d0f0422b750038123334f6ecc2
change-id: 20241111-uninitializedpointer1601557-9803b725b6bd

Best regards,
-- 
Karan Sanghavi <karansanghvi98@gmail.com>


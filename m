Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EAF83BC23
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 09:37:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70DDC10E22B;
	Thu, 25 Jan 2024 08:37:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F162910EE4B
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 18:38:57 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-1d76671e5a4so22320895ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 10:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706121477; x=1706726277; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uy1zbE7Ow0ZllWQflOItrn5r6MhCAv/GdXD6u9M4X4w=;
 b=Ki7wGqJxnkJLgRApetswt2FPvkqXc6gbDYOTwSpf8bULMT47ZihryyHGf3DzPJTC5I
 ZKE6mb0gyz3SMQXpW6P07TE8izfM87VfzbegQTHq40/aFHlxhngIC8uRkJwYcyI0fPFz
 ktUEZ/9E3V0f9+CW2+g3pHn6pRgPHEJK3c1V0baG/dVllZ16d0hDER6PkEzyHOQkUPFB
 24s/edEL1+n4JrxcmbekG48PYZC/880GQyZVFUN4q1Hj+B7aLPtXtQTMxix+lzNUh/cg
 TtOK7lW4YsOV206DjOgi6quMTea06RE7xMW2RBVngyI35bB1z/o6u06UFrR7zP76VJAl
 Md9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706121477; x=1706726277;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uy1zbE7Ow0ZllWQflOItrn5r6MhCAv/GdXD6u9M4X4w=;
 b=DxvxGGs5kv2BikW1h/C9VF/O8R7+rRaWXxUkTcmw9qCe3Ouy8LRhdezyta7IWGgkSR
 CkIKHOfoY+k6+3av3hANVyRzOGpUKvQ38Shz1HksYzkbRiU9N32U/uuVM9eNQuLFADE4
 AuB4s2Rf8kdF185c/34RDFLP2Q4opkaCNkaTyVpEzYsyyfj66sUBEjW74W+Di2oX3rIK
 ab1JA5SDBT1k+JbQOVCwoLxzWcR/kfCyayrUXdc4B7rgLVd2Db8wbBQnSGp7oHSrQsP2
 PX1vImmOFwBGfdZQz9JJeboc5zhmJp9TTOekyYSxr2Pr2Mbyms9im3KynHbYGvW9fHYA
 xnmw==
X-Gm-Message-State: AOJu0Yzi8Sg3lsPGXtYv3W/YkAJFRMB7ETXjf3I5o+wRTpJqHnOiEdxg
 ImaOMt/xCodGr66QznVo/a2T6zCrRadWY2BSvVDzELXV+Ztd1rIBcfVEHN6k/Sk=
X-Google-Smtp-Source: AGHT+IEEtOOn3AthjBuyeWZtT1koM4VgPdfcfUM6YWfT8gLBjkbiB9Zl/25bjS2JgSgzdfT2MElqLA==
X-Received: by 2002:a17:903:4295:b0:1d5:7220:9ff with SMTP id
 ju21-20020a170903429500b001d5722009ffmr1204364plb.117.1706121477275; 
 Wed, 24 Jan 2024 10:37:57 -0800 (PST)
Received: from kousik.local ([2405:201:c006:31fd:9614:de6d:cab9:f490])
 by smtp.gmail.com with ESMTPSA id
 mm14-20020a1709030a0e00b001d7222d8caasm8729214plb.50.2024.01.24.10.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 10:37:56 -0800 (PST)
From: Kousik Sanagavarapu <five231003@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpu: drm: display: indent fix in comment
Date: Thu, 25 Jan 2024 00:05:56 +0530
Message-ID: <20240124183659.511731-1-five231003@gmail.com>
X-Mailer: git-send-email 2.43.0.370.g8962b674a6.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 25 Jan 2024 08:37:05 +0000
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
Cc: David Airlie <airlied@gmail.com>,
 Kousik Sanagavarapu <five231003@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The comments explaining the function "drm_dp_mst_atom_check_mgr()" had
uneven indentation which made "make htmldocs" complain:

	Documentation/gpu/drm-kms-helpers:296:
	./drivers/gpu/drm/display/drm_dp_mst_topology.c:5496:
	ERROR: Unexpected indentation.

	Documentation/gpu/drm-kms-helpers:296:
	./drivers/gpu/drm/display/drm_dp_mst_topology.c:5500:
	WARNING: Block quote ends without a blank line; unexpected unindent.

Fix this by getting the indent right.

Signed-off-by: Kousik Sanagavarapu <five231003@gmail.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index bd6c24d4213c..f26cc85e7dbf 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -5490,15 +5490,15 @@ EXPORT_SYMBOL(drm_dp_mst_atomic_enable_dsc);
  * Returns:
  *   - 0 if the new state is valid
  *   - %-ENOSPC, if the new state is invalid, because of BW limitation
- *         @failing_port is set to:
- *         - The non-root port where a BW limit check failed
- *           with all the ports downstream of @failing_port passing
- *           the BW limit check.
- *           The returned port pointer is valid until at least
- *           one payload downstream of it exists.
- *         - %NULL if the BW limit check failed at the root port
- *           with all the ports downstream of the root port passing
- *           the BW limit check.
+ *     @failing_port is set to:
+ *
+ *       - The non-root port where a BW limit check failed with all the ports
+ *         downstream of @failing_port passing the BW limit check.
+ *         The returned port pointer is valid until at least one payload
+ *         downstream of it exists.
+ *       - %NULL if the BW limit check failed at the root port with all the
+ *         ports downstream of the root port passing the BW limit check.
+ *
  *   - %-EINVAL, if the new state is invalid, because the root port has
  *     too many payloads.
  */
-- 
2.43.0.370.g8962b674a6.dirty


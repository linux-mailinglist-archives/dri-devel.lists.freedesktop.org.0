Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D37C0874C8C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 11:41:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC5E5113764;
	Thu,  7 Mar 2024 10:41:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="byp5MafG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C18A113764;
 Thu,  7 Mar 2024 10:41:24 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4130e293686so5159935e9.3; 
 Thu, 07 Mar 2024 02:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709808083; x=1710412883; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qgaA4hwjMMxXsNn/H65VvY2aAb1+rjCArUM3dz35oeg=;
 b=byp5MafGv2wLNxvk3m3FyBOVZLN1ZzYDHNbYLazRhKdaBHclvy7eZxDG1F+IAAV0Mh
 LHGcEMhy1sM6Y/zGUtBTJYPakayVBQtfS3yFfDUfR+zJGye/F8pTtAiZzITtrHW76wlP
 XU6l+/5X0BIJ/T42e/UsU7W/z7GZSrL5Bgk5HiKZGf65tZOpBRUbkfKwAwOrrx1lYIps
 MPNgqvaayIBp1BEUw0MKhN/XWnn58NSl0yAmkEy/eCIAn3nSMthODjUEH8x+EbdJu6Kl
 eH87A7siGZepr0XXlEJGcfOFCy29HkIVk62WCTBds+lSEvQa+xFT77rHD3OEcozx09/1
 f9Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709808083; x=1710412883;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qgaA4hwjMMxXsNn/H65VvY2aAb1+rjCArUM3dz35oeg=;
 b=uraDFXjGSwxhzQ3qUWJwFzTLdEKd2PUwIsGbYMDHDrDe8Q18o/kW2H9OMb+9+SaJAX
 io65XgTSBbYb3GYGt6BG5PHTnVn4ZbChoVmsFyT7P3JToLtBV55B7Cb+HCkYYXP5dksN
 R6CHCVsDO70o+1cXsU6IuER+VU6K07w+8L/aazXUE755H1IKqNhJLlnzEyQrR7+B+1oE
 wcIil2rlzXCnngThV6TyxN38pdkRSo+uuDmsDhrxABYxRIB3585+WPgF7MEgjgkLfvxT
 v63kORiHpR8SRj19c7R9UZ/y2I788KE0LjeACD3kcL+4DoRDaN5WOOysdrcz1WY+/u8a
 v0PQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWbDybxqGbl8hB+CrUJEE/2veZSjenTVn2MC8pSZZMgvn1wItjFeD3ucRQXNOQdYEaQvOHpSWcabtBMfaEx/qQqptTZCkRptDP6PUQ6ODmJTHVGn5KmRMQIOoklsi5q4x6z2nmtur8EwJ3Ah7PBL/A08g=
X-Gm-Message-State: AOJu0Yw9UQHFmdZU/sFwz14fY9R850tmh4py3zBiMSaxH3BWQAChOB+S
 Ceneb1fwqkZT4Q0PaH2A/UftFkPp///jF7oj9eou1cuMObX/Wjbq
X-Google-Smtp-Source: AGHT+IHFfQLpO+Ajim+32v9BfNQVyFeSt1SNjsGAX7r/QvA8WtdX08e2LuaNBQOxKkcCwOPQi0HNYg==
X-Received: by 2002:a05:600c:4ecf:b0:412:b457:6303 with SMTP id
 g15-20020a05600c4ecf00b00412b4576303mr15685863wmq.21.1709808082840; 
 Thu, 07 Mar 2024 02:41:22 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 fk15-20020a05600c0ccf00b00413133cb9b8sm384147wmb.19.2024.03.07.02.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 02:41:19 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/qxl: remove unused variable num_relocs
Date: Thu,  7 Mar 2024 10:41:19 +0000
Message-Id: <20240307104119.1980621-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

The variable num_relocs is being initialized and incremented but it is
never actually referenced in any other way. The variable is redundant
and can be removed.

Cleans up clang scan build warning:
drivers/gpu/drm/qxl/qxl_ioctl.c:148:14: warning: variable 'num_relocs'
set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/qxl/qxl_ioctl.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_ioctl.c b/drivers/gpu/drm/qxl/qxl_ioctl.c
index dd0f834d881c..506ae1f5e099 100644
--- a/drivers/gpu/drm/qxl/qxl_ioctl.c
+++ b/drivers/gpu/drm/qxl/qxl_ioctl.c
@@ -145,7 +145,7 @@ static int qxl_process_single_command(struct qxl_device *qdev,
 	struct qxl_release *release;
 	struct qxl_bo *cmd_bo;
 	void *fb_cmd;
-	int i, ret, num_relocs;
+	int i, ret;
 	int unwritten;
 
 	switch (cmd->type) {
@@ -200,7 +200,6 @@ static int qxl_process_single_command(struct qxl_device *qdev,
 	}
 
 	/* fill out reloc info structs */
-	num_relocs = 0;
 	for (i = 0; i < cmd->relocs_num; ++i) {
 		struct drm_qxl_reloc reloc;
 		struct drm_qxl_reloc __user *u = u64_to_user_ptr(cmd->relocs);
@@ -230,7 +229,6 @@ static int qxl_process_single_command(struct qxl_device *qdev,
 			reloc_info[i].dst_bo = cmd_bo;
 			reloc_info[i].dst_offset = reloc.dst_offset + release->release_offset;
 		}
-		num_relocs++;
 
 		/* reserve and validate the reloc dst bo */
 		if (reloc.reloc_type == QXL_RELOC_TYPE_BO || reloc.src_handle) {
-- 
2.39.2


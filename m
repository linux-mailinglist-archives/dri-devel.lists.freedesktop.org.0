Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BA48218D7
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jan 2024 10:20:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2513E10E086;
	Tue,  2 Jan 2024 09:20:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CC5410E086;
 Tue,  2 Jan 2024 09:20:19 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40d76fefd6bso29948845e9.2; 
 Tue, 02 Jan 2024 01:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704187217; x=1704792017; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RiTUNZ10k6wQcCp803CcT029DnaSpcGHPPSc1r2WfXA=;
 b=VpXuTsiAhYDQnN/ZGxCjqGFATMDQqndzYrpWeAI0b93doezAUpsw5mV/7qiVu7UV7x
 MPD+bKSHIg7djAg9ortcDqWk5pqgIDp6LMSbSXZmVRqE31ahBjKFF+XfU6ky3iun2wuB
 2FIdYLXoc55BkFjjQoONLfSBqKEgz7jN3RGJl9h/YVHk3Uk+y35Q8UKHRSHNSdrdlbVB
 ug0xySxGVPaJFVCvZgr4++iR6hh5n9vmpJFq0Qm/NoegsMvZFO/r6FJ5F3SLSgYSO26b
 WyrNf8zck5NUpyD62kLw4WbiauoclLi1Dm+evRM1kcM5Zxucscyk4N7d4ob11RiHz3YL
 FVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704187217; x=1704792017;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RiTUNZ10k6wQcCp803CcT029DnaSpcGHPPSc1r2WfXA=;
 b=YvVLMIn5j4eznG8Sb8fh2aWmNNF8IpaafJibgKWRw5YtfGEsvg2HOhPe1UuBYfs7Uj
 9Ft6+uSHz7zjwgOwh2wmdoURolt0IM49k7qbjKBHgWpSQs8R/PeDbUDM9Rt1OBVj6qnT
 iR+OefWbMRvvCofQd6Ov1XRARU0yplf9GLR4malLjUbXehimucEzXa3vBu5yrf4uf+uW
 f4sJp9+/g5Ic/+Em43+kfHDdIfJLnN1wu9dig3SL4plz+O7Rf0IpnOdgKpR5CU/4zXyL
 /ggiPjqjmNgwSkmJcvdrCH5MTHWK0qf2uEG0g5Z7/ckMLCk8A2QxrTcDKpkTo/oDOzh/
 AIfw==
X-Gm-Message-State: AOJu0YzLafo1YFWG1Fjk1wcz1FuF+ry/EhM4lbET9IKU6lX+r95SUyzh
 I2d4aMSWMC0TJDKyJdTDr1w=
X-Google-Smtp-Source: AGHT+IGsByEPoucSmW84vcGQlZDBldsoqIytSqU80ojmxB3JqT27shPf0a4zX0slvmtrE8yDClVpeQ==
X-Received: by 2002:a05:600c:1910:b0:40c:24b1:8d07 with SMTP id
 j16-20020a05600c191000b0040c24b18d07mr4674540wmq.192.1704187217232; 
 Tue, 02 Jan 2024 01:20:17 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 g17-20020a05600c001100b0040d44dcf233sm38266096wmc.12.2024.01.02.01.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 01:20:16 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/xe: Fix spelling mistake "gueue" -> "queue"
Date: Tue,  2 Jan 2024 09:20:14 +0000
Message-Id: <20240102092014.3347566-1-colin.i.king@gmail.com>
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a spelling mistake in a drm_info message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/xe/xe_wait_user_fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index b0a7896f7fcb..b3ccdcf40557 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -147,7 +147,7 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 
 		if (q) {
 			if (q->ops->reset_status(q)) {
-				drm_info(&xe->drm, "exec gueue reset detected\n");
+				drm_info(&xe->drm, "exec queue reset detected\n");
 				err = -EIO;
 				break;
 			}
-- 
2.39.2


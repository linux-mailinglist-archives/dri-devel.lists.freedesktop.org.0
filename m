Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2ACEAB641E
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 09:23:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C05510E244;
	Wed, 14 May 2025 07:23:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AOXLAbaX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9AB10E218;
 Tue, 13 May 2025 23:46:31 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-442eb7edc80so1074505e9.1; 
 Tue, 13 May 2025 16:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747179987; x=1747784787; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Am7EfrJqOwulXz2MygzhqsLfPIY8ao2NbUQeLabZZDU=;
 b=AOXLAbaXXAdKCbIyhyWok36Sh9/luHSkdR19zaqyCoCh18P+7LB6jiIB4h577AK1JX
 q6rMf5F+XbVkf+6+FSmfzWs6+H1wLbHaCKytE+ZOz6pnx1LFLdlBR+8NSQFpdZPhy+jp
 oxCRQAyFwdwk8Sl09k8YaPGxQys1WO6USVGsP/pY1IKk7HhzBjgurv1SM9LUExL33mhE
 HVcRnfGsxrvmYuIvhiz7xdDfhfYvFnq47UMm1Xf/hbSL5sGUY5OOHFu8ggAukebuTnD9
 Xr0SYkPqmljHn2Ueq2Bj1oH8OOlpzdNM1UwgetGNR0ZJ8S5MYm11g+IEE8VrnJL2NuSN
 NjqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747179987; x=1747784787;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Am7EfrJqOwulXz2MygzhqsLfPIY8ao2NbUQeLabZZDU=;
 b=WHm3k5nP9T17ZMk5qVZQ9eCgEQDz7IGdPq+ueR+ehokoRPQnYFXs7frXd6xEwxz5Km
 vDMEdC6t5DPnj+lYQuG+8GB/Lvj3ui316023ZyMp+RO6jnncsr2ynMXcwHFaZ0IaRPca
 /JrqZLlduAt3t1ZIzANI57wR6FaQilG9heqOX9kPrbpLQJhiiM22pLSsylOv5FRgemrq
 eTV94yRJuY28nXPkclQZe5reV8B2sa/PfSinROuVMOD8EtI58Rs9Irml1a/GOGnjATgC
 joePUbPL/vPOXr14T8ox2ROxevCpl/qaVnSdDvM8JhLteVM+CIYpd4uIL2w9W5MJ/1Qd
 vcKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyWO1eXrrtl73OqmD6ynUYZMnOOPxK2mX1834zFJGnF5ym1LLFwaznKOSmJTrIwHvVlwEcEEQkfTA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzG8OJ70vBAm7F4m3KmXHgYs9KHz4thhizlkcpIigffaRosJuPb
 MLLMnpVwK88vKW6mPc1x7HriSjXV/eC1b9PrCD6JWqRnB+NyZbE2
X-Gm-Gg: ASbGncvRnzOTxubJM+Ri3XcJE09GLg4lcyj7h05wRmnsRV0RRRfi4elGx+SnieMwKW9
 Au4nnKJv9AsdRJHLNQcoE8zxhw1AGgd8JoygpYXNGTjN6mXe5Se4rhmNS4JV1pRgP+d7yzd6uEd
 KmS7Ri+KAuVCvdSwk6/uXe+d7/PRnogSTF+h8bp1jPxguWirHHOszXoZpLjC4IFYjKrXKYUF6Dr
 +ZdEfKV9NkxvDR59j83aWwvTkOsuKZViZC0NhxFOy8PJMCgUiqNdVvnHecAAX1Py6a7qzwi1q0B
 TdFp9LDnM/I4HN45Sccpu3hra2DgXUsDR87QXbbOlYMZqo/AhS7QI5r0NCy+SEvnL7EWq//RigF
 CRuXNMK+3wO8o
X-Google-Smtp-Source: AGHT+IHSw2JHRvnitJtJa6AdYdxRDFYEo1OfcoOtexkTf6XFYzq3VybGtqZnXlr+zjXBLXMGWv0Flw==
X-Received: by 2002:a05:600c:1c2a:b0:43d:fa5d:2675 with SMTP id
 5b1f17b1804b1-442f219511emr2834195e9.9.1747179987106; 
 Tue, 13 May 2025 16:46:27 -0700 (PDT)
Received: from localhost.localdomain ([102.44.114.188])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f3369138sm5670665e9.8.2025.05.13.16.46.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 16:46:26 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
X-Google-Original-From: Abdelrahman Fekry <Abdelrahmanfekry375@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, skhan@linuxfoundation.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 Abdelrahman Fekry <Abdelrahmanfekry375@gmail.com>
Subject: [PATCH] drm/amd: fix kernel-doc parameter tag format
Date: Wed, 14 May 2025 02:46:21 +0300
Message-Id: <20250513234621.322283-1-Abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 14 May 2025 07:23:32 +0000
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

The DC_HDCP_LC_ENABLE_SW_FALLBACK enum comment was missing the required
colon after the parameter name in its kernel-doc tag:

  * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, ...

Kernel-doc insists on the form @name: description. Adding the colon
eliminates the warning and ensures consistent extraction into Sphinx
documentation. No functional changes are made.

Signed-off-by: Abdelrahman Fekry <Abdelrahmanfekry375@gmail.com>
---
 drivers/gpu/drm/amd/include/amd_shared.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_shared.h
index 4c95b885d1d0..c8eccee9b023 100644
--- a/drivers/gpu/drm/amd/include/amd_shared.h
+++ b/drivers/gpu/drm/amd/include/amd_shared.h
@@ -366,7 +366,7 @@ enum DC_DEBUG_MASK {
 	DC_HDCP_LC_FORCE_FW_ENABLE = 0x80000,
 
 	/**
-	 * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HDCP Locality Check FW
+	 * @DC_HDCP_LC_ENABLE_SW_FALLBACK: If set, upon HDCP Locality Check FW
 	 * path failure, retry using legacy SW path.
 	 */
 	DC_HDCP_LC_ENABLE_SW_FALLBACK = 0x100000,
-- 
2.25.1


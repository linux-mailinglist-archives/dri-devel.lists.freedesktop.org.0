Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8D09E8097
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2024 17:17:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0397410E2F7;
	Sat,  7 Dec 2024 16:17:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Txt+RiPB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E0210E2EB;
 Sat,  7 Dec 2024 16:17:20 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-7258cf2975fso2701181b3a.0; 
 Sat, 07 Dec 2024 08:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733588240; x=1734193040; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aQgFzaGycn/HJR1rBYagqMMFKjXleXPjXG3RiZU2xbE=;
 b=Txt+RiPBtOY+4rZTglHtGBnd7vgbsBGw0LtTM0l3GQ3gTiXPsvL7745e3qMYBPi7mc
 GgJxpENIJzDHg8eXzIUmY6uMUW3miEwAvJ4bZlZd2UApdol6z9ObZ0JTZ1PZJVzWoYMQ
 DpdV+wfxuGQ2riaz2TK17aeX/W1Uh1hmsGmDc6loqhSj86rKeis1Yb278Jy7wz7OXdOT
 inEbyr6nXQp0J4r8CcJD6ZeVwpzqaHFOfevpMZW210h/96L/h3ZztNtJrqgYm69ASlHZ
 U7r2pOE0ui/d3Mv7seOFqwxUuEmzs2ipLHElOz1tAL6Lzbf6GD4yelycG+8A/NVQWH6p
 Tp4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733588240; x=1734193040;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aQgFzaGycn/HJR1rBYagqMMFKjXleXPjXG3RiZU2xbE=;
 b=IaewRLym3WNvsCSTxCOJDXMZ21M2Q8O2TdXSeiPggZgXziOYS20YypY7a8OzmrEX6J
 ouMma3DrVHQB93+KNaJYRcomFQTUCOOqchKh2SvVNfZyKhUEcmbCPDkmEvGXNPUJYJF/
 DeVmpuygQp9MBksL7o5CiIEAAmGLDADBdjwz9yvzYMpBgKS5bd9bcZ2gcz75gjNSsP/X
 TS7/P4Rtd9MPCfyu+fJCFw3yeRPyBekk9tZaCIQQYpkxOSWDQRU0U1LJ+c7XRL1yH1v4
 /LIjKqrLwHctrv9Yp3lJxiOSBDk2i9WJroCsN26OAekH1tUPKkHvDHmNZmm86GtF3a7m
 MkhA==
X-Gm-Message-State: AOJu0Ywk9ZpFW0zXHNusyVNojz7dfIgEWpPJiYSl68JWybapnhtX+mZA
 C/aYrXZPxDxYct2uQutbHKEMRHSMHh5dQypbUk2u7NXYIkCz3YDlFqgCfA==
X-Gm-Gg: ASbGncvrY0WLdTv2mPHFtJPPWvhgL9qtDFLynWUIBZC3ewpoziLANsOYJqyOeqgVK9M
 6UCLQrWijX0H/N9AX8N+DBSSGvfHqL8FKL+OOCUPv/EMbrB1zWIUnLIiA+VYbZle8qMhdNzJalF
 YXKTfNxdILBYRBZD8mawijgt5nOTqcj9UHOdeFFZkK1g9V1W4F0E715XgiUtc85G8JTQDxqagfh
 I2jxNMBVnzBSbB++8Pcys4nbTxWkFbh4WQwwhFP7MXXHu2JZXBQ2c46NfpNisOsNMoY9GA6mePB
 fZQOaIqB
X-Google-Smtp-Source: AGHT+IHUEDls1d5ZD4bWmKwHTYFRuuM8ju54qCGhC+KSoPe/9G4tXm/AdkfqFY2cobSLPNQUQAXelw==
X-Received: by 2002:a05:6a20:158b:b0:1e0:f472:e496 with SMTP id
 adf61e73a8af0-1e1870a75abmr11348864637.4.1733588239829; 
 Sat, 07 Dec 2024 08:17:19 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725c8865ee1sm1874143b3a.137.2024.12.07.08.17.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2024 08:17:19 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org (open list)
Subject: [RFC 03/24] drm/gpuvm: Remove bogus lock assert
Date: Sat,  7 Dec 2024 08:15:03 -0800
Message-ID: <20241207161651.410556-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241207161651.410556-1-robdclark@gmail.com>
References: <20241207161651.410556-1-robdclark@gmail.com>
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

If the driver is using an external mutex to synchronize vm access, it
doesn't need to hold vm->r_obj->resv.  And if the driver is already
holding obj->resv, then needing to pointlessly grab vm->r_obj->resv will
be seen by lockdep as nested locking.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_gpuvm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 1e89a98caad4..c9bf18119a86 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -1505,9 +1505,6 @@ drm_gpuvm_bo_destroy(struct kref *kref)
 	struct drm_gem_object *obj = vm_bo->obj;
 	bool lock = !drm_gpuvm_resv_protected(gpuvm);
 
-	if (!lock)
-		drm_gpuvm_resv_assert_held(gpuvm);
-
 	drm_gpuvm_bo_list_del(vm_bo, extobj, lock);
 	drm_gpuvm_bo_list_del(vm_bo, evict, lock);
 
-- 
2.47.1


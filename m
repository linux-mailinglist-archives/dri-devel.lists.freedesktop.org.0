Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C95A9E23D
	for <lists+dri-devel@lfdr.de>; Sun, 27 Apr 2025 11:46:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A351F10E183;
	Sun, 27 Apr 2025 09:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="K4HJKU+o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CDF110E183;
 Sun, 27 Apr 2025 09:46:03 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-224172f32b3so9374715ad.2; 
 Sun, 27 Apr 2025 02:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745747163; x=1746351963; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+KDTqcMZlGtBruM/CFwkX9atXMGLUR7NjJmS88z9xoA=;
 b=K4HJKU+oL8aTBrXDsxQdBqV0uQK3Da4mweiWSbQd4HZwi1nxvSO+XM3MzG2jzfQEjx
 +yO4VwabVqiROGw4sFQstDb2D3M5RkZAUNV1FKFfCHXazJLkXjylYEmMJup8eBhmLqGk
 lOfrlmHoBqxzRjN+T8xvCGwEhiAloPDD4nHeMB4G+nbAvQe8cwihnmwiPDzd2uUDXZN4
 jxFTuAq/ca5gQuNkUcg+4kO3hLj6cA/qhnGFMkKNoNdgDNZr1ta89J0QVmtwt7z1S7Fa
 oD3kGy2acHaVh1KVmX+kLgke4W5+D3y3fznpXp8TKRl0J6kV2gDCoM0/i+lvoPdQDPlt
 +PcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745747163; x=1746351963;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+KDTqcMZlGtBruM/CFwkX9atXMGLUR7NjJmS88z9xoA=;
 b=uT4q3JAwg8FIF4OggoJbFd5ozUuOMzjeYVsx3SVTe21bi58jBPQ0gIkbpM0SgDzAHV
 KdWZ5+DYC6DsbW3wjFaiGDqCXxZ5ArUTYGk1hQ7+U/csBiZ7x0uyvVzwj6U115AkEpMF
 z8Usd5PFWT+aIINefbiJDImLsu1OdSkG/kG+OEMrRWXqAHkIJ9a6A5UwVBd1k/ZUZyEi
 x90sADz5uXP/fr8L5pHro5mG8qDpI72Uf4dhlmrxWDoWWZD/DbBxFcyQmqtTq3oppctq
 FAREnhySEuIyojexka0owB2N5flA8WMNXwaOu6baki02eoEtJfSOaOjChxI86D3cPmjM
 yTMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVs00jczsKvcWuy19SRkGe80z+bB8SYNY7CmlOUzGeMUOnZI588MHv58g50LC6Yt6w4i5lRgpgPIHE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2wJMcg2jfwQz3aFCFZh8gycBV+i6A9UVjAjXB7KYoTFzYYTU3
 bc0oa3SAma/Rvgs+Sl1xb3qPwTaTWFpz4jvAcgKSxT1UxKF8IdKTkNgefsrT
X-Gm-Gg: ASbGncuXYCznIWMke62d4i6IJbLOaYgsBxneo0veEEWIyNTaGeiomFwSRGNZX0VH9JA
 jptD1WyjCChp73gzS4oKJzrl3ZLSSJgFXNWwrOaIWz2gS9ILolWvRb+xOQYdhGFhYDolyhgfEPz
 9YYmnm5zla8naibNa2mtE+9UYpJGewI20fk0dDAc6XAC1ZKjGfEhg/68hBztOPAy12ZVu6oyhou
 hncbuY8lTpIJHAGSoJEYt9YtFOADNxWboUX2Xx+P+ssxmy0STSemmlk+jB3vWLeVjZmjmM439zF
 ycnd20djOaZvs7p+cO08M/6nntfJMEpjmL6FaiwAleGOQdssOeI=
X-Google-Smtp-Source: AGHT+IFgcciqD50PlJmVfjc1kvZFMb6P1l5O/9ptq2pZnaHuOKXwCR7aBlX0yzuIsyy5e/DKD2Gdyg==
X-Received: by 2002:a17:902:dac2:b0:21f:356:758f with SMTP id
 d9443c01a7336-22dbf5df830mr46268985ad.3.1745747162689; 
 Sun, 27 Apr 2025 02:46:02 -0700 (PDT)
Received: from dev.. ([2402:e280:214c:86:df9f:2e4f:f8a7:6d85])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22db50e7a33sm61557025ad.146.2025.04.27.02.45.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Apr 2025 02:46:02 -0700 (PDT)
From: R Sundar <prosunofficial@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sunil Khatri <sunil.khatri@amd.com>, Tim Huang <Tim.Huang@amd.com>,
 "Jesse . zhang @ amd . com" <Jesse.zhang@amd.com>,
 Boyuan Zhang <boyuan.zhang@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Yang Wang <kevinyang.wang@amd.com>, Peyton Lee <peytolee@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, R Sundar <prosunofficial@gmail.com>,
 kernel test robot <lkp@intel.com>, Julia Lawall <julia.lawall@inria.fr>
Subject: [PATCH linux-next] drm/amdgpu: use string choice helpers
Date: Sun, 27 Apr 2025 15:15:36 +0530
Message-Id: <20250427094536.353823-1-prosunofficial@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Use string choice helpers for better readability.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@inria.fr>
Closes: https://lore.kernel.org/r/202503222049.sUXL3q6w-lkp@intel.com/
Signed-off-by: R Sundar <prosunofficial@gmail.com>
---

Reported in linux repository.

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c:311:49-70: opportunity for str_true_false(vpe -> collaborate_mode)

vim +311 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c

for linux-next:

 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
index 121ee17b522b..442d137e0fed 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
@@ -317,7 +317,7 @@ static int vpe_early_init(struct amdgpu_ip_block *ip_block)
 	vpe_set_ring_funcs(adev);
 	vpe_set_regs(vpe);
 
-	dev_info(adev->dev, "VPE: collaborate mode %s", vpe->collaborate_mode ? "true" : "false");
+	dev_info(adev->dev, "VPE: collaborate mode %s", str_true_false(vpe->collaborate_mode));
 
 	return 0;
 }
-- 
2.34.1


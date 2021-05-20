Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6A238AD6D
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 14:03:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53B066F41C;
	Thu, 20 May 2021 12:03:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 789E488B6C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:03:15 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id j14so15648271wrq.5
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 05:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RiZqS9+1VsUhQi4zCxRm7Qw/CQ+SCMejCROZ7vBDCII=;
 b=LeaXNvmDhLUKi4BpNVSHVz+CuQI0q/bnPzQUee6sPiX5zlHptWrRN5TnlO/9eMmO3d
 RGyObjyUw2hvL4jVWFP4RlE1K8EJBpiwCVh/smcZB4ORsXMIqkXNyj8uczuQitGuKpUB
 O3p1wIPaBo1bMpEqD4d4dUsMjy5nfPwOQK/cxGLjSwb0Wz8xA8F9z7vlGzuZ+Gva+5TY
 TnXjJCpxlD+w5dkect5TfTUzDdZPuSx7aS7Ao4r801uP97zZSNfdf3DjpugBhJ9+GSHT
 W5kWvP2N271CNZ3lHnoSg7bM25HzaEzuWdI/q5c+IPdKq6MHCj0ivH65XU2V5JsV2PG0
 SfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RiZqS9+1VsUhQi4zCxRm7Qw/CQ+SCMejCROZ7vBDCII=;
 b=LeyW0CzTz2nG7iRZY7ic1LSFs9mXGZz8Tr3Gi/l/p0cId2LZa7hMhpu4i3sJ6I2ek9
 rIVSp7HWzz8ALDw1KZu8q94/G6STw0cgFPB+fBBtCj6/8EudICRxoEay2ldCJwWrD7FW
 mqL+NlbY3cc0kP7S9LRk879ok6CkSOFhp1bp5Kr3gyX0U3kIum+l+EQ1RFcnHL+p9pkK
 v9fN3f8wBjup5FofeIoQx7c6fw8LGVwtxZNxXw5IOkL2efOqY7aM6elvJXquKmRaffwh
 UML5y9VN1qKnnzHyC2Ba1PkpSk+e9OICZOGHl2/gcgGjlT3FGx9252ays7jABfF+iPq0
 kwSw==
X-Gm-Message-State: AOAM533wveqxFkUXnRcOyYvH+9Hxh/umwGnRVY4vQyVw3/GACszuTi5e
 Bv7SUWcYEeUQSQwBn1o5blMrmA==
X-Google-Smtp-Source: ABdhPJwNbytM3HbZfJrhsQBc/jh4ZR3fXPG/OAOnPVHn358PMshvhBLhygc8EHr8vcYofNRgWWb9Ww==
X-Received: by 2002:a05:6000:1286:: with SMTP id
 f6mr3803164wrx.226.1621512193588; 
 Thu, 20 May 2021 05:03:13 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.03.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 05:03:13 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 21/38] drm/amd/include/aldebaran_ip_offset: Mark top-level
 IP_BASE as __maybe_unused
Date: Thu, 20 May 2021 13:02:31 +0100
Message-Id: <20210520120248.3464013-22-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520120248.3464013-1-lee.jones@linaro.org>
References: <20210520120248.3464013-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/../include/aldebaran_ip_offset.h:259:29: warning: ‘XGMI2_BASE’ defined but not used [-Wunused-const-variable=]
 drivers/gpu/drm/amd/amdgpu/../include/aldebaran_ip_offset.h:252:29: warning: ‘XGMI1_BASE’ defined but not used [-Wunused-const-variable=]
 drivers/gpu/drm/amd/amdgpu/../include/aldebaran_ip_offset.h:245:29: warning: ‘XGMI0_BASE’ defined but not used [-Wunused-const-variable=]
 drivers/gpu/drm/amd/amdgpu/../include/aldebaran_ip_offset.h:238:29: warning: ‘WAFL1_BASE’ defined but not used [-Wunused-const-variable=]
 drivers/gpu/drm/amd/amdgpu/../include/aldebaran_ip_offset.h:231:29: warning: ‘WAFL0_BASE’ defined but not used [-Wunused-const-variable=]
 drivers/gpu/drm/amd/amdgpu/../include/aldebaran_ip_offset.h:161:29: warning: ‘PCIE0_BASE’ defined but not used [-Wunused-const-variable=]
 drivers/gpu/drm/amd/amdgpu/../include/aldebaran_ip_offset.h:119:29: warning: ‘L2IMU0_BASE’ defined but not used [-Wunused-const-variable=]
 drivers/gpu/drm/amd/amdgpu/../include/aldebaran_ip_offset.h:112:29: warning: ‘L1IMUPCIE0_BASE’ defined but not used [-Wunused-const-variable=]
 drivers/gpu/drm/amd/amdgpu/../include/aldebaran_ip_offset.h:105:29: warning: ‘L1IMUIOAGR0_BASE’ defined but not used [-Wunused-const-variable=]
 drivers/gpu/drm/amd/amdgpu/../include/aldebaran_ip_offset.h:98:29: warning: ‘IOHC0_BASE’ defined but not used [-Wunused-const-variable=]
 drivers/gpu/drm/amd/amdgpu/../include/aldebaran_ip_offset.h:91:29: warning: ‘IOAPIC0_BASE’ defined but not used [-Wunused-const-variable=]
 drivers/gpu/drm/amd/amdgpu/../include/aldebaran_ip_offset.h:84:29: warning: ‘IOAGR0_BASE’ defined but not used [-Wunused-const-variable=]
 drivers/gpu/drm/amd/amdgpu/../include/aldebaran_ip_offset.h:63:29: warning: ‘FUSE_BASE’ defined but not used [-Wunused-const-variable=]
 drivers/gpu/drm/amd/amdgpu/../include/aldebaran_ip_offset.h:49:29: warning: ‘DBGU_IO0_BASE’ defined but not used [-Wunused-const-variable=]
 drivers/gpu/drm/amd/amdgpu/../include/aldebaran_ip_offset.h:42:29: warning: ‘CLK_BASE’ defined but not used [-Wunused-const-variable=]

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/amd/include/aldebaran_ip_offset.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/include/aldebaran_ip_offset.h b/drivers/gpu/drm/amd/include/aldebaran_ip_offset.h
index 644ffec2b0ce8..cdd426b41c20e 100644
--- a/drivers/gpu/drm/amd/include/aldebaran_ip_offset.h
+++ b/drivers/gpu/drm/amd/include/aldebaran_ip_offset.h
@@ -30,7 +30,7 @@ struct IP_BASE_INSTANCE {
 
 struct IP_BASE {
     struct IP_BASE_INSTANCE instance[MAX_INSTANCE];
-};
+} __maybe_unused;
 
 static const struct IP_BASE ATHUB_BASE = { { { { 0x00000C20, 0x02408C00, 0, 0, 0, 0 } },
                                         { { 0, 0, 0, 0, 0, 0 } },
-- 
2.31.1


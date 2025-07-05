Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C13AFA03B
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jul 2025 15:21:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003D710E217;
	Sat,  5 Jul 2025 13:21:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hVVMO3ZX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C3F010E1E0;
 Sat,  5 Jul 2025 08:06:08 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-3141b84bf65so1530372a91.1; 
 Sat, 05 Jul 2025 01:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751702768; x=1752307568; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5YZ16XW5/oaudvAcjdRll9Pwcbdl4hYkpk0raAHNXFw=;
 b=hVVMO3ZXMD5YzjrNTCa1qcv8UEHEU6VJ77JnCLycWZcnP9cd3Ak1bLGwOUqRVHohz7
 OtsDmdkpJfp151C7kwMaImaQz3E2zfjvzgETmjCS0DvEPKJHYQ+jWqxspgLfkoPVLHj9
 7+UZQmSCQov6D4XhufIcMrFHV8uLI/wtiLCYHvN5ihEMiUu01nr8b8e/fKVgbyz959b1
 edt+Q7QBHRwTErUHlqJI003xepS9hG7Od/jlONMt2vT11wdimuGmp5vQ3e1O2n6AYZNw
 GJmJyJ8dBMTBXwCDo2Xsg8q5hh59tDR1kYxLcI4foQfX3BY8Xa5TSIvFl0sOxdR8/RNh
 tyOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751702768; x=1752307568;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5YZ16XW5/oaudvAcjdRll9Pwcbdl4hYkpk0raAHNXFw=;
 b=RGWds8arbTqca6xpWFl4rJg9tEg00P7CzKpDmuGUt/gr4kHwtuq4pny4MAYct+gF7J
 AT8cQ6jbWKmJh+QaflgdEBHyUcN5YPMd4ZZXbApUVXFdQeY7Fkam18JBtO8SvCm0K/4c
 K2n1Ba1h+v4LIyBtUr1VrFSShHI9JuC7xccJDC6mPheUndLzdxp4AvLJj+qiHJ1VEO+E
 r/Y4g4o/ocT37a4RbK/GDot1ITYpYIyQmj+WPOzNzYN+TpiVH3UPI5zMi5bMS5n0n9bu
 JkfmJrViqjgHbLN55m91GZiTW3FSiYnTr+2K2yEnxAXi/lEIJZTRGwKHdeRom8fOyenM
 fP/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7hFMLx+ujsqUiHNaCm4Yz2C1LQP7S5DOVE9IiDGA9ftZYSF3463NV3johulaTijgL99DuNV/1Mhs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/I/ZktrIRZ/4BDIA8lPoiyUCuw02LjGYrQkUGwR0Ay6i0xBBV
 U8LD6iir+TRpbhpPy/lUHX1TPFfiCg8d6DEdVynHgofjvDBxbb/iRYew
X-Gm-Gg: ASbGncvQiNcW3rY7XKWW4l+GvX/SNKCg/mvoWr+b/rG88L2C3mtH++lAR6vsEl6RiFp
 5UhjTSWkudQ+I1vLTNasgaBiYXUc2XtZk5T/viQuQsfHoKBFx9KVM7CyO2LqsJMbtDN94wCFtB8
 +wK+8Qa1CLS88+E5YuoHWtHkzRFkR+lLQILEKfPffrV4Nlvg86qF4k8jh/a7f3iV6bMLpIEfbVy
 Oz8rQc+bhPmvW20OOV3XtpOJe6vwHXh1MxoECB21XM38Feoy0ke5PpYZ7KvI1wLaXNvkRH4TrZp
 48DnNKAK/p0Zmgv6usBBMG7ryBO5uLyhx+5D4wvhc+1JmgPEGMaer2lN6xolHPh29nZ9lXAIYgX
 FAdmIDMs=
X-Google-Smtp-Source: AGHT+IGTWL+LXaCE0s7SVZTJw0Dw926iGaq0yWHgQOoV3X86xxB0l6u8NCO6LtHsTJv7Lmyc64Fp3Q==
X-Received: by 2002:a17:90b:1f87:b0:312:1ae9:152b with SMTP id
 98e67ed59e1d1-31aba8d2954mr1758967a91.23.1751702767425; 
 Sat, 05 Jul 2025 01:06:07 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31aaae3e3a3sm4010095a91.4.2025.07.05.01.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Jul 2025 01:06:06 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Han Gao <rabenda.cn@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Subject: [PATCH] drm/amdkfd: enable kfd on LoongArch systems
Date: Sat,  5 Jul 2025 16:05:40 +0800
Message-ID: <2b83380bf64a424b9cb902a20a244c3e106c4bb8.1751702072.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 05 Jul 2025 13:21:33 +0000
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

KFD has been confirmed that can run on LoongArch systems.
It's necessary to support CONFIG_HSA_AMD on LoongArch.

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
---
 drivers/gpu/drm/amd/amdkfd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/Kconfig b/drivers/gpu/drm/amd/amdkfd/Kconfig
index 62e88e5362e9..b2387d529bf0 100644
--- a/drivers/gpu/drm/amd/amdkfd/Kconfig
+++ b/drivers/gpu/drm/amd/amdkfd/Kconfig
@@ -5,7 +5,7 @@
 
 config HSA_AMD
 	bool "HSA kernel driver for AMD GPU devices"
-	depends on DRM_AMDGPU && (X86_64 || ARM64 || PPC64 || (RISCV && 64BIT))
+	depends on DRM_AMDGPU && (X86_64 || ARM64 || PPC64 || (RISCV && 64BIT) || LOONGARCH)
 	select HMM_MIRROR
 	select MMU_NOTIFIER
 	select DRM_AMDGPU_USERPTR
-- 
2.47.2


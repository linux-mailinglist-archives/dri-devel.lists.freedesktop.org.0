Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 631E466908E
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 09:20:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6979410E232;
	Fri, 13 Jan 2023 08:20:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F4D10E987
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 04:30:21 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id jr10so10979058qtb.7
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 20:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pefoley.com; s=google;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=p0dBrxhwzNc4hP4DgOVMhl62x5+l/CjTKJPM4tbmqzY=;
 b=YNDyGcfRgEU/Kq6pPTLt+tyMpJK1rsOqsYI8KPXwxZYIamFSE406hKfGFfzeEerv1h
 1xzx78ssO7r5z0r2Y51K2WiuU2PiGpD430GfLFw4iWyqHQaNGETSPhMo9muJQH7N3ekA
 /m1YAwav1xw/rVrcjgfP3J4/vdAeMZVUOrHsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p0dBrxhwzNc4hP4DgOVMhl62x5+l/CjTKJPM4tbmqzY=;
 b=k1zyDO67JR34PF5k79xC+z5sDxtqXvcxbi/TUr0ofhwBlyQmGIaezwJd+BqzZcev3H
 JSHa+CxqiV84czLt5cOJUPmJNw3kd9jfAMXupO9MEi9vkHPDT3o5IaLotCPbdcNbYWMR
 JKbhvIlh/fT6MUg9TAzhfkmWaJFZ9Bq+djZE+oM2uvHms6FAUpytGHEHmhixSSyuPzj0
 FltsGMinXqopc4LoMI4bsCAKdFa7nF7y5/IzZgRhn4Kt4FRf7TIW7RV9/tjJ+usPockT
 olGmkwMoWf07OFn2JdkTgrKxQ665QYQiiTrzva7YlHbOf4XlxTGdbzKn2KReji4ecgto
 CLOw==
X-Gm-Message-State: AFqh2krpHe+sm4/ThbZlCtI5Vu3A4xESdi/iPdlsIZd9xVeT4m6fEJre
 O38bstFqZ/oTE5R7+9MhvoajKd8mqC3vAYhIsdA=
X-Google-Smtp-Source: AMrXdXvheG74WaJ4gLRhKTBR9pU9wGyMsZMdYlR+zcKAn6f+t5K5H6COUVAnxs9Rkc5f5FnHEAbx2A==
X-Received: by 2002:ac8:45c1:0:b0:3b2:ad80:4ed9 with SMTP id
 e1-20020ac845c1000000b003b2ad804ed9mr2315153qto.3.1673584220004; 
 Thu, 12 Jan 2023 20:30:20 -0800 (PST)
Received: from [192.168.1.3] ([2600:4040:29fb:d300:887b:7eff:fe74:68b2])
 by smtp.gmail.com with ESMTPSA id
 k8-20020ac80748000000b0038b684a1642sm9990711qth.32.2023.01.12.20.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 20:30:19 -0800 (PST)
From: Peter Foley <pefoley2@pefoley.com>
Date: Thu, 12 Jan 2023 23:30:07 -0500
Subject: [PATCH] amdgpu: Avoid building on UML
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Message-Id: <20230112-amduml-v1-1-5e4a0d37de16@pefoley.com>
X-B4-Tracking: v=1; b=H4sIAE/ewGMC/x2NQQqDMBAAvyJ7NmASU2i/UjxszFoXmrTs2lII/
 r3R4zADU0FJmBRuXQWhLyu/SgPbdzCvWB5kODUGNzg/WOsM5vTJTxMu4epD8mNcIrQ4opKJgmVe
 jzyjbiSHeAst/DsP92nf/zXBjh9xAAAA
To: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?q?K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1673584219; l=1421;
 i=pefoley2@pefoley.com; s=20230111; h=from:subject:message-id;
 bh=V3EDjbwX5C9xijdyynQFeDCFZ4HzmtuuGO+aY7RnMrQ=;
 b=GWzJZguVtyMb5JcgRjAen1+KzgR+kAdz0XRNAOYpK4eBDV2AKONnUWnifIZ5CfMcjKl88KPVrRPX
 l03poj0LCnXMaRqG5RRghTm92bCkLke87D+Qsx+OXDh1+y4Pjk0Y
X-Developer-Key: i=pefoley2@pefoley.com; a=ed25519;
 pk=DCQqIdN6rHnvfQH58WQiQzJFfGUo1HyWSvdYG8vnO5o=
X-Mailman-Approved-At: Fri, 13 Jan 2023 08:20:31 +0000
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
Cc: Peter Foley <pefoley2@pefoley.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The amdgpu driver tries to use fields not supported by UML's cpuinfo
struct. Disable the driver when targeting UML to avoid tripping up
allyesconfig.

e.g.
../drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c: In function ‘intel_core_rkl_chk’:
../drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c:1742:33: error: initialization of ‘struct cpuinfo_x86 *’ from incompatible pointer type ‘struct cpuinfo_um *’ [-Werror=incompatible-pointer-types
]
../drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c: In function ‘kfd_cpumask_to_apic_id’:
../drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:2157:48: error: ‘struct cpuinfo_um’ has no member named ‘apicid’

Signed-off-by: Peter Foley <pefoley2@pefoley.com>
---
 drivers/gpu/drm/amd/amdgpu/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
index 5fcd510f1abb..aa0008ff8712 100644
--- a/drivers/gpu/drm/amd/amdgpu/Kconfig
+++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
@@ -3,6 +3,7 @@
 config DRM_AMDGPU
 	tristate "AMD GPU"
 	depends on DRM && PCI && MMU
+	depends on !UML
 	select FW_LOADER
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDMI_HELPER

---
base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
change-id: 20230112-amduml-565935d34bfb

Best regards,
-- 
Peter Foley <pefoley2@pefoley.com>

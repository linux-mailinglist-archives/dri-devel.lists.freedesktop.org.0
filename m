Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEFA574FB3
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 15:50:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDCAD10FD11;
	Thu, 14 Jul 2022 13:50:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4054310FA0B;
 Thu, 14 Jul 2022 13:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LBBAH8XdZRmaTV7zM6ta6Rvn55sV/KRTIAedB2vOTEM=; b=RhwQHoUYE9gZWHnvUkGvmtvFal
 gFg6JrNCgbyTmPYFF9ZSfeYGXpZKKBKr4Wu2qFzVKcjVsMomKNG04FER2FN0grjtDxMs3BxuV/M6E
 Dk65SFGsqjvMwIGV3FVYU5ReG6hDR7IPvwQ7Yo6miKha1LHsNUlp4e0h3LFIX9FgvHnYaxfHR+SE8
 9yXiW7rjeUSH6qFes+6+FePHtMzzx5+v86lylV+10/Z2RUzUyYvOgkAcpg7t1/uby9b4LZLXVgHUp
 VwzL0KahmTJN0L6xktbavY4vRs1XnmuWcViJrP3026pE+62KnwexusCleckmDr5etzQk1/7vTkCEE
 8XiHv01w==;
Received: from [177.139.47.106] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oBzEL-00GQUY-WE; Thu, 14 Jul 2022 15:50:14 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?=27Christian=20K=C3=B6nig=27?= <christian.koenig@amd.com>,
 'Pan Xinhui' <Xinhui.Pan@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Tao Zhou <tao.zhou1@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Jack Xiao <Jack.Xiao@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdgpu: Clarify asics naming in Kconfig options
Date: Thu, 14 Jul 2022 10:49:50 -0300
Message-Id: <20220714134950.9564-1-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.37.0
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
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 kernel-dev@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Clarify which architecture those asics acronyms refers to.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
index 74a8105fd2c0..7777d55275de 100644
--- a/drivers/gpu/drm/amd/amdgpu/Kconfig
+++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
@@ -4,7 +4,7 @@ config DRM_AMDGPU_SI
 	depends on DRM_AMDGPU
 	help
 	  Choose this option if you want to enable experimental support
-	  for SI asics.
+	  for SI (Southern Islands) asics.
 
 	  SI is already supported in radeon. Experimental support for SI
 	  in amdgpu will be disabled by default and is still provided by
@@ -16,7 +16,8 @@ config DRM_AMDGPU_CIK
 	bool "Enable amdgpu support for CIK parts"
 	depends on DRM_AMDGPU
 	help
-	  Choose this option if you want to enable support for CIK asics.
+	  Choose this option if you want to enable support for CIK (Sea
+	  Islands) asics.
 
 	  CIK is already supported in radeon. Support for CIK in amdgpu
 	  will be disabled by default and is still provided by radeon.
-- 
2.37.0


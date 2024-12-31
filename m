Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A479FEBC1
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 01:07:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD7510E467;
	Tue, 31 Dec 2024 00:07:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="BmW93RMs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2398210E467
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 00:07:44 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2163bd70069so24725055ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 16:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1735603603; x=1736208403;
 darn=lists.freedesktop.org; 
 h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
 :subject:from:to:cc:subject:date:message-id:reply-to;
 bh=F2yAYYBK5Idg3mVjplhEp+hgexJeLdI0/aBpgj88mUU=;
 b=BmW93RMsmbqPF7pivExIFkwG1+LFXpQmn0d6aSxMtxwDep2qeIT54aMKXbBhqqv5NE
 KGwP3Dwn7CZ+aM/MnVni1tLyM7TY0Em+UnBr9LNucZdgATCkUmLiWE8mTKlr5t50fH4i
 F3mpcIYr2Qa2noVTdy1q9x6w7YVY4NyO5UOhrJb9Ktu/BXa4JWgiX/IX1yjeOPf/G+oV
 99v337eChDG9tiuZXl3i4iXXctQlUzzC+CPzv3MDLZME3AUsdVU7FBrNDPvUsHrNsZgI
 U+4u4SACwBnxekujzzGg+TqwZck6u80zEIVjMdenLAYhEylzoaSqX3PFru17Y2LzFdfa
 2hoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735603603; x=1736208403;
 h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
 :subject:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F2yAYYBK5Idg3mVjplhEp+hgexJeLdI0/aBpgj88mUU=;
 b=ZyTZ8naDXfXDoUB841ye3sa9RIgFE6TEQ+VlUxegot2ZwKIvq8QrBke6rv3OTBYRq4
 S+22k3Jbi//Pxck0JMWbCHA24TvXptyhd8idOoZKDJ2ANCXLAw8MNPcLOYf6OJsl7vqt
 MduTcwC5RIX+nN06IYAr2n6p0O971leszf4aaX1Xn9ApJB4M9oZtJgQFzZWlcy9bU/VN
 Eln2q1Qh+qJ5fvPuQ16p2zthdsjSAgeMDhlKh5E+LBzH8aX2pEj/od32bV5HZ1JOLAmH
 QnH4jHnRlAR1fTWUtNuCmXJ7oHvzp1Rgn/iT7Jf/rU36yTKIEdIkYiNF3ERY0wZCbUOc
 8a7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWL6ljswcZ1GMHcwbGKZyjbTy+ij+nyZEwfIVn+xQp+i5wRplxm6oVvBCFyol4cWvqovHKvkoQBbQ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLTTbeYL8No5JiS/zo/u94Ls9UhosEtxWPUzsg/sTckjuM9h4F
 ql01e+eIhCc2s+Eqbm/92dLdnF6GTKs4ZB9RNI9ep33YdfQKpwPaUChKW6e+jTs=
X-Gm-Gg: ASbGncsTBETBmDbz2QaRFx1JY+8ln+JKEy4E4KomJBgOuNbqUzdWDMV9Zcnm+T5+Nka
 GYGnUw0KLz1SIw+7GE7At3mBumzSeGE2gxcG8MaPVzFPPXTqE/FEMwmoM7AEYWai75TI4N/7Fev
 TzyvW6zK4UFpYQXpealSwSbyWQQ4dOnC2urSoOb0x5Bjy3XF3naUl+pxg78vhW0bEdWeJYOQY+f
 lJnZwbWQNJJeyIm13wvwRcteHzbamMiOhAi7sHUfYLurZj6awA=
X-Google-Smtp-Source: AGHT+IE/AWOTszHUHtDpafE3qaXtf5KGoLf4JTW95pN+XrZuZ58jSfDBFbstrD9PLNosWr8Nde4ntQ==
X-Received: by 2002:a17:902:e886:b0:216:5e6e:68cb with SMTP id
 d9443c01a7336-219e6e9fd95mr561177575ad.16.1735603603622; 
 Mon, 30 Dec 2024 16:06:43 -0800 (PST)
Received: from localhost ([50.145.13.30]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc964a8bsm183765495ad.8.2024.12.30.16.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 16:06:39 -0800 (PST)
Subject: [PATCH] drm/amd/display: Increase frame-larger-than warning limit for
 DCN401
Date: Mon, 30 Dec 2024 16:02:58 -0800
Message-ID: <20241231000257.8533-2-palmer@rivosinc.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, 
 simona@ffwll.ch, hamza.mahfooz@amd.com, aurabindo.pillai@amd.com,
 wayne.lin@amd.com, Palmer Dabbelt <palmer@rivosinc.com>, moadhuri@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: amd-gfx@lists.freedesktop.org
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

From: Palmer Dabbelt <palmer@rivosinc.com>

Without this I get

  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn401/dcn401_resource.o
drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn401/dcn401_resource.c: In function ‘dcn401_dpp_create’:
drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn401/dcn401_resource.c:936:1: error: the frame size of 2720 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]
  936 | }
      | ^

when building for RISC-V/allmodconfig.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 drivers/gpu/drm/amd/display/dc/resource/Makefile | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/resource/Makefile b/drivers/gpu/drm/amd/display/dc/resource/Makefile
index 09320344d8e9..c2700a184f06 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/resource/Makefile
@@ -22,6 +22,13 @@
 # Makefile for the 'resource' sub-component of DAL.
 #
 
+ifneq ($(CONFIG_FRAME_WARN),0)
+ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)),y)
+frame_warn_flag := -Wframe-larger-than=4096
+else
+frame_warn_flag := -Wframe-larger-than=3072
+endif
+endif
 
 ###############################################################################
 #  DCE
@@ -203,5 +210,6 @@ RESOURCE_DCN401 = dcn401_resource.o
 AMD_DAL_RESOURCE_DCN401 = $(addprefix $(AMDDALPATH)/dc/resource/dcn401/,$(RESOURCE_DCN401))
 
 AMD_DISPLAY_FILES += $(AMD_DAL_RESOURCE_DCN401)
+CFLAGS_$(AMD_DAL_RESOURCE_DCN401) := $(frame_warn_flag)
 
 endif
-- 
2.45.1


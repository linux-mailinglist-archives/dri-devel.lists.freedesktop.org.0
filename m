Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5A65FE11A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 20:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FDC510E930;
	Thu, 13 Oct 2022 18:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F3510E331;
 Thu, 13 Oct 2022 18:25:27 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id 67so2668905pfz.12;
 Thu, 13 Oct 2022 11:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=4ZmXtZJMixqShxTQB3DrgCGxsvpU6XGpkMkCR/Be0Ns=;
 b=qxyiMOgrukOS5O+mSRxiWvsFQC6AMj1Zqs0Td/ugy5tePs+bYlKRfufbL1pcwymNcR
 iKuUX+lgmqhGLLM4ktWG8Oiwg3Df0g97Yc5kSgC27MDe7hnXOUsxVnAqqXlsMhFDPHzw
 HU8oRIhB2BekfzfsIrBP5wVILUigSiMxcV3ROgp+3cAmgcRGzOqFtVB2vFA8UxEdeTaU
 UxYU1jTJU00P6Vzd9Wy95vrFuujcHgsCOqQRTljGp20I52x078hXmi265i+dKPQWuMUs
 aDFvNTWnilolhZ9uTUa0tE6o917jEEWl6tdtSLne3qgyAt9Hs4l+9ja8btWuSCRLuVVZ
 UIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4ZmXtZJMixqShxTQB3DrgCGxsvpU6XGpkMkCR/Be0Ns=;
 b=Fk5libtkp/9JMuGkKF1mJ3qoRFwvF5kmLEbqtNLeNTsTHQtd3FP4uO6aHoPOeAJIjf
 fZvUz0Pa91D/83IeJCTUJLcM/33hk9WfH9P7ucsW31sc9GkY386EHt12qR+l7MlP05ev
 yDSRM336etIC9TLDKinmwl5UZYhuMe1gusZ88oX/tabANWabqy8c1Vj0d2B8Lay+ZJBd
 LJAZ7Jq9xe61lNikcJ3LjKJGIE1ECyv8yZQiNJcxHKVvYJ/ruoI4AZ++q3oloiF65S7A
 wo+WXSoGz3ZvMBUzQUOArgcHyTNX/nDYN8/6o93xSCN0yFcRxu7ga+kXxpuSXRJPl23I
 6wTQ==
X-Gm-Message-State: ACrzQf0eSYl9ZA2KhxKD0RwP2Fr+h1C2jm4p1cP7aEv1xmOGeCEhokP1
 2BsPMsjyOpNvb5NJimiQaPrluMcARxQ=
X-Google-Smtp-Source: AMsMyM6nfb+LCE3hIBIYEG429GiMquSTqSafrbWPFqyACpogsLk9KK8howtZBBZSa9A+cVHFFyfApQ==
X-Received: by 2002:a63:5f03:0:b0:460:b08a:8c00 with SMTP id
 t3-20020a635f03000000b00460b08a8c00mr1031226pgb.142.1665685526399; 
 Thu, 13 Oct 2022 11:25:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a654608000000b0044046aec036sm27713pgq.81.2022.10.13.11.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 11:25:25 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amd/display: Increase frame size limit for
 display_mode_vba_util_32.o
Date: Thu, 13 Oct 2022 11:25:23 -0700
Message-Id: <20221013182523.835499-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.36.2
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
Cc: Leo Li <sunpeng.li@amd.com>, Xinhui.Pan@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@google.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Building 32-bit images may fail with the following error.

drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_util_32.c:
	In function ‘dml32_UseMinimumDCFCLK’:
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_util_32.c:3142:1:
	error: the frame size of 1096 bytes is larger than 1024 bytes

This is seen when building i386:allmodconfig with any of the following
compilers.

	gcc (Debian 12.2.0-3) 12.2.0
	gcc (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0

The problem is not seen if the compiler supports GCC_PLUGIN_LATENT_ENTROPY
because in that case CONFIG_FRAME_WARN is already set to 2048 even for
32-bit builds.

dml32_UseMinimumDCFCLK() was introduced with commit dda4fb85e433
("drm/amd/display: DML changes for DCN32/321"). It declares a large
number of local variables. Increase the frame size for the affected
file to 2048, similar to other files in the same directory, to enable
32-bit build tests with affected compilers.

Fixes: dda4fb85e433 ("drm/amd/display: DML changes for DCN32/321")
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Reported-by: Łukasz Bartosik <ukaszb@google.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/gpu/drm/amd/display/dc/dml/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
index d70838edba80..ca7d24000621 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
@@ -77,7 +77,7 @@ CFLAGS_$(AMDDALPATH)/dc/dml/dcn30/dcn30_fpu.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn32/dcn32_fpu.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn32/display_mode_vba_32.o := $(dml_ccflags) $(frame_warn_flag)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn32/display_rq_dlg_calc_32.o := $(dml_ccflags)
-CFLAGS_$(AMDDALPATH)/dc/dml/dcn32/display_mode_vba_util_32.o := $(dml_ccflags)
+CFLAGS_$(AMDDALPATH)/dc/dml/dcn32/display_mode_vba_util_32.o := $(dml_ccflags) $(frame_warn_flag)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn321/dcn321_fpu.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn31/dcn31_fpu.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn301/dcn301_fpu.o := $(dml_ccflags)
-- 
2.36.2


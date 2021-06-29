Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0333B6E80
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 09:02:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 443246E7D3;
	Tue, 29 Jun 2021 07:02:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 198AC6E364
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 01:28:07 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 bb10-20020a17090b008ab029016eef083425so769643pjb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 18:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sdAmp65hciYeluIbPve30oHR/GPcy6OyyGVJziF+xHE=;
 b=ajlC3Y2BbwpJvb//BGwKk0iVmUKdgr6EEkltyLi6EKddugzIYMyVm811CxYaTI5RZ3
 XRN3lZcqg0qg+ZKvi6Csnfs2+RUTbc+LchNfBOOelhMYtnA1/2shvLGUzCo6Cz8I6y6n
 Wgb5Dyeh2Nax5GQ3GRJeG23tObPIf5m6B4JIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sdAmp65hciYeluIbPve30oHR/GPcy6OyyGVJziF+xHE=;
 b=fa5qmhnHrFely4JovM6Nyt26XxvpGPMYEuFkg44kcZgoFMDUEhsbDibGvuPIzpvkVs
 ya2uDN8CjT8lDsslCBYuNlpyJuioTbhyPMYS3KKgMudEQlvvIDLBG4qRQjVRezsYf1RX
 rtNZWKXi4iau3IZGQWumL1VdX8t44RGY1Q9oSXfYTbtSQJJ730rTjo6oQe3BlZbqrzIm
 rduhKdg+oTnT0hO2AqtguC18HesFx0/6jPcctiW+sRB0MWULqCa7z6UialUEgj1WWzYw
 VBj1B+pYr3YIJJ76rVjzsaNJrvrVAIoB/KK4Ty7v0ADWdb5QhU6yG47WHpzrA3W4Oa0E
 SqPw==
X-Gm-Message-State: AOAM533gP6c0HY1+2EfuZYfWLfL7JMDon/F7BHoyZTv3ife5SIz3e01B
 xm4soZ0VeAsfqyyvYODFxF/Q8g==
X-Google-Smtp-Source: ABdhPJxeHRsy5dAA1iYKi4mxjymB6XbfjeJZ1igdinqFlEjY7nzYbW2LIcSh8iUm3CRRIRAqczWUSA==
X-Received: by 2002:a17:90a:ba94:: with SMTP id
 t20mr16441598pjr.11.1624930087449; 
 Mon, 28 Jun 2021 18:28:07 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:7a14:49d8:be7f:e60e])
 by smtp.gmail.com with UTF8SMTPSA id u10sm15664815pfh.123.2021.06.28.18.28.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 18:28:06 -0700 (PDT)
From: Reka Norman <rekanorman@chromium.org>
X-Google-Original-From: Reka Norman <rekanorman@google.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amd/display: Respect CONFIG_FRAME_WARN=0 in dml Makefile
Date: Tue, 29 Jun 2021 11:27:18 +1000
Message-Id: <20210629112647.1.I7813d8e7298aa1a1c6bee84e6fd44a82ca24805c@changeid>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 29 Jun 2021 07:02:35 +0000
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
Cc: Reka Norman <rekanorman@google.com>, Will Deacon <will@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Kolesa <daniel@octaforge.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Huang Rui <ray.huang@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Setting CONFIG_FRAME_WARN=0 should disable 'stack frame larger than'
warnings. This is useful for example in KASAN builds. Make the dml
Makefile respect this config.

Fixes the following build warnings with CONFIG_KASAN=y and
CONFIG_FRAME_WARN=0:

drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:3642:6:
warning: stack frame size of 2216 bytes in function
'dml30_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than=]
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:3957:6:
warning: stack frame size of 2568 bytes in function
'dml31_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than=]

Signed-off-by: Reka Norman <rekanorman@google.com>
---

 drivers/gpu/drm/amd/display/dc/dml/Makefile | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
index d34024fd798a..45862167e6ce 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
@@ -50,6 +50,10 @@ dml_ccflags += -msse2
 endif
 endif
 
+ifneq ($(CONFIG_FRAME_WARN),0)
+frame_warn_flag := -Wframe-larger-than=2048
+endif
+
 CFLAGS_$(AMDDALPATH)/dc/dml/display_mode_lib.o := $(dml_ccflags)
 
 ifdef CONFIG_DRM_AMD_DC_DCN
@@ -60,9 +64,9 @@ CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20v2.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_rq_dlg_calc_20v2.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn21/display_mode_vba_21.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn21/display_rq_dlg_calc_21.o := $(dml_ccflags)
-CFLAGS_$(AMDDALPATH)/dc/dml/dcn30/display_mode_vba_30.o := $(dml_ccflags) -Wframe-larger-than=2048
+CFLAGS_$(AMDDALPATH)/dc/dml/dcn30/display_mode_vba_30.o := $(dml_ccflags) $(frame_warn_flag)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn30/display_rq_dlg_calc_30.o := $(dml_ccflags)
-CFLAGS_$(AMDDALPATH)/dc/dml/dcn31/display_mode_vba_31.o := $(dml_ccflags) -Wframe-larger-than=2048
+CFLAGS_$(AMDDALPATH)/dc/dml/dcn31/display_mode_vba_31.o := $(dml_ccflags) $(frame_warn_flag)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn31/display_rq_dlg_calc_31.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/display_mode_lib.o := $(dml_ccflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/display_mode_vba.o := $(dml_rcflags)
-- 
2.32.0.93.g670b81a890-goog


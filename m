Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9044D587BEF
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 14:04:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1973A112237;
	Tue,  2 Aug 2022 12:04:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA41214CC05;
 Tue,  2 Aug 2022 12:04:21 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-10e615a36b0so15387168fac.1; 
 Tue, 02 Aug 2022 05:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=szYfKRIZN4aoaPi+n+sh0rtODD9V4WUQ86iOcou1vWc=;
 b=oK2qLNS+/lw0sDZfBE5EQTadYWmFV/JngipxsStwS6KTzNB4WUJSIMNGKytqFhaA/d
 M/zcuLITulXEKXcMePbof/mlSkYJ3bTUVD6hFy496E9wwbFjv/Fl5McX5cX9GCs0yzf6
 qZZDiTi/dFHwb+btKQhDthZRDb+HiewJyWrNM8TLN/7I+Xm8G36Oobtzgze3ly1g2c1A
 V78qryB2Qi39uBY74mCKJ4Hkd1vPG20wjLy8udYCS2w0CUq78muKipVBYBD9Oqblp/hY
 /2/ISp8sxNy4ae7WuVTjumldtMdTwU9HK/VepctP5fdVMRgy9OtdCBm3FfHg8qfxlwhI
 6Amg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=szYfKRIZN4aoaPi+n+sh0rtODD9V4WUQ86iOcou1vWc=;
 b=1tNhoWcQ35f0OeEfIymk0TFPsItj4rw5g9Xs8xGIphzSh3e3yUR+SrVn56pbL+XHYg
 sN69nng6eCfKkS2Zkv7zEhdZ74hmWPAUrO8/7/9nhFPsj8a45Q9+8AsPOj34p1r53a/1
 v0jBjcqnBOIEMqWNHBbMAJJ0NJmExGFpJXSCiY/VNBB2A1vg78wI+KvCNbfYJ/iFD8pO
 kdE8y9tcIgfOeqmLPBX6dXE/MkG6CNmAJ/ECzh3uGg1YW8XKopHR0pJWT3v/lDWmo4S8
 2gh22NbYWtrGZE+MOxVO6VLP/vu270QeriGz7IfykGbX8oPMAu4itsDv/oXRtiH6h3l3
 ehMQ==
X-Gm-Message-State: AJIora94gqt0Y/FtHUuQRJGuLN3HIT3MXJI/8Jw1sUKD3dTbuBCn6Bp6
 bYdodur+jPZR2dlKA/rp2UQ=
X-Google-Smtp-Source: AGRyM1svY/0B68XGxStthRsoaBRtKTt1WYTXp9V8T35AelYJoa3etN88MMK3a7AZi8f8kIXMJPe0Fg==
X-Received: by 2002:a05:6870:c58b:b0:10b:d21d:ad5e with SMTP id
 ba11-20020a056870c58b00b0010bd21dad5emr8912499oab.287.1659441860757; 
 Tue, 02 Aug 2022 05:04:20 -0700 (PDT)
Received: from fedora.. ([2804:14c:bbe3:4370:95da:f07f:e927:6958])
 by smtp.gmail.com with ESMTPSA id
 eo18-20020a056870ec9200b0010f07647598sm78318oab.7.2022.08.02.05.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 05:04:19 -0700 (PDT)
From: Magali Lemes <magalilemes00@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/amd/display: remove DML Makefile duplicate lines
Date: Tue,  2 Aug 2022 09:04:06 -0300
Message-Id: <20220802120406.88845-1-magalilemes00@gmail.com>
X-Mailer: git-send-email 2.37.1
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
Cc: siqueirajordao@riseup.net, Magali Lemes <magalilemes00@gmail.com>,
 tales.aparecida@gmail.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, mwen@igalia.com, mairacanal@riseup.net,
 dri-devel@lists.freedesktop.org, isabbasso@riseup.net, andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are two identical CFLAGS entries for "display_mode_vba_20.o", so
remove one of them. Also, as there's already an entry for
"display_mode_lib.o" CFLAGS, regardless of CONFIG_DRM_AMD_DC_DCN being
defined or not, remove the one entry between CONFIG_DRM_AMD_DC_DCN ifdef
guards.

Signed-off-by: Magali Lemes <magalilemes00@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/dml/Makefile | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
index 359f6e9a1da0..41bb6c3cc2d8 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
@@ -61,7 +61,6 @@ CFLAGS_$(AMDDALPATH)/dc/dml/display_mode_vba.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn10/dcn10_fpu.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/dcn20_fpu.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20.o := $(dml_ccflags)
-CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_rq_dlg_calc_20.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20v2.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_rq_dlg_calc_20v2.o := $(dml_ccflags)
@@ -82,7 +81,6 @@ CFLAGS_$(AMDDALPATH)/dc/dml/dcn301/dcn301_fpu.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn302/dcn302_fpu.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn303/dcn303_fpu.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/dsc/rc_calc_fpu.o := $(dml_ccflags)
-CFLAGS_$(AMDDALPATH)/dc/dml/display_mode_lib.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/calcs/dcn_calcs.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/calcs/dcn_calc_auto.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/calcs/dcn_calc_math.o := $(dml_ccflags) -Wno-tautological-compare
-- 
2.37.1


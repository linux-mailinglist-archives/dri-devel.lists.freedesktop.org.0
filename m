Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9779C550775
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jun 2022 01:27:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6381011A766;
	Sat, 18 Jun 2022 23:27:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2058411A734;
 Sat, 18 Jun 2022 23:27:41 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id p14so1485932pfh.6;
 Sat, 18 Jun 2022 16:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eyOniFzGkggN/BNR4fP33bSiUm/C5vv+vYb/J1FSUS4=;
 b=Ttg3wdyzeiKJB847h7nBdgl63ewqXqb81I4QWBIPaMTFfJmyE+YCT26WXMSL8xq/XD
 rGaUsrDNU0KcaAnhuiZOIWdyl3ZqZMUIuhzVxfAR92mXkesEu3JgtkNXe3hFy1NUB6yv
 kxw5tIXIqjprqmL+s1CklztKAoVKkszrbuVfJ4D79IKVSRBZzG8z8xPRFDa9LSpF7rw+
 Et5JzFIOmDogBuwG6vr3sadNoDvn2UW0qCGiAEvo/Wr2cn2BMqrCxHcFp1BaqQfj3pNs
 1MZsw7DALTAAS5ix9rGIu0zi9jZHoZjFTMR08ucY/2Gv04UL/MaNveP0y7UiZBCmndzL
 o+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=eyOniFzGkggN/BNR4fP33bSiUm/C5vv+vYb/J1FSUS4=;
 b=0EzYhh4ndlCoFD9c6/2fPsiD0RJSkwr+P2d4dDbghsZg4QgINR526PEBNJxXaEv1y4
 tjQo75IPkFVp0yCA865bVXikZ8Tq+6pBGj1IC5/sUIucUoc0QtpWSaqHzebQYlIkqeoS
 tFH3kgswHG9qbfGnNXvNmADf08sRi3QTs0T+TKn6lMCvSjxHxJceYQ08wljTQtGWxEge
 PrinxouimvUOtdolw/WgsK3F3sDAoZ3KA1NuWh0bSkkxXt8lhjKYtt3RV57soEeSJfd7
 C4uDwXH8GG5S8TB0h7IN/hvKbkjhrPhRkLI4/aDMc9CjH6xzplCTp69Wopz2nSu8bXVC
 ihAw==
X-Gm-Message-State: AJIora8DlZAQM14yXDhOOi8/FAiWgGqhgnmvNVgxyAWMPQTaeXk0s0af
 WGlT8lPkxQvjZa34tIPtmwA=
X-Google-Smtp-Source: AGRyM1u62PBcm5Y40nQHnj8D6xkwCDaulpOuvJfCK9cwHwss7CDToxb5H9oHXGRGs95dI8vjU3pbzA==
X-Received: by 2002:a05:6a00:278e:b0:525:1aeb:d5a with SMTP id
 bd14-20020a056a00278e00b005251aeb0d5amr1204939pfb.61.1655594860400; 
 Sat, 18 Jun 2022 16:27:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 ik10-20020a170902ab0a00b001617541c94fsm5838954plb.60.2022.06.18.16.27.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jun 2022 16:27:39 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH] drm/amd/display: Add missing hard-float compile flags for
 PPC64 builds
Date: Sat, 18 Jun 2022 16:27:37 -0700
Message-Id: <20220618232737.2036722-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.35.1
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
Cc: Leo Li <sunpeng.li@amd.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Guenter Roeck <linux@roeck-us.net>, Daniel Axtens <dja@axtens.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ppc:allmodconfig builds fail with the following error.

powerpc64-linux-ld:
	drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o
		uses hard float,
	drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_resource.o
		uses soft float
powerpc64-linux-ld:
	failed to merge target specific data of file
	drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_resource.o
powerpc64-linux-ld:
	drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o
		uses hard float,
	drivers/gpu/drm/amd/amdgpu/../display/dc/dcn315/dcn315_resource.o
		uses soft float
powerpc64-linux-ld:
	failed to merge target specific data of
	file drivers/gpu/drm/amd/amdgpu/../display/dc/dcn315/dcn315_resource.o
powerpc64-linux-ld:
	drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o
		uses hard float,
	drivers/gpu/drm/amd/amdgpu/../display/dc/dcn316/dcn316_resource.o
		uses soft float
powerpc64-linux-ld:
	failed to merge target specific data of file
	drivers/gpu/drm/amd/amdgpu/../display/dc/dcn316/dcn316_resource.o

The problem was introduced with commit 41b7a347bf14 ("powerpc: Book3S
64-bit outline-only KASAN support") which adds support for KASAN. This
commit in turn enables DRM_AMD_DC_DCN because KCOV_INSTRUMENT_ALL and
KCOV_ENABLE_COMPARISONS are no longer enabled. As result, new files are
compiled which lack the selection of hard-float.

Fixes: 41b7a347bf14 ("powerpc: Book3S 64-bit outline-only KASAN support")
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Daniel Axtens <dja@axtens.net>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/gpu/drm/amd/display/dc/dcn31/Makefile  | 4 ++++
 drivers/gpu/drm/amd/display/dc/dcn315/Makefile | 4 ++++
 drivers/gpu/drm/amd/display/dc/dcn316/Makefile | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/Makefile b/drivers/gpu/drm/amd/display/dc/dcn31/Makefile
index ec041e3cda30..74be02114ae4 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/Makefile
@@ -15,6 +15,10 @@ DCN31 = dcn31_resource.o dcn31_hubbub.o dcn31_hwseq.o dcn31_init.o dcn31_hubp.o
 	dcn31_apg.o dcn31_hpo_dp_stream_encoder.o dcn31_hpo_dp_link_encoder.o \
 	dcn31_afmt.o dcn31_vpg.o
 
+ifdef CONFIG_PPC64
+CFLAGS_$(AMDDALPATH)/dc/dcn31/dcn31_resource.o := -mhard-float -maltivec
+endif
+
 AMD_DAL_DCN31 = $(addprefix $(AMDDALPATH)/dc/dcn31/,$(DCN31))
 
 AMD_DISPLAY_FILES += $(AMD_DAL_DCN31)
diff --git a/drivers/gpu/drm/amd/display/dc/dcn315/Makefile b/drivers/gpu/drm/amd/display/dc/dcn315/Makefile
index 59381d24800b..1395c1ced8c5 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn315/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dcn315/Makefile
@@ -25,6 +25,10 @@
 
 DCN315 = dcn315_resource.o
 
+ifdef CONFIG_PPC64
+CFLAGS_$(AMDDALPATH)/dc/dcn315/dcn315_resource.o := -mhard-float -maltivec
+endif
+
 AMD_DAL_DCN315 = $(addprefix $(AMDDALPATH)/dc/dcn315/,$(DCN315))
 
 AMD_DISPLAY_FILES += $(AMD_DAL_DCN315)
diff --git a/drivers/gpu/drm/amd/display/dc/dcn316/Makefile b/drivers/gpu/drm/amd/display/dc/dcn316/Makefile
index 819d44a9439b..c3d2dd78f1e2 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn316/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dcn316/Makefile
@@ -25,6 +25,10 @@
 
 DCN316 = dcn316_resource.o
 
+ifdef CONFIG_PPC64
+CFLAGS_$(AMDDALPATH)/dc/dcn316/dcn316_resource.o := -mhard-float -maltivec
+endif
+
 AMD_DAL_DCN316 = $(addprefix $(AMDDALPATH)/dc/dcn316/,$(DCN316))
 
 AMD_DISPLAY_FILES += $(AMD_DAL_DCN316)
-- 
2.35.1


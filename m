Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E57FD5501C4
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jun 2022 03:56:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2127410F284;
	Sat, 18 Jun 2022 01:56:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C2810F304;
 Sat, 18 Jun 2022 01:56:53 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id r5so5438310pgr.3;
 Fri, 17 Jun 2022 18:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RtAGuPWlDclOLtuut3wNPxB76BoLDhIudEt0Y8tqNwk=;
 b=L37xTtW94OTIvyImZWUWZSzaVN/Q+8SfdWOHEUuPC8e+e+hEbsgWmWvBUBIhMGhiYN
 CA2w7oCmfZ8hjGkruCkfuE0iNf2LtSINoeXRn/74G+V0TJTcOzZx2bBy+fFul3s97JG+
 Co7XMPQeD3CR+CAqvhl/QZHJ60ByD5IFcuPAZvFew44CmClDCgYilo2kC7/gVcUcQpCM
 i0yYyfFHf9EVIY3CzNSqqg120wcWU234NTqGaxub2HGAXfBph/DDc3M6dFhiGXC57Ge5
 ye0QTrTJHMhZpOWd+ppjXKWaA/paaJgOClVUSCYCncZz32OzbZzV1ZCu/BGYj66twmYT
 Bdgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RtAGuPWlDclOLtuut3wNPxB76BoLDhIudEt0Y8tqNwk=;
 b=6b7U0gjxrscrGvO71VvtKwD6QcPSNOfAWiyezXTuXqhcnq7Seqmpw/Q/K1lgBdIxRI
 UpEpXekbSZg5zrwV416LZUoCNRKXf3XNMGDbWJOOrMgwwp6FqvLlHrFHfwzmprpX9cmj
 dlrvDa9l6ght4Whfq7+fn7t1iMlMkfJSPlASLFryPr0Ksq/7+zc6kLOVC0Lxv9VPMqz4
 +MZ0o61Ehup9JBmKJUT856inlrqtYNpDSiseZTD9b35vYiyS0N5REZ7LTe5A3AD/6E43
 /eimhlTWcjtY9vF7gjTdh384JNnkCsBdJBLLTyF3CY52lBBC7T0kPuVzOSawqx6ggV5n
 nY6w==
X-Gm-Message-State: AJIora+Iw4sLP84OoXGmnyi9wnyF9QtRtXzC/sZHDCeWI0do2b2zoyHo
 ItRylU6wLunjKtaeC+byf0E=
X-Google-Smtp-Source: AGRyM1vEBh1R1S9d8pNr3JY9mG86I2UOBCZzS+O5P3XJMHMYGjs/EywCv3TlJEd7jifeNpsrJzXvBw==
X-Received: by 2002:a63:5706:0:b0:3fc:a31b:9083 with SMTP id
 l6-20020a635706000000b003fca31b9083mr11427116pgb.333.1655517412758; 
 Fri, 17 Jun 2022 18:56:52 -0700 (PDT)
Received: from localhost.localdomain ([122.167.211.160])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a170903248f00b00163c6ac211fsm1921227plw.111.2022.06.17.18.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 18:56:52 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, nicholas.kazlauskas@amd.com,
 Roman.Li@amd.com, shenshih@amd.com, Wayne.Lin@amd.com, contact@emersion.fr
Subject: [PATCH] drm/amd/display: Remove unused variable 'abo'
Date: Sat, 18 Jun 2022 07:26:42 +0530
Message-Id: <20220618015642.5958-1-jrdr.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: "Souptick Joarder \(HPE\)" <jrdr.linux@gmail.com>,
 Kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Souptick Joarder (HPE)" <jrdr.linux@gmail.com>

Kernel test robot throws below warning ->
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:9143:27:
warning: variable 'abo' set but not used [-Wunused-but-set-variable]

Remove the unused variable.

Reported-by: Kernel test robot <lkp@intel.com>
Signed-off-by: Souptick Joarder (HPE) <jrdr.linux@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index c9004f7e700d..0103b34aabdd 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -9136,7 +9136,6 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 			to_dm_crtc_state(drm_atomic_get_old_crtc_state(state, pcrtc));
 	int planes_count = 0, vpos, hpos;
 	unsigned long flags;
-	struct amdgpu_bo *abo;
 	uint32_t target_vblank, last_flip_vblank;
 	bool vrr_active = amdgpu_dm_vrr_active(acrtc_state);
 	bool pflip_present = false;
@@ -9208,7 +9207,6 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 			continue;
 		}
 
-		abo = gem_to_amdgpu_bo(fb->obj[0]);
 		fill_dc_plane_info_and_addr(
 			dm->adev, new_plane_state,
 			afb->tiling_flags,
-- 
2.25.1


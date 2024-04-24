Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 318B48B1200
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 20:19:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A4A113D20;
	Wed, 24 Apr 2024 18:19:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jj243eK0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B92113D1A;
 Wed, 24 Apr 2024 18:19:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CAF75CE1822;
 Wed, 24 Apr 2024 18:19:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1BE2C4AF16;
 Wed, 24 Apr 2024 18:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713982772;
 bh=wNBG1N4ibHT2sMU2yEE26oOnTyiOJON1lvGd91xK8sc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=jj243eK0C4W0dptRwKs3lyGHWjxD/cRXiQZaRsS8UzJqkq7IqGN5dzzsLbDYPxgOs
 b9lfflFbuMt/X0+nDwcVc5dXopJTyaVdkaWNhkNO26ULdmQ3KIIkK2WCMAu8yloN55
 JDn7fKnOioY1/KUC18kfLGJAO4namuy1UT2S+jYgq0dTuJijsGqohAMxLsnvUIpwOP
 t6udWcYlCtzhMTe9viG1Eb8uYgCJElCyUcDm9ZhhLh0ms9irWR337QSyF8iN074Wrx
 So5LDkDIHWPtIXy/EKd04pM+ZpKbYZB6vEWnODqRuL0IbPgSVHGN3ojTTkGI8fvrMB
 kYTd64gViKopg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 24 Apr 2024 11:19:27 -0700
Subject: [PATCH 2/2] drm/amd/display: Fix CFLAGS for dml2_core_dcn4_calcs.o
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240424-amdgpu-dml2-fix-frame-larger-than-dcn401-v1-2-5659f8fa8816@kernel.org>
References: <20240424-amdgpu-dml2-fix-frame-larger-than-dcn401-v1-0-5659f8fa8816@kernel.org>
In-Reply-To: <20240424-amdgpu-dml2-fix-frame-larger-than-dcn401-v1-0-5659f8fa8816@kernel.org>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com
Cc: aurabindo.pillai@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, llvm@lists.linux.dev, 
 patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2877; i=nathan@kernel.org;
 h=from:subject:message-id; bh=wNBG1N4ibHT2sMU2yEE26oOnTyiOJON1lvGd91xK8sc=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDGmavoZ7WqWTd2zN3O5otKdd/7jNUTGJU8Lx9azG2eaad
 0XOhMp2lLIwiHExyIopslQ/Vj1uaDjnLOONU5Ng5rAygQxh4OIUgIloPWL475Bbz/zU525+ytRf
 4nyyK35tZW+7+v29TJsC277g9BXhvgx/5XQmGHpFrlyQ8Ta7Zm70BBm+81eLMyebhso7/tS+cTm
 QCQA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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

-Wframe-larger-than=2048 is a part of both CFLAGS and CFLAGS_REMOVE for
dml2_core_dcn4_calcs.o, which means that it ultimately gets removed
altogether for 64-bit targets, as 2048 is the default FRAME_WARN value
for 64-bit platforms, resulting in no -Wframe-larger-than coverage for
this file.

Remove -Wframe-larger-than from CFLAGS_REMOVE_dml2_core_dcn4_calcs.o and
move to $(frame_warn_flag) for CFLAGS_dml2_core_dcn4_calcs.o, as that
accounts for the fact that -Wframe-larger-than may need to be larger
than 2048 in certain situations, such as when the sanitizers are
enabled.

Fixes: d546a39c6b10 ("drm/amd/display: Add misc DC changes for DCN401")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dml2/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/Makefile b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
index c35212a4a968..904a2d419638 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
@@ -111,7 +111,7 @@ CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_top/dml_top.o := $(dml2_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_top/dml_top_mcache.o := $(dml2_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_top/dml2_top_optimization := $(dml2_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.o := $(dml2_ccflags)
-CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.o := $(dml2_ccflags) -Wframe-larger-than=2048
+CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.o := $(dml2_ccflags) $(frame_warn_flag)
 CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_factory.o := $(dml2_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_shared.o := $(dml2_ccflags) $(frame_warn_flag)
 CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.o := $(dml2_ccflags)
@@ -134,7 +134,7 @@ CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_top/dml_top.o := $(dml2_rcfla
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_top/dml_top_mcache.o := $(dml2_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_top/dml2_top_optimization.o := $(dml2_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.o := $(dml2_rcflags)
-CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.o := $(dml2_rcflags) -Wframe-larger-than=2048
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.o := $(dml2_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_factory.o := $(dml2_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_shared.o := $(dml2_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.o := $(dml2_rcflags)

-- 
2.44.0


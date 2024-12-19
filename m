Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E93A9F814B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 18:12:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3376A10ED60;
	Thu, 19 Dec 2024 17:12:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="M8VHGVs4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C9910E280;
 Thu, 19 Dec 2024 17:12:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 59A98A427EF;
 Thu, 19 Dec 2024 17:10:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63AADC4CECE;
 Thu, 19 Dec 2024 17:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734628364;
 bh=MpqPn06almC1w7AKhIWoa4Ja+d2HKNexfyEQuKVEwGA=;
 h=From:Date:Subject:To:Cc:From;
 b=M8VHGVs4H5v7Nfk8+7GME1RH4pX2cA6x5VJArmiYYpUzRuKMn384x8RKEFjFUZlZU
 wUnXWhGZ2LA8mEik95iGWk18wEjnjQn1nPsjHW1IodC10G/GD2SjqoRTirExpWD87F
 V2MJrjB95v9z1eUtmnUTHUJlJGR+ITe8/Q2Xn50jNCW2HSctPxr9JUiUIfib0W5rVE
 bQoIQMlpiAGxDEnCJddOFFl6CuBKMpYEkqBys63PYObgYuIV9YIQsfc4sqaP2ksQ+j
 TqnCvgaCSnmiaJjc7AV1+r47NEQwNpqryQdm60gk8nlQmosuNILzYhIeDmXvctwGrK
 u5xPk2TUZNQFA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 19 Dec 2024 10:12:31 -0700
Subject: [PATCH] drm/amd/display: Disable -Wenum-float-conversion for
 dml2_dpmm_dcn4.c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-amdgpu-fix-enum-float-conversion-again-again-v1-1-ef2c619724b1@kernel.org>
X-B4-Tracking: v=1; b=H4sIAP5TZGcC/zWNQQrDIBBFrxJmnYEqbYq9SsliqqMZaDRoDIGQu
 9cWuvnwFu/9Awpn4QKP7oDMmxRJsYHqO7ATxcAorjHoi74qrQzS7MJS0cuOHOuM/p1oRZvixvk
 rIwWS/9qXd0bdjL8PDlpyydzE391zPM8PilMQuH4AAAA=
X-Change-ID: 20241219-amdgpu-fix-enum-float-conversion-again-again-cbfd9159f76d
To: Chaitanya Dhere <chaitanya.dhere@amd.com>, Jun Lei <jun.lei@amd.com>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, Austin Zheng <Austin.Zheng@amd.com>
Cc: Dillon Varone <dillon.varone@amd.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, llvm@lists.linux.dev, 
 patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2673; i=nathan@kernel.org;
 h=from:subject:message-id; bh=MpqPn06almC1w7AKhIWoa4Ja+d2HKNexfyEQuKVEwGA=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDOkpIZx5PxTOzXhyjTvigruC+UJfYYdX9hu+FZelS8o0/
 uoxz53RUcrCIMbFICumyFL9WPW4oeGcs4w3Tk2CmcPKBDKEgYtTACbyfw7D/7J75sm3tx6b9ts1
 Vpz//doP6hqmUZpFexgvvq056L/tcwDDP+NGvzVRfxNSHHZbzV/soVIk4jpPUO4aB6eZw+q9jGm
 3OQA=
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

Commit be4e3509314a ("drm/amd/display: DML21 Reintegration For Various
Fixes") blew away commit fdedd77b0eb3 ("drm/amd/display: Reapply
2fde4fdddc1f"), which itself was a reapplication for the same reason,
which results in that compiler warning returning:

  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c:215:58: error: arithmetic between enumeration type 'enum dentist_divider_range' and floating-point type 'double' [-Werror,-Wenum-float-conversion]
    215 |         divider = (unsigned int)(DFS_DIVIDER_RANGE_SCALE_FACTOR * (vco_freq_khz / clock_khz));
        |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~

Just disable the warning for the whole file via Makefile to avoid having
to reapply the same fix every time the code syncs from wherever it is
actually maintained.

Fixes: be4e3509314a ("drm/amd/display: DML21 Reintegration For Various Fixes")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
If you would prefer reapplying the local fix, feel free to do so, but I
would like for it to be in the upstream source so it does not have to
keep being applied.
---
 drivers/gpu/drm/amd/display/dc/dml2/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/Makefile b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
index d9c27ebe12ee08d6330eb199cd8ca9c8489fa5b2..5c0f93644c5d43c8a0bc12713fc400712d8de50b 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
@@ -78,7 +78,7 @@ CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.o := $(dml2_ccfla
 CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.o := $(dml2_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.o := $(dml2_ccflags) $(frame_warn_flag)
 CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_factory.o := $(dml2_ccflags)
-CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.o := $(dml2_ccflags)
+CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.o := $(dml2_ccflags) $(call cc-disable-warning,enum-float-conversion)
 CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.o := $(dml2_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.o := $(dml2_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_factory.o := $(dml2_ccflags)

---
base-commit: 695c2c745e5dff201b75da8a1d237ce403600d04
change-id: 20241219-amdgpu-fix-enum-float-conversion-again-again-cbfd9159f76d

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


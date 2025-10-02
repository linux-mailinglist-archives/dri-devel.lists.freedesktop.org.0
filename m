Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF0EBB55E8
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 23:01:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D810D10E850;
	Thu,  2 Oct 2025 21:01:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="NPb+vcCO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com
 [209.85.218.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA98D10E009
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 21:01:08 +0000 (UTC)
Received: by mail-ej1-f73.google.com with SMTP id
 a640c23a62f3a-b3afaf5defdso189706666b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 14:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1759438867; x=1760043667;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZXewi+MSpgfgN5O6jXVKlfCi06aVUrotCL/q5o/3Ssw=;
 b=NPb+vcCOWMNBd6pbCd6qmVtpudYMp92/eYzIdI/VDvvzQkwua8ScHiJVKj/GWiMA5h
 0gJpRgY4FTSO1Ni0J9476oNE+ayydFLeCq3s+VN/4+G+YjKntK64VUkadTdvscMEI2N1
 PpHrv+CUHtxS8AtJYeeKXIbWhL6dmqrd6mYsI9uhmFVJNV2Xqv5+KVDev3Dq268meg1s
 rdtZV1ChECQUZvjDtjOYQsETO5BNYjb8bXxOLJLMUkhSlqMYGgWSaAhTVnx7Ti7bvAfu
 jb5nUf/lB2KaY6n/QGmqHUhdoYBGkSu5cal/66gOXqrSiLx86vFZbNHAYqSXFHb8cu3Q
 2nOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759438867; x=1760043667;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZXewi+MSpgfgN5O6jXVKlfCi06aVUrotCL/q5o/3Ssw=;
 b=LIvqyblDc4dlzARhmjXDM4xJOtNVN4hF6mWdpfYaMM8cFxhrD2ZH75Tso2UiCar/5F
 vnxfQnCCcX5K2mEEXH9S9DodK0fT6rBNAg9iepohvll0+IcpAC5DuQeT0eEH1qVNAUkk
 9ij9dPIBcd3FpN50FL8ID81KzDCzg5aDeBnhdGB6cp7jL70fFnSC24bxbBRwnn4ykkwv
 TuPRb/iv+UZ+G4W59KYMvkd2R8APam7z7i87HtauTYOBs6p4XaG5OI/tpJyg8619lC0a
 HlunTulreiQel2P3q8tndoiVTWJoF+PEaolT0YbEd93+nUWj+vaDGXqve2GIqVP+wsAW
 N5tA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrseVqK1wfA5T8Zy83Z79+BMTFsvav8c2n41iGc6OhTcooPquvMPllgFMiz7zEBDFOn6jcuBoNPzw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxyGaA8PbuO0/gYxXnYVUgAbwURtpQRUHiB79l7sTQg7zM99CDM
 E00mP0CzvePApSTOsMGiE1EOzYns1n0J2wNLvrOhgSs4TcemA7OQBO6clqfBCOT1tL15ldB/Yg=
 =
X-Google-Smtp-Source: AGHT+IEExjmvbF8Lb9M+XG7YR7QTAIMSCeCwavhfGOO8t62xLo8r+Wg9cNCxdOmE3p/nTVLIqxQSzoMn
X-Received: from ejbwr20.prod.google.com ([2002:a17:907:7014:b0:b44:aed4:d213])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:ea6:b0:b3d:5088:213f
 with SMTP id a640c23a62f3a-b49c1c67beamr97495666b.19.1759438867035; Thu, 02
 Oct 2025 14:01:07 -0700 (PDT)
Date: Thu,  2 Oct 2025 23:00:45 +0200
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp;
 fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=9413; i=ardb@kernel.org;
 h=from:subject; bh=79gRZqCE8gjHML9Xmm1M2zyzayfEyQ0TDshfv9BB904=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIePe879ls71YX5scfvJf5tKT1d+uaJ59tN3VeJWKzuzfz
 VGe3XEMHaUsDGJcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAinx4zMmzNfqabUnh+kuY1
 TTPlV3OjZk+Nl5+qFa4mdlh9xdXUz5MYGTZ6OM+auzPnydya25LCCr9O8R/X2Fn9T0B3aa5tyAH
 hDgYA
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251002210044.1726731-2-ardb+git@google.com>
Subject: [PATCH] drm/amd/display: Fix unsafe uses of kernel mode FPU
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org, 
 catalin.marinas@arm.com, mark.rutland@arm.com, broonie@kernel.org, 
 Ard Biesheuvel <ardb@kernel.org>, Austin Zheng <austin.zheng@amd.com>,
 Jun Lei <jun.lei@amd.com>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

From: Ard Biesheuvel <ardb@kernel.org>

The point of isolating code that uses kernel mode FPU in separate
compilation units is to ensure that even implicit uses of, e.g., SIMD
registers for spilling occur only in a context where this is permitted,
i.e., from inside a kernel_fpu_begin/end block.

This is important on arm64, which uses -mgeneral-regs-only to build all
kernel code, with the exception of such compilation units where FP or
SIMD registers are expected to be used. Given that the compiler may
invent uses of FP/SIMD anywhere in such a unit, none of its code may be
accessible from outside a kernel_fpu_begin/end block.

This means that all callers into such compilation units must use the
DC_FP start/end macros, which must not occur there themselves. For
robustness, all functions with external linkage that reside there should
call dc_assert_fp_enabled() to assert that the FPU context was set up
correctly.

Fix this for the DCN35, DCN351 and DCN36 implementations.

Cc: Austin Zheng <austin.zheng@amd.com>
Cc: Jun Lei <jun.lei@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Rodrigo Siqueira <siqueira@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 .../drm/amd/display/dc/dml/dcn31/dcn31_fpu.c    |  4 ++++
 .../drm/amd/display/dc/dml/dcn35/dcn35_fpu.c    |  6 ++++--
 .../drm/amd/display/dc/dml/dcn351/dcn351_fpu.c  |  4 ++--
 .../display/dc/resource/dcn35/dcn35_resource.c  | 16 +++++++++++++++-
 .../dc/resource/dcn351/dcn351_resource.c        | 17 ++++++++++++++++-
 .../display/dc/resource/dcn36/dcn36_resource.c  | 16 +++++++++++++++-
 6 files changed, 56 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c b/drivers=
/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
index 17a21bcbde17..1a28061bb9ff 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
@@ -808,6 +808,8 @@ void dcn316_update_bw_bounding_box(struct dc *dc, struc=
t clk_bw_params *bw_param
=20
 int dcn_get_max_non_odm_pix_rate_100hz(struct _vcs_dpi_soc_bounding_box_st=
 *soc)
 {
+	dc_assert_fp_enabled();
+
 	return soc->clock_limits[0].dispclk_mhz * 10000.0 / (1.0 + soc->dcn_downs=
pread_percent / 100.0);
 }
=20
@@ -815,6 +817,8 @@ int dcn_get_approx_det_segs_required_for_pstate(
 		struct _vcs_dpi_soc_bounding_box_st *soc,
 		int pix_clk_100hz, int bpp, int seg_size_kb)
 {
+	dc_assert_fp_enabled();
+
 	/* Roughly calculate required crb to hide latency. In practice there is s=
lightly
 	 * more buffer available for latency hiding
 	 */
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c b/drivers=
/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
index 5d73efa2f0c9..15a1d77dfe36 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
@@ -445,6 +445,8 @@ int dcn35_populate_dml_pipes_from_context_fpu(struct dc=
 *dc,
 	bool upscaled =3D false;
 	const unsigned int max_allowed_vblank_nom =3D 1023;
=20
+	dc_assert_fp_enabled();
+
 	dcn31_populate_dml_pipes_from_context(dc, context, pipes,
 					      validate_mode);
=20
@@ -498,9 +500,7 @@ int dcn35_populate_dml_pipes_from_context_fpu(struct dc=
 *dc,
=20
 		pipes[pipe_cnt].pipe.src.unbounded_req_mode =3D false;
=20
-		DC_FP_START();
 		dcn31_zero_pipe_dcc_fraction(pipes, pipe_cnt);
-		DC_FP_END();
=20
 		pipes[pipe_cnt].pipe.dest.vfront_porch =3D timing->v_front_porch;
 		pipes[pipe_cnt].pipe.src.dcc_rate =3D 3;
@@ -581,6 +581,8 @@ void dcn35_decide_zstate_support(struct dc *dc, struct =
dc_state *context)
 	unsigned int i, plane_count =3D 0;
 	DC_LOGGER_INIT(dc->ctx->logger);
=20
+	dc_assert_fp_enabled();
+
 	for (i =3D 0; i < dc->res_pool->pipe_count; i++) {
 		if (context->res_ctx.pipe_ctx[i].plane_state)
 			plane_count++;
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c b/drive=
rs/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c
index 6f516af82956..e5cfe73f640a 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c
@@ -478,6 +478,8 @@ int dcn351_populate_dml_pipes_from_context_fpu(struct d=
c *dc,
 	bool upscaled =3D false;
 	const unsigned int max_allowed_vblank_nom =3D 1023;
=20
+	dc_assert_fp_enabled();
+
 	dcn31_populate_dml_pipes_from_context(dc, context, pipes,
 					      validate_mode);
=20
@@ -531,9 +533,7 @@ int dcn351_populate_dml_pipes_from_context_fpu(struct d=
c *dc,
=20
 		pipes[pipe_cnt].pipe.src.unbounded_req_mode =3D false;
=20
-		DC_FP_START();
 		dcn31_zero_pipe_dcc_fraction(pipes, pipe_cnt);
-		DC_FP_END();
=20
 		pipes[pipe_cnt].pipe.dest.vfront_porch =3D timing->v_front_porch;
 		pipes[pipe_cnt].pipe.src.dcc_rate =3D 3;
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c=
 b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
index 8475c6eec547..32678b66c410 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
@@ -1760,6 +1760,20 @@ enum dc_status dcn35_patch_unknown_plane_state(struc=
t dc_plane_state *plane_stat
 }
=20
=20
+static int populate_dml_pipes_from_context_fpu(struct dc *dc,
+					       struct dc_state *context,
+					       display_e2e_pipe_params_st *pipes,
+					       enum dc_validate_mode validate_mode)
+{
+	int ret;
+
+	DC_FP_START();
+	ret =3D dcn35_populate_dml_pipes_from_context_fpu(dc, context, pipes, val=
idate_mode);
+	DC_FP_END();
+
+	return ret;
+}
+
 static struct resource_funcs dcn35_res_pool_funcs =3D {
 	.destroy =3D dcn35_destroy_resource_pool,
 	.link_enc_create =3D dcn35_link_encoder_create,
@@ -1770,7 +1784,7 @@ static struct resource_funcs dcn35_res_pool_funcs =3D=
 {
 	.validate_bandwidth =3D dcn35_validate_bandwidth,
 	.calculate_wm_and_dlg =3D NULL,
 	.update_soc_for_wm_a =3D dcn31_update_soc_for_wm_a,
-	.populate_dml_pipes =3D dcn35_populate_dml_pipes_from_context_fpu,
+	.populate_dml_pipes =3D populate_dml_pipes_from_context_fpu,
 	.acquire_free_pipe_as_secondary_dpp_pipe =3D dcn20_acquire_free_pipe_for_=
layer,
 	.release_pipe =3D dcn20_release_pipe,
 	.add_stream_to_ctx =3D dcn30_add_stream_to_ctx,
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource=
.c b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
index 0971c0f74186..677cee27589c 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
@@ -1732,6 +1732,21 @@ static enum dc_status dcn351_validate_bandwidth(stru=
ct dc *dc,
 	return out ? DC_OK : DC_FAIL_BANDWIDTH_VALIDATE;
 }
=20
+static int populate_dml_pipes_from_context_fpu(struct dc *dc,
+					       struct dc_state *context,
+					       display_e2e_pipe_params_st *pipes,
+					       enum dc_validate_mode validate_mode)
+{
+	int ret;
+
+	DC_FP_START();
+	ret =3D dcn351_populate_dml_pipes_from_context_fpu(dc, context, pipes, va=
lidate_mode);
+	DC_FP_END();
+
+	return ret;
+
+}
+
 static struct resource_funcs dcn351_res_pool_funcs =3D {
 	.destroy =3D dcn351_destroy_resource_pool,
 	.link_enc_create =3D dcn35_link_encoder_create,
@@ -1742,7 +1757,7 @@ static struct resource_funcs dcn351_res_pool_funcs =
=3D {
 	.validate_bandwidth =3D dcn351_validate_bandwidth,
 	.calculate_wm_and_dlg =3D NULL,
 	.update_soc_for_wm_a =3D dcn31_update_soc_for_wm_a,
-	.populate_dml_pipes =3D dcn351_populate_dml_pipes_from_context_fpu,
+	.populate_dml_pipes =3D populate_dml_pipes_from_context_fpu,
 	.acquire_free_pipe_as_secondary_dpp_pipe =3D dcn20_acquire_free_pipe_for_=
layer,
 	.release_pipe =3D dcn20_release_pipe,
 	.add_stream_to_ctx =3D dcn30_add_stream_to_ctx,
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c=
 b/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c
index 8bae7fcedc22..d81540515e5c 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c
@@ -1734,6 +1734,20 @@ static enum dc_status dcn35_validate_bandwidth(struc=
t dc *dc,
 }
=20
=20
+static int populate_dml_pipes_from_context_fpu(struct dc *dc,
+					       struct dc_state *context,
+					       display_e2e_pipe_params_st *pipes,
+					       enum dc_validate_mode validate_mode)
+{
+	int ret;
+
+	DC_FP_START();
+	ret =3D dcn35_populate_dml_pipes_from_context_fpu(dc, context, pipes, val=
idate_mode);
+	DC_FP_END();
+
+	return ret;
+}
+
 static struct resource_funcs dcn36_res_pool_funcs =3D {
 	.destroy =3D dcn36_destroy_resource_pool,
 	.link_enc_create =3D dcn35_link_encoder_create,
@@ -1744,7 +1758,7 @@ static struct resource_funcs dcn36_res_pool_funcs =3D=
 {
 	.validate_bandwidth =3D dcn35_validate_bandwidth,
 	.calculate_wm_and_dlg =3D NULL,
 	.update_soc_for_wm_a =3D dcn31_update_soc_for_wm_a,
-	.populate_dml_pipes =3D dcn35_populate_dml_pipes_from_context_fpu,
+	.populate_dml_pipes =3D populate_dml_pipes_from_context_fpu,
 	.acquire_free_pipe_as_secondary_dpp_pipe =3D dcn20_acquire_free_pipe_for_=
layer,
 	.release_pipe =3D dcn20_release_pipe,
 	.add_stream_to_ctx =3D dcn30_add_stream_to_ctx,
--=20
2.51.0.618.g983fd99d29-goog


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0FF6D404D
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 11:23:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A2010E428;
	Mon,  3 Apr 2023 09:23:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B9810E3C6
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 09:23:19 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id bi9so37143503lfb.12
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Apr 2023 02:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680513797;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LXzqr/RToWqdSBilcBzB6Tyuh1xIOzUWMTLtgk6Ssoc=;
 b=fK1Y2zDngqmXWoLMuZI8lnMJsiJeFXTzMjTr17THKbD/ePl6foVE9bedeR08bhIhwZ
 iGVRCO1Q4xNxZjEFeKWr3QxPMopFlVcFk+o7wKgmMopIhwGkGB4mYuDCLpA0HSOZA6DV
 H+1vLTIgDsZWpwLi/l56qTRCshVdfSmVeSKL7ZWyT3FOvHPoHS1VhOEU3cZ3XXWFoqkv
 hi2wc6qzb8fih5u48KqPqK5K1hRlmAi8+WQmFp6J9rvjaAjpAppzd3PqN71Hq86XQkDa
 VuJLKH/bP+7/KnqJ65dUNiiJiEBRPaB8LOzfnAdNd8L48Cgu5DSNRa5yxbQ2kuGjcHkQ
 F4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680513797;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LXzqr/RToWqdSBilcBzB6Tyuh1xIOzUWMTLtgk6Ssoc=;
 b=cd4eyJ1KVJtRM46wpHqY6F7bI1ql53V9qnonVtxoHcCk70WkBsS7Qk+bn8ee3sI7Pu
 +LqvUDRTcKZPVQZMp9CFAtUqJI3qHohBG/F3My2c8cumoWqc0MLV9P5oBoiolcnqShRN
 68VIdSsWzjg4BMm0xOL4V/96mH6lfUlRwtqcR7u8pPSnaVklP/JOhpHjaQUNJzpY3Ow0
 8wyGyj0i7jIwoW3guj2oSfxxHulyc3DwQ847owAKtaIy+0udk5lv0Kn+dq07lFvWY3SY
 v1TgSk4s9/w9LitCZBTPJwHXQKcjgv/X2DJw3oq5i8RIJegxW6StW81SdOwH9g7sSjBQ
 aglQ==
X-Gm-Message-State: AAQBX9c59HRmnAtBrQjpkKWj43bqUlcDRzOMGBrNkug7JBnDNMmSpAtN
 kHqPNTtidJgAo+lQ9sMOunR7ng==
X-Google-Smtp-Source: AKy350aGpKYGFnwoAVdced4BqI5WDrLJKquS7OxlH4xCYJDCDTjlyCFMMRGF+BkNjZJ++nJmQgiong==
X-Received: by 2002:a19:ee05:0:b0:4eb:274b:a6b with SMTP id
 g5-20020a19ee05000000b004eb274b0a6bmr3995048lfb.47.1680513797397; 
 Mon, 03 Apr 2023 02:23:17 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 w5-20020ac25985000000b004e844bb6939sm1680666lfn.2.2023.04.03.02.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 02:23:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 04/12] drm/i915/dsc: stop using interim structure for
 calculated params
Date: Mon,  3 Apr 2023 12:23:05 +0300
Message-Id: <20230403092313.235320-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403092313.235320-1-dmitry.baryshkov@linaro.org>
References: <20230403092313.235320-1-dmitry.baryshkov@linaro.org>
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
Cc: Jani Nikula <jani.nikula@intel.com>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Stop using an interim structure rc_parameters for storing calculated
params and then setting drm_dsc_config using that structure. Instead put
calculated params into the struct drm_dsc_config directly.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/i915/display/intel_vdsc.c | 100 ++++++----------------
 1 file changed, 26 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index d0536582e4b9..d4340b18c18d 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -19,17 +19,6 @@
 #include "intel_vdsc.h"
 #include "intel_vdsc_regs.h"
 
-struct rc_parameters {
-	u16 initial_xmit_delay;
-	u8 first_line_bpg_offset;
-	u16 initial_offset;
-	u8 flatness_min_qp;
-	u8 flatness_max_qp;
-	u8 rc_quant_incr_limit0;
-	u8 rc_quant_incr_limit1;
-	struct drm_dsc_rc_range_parameters rc_range_params[DSC_NUM_BUF_RANGES];
-};
-
 bool intel_dsc_source_support(const struct intel_crtc_state *crtc_state)
 {
 	const struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
@@ -64,8 +53,7 @@ static bool is_pipe_dsc(struct intel_crtc *crtc, enum transcoder cpu_transcoder)
 }
 
 static void
-calculate_rc_params(struct rc_parameters *rc,
-		    struct drm_dsc_config *vdsc_cfg)
+calculate_rc_params(struct drm_dsc_config *vdsc_cfg)
 {
 	int bpc = vdsc_cfg->bits_per_component;
 	int bpp = vdsc_cfg->bits_per_pixel >> 4;
@@ -85,56 +73,57 @@ calculate_rc_params(struct rc_parameters *rc,
 	u32 res, buf_i, bpp_i;
 
 	if (vdsc_cfg->slice_height >= 8)
-		rc->first_line_bpg_offset =
+		vdsc_cfg->first_line_bpg_offset =
 			12 + DIV_ROUND_UP((9 * min(34, vdsc_cfg->slice_height - 8)), 100);
 	else
-		rc->first_line_bpg_offset = 2 * (vdsc_cfg->slice_height - 1);
+		vdsc_cfg->first_line_bpg_offset = 2 * (vdsc_cfg->slice_height - 1);
 
 	/* Our hw supports only 444 modes as of today */
 	if (bpp >= 12)
-		rc->initial_offset = 2048;
+		vdsc_cfg->initial_offset = 2048;
 	else if (bpp >= 10)
-		rc->initial_offset = 5632 - DIV_ROUND_UP(((bpp - 10) * 3584), 2);
+		vdsc_cfg->initial_offset = 5632 - DIV_ROUND_UP(((bpp - 10) * 3584), 2);
 	else if (bpp >= 8)
-		rc->initial_offset = 6144 - DIV_ROUND_UP(((bpp - 8) * 512), 2);
+		vdsc_cfg->initial_offset = 6144 - DIV_ROUND_UP(((bpp - 8) * 512), 2);
 	else
-		rc->initial_offset = 6144;
+		vdsc_cfg->initial_offset = 6144;
 
 	/* initial_xmit_delay = rc_model_size/2/compression_bpp */
-	rc->initial_xmit_delay = DIV_ROUND_UP(DSC_RC_MODEL_SIZE_CONST, 2 * bpp);
+	vdsc_cfg->initial_xmit_delay = DIV_ROUND_UP(DSC_RC_MODEL_SIZE_CONST, 2 * bpp);
 
-	rc->flatness_min_qp = 3 + qp_bpc_modifier;
-	rc->flatness_max_qp = 12 + qp_bpc_modifier;
+	vdsc_cfg->flatness_min_qp = 3 + qp_bpc_modifier;
+	vdsc_cfg->flatness_max_qp = 12 + qp_bpc_modifier;
 
-	rc->rc_quant_incr_limit0 = 11 + qp_bpc_modifier;
-	rc->rc_quant_incr_limit1 = 11 + qp_bpc_modifier;
+	vdsc_cfg->rc_quant_incr_limit0 = 11 + qp_bpc_modifier;
+	vdsc_cfg->rc_quant_incr_limit1 = 11 + qp_bpc_modifier;
 
 	bpp_i  = (2 * (bpp - 6));
 	for (buf_i = 0; buf_i < DSC_NUM_BUF_RANGES; buf_i++) {
+		u8 range_bpg_offset;
+
 		/* Read range_minqp and range_max_qp from qp tables */
-		rc->rc_range_params[buf_i].range_min_qp =
+		vdsc_cfg->rc_range_params[buf_i].range_min_qp =
 			intel_lookup_range_min_qp(bpc, buf_i, bpp_i, vdsc_cfg->native_420);
-		rc->rc_range_params[buf_i].range_max_qp =
+		vdsc_cfg->rc_range_params[buf_i].range_max_qp =
 			intel_lookup_range_max_qp(bpc, buf_i, bpp_i, vdsc_cfg->native_420);
 
-		/* Calculate range_bgp_offset */
+		/* Calculate range_bpg_offset */
 		if (bpp <= 6) {
-			rc->rc_range_params[buf_i].range_bpg_offset = ofs_und6[buf_i];
+			range_bpg_offset = ofs_und6[buf_i];
 		} else if (bpp <= 8) {
 			res = DIV_ROUND_UP(((bpp - 6) * (ofs_und8[buf_i] - ofs_und6[buf_i])), 2);
-			rc->rc_range_params[buf_i].range_bpg_offset =
-								ofs_und6[buf_i] + res;
+			range_bpg_offset = ofs_und6[buf_i] + res;
 		} else if (bpp <= 12) {
-			rc->rc_range_params[buf_i].range_bpg_offset =
-								ofs_und8[buf_i];
+			range_bpg_offset = ofs_und8[buf_i];
 		} else if (bpp <= 15) {
 			res = DIV_ROUND_UP(((bpp - 12) * (ofs_und15[buf_i] - ofs_und12[buf_i])), 3);
-			rc->rc_range_params[buf_i].range_bpg_offset =
-								ofs_und12[buf_i] + res;
+			range_bpg_offset = ofs_und12[buf_i] + res;
 		} else {
-			rc->rc_range_params[buf_i].range_bpg_offset =
-								ofs_und15[buf_i];
+			range_bpg_offset = ofs_und15[buf_i];
 		}
+
+		vdsc_cfg->rc_range_params[buf_i].range_bpg_offset =
+			range_bpg_offset & DSC_RANGE_BPG_OFFSET_MASK;
 	}
 }
 
@@ -167,10 +156,7 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
 	struct drm_dsc_config *vdsc_cfg = &pipe_config->dsc.config;
 	u16 compressed_bpp = pipe_config->dsc.compressed_bpp;
-	const struct rc_parameters *rc_params;
-	struct rc_parameters *rc = NULL;
 	int err;
-	u8 i = 0;
 	int ret;
 
 	vdsc_cfg->pic_width = pipe_config->hw.adjusted_mode.crtc_hdisplay;
@@ -238,43 +224,12 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
 	 * parameters
 	 */
 	if (DISPLAY_VER(dev_priv) >= 13) {
-		rc = kmalloc(sizeof(*rc), GFP_KERNEL);
-		if (!rc)
-			return -ENOMEM;
-
-		calculate_rc_params(rc, vdsc_cfg);
-		rc_params = rc;
+		calculate_rc_params(vdsc_cfg);
 	} else {
 		ret = drm_dsc_setup_rc_params(vdsc_cfg);
 		if (ret)
 			return ret;
 
-		goto out;
-	}
-
-	vdsc_cfg->first_line_bpg_offset = rc_params->first_line_bpg_offset;
-	vdsc_cfg->initial_xmit_delay = rc_params->initial_xmit_delay;
-	vdsc_cfg->initial_offset = rc_params->initial_offset;
-	vdsc_cfg->flatness_min_qp = rc_params->flatness_min_qp;
-	vdsc_cfg->flatness_max_qp = rc_params->flatness_max_qp;
-	vdsc_cfg->rc_quant_incr_limit0 = rc_params->rc_quant_incr_limit0;
-	vdsc_cfg->rc_quant_incr_limit1 = rc_params->rc_quant_incr_limit1;
-
-	for (i = 0; i < DSC_NUM_BUF_RANGES; i++) {
-		vdsc_cfg->rc_range_params[i].range_min_qp =
-			rc_params->rc_range_params[i].range_min_qp;
-		vdsc_cfg->rc_range_params[i].range_max_qp =
-			rc_params->rc_range_params[i].range_max_qp;
-		/*
-		 * Range BPG Offset uses 2's complement and is only a 6 bits. So
-		 * mask it to get only 6 bits.
-		 */
-		vdsc_cfg->rc_range_params[i].range_bpg_offset =
-			rc_params->rc_range_params[i].range_bpg_offset &
-			DSC_RANGE_BPG_OFFSET_MASK;
-	}
-
-	if (DISPLAY_VER(dev_priv) < 13) {
 		/*
 		 * FIXME: verify that the hardware actually needs these
 		 * modifications rather than them being simple typos.
@@ -288,7 +243,6 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
 			vdsc_cfg->rc_range_params[0].range_bpg_offset = 0;
 	}
 
-out:
 	/*
 	 * BitsPerComponent value determines mux_word_size:
 	 * When BitsPerComponent is less than or 10bpc, muxWordSize will be equal to
@@ -303,8 +257,6 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
 	vdsc_cfg->initial_scale_value = (vdsc_cfg->rc_model_size << 3) /
 		(vdsc_cfg->rc_model_size - vdsc_cfg->initial_offset);
 
-	kfree(rc);
-
 	return 0;
 }
 
-- 
2.39.2


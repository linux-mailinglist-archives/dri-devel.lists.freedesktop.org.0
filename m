Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C54E860514
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 22:47:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A7D110EA90;
	Thu, 22 Feb 2024 21:47:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yZR213/z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D34FD10EA94
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 21:47:53 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-512a85806fcso291112e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 13:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708638471; x=1709243271; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=27JArFoy7FgcSAJAKndgjFV/Dxo1giUsa3CZ68xb2WY=;
 b=yZR213/zvJQD9eOlBIol2CODj0mI8BWpeobX6xwCyswZVlqieJ6eVlU9uEh77SH7Jp
 tkoCo+dam1qiBdv8tefcoMvJWolNpjl+T5Owpu8phoFq5hFXnmY12/cBjGBUs/CRFvHB
 q7hhQ9uIL+qp8IeRRuEvI5ARDTioTYYzIYXc2lMJWxN2/l/He2GHw+89spGLxehvuibG
 ngbZiVwZ21l/O0yKhrZXgGBf17IhACzWP+PTKfB6tsELOfioekACdypgLegNPlh6A/AE
 sMdB4IqMReYWEGB8pDFrfbNDpoVPNKwcstahy/ObDQ3MvNojf5UPj1Ab1tFy9BH+NddE
 eK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708638471; x=1709243271;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=27JArFoy7FgcSAJAKndgjFV/Dxo1giUsa3CZ68xb2WY=;
 b=cMIwg77ZU+j5ao9kYTKhLH/1XrhP5oS1Zbvq19iST1VvqTD5AcYaYTQQJ4ZXQO2w1J
 VhM5YwMqTMX2LUgTqhSOUI5k8Jf9lJlEx6mil/nhUVRVyvpn9WUofn2nwe5uRxQNC/zf
 MRLa4BRxnZ7kY8S+pxA1vfwOY+G6NezqhCHUiGjf9eaDyiXSxV8pmDPZeW4CdnGFkcLC
 SQGPAi9oOy9pJd3NX/dRlpU5ERtVlJ8PlhbRm/fJeYMnbFLkdLACjIDkQYukQQI/tsGH
 bL11b+O+ws0+mKZ0kZtyskJAvhQ9RwC6ReRw9cVVVNYBalvui5JcXbSfGDMMRcrdVRdh
 z71g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoazWFRwKTqtVoQdMaECHF+bVx+czPc7+zjEgPXckcjaQiWI9G5ovOZGMp4yZJm0+aYTlRVg11DjhTtf7YUYUd4Xt7frx7x1atu8RJ/Eg5
X-Gm-Message-State: AOJu0YxViBM9FRQ9pMHfw9n2KmemZbwDlFSHiWPmW/49+DPReaqFNuQq
 kRmIN/wfXdSyJgrHUkCjSkdgvLUe5bpVkoE8ayX3K5rPOCBFa0TWMTwzO1ornukeMG71vszp76W
 s
X-Google-Smtp-Source: AGHT+IGeTH/W80T+tFl6ii56yNpwnGORtLpMr2fJHrzihvoDvLmDGgS7QqhvQECjABGJyan2PjHAIA==
X-Received: by 2002:a05:6512:3e16:b0:512:ba3a:5368 with SMTP id
 i22-20020a0565123e1600b00512ba3a5368mr318345lfv.48.1708638471403; 
 Thu, 22 Feb 2024 13:47:51 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 r8-20020a19ac48000000b00512d4acc9f8sm744918lfc.254.2024.02.22.13.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Feb 2024 13:47:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 23:47:49 +0200
Subject: [PATCH v5] drm/msm/dpu: add current resource allocation to dumped
 state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240222-fd-rm-state-v5-1-4a6c81e87f63@linaro.org>
X-B4-Tracking: v=1; b=H4sIAATB12UC/23MQQqDMBCF4avIrDvFhIjaVe8hLqKZ6EBryiSEF
 vHuTV13+T943w6RhCnCrdpBKHPksJVoLhXMq90WQnalQdfa1Fr16B3KE2OyiXBySquub8zUdlA
 eLyHP71MbxtIrxxTkc+LZ/Nb/TjaocDKtV4a8bmd9f/BmJVyDLDAex/EFUKuVaacAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5724;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Mlmw0HVUAhFZVbUgUT+SpXowG3yNg4H4nNZdYPrO3tM=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+r1g2xOlnsjm6YY9fj93OnVP03Ys6xi8qqp63z27J/dV
 iftHFfdyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJhG9g/2f8Z4XE31kfpnKX
 Cp6JjNqhdiy3lcfz6O1PUr66lVoVUzMvXFx2tb3QpuOGYfjbXwbpKV05O5zjJy2f8OSYenPMvY1
 FQhpsTlnHHau4AxXOPWL+lmYp5GQx2XHjjjMqGtMD5Du/Sx5lCuEoW8DPc9bgZcUT7pLTC2L36p
 wv/e5llrXo+l3Hw15vrnBw6QQf2v+gKr7D/m7mvTZ53UJlT7/mu4d32FqFTmR8FRobxVy4kYs9w
 Tpn4qKiBQFOFVvUxRIOu3TVGZlo8kmxigsES5u/Xp50ZnEBV1ne7SmX/Ku38rodsNu878yNBeFv
 Js+c94v92XSDpjdmChtqC69ri6yJ0RCSXG+0XjTR81YXAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Provide atomic_print_state callback to the DPU's private object. This
way the debugfs/dri/0/state will also include RM's internal state.

Example output (RB5 board, HDMI and writeback encoder enabled)

resource mapping:
	pingpong=31 36 # # # # - - - - -
	mixer=31 36 # # # # -
	ctl=# # 31 36 # #
	dspp=# # # #
	dsc=# # # # - -
	cdm=#

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v5:
- Extracted the common helper for printing RM state
- Changed the code to print '#' for unused/unmapped blocks (Abhinav)
- Link to v4: https://lore.kernel.org/r/20240219-fd-rm-state-v4-1-b47f14ef27c2@linaro.org

Changes in v4:
- Split the patch from the virual wide planes series
- Reworked the output format
- Added the CDM block into the dump
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 12 +++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c  | 56 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h  |  8 +++++
 4 files changed, 78 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 723cc1d82143..9f3697e1eacb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -353,9 +353,18 @@ static void dpu_kms_global_destroy_state(struct drm_private_obj *obj,
 	kfree(dpu_state);
 }
 
+static void dpu_kms_global_print_state(struct drm_printer *p,
+				       const struct drm_private_state *state)
+{
+	const struct dpu_global_state *global_state = to_dpu_global_state(state);
+
+	dpu_rm_print_state(p, global_state);
+}
+
 static const struct drm_private_state_funcs dpu_kms_global_state_funcs = {
 	.atomic_duplicate_state = dpu_kms_global_duplicate_state,
 	.atomic_destroy_state = dpu_kms_global_destroy_state,
+	.atomic_print_state = dpu_kms_global_print_state,
 };
 
 static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)
@@ -371,6 +380,9 @@ static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)
 	drm_atomic_private_obj_init(dpu_kms->dev, &dpu_kms->global_state,
 				    &state->base,
 				    &dpu_kms_global_state_funcs);
+
+	state->rm = &dpu_kms->rm;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index d1207f4ec3ae..2512c9bd08df 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -131,6 +131,8 @@ struct vsync_info {
 struct dpu_global_state {
 	struct drm_private_state base;
 
+	struct dpu_rm *rm;
+
 	uint32_t pingpong_to_enc_id[PINGPONG_MAX - PINGPONG_0];
 	uint32_t mixer_to_enc_id[LM_MAX - LM_0];
 	uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 724537ab776d..1a56ddca536d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -634,3 +634,59 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 
 	return num_blks;
 }
+
+static void dpu_rm_print_state_helper(struct drm_printer *p,
+					    struct dpu_hw_blk *blk,
+					    uint32_t mapping)
+{
+	if (!blk)
+		drm_puts(p, "- ");
+	else if (!mapping)
+		drm_puts(p, "# ");
+	else
+		drm_printf(p, "%d ", mapping);
+}
+
+
+void dpu_rm_print_state(struct drm_printer *p,
+			const struct dpu_global_state *global_state)
+{
+	const struct dpu_rm *rm = global_state->rm;
+	int i;
+
+	drm_puts(p, "resource mapping:\n");
+	drm_puts(p, "\tpingpong=");
+	for (i = 0; i < ARRAY_SIZE(global_state->pingpong_to_enc_id); i++)
+		dpu_rm_print_state_helper(p, rm->pingpong_blks[i],
+					  global_state->pingpong_to_enc_id[i]);
+	drm_puts(p, "\n");
+
+	drm_puts(p, "\tmixer=");
+	for (i = 0; i < ARRAY_SIZE(global_state->mixer_to_enc_id); i++)
+		dpu_rm_print_state_helper(p, rm->mixer_blks[i],
+					  global_state->mixer_to_enc_id[i]);
+	drm_puts(p, "\n");
+
+	drm_puts(p, "\tctl=");
+	for (i = 0; i < ARRAY_SIZE(global_state->ctl_to_enc_id); i++)
+		dpu_rm_print_state_helper(p, rm->ctl_blks[i],
+					  global_state->ctl_to_enc_id[i]);
+	drm_puts(p, "\n");
+
+	drm_puts(p, "\tdspp=");
+	for (i = 0; i < ARRAY_SIZE(global_state->dspp_to_enc_id); i++)
+		dpu_rm_print_state_helper(p, rm->dspp_blks[i],
+					  global_state->dspp_to_enc_id[i]);
+	drm_puts(p, "\n");
+
+	drm_puts(p, "\tdsc=");
+	for (i = 0; i < ARRAY_SIZE(global_state->dsc_to_enc_id); i++)
+		dpu_rm_print_state_helper(p, rm->dsc_blks[i],
+					  global_state->dsc_to_enc_id[i]);
+	drm_puts(p, "\n");
+
+	drm_puts(p, "\tcdm=");
+	dpu_rm_print_state_helper(p, rm->cdm_blk,
+				  global_state->cdm_to_enc_id);
+	drm_puts(p, "\n");
+}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index e3f83ebc656b..e63db8ace6b9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -89,6 +89,14 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 	struct dpu_global_state *global_state, uint32_t enc_id,
 	enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size);
 
+/**
+ * dpu_rm_print_state - output the RM private state
+ * @p: DRM printer
+ * @global_state: global state
+ */
+void dpu_rm_print_state(struct drm_printer *p,
+			const struct dpu_global_state *global_state);
+
 /**
  * dpu_rm_get_intf - Return a struct dpu_hw_intf instance given it's index.
  * @rm: DPU Resource Manager handle

---
base-commit: 41c177cf354126a22443b5c80cec9fdd313e67e1
change-id: 20240219-fd-rm-state-bd1218954b78

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B73A37EFA
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 10:53:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92BD710E171;
	Mon, 17 Feb 2025 09:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="C6RqUEzh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2226610E171;
 Mon, 17 Feb 2025 09:53:55 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4396a4d5e3bso26104745e9.3; 
 Mon, 17 Feb 2025 01:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739786033; x=1740390833; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CvYjEMSsQkQBSc5nAfPUda644OnnC5/ncK3yD6+VkrU=;
 b=C6RqUEzhtIUzBov07SyahbMUGsMn7Ws/nKtzYLmBfqRWv8m5Rx1KexlDSN2pg4IRdd
 Gs6VZsXLpQJJG4OlM3sP99IB80rB2foVGr/eOKEkDhHelZfaOcQQ5zioFUcUe8R8BoHD
 JQufrI6fdARS5UxDfLjGItQBI667/VlUJaxKMMp3UH4RPvFnYCklBTeMEBkaptF92Nip
 5HzEs1tx9jy0O0ptRYX8C9evAOsh2tAGI+KETwL8qx7ySB5/umAsJ+P9OG0i7XUvCpLH
 7uKTpm1VzwiqOQ4yDpqhQdAZ4Js6sJxRLp2buBYI85K0htIxvzE+La9BmwnEj9usL2it
 dX1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739786033; x=1740390833;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CvYjEMSsQkQBSc5nAfPUda644OnnC5/ncK3yD6+VkrU=;
 b=exwftiPsfvu9AgZyajKI49OIlVec2PyMuiwCJgVCRpvAaS/mMdeXcfkjvZNQo/s9mw
 WXtC4/BVVjxb5uxcMxCSxzs/Wr3GYP63Gc5GctN30JfqailIbV5U1wGUlQ8kVXcADSxV
 W7xZ429eGT7Sq61EAEmcYfzY1vcqe55gUshEJ0eJH7AfLc1Trs8I/bPc9yL8PSMT4prK
 1Mrb/1PHC1VwtJu3tftRxuEZ2Xhdp4Aai6xkQkQ7H4e7bqpWhOGo+CNdwJu35bCXq1T9
 JLvBNNM9FJ/E/BVwjUuVkDLVfBX2ImBFP+SBQcaF+FIfovztNmOO3BJ3HV8AVyIDTxga
 ADlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmfwYP45x7/x85KrK36YJAn0syreJCjkEc34iS0pvGdnFqIx/z3Tq2nLSbU7NA5K4bSNMvwcc/1r2N@lists.freedesktop.org,
 AJvYcCWtYvzPsz7AEqXQPegliLfTHoGlHVb/84doO48wFFLk0S9IAg0BlDly9lx+CZLA0lHoZDDOljtZ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwyQ8Ju+DKFtMdjsczRzeeXxLfIX+bKPUTz96DcUUL5ONPjgm1j
 jY4YbLqIMDLVZRpi0q2we4wHuZGAijZYn6flZE3ogwXzHViPowUG
X-Gm-Gg: ASbGncvxIitg+LINzvQm7DRzUbam1UiMJrLE/oNkWGhs95LFvMrHxt6I6Idh6nYJI7R
 C/Ft+mo08Y5P49u9vCCHpnj+tKp+gBgBpU+HIqJH5Czj9JuHXMkooG4kyAgpKIvjJnvqZcjWLDa
 pT4rZrNapLtE79WMATaub0RlnwL50suU5XCQ+4PcSl5fSl+dPDoQZiZ6/yazleAf8PigybQIZtd
 PzWiI3lr823/i4jh2aK2t8zagZEIGCLP097pwYEk8jAnpElWsykSqYClfLo4R9/emjkro5wo4wk
 9+vShynjMjxzNJi0
X-Google-Smtp-Source: AGHT+IEVl4GpzgQ45gGVZiMJl31oCUggGlRZvE8AqWl93V+B3xcv35Ou1jGbrhoUWP+6dZJA3C4Onw==
X-Received: by 2002:a05:600c:5247:b0:439:5f38:7ca with SMTP id
 5b1f17b1804b1-4396e70c718mr67407475e9.20.1739786033270; 
 Mon, 17 Feb 2025 01:53:53 -0800 (PST)
Received: from localhost ([194.120.133.72])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-43989087517sm13265865e9.8.2025.02.17.01.53.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 01:53:52 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jun Lei <jun.lei@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/amd/display: Fix spelling mistake "oustanding" ->
 "outstanding"
Date: Mon, 17 Feb 2025 09:53:25 +0000
Message-ID: <20250217095325.392152-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a spelling mistake in max_oustanding_when_urgent_expected,
fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 .../dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c      | 6 +++---
 .../dc/dml2/dml21/src/dml2_core/dml2_core_shared_types.h    | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
index 87e53f59cb9f..243d02050e01 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
@@ -5058,7 +5058,7 @@ static void CalculateExtraLatency(
 	double HostVMInefficiencyFactorPrefetch,
 	unsigned int HostVMMinPageSize,
 	enum dml2_qos_param_type qos_type,
-	bool max_oustanding_when_urgent_expected,
+	bool max_outstanding_when_urgent_expected,
 	unsigned int max_outstanding_requests,
 	unsigned int request_size_bytes_luma[],
 	unsigned int request_size_bytes_chroma[],
@@ -5106,7 +5106,7 @@ static void CalculateExtraLatency(
 	if (qos_type == dml2_qos_param_type_dcn4x) {
 		*ExtraLatency_sr = dchub_arb_to_ret_delay / DCFCLK;
 		*ExtraLatency = *ExtraLatency_sr;
-		if (max_oustanding_when_urgent_expected)
+		if (max_outstanding_when_urgent_expected)
 			*ExtraLatency = *ExtraLatency + (ROBBufferSizeInKByte * 1024 - max_outstanding_requests * max_request_size_bytes) / ReturnBW;
 	} else {
 		*ExtraLatency_sr = dchub_arb_to_ret_delay / DCFCLK + RoundTripPingLatencyCycles / FabricClock + ReorderingBytes / ReturnBW;
@@ -5121,7 +5121,7 @@ static void CalculateExtraLatency(
 	dml2_printf("DML::%s: qos_type=%u\n", __func__, qos_type);
 	dml2_printf("DML::%s: hostvm_mode=%u\n", __func__, hostvm_mode);
 	dml2_printf("DML::%s: Tex_trips=%u\n", __func__, Tex_trips);
-	dml2_printf("DML::%s: max_oustanding_when_urgent_expected=%u\n", __func__, max_oustanding_when_urgent_expected);
+	dml2_printf("DML::%s: max_outstanding_when_urgent_expected=%u\n", __func__, max_outstanding_when_urgent_expected);
 	dml2_printf("DML::%s: FabricClock=%f\n", __func__, FabricClock);
 	dml2_printf("DML::%s: DCFCLK=%f\n", __func__, DCFCLK);
 	dml2_printf("DML::%s: ReturnBW=%f\n", __func__, ReturnBW);
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared_types.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared_types.h
index dfe54112a9c6..4e502f0a6d20 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared_types.h
@@ -1571,7 +1571,7 @@ struct dml2_core_calcs_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport_param
 	unsigned int *DSTYAfterScaler;
 	bool UnboundedRequestEnabled;
 	unsigned int CompressedBufferSizeInkByte;
-	bool max_oustanding_when_urgent_expected;
+	bool max_outstanding_when_urgent_expected;
 	unsigned int max_outstanding_requests;
 	unsigned int max_request_size_bytes;
 	unsigned int *meta_row_height_l;
-- 
2.47.2


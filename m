Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B277AA10BA5
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 17:01:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9CC210E3DA;
	Tue, 14 Jan 2025 16:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QwU5ADGO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 868CB10E3CC
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 16:01:04 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-aa6954ec439so81225466b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 08:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736870403; x=1737475203; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=036P+TMXTDmBCcuo6XqZkVW5lvGpV28GsgySqY677wI=;
 b=QwU5ADGO9U67n7X6M5OeR3gmiRt0FYDhqW80tw/pblk6JXeLuZSTHFSLgMikd+mvSc
 xe3YRxKgxDmc5c8RclwaOorWIszgBD7MYU9hie4ULLOw9xvoaFG6KLYgiypvOrQSUxKd
 UZBGT5EEGVrdKwv8EozjjbMLHA+sZuB81I16D92ARg6EsYrZ+bXfSe/hkyxwYOd2v6LA
 NORnhSCCjXF2gHbHpVhtDqZpLbiKyrTa2ILdlTipFVbvw/gkFKa1rUsqpCej4a0Om5IW
 ND49iDM5GHYAW1oITOxoDcdUdX9DffsqVUaflHa4osDmfLgt87+S2ONuLlfe6SPd4SeQ
 Lpiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736870403; x=1737475203;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=036P+TMXTDmBCcuo6XqZkVW5lvGpV28GsgySqY677wI=;
 b=o5P16SYs/V9W7P0yCztJHdkQhwbqLq8m1Yc2+BnVXmCW5C/q9+rTwdl8FcapkQjM4a
 2E8J0OT7OY/DAhG/ZgJMzatT4jvfHUlM8DW6CCdnUYnVgS1N3MX6hu5LBCW+54bWUQbI
 4/QDx1Jn6aKOBrf0Gie4KHljG+Of2moRjmbXlIvU5sXjIek4RZTOeN1fODyzx3bFbDD8
 rTVVhI1HuywIec1Rw9uMBWY8LiXv24b8tGcEgwP+eXLpc4KlU1Q0HH/jUeufqVmaE3Zw
 TLcJcn7+4Me7v4nIsTcKDrnzlsc434eBGbGtCOTTtvAvnwQ5WY/AXU3cyy7K64cWx+7L
 4GsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOxLLCbfBGfXr4Gj0MrvcqhoBAQFAZ9dKKRWF70k4sGDWuFpcVNwu6MC3M4aJAatyVufrOTtM9NhM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSAAVjuNRrKRws/04FmjwoAlErGlegfik1BDzQ0WjWc4x+mA6v
 DtBFRbRjl6v2pst5/fYjRN4KlT6q+kX7wwTUe6JQRi+cVxKiSngQUGpJYGynOEzgJVieG/wvz+6
 x
X-Gm-Gg: ASbGncurhtiYpbRN9dafL4wyYZDReXkGfVkdC5JaRxalweWHpckWI+iAVPpChJpfHwi
 Hvx82BKxmUKlXoentowuuGfliEiIE5CCbYs5qHD7sRK09e/3Of4VU2PyRM7hUZFJwU3r7IiULk+
 ntgduGBCIirfhIKc485EeqRXbRtUvaWDTcudjPUsQzQieWiObozjekrJ7R6clqRVpRYy+tjU14y
 /blWBftfltum3qRPRVGLYk/7cqayWrAMwP3so3pd2VxwljOETilbhzgga9od/NfETdy4TA=
X-Google-Smtp-Source: AGHT+IG7PMlVz7CMMGWaY0OGnnMJa79kLHXPYfRYGus1Svu/ubNikdklVMAggGNIsgi/jcBKMo4Vmg==
X-Received: by 2002:a17:907:97c6:b0:aa6:79e6:5b03 with SMTP id
 a640c23a62f3a-ab2ab5759b6mr916847166b.6.1736870403102; 
 Tue, 14 Jan 2025 08:00:03 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c95af424sm651908666b.137.2025.01.14.08.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 08:00:02 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] drm/msm/dpu: Simplify using local 'ctl' variable
Date: Tue, 14 Jan 2025 16:59:59 +0100
Message-ID: <20250114155959.583889-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In few places we store 'phys_enc->hw_ctl' to local 'ctl' variable so use
it everywhere.  No functional change.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 32 ++++++++++-----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 5172ab4dea99..702e344f5aad 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2183,8 +2183,8 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
 	memset(&mixer, 0, sizeof(mixer));
 
 	/* reset all mixers for this encoder */
-	if (phys_enc->hw_ctl->ops.clear_all_blendstages)
-		phys_enc->hw_ctl->ops.clear_all_blendstages(phys_enc->hw_ctl);
+	if (ctl->ops.clear_all_blendstages)
+		ctl->ops.clear_all_blendstages(ctl);
 
 	global_state = dpu_kms_get_existing_global_state(phys_enc->dpu_kms);
 
@@ -2193,12 +2193,12 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
 
 	for (i = 0; i < num_lm; i++) {
 		hw_mixer[i] = to_dpu_hw_mixer(hw_lm[i]);
-		if (phys_enc->hw_ctl->ops.update_pending_flush_mixer)
-			phys_enc->hw_ctl->ops.update_pending_flush_mixer(ctl, hw_mixer[i]->idx);
+		if (ctl->ops.update_pending_flush_mixer)
+			ctl->ops.update_pending_flush_mixer(ctl, hw_mixer[i]->idx);
 
 		/* clear all blendstages */
-		if (phys_enc->hw_ctl->ops.setup_blendstage)
-			phys_enc->hw_ctl->ops.setup_blendstage(ctl, hw_mixer[i]->idx, NULL);
+		if (ctl->ops.setup_blendstage)
+			ctl->ops.setup_blendstage(ctl, hw_mixer[i]->idx, NULL);
 	}
 }
 
@@ -2250,7 +2250,7 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 
 	dpu_enc = to_dpu_encoder_virt(phys_enc->parent);
 
-	phys_enc->hw_ctl->ops.reset(ctl);
+	ctl->ops.reset(ctl);
 
 	dpu_encoder_helper_reset_mixers(phys_enc);
 
@@ -2265,8 +2265,8 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 			phys_enc->hw_wb->ops.bind_pingpong_blk(phys_enc->hw_wb, PINGPONG_NONE);
 
 		/* mark WB flush as pending */
-		if (phys_enc->hw_ctl->ops.update_pending_flush_wb)
-			phys_enc->hw_ctl->ops.update_pending_flush_wb(ctl, phys_enc->hw_wb->idx);
+		if (ctl->ops.update_pending_flush_wb)
+			ctl->ops.update_pending_flush_wb(ctl, phys_enc->hw_wb->idx);
 	} else {
 		for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 			if (dpu_enc->phys_encs[i] && phys_enc->hw_intf->ops.bind_pingpong_blk)
@@ -2275,8 +2275,8 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 						PINGPONG_NONE);
 
 			/* mark INTF flush as pending */
-			if (phys_enc->hw_ctl->ops.update_pending_flush_intf)
-				phys_enc->hw_ctl->ops.update_pending_flush_intf(phys_enc->hw_ctl,
+			if (ctl->ops.update_pending_flush_intf)
+				ctl->ops.update_pending_flush_intf(ctl,
 						dpu_enc->phys_encs[i]->hw_intf->idx);
 		}
 	}
@@ -2285,8 +2285,8 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 	if (phys_enc->hw_pp && phys_enc->hw_pp->merge_3d) {
 		phys_enc->hw_pp->merge_3d->ops.setup_3d_mode(phys_enc->hw_pp->merge_3d,
 				BLEND_3D_NONE);
-		if (phys_enc->hw_ctl->ops.update_pending_flush_merge_3d)
-			phys_enc->hw_ctl->ops.update_pending_flush_merge_3d(ctl,
+		if (ctl->ops.update_pending_flush_merge_3d)
+			ctl->ops.update_pending_flush_merge_3d(ctl,
 					phys_enc->hw_pp->merge_3d->idx);
 	}
 
@@ -2294,9 +2294,9 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 		if (phys_enc->hw_cdm->ops.bind_pingpong_blk && phys_enc->hw_pp)
 			phys_enc->hw_cdm->ops.bind_pingpong_blk(phys_enc->hw_cdm,
 								PINGPONG_NONE);
-		if (phys_enc->hw_ctl->ops.update_pending_flush_cdm)
-			phys_enc->hw_ctl->ops.update_pending_flush_cdm(phys_enc->hw_ctl,
-								       phys_enc->hw_cdm->idx);
+		if (ctl->ops.update_pending_flush_cdm)
+			ctl->ops.update_pending_flush_cdm(ctl,
+							  phys_enc->hw_cdm->idx);
 	}
 
 	if (dpu_enc->dsc) {
-- 
2.43.0


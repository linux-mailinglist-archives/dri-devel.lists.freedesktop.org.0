Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 202789F7612
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 08:49:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83CC610EC9F;
	Thu, 19 Dec 2024 07:49:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ifndbKNj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 459E610EC9F
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 07:49:40 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-21644aca3a0so5549295ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 23:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734594580; x=1735199380; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4KnECnBShXY3h8fLirhSC2vujN3PJRN+mScj8HCQ30M=;
 b=ifndbKNj1Cdmj3PUqU8wVrFj0tPTxYpSvzbnuKG3NLXK4MULhamEmJqnep+hxkyuT2
 YjP8an56CSMv8cydcLjTxh+xDaoGkLIlPzUE+gah0pVBWdrHtrOP/mxbXMPTMvnjAAkE
 tOJHmWNmmTpn/rmEIfAUxInqE+owjflXrcZaoodlePsa3Fz7qxuv9gn1eR1jdsGu7Q5X
 cRBkM9u1Phme9jQDOriOwT76gv1nv0v5C7ZHYi1C9E+GAncpmzIQuJFb17ZNWU7Ipdu5
 s7Km2jy6iARB2KzFk5PWey56PBPnd7xkBpiFXxWaWy8krpzQgsfHFffEhTJymOWf6Kr5
 So2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734594580; x=1735199380;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4KnECnBShXY3h8fLirhSC2vujN3PJRN+mScj8HCQ30M=;
 b=YFTlUzIgb6Dy0zKTwivM8mZz8eNUntrZqeU0+sFaHbhR/QrH6/liawIu0JyL3xSYpi
 3PlV0eKmsdlaeOKn7jPPTxGRHKbC8OuYQ6BaDEIYCNBnP5VhbJN/JET4sjHMaUH/rUb8
 hN7+Ote1fURHeIxMb/U4QRIeH7zf7cf1UmqTfq5sKIq5qKSHDYra7aONibxQancx4ZN3
 F0rN9NAUMt4qgulZqqfyh/enVZYuOfoYo2xczFQfV08oBm8fAW6BePCz9d4DjsY4Wzjb
 vQqVwHWAEz3i0yRzTyVEyPTbJoooPmhIo9vQi9lVizWOHrwbglnv9+sTWMxN5IJi9qNT
 LrsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfjR5qDZuQIZG6WScZpu+nhiCekcMbLSoo3Cy7Stmu/urWaST+iimN+Cir8dAvBlxdIfJce+dyOQs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1T7x9PgxJ4b+f+fiNqlKyhHl7a1SfZQ18fhR6bwnBeujuT766
 m2uFL/bBwIMPZ335sthbjJrsxjSo3+LuF+rmEeM/cU5ZGASiCzqLG0dd62y2Xz0=
X-Gm-Gg: ASbGncvHngr6O+avqe1HRYy3QMg84yoAJ+zD7ilAcvcLNXx+y3o5CjNqtnbz4JP3y99
 mJjBPeBvoxU/pnSo82YAq0d5fpxQQ2oCaXg4Z7ApcjK3aoYmG51iJaXYLyflUt0O77BVlPDr0wY
 aPI4itab4nR5cHsCFRZ+pjBLUIy6/BwKqbP65KY38u4m6UaAxIcunsKxDEW5h0jzpwxqFTSTBcZ
 OhR253GzvCtBtc+6G2HyB/YX0AX1GDn0TDAyVn2aAfN76CmrBTimg==
X-Google-Smtp-Source: AGHT+IEabF9aXtQp3aenhR64WxS1g9cOj/1L2FSLUAESIqxrn8JkRWX1Txmn+76M6Wb3sexpEyps+Q==
X-Received: by 2002:a17:902:d483:b0:216:3c36:69a7 with SMTP id
 d9443c01a7336-219d96e8fb1mr29034205ad.45.1734594579793; 
 Wed, 18 Dec 2024 23:49:39 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc97432dsm6784445ad.110.2024.12.18.23.49.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 23:49:39 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 19 Dec 2024 15:49:19 +0800
Subject: [PATCH v3 01/15] drm/msm/dpu: Do not fix number of DSC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-1-92c7c0a228e3@linaro.org>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734594567; l=1800;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=H71UugjG5IQJFjXijgWx29ezewCBoV9AAKOOrWRKHwk=;
 b=dUzlSdGY5e36I0gVxFwpQEvjNoLa0A1wdKlZECUaxHkjySXlll3b9Uyws+NzCj8x2f+Y9BgKm
 sggNoaJFPFdAts/tP1G4bwB5pARZ8tdxN6l7vnKa8WC8Acwxaq2KQoZ
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

If DSC is enabled, the only case is with 2 DSC engines so far. More
usage case will be added, such as 4 DSC in 4:4:2 topoplogy.
So get real number of DSCs to decide whether DSC merge is needed.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index ddc60e658d63f..650df585138cd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -164,6 +164,7 @@ enum dpu_enc_rc_states {
  *				clks and resources after IDLE_TIMEOUT time.
  * @topology:                   topology of the display
  * @idle_timeout:		idle timeout duration in milliseconds
+ * @num_dscs:			Number of DSCs in use
  * @wide_bus_en:		wide bus is enabled on this interface
  * @dsc:			drm_dsc_config pointer, for DSC-enabled encoders
  */
@@ -204,6 +205,7 @@ struct dpu_encoder_virt {
 	struct msm_display_topology topology;
 
 	u32 idle_timeout;
+	u32 num_dscs;
 
 	bool wide_bus_en;
 
@@ -622,9 +624,8 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
 		if (dpu_enc->phys_encs[i])
 			intf_count++;
 
-	/* See dpu_encoder_get_topology, we only support 2:2:1 topology */
 	if (dpu_enc->dsc)
-		num_dsc = 2;
+		num_dsc = dpu_enc->num_dscs;
 
 	return (num_dsc > 0) && (num_dsc > intf_count);
 }
@@ -1261,6 +1262,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		dsc_mask |= BIT(dpu_enc->hw_dsc[i]->idx - DSC_0);
 	}
 
+	dpu_enc->num_dscs = num_dsc;
 	dpu_enc->dsc_mask = dsc_mask;
 
 	if ((dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) ||

-- 
2.34.1


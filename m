Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7060F9C77AD
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 16:48:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FFC010E735;
	Wed, 13 Nov 2024 15:48:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="J8cGvao+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A353710E733
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2024 15:48:43 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4315eeb2601so87604095e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2024 07:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731512922; x=1732117722; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9yi71EJcXV1TWxeijcAvxPwT2zxYkcPyTUpTjdKEPVU=;
 b=J8cGvao+azHk75achidKdTTfTSRXn/0UfgicsXRq2myARyKk36wL7zNa8i8bdPJfYE
 lHg1PqWN2poqHcS6KPbe21nToxx8lTxehCjYCXVLkLozf9ZzT+l4hGCSegLqzRtQMMXr
 HVTEp27Lof8fDIe5jcrCGm3hbTXDM98Dw6v3wL7e2u/PZ2WyYU6AFevv4qCs+h0yAHFN
 kUWz11TyI1Kyw0JPwfFHmcSTUuzji5NEWQ173PvImbu5pN1iMd0l38ULnyyvphSrmEL2
 YjicYPxN059rqeh2wl1T/aVJSFKaz70gI5aCb4R1n/kiv+8rZbbnsJZlAkTg9xFOl/U7
 R/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731512922; x=1732117722;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9yi71EJcXV1TWxeijcAvxPwT2zxYkcPyTUpTjdKEPVU=;
 b=cCaFOl5GKtpbv/Dc3qAwpNeV8ldDStij1OQiaVFcl9LSLCSbvf+UQ3dEcbPLwxivRC
 RatclsyHH1zlJwe3T05Vy+zUh5bhyvrle6ov2N5K+rSci61xyh18raHfDFj3EBin9LOZ
 TIlV9XKeIYn1evuIinBwMrMPW3tlqLBAwJ/10mAeA2Gr7hCuMZb3EFjG55q1BYqUG+GP
 ixbAZpZzsbjt+sl9ZIPuXMYfUS4cIP/eIeLzpciO/jnAboc3PNNSPsBM8gPGv8swNUFO
 oRI1ogtIH8LCFX6PJHGqAlIbg94eg0D2AYCzSOv+fzi99FpO5UXmoiZxWYV1O198Dovf
 4KYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwGfOWdBIUXjSGAbUsWTRVs9QnAgVWvyI1oxJULdeQPRbnRdduUjjX2A2kCMt9nrfdJV4hG5BUpGQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlA4g+yNSS3FTthGob5gKtAlQ2xA7vU7NQ4w4WSoK2GeKeMvmp
 d7zw3RQvxQhTP6Y0rbsAGuF8EW5/YQW0MalOhGygGDRV3O+DtM/cDkBpyqMciRQ=
X-Google-Smtp-Source: AGHT+IES6Q3gFVxvFv45r9DKj6piTt03BszD+wRLQWz/QQ3VuXsvXleM3XM05/zuEc8R5flRq9d+Pw==
X-Received: by 2002:a05:600c:474e:b0:42f:75e0:780e with SMTP id
 5b1f17b1804b1-432b7505822mr227996115e9.10.1731512921963; 
 Wed, 13 Nov 2024 07:48:41 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432d54f772asm28445345e9.18.2024.11.13.07.48.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 07:48:41 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 13 Nov 2024 16:48:30 +0100
Subject: [PATCH RFC 4/8] drm/msm: adreno: dynamically generate GMU bw table
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241113-topic-sm8x50-gpu-bw-vote-v1-4-3b8d39737a9b@linaro.org>
References: <20241113-topic-sm8x50-gpu-bw-vote-v1-0-3b8d39737a9b@linaro.org>
In-Reply-To: <20241113-topic-sm8x50-gpu-bw-vote-v1-0-3b8d39737a9b@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Connor Abbott <cwabbott0@gmail.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3335;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=7K41pu/MdkMTc+pP11XGCKZBexaQmRd+FCsZp0JDkpM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnNMpR4aROl/zsRVrE/76RdFwaYDIpy5ZB0B0CbpsM
 zK5QtAaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZzTKUQAKCRB33NvayMhJ0feCD/
 4l0/ygQ9J/ZTWsmGAQBYfHwHbUbQMMRBiuXJIQ60HYhkeXbQz/dbeCpDQF+47n9Pe/JG7Fhn2TTIAU
 zx6bOpinnL9hOxtjdph1WFE74J0BAXdW5SCe1UdiGYyFmYWVNnjkwg3BLdYL+2g2y7CWTLAx5shh/D
 R/CTy+dUTTzA5uSclaDjeM29loobtUlc5yg5bGUKrlXbClcqvNmzPN7d+AO7G4EACs2Y8gmDQlym7y
 CZkI+yg8TLVXN5qwCJ7fVu3FbtpLjhWFl14BSYF5MckLII0OD9wvnWqIQzbSfXDpa4MVqLgcuiht4/
 sMEoWD7XnisAUyj/pNjI4WE9+vVNfxj19Hzgw2+5I9lPEgMjgb1nIHPrPh+KPatdYs2ErG72HWEUkv
 UhUxIdySYl8HgV/kfoPkz0HwuUD1u3mnmlbrAEkMCL2nc+gIP0yo6nJrS1YjvHhrtSb4DrZAZyujFz
 sfKj/EMUYX2T8C+gFIyUEVVZ8mq6h8rRjSqYXr1o467JWPgn5UHWpp6l2KzzgWt06iEg3g06aKRbti
 0Blkj/giSJNAGY5W3l0lF3er0NLNymBDgrlm8e+Tnv3cd0NlLb3g/ckf+ATH4ziQSh2O1WdHKU7uPf
 djHMsNJcL6uAGRVD4fiX02AxrvgTz3rD2OdW8Er+f/t4VD4amnbhRQ1vHSvg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

The Adreno GPU Management Unit (GMU) can also scale the ddr
bandwidth along the frequency and power domain level, but for
now we statically fill the bw_table with values from the
downstream driver.

Only the first entry is used, which is a disable vote, so we
currently rely on scaling via the linux interconnect paths.

Let's dynamically generate the bw_table with the vote values
previously calculated from the OPPs.

Those entried will then be used by the GMU when passing the
appropriate bandwidth level when voting for a gpu frequency.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 48 +++++++++++++++++++++++++++--------
 1 file changed, 37 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index cb8844ed46b29c4569d05eb7a24f7b27e173190f..9a89ba95843e7805d78f0e5ddbe328677b6431dd 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -596,22 +596,48 @@ static void a730_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 	msg->cnoc_cmds_data[1][0] = 0x60000001;
 }
 
-static void a740_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
+static void a740_generate_bw_table(struct adreno_gpu *adreno_gpu, struct a6xx_gmu *gmu,
+				   struct a6xx_hfi_msg_bw_table *msg)
 {
-	msg->bw_level_num = 1;
+	const struct a6xx_info *info = adreno_gpu->info->a6xx;
+	unsigned int i, j;
 
-	msg->ddr_cmds_num = 3;
 	msg->ddr_wait_bitmask = 0x7;
 
-	msg->ddr_cmds_addrs[0] = cmd_db_read_addr("SH0");
-	msg->ddr_cmds_addrs[1] = cmd_db_read_addr("MC0");
-	msg->ddr_cmds_addrs[2] = cmd_db_read_addr("ACV");
+	for (i = 0; i < 3; i++) {
+		if (!info->bcm[i].name)
+			break;
+		msg->ddr_cmds_addrs[i] = cmd_db_read_addr(info->bcm[i].name);
+	}
+	msg->ddr_cmds_num = i;
 
-	msg->ddr_cmds_data[0][0] = 0x40000000;
-	msg->ddr_cmds_data[0][1] = 0x40000000;
-	msg->ddr_cmds_data[0][2] = 0x40000000;
+	for (i = 0; i < gmu->nr_gpu_bws; ++i)
+		for (j = 0; j < msg->ddr_cmds_num; j++)
+			msg->ddr_cmds_data[i][j] = gmu->gpu_bw_votes[i][j];
+	msg->bw_level_num = gmu->nr_gpu_bws;
+}
+
+static void a740_build_bw_table(struct adreno_gpu *adreno_gpu, struct a6xx_gmu *gmu,
+				struct a6xx_hfi_msg_bw_table *msg)
+{
+	if ((adreno_gpu->info->quirks & ADRENO_QUIRK_GMU_BW_VOTE) && gmu->nr_gpu_bws) {
+		a740_generate_bw_table(adreno_gpu, gmu, msg);
+	} else {
+		msg->bw_level_num = 1;
 
-	/* TODO: add a proper dvfs table */
+		msg->ddr_cmds_num = 3;
+		msg->ddr_wait_bitmask = 0x7;
+
+		msg->ddr_cmds_addrs[0] = cmd_db_read_addr("SH0");
+		msg->ddr_cmds_addrs[1] = cmd_db_read_addr("MC0");
+		msg->ddr_cmds_addrs[2] = cmd_db_read_addr("ACV");
+
+		msg->ddr_cmds_data[0][0] = 0x40000000;
+		msg->ddr_cmds_data[0][1] = 0x40000000;
+		msg->ddr_cmds_data[0][2] = 0x40000000;
+
+		/* TODO: add a proper dvfs table */
+	}
 
 	msg->cnoc_cmds_num = 1;
 	msg->cnoc_wait_bitmask = 0x1;
@@ -691,7 +717,7 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
 	else if (adreno_is_a730(adreno_gpu))
 		a730_build_bw_table(msg);
 	else if (adreno_is_a740_family(adreno_gpu))
-		a740_build_bw_table(msg);
+		a740_build_bw_table(adreno_gpu, gmu, msg);
 	else
 		a6xx_build_bw_table(msg);
 

-- 
2.34.1


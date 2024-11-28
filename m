Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A41E9DB595
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 11:26:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4278A10EC6C;
	Thu, 28 Nov 2024 10:25:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oyLbHJVZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EAAB10E32D
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 10:25:52 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3823eaad37aso1133709f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 02:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732789551; x=1733394351; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SK72k/WQ3xmvOOaJYIdk4hrey4edqK6L3NlBzQcP4y4=;
 b=oyLbHJVZQd3ej/MoSUo8EFOumUc6LbDZLoZfQf8JcwBdejmRLMq77dbADHPMEA/Sq0
 mH60XKYMu4wmSgFXLR6ChE5YEE4xIePswxizQiALAjbSppBhlL7VtBB+koefYzRhre1P
 wuKloUFt4fl9iSjz7ay8jNV31yFiduqHpQplqp3yhmhiIlJshd4i8lqhofo/9UCgbBtU
 Szmhgz1Ha3keqrWJExZeoFPZ59RWG1CN9ojzTwewo69Bg01N+N8QbtwQTlGVl3AkSTvu
 tBpyU3n+ciFFiopzil9U3aTYblBQ3Riy8PJvr2tioQWop69xEQ8hpCEjWgkzrEvPvaqv
 JSaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732789551; x=1733394351;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SK72k/WQ3xmvOOaJYIdk4hrey4edqK6L3NlBzQcP4y4=;
 b=PBgfD+yr88kFf43xyaSqyi1HPlu/DQsi+G3juWvLxuhLC3j00NM1bGL+Bl+9sM8GFj
 XTPpQCWbXWW53xPCenu3GBJx54Z/ZHT1TiMmTw0cmVio8yUoyoQT3L4ww9fMY0dJ3PUG
 s+MgIG+nZxBvl1Vj9A9fVAL1w+79k7K97fD0nJ4fWWqJv6yxi8RefkPBkVDbqocaVU/7
 +eROAglahOAmlUYfY28CFL6VyWRxkKCLjkmducLtwdnX9NC74OaCeRpt5QX2ZrWc/MNn
 NzxW/sW7s11G9PysJ9EDUvUHzJ/ks0nEDdVdmLdK3KhIJKsIk7+zpIgqhFSc8BeiFrsH
 vazg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWreJnEqOkrCaQWxaUdWYlt4yXOBOYpjDeNx0SexB6xE/PB2fX3dbj2tyEOw7Q/PeQIK7CupKWQScA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdtivESvL7YbWfldG647uYTaoogETHk3Z5VEE4usCJHGrrn3D0
 eXgWPrBjPzuFwbmKEkEv0Sf3u3q/vGlWt3AbHp/sOYVihqSySrBPDWjDz4+jM74=
X-Gm-Gg: ASbGnctVbqlUvjocUI0pcBMm/t+Qwnope5m65r2rE+4F2nmbjtudLAd45wOtjq4+IYf
 nYteLunrBK+Il4By826wAePwHa7pk+xP//YNyqL41OFYiiBMk3HOyzUYY4XKwShfSwIDU+34GO5
 w4QQrxeqqDq52hdlIKoyv0Y4mwgz8ThnwX9L2wC+56CCiHUwDg7EpK9TxGa//m4vUKo03dtr1Pf
 IHKxOxgUtuo0RVJ0l2AYlxuDshwRZzMwVR/+VAvs7+r9DOfUL3wGdie/XG0oJjRrGB2X5A=
X-Google-Smtp-Source: AGHT+IHY+Sjd0bkCvjs7AqBGAYrOFtVHwswzKk+ObAyWflqtjd9aC1HO9xGFLGs13Fc/oCxtCFOpCQ==
X-Received: by 2002:a5d:5f8f:0:b0:37c:fbb7:5082 with SMTP id
 ffacd0b85a97d-385cbd89a30mr2155992f8f.25.1732789550839; 
 Thu, 28 Nov 2024 02:25:50 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385ccd2db59sm1265909f8f.11.2024.11.28.02.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2024 02:25:50 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 28 Nov 2024 11:25:43 +0100
Subject: [PATCH v3 3/7] drm/msm: adreno: dynamically generate GMU bw table
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241128-topic-sm8x50-gpu-bw-vote-v3-3-81d60c10fb73@linaro.org>
References: <20241128-topic-sm8x50-gpu-bw-vote-v3-0-81d60c10fb73@linaro.org>
In-Reply-To: <20241128-topic-sm8x50-gpu-bw-vote-v3-0-81d60c10fb73@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3000;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=m6cl+5dS7Bml6VmAVtYBvyewU2newXJK0Ii2eLN6yeQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnSEUo6s9LquaLR+t1nEdRJP/ejIjlnSkwxWLYTtMU
 dqJbcumJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ0hFKAAKCRB33NvayMhJ0WxpD/
 4xaJOWThrZMYAhDcrGpuIeGYdU2zQYPNgiJPV8h1MiEz8m7g+ZbjOHJjRX5Lto+HVhMlKjqhiIfIuZ
 LzMI7RwrC+D6QNFKZiND1klBrhVGXpnkOdqDhO4ZE+lxf5IgF+PtZQi/tWs2k63P2DeAvGzOJxXF2i
 CJJiud6JioVyBbZvCGomMl3SLnfFkQml7agoY6wyHXz7cITxkth4PD2Mptv8U4HbQ1QPksCOgNLhGh
 CMrfwwhD5kCztNVBoNSmT+lAo1MlP5lDvU76wwRYBl0dRo8GwesHreB9qz0VTwvf01/GK7K4ktpHj9
 B6YKc9H1oNfszwrssRp7mWmmCiHYzwP53gzsruiZNGpeyhbaQx2ZohVm+25+8R5VLupzB7565H49hC
 eLZdV8V3Xe3diOICPugaNJ2ajlx3oKYfy2yJPFFicOT2NiL8wzKUc9QXIMqCtDVMm2sCznLhrjvs3W
 9og//JiUKsRQ8R6prBe7OSh/77TcZVOHmwy0vgTZsJPQk65bw0H+h+FTAfFosgqPhbOMndfn4rUuUn
 I6RdaTwoEMTLSGYTaRmeuO4eS265TsNRRJ6Tq2aAJrHCO19I5UDeK2rdsGeS6LoqUr6g8/qi/rX0SA
 JR8RC5oCAqNqEmSC9xXftPesdzwnJtDZIaeLco6R3we3gi3SY1Lf9xrNCaHQ==
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
appropriate bandwidth level while voting for a gpu frequency.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 39 ++++++++++++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index cb8844ed46b29c4569d05eb7a24f7b27e173190f..fe1946650425b749bad483dad1e630bc8be83abc 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -621,6 +621,35 @@ static void a740_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 	msg->cnoc_cmds_data[1][0] = 0x60000001;
 }
 
+static void a740_generate_bw_table(const struct a6xx_info *info, struct a6xx_gmu *gmu,
+				   struct a6xx_hfi_msg_bw_table *msg)
+{
+	unsigned int i, j;
+
+	msg->ddr_wait_bitmask = 0x7;
+
+	for (i = 0; i < GMU_MAX_BCMS; i++) {
+		if (!info->bcms[i].name)
+			break;
+		msg->ddr_cmds_addrs[i] = cmd_db_read_addr(info->bcms[i].name);
+	}
+	msg->ddr_cmds_num = i;
+
+	for (i = 0; i < gmu->nr_gpu_bws; ++i)
+		for (j = 0; j < msg->ddr_cmds_num; j++)
+			msg->ddr_cmds_data[i][j] = gmu->gpu_ib_votes[i][j];
+	msg->bw_level_num = gmu->nr_gpu_bws;
+
+	/* TODO also generate CNOC commands */
+
+	msg->cnoc_cmds_num = 1;
+	msg->cnoc_wait_bitmask = 0x1;
+
+	msg->cnoc_cmds_addrs[0] = cmd_db_read_addr("CN0");
+	msg->cnoc_cmds_data[0][0] = 0x40000000;
+	msg->cnoc_cmds_data[1][0] = 0x60000001;
+}
+
 static void a6xx_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 {
 	/* Send a single "off" entry since the 630 GMU doesn't do bus scaling */
@@ -664,6 +693,7 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
 	struct a6xx_hfi_msg_bw_table *msg;
 	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+	const struct a6xx_info *info = adreno_gpu->info->a6xx;
 
 	if (gmu->bw_table)
 		goto send;
@@ -690,9 +720,12 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
 		a690_build_bw_table(msg);
 	else if (adreno_is_a730(adreno_gpu))
 		a730_build_bw_table(msg);
-	else if (adreno_is_a740_family(adreno_gpu))
-		a740_build_bw_table(msg);
-	else
+	else if (adreno_is_a740_family(adreno_gpu)) {
+		if (info->bcms && gmu->nr_gpu_bws > 1)
+			a740_generate_bw_table(info, gmu, msg);
+		else
+			a740_build_bw_table(msg);
+	} else
 		a6xx_build_bw_table(msg);
 
 	gmu->bw_table = msg;

-- 
2.34.1


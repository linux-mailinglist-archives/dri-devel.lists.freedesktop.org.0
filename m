Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6AD7B5EA2
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 03:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6657C10E247;
	Tue,  3 Oct 2023 01:21:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8442110E1FC;
 Tue,  3 Oct 2023 01:21:48 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-77575531382so31039885a.3; 
 Mon, 02 Oct 2023 18:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696296107; x=1696900907; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vr0k7lEx47CbWkSjN9jo/N618Kr1MJPmmWsGVOz1DDs=;
 b=fH0u2Z3VzqXYagiUh71Aw3S/pZLj7nfUjXb0uMoDm+qnyCCZOF9FbxZTObBbjbmkBh
 sPM0GkWCfV/eNScYwnWJY6XrLdUGGloQkLo+jpU88684rBgsHOk9m+QUZNRSKAE38t5k
 YVr8p2rJpuKmLvC+AaAfzA91TUcjgUmTyIB7xoJTw8WKDQb11EuRAzII+M0XR2+BA8fz
 5e2/MpTKnfZ9WA6JCj+Pd6e176bEhn9j62GkmWUdzxgk79vh+oOGq7khTeBMrTH3MPCk
 Gdz9TX4ijXZDVKE3Nv2FPfwAPhN4qqMtJHyMJdydfMw+yR/Lke2cIjFiJSpiqADDc7m9
 oOYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696296107; x=1696900907;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vr0k7lEx47CbWkSjN9jo/N618Kr1MJPmmWsGVOz1DDs=;
 b=XqdXVqwAL34t8/i+I1zAahy+YDn1uHLTHk6FPcTJqBeoKwaWuW0Jo0Q1BfMxFEtOaN
 IkfMWlKE22CXS7KZgtvUQbXhdrXAzqL8UWZazWNg15PSLxCFvFuQkaXdRztN8ZtVmW+V
 IJHIZ9Avm1Ce3t5KHwbTlE/UFknulF7naAnqqcRdPQ9c4r+8wne7Q/wSfxs45TYQTIMH
 gqLRKIzIJ+gn3Zbjh8xXK5i6yA94mONsFhotNn0sSEHdxdEF1WReyzOq3spiZ0gkTzEk
 /tK2MliYjS1GiJGOD08uihgLkSoAomgKSNSjYeYXK2T5ved0jcLt0y4SZzyW+VN/LoG3
 291Q==
X-Gm-Message-State: AOJu0Yx54aOQklAKfnQOobTEvUzayDiZZEnjgr3L1kYFfgxcrVTSI6F/
 uwovcOuSJ4Olv5QSH0Q7rtw=
X-Google-Smtp-Source: AGHT+IFF8qyY7+L9sM9KLSnsmyzF8Ie9tiJr1eGJkFaGi75OW1rpZbtS0kn/hsUEIvrQ8PjzacqFoA==
X-Received: by 2002:a05:620a:b5b:b0:774:17f5:471e with SMTP id
 x27-20020a05620a0b5b00b0077417f5471emr12132412qkg.46.1696296107644; 
 Mon, 02 Oct 2023 18:21:47 -0700 (PDT)
Received: from localhost ([2607:fea8:529e:7800::efbe])
 by smtp.gmail.com with ESMTPSA id
 d1-20020a05620a140100b0076dacd14484sm49291qkj.83.2023.10.02.18.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 18:21:47 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Ryan McCann <quic_rmccann@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Liu Shixin <liushixin2@huawei.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v2 4/6] drm/msm: mdss: add support for SDM670
Date: Mon,  2 Oct 2023 21:21:25 -0400
Message-ID: <20231003012119.857198-13-mailingradian@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231003012119.857198-9-mailingradian@gmail.com>
References: <20231003012119.857198-9-mailingradian@gmail.com>
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
Cc: Richard Acayan <mailingradian@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the MDSS block on the SDM670 platform.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 2e87dd6cb17b..2afb843271aa 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -551,6 +551,12 @@ static const struct msm_mdss_data sc8280xp_data = {
 	.macrotile_mode = 1,
 };
 
+static const struct msm_mdss_data sdm670_data = {
+	.ubwc_enc_version = UBWC_2_0,
+	.ubwc_dec_version = UBWC_2_0,
+	.highest_bank_bit = 1,
+};
+
 static const struct msm_mdss_data sdm845_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
@@ -609,6 +615,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss" },
 	{ .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &qcm2290_data },
+	{ .compatible = "qcom,sdm670-mdss", .data = &sdm670_data },
 	{ .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
 	{ .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },
 	{ .compatible = "qcom,sc7280-mdss", .data = &sc7280_data },
-- 
2.42.0


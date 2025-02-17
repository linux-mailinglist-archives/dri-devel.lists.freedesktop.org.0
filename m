Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CB6A389A7
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 17:42:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C5AA10E58C;
	Mon, 17 Feb 2025 16:42:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Kmj31Uik";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABAA410E564
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 16:42:02 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-abb76cc6108so21340866b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 08:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739810521; x=1740415321; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xFipMKdumZp/ytSDr8+PyLocBgLdcXYBb9dko7M0NwQ=;
 b=Kmj31UikLJP1PLu3vwzyikJGa8/e+Tb9eiCBNl6Nu8qM1WzybZ9V0FBaxc2W5VGww9
 PCPW0OvEQ+vT3OktVKF2eXhh/ShBwp+v3hMHSsOs9BFVSU2idRL0aL+rJ9r3iR1L09Gk
 /Xjtn+Vx2kpSWE8fLhzCLL+00VJ0GipxcUxxFUJOM5N1MaIkwVw5wXupIO0CnR+L90Dg
 5n6U3NLbL7syTANmWsk4hgcSqw6y5RuU9pNs3cSkmnt1EJFhVghrqZ96WL2mNvn/FqA3
 5F1As6CFtPu1/SJxgSbA6T2hhhfveiRif0XmNKXuuLyCr4WaegecOIPOfSS3lCLHgTvE
 elFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739810521; x=1740415321;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xFipMKdumZp/ytSDr8+PyLocBgLdcXYBb9dko7M0NwQ=;
 b=ZJgmd5TRYcPMGVEADllbjQh27B0n6aeTY+54pUy9UZLpPQaSXsi62GUrIQEXstFnv5
 KLzGX8333boRJSt5OLA58mJ8fWxstXonIvTGbxWlo2yCUx2HmAMcbQ+DATdTjUklVmPh
 kjHq2TmdfKAGnZLVDZZUf1ATbB1YizMxMNuRl3LuElYnDdiGuvA3ogH2demkoChEJMkn
 o7laYdjA+gddc6hv0wlGJilTz5ao3YsK+iaEtn7Axj7Xp54Ua0IUclJWDiDon6fPmIvw
 y5AZnxiYWZiJPBCzJOiSmq3Km4PlHw33tESjJV1ExNFZiy+69UNOCT9n0LvCSyUObvWK
 dt+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmqP/VXOC2RagXeHtqzDu9gXSWOgFQDuD09XHx3Sb+gfED+ty89ZDb5GUaRjMaMSimc3L/UEk+9DQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbSVz7DtUJgiyrZEzm6sbLJ32f8SAyQNfKUgcdjXTN4gIkIFP4
 SO2zBzyh+eaIBl2Zpom1pEio0Ua76Ui6l6KwwmflWw0EUix/fUvFov9lJb/WNvE=
X-Gm-Gg: ASbGnctRqe4g/87vsVgOe8ApnE9uxZpqwYyZjEVivhyVuNtyJBAHnbyz0mq8qDGILa/
 VBUY3HT+sFUFFNmKavFo9NQzmCy8MYyZQrlmNh94SnIULjyqS0Bs7js2KkpZmsx9wQWAEe4Xd4J
 9pUVvIUkwyvnME0AP6q26PCR7hQV8LE47ykL2jCopTV5Mcq1emGV4gdIN+cmZO3h91fZq00BfMb
 ck0R4Gp575NJvGMSnOA02WhiBewz/mUmYpGQ7UcdMW407+BXjcno0lZTXK4ZqmwTYyuYTDRq0AB
 rMF6HKvwmBuS8OwGJrax6FekYSgUBf8=
X-Google-Smtp-Source: AGHT+IH8X9Zg1clEmj/6r4mBE5gyMkbWVF3xBhqOvCd2zyGKE+fqYvp1/PXMHF0iPCM/T5BzreHRBw==
X-Received: by 2002:a17:907:9716:b0:ab3:8bcc:3d97 with SMTP id
 a640c23a62f3a-abb70ab8c13mr434167966b.5.1739810521088; 
 Mon, 17 Feb 2025 08:42:01 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbac781b78sm82647966b.60.2025.02.17.08.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 08:42:00 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 17 Feb 2025 17:41:30 +0100
Subject: [PATCH v2 09/16] drm/msm/dpu: Add LM_7, DSC_[67], PP_[67] and
 MERGE_3D_5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-b4-sm8750-display-v2-9-d201dcdda6a4@linaro.org>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
In-Reply-To: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1071;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=GT04k1mFiJ+qnvaMmIwvNVTsraccfdG4M0v2LnZow7o=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBns2a+MLwpsMNZdF7tUH90tpc2TJHTAFzK6warf
 UvcllLmaTyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7NmvgAKCRDBN2bmhouD
 16chEACNIt2xqlhdWhrXc389+E83+h4BLRDazFXIiYNVaD9JcaFEyuQM6kY7DgZTV8VRl3y5qkn
 tVwtqRTfxtoN3Fld8M05ovL5vhjPfcQ4yoCwyNl9UNKPUstKe1d9jssKqPfJJhLV90CKNVA+ZFe
 UFCpL8LeceVXDcpeXlu4H3U7bKW7SVMQUEQO/lbwHnt5j3FSeBiiohB9neiP3Uuj3fi6hjzy/pi
 zLlY38SYUj6oLBkSfWFQO5PeYC3hEne/dX9Q6FDcQBb2ZRJgCj10SAhljWlOTLnw311BgPX0bkb
 1l5Yz20WmBtAt7Gs1DU1OwWw/pG/dwcbuG+Xdjr+wMvaZUbNRkJeHnSjrUIZXHbKON5O0QAgnD1
 cphzsYKOTibuiX3qzbGPvaaZ6ycDFgFDJ/bh6ienOrlhVqb0fFbY2Ov+bbuMPqWy9BiKRgE8PH4
 MMWjdY2fdQPImRCfztUDejLW/mRe/JEM1dGFSemCgIIBKChYEHw6MpVjzH/OSPGbuKVwMUhg7Ei
 4QeMvfrrtFaD8FdSkjxdh0tveR6pfztUkTqV7fESRK3ULxFQX1LftoOluU/dUrZJYz3sCCAsHDS
 7if/Ocxk7pRav9Rk8t0a/QDSCFZyQOONdASnz5TNH651HWn2wW0AHttdKIerqAxbtgE3wI7jgqV
 nhDLtV0OLBRE7Yw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Add IDs for new blocks present in MDSS/MDP v12 for LM, DSC, PINGPONG and
MERGE_3D blocks.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index ba7bb05efe9b8cac01a908e53121117e130f91ec..440a327c64eb83a944289c6ce9ef9a5bfacc25f3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -123,6 +123,7 @@ enum dpu_lm {
 	LM_4,
 	LM_5,
 	LM_6,
+	LM_7,
 	LM_MAX
 };
 
@@ -167,6 +168,8 @@ enum dpu_dsc {
 	DSC_3,
 	DSC_4,
 	DSC_5,
+	DSC_6,
+	DSC_7,
 	DSC_MAX
 };
 
@@ -183,6 +186,8 @@ enum dpu_pingpong {
 	PINGPONG_3,
 	PINGPONG_4,
 	PINGPONG_5,
+	PINGPONG_6,
+	PINGPONG_7,
 	PINGPONG_CWB_0,
 	PINGPONG_CWB_1,
 	PINGPONG_CWB_2,
@@ -197,6 +202,7 @@ enum dpu_merge_3d {
 	MERGE_3D_2,
 	MERGE_3D_3,
 	MERGE_3D_4,
+	MERGE_3D_5,
 	MERGE_3D_MAX
 };
 

-- 
2.43.0


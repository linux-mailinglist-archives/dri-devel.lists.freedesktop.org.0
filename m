Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FA2C0EB87
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 15:59:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5BFB10E4C6;
	Mon, 27 Oct 2025 14:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aPi5h3Y0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F5510E4DF
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 14:59:46 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-471b80b994bso67383855e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 07:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761577185; x=1762181985; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=AqsKQ8///0zondjUQyLirrRSCHthDErDWugJZ18wpKg=;
 b=aPi5h3Y0DoP7hWCTaCLogFMnYMs0ZXVEtNh2LmUoNv698KzdHnuGegI09WWK6WS1Zb
 cGmhjyTjkEUGdTUKy6f0t19gq2mCASrtd8CjgO0NriiUWyq2smjFmsGk2XXwWlFMOdjK
 T2JdzQxWCLBUMuf1g5IP3VoZ/p4KAlkplihepvSMcwHtKtB0RJ1xTRYrM+ncVQF1tPHt
 FHl2fInSgPLVrJUEOI1gBTfdHXEHswRHOy4Zl7ySFpyzet9P9mgEC0xZb69i9zH/lAw8
 vrwbReouaQTM9sk7P5C/6sIKGsIiNdT9t4l0Cf76gj5qeHFqVSr67ifwAUFuiKrv7VbH
 h4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761577185; x=1762181985;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AqsKQ8///0zondjUQyLirrRSCHthDErDWugJZ18wpKg=;
 b=cpXcBGoTG3zSW8TuiTVDuZGPWqhHkIg4FOyl40lb1QDCrSJECrboVmK/sbWCDpBeei
 rbDvzM0qre4AgjC8MFlvpNJ1wSAI4gRUSWWkdR5PylZ0ZXpMsSx79FCFx+IcD2MjXmss
 3dIU1SzIvrqTbOOYF2ENgIdt91Tf6PRXFs4+pKUj0qPGcJItDbk2UVL57LXDP4LRmTNK
 PPn4+8RF8bKV/MdUOEgSUrWi+lFu6AcNSXZOh5QwH0jHFOgrJMK7A/CFlNP5x8dLey7Q
 +OiLyDySK+VSOIAxd4BqI1O/eV/ljnxJ7M52JF8XOVaPZv0gcm9Buy0UwrzkgCFIHYvF
 beGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCae6KYeSj2pCdfYK6VH+ew+VaGCBl5sPByxcJH/ERQpnDbvujNjxc1x90TyoZIxT6A3WKj0wFZes=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOG02MLQon/dCwCsTe0GgOHnieSg1GqhSfumNQDzV7mjY3foMO
 ZsaXR1O76dFkVwKEGoqOREl1KdKKLSnvW+RvbUSisOl25cbnEvPu/qPMLfKnPRdET2k=
X-Gm-Gg: ASbGnctrTLj3V8zfOEZjQ+d1NDzjsDlD8Pmdu2/DwxlxBj+A9d+aWiK7JV5Ng0YTSPk
 SBToRAoXJ8qyOeHysrbJTLUBr5y03xBPitKYQzwwtGn92g2E7bl9ZDMLi9omAv0YXXU+rfukNcB
 ICDVb7FOLSBHcxb9wYh0yq6sAYr8Okc/WuOpo+fYRHyqjdeQs5Pu4CU278qNjqCc1NYmy5wVDJ/
 gMncDkz4zVB9JsoDKrhIvOkKCLgLZiuzm8k8jlFHlyDQp+ju/Gnb/57UnzjEY00kOuV2viNFj8J
 EheK2HMSNgP0ATmpGooCkt6D+zs8ywcu9Uh+NV4FRRXG3w0MERD3BTNx3ogzcnsdR8l0265TWNN
 lNT8FTnb3Ku8bT4pLUyn/QPS3mhQBuiXW/Z9pru0F8uL5NRhuvYp1jcAC6TCZmP21Ii8edQHemx
 Y+2bLdzFzu
X-Google-Smtp-Source: AGHT+IFO7Got2ubevHRfgj5QqQ+su96RPdM4Gxx2kUrMjZfw7k7B7E+Ut+HnbXiTZsiZtBSeBGG6RA==
X-Received: by 2002:a05:600c:83c3:b0:475:de68:3c2e with SMTP id
 5b1f17b1804b1-475de683d45mr63857665e9.40.1761577184642; 
 Mon, 27 Oct 2025 07:59:44 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952df682sm14624801f8f.43.2025.10.27.07.59.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 07:59:43 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 27 Oct 2025 16:59:21 +0200
Subject: [PATCH v3 4/7] drm/msm/mdss: Add Glymur device configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-glymur-display-v3-4-aa13055818ac@linaro.org>
References: <20251027-glymur-display-v3-0-aa13055818ac@linaro.org>
In-Reply-To: <20251027-glymur-display-v3-0-aa13055818ac@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=961; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=m/Ryf+3/Ba7bj8cfGk0q+ZCXj08lxgpxWe3j8JBvzwU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBo/4jQBp5H4dDRTqI5TaS3RfQjAj9H1dixDkmAz
 ixmM0LiGYeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaP+I0AAKCRAbX0TJAJUV
 VsLgD/9+wwEnPPeWGdL3dWWtgOTfnTcC8jpTFqVVENytsh45QdKu9O+0P/fh1WSXFMjpsRrAbs6
 WKbRfNOvZ03Kmw/sVbytPerJ64AkkPGZlGirnte7kXlFkveP0Ecghp2yBfQG2QC09wehxpJz2v/
 PlHSdIQ/2SFYE6cqk5A+Pcf24WkliOJ2qsLI7DORwwZzSD3ThX7woyimkMSVzC1ircRJTIMpeDw
 QlGQUFaTPTuXH+NK1Nr9k86yqaTUACN0Taao4LLRtu9IbruWMZn30BCWHAgdm1+TTpLKVZtSUpL
 y9DPFsoqv08g04uof6sf+iKJ2s6ipoYUHFZESnu8PbB5fV1Zyjuf3mNbC+wbNuZG3XTZN+T8G6g
 rGIQ118FHxRuUOjcr6FlAacjRo+Ja0vq6LSAemYm++pPa3pAR+ArtAvSpq1IFj17O3J90rSZH/K
 zCNy2Hc32837x3/jwgJm2T59ASUNXnJMMyhUiFCkWWsjIsPFMY6Yih++ai84+ft64EQZUa1w7AL
 2mjbDUYfKDEL1CsNDfoKPsUVkPc4D/ILE6LTsQBfr3DLIsbME7fgIh6UPnemG/pSpud0TKg5k38
 yDSl2yyq9Tubt7bwohbnH6rADGfrdlFjIVjkbMmmhTXD0HBdncIrt3bCJeHJm2diXhvfrVdQYeF
 iYhgQ0RhQ/2E6sg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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

Add Mobile Display Subsystem (MDSS) support for the Glymur platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 2d0e3e784c044db8ac0c478446d211a982cf0350..60bd6af83a8846f2ad751ea625a20e419c80638b 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -553,6 +553,7 @@ static const struct msm_mdss_data data_153k6 = {
 
 static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss", .data = &data_153k6 },
+	{ .compatible = "qcom,glymur-mdss", .data = &data_57k },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,sa8775p-mdss", .data = &data_74k },

-- 
2.48.1


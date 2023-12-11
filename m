Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6139980CFEB
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 16:45:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EFF010E49C;
	Mon, 11 Dec 2023 15:44:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DECB10E470
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 15:44:49 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50c0dbaf2baso4346682e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 07:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702309488; x=1702914288; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bSK6mZ8dw5NPtYdF0SRIR2pFCQDMWgaic2V9yiXRbes=;
 b=A9aq16TkOA9Wk0iIAFDYgxObwOuN2z3eJ3RVUYgp1N52kx0rxdmjyoIrjjhlu7A+dk
 2Vji8qrbOiN9wJqodreawWC7oZAj9VMRRiKHIBOeeEMbbBgepE0VTgKLwPClU9S1I6TY
 kniLmamwxN1ez4Cx9dPnwWznKt4bsQGjN/foVhJ6LsXfuKGAqUIM8mxKuYhtISa1tTYp
 YKvjg9Hl7Sol5458wYtbr7DX6kZpmbQq71mne3AuJ67RqQpXmC+Uc/wov3bO+gCPJ/Dd
 SdVQOU/yt+UWtBcPCZTu5EUPPPIUSd/dtz+qklFY6BJXc3GRizl3NXYo4EMtjnCJyvB0
 aEqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702309488; x=1702914288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bSK6mZ8dw5NPtYdF0SRIR2pFCQDMWgaic2V9yiXRbes=;
 b=Nr8YZWJShqAir531VqOQ4Vgjw8TS4vnZZlUGKkTUdkU/RFKjkZAYTweyY6yqBbWWDj
 3qsUSD/cxkYWW0h5PtvilKg7vKuM8kYwDQYFqb+x0YQVpAt5bQxFko1hNP0bgruXPDfR
 M7CBnGnzgAIY4i0OyMENrQIxCsDwDFel3VI8HGetHnsGqSoMDQFM3UvdgKwt9qzYhFue
 pMZqY2lw0xNaAvBhMSByecThQSf/yHEyQnHBBh35vWkRMlNtTIt4UB6/+UMf8Xlv9DY1
 h+uEJo11R9tKvHFuDLZVJkHw9RJ3h2d2RdwLphJ+rAhIRxQUHA7I+S1Qf8+DRdPzh8SK
 S6Iw==
X-Gm-Message-State: AOJu0YxASEIxgCme8y9oe/BgtRnyb+o+ZpgOr6m/YB3Olihr6E2gPjxg
 fKBrXmm+9fhZbmsuaEuI2eIFoA==
X-Google-Smtp-Source: AGHT+IFswBGhPJF8OSSb4EYKPIsJHib8hdzLokZ9b6fqCBPavnujwJZYpKaaXCUUP0UheLDOZEjz1g==
X-Received: by 2002:ac2:491a:0:b0:50b:d764:290b with SMTP id
 n26-20020ac2491a000000b0050bd764290bmr1115916lfi.163.1702309487906; 
 Mon, 11 Dec 2023 07:44:47 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c5-20020ac244a5000000b0050aa6e2ae87sm1109646lfm.2.2023.12.11.07.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 07:44:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 1/8] dt-bindings: display: msm: dp: declare compatible
 string for sm8150
Date: Mon, 11 Dec 2023 18:44:38 +0300
Message-Id: <20231211154445.3666732-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231211154445.3666732-1-dmitry.baryshkov@linaro.org>
References: <20231211154445.3666732-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add compatible string for the DisplayPort controller found on the
Qualcomm SM8150 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index dbe398f84ffb..f850bd9b8263 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -28,6 +28,7 @@ properties:
           - qcom,sm8350-dp
       - items:
           - enum:
+              - qcom,sm8150-dp
               - qcom,sm8250-dp
               - qcom,sm8450-dp
               - qcom,sm8550-dp
-- 
2.39.2


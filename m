Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7405568BC4
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 16:52:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92EDE10FEB6;
	Wed,  6 Jul 2022 14:52:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C87710FDE5
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 14:52:31 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id t19so25714704lfl.5
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 07:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vXi6F2VH59Ysan4BDfp4AdUlcPkLPDowInIn+GuvGdw=;
 b=hK2Oe9Wf4TgWPdYRY/ql5AAziNtA+NvPlRysTvW4VFmhUWug1/D480ktSh3FVjLjCS
 isipSJy/2JQOKcNzktqPSHgW3beSBpRoxYGZEdUSkwex+vrjtAvFBJ/wypDHtRsl+RuK
 RaehicsjHbV/2g1rCWDq5sL2Q3PYOxt3Mc22icHCyJg47YCK7GHWC0dasfegyJIz5IvB
 buk0Mynpk6Yh5uYy2uFbppqtpZmufEZ0p7s3jdocOSIkXMAy4DrkesI/H+DWXNoB39Xb
 tEFGPakv+dp4sfUa3+4+f2VgM3rBSAMfSvv7QnbswJ7HDtgb8cxXATTcKCHnk5cboZG3
 PvgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vXi6F2VH59Ysan4BDfp4AdUlcPkLPDowInIn+GuvGdw=;
 b=g255xZsCmSGcuxfd7v7Eo9ie5jkR9YLN+SIuP3+feO+kAl70hSdoiWCG7jyH1jh8JC
 CqyQArZfx4M4rZzQZ1tGhCHSYDLnxDCadHBhSpD5PNGvo0aXMLqz/AfjsFca0sgoCvQd
 2Zh7MWNSJV2wnBxiNB4TOiyZuXGawXBFIkovoxmQcDnOrcOlvvJI+5XVU8q93Ew2XjUT
 /uF3ncW9RefU0ni0FGmVrVl0hMuDUFzWdnKTnr3byJL4F3wf/YJwwgtq4sjzL9hSOPeY
 G557XDBK4LJUXrAvy/kYM13NyEo1/fAWXcUXdZrek+qtrenRrp2LYFqU6JDBkeCSYOT1
 TxLA==
X-Gm-Message-State: AJIora9RXJ+D52RyxRx9UmoyYH0/hZ5iv2G21DNOSEcyavIxDwISKaBV
 oJoVq6XltJ0Fhi8zpXsWl1Dazg==
X-Google-Smtp-Source: AGRyM1tXufqQv7dKCmxJenUnKtY5GI0T/veI1VtYXrKeGe18nnO0SqXXjGuVp5vwNK2VBJhTfJXrtA==
X-Received: by 2002:a05:6512:b8f:b0:47f:b8fa:20ac with SMTP id
 b15-20020a0565120b8f00b0047fb8fa20acmr28714517lfv.199.1657119149633; 
 Wed, 06 Jul 2022 07:52:29 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 v25-20020a056512049900b004855e979abcsm556617lfq.99.2022.07.06.07.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 07:52:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 4/4] dt-bindings: display/msm/mdp4: require 4 IOMMUs
Date: Wed,  6 Jul 2022 17:52:22 +0300
Message-Id: <20220706145222.1565238-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220706145222.1565238-1-dmitry.baryshkov@linaro.org>
References: <20220706145222.1565238-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

APQ8064, the only supported mdp4 platform, uses 4 IOMMUs for the MDP4
device. Update schema accordingly. When we have other MDP4 platforms,
this spec can be updated accordingly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/mdp4.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/mdp4.yaml b/Documentation/devicetree/bindings/display/msm/mdp4.yaml
index f63f60fea27c..58c13f5277b6 100644
--- a/Documentation/devicetree/bindings/display/msm/mdp4.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdp4.yaml
@@ -36,7 +36,7 @@ properties:
     maxItems: 1
 
   iommus:
-    maxItems: 1
+    maxItems: 4
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
-- 
2.35.1


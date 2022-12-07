Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E744645110
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 02:23:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 464D110E160;
	Wed,  7 Dec 2022 01:22:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8292110E164
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 01:22:36 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id d6so26379244lfs.10
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Dec 2022 17:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Eq+xrGXQkafyNxdD3bUOX4BO/00RbY/2YQOJ/yUkbp4=;
 b=a0KPp17aX3VBhc6WjLD33V4Bh8koqCHY8U9RWH5IQ4VswKF6JwBL77ccq3GkvUSuCG
 CfcsmPnoeTmb0MXYFkygNmqMDwSh3U0bt4gN9f/GPC2QcWTe3FYGN2k1ZLSvo5wKmbKD
 0QJ6MwsKVZfu5FtYxhI36mleqBEXd9txqpdxAcbjt7s/AHztZ9tzJa3aud1wvjJiI6bg
 WXxZbnDlyDeJWmJ03UbuoSKidB8q1wZJzGTuqjdBkUIDiUaOZmRR+Jof0KsfaxvL9Afm
 D0Hd0I+7hx8XDp5cDzRLOz//uyrFxL14eF0UzMitdjKc7/PpjhiDn2j1iOOW4WFOHaTN
 enUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Eq+xrGXQkafyNxdD3bUOX4BO/00RbY/2YQOJ/yUkbp4=;
 b=j5NjhxgxSGGTBTFrnzMkipdowhIa2sbNlQQxpZ93YZh0O+F6iASF3UBerwhhNXiIw9
 KP14dSrtIQ0xNIjL880r2Zi4+qlf4j+PEBOYHMQPFQhSLZFD8p5mROeDkvtsKbYs7vXf
 QUlLpix1Xjkm3tY1DVnS/20/2hgNZ+RfAd8fu+KtnTCcVCIaj00N9e23y4Hxren/4Yoc
 C4Lg53u6KqWgxR1kznWlKKlpzi/ixlRHgsJf2TSbUW/3WowKcBv7L2SfOQIyNzMluh75
 D9YmykN0JaHRlsgG+rcFHho8ic2lhbklGoFMmrl31Ukp/s0iFXROpC1nxhRiQc2K4L4g
 BjEA==
X-Gm-Message-State: ANoB5pmo7j+of6VIqkiOgMMAH3HlNBRKbiqtolrgXBy/50TgKL4ytzaM
 jfKlGYKAJbvvPTU3AyFRPBLcjw==
X-Google-Smtp-Source: AA0mqf5ap13IUItCE4FmOqAO8pw758yyVeEppRzmSs+FcStpWVjmZzxb6Uw1+fWgo8fH5Y1OVrUGkA==
X-Received: by 2002:a05:6512:400e:b0:4b5:5da1:4bc7 with SMTP id
 br14-20020a056512400e00b004b55da14bc7mr5831301lfb.485.1670376154848; 
 Tue, 06 Dec 2022 17:22:34 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 a11-20020ac25e6b000000b0048a9e899693sm2678916lfr.16.2022.12.06.17.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 17:22:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v6 03/11] dt-bindings: display/msm: add sm8350 and sm8450 DSI
 PHYs
Date: Wed,  7 Dec 2022 03:22:23 +0200
Message-Id: <20221207012231.112059-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221207012231.112059-1-dmitry.baryshkov@linaro.org>
References: <20221207012231.112059-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SM8350 and SM8450 platforms use the same driver and same bindings as the
existing 7nm DSI PHYs. Add corresponding compatibility strings.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index c851770bbdf2..bffd161fedfd 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -15,6 +15,8 @@ allOf:
 properties:
   compatible:
     enum:
+      - qcom,dsi-phy-5nm-8350
+      - qcom,dsi-phy-5nm-8450
       - qcom,dsi-phy-7nm
       - qcom,dsi-phy-7nm-8150
       - qcom,sc7280-dsi-phy-7nm
-- 
2.35.1


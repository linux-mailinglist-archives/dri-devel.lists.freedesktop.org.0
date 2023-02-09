Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FE2690A79
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 14:38:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E778210EAD6;
	Thu,  9 Feb 2023 13:38:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336DE10E219
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 13:38:44 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id m2so6376107ejb.8
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Feb 2023 05:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=00j4AQtDp3exXyYDIs2Yr8FW3T8oaLqnbNrY+Ba7dm0=;
 b=YgfHLZ0nxB4fnNrnVqPyn0cjdW01VV3ntd8kOMFGnXs4ZomPH5Ib1fPCzIzMeSDrc+
 liCzck42JmI8Agl4SPuD0aFns4u6Hev8ok8SXkRbL1+yShqD0ViraQyw7R9LVXxoJd2w
 e/YACNmWMZZ7q6mgHg/4YeNwAc+elKzBSZVbhBZ7dnd62F0nCTj4X8LQWEHkJsGiYpmH
 OZKb4ONTFpC/C8xxx/Yl7PFt1/GD8y8NM1veiHamk3Wqa3yHY1OHVTcRKtYr0X6VkbTl
 hZ/cm64TdxfSpzbwFnmA6BJVYiSUyF5800ixi+BuqXM6Lb9A/3SyM6EEOfqGB2YdoajU
 RCHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=00j4AQtDp3exXyYDIs2Yr8FW3T8oaLqnbNrY+Ba7dm0=;
 b=qdNXqz607YlW8pswsqQdGIRkPSnfBCfBf5HgiXtvDK47Xyb/hHqX56SpHXhcHHZyes
 CTM6DC13JZLQYzy7S2lSF+cMRUFOVg3GAdz/t6aY5+CAdEKkEjcL/05lKTws/HBesoG0
 xNYc1t0AOXwE42YXiAsGQOP95HcSQrEoEKXO0gtLBnUe/nz3yLItIpWB5cyP69P74CwW
 k5RSBMgL2JQYe+zzT8wMU6QkEh4uwT3WDgUhxcbxC8k3hQYEmFX3hf8WVaaFZyLUbTsf
 qFeXQ2agjc6hSaPsRcShoDsy7Ps6q02XEpxr8G4YJ4iUqeOukQr/KaMmhbT9+I9eRdOG
 U3qA==
X-Gm-Message-State: AO0yUKVDfh64b3wpx3dREEWGKvQxPXYwBIDDL8vL2+FaDZb47czChu4Y
 Iiou6lvD6EaxqZtfeych3yzbQw==
X-Google-Smtp-Source: AK7set9UTkWIJM92EQBven9Sq6OQzBr7KHfac1vI9Jxlu85/gUxZb1RJU15seSNGm2qCKr2bzm6lSw==
X-Received: by 2002:a17:906:4748:b0:84d:47e3:fe49 with SMTP id
 j8-20020a170906474800b0084d47e3fe49mr12341580ejs.39.1675949922813; 
 Thu, 09 Feb 2023 05:38:42 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 cd17-20020a170906b35100b0088f8ee84b76sm885553ejb.105.2023.02.09.05.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 05:38:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 1/6] dt-bindings: display/msm/gmu: add Adreno 660 support
Date: Thu,  9 Feb 2023 15:38:34 +0200
Message-Id: <20230209133839.762631-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209133839.762631-1-dmitry.baryshkov@linaro.org>
References: <20230209133839.762631-1-dmitry.baryshkov@linaro.org>
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
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add Adreno A660 to the A635 clause to define all version-specific
properties. There is no need to add it to the top-level clause, since
top-level compatible uses pattern to define compatible strings.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index ab14e81cb050..d5ce0dff4220 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -122,6 +122,7 @@ allOf:
           contains:
             enum:
               - qcom,adreno-gmu-635.0
+              - qcom,adreno-gmu-660.1
     then:
       properties:
         reg:
-- 
2.39.1


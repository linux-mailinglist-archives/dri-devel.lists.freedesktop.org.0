Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A92CF544BB7
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 14:24:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C3F111BE6B;
	Thu,  9 Jun 2022 12:23:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B5B11BE67
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 12:23:56 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id s6so37675585lfo.13
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jun 2022 05:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EY69blhAfLwlzhpt3ykQvo28dBBPjots5a/LOCelKuM=;
 b=IjpDkqE/seTW6CIHsQ7Hfj04A0JuPKLtjnMjErJkpXYhl3WM7UKcxD0rkphldo8FZC
 Mt4ewdaEMkw0E16QV2L9dZFqPbtQA33ZlEvTfYhrCm9TuHTYZjC6A9Rwby1HFvcu2Q31
 OBEQkbqwpslCgU5lAnkn/2YDYmtsefhglKT72IebkRpVx9KaHI2rGrRIFYginXZUm8ET
 1L170gjwFR5mP4d5WCrlSlsuPeCLhPtT/3RF/E/oK1/wndCGVc5TLkKNS1FsNWvZJh70
 jmZey/NNpZY0X/F4Bmbc7/vjsTjnbiHMzqcX7YXKU78liLB6/BOcSFOprVkZeQiOYJjo
 bKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EY69blhAfLwlzhpt3ykQvo28dBBPjots5a/LOCelKuM=;
 b=jGxQk2zbRS4meloEeqH7nwhQfp4ak5KDk/kaMJBs7jhARkYg44eHfbZUUq2k364L3y
 Q1UI9j1IjteS94/hIhRR7kICoJkWNXX93o4rYL4NPcVqEFCutT9v2zGCUCBknbVx/MsN
 1RREO261im89vsRQofoe8WJ2LZYvMs7Rghl32Tw9WJt3LzT76QdeKc+LOY33iGIm3tXX
 r/N+CfQnbe4EhYEPgYKtS66/ueS97iV7mVALNoFFNpE7T32wgY+5c5cavK/irMRTCPj1
 bUY8Gv2vjN/aZ+apz9a3FOms9ireIpYsp/mlvVK0IB1Bk7N59i2KJ6LceJVl4xU9Vimz
 z+sQ==
X-Gm-Message-State: AOAM530ixVLOV8EoWeZTmPJOCg2dW8d0sapjItfCJm+NBKtZo+3twrZ8
 YqLgS4drs48sfh2sL4qSmpb1zA==
X-Google-Smtp-Source: ABdhPJzyp0Hfr5XdSnJVDwteMfnRMn7T+LClAtbpwVJRURvWT0U8/5q5O/b5BG1sUgsG0uwrLVVaUA==
X-Received: by 2002:ac2:5bdd:0:b0:47c:bea8:f254 with SMTP id
 u29-20020ac25bdd000000b0047cbea8f254mr1682585lfn.407.1654777434599; 
 Thu, 09 Jun 2022 05:23:54 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 f11-20020a056512360b00b0047daa133decsm32421lfs.166.2022.06.09.05.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 05:23:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 03/14] dt-bindings: display/msm: hdmi: mark hdmi-mux-supply
 as deprecated
Date: Thu,  9 Jun 2022 15:23:39 +0300
Message-Id: <20220609122350.3157529-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
References: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

hdmi-mux-supply is not used by the SoC's HDMI block, it is thought to
power up the external logic. Thus it should not be a part of HDMI
bindings, but it should be declared at some other device in the DT (like
HDMI mux, bridge, etc). Mark it as deprecated.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/hdmi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.yaml b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
index 99b07abcd960..47e97669821c 100644
--- a/Documentation/devicetree/bindings/display/msm/hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
@@ -56,6 +56,7 @@ properties:
 
   hdmi-mux-supply:
     description: phandle to mux regulator
+    deprecated: true
 
   core-vcc-supply:
     description: phandle to VCC supply regulator
-- 
2.35.1


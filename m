Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B195C58F963
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 10:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22436A6C99;
	Thu, 11 Aug 2022 08:43:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF385A6C39
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 08:43:41 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id d14so24593644lfl.13
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 01:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=j0+XWkmBPfd4tCvKIKxfSVudBOlOg9hyI7bNXGkLUSI=;
 b=PZ63TfDUyut5YoC5OjhgChS1gehSFrI23rYrF6pCS2KlbsljChv3VHStXh0D82BqFK
 LYOn2NEw2OA2bvJFGZOzB6Rwlt/E/usJHKgAfl34NFEOXxNSrkQ2NT54S0vW7K4bcwOS
 j45ZnelMrOmLziYYGFkKC4mjGOFL54SJo9bEIAdc1depj3EG18QkPeF6bRySnP4xpqSo
 O/vAo9FW3jdLiXmWEoUwL1UiRnjWFZAAX7HKVXAEIFpPQWU3sEsr7KaPrX14pD0rod+M
 0Wi/tvfuy2+DwKe6GGIIpSXZ5YtBUE/mFQxqgazXKXrpojFiLPEffEYYlWgj34Ujrgqn
 F6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=j0+XWkmBPfd4tCvKIKxfSVudBOlOg9hyI7bNXGkLUSI=;
 b=7SCYGOoW1pV9fF6d2kvECsquKytY+9jf8WSuRCaGk7PU/pcG6paSmKoLHBBj1uU5lV
 1yo08W0GjXALkfjGO79Tmv2jkjm10aKbiLTrR/jHPtqONWYEa6zmmGes4FhuKP/K2nCi
 gPliymCEOxWx/Hs8OXsfTtuRwg/tBHA+WTzDCEf/z2MujpKqhPVLLNMEHLRt3IMVIKJz
 swtY1yKZT/x+HKbe93/7lKCdItwPndDeHHJDb3tpUmTzc9KkRHcXuRnjYq22pxUzL/l1
 oQALODAQybQtCtPJ2NXVLdRBUeiZ/Xdg2EzWNvNnvC3x/w90Aq3vRoYUSdEJtjXpMzU+
 TPaA==
X-Gm-Message-State: ACgBeo17eeI0UK4+TXvAB5OMEUeO79KEQlDUu/4/Y/+ky3YzCW4rqd22
 +CvdiHx+ONDk0KiRajfMQe2i/Q==
X-Google-Smtp-Source: AA6agR5DWj/+lgz0e/lMJZUw+szw6fb/cJMfuBjwi2CGFkIP75mNm5agSk+DCwMc7ErHkYRHYDGS+g==
X-Received: by 2002:a05:6512:c02:b0:48a:80f:b92d with SMTP id
 z2-20020a0565120c0200b0048a080fb92dmr11308020lfu.675.1660207420156; 
 Thu, 11 Aug 2022 01:43:40 -0700 (PDT)
Received: from localhost.localdomain ([83.146.140.105])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a056512360400b0048af379957asm631077lfs.72.2022.08.11.01.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 01:43:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] dt-bindings: display/msm: dpu-sc7180: add missing DPU
 opp-table
Date: Thu, 11 Aug 2022 11:43:29 +0300
Message-Id: <20220811084331.83715-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220811084331.83715-1-krzysztof.kozlowski@linaro.org>
References: <20220811084331.83715-1-krzysztof.kozlowski@linaro.org>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The 'display-controller' child (DPU) of Display SubSystem (MDSS) uses
opp-table, so reference it which allows restricting DPU schema to fixed
list of properties.

Fixes: 3d7a0dd8f39b ("dt-bindings: msm: disp: add yaml schemas for DPU bindings")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
index d3c3e4b07897..d30b6f9bd9d2 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
@@ -73,6 +73,7 @@ patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
     description: Node containing the properties of DPU.
+    additionalProperties: false
 
     properties:
       compatible:
@@ -114,6 +115,7 @@ patternProperties:
         maxItems: 1
 
       operating-points-v2: true
+      opp-table: true
 
       ports:
         $ref: /schemas/graph.yaml#/properties/ports
-- 
2.34.1


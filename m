Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC91E62C479
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 17:32:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D4A10E4D8;
	Wed, 16 Nov 2022 16:32:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC3310E4D9
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 16:32:29 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id k2so45438362ejr.2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 08:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1QOj2w1cuKEuCIniHGOx+eV8LLJOHngxV7TUVqDlP5I=;
 b=u2k7Aq29+rEZRuq5H9ipwm5MwIJyfeSnavYzCbkSR9sRcej5GhYU7gxUCwFnNRXOwu
 cOeAxAiSan/C9H+9EzluRSKGEbbdZd6Y3cf5ck+dK4fm4E4Z8GSuOY+Xgy/N1G8tqzTl
 aDuRuoDAZiJEMaghbnstJRqW+IByKbn7exB6kMzRdpYqIZhyUNjuwqt4wdHuFPHa8uow
 YraOE1CTGUZcqDYovZ1qetd8lK79fd7kFoZHfoAeRYo4GyPKb6eaby4vcU8jfZXx/fNR
 JhKwb7S/Qcnn9Sulgb0GCCykyBjNiz+sm0GGGD9egaJr8ltxpCYQVK9cpma1vSOR7A7C
 zMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1QOj2w1cuKEuCIniHGOx+eV8LLJOHngxV7TUVqDlP5I=;
 b=mM7gc6GeTAZD+cblZxMexT+wNJjcVjElGAZBi9DTzcePzIZTBEf0CpsLX6G6/MCVtF
 4WqsyuOmYSqgeFwuD4TwR65vr6G50RzGLcv9znEhfHqKvkgrrcI3TyxVF5+vSr/GkD6/
 ywa7yniG4WPhKEaBxWrBD0EMjVxRDhjDRqNV9IUqfnsFT2Az21c7o8d8CufJLyeJJC3q
 YmKTgQDhkxd1ay7Hcgn2/IhbLnmjjiByKs41qNs8SX7m6JkgMWgEnbiLbnocBxPgWX2r
 LRuri9J40XLRe2qBVDuPGeyw04UpMX+HmtJ4GM7RA/Pzb4EtXlR5Ku0orUFfCPgaqdbX
 duQw==
X-Gm-Message-State: ANoB5pkXunE77GTZtRE5sdoQ6S0NzKvBZ3vN7Bcubt48HNnfWHvLgN5y
 LilJG3PwtiQSj/ZWIxMcCzGoRw==
X-Google-Smtp-Source: AA0mqf4jxfP9I6wfX2k/5npoUZddyBUv0XsHwgJSeKCwsjhDVGtEdz+uFqYxcGQVmf4awiHn7Q/UFg==
X-Received: by 2002:a17:906:c18b:b0:789:d2fc:41d1 with SMTP id
 g11-20020a170906c18b00b00789d2fc41d1mr17987998ejz.642.1668616348355; 
 Wed, 16 Nov 2022 08:32:28 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
 by smtp.gmail.com with ESMTPSA id
 hw20-20020a170907a0d400b007add62dafb7sm7082093ejc.5.2022.11.16.08.32.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 16 Nov 2022 08:32:27 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Subject: [PATCH] dt-bindings: msm/dsi: Don't require vdds-supply on 10nm PHY
Date: Wed, 16 Nov 2022 17:32:18 +0100
Message-Id: <20221116163218.42449-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, patches@linaro.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On some SoCs (hello SM6350) vdds-supply is not wired to any smd-rpm
or rpmh regulator, but instead powered by the VDD_MX/mx.lvl line,
which is voted for in the DSI ctrl node.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
index d9ad8b659f58..3ec466c3ab38 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
@@ -69,7 +69,6 @@ required:
   - compatible
   - reg
   - reg-names
-  - vdds-supply
 
 unevaluatedProperties: false
 
-- 
2.38.1


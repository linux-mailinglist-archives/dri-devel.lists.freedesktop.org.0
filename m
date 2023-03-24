Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C51B6C7B5D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 10:29:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE2910EBBC;
	Fri, 24 Mar 2023 09:28:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60CBF10EBAB
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 09:28:53 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id o32so711301wms.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 02:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679650132;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rm2CqI1B2hHOJ8Hl9EI4NwacgguNWTWv0kuPmfPl+UI=;
 b=t284nf1k9sv2iMsS86WPPjUxEiH7BfXG4hgg1nU4y34toO5vT/a29fpKktjfH8TRsX
 WKS6kJIznte2assEdru4gLMRsF3SWOdyLZVAPvXs43YUPEJ6n/F3NeWexEsAsRSwLrjw
 yUe0h3iuWuWqj/y+rA/I6HWd8vBmb0mOTGWWwN4mJBYJW4HB6pZNgUEubzJjcRK3VcDd
 iO6F6pGXhkfM8SABVu1qJyxt6EVoCVNfLUy6euuvpGLWqWgVRN60CyjxP2KyXqqYLg5m
 w0cnrdp2AZ/VPL9p0K2LTKSn0J6qztMZzMMnWlY3wkduF9xXg2lB1uQz9pWgTv7ClySz
 PlFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679650132;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rm2CqI1B2hHOJ8Hl9EI4NwacgguNWTWv0kuPmfPl+UI=;
 b=UlT5DuCHK0C5hU7Q7o9Ou1gtHHXNnBukTQlarCbvjEFT8aGKZAcE20mSH/VuJnSVFL
 C0zJ1QNaelMzHWL+tc1Rl/IyS4hmVyzQZcQsXmhXOAO8m6/b5/YExz16FrWADnJQVBAL
 RhDwRHXyicygwoMhgVAkTE4k7mYLbdlkv1HiDEEYLo4sGc2SR6uB8VYK9oJiac3Tex49
 Bs5NqgpijZudQEWIiliM+Nez3QqqlJMG4IOYD4sf41kxtFOsd7/YV1kHgNW35Lgwgg62
 zRwJEk95s8Aug+WzIkR9SVnqt1SNdE861P+1PLelbUJZ1MHCRZXaWkV1NjNknL3FDIQH
 /dKA==
X-Gm-Message-State: AO0yUKVlFc5R9NABmQK2AZEgCCFkJZbwObIjgFO2nvsC+ZbEEpnB8nVY
 OiMEspFgXskxdtsYwIwj9mg44g==
X-Google-Smtp-Source: AK7set/KO0ZKtP+ZNvxHzZXCh5+l/McQL+zEOhxzhknt4p1EcpvbrKTkz/jkNtk7LgYtfkCuZ5V61A==
X-Received: by 2002:a05:600c:28b:b0:3ed:5cf7:3080 with SMTP id
 11-20020a05600c028b00b003ed5cf73080mr1917189wmk.5.1679650131787; 
 Fri, 24 Mar 2023 02:28:51 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 v14-20020adfe28e000000b002c5a790e959sm18029980wri.19.2023.03.24.02.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 02:28:51 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 24 Mar 2023 10:28:47 +0100
Subject: [PATCH v2 2/4] arm64: dts: qcom: sm8450: remove invalid properties
 in cluster-sleep nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v2-2-0ca1bea1a843@linaro.org>
References: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v2-0-0ca1bea1a843@linaro.org>
In-Reply-To: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v2-0-0ca1bea1a843@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following DT bindings check error:
domain-idle-states: cluster-sleep-0: 'idle-state-name', 'local-timer-stop' do not match any of the regexes:
'pinctrl-[0-9]+'
domain-idle-states: cluster-sleep-1: 'idle-state-name', 'local-timer-stop' do not match any of the regexes:
'pinctrl-[0-9]+'

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 78fb65bd15cc..ff55fcfdd676 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -255,22 +255,18 @@ BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
 		domain-idle-states {
 			CLUSTER_SLEEP_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
-				idle-state-name = "cluster-l3-off";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <1050>;
 				exit-latency-us = <2500>;
 				min-residency-us = <5309>;
-				local-timer-stop;
 			};
 
 			CLUSTER_SLEEP_1: cluster-sleep-1 {
 				compatible = "domain-idle-state";
-				idle-state-name = "cluster-power-collapse";
 				arm,psci-suspend-param = <0x4100c344>;
 				entry-latency-us = <2700>;
 				exit-latency-us = <3500>;
 				min-residency-us = <13959>;
-				local-timer-stop;
 			};
 		};
 	};

-- 
2.34.1


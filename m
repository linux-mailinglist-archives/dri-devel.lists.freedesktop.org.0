Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B28E73B751
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 14:33:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A341A10E106;
	Fri, 23 Jun 2023 12:33:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 281E410E12E
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 12:33:01 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f90b4ac529so7695195e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 05:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687523577; x=1690115577;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3nioVLaBlmpUmAJOY/G29NwVsUk826AqisUa8G22+3E=;
 b=ekPXno6XspMm889bu/+d0e+13NvrGvILCP9a4IA3MYLR+C1KDGPFjvx5DMtJFjwSlM
 RR+DVUtPO/hEvmkuz09fLP2a1aL2vUmB8CBHq3I6gXMktJiozuBiBPAOYvVMPkg8/NkC
 zp2FkWQZxujCMjWU+sZj3JzA8Sft69Nnk8kl+wR27GX9VY6ZahRKypHfQsam18LFXM3t
 V9jrAZNug2GeT+wTPjup8VW3cRc+mVdEYWN23sAZ3D5WxeOSyVMCSplosaEc1USchsUU
 uSvQUWTYAd0F3LYzUbwP7Kpc7PzRMBS0WaXjEqcUni1nAhOsyuk10IP4Fp0cUmrOX7ek
 Eogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687523577; x=1690115577;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3nioVLaBlmpUmAJOY/G29NwVsUk826AqisUa8G22+3E=;
 b=dNLwg/JqGPk99rJ1XoizlvT1CvH4ZR+YOwNmoxjvyoLyhl9AGi2/Rhnf4v9/AQ4zVx
 sS3ESA31RN+LlcGQvveNle2MgoKUrdtmIdRTopWULj4SJUn/hLrK5bM5ZkSAh8IG/fxk
 roqCoBePwj4/RMtDl0yuXDatnFPermVhvGnxATstF77/fqNNMtVy7Dkb1rHalMFhRcEq
 /qJGlqBhjqP+k1T9DL8uS4rhffb0Ymjdn8uVE5RropszeOtyeFL6OHJeCDb7OInAKzYL
 EOXzlzqVs6oOHWNVOLLMCanK6fszHaZz9arWYla2GMFdvoPBLYNS5Mj9Ltyi0J/l3/r9
 5UrA==
X-Gm-Message-State: AC+VfDxHhZif7IoOBahS8A2kirCkwyie8UQWefgUjuE0xI0MNiQDlOBs
 7MHISulbNJxInXY1hSgAFP+jAQ==
X-Google-Smtp-Source: ACHHUZ4Zw4foLCPx7ofG1ffKiCC6zFfB3Lk8C//VZfUT2SyK9JctQKgOA0us5B+yLQJv5lAN/j0oRg==
X-Received: by 2002:a1c:4b12:0:b0:3fa:7875:35f0 with SMTP id
 y18-20020a1c4b12000000b003fa787535f0mr2584392wma.39.1687523577057; 
 Fri, 23 Jun 2023 05:32:57 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 t24-20020a1c7718000000b003f91e32b1ebsm2228105wmi.17.2023.06.23.05.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jun 2023 05:32:56 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/3] dt-bindings: display: msm: document the SM8[345]50
 displayport MDSS subnode
Date: Fri, 23 Jun 2023 14:32:52 +0200
Message-Id: <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v2-0-733ed383f6b6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPSQlWQC/52OSw6DMAwFr4Kyrisg5aOueo+KRUwMWIIExYCoE
 HdvyhG6nFm8N4cSCkyinsmhAm0s7F2E/JaodjCuJ2AbWeVprtMyz2DxM7cgU70XKayzLIHMBJM
 VAWRn2fUCdgZZ0XlL8OhIlxV2RYuk4igaIcBgXDvEWbeOY5RzoI73q+LdRB5YFh8+V9SW/ezf/
 1sGKdTY6bpEXWnC18jOBH/3oVfNeZ5fjX3aRwIBAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1479;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=EBIjcCxyg5V/PvWq7nOKGJCN4FMlGSX8kOFs3sv4mBw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBklZD2Fk5SGjv9uNP5erhI9WFOG3oimSfHcp5eD5p4
 pWEm6N2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJWQ9gAKCRB33NvayMhJ0cwUEA
 CeJSeV2sCo7oNl4rkT3AJ/aIPaZ4dvPGAO3S8fVdBwtvpONLu/CX/6d6ss56iavBVde4NfIA3BaoP4
 MG6Rkh1wGIdcRHwUNgcXoWTOg++hu5/5CjBOm865tWSGM5nNHKlxhXocIPke49574cYe0Tx9z2jicX
 1a9J4dB20ejBiwPAv/51DovMh4BYY//k3TBp76QUJo/q2bJK2eTebVL1dZxz6SMs108wIE8PSya54Q
 KPpkss/2DBgZj7SLsxhg1dSY6XIWg7ez4hTT8iRw/jNfk5uaLakqamNBXrg+hLJQYnENYikN4Cxm4X
 2AIX55QuhZ2aaXxwDIRz6iefBTkmJZEA5c5db8V5Q1J908xtdCFqEruaRZeqSnRWLmh/ictVuiiGIS
 mEUWCWT6l9VDwEhayOqqxQJUzKf0ruSFzJjfturbUDxf3zsGQYQMcSojt+wvGsLhe1MVDzJLMMtkUL
 m0JfCR7tOTAyLkAghp+GhVw/LixEDeawKdNDzy3fzrfNE3YUi6izd3GQ68AuyKWqtjX2CsGd7sE2lr
 nhlKx6IrFYzVLcCw7Kt4nb4OLA99LbQceXhLslFlX6l5Rldm1mZ6usbGgzeDCA+CfPmAt6snrAR8De
 bp3AhG62NLACEdCgxe864l/TxdDmKGNhpvv2DKEnB+aUkKdBxPc8/c80NmyA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document the displayport subnode to fix the bindings check error:

arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: display-subsystem@ae00000: Unevaluated properties are not allowed ('displayport-controller@ae90000' was unexpected)   
        From schema: Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml                                                                 

And same for SM8350 and SM8450.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Removed duplicate "document" in commit messages
- Added review trailers
- Link to v1: https://lore.kernel.org/r/20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v1-0-8bf386b373eb@linaro.org

---
Neil Armstrong (3):
      dt-bindings: display: msm: sm8350-mdss: document displayport controller subnode
      dt-bindings: display: msm: sm8450-mdss: document displayport controller subnode
      dt-bindings: display: msm: sm8550-mdss: document displayport controller subnode

 .../devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml         | 6 ++++++
 .../devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml         | 8 ++++++++
 .../devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml         | 8 ++++++++
 3 files changed, 22 insertions(+)
---
base-commit: 15e71592dbae49a674429c618a10401d7f992ac3
change-id: 20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-4fe367bf5cbe

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C6B737EF1
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 11:26:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A1310E41E;
	Wed, 21 Jun 2023 09:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68DC910E41D
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 09:26:32 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b46f5d236dso54497061fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 02:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687339590; x=1689931590;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=re9WCz4H13D40XSzeAyHx5fCix8Cg4J0Ee8QgOUQuT0=;
 b=GMmxJ1YCaiXF5kZ2Ja+WePNK+ZIPDbA8ZHsemdGIrpwEFnmT1WHuaXvutqE9vnmhjo
 bDnx3HipilReckxTSkm8W95QkhLqvNTQv3g6gg4LeovCqUScmS4Dm0s2qjJjZM5wF0eN
 Av1gSMmyTEEoK9Z2L0JffcJ9Civ/wjf4nnDCmLlgKof1SCkZg3A4PouFbI9Fc0Gw/uyW
 4kvOVYwMt+NEhYr5F1Wn/dgV2B044j0rp7QAyD0NAkL9YcM6n0C/Fu4p/vXJJcEtEJ7E
 6m8uXzA6b0Qs8PWArD5H+zIT9Oo9ekILLrC7bpqnOa1pY5KxBWBtRqm3dhBn3lzg/628
 F1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687339590; x=1689931590;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=re9WCz4H13D40XSzeAyHx5fCix8Cg4J0Ee8QgOUQuT0=;
 b=UyhLfmJqh/uei7xnfcoSmxlkQfETcbQdJuZsWaXqT5pbmuM0rlL05WhTB0XyU38gwl
 U+F0nezaDomZRsJdqFBq9Mnj9HU6wBsj/tp/qK6WrAZSNkvYOjAa+jqIS+LqYjCulJQw
 ajqYbZvNRH19k53RrY92lZeRKtlPzHeoKuOZfRT/06ylJTD9/meBGaeBUoh4hCYoqKsW
 rIUrJ3s1BIsa/5U3vg2cwJ97U/vgYarIlVDtfQ/TCDi0DQYJ/hI2k1twfg3TrAaLMfmk
 PLByKyaik7PlEt02EknzLM9KTkujwQ0MEqWp/q2D+LGs38pFQE7ReDQYD1h/zjIG0WU9
 7+xQ==
X-Gm-Message-State: AC+VfDxtI771mYuQQ5v4blTRCV64RMbgEat7q0G6iIfmLnS3/RvLGhqI
 BBBnDZmAezu2rhRPfH9MEEWvvQ==
X-Google-Smtp-Source: ACHHUZ58tV60/jf+wRQdI/GcTTGcfiQe77Op6a4yhZwgerhTLga/xGCChPbIhBe1AM+r0dXuBtNmFg==
X-Received: by 2002:a2e:91c7:0:b0:2b4:6f70:c396 with SMTP id
 u7-20020a2e91c7000000b002b46f70c396mr6131206ljg.44.1687339589956; 
 Wed, 21 Jun 2023 02:26:29 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a05600c294800b003f90a604885sm4435068wmd.34.2023.06.21.02.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 02:26:29 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 21 Jun 2023 11:26:25 +0200
Subject: [PATCH 1/3] dt-bindings: display: msm: sm8350-mdss: document
 displayport controller subnode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v1-1-8bf386b373eb@linaro.org>
References: <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v1-0-8bf386b373eb@linaro.org>
In-Reply-To: <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v1-0-8bf386b373eb@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=914;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=TjGzGqa7j6xVxSr3WjxySjU5IBZ7vg9i0xPyCqvFJi0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkksJCb2CsPo8fWtFtkNdnkOj1Cj90XZDCp0vGBqUi
 89CoPx2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJLCQgAKCRB33NvayMhJ0ey6D/
 4p0mvBdmW6d4uPRJz6Lj+ohsDtEXzF3RC7piur4ugP57SqZuR15Wx9eucM4cYwfQsQ7mJvu6MMFsba
 3ICwQLcY++kSZYwDawFC7Wcg3681LZUbhr6JGZCzaZ7+HT7hy9/kd7lCmgh79XNR7WkgyMMqR8O2Iw
 AIgWAW5AEfqTz1dOmF5hddGTEDR6qBLh2dFjVZFzq/bxobPf/TTtv/ERpTd5T6j0GAbYRjztVyxlS+
 4/2txB6UZMVbFJoRuUb2fnyRO9AfPz2G3RT6B1tzChcnrq3kl2YXHmWXg/2FlSWsEaa2BnVtqIe75u
 z7f8WXgMkQybIa0XUHYm3GYjuED+EvSIHt/raQSdQw2xxiX2WicMC7UZbOkrNIoq7fVoKf52PFzPAH
 ihuvy/r0ISSwyyYoeDfgqINxSzymRQniOKGTUSiGUWhZor2KCzf/r3auK3PkCYjE8orgcre5pwGB86
 bGOD/4oVuyvSCahjePs7EqxKBIlzWR6agpXAORMg1OLv7nYYSCgyk9wdn0KZNvNKk/aSA0UFkv7mIg
 nxKuwjWfDzKpsgHAFOuot4LNYdUj4E6+gKAAQyDC1EtAZbKuNrnrj5KfkH5A06qgvh4w3X7miElfNb
 Vbj63mzWr1zE6hHflOtG8v2V8r4NtleYfXKfwaTwACYdN0azrtdzQAIMknHw==
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

Document the optional document displayport controller subnode
of the SM8350 MDSS.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
index 79a226e4cc6a..f2cbeb435f1b 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
@@ -52,6 +52,12 @@ patternProperties:
       compatible:
         const: qcom,sm8350-dpu
 
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,sm8350-dp
+
   "^dsi@[0-9a-f]+$":
     type: object
     properties:

-- 
2.34.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DA5A2C463
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 15:02:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF8110EB12;
	Fri,  7 Feb 2025 14:02:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VnU68p6T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 327A010EB12
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 14:02:32 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-438a39e659cso14033295e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2025 06:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738936951; x=1739541751; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=va1zoX8mtnqXVu53ncI+bFuzSEXb1z3Cq8WHUrR/Cog=;
 b=VnU68p6T+82quSCA8/jL+xgY7VXxAEqyAwmfX9ASq7sNAdK3OkkiOVqGCtb9mNb2pk
 eJY3dxbMcK30yj+Bu84vLzUeGItzCkKfJAn7YD4nOzR5BfRFMVrg59ZpSM6fr0Rase1g
 BYLs2SYUVFJFTkbBCHLJBx9uLBqNsqXmhFGQyILY8KM0tmUlSN/7X7qGAldJVEZH5N26
 v4A1g94S+dEI0vt19QxHwJDI+2Nw3Z0POTYmt/dz5khFxg5BKvneuoogoEhW0G3Tf7QY
 UVqzc81XsCqJfBeyMrvJFSCDE43ohnZbVgJcYYyZP0/20QZ5ZLjtQPgYmJ9D0l3eoGvA
 8bzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738936951; x=1739541751;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=va1zoX8mtnqXVu53ncI+bFuzSEXb1z3Cq8WHUrR/Cog=;
 b=qfRGkeMiQwG4UQjca3FN7wxEUi0kmO17BNADEHO+a3bdnHGBNnsuxmkaOhyae0pwYr
 Ya117bqyM6DEbHuWof7XYuQpbG1irg5UHUuO+GMLPhT+CdmqQYaL3e0GGLOAUKofNcbR
 J80O1UiBUxFKnEAKo/Um4SR3UUa0Sg9Vw8lt9WY25tmJbtWjlDOGfggrXDdhL/R83WIO
 SvteuCNBto/wswq05gyf8YB/u3D2ZbJ0IYxCZkntQR8KdgQuogQklvbW5g1Y4aPwV6Bf
 gb3FnqMxQFS01m5ij5gob6qj+Nfueiub4Ruwa8wGDQpendERUt2qixJJkulhW/c3Pgex
 tmiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVJgvpfu+cl30GU0V0iLmjjRiYOaUsNrYrFc63gSHYcz+jn7a53vOu6xgwWnTaruTirTenBbGfKNk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywuyiv0tyHZKzoshb7MjzGvXG6bxNJWjKY8/T9bG7NhGxqqNB9p
 yqfNw/vwV74KKM4bDSOCwbio91ZyOSgCHJnLVUJg71Sq95Jrrke2LwS6jvNUnhs=
X-Gm-Gg: ASbGncuwRKvglMqyqt2mCb5XwnynxPtoVi3/oz4tRRsPhvaxpkiNg5noF3epJK0y/y1
 gaKCuMludcVmUnk92OSBAn+ccTmK2nk1Ba+k2tieahV7D1UGNxbKtgrYy9NsFEgKPBqMLR3FlHk
 +A3Qbr7h8cxJtW9T39sr1J1b3ufdmIzqsCvCbf3XFU5Gg1HxFS7dVv+J+xqmX8tmH/bmQeXMp98
 f7peo7AjIxNDHJMD1XVkxuDxDkCTI/r6+Uge2h8ADHTIzr6rAIPTohcdlqkp9K/0x88KUztR21z
 VsJlekTyRTKySbsl6VaxszKUkYM6W+meoi2O
X-Google-Smtp-Source: AGHT+IE2pJXNda+hiiYnwyeBf6vBChbDoGs/+EqGbBksx9jMu31CSNXFGKBuAI/bGm3C2qIU4yweWA==
X-Received: by 2002:a05:600c:502b:b0:434:f623:9fe3 with SMTP id
 5b1f17b1804b1-43924993dbfmr34954585e9.16.1738936950538; 
 Fri, 07 Feb 2025 06:02:30 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391da9652bsm57384605e9.2.2025.02.07.06.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 06:02:30 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 07 Feb 2025 15:02:26 +0100
Subject: [PATCH v2 2/2] dt-bindings: display: qcom,sm8650-mdss: only
 document the mdp0-mem interconnect path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v2-2-f712b8df6020@linaro.org>
References: <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v2-0-f712b8df6020@linaro.org>
In-Reply-To: <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v2-0-f712b8df6020@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=951;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=lZqVKRzTEdObAW6fXjwuLR5X8ri06xq7SpagYA8tR3A=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnphJyiEPELOgnJBIrAJ4yLck8xsXgt7sOkv8NKNNl
 /ePkwIyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ6YScgAKCRB33NvayMhJ0Ua6EA
 DPpbduG9cUIr8ze7BRlZWsk3QO6dvuL50SUVot8nbJqcCPXvDc/HnTsk+OEoRj8CaXmBWR3BzmBG/L
 /5XllqZl8ExbyFyuG5+zBL65iOY47eF0O/aGFwWYfGllkGIoAJNhfvCnZuiPJcmywX9npz4fr9lrPn
 NA7cWWPpyBkPUMnpmK43ghDcNGVqxoX7NjTcZEbX9yAT4nD6sJp2P4mPkMCb53FhaSUt3B7h3tqZTB
 371BLuhR7iKhrHqh8rYpfGFocGuQTGjDMncKy9ph0URTdDzBwCvd6OfRbGrnvKZn6oI6fa+tAt4OQE
 gALlwfWc4/hLfL+8zdn6Ut5shc9Awu6ML0/EMjfYcHGcuUD+Rp6N/bSDiuWZdcqwXokATkSRMZBZ4c
 zC41gBPROo5ZP7X5zZYDOv1JQ6Q5TkYFsCnge3ufFrtPBLdy7ezYvEt7623ceMeJXdW3D2a2+47saB
 AkJKOH1Af5TsYnzAJeP5nRjXLCu6GcYCTnwEwX73HnDKsjQclHec3CkjBsaqO0EWmBYCT4FX3rV2re
 ZegOnpXqhyQODY7TqQjO/BMjg6qjequoVVc1Al3phvn9XVw5ofaoPsE4CHcWHNCJwCtSqjipWbp21p
 XAZxlQP8JdwFsadGqr7kMjuhD2gCLw9YLGsQD6MmtpESrvwfcFxFku6ZEfBg==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The mdp1-mem is not supported on the SM8650 SoCs, so only support a single
mdp0-mem interconnect entry.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
index 24cece1e888bd35f169dc3764966685de4b6da1d..cee581513c519924712c7e0fc055099f886d0a99 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
@@ -29,10 +29,10 @@ properties:
     maxItems: 1
 
   interconnects:
-    maxItems: 2
+    maxItems: 1
 
   interconnect-names:
-    maxItems: 2
+    maxItems: 1
 
 patternProperties:
   "^display-controller@[0-9a-f]+$":

-- 
2.34.1


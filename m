Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 766A7835785
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jan 2024 20:46:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71C9810E291;
	Sun, 21 Jan 2024 19:46:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE9F10E28D;
 Sun, 21 Jan 2024 19:46:00 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-40eabe33749so6099555e9.0; 
 Sun, 21 Jan 2024 11:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705866299; x=1706471099; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JSyL8oZoH+O2H0crbStcYmTW6WZwzQTT2b5q2v+e/vo=;
 b=lVnDJOmL2m15BZIBByGL8h0XCvCdLkTMGwPod/F7elq/O5nJMdu9wrbP3S4DT6b9ke
 MvPlmqTGvmUelBwoUPJc+skbGlZJFSslWRjgdF9gbW5ivBaNkDKsJQ5NGDm6/60sHatM
 fBDizkYx9B2HfcLihU36ZGjtvSsGOalDU+8sK7gVQkUgFcpOSCmoTIHbQeU25JAtGBVL
 wV7kP6SOjtFn8u17hTkAOIz2mTWVFTEefClIJuenD+5U+D/woYTyaF9lwbbnAWk4eKS2
 WKOXppqiK+2uNNEW3s6Odo0DA55njNhELC2K/hjC3tpu0HhotqkI62rNroIoQUOt1/VB
 Oa1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705866299; x=1706471099;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JSyL8oZoH+O2H0crbStcYmTW6WZwzQTT2b5q2v+e/vo=;
 b=jhxcCfAAMILYujNdr4z99/ijp3Z4NMDDWi4t2DpcABRaEjQ8I0rg/nNJXobUUx6gCI
 us5INGrDlUavz2pH6acQJzgVSONFNU69lIr+zsZq8MgcgiG0q9zHLkfsjb0NNFZ4Qdxb
 6gd8Hir9oyy11Ft0rWC1MtWAucVsuruXH1ICRyy6ccVPbjpvL9ojgNYgGwXeRaMW0dkC
 SFbahl8n5+PPTTix924BMGOdbbkV8d40zogRWNilk//o5Cf8/ujr3x0jr6xA02n1yR8N
 UAcT6ShWonEfn3pVhwbnQPbXElxyrD86VHChPnBCNiZG/A1YgqGubnpiWIRlFbyTt6UX
 +zVQ==
X-Gm-Message-State: AOJu0Yx9VMGrXO1ZzXrgj4PBOWa1e1Oe+N+U16fIXLiqLhZhjMHP5WGq
 /lTqgJ4oqurKHUf8s/FX/P1c7EanxgH3XT/x7JQHuIMv1oGgTuqh
X-Google-Smtp-Source: AGHT+IEA8QU6DB7njfuZDTzVSpd/QY3hGWifA+4SqNBDW2kARLb253E8gMCC7I8DvuAnAIwJag1OVw==
X-Received: by 2002:a05:600c:a3a5:b0:40e:aae1:e3cb with SMTP id
 hn37-20020a05600ca3a500b0040eaae1e3cbmr689767wmb.118.1705866299057; 
 Sun, 21 Jan 2024 11:44:59 -0800 (PST)
Received: from localhost.localdomain (byv51.neoplus.adsl.tpnet.pl.
 [83.30.41.51]) by smtp.gmail.com with ESMTPSA id
 k6-20020a170906128600b00a2b0b0fc80esm12547134ejb.193.2024.01.21.11.44.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jan 2024 11:44:58 -0800 (PST)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Subject: [PATCH 2/8] dt-bindings: dsi-controller-main: Document missing
 msm8976 compatible
Date: Sun, 21 Jan 2024 20:41:00 +0100
Message-Id: <20240121194221.13513-3-a39.skl@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240121194221.13513-1-a39.skl@gmail.com>
References: <20240121194221.13513-1-a39.skl@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, phone-devel@vger.kernel.org,
 David Airlie <airlied@gmail.com>, Andy Gross <agross@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Adam Skladowski <a39.skl@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When all dsi-ctrl compats were added msm8976 was missed, include it too.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 4219936eda5a..1fa28e976559 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -19,6 +19,7 @@ properties:
               - qcom,msm8916-dsi-ctrl
               - qcom,msm8953-dsi-ctrl
               - qcom,msm8974-dsi-ctrl
+              - qcom,msm8976-dsi-ctrl
               - qcom,msm8996-dsi-ctrl
               - qcom,msm8998-dsi-ctrl
               - qcom,qcm2290-dsi-ctrl
@@ -248,6 +249,7 @@ allOf:
           contains:
             enum:
               - qcom,msm8953-dsi-ctrl
+              - qcom,msm8976-dsi-ctrl
     then:
       properties:
         clocks:
-- 
2.43.0


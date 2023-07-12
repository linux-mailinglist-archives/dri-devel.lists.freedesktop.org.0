Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B6E75090F
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 15:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D2F10E520;
	Wed, 12 Jul 2023 13:02:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C90410E51D
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 13:02:23 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-666eef03ebdso3459252b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 06:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689166943; x=1691758943;
 h=content-transfer-encoding:author:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KMdohCdaLVd4HEOOg6g6eIdW9oFM4ELH5FlH42ryJA4=;
 b=FO8qnGg64dU7X+U8EMUetFFnalKYf9NpPJ7dptUBQOkNpwc7ZLhwLDh025M7zMlcZH
 QrHgezV0MJQv6uDJjvMI858+eQbKt98luJKA7Jhm8UfQ/ivd9IQ8/0Il4x1hgFxv4U2P
 4hJcwADL1GngCelhFCpOAOJ4XSZsmTcDTtgCEXyWYc3rSw6QVA//WnQY9BUan190iJ1E
 Lf8lebzMdld8H9io6dgAOTL0oqNJKMUl6Y1QMBrgIYSLlTmF7BLJxtSQxDfqIDXqSRW0
 S8y56T0M4ovrAOWqzDZvFUIDSwd9AZpK7u2/48Os1oxVvgUcpXnCWXYDU3c85rz2MsNn
 pvYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689166943; x=1691758943;
 h=content-transfer-encoding:author:mime-version:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KMdohCdaLVd4HEOOg6g6eIdW9oFM4ELH5FlH42ryJA4=;
 b=jZb21ZoPDr1XtC9FDM6M+5IVhGuoLbRbHkEXBq0ZpLqQMxgGpoVmy/bh1P8IBjn6og
 /g/lGt5143FA8sjLkh5a+s24yaP8hP9L51fgSXgyy/vjizJOIPD5yfG5xI/LgiN0u//1
 E+j5fpHNIBWyrhJCw8WDLAvWhliGjb4uVHcFzXx19AvszTC/P4QIwsxsv2K0ajRQqnMb
 wCAD/dRubysOccfcdsIzVxWafVnQ9EgJ4oxXqheGYMD2UPd4nNIdIzvUSzU8OadTWCjC
 ngJc9SXcmR5FvWTP9WKQqxDua+7wrTHRAVKMxy+yUQOgmBcMFRwzws64JDCfOJfvEpMF
 pEAg==
X-Gm-Message-State: ABy/qLb9iyR/T6hUXv9utEYtjhY6wnBPTXk6AFKu2wawq/1guWFIz6ZN
 5GydqU+fmdzF3XW34hIHVOWAXw==
X-Google-Smtp-Source: APBJJlGxOuD2o+cmEyspcCKwQyh62RpiDLf/OBRMFhKExXiTATvAyj0SSczI6826Fg3XxvXJc/xNQQ==
X-Received: by 2002:a05:6a20:12d0:b0:129:a9af:7ec6 with SMTP id
 v16-20020a056a2012d000b00129a9af7ec6mr16897403pzg.56.1689166943112; 
 Wed, 12 Jul 2023 06:02:23 -0700 (PDT)
Received: from x-wing.lan ([49.207.50.231]) by smtp.gmail.com with ESMTPSA id
 p1-20020a639501000000b0054fe07d2f3dsm3417023pgd.11.2023.07.12.06.02.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 06:02:22 -0700 (PDT)
From: Amit Pundir <amit.pundir@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Bryan Donoghue <bryan.odonoghue@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Subject: [PATCH 1/2] dt-bindings: display/msm: qcom,
 sdm845-mdss: add memory-region property
Date: Wed, 12 Jul 2023 18:32:14 +0530
Message-Id: <20230712130215.666924-1-amit.pundir@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Author: Amit Pundir <amit.pundir@linaro.org>
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, dt <devicetree@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add and document the reserved memory region property
in the qcom,sdm845-mdss schema.

Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
---
 .../devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml    | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
index 6ecb00920d7f..3ea1dbd7e317 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
@@ -39,6 +39,11 @@ properties:
   interconnect-names:
     maxItems: 2
 
+  memory-region:
+    maxItems: 1
+    description:
+      Phandle to a node describing a reserved memory region.
+
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
-- 
2.25.1


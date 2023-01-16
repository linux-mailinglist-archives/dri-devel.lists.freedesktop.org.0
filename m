Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB70166D202
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 23:52:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA40E10E50C;
	Mon, 16 Jan 2023 22:52:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08BCB10E50A
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 22:52:25 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id r9so6046205wrw.4
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 14:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Svkhj0q099C0FoiRDtRciP7InWwLuxVC/46qIXiovr8=;
 b=Gy+avgLG+P9k57jRvfeRfBrO68shrWo0WU9kEl9VIjNz09vvI89ZCkxMzfu3yFjOQ8
 JT1fqaMcjc1lX5xvxn8tOVvnjE/+7+WWKVM8Pb3ckh5N+Iq37KWDHOkGocyOvGkkFas1
 HxzN1kUZauvgvBcZjdVhxMJMoyQ2s1Ra53l4nZgBTfCvW9BaNGyEdHsioLIDIaTsTJRF
 A+1TXLfAxQ+cb0Z5HJqWH/YWyxxFnPtaw8W8ndU8oBpM0CBmW3+RonAjJjgs7CieCAH+
 1cvyBXXbD2oWBktpAfCxoC71fArxJsARswn7LSwM9BLActgzmi5tgb9rFQ36bbXBvcva
 vhhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Svkhj0q099C0FoiRDtRciP7InWwLuxVC/46qIXiovr8=;
 b=nFomUBv5rwGJ1hZGTqKFhyqhbHA9BlgkdWAcSI3KugptLpFGuGP9XuTFLVbG5btXI2
 3feJGKIgVzdECDQkiDdMp4POe62y1CZv6zgAFM+gOzQjRahZhbnb2BBw4ZKa7/Nogemb
 LXFxfxvMktDgubnIpvwLw6RKdRrKlmQQggi+JyPUSwXOnWE7SY3w7fVmRTZO+ps7Ai4v
 BMmx/3OLj++/iTMq5o8fxs+98u2aJTury5Iff2v6L/MIYoQZnRE8GDJus7rs3l2aUGeY
 YvuycCb7pn2mOhBLyWk9EcDn0vcc0klFsgJQ0XY8z9vrQiFukAsPopZUtjsxL0d3hpXj
 QHjg==
X-Gm-Message-State: AFqh2krvHQOFZkgY6YUJYxrJ+JK8NISZQ+UfSv2115e7+JJyO0rdp316
 UFfRweykI0IhOtTL1EjnZOGCBg==
X-Google-Smtp-Source: AMrXdXvUKlFppTep+nHcqzlcDeqCrJhyvFf3zYNb7MinJOl9BZPcHL2Wubs4TDUvKhrf5jY/iTKVNg==
X-Received: by 2002:a05:6000:689:b0:2bd:ffad:1bce with SMTP id
 bo9-20020a056000068900b002bdffad1bcemr982441wrb.59.1673909543565; 
 Mon, 16 Jan 2023 14:52:23 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 q15-20020adfab0f000000b002bde7999cd6sm9247880wrc.61.2023.01.16.14.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 14:52:23 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v8 3/3] dt-bindings: msm: dsi-controller-main: Add vdd*
 descriptions back in
Date: Mon, 16 Jan 2023 22:52:17 +0000
Message-Id: <20230116225217.1056258-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230116225217.1056258-1-bryan.odonoghue@linaro.org>
References: <20230116225217.1056258-1-bryan.odonoghue@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robh+dt@kernel.org, agross@kernel.org, dmitry.baryshkov@linaro.org,
 bryan.odonoghue@linaro.org, swboyd@chromium.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When converting from .txt to .yaml we didn't include descriptions for the
existing regulator supplies.

- vdd
- vdda
- vddio

Add those descriptions into the yaml now as they were prior to the
conversion. In the .txt description we marked these regulators as required,
however, that requirement appears to have been in error.

Taking the example of sc7180-trogdor-wormdingler.dtsi. The avdd and avee
come from GPIO controlled external regulators, not the SoC and in this case
there's no need for vddio to power an I/O bus. Similarly the regulators for
the LCD are controlled by the panel driver not by the dsi-ctrl driver.

It would be possible to connect a different type of panel to the DSI bus
here in which case we may or may not want to make use of vdd, vdda or
vddio.

This is also the case for older chipsets like apq8064, msm8916 etc the vdd*
regulators in the dsi-ctrl block are helpers not dependencies.

Add the description of vdd, vdda and vddio back in for the existing
upstream dts where vdd, vdda or vddio are already declared but, don't
declare those regulators required - they are not SoC requirements.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/display/msm/dsi-controller-main.yaml    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 47faf08a37443..7b849c8f119a7 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -147,6 +147,18 @@ properties:
       - port@0
       - port@1
 
+  vdd-supply:
+    description:
+      VDD regulator
+
+  vddio-supply:
+    description:
+      VDD-IO regulator
+
+  vdda-supply:
+    description:
+      VDDA regulator
+
 required:
   - compatible
   - reg
-- 
2.38.1


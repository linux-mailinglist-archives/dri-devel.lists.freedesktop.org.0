Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A30726196E3
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:03:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7C7210E751;
	Fri,  4 Nov 2022 13:03:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7579710E750
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:03:31 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id g12so7334008lfh.3
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Nov 2022 06:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QNrknjkwY6y7Nl2U9FfGOLqpO7+QERv2EXshAod3N+Q=;
 b=v0heW5S1Jn7iGCMqNDKVJf4qL/DJ0z8sJTh8IzmLrHaihk3vKDUNoB78z+Mgpv/GSI
 Ac7k/2QGz4IolW3GBdEogZxSURhotEJv1fazJHDzNpY29loarznugYLVjKNyW6v36oxC
 vquTkWKlonhinXx1gZlSAP2B5N3ckALJsMr76Jn0VrfKbLpQgzWCyfNZEniiOG6rvnPK
 m607J6LCHYRrQFcL7FXS3j7eGjdf2MgpN8PdbnEC9Xd43uRBvvy0tIv2dLy47NdWyXiJ
 DRUjiFyt8GJdN11lMXOrzaX+eg493NMWvdnNsDkJ7h5ADmju930sIZMDoOYy/FRzoYyN
 f0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QNrknjkwY6y7Nl2U9FfGOLqpO7+QERv2EXshAod3N+Q=;
 b=CWJRsBgn6WtgKkbSkZgsZTjtXx49VPM+43o9Wm5bnw5otTlEF2nFFRzxyw4e648I5P
 xdWvkKtt2+KsQC95cGB5GWkaU/e2DDvvRhBcx3+vRL+pTXBSMYx+hbVz3j3N5GWOxx2C
 jk+XnLt1mo5msFW2oGNnjX9t2js2FJ82eO0dcOmXmYMyCzsrwWrb4xervvrm0r+CvOBi
 smL087HrfJACAvSFubFl0tsnlrUB8PwZPdGpTJGKBZlz6aq4KyH/BDF5MlYnoB+FjPQh
 pE65/WVIlNa7NdFNoWa5Tm1UVBiDSr9awVp6DKaRTGploTIFXh4u1Mf3uEoCoBPnFspR
 6DGA==
X-Gm-Message-State: ACrzQf1e9MCNMbFbmyVxzDE3REHShtjsdayfH0RDhj49B3jtsw/y4GhW
 RgUlbhuJj2aoDa1pu7wszOSh2Q==
X-Google-Smtp-Source: AMsMyM4OhY9/soUr3/Yu6/mBlVo1w6eYUp/ojteavHzsT/k8xoq6igsCEFJ2PP/9/dtHSu6sdgKLZA==
X-Received: by 2002:ac2:4c0f:0:b0:4af:e7d3:e97d with SMTP id
 t15-20020ac24c0f000000b004afe7d3e97dmr12943317lfq.467.1667567009346; 
 Fri, 04 Nov 2022 06:03:29 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 s6-20020a2eb626000000b0026fe0a052c5sm419975ljn.129.2022.11.04.06.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 06:03:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 1/8] dt-bindings: display/msm/dsi-controller-main: allow
 defining opp-table
Date: Fri,  4 Nov 2022 16:03:17 +0300
Message-Id: <20221104130324.1024242-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221104130324.1024242-1-dmitry.baryshkov@linaro.org>
References: <20221104130324.1024242-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allow defining DSI OPP table inside the DSI controller node.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml   | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 3b609c19e0bc..c37dd9503da0 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -80,6 +80,9 @@ properties:
 
   operating-points-v2: true
 
+  opp-table:
+    type: object
+
   ports:
     $ref: "/schemas/graph.yaml#/properties/ports"
     description: |
-- 
2.35.1


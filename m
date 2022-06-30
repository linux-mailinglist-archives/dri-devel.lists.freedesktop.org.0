Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D301F562CB2
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 09:33:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C115B10FA24;
	Fri,  1 Jul 2022 07:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C8811A28F
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 12:08:50 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id q9so26988066wrd.8
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 05:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UXIxmaXQsHUdmEx45jKZo7R6vyp7qGPd0TVAPD152Mo=;
 b=G9TYezs2BVyMSI5iP3ydVLzqZPN+MSs41E34dkS34YlbLY40cOmhgEeszCj+i5s/Vv
 Ct3MMeNKPasAn5Q6ohG3pIuybDlJn5utEkwzrqTLmU08HhfZ2wTpPpWPyuSsVMba6OLS
 WAMIO6Q2Nm/Yun1Rt5iwRbty5Z6oulBqYrii6CaFkl1WkiKDOF0TNrSAEhn9pVRLJWWn
 52WXp6meDdmUsvdu59zaQ/SMt3utJO1eneNe28RhGjCVfynxF9pcCCYQ86PkPrwviUcd
 j1/16OPK5QVMa6NV8z3f2gk7WAETInVw+QsGhjeN0PCcWmcM3iOoxb1zA/szPy8sfThU
 YSuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UXIxmaXQsHUdmEx45jKZo7R6vyp7qGPd0TVAPD152Mo=;
 b=XN4wPARdz1R/oVmcxwGBdOa6fsoLf+oyvAsPNA4RQ7wWU1Q5ydZt1Thb32XIu/eLN6
 G3MGplOYS/ZnCxbGnCLzvwOFzDIpVmslmTFE7cpGS4gAA/6mSZbX0EqzZE3iv3lo00E5
 09UcHYvxKMeGjpYDziI52GF55JGkiAmX3oVfanyopihIopIbMXK/0X+toFmRp6/+rCQX
 RMiCk4BYKtopL2QmDnH6kGTkgzekhLdEQ6F2E8f5dhSbJIjSgm4sSnXnsRCxEIm1U2wT
 Wlr5+UJW4LEKGREXGXz4I3xn8FzkiiMUOLzipY26N1EVPITb+vp14bNLiWwz/HvFOtZc
 6NXQ==
X-Gm-Message-State: AJIora9Xu6163IwrUW1A2Fm+3BZxutOUFaZy75Q6YBytWdzn5UtC8GeP
 avw+KDcOb8Z1tWAnQauPD+NoqQ==
X-Google-Smtp-Source: AGRyM1upi8GqB4nIHDZxM1ikxXWYSY3gR29H2HW91/JD1Zxt6I1SnElAyoNb+x7ew2YWHXIKEGFiqA==
X-Received: by 2002:adf:f112:0:b0:21b:c01f:e6c8 with SMTP id
 r18-20020adff112000000b0021bc01fe6c8mr7784705wro.681.1656590929313; 
 Thu, 30 Jun 2022 05:08:49 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 m1-20020a7bcb81000000b003a05621dc53sm6286532wmi.29.2022.06.30.05.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 05:08:48 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH 1/7] dt-bindings: msm: dsi: Fix phy-name binding
Date: Thu, 30 Jun 2022 13:08:39 +0100
Message-Id: <20220630120845.3356144-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 01 Jul 2022 07:33:24 +0000
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
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 quic_mkrishn@quicinc.com, bryan.odonoghue@linaro.org, swboyd@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver doesn't care about the name of the phy in DTS. msm8916 has since
2016 named the phy "dsi-phy" with later SoCs taking the name "dsi".

There's no reason to have a constraint on the name here, simply to have a
name. Remove the redundant const in favour of maxItems: 1.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 880bfe930830c..717a5d255ffe4 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -49,7 +49,7 @@ properties:
     maxItems: 1
 
   phy-names:
-    const: dsi
+    maxItems: 1
 
   "#address-cells": true
 
-- 
2.36.1


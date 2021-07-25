Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEB23D4BB3
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jul 2021 06:26:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ADAA73801;
	Sun, 25 Jul 2021 04:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54696737FC
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 04:26:29 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id a19so6886899oiw.6
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jul 2021 21:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kU1VfKV/KwidsxyPTuvcQ9ilMU6Cwx8iFZjshNBHlrk=;
 b=TRygaLb1d2m9eOGCp6xYaANeKW0tOnOoZgQUGxgLOoMYwf+qIpEE8Rpp9HKxSQ2lfI
 tWdu7DdwKwVM5s04IZr/iL8VuBBoAjCHxHzHAflBHRPHf3KtBpmDN5JgZeMRC+nkyrff
 FkM+Q0dRk2WI3LnGnTmu4VMb2ug+ib3gcQw44sLHlMn3aqwNt9dFlKB1j+/Y9+bNE42V
 HmfGNgOQvpx+AC06SYnxWW6FqPEi7Ffg8EsoUNKpyMMbga3Pu4TlP/RpE6RQbcVSWGgM
 RRYovJ0OkjLyEtB4VzulN3ZfQsEFvwBTk4jYxS5qDX3NNf/UsBagGyHU0X6m9CAbEyab
 BEJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kU1VfKV/KwidsxyPTuvcQ9ilMU6Cwx8iFZjshNBHlrk=;
 b=G9iva+Te++Z//GyOYuVVriFMgGiRIgTMX35TzQadmt3owGuAfc+sDGesjd57AOBNVv
 Y1hybW6xkg4m9MtCYgRw/INPtujRq4i0RFUnLJh58MqvXETgYo2v6N24apyRsyJy4sTe
 ARfEG9KwLGr6R8T9/9HzPgwjH+dUi2ictN3IbIl4Vgr+JvpaggvjZT9pZGnIxKqyoyQT
 pbnSQpCNGUu0LG+WuSt7NMwgy8ZyR71p5coFzVCKs0qclHw3t+146wh5JRujQ5GWUI6h
 EOvT/Ow7lEOdmLBsU3vzrAN03MgXvuyG45o/a8I6/9sD7qwzyoOViNkWT83Nc0u0cuIr
 6rOQ==
X-Gm-Message-State: AOAM53354Ox2no7f95bwi6V1XpT4gA67vj+ufHL8WB4zHTqFKzqvtGYw
 Ln21qmczQXO9SGUlewkRQ4ySnQ==
X-Google-Smtp-Source: ABdhPJxWc6HpCzL5osAC98BzBe6A7qGjaV21OAnlOfljD7bSse+ehjQIL5aw6E0ECmbEg7gTl2MCXQ==
X-Received: by 2002:a05:6808:2089:: with SMTP id
 s9mr7702063oiw.156.1627187188672; 
 Sat, 24 Jul 2021 21:26:28 -0700 (PDT)
Received: from localhost.localdomain
 (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id t144sm6986200oih.57.2021.07.24.21.26.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 21:26:28 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>
Subject: [PATCH 4/5] dt-bindings: msm/dp: Add SC8180x compatibles
Date: Sat, 24 Jul 2021 21:24:35 -0700
Message-Id: <20210725042436.3967173-6-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210725042436.3967173-1-bjorn.andersson@linaro.org>
References: <20210725042436.3967173-1-bjorn.andersson@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Qualcomm SC8180x has 2 DP controllers and 1 eDP controller, add
compatibles for these to the msm/dp binding.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/display/msm/dp-controller.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index a6e41be038fc..c6056e0b0845 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -17,6 +17,8 @@ properties:
   compatible:
     enum:
       - qcom,sc7180-dp
+      - qcom,sc8180x-dp
+      - qcom,sc8180x-edp
 
   reg:
     items:
-- 
2.29.2


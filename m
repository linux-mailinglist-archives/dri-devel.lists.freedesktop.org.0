Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CDF423449
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 01:12:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 847AE6EC92;
	Tue,  5 Oct 2021 23:11:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA776EC92
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 23:11:48 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 c6-20020a9d2786000000b005471981d559so875252otb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 16:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oCnAkB79mR5AIU388UdqiAr4F0EbajvP3UTjYzPVMRg=;
 b=v4yz3RLfL3PsAlLFQWT3nSDM2WuRh8pc8/8ovsW3DrLwQatbzWkmtHeLUZf9130mTV
 QH1RLcP6pbO3a5D1VZ6kWWtqkssfSL/OMjpDo9rWB/42fjKcBpLlUFlJUds18dmfSnoV
 bxC0w2r1T6iOAZWH7pRq1VSgsRkKLKNhmMj/Arvu2dNdenLGzI9kUUhlSwr8cLfQUx1S
 4nzeIpkLy3u0NT2Fv0h65beNwUirlxLfIBRkH0LjeaN63BQBxdIAzbvbA0YSBRYsA6CA
 jx7ulieBRmhpfQA7rkDiUc2bRNCLANdfUwb03gfPgHKmLkO4Yn7atmNCnwpZfIhPTcwI
 f1Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oCnAkB79mR5AIU388UdqiAr4F0EbajvP3UTjYzPVMRg=;
 b=TAYf0SVvPVsj8ojy2vE2X3Chdt5QXAhdk2zeRq/meMF4DXiFVw3ocHK3LoLRwPmeh+
 aDDR02R9Y74c2DNseVDKf7/GCJsOSO5a2/MB3pvcgCTd9dOcvlxaca7tmbsxZUykiPAQ
 B1D9uB8ZITTW0ny6iO0SYK9dQGN9gW+cf/PxR+ycP64EMgmNEzUvCVroCM6D/0ZMmZ81
 x5VzDSl12s1nBjCvpOt8BEnpW0BwE/e2B8yo63Bc+bPK1MulAa9ZTynXciRMMHOpL18U
 FJQj0BzLFOWw9fRQ3hDXHtZcw1kj6itGRN91o/NnhROA+YLMe3D+rr4O8Q+ZfBypzIfN
 75sA==
X-Gm-Message-State: AOAM530ytBww1iwRQI5M4aAwFh6+ry1N4r7WyYPAM7f2hzFiqNpSDviH
 jIPdGTpNB+1/3HylWz2/E2Dwcg==
X-Google-Smtp-Source: ABdhPJwJ0djzrwEgyE1w+FdTMnmE5IMZWexC0nsKUKi2b/dAc+DsZ4kwaVhiurz4/q6FqF0BZBuZWA==
X-Received: by 2002:a9d:1402:: with SMTP id h2mr16374492oth.3.1633475508065;
 Tue, 05 Oct 2021 16:11:48 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 v9sm1665141oth.62.2021.10.05.16.11.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 16:11:47 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/7] dt-bindings: msm/dp: Add SC8180x compatibles
Date: Tue,  5 Oct 2021 16:13:22 -0700
Message-Id: <20211005231323.2663520-7-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211005231323.2663520-1-bjorn.andersson@linaro.org>
References: <20211005231323.2663520-1-bjorn.andersson@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Qualcomm SC8180x has 2 DP controllers and 1 eDP controller, add
compatibles for these to the msm/dp binding.

Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v3:
- None

 .../devicetree/bindings/display/msm/dp-controller.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 6bb424c21340..63e585f48789 100644
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


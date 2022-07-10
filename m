Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D90AC56CE43
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 11:00:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C161121CB;
	Sun, 10 Jul 2022 09:00:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7984A10F4CE
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 09:00:44 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id o7so4254138lfq.9
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 02:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VZs4kXHK9xbLHkrqMGuJyZ5VoLx/pQiEUX4aKEkcY5A=;
 b=NE0ahQ1LMEzRiDmam57ajPEX+MCfHm20NEAFqzHi/YYk76pgWNaUlBynt1fjo/qMqo
 A5T7sD6O3yrfZ+QlLQMO8PtLQxQMwVmJafXTbs7ZuetGUdqlXQh5HTNaVbSAN2wVKGUc
 cMNEjYgeVeYSPiXtMLgVYI5kF7Bqlmycx42OBbb7lYvSGfrmKY5t+YOkZlpsRZIG4I7y
 B4e2VMR639gQv28cRqt+G/I0+5/d+5fFNL/Owvr2JlPJ/Bo+OZH6Thpd/pvl4DgEK5Q1
 vetJToJjxA0y29kuoXjHpUQO9ixHE8maBjjvBA1B52WYok3uv8CkCQY3Z8HTAEaMAp0R
 CO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VZs4kXHK9xbLHkrqMGuJyZ5VoLx/pQiEUX4aKEkcY5A=;
 b=PtfkVbPG7i6sHycGNSsBhDMZFwKpuQivVIIo39ft3jVXULI/FMLQ3GR1JjZCXAmIUQ
 EY72MUOUD1TZ6qZMLqC02uUN3CFcqiZyeQRAYMSNbcy+JxizKda6VY5r5alY5IjeJ64B
 nWyxH0AonVCEkI4aC2lLYyCarvEbqpO+Gef3PdQ6EgJpfVkAnS7pK5zx1tMob9SBCkya
 6ZgZ+rQvRmlB/g8Xk5RMGbvXH9FuA2i/aTxcKWlZW4V2mJ3hExO4dZGVOFiUgucQJ04s
 VZdIDjIwngoNPiUGAqUUI4PJVinmFnHnprTSI2qZOdqUuF5Ghzhh1DauQ+z96hPxieZv
 wSyA==
X-Gm-Message-State: AJIora8MOqA/EeMKhd5gcZnt9dA+WczwOUjxDdvaKuShYJyhrsKoY15A
 1GGdkBQ7js0sOAleTky9C8iErQ==
X-Google-Smtp-Source: AGRyM1vJ2bvlLB+NlRwTwtW/ZZXgTuVBInd2vfmXy7JJPK9tbJTYw/ZGF0qL4Nv+Gv+WtrPPjOt2CA==
X-Received: by 2002:ac2:4e08:0:b0:47f:7b73:c9b9 with SMTP id
 e8-20020ac24e08000000b0047f7b73c9b9mr8006082lfr.5.1657443642786; 
 Sun, 10 Jul 2022 02:00:42 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 u16-20020a056512095000b004896b58f2fasm822881lft.270.2022.07.10.02.00.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 02:00:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 02/11] arm64: dts: qcom: sc7180: rename DPU device node
Date: Sun, 10 Jul 2022 12:00:31 +0300
Message-Id: <20220710090040.35193-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rename DPU device node to display-controller@ae01000 to follow the
DPU schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 72994f599825..e63b4515453f 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -2911,7 +2911,7 @@ mdss: mdss@ae00000 {
 
 			status = "disabled";
 
-			mdp: mdp@ae01000 {
+			mdp: display-controller@ae01000 {
 				compatible = "qcom,sc7180-dpu";
 				reg = <0 0x0ae01000 0 0x8f000>,
 				      <0 0x0aeb0000 0 0x2008>;
-- 
2.35.1


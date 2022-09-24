Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE1E5E8A7B
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 11:02:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C108310E560;
	Sat, 24 Sep 2022 09:01:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB6810E557
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 09:01:12 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id j24so2405284lja.4
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 02:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=FKcY1W2Ufu4JQ+EqVO+YLggZ5mqT/tMoi3A2zFkedZs=;
 b=yZJaMhxaPJo4r627Rn6s4nMcD41MKDee1L3BsWTtncHRxn5ZTZr3BM4LUpeGvuRXHF
 c7jbIbhScCYQ/IyeQQIi555e3/zxLJfMeIYphevQc+hrSnQt8ucehLHvAQMnkW6Cit/f
 BCq3i8dycNUgkD1EfLGVZmEpXsnXQOzvfZxthl8kYSMnFOZJHEzVvg9GRKwo1/prA0Z7
 boqHCIhn+9T4nid6lOMl7guDE5y9P8/DDK/W8+RYyZWU5fWrD/qQdvrtumhrnHDtugr8
 6Mm1JHYTfRTLluzCxOIvXYuRmHi8trU3dVHjjwUZMIIOqkiIMAeKPK6/lms23nipfs+G
 sMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=FKcY1W2Ufu4JQ+EqVO+YLggZ5mqT/tMoi3A2zFkedZs=;
 b=HTgJpvmkY0aApiVMC5OY7IEhcRYE5yP+6fmqoMUPhBpWLwVvinHzZVucK/kopenv8z
 r17FXilUj6MLPzFBtX/ko0eqNaK0jDb5aad7SOHT3lPEZ1N3LU+fGhJNlErBKu1C7x6C
 irEAQOpUIhH6Vo5e8n8Q3UL+MHwSOJ1OTNtiASnXpB0L8+kTfPCmlxPAudjssjzCvlTx
 jucFHm16/iCQgNyhD1b/0ettZPMDtWNv6210/CD7WhK6ChhH2PrVBqo/ad7HHCL0FDLs
 3FS7pEZStKZcW4yeCgNiuBt5DmGXW9o6k+7lDKC0kK6V+DXyQ9IKR25NP6htYKsNE6sf
 CPng==
X-Gm-Message-State: ACrzQf1TPcW3kBhdfv6TquQ/aeVHH84zyl+ZYS9SoScqmjmRERjCDXrV
 5raQZB+aKpY/FYvcKbZzpC7J3g==
X-Google-Smtp-Source: AMsMyM7AxAAPiM/Ww6ae46+DM5Wk7Im+j6bfpj+Qj3AphHulNwU6t4DL2hz90rvjxRvxcugR7lgPjg==
X-Received: by 2002:a2e:b8c9:0:b0:26c:27c7:cb69 with SMTP id
 s9-20020a2eb8c9000000b0026c27c7cb69mr4178869ljp.37.1664010071077; 
 Sat, 24 Sep 2022 02:01:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 o4-20020a198c04000000b0049f54a976efsm1830024lfd.29.2022.09.24.02.01.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 02:01:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 2/9] ARM: dts: qcom-msm8974: change DSI PHY node name to
 generic one
Date: Sat, 24 Sep 2022 12:01:01 +0300
Message-Id: <20220924090108.166934-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
References: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
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

Change DSI PHY node names from custom 'dsi-phy' to the generic 'phy'.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 8baca2a77717..d3a7de42f693 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1592,7 +1592,7 @@ dsi0_out: endpoint {
 				};
 			};
 
-			dsi0_phy: dsi-phy@fd922a00 {
+			dsi0_phy: phy@fd922a00 {
 				compatible = "qcom,dsi-phy-28nm-hpm";
 				reg = <0xfd922a00 0xd4>,
 				      <0xfd922b00 0x280>,
-- 
2.35.1


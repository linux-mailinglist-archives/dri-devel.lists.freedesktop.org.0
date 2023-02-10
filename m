Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D751691CD0
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 11:35:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3132D10E05A;
	Fri, 10 Feb 2023 10:34:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A889310E05A
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 10:34:55 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 l37-20020a05600c1d2500b003dfe46a9801so3761922wms.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 02:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8XZSQeymgbSKF089aMqGe9wzwMVmhXvBiXAbN2uEqt8=;
 b=lzHJBaJl8AJTpnefmvl94FhPLlq5ip7BTHqmKgHyD1SWYoYi7hUbDVVFdYcIfo7zu5
 hCFEn2aLgEx4wJBDAj6ZxoPX6fmiaCxqsFCU2KzGX4ehNSGESszrSq1Sd9MxOlEVb9RM
 L84COcM9LjwmBe/RAeina+Ux+fbWBOXRwlVx49HFay0j5x5lNHDVEoX8L0cQnphTT5I9
 UYoXQN9atsK9aIvcK9fWsk9FhNO49ZnW1wm24VwGEJwJSgs1bkCnZcybWGZ3WXZsKFIv
 cymIySIBkkZgxKYurb8wZqoQSkeBMQkmYKeuHI8R71dk2idM1DqXmkBdzZl05JTf9RA2
 Z6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8XZSQeymgbSKF089aMqGe9wzwMVmhXvBiXAbN2uEqt8=;
 b=wrNSZuMAsrSv0S8Kx28blU34oCIcs3Ag46ajlEN5dfoAJxIAOK3CvSHaVaamdlzpKm
 Tsdgman7qsv3aYmjp883xQb0QXiryV8QFEe99yyYfCkzV9VG8l8flPIXltFt7M6jQpHr
 LnHlbAnQsN77f3KFNQLw2QLjS3/c/Fdt90Zhbra4ujY1rNVNg0UsQ6F6LW3gh7iWM3qM
 /ZxmxRnsAhmAh/pItO5iQ6JzU2oeLeZT9xOeZFRuPAPuxGMfM/CbHcwcm/yt20BGIqbu
 1QxW16cVLAnzxWxPPvlVtBuproTBdu94TxRPzaYEkr4iEVDaGaWyFeDi8WGQ4g2SHQtt
 DfFw==
X-Gm-Message-State: AO0yUKXV8dOmx7Md5ZQ9w3vDXNZ1KTrECvMGU14GNEI+0/Nt6lWZj9Hp
 kaW+guy86+YHqNV1IRylQSkSSQ==
X-Google-Smtp-Source: AK7set9T2/fE1SAQdTpAMcLuRXTrYLj5mQyAfoiq6FSHMrseUqen3bW1riS3g/jAfnvbHBDI5yAzug==
X-Received: by 2002:a05:600c:993:b0:3e1:577:80f5 with SMTP id
 w19-20020a05600c099300b003e1057780f5mr10366027wmp.31.1676025294226; 
 Fri, 10 Feb 2023 02:34:54 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a05600c4e1200b003e00c453447sm7937958wmq.48.2023.02.10.02.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 02:34:53 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/5] arm64: dts: qcom: add DP Controller to SM8350 &
 SM8450 DTS
Date: Fri, 10 Feb 2023 11:34:49 +0100
Message-Id: <20230206-topic-sm8450-upstream-dp-controller-v2-0-529da2203659@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMkd5mMC/5WOQQ6DIBBFr9Kw7jSA2tqueo/GBcKoJAhkQNPGe
 PdSb9Dle4v//sYSksXEHqeNEa422eALyPOJ6Un5EcGawkxyWXHJr5BDtBrS3NYNhyWmTKhmMBF
 08JmCc0ggOW9q1cuWG2RlqVcJoSfl9VS2/OJckZFwsO8j/eoKTzblQJ/jySp+9r/oKoDDIKq6a
 W8Sjbg/nfWKwiXQyLp937+lTmzz7AAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.0
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Switch the QMP PHY to the newly documented USB3/DP Combo PHY
bindings at [1] and add the DP controller nodes.

The DP output is shared with the USB3 SuperSpeed lanes and is
usually connected to an USB-C port which Altmode is controlled
by the PMIC Glink infrastructure in discution at [2] & [3].

DT changes tying the DP controller to the USB-C port on the HDK
boards will be sent later.

Bindings dependencies at [1]

[1] https://lore.kernel.org/all/20230206-topic-sm8350-upstream-usb-dp-combo-phy-v1-1-ed849ae6b849@linaro.org/
[2] https://lore.kernel.org/all/20230201041853.1934355-1-quic_bjorande@quicinc.com/
[3] https://lore.kernel.org/all/20230130-topic-sm8450-upstream-pmic-glink-v1-0-0b0acfad301e@linaro.org/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- fixed the bindings
- cleaned up the usb_1_qmpphy &  displayport-controller nodes as requested by dmitry
- removed invalid mdss_dp0 change in sm8450-hdk.dts
- Link to v1: https://lore.kernel.org/r/20230206-topic-sm8450-upstream-dp-controller-v1-0-f1345872ed19@linaro.org

---
Neil Armstrong (5):
      dt-bindings: display: msm: dp-controller: document SM8450 compatible
      arm64: dts: qcom: sm8350: switch to combo usb3/dp phy
      arm64: dts: qcom: sm8350: add dp controller
      arm64: dst: qcom: sm8450: switch to usb3/dp combo phy
      arm64: dts: qcom: sm8450: add dp controller

 .../bindings/display/msm/dp-controller.yaml        |  25 +++--
 arch/arm64/boot/dts/qcom/sm8350.dtsi               | 122 +++++++++++++++-----
 arch/arm64/boot/dts/qcom/sm8450.dtsi               | 123 ++++++++++++++++-----
 3 files changed, 202 insertions(+), 68 deletions(-)
---
base-commit: 20f513df926fac0594a3b65f79d856bd64251861
change-id: 20230206-topic-sm8450-upstream-dp-controller-20054ab280de

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


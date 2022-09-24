Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAAD5E8A61
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 11:01:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A29310E54E;
	Sat, 24 Sep 2022 09:01:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2147B10E54E
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 09:01:11 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id o2so3597663lfc.10
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 02:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=rJGvdlYaB2D+2+O3pVejykwm9NtbzMAkAe36JQ3gsDc=;
 b=PX1MNlMQDANKhuXedAA/leSqjqsqyJLACLFVcaRgFr2ABBbS7xwYHclwczX8OrZe5X
 FgQWAr8lwyYzpSutXUQxmyJfTpQRlWqE8IwFjiVxN2J3B1eeP5Q3IgUPmp2H4QVFKvJn
 Q13IGyfvu6jaWyjh6UoTtpOUtCtQkEmw96Ss5ohSJpTk6Lu/Ww6lL7IaI09/6EYs+lUh
 CzIRUTgs4ZLQhWXH453NuqSnsgn/VBTli0cYoRLzJ5Tac73u3fZJuArzhChAhOyUaPWg
 m+So9mnAH97vkomI8mC70W3t52PLCmtQb+zh8c2cnHAh4Uc8cKzpGaPrtCR/EL7hyawI
 BqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=rJGvdlYaB2D+2+O3pVejykwm9NtbzMAkAe36JQ3gsDc=;
 b=6cTThvid8FCYhzwttiDrfkmLQx53xCZlZ2cXmMl1X7U15TfpNvgrREWIo1LkaaPSAN
 4FMRumkXe6NI33167l2LD3m2M4JsvDnsA5nXnQZV97D39bF1gV6QiBM6/4PdrPmEtCq0
 NFWPmBwOpARWpSQ+ot/5xuzElmqypU00YKbLPaBBHR0GgYgOGhOHkq1bhQ6CccHSmMNW
 jGP0ut8IJDBgIjVjyXhnTzN1ZoeZ3UdrC2Ebf+o6nAcMMSy+1I+1VARTpEATKcxl93iq
 UwL4jKRscTXXJ0/+hL1DeypMs62YZ1YPz4LJqSNGWc0+MIfaumM3grbfNKvwBxxQ11Hs
 xP9A==
X-Gm-Message-State: ACrzQf1scGyMOS0ViZQZSUZGtjhZZ+kET4S5gR/Pr0EQtznTAE9m7rFC
 YSXKRVoaqsl7QYHvqwiIi5ybpA==
X-Google-Smtp-Source: AMsMyM6gsMUMwgKSsW9VF8rj0QX9mADjeZM3Zznl0SzcOKlH3Y5sJ4Q5sRc6f8ZYsPhB4zpGzNGocg==
X-Received: by 2002:a05:6512:1153:b0:49d:1d20:ea47 with SMTP id
 m19-20020a056512115300b0049d1d20ea47mr4560994lfg.342.1664010069508; 
 Sat, 24 Sep 2022 02:01:09 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 o4-20020a198c04000000b0049f54a976efsm1830024lfd.29.2022.09.24.02.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 02:01:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 0/9] arm: dts: qcom: rename DSI PHY nodes
Date: Sat, 24 Sep 2022 12:00:59 +0300
Message-Id: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Historically DSI PHY device tree nodes used the dsi-phy@ names. Replace
them with generic phy@ names.

Dmitry Baryshkov (9):
  ARM: dts: qcom-apq8064: change DSI PHY node name to generic one
  ARM: dts: qcom-msm8974: change DSI PHY node name to generic one
  arm64: dts: qcom: msm8916: change DSI PHY node name to generic one
  arm64: dts: qcom: msm8996: change DSI PHY node name to generic one
  arm64: dts: qcom: sc7180: change DSI PHY node name to generic one
  arm64: dts: qcom: sdm630: change DSI PHY node name to generic one
  arm64: dts: qcom: sdm660: change DSI PHY node name to generic one
  arm64: dts: qcom: sdm845: change DSI PHY node name to generic one
  arm64: dts: qcom: sm8250: change DSI PHY node name to generic one

 arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts | 2 +-
 arch/arm/boot/dts/qcom-apq8064.dtsi                | 2 +-
 arch/arm/boot/dts/qcom-msm8974.dtsi                | 2 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi              | 2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi              | 4 ++--
 arch/arm64/boot/dts/qcom/sc7180.dtsi               | 2 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi               | 2 +-
 arch/arm64/boot/dts/qcom/sdm660.dtsi               | 2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi               | 4 ++--
 arch/arm64/boot/dts/qcom/sm8250.dtsi               | 4 ++--
 10 files changed, 13 insertions(+), 13 deletions(-)

-- 
2.35.1


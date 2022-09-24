Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2965E8B0C
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 11:44:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2375B10E5C7;
	Sat, 24 Sep 2022 09:43:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D2B210E55D
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 09:43:50 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id i26so3688138lfp.11
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 02:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=guecmyRIRRz2AXWadVLwOMYEwJax3FS9elbcAnyJFGs=;
 b=ShrZcbOcEr4oy3XOUsaUT8tLdzEoQ9DZOHKcv0og1a4hbgpfPg3szGEJ2fns8vGePI
 5HolOuuvjarT38gF7pYPXn+QEX8XnqCKmmsSCEDj7/vs70OE5mTB7NOFfwOgBBL2+Gfv
 3HGExhq8OvvGD6XH8PbIXmA9oqQz27O9o4elh7mZ8tg+NjwocsU6U4gIT6JkFMRCVsKs
 wHyOljBz/3umuyjZDhRxvLRM3Spq4Mqxh4HRZVmTR1kAftv9Vw+AovL4jhps8RQEtc2m
 ZZu+nXJLI0euvN3zvlv9Gc/gXUq3zGfzyIqKKeexx9mEn8ZnVLQ8vP/V6CSn8p+D0u9H
 quLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=guecmyRIRRz2AXWadVLwOMYEwJax3FS9elbcAnyJFGs=;
 b=4MRsf3SP+ecyJP+3T3yjEnqGoJWnsPoOoLfQ/yVOxYJhy/py3dJjrgipaFn67iKPYB
 TmM8w3dXu6DY+k5vm1pMBH7vqtaIvrdoqnHXyiq85Gc4Jf4r0/D+0KPXAWxvP+kgHUwZ
 c232JVgQs8TGFfbLMEBgtoao7EE7QsWDeidGWAcO4fnRbwJMyEQgETdd4XCfqxqp+c2A
 rgn9/2nAAW3q6rSGq/bcDflqZozfKHNAQC4M590I61I5mfDwlzzw0BUrmSR5543G2h0U
 XzoPZkdltqlHy+EHdaZHyfEaBAgMvy0nVCWI3zCL7Z4PpUxapmvJ+aIKRnh/DusAoIzT
 rfdQ==
X-Gm-Message-State: ACrzQf3WLJvmtyotObRCHezS/7PPeQyjsQFuXMHgTSsmdX56WYDwLkUz
 t0qxWGGuL7qcDrgIcrlY5tP12A==
X-Google-Smtp-Source: AMsMyM5ZmT4tx4z30xIzBpRGlclQSCUra8mRCpWgxqdBdL/38aqlqC5ixrwsatwiyZQzLn/4fj6eFw==
X-Received: by 2002:a05:6512:2803:b0:49f:979c:cc53 with SMTP id
 cf3-20020a056512280300b0049f979ccc53mr5037103lfb.76.1664012628627; 
 Sat, 24 Sep 2022 02:43:48 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 x13-20020a056512078d00b00496693860dcsm1833347lfr.232.2022.09.24.02.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 02:43:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 0/2] arm: dts: qcom: rename HDMI PHY nodes
Date: Sat, 24 Sep 2022 12:43:45 +0300
Message-Id: <20220924094347.178666-1-dmitry.baryshkov@linaro.org>
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

Historically HDMI PHY device tree nodes used the hdmi-phy@ names.
Replace them with generic phy@ names.

While there is no such requirement in the DT schema, it's worth doing
that because:

1) The recent qcom DT files already use just phy@ for most of PHY nodes

2) The recommended list from devicetree specs mentions
usb-phy/ethernet-phy, but not <anything>-phy, so I'd think that those
two are mostly for backwards compatibility.

3) I liked the example of sc7280 which switched all MDSS PHYs to just
phy@ (this includes DSI PHY, eDP PHY and, by extension, the HDMI PHY).

Dmitry Baryshkov (2):
  ARM: dts: qcom-apq8064: change HDMI PHY node name to generic one
  arm64: dts: qcom: msm8996: change HDMI PHY node name to generic one

 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts | 2 +-
 arch/arm/boot/dts/qcom-apq8064.dtsi        | 2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.35.1


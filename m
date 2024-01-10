Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E183829D3B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 16:14:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43D1010E60F;
	Wed, 10 Jan 2024 15:14:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 836CA10E60F
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 15:14:21 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a28b0207c1dso341611266b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 07:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1704899660; x=1705504460; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+f27VLO9Oz+Xtc3r9QInI9tNoYegp0SCYqbUt1hN6T4=;
 b=RuUsw88IQgZRJJGUsL4Fa2BUMBMAFdHrUdBWigCi+vuXKbqug/HsjwtPqk+J5NP1VX
 oGDQmEWIhgQE4el389OWl1oy7ZC61zyV67POrmQgXE+CfKumbCKGTO5qoS8XRIJooaz8
 alX/+r7av2sO8sJxwO8dR8Mh1aWDRVcJLJZKhhmvgTZivYjqDrTIIgSRQmhS3B8zfq6M
 WrolI5K4fWxJAGcbHZA2cjm/suHE2pbDlAHfBTZveD8B8DP7xK4WzFSVrhVR2EukaMr+
 rlOpuIVvRkQCiLV+5BI/8+ElLqXZUUVGbnzaLilYC1Ii+O4EPaHNpQLZ6e58DC7p/ODR
 VQMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704899660; x=1705504460;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+f27VLO9Oz+Xtc3r9QInI9tNoYegp0SCYqbUt1hN6T4=;
 b=dvwmb8QtTOZZh+r4qkJCV/ICCiOVM+vesJr1zNedWFyQ0RL/7VkO9+zHvmaI7UMWmw
 cJ4oTmgFEyMS745inxIlkBaqepOZ/rCPno2P9hgDgNSSXKUrPplWBfP22/p32NaGx/wx
 QEuNFCIPrW+jqMZzXLteVVCuTM2EbPs8BkH5WjIpeHhl59Gx5toVOQwkmHEJc3ZTozSV
 6QCW4uTcPAdrJzUpdIU5zLfcUPIbJoMDxa+iKiYTy+IqtGB0qS6kx7iV7Vo6K0pYaHi8
 LwKtvdd9ucL3ijdETrD902CmPePMyP7+AYFHuG2tAqaNn+fI95HT4TyotwUSqbGXpChi
 TdRg==
X-Gm-Message-State: AOJu0YwpZoaGwOxiGu4FadFizm9awrql9OxJtPcXLR8FCetaFshEAvff
 tkoAuF635pvgLvqMmkp50FvmF9Z0anj5VmUjumEZBL+eWz23pw==
X-Google-Smtp-Source: AGHT+IFjwvqQinr4aYI1QkACyE+dvAqO6bYMFt2Rs7JHAgqJxl1xn05Gqj5td5uc/AVJ0O9QomARAg==
X-Received: by 2002:a17:906:6:b0:a2b:c7df:87e2 with SMTP id
 6-20020a170906000600b00a2bc7df87e2mr718602eja.61.1704899659753; 
 Wed, 10 Jan 2024 07:14:19 -0800 (PST)
Received: from otso.luca.vpn.lucaweiss.eu
 (144-178-202-138.static.ef-service.nl. [144.178.202.138])
 by smtp.gmail.com with ESMTPSA id
 jx22-20020a170906ca5600b00a27a25afaf2sm2174517ejb.98.2024.01.10.07.14.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 07:14:19 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 10 Jan 2024 16:14:10 +0100
Subject: [PATCH v2 3/4] arm64: dts: qcom: sm6350: Remove "disabled" state
 of GMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240110-fp4-panel-v2-3-8ad11174f65b@fairphone.com>
References: <20240110-fp4-panel-v2-0-8ad11174f65b@fairphone.com>
In-Reply-To: <20240110-fp4-panel-v2-0-8ad11174f65b@fairphone.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>
X-Mailer: b4 0.12.4
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Luca Weiss <luca.weiss@fairphone.com>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The GMU won't probe without GPU being enabled, so we can remove the
disabled status so we don't have to explicitly enable the GMU in all the
devices that enable GPU.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 8fd6f4d03490..29008e155d62 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1449,8 +1449,6 @@ gmu: gmu@3d6a000 {
 
 			operating-points-v2 = <&gmu_opp_table>;
 
-			status = "disabled";
-
 			gmu_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.43.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C695E8A76
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 11:01:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EFFC10EBE8;
	Sat, 24 Sep 2022 09:01:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5003C10E557
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 09:01:16 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id k10so3647055lfm.4
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 02:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=j581I6y16QMywUJd42oZyyiZPcAlNY9LHk2IDMp3gZc=;
 b=slZKdNCcjMHPjl8dcAYUaKBJqkK+HCbSBlMRoNW2Ymp7RhVe4254AvD+Qg9YuNhvnN
 ieZR0R9X9SP9YGkUg29J1B/KfoMa92sPDDbBN+4Wd/2ssGQ+uDB/NAwjREHRU/rEqdbc
 Fu2nGMHJCIso2oPmgNlg2BzUEJjcqO7aMKCZwor64Sm0oNlSjkMOs2pvaB3CE06GoelW
 7nZyvSHQ4dg6YNbg6r8MTWgLie7MY8HoniH0n2H9jGvTryKHn3YjPqaFVUBwF7oyJNBD
 F508jjMKtoK91OjjWzCCdqTda8RCip/zVDSGCwD0bGL5JHrTxElmCHRGTdCZVgcGmRPO
 Rh9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=j581I6y16QMywUJd42oZyyiZPcAlNY9LHk2IDMp3gZc=;
 b=1HMuN0ziICwk84xm+cNA4IIK+mFucRFfG2EOBzWfg++CIiNAKNSfB5+09Lq8eg4jrO
 Sv+gZ48qh55lAdcs4se4H5WaEC66j0Tg7JvJ0uFZGjWdEfaP4U8dXBSoANS1MTlLXknU
 OoJkiSwSFpPT7nQ2kyy498y9WEidFIISIJwNnPZxqIVMEA+gLZg3NFqinCdDTfezUOni
 pxjpUcFXweeY6WojkLN9HW/FufWxT87SJqA/jL7EQuVKR3t8eyx32R7By4Z5a17pcEyo
 9+CxR+3OzI/aXr/N5OSBC+TjfMxDD+rAz+Len0GF8ZuxwjEqRLKIJdUqBax6Wr3Yfzm6
 4x8w==
X-Gm-Message-State: ACrzQf3IuRtmkpW6ZEntdEUK4dKfFpR01+A9NRlqNvNWD0wa1FvztpZm
 1ubC21D3XS1HN0yaLDQ3BP1YmA==
X-Google-Smtp-Source: AMsMyM5C2pctjkWXizfCG6OsPX445JfO6ygaicYDxuyS/bluikTiXUG3Gkw2+vDF0QHKQ4A8xa/0Nw==
X-Received: by 2002:a05:6512:3b8d:b0:499:b113:865f with SMTP id
 g13-20020a0565123b8d00b00499b113865fmr4654473lfv.505.1664010074265; 
 Sat, 24 Sep 2022 02:01:14 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 o4-20020a198c04000000b0049f54a976efsm1830024lfd.29.2022.09.24.02.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 02:01:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 6/9] arm64: dts: qcom: sdm630: change DSI PHY node name to
 generic one
Date: Sat, 24 Sep 2022 12:01:05 +0300
Message-Id: <20220924090108.166934-7-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 1bc9091cad2a..dc83329689a1 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1633,7 +1633,7 @@ dsi0_out: endpoint {
 				};
 			};
 
-			dsi0_phy: dsi-phy@c994400 {
+			dsi0_phy: phy@c994400 {
 				compatible = "qcom,dsi-phy-14nm-660";
 				reg = <0x0c994400 0x100>,
 				      <0x0c994500 0x300>,
-- 
2.35.1


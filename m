Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 876795E8A79
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 11:01:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E9110E557;
	Sat, 24 Sep 2022 09:01:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F71D10E55F
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 09:01:15 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id o2so3597860lfc.10
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 02:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=RKaMREXXqOL68I6N+y+TYA76CR+nfO5iIXlaX8/B/Dw=;
 b=igZmIfL79mdW17lR/C2YwLncV6t1ku0tWIMrp6HpBnlWkFtctSv6j/GWxaZaTkxHGd
 p2tMg4Sc1dKi0DmBdWY150BS31Hssr6vdxid8CbQ0hZSS3jBWPBsm/FHDDfYp7wJWMZ4
 /m/WwNwjEnPm4ncjCRFH6F4KKOS5DeH+h0o4dH3GjJ6bKPyZVlQHHV0TkrMQGV3H2rkn
 PkiaEP+sQUeWQr+Rxheebd/M3GczQJ0rW81qKVyCtYzug23kyL0Qn1f/y2YS42NvKh1F
 ssNxM6vfxbqIZBBREDkHSOLPqer0JFlCqA2bSi02q9evUFNpYRTsla4wcmXc1X2IEdQ8
 N6Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=RKaMREXXqOL68I6N+y+TYA76CR+nfO5iIXlaX8/B/Dw=;
 b=8OGISpybJow264OpJFCakpbZT2jKiGj3RtseouF3BzQb082Q+65qAXrwFbzxzssExN
 MXYZfIUNvy75q1kPcGKYYx4TsxxGh4WgcykjIAYR1dyw59rBvxhf24UgpiitC2Fp0aLo
 9OF0S71gx5AuWxQfAuuRUYMRZAlUW3fc04BaH5aoKRcFcnZ0xhuayNbSnE1nXj9eUVgh
 8uFBcVi4/aAjOW/2QWMHqeOEfrLS5ZnFe0gqUuGz/XdVPENv8JK2S+IUzWb8D8KcsAt8
 ISr9ZJi37pDJI3mU9XoUzSPNo9fQsDc6Y4Vg1eHIQoMD1Kw1UeEOJh5oVOreWilONjv5
 jjrg==
X-Gm-Message-State: ACrzQf17Pzun3ygwIjApQYVNARyANMkCFWYzi0V/30a7zyeCltiYk7le
 7q9fIoe3VuRlXBiBM/1Okqqqkw==
X-Google-Smtp-Source: AMsMyM7queyoTFKENmEVrltMwdGmqrLcCMvduATdgv82zehPA2UC5zICXV4KkNJOsYg1/A1lep9W4A==
X-Received: by 2002:ac2:5cb9:0:b0:498:eb6f:740d with SMTP id
 e25-20020ac25cb9000000b00498eb6f740dmr4631460lfq.106.1664010075079; 
 Sat, 24 Sep 2022 02:01:15 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 o4-20020a198c04000000b0049f54a976efsm1830024lfd.29.2022.09.24.02.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 02:01:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 7/9] arm64: dts: qcom: sdm660: change DSI PHY node name to
 generic one
Date: Sat, 24 Sep 2022 12:01:06 +0300
Message-Id: <20220924090108.166934-8-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/sdm660.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
index 43220af1b685..d102c7e25b79 100644
--- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
@@ -213,7 +213,7 @@ dsi1_out: endpoint {
 		};
 	};
 
-	dsi1_phy: dsi-phy@c996400 {
+	dsi1_phy: phy@c996400 {
 		compatible = "qcom,dsi-phy-14nm-660";
 		reg = <0x0c996400 0x100>,
 				<0x0c996500 0x300>,
-- 
2.35.1


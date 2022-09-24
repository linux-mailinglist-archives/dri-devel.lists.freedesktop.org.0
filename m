Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D66AF5E8A77
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 11:01:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BAED10E562;
	Sat, 24 Sep 2022 09:01:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A27E10E55B
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 09:01:13 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id b6so2371431ljr.10
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 02:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=YdVPlNU92/lP4JY7hPM+wHtAwIaNWsLurZzyiWFE8I4=;
 b=qR8/3dcep19pM3FBU2OrXwuPvn+3G7nZtkRQfXAzm527gwVWZ72MMZzROOCAGReT5W
 FxPbVmX+zQDThX7AUemfpfFy0em3VUgWK9bJAXDQedrIYCGrMA80BFyF7NVAr5fmfefX
 A0Spr+GyyOYBKFJwuIBCTPvJMNJg7FMxl/CaQa6f46GWt8ni+9bt2ZghoXyof8beI9U3
 bZoz9AzAGfH5kpcPIxynJNwr2ZnegZYnqLKJxuC2t9ijpkxbIpoLFinEPG1WunPxe1UI
 z//sY8+DMHkvLBpfyE5E58HTFsikA722S9BfE/giRQ0FNZp8iwxQC4kahSYSHC+jb0EK
 Y9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=YdVPlNU92/lP4JY7hPM+wHtAwIaNWsLurZzyiWFE8I4=;
 b=vGpxjYgQxWO3/0KNlkthPf8ZgIOQE/85rk8LrLzpZEB5tNLHot5hq3j3/1dmjdsoGS
 tIXbyCPMkfRP04VkGoxJ60xw6vKbOC3wX8oeBZ5VLJE3CAulwKZMN+zb+C5URrOpoKub
 TzsWKRjVNP0+8HH2CvC7OJy1If4+P5KUa14LZa+iRiAXZ4oc6SOWAgj7hWPbS9F8MB5s
 up7JEQXCArV+TCmPiLEyGCp9eBzhOU9xq8drYPULO8XIT4KXQILkEq+EoTBLt+nCu1Ah
 bhxtqfZpb0kmZxdaIVX0TA/T4rY+vAKeyMtwdpZOeEHNsG6uRUDobsNgFMggEOkYTf3N
 JezQ==
X-Gm-Message-State: ACrzQf1o+JoMJDjrEPeh3ZwAPJFYwbk8TN0c1owf4PDbArpx5pahmIKI
 gS4jUq+NOoAS4r2pUQH9TiP80g==
X-Google-Smtp-Source: AMsMyM7pFuJLA2EzM7FBzH2SBrVEJVSJDICrDVRgq88SsOMMzcfFDsxVkKdcSU69Q1ljDJ36t4GMVA==
X-Received: by 2002:a2e:bf0d:0:b0:25d:b7a9:8b8 with SMTP id
 c13-20020a2ebf0d000000b0025db7a908b8mr4245189ljr.124.1664010072638; 
 Sat, 24 Sep 2022 02:01:12 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 o4-20020a198c04000000b0049f54a976efsm1830024lfd.29.2022.09.24.02.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 02:01:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 4/9] arm64: dts: qcom: msm8996: change DSI PHY node name to
 generic one
Date: Sat, 24 Sep 2022 12:01:03 +0300
Message-Id: <20220924090108.166934-5-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 742eac4ce9b3..a7d0e5d68141 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1017,7 +1017,7 @@ dsi0_out: endpoint {
 				};
 			};
 
-			dsi0_phy: dsi-phy@994400 {
+			dsi0_phy: phy@994400 {
 				compatible = "qcom,dsi-phy-14nm";
 				reg = <0x00994400 0x100>,
 				      <0x00994500 0x300>,
@@ -1085,7 +1085,7 @@ dsi1_out: endpoint {
 				};
 			};
 
-			dsi1_phy: dsi-phy@996400 {
+			dsi1_phy: phy@996400 {
 				compatible = "qcom,dsi-phy-14nm";
 				reg = <0x00996400 0x100>,
 				      <0x00996500 0x300>,
-- 
2.35.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA89A70A2D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 20:21:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 927AF10E5E4;
	Tue, 25 Mar 2025 19:21:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yBjnEMD0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3762E10E5E4
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 19:21:46 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3912fdddf8fso95145f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 12:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742930505; x=1743535305; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HxvqkTdGvuGSjqhrzVUrIUOoBiHSaoV6cZ2RGP6GPns=;
 b=yBjnEMD0I2+NvYRI52atZ1yJSIzNnafuDMX7ME3rJAVJnkcSsGkpdgzojl92iTufJ0
 eKns5yque8z2jY1lH9WBqUUKkZvptZcmrZEC8kOH+0d9Ukm7NqFN+6ws7dBq8VimQaZt
 tvfvqQT6VGfogzGChDSTzQzv5WX4n/ZGIZzgfPr3tgMFZiCilli8cc0Dw9BnQbwJaEAx
 EsHhy0cjkCilbpF8sN6PzqkCKgZ1nUyQ6brCZLFFrRbiKlgpkazP3+Dv+PhuSdnE4zHt
 jeehZ8u3LJpzV99iQuxrNNOd2wBzdeo2eorQQQ7RnNeqqyhgCPGVhqCAscv+dCTtUjNE
 J4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742930505; x=1743535305;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HxvqkTdGvuGSjqhrzVUrIUOoBiHSaoV6cZ2RGP6GPns=;
 b=Dp/15Pkfg0j3Q0stor/TzUs5+cuXujL+s9cYcYBhilHkRn+Rrl5D4L2ammeD18h8EQ
 Tc22J3T+clY0O7d7WbhORWjBeXolXXHvYqXgKjytSIxOwFg5uwqlACiimmpqgkDRTmUa
 v6S7kJg2WkLkZt9UAMJkkkKLtxGolnTKzaYIwnaTSdq6kHILTlTC0zO6di0GcMR0Frvk
 KuPK2zJXsNzENEI48EQCgaAuQRbf75iR7Pb6zgkLlWJi24f6ujVVLriuNv0UaAKlkPCW
 bRjJfWHAbr5FbRbtYWVCQWF6+aM2OpiU8D3SiJ6UNf4CkowfPBLHdVvaUOXXajiYxYhL
 mtPw==
X-Gm-Message-State: AOJu0YyCUwJvz+DsbtvIDttLukHXOHMzNNr3lIdbLwDWC7c04gcd2FLJ
 6GhHy3nE9Vew8809grr74rUxmLe6QcGbvZDY0HzgCx5gCISFOUMy3UdBdDO6MGI=
X-Gm-Gg: ASbGncs5ACOcitAPNwpVrKBaZ3qXeCZuXmoL6hJRL/vQ9yzFv+UXwuIOkr7/+KiCaHg
 i/RHkgtyHZlCkhVj07eu9YGBGqhc/0VkDEaCj7bVeJw+IFsYdf45Ka6FePM81ObveCYnVVPf3+K
 LSj7gUsU+U7w+H0CtGODh5Hs/sEyJe+zZHzTw3HYt12soyAnO6AN71VHswatNifv33FmJkRwNM6
 5a5MiIDK8/5jq9Ryitg8CST42fYVgyH5oz7vcp64b7R9y1K7/oIEDILJYWQ2829lDwIL+rIjJqH
 rgKIyHWtqLaniFQv4lj6d9mjSfyPayqAEv7Xzivy+H2zjij47q5KOxyu
X-Google-Smtp-Source: AGHT+IHRlceyhZlACr4GcEuFhwMZV5G5wdPH4kkq8OlJkmWPgi9IdR04WHfFTNBmt5EJiPql7Pm1Bw==
X-Received: by 2002:a5d:6da1:0:b0:391:21e2:ec3b with SMTP id
 ffacd0b85a97d-39acc466003mr790595f8f.3.1742930504728; 
 Tue, 25 Mar 2025 12:21:44 -0700 (PDT)
Received: from localhost ([2a00:23c8:b70a:ae01:9cf7:b69:fc50:980f])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3997f9e66a7sm14478968f8f.76.2025.03.25.12.21.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 12:21:43 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Tue, 25 Mar 2025 19:21:28 +0000
Subject: [PATCH v2 3/4] arm64: dts: qcom: x1e78100-t14s-oled: add eDP panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-3-e9bc7c9d30cc@linaro.org>
References: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-0-e9bc7c9d30cc@linaro.org>
In-Reply-To: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-0-e9bc7c9d30cc@linaro.org>
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
 Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
 devicetree@vger.kernel.org, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1125;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=q4tddGAYfNL0u17TA/snEFeNG4/qEjinNjCLGvABuWw=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBn4wJFmq6AL00WXVDlYzrdkH4CzSmxYGmTXpa0m
 u9TljEzfDeJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCZ+MCRQAKCRBjTcTwaHBG
 +EmJD/9D3NOaXAF14BVPpU7PBWUrjNq7cBfm9Bg+9/4H0Sn+syOkiZE4B/CUorkHwU3lRIoJwBB
 6m01gITDRd5Ar9cpudpi6QIVYTINRG5losXPeaYdzQg5kBCfcTwzmDSBL3rkHvbPIE55jmpQ6uG
 ivlQAixqTbZpt3HbMh3odFL/RRdhADfBnMlqH4FdJ0BgcoESYXaqH+hrN3UWAY3dlAR2PGr0PVE
 zFDUNSSPNnWYf3gcl7oxgG9Af7Se6sd5RXHNoYS8nyv7ASL3EHicwoCtnqJqbdzKcw+5LpyGwuk
 dJlROQeTGK3BTzm5K2cfXhXvCgyp3Iw2LkFUysgTmBzZOm0FlE0OPEVDFxbRPVsS7jsnOhJgmie
 qKvxiQbF1g/NWxDVTKHSFraFu1clWl56VxHw8T1D3ivEhzTL+Ihr1/rHtVIZdjjnM5uquI+kQCR
 ButPiDFpKY4GA5yUczVKZFQJ68GHBdkLo53+ukerMEhL1cRDWT+CE0LHh/Wt/uODWfDV1G/h+dZ
 l0kqSSxckL9iUzRRoWcAE+PhbJFvyp56uUQZoN8M2nOdxbB2qisZ8/6vS6tD2K9vpUtUvddBvb8
 ujH+DkS8H+g0EyikonqP7V84j69UQ0WvcMFY39m76Uxvt/wUn9C7JSNiHJo6mtb0J94r7dSJQo+
 YoAeeN6WoYtTYuA==
X-Developer-Key: i=christopher.obbard@linaro.org; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
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

Add the Samsung ATNA40YK20 eDP panel to the device tree for the
Snapdragon T14s OLED model.

Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
---
 .../arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts
index be65fafafa736a0401a5872c40f69cb20cfbbd90..753add73df41050565e71b9faafee62bb2031b75 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts
@@ -10,3 +10,13 @@ / {
 	compatible = "lenovo,thinkpad-t14s-oled", "lenovo,thinkpad-t14s",
 		     "qcom,x1e78100", "qcom,x1e80100";
 };
+
+&panel {
+	compatible = "samsung,atna40yk20", "samsung,atna33xc20";
+	enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
+	hpd-gpios = <&tlmm 119 GPIO_ACTIVE_HIGH>;
+	power-supply = <&vreg_edp_3p3>;
+
+	pinctrl-0 = <&edp_bl_en>, <&edp_hpd_n_default>;
+	pinctrl-names = "default";
+};

-- 
2.49.0


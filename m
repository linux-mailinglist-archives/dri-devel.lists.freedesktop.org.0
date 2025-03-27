Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C94E9A73778
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 17:57:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21DB310E91F;
	Thu, 27 Mar 2025 16:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mTKjm8S9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C45C910E927
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 16:57:13 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4394a823036so13088595e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 09:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743094632; x=1743699432; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mluwDyuart7Fj/8nHrivAiHFnq6wOhPI8aN7mFHwSpU=;
 b=mTKjm8S9QTrqNIkkHLUWpPCl45OXLSLYIre4A9jkac8bGIStt8wAmzZDTtATfcVXO+
 y5B4z0mN6v1glULLF/UQ8VlvMd/hRRnxsVecwVlDSAb9cXBgsIgcPrX50E9mykXYdmXz
 JpXDKSL9shicnArdSUgZM8AZ/CtwgmMO5mU+QiMXNBwZCE9z/t0YMV2/2Simg09xNHO3
 Y5HqTlJlvt89fWSwxVZHqFGNJt9oAVYAatgjilCPpC2uqUG0QH9VLjBq90KwAHR+iYxO
 OzC83DXZEfGx4J3SiPoyF7CSYdKmch8hlK1848s8rEYyQWLINNth7U0HE8cMGr8imWPi
 UvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743094632; x=1743699432;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mluwDyuart7Fj/8nHrivAiHFnq6wOhPI8aN7mFHwSpU=;
 b=Azai2Gf6pPRcinC2VNhG6Jl0kPlHmjBZZQ21su+Asr5gbnFwnUrY+NtRAMbLYCJ7RU
 uWzjfRgEf554XsItSvTi3GnOaXNrZsGu9KfyzE1lW6ApN+XOgZOS7NzP7HkSQi8uDFG3
 X0hONwhkOXMLN78uEAL17fla5/1/G18sSI/yRFewV5a3f9P7Gg+5KblQK5I3eVJcGklK
 lfO1izKfUoIPMEgeSvuU6rkKEDd81+R/tpWgUkfgQSMYJHfjitCU8QdwXqI306XB2+In
 fO7jJ0PuFWb+cCI95MHW0aoR8dZAOiDoq9943z18m2tK4CBBR/GA4np9P/8m2buo5wvC
 +3Ng==
X-Gm-Message-State: AOJu0YwuPJH56rK0A8siR45A9lFVlv3xqWoYBqMkhExTwd9+H/OoqbMq
 5KvslIzxz9UuXI/RPBeJ0pO4K1C2z/XDG/7oKi5CjkF1cq/mwmqDDiVJcJbnr0I=
X-Gm-Gg: ASbGnctIyvbEnjMFaAAV5QG0VQBAtXnjU/1XP3Dq8S8ZFmcErkTpk3fOGB9HznKiHMd
 Byszrf/EruyUPLcf8YeN8r+MZ69PUo2uSbQRNPj4JQtuSM8/7pHKe5LHKM6odo9BTg7rWd4rkQY
 Z3hXTX2lbFqWIIqhvAXjq4TH1dmCJHDApUg+jeKNAZj/WldWQjWjnIT+fcjdOBbGeI+wP1cYRj2
 El5JVmMgJI8MIY4cmNOGQu2eI/Oqeiq1oiKPjr+UQIaYVkxWKxOyVPPxxlkBMWAfhUQEhKY7VGm
 QcfTL59c2hlxB+zFPtKYMFxz0qkr8iAYquq/Vs7xOaIXhM+o991+L8EB
X-Google-Smtp-Source: AGHT+IHFKLKUDx3bf/Nrud35EUvZz/B+9hO5Z7cPlEtAREYQimYT1rwW5U9Kqesuzw76jBJ90BPzbw==
X-Received: by 2002:a05:600c:1ca4:b0:43c:e7a7:aea0 with SMTP id
 5b1f17b1804b1-43d850937a4mr37060565e9.26.1743094632171; 
 Thu, 27 Mar 2025 09:57:12 -0700 (PDT)
Received: from localhost ([2a00:23c8:b70a:ae01:9cf7:b69:fc50:980f])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-43d8fcd78bdsm605275e9.24.2025.03.27.09.57.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 09:57:11 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Thu, 27 Mar 2025 16:56:54 +0000
Subject: [PATCH v3 2/2] arm64: dts: qcom: x1e78100-t14s-oled: add eDP panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-wip-obbardc-qcom-t14s-oled-panel-v3-2-45d5f2747398@linaro.org>
References: <20250327-wip-obbardc-qcom-t14s-oled-panel-v3-0-45d5f2747398@linaro.org>
In-Reply-To: <20250327-wip-obbardc-qcom-t14s-oled-panel-v3-0-45d5f2747398@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1042;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=TXeF8ENNskUDGwF3cvjKoqijZfLRyaaJUxKZNZISbrw=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBn5YNmkynQR9xvi5h2y8w6vWoFbs76NuH1fvz3i
 GskKbStz7eJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCZ+WDZgAKCRBjTcTwaHBG
 +IU8D/9yokKbCBHJN+OPAwndry40zJ/POSNc0542KHetrFdYUYQNLJzpj+YwBDOg+ovXAlySkjv
 WqrBOtvZnNHXpYybHU77l230G3Z9owCEFgpi8c2H6TGFv8VVQDzpKMTArj5qDmmOGLwlII20wBS
 hdgH2mhdFyBx9xb6KMy9IasCepzg1DR4jsu1Iu+LLrjIdnmSSjkUyZoCc5aCFwdAaqnNnzh/TqG
 Uc4pFerI8OvSRuc8WpJ6iWi/DdK5nTSQQRERqe6kYQDtUmcga7zdmTXPUCZUWwI6jV//jCnF9W3
 ple//Q4Hk+Jymi3iDcn0vCeC6LY7XC2EzEx5ZO8IGqCG4oDN9AHKvDg3UeyX9uHlm+AnnBTgL2O
 Avcl6rzFfKy5fbORpQ+Yt/vN0jY0ODr3mgUwr7xvAmWufAukixJ37en5GXleNq1OPtGlenM4l9r
 mgRUoFAZ79HgLuSIrww+N1xBaOQL2Yf1BuPiI1IF4LH9rcwh1haHNfOkgk7GEvgbQB9IO93C/Yo
 q4j133sKZhDstXmrqe7Ss37XSFumsIc6Zw4HBnHJnL7LT6GtTESqSzryB6LkGizHUeJ4KGzN6nq
 LpL0l1PWqjsBt++CINaQf1/AZ9PzRUKK4jUPi3tLIqA8Tr/f6vf8J2BcCZ9kr3APVeKpr/xiU2u
 lpGwSoVvsSi1YcQ==
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
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts
index be65fafafa736a0401a5872c40f69cb20cfbbd90..9a5197dcb2651c22f89e98cf523682bff17e22c3 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts
@@ -10,3 +10,11 @@ / {
 	compatible = "lenovo,thinkpad-t14s-oled", "lenovo,thinkpad-t14s",
 		     "qcom,x1e78100", "qcom,x1e80100";
 };
+
+&panel {
+	compatible = "samsung,atna40yk20", "samsung,atna33xc20";
+	enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
+
+	pinctrl-0 = <&edp_bl_en>, <&edp_hpd_n_default>;
+	pinctrl-names = "default";
+};

-- 
2.49.0


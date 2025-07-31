Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13172B1775D
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 22:51:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2136A10E7E5;
	Thu, 31 Jul 2025 20:51:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="U9OFJb/W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F28A010E2C3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 20:51:38 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4589968e001so8529055e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 13:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753995097; x=1754599897; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Zf/LNXjHxtqIC/Q118TLyzaGDDqd8kl1KqYbnGndGhE=;
 b=U9OFJb/WjxiKMFAVcXJSLX87HDMQgJPCwqjBE4/HpHgUNurztvAeWudV6DQvcOOwNA
 oIJHb/bByTE4pPdoaGEEfhQ1cEJ4cMRNvFVkpMIARD5hBkQ3qPVXKMSWnCpq7G/cpOPJ
 3B+m3FDgbLVljzhgvJSuN+lhESWrZxyijtwteYT590Nl4QSrSJsAVgWMcYwrgIIXc8oG
 eyPWPWumSh/kFCkSUa7PWZKxBDN0dcd4zD3Fbbz8deWtkL6yW1O8MAoeJgwbFkfOt8AK
 S6JiPS6AI9H38iDgMpWx84ZF6dElvEjb9uKQxAYncRdJt8YkzaNwsYSIOtVcSMpzbkH3
 29nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753995097; x=1754599897;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zf/LNXjHxtqIC/Q118TLyzaGDDqd8kl1KqYbnGndGhE=;
 b=dmJ0RKngIPwTqB7BAB1uuPxJbaQF5YvVb3vuf7laQKP3G48lz0yQrl7woPHikFfhJr
 hbod+P5XA+e34HFgyeNhyXEGYFstdHRgX45uYr7K5H1WNSAP1uT8J55dXI3H36PHlATL
 q2LmdOHWtSB9XbHNHHXLoNMffsR157gwTE6dU/LODkidcKQWDRZkRixAixZZThlvHOvB
 8EWsrUpHJ49ynFty2iS9E1HbPy/NO9BZRnVkh3flAik5/iNu1PA9db+yz5mce9hlmQOY
 EH1gHCKrw5lLv1XwnMDOpH2ByCZmc8Bu8yv0p6Q8kHmMBVeYO5C3rhpsUxNlnn1NoPDl
 Loew==
X-Gm-Message-State: AOJu0YxF+lZPd0s8gww0g2dW4sAE1JYPRbCpWhKWmU2Dfj2XMh/mqPeU
 EdFHEUPOMVTT3a1xw8hM0KcdSYj6OHv1mCQ0XR2mPnQqYpLoZepnZhTrbRtGKocOwmQ=
X-Gm-Gg: ASbGncvs9O1n95HgCU+7BB5/T0c2i+UoXu3nPJJkysegSd8VeSXDmWMuJuu/sgMiyrM
 P/lf0BFul4hxnJNGTf/QvTwthgddF2JOWnPvd2IMffZvIL7+i+8OOm6O82sKQirL0FStBqoryhv
 5TR/tSAY4SKGPXGOvDoQucuzwPQc6mu2NSDIAuHiyHv4lL70+aTXK0KXvCqcFFcH8BwKRomNptK
 grEIhIW+uFb+EQw0l2kyQrcSoC05XuB9hLdD7guA2obdil+QJwtLin2OOhnYreJEeWFhQv7xUeG
 LowQXW2P+yW48EfQzeOYhWz6ixdCv4SHSPKZrnIBBb3IKaHoE4hwKGm6U9G62GiNyz8+Wk9n9S6
 LMqkjouGgZxGqa/qXnUzprW9OfngGfUvDsy0mFlZfnurs6+pWXU+VegmYwYg6fo5c
X-Google-Smtp-Source: AGHT+IEBtM9baJ05rMQ8rmvvoHC3YitZQWp1OkVogVqW4nzyS+HV7tOa2ALIi9aP0/Okii1jJTR8PQ==
X-Received: by 2002:a05:600c:138e:b0:456:1824:4808 with SMTP id
 5b1f17b1804b1-45892bdf9admr72814715e9.32.1753995097349; 
 Thu, 31 Jul 2025 13:51:37 -0700 (PDT)
Received: from localhost (dsl-217-155-193-229.zen.co.uk. [217.155.193.229])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45895377b3csm77261535e9.13.2025.07.31.13.51.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 13:51:37 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Thu, 31 Jul 2025 21:51:27 +0100
Subject: [PATCH v6 2/2] arm64: dts: qcom: x1e78100-t14s-oled: add edp panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250731-wip-obbardc-qcom-t14s-oled-panel-v6-2-4782074104d1@linaro.org>
References: <20250731-wip-obbardc-qcom-t14s-oled-panel-v6-0-4782074104d1@linaro.org>
In-Reply-To: <20250731-wip-obbardc-qcom-t14s-oled-panel-v6-0-4782074104d1@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1020;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=TzJ2JmpzdBdudyzzf/p05R89SsWQRe4dz/J8/0Kx2Ug=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBoi9dWGuoo93gmwB77kCPGYwUlsY9B8O8a6EL6V
 hiUNrfCis6JAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCaIvXVgAKCRBjTcTwaHBG
 +HVQD/4uG2m55fMJmbjfHg8fX+MUj5tsHp2hIHNB19uXmOC2pXqHksIZXlWW/vdSEWRUn2eQnym
 p7mQYpuoIyl8Zl8uxd+tjz6mY1tNabZ3nW8llV/a3hiqrCK3CZ5fkWtcG1f0Coe1Miyc9y3gPbT
 cqSq6w4+btRyy21R9x8yF0acSKX0RU+SlcZ1oXqAiyS/j3PNItTTzeA7L5YM4ggtMmn8XAo6B6J
 AWpyNOQdo164fGka6KOkvCyPkNmGkzR9iLJOEvi4pV/gZbNJ7F0QT98+ReLcwwZpnwBfSiFXfq0
 JgpU2NHwEPWKZV03M7bN6x7k35IPYJPJIk60uyZYgDW/mm14qezyRD/WaxLBLeymT0FYQwiAelg
 WvpBlopfiUdsjNmeNazTI15wxNQVDWiN92ffx/DTGdamh8QnV6zXgpJavERvu44ujbgc76Z1Aln
 DyeOZp/Tr0YP1SZrQD6puIC1a1BZQgZzSdUMN6XQrRCuHJ7s/twRjRXoQp6FG90m3ZnAY1WH14N
 S/mtw90dpoUFCL7nbs+mKyuYBqZ3R0Cam97xCW6yvXeSZUuDCTzIdN4DUtKhixvv79huUee2zrh
 CIO4s33To9p9nQfJ1BOhojulPP31ZWjDHzfO2twdbi55h+RqHaH/j+57RP3KrFaYCEm0g62hZ6Y
 IOOb2OFxwOjqaLw==
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
index be65fafafa736a0401a5872c40f69cb20cfbbd90..d524afa12d19b2a6f22a24b9bed6b6b40248375f 100644
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
+	pinctrl-0 = <&edp_bl_en>;
+	pinctrl-names = "default";
+};

-- 
2.50.1


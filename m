Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31455A79149
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 16:36:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA6510E7DE;
	Wed,  2 Apr 2025 14:36:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MRNhpuYl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D4A210E7D9
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 14:36:41 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43cfdc2c8c9so38803745e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Apr 2025 07:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743604600; x=1744209400; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WlNr7s9//ER/SikIA2XjkSmK+up9sy8cyHVWwjM89l8=;
 b=MRNhpuYlez5aTLyH5JY2svSTtggvPwkDoKhssQnAWOibiIW1YYR7i/eyHBtVV9kbJD
 /QfXX2Hz4VkNIoDTLtHyFzLHrcL3j11n2ioRUtb+6sZanYnYpOD8pHwZ4zYh7D6hxz/1
 otZgqVrWQ+Eu8tGxb5CHsL1zVwE8VHuSqCN0Pmnt1MtMihh9cZQXYKZXgHkMoh62g0fF
 J441IDD5kbItitm3yRRZKTzm/4AYtu1OIqROOuUvtn/iCjf6AYOk5PC/+1iQKI4zS7NK
 tjzyJFIShJRiixUeWjdlMQVJzvGW2tfVRsjK2YqDM/BQyg6hmzm6RW5jSUILQ9YkJI6o
 YpEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743604600; x=1744209400;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WlNr7s9//ER/SikIA2XjkSmK+up9sy8cyHVWwjM89l8=;
 b=D0s8Fle9BKSfteHjyYPqR1zyAUWvndmTUQJUSxYUiFM3dJrOsPzvefgZZU6m4H+g5a
 kw6YB9jdlNa3/PeW025f9HmqxexVhK1h50sIo07lD2CkQ9F57yijpoHVJT1u+HKEHCw+
 /zCiG30TY8O2gW80G7sHuIoJNpKQ9B8Zrmbt5Tr5SRXj7o8n4Si6NG2Pb6rWyvCxC8V9
 5N96dDqC+iU670PztNs42a10vpYy7W9exl65irEF1l7qTF1f/xolPRRqD+xfPb6h1+TG
 CqOOXsTxWUbYbkUPzu2UDVe26kRNwH9HnS7w1GWcMDSnYJzoxk229Hvu4DVTKldVWblu
 HH/g==
X-Gm-Message-State: AOJu0YyRy96KGeP1mwKeV/XHHvn+owNL3Ze1Nmm2IxKbE4NqJw/wMhEN
 WdrX430+gB6/+Xb3ndHibxgewsfjDf4kFNfp93D1OWMf8LQYMLhPpwb+rajrMsM=
X-Gm-Gg: ASbGnct799d1gxDLFQ7YSmIfayA2bYVuncgJk1U68C3VdmQjA19KWcWsgkvFcrwv+JC
 kGets6uvYiI6LBA+hgSyMGktEUiG3j69+kNOu499LvYEHKz9HZ/DRMjiHablmVikLDYqAN2ryYd
 QHETNPlzE0QS1zSjvW+COKYqBDYGH0wjYZmmP3eeW+gvg1eBiXq+PBycfsJBvD9ZlSpn4CaoJKz
 r3EzKZ2CbM/KiETIoijLbdiIyuFguLNvTzdmdNeZncO5siBv7L2OVrqYrij/05on0aiytOdaoR6
 1SRs+ZIroUMoqyAEkG1w6tOkln6l10c8ZeN2bg5m/iYvJSzZjHzFAjXB
X-Google-Smtp-Source: AGHT+IFcoBoCC9BmmEOzMP3U/FDnU+7IhugBotKCAX7qSMOx6S3uyBr/tGFAZRODEe1ztN7QMsfesw==
X-Received: by 2002:a5d:5f55:0:b0:391:22e2:cd21 with SMTP id
 ffacd0b85a97d-39c297e41bamr2609766f8f.36.1743604599866; 
 Wed, 02 Apr 2025 07:36:39 -0700 (PDT)
Received: from localhost ([213.215.212.194])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-39c0b66d29csm17396769f8f.60.2025.04.02.07.36.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 07:36:39 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Wed, 02 Apr 2025 15:36:34 +0100
Subject: [PATCH v5 3/3] arm64: dts: qcom: x1e78100-t14s-oled: add edp panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-3-ff33f4d0020f@linaro.org>
References: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org>
In-Reply-To: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1087;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=NM+r1eddNSJ+PhsAt5mpIMaaO5aqtw1lqIQpoUzxeuo=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBn7Ut0ZIzB+XdAppA9QOZwn9n08ERbMN6V7fJpA
 8Wz4niUuIOJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCZ+1LdAAKCRBjTcTwaHBG
 +J6YEACTC2p9NkWyqoxpsfbz8IAmvp9I25A0PJ8pwu+woG61rttN5y0Dbq5kye4TA+O64PyRgMm
 4Jb7rcXJxkvK8q/+/ZEH2ZgUER8H2sOXLYvmmqKbqNzHnURqGHahQ7okHtiavXEs0HVIB9KTQHx
 beTZ7pS001+OWS0Dtd+1TtLWnQbqK0wr0DID1wKN0Sw6kIIXGTwzEA7TGw5wzOfqxiy6EuimjSc
 enu/AZ7oRhc+0ksmUjEvlnwo+DehQ5r1QIA0d0ZF2x0CK60zx6YH7OrFU+y0u65xpGckL72ljCZ
 GtmMPsdIyKoJWw1B9vnFZm371LQN8SKeAPQr2+DKLyY3eRN++a338cgsvakO3YqOEKxI7PGjv4Z
 EjSW5iDSQ6TiCD+Ljwhl223FUrZ7rGtd0ChlctmkW3GjuEw8cBcv8r012oM9kp5BlzV0X91g+SB
 2JVtduFeu6MOhK7liW2i0m2l188EkvEju8T9gfTLmfy3ux03W2FnmIF8QkMnXnsJrtkfpnRldAe
 zaZM+YCPV8pRcjuq4uWTExmbFKHQkYeuYiL0hxsUI2EWbSd4dG2tum7RSaqIWo7G3f9HFcIVUIw
 nO4nJlY82B8fJhUImzNkkULIrXBI70WtYrzOC41CYzgt/LQCg5LVdp+rM50Ngc3WpOpj8YiGPkP
 nk9FjQewWQBW4rQ==
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
2.49.0


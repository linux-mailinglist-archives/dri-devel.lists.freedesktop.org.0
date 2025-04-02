Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C58D5A78BA2
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 11:58:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4681610E3BC;
	Wed,  2 Apr 2025 09:58:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mIaFWywM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5911110E6F0
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 09:58:48 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3995ff6b066so3740424f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Apr 2025 02:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743587925; x=1744192725; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=utN0oqIDcrT2zxK1IDRytgewtc+C2bsT6oGkn2JxGrw=;
 b=mIaFWywM3tPC7ZgJs0Z509KnWf6NjIPD/HxuOAEeeOv9PJUSrQfEhtWVAHTrelyWyB
 sEfu97KnZf8LaE9Hyb9Hmf3PEymaEeTrewxWaI0S2bMkaxmLoZo2kZ8N5jg3J0ihpQYx
 fyQE1l3B3KpRhA4ZPXxtjgf2rQObkXQKMHijLLvx39G3BDkFEScdAR388PGbwQQx3rOi
 jxkW+qcN2IiT8VGYfi+AhcNizdgEQGpHZBMuS9EsP/Q0Bqx4yltsmQJO574kbPjzS0Ub
 0BU1cVoUFL7DU6N1NmmyjqOd3a/zFvuaBJmTzYJ1st5EmjMEUr4xScSedWoIfBULXDXM
 aWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743587925; x=1744192725;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=utN0oqIDcrT2zxK1IDRytgewtc+C2bsT6oGkn2JxGrw=;
 b=qkUQGprGsfd7eXm0W9/3WPg6bSd1FUqVsMtZT193l/KvQQkaQm/o5wO4M9/vZ1dsQd
 H27JATwe13tK2Bs2AHMBU7+ChzBI4TL0rQxUvbIqTO/K5DYAbfglIMfS2XeikK+ahdI7
 LbB1X3XhfmNo4yoPT1oZBQgnKmvhV9FmzRMzSRBoHbgczcI9klUgI45GNNjMObG8Z9f5
 UJdRAstz70YKSCPmG4hljZk8GhAgqa3v8HLTeLnKH/I71MVWUGE4VzigqLPQzcFP+1uG
 JanUZvLQChnZTtxQM32RKnh28tNgshzRy8lqydMS4QLewzqbYKLFczWf0u8Ln2YkbpEw
 jaFA==
X-Gm-Message-State: AOJu0YwAXewr+G0bKwzswgyJgvmaWPSRsNQmsYk5MP16SanpPXQumJLX
 /yBo6+ITNXdVabCmmYaFZ2GBTqADkcnZ3HWryvldJeYZ9CV4NW7otuyc6lrgZFc=
X-Gm-Gg: ASbGncvQs2mPBc3VZ7lQTomtqEeJ8Sa22w0TmR7oLw7ixgWaKxDvfr49vgVWBboKZvl
 VbWc6OtqPgdD5HytEzccVAQinxhqJ0RhqWWssCayIvaZAKKbWUpcqJYlMXzE8w/z7GYBQ6U23Ny
 E+3glEclLNt6RaGdysaAUyVZ/Wuo1dMDxJsz+4OLdk8atysZKJuXhddes6CvdL1AxuSAd9YpgWd
 4TSrXixwrauTV7+PgEttxzTxBq0pqU4RIq7dJL0wVllco/YIRnc5rIf+unNF0YDQ6Wnmim8Vvce
 NZ/1Yn6zkTxv2K43hiWoQKxUN0dkw5CqZQk7dDEX5S4Hx5K5cJdEV/TF
X-Google-Smtp-Source: AGHT+IEOQi872DGX/BWG/7PZr47mmBBiyqaeCfOJjhbYXULx0/oJQFipZz6WgGJyguMaUHkybYGruQ==
X-Received: by 2002:a05:6000:40ce:b0:39a:cd84:a77a with SMTP id
 ffacd0b85a97d-39c12113939mr12073691f8f.37.1743587925158; 
 Wed, 02 Apr 2025 02:58:45 -0700 (PDT)
Received: from localhost ([213.215.212.194])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-43eb6190bc4sm15563475e9.31.2025.04.02.02.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 02:58:44 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Wed, 02 Apr 2025 10:58:32 +0100
Subject: [PATCH v4 1/2] arm64: dts: qcom: x1e78100-t14s: add hpd gpio to dp
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-wip-obbardc-qcom-t14s-oled-panel-v4-1-41ba3f3739d0@linaro.org>
References: <20250402-wip-obbardc-qcom-t14s-oled-panel-v4-0-41ba3f3739d0@linaro.org>
In-Reply-To: <20250402-wip-obbardc-qcom-t14s-oled-panel-v4-0-41ba3f3739d0@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1276;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=hotZmPorZb9jdirRsPwukgzloHcJkty6Am+HrOSlUd4=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBn7QpT8Rj3nswbju+q78Oxs8w0VOLDQ283LKUHD
 N8EVUpv5Z+JAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCZ+0KUwAKCRBjTcTwaHBG
 +D1EEACewDpImJIERkGTNf8Tnlx96rG5Pmvg98xt6EJOnyPnqlDKRa4HQyl3oFaMClcdGiaqX2t
 m5r39NWjQf65zxUHfI6QRF7zQx0EfUQfcJ5ZQXexn/spNZoWHown39IqGkKUIjMb5rMuBx1nHF+
 FknHSf9P0QcmzIkg1x08qwCgsYPbwOOyCkPcojYofZpCsvPExKsvMvY2QGnIsEP0xUg4PpY3wND
 jZ1AuF9FEpZ1TeXFwjq5gQ2iWg+20JXaJXAYRNKZJTamRE1LgmfFfwIl/0KliRKxI7MgIqzSQVK
 Qxxs4q0V8tMlkmqCBDl5A8PFtPsS1uKSSBS4yN56c7M8PaaZJjgJ5gfoCkjwWdAn5y9KVWx9rI/
 RpeXHeTgNGQOaYZzG479n7xeXnMevLNqovQwPaqdTb4o8ybKkMv4pJt1o+MOJqXUEKLMETmlt5X
 yJrFBkBdCRqnjCQ2GFwu/25fff5O0FaeBPKoW35Ps1HEXSEAIf9FCqxXI/+2GZ4E2miyr0qyuwI
 25oA9fCTOjSQ/9vHBd3AYryIi2VbKj454jGcg6PoOheT106Fje+HkI+PIl24fyy2I9vJ2FAmHqQ
 pHi5CnWJcObu/sjaK10OyMimQ+br6QMZs5rdjuWdnlEJ/B11oj+D1oUSPa/eP/oKP1mCEb+I4fN
 jD8kmL1/70sY8pA==
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

The eDP controller has an HPD GPIO. Describe it in the device tree
for the generic T14s model, as the HPD GPIO is used in both the
OLED and LCD models which inherit this device tree.

Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 962fb050c55c4fd33f480a21a8c47a484d0c82b8..b0dbe4eaa77e5a6f862fd0db2a3c91db2aab5030 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -975,6 +975,9 @@ &mdss_dp3 {
 	compatible = "qcom,x1e80100-dp";
 	/delete-property/ #sound-dai-cells;
 
+	pinctrl-names = "default";
+	pinctrl-0 = <&edp_hpd_active>;
+
 	status = "okay";
 
 	aux-bus {
@@ -1215,6 +1218,11 @@ &tlmm {
 			       <72 2>, /* Secure EC I2C connection (?) */
 			       <238 1>; /* UFS Reset */
 
+	edp_hpd_active: edp-hpd-active-state {
+		pins = "gpio119";
+		function = "edp_hot";
+	};
+
 	eusb3_reset_n: eusb3-reset-n-state {
 		pins = "gpio6";
 		function = "gpio";

-- 
2.49.0


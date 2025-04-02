Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C044A78BA3
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 11:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0590E10E72B;
	Wed,  2 Apr 2025 09:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="e16DTmPO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C05010E3BC
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 09:58:48 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-43cfebc343dso48387785e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Apr 2025 02:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743587926; x=1744192726; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WlNr7s9//ER/SikIA2XjkSmK+up9sy8cyHVWwjM89l8=;
 b=e16DTmPOFruXl0jm+khS9I61IUa5M1I1S6qEdSpx6cgoPJFOA+tHQpKDF9YFKp1Gak
 4E/g61+gJQucP0qfFqPyuhKEo8WV7zhkh1mM1gr6lXI9/+VCRWiLeSMS1hjdjxoPZ4Od
 JDcTmtjX28x4ISfE+i33WeIXqY86RTZhoabJcCRxxPRarBAR4XiqEreMPqUYc9uw1kB7
 6MC5BWKDVhUBDq7ENyIYl/e2iZSMOKotvQaqYcPUiqEiVt1R3tt15tqSMFtu1YPINAwP
 kslj9NaRNqO7N51D4ypkDxaGrDop5hygrou1Z14kx80PDcvE8XUsUcWb4XfMgwyNovKN
 tC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743587926; x=1744192726;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WlNr7s9//ER/SikIA2XjkSmK+up9sy8cyHVWwjM89l8=;
 b=iPFREDaeRv4rdVr3QJ3psRupPaY79mh6/FsPJEK6Ap8ckVbgyYNUUcZeXc/aTmDpI3
 5fat+LOo7jkGucPZ83vYS5mKfzRFdk8tAnP0OLBAangrhZjyemBYMuBQ2lvYcnMAQKiJ
 FBIMF2b3YPtCPEwpTFN8g07Fb6yR2xM7x5on78k6lyaOzmVqa4labx96J8Kh9Hl6nvQp
 mwl+sTFvKxTCJU7QY3LnixExM/DKgCBZ1OfrYg29qLL7DQylbBMvB12cyMUQpIEe35CC
 ZslhnoQ59cmgICM1hFU8/Ogo1M436BjkJt+BNMSQ5U2E74Z3a/AQjiiYVDQfr0kSOJYw
 5Opg==
X-Gm-Message-State: AOJu0Yy3OxylZE8RLP2jj5Fz6WbWqNXlYRDYoksYZ/qsvEAnGSJzNvgd
 NqI09nfOx8UJWSn1RBjWDepU8Pu4Azjk9MISQnIieDcGY0bKCa15QtyOuEboQ40=
X-Gm-Gg: ASbGncs2z+HBx+DANoLDvcf5EJGE1JXJGEt3Q7y+eZSyfofSJ+RrWH4AlCktgj41nob
 mpz7GZfx6pCkuZzoxxLu1+2iKTF1OXwvc9eL9MXgilJ1cCCGNSkadVFkyTNykdiYXrLI/VWDBBC
 p1A9GxC4uIiAtN4VvUmHmELLPHu1/jNsWGvXL01oPJrZWlPo67nYgg1qoD7TPe0AViO3dQdGOm0
 VG+PG9lMmpTrNFnkN26smQmkwozY3OkJkStLe+NNW9PnuLs0253Z7PR2114AB75M42Lt70msBf0
 Ao2U0D8/SqYZYkQAOr+LgiRxYHj2Uh7r28FsWYtJOa6ltDixS6k3FDRL
X-Google-Smtp-Source: AGHT+IFTrd+aG1QnoeDWN5Twws3fGm4IGPhSV3zclRttiqm7JC1zigHY/sr1x2gYCsORgZ8e0lDQ8g==
X-Received: by 2002:a05:600c:68a:b0:43c:f4b3:b094 with SMTP id
 5b1f17b1804b1-43ea9f8dae7mr37628625e9.6.1743587926052; 
 Wed, 02 Apr 2025 02:58:46 -0700 (PDT)
Received: from localhost ([213.215.212.194])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-43ea8d16d35sm34705285e9.0.2025.04.02.02.58.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 02:58:45 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Wed, 02 Apr 2025 10:58:33 +0100
Subject: [PATCH v4 2/2] arm64: dts: qcom: x1e78100-t14s-oled: add edp panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-wip-obbardc-qcom-t14s-oled-panel-v4-2-41ba3f3739d0@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1087;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=NM+r1eddNSJ+PhsAt5mpIMaaO5aqtw1lqIQpoUzxeuo=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBn7QpThFC4dZp45FqIClVwad+jsKVUrk56+VO/Q
 SuTYwy/5FmJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCZ+0KUwAKCRBjTcTwaHBG
 +Ml6D/0b9LsPEQpFxaORUDI4PxBYS0vegaZinECmfYatrMEJZ0CRoesXn4RqP0Rkz8O1l+VdZ99
 vRmgfsW0Gxp1qRzh7oxa6sEk+K5Hk7ufI4Qig7CntNHwZwfkqW3+jos1MTZypwEGK3CmpjOoPNx
 mnnwxfzaOzUxtu8iuKdI7fGFSXYYQnNGlggPuW2NkKHwuM6juYbGvyrr7Bs0L1DPiF5PpDA53sr
 V56jVUWnss6DVU4pJ9v1vsiOpJpg9BVtH/6D07SJ9o8wbM0pYair+IfFdkLLvOidUGySWODI8vm
 7BScqTbK6wWBpoxSF6q1nuZOqYatUDUHF37LBjr6A450gAcTbqJRpk/PQkV2YNkoUiOll49GriQ
 5FwnWfq1AAuRBQS/CoUrVhUfVwlLh1WIB7wELoflpqeMK7ErAtd3b6pcRle5U8m4R1RnFepnUfp
 qnOeFQDGX1M3wNQn1/NN86UR8XZdOhJjf3ZRQQqQ+fBTel/uBb6TMhJluZzU3Zi3D8UuDmYMvIg
 LXpsSwKSCJ5zcMB1oP2zL0MDpRy58QWFgg3nQMSX47RUY6RYvXfU6Qp9uxEQCNOQnVx/CdgZyz6
 dfRrpSdK724AJ6HvUuCW4jPS+ZdI2xc8NqjpIe/i21nws4gS/pO6wemnISaryic2YzSxoIqOxrZ
 XjJZSTNiPXOlmPw==
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


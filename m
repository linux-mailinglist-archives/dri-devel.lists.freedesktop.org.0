Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD93947FEB
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 19:08:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B2C710E25B;
	Mon,  5 Aug 2024 17:08:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="O+G5oL/B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB3E10E256
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 17:08:18 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4280bbdad3dso72949105e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2024 10:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1722877697; x=1723482497;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pf/ayE1GI1WAlEGzaVo6/9gInOblIFTdfpLa3Fxp3ZE=;
 b=O+G5oL/BJUDW7XIAmdoMNhq6em43LtDGjMBf2L1Dl6VLFNudTu4wQRCvRsWapCZn6q
 T49GheWukRd4dawSw2EhIT/ooU/3x822o/yrx9c3CcBRLoJvjnBHB5PMK/Q/pf6SR3Jf
 LsFTLRgX7DjAvtJm6osvAKQ0uZxvJm41ZPAlc3X7t34dThypNcCn+njlTBY0YoNi12Sv
 C4Z8X5G3vvItaSR7BIKgz0SvWEpjoZQ41WIiKrKv3rlHiRq63wcdcin1bLbk5rOzlbzU
 k1v7cYXsrEzJ+4n2Y3HpHpeLIzjhHYoegqck4PU9R/cNWNgWh3hCG9RzMSWiE64patiU
 0Wxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722877697; x=1723482497;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pf/ayE1GI1WAlEGzaVo6/9gInOblIFTdfpLa3Fxp3ZE=;
 b=qTAuiRWevh89ClQEvp/p7NphdGZpj+0dNm/ZqTnT9lWR9KOuiQOyldBaTpEzjTvrvG
 LBU89VMZRwPfYkzWq2OR6a7sdNO8Im1bpRFABtzkuyypzp+1/Sv2YVRtvEuUlo3qGCHQ
 v5AFmsHjl0Wh0nbmRWCJmp9pXxTkpdzkC8/XmMtkSndg1siFZIEUVfDYN2v/CD4DU5Im
 hkbjNZPkajz+afQSYfx1QONOkl5z8mGDMlUaZFWjXEUKs4YFMT6oautwz6RFrTIz3eI/
 fxXglQYufLTnHdVB2bqJO9EYIdsa0vbVkEVnAHHqnZ0P8rotj1HuFB1eVHzV5A4Vcf/+
 nfYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlYFzfnVvP8uu7te34zEUt6szMmMNsFM7dHYvZWcTtYlGNlT04p2BnNjGHi/GgvvKX2x3jSqngrfcwONvtnpD1GT2wpi7IfG3aREm020bu
X-Gm-Message-State: AOJu0YyiFAL0wQ4pptFC6HY54DhU5gZKHyoeASkC/mJ+5VcDavoibCxE
 GdM4dWzL6rgVk1GAJVewWDiQMc3chWzJapy39iBBfF/g6KcIL3PqX52xoTw4wsk=
X-Google-Smtp-Source: AGHT+IG/VsX2YjO90PsbOVyyp86j0OkVdlv20HcJ5UEbUuIJDQujSBOyOBKHUwibMHyf3uCMfqjpvA==
X-Received: by 2002:adf:ec92:0:b0:367:4e05:bb7b with SMTP id
 ffacd0b85a97d-36bbc17dd68mr7198288f8f.53.1722877696419; 
 Mon, 05 Aug 2024 10:08:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:1068:b792:523c:3f73])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36bbcf1e97esm10356486f8f.37.2024.08.05.10.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Aug 2024 10:08:16 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 05 Aug 2024 19:08:03 +0200
Subject: [PATCH v4 2/6] dt-bindings: mailbox: qcom-ipcc: Add GPDSP0 and
 GPDSP1 clients
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240805-topic-sa8775p-iot-remoteproc-v4-2-86affdc72c04@linaro.org>
References: <20240805-topic-sa8775p-iot-remoteproc-v4-0-86affdc72c04@linaro.org>
In-Reply-To: <20240805-topic-sa8775p-iot-remoteproc-v4-0-86affdc72c04@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Amol Maheshwari <amahesh@qti.qualcomm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Tengfei Fan <quic_tengfan@quicinc.com>, Ling Xu <quic_lxu5@quicinc.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=769;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=3xzA+6EtS2RZb51APTtA6l7MBhz4r0SiIFow/JPj6bg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmsQb78RUhtBLOHSNtfOqhMB8K5PTHFwg5KQVqu
 FDQvBOBZgyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZrEG+wAKCRARpy6gFHHX
 coutEACCP27ZPwka8RHk//l8LuvMTup9e3R2nfQSO/ysAqpfeNnh+T4W8USF35ZAgtTys3hRQZK
 MfEP7N0XCBxuXvHVm7wJ4mQLs1ssdn5/YWOv216/4AGJZwzvT+WvCxV4BIKYkxKqonjYzwjDzuO
 CfvSJpURdYu1Ir159CHSwI4pkWWvdg+QcXfYiQA7tuGtAI6Hz68bjEv8rlC2RWETLdV6AdbYWnA
 Spxz7wg092RVTt1SiJnxm0+3z33YVICsyUOBwyuzuh/9n0IIWO41rNk6G6Sc2LJ7GKGEnWeJXno
 312X5GnZ8i4yvQOQlbis30TEh3dbmzbgzymlFQ9ryS9l8WUlIDReSGWfIK2vbLSe/L9A7r6CaJX
 +7s2mjenHCP1+BdA/+mqlS9dKyZt1aV0AP3aj7jBB1GPOIxGXGci0UWz822O6AYhrkBCjnOo155
 ZtTRDTK4Igt2V1HhcErxIejoLaKBq8+AQuhuIkKyscjXnh4RL9eqBJdc6EO0fhvyHOWO4UHy1Mc
 ygiorG2/1wIT0kWTLkdAxH299MyiXbdoeQOnSf1GWh4UEmvcD1uTINBVWH/nmCaYPzs3RFLC1Pp
 C7qauf6MGmfxYW8P1PDuAj65DWKBgzNvf1wK4jCEyJCbE9Cfgo5cc5fGB3jJosUlpUg8lo0FMrA
 GBRDR2EEreqG4XA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
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

From: Tengfei Fan <quic_tengfan@quicinc.com>

Add GPDSP0 and GPDSP1 clients for SA8775p platform.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/dt-bindings/mailbox/qcom-ipcc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/mailbox/qcom-ipcc.h b/include/dt-bindings/mailbox/qcom-ipcc.h
index fbfa3febc66d..fd85a79381b3 100644
--- a/include/dt-bindings/mailbox/qcom-ipcc.h
+++ b/include/dt-bindings/mailbox/qcom-ipcc.h
@@ -33,5 +33,7 @@
 #define IPCC_CLIENT_NSP1		18
 #define IPCC_CLIENT_TME			23
 #define IPCC_CLIENT_WPSS		24
+#define IPCC_CLIENT_GPDSP0		31
+#define IPCC_CLIENT_GPDSP1		32
 
 #endif

-- 
2.43.0


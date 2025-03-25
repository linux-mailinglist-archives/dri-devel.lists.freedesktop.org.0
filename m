Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D33A70A2A
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 20:21:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B7BE10E5DD;
	Tue, 25 Mar 2025 19:21:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cAdq+4cr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 481FA10E5DD
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 19:21:44 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3913fdd0120so3279883f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 12:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742930503; x=1743535303; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0xAjj1ZGQzbODWEBIkfTAWZWQleeUyTNk6b3kRAxKYM=;
 b=cAdq+4crrr74s+dSs+264cuoSCUM75S54RQi+GWElnDcaKHdpcKMwGvDztDQJLPFdm
 s/vptcN9Q5GSzNZNa3eBWd0A6s/otKfSmOI+9eTd9edzShIsMHO4I3DGTTFZZYe3+/0M
 vHGy0mPm7NeB18M2aXMNvDZMkMI5x9Rpv6Sd94MYwh2pDiBJCDFwK6gdP1BcyspHoXhy
 SL1XsA3h3tKfpnz80zwaB++OUO+mD/XwuOTpMClBCaxIoCeQcV7qCG1LQxmYgKhJmGLO
 c9qssV1nk2hKH1VXlXnDmNQ+K9PCeckki1Xixf6mYRLcTWsAzdZYuX2rKjS573v1jI6/
 Dsfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742930503; x=1743535303;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0xAjj1ZGQzbODWEBIkfTAWZWQleeUyTNk6b3kRAxKYM=;
 b=o1RwL1GwT0B8XTkwVJQFbqqx9SEJC41ZYXrzSGAtRrMWuRa252pri11/RtRA7K+Xw2
 Ph6I5x68YQ2THnhubSBwGyUFiCSzjnhICq/uO5sunJjdBCwM4C31qzG6gAo/1tXLTKHR
 or2PmDmc1q0EbopyO6v94Hs//9NT7D/IA4ANwnvqu2+HW4zYB4ZUZVsL8cJQPEAe6iU1
 SGlx3vRQ/AWkw3rlDMai3cdY+gG14ik4BUDnMY0kMNF49V6ZjrbohWsTa76wQzr8tbUh
 FzKuQpSKkzq1mJ34SC9lBBiJ08MEvYj7P/lrYOE5GLgxEnJhHBFtSRvwFnYCz4I/3vIc
 wnsQ==
X-Gm-Message-State: AOJu0YyNiLXmUtnrA17U/voaSzVQMNq7+urTEkRqdVcIAVvzU/P7TjV/
 NbBd1zjHMt+93K8LCmh3IltLLpEq5Q8qP5T38OoC+kyhs5LKcYKQmPwPVljTs1U=
X-Gm-Gg: ASbGncvxt5aklmQI5yR6mX0jJFbe1g4kvZeshPuroW1OyG/RiSkrXWt2mHPAX9TDXRY
 QUNk4iedMZQQ4/XBv8xnoozTmWoMB/Zhkb9vPGQ2exzmYpZZa01WlrfE8rabU2Fl6ycvIaDQPSW
 IwOm2Pusy+3qygI4AaWRFa2H4gHLfGWmozwTRsAxOu+LSwe5MzDIvp4rPG6tSTif0SO1wmlGqTs
 QqaUXfNsaf2UF70KMpQXPp+C5MvdjKB5GmTgjnr1f3vcwZP0XyZxU7npLldea9zq8Rz7Nxi4TVc
 MdWvc+OTUT2oNqskeYTx7iknNUAf4aw+sC4rrYPKNBtwSa6n+t1iKphD
X-Google-Smtp-Source: AGHT+IGmYbu2karVwSKvKAwF5XS/np1cbnnSftiOniiKevwsN7ksXMbWmbShuyMDFyF/HI91Qcd+Vw==
X-Received: by 2002:a5d:6d81:0:b0:397:8ef9:a143 with SMTP id
 ffacd0b85a97d-3997f90c860mr13768026f8f.23.1742930502791; 
 Tue, 25 Mar 2025 12:21:42 -0700 (PDT)
Received: from localhost ([2a00:23c8:b70a:ae01:9cf7:b69:fc50:980f])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3997f9e66c7sm14633284f8f.79.2025.03.25.12.21.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 12:21:42 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Tue, 25 Mar 2025 19:21:26 +0000
Subject: [PATCH v2 1/4] dt-bindings: display: panel: samsung,atna40yk20:
 document ATNA40YK20
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-1-e9bc7c9d30cc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1167;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=tTDdAbM6FEoC6Rnmp/8WdmqaJi5csQEBgAAwOs8qGxY=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBn4wJF7FGQSHT0VbmZT2yMBNAiYq7fD7bvHw/lr
 4Kq+iRYd/aJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCZ+MCRQAKCRBjTcTwaHBG
 +CBAD/9APoHHKoz5Ux3QZFEQYB/24B/r4/Cw8EeywzGzDKkBf0HuS2/jarVACiKA2KzyIRnnA0o
 OrHx39pDhVkO+0wBl0FtK0cWjwlNsEGsrcy5OiL3rZYsz/xnmzeWCu1UJGgbgQ0KJvK5eSqaC1y
 /U++rbQMn3dbQlj16/sWmFiCqrMo5C8qWb1uietBgKlm5hVIUqnTfdYLvxlBi329pynqa8K/AHO
 1Dci97G+SK6X/tXR4fru7iagN0AhcPUH3HI+og/zVqV7/GywsupiSAzy+8Usvv8qXxkE4qhTD31
 ini7tAYORal9ksQn0fhM3wTHa5nZH04AuznDcMTXLMUq5r5cR1UjJOPmj3aQG0AiRgmymtD1n07
 mdKNAXwq/o+vfXNRUvcX36tgjIhWZ2NHhkwnWURqM1hM4fKT9IdoP3FNbVFcqM4S6KSX8GrUFFu
 t1ttLx4Y7s0ko1iXSyEjYa6qv4d4Olb1+RvfdjJ6r2IzBpEtv1JdBxBiZ+HVtJW18S2F9SUZGjO
 fD2c2yfHSaytSFx1SygoVDQgwKJBoFwcWF5B9igCXjLqKX1B48tHjs8EmyvdlfCGx3VF2EtpG8x
 5xYnINf8wSFQHl4KP/DUdhBM8vHvqX2/2o1gOdavJc4IIzFU7+iFzj7CQg0+CzNifKMfHsfB1lT
 pZiCe73XMa7poUQ==
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

The Samsung ATNA40YK20 panel is a 14" AMOLED eDP panel. It is
similar to the ATNA33XC20 except that it is larger and has a
different resolution.

Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
---
 Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
index 684c2896d2387077cf2d91cc5a025e0838c0f536..31f0c0f038e494234d896691f3cf0b9b7cd8842d 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
@@ -19,6 +19,8 @@ properties:
       - const: samsung,atna33xc20
       - items:
           - enum:
+              # Samsung 14" WQXGA+ (2880×1800 pixels) eDP AMOLED panel
+              - samsung,atna40yk20
               # Samsung 14.5" WQXGA+ (2880x1800 pixels) eDP AMOLED panel
               - samsung,atna45af01
               # Samsung 14.5" 3K (2944x1840 pixels) eDP AMOLED panel

-- 
2.49.0


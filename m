Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF685A2D213
	for <lists+dri-devel@lfdr.de>; Sat,  8 Feb 2025 01:28:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D04410E346;
	Sat,  8 Feb 2025 00:28:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RTknOCI0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FE4010E039
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Feb 2025 00:27:19 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5450408455dso342364e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2025 16:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738974438; x=1739579238; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CHcNOzm1hcrclCZti3P3V9XcVq0n02C20x1XRNCo8a4=;
 b=RTknOCI0jdXN/A8857RXkRN/vAsxotmrvkhTi+J4oCFQshilY7CSiU02hccL92YFfd
 u37X9RcRaXakXdqxkPiaoqus81dprbe405SJ3Ss8KIJX/pe03yka1L5XNLU6ardbqgtP
 MoapbwBDiS5EMIApGtFtq0PLGmfED0P06zQk5JQ/wEelxJ2OhwhXB/heJG/BCUdIAtaQ
 ZsYu6VmPx6NVbelmcDHspxBy01sHwuSaHji3wJ9hYTx1IRZGXlyyZpG0fNRC2lrCxvyg
 dfm6eVahVUxNAqrf1weiszd7Ke8xDZA/9ixtZlnbJkk1/MB78XhL1w7tbP97nhTqajUz
 aF7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738974438; x=1739579238;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CHcNOzm1hcrclCZti3P3V9XcVq0n02C20x1XRNCo8a4=;
 b=XnRhOHjPXTHPmgw3XZP3CoXESq9A28CEIVVvTcGUHa+cj3Kmvqz/vocWZkr6fLmQFj
 44AUkArAquRQY7eQMMXKQPg1eWSx/tiUAlItQxnifiZNXXw1q3z8MsP/2NT5m5bBxjwl
 V/dhUQflXK3nFCm2zTtbV2LgJEe+NHloCpRL7Sq1uKKHOgu4IzrNXxeH2nY+6hTjq73r
 JWXnW9ccG+XZiIAu6EtAjb+9AHV1BR13lsZ/pcAwlTihChPPD9tCFEe0/sxtbYAhDAVK
 3u4m5Om0bmtQ6PIF9ls1wTf7kSczQSY7ryFAOhMybQJHr637cfo5pwK2zip7+rgYyjy0
 FGaA==
X-Gm-Message-State: AOJu0YxBhhGjxkF32LdyN7dcAiYt2PYR3v4r5pwxNP8jW6RscSvtM2ML
 Zp8XDWsOjRq0QI27s4XBdieRLfg2CS0m4nV6zio4e3HMDnKS9Wy56+h9f4/T41k=
X-Gm-Gg: ASbGnctpBjfmfIxEuFCFMM04GyNY40skk+cDi9mN4VPGD9waW9Is1qxPzris2FDQp+t
 tU3tLR1ajQj2Ah9SHKWLxReoFhHG1t1EsAXuNamlZyfWMKXghCpVtdgjKbeSVDQXdYz52yWWvMI
 Huux5D5z1Wl7Pw+LzVqh85C1Cbxd3o+qmgUzvVmKbJ+IsVuPeeg9upI+QqlWaKtHYtGUgdZxc/O
 2H46j+qtyV6CTjYQFqQGT7QEnyV01A4rKnA0sNby2Dm5gwft1y2vFdLTifgUWfB/7HH5/ZDA/83
 DO58RvxassRFNG1TwWmmYTI=
X-Google-Smtp-Source: AGHT+IH3Y1P8IibRE8PimX3QdIBB+8KzPyv/64NtH7atJbAfIgaIwZ/7O+qYGCTF7buvXpdwnAV/hQ==
X-Received: by 2002:ac2:5ec4:0:b0:545:17b:3cf5 with SMTP id
 2adb3069b0e04-545017b3dc4mr708605e87.47.1738974437603; 
 Fri, 07 Feb 2025 16:27:17 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5441060413asm588785e87.222.2025.02.07.16.27.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 16:27:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 08 Feb 2025 02:27:04 +0200
Subject: [PATCH v7 5/7] drm/msm/hdmi: update
 HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250208-bridge-hdmi-connector-v7-5-0c3837f00258@linaro.org>
References: <20250208-bridge-hdmi-connector-v7-0-0c3837f00258@linaro.org>
In-Reply-To: <20250208-bridge-hdmi-connector-v7-0-0c3837f00258@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1225;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=KlCjBmWN3HQI30P1/iEnVtV7zXNb45CFcF9NRTzfcWY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnpqTWrQWEFDbf9CVC9qgdBlK0jVKQGg3SKi/ON
 gTwwoScGaKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6ak1gAKCRCLPIo+Aiko
 1cVsB/0UtRNEVP2jHnQ9VOIFCpqTRWZujCjk3DakRH8sGwjX3o8Ui0S08wOopARizocxJmZ1zYZ
 ScxEmA6sj7kqrqFTXVxj73vdIywI5NsBL7yzMuTIUJKGXxgD4T9jkryGkJ3j1PGOioXSHBsN/AB
 +INyVwx7b3sd28sfgNwbvD2UpXCu5p4aHJVpe8LQoK1Ax7uYY2Pr85JyyqNsPfEWgr59jALGcKV
 hj2oVjaGpYIB5BO3CCCpXOouh7oW1fOah/V9XstBTV4QYNPAeplmL+jBwZ24nzhDECikLHvicyU
 z4T02turhxBUomrV4Lw7j2gE1nnyBCsTkr79X5EzFNAyd8ik
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The GENERIC0_UPDATE field is a single bit. Redefine it as boolean to
simplify its usage in the driver.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/registers/display/hdmi.xml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/registers/display/hdmi.xml b/drivers/gpu/drm/msm/registers/display/hdmi.xml
index 1cf1b14fbd919e041fd7ac8a0731d554d4468f4f..0ebb96297dae80940dc8a918d26cd58ff2e6f81a 100644
--- a/drivers/gpu/drm/msm/registers/display/hdmi.xml
+++ b/drivers/gpu/drm/msm/registers/display/hdmi.xml
@@ -131,7 +131,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 		 -->
 		<bitfield name="GENERIC0_SEND" pos="0" type="boolean"/>
 		<bitfield name="GENERIC0_CONT" pos="1" type="boolean"/>
-		<bitfield name="GENERIC0_UPDATE" low="2" high="3" type="uint"/> <!-- ??? -->
+		<bitfield name="GENERIC0_UPDATE" pos="2" type="boolean"/>
 		<bitfield name="GENERIC1_SEND" pos="4" type="boolean"/>
 		<bitfield name="GENERIC1_CONT" pos="5" type="boolean"/>
 		<bitfield name="GENERIC0_LINE" low="16" high="21" type="uint"/>

-- 
2.39.5


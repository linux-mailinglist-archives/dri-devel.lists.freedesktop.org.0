Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 939E3A2DAE0
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 06:06:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65EE110E467;
	Sun,  9 Feb 2025 05:06:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HlQvXhYU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A59310E467
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 05:06:50 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-543e47e93a3so3687855e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 21:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739077609; x=1739682409; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=yj0BuWh1hjkMiCnQtqM7MPhpgvXgx80zo8kYUYLklb8=;
 b=HlQvXhYUzAStafQFUNWSUkrjh87S4d2THip++N/m6VpYncv9QCYBg3BaVXzqjCuTWR
 HhekkDI3fAA3c4igO59vGuZDwrQERP9+m65lZZi9g0/9012rbT6QWypL8anyJNO6K+Mr
 Sy0TBaklU6UnYT4IGLelLnY0fxWpkv6oW7RRkmad0XjUIPjBfRU7NBd4ggjjKZe0BJNX
 7fm8kEd4zY3NdygHhNXl/nJW0QBmIMlSU1cQLfhpXt8DkamhHeMJT77P8iT7PLX2F/nb
 MWExI8WJmmFbXCpAemTdh8NJti5RV9mZGnPCgz55s6XWzOJTQOO6XI8Aqd6NDnz2bMZS
 oVuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739077609; x=1739682409;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yj0BuWh1hjkMiCnQtqM7MPhpgvXgx80zo8kYUYLklb8=;
 b=uGNBWA3rc3n75PY/bRzm6BKVoAmknup46Vy3zo21FGJolTJM6v+5r02laPVAyBlxYy
 xQBaQxcD0TbHMrLQM/CFBkcqzrI7BV520K+8V5SDyA2zeCg1UcXTZj5CqlewRbW5pSQT
 SShTu4L0d6ShXx6IEHGMwZyf5U1tgIu637Tgd/LVvrUJ7Phq7DX6AthFjJKJkWTSh0jD
 MLd87g731mjzEGC8dTzvl43AAxEWy7mzHmNZ8Uz6ny9Aiyz4TGJGlH6TkrFgK70OG5dM
 /ICYN99BA7WUrya8WHZticAGa46X41yAk2X3bkJDf7WsYi5nXp81bl5SCPdL7T3S5K8d
 eePQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCURdNSU2UEHYOBunLQYADG9seqoN3rZrMZWkS0x3CJ97ARv7UT3bBcbX2ABPbBpIPB4dg6eqjMAaeQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTrJLF8cYP6ZaGtcEahJTbDFHSvg6/jSAOz9Ja6Zk4NHa3T5nL
 jUEDwvFZaKCphhh1NFgvbsSyepoaH6EFjPSDj7M4xbkrxNIEVYZAGhkB/dpPk1U=
X-Gm-Gg: ASbGnctJg02O/OYu2UAk9NP6QFqDT19gyy5Km2Zyey5zWDrxOOpqiUAjMQQcsg3XluT
 LywGewrvYHPW8f5+slOUyTKsMPUXypmlz7uMDITNSXl7MnqO/h5geefqT9NTsv+kybK/tEPRe6A
 5aO36uDWWAXGOCumcaQrXAj8yyvZw7od1oWYLbC3V9R3UJJog+YNVd/5jHqEhwZcihhvGcf/dbS
 RpdrDPSHss1Iw5/kL7n20jswGXzd0iU/igKW9BKHF7xQ2BMUGfcNwEPu6EUzG9UBgTJURjx7d/M
 di4TqGy4qoyi0DFJNTDN4a4=
X-Google-Smtp-Source: AGHT+IHlnIFRUHNy4Pv8cos18vLNYdATiWlvlgAGSIQwUUTZUpNqTfhFg+S88Fft5a+ZKQPZyT7Z3g==
X-Received: by 2002:a05:6512:2384:b0:53e:23ec:b2e7 with SMTP id
 2adb3069b0e04-54414adfaebmr3141413e87.34.1739077608720; 
 Sat, 08 Feb 2025 21:06:48 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54506ef1733sm245576e87.1.2025.02.08.21.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 21:06:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 07:04:45 +0200
Subject: [PATCH v4 01/16] dt-bindings: display/msm/hdmi: drop obsolete
 GPIOs from schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-fd-hdmi-hpd-v4-1-6224568ed87f@linaro.org>
References: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
In-Reply-To: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1225;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=BXA7Q9IpU3LJo5o0YQp3oC/xe/tm2VyAy8ivKO92PBQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqDfhD1AdF8cdaEFbZcUVUS48D8BueW7S4NJjP
 m99fsTsa8mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6g34QAKCRCLPIo+Aiko
 1UjqB/9FEXBtULbRjjbPI2zjBtvnostnj5+h5M5uFG+qcq1zFtALCl0x1N5gtOoekLyqo4wWRO8
 pm+HZ10170lI47GVEPlWbenUymsUQLGvEXx62AaHWZOLQ+peYt3EPJyrGaCRAk+ck635Ewh6olI
 erz99ab2bo/ggk2quQvQ4jzbw2cCWnm+HxsPjvxw38guV+w1YmqU8jGXfOmn7PgnM235jR/PiEs
 AydsPxkkK6SYICEpdFWJl2RcHmBqxCAtETjF6I+U3SPBT5NvEm8HeZeXNr2DeLp4fQlYlWSlAii
 rC2DEgtxa7xXBPhqjINBQTnuKu9LthaXvCgHcbl7D5+CBhzE
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

The commit 68e674b13b17 ("drm/msm/hdmi: drop unused GPIO support")
dropped support for obsolete qcom,hdmi-tx-mux-* gpios. They were not
used by any of the upstream platforms. Drop them from the bindings too.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/hdmi.yaml | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.yaml b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
index d4a2033afea8d4e4f83c9859f8840d30ae9d53f8..7e6f776a047a00851e3e1e27fec3dabeed5242fd 100644
--- a/Documentation/devicetree/bindings/display/msm/hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
@@ -66,21 +66,6 @@ properties:
     maxItems: 1
     description: hpd pin
 
-  qcom,hdmi-tx-mux-en-gpios:
-    maxItems: 1
-    deprecated: true
-    description: HDMI mux enable pin
-
-  qcom,hdmi-tx-mux-sel-gpios:
-    maxItems: 1
-    deprecated: true
-    description: HDMI mux select pin
-
-  qcom,hdmi-tx-mux-lpm-gpios:
-    maxItems: 1
-    deprecated: true
-    description: HDMI mux lpm pin
-
   '#sound-dai-cells':
     const: 1
 

-- 
2.39.5


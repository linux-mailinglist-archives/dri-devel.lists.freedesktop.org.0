Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21690A2DAE7
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 06:07:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D9010E47A;
	Sun,  9 Feb 2025 05:06:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MgyenlIo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA3610E46A
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 05:06:56 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-54509f46614so199663e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 21:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739077615; x=1739682415; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1AAeD9frqy9MnpNfuI3r6PeuD8rDrjcizDGW4I0IbQs=;
 b=MgyenlIouN/0hjgdP7E5lKEr7xX57NXykG5C6XPbINAHeWbKPN9U9N/GsLIyFzi80p
 F16O9n1gK2gOeNFJzcnFhJ19ptcA5SOxykaBwhbnRk7MgCW/8Xm3o/Yb608lShmFVX0x
 m4pHoJ/moJqSLoAPHCkOCOsoI5DyCiU5OPtJidQRqLr/QGeQoDqcRUQpayeEiSH/qdf/
 13v9aezh+oSJWJRSbN4EZV7QIt+39JflQgWdL7QDIEASD7q5uB5abdgLPNv1Hfo8UowZ
 ErahnIenUkWDa83N369CTjy7nvsi4pwHrbx0gbn+N2fI001s1j+eiH5M0P0alXqFi7Aj
 3AtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739077615; x=1739682415;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1AAeD9frqy9MnpNfuI3r6PeuD8rDrjcizDGW4I0IbQs=;
 b=pDwSvDo9UNkz/hOj+Lvb+Nw+vfZUDu5NiApgxP06O1eBqUUQsXyr1HAeLZ+iM18Wob
 sefQmoMGteAOo4GXL6UP/Bm6uEh7kqmb1OMMU7b3OuYp+psC5/OnL7xRwfU55BFE+AhT
 rsVoQC9OxmeReIQ+xi2TFHRY4AzKI5bmjF9zSKpTxLjfX5vcU6tH71Unp4tKKD1PTvJf
 fSNnSduacAK158tG1caOlPiqj+oOUYRuH6Zd+3XkBUTdoJV9X5pb38DWFtC6YDUO9DxV
 SVbBU6oDQ+IPqVFv+vB8ccrN8i8LlB+/WyPlpXZnwt9/1uUTHkbI1lgB3kHgV7+KBeXz
 eCTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUZRgRZfPuKLulieljj3QGPW3L97ETmigCFiMG9Ulm+dTzq1n8zzWzTqZJguPnOWPwF1yRcWmmqok=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJvrmGz5cJAq8pqMnKl6bawenWSbLqRn5jpB3dK2a1H9eDudun
 q5fYWmkB0yxxHh9YFRt7+ZEHoRyzUcJZBaf7dSXv/xu2VlA1ocdcEAJLpPUl07E=
X-Gm-Gg: ASbGncuwKckl0eu2nQVcPWnj4B3iPneWxe9rPEY07wmerk0w1dR5OrZKVhsS87GsQuD
 5Gkl+O8wErFjwigV0U4ljGAEWO9pHqsEIQ/VoKERm+j4f586UT2RnrwHMlbWpAZqHBWXQjirkP+
 OhdDz4T3CkkwtZk6q0c/4XczYGrpGYm8ZzhgvO5sCGZb6q1qJDYMlKfTWxDiWYq19VIv77LkxBa
 F3iKz4rqpuHhP8TR4VR2Kqnvk3SR+VNmTE0DiHciqPk3cdG1XM3DZTzk44H6WyGSkn0ZwSZJiJp
 dLQyWKuy5VXZg6Z2SjrdP2c=
X-Google-Smtp-Source: AGHT+IHoMxcCBB3/q2EUvXQ2y3klvPHcidMt7fEpaXFDlyTHpWqmGJ7+95RCxDEc3CZ4CHzL5p6Auw==
X-Received: by 2002:ac2:4bc8:0:b0:545:a2f:22b4 with SMTP id
 2adb3069b0e04-5450a2f235cmr130427e87.40.1739077615007; 
 Sat, 08 Feb 2025 21:06:55 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54506ef1733sm245576e87.1.2025.02.08.21.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 21:06:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 07:04:48 +0200
Subject: [PATCH v4 04/16] drm/msm/hdmi: move the alt_iface clock to the hpd
 list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-fd-hdmi-hpd-v4-4-6224568ed87f@linaro.org>
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
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1513;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=OUSREmRh8249bUIyNnvM4Q8G4H+YLOauuOGWEq+Beno=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqDfhWz/CrQ1d/HHvst2lncBwAPX4lxjbBGU1H
 wXo139WGVKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6g34QAKCRCLPIo+Aiko
 1WjnCAChqMBfU9rKnaYHnLee7/bL11OLC8o/zUyr3P+zOgN+/97oXVe4pOVffirjbqRLHATL42F
 mp3/GOvvSMbiUCMFzWAJdIwnoo04JMqkxdtcRy36uAD9bbe9+CSr2hMFOHieDLRfXNWv5iDxKWm
 wmFhKpeNgShtGZBC8ZP4br6XUjWwzQIStzZjVME2C6843mvq++Ph++Sq7Nyhui5Bgk5CmQbyOVi
 fnGsteCUmKIG8klFqtxfqqxy7B06KDXRz4sdRNe0j5XAQsZHOt/ZNrNuYjSx2FztvJEx7qPZy6r
 nbWC+Z2TjZGdPzCgheIg8736D5bkF2IMNJMkkQwTTCHoCpL4
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

According to the vendor kernel [1] , the alt_iface clock should be
enabled together with the rest of HPD clocks, to make HPD to work
properly.

[1] https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/commit/e07a5487e521e57f76083c0a6e2f995414ac6d03

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 9e9900882687fa2ae4a734d5cf10b5bae5af2f87..ebf9d8162c6e5759a3780c74354b6c159598750f 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -233,9 +233,9 @@ static const struct hdmi_platform_config hdmi_tx_8960_config = {
 };
 
 static const char * const pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
-static const char * const pwr_clk_names_8x74[] = {"extp", "alt_iface"};
-static const char * const hpd_clk_names_8x74[] = {"iface", "core", "mdp_core"};
-static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0};
+static const char * const pwr_clk_names_8x74[] = {"extp"};
+static const char * const hpd_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
+static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0, 0};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
 		HDMI_CFG(pwr_reg, 8x74),

-- 
2.39.5


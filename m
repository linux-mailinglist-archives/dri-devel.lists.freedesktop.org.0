Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 917619EDBFF
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 00:42:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6339710EC8A;
	Wed, 11 Dec 2024 23:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wwmcQw17";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E8710EC88
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 23:42:23 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5401d3ea5a1so4393e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 15:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733960541; x=1734565341; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Lnjkw4VIzQwZ/hc+yDzVmIAwoVqm/XpkTcBCuoP9gz8=;
 b=wwmcQw17nUsA+jr4w0zdE14j71kfCM8wd94cSbbcV19EdjqDduLQV9jesTl7KOEqv6
 nZT8odbv7X2YTOLmLVQOOgi4HbCz+ol/SlceVakv6FeJllmRtecTW8PlapzfwJ398p0w
 iKAXF205jC0JxlvDWZ6bsAyCscvFauJlSzsbVDPSCSKvhK8TOHgdfypze3U59IG/qX/S
 wBzMEWVJA174JfZIBrzLPdsqT2fe0DmuK1gx1tv3qzwMSGjTHPjqm+vWbCSoI6g44Owv
 iaZdfECYSU53Oig4Ns/f+jv+nRnv+Zb94lzC28+D/iJPVS8oHKrY8F/2ppf8NG8dp9S8
 3N4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733960541; x=1734565341;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lnjkw4VIzQwZ/hc+yDzVmIAwoVqm/XpkTcBCuoP9gz8=;
 b=cmoRwu+/t/6KPqwmqO1sOY5gipW/vw/5CJzi46NW0eReiMreP69nKFgV8aN5O3Z5xi
 wR5Mx0rV8HAg32wYIywRBP4qwUWr8YSCGmn3EFfKcvp6ND3/2V+T6EL+h9DWZgv/Hn9J
 YK2vrc+faCj3RBjnt8wjmKI88qtzVLwPXqFQC6KXt3PmoNxBOwqaDeZr32edTirv8kBY
 mI5owybObcDKjCeXzKsxTVvCaNi+DoSkHAmz0iURNt4knKgaFptUG4imIM3r6af7N4m6
 afMTv71ystc8OWRAAvhLnPWoVtOTIZyCypXU2SJrDcuXKbiqz306gWkx0rKne/R9uJQv
 xynQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlqLN33SaeoaWKw+T4f3x3Pah6YBvHZn7Qtjq5vmUYD4zFouOUnFIgProFt02KZP10KOdlHRgcVVU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzdvSehSDPky/yrGLt1MDJCIZQwP2dtnoKpDRRKFKxtkhr3JXm
 voNZKNp02CGizTdp/p3cBxEFg6kzuRc8UFJoWF6lCOQfPYy1bK9SKUyJKAaH/qo=
X-Gm-Gg: ASbGncu6ybWf/Ck/r6flyOWy9EvOGFCpt9ysaTs84zQdTLuuX7zrYtftEKRWyIf8B69
 LUiDIH5h8HupnF181DHWDHAUuSjJbqX1rnvcfdudxlgKHfUCbT+JBMz6AdlcV/92BV7ysMk8e3K
 49qRctMygrEeS30e3hHWamwjjQ9jJeP0YeTzXrznR+o7cMK/QC9PrX1nkuYtG71WECrfDw7O3DF
 fylFnYaL3Oxo5mVxUqMlRZR+6jp1hj+7lBq26pf1UCSuQyZ5PctZwLKkl/kgA==
X-Google-Smtp-Source: AGHT+IGuyBkab6+xA8h4kQCdSPSFqKoYguoZ0tCWyS3pci2mKrG+CV5MOCevFLiOoMbIzGmHsvgEPw==
X-Received: by 2002:a05:6512:2350:b0:540:1dac:c03f with SMTP id
 2adb3069b0e04-5402a6036admr1530126e87.37.1733960541532; 
 Wed, 11 Dec 2024 15:42:21 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5401cc76909sm1222207e87.58.2024.12.11.15.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 15:42:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 12 Dec 2024 01:41:49 +0200
Subject: [PATCH v3 14/14] drm/msm/dp: move interrupt handling to dp_ctrl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-fd-dp-audio-fixup-v3-14-0b1c65e7dba3@linaro.org>
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
In-Reply-To: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=19341;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=IlgvnY4LAKQ03HAFBnYG9jm2Hc9oIBLAAg1rIQnVdVU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3qUsmXZs1mtiQ71SX61txn+dcnp/S+5/X3bZvOdBdM4a
 +V8OfZ1MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAie4XY/9c0XCu5VDFbYcWp
 V3VLe/3S2ct7lv+V7fi7UuCeznaFOx8Om7Smt1a5dxVLTa1eECRTmak9/3TI7dXsPkEOV/+e8Nq
 1oNQlRVKs5+AL/0iT9GiD70svNrUzK1tNDbmsfafmjUakaeenmMebqw/vEue7kTWxh8FymcXurw
 w9/CZ3NSNd2xsUJ7anP/Lcu7Jqh9WEb20p+dGLX/7PnW7uHfifYyHbk/PCzWzqrdVz3S1Ocalms
 305d+mC7tTrh8IFWR9+8shNX2HssCJle6BJscf2vWV3xBRfrNvbUxLooCnW7nndo/WezUvfxQ9S
 L1WfPiO+fcatj3vUspWCzhgkpj8/WWfyhtVRPVU4IdcPAA==
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

It makes it easier to keep all interrupts-related code in dp_ctrl
submodule. Move all functions to dp_ctrl.c.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_aux.c     |   9 +--
 drivers/gpu/drm/msm/dp/dp_aux.h     |   2 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c |  95 ------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  24 ------
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 142 ++++++++++++++++++++++++++++++------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   5 +-
 drivers/gpu/drm/msm/dp/dp_display.c |   9 +--
 drivers/gpu/drm/msm/dp/dp_reg.h     |  17 +++++
 8 files changed, 145 insertions(+), 158 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index f8ea1754665afa37ff9dbaf3f883d94c48bf07b8..d7a38fa5d64d618af463416edf13bef79d6b53ba 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -437,9 +437,8 @@ static ssize_t msm_dp_aux_transfer(struct drm_dp_aux *msm_dp_aux,
 	return ret;
 }
 
-irqreturn_t msm_dp_aux_isr(struct drm_dp_aux *msm_dp_aux)
+irqreturn_t msm_dp_aux_isr(struct drm_dp_aux *msm_dp_aux, u32 isr)
 {
-	u32 isr;
 	struct msm_dp_aux_private *aux;
 
 	if (!msm_dp_aux) {
@@ -449,12 +448,6 @@ irqreturn_t msm_dp_aux_isr(struct drm_dp_aux *msm_dp_aux)
 
 	aux = container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
 
-	isr = msm_dp_catalog_aux_get_irq(aux->catalog);
-
-	/* no interrupts pending, return immediately */
-	if (!isr)
-		return IRQ_NONE;
-
 	if (!aux->cmd_busy) {
 		DRM_ERROR("Unexpected DP AUX IRQ %#010x when not busy\n", isr);
 		return IRQ_NONE;
diff --git a/drivers/gpu/drm/msm/dp/dp_aux.h b/drivers/gpu/drm/msm/dp/dp_aux.h
index 624395a41ed0a75ead4826e78d05ca21e8fb8967..83908c93b6a1baa6c4eb83a346b4498704008ca5 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.h
+++ b/drivers/gpu/drm/msm/dp/dp_aux.h
@@ -11,7 +11,7 @@
 
 int msm_dp_aux_register(struct drm_dp_aux *msm_dp_aux);
 void msm_dp_aux_unregister(struct drm_dp_aux *msm_dp_aux);
-irqreturn_t msm_dp_aux_isr(struct drm_dp_aux *msm_dp_aux);
+irqreturn_t msm_dp_aux_isr(struct drm_dp_aux *msm_dp_aux, u32 isr);
 void msm_dp_aux_enable_xfers(struct drm_dp_aux *msm_dp_aux, bool enabled);
 void msm_dp_aux_init(struct drm_dp_aux *msm_dp_aux);
 void msm_dp_aux_deinit(struct drm_dp_aux *msm_dp_aux);
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 22e2b3147399c0dcce21b9138c24eb699660f21a..8d90bb0e3fef9cdfc403a4de6a8a0834674d62d5 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -15,41 +15,6 @@
 #include "dp_catalog.h"
 #include "dp_reg.h"
 
-#define POLLING_SLEEP_US			1000
-#define POLLING_TIMEOUT_US			10000
-
-#define DP_INTERRUPT_STATUS_ACK_SHIFT	1
-#define DP_INTERRUPT_STATUS_MASK_SHIFT	2
-
-#define DP_INTERRUPT_STATUS1 \
-	(DP_INTR_AUX_XFER_DONE| \
-	DP_INTR_WRONG_ADDR | DP_INTR_TIMEOUT | \
-	DP_INTR_NACK_DEFER | DP_INTR_WRONG_DATA_CNT | \
-	DP_INTR_I2C_NACK | DP_INTR_I2C_DEFER | \
-	DP_INTR_PLL_UNLOCKED | DP_INTR_AUX_ERROR)
-
-#define DP_INTERRUPT_STATUS1_ACK \
-	(DP_INTERRUPT_STATUS1 << DP_INTERRUPT_STATUS_ACK_SHIFT)
-#define DP_INTERRUPT_STATUS1_MASK \
-	(DP_INTERRUPT_STATUS1 << DP_INTERRUPT_STATUS_MASK_SHIFT)
-
-#define DP_INTERRUPT_STATUS2 \
-	(DP_INTR_READY_FOR_VIDEO | DP_INTR_IDLE_PATTERN_SENT | \
-	DP_INTR_FRAME_END | DP_INTR_CRC_UPDATED)
-
-#define DP_INTERRUPT_STATUS2_ACK \
-	(DP_INTERRUPT_STATUS2 << DP_INTERRUPT_STATUS_ACK_SHIFT)
-#define DP_INTERRUPT_STATUS2_MASK \
-	(DP_INTERRUPT_STATUS2 << DP_INTERRUPT_STATUS_MASK_SHIFT)
-
-#define DP_INTERRUPT_STATUS4 \
-	(PSR_UPDATE_INT | PSR_CAPTURE_INT | PSR_EXIT_INT | \
-	PSR_UPDATE_ERROR_INT | PSR_WAKE_ERROR_INT)
-
-#define DP_INTERRUPT_MASK4 \
-	(PSR_UPDATE_MASK | PSR_CAPTURE_MASK | PSR_EXIT_MASK | \
-	PSR_UPDATE_ERROR_MASK | PSR_WAKE_ERROR_MASK)
-
 #define DP_DEFAULT_AHB_OFFSET	0x0000
 #define DP_DEFAULT_AHB_SIZE	0x0200
 #define DP_DEFAULT_AUX_OFFSET	0x0200
@@ -77,21 +42,6 @@ void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_d
 				    msm_dp_catalog->p0_len, msm_dp_catalog->p0_base, "dp_p0");
 }
 
-u32 msm_dp_catalog_aux_get_irq(struct msm_dp_catalog *msm_dp_catalog)
-{
-	u32 intr, intr_ack;
-
-	intr = msm_dp_read_ahb(msm_dp_catalog, REG_DP_INTR_STATUS);
-	intr &= ~DP_INTERRUPT_STATUS1_MASK;
-	intr_ack = (intr & DP_INTERRUPT_STATUS1)
-			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
-	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS,
-		     intr_ack | DP_INTERRUPT_STATUS1_MASK);
-
-	return intr;
-
-}
-
 /**
  * msm_dp_catalog_hw_revision() - retrieve DP hw revision
  *
@@ -105,51 +55,6 @@ u32 msm_dp_catalog_hw_revision(const struct msm_dp_catalog *msm_dp_catalog)
 	return msm_dp_read_ahb(msm_dp_catalog, REG_DP_HW_VERSION);
 }
 
-void msm_dp_catalog_ctrl_enable_irq(struct msm_dp_catalog *msm_dp_catalog,
-						bool enable)
-{
-	if (enable) {
-		msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS,
-				DP_INTERRUPT_STATUS1_MASK);
-		msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS2,
-				DP_INTERRUPT_STATUS2_MASK);
-	} else {
-		msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS, 0x00);
-		msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS2, 0x00);
-	}
-}
-
-u32 msm_dp_catalog_ctrl_read_psr_interrupt_status(struct msm_dp_catalog *msm_dp_catalog)
-{
-	u32 intr, intr_ack;
-
-	intr = msm_dp_read_ahb(msm_dp_catalog, REG_DP_INTR_STATUS4);
-	intr_ack = (intr & DP_INTERRUPT_STATUS4)
-			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
-	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS4, intr_ack);
-
-	return intr;
-}
-
-void msm_dp_catalog_ctrl_config_psr_interrupt(struct msm_dp_catalog *msm_dp_catalog)
-{
-	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_MASK4, DP_INTERRUPT_MASK4);
-}
-
-int msm_dp_catalog_ctrl_get_interrupt(struct msm_dp_catalog *msm_dp_catalog)
-{
-	u32 intr, intr_ack;
-
-	intr = msm_dp_read_ahb(msm_dp_catalog, REG_DP_INTR_STATUS2);
-	intr &= ~DP_INTERRUPT_STATUS2_MASK;
-	intr_ack = (intr & DP_INTERRUPT_STATUS2)
-			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
-	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS2,
-			intr_ack | DP_INTERRUPT_STATUS2_MASK);
-
-	return intr;
-}
-
 static void __iomem *msm_dp_ioremap(struct platform_device *pdev, int idx, size_t *len)
 {
 	struct resource *res;
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 789403e332c1a2108ded4f96b049fd00bb34e326..310319619242df5fa0d91c89fbcc477f16c130ea 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -11,23 +11,6 @@
 #include "dp_utils.h"
 #include "disp/msm_disp_snapshot.h"
 
-/* interrupts */
-#define DP_INTR_HPD		BIT(0)
-#define DP_INTR_AUX_XFER_DONE	BIT(3)
-#define DP_INTR_WRONG_ADDR	BIT(6)
-#define DP_INTR_TIMEOUT		BIT(9)
-#define DP_INTR_NACK_DEFER	BIT(12)
-#define DP_INTR_WRONG_DATA_CNT	BIT(15)
-#define DP_INTR_I2C_NACK	BIT(18)
-#define DP_INTR_I2C_DEFER	BIT(21)
-#define DP_INTR_PLL_UNLOCKED	BIT(24)
-#define DP_INTR_AUX_ERROR	BIT(27)
-
-#define DP_INTR_READY_FOR_VIDEO		BIT(0)
-#define DP_INTR_IDLE_PATTERN_SENT	BIT(3)
-#define DP_INTR_FRAME_END		BIT(6)
-#define DP_INTR_CRC_UPDATED		BIT(9)
-
 #define DP_HW_VERSION_1_0	0x10000000
 #define DP_HW_VERSION_1_2	0x10020000
 
@@ -112,15 +95,8 @@ static inline void msm_dp_write_link(struct msm_dp_catalog *msm_dp_catalog,
 /* Debug module */
 void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_disp_state *disp_state);
 
-/* AUX APIs */
-u32 msm_dp_catalog_aux_get_irq(struct msm_dp_catalog *msm_dp_catalog);
-
 /* DP Controller APIs */
 u32 msm_dp_catalog_hw_revision(const struct msm_dp_catalog *msm_dp_catalog);
-void msm_dp_catalog_ctrl_enable_irq(struct msm_dp_catalog *msm_dp_catalog, bool enable);
-int msm_dp_catalog_ctrl_get_interrupt(struct msm_dp_catalog *msm_dp_catalog);
-void msm_dp_catalog_ctrl_config_psr_interrupt(struct msm_dp_catalog *msm_dp_catalog);
-u32 msm_dp_catalog_ctrl_read_psr_interrupt_status(struct msm_dp_catalog *msm_dp_catalog);
 
 struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 5f32ee2fa0438cd12726540a59ab4849d47ee8c2..f978b599bf14c8fc418f0f2dfe40ca911f8957fe 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -30,6 +30,38 @@
 #define PSR_OPERATION_COMPLETION_TIMEOUT_JIFFIES       (300 * HZ / 1000) /* 300 ms */
 #define WAIT_FOR_VIDEO_READY_TIMEOUT_JIFFIES (HZ / 2)
 
+#define DP_INTERRUPT_STATUS_ACK_SHIFT	1
+#define DP_INTERRUPT_STATUS_MASK_SHIFT	2
+
+#define DP_INTERRUPT_STATUS1 \
+	(DP_INTR_AUX_XFER_DONE| \
+	DP_INTR_WRONG_ADDR | DP_INTR_TIMEOUT | \
+	DP_INTR_NACK_DEFER | DP_INTR_WRONG_DATA_CNT | \
+	DP_INTR_I2C_NACK | DP_INTR_I2C_DEFER | \
+	DP_INTR_PLL_UNLOCKED | DP_INTR_AUX_ERROR)
+
+#define DP_INTERRUPT_STATUS1_ACK \
+	(DP_INTERRUPT_STATUS1 << DP_INTERRUPT_STATUS_ACK_SHIFT)
+#define DP_INTERRUPT_STATUS1_MASK \
+	(DP_INTERRUPT_STATUS1 << DP_INTERRUPT_STATUS_MASK_SHIFT)
+
+#define DP_INTERRUPT_STATUS2 \
+	(DP_INTR_READY_FOR_VIDEO | DP_INTR_IDLE_PATTERN_SENT | \
+	DP_INTR_FRAME_END | DP_INTR_CRC_UPDATED)
+
+#define DP_INTERRUPT_STATUS2_ACK \
+	(DP_INTERRUPT_STATUS2 << DP_INTERRUPT_STATUS_ACK_SHIFT)
+#define DP_INTERRUPT_STATUS2_MASK \
+	(DP_INTERRUPT_STATUS2 << DP_INTERRUPT_STATUS_MASK_SHIFT)
+
+#define DP_INTERRUPT_STATUS4 \
+	(PSR_UPDATE_INT | PSR_CAPTURE_INT | PSR_EXIT_INT | \
+	PSR_UPDATE_ERROR_INT | PSR_WAKE_ERROR_INT)
+
+#define DP_INTERRUPT_MASK4 \
+	(PSR_UPDATE_MASK | PSR_CAPTURE_MASK | PSR_EXIT_MASK | \
+	PSR_UPDATE_ERROR_MASK | PSR_WAKE_ERROR_MASK)
+
 #define DP_CTRL_INTR_READY_FOR_VIDEO     BIT(0)
 #define DP_CTRL_INTR_IDLE_PATTERN_SENT  BIT(3)
 
@@ -126,8 +158,10 @@ static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
 /*
  * NOTE: resetting DP controller will also clear any pending HPD related interrupts
  */
-static void msm_dp_ctrl_reset(struct msm_dp_ctrl_private *ctrl)
+void msm_dp_ctrl_reset(struct msm_dp_ctrl *msm_dp_ctrl)
 {
+	struct msm_dp_ctrl_private *ctrl =
+		container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
 	u32 sw_reset;
 
@@ -141,6 +175,79 @@ static void msm_dp_ctrl_reset(struct msm_dp_ctrl_private *ctrl)
 	msm_dp_write_ahb(msm_dp_catalog, REG_DP_SW_RESET, sw_reset);
 }
 
+static u32 msm_dp_ctrl_get_aux_interrupt(struct msm_dp_ctrl_private *ctrl)
+{
+	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
+	u32 intr, intr_ack;
+
+	intr = msm_dp_read_ahb(msm_dp_catalog, REG_DP_INTR_STATUS);
+	intr &= ~DP_INTERRUPT_STATUS1_MASK;
+	intr_ack = (intr & DP_INTERRUPT_STATUS1)
+			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS,
+		     intr_ack | DP_INTERRUPT_STATUS1_MASK);
+
+	return intr;
+
+}
+
+static u32 msm_dp_ctrl_get_interrupt(struct msm_dp_ctrl_private *ctrl)
+{
+	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
+	u32 intr, intr_ack;
+
+	intr = msm_dp_read_ahb(msm_dp_catalog, REG_DP_INTR_STATUS2);
+	intr &= ~DP_INTERRUPT_STATUS2_MASK;
+	intr_ack = (intr & DP_INTERRUPT_STATUS2)
+			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS2,
+		     intr_ack | DP_INTERRUPT_STATUS2_MASK);
+
+	return intr;
+}
+
+void msm_dp_ctrl_enable_irq(struct msm_dp_ctrl *msm_dp_ctrl)
+{
+	struct msm_dp_ctrl_private *ctrl =
+		container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
+
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS,
+			DP_INTERRUPT_STATUS1_MASK);
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS2,
+			DP_INTERRUPT_STATUS2_MASK);
+}
+
+void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl)
+{
+	struct msm_dp_ctrl_private *ctrl =
+		container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
+
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS, 0x00);
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS2, 0x00);
+}
+
+static u32 msm_dp_ctrl_get_psr_interrupt(struct msm_dp_ctrl_private *ctrl)
+{
+	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
+	u32 intr, intr_ack;
+
+	intr = msm_dp_read_ahb(msm_dp_catalog, REG_DP_INTR_STATUS4);
+	intr_ack = (intr & DP_INTERRUPT_STATUS4)
+			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS4, intr_ack);
+
+	return intr;
+}
+
+static void msm_dp_ctrl_config_psr_interrupt(struct msm_dp_ctrl_private *ctrl)
+{
+	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
+
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_MASK4, DP_INTERRUPT_MASK4);
+}
+
 static void msm_dp_ctrl_psr_mainlink_enable(struct msm_dp_ctrl_private *ctrl)
 {
 	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
@@ -1630,23 +1737,6 @@ static int msm_dp_ctrl_enable_mainlink_clocks(struct msm_dp_ctrl_private *ctrl)
 	return ret;
 }
 
-void msm_dp_ctrl_reset_irq_ctrl(struct msm_dp_ctrl *msm_dp_ctrl, bool enable)
-{
-	struct msm_dp_ctrl_private *ctrl;
-
-	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
-
-	msm_dp_ctrl_reset(ctrl);
-
-	/*
-	 * all dp controller programmable registers will not
-	 * be reset to default value after DP_SW_RESET
-	 * therefore interrupt mask bits have to be updated
-	 * to enable/disable interrupts
-	 */
-	msm_dp_catalog_ctrl_enable_irq(ctrl->catalog, enable);
-}
-
 static void msm_dp_ctrl_enable_sdp(struct msm_dp_ctrl_private *ctrl)
 {
 	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
@@ -1699,7 +1789,7 @@ void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl)
 	cfg |= PSR1_SUPPORTED;
 	msm_dp_write_link(msm_dp_catalog, REG_PSR_CONFIG, cfg);
 
-	msm_dp_catalog_ctrl_config_psr_interrupt(msm_dp_catalog);
+	msm_dp_ctrl_config_psr_interrupt(ctrl);
 	msm_dp_ctrl_enable_sdp(ctrl);
 
 	cfg = DP_PSR_ENABLE;
@@ -1824,7 +1914,7 @@ static int msm_dp_ctrl_deinitialize_mainlink(struct msm_dp_ctrl_private *ctrl)
 
 	msm_dp_ctrl_mainlink_disable(ctrl);
 
-	msm_dp_ctrl_reset(ctrl);
+	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl);
 
 	dev_pm_opp_set_rate(ctrl->dev, 0);
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
@@ -2453,7 +2543,7 @@ void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	msm_dp_ctrl_mainlink_disable(ctrl);
 
-	msm_dp_ctrl_reset(ctrl);
+	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl);
 
 	if (ctrl->stream_clks_on) {
 		clk_disable_unprepare(ctrl->pixel_clk);
@@ -2480,7 +2570,7 @@ irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl)
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
 	if (ctrl->panel->psr_cap.version) {
-		isr = msm_dp_catalog_ctrl_read_psr_interrupt_status(ctrl->catalog);
+		isr = msm_dp_ctrl_get_psr_interrupt(ctrl);
 
 		if (isr)
 			complete(&ctrl->psr_op_comp);
@@ -2495,8 +2585,7 @@ irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl)
 			drm_dbg_dp(ctrl->drm_dev, "PSR frame capture done\n");
 	}
 
-	isr = msm_dp_catalog_ctrl_get_interrupt(ctrl->catalog);
-
+	isr = msm_dp_ctrl_get_interrupt(ctrl);
 
 	if (isr & DP_CTRL_INTR_READY_FOR_VIDEO) {
 		drm_dbg_dp(ctrl->drm_dev, "dp_video_ready\n");
@@ -2510,6 +2599,11 @@ irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl)
 		ret = IRQ_HANDLED;
 	}
 
+	/* DP aux isr */
+	isr = msm_dp_ctrl_get_aux_interrupt(ctrl);
+	if (isr)
+		ret |= msm_dp_aux_isr(ctrl->aux, isr);
+
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index b7abfedbf5749c25877a0b8ba3af3d8ed4b23d67..10a4b7cf0335a584b4db67baca882620d7bab74c 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -30,7 +30,7 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link
 			struct msm_dp_catalog *catalog,
 			struct phy *phy);
 
-void msm_dp_ctrl_reset_irq_ctrl(struct msm_dp_ctrl *msm_dp_ctrl, bool enable);
+void msm_dp_ctrl_reset(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_phy_init(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_phy_exit(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_irq_phy_exit(struct msm_dp_ctrl *msm_dp_ctrl);
@@ -41,4 +41,7 @@ void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl);
 int msm_dp_ctrl_core_clk_enable(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_core_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl);
 
+void msm_dp_ctrl_enable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
+void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
+
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index a2cdcdac042d63a59ff71aefcecb7f8b22f01167..86b2af83301df8206dbe1d0ad1bec091034a6c9c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -440,7 +440,8 @@ static void msm_dp_display_host_init(struct msm_dp_display_private *dp)
 		dp->phy_initialized);
 
 	msm_dp_ctrl_core_clk_enable(dp->ctrl);
-	msm_dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
+	msm_dp_ctrl_reset(dp->ctrl);
+	msm_dp_ctrl_enable_irq(dp->ctrl);
 	msm_dp_aux_init(dp->aux);
 	dp->core_initialized = true;
 }
@@ -451,7 +452,8 @@ static void msm_dp_display_host_deinit(struct msm_dp_display_private *dp)
 		dp->msm_dp_display.connector_type, dp->core_initialized,
 		dp->phy_initialized);
 
-	msm_dp_ctrl_reset_irq_ctrl(dp->ctrl, false);
+	msm_dp_ctrl_reset(dp->ctrl);
+	msm_dp_ctrl_disable_irq(dp->ctrl);
 	msm_dp_aux_deinit(dp->aux);
 	msm_dp_ctrl_core_clk_disable(dp->ctrl);
 	dp->core_initialized = false;
@@ -1165,9 +1167,6 @@ static irqreturn_t msm_dp_display_irq_handler(int irq, void *dev_id)
 	/* DP controller isr */
 	ret |= msm_dp_ctrl_isr(dp->ctrl);
 
-	/* DP aux isr */
-	ret |= msm_dp_aux_isr(dp->aux);
-
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 3835c7f5cb984406f8fc52ea765ef2315e0d175b..d17e077ded73251624b5fb1bfbd8f213b4a86d65 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -21,8 +21,25 @@
 
 #define REG_DP_CLK_CTRL				(0x00000018)
 #define REG_DP_CLK_ACTIVE			(0x0000001C)
+
 #define REG_DP_INTR_STATUS			(0x00000020)
+#define DP_INTR_HPD		BIT(0)
+#define DP_INTR_AUX_XFER_DONE	BIT(3)
+#define DP_INTR_WRONG_ADDR	BIT(6)
+#define DP_INTR_TIMEOUT		BIT(9)
+#define DP_INTR_NACK_DEFER	BIT(12)
+#define DP_INTR_WRONG_DATA_CNT	BIT(15)
+#define DP_INTR_I2C_NACK	BIT(18)
+#define DP_INTR_I2C_DEFER	BIT(21)
+#define DP_INTR_PLL_UNLOCKED	BIT(24)
+#define DP_INTR_AUX_ERROR	BIT(27)
+
 #define REG_DP_INTR_STATUS2			(0x00000024)
+#define DP_INTR_READY_FOR_VIDEO		BIT(0)
+#define DP_INTR_IDLE_PATTERN_SENT	BIT(3)
+#define DP_INTR_FRAME_END		BIT(6)
+#define DP_INTR_CRC_UPDATED		BIT(9)
+
 #define REG_DP_INTR_STATUS3			(0x00000028)
 
 #define REG_DP_INTR_STATUS4			(0x0000002C)

-- 
2.39.5


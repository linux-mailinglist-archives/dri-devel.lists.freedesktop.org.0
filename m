Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5869DFE36
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 11:07:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC1B10E6B6;
	Mon,  2 Dec 2024 10:07:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vdIf0MoB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6CB10E6AC
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 10:07:07 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-53e0844ee50so999942e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2024 02:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733134026; x=1733738826; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=I2VWflriFV8qydeNFaxzr9L2wRGR5omM9jEvzsxEFIY=;
 b=vdIf0MoBKHDDmPN/X2DCQmiBWm7jSTRI5ri003mmRJzlwiJIQqTYbh0eHxJPFt6I8t
 YUNzX4SpL+GlHPz6NNkz6OZSSxQK71mORp7/ELMPM1ul+hvYw0C+XW8TUz2hs8kL+Cob
 HCVbaE8oyYIfWqWg9NepAyvx+MEg3f2FONRCU45kBcax1SFSrsImsTWclqod2OncQIWE
 1t8RXej1bGNHW0cTvKqeFePw7G42sIud0YpbqGBOkk2076Bc3zEL4sa+/OAhFu+2YBk4
 uJo90mDzOJ4ldcg4+TVYmzvIxJPTw0CWvsM2rOG5LmGeHw1DqWu23EX4zYVKABw1dT+R
 5RLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733134026; x=1733738826;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I2VWflriFV8qydeNFaxzr9L2wRGR5omM9jEvzsxEFIY=;
 b=w2s76Pme8QLWqNLfcr7z1MSii4cMTMRGeH10qxkdzY0Lkrwnysw3hJd8YUigdFE6XV
 g/PWY4mvZPm3MaL4UYyBSLCXGy4dUjnKIw5oaeyfpDsCZk03SW1i7odnseudaBx+HV5h
 SJmrCNgL+QgLH1TTWty6VWgCIR2yv6ecmzF6D7JQgJgfBP438w5SLqbwJKN2YMLy1cT1
 JxEDsVAhgFTZdIZRU/5BxmpsrQUx8KmqpRBHzxSLl1h21xK3v4ZFWOWegDHKH2zDMnIQ
 WPnHfJhzatSlUqK1Lxl8t9HaCfc7bSLAZ65Xfe16VdAbkRVp+1jPMZ/G8xZC475T0EQ3
 ZwaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgFNkBPH55W6ara7laxcCI3OfEEjLjCNZWyMaHx1FO5vJEFyA+AIbajZtIGX1sA/SlLA90N9OJL8s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5nh2kG7KzJNooavAYJtxLIATKazlhQvudu9ZEyupjfd5yh6Xd
 5wkihhIiyCapEsZ3VSakM5Bgu7jh3pHvcL4F7lLSr3pOPyyRT4Bug9bDwHQmxPI=
X-Gm-Gg: ASbGncvgzUZmRkphmoPMzV57Vhv1wVZE4BELueEYMHgM7MwLx3D+NNP0Vm1AWOIzJdu
 yyJ7QtCOLWLceBHYWDf+e39Qu0pJ34RNCXPQcc1RCsLqz4H+E6sjcFI5lPmCyQEYcBaSi7Vc3Tp
 E2fIEUi+jGQtwIsmlxlg+KBgMe3BRre33Qf2UlzzlMCXmhmt+ceXrS0ybJkZi7qdw2/5xlhhios
 gWAbGp2S4rlg5GHRZg1xVK9d3skkv3hx6VWW0VmNW0abit3U9IyCTn37A==
X-Google-Smtp-Source: AGHT+IFvTEtMbn5MBSurYPPyxtRW2UTrVHiJqiSziJvDY+KPuTxzPx/SCmdVWl7uUpVB6vnWNDYOEQ==
X-Received: by 2002:a05:6512:39c6:b0:53d:e8f5:faa1 with SMTP id
 2adb3069b0e04-53df00cf76fmr11758931e87.24.1733134026065; 
 Mon, 02 Dec 2024 02:07:06 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df646f191sm1418314e87.136.2024.12.02.02.07.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 02:07:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 02 Dec 2024 12:06:42 +0200
Subject: [PATCH v2 12/14] drm/msm/dp: move more AUX functions to dp_aux.c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-fd-dp-audio-fixup-v2-12-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14070;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=tpv4ZW6nIW6oE8mQq2hXksopI+ZIgRq+r6Y0r/coN+A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnTYauKHBaeuqVwuRNfxrmTHUuKDmSZgtGsNy3n
 lJ45IaK94mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ02GrgAKCRCLPIo+Aiko
 1XZqB/wIzlGv2Gz6Au3gkncVi5U6F2hQkqb+FwJiS4r0WUNW7pLVIvFdXu2l7g5hkHKcQLOU6iA
 bL7SkRh2hhiI7hlff/bn3k+eCtvqhepNIVFhuGMxUodH9/SWdFIMAsUFMycT/E2NjtVHn6naS+7
 sfh6Z6N+K/bLky6UGfyvzphO7gvF8oj8z1HOuwp8N6fJbOZOmockX7rMG5Y8IlBHi4tYSFSx45V
 hdae6H5WLaffXG0ya/W3El6e1iI0Rydw7HmS84cVYLojBBRkKRQ8aTVR0Gn2g3Ql1qT71t4qNYU
 T/rlZoYY4TIU0KzjfgR1QQSa1GTRZErpIwB9g5e/sA0ye2zI
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

Move several misnamed functions accessing AUX bus to dp_aux.c, further
cleaning up dp_catalog submodule.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_aux.c     | 88 ++++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_aux.h     |  7 +++
 drivers/gpu/drm/msm/dp/dp_catalog.c | 75 +------------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  6 ---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  4 +-
 drivers/gpu/drm/msm/dp/dp_display.c | 18 ++++----
 drivers/gpu/drm/msm/dp/dp_panel.c   |  2 +-
 7 files changed, 107 insertions(+), 93 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index 46e8a2e13ac1d1249fbad9b50a6d64c52d51cf38..7228955019b31f80257b86a470c9ef305b2549a0 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -405,7 +405,7 @@ static ssize_t msm_dp_aux_transfer(struct drm_dp_aux *msm_dp_aux,
 				phy_calibrate(aux->phy);
 		}
 		/* reset aux if link is in connected state */
-		if (msm_dp_catalog_link_is_connected(aux->catalog))
+		if (msm_dp_aux_is_link_connected(msm_dp_aux))
 			msm_dp_aux_reset(aux);
 	} else {
 		aux->retry_cnt = 0;
@@ -593,6 +593,92 @@ static int msm_dp_wait_hpd_asserted(struct drm_dp_aux *msm_dp_aux,
 	return ret;
 }
 
+void msm_dp_aux_hpd_enable(struct drm_dp_aux *msm_dp_aux)
+{
+	struct msm_dp_aux_private *aux = container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
+	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
+	u32 reg;
+
+	/* Configure REFTIMER and enable it */
+	reg = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_REFTIMER);
+	reg |= DP_DP_HPD_REFTIMER_ENABLE;
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_REFTIMER, reg);
+
+	/* Enable HPD */
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_CTRL, DP_DP_HPD_CTRL_HPD_EN);
+}
+
+void msm_dp_aux_hpd_disable(struct drm_dp_aux *msm_dp_aux)
+{
+	struct msm_dp_aux_private *aux = container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
+	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
+	u32 reg;
+
+	reg = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_REFTIMER);
+	reg &= ~DP_DP_HPD_REFTIMER_ENABLE;
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_REFTIMER, reg);
+
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_CTRL, 0);
+}
+
+void msm_dp_aux_hpd_intr_enable(struct drm_dp_aux *msm_dp_aux)
+{
+	struct msm_dp_aux_private *aux = container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
+	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
+	u32 reg;
+
+	reg = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_MASK);
+	reg |= DP_DP_HPD_INT_MASK;
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_MASK,
+		     reg & DP_DP_HPD_INT_MASK);
+}
+
+void msm_dp_aux_hpd_intr_disable(struct drm_dp_aux *msm_dp_aux)
+{
+	struct msm_dp_aux_private *aux = container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
+	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
+	u32 reg;
+
+	reg = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_MASK);
+	reg &= ~DP_DP_HPD_INT_MASK;
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_MASK,
+		     reg & DP_DP_HPD_INT_MASK);
+}
+
+u32 msm_dp_aux_get_hpd_intr_status(struct drm_dp_aux *msm_dp_aux)
+{
+	struct msm_dp_aux_private *aux = container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
+	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
+	int isr, mask;
+
+	isr = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_STATUS);
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_ACK,
+				 (isr & DP_DP_HPD_INT_MASK));
+	mask = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_MASK);
+
+	/*
+	 * We only want to return interrupts that are unmasked to the caller.
+	 * However, the interrupt status field also contains other
+	 * informational bits about the HPD state status, so we only mask
+	 * out the part of the register that tells us about which interrupts
+	 * are pending.
+	 */
+	return isr & (mask | ~DP_DP_HPD_INT_MASK);
+}
+
+u32 msm_dp_aux_is_link_connected(struct drm_dp_aux *msm_dp_aux)
+{
+	struct msm_dp_aux_private *aux = container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
+	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
+	u32 status;
+
+	status = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_STATUS);
+	status >>= DP_DP_HPD_STATE_STATUS_BITS_SHIFT;
+	status &= DP_DP_HPD_STATE_STATUS_BITS_MASK;
+
+	return status;
+}
+
 struct drm_dp_aux *msm_dp_aux_get(struct device *dev, struct msm_dp_catalog *catalog,
 			      struct phy *phy,
 			      bool is_edp)
diff --git a/drivers/gpu/drm/msm/dp/dp_aux.h b/drivers/gpu/drm/msm/dp/dp_aux.h
index 39c5b4c8596ab28d822493a6b4d479f5f786cdee..624395a41ed0a75ead4826e78d05ca21e8fb8967 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.h
+++ b/drivers/gpu/drm/msm/dp/dp_aux.h
@@ -17,6 +17,13 @@ void msm_dp_aux_init(struct drm_dp_aux *msm_dp_aux);
 void msm_dp_aux_deinit(struct drm_dp_aux *msm_dp_aux);
 void msm_dp_aux_reconfig(struct drm_dp_aux *msm_dp_aux);
 
+void msm_dp_aux_hpd_enable(struct drm_dp_aux *msm_dp_aux);
+void msm_dp_aux_hpd_disable(struct drm_dp_aux *msm_dp_aux);
+void msm_dp_aux_hpd_intr_enable(struct drm_dp_aux *msm_dp_aux);
+void msm_dp_aux_hpd_intr_disable(struct drm_dp_aux *msm_dp_aux);
+u32 msm_dp_aux_get_hpd_intr_status(struct drm_dp_aux *msm_dp_aux);
+u32 msm_dp_aux_is_link_connected(struct drm_dp_aux *msm_dp_aux);
+
 struct phy;
 struct drm_dp_aux *msm_dp_aux_get(struct device *dev, struct msm_dp_catalog *catalog,
 			      struct phy *phy,
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 60ba6e0a204f536fd050591e891add17d286fb2d..754b30e35039618453df9ce863c0d2561fce2fda 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -81,8 +81,8 @@ u32 msm_dp_catalog_aux_get_irq(struct msm_dp_catalog *msm_dp_catalog)
 	intr &= ~DP_INTERRUPT_STATUS1_MASK;
 	intr_ack = (intr & DP_INTERRUPT_STATUS1)
 			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
-	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS, intr_ack |
-			DP_INTERRUPT_STATUS1_MASK);
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS,
+		     intr_ack | DP_INTERRUPT_STATUS1_MASK);
 
 	return intr;
 
@@ -115,77 +115,6 @@ void msm_dp_catalog_ctrl_enable_irq(struct msm_dp_catalog *msm_dp_catalog,
 	}
 }
 
-void msm_dp_catalog_hpd_config_intr(struct msm_dp_catalog *msm_dp_catalog,
-			u32 intr_mask, bool en)
-{
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-
-	u32 config = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_MASK);
-
-	config = (en ? config | intr_mask : config & ~intr_mask);
-
-	drm_dbg_dp(catalog->drm_dev, "intr_mask=%#x config=%#x\n",
-					intr_mask, config);
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_MASK,
-				config & DP_DP_HPD_INT_MASK);
-}
-
-void msm_dp_catalog_ctrl_hpd_enable(struct msm_dp_catalog *msm_dp_catalog)
-{
-	u32 reftimer = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_REFTIMER);
-
-	/* Configure REFTIMER and enable it */
-	reftimer |= DP_DP_HPD_REFTIMER_ENABLE;
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_REFTIMER, reftimer);
-
-	/* Enable HPD */
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_CTRL, DP_DP_HPD_CTRL_HPD_EN);
-}
-
-void msm_dp_catalog_ctrl_hpd_disable(struct msm_dp_catalog *msm_dp_catalog)
-{
-	u32 reftimer = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_REFTIMER);
-
-	reftimer &= ~DP_DP_HPD_REFTIMER_ENABLE;
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_REFTIMER, reftimer);
-
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_CTRL, 0);
-}
-
-u32 msm_dp_catalog_link_is_connected(struct msm_dp_catalog *msm_dp_catalog)
-{
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-	u32 status;
-
-	status = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_STATUS);
-	drm_dbg_dp(catalog->drm_dev, "aux status: %#x\n", status);
-	status >>= DP_DP_HPD_STATE_STATUS_BITS_SHIFT;
-	status &= DP_DP_HPD_STATE_STATUS_BITS_MASK;
-
-	return status;
-}
-
-u32 msm_dp_catalog_hpd_get_intr_status(struct msm_dp_catalog *msm_dp_catalog)
-{
-	int isr, mask;
-
-	isr = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_STATUS);
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_ACK,
-				 (isr & DP_DP_HPD_INT_MASK));
-	mask = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_MASK);
-
-	/*
-	 * We only want to return interrupts that are unmasked to the caller.
-	 * However, the interrupt status field also contains other
-	 * informational bits about the HPD state status, so we only mask
-	 * out the part of the register that tells us about which interrupts
-	 * are pending.
-	 */
-	return isr & (mask | ~DP_DP_HPD_INT_MASK);
-}
-
 u32 msm_dp_catalog_ctrl_read_psr_interrupt_status(struct msm_dp_catalog *msm_dp_catalog)
 {
 	u32 intr, intr_ack;
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index e2fdccc332f874458709593c68a1d1a46b6cc406..830d9164188c0f7520809a99fa409b473bbfbfa4 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -122,12 +122,6 @@ u32 msm_dp_catalog_aux_get_irq(struct msm_dp_catalog *msm_dp_catalog);
 /* DP Controller APIs */
 u32 msm_dp_catalog_hw_revision(const struct msm_dp_catalog *msm_dp_catalog);
 void msm_dp_catalog_ctrl_enable_irq(struct msm_dp_catalog *msm_dp_catalog, bool enable);
-void msm_dp_catalog_hpd_config_intr(struct msm_dp_catalog *msm_dp_catalog,
-			u32 intr_mask, bool en);
-void msm_dp_catalog_ctrl_hpd_enable(struct msm_dp_catalog *msm_dp_catalog);
-void msm_dp_catalog_ctrl_hpd_disable(struct msm_dp_catalog *msm_dp_catalog);
-u32 msm_dp_catalog_link_is_connected(struct msm_dp_catalog *msm_dp_catalog);
-u32 msm_dp_catalog_hpd_get_intr_status(struct msm_dp_catalog *msm_dp_catalog);
 int msm_dp_catalog_ctrl_get_interrupt(struct msm_dp_catalog *msm_dp_catalog);
 void msm_dp_catalog_ctrl_config_psr_interrupt(struct msm_dp_catalog *msm_dp_catalog);
 u32 msm_dp_catalog_ctrl_read_psr_interrupt_status(struct msm_dp_catalog *msm_dp_catalog);
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index cde667bf8eeec95035b2feb3661686c99acf5b7d..5f32ee2fa0438cd12726540a59ab4849d47ee8c2 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2162,7 +2162,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
 			break;
 		} else if (training_step == DP_TRAINING_1) {
 			/* link train_1 failed */
-			if (!msm_dp_catalog_link_is_connected(ctrl->catalog))
+			if (!msm_dp_aux_is_link_connected(ctrl->aux))
 				break;
 
 			msm_dp_ctrl_read_link_status(ctrl, link_status);
@@ -2187,7 +2187,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
 			}
 		} else if (training_step == DP_TRAINING_2) {
 			/* link train_2 failed */
-			if (!msm_dp_catalog_link_is_connected(ctrl->catalog))
+			if (!msm_dp_aux_is_link_connected(ctrl->aux))
 				break;
 
 			msm_dp_ctrl_read_link_status(ctrl, link_status);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index aba925aab7ad7c6652e81004043864c1cb3ac370..72a46e9e319486bc4ec1f5c842d733bd55ce0a67 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1145,7 +1145,7 @@ static irqreturn_t msm_dp_display_irq_handler(int irq, void *dev_id)
 		return IRQ_NONE;
 	}
 
-	hpd_isr_status = msm_dp_catalog_hpd_get_intr_status(dp->catalog);
+	hpd_isr_status = msm_dp_aux_get_hpd_intr_status(dp->aux);
 
 	if (hpd_isr_status & 0x0F) {
 		drm_dbg_dp(dp->drm_dev, "type=%d isr=0x%x\n",
@@ -1360,7 +1360,7 @@ static int msm_dp_pm_runtime_suspend(struct device *dev)
 
 	if (dp->msm_dp_display.is_edp) {
 		msm_dp_display_host_phy_exit(dp);
-		msm_dp_catalog_ctrl_hpd_disable(dp->catalog);
+		msm_dp_aux_hpd_disable(dp->aux);
 	}
 	msm_dp_display_host_deinit(dp);
 
@@ -1381,7 +1381,7 @@ static int msm_dp_pm_runtime_resume(struct device *dev)
 	 */
 	msm_dp_display_host_init(dp);
 	if (dp->msm_dp_display.is_edp) {
-		msm_dp_catalog_ctrl_hpd_enable(dp->catalog);
+		msm_dp_aux_hpd_enable(dp->aux);
 		msm_dp_display_host_phy_init(dp);
 	}
 
@@ -1668,10 +1668,8 @@ void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge)
 		return;
 	}
 
-	msm_dp_catalog_ctrl_hpd_enable(dp->catalog);
-
-	/* enable HDP interrupts */
-	msm_dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_INT_MASK, true);
+	msm_dp_aux_hpd_enable(dp->aux);
+	msm_dp_aux_hpd_intr_enable(dp->aux);
 
 	msm_dp_display->internal_hpd = true;
 	mutex_unlock(&dp->event_mutex);
@@ -1684,9 +1682,9 @@ void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge)
 	struct msm_dp_display_private *dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
 	mutex_lock(&dp->event_mutex);
-	/* disable HDP interrupts */
-	msm_dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_INT_MASK, false);
-	msm_dp_catalog_ctrl_hpd_disable(dp->catalog);
+
+	msm_dp_aux_hpd_intr_disable(dp->aux);
+	msm_dp_aux_hpd_disable(dp->aux);
 
 	msm_dp_display->internal_hpd = false;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index cd91de21c8e658570b8d43251ef815981f801ae4..25869e2ac93aba0bffeddae9f95917d81870d8cb 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -165,7 +165,7 @@ int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
 	if (!msm_dp_panel->drm_edid) {
 		DRM_ERROR("panel edid read failed\n");
 		/* check edid read fail is due to unplug */
-		if (!msm_dp_catalog_link_is_connected(panel->catalog)) {
+		if (!msm_dp_aux_is_link_connected(panel->aux)) {
 			rc = -ETIMEDOUT;
 			goto end;
 		}

-- 
2.39.5


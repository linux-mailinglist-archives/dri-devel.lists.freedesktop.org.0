Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC2F9FA7FB
	for <lists+dri-devel@lfdr.de>; Sun, 22 Dec 2024 21:14:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5B2010E2D4;
	Sun, 22 Dec 2024 20:14:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="B/RSKe9G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBF1610E222
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2024 20:14:21 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5401bd6ccadso3925462e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2024 12:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734898460; x=1735503260; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qsLixnbCUZJZByQLj0YLorZ2NFO6bbENIPF/nqoST3s=;
 b=B/RSKe9GkowMK2Gf/MFBO+DPnqruZlhK92M7CyvKfij9wBlUCw02cMsACUBMpzmK7G
 y0XYBsn366JzaqSBCWKnOqxx2d86PNegmevhg/gCQOqXlYS1jL0vfQwoRg/VexuCcZwk
 fO4Kl4Z2sykk3io988dcC4fDmJjVori4RaInGyP7KpdxLAnG/tEm8zE5YvHGtdHA7Vu4
 FhZq5TsGs62O+nDV9+acBxrb+gBBB3kXHqtsdaioHfVpi57Js1Ad9NqiKCItdd8X9K20
 Di5z/V+eYysBMNhcxheYvXQACCoCC8wgMwTsyX5yJlyQt12EP4XrCfboFZdBmfq6Lmer
 uGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734898460; x=1735503260;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qsLixnbCUZJZByQLj0YLorZ2NFO6bbENIPF/nqoST3s=;
 b=hbrv49tgr+U49hPkMt1mib03LVIhPztVWbkexElYxm2xDcWEzF3pAG8rV703nkm9vA
 L3tztTBvy9FpXvbaJLuNtMxzj5ZYK+nY2gQtAyvwAmnMuTRibLt290iJ5NKXVmN4oNFX
 7FOAlNt5c4fFTFg+HbGorS+j54PTx5e35XRm3FUGUB8TK6sru13CGeeBACacuiDEaWyH
 J6KRNP8ap6LDRoIE4XXl5lCtOGMcHU+JyCkOcTBZoQ3ja7IqYR+rECDWNgLfgVeI8erD
 aIJOVhVSlK+enR3KRBmf65zGNHvUx4Bd1IXnJnLbMbcFVitgw3uetzTofOD6Z+BdoJVw
 Ccyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW29bzecZYkdr3Fk/yjjJIKzMEykhWwpDG8HYyi5Qh9qT4I5otdoAxUWKwmQgnIMRQviAQ+UOuvS3g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6MNMbsfqiRSAxa4qTetavlaps05XXfaxbAUr/doJydrN6Yjbu
 EEn5ywerihXHQqP97XfbQqKwkMHlS543FBP3xB4sLxqMhLC5ioExGMG1w6OVPBM=
X-Gm-Gg: ASbGnct7kwS1gaKCNkS7vYbFqnxWMLfuc9PlwgG05FFhwXoJzDN2PL4P96lL3ZqiQgJ
 Cl+NegjwMBvVE59QIuv9/PCvam4S+ddHHo3OAC79pD0pk2sNt1wSihBTWO8TX5dV3Gxqb2w0RLJ
 QcaFXpoDKItJu/nT7g3H9+p+o/Jkl4GN4XRJQ421tKMVR0reN1oerOyelWRYP3sevq+lioRURKS
 /WXzLtoiJxVlpAjlKxnzpIqnKWHSiivV/Wo0CvyTrEPe0Fy4S8b/Ox26OOxXaB3
X-Google-Smtp-Source: AGHT+IFdCK19Ixoe57nhdOf5NmTFJHX6bAS/hFmyTtoVZ/SrMFs9HC46Fw3D5k2rOEG4yBIs5/3IKQ==
X-Received: by 2002:a05:6512:4485:b0:542:2972:4e59 with SMTP id
 2adb3069b0e04-54229724f79mr3351823e87.28.1734898460245; 
 Sun, 22 Dec 2024 12:14:20 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f7765sm1034331e87.13.2024.12.22.12.14.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Dec 2024 12:14:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 22 Dec 2024 22:14:08 +0200
Subject: [PATCH v5 05/11] drm/msm/dp: move/inline AUX register functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241222-fd-dp-audio-fixup-v5-5-370f09492cf6@linaro.org>
References: <20241222-fd-dp-audio-fixup-v5-0-370f09492cf6@linaro.org>
In-Reply-To: <20241222-fd-dp-audio-fixup-v5-0-370f09492cf6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11841;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=APLj4YqcLlrz0cIrvDAgRzbbCjjVjcoBaObsvAKwngM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaHMOb7V4MfKyNpOm56QnWemovMFNb6Y6PR8lf
 nKGF+VD2jqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2hzDgAKCRCLPIo+Aiko
 1Qw6B/9LBNXa2AnBRg2DGOCbotH7zhFGX/r5K8ZUtfPnatCrNld1ZJR5pR3GjZiOC8j6KpGSxvC
 X4KqNE13Uoau4JJTO8XBot9wzHedBKlSQVzEv54HBAv87OlkhFTObYCWyVRtR5fz50ItmNvFRev
 HkjsG9Xv/XHRKDwZt03TnVt/Xb0MR2w2X+iNlmXI1cE795A+ldym1VkH1QMDbFkouLGBATg96Vn
 xmfoCgDeBybZ/Peh7EJySexlcvePyhp3EJqGmo0vWFmnDBHngaXlkwVlwE2hKTS8oxCVN+9/lGa
 QIsu0DGaJsKMhd/MIU0v9OgHSReCzESXdVB62ayWi0toA8Yp
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

Move all register-level functions to dp_aux.c, inlining one line
wrappers during this process.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_aux.c     | 96 +++++++++++++++++++++++++++++++------
 drivers/gpu/drm/msm/dp/dp_catalog.c | 96 -------------------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  9 ----
 3 files changed, 82 insertions(+), 119 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index bc8d46abfc619d669dce339477d58fb0c464a3ea..cdcab948ae7086964d9e913dadadacc333f46231 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/delay.h>
+#include <linux/iopoll.h>
 #include <linux/phy/phy.h>
 #include <drm/drm_print.h>
 
@@ -45,6 +46,71 @@ struct msm_dp_aux_private {
 	struct drm_dp_aux msm_dp_aux;
 };
 
+static void msm_dp_aux_clear_hw_interrupts(struct msm_dp_aux_private *aux)
+{
+	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
+
+	msm_dp_read_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_STATUS);
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0x1f);
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0x9f);
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0);
+}
+
+/*
+ * NOTE: resetting AUX controller will also clear any pending HPD related interrupts
+ */
+static void msm_dp_aux_reset(struct msm_dp_aux_private *aux)
+{
+	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
+	u32 aux_ctrl;
+
+	aux_ctrl = msm_dp_read_aux(msm_dp_catalog, REG_DP_AUX_CTRL);
+
+	aux_ctrl |= DP_AUX_CTRL_RESET;
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_CTRL, aux_ctrl);
+	usleep_range(1000, 1100); /* h/w recommended delay */
+
+	aux_ctrl &= ~DP_AUX_CTRL_RESET;
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_CTRL, aux_ctrl);
+}
+
+static void msm_dp_aux_enable(struct msm_dp_aux_private *aux)
+{
+	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
+	u32 aux_ctrl;
+
+	aux_ctrl = msm_dp_read_aux(msm_dp_catalog, REG_DP_AUX_CTRL);
+
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_TIMEOUT_COUNT, 0xffff);
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_LIMITS, 0xffff);
+
+	aux_ctrl |= DP_AUX_CTRL_ENABLE;
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_CTRL, aux_ctrl);
+}
+
+static void msm_dp_aux_disable(struct msm_dp_aux_private *aux)
+{
+	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
+	u32 aux_ctrl;
+
+	aux_ctrl = msm_dp_read_aux(msm_dp_catalog, REG_DP_AUX_CTRL);
+	aux_ctrl &= ~DP_AUX_CTRL_ENABLE;
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_CTRL, aux_ctrl);
+}
+
+static int msm_dp_aux_wait_for_hpd_connect_state(struct msm_dp_aux_private *aux,
+					     unsigned long wait_us)
+{
+	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
+	u32 state;
+
+	/* poll for hpd connected status every 2ms and timeout after wait_us */
+	return readl_poll_timeout(msm_dp_catalog->aux_base +
+				  REG_DP_DP_HPD_INT_STATUS,
+				  state, state & DP_DP_HPD_STATE_STATUS_CONNECTED,
+				  min(wait_us, 2000), wait_us);
+}
+
 #define MAX_AUX_RETRIES			5
 
 static ssize_t msm_dp_aux_write(struct msm_dp_aux_private *aux,
@@ -88,11 +154,11 @@ static ssize_t msm_dp_aux_write(struct msm_dp_aux_private *aux,
 		/* index = 0, write */
 		if (i == 0)
 			reg |= DP_AUX_DATA_INDEX_WRITE;
-		msm_dp_catalog_aux_write_data(aux->catalog, reg);
+		msm_dp_write_aux(aux->catalog, REG_DP_AUX_DATA, reg);
 	}
 
-	msm_dp_catalog_aux_clear_trans(aux->catalog, false);
-	msm_dp_catalog_aux_clear_hw_interrupts(aux->catalog);
+	msm_dp_write_aux(aux->catalog, REG_DP_AUX_TRANS_CTRL, 0);
+	msm_dp_aux_clear_hw_interrupts(aux);
 
 	reg = 0; /* Transaction number == 1 */
 	if (!aux->native) { /* i2c */
@@ -106,7 +172,7 @@ static ssize_t msm_dp_aux_write(struct msm_dp_aux_private *aux,
 	}
 
 	reg |= DP_AUX_TRANS_CTRL_GO;
-	msm_dp_catalog_aux_write_trans(aux->catalog, reg);
+	msm_dp_write_aux(aux->catalog, REG_DP_AUX_TRANS_CTRL, reg);
 
 	return len;
 }
@@ -139,20 +205,22 @@ static ssize_t msm_dp_aux_cmd_fifo_rx(struct msm_dp_aux_private *aux,
 	u32 i, actual_i;
 	u32 len = msg->size;
 
-	msm_dp_catalog_aux_clear_trans(aux->catalog, true);
+	data = msm_dp_read_aux(aux->catalog, REG_DP_AUX_TRANS_CTRL);
+	data &= ~DP_AUX_TRANS_CTRL_GO;
+	msm_dp_write_aux(aux->catalog, REG_DP_AUX_TRANS_CTRL, data);
 
 	data = DP_AUX_DATA_INDEX_WRITE; /* INDEX_WRITE */
 	data |= DP_AUX_DATA_READ;  /* read */
 
-	msm_dp_catalog_aux_write_data(aux->catalog, data);
+	msm_dp_write_aux(aux->catalog, REG_DP_AUX_DATA, data);
 
 	dp = msg->buffer;
 
 	/* discard first byte */
-	data = msm_dp_catalog_aux_read_data(aux->catalog);
+	data = msm_dp_read_aux(aux->catalog, REG_DP_AUX_DATA);
 
 	for (i = 0; i < len; i++) {
-		data = msm_dp_catalog_aux_read_data(aux->catalog);
+		data = msm_dp_read_aux(aux->catalog, REG_DP_AUX_DATA);
 		*dp++ = (u8)((data >> DP_AUX_DATA_OFFSET) & 0xff);
 
 		actual_i = (data >> DP_AUX_DATA_INDEX_OFFSET) & 0xFF;
@@ -336,7 +404,7 @@ static ssize_t msm_dp_aux_transfer(struct drm_dp_aux *msm_dp_aux,
 		}
 		/* reset aux if link is in connected state */
 		if (msm_dp_catalog_link_is_connected(aux->catalog))
-			msm_dp_catalog_aux_reset(aux->catalog);
+			msm_dp_aux_reset(aux);
 	} else {
 		aux->retry_cnt = 0;
 		switch (aux->aux_error_num) {
@@ -403,7 +471,7 @@ irqreturn_t msm_dp_aux_isr(struct drm_dp_aux *msm_dp_aux)
 
 	if (isr & DP_INTR_AUX_ERROR) {
 		aux->aux_error_num = DP_AUX_ERR_PHY;
-		msm_dp_catalog_aux_clear_hw_interrupts(aux->catalog);
+		msm_dp_aux_clear_hw_interrupts(aux);
 	} else if (isr & DP_INTR_NACK_DEFER) {
 		aux->aux_error_num = DP_AUX_ERR_NACK_DEFER;
 	} else if (isr & DP_INTR_WRONG_ADDR) {
@@ -444,7 +512,7 @@ void msm_dp_aux_reconfig(struct drm_dp_aux *msm_dp_aux)
 	aux = container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
 
 	phy_calibrate(aux->phy);
-	msm_dp_catalog_aux_reset(aux->catalog);
+	msm_dp_aux_reset(aux);
 }
 
 void msm_dp_aux_init(struct drm_dp_aux *msm_dp_aux)
@@ -460,7 +528,7 @@ void msm_dp_aux_init(struct drm_dp_aux *msm_dp_aux)
 
 	mutex_lock(&aux->mutex);
 
-	msm_dp_catalog_aux_enable(aux->catalog, true);
+	msm_dp_aux_enable(aux);
 	aux->retry_cnt = 0;
 	aux->initted = true;
 
@@ -476,7 +544,7 @@ void msm_dp_aux_deinit(struct drm_dp_aux *msm_dp_aux)
 	mutex_lock(&aux->mutex);
 
 	aux->initted = false;
-	msm_dp_catalog_aux_enable(aux->catalog, false);
+	msm_dp_aux_disable(aux);
 
 	mutex_unlock(&aux->mutex);
 }
@@ -517,7 +585,7 @@ static int msm_dp_wait_hpd_asserted(struct drm_dp_aux *msm_dp_aux,
 	if (ret)
 		return ret;
 
-	ret = msm_dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog, wait_us);
+	ret = msm_dp_aux_wait_for_hpd_connect_state(aux, wait_us);
 	pm_runtime_put_sync(aux->dev);
 
 	return ret;
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index a22efb1e83d04cc5c9bc768a275df9cfb4752a2f..10dfbe94b627855b5a0e3cd4a3d77498d8d43ab8 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -81,102 +81,6 @@ void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_d
 				    msm_dp_catalog->p0_len, msm_dp_catalog->p0_base, "dp_p0");
 }
 
-/* aux related catalog functions */
-u32 msm_dp_catalog_aux_read_data(struct msm_dp_catalog *msm_dp_catalog)
-{
-	return msm_dp_read_aux(msm_dp_catalog, REG_DP_AUX_DATA);
-}
-
-int msm_dp_catalog_aux_write_data(struct msm_dp_catalog *msm_dp_catalog, u32 data)
-{
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_DATA, data);
-	return 0;
-}
-
-int msm_dp_catalog_aux_write_trans(struct msm_dp_catalog *msm_dp_catalog, u32 data)
-{
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_TRANS_CTRL, data);
-	return 0;
-}
-
-int msm_dp_catalog_aux_clear_trans(struct msm_dp_catalog *msm_dp_catalog, bool read)
-{
-	u32 data;
-
-	if (read) {
-		data = msm_dp_read_aux(msm_dp_catalog, REG_DP_AUX_TRANS_CTRL);
-		data &= ~DP_AUX_TRANS_CTRL_GO;
-		msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_TRANS_CTRL, data);
-	} else {
-		msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_TRANS_CTRL, 0);
-	}
-	return 0;
-}
-
-int msm_dp_catalog_aux_clear_hw_interrupts(struct msm_dp_catalog *msm_dp_catalog)
-{
-	msm_dp_read_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_STATUS);
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0x1f);
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0x9f);
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0);
-	return 0;
-}
-
-/**
- * msm_dp_catalog_aux_reset() - reset AUX controller
- *
- * @msm_dp_catalog: DP catalog structure
- *
- * return: void
- *
- * This function reset AUX controller
- *
- * NOTE: reset AUX controller will also clear any pending HPD related interrupts
- * 
- */
-void msm_dp_catalog_aux_reset(struct msm_dp_catalog *msm_dp_catalog)
-{
-	u32 aux_ctrl;
-
-	aux_ctrl = msm_dp_read_aux(msm_dp_catalog, REG_DP_AUX_CTRL);
-
-	aux_ctrl |= DP_AUX_CTRL_RESET;
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_CTRL, aux_ctrl);
-	usleep_range(1000, 1100); /* h/w recommended delay */
-
-	aux_ctrl &= ~DP_AUX_CTRL_RESET;
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_CTRL, aux_ctrl);
-}
-
-void msm_dp_catalog_aux_enable(struct msm_dp_catalog *msm_dp_catalog, bool enable)
-{
-	u32 aux_ctrl;
-
-	aux_ctrl = msm_dp_read_aux(msm_dp_catalog, REG_DP_AUX_CTRL);
-
-	if (enable) {
-		msm_dp_write_aux(msm_dp_catalog, REG_DP_TIMEOUT_COUNT, 0xffff);
-		msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_LIMITS, 0xffff);
-		aux_ctrl |= DP_AUX_CTRL_ENABLE;
-	} else {
-		aux_ctrl &= ~DP_AUX_CTRL_ENABLE;
-	}
-
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_CTRL, aux_ctrl);
-}
-
-int msm_dp_catalog_aux_wait_for_hpd_connect_state(struct msm_dp_catalog *msm_dp_catalog,
-					      unsigned long wait_us)
-{
-	u32 state;
-
-	/* poll for hpd connected status every 2ms and timeout after wait_us */
-	return readl_poll_timeout(msm_dp_catalog->aux_base +
-				REG_DP_DP_HPD_INT_STATUS,
-				state, state & DP_DP_HPD_STATE_STATUS_CONNECTED,
-				min(wait_us, 2000), wait_us);
-}
-
 u32 msm_dp_catalog_aux_get_irq(struct msm_dp_catalog *msm_dp_catalog)
 {
 	u32 intr, intr_ack;
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 10fd0086132092be88bb698e53124f87a906de70..d120a4872d444a4f8eb1e638d0e293033bf1334c 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -114,15 +114,6 @@ static inline void msm_dp_write_link(struct msm_dp_catalog *msm_dp_catalog,
 void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_disp_state *disp_state);
 
 /* AUX APIs */
-u32 msm_dp_catalog_aux_read_data(struct msm_dp_catalog *msm_dp_catalog);
-int msm_dp_catalog_aux_write_data(struct msm_dp_catalog *msm_dp_catalog, u32 data);
-int msm_dp_catalog_aux_write_trans(struct msm_dp_catalog *msm_dp_catalog, u32 data);
-int msm_dp_catalog_aux_clear_trans(struct msm_dp_catalog *msm_dp_catalog, bool read);
-int msm_dp_catalog_aux_clear_hw_interrupts(struct msm_dp_catalog *msm_dp_catalog);
-void msm_dp_catalog_aux_reset(struct msm_dp_catalog *msm_dp_catalog);
-void msm_dp_catalog_aux_enable(struct msm_dp_catalog *msm_dp_catalog, bool enable);
-int msm_dp_catalog_aux_wait_for_hpd_connect_state(struct msm_dp_catalog *msm_dp_catalog,
-					      unsigned long wait_us);
 u32 msm_dp_catalog_aux_get_irq(struct msm_dp_catalog *msm_dp_catalog);
 
 /* DP Controller APIs */

-- 
2.39.5


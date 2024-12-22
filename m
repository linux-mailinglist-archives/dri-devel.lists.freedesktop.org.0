Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F26269FA800
	for <lists+dri-devel@lfdr.de>; Sun, 22 Dec 2024 21:14:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6854810E0F3;
	Sun, 22 Dec 2024 20:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HGcruWpg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B41210E2E0
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2024 20:14:32 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-53e28cf55cdso3128500e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2024 12:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734898470; x=1735503270; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ZiRTkIToMIfCDZ0uwq35BvqdHymhl/XHtgqAZeHtC3U=;
 b=HGcruWpg780MbrL3hRXfmbUStLHA6KamRmjzQPlo9avXk0Rp7mxI6aATHeDN+sV+Gc
 jhJFI1tjyt8GgVVtEF4ip1LW9oo4asLQiDOsAVZKWxuA4epZJOMdvPrJrF1M99MSkwRp
 Pnlchkdb3Kvvcq+YRMCrVUN0nyf960OfRpexnZHcgWX6xb+EohH+H753QQoGXN/SNPh2
 1FOhzSqAObf7AyYIj9R/qtE5Vhhqo2dbvDYPBNjZ4Pj/nw6t8tuLKah0PAq7HM5Tnq72
 nhMR7gqQAkv/Bjx+LYHQ3S7M32IdkJmvrj+XZk95aBtbAiH+9v6OAZpeHlVkLqXq0Bbh
 DvWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734898470; x=1735503270;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZiRTkIToMIfCDZ0uwq35BvqdHymhl/XHtgqAZeHtC3U=;
 b=ktYMrEkt8xwZ6OvXbI/NU3UYUVUv5bZ/mO8DHyxbUv2Uw0YyVb+4lQw2cn488oldJa
 rAA7Gz8AH1vSRtTCGslJr/PO+9HjwAJotPvzEsDD4UkRLnjiyDZLqr+P5cUAM06u+f/c
 ZlJBFTeI+OBYc9dRgdArCOTzd8h6RS3xJ9Za444mxghOI9d/InLaqlMiN/fhiQu4/iOH
 6BgzHWmRIqWurf+BVZP0HFDquGYWDvvrRxV9XyPUry8C+a7yf5ZlAVkUoIG4/HjjtiFi
 H82uR4iQS9EkGgbK/3U3yiiQqzeCUmBpQHSeMcgj8UnRx291+uFfiSH1coUxiWcZAOa4
 H7IQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1EO+TR+fLDzMCF9VchyJI+Jmq0QZXpRn+Ck/qsX7R9xeEvjCKCfPICyY8tUQ1ZBHDwmOlnXNZHD0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOv9ChKLNXBGuwmB3OqXqbeu0/MZ8AJJYBErJoOVKUk1Rjc4rK
 YolxetZRtuEBEmRTyArf0I8Uv8p482geJ54yrI7N9eoVDHp4LpHW6Onbk1E+6IM=
X-Gm-Gg: ASbGncs6nAFz4Q0VHJIQtVKuYl9vOmK55c8l8bXRa/4uev2w597J62MdabJEzNzf59x
 afaxqqz/0F4cfDYrE4+vtBf0/aYJN71pc2UG7HD5DlQ9UWwFS06ve/bj7jnGkrsGvsLqVPZSVJc
 E32Ba2+2s52hVK+Nfz5MQl8u29+3DENDQnTOL6jPpMmh7Pjh39eJV9rvJWu9/ey/gfDwaCiu2Fi
 s57xTRxjQ751YUP02lUFIpI30VO5w2cDefOEtucoQkCY/QlLZeRaEhqnvMKprZs
X-Google-Smtp-Source: AGHT+IEc9sGFFxjgMygU/KFj/Ova2E0ZniOKrAQRMsYc7B69F2KQZChW6wKnewx27KAwhzkvg9DwyA==
X-Received: by 2002:a05:6512:b19:b0:542:2e09:639a with SMTP id
 2adb3069b0e04-5422e0963efmr2024713e87.10.1734898470356; 
 Sun, 22 Dec 2024 12:14:30 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f7765sm1034331e87.13.2024.12.22.12.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Dec 2024 12:14:29 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 22 Dec 2024 22:14:12 +0200
Subject: [PATCH v5 09/11] drm/msm/dp: move more AUX functions to dp_aux.c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241222-fd-dp-audio-fixup-v5-9-370f09492cf6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=14128;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=MS3Jq3FTH7OAqk+6xjtoz8ogEtz7ILA3qqXQxfHSPs0=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3pGMf/XjdU34+d/KXIvvK2jtNg0WSfbK0WKq+lq5bPtt
 w0qStU6GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjCRoOPs/z0Or90oOK+Yye7z
 MpG/3Tca++V6VIQZvcUWNpx85rFvCyff5nP8ziYnrfVWzvMwbFrocSPU2Vo0i3Np6a/7b/59+mo
 x9avr/WeGDF9FeC5dkFN99pVD4q3PLKt6icllmtujv6p+y8+wFhIoVA+89uLwocD6AGafOQu1hJ
 //itvuMzP9YrnwxibGUw7SKS8UHDJlA8JPCDpNnvTNoqA7+/UD9YCzTeofbARddTjd0jkrNgX+d
 nzP6/PaoKNPra01qn3GnyfXIkP0A0PTpdiE0xZd3dAe/3CV3Z7EoLkr7vy1Prm/t6D5/mfTZTyP
 9a2ebIr8YnHiZTHb+twVK0qfN6h+bD+3Ps+s2Njxd1skAA==
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

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_aux.c     | 94 ++++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_aux.h     |  7 +++
 drivers/gpu/drm/msm/dp/dp_catalog.c | 75 +----------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  6 ---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  4 +-
 drivers/gpu/drm/msm/dp/dp_display.c | 18 ++++---
 drivers/gpu/drm/msm/dp/dp_panel.c   |  2 +-
 7 files changed, 113 insertions(+), 93 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index cdcab948ae7086964d9e913dadadacc333f46231..f8ea1754665afa37ff9dbaf3f883d94c48bf07b8 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -403,7 +403,7 @@ static ssize_t msm_dp_aux_transfer(struct drm_dp_aux *msm_dp_aux,
 				phy_calibrate(aux->phy);
 		}
 		/* reset aux if link is in connected state */
-		if (msm_dp_catalog_link_is_connected(aux->catalog))
+		if (msm_dp_aux_is_link_connected(msm_dp_aux))
 			msm_dp_aux_reset(aux);
 	} else {
 		aux->retry_cnt = 0;
@@ -591,6 +591,98 @@ static int msm_dp_wait_hpd_asserted(struct drm_dp_aux *msm_dp_aux,
 	return ret;
 }
 
+void msm_dp_aux_hpd_enable(struct drm_dp_aux *msm_dp_aux)
+{
+	struct msm_dp_aux_private *aux =
+		container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
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
+	struct msm_dp_aux_private *aux =
+		container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
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
+	struct msm_dp_aux_private *aux =
+		container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
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
+	struct msm_dp_aux_private *aux =
+		container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
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
+	struct msm_dp_aux_private *aux =
+		container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
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
+	struct msm_dp_aux_private *aux =
+		container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
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
index 7021effc7020073b8b7f633b96286e3996d78d6e..9d6d59264a592cc3ae312b35e51d48c11bd141e6 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -85,8 +85,8 @@ u32 msm_dp_catalog_aux_get_irq(struct msm_dp_catalog *msm_dp_catalog)
 	intr &= ~DP_INTERRUPT_STATUS1_MASK;
 	intr_ack = (intr & DP_INTERRUPT_STATUS1)
 			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
-	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS, intr_ack |
-			DP_INTERRUPT_STATUS1_MASK);
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS,
+		     intr_ack | DP_INTERRUPT_STATUS1_MASK);
 
 	return intr;
 
@@ -106,77 +106,6 @@ void msm_dp_catalog_ctrl_enable_irq(struct msm_dp_catalog *msm_dp_catalog,
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
index a7b11fc08ea595aad50f09ca8d49696404514bad..5196188059f3ade2b6cc260ee65a7efb38844664 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -117,12 +117,6 @@ u32 msm_dp_catalog_aux_get_irq(struct msm_dp_catalog *msm_dp_catalog);
 
 /* DP Controller APIs */
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
index 2e49d71255c473399f7afa705cf0ecc903f10859..a96d8e46d00740be6027f4551b93627889f782cc 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2167,7 +2167,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
 			break;
 		} else if (training_step == DP_TRAINING_1) {
 			/* link train_1 failed */
-			if (!msm_dp_catalog_link_is_connected(ctrl->catalog))
+			if (!msm_dp_aux_is_link_connected(ctrl->aux))
 				break;
 
 			msm_dp_ctrl_read_link_status(ctrl, link_status);
@@ -2192,7 +2192,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
 			}
 		} else if (training_step == DP_TRAINING_2) {
 			/* link train_2 failed */
-			if (!msm_dp_catalog_link_is_connected(ctrl->catalog))
+			if (!msm_dp_aux_is_link_connected(ctrl->aux))
 				break;
 
 			msm_dp_ctrl_read_link_status(ctrl, link_status);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d852e7a853348cb2602fba917925ae43c55fa1a1..7266e459fc905da55a743afc16c0ebeea8755dc5 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1138,7 +1138,7 @@ static irqreturn_t msm_dp_display_irq_handler(int irq, void *dev_id)
 		return IRQ_NONE;
 	}
 
-	hpd_isr_status = msm_dp_catalog_hpd_get_intr_status(dp->catalog);
+	hpd_isr_status = msm_dp_aux_get_hpd_intr_status(dp->aux);
 
 	if (hpd_isr_status & 0x0F) {
 		drm_dbg_dp(dp->drm_dev, "type=%d isr=0x%x\n",
@@ -1353,7 +1353,7 @@ static int msm_dp_pm_runtime_suspend(struct device *dev)
 
 	if (dp->msm_dp_display.is_edp) {
 		msm_dp_display_host_phy_exit(dp);
-		msm_dp_catalog_ctrl_hpd_disable(dp->catalog);
+		msm_dp_aux_hpd_disable(dp->aux);
 	}
 	msm_dp_display_host_deinit(dp);
 
@@ -1374,7 +1374,7 @@ static int msm_dp_pm_runtime_resume(struct device *dev)
 	 */
 	msm_dp_display_host_init(dp);
 	if (dp->msm_dp_display.is_edp) {
-		msm_dp_catalog_ctrl_hpd_enable(dp->catalog);
+		msm_dp_aux_hpd_enable(dp->aux);
 		msm_dp_display_host_phy_init(dp);
 	}
 
@@ -1661,10 +1661,8 @@ void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge)
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
@@ -1677,9 +1675,9 @@ void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge)
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
index a5c3dd5dfc3bf0c2dd3e128742977a0343ea68ef..969d618c909876fd7a13aeb6e6c9e117071bc682 100644
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


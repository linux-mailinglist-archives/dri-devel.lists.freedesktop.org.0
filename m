Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E59A4ADE5
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 21:40:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E8310E2C7;
	Sat,  1 Mar 2025 20:40:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xcWqmUA5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D21C710E2C7
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Mar 2025 20:39:59 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-30795988ebeso35340921fa.3
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Mar 2025 12:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740861598; x=1741466398; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+KYAVzCtQbStD8nd5x330qtBncZeukDl4XD7BtrnUDw=;
 b=xcWqmUA5YLE1ifwntIloyQ54zehZPCYJwe8qtUELOf8b40Wp7brgUFt0iN8Fs7grgq
 ZuPP4oJfU5e8PvL6uxsHhY1/L4glZnsEzkTbWhgPh82QCujQzxJ6K7kva0flJ3tN5oTR
 WkqxJg4QtF+TJJ02RqZbTimgGWd31XOq3Sbawuia9fy7Y99fiMD5cTJPZOk2Sm7GjYBN
 yRK1EoNvh0Rk3VaUWgsFEaRJOy2lKV/BiJQN9FoF8Uqg4eMg/PoXQC9Utv9JxuVhlRiE
 pKtfdQdnXhrjMNDYeDg9/TiTdctiM8/7GGpZMcwpbT/2cInxmHBOOTgzsJ58g/ruNX0z
 6maA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740861598; x=1741466398;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+KYAVzCtQbStD8nd5x330qtBncZeukDl4XD7BtrnUDw=;
 b=txUgvRFWBpK7M3etUBWOXTJCMzGFFDSug1EQRvxGtbEUhOi7FkDZxVpkbmkqbjIXxT
 2VciSITJYpmiL4T6eFCfj4oHqUqcgCnNbiEdIgkrFe3CXuMutV49HIaUtNzdLeSaQOjy
 quAeW92B2MyCMvx5JYDGCWF3auQ/S7+ehs80Qg95dpboLbBW0tOBtVHwWwHKtvRbbqup
 8ytJNUP7Kp/oh5IWvg8ranQwiXKI4LEkjrf09OpoFoWZRpEnlWoQNCzzrB8EiscZShsO
 9A2I+qbDItQ7ppM+x1B8sjZ2KdhAz7cHJiI0bA1//ZvBVbxGS3Te+2Cwh90PQpwgviCS
 0zng==
X-Gm-Message-State: AOJu0Yxn8JViUoU0MtDrPabQW2vzs7TSZs4Rs4feddqIbVbnZy0XdxlZ
 vjdFw+HsZtJfgpU6vFSQ3ZyGOQrqOctACMjWYBk9XOfy1b3lL0mD+oYG/sT4a1A=
X-Gm-Gg: ASbGncvgfHmSXTkW/BXaLcmHDJ1Ly7TuDHb5rFCykN7P1pWHogqko3eBOGNB/M37HtN
 IQ2muLPxZzFlHrpdwT+uyhmFqxR0/y/pMWiQgggrC2v5OxqT/jU/5Om9AolL3+1wiKJh3YqcTbm
 NaRheIpvIGbJrbcw9+4vUdBZ9k4dd9jF69nA1bPLrbuQachEWhQqd30NZvNzbNcEkoRuruQa/ex
 0pYcKoyMMftefXrUMwPNNa2xpC3o/4BWvLXsWNIIN8CzdBOdH82SVg5yvDO6F0+eqPC6hK1ELuJ
 yIRPghs0gfoxOuM3rb0UThU2shWCpka1fddAjH/Mqd+HoKBH6Bff
X-Google-Smtp-Source: AGHT+IHxZfB6SghQHsusUYOTNL1ECjTrYfrGSlYEryujzcygjrlIUcuUbjvIxIs3D+BDVy6OsdCGJg==
X-Received: by 2002:a2e:91c3:0:b0:30b:9813:b00c with SMTP id
 38308e7fff4ca-30b9813b714mr28338221fa.27.1740861598162; 
 Sat, 01 Mar 2025 12:39:58 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30b931524efsm6668921fa.60.2025.03.01.12.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 12:39:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 01 Mar 2025 22:39:40 +0200
Subject: [PATCH RFC v2 5/7] drm/display: dp-cec: use new DCPD access
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250301-drm-rework-dpcd-access-v2-5-4d92602fc7cd@linaro.org>
References: <20250301-drm-rework-dpcd-access-v2-0-4d92602fc7cd@linaro.org>
In-Reply-To: <20250301-drm-rework-dpcd-access-v2-0-4d92602fc7cd@linaro.org>
To: Lyude Paul <lyude@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5086;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=d/g0s+1RbkEZsu0cFrspMKQl16Oh0pnUASV91YvLy1M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnw3CQpuBjfWf1ph1dU/ixVfTg4s3wl/60OKV3z
 mC89EVT/3mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8NwkAAKCRCLPIo+Aiko
 1TIxB/4t1ePhX9avgprXgUgmpU68WSKMtTmG2iChwAgh6sPQkNXYgKv7IsPU6RuBiaXtJ15sXrF
 Cqm1/tWcbxu2A4DvwxMmmEdd+iLm+60VfUqsywiku/wd6h+ikr36rBdQT8YgN5ilzX8doK+aiut
 0ZWKsdEEghFrxjpMWaxIL+fdjOtU3OuwkrKfrf56okHueVa/uswjeJ/RMjCPqvqMTLpWusgrHY2
 Nn5ZjZzvwee78uYsOfae96nNkmfgUnNkqHa/p01qWtqav3wu4X+meWrNKnin3qCs4N9TM3tlR94
 tOL/B4wjxjVgt+CDJ2i+Nf+C284BTMBk+3pSWXjEilLHlkck
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

Switch drm_dp_cec.c to use new set of DPCD read / write helpers.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_dp_cec.c | 37 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_cec.c b/drivers/gpu/drm/display/drm_dp_cec.c
index 56a4965e518cc237c992a2e31b9f6de05c14766a..ed31471bd0e28826254ecedac48c5c126729d470 100644
--- a/drivers/gpu/drm/display/drm_dp_cec.c
+++ b/drivers/gpu/drm/display/drm_dp_cec.c
@@ -96,7 +96,7 @@ static int drm_dp_cec_adap_enable(struct cec_adapter *adap, bool enable)
 	u32 val = enable ? DP_CEC_TUNNELING_ENABLE : 0;
 	ssize_t err = 0;
 
-	err = drm_dp_dpcd_writeb(aux, DP_CEC_TUNNELING_CONTROL, val);
+	err = drm_dp_dpcd_write_byte(aux, DP_CEC_TUNNELING_CONTROL, val);
 	return (enable && err < 0) ? err : 0;
 }
 
@@ -112,7 +112,7 @@ static int drm_dp_cec_adap_log_addr(struct cec_adapter *adap, u8 addr)
 		la_mask |= adap->log_addrs.log_addr_mask | (1 << addr);
 	mask[0] = la_mask & 0xff;
 	mask[1] = la_mask >> 8;
-	err = drm_dp_dpcd_write(aux, DP_CEC_LOGICAL_ADDRESS_MASK, mask, 2);
+	err = drm_dp_dpcd_write_data(aux, DP_CEC_LOGICAL_ADDRESS_MASK, mask, 2);
 	return (addr != CEC_LOG_ADDR_INVALID && err < 0) ? err : 0;
 }
 
@@ -123,15 +123,14 @@ static int drm_dp_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 	unsigned int retries = min(5, attempts - 1);
 	ssize_t err;
 
-	err = drm_dp_dpcd_write(aux, DP_CEC_TX_MESSAGE_BUFFER,
-				msg->msg, msg->len);
+	err = drm_dp_dpcd_write_data(aux, DP_CEC_TX_MESSAGE_BUFFER,
+				     msg->msg, msg->len);
 	if (err < 0)
 		return err;
 
-	err = drm_dp_dpcd_writeb(aux, DP_CEC_TX_MESSAGE_INFO,
-				 (msg->len - 1) | (retries << 4) |
-				 DP_CEC_TX_MESSAGE_SEND);
-	return err < 0 ? err : 0;
+	return drm_dp_dpcd_write_byte(aux, DP_CEC_TX_MESSAGE_INFO,
+				      (msg->len - 1) | (retries << 4) |
+				      DP_CEC_TX_MESSAGE_SEND);
 }
 
 static int drm_dp_cec_adap_monitor_all_enable(struct cec_adapter *adap,
@@ -144,13 +143,13 @@ static int drm_dp_cec_adap_monitor_all_enable(struct cec_adapter *adap,
 	if (!(adap->capabilities & CEC_CAP_MONITOR_ALL))
 		return 0;
 
-	err = drm_dp_dpcd_readb(aux, DP_CEC_TUNNELING_CONTROL, &val);
-	if (err >= 0) {
+	err = drm_dp_dpcd_read_byte(aux, DP_CEC_TUNNELING_CONTROL, &val);
+	if (!err) {
 		if (enable)
 			val |= DP_CEC_SNOOPING_ENABLE;
 		else
 			val &= ~DP_CEC_SNOOPING_ENABLE;
-		err = drm_dp_dpcd_writeb(aux, DP_CEC_TUNNELING_CONTROL, val);
+		err = drm_dp_dpcd_write_byte(aux, DP_CEC_TUNNELING_CONTROL, val);
 	}
 	return (enable && err < 0) ? err : 0;
 }
@@ -194,7 +193,7 @@ static int drm_dp_cec_received(struct drm_dp_aux *aux)
 	u8 rx_msg_info;
 	ssize_t err;
 
-	err = drm_dp_dpcd_readb(aux, DP_CEC_RX_MESSAGE_INFO, &rx_msg_info);
+	err = drm_dp_dpcd_read_byte(aux, DP_CEC_RX_MESSAGE_INFO, &rx_msg_info);
 	if (err < 0)
 		return err;
 
@@ -202,7 +201,7 @@ static int drm_dp_cec_received(struct drm_dp_aux *aux)
 		return 0;
 
 	msg.len = (rx_msg_info & DP_CEC_RX_MESSAGE_LEN_MASK) + 1;
-	err = drm_dp_dpcd_read(aux, DP_CEC_RX_MESSAGE_BUFFER, msg.msg, msg.len);
+	err = drm_dp_dpcd_read_data(aux, DP_CEC_RX_MESSAGE_BUFFER, msg.msg, msg.len);
 	if (err < 0)
 		return err;
 
@@ -215,7 +214,7 @@ static void drm_dp_cec_handle_irq(struct drm_dp_aux *aux)
 	struct cec_adapter *adap = aux->cec.adap;
 	u8 flags;
 
-	if (drm_dp_dpcd_readb(aux, DP_CEC_TUNNELING_IRQ_FLAGS, &flags) < 0)
+	if (drm_dp_dpcd_read_byte(aux, DP_CEC_TUNNELING_IRQ_FLAGS, &flags) < 0)
 		return;
 
 	if (flags & DP_CEC_RX_MESSAGE_INFO_VALID)
@@ -230,7 +229,7 @@ static void drm_dp_cec_handle_irq(struct drm_dp_aux *aux)
 		 (DP_CEC_TX_ADDRESS_NACK_ERROR | DP_CEC_TX_DATA_NACK_ERROR))
 		cec_transmit_attempt_done(adap, CEC_TX_STATUS_NACK |
 						CEC_TX_STATUS_MAX_RETRIES);
-	drm_dp_dpcd_writeb(aux, DP_CEC_TUNNELING_IRQ_FLAGS, flags);
+	drm_dp_dpcd_write_byte(aux, DP_CEC_TUNNELING_IRQ_FLAGS, flags);
 }
 
 /**
@@ -253,13 +252,13 @@ void drm_dp_cec_irq(struct drm_dp_aux *aux)
 	if (!aux->cec.adap)
 		goto unlock;
 
-	ret = drm_dp_dpcd_readb(aux, DP_DEVICE_SERVICE_IRQ_VECTOR_ESI1,
-				&cec_irq);
+	ret = drm_dp_dpcd_read_byte(aux, DP_DEVICE_SERVICE_IRQ_VECTOR_ESI1,
+				    &cec_irq);
 	if (ret < 0 || !(cec_irq & DP_CEC_IRQ))
 		goto unlock;
 
 	drm_dp_cec_handle_irq(aux);
-	drm_dp_dpcd_writeb(aux, DP_DEVICE_SERVICE_IRQ_VECTOR_ESI1, DP_CEC_IRQ);
+	drm_dp_dpcd_write_byte(aux, DP_DEVICE_SERVICE_IRQ_VECTOR_ESI1, DP_CEC_IRQ);
 unlock:
 	mutex_unlock(&aux->cec.lock);
 }
@@ -269,7 +268,7 @@ static bool drm_dp_cec_cap(struct drm_dp_aux *aux, u8 *cec_cap)
 {
 	u8 cap = 0;
 
-	if (drm_dp_dpcd_readb(aux, DP_CEC_TUNNELING_CAPABILITY, &cap) != 1 ||
+	if (drm_dp_dpcd_read_byte(aux, DP_CEC_TUNNELING_CAPABILITY, &cap) < 0 ||
 	    !(cap & DP_CEC_TUNNELING_CAPABLE))
 		return false;
 	if (cec_cap)

-- 
2.39.5


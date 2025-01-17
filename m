Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58097A14B8D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 09:56:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA50F10EAAE;
	Fri, 17 Jan 2025 08:56:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UdFyd+at";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF7810EAAD
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 08:56:54 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-3043e84c687so15914701fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 00:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737104212; x=1737709012; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Mk713zIqkuFnPb2k9vDHwIlJVqet2dF9Nf6XeVAyFFw=;
 b=UdFyd+at0KUSb3tUjDGzo9cv7RYns92NmvnCerpFUEAKZ5eBXDJiFYDb1H+5Qwxq+v
 1zmZ/0ILu/CwqQi/0DPAOT+/5zVRIJJTKBg8kLwxmPVVs9f5VLvXxf1G+SQIong8X82M
 jze2vWFhUWgeD8pt0yHBb3bc5DFLv5UBKBG2h4aUDn/rw+aQzOzcbMkwfw9jh0mz5+as
 K5Fwz1k430ztFmKrKQ2Z67LJHTtJaBiqRK4xTvyO7MBBVjw47T9D9bajuJFTPXUMRfkZ
 Us9hgGf+j5B+0ZvQu8eq8IxIBHlfq0QH9NFWIvTOpxJoEysudBiV29feTH0ix4+ZkmEH
 YvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737104212; x=1737709012;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mk713zIqkuFnPb2k9vDHwIlJVqet2dF9Nf6XeVAyFFw=;
 b=CW9YyuFMwF5djG+sosiMDcN5py9+TDmxtSZCGAa2ZEY7ifK2BzTICwvlnJDHMGtBq3
 6lYiHUspLJTxqfnT2B7Iam8HW5vu5qoU4pQNcH0i5kPlih+qLZvZFDVP4DR6hKQeoueR
 2OT5Izx7pUdN0ezF9PCmsmgaO7/qIpdutbwfftwXZuXwHQvHU2TeyGOZ672YgpdGKfjD
 roGhtXNs1XMXbYPe+3RwgMkRA3zXsi7gif7gh95U7ciaC3IWI1sjh75IIRk52zxNm5VZ
 Uwj9jwVZN35HPh5HGrKuZtM7DLp5cqD6wLdjvEcASyswFBtBkRe/d5nfU5/mqn5wMcAc
 f0DQ==
X-Gm-Message-State: AOJu0YxmHpFwCjr8btivgoDX07WbyNXfCRiY6umU1uC+gMDI2utoMzPp
 zurZ1cckJmI0hOEQjUSURD23Qql3t495YG3QzANF2rbj83udzdnd1YOq433ptXg=
X-Gm-Gg: ASbGncssSxDGS5cEezmJ37TyyG/6AI1Jxezvd09OvqeBRuwRyTTesXRzWc3uNVfJlUQ
 byXt+9HrnB+XMnUdihx0sb0YZJ7OnUYRxf5+JxS7Eqs54SCM+w75U+uQZxA2wsnc0TV/qpOBhcX
 fBoM1Ssh/JhiIJKy8rHEFK4X6fnnFhfmQS31iHfYFL74R6kAdmtOtCqhPT3YybJWI1O7jMO5OLs
 Pq3QO4+p1RUYwsMFReuieDzQ5qtASP0uGP+wWWmJggIDnlg3vLkZmpNDnn07Las
X-Google-Smtp-Source: AGHT+IFw6b5DGgJ5C+ZHUaVQALsPcG8Up1fk0OgnuUDBhelIJKkatG+E4Tbc8ihkec4t12QXNikf+Q==
X-Received: by 2002:a2e:bc83:0:b0:304:9de0:7d9 with SMTP id
 38308e7fff4ca-3072ca97e9bmr7789761fa.21.1737104212517; 
 Fri, 17 Jan 2025 00:56:52 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3072a330764sm3402101fa.3.2025.01.17.00.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 00:56:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 17 Jan 2025 10:56:40 +0200
Subject: [PATCH RFC 5/7] drm/display: dp-cec: use new DCPD access helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250117-drm-rework-dpcd-access-v1-5-7fc020e04dbc@linaro.org>
References: <20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org>
In-Reply-To: <20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4995;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=yUgbFQQuZ/dYQd+NfAYr+IxvStiBlneQ0vTNgNQQAgE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnihtFhYjFkcZsgDXpnBmRDvRuEdMohtYHIi7RD
 A/OG5uaM+mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ4obRQAKCRCLPIo+Aiko
 1SR7CACjrfksIHObG/st907FfUITqHNgfgPCITVGWryWXPcCQbtgUiOKySFRWEnlM72r0aDg/nD
 FXnZfoyTfQI9hXwnVa4uhva7QGKVCdgHRLhv8H94lHVq42uKGATAJ+zvHELkQ0qg4ljYUmV898X
 aGcuqAZNxgWt6Si/ZrL+E1XC+gzoh5RA1e9JDtnk8O37M/PJ3OrMoJ6Z5nZALOv6NfLbP0CdUNm
 MjTyrw8EFVfcxGrMpegm9mAUYrCK2arYhdHkbqVtDTfg0J7+bRNDYFAxO8Kv6xv8lDrZdhUNABc
 LPk1v6sh6U5eR5e7g481WY4KSsY1qCD4H5PFMBd2xUKfTzkV
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_dp_cec.c | 37 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_cec.c b/drivers/gpu/drm/display/drm_dp_cec.c
index 007ceb281d00da65f5b4957cb8be66c2ea25d4e4..237f9a6a8077c62ff562d8f2d04cab3f079ed367 100644
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


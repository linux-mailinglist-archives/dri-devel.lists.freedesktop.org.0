Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E660D9EB2EB
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 15:17:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CABC010E8E0;
	Tue, 10 Dec 2024 14:16:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aUnRjnS7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F4C10E3C0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 14:16:58 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-aa679ad4265so445613466b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 06:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733840217; x=1734445017; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8VieodBk7g9+NNIIq8wzqsxrxxT4oOk+FbtOuCNcBAU=;
 b=aUnRjnS7qv8YeTZl1kEfcO26yz0ZIkLJfBQWF7qv8YpIHCQI9gSsLnDKYmLrvpd2p1
 spsBLam8CcKhk8YtsyNMN1eDKr6lcmsU9PMWR54MoIwUUNx6hqXtHr71wvZpdz0S1MEu
 VwxUt+eSNOWnOPonLuElJczefSjZqDb6yJEoOPLQLjcBtBiz1AEIq8+NnaeL7taqKuDR
 oBbZf0nRHxycpcukgVc/5OZKdm+PyXhhz9HqPTUekLk7Kgt2V9IwJzxapOj6oUMX8Zo5
 CjtZUFxEW/Lj5smbK9zz+0XVnY1Rj2/f4NWv7wFCvYQDfpXI7LDt0xtvUGM8OkrrCCKp
 MnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733840217; x=1734445017;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8VieodBk7g9+NNIIq8wzqsxrxxT4oOk+FbtOuCNcBAU=;
 b=DFCKebqDHlSmtlNncrMct0pZiotRMvt0wIp2ZlLzkFoigrXeabAENPt1uu8YkI5/5w
 MiZYPO7JcSLO88D8mDCyv/Kmivw+XQ+F4bpcchFsjWh5KLj3oxDOe+TGf3VfwVs8WLEd
 p635oxtDaGNphzilMmICxZAbCkQnRkp0rjhIO9YJ4Q7wUxC8b1HVhOTZPTZOHTtZMBTy
 q7FYM2xIYhyujNAck9ENG6jpDnOjt8lrfmdNomUbXb62TNjNMkXfcuD3LFHcx1Vqownf
 6PfyDE0AIs/RYhMoKU/3HCUkmMES7Y4nsW6LSOz0E86a0CgGHzjXRfxDGX61yM1J+eyX
 3wJg==
X-Gm-Message-State: AOJu0YymdbN0wg9CNQbsrPsAcIDJucqBbPN3KD1USiDst2phI/ClWT7t
 Oo+/pJNSjfItQdvHB3nyyfB5weRywqQwNf3FIjgJawO/2+Kn0I4nR9bs3OPUX0U=
X-Gm-Gg: ASbGncsNCCEeUMNtM4LBbyPi54S8nyQPx51wPM+uxxW5Efp2bduy+BViJP+1Fb2FP2M
 azLXMBdFnTajEMgIqH8ZDXYNKiNaz3868EOOgeXJxbrkzN6Co9rojZi1SlgnAxx3YU/l+u2reBQ
 3O4UdKsFk/YCr1wOaBasohKCqm9ImVAstuIGxcHeQ68NPcKJx4RxM4d0EM77t3codO2z1GyJOWC
 g3IIwuaHXzebfYjt5FuZmaX/Uhlb8JOjILe8g64VcPQ/f9mLzqvi/hacEzRFA==
X-Google-Smtp-Source: AGHT+IFqj9fbpUiNnMEmvJaqOFp6heSbFuzVSyMydyTzS2DZeEIE3lH+oK4BSZlyPgf81n83uN7jJA==
X-Received: by 2002:a17:907:3da1:b0:a9a:6c41:50a8 with SMTP id
 a640c23a62f3a-aa6a01bebf7mr370929466b.17.1733840216571; 
 Tue, 10 Dec 2024 06:16:56 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3dc2602b0sm5104362a12.18.2024.12.10.06.16.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 06:16:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 10 Dec 2024 16:16:50 +0200
Subject: [PATCH 4/4] drm/bridge: dw-hdmi-qp: drop atomic_check() callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-bridge_hdmi_check-v1-4-a8fdd8c5afa5@linaro.org>
References: <20241210-bridge_hdmi_check-v1-0-a8fdd8c5afa5@linaro.org>
In-Reply-To: <20241210-bridge_hdmi_check-v1-0-a8fdd8c5afa5@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1866;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=iFbekFcbElRUJbcXMzK8ElBDVWKjAytyCvWyk7X8SUk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnWE1SaxHLSu0OtwBtkIyYbWi0IxmjxvAGhmxU9
 sS13D1+OkKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1hNUgAKCRCLPIo+Aiko
 1UE2CACOGOQdt26+zxC6axMeEn4OWtbasMLCfvKvA1gR4JdDpUaq+snGJvhcXNFOjtt9wRZiyoU
 NwA3TsTrw7jLPoeMiTgDTbOnpOJlfU3jUM9O20cerZqKPELyWcgL0Ozi9WvwOjqW32T4OtS4Zzu
 eT5+/7pHAGGBIlrWyq9PH8QhXjJUM5eYBYhnzLpQZLL/zCcrLilrQ52M7x+1VuQoDN5lvLOum3T
 UvoHF6rMV6yb0s5T+lzBPB19mjwLfKlKxyTk/lnLHPY63nsf0XvL7vlimDibnc5inXoiN1pwu1n
 CD7wjE1v3Qm5jgejFH8SAgaghLW1R19Q6YdkyRRyZ0TtCWX1
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

As drm_bridge_connector now provides atomic_check() implementation which
calls drm_atomic_helper_connector_hdmi_check(), drop the duplicating
callback from the bridge driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index c686671e4850a1af75b82995185ffc3cbb22a447..b281cabfe992eff88a4ba7bc903758bb119281f2 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -361,22 +361,6 @@ static int dw_hdmi_qp_config_drm_infoframe(struct dw_hdmi_qp *hdmi,
 	return 0;
 }
 
-static int dw_hdmi_qp_bridge_atomic_check(struct drm_bridge *bridge,
-					  struct drm_bridge_state *bridge_state,
-					  struct drm_crtc_state *crtc_state,
-					  struct drm_connector_state *conn_state)
-{
-	struct dw_hdmi_qp *hdmi = bridge->driver_private;
-	int ret;
-
-	ret = drm_atomic_helper_connector_hdmi_check(conn_state->connector,
-						     conn_state->state);
-	if (ret)
-		dev_dbg(hdmi->dev, "%s failed: %d\n", __func__, ret);
-
-	return ret;
-}
-
 static void dw_hdmi_qp_bridge_atomic_enable(struct drm_bridge *bridge,
 					    struct drm_bridge_state *old_state)
 {
@@ -503,7 +487,6 @@ static const struct drm_bridge_funcs dw_hdmi_qp_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
-	.atomic_check = dw_hdmi_qp_bridge_atomic_check,
 	.atomic_enable = dw_hdmi_qp_bridge_atomic_enable,
 	.atomic_disable = dw_hdmi_qp_bridge_atomic_disable,
 	.detect = dw_hdmi_qp_bridge_detect,

-- 
2.39.5


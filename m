Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BF78C34A6
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2024 01:00:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD74710E0DD;
	Sat, 11 May 2024 23:00:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="B3TaAf9n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2733610E0A3
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2024 23:00:32 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-51f0b6b682fso3250954e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2024 16:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715468430; x=1716073230; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3nGZSIFjpA7hWloLyPIcqlN98kQdeAEpnzUWGCLT48U=;
 b=B3TaAf9nktcCLVHR6v1oWmrlfhuDNi/kxez91nRR5QXcrGAaxb41rJ9ijcVVRHs0KR
 V9FrDrREvgmJ3nb0GKVFJZkDCaptCw/1NflcLZfT/XLh4jD5vLcdjH0YmMWX80yppbmh
 +Wjoh8+wESS2EGk7NCyw6n4JwkDduNCwPtpxOWVF9GB9fVFfZTGV+sRKiZFOWffSWbwN
 3ZQbsy8kC/GI7mMouXe/OCInJhs2wCIbr2BYAXBnUncm7MCbK/35mULYo2UEhuxSMeuh
 TPf3gacy1ICldYnE0gph3nd/GNrIw+A34NSm2BJs/lcw8+pnp0IWKkcDYXk+3HlPK1lq
 anaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715468430; x=1716073230;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3nGZSIFjpA7hWloLyPIcqlN98kQdeAEpnzUWGCLT48U=;
 b=gHtWRmy+j1CtryJUANKY293BYV+fhPyyTHOydJLbREv7oiSmxdsEsK1YmhOqvGAzrZ
 rMME47RNRpyjvvzZM31zPeiVL1KakS5qr2TPmhw7ldSiH2EDRIcWpUTH8dwwQvYFmnSs
 5xs4uU5Vl2kmNgUKK14H11NCV8COeoWhH4IMyCWbRwLMQwGSE7DlcnWH5k8fQChbucCt
 QQn1YtqSlXkZwRWOQLyRBMXo1zZJqQ+e7y3bREHh/QlFYGAZaG/CRJzS2iOh3VpJjHU3
 5NNt6DZ7XMByDdVCxGP/Uv2x+meCSMqHQqnSACPP+IhTeiJu0lXSzDtuIWq0Kq0jGfSs
 sBuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXR0sRSyOtrdy2FnPIqmO5iwVRiL9+bV+rnasaycNOULfHi+ptiKP5fmL1naDgMvAytJTGHXsAO3boO60GDeSBGLSOf/q8bjZvgONGCOkfw
X-Gm-Message-State: AOJu0YwY+U7Q8HDx5t7apedduCKakxTsZd+9r5O6n6jLBwe4UEeAuQSJ
 BfOGrrJaNaLCWBjfHwtZ3O81frnPv+PCyYPkreQUh2sq3pAHh9CBOL610bpdOGs=
X-Google-Smtp-Source: AGHT+IFN8eHZ/0IbW58SHvJPhPsmpX0SzkQZ4t3TEmoTUno0Y/oeyw/EDzIQKLC65rQedkw3MXcf1w==
X-Received: by 2002:a19:6410:0:b0:51b:ce76:7813 with SMTP id
 2adb3069b0e04-522102779cfmr4901016e87.58.1715468430358; 
 Sat, 11 May 2024 16:00:30 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d3717sm1134222e87.173.2024.05.11.16.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 May 2024 16:00:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 12 May 2024 02:00:22 +0300
Subject: [PATCH v2 5/7] drm/panel: innolux-p079zca: use
 mipi_dsi_dcs_nop_multi()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240512-dsi-panels-upd-api-v2-5-e31ca14d102e@linaro.org>
References: <20240512-dsi-panels-upd-api-v2-0-e31ca14d102e@linaro.org>
In-Reply-To: <20240512-dsi-panels-upd-api-v2-0-e31ca14d102e@linaro.org>
To: Douglas Anderson <dianders@chromium.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Vinod Koul <vkoul@kernel.org>
Cc: Cong Yang <yangcong5@huaqin.corp-partner.google.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1404;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=TlWCMSv/jiIpOAhYCOFQPYQOX5V6nOBAcUqCISh5VBk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmP/iJ3hmcn4EtNeWFrKpLrPvOewe6cnuQ7sp9E
 0aeMTNOOoKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZj/4iQAKCRCLPIo+Aiko
 1byICACRic7Hv3T681Ko0ZMoic2jYP4/lNy59Ox1wuPogwymz/YevHKOtV7wpqvZq2B5Z09txZE
 PS9NErQ8qcnj0FIUnrVL0gk8eD4BngE2qtqB+W26m02Snw2Vf1r/yljaS1zjbkFdFioD73Nvi6n
 m5eDY29Uqx4tWFgEJSpza1ztnCCUDuV+uCYrC/MIjgjAVvBdr7tBiTzh75clucUXL82kgUVSly/
 zu81FiBlcCL8u3Qs9LxZZH6xW4UNfCAwTRCsaRpTLz90KKDetFOouiOXfD7LzsgA5gICO77VJlM
 2ujcztYjWv0s6ESj54AhS+GoE0ZVKIJOgTZrWi+JDdOW3ECC
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

Remove conditional code and use mipi_dsi_dcs_nop_multi() wrapper to
simplify driver code.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/panel/panel-innolux-p079zca.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-innolux-p079zca.c b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
index ade8bf7491ee..0691a27a0daa 100644
--- a/drivers/gpu/drm/panel/panel-innolux-p079zca.c
+++ b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
@@ -224,21 +224,14 @@ static const struct drm_display_mode innolux_p097pfg_mode = {
 static void innolux_panel_write_multi(struct mipi_dsi_multi_context *ctx,
 				      const void *payload, size_t size)
 {
-	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-
 	mipi_dsi_generic_write_multi(ctx, payload, size);
-	if (ctx->accum_err)
-		return;
 
 	/*
 	 * Included by random guessing, because without this
 	 * (or at least, some delay), the panel sometimes
 	 * didn't appear to pick up the command sequence.
 	 */
-	ctx->accum_err = mipi_dsi_dcs_nop(ctx->dsi);
-	if (ctx->accum_err)
-		dev_err(dev, "failed to send DCS nop: %d\n", ctx->accum_err);
+	mipi_dsi_dcs_nop_multi(ctx);
 }
 
 #define innolux_panel_init_cmd_multi(ctx, seq...)                 \

-- 
2.39.2


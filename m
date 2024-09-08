Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C995970817
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 16:21:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D14610E281;
	Sun,  8 Sep 2024 14:21:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jlF63JM9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D520B10E281
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 14:21:50 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-42cb6eebfa1so283815e9.0
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Sep 2024 07:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725805309; x=1726410109; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DmNCAE4Q1YMX3Tcl8gMK7BYQKsWpwsEcc2NsJh2xrh4=;
 b=jlF63JM9fDSuOuisjkG5Qg8sqlDgDmrrIRJdZmExJnBlxD9udL3OyZlUiC0q5P4QAg
 iQ+SfWOmXtqSNgHO7jvEcNXPZxtbX9mQaXP5W00plCnLVtv3m/D9MYZ37Yp1tbqeeqzi
 uaY7pcJuxj3fQ1wZJW+8u3PGQjhUnE45YRw4j35NqS6uSLPSbDWbag7YCy/dE4TSvbPI
 TffBmS+/lFyP8xfOdoGCaHcg/4bf77w2VHyCkRiSZSU0hAPnIwQTyYxJ7vDbyYpNZb0J
 mtHLJrehHVeyYTyWNyBDlGrvq4fuSjd3kyzRB6l2MmBFv/ng+qih0CQzK31HWbtAsdzp
 HWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725805309; x=1726410109;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DmNCAE4Q1YMX3Tcl8gMK7BYQKsWpwsEcc2NsJh2xrh4=;
 b=HDDmU9h3c3sYP9iYRmTT7YmRO851aEPPOOZeP5ui6Ld8Mb6/z+8zFgn5tG/qpT95b7
 bvZx/VVtFM80QF62kJOsMOjw4tvod3iFjth83eXEQFKLEhV8yM0Q1RRAWjSVEZ8eIfOD
 ucouYJSoNfoXnmrmMpcbRPA2QKZM50aULk6xXHWMBK09nX9ltQBLOZZKwce/Qvieh117
 taMlDQFD/FpmNyTaxGUd2Gjjj5p3/yfiWckLtVJ9bIs+nwpUwLXlyGgSik+oKP+MM6sj
 SR2lcaFFczGo8AoSysHZmVERDl6GVvR4MrODWD8mC5X0Le85BLJsTWjgUSZTRZXnh6lJ
 Pz5w==
X-Gm-Message-State: AOJu0Yy0yrlBEBJJX5U4juFsGSRW1kk/dFVOaKxnoQBv8A1wSyTEVurP
 iUJIFo8FHlSuNdimLhn/HzbSaJUW526NHcaSBckCcG4GN3CnbxhUxJL7eFvssUI=
X-Google-Smtp-Source: AGHT+IEfPYmeZxoWXAcFQnFIynwYI3IhFwp318lmX0rGJhOu4zCB8JiThVgRlAkTPUtEGTM66TbBWA==
X-Received: by 2002:a5d:5985:0:b0:374:c4c9:d501 with SMTP id
 ffacd0b85a97d-3788969f8famr2540273f8f.10.1725805308342; 
 Sun, 08 Sep 2024 07:21:48 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37895675bc9sm3465092f8f.56.2024.09.08.07.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Sep 2024 07:21:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 08 Sep 2024 16:21:31 +0200
Subject: [PATCH 1/5] drm/meson: drop unused staitc dw_hdmi_dwc_write_bits
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240908-regmap-config-const-v1-1-28f349004811@linaro.org>
References: <20240908-regmap-config-const-v1-0-28f349004811@linaro.org>
In-Reply-To: <20240908-regmap-config-const-v1-0-28f349004811@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1186;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=xt0kZ7eoXJhJeMpnCj+RSo+GXDsYwuHZwovewC7CyRM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm3bLzifbiOLGTfi1rakImHboSKV6MijiY+nxNL
 64lIGN8Vw2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZt2y8wAKCRDBN2bmhouD
 1z1VD/wOZ9MQKyB3Sw1CKjUwzx//foRb4DryywNPfnPq4l8A3dIm616OmVccvSkkz53RxzHsiSo
 Dw7eEnEx2HVoW7kyWifS/sxsqjS+ZJNu6o96aJZNPknaYTjCGqvsm31f+pa4nEJrbh5K6FiC34M
 jDlUbCSrH2rdiUg9gB8kqAX+93smcGE7+Z10Q8e+v7U3AOr+RRMuFrcAjN+fbvV85gIg4iU+3y/
 k+l+eWOMcpnaAdQPcSnMx/vgGKSJuJHpQO91fE04UmJyzAwR5F8QgYSVcKByRExvYTirjmiDD4k
 13HJUKlryiBKlnP/3dtY3lA1eJaLwhaBnMLGwWxL4msNZF3martYB6dBVDA5Q6erhi9JEytv3Ub
 Ck26TT6lop4XdFmACe9z7xCNOvZ2yBRaE6MEG6PRcBvu8mpDivvO5qgntKo9mxltoomeo1GYOCm
 6R1wWzMkLJdMhIqe7eamaJo2hVQ3ukJeC4co9VFodFrMVzTdfFqbMDmRQPgymuj/NrGyOszj9Wu
 BDuPkwp9WiHXiWR3TA7WFsOBTacW5opg8ZN4omiWyDM0FzJRydwvB1jYYMEcdoNasl/DdhxVwW1
 S+JC3i1S3tCLgePg2qs5HvIsCsX0OC1eAphTQ96Axhrg6L20JVzHESqtRnLYOmerln9EJal3X6C
 SIMxC/TjklYx1pQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

static inline dw_hdmi_dwc_write_bits() function is not used at all:

  drivers/gpu/drm/meson/meson_dw_hdmi.c:276:20: error: unused function 'dw_hdmi_dwc_write_bits' [-Werror,-Wunused-function]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 5565f7777529..b75db829b1da 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -272,20 +272,6 @@ static inline void dw_hdmi_g12a_dwc_write(struct meson_dw_hdmi *dw_hdmi,
 	writeb(data, dw_hdmi->hdmitx + addr);
 }
 
-/* Helper to change specific bits in controller registers */
-static inline void dw_hdmi_dwc_write_bits(struct meson_dw_hdmi *dw_hdmi,
-					  unsigned int addr,
-					  unsigned int mask,
-					  unsigned int val)
-{
-	unsigned int data = dw_hdmi->data->dwc_read(dw_hdmi, addr);
-
-	data &= ~mask;
-	data |= val;
-
-	dw_hdmi->data->dwc_write(dw_hdmi, addr, data);
-}
-
 /* Bridge */
 
 /* Setup PHY bandwidth modes */

-- 
2.43.0


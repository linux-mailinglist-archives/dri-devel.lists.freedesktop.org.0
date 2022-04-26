Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD99511221
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 09:12:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0814410E31C;
	Wed, 27 Apr 2022 07:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E3A610E2FD
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 14:15:53 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id p189so11292894wmp.3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 07:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q1KyJUwchUoMJntE9mPRVh4KvvxwI90zYF3ltbPaCFY=;
 b=V7IRbt5EQFW76RH4jXgUdRR8FufOUBWtIVlca2ZxxWIUPSKakLWhN6NoMNO5IZD0UY
 7teslQh66Y4cQDGhwdWKEBpJucBKT8Kw9noGNeZJdJA+5gCERJHybRg1UCyKQu7u+LU1
 AFi04iYHG7HYwGOpEjJ5YUY/aQWThYk2UP5MXCG7ujqdYGXab++cIWhyShRHkfiHoWtv
 zDcTF6WjzxoYxWiFXXI/6MEBibU66vS38LWYSU3GdEAVVQWdY1b45I8i3DbycG8Hx9Yj
 nnq2IyR0BgCF41G6qKvr75CK1tlc75cHlGx5qjMeyjIfhcJFrWE45SaT9TAVvsbJs/Yw
 CoLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q1KyJUwchUoMJntE9mPRVh4KvvxwI90zYF3ltbPaCFY=;
 b=BSEaxN6erCL9caWXdcbak0YMJGUxm7AeXFu7bd/SWDHgO1lGVThAVHBMYJz5zB72Rp
 w79jh30bpLxudoBeqqhuJYTjnKM8/O1qagoGObsXF/t334L9NH+NOn/eUveHqmzBBtdo
 LZDLsdat98E00L3fpJ5UpRfUQfpn13rXWqt/2WGZQ235d+AigqHfd8JwaguAaiOPBAvD
 7QcqJp8xTAvHw+hRdFPRp2284M6hsAAVqkbVmUjvgZda4lZizulmzaMnskLHgMBEANvr
 m8l5zfjITWsDn8J5DKiEpw7TlVRj56j4Kk0K83EGx4O5PDJ5tRiOAFtCmLvltoTfofJi
 JQVw==
X-Gm-Message-State: AOAM533KMWXwKqMnKSRuiVemJR2U/PPBx2y6VsNc5wnxKjJt5stSdrb8
 xS5JMW/QYY3N2S2q21dP0i0c0w==
X-Google-Smtp-Source: ABdhPJxxoSbGjXzk5tIl6+2yY+mTWtME38DIhEf/fNfzKwGxGg0RGNENtQj/S7apGfjiDtH5vwYQUQ==
X-Received: by 2002:a05:600c:1e09:b0:390:f313:bf15 with SMTP id
 ay9-20020a05600c1e0900b00390f313bf15mr30877213wmb.172.1650982551846; 
 Tue, 26 Apr 2022 07:15:51 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id
 a2-20020a056000188200b0020aa2581c7fsm12998633wri.104.2022.04.26.07.15.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 07:15:51 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Hermes Wu <hermes.wu@ite.com.tw>, Allen Chen <allen.chen@ite.com.tw>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] drm/bridge: ite-it6505: add missing Kconfig option select
Date: Tue, 26 Apr 2022 16:15:36 +0200
Message-Id: <20220426141536.274727-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 27 Apr 2022 07:12:23 +0000
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
Cc: Fabien Parent <fparent@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The IT6505 is using functions provided by the DRM_DP_HELPER driver.
In order to avoid having the bridge enabled but the helper disabled,
let's add a select in order to be sure that the DP helper functions are
always available.

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/gpu/drm/bridge/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 007e5a282f67..2145b08f9534 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -78,6 +78,7 @@ config DRM_ITE_IT6505
         tristate "ITE IT6505 DisplayPort bridge"
         depends on OF
         select DRM_KMS_HELPER
+        select DRM_DP_HELPER
         select EXTCON
         help
           ITE IT6505 DisplayPort bridge chip driver.
-- 
2.36.0


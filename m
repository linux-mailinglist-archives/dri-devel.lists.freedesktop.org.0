Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F1B673B0A
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 15:04:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8FC710E94B;
	Thu, 19 Jan 2023 14:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E0B10E94D
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 14:04:17 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 iv8-20020a05600c548800b003db04a0a46bso3067712wmb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 06:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GC/mI6lQCD2v+9Dq5VgRk4R+zYjXPgjV01+G3TFhd9g=;
 b=XtK71Opt18vNIARTivzkJYj2xOJEeq/DrEEoTVl6Za7cfOLg3bma08hATH9TDvqnIc
 upybtOXxL6DwFWG+no4XduzSAeo4eUPKO2YgdpjBqA/tCjMVKMCqc8gsLuu1oWWarnxs
 zl6QA5XxQNB6YAn92JHG2ZwkfvLN2Up6SF4yXa/tOCr65ZB2Y4WLDch/AaVo3mWz0zGR
 chrKM6Nqmx+k8yWtlPtkgHq3nZMKIoOOSA3GgLeuoOLK+PV6pnF1nEPnE99sVumOdTfE
 lvNZc+OkFvRtOf1gCCM4NwIIAKtHdBCizFv7iMoMQCSeBf2WZH49T8jLBxVUmgHkw2Wc
 usDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GC/mI6lQCD2v+9Dq5VgRk4R+zYjXPgjV01+G3TFhd9g=;
 b=F5DL5TzNkvhdkMkfLnY0OQgU4Mj6aRbFjLxAjorp3rkEVykczQDGp9O77f1bq+iAOQ
 YIyTR1XUr913t6kCfJKVjg+QZfQ9xyd9Cx32NjKEF7wRkSEc2cVB8UXskTXneISxhsZe
 kYnEUz2tkEpRJojE8XFBrxZy1fL9/n2SesKFLUa7fek1F2Liz4JG4JMFuKKL5AcWhOK5
 MUUyvlIVQ9WwbBm1uIR6pHlBEZJKPvoR0fVzfX3BIMaMcQL/hnuGecVFtnyTiz18XXkg
 eUR05f8Zdn2xeUonOTT4EXqIl0NZYrZ64vGqVBgNtT3Llh5slmGZtMpmJcL+H8HJap0g
 ms8Q==
X-Gm-Message-State: AFqh2krqAAOg+A758dhb4JZ/k+R07v4qbJCEl92kfUwUhRsRz3SbHrD4
 B04axuUSXDf71WJBei15hOISIg==
X-Google-Smtp-Source: AMrXdXuWis8blSafsPb72kBGK3EbYI5GmdrOkUP0B97wcEjYaSB4sVVMVS1V6QZNDRtHZ5oo+R8xxQ==
X-Received: by 2002:a05:600c:2255:b0:3da:f950:8168 with SMTP id
 a21-20020a05600c225500b003daf9508168mr9983502wmm.35.1674137055705; 
 Thu, 19 Jan 2023 06:04:15 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 az9-20020a05600c600900b003b3307fb98fsm5273206wmb.24.2023.01.19.06.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 06:04:15 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 19 Jan 2023 15:04:12 +0100
Subject: [PATCH] drm/panel: vtdr6130: fix unused ret in
 visionox_vtdr6130_bl_update_status
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230119-topic-sm8550-vtdr6130-fixup-v1-1-82c4fb008138@linaro.org>
X-B4-Tracking: v=1; b=H4sIANxNyWMC/x2NQQqDMBBFryKz7kASSdBepXSRxEkdsDEkKoJ49
 w5dvsfn/QsaVaYGz+6CSgc3XrOAfnQQZ58/hDwJg1GmV1qPuK2FI7bvYK3CY5uq073CxOdeMAVj
 kxtc8HYEKQTfCEP1Oc7SyPuyiCyVZP2/fL3v+wcSkV3rggAAAA==
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Richard Acayan <mailingradian@gmail.com>
X-Mailer: b4 0.11.1
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following warning:
panel-visionox-vtdr6130.c:249:12: warning: 'ret' is used uninitialized [-Wuninitialized]

Fixes: 9402cde9347e ("drm/panel: vtdr6130: Use 16-bit brightness function")
Reported-by: Daniel Vetter <daniel@ffwll.ch>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/panel/panel-visionox-vtdr6130.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
index 1092075b31a5..bb0dfd86ea67 100644
--- a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
+++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
@@ -243,13 +243,8 @@ static int visionox_vtdr6130_bl_update_status(struct backlight_device *bl)
 {
 	struct mipi_dsi_device *dsi = bl_get_data(bl);
 	u16 brightness = backlight_get_brightness(bl);
-	int ret;
 
-	mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
-	if (ret < 0)
-		return ret;
-
-	return 0;
+	return mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
 }
 
 static const struct backlight_ops visionox_vtdr6130_bl_ops = {

---
base-commit: 43bde505d66a41c2ad706d603e97b2c8aa2fbe4a
change-id: 20230119-topic-sm8550-vtdr6130-fixup-fb25f686ba59

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

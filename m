Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C17E8C183E
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 23:20:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B52B10F53A;
	Thu,  9 May 2024 21:20:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="I2kHLeOm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A92DB10F53A
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 21:20:28 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-51fcb7dc722so1257577e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 14:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715289627; x=1715894427; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qSmAuCxNU1y3XahseuBRK4nFztnrZzASjwN1faGf/vg=;
 b=I2kHLeOmI1LISLM+3D26qTGpxXe1Huyjye5zmXtI3x3xs+NyIiXZfSjuhcbJLWPORw
 ftsgbiwCQbNYoGoRNQweKN4et3krZVxe5dZ051bhs7uIq7vILMkXYkd8RkrkD5q9JZzb
 5GM0+FGy+LT675eflYT8xjo2A0wkDnJzodSVOYeemI1kcScUFXbEgC6hDgd6UhFrnX4U
 aZ519J7IFtGcgKrPE4urTpVZCZXRwL8di0S7JtUZMAlYyoy6HZN9Wd07gCusQKjKvUYF
 Zuyi5kQNVMCWXlWG6h2ZjpI/YZcuGG2IA3tk6FJOh7SgGvLJbzBpahknJXvh3JUS0/3u
 VJNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715289627; x=1715894427;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qSmAuCxNU1y3XahseuBRK4nFztnrZzASjwN1faGf/vg=;
 b=LQad60h9C9yyqCPccA8l9ifEGlmvQpXFGRk0FP5Ncj74Egk+afDT+JiYMYlNcu5jaw
 qwZ0/R55DHeEoxGPY9cbnwMFmdwyOl6vVFYuyPpPBxpmp0D1bhlOvuWCeCB7iNIafwaD
 gSsFp75GGpqwdOVRifR2GyFpMMhDKHe1avcrV2I9erZM1uWSYAEF06CUZiIDFddQZft+
 rMRD/wqJ+jTi+7GkcFrqo+KFpsv2fP5okjbLZA2nPxCPxMMBXqN8njAIPtCQf3mpsDvI
 XsecwEiHXNmbEBOLv5wZfdAgZK5I+qCBCJFasIdWRWK5mLcnH4vQFKQxzYYJcMIixWsP
 z1aA==
X-Gm-Message-State: AOJu0Yyp4k9rscGTlFpHXvTUn6CC0FPti3LfdrcTobfN6pUWn8OcmuXZ
 M1Q9Leq6wf6g2I6ukTW7KCuzcOiU06gGnCZUuLRnQ+yW6zT+2LHvt7NUZV+s0jI=
X-Google-Smtp-Source: AGHT+IF3MbOHWe+Dd5cqT5itXTVz7GOfcbFYKIuZDqCR1HFSbb9PonNq/bo4qHWf+nls5HUXo433Dg==
X-Received: by 2002:a19:5e5d:0:b0:51f:b3b:6373 with SMTP id
 2adb3069b0e04-521e0c63c91mr1124319e87.15.1715289626701; 
 Thu, 09 May 2024 14:20:26 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d898fsm438832e87.208.2024.05.09.14.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 14:20:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 10 May 2024 00:20:22 +0300
Subject: [PATCH v2 2/2] drm/panel/lg-sw43408: mark sw43408_backlight_ops as
 static
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240510-panel-sw43408-fix-v2-2-d1ef91ee1b7d@linaro.org>
References: <20240510-panel-sw43408-fix-v2-0-d1ef91ee1b7d@linaro.org>
In-Reply-To: <20240510-panel-sw43408-fix-v2-0-d1ef91ee1b7d@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=982;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=9SBs1y5K2hzjnYPD9Ky3KqU2SZnDlGyGsApyJDQKsvY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmPT4XEcEqWGu8gIgOpNkqDt6I0aZl6LpNHXOET
 V6MyCND2Q+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZj0+FwAKCRCLPIo+Aiko
 1fCJCACVl1Tw8GbFfpEssdYtGcEkG30m5raWG9Fh2513tdXK57a5ckqCyrL0UTfa9/a8hhidWFn
 cr/f22s7eR6cHMOArnoYrfA8LPtP+j5QNmGZpYd+RsBFja7fvTaS0OcfU72PPiGucFCdri3em1Q
 JuefnV2vAE55nQSfNzMwxyJb9b3QvZpAl7gkxQRRi4/PLrNQib0q4XQ7E7YTqKzEGar72mR58nr
 9OwO46TWEVauAGhgvg2ry8FSWGSr+Lx8JmahgGJ2+znKRNmnJL2PS+Rvuv545LDxxv2dK1otRQm
 CAn8U8TiOFVBlinh5cl2ZBGjX5/NxLq80+OLy/eR44GeyqoP
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

Fix sparse warning regarding symbol 'sw43408_backlight_ops' not being
declared.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202404200739.hbWZvOhR-lkp@intel.com/
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/panel/panel-lg-sw43408.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
index 115f4702d59f..2b3a73696dce 100644
--- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
+++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
@@ -182,7 +182,7 @@ static int sw43408_backlight_update_status(struct backlight_device *bl)
 	return mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
 }
 
-const struct backlight_ops sw43408_backlight_ops = {
+static const struct backlight_ops sw43408_backlight_ops = {
 	.update_status = sw43408_backlight_update_status,
 };
 

-- 
2.39.2


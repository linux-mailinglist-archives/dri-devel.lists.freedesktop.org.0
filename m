Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E23DF8D24CF
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 21:39:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50D5610E2FE;
	Tue, 28 May 2024 19:39:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LmG+roZO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2967310E21A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 19:39:23 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5238b5c080cso1468217e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 12:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716925161; x=1717529961; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OMzDrUPXBetRBxhwNhxvFwAUk90y+ybpda/UwhIo+Wg=;
 b=LmG+roZOpcODjqVXa1u52MuFIoiR44074wbnhYgSIhepbDM4/WQM3AF/aipPpqY/KH
 7wg5cJ0OjiyoK5HfeO9UTMrmqPM89B95GhZx79ofkLlBjEhTqta2aflkpEorHuVArxM/
 IsbjXrB+ERAdrXH5O7/DDwpufLnKf1Y32KHQSycmMBqMAQDl6VEJB+df3oxyq9S3Kwyn
 tsxDhD+D6P+G4dhxCiMhNqsY5dDKhgGiiZd2e2ImzGLGq39fZIsk2p628oMYjIq9lHT8
 PO5H9EsOUY1YD+5cxPLC9SL5e9qQSMed6yaieSA62Dmbc0svi7S2e9SqaD6YAxxXbOKq
 8EFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716925161; x=1717529961;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OMzDrUPXBetRBxhwNhxvFwAUk90y+ybpda/UwhIo+Wg=;
 b=lka+/bj9ddz9cgMxKxnUqeqpMa+vAVDO0oSdROXWJ28RKlaHIjWEjSb37uG+E1GSf7
 6iYC/A51MECCCI6fZatqafee6v5seSdBX470/I7Q3CLfrODPTXVLxkzs5Fy92nZ5E6z7
 jo4WUqRejqJvygEPJprkhY5nJr/paegpRUhA0oWJn7I4VkGK+zS2X3sQAsHEbf9cPg0W
 wUAES6j/0Kx1TFSpj8s8EOkIZCJGNsUn6lsok/duSPBiik9YwLE0IrZGwlCcotgZT3+H
 DZNpULkuH9hhlUSPdV+MCbYDzT8RINiVUibVg2T70r22G3vGsSenotcPu8UnuVoB40DN
 cc9Q==
X-Gm-Message-State: AOJu0Yx/wbRzMcRcdYNmjhVt2mpWND7fJhwxOaQ6bq8G/RyNvWOw/ceq
 1TVz/jY9TR7d3AjrauYwt3qxsfIZ3UgyqYZRX3eY5zL65CfUrjy1o7fkzx4jHp8=
X-Google-Smtp-Source: AGHT+IErWuce9aRTgzYsOItaSivJAYEUeHJGEILEAjjDTx4aWbFd8+75S49CKu4CNqVt+Ys3JPc30Q==
X-Received: by 2002:ac2:561c:0:b0:523:88aa:237 with SMTP id
 2adb3069b0e04-52964caab7cmr7869500e87.33.1716925161160; 
 Tue, 28 May 2024 12:39:21 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-529711f96c9sm1045234e87.245.2024.05.28.12.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 12:39:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 28 May 2024 22:39:18 +0300
Subject: [PATCH v4 1/3] drm/panel/lg-sw43408: select
 CONFIG_DRM_DISPLAY_DP_HELPER
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240528-panel-sw43408-fix-v4-1-330b42445bcc@linaro.org>
References: <20240528-panel-sw43408-fix-v4-0-330b42445bcc@linaro.org>
In-Reply-To: <20240528-panel-sw43408-fix-v4-0-330b42445bcc@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Vinod Koul <vkoul@kernel.org>, Caleb Connolly <caleb@connolly.tech>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1108;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=JpBownv2A/v5s9u+r2T7bmswrFK7bcF3CJY4XHaV/rs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmVjLm9PT4rgSufs1N1DQ9nR+ydH1+hIK4hVb0O
 UFdMizG9E6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlYy5gAKCRCLPIo+Aiko
 1WTGB/9oJhsxnoP8SaNvbslvwO4vwB8P5YM1pgHeTK4f5awBy1BrzWHcn24PItaIkNG3cJQ9C6G
 Aq5N0gZ+eFpDMlgog7O6er+IxajzglH+FexACjtnCGhtaLUCCEXIYcxfO759My0X2E7HlKY3Ytb
 S7Ba3tcWJMb1w0kWduqhEKFVogO0HzdB8tpoLvGVdtS2tkTnGFy5sHGgFZbGfdABLI8ifeddA9D
 SuArUCPBtWwPNypPH9qgK2zNjOase6dyf2pswXwVuUbrIUPZ5frqzOQSGmqcizEZS7GbM32Z8DN
 it0a1IQmiGb7yAC3rakxmf03wLnnLWjvrp3WUKIoeZs+0Tra
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

This panel driver uses DSC PPS functions and as such depends on the
DRM_DISPLAY_DP_HELPER. Select this symbol to make required functions
available to the driver.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202404200800.kYsRYyli-lkp@intel.com/
Fixes: 069a6c0e94f9 ("drm: panel: Add LG sw43408 panel driver")
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/panel/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 982324ef5a41..2ae0eb0638f3 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -340,6 +340,8 @@ config DRM_PANEL_LG_SW43408
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_HELPER
 	help
 	  Say Y here if you want to enable support for LG sw43408 panel.
 	  The panel has a 1080x2160@60Hz resolution and uses 24 bit RGB per

-- 
2.39.2


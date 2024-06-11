Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F27904C58
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 09:08:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1040E10E7AF;
	Wed, 12 Jun 2024 07:08:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Tn9G2qfb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 413C810E166
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 14:05:17 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-7041082a80aso3460683b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 07:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718114716; x=1718719516; darn=lists.freedesktop.org;
 h=content-transfer-encoding:subject:cc:from:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=38tu7OukSsob3gjFMMjlwZapLvS+XgxyUoOOKJ0vVdk=;
 b=Tn9G2qfb1vgQle+MQHuu7u3fw31O1ROkeWxzOgetzBbXlheGr7d5M1mt1abhcJ/i7K
 ShaOB/APnLd73nmrimS8IyG+Y7bQlJQgPqAq///ZI3O3DuveQrpEKQF7Uqg4d0Xf4OIE
 tG7vUpPB4vGSrP60rLKgS60WGK2P/LJk7OqtSngUhGi5Mj5zs4FhHsZuj9sq9b4E5cQ+
 1d8wb2livViYvqCCQgN74UxH/qnJN+c+OpSLTvCniFf0YqasvCQCs0YbmeL7NgHuxdNA
 4QeD3yYpqyV+71nhPytbuXF0wi+rdBIiJWv9jDW5/EmuFnaZGJZBOLINxWL8A4BvdF/w
 B1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718114716; x=1718719516;
 h=content-transfer-encoding:subject:cc:from:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=38tu7OukSsob3gjFMMjlwZapLvS+XgxyUoOOKJ0vVdk=;
 b=o2zLXInu+gB/2pIm702PR2URfdZ6xZDtWWKv4T6oBcc4BSwQrdqciggc299xsAEkQu
 JL053j1qrAqZxbJ4KBTbDumwP/K4xuUcUUwj+I8lKemWAowQ2TuhfaLTdLvn/apFErTq
 3eOhwXVCWF1/0lYq4jfTvDn38ou9RJq2+eko1XbPyM/iDDrx4KnFYKqvfHbdkESypt7h
 BgiNevhxyZzpV52TRJewgUkNbAjbKFQrorHYZf+E4mt/TJy1kz12VSUom1VGDm3s9pws
 DOPYveqYoCG7e7MIe5AWDMa2n3yWpyfdQg9pwLC7puf2C4UGg2GkmqKVCzqKGWwvYCsP
 02EQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUu3b6z5MBV3lnFEJ7znvGHv+QFn7GFWtQ17ZIyQaLWi0V04MCNJuDh5pWnrKaTym7VHzMf53kLebl/MItFQTC64gFh+beY15YbJWWvoxO/
X-Gm-Message-State: AOJu0YzY7SLEooBMxAoK8m09fXXTYITS8SK4xhAwTZI4eAmr8de+8c6i
 2qp2/emToPdAL7w8aIScUFFMmIAwD3JVneWDD0RzjB1h7Zc8CjtT
X-Google-Smtp-Source: AGHT+IEVS+sMNyFBjvo2nPo59Rw+Yitrzl0X6ZQnPzDXsQRp1kcRfQtAKLgM+0aFOze8xPVBJashnQ==
X-Received: by 2002:a05:6a20:8408:b0:1af:dae8:5eac with SMTP id
 adf61e73a8af0-1b2f9cb8dabmr13394713637.46.1718114716341; 
 Tue, 11 Jun 2024 07:05:16 -0700 (PDT)
Received: from [192.168.0.105] ([103.246.195.195])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705b3198eddsm828917b3a.192.2024.06.11.07.05.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jun 2024 07:05:16 -0700 (PDT)
Message-ID: <1b7c19ec-536f-4f28-a68f-b03c1b51b99b@gmail.com>
Date: Tue, 11 Jun 2024 19:35:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com
From: Tejas Vipin <tejasvipin76@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/panel : himax-hx83102: fix incorrect argument to
 mipi_dsi_msleep
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 12 Jun 2024 07:07:59 +0000
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

mipi_dsi_msleep expects struct mipi_dsi_multi_context to be passed as a
value and not as a reference.

Fixes: a2ab7cb169da ("drm/panel: himax-hx83102: use wrapped MIPI DCS functions")

Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---

Changes in v2:
    - Add Fixes tag

v1: https://lore.kernel.org/all/d9f4546f-c2f9-456d-ba75-85cc195dd9b8@gmail.com/

---
 drivers/gpu/drm/panel/panel-himax-hx83102.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c b/drivers/gpu/drm/panel/panel-himax-hx83102.c
index 6009a3fe1b8f..ab00fd92cce0 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
@@ -479,7 +479,7 @@ static int hx83102_disable(struct drm_panel *panel)
 	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
 	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
 
-	mipi_dsi_msleep(&dsi_ctx, 150);
+	mipi_dsi_msleep(dsi_ctx, 150);
 
 	return dsi_ctx.accum_err;
 }
-- 
2.45.2


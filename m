Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E77063912BF
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 10:47:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F21B6EC41;
	Wed, 26 May 2021 08:47:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBCFF6EC32
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 08:47:35 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 f20-20020a05600c4e94b0290181f6edda88so8109514wmq.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 01:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ey2XQCTHoPB7PbhRpIhhlCIFboLF4MIg90vAb+6Iw48=;
 b=L/iJmUQ1wl4h9pSToLi6ngPyg5UA7AeSWQLOEuFjYdsGt+aIJ2JW3IZyE7TyAvl9zp
 glIhu+aKxXtueYZgd2owFNE0ZH3GVlcEDRAUqpItp+X/sLU+ZR0QYqsLVt80CWoZJUk/
 8d8WNwVuJvhfQqGDn92TSIpDtUNG2tSRqfbjU47JhqUsypTbNrf101/f47GA1k352++H
 H1+XxvhmsG5nyLGBwyds2ImgQK8W/kvKF7HlRSoMRQP+UXOpqJQkYUi1HhAHi+j/Z6X3
 TtYsAajhfILOXFoKHIGLxd1yRvhSIi+4tL6F4Et9K+iLfpi8CuxPUGxU+XqxliUJ2Jdq
 FoyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ey2XQCTHoPB7PbhRpIhhlCIFboLF4MIg90vAb+6Iw48=;
 b=oGy71P6Uo1+Gbuay3UiikAoX5svVvz0F3IJFshaNrdi2XvRHedDd5tyojsDFe5beO+
 6tcf2MsBbHckdPsnEehxz7wP7UMHleXTPFqEocY+icDv4de7USkoEsQTLXqek11r3Sd0
 vP8V/sJpfWM5hhXHhGW1AwZWNs3CU0ubBdS7Y0iszA/XgEK/HruNbo7j4bQBE5vkt3hX
 r7mada/hoDhvZFpa1Z/CfszQP+LZG50+iaDjBwIipOFMIha1wlvSGX7liHeVWRlDvXc6
 GXM/dGpm1WEDkbmWtyUaSmM8ob0CWL18EB4SR7Qiqk7jn/zjxFx65EyiQBlnxqbPtnO3
 Zndg==
X-Gm-Message-State: AOAM531qrTXSY8Nk1Fo627u9Oody5lYa0H6VXm2khsDaVWDPXq7fnGoG
 HwCSRwOzaDvdOX5AwowRFsRXNA==
X-Google-Smtp-Source: ABdhPJzhoEFdv2lfo6EL3yXLQSIgGr2CwhLPmszdq9ctvreMndQ6VRfnClZOGx7KUBNH8MO6zsGhOw==
X-Received: by 2002:a7b:c417:: with SMTP id k23mr11601416wmi.90.1622018854475; 
 Wed, 26 May 2021 01:47:34 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
 by smtp.gmail.com with ESMTPSA id l18sm18911918wrt.97.2021.05.26.01.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 01:47:34 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 04/34] drm/amd/pm/powerplay/hwmgr/vega12_thermal: Provide
 function name
Date: Wed, 26 May 2021 09:46:56 +0100
Message-Id: <20210526084726.552052-5-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526084726.552052-1-lee.jones@linaro.org>
References: <20210526084726.552052-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega12_thermal.c:171: warning: expecting prototype for Set the requested temperature range for high and low alert signals(). Prototype was for vega12_thermal_set_temperature_range() instead

Cc: Evan Quan <evan.quan@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_thermal.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_thermal.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_thermal.c
index 0dc16f25a463b..ed3dff0b52d21 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_thermal.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_thermal.c
@@ -159,7 +159,8 @@ int vega12_thermal_get_temperature(struct pp_hwmgr *hwmgr)
 }
 
 /**
- * Set the requested temperature range for high and low alert signals
+ * vega12_thermal_set_temperature_range - Set the requested temperature range
+ *                                        for high and low alert signals
  *
  * @hwmgr: The address of the hardware manager.
  * @range: Temperature range to be programmed for
-- 
2.31.1


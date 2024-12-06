Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4919E6ABA
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 10:43:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44FEC10F096;
	Fri,  6 Dec 2024 09:43:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vo6rDmNv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D23410F09C
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 09:43:25 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2f7657f9f62so17820451fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 01:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733478203; x=1734083003; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DR5UNfjajRu4P0t/KAHkaq8u/GtT1QuQGweWq5XMJM8=;
 b=vo6rDmNvjITc8fVZXYMA6MeRqgjQ9f+4D1nxqvGtpRUuXpuU6kit4JDGAFF2CVwR0t
 wSHnHE2ytEYLuHm9jTRJNgyb+1IzHJYisTBz0/SmOvXmh4vBXDi47fi9m/LjxSWz4RjS
 DUi8xyHq1f+M3Ppi1NEdxcIrp2bQ5AIuOb2NYgGRDOyRlqSutshebPVNVow/YIVQWWAi
 5nCKt7OpQERw3W+o6jTJN37XB8YCjhZXDtPPsJTQyuyfzzlZTmPKg/XNC+imnRLrt9Lx
 EVenYe9ew//xpj8rlHDtPPppGrshKWiCSGgJxNaS9pwFWq3q9gI0YwYSbIFShOBxbr6z
 eZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733478203; x=1734083003;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DR5UNfjajRu4P0t/KAHkaq8u/GtT1QuQGweWq5XMJM8=;
 b=YMGYG/oH5hEyo6E0V5oCcG4TuOfYtvUgjzcswTqyFQrJYRpvO0EOPmMZ2My/dCwHf3
 8g2X+JWDIpxsNip6OqQ4oyA5ZHOufPieIsnMG5IyM1n715AS4RQ3ZtLLCvDYabQW/n5N
 QYKor66uwaWv/UPIeTzTEvUDmBZWf6/CmeXQWvvhWMzAeYD4nDZmjXQkb9p4t08oAe4T
 +AS9n5EqmMFST/JSVOIEWtPK6iDWvkTXLN2RVsAMTvNmSH5K39OiVZRqr/IP14qYOINF
 vRuImCWVKQEi/W8wnhtfaTq0UMDyDVg17LfHwfIaew40azyxjcytAZtk16JyejmuiEAN
 3bXw==
X-Gm-Message-State: AOJu0YwBNC5oNUj+568CD45IoRWVeIr1wyjc7x7yrMWNwOsLYiYm2BQs
 LxI/lK94O3+lJ+HtsS/t33ZLGL7EelDMjzSm/MG+m9NYI3fgRktAZMqbB51KtO8=
X-Gm-Gg: ASbGncvHv8/hHHxnj2FIb4g+weXoG95xJ9vSky015YNW1Yy0O5EUGSvsBklYxB09Nkg
 a8fC/CqvnIZj4DaRu9fYhpBEmGlkOlTfLDj9vSVv8OmM1Z15toIPYNu6zSqXD1q6XFquf2WrwZQ
 7Ld4sv96zkjz/Wtit6ytWSMpXsbI6E1ATGKDCt3XUFU+fKLFlKA7Bw+jXdR7OCQXH79LnGSy3Ej
 P/ibo/uYALjN3GVt5IVDPpporpryooNt8foJRmipvdPIwqY5FrT+cl0kA==
X-Google-Smtp-Source: AGHT+IGCjsHeF9S3xd5zx/P4eEcmZ95qD374mHfeNE0TcJsafXsKauKXde2wl439IjRQlzjjyxvauA==
X-Received: by 2002:a05:651c:19a5:b0:300:eb1:a4f3 with SMTP id
 38308e7fff4ca-3002f8df262mr10870581fa.14.1733478203466; 
 Fri, 06 Dec 2024 01:43:23 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30020db3805sm4128441fa.50.2024.12.06.01.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 01:43:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 06 Dec 2024 11:43:08 +0200
Subject: [PATCH v2 05/10] drm/exynos: hdmi: use eld_mutex to protect access
 to connector->eld
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-drm-connector-eld-mutex-v2-5-c9bce1ee8bea@linaro.org>
References: <20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8bea@linaro.org>
In-Reply-To: <20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8bea@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1061;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=I1wH9N5enlUiSVwdDRB0wmAdGhFse9ySIo7WNjanmNE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnUscuTpR0+HiR38S1fTr4ertYoyhKL7gh5Neki
 QVFnX1dWgWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1LHLgAKCRCLPIo+Aiko
 1cP5B/4t0Yy2pHo0bHZjNzf9FSu/qDR8IpkFFhM98PVBn8EV3bNlLhb3/FOwaAYFawC0R7RFsei
 6gC0/YzWxhmMGYPjsOa/37GrWtmPrdHhBZ+KBT63EfOBOW+V3p8zsoWg67YBwUdMuuGRt0u0auc
 DgeeGk8WkE3xEW+/kPD2P0j0s/FWIYP6HpthpzIzXnTLkTKofLtovXgVO4JA7XKTloel9mAL6hd
 YV3thOkL+KoTiLV5O4nnCwLlrkMriaWauaCc/+rcxPaFF/ZnLJwVFuHb04GMj7WXisEfuKJ47PX
 zmzNh+qUndFSRAODqbBfgIEe9P0WLax3l98lRYUC73tWfPVy
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

Reading access to connector->eld can happen at the same time the
drm_edid_to_eld() updates the data. Take the newly added eld_mutex in
order to protect connector->eld from concurrent access.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index c9d4b9146df95bb46cb6bea4849c331616c2b463..6fc537c9048f5c8e57e30f083121c9aea6b99a5f 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1648,7 +1648,9 @@ static int hdmi_audio_get_eld(struct device *dev, void *data, uint8_t *buf,
 	struct hdmi_context *hdata = dev_get_drvdata(dev);
 	struct drm_connector *connector = &hdata->connector;
 
+	mutex_lock(&connector->eld_mutex);
 	memcpy(buf, connector->eld, min(sizeof(connector->eld), len));
+	mutex_unlock(&connector->eld_mutex);
 
 	return 0;
 }

-- 
2.39.5


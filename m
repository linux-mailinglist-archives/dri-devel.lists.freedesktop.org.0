Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCD39DF40A
	for <lists+dri-devel@lfdr.de>; Sun,  1 Dec 2024 00:55:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E98F210E602;
	Sat, 30 Nov 2024 23:55:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UMqCJubV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F05310E600
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 23:55:56 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-53ded167ae3so3457882e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 15:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733010955; x=1733615755; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IxPAXAkXtGSfHE+6MDrNppIG4p1UF1/hBXNkV/LR66A=;
 b=UMqCJubVZ2qCds0DqN8GOzRtWt7koNud8Buv/B/CCDiIH+5SXrMq+ZgIjp6lKSnYo7
 jGqkM6EF4sypEZqPM3A67fefDcfBNZkhRjwCrsmXBi+bXl81IGb4GsyQhaxQDXpXhtW0
 g9CFP+ZWtIosora26dWZDOJGsKVf4uB8Xzlk1rznlhQU2Oudl7hkdiM73lNEabDz68iV
 s5h7pON/MbNGbigsUW4F1yvRagyoJ3X3GIowcjU6cr0L8MLg3y29uG4dPwsePKZPO3HL
 i59DNDEgt2xS/vgIOY4hakxVrj+RFXy7r1UTO6Es0IWr/8MzvmW1E60VZo0ivlZRUZUV
 27UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733010955; x=1733615755;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IxPAXAkXtGSfHE+6MDrNppIG4p1UF1/hBXNkV/LR66A=;
 b=QJiyy9ShbSMqRypY5JuRtv6jQ/NDg4+0XFo9yp9HHIlf5goDfE5MFrXr60Yt1zOiYK
 zQGJQ0coQW70Il6UVXas76JX/Y/25Z66nj5/dBpgkO0dXajwvuc3EuGudDfb+KNlYk9G
 8uS7RCyC+YoxOWYJQCRtf0vHpHRSwDZQBsaDceJ4BRchGn/B7QOy+fS2q5/YNea3ZsIs
 Dl6xSve4aMnvcXoSMxNhkjWqMElgLEVTcL6Ij+jv/wpydGiWyLbsut2tnMzF4OG3h6Dz
 hSZoqe3jstTldAQPtDp/HbxVNC1xCEvOT3mv9ZUrgxvFpjL5Bgg0bKx1+BLk3zM1Aqaj
 tVFQ==
X-Gm-Message-State: AOJu0Yy/8o4shF5BNblpGvaNEJ/eaxmUP/oyBOL7ltJ1gJFJE2JB6LmM
 UB9ZpI5O8OGVJS9tyfZyZ7CwqIyQ4AsPiL+wlbpxm6I4IVZzwmruq+ZFDyeT5bY=
X-Gm-Gg: ASbGncuY2cu+bz1tk5BWeOvgi9puYhgTaxMTmou3a6t8DdlVoeuSFHGhtmLmhWtUqLz
 F17UGZmVBcfmekHWxTgLUEa/etGk8TmfT7q2iv14hTVGgS6umkvEHOiiCVuf3EJ5HoBNNpZGLBJ
 cA+Cgufs1IjkRhniLoiyjQwZFFQiaiG9gwBndqsLNwV/9J9aUwl0Axf33n+qvYPF+umBlGMXMcW
 KrIhFkIdfmOWckeC3AerOGtG6jfeuleP05SG/ewFnjp09f8tzRuTOUFTg==
X-Google-Smtp-Source: AGHT+IEiP7LHRrhx+1WZHRcdbmuf6q9u5MgJwOgShs4CTI9tBcamTyp7ARZo+XbTG2Yuz34sCo+pVA==
X-Received: by 2002:a05:6512:2355:b0:53d:e41a:c182 with SMTP id
 2adb3069b0e04-53df00dc9afmr8720884e87.31.1733010954752; 
 Sat, 30 Nov 2024 15:55:54 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df649647dsm900706e87.195.2024.11.30.15.55.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2024 15:55:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 01 Dec 2024 01:55:27 +0200
Subject: [PATCH 10/10] drm/vc4: hdmi: use eld_mutex to protect access to
 connector->eld
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241201-drm-connector-eld-mutex-v1-10-ba56a6545c03@linaro.org>
References: <20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org>
In-Reply-To: <20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1060;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=lgKbIB6YZtC8eZYzJNVRgp7pi8XWpClyliAzF0BBx7c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnS6XuosVGIxLVzwgwJF8Kv6UpGUOBhiO+tdbfv
 UsZEOLUAHeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0ul7gAKCRCLPIo+Aiko
 1V2qB/9kxbcsSq/MwiRkIP4VkcbtJ6bvhuQ7s59Dqdt1LcK7+6hylNonFqksssAfCJeGxk6Rz41
 PgtsXMXUIVf52olUBxeNBxH2OY+HNW4u5Q21SkNlRJh2M0Jmo7qcQnvJomIEF/JLLln7LE967u4
 LJzHO8MY0j+0/Z9PGmgWmBObyPWPr4XVV5y/Wl9HZN+30NHViJDwIBGE1n0gmK2YS1053O/fbr7
 UN4+r2D3Hx6EkhG2ZPFdgyrFznaQnOHP4P43x3PUt3CBr+Op2Wwa39k2bJPTyZy7IXk/JXc3yhM
 OB9LNQpibUSlojNLFeX59UmOP5dzC3uJw9JhdOJFJ+2D7v9S
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index b9fc4d981cf4d682bedd978795cf7284d2650e74..7295834e75fb1ab0cd241ed274e675567e66870b 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2221,9 +2221,9 @@ static int vc4_hdmi_audio_get_eld(struct device *dev, void *data,
 	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
 	struct drm_connector *connector = &vc4_hdmi->connector;
 
-	mutex_lock(&vc4_hdmi->mutex);
+	mutex_lock(&connector->eld_mutex);
 	memcpy(buf, connector->eld, min(sizeof(connector->eld), len));
-	mutex_unlock(&vc4_hdmi->mutex);
+	mutex_unlock(&connector->eld_mutex);
 
 	return 0;
 }

-- 
2.39.5


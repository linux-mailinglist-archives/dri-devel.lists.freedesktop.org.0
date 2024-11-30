Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CF09DF3E1
	for <lists+dri-devel@lfdr.de>; Sun,  1 Dec 2024 00:55:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5338610E17C;
	Sat, 30 Nov 2024 23:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SJ+OefU/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A75D810E188
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 23:55:33 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2ffc76368c6so46199711fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 15:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733010932; x=1733615732; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dVandmEjl29fQ2g5/xmh15AXnmnKHqPEzmZef3xU4Eo=;
 b=SJ+OefU/Wk4+cObk1HWtEYDUTqMgM9fVoMViei8+x0H5XNRUZoWIrLXjM917c+ApjG
 r6aD+r8C8pZjA9khEN1rja7FgTAdji+65o/g2SVQo4xdWzH8qFdd5/efS47ZWwZx0IE6
 QVinvU+gYKZsCKm/KIb3gSya//f+Cn10GwjF1YzqlfHyt0a779N6LRb0G/Ff6oMhT1MZ
 NpMnmSUI65Y5upAj7E/aZovwSAEVkg+2xjN7D7laPspe8TDp6AoM10Ws1MeULw+bbOAA
 H4c044G4832SMJHYk+65TkR6uH5vpOJnW7EywtHtF78C6o3BoJZNbGTGPV9YeOUo1EE4
 Xmdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733010932; x=1733615732;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dVandmEjl29fQ2g5/xmh15AXnmnKHqPEzmZef3xU4Eo=;
 b=FHHRidmxl0I35qo6iMRbUnSmtvPP1tx/wl4vqdY6JNhM5kt7QZw0uIEM3pVDJc4eXU
 YoSfQ0lDTyrFv7f2g4/ADh0cSnMFV+MVHtoB9FTWvkoWtXQ306+11NrIn1t3tB+UNxop
 pkHEQDKXLL+j8C6/ljzixWHkrDrg92XSI9RcBJd3/3AQCtTZBsXwKbyxrWA+A+Fe7ocN
 gZd8KudqRKn/uTKs8ikA+fyXDl2mvAv9NZyt/PtwYSWhn4/Mlsm9YCNPosAYcZIYVYjr
 BA3nZzG1B0LiHqOGDzcMVuMi9kaQa4DXDYLJu9y68oduwKBiiHrQi7ztoz6V2nOWbRBT
 cKRQ==
X-Gm-Message-State: AOJu0YzcaC7mNgDyPXZ38jtP5Xv4DWvDD8yWtExqZO937pDsW5EHSmtO
 hrDNlYzV9CwXGQW08FT+/xs3/BNFsNJMu69XWxkg2KdZ4pyEyzO4YORWDqDtqkw=
X-Gm-Gg: ASbGncsenllTsy/KkQ1+W7T2BWWJYaFqCXehtT4s72xahQzQKCL5Og3XcLexrghKEaj
 cb3HlW6YS/hqIGApa0QRfPklj9NXaTN9s7XzSXCmhvMUODZ6IMYvqNDbk2eoWcmbCSO/9Fk/+Lk
 LnSCN4VtAgNDE1Fabq4B+eOR0fx6szzWGu9urv9JbiBAEOa4gxj+J7H9NrTof1gHjUQLffKx519
 UCNax4XzKXpciYuyXxS6yOKUvHfYqfV55+4ZzQ0hP9Sz4jt/dViSDw+JA==
X-Google-Smtp-Source: AGHT+IFxIGZTCl2+FV0phQXK3nZn1ZVOLyIwEd2xBNXTWsJOfxd6ufDjErhJ/Bt/Wlo7yiHe3hXNJg==
X-Received: by 2002:a05:6512:2316:b0:53d:dc3c:2595 with SMTP id
 2adb3069b0e04-53df010b113mr13994153e87.44.1733010931778; 
 Sat, 30 Nov 2024 15:55:31 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df649647dsm900706e87.195.2024.11.30.15.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2024 15:55:30 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 01 Dec 2024 01:55:18 +0200
Subject: [PATCH 01/10] drm/connector: add mutex to protect ELD from
 concurrent access
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241201-drm-connector-eld-mutex-v1-1-ba56a6545c03@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2918;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=dRMlgzQ8g4adZeqAK73JToeVmDq3hWsW88+VTTxsaX4=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ7r30refv/TKFDs8Y2WIFPVQT4z9p9Ztb63x/CrnBwOpu
 9X8J3Z0MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAiMjXs/4xDs4XudBZPNPqn
 kCpyM6RdQOWzeLBy8ZPpGxftDLy97qNmD6N3i6urZu4ODovJnRfad3DHVKg/ur1et6Vl+2EZu0e
 yxsFXpq526Q8JCdBwub7SsPv3+VQt9zlV4VNuM1ZNmV8c+7DodCpXyU7/vuWHrAQTr0qLTuNJfi
 7+yf7LHPf/M7MW/7y1/o8Gc8MR93DzonOcBczZHvd3Lw7grt9wxPWA+kK1QFnfw27Ndcwznj48a
 nBgd8lz5tieNl+W3a6z98Q22chfUj3lPm/rWpttiy+c9vhvfVDCs6/vap3TuncOXcc5NpTp6qxe
 uz/kevSCnWG2aS7lyg2/S68xCj6sOHHJgUnIzND4q0scAA==
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

The connector->eld is accessed by the .get_eld() callback. This access
can collide with the drm_edid_to_eld() updating the data at the same
time. Add drm_connector.eld_mutex to protect the data from concurrenct
access. Individual drivers are not updated (to reduce possible issues
while applying the patch), maintainers are to find a best suitable way
to lock that mutex while accessing the ELD data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_connector.c | 1 +
 drivers/gpu/drm/drm_edid.c      | 4 ++++
 include/drm/drm_connector.h     | 5 ++++-
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index fc35f47e2849ed6786d6223ac9c69e1c359fc648..bbdaaf7022b62d84594a29f1b60144920903a99a 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -277,6 +277,7 @@ static int __drm_connector_init(struct drm_device *dev,
 	INIT_LIST_HEAD(&connector->probed_modes);
 	INIT_LIST_HEAD(&connector->modes);
 	mutex_init(&connector->mutex);
+	mutex_init(&connector->eld_mutex);
 	mutex_init(&connector->edid_override_mutex);
 	mutex_init(&connector->hdmi.infoframes.lock);
 	connector->edid_blob_ptr = NULL;
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 855beafb76ffbecf5c08d58e2f54bfb76f30b930..f0ca77bd42fd518d505d0db78557e0c8d83efb29 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5657,6 +5657,8 @@ static void drm_edid_to_eld(struct drm_connector *connector,
 	if (!drm_edid)
 		return;
 
+	mutex_lock(&connector->eld_mutex);
+
 	mnl = get_monitor_name(drm_edid, &eld[DRM_ELD_MONITOR_NAME_STRING]);
 	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] ELD monitor %s\n",
 		    connector->base.id, connector->name,
@@ -5717,6 +5719,8 @@ static void drm_edid_to_eld(struct drm_connector *connector,
 	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] ELD size %d, SAD count %d\n",
 		    connector->base.id, connector->name,
 		    drm_eld_size(eld), total_sad_count);
+
+	mutex_unlock(&connector->eld_mutex);
 }
 
 static int _drm_edid_to_sad(const struct drm_edid *drm_edid,
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index e3fa43291f449d70f3b92a00985336c4f2237bc6..1e2b25e204cb523d61d30f5409faa059bf2b86eb 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2001,8 +2001,11 @@ struct drm_connector {
 	struct drm_encoder *encoder;
 
 #define MAX_ELD_BYTES	128
-	/** @eld: EDID-like data, if present */
+	/** @eld: EDID-like data, if present, protected by @eld_mutex */
 	uint8_t eld[MAX_ELD_BYTES];
+	/** @eld_mutex: protection for concurrenct access to @eld */
+	struct mutex eld_mutex;
+
 	/** @latency_present: AV delay info from ELD, if found */
 	bool latency_present[2];
 	/**

-- 
2.39.5


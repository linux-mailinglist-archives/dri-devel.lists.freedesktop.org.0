Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5DF9DF3F3
	for <lists+dri-devel@lfdr.de>; Sun,  1 Dec 2024 00:55:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D9D10E5EF;
	Sat, 30 Nov 2024 23:55:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MADDvrQV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CADE10E5E8
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 23:55:41 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-53de5ec22adso3662446e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 15:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733010939; x=1733615739; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4cxY+K4yZx53tAspmDt/c32sXFm2om2yzHiockIbOqk=;
 b=MADDvrQVO7btR+DX7XBmwH0KtkDPAtaNQjeJbGRbNNI6TDy185ZOHkgzr3w8LeJG5x
 bNOxf7Z4F0tP5BolVFBpbXPvLCMU2FXDoqtz6d2/lqfqy4ptwOwhsByDc2aI6MqDAiNV
 u1bK/yLkVGCgWT3h7MeW4LQwyMnapKSjqxLJ+OLnMjOUh8aXWloBDhvEUVXQJ442UXWi
 OUTOj7uhFJvtC9/G0ZVBwBiHS6OLn6GYXaU5vJWQW+pCwvgkgdpHD0SOOSFWnuV9L7bt
 BwS1eKRWJcmtzki0n0Lu9bl9rtidBwGf/stpbuzajQ1iw9qk7j3LJQWw8Hk21EE/poyN
 /JUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733010939; x=1733615739;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4cxY+K4yZx53tAspmDt/c32sXFm2om2yzHiockIbOqk=;
 b=ELMIOkqr76oDfzM6VbXcGJTt3WzH/dyRLUGF97ZRdB1DRvY93Qggcvq3SJZTYAl+Mw
 Iuw1HAiKIiQv9ayPLw9FjHJjhWANFA6QyFHK9t27+QRwGsTGnZEsihWbDez6STC3JjVk
 YTaKlMAEgJmabku4Lbk9TCwRckYHlsO3s/UxvCD2k8+6+Q0e9o3AkbPo0ZBIUmyfyyzo
 7QMd1PTeTh8Hh46hC24/sY+O+MEf2lEW6K7GkwDMU/Joo6h7+cV+f2sy+11nxsIOHFS5
 ppgMrOzFAnQcMtZChvaAxKxayZS5V2UOXmlhedW+F5KOjsY4aWTj3DHogkgT5i8dswvv
 21UQ==
X-Gm-Message-State: AOJu0YzGMj7mjGrR/hoyKgzTr5BHHdJJVLMjRWweT6IB7WoHrwEIiu5x
 u1yQ1//w+/sb4NIzP9eioliF1VYkPQuFErU93sP7iJPgg5NF1/JosrbgHVhq42c=
X-Gm-Gg: ASbGncsDz8I3Z9d+41dQjGWkGePd37s8OYjYgL/wOLIIlk+UGkp7ZgMO+gNj0QHcZZN
 OILBU4DdxXHzPMlYWqmb15G9G86w99uuft1JdYB7Aw64ltfZT03zbArwXW/9MM71F/kv8/MU20b
 M3TGTZ3Z8AtsgeJbyq9vvti7IDHfzPiKTkhY+gomyVgiu4+neQm4sqY14nX4seWOx2vpsaefxmn
 UHE9q/hU+uRReuFfF/SvSoTUeIVn+zVZbgk/mLj5v9RAL886LkCHNLHBg==
X-Google-Smtp-Source: AGHT+IEqhH9kCuwXPt69aMI3EvWDASBu5c9Vx1nORTc0e8euAsFhVw9NvHYYoIvx2navJeV6UfeSbQ==
X-Received: by 2002:a05:6512:3d89:b0:539:f9b9:e6d2 with SMTP id
 2adb3069b0e04-53df00ff7c6mr10203616e87.35.1733010939471; 
 Sat, 30 Nov 2024 15:55:39 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df649647dsm900706e87.195.2024.11.30.15.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2024 15:55:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 01 Dec 2024 01:55:21 +0200
Subject: [PATCH 04/10] drm/amd/display: use eld_mutex to protect access to
 connector->eld
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241201-drm-connector-eld-mutex-v1-4-ba56a6545c03@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1033;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=tW4andf3hq3R7WEIVc+7/mi1YkJBAZuwRdePwQe7SPw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnS6XtKnM5W7YbjO8PfgAgXIKJMU347EHoG7pN6
 bC7slgMtUeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0ul7QAKCRCLPIo+Aiko
 1UpAB/98T+k5U79sPWHDEfdVoK/uxOqdWekFRUGXmaXz8lVAUaoc1w3Ob2vgVsHEmXEpRZcEqWq
 bqDqWhVxSkMp+nC/KP4LYMkzeAhQdwu6z7o3M+cI/LhyEPck5mRwoKlsIKia5ENA0q+YRaJX8R8
 D/MbaqjEkVX7h5ODRsXt0b8del0LoST99BcdJPq6yynl2AInKf1mwGTeXOm09nkJ7B6JX9D3N0r
 XnUieG4H8ZtcZAOSBh2bHBQePXm7XUKBlvFoHDklRqI/YU7jyKDWow4es6KEqLKgoa9z5zUayj2
 4MDN8Hi3OJ8XFsnfXmBTUuMae75l5OufjL1fj5yqKjhqazvg
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
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index a0bcc62f280f8e80f5d174cd2f567a8ec616e54f..2843283375551b0b85f5f897acdb2aeab652892c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1037,8 +1037,10 @@ static int amdgpu_dm_audio_component_get_eld(struct device *kdev, int port,
 			continue;
 
 		*enabled = true;
+		mutex_lock(&connector->eld_mutex);
 		ret = drm_eld_size(connector->eld);
 		memcpy(buf, connector->eld, min(max_bytes, ret));
+		mutex_unlock(&connector->eld_mutex);
 
 		break;
 	}

-- 
2.39.5


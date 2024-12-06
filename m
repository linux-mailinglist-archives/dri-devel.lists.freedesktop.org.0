Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 945D09E6ACA
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 10:43:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED83410F08E;
	Fri,  6 Dec 2024 09:43:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DueF6BsW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4B9B10F08E
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 09:43:34 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2ffa49f623cso19396091fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 01:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733478213; x=1734083013; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ZkigUKob5Mc9L+QSG9Cb+AQa6odUVvq9Ya0HTSeW6cY=;
 b=DueF6BsWLBXaajoMKsbsovSa/oZd2Tbt6YG4kOLl6BKNrc+JsuCb+8AF9VQTzrReVR
 5Wlme5Tu63adJ9yCjkcYgSTagyZ5ne+SwaEaEoDzL6RStIvJU6kYHHMNCOM7/eKtGZop
 zDOQss16MU4+jWjF9vLoLoBke1kqni+wUoeh4ZgoHIrhqRssvMRR/WBVjcrwOnIL174W
 tJCgFL96Ie3P4W4BvWO598E3xJ0TD4GSd3JMFdepipnZWvEbpVpv5T4mqeJEbIxUJuW1
 a/7fYY5lae6jGa6uF/Lo9i2Gzcyqxl8oiqqyrXL1LhGfyTfQy4wO6MB6rflycnNkHndE
 3ekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733478213; x=1734083013;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZkigUKob5Mc9L+QSG9Cb+AQa6odUVvq9Ya0HTSeW6cY=;
 b=n5w2qUxxOtYsXa35STfg2t/hGQxcDgEJBYNs+KFXaCXOX4+AspUObzjgTXK1Bb0vmk
 rk0mAopDdhBPH5Ai5amYpLWVSjWndW4Gh2OA+T/rbDjN/29QKJkp3INh8nUDprAOfn3l
 MMJJ860+JKt93IlrCqm9OBD7yVfMOPnpJh6pfj8SV3YQ/fSdoKCLCpTICYLCS3cwt8P1
 Lb/+DDDHOvYd+EMTaAWxGqFyxBFkrAiP0TCFMEfPZoS8XlaRKKaQLikMZjYVZ5u0xZZw
 omIr9Olv8f9jr6rNOm3/hUO0WWFwmkjtOCle2n2OgDoT2czK9U+4xqfXMvPk37LNAamv
 sLRA==
X-Gm-Message-State: AOJu0Yy66XEjgg5nJiwl03m90Rbk9cqwGFoXvwJt0kedxpTBgvZ0WuyS
 YzeS6bz6wxydv7qIfJg3URaO4XOBM6fvl4w7CJRVecr+e3GMIj/tVNDx8BwISbA=
X-Gm-Gg: ASbGncuAEvYeT9aJSf7xbctYhJvKqgqukKwmDWa5XnPzBL5UD3k7i54Mh63wFEdnzLn
 7goh/tFNJAX7L2bjN9TpjWSeg/jW8yM0A5IHE5QeD/Smx3ej3+YgR8B6LZkbM6OiYAwkmjhe2MT
 XZDHSJMU7FOp9M/3xh2fAIX07whAJR1fZke4v7wAPILpw1nzdX8Hl/zWD8jG5MHR2RtnUnt3Hp7
 awHNjdJ2Exi91CveynWuoX+t2vqnLMl7d8AJEBn13O2B5uybGgbO8+xKA==
X-Google-Smtp-Source: AGHT+IFnWgDd0LQiOOyqxao9HQ2SRRt2EDypVuazWQgG9g3xYWmvYLAFADof0/JzzA41KcgjmV4COA==
X-Received: by 2002:a2e:bc12:0:b0:2ff:d81f:2d34 with SMTP id
 38308e7fff4ca-3002f89e73amr8312691fa.8.1733478212768; 
 Fri, 06 Dec 2024 01:43:32 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30020db3805sm4128441fa.50.2024.12.06.01.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 01:43:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 06 Dec 2024 11:43:12 +0200
Subject: [PATCH v2 09/10] drm/sti: hdmi: use eld_mutex to protect access to
 connector->eld
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-drm-connector-eld-mutex-v2-9-c9bce1ee8bea@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1066;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=T6JPeyhrynxKGaIZwOdTxaj7xNpnpZ0LTNopG/6n9Zs=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3rQcX25kP/6099+Y3hx23Dzne8aLO9XzJFZb9z4/HOYm
 bH+tPU/OxmNWRgYuRhkxRRZfApapsZsSg77sGNqPcwgViaQKQxcnAIwkYJV7P8sEtsYGnS1fHZY
 N6v4y56cu637YlyXwKadV03zMlc4ttxq3Crwz6qYV7CtsrDo9MHlXvvuuuT7v7hov3+iOGuw84P
 eOuPsuE9iV7LLFxUsPR5gYsiefjVFO1nyt2usyI6ibhPhj7UMf39E749suNgw22P/LxFtziC+Tn
 WRtWELrrEc5tq9toNNREI5uXeBpOlzlubMi7bXX1sfPDcrdsf/x9liHJvac29p84ZL8z2dq1QgM
 7WlwLDhy4Qy7cfXWq0FX/w0s3kRpWmncvTdkXlJk4OKo1obHuSqT/3/T0mjdGMFO+vbmWI5eW1f
 jWc/nph+IGb3ku4TXWv7Lms/8ba/PcPz0OyqzlDRlRoPAQ==
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
Acked-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/sti/sti_hdmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
index 847470f747c0efad61c2ebdc3fb3746a7a13a863..3c8f3532c79723e7b1a720c855c90e40584cc6ca 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -1225,7 +1225,9 @@ static int hdmi_audio_get_eld(struct device *dev, void *data, uint8_t *buf, size
 	struct drm_connector *connector = hdmi->drm_connector;
 
 	DRM_DEBUG_DRIVER("\n");
+	mutex_lock(&connector->eld_mutex);
 	memcpy(buf, connector->eld, min(sizeof(connector->eld), len));
+	mutex_unlock(&connector->eld_mutex);
 
 	return 0;
 }

-- 
2.39.5


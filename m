Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 579D39E6AB1
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 10:43:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C8B910F084;
	Fri,  6 Dec 2024 09:43:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tXZXrFUD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE8510F078
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 09:43:21 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2ff976ab0edso19064421fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 01:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733478200; x=1734083000; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Wh7X6NiXjO0ZK0icbu5RRSIlyMlU/s3VBkgppSRGnTc=;
 b=tXZXrFUDq2zcVSLsBEQt0b7ZczZDF/K1IkZE5+A25SNxDKGynWzqEqOPSzWpXqPbPl
 x34DnAgEHpjzR9fFlWkt0DvwWfrjSC+88lXlLfws2L5zEF0K/rQj0ixwqIDfvQW1x1oA
 k8Jz/wGT3vYi/D28NU5B4QcUYqKRhxBS3nP3IMKkpdbBIRpLfRB8wqEwCZgmqlQU0WrT
 sqmxee/W6ciFmwrM/vHY8tIrIgt0nUejUAUjAOIKH+0fF0SJOL4CHGltB4FHHhlagmqY
 BucvmZ6q+ZfFyIcqVIhBFp80RY2K6I1EnN2jKS+/81q5Cm43VmDM5b5BEVtceMHmTM5e
 H8Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733478200; x=1734083000;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wh7X6NiXjO0ZK0icbu5RRSIlyMlU/s3VBkgppSRGnTc=;
 b=cXFqgT5EIv6jJWRH0eL0hLDMHxbr9a+QZ4vAB9iQWYrhbOagkd6OhGwZMp6Mu/M0nx
 XVJN+wLrFhJF/7L5lXbsJ4DOe4wrTSCWoKZOppk2cuQ/NoxEROpDTvwefOCpccrGW2ty
 nXcRwdvlZal1fXJTOe/++OWRtaSDZ3IaWQBB+udvpu/7RQA+74gCSeWjtIP2HasOS2tg
 aeUod6Fw4bOW+YMVTS0pLyYy+va6D6X2Q1MskpOBMvFUyfxo/gyoRdsfIu9iN6UEMYWP
 FXCuoCGrY24pDSS9c2+NhAeJrdsvzBPrvPmHyriUG7/Yzzg2QUQnj9Ux7rAfe1qJ00Gl
 l8tg==
X-Gm-Message-State: AOJu0YwmEJVjZNpv2WEmAQp6L4xuB/EUV5cWD/GNEF5geiVyHPcRvGTJ
 JuVtcSiQdaOXM6agbI0pfS94Em56AJNKBoccWUwzNE+Ks/WNT9iZjrFqalMUyHU=
X-Gm-Gg: ASbGncsdnbucFmHsO7xYfaDZZ6t1rRz773nbk7sgMO35J7TlFLA97ERp7g3ZYAICXW4
 4vQD0XVGknvYy/gF5out3IkGim0zTtisU1A0vlgzrlOVuDy1bt+XQWS+Bm7rEB0BjV43Qx+f94U
 Aq1iXet3PmtTXvKYLV+uGsljpNbLabZdrZwyLVmU9BeQk58sBp/vWvTZi0WYELNKj4EnY7xcYw8
 DrbvIVm67bOt64cdTQSRsjCCz9jTh0HrT5I4PV0xqL5jWwC/1bFymK2tA==
X-Google-Smtp-Source: AGHT+IFBxT03pxchsuAow8zXPe44X5vXMeN6+pzw5XgO7yRZwFTl4DSSqXqmQN/nIOwdAf9XNhMk0g==
X-Received: by 2002:a2e:a90f:0:b0:2fa:cc86:f217 with SMTP id
 38308e7fff4ca-3002fcc6314mr10909661fa.35.1733478199996; 
 Fri, 06 Dec 2024 01:43:19 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30020db3805sm4128441fa.50.2024.12.06.01.43.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 01:43:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 06 Dec 2024 11:43:06 +0200
Subject: [PATCH v2 03/10] drm/bridge: ite-it66121: use eld_mutex to protect
 access to connector->eld
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-drm-connector-eld-mutex-v2-3-c9bce1ee8bea@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1093;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=S2LNy/QG/Pvu7jaLQRzV8x9aVeJiuTJJixaJAknwzOI=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3rQcT0D+fWrdf7eTuO7miErYRRq/uGdQ1bilxVd2j16Z
 z/vrJ/SyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJpAtzMKxmXrAmIf3sx79J
 n5x5p8lbc0yOj9hTUFTN17jvemrJ5y/aGWJsN90qs3j2HCpJO3d947HLoiufHO66EK487WcPu11
 nm12ex98Nfkt75Zb+CJdfGT4lNHqmtrDVbxVb710nCjUmbrr9djMbP9vtiRfb/tVodHA/9zbjTp
 F0UW+v3VO2sZRl3zl7tlRnDkUX0/ud0U8Cn1rduKSQ9zDX7POhM+sniP9cXR1c0TOtPPZAG7NQc
 23p9xmHks64efKmbr0dkTlrP/cz+ZmZz6Y5SZ2ZxRdyk8vljuq/sP1L23tFZb+4PNSt8KvLEfbi
 rq6MWdlq8X/xgh4O6wU1LBPiahwNfFNvHJtbsfeP697ZAA==
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
 drivers/gpu/drm/bridge/ite-it66121.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 35ae3f0e8f51f768229e055a086b53a419ffcd9f..940083e5d2ddbfc56f14e2bdc6ddd0b9dd50b1f8 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -1450,8 +1450,10 @@ static int it66121_audio_get_eld(struct device *dev, void *data,
 		dev_dbg(dev, "No connector present, passing empty EDID data");
 		memset(buf, 0, len);
 	} else {
+		mutex_lock(&ctx->connector->eld_mutex);
 		memcpy(buf, ctx->connector->eld,
 		       min(sizeof(ctx->connector->eld), len));
+		mutex_unlock(&ctx->connector->eld_mutex);
 	}
 	mutex_unlock(&ctx->lock);
 

-- 
2.39.5


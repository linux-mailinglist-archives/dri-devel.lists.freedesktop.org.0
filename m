Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F959E6AA9
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 10:43:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 645E710F076;
	Fri,  6 Dec 2024 09:43:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fbnPiOq5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5182D10F073
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 09:43:19 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2ffc76368c6so17258001fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 01:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733478197; x=1734082997; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BXd2OzHxXLbpmSJUeio7TPXwyPaZHSalM8FhliMGDmw=;
 b=fbnPiOq5pCcywQT9RYZCjt4qazoN+DTdo8NEbMZkADw41Y1MwS1vRkfRjTRpbkaqg/
 AopCHx5yXGW5TZ1ZbxvtMTGFpTT5e4vm3+ACJ9ZUMOI9BL2hsmg1A4OK2GnQs/+Ab+tb
 56elA9SeN+judg7k5PIRIdjIb6lo/54VX2O/QUG90N3dqVNmpPEr0dHenZ3sUDL8pm55
 6qknxdLtp148HdDpQimXcW3tLzD92PsQWo29nW2rJM6uXTV0soAd0Zflwt1zFey8UEy0
 WVfINTwY6V0shY5oZB6LFoY0wwhQ7EGJTzRnxCRhM8M/YFX25Kq86NSj6AX3CHhWnVaP
 oDaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733478197; x=1734082997;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BXd2OzHxXLbpmSJUeio7TPXwyPaZHSalM8FhliMGDmw=;
 b=o1DG9sFH5rt7urfhj0fg//33C5tf2P6rqsdRTv3uLcblWZmwkbavWrNFYS/b6DkcKD
 Rk1hY1Xl76e1Ld4qVKdZzx5GrtLjFpJjoXi7oilqi1gfoP+HCc2kScQGQPManPM7oKKC
 pqeeSqg5m48KfKuqg2SsWLJWabjGu48AGBF5hX/kZ0Diz/EuhPC6qMhD8WiLwELywF83
 22AG/Y4qPGzcYkAB8uGAJRHcWU05wEn/eqaS0ts0VODL/R0JsFrEOCBw02sSBBGLHuP7
 Za++2ErLsmpelxKI1awse/iSedg7lid5Shk3tVNrhe4viq+WE7RyrqTNg+8dVZnzojCk
 /KWg==
X-Gm-Message-State: AOJu0YydZKTNm0lvRPcoRsm6n9j0uyLtwfeNWQG3IB/TLMG09RzrDgmU
 Fpy9xpGqrMmeiYlTcgZArBAyhK3/mlkUON/kJq/vbfI+R2KSbPFG3tFAre4TW3I=
X-Gm-Gg: ASbGncuabj1cLXN+0dhE1UcF7x7Pc1aQbXcGnyfVniYmFCrI7yP86oEVPqCJbIHDle7
 F3RmnQzXjLcY8lvVWkPOFwzA31MkYa3NWFq1O0ptci8XlXHE3lNYVuJ9lXZhK0FRFBuaHmXxlum
 5GNhuUtMK49A4oz42QYqiGSuo6OIFI2054CcMbPVLtbxLmjbKpH7jqniBjfx4c6d6CHiHVqQwl4
 7wB76zeYMMkPJKMLdmKjqkC8pl7BM4fec6CIa5FmYMTYMs7PyuCqPi2CA==
X-Google-Smtp-Source: AGHT+IHOzYvZJj8Vkykxd2x0JSD+NBvzpXfm6jlvPobPhv2vFXWDLmCYeuoQOdT69cvmzqWGVgvY9Q==
X-Received: by 2002:a2e:a9ab:0:b0:2ff:d0aa:11b with SMTP id
 38308e7fff4ca-3002f79b514mr6682241fa.16.1733478197396; 
 Fri, 06 Dec 2024 01:43:17 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30020db3805sm4128441fa.50.2024.12.06.01.43.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 01:43:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 06 Dec 2024 11:43:05 +0200
Subject: [PATCH v2 02/10] drm/bridge: anx7625: use eld_mutex to protect
 access to connector->eld
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-drm-connector-eld-mutex-v2-2-c9bce1ee8bea@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1073;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=zYvAEMAKJI/pMjPuMCGmB4bmJnIIZvQ3OxFQhHsqYJE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnUscuOWsnWIy+09WL6ZmIga61MhuoPN14wFRyc
 CTUUhM7PIGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1LHLgAKCRCLPIo+Aiko
 1QuCB/9GVQCw++i7vtbIm18C0qWy2CcrBgiveGKyYFt0iSpolRcgaG6RbcwjW5qst9mjy3Q6fyT
 wfoOatec5nsxe7H0nq3z0RdLACzVly4qvlxnotelWRdH/BQ6ujFXyFerWcmtX3JM/VBGIQ2IBAc
 cy6kBFVrFFfY0hrjJEvNHpO8Jw7wJ8KQT4IzkIw7DCzBnKyhq7QShr5O2I++bdw+2PCmYR+Ig4l
 AKpe8UolsbHTV1DesMVMTPNQMXDw/veYJp5B5GOVzXYZoSXeg0/Wp4HONWYO6yhjuqBKn4BL1Kz
 Qv9O5BOb777DITYj54ixLYloqlzSi9P0cRUdPa0UewnOGLrp
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
 drivers/gpu/drm/bridge/analogix/anx7625.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index a2675b121fe44b96945f34215fd900f35bfde43a..c036bbc92ba96ec4663c55cca091cd5da9f6d271 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2002,8 +2002,10 @@ static int anx7625_audio_get_eld(struct device *dev, void *data,
 		memset(buf, 0, len);
 	} else {
 		dev_dbg(dev, "audio copy eld\n");
+		mutex_lock(&ctx->connector->eld_mutex);
 		memcpy(buf, ctx->connector->eld,
 		       min(sizeof(ctx->connector->eld), len));
+		mutex_unlock(&ctx->connector->eld_mutex);
 	}
 
 	return 0;

-- 
2.39.5


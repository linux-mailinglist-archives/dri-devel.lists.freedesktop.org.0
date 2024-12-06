Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8E39E6AA3
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 10:43:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E523010F06A;
	Fri,  6 Dec 2024 09:43:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eZ40XVrY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13BF810F062
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 09:43:15 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-3001d009633so17069051fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 01:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733478193; x=1734082993; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=18q4gQOuDIplzBrBAcJFu0OAO0g8UI+mX4z+LvhVWHM=;
 b=eZ40XVrYYh/w8b2qPtBN6ETel3U+5qAiTuT1E+qTjvLb31Iaf53sLgvAR+mBiOi8Ty
 gbQd49KP4M1wV/qZ5jHqnBwcN3GtGV1kq7kleN0N9u6I0ADpBbMUehXUWrOnt7sB6KRE
 18mM77iWpVhNP79DkiFJvOgv6TNGIdg2k8Pk7tpT5RCwy/mC6fqrKB3XxL1RqDEj3b3h
 CIrAGJAiVLKI65aCb7V+ErcyeXPtoB+rOyyxgm5Dyq36bwItX9Jji9g4iNJTiYJFLgTV
 cMvfTmw/zfyR5ThoR6bbT6pMRPbmsbGLvwsOTeLXrvWSZnuZLvD3ctgQSWP2YAATsGYN
 O4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733478193; x=1734082993;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=18q4gQOuDIplzBrBAcJFu0OAO0g8UI+mX4z+LvhVWHM=;
 b=lhAu35LAlRgZBin2Bt8iH5vfg93zEpGyYqWyO+8yDNO+5HNZXqS5YJi9rr70aWlbtW
 Jn8kiIVMdLX1+ficTFijvUWkU8VZno5XOaB0MuVFXMTH9tcSNhw0IWktTG4UdLPTajMs
 yPUpCmjXZjSNN6cUy2L6tMeDBCVgnwgA22RJA499ZrbhSeteFl1rEH+bq0M+Uh4YNDyx
 Mg/dsypAhLl1lHaFy+MoS/B97c8Bx0rfc6+aPxerHbVOStsRWICWnF3gMikxo2MW/pWZ
 BrVupksivrQSoEOKEZAvGB7f/akLE/hNr5LECQT59nBSQnVa2/m51jc1l9EuqewZtsFa
 iH9w==
X-Gm-Message-State: AOJu0YyBRpPb9QxDkELtpIksPA0U8imZ4PCht1aCxTvonHORA035j1Qf
 IHEQa/osvceLsqFxfxwxObQH5IUFe2wTXfqJTrm8ooxxOsG4Pak7LTM9xnEupY4=
X-Gm-Gg: ASbGncuvLfNwUaoA3AGZNPgFTa6r7lbV3bqqYs4gbTP8g62F8B79SHHyGTQdHq64ZQh
 GLkqfr725RKaaBh0kHvqqLvkgfoCzDpNz5mRDUJDfyX2PDbhsQf9V0pN6OSbljbAn0EhOvR/oqY
 uiXo6IEyzL1kKVUyHM4xvEfXkeTicKDqBo4PIonxGZvu9SOJkCzyM+bxNlulFHSGI95hAAMSmCk
 Nouskv75HVUYQabfSWZmeg7aSa9/nB/bQx7SxIfLMsE9H9uuxD3N8V2wg==
X-Google-Smtp-Source: AGHT+IFlB2fuiknxBNErzknuRXx+qDTK7wodKTCgdmP8ceAx91Mtj3NnTnnSwVI5/Dq661IKM0tfTg==
X-Received: by 2002:a05:651c:b2b:b0:2ff:a5cc:3ede with SMTP id
 38308e7fff4ca-3002f8aaa07mr7238681fa.6.1733478193192; 
 Fri, 06 Dec 2024 01:43:13 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30020db3805sm4128441fa.50.2024.12.06.01.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 01:43:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 00/10] drm/connector: add eld_mutex to protect
 connector->eld
Date: Fri, 06 Dec 2024 11:43:03 +0200
Message-Id: <20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8bea@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACfHUmcC/4WNQQqDMBBFryKz7pQkGrFd9R7FRRqnOqBJmVixi
 Hdv6gW6+fA+vP83SCRMCa7FBkILJ44hgzkV4AcXekLuMoNRptJGaexkQh9DID9HQRo7nN4zrdi
 48uJKSzkayPZL6MnrsXxvMw+csvA5jhb9a/9vLhoVPpytXW0r61V5Gzk4iecoPbT7vn8BhEyW3
 L8AAAA=
X-Change-ID: 20241201-drm-connector-eld-mutex-8a39a35e9a38
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
 freedreno@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2527;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/vOUm2QLF9KTC3t0lXMssols8AsbLs9YQ26k7XYzTjU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3rQcV3/Ndz5pfcma9y/9rZALvb68aKcpQ1RgqeV82p+B
 oaVTIjoZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEgtvZ/4c9Sqg0ZWr8pqe2
 fkq46C7R7Ij/0hcTXiY8DPrrL7Y/pKL1lvoDK/6HR5alBc0X5Ggz2Jz+bc2f84dlrj4WyjdgnWI
 wLbFsz9v5a1Qdd3iu2stq0ikxlfHztWlGzrHikix2G1iPKsfWnA19s5yxeH1g4QWnF1wa67bc0Z
 KN/LzKudOiv9Ul7W3Zs1sxt00qVB30ruomiS5ayfXM2/NSZuebD+aiptZpF8y0chTMFWd1ly3hW
 Oa6Q+X9pN3MPZPsw/tUuRV2S6WV6Glarp3s9r7EQOPWjoXzwnaJ/c46NqWN4Ujq5JZGX/uZbXkt
 E06rZAWXfTi43uT3vvWcH0J27OkpUHvg2uXdmTT5GNNUAA==
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
access.

The individual drivers were just compile tested. I propose to merge the
drm_connector and bridge drivers through drm-misc, allowing other
maintainers either to ack merging through drm-misc or merging the
drm-misc into their tree and then picking up correcponding patch.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Also take the mutex in clear_eld() (Jani)
- Rebased on top of linux-next + drm-misc-next to solve build error
- Link to v1: https://lore.kernel.org/r/20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org

---
Dmitry Baryshkov (10):
      drm/connector: add mutex to protect ELD from concurrent access
      drm/bridge: anx7625: use eld_mutex to protect access to connector->eld
      drm/bridge: ite-it66121: use eld_mutex to protect access to connector->eld
      drm/amd/display: use eld_mutex to protect access to connector->eld
      drm/exynos: hdmi: use eld_mutex to protect access to connector->eld
      drm/i915/audio: use eld_mutex to protect access to connector->eld
      drm/msm/dp: use eld_mutex to protect access to connector->eld
      drm/radeon: use eld_mutex to protect access to connector->eld
      drm/sti: hdmi: use eld_mutex to protect access to connector->eld
      drm/vc4: hdmi: use eld_mutex to protect access to connector->eld

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 ++
 drivers/gpu/drm/bridge/analogix/anx7625.c         | 2 ++
 drivers/gpu/drm/bridge/ite-it66121.c              | 2 ++
 drivers/gpu/drm/drm_connector.c                   | 1 +
 drivers/gpu/drm/drm_edid.c                        | 6 ++++++
 drivers/gpu/drm/exynos/exynos_hdmi.c              | 2 ++
 drivers/gpu/drm/i915/display/intel_audio.c        | 3 +++
 drivers/gpu/drm/msm/dp/dp_audio.c                 | 2 ++
 drivers/gpu/drm/radeon/radeon_audio.c             | 2 ++
 drivers/gpu/drm/sti/sti_hdmi.c                    | 2 ++
 drivers/gpu/drm/vc4/vc4_hdmi.c                    | 4 ++--
 include/drm/drm_connector.h                       | 5 ++++-
 12 files changed, 30 insertions(+), 3 deletions(-)
---
base-commit: 84e541b1e58e04d808e1bb13ef566ffbe87aa89b
change-id: 20241201-drm-connector-eld-mutex-8a39a35e9a38

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


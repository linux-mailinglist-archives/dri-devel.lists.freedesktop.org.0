Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CA77CB05F
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 18:54:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B66C510E226;
	Mon, 16 Oct 2023 16:54:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD9D010E225
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 16:53:59 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-405524e6769so29583105e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 09:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697475238; x=1698080038; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vIIdmNh1k8eBG9uBUahNJ3kj0YyYALSyO9RgB2j97yc=;
 b=f+aW9+AEDai2+2x/rHiTyuDQSfIdCKnk+FrNhcBT2g+7GEuy6LJCQrkRbyPyl1dL3B
 x6uA11rFUBw2nGdMRlfEoeTW/HdHY60RkM0thWcEBsoGTxYJC0X6XAjqhKba0YHasiXF
 INhQkJxTY6KsAVuNIfndfU6OAn9DBs6b1xDHliD9yy508AyYC+Y4PJrCaQBKzXgbekXd
 P7hds0sFVAzPWllUoVhP7lRElOWp0QJqT1DTOgnL6p/a0t8matITdxJITsMOrLiEpepR
 eRuupp9V6mmgPFIDQGEYywfUuhAzyFWTCL69GrtEmT+kHzVwK0ZHXy/oOxV1d+nGcIyJ
 A6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697475238; x=1698080038;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vIIdmNh1k8eBG9uBUahNJ3kj0YyYALSyO9RgB2j97yc=;
 b=sAYKEyBKjjn7H3lt5e8oQgo7isHPUc7U3BgGRj7n3SNb4vCZAaL9SbPA0VCPVUJdvv
 SALCpXO40DEeM46svV8nskvjyLuM4tqUrYIRa987nITCXzinpEbLMssGTBgvvtFVczWt
 uHx0mmz6jUj6L+HDkf5ZX3VzCwunvJivHVBhTHc5e6mafqfqqiqY9pumZSug8fGgPptY
 EEMLy6+c0ZNbZ+A4Tr1MKpjpnGGUSXYvCUwrgcPPDd4xf3wzr1WaAVsj9DG3JakMCGn5
 iwMBfxWtJlLnrqJvIuaOtr+drG9v+b9THYdTbO443sGiGM5fIWMKtmL3NC6CpyAnV2Hs
 1IlA==
X-Gm-Message-State: AOJu0Yx59uBrPYwCT+yq+s6CniVr2IRdg6j7czv5s0LxWnkrj72PgxvC
 q1kGrLXxmP9sOTxTrBhAxyCX/Q==
X-Google-Smtp-Source: AGHT+IGNQrJKWVZTwl1M8CB81+la/NYfwFevzUPH8Cxa+b0iPaxGyHdMaaObw+TNq7n1VkEeyw/20g==
X-Received: by 2002:a05:600c:4fd4:b0:405:3622:382c with SMTP id
 o20-20020a05600c4fd400b004053622382cmr6366074wmq.17.1697475238254; 
 Mon, 16 Oct 2023 09:53:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([45.84.211.189])
 by smtp.gmail.com with ESMTPSA id
 s19-20020a05600c45d300b0040648217f4fsm7638996wmo.39.2023.10.16.09.53.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 09:53:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Douglas Anderson <dianders@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [RFC PATCH 00/10] drm/mipi-dsi: another attempt at sorting out DSI
 link powerup
Date: Mon, 16 Oct 2023 19:53:45 +0300
Message-ID: <20231016165355.1327217-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
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
Cc: Marek Vasut <marex@denx.de>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It is well known that DSI dosn't fully fit into the DRM enable/disable
model thanks to the intermediate LP-11 state: (roughly) the link is already
up, but the video stream is not yet enabled.

Previously we have handled this by forcing DSI link powerup in the
mode_set callback. This worked, but it was not an ideal solution. For
example, it didn't play well with the atomicity part.

Then Dave attempted to solve the issue by adding pre_enable_prev_first.
It also seemed to work fine, until we stumbled at the issue of the
driver being unable to negotiate whether the bridge/panel didn't enable
pre_enable_prev_first because it is not updated yet or because it
doesn't need the callbacks to be inverted.

This series is yet another attempt at solving the DSI link powerup
story. It adds two flags for the DSI evice. One of them should trigger
implicit link powerup at the atomic_pre_enable / atomic_post_disable
callbacks. Another one requests excplicit DSI link power control.

Dmitry Baryshkov (10):
  Revert "drm/bridge: tc358762: Split register programming from
    pre-enable to enable"
  drm/mipi-dsi: document DSI hosts limitations
  drm/mipi-dsi: add API for manual control over the DSI link power state
  drm/msm/dsi: use dsi_mgr_bridge_power_off in
    dsi_mgr_bridge_post_disable
  drm/msm/dsi: implement manual power control
  drm/bridge: tc358762: add support for manual DSI power control
  drm/bridge: ps8640: require manual DSI power control
  drm/bridge: lt9611: mark for automatic DSI power control
  drm/bridge: lt9611uxc: implement automatic DSI power control
  drm/msm/dsi: drop (again) the ps8640 workaround

 drivers/gpu/drm/bridge/lontium-lt9611.c    |  2 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c |  2 +-
 drivers/gpu/drm/bridge/parade-ps8640.c     | 14 ++++-
 drivers/gpu/drm/bridge/tc358762.c          | 24 +++++---
 drivers/gpu/drm/drm_mipi_dsi.c             | 31 ++++++++++
 drivers/gpu/drm/msm/dsi/dsi.h              |  4 ++
 drivers/gpu/drm/msm/dsi/dsi_host.c         | 44 ++++++++++++++
 drivers/gpu/drm/msm/dsi/dsi_manager.c      | 70 +++++++++++++---------
 include/drm/drm_mipi_dsi.h                 | 33 ++++++++--
 9 files changed, 180 insertions(+), 44 deletions(-)

-- 
2.42.0


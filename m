Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6D2A2DE13
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 14:41:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3E9F10E18D;
	Sun,  9 Feb 2025 13:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NYf/sONa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD7610E18D
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 13:41:23 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5450cf3ebc2so27333e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Feb 2025 05:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739108481; x=1739713281; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v0XUkknmm1Y+FD1G5vgfo0h0J5VjnUXt6d2f0Pk6IL8=;
 b=NYf/sONaeiuVaOEX2A8ivTGHO7igCQeROvqdo74o5Pocjmq3zx7UUkJa194az6OS7m
 78HU6cfMMfxFhjkaAvvCZ9jxKEnaCN2f4hZy/e9aqkwiXC1Xa0JA9UX2IZrhEfVeCVMe
 ZmG56mdtL/ukYgPgvhGar2TaEOlziCNnMKiQ/oaqKcj9aMZnNWaRaztNfzmB/4JAJI8i
 t5w00UiIluOLVFByC7DbyBuDmQDktmru2A55h94d+0B80qupMjlhddCGVvxL9PJXibok
 1wuhFFCLZRVYQkDEg85Q30MWtpwBcZ7pRfFIarsTW2RYO40FAGOynm1wAexgjBt5+qAF
 m5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739108481; x=1739713281;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v0XUkknmm1Y+FD1G5vgfo0h0J5VjnUXt6d2f0Pk6IL8=;
 b=PkTiNqeSztTNh3T+XexPhU4VfpYtaxT1lbKF39YtNnzCDZGdCCpwkZOXY6iYZyi16r
 gvKoM5kzxlimJdGLTifVlrgMaChDE1iLXviH01AqlQZ1cCPwDQC+ItiO21jcwQKRhC4/
 E1uKJ1djpMO82TBiMF60vrZ8LUQFeKpZAgRKm1e9tRY9bpWwDcbInvUWQ+XwQKZZOrWm
 IjjpUGO3osM09d/oJKYfkEsoll5h9Cs8i4MbL+c9yVNv935JYwff6ca3+c04JAAm5GIu
 tXeRzC/aX0WT86hekfxZhVXWDukbVe6hlr5RGNRKbGuEd23+Wphg7aOZAxD1DpYEJlpa
 LrbA==
X-Gm-Message-State: AOJu0Yy9cgVtYWtMzwxCuYhqfJM+cEStWXlvrOusFft8qSQZleajX/kd
 WPkYeOYvJeA84XxufmQFGcadBoxYVM1LotA5qjdzAON4DZunAPCdTelEjwuxU7s=
X-Gm-Gg: ASbGnctKGRvuFGCcee3R4HassaZ8FAg03aIAjZp2OW3V8l262YmtaoAwOfwSkMzXxzm
 RETacOS6QwpjB+L9gkYoJHes3YylAe3PK+Bsl7Es9tuGQ3RUzzLZ3hcY4/lSiBx31/yBfPXJxhf
 QWKZOPgLHZBri5fgrLJEN8euV3XntGEESyDB2nbfyICyPXN6JNrr8iSHsDZWNMFlWu0koYECTQH
 1Y+2HksLmO85kizwQpBjZ/YIVB/fuzJoqlcHYNkJgytQBEyOD2p++nHMKISneIFkMW1vxQ0uAiV
 uGqxdABF8f9Dwc+TAxN1oHI=
X-Google-Smtp-Source: AGHT+IEVGIkfomEE/NNz3tc+YjlybN5PbVbSdbBT1FpoSLCs5jMkjRbEzg9IC54Jdc75JDpb8g6Hpw==
X-Received: by 2002:a05:6512:3b23:b0:545:646:7519 with SMTP id
 2adb3069b0e04-5450646766emr1266904e87.0.1739108481449; 
 Sun, 09 Feb 2025 05:41:21 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545069b3f77sm362914e87.63.2025.02.09.05.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Feb 2025 05:41:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/3] drm/bridge: reuse DRM HDMI Audio helpers for
 DisplayPort bridges
Date: Sun, 09 Feb 2025 15:41:17 +0200
Message-Id: <20250209-dp-hdmi-audio-v2-0-16db6ebf22ff@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH2wqGcC/3XMQQ7CIBCF4as0s3YMkNa0rrxH0wXtQJlEoQElm
 oa7i927/F/yvh2SiWwSXJsdosmcOPga6tTA4rRfDTLVBiVUJ5S4IG3o6MGoX8QBZUeDpdnM82C
 hfrZoLL8Pb5xqO07PED8Hn+Vv/SdliQJ7rWWr+0VQS7c7ex3DOcQVplLKF78hd2irAAAA
X-Change-ID: 20250206-dp-hdmi-audio-15d9fdbebb9f
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Hermes Wu <Hermes.wu@ite.com.tw>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2010;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=rOoxO5KZEBh1SRJVTsZqOwcfE8PhI0LZsuKul2ItRP4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqLB/Kt4zd8O2+QTjDa5bUCPgmEutz9364E0Ly
 WzQxeo6ysCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6iwfwAKCRCLPIo+Aiko
 1dCfCACuprmMTFqony4w+ZrdzpHn6UsWG0/tGoIdKoQ7BaFcluPCYnvcvPE11sGQpbbRiYreyVg
 fDDSoJO/H6YKQFP6+99WnhyF7ogwWTyuqpYLcpLIXEYhLhd2tOcGEKmi0EjvjZlqZkD/0QIBHFA
 wATBq7cuMfgsNGav50RzggUDmzfzyncXy0FGKQv4g/jC7mxDvwC4NrHPD+zjaC48gNZEDeM9YmV
 jcKk8YRbrQtVSDyAtoPUWl7vNlE3mno+fHsKas8/4GZDPgCJ7JIix9/6hzZ0LxkW/TEZwgTVSs0
 FK5VrYd6XB17yBEO5+3IpYFWb2OQmhaVk23YHCFpvcoAl99V
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

A lot of DisplayPort bridges use HDMI Codec in order to provide audio
support. Present DRM HDMI Audio support has been written with the HDMI
and in particular DRM HDMI Connector framework support, however those
audio helpers can be easily reused for DisplayPort drivers too.

Patches by Hermes Wu that targeted implementing HDMI Audio support in
the iTE IT6506 driver pointed out the necessity of allowing one to use
generic audio helpers for DisplayPort drivers, as otherwise each driver
has to manually (and correctly) implement the get_eld() and plugged_cb
support.

Implement necessary integration in drm_bridge_connector and provide an
example implementation in the msm/dp driver.

The plan is to land core parts via the drm-misc-next tree and msm patch
via the msm-next tree.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Added drm_connector_attach_dp_subconnector_property() patches
- Link to v1: https://lore.kernel.org/r/20250206-dp-hdmi-audio-v1-0-8aa14a8c0d4d@linaro.org

---
Dmitry Baryshkov (3):
      drm/display: bridge-connector: add DisplayPort bridges
      drm/display: bridge_connector: add DisplayPort subconnector property
      drm/msm/dp: reuse generic HDMI codec implementation

 drivers/gpu/drm/display/drm_bridge_connector.c |  68 ++++++++++---
 drivers/gpu/drm/msm/Kconfig                    |   1 +
 drivers/gpu/drm/msm/dp/dp_audio.c              | 131 +++----------------------
 drivers/gpu/drm/msm/dp/dp_audio.h              |  27 ++---
 drivers/gpu/drm/msm/dp/dp_display.c            |  31 ++----
 drivers/gpu/drm/msm/dp/dp_display.h            |   6 --
 drivers/gpu/drm/msm/dp/dp_drm.c                |  11 ++-
 include/drm/drm_bridge.h                       |  14 ++-
 8 files changed, 101 insertions(+), 188 deletions(-)
---
base-commit: ed58d103e6da15a442ff87567898768dc3a66987
change-id: 20250206-dp-hdmi-audio-15d9fdbebb9f

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


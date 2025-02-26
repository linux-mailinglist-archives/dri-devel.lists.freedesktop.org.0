Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1198A45929
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 09:59:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F31810E16A;
	Wed, 26 Feb 2025 08:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JW6G2nYi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1555A10E085
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 08:59:30 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-3091fecb637so52726331fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 00:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740560368; x=1741165168; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZRUcGOxXQ12ALryAIXInoCPbMlhVlPhDAIjkEPYiGPY=;
 b=JW6G2nYiGYEp2JpIu+V+JP8sFMprBNyPT9IMgjllzO0UsEqGnoNdAJUAeb13vvstyd
 nZQyL/Urz+E4SpIMQkp4A24t6tjzz6MGHsdyfrRt5BBsALerc39II7+ln9yrGGSaaSq+
 F+ulqOIYHJ6kjVP+fY6kqjiMcpovsjHivUPM1nSO5c5Eq3KX0LuYxs9jZYhub8g5pEhz
 V2W+TVQ+cx4oSs9jKbb/vCD6nsQ2agduLUCT4Xgy0w7MImUpHa9D+EnrHkTVFE+23ne8
 p6mmqksTJhp+3OJPpErBoS7sZxnfINNTjydP1/8G2FoQzWv7z1mxuCNELRxy84io1Q0v
 s3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740560368; x=1741165168;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZRUcGOxXQ12ALryAIXInoCPbMlhVlPhDAIjkEPYiGPY=;
 b=Nz+OUY2y7NMse29l/fEznzbFt2CPem91lIPw4Y1SoVRYRfdQr7ygHsBIfN3+3aA/Fc
 ff0OOb2suQWnII23EmpDUlrswNyl/J6W0K4DiWBu02V+Gsbmx75ZifoSAohKZvw5bAu7
 BS6nvthy/k1mAdO9jnR6MqhPJSb3TUN3VkttYTbEnQNdS3oCOmglXjGvW7ux692xNgDw
 Jcpansqg7pqXJaL3UoiFXtc7vwCmItTaL7xZjjGYxxrVP3q7z4861aR+ttV1ZrMG3wvO
 oi8c2oWgyeHruWF1MW1XkKSSYsN9UJz2XU8kLZG+fhPgX7Fu4qXX2MwQil438tojmvjf
 X3gw==
X-Gm-Message-State: AOJu0YyB7PnTItAvqHAEWrqxFWQvNZO2WIRon5lpOPumotWhjTrdKxCf
 Pzv45xrykeqTnNBHl5wej0pWdmHDyukS8DrQUZIi6USxOiUzXXtSty9UxsANjPA=
X-Gm-Gg: ASbGncv565G6/afCewBx3UD8vjQhXTpDeTYozTA4Iof/AsYFWwgkRAlhjPtsUNJKOG2
 gURsmkumHxau8DgKRou3ijvXIKGUBvtCMa96Ya2mLshKZmY4GWgfd/8oohxvUMs+luUNJHFVNwm
 rEseYPpPpSa8zxQ4AI0Ry+Fs7fCUNQ/GkZ6j7PwxLXPEmZUFZTOsK30phxSpCyrcbTHL4UWZXx0
 fMhIvZRwA0dkRvhhWfMQ6DiXX5qOJahBUxJYex9wyWT+OG0qL8VzdH+KR6jyETU8qmhA4ZIEI6m
 P6wwIE32rSLXc4SrxpJIv0WIuvFHxhMtAg==
X-Google-Smtp-Source: AGHT+IG7/n0AV/V2RMHPzi/zS0d+YUqtLQL6R8+IjrUM8km2gwMqWNddixtxUhjj6bhMbT9aPGp7MQ==
X-Received: by 2002:a2e:bccf:0:b0:309:1d34:1089 with SMTP id
 38308e7fff4ca-30a809e76e0mr52563371fa.0.1740560368297; 
 Wed, 26 Feb 2025 00:59:28 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a819e0c49sm4556641fa.10.2025.02.26.00.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 00:59:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v8 0/7] drm/msm: make use of the HDMI connector infrastructure
Date: Wed, 26 Feb 2025 10:59:23 +0200
Message-Id: <20250226-bridge-hdmi-connector-v8-0-340af24b35cc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOvXvmcC/3XRTWrEMAwF4KsMXtdFlvyXrnqP0kUSKzOGNilOC
 S1D7l5lYMiU4OUT8mfzfFUzl8yzejldVeElz3kaJcSnk+ov7XhmnZNkhYAWCILuSk4yvaTPrPt
 pHLn/nooOTMFZ9t4kUHL2q/CQf27u27vkS55l7fd2zWK26V2MFXExGnQDnW/IOUAPrx95bMv0P
 JWz2sgFH5mmxqAwhiJ03BJzODK0M46gxpAwrUkm2uTjwHRg7CNjaowVxhkDQ2gsecQD43bGV9t
 e3PaajqI0Dmja4cD4O+PAoK0xfuvGNegJCcMQDkzYGaz/VBAGeooUBpDV+I9Z1/UPni/wJGUCA
 AA=
X-Change-ID: 20240307-bridge-hdmi-connector-7e3754e661d0
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4854;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/w2kOfipJ9Jc5VDcHX6euYSe3PGqS6+WUFc+C1xXiC0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnvtfsQMLiK7yGmgmvETgtsyPuE+G2KBpp3ryIS
 obU2rjn7gWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ77X7AAKCRCLPIo+Aiko
 1bXZCACsWg4vOdZqQvbRkIORkv5n8sXoDo6Q/RgV7NNK0wo3SmjsUBICl5hF1eKUzu/8CKbv246
 lQVPQS6xVoHrgv5T6TKUnffP6PVapgIHj0OMgSVKDZQ/m+vHiX1KJ6oe4OHOuHbU1bUYdesO2uw
 KcXHkhWhhKMABQNQ6fiLHCGLjRSxmIuNXbud1B9Y7xl95WHykkn901UU5Ooayy6LmcSe3G4NOpp
 5yDBTWKgOoVbw7r8DQjCqDCI7By/Hj9zILT+dwJwWg4XIBL3/yA36NaJzd9rxBNH44O36RUA+nM
 EIDfzrzlyyD3OwkEQm8UWc1vu2WTY7+QdR8HyKjzbTm5U+FJ
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

This patchset sits on top Maxime's HDMI connector patchset ([1]).

Currently this is an RFC exploring the interface between HDMI bridges
and HDMI connector code. This has been lightly verified on the Qualcomm
DB820c, which has native HDMI output. If this approach is considered to
be acceptable, I'll finish MSM HDMI bridge conversion (reworking the
Audio Infoframe code). Other bridges can follow the same approach (we
have lt9611 / lt9611uxc / adv7511 on Qualcomm hardware).

[1] https://patchwork.freedesktop.org/series/122421/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v8:
- Fixed commit message for set_timings patch (Abhinav)
- Link to v7: https://lore.kernel.org/r/20250208-bridge-hdmi-connector-v7-0-0c3837f00258@linaro.org

Changes in v7:
- Updated Audio commit message to mention InfoFrame vs audio packet
  difference (Abhinav)
- Brought back msm_audio_update() calls to atomic_pre_enable() and
  atomic_post_disable() callbacks (Abhinav)
- Moved the call to msm_hdmi_set_timings() to the beginning of the
  atomic_pre_enable() (Abhinav)
- Link to v6: https://lore.kernel.org/r/20250124-bridge-hdmi-connector-v6-0-1592632327f7@linaro.org

Changes in v6:
- Moved HDMI timing engine programming to the end of the atomic_prepare
  (Abhinav)
- Rebased on top of drm-misc-next, incorporating changes to
  drm_bridge_connector
- Switched to the DRM HDMI Audio framework for the HDMI codec
  implementation
- Link to v5: https://lore.kernel.org/r/20240607-bridge-hdmi-connector-v5-0-ab384e6021af@linaro.org

Changes in v5:
- Made drm_bridge_funcs::hdmi_clear_infoframe() callback mandatory for
  DRM_BRIDGE_OP_HDMI bridges (Maxime)
- Added drm_atomic_helper_connector_hdmi_disable_audio_infoframe()
  instead of passing NULL frame to
  drm_atomic_helper_connector_hdmi_update_audio_infoframe() (Maxime)
- Disable Audio Infoframe in MSM HDMI driver on audio shutdown.
- Link to v4: https://lore.kernel.org/r/20240531-bridge-hdmi-connector-v4-0-5110f7943622@linaro.org

Changes in v4:
- Reworked drm_bridge_connector functions to remove ternary operators
  and to reduce indentation level (Maxime)
- Added hdmi_ prefix to all HDMI-related drm_bridge_funcs calls (Maxime)
- Made vendor and product mandatory to the HDMI bridges (Maxime)
- Documented that max_bpc can be 8, 10 or 12 (Maxime)
- Changed hdmi->pixclock to be set using tmds_char_rate instead of
  calculating that manually (Maxime)
- Changed mode_valid to use helper function instead of manually
  doing mode->clock * 1000
- Removed hdmi_mode in favour of connector->display_info.is_hdmi
- Link to v3: https://lore.kernel.org/r/20240530-bridge-hdmi-connector-v3-0-a1d184d68fe3@linaro.org

Changes in v3:
- Rebased on top of the merged HDMI connector patchset.
- Changed drm_bridge_connector to use drmm_connector_init() (Maxime)
- Added a check that write_infoframe callback is present if
  BRIDGE_OP_HDMI is set.
- Moved drm_atomic_helper_connector_hdmi_check() call from
  drm_bridge_connector to the HDMI bridge driver to remove dependency
  from drm_kms_helpers on the optional HDMI state helpers.
- Converted Audio InfoFrame handling code.
- Added support for HDMI Vendor Specific and SPD InfoFrames.
- Link to v2: https://lore.kernel.org/r/20240309-bridge-hdmi-connector-v2-0-1380bea3ee70@linaro.org

Changes in v2:
- Dropped drm_connector_hdmi_setup(). Instead added
  drm_connector_hdmi_init() to be used by drm_bridge_connector.
- Changed the drm_bridge_connector to act as a proxy for the HDMI
  connector  infrastructure. This removes most of the logic from
  the bridge drivers.
- Link to v1: https://lore.kernel.org/r/20240308-bridge-hdmi-connector-v1-0-90b693550260@linaro.org

---
Dmitry Baryshkov (7):
      drm/msm/hdmi: switch to atomic bridge callbacks
      drm/msm/hdmi: program HDMI timings during atomic_pre_enable
      drm/msm/hdmi: make use of the drm_connector_hdmi framework
      drm/msm/hdmi: get rid of hdmi_mode
      drm/msm/hdmi: update HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE definition
      drm/msm/hdmi: also send the SPD and HDMI Vendor Specific InfoFrames
      drm/msm/hdmi: use DRM HDMI Audio framework

 drivers/gpu/drm/msm/Kconfig                    |   2 +
 drivers/gpu/drm/msm/hdmi/hdmi.c                | 120 +--------
 drivers/gpu/drm/msm/hdmi/hdmi.h                |  31 +--
 drivers/gpu/drm/msm/hdmi/hdmi_audio.c          | 124 +++++-----
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c         | 325 +++++++++++++++++++------
 drivers/gpu/drm/msm/registers/display/hdmi.xml |   2 +-
 6 files changed, 336 insertions(+), 268 deletions(-)
---
base-commit: ed58d103e6da15a442ff87567898768dc3a66987
change-id: 20240307-bridge-hdmi-connector-7e3754e661d0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


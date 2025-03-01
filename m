Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C24A4ADD9
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 21:39:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF7610E00C;
	Sat,  1 Mar 2025 20:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DOXUQmHD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD80010E00C
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Mar 2025 20:39:48 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-30bb2fdbb09so584261fa.2
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Mar 2025 12:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740861587; x=1741466387; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FO233HjXSk+m9KpXwWyCXVtwo2BCKYqAyRibwb4PoCo=;
 b=DOXUQmHDAI/vQ7N8NcwI5TMwU/d2m9wk3bP8KcZIB09FP/I8BidIWVtLEBOCinp9OV
 6vhfcsw/zYdX6XAG3guk4CiV1e/n3QP6mAv3MQenUf4zmEH+nqb8sOWeJvBfOc5+ujOd
 cpuL7OwUa4gKeqzJjhsPaCGIBej5dlcLv+RzaF3xzRPsGGxlGzFenYIHy1W3sBb4Ikal
 0/ZUgLwnXaneFzlF8GTNYtyZuGUjaLl7nyjeMjXJx31ZbxkEXoiw7/EC/QbxyczkMz8Z
 PBJBTURebQRl/433rF6eNYIIJjLoi0wbR2X2SpIboicJMiLRLAwUnEsbUkteBaYJ9iDO
 nlWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740861587; x=1741466387;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FO233HjXSk+m9KpXwWyCXVtwo2BCKYqAyRibwb4PoCo=;
 b=iMT950tUjnvRv3hNDgsutDlq74cZb222TZBytYOB3B6CXelXquxGryLzTu2K0HoXxf
 +Br13k4I8TNvCW6yVz+0rpCUCTOLLpc0dmVNTdUonhfwXv5xOT52LE3kpNN99m7RSC0u
 HFNqRkxHHmKdmZIlwk1idsKFE5o92PghMPyKZBcbXUx2SlYya1i0s4O3miLg64z5lL8F
 wqZKhmWfont0o9nobDH5jQjKKC5mfBoTdPwylUrTRd5R906DPALe8plorXWHIagK/ewN
 zx+rPHUGCWB49kZOySPPb3Q7GJ1D1imXCNEnxWTPC3c//IpyErpQGDf9/jtY+qpTCe/v
 /+gw==
X-Gm-Message-State: AOJu0YzrWWDxUiNbYl778wmdAsakrbKy1Xy+j0zhF+4ngT/pfYqxcVLr
 hobIbZK94z2jiMiqzun8zf3eQw7CBLZitFH6USoNUXrlWhVDv/+dADLFRJfPjo8=
X-Gm-Gg: ASbGncsWPMFHEmMwZCw3TBc8fGuDKJrztpU/LyA4Na9idyL+bjMKcD05f4rleOaZiwL
 h3oE5rxrLaWacaAAirasDjgE7yMiUpQ4d1hwgQZlRheV5vdZymK9KN/w+jFRNpygTyiE2T9C2pL
 sZ0SWo6h2K1GsdhOD4fg5en3IkuNtsfN0+FkeLVJEVE57Koh8b/RruEcnKU/T5w6KiPylrsD4Hw
 JtJ0GGKCV0E/vjnRLb8gquGxdeGHKzRTAqnkRkQregwfX4WOkHYokOpsThkBz8OrGW7SZiCi0tS
 aXCZKJsmNaCLUXf+nKkMNJvEfDBBkwNlJgJQ3QFVvMZKUbNMmcbh
X-Google-Smtp-Source: AGHT+IEpanYYiiYwRCJ9SOfItKmTyjjKRX8yWGESce2mZ6MgVsbxOhqOhLZCVSk5BJMSLzg818lUUg==
X-Received: by 2002:a05:651c:1541:b0:307:2bc6:5eb4 with SMTP id
 38308e7fff4ca-30b931f9d32mr28568051fa.3.1740861587113; 
 Sat, 01 Mar 2025 12:39:47 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30b931524efsm6668921fa.60.2025.03.01.12.39.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 12:39:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH RFC v2 0/7] drm/display: dp: add new DPCD access functions
Date: Sat, 01 Mar 2025 22:39:35 +0200
Message-Id: <20250301-drm-rework-dpcd-access-v2-0-4d92602fc7cd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIdww2cC/3WNwQ6CMBBEf4Xs2TXdgpJ4MjHxA7waDrBdoFEo2
 RrUEP7dhrvHN5N5s0AU9RLhlC2gMvvow5jA7jLgvh47Qe8SgzW2IJsTOh1Q5R30gW5ihzWzxIi
 NadlKUboj5ZDGk0rrP5v4DrfrBaoU9j6+gn63s5m2KnkPhqj8550JDZYtG2vEFK7h89OPtYZ90
 A6qdV1/0cFrTMIAAAA=
X-Change-ID: 20241231-drm-rework-dpcd-access-b0fc2e47d613
To: Lyude Paul <lyude@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2489;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=hZO10I/DG1vyNEkMu0QuAX4yVnOsd0XWkUBtv8xUeKY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnw3CPdZnNfQzvTNfvm624R2DWUI4vkz/LXqKhA
 MuM0BvXi2OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8NwjwAKCRCLPIo+Aiko
 1QN0B/40RX6HQ2yZIjBR9Q+Kcc6Vhtt8O6fvz6k27NSg1LWXTHHAG9lsjsPgR8mETncfA7+cL1S
 TTp16ccbJW9iUoivWOUq1eKMMRXqUTZKBi69cOmyu7nRBcEKWEVMfQFDiquX42fi3qlZdAc5W7N
 TLVR7V6hYRK06fccrNzVGwqSzmLy6vRE6KC+Ut3tBzGxIBqMYqQFbdaWYQDEwoD7OcuC4Zu//cg
 OL+6n/FYhotBL57blqx31J7sqNOSR0uuau1xDo4xe3Oh8u63mNtlr0C46XXf7Z5K4axtWvhx1Tb
 /f78njkOdV1oI6Cqoy24Hq174DyVXm4sJVQiIiAGyA2AgyAx
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

Existing DPCD access functions return an error code or the number of
bytes being read / write in case of partial access. However a lot of
drivers either (incorrectly) ignore partial access or mishandle error
codes. In other cases this results in a boilerplate code which compares
returned value with the size.

As suggested by Jani implement new set of DPCD access helpers, which
ignore partial access, always return 0 or an error code. Reimplement
existing helpers using the new functions to ensure backwards
compatibility.

This series targets only the DRM helpers code. If the approach is found
to be acceptable, each of the drivers should be converted on its own.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Reimplemented new helpers using old ones (Lyude)
- Reworked the drm_dp_dpcd_read_link_status() patch (Lyude)
- Dropped the dp-aux-dev patch (Jani)
- Link to v1: https://lore.kernel.org/r/20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org

---
Dmitry Baryshkov (7):
      drm/display: dp: implement new access helpers
      drm/display: dp: change drm_dp_dpcd_read_link_status() return value
      drm/display: dp: use new DCPD access helpers
      drm/display: dp-aux-dev: use new DCPD access helpers
      drm/display: dp-cec: use new DCPD access helpers
      drm/display: dp-mst-topology: use new DCPD access helpers
      drm/display: dp-tunnel: use new DCPD access helpers

 drivers/gpu/drm/amd/amdgpu/atombios_dp.c           |   8 +-
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |   2 +-
 drivers/gpu/drm/display/drm_dp_aux_dev.c           |  12 +-
 drivers/gpu/drm/display/drm_dp_cec.c               |  37 ++-
 drivers/gpu/drm/display/drm_dp_helper.c            | 307 +++++++++------------
 drivers/gpu/drm/display/drm_dp_mst_topology.c      | 105 ++++---
 drivers/gpu/drm/display/drm_dp_tunnel.c            |  20 +-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c       |   4 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |  24 +-
 drivers/gpu/drm/msm/dp/dp_link.c                   |  18 +-
 drivers/gpu/drm/radeon/atombios_dp.c               |   8 +-
 include/drm/display/drm_dp_helper.h                |  92 +++++-
 12 files changed, 322 insertions(+), 315 deletions(-)
---
base-commit: c0eb65494e59d9834af7cbad983629e9017b25a1
change-id: 20241231-drm-rework-dpcd-access-b0fc2e47d613

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5616B9DFE1A
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 11:06:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A3110E699;
	Mon,  2 Dec 2024 10:06:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rDNCKnDG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AFF810E699
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 10:06:43 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-53e0844ee50so999268e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2024 02:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733134001; x=1733738801; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8t93WpEYk3nDKkUudzjr3g8bA0wys8uB5XNs0VtJ1aI=;
 b=rDNCKnDG4opDwCAGU+HwnFED470pUV+v9P3NYqO4h4itbR0MDGD6boP9u5tExPs9Kf
 y+INK2YEbf6NkTHE5V5WMrZ2SUsGNkZ7GU8e04uvPLXfYR8eYCSZWgguNlwAzQRto7FE
 0xJ7pM7GBg2WvzMmlO9b3jQbTOgiOkB6iq9tSfTC9u6OycrHEIvxnDivh/UrEv70vFCp
 tGh+qquWm6zncqoT01ntjLtEXUD/2RvHDGVvCMRddNXHSJJ5vtihUcdTBrRtz1o0bRAY
 jD8e/uBmR1HdRA9Ls+ujr2IOySgzPx2TZcadEqD/HnH+Y6qWIF8kYQAQjhBgb1JPAIxx
 4z8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733134001; x=1733738801;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8t93WpEYk3nDKkUudzjr3g8bA0wys8uB5XNs0VtJ1aI=;
 b=veaHzB7J9B8cNV9KzWPrsd/KVXXmK3ummStl3+Fd71kXhwmNvzucDwGI8smM0vgClX
 haCUaxA39CBKEoPQNs2fqm8gYsvFjZ90VPg0AeP0YFsHXOLlSDOBJydQGG3vDnNBnVJP
 0VZvB3idJ8DT+DC00fJdvq2lMmQWrTuQWnPC3oRSP1Qc/fB7pjxhu2EIvzjwB4Eu8+ee
 GwwQeN4t68a7G3NBArnXF563sv8DI5s9LTg4aCCDYvcTzWHEOkBQ1/pau+llCSQFtnLL
 bOLP6gplaH/GiyuXVL3ncl14y35GnN/JNKhDjfg5wZ0Y2DXC9N6xqTotrlnF+nLc733f
 5eng==
X-Forwarded-Encrypted: i=1;
 AJvYcCUK2kphbKb+NVEVgiM/2D7ymhXUGB5zQiY5hQGqj3zsxOGzrJUHP28qP+lad28cWWgsMm6cG1q6g2o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtW4D2UxZrV6Gt8thgrSB7ogyub8NnVRFD75TjCiSV5ql36Qht
 QaA5ndEt3303NhKQlAs4GfUASBBUMKl3X422OqnNH82Cv/B2mcx9fr7+4imhhMY=
X-Gm-Gg: ASbGnctWEAu3iAVYwG0Z82Xddc4r50/ajlQx1u1zMUpuZyMJaQjROxOZWLIpCa/l/dL
 rVlS/bC5cRQePvYtVWFbdvZDwEs7C2WzeGJWqNVlrXGzkxSbIel7DiccInbjKty3x9uYuvlvmgP
 YtqxH1rZ6TthJvXoI0K+PtTbvxRvZUH3SGOtKoES/kzF6aTXpCWqSTcySlCvno8rPB5oQgjmg6Z
 j66mSl71sMbD0rQjCSIqvGB352BG8caDSBYHW/31SqzV3XeEc160rgdgw==
X-Google-Smtp-Source: AGHT+IHbH0cvmJT2yx5NWUiOIEXeDVP9elqk8kJiJCCcfIiHjfj52Z/RMITv0CgC14CJdFE5cVHdfw==
X-Received: by 2002:a05:6512:3181:b0:53d:d5be:4bd9 with SMTP id
 2adb3069b0e04-53df00cf711mr11571431e87.22.1733134001292; 
 Mon, 02 Dec 2024 02:06:41 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df646f191sm1418314e87.136.2024.12.02.02.06.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 02:06:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 00/14] drm/msm/dp: perform misc cleanups
Date: Mon, 02 Dec 2024 12:06:30 +0200
Message-Id: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKaGTWcC/22NQQ6CMBBFr0Jm7ZhpLaS48h6GRaUDTGIoaYVoC
 He3du1u3v/5b3ZIHIUTXKsdIm+SJMwZ9KmCfnLzyCg+M2jShhpV4+DRL+hWLwEHea/5brW1F3Y
 tG4K8WyLnojjvXeZJ0ivET3mxqV9abEqR/WPbFBIa6i3zo6F+qG9PmV0M5xBH6I7j+AIizTofs
 wAAAA==
X-Change-ID: 20240615-fd-dp-audio-fixup-a92883ea9e40
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2287;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=GgRTctJjjmFR+2EV4ZLRM9XiD3udOEtrsRG/wQwZASg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnTYasqHrxgs6JE7M1hdNH3pJDJpsqVsEy30IHc
 OgfiW2uBP+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ02GrAAKCRCLPIo+Aiko
 1a/yB/9yeB+1vh6Ib4i/1wq8ZlRx95FOtXSk+vAwqwI+qAQ/T66c/gjRGwveviKMzjYp5HGqNch
 yW37GhGioJontuzz92aByij7NmUpY7OaJA9Y7n1UE9f6gPltN70WNcLwGqvv2LgpR1qwzmnfQvD
 z6OBbiEkYFUDBkzTcv20abdx3qTku6ZSp0BrZIHCMBu8rlTM6zfSKasJhJ9BfpimlD0dftil7Wh
 Hp0wvrCw1fOURXBvFfdd7I98OZLcLJUGKT1C9TIBXG/VDGezOga7fIP6xRFW16d+LoV2uuhv8Qp
 V5fiCnKIdkA46Kf5wem2VGKJfcgHDqE2PkL6De/CWynSSsvU
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

- Fix register programming in the dp_audio module
- Rework most of the register programming functions to be local to the
  calling module rather than accessing everything through huge
  dp_catalog monster.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Set safe_to_exit_level before printing it (LKP)
- Keep TPG-related functions (Abhinav)
- Link to v1: https://lore.kernel.org/r/20241108-fd-dp-audio-fixup-v1-0-40c8eeb60cf5@linaro.org

---
Dmitry Baryshkov (14):
      drm/msm/dp: set safe_to_exit_level before printing it
      drm/msm/dp: fix msm_dp_utils_pack_sdp_header interface
      drm/msm/dp: drop msm_dp_panel_dump_regs() and msm_dp_catalog_dump_regs()
      drm/msm/dp: pull I/O data out of msm_dp_catalog_private()
      drm/msm/dp: move I/O functions to global header
      drm/msm/dp: move/inline AUX register functions
      drm/msm/dp: move/inline ctrl register functions
      drm/msm/dp: move/inline panel related functions
      drm/msm/dp: use msm_dp_utils_pack_sdp_header() for audio packets
      drm/msm/dp: drop obsolete audio headers access through catalog
      drm/msm/dp: move/inline audio related functions
      drm/msm/dp: move more AUX functions to dp_aux.c
      drm/msm/dp: drop struct msm_dp_panel_in
      drm/msm/dp: move interrupt handling to dp_ctrl

 drivers/gpu/drm/msm/dp/dp_audio.c   |  362 ++++------
 drivers/gpu/drm/msm/dp/dp_aux.c     |  195 +++++-
 drivers/gpu/drm/msm/dp/dp_aux.h     |    9 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c | 1267 +----------------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  177 +++--
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  575 ++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |    5 +-
 drivers/gpu/drm/msm/dp/dp_display.c |   36 +-
 drivers/gpu/drm/msm/dp/dp_panel.c   |  234 ++++++-
 drivers/gpu/drm/msm/dp/dp_panel.h   |   14 +-
 drivers/gpu/drm/msm/dp/dp_reg.h     |   17 +
 drivers/gpu/drm/msm/dp/dp_utils.c   |   10 +-
 drivers/gpu/drm/msm/dp/dp_utils.h   |    2 +-
 13 files changed, 1176 insertions(+), 1727 deletions(-)
---
base-commit: f486c8aa16b8172f63bddc70116a0c897a7f3f02
change-id: 20240615-fd-dp-audio-fixup-a92883ea9e40

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


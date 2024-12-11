Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2354D9EDBDF
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 00:41:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 977D110E066;
	Wed, 11 Dec 2024 23:41:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="om6SRKHV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6BDA10E066
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 23:41:49 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-54025432becso10956e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 15:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733960508; x=1734565308; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lN1fc9K0FpLqHlKV+XpgE4JzXHUl4GikScenFQbQRU4=;
 b=om6SRKHVMVqRE+WxR12+goiyzW6c/oMJ9buIq/Se45bbp+U6uaSo80HedWjyl+xFTF
 BmRUl3RVHS2pUPet9N0EhxKdCfvF10DwI2j2YhoCd2Kwz/vDBVQbDdd+tv2OmO842spR
 6qG2UbaVhaw4v5WkRYuoCKSzkO0ehCFSqOBHXQrrkZiBAgcPlMxBEDN6KTrTDyOT/CMY
 D+CGDfGx59fKdBTJzfNHIZ+Qot3bFG8XN34dvMumrzm7RKM1qwnTtWkDlO7dvGX8s12W
 eZiMZ2DVpHA8pusucCVW8FOCKRLg3ZSBbGq6z4q0LXGiXmW156wKJ21zmZQq8LLVm60d
 qXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733960508; x=1734565308;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lN1fc9K0FpLqHlKV+XpgE4JzXHUl4GikScenFQbQRU4=;
 b=w3gdpdRkKBaIL61L0GU2QmOULhb/bIkgPt+maidZ3m1ww1Cusrlw4vt3RNOal1OgRp
 HpZaGasm61GDKWagZGDmm3WCGbPTfItTd6BNUZlAfg01g+Hwu6VaEjU33som97l0pNLm
 TzQJhnrWj7AUPPzObK7//f8qQiqsYDYS9rImF+LHeNguG61r7hHMJt1hCRDdl7M0quIA
 NdN24sWNH4MeG4SUWzKU5g2LVrJcEZcS/O3dFyKnD9psp8WAy/5VGG7C+JAA5RB7A5nw
 4VeWbPp67nQiBukW3nYAlyXfJicI5zMYybBRQ67jfUfWxIqkHzAIKE8XKjkitbu+4v8A
 nj2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV31k6QxQGHqZDpELNmXgELTMvQJpIQHOPQtwVpzjqMxHYysRghN918hAO7VLYS05hdbYwiQxbjlVQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy08slP+9E5LAYEqyctXtM3Xv9WQG0u3LiTl/yXDD4baACuCLxl
 lW9VuC/WxrtnaSg7M0O+TaXy4aomoNJ8N30GL5BioBuczrEBx9ozGC/AsszA0P4=
X-Gm-Gg: ASbGncusTuuE2tBPq+dnoe0j7mfCE+IjSsSAwgLFvewiePsfzIaGTv2/Y0SJTNAOOc1
 WNtTEZAwlXmCiM4AX8hE/Gls72US7YZpwhajtK1+zFTcCDcyuS4xs8Uz7s1zCohrSbnLiYUazVE
 BHG0gllaHxPCe5v0pmgwsPb/87GOf0Q0CvuOYiIH5TQ7kCTiekvEfvUZ8zHiV3K7V2UBCWHylD5
 iftnDB+aRsNgXU06o4nh/X3Cd04z7NwB2JBwe4zlct/E9jGCvZ61PiL5oqdMg==
X-Google-Smtp-Source: AGHT+IGTn3GgnuI9/MoHb5/ZUsgP9T68WNc7965a9w8Yk11jW98pdcRfsD6JTboUFrk8UJT7i5OstQ==
X-Received: by 2002:a05:6512:2387:b0:53e:39ba:fb4b with SMTP id
 2adb3069b0e04-5402a5e7e34mr1380282e87.26.1733960508073; 
 Wed, 11 Dec 2024 15:41:48 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5401cc76909sm1222207e87.58.2024.12.11.15.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 15:41:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 00/14] drm/msm/dp: perform misc cleanups
Date: Thu, 12 Dec 2024 01:41:35 +0200
Message-Id: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC8jWmcC/23OzQqDMAwH8FeRnpfR1o9VT3uPsUNnowaGlXaWD
 fHdF72MgZeSf0J+6SIiBsIommwRARNF8iOH/JSJdrBjj0COs9BSF7JSJXQO3AR2duSho/fMda2
 NydHWWEjBe1NAHuzm7c55oPjy4bOfSGrr7ppS0hxoSYGEQrYG8VHJtiuvTxpt8GcferFxSf8If
 o4IzYSrlbnwpypn3R+xrusX5UO7y/YAAAA=
X-Change-ID: 20240615-fd-dp-audio-fixup-a92883ea9e40
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2609;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=KGpHz/yVl3CbQj7xD8t+dTMh1TmykDPag97EgsAA3HM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnWiM3KIw0z9QnsmiF/tVpqgwgf08SFhCmC5aEW
 WO7NOCvMPKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1ojNwAKCRCLPIo+Aiko
 1eLhB/9JCmsCJXfuQAZdrBhGBhqrySjydU3KsLNzC+KaHOBwfPybAbcpBrwue54ah8ya54yf93x
 qVCZkyqDL/Ys3HOChHdPBb4FTMr1Y6GtXeOs1QySycB5cfb4soAPoQvoLszC49DKlqAZupe4iS2
 BwxGTHQt2zNOM05XmfRB5Q0AupaJvuYXw4YtE5655L+n4BO9RJnrAuSOFTkP6MqZ10nkpnBN4v5
 Xm3tGseQxmdfPkNx8RgOPieYfKjXHl700IRF0cQe4q1VlpTnwxHovNYFwbhVcEjNThykfgnVAlv
 GaELU51wzjcX1QAtIpMy1ahNFzKloyK9EtHS3RMJEuCXPWcX
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
Changes in v3:
- Fixed falce -> false typo (Abhinav)
- Dropped wrong c&p comment from msm_dp_read_p0() (Stephen)
- Changed msm_dp_aux_clear_hw_interrupts() to return void (Stephen)
- Fixed most of line length warnings
- Link to v2: https://lore.kernel.org/r/20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org

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
 drivers/gpu/drm/msm/dp/dp_aux.c     |  199 +++++-
 drivers/gpu/drm/msm/dp/dp_aux.h     |    9 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c | 1271 +----------------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  173 ++---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  575 ++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |    5 +-
 drivers/gpu/drm/msm/dp/dp_display.c |   36 +-
 drivers/gpu/drm/msm/dp/dp_panel.c   |  234 ++++++-
 drivers/gpu/drm/msm/dp/dp_panel.h   |   14 +-
 drivers/gpu/drm/msm/dp/dp_reg.h     |   17 +
 drivers/gpu/drm/msm/dp/dp_utils.c   |   10 +-
 drivers/gpu/drm/msm/dp/dp_utils.h   |    2 +-
 13 files changed, 1180 insertions(+), 1727 deletions(-)
---
base-commit: 91e71d606356e50f238d7a87aacdee4abc427f07
change-id: 20240615-fd-dp-audio-fixup-a92883ea9e40

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


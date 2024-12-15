Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 845049F26A3
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2024 23:44:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F070310E00C;
	Sun, 15 Dec 2024 22:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="W159ikD4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F07A810E00C
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 22:44:15 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-3002c324e7eso40325791fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 14:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734302654; x=1734907454; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wiyM++KsOVFJwW6aj3SElwGQilAMp0843gWRbVSsNyE=;
 b=W159ikD4v62lt7lp2gI24YJiyLxeIDhNqqmi1gBF/gWHCG1J9ycBKqzYLCsRbkcVqb
 wgmjG8RgRMnigzxs9cTQl37DN/lfJt69vTL3v80ZHXssUBcpgM0z1Q47B/YbXl7vUOPu
 Fx5tSdUF1lcwYIaxw6nR2my3PwTlpkj9ESqWf8flx21kXIbcdySIb0ok6fdtVLK4zdDA
 qtDKgJbTezO87Da7pyjFaZFffO91ofx1olADyUEORgdDTzOJ7dIRa4US/I5abIWCKf0W
 4fZs/pOuIal3Kz6btPf69pCVLeiHsuETMVHos738HIkZJ0WAWsOuG441qi3TgqWKEQft
 R3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734302654; x=1734907454;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wiyM++KsOVFJwW6aj3SElwGQilAMp0843gWRbVSsNyE=;
 b=RE46idVN6DF0mI7DDlBuk44ZqWjfJndswRvpDqldbtjf5r+jjGjAhN0pYueAJwRgjL
 1hnk727enodjtEffII4M3aKIOUeLWyHOqETpQNlciKj78pdqNGoTInMD3/P0lVXLyomn
 JQO2NiSnEBTg9LMdhGGbwx8iyKd07Nmt1a13WIqfPrTkRMeT+seNM5gFtWO4RDhMMHpZ
 ajLWHG/9a8pepL/9Fk7hjvTbP9elf+4ArGhlUgdN6U4++/SRIiwYyRnimgdNzHWKPKOq
 Lrls5OXewepTpBUNU5hmr8vWhWfNa3TvWtXhWBS+3W1vg2tNbUoBnwsReWD8JE0EKtEo
 lN8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyTJwW7knwCKA/NkvOuekS2gXOoj2rkm81HHL7kfxtagKPTmruPui0o5mtBUWb1HQ25ZSWwxxflCc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyG1Urpj22srHzKijWFcxLsK4f6RSmAhuAALEyUV+W/1+dX9hpp
 lrJ868KEAF4stNpDU+tMgNEi1xCm3wRXl+6ap8ldEpcuJwGbgx8OEXLFoLQLUWA=
X-Gm-Gg: ASbGnctFYHa58PAgAJOGR3ghLz+Df1U0JwK5JdTJsk+sa6KhTchhjfhgk7XfIujE2Q9
 /dSVMiI1caTG1uwEKZS419yl40Lf7psFdCXq+URA1j461sDqb0TS6diNNnH1a3NZBmuy22oaW0o
 oBChVde8sqKHeDsdC0r3B0vqq+h/qbquTY3lUO80fNElCxAg3lz5nmll2+P1FRPk4R4EP1k04PW
 2sU6T0r/rvHK4IVioEJ1jLC0hxCGdpFE1a2BEJZ60YGRNhJx+omFTV06MlnSd8q
X-Google-Smtp-Source: AGHT+IEOhOyrKe1fLpCJJfj1HpV10RlKePzB/U3HENJTDq1jhvZe00iwG9BTg13phbpjEcOYuHRqmQ==
X-Received: by 2002:a05:651c:a0b:b0:302:1861:6df4 with SMTP id
 38308e7fff4ca-302545b95a2mr31173471fa.35.1734302654082; 
 Sun, 15 Dec 2024 14:44:14 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303441a41d1sm7201701fa.100.2024.12.15.14.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 14:44:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 00/16] drm/msm/dp: perform misc cleanups
Date: Mon, 16 Dec 2024 00:44:05 +0200
Message-Id: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALVbX2cC/23OzQ6CMAwH8FcxOzuzDxjDk+9hPIytwBLDyCaLh
 vDuFi5q5LL036a/biYJoodEzoeZRMg++TBgKI4HYnszdEC9w0wEEwVTvKSto26kZnI+0NY/J6x
 robUEU0PBCO6NEXCwmdcb5t6nR4iv7UTma3fTOGd6R8ucMlowqwEaxWxbXu5+MDGcQuzIymXxI
 fDZIwQSrua6wk8pZ9wfIb8IvktIJFjDrSqhco2RP8SyLG/EYisrOQEAAA==
X-Change-ID: 20240615-fd-dp-audio-fixup-a92883ea9e40
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3146;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Wpqm+AyDhFEWkmbxwA9sIDOpZewkcmgIhwh63TRGv8s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnX1u4wieuIPQwzqElGGzCtUpWfcSN8u5hmioBG
 RarSfXTLzWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ19buAAKCRCLPIo+Aiko
 1RJcCACHIiksgRxZonl/xVOB+7hh+ZEPQ+0ON2piCtujhFjfY4qqgmkz0jzhN89O3CsYSmJtMca
 Ay3TCNKsqVU/ePat29r97DSBJs6y/rR4JLt6Mznv+mSNsapkLMvzguM6O9umxUe5WzqRID52g5M
 8EnVYbpmp3hDmdqVUiUE+eKQdmVzNw4E9jj7c6py2rgkLv+keNS1rzyZJ7UcKs+4wgoqjrO27KN
 LP/82VaUeROMzU8kUkSS/nYgK+PhQD44gU2b/U/5uCfNS8i8BsGUsA/IqRrptXX3vZqd9TNzIgf
 2x7cFeOF8A9Njdoei6P0E6bSqckwZdwML+b4jw+AYrDhbq3I
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
Changes in v4:
- Rebased on top of linux-next + msm-fixes, dropping picked up patches
  (Abhinav)
- Reordered patches to move dp_audio patches earlier (Abhinav).
- Added several more patches, dropping dp_catalog.c completely.
- Link to v3: https://lore.kernel.org/r/20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org

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
Dmitry Baryshkov (16):
      drm/msm/dp: drop msm_dp_panel_dump_regs() and msm_dp_catalog_dump_regs()
      drm/msm/dp: use msm_dp_utils_pack_sdp_header() for audio packets
      drm/msm/dp: drop obsolete audio headers access through catalog
      drm/msm/dp: drop struct msm_dp_panel_in
      drm/msm/dp: stop passing panel to msm_dp_audio_get()
      drm/msm/dp: split MMSS_DP_DSC_DTO register write to a separate function
      drm/msm/dp: pull I/O data out of msm_dp_catalog_private()
      drm/msm/dp: move I/O functions to global header
      drm/msm/dp: move/inline AUX register functions
      drm/msm/dp: move/inline ctrl register functions
      drm/msm/dp: move/inline panel related functions
      drm/msm/dp: move/inline audio related functions
      drm/msm/dp: move more AUX functions to dp_aux.c
      drm/msm/dp: move interrupt handling to dp_ctrl
      drm/msm/dp: read hw revision only once
      drm/msm/dp: drop the msm_dp_catalog module

 drivers/gpu/drm/msm/Makefile        |    1 -
 drivers/gpu/drm/msm/dp/dp_audio.c   |  379 ++++------
 drivers/gpu/drm/msm/dp/dp_audio.h   |    8 +-
 drivers/gpu/drm/msm/dp/dp_aux.c     |  216 +++++-
 drivers/gpu/drm/msm/dp/dp_aux.h     |   15 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c | 1340 -----------------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  128 ----
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  607 ++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   19 +-
 drivers/gpu/drm/msm/dp/dp_debug.c   |    1 -
 drivers/gpu/drm/msm/dp/dp_display.c |  157 ++--
 drivers/gpu/drm/msm/dp/dp_link.c    |    1 +
 drivers/gpu/drm/msm/dp/dp_panel.c   |  276 +++++++-
 drivers/gpu/drm/msm/dp/dp_panel.h   |   22 +-
 drivers/gpu/drm/msm/dp/dp_reg.h     |   19 +
 15 files changed, 1278 insertions(+), 1911 deletions(-)
---
base-commit: 952b5ed3020b50205f223e28ab182539210089c7
change-id: 20240615-fd-dp-audio-fixup-a92883ea9e40

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


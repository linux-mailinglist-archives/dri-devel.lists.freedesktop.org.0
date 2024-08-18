Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75865955B15
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2024 08:08:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55CC910E03E;
	Sun, 18 Aug 2024 06:08:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iSfwKDga";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE3210E03E
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2024 06:08:28 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-81fd1e1d38bso181541639f.1
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 23:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723961307; x=1724566107; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TsZnNUNa74doCpaCcl5sTI+Cj3gu+bNSpGVWxycaCBA=;
 b=iSfwKDgacCww8+S0L6jodDk8c9QfNU3yhxwDk7Klpyw07uWrFCBrovGHBfWtbnINvX
 2TAqHBbbO5sX6dt/z5pmLJIakZZMuAZT/c3T2SEH9+J8DzdsPsBGkdNpIE74WVoGee+6
 RI9/DhcH6LhR+mDd1AP2+JgFZ8/bcrp8rCKF9hzaMXOgxeUZPI+4wDzXdCb1933vMvoy
 jzULl6SH5PqGj893G7fKhskuDgamEYeWaaab5IKVwut/1UFzi7GRDpnXl+dVSpLQhpqo
 L2p/WkdF8rbbF9/LxXW6SNwM12D28P7GiMvQgo1RBDe5j4gG5nEocV9lugcfgMgmoG6d
 IWYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723961307; x=1724566107;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TsZnNUNa74doCpaCcl5sTI+Cj3gu+bNSpGVWxycaCBA=;
 b=FEC20lP+FXlE8k4EZuyVQAMptdzEeKo9D6rJH71Jh9nCZRwT0A/mZI90wUp0MLIjNd
 9Ut/xAz794vqNLNysFm8deme4mY3KANsTOxIb9nguvw3/FArM5idk8/HkOdFiIssYBfk
 MluQEYok7RB2Uzvnrk+s77eUtSob1eTOGQseFkAnv6U+0jwqrl7N/mo6AiCNruIcpXa/
 ke0RLa7ThRpt62rjE2ynrb7L3y0tHeY/l0s/dDx2RDWu4XqDHDL3ZH4toc6p7qickWu6
 1rxq085PZDgN0lHEC5BynwrHNVgQIM1j7Tg45eOe1blKI6DhVspAgnp+SK3so0O5u8yh
 ep7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqWKvoHwn89X1LOAI72Nxv21wCkJD8+iNUx18g5c5Toejs5rQX0EFX2nr3wkOziLy6jEjZudXQq8xRHGH7G35j36A4JnhiPFJ1MEgn2bcp
X-Gm-Message-State: AOJu0YwavjXz453/iyl16/xLE2o342H4n9c/veVLrISfs45yUhK+ioYt
 pQr5gdeKrC+/pT6M5D+lup9w4+QRe6DSfowu+kL06EiZRFxftaKS
X-Google-Smtp-Source: AGHT+IHCWNXE4N3u97vKsUqHD/HXszmlnh/RP8A6OPrnDdzp2otBIR9AWV8v+AcugvTcuVOyXb1PXQ==
X-Received: by 2002:a05:6602:1609:b0:803:cc64:e0d6 with SMTP id
 ca18e2360f4ac-824f267222cmr878514139f.1.1723961307159; 
 Sat, 17 Aug 2024 23:08:27 -0700 (PDT)
Received: from distilledx.srmu.edu.in
 ([2401:4900:6322:f541:ea23:e535:a48c:3c88])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d4394e01b4sm236228a91.46.2024.08.17.23.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Aug 2024 23:08:26 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com
Cc: dianders@chromium.org, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH v3 0/2] extend "multi" functions and use them in jdi-fhd-r63452
Date: Sun, 18 Aug 2024 11:38:14 +0530
Message-ID: <20240818060816.848784-1-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.46.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds mipi_dsi_dcs_set_tear_scanline_multi to the list of multi
functions and uses it with other multi functions in the jdi-fhd-r63452
panel.

This patch uses functions introduced in [1] and must be applied after
it.

[1] https://lore.kernel.org/all/20240806135949.468636-1-tejasvipin76@gmail.com/
---
Changes in v3:
    - use mipi_dsi_usleep_range

Changes in v2:
    - Fixed return values
    - Removed extra error messages

v1: https://lore.kernel.org/all/20240810045404.188146-1-tejasvipin76@gmail.com/
v2: https://lore.kernel.org/all/20240813062912.467280-1-tejasvipin76@gmail.com/
---
Tejas Vipin (2):
  drm/mipi-dsi: Add mipi_dsi_dcs_set_tear_scanline_multi
  drm/panel: jdi-fhd-r63452: transition to mipi_dsi wrapped functions

 drivers/gpu/drm/drm_mipi_dsi.c               |  31 ++++
 drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c | 149 ++++++-------------
 include/drm/drm_mipi_dsi.h                   |   2 +
 3 files changed, 81 insertions(+), 101 deletions(-)

-- 
2.46.0


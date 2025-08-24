Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB09AB32EC5
	for <lists+dri-devel@lfdr.de>; Sun, 24 Aug 2025 11:27:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1CF610E1FF;
	Sun, 24 Aug 2025 09:27:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DrGfGs33";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B4DF10E1FF
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Aug 2025 09:27:38 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-61c26f3cf6fso3718209a12.1
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Aug 2025 02:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756027656; x=1756632456; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QpGLLUNQscE/kPg1TKl6LWBCLDLaDqD+YWwgJokFJD0=;
 b=DrGfGs33vuTyHYvV7E7JakTOvFuQPgw61s5gHu//s2rvhlEMDRIc1yJ/wnDcFgN5a/
 o7zdDIyG9rMOJwCH0nk4grS8kJnm/DoSztFci15pKqRpLEz/U5eUWWk8yEJ119qaKycw
 7pJHXo39AxlBCqhRGyYNFpDJwAcKKvFk/8BEciAwOmaIlS3ys7yuhE7mvgKAYunbESfG
 vWIoExwnuvS64G/NTwFOKJRcXQQR5A6HGJop8u6Hu9dyIZV4dV4cHGbWVO/8nNBIB9EV
 b1wlC3CaKktwjWG1RL2QLUW7IQ6+Z75imSgDs+Vxxe+JQQoXjfCpNijXrcxAJKbm26mo
 2+KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756027656; x=1756632456;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QpGLLUNQscE/kPg1TKl6LWBCLDLaDqD+YWwgJokFJD0=;
 b=B2+A0AuK17nuSOdl4JvDDN5S7tcDPJcwU0A0ucLLI7BjCeSMHA4OXKMtTud84xsbd2
 oEchPJoN2kM/SB+oQm/HVPmyZRgxBL6BSrPOOaIue27QN3BymwUE4xhkFDvC8YHpaDek
 j+uVMUvJr+9iKv4R5bi2MY+dSX9OpqZutpZHqYENutH0+Np4uXIZWshxsele+ZxbcuE6
 khULBeQ+e01/70BVCDeg23u2E3CkxlRThTBpvfZmVzbEnV4Ujj5gUyBP+ULTTnTptxxP
 pVlfHZu/ocyNsOUqWq3oAjQALpoW/4AZwKGQVeqVG8z/iUTZNkOXzL02xJIvaQ6eqeKE
 NVtw==
X-Gm-Message-State: AOJu0Yx6d0x7Uvo+B3uclfoVPqZlNFt14nlMuUulA+UF8x4U/7jVybUW
 aQQ9oMFt1GUDBhr3s/vutIaBf6qYHKZmlipnA8CPzewGpSvfb3x97tYO
X-Gm-Gg: ASbGncvjSay6xjPG0Au5G10Jfj+6ulvVDxW5Tq5DK7QPHFSaMIseZUFTKMarikScrwO
 t02N4QANnPhaChvEvxal97c8O6jBfwHbGS92rdLw9yCWh+1AzTDtuIbMZnEmTy3NES9KATMgd2n
 W97dk9A3ZbIgSOuIO1iJFKYqXYLDdOI1GcFuEJdcUMpDjevdQOQ1eepl8mHI4YZZJ8BTYWUKRvS
 aVYzwiOJet/UcINUaFJuNt72+pOg1dsn6vpbnHM9nqjp0nCOtJ00K4cGZ4oX8IqAfnnhG1eoCOs
 NONEnD94CegSRQrG+2BE36MBvSIWfEEZO6WAeZWu6L+3V47tsIFrr18kC9g6kvSuIycb/epGFzM
 qcldBUzYaH6+jsA5nsHMrsS82
X-Google-Smtp-Source: AGHT+IGmoBRzHic6I2jrFPimeAndq08OTOYSvf/ELJQK4Kcm6+/5O6wg6YTT5GlBhd83WTB+sV1+aA==
X-Received: by 2002:a05:6402:4314:b0:617:d013:74a with SMTP id
 4fb4d7f45d1cf-61c1b3bb4d8mr6534313a12.4.1756027656345; 
 Sun, 24 Aug 2025 02:27:36 -0700 (PDT)
Received: from xeon.. ([188.163.112.76]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61c316f503dsm3035391a12.31.2025.08.24.02.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 02:27:35 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3 RESEND] drm: bridge: add support for Triple 10-BIT
Date: Sun, 24 Aug 2025 12:27:25 +0300
Message-ID: <20250824092728.105643-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
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

Triple 10-BIT LVDS Transmitter is used in Microsoft Surface RT and
MStar TSUMU88ADT3-LF-1 HDMI bridge is used in ASUS Transformer AiO
P1801-T.

---
Changes on switching from v2 to v3:
- place mstar,tsumu88adt3-lf-1 alphabetically
- fix typos

Changes on switching from v1 to v2:
- sort compatible alphabetically in schema
---

David Heidelberg (1):
  dt-bindigs: display: extend the LVDS codec with Triple 10-BIT LVDS
    Transmitter

Maxim Schwalm (1):
  drm/bridge: simple-bridge: Add support for MStar TSUMU88ADT3-LF-1

Svyatoslav Ryhel (1):
  dt-bindigs: display: extend the simple bridge with MStar
    TSUMU88ADT3-LF-1

 .../devicetree/bindings/display/bridge/lvds-codec.yaml       | 1 +
 .../devicetree/bindings/display/bridge/simple-bridge.yaml    | 1 +
 drivers/gpu/drm/bridge/simple-bridge.c                       | 5 +++++
 3 files changed, 7 insertions(+)

-- 
2.43.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF674BB28D1
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 07:43:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C99F910E77A;
	Thu,  2 Oct 2025 05:43:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ljBL4ZTV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD1AC10E6B5
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 14:00:57 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id
 ffacd0b85a97d-3fc36b99e92so827861f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 07:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759327256; x=1759932056; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EYsni1VBvs5YqLN8WcctEz3qmuBiq5eihYcUC9RPHrc=;
 b=ljBL4ZTVp1X1KsM6EX5Ug198Jqy0ySjJaqSDm6+tFeXdVFBNwAOXZrwK2LmievXxzR
 Gk653EOjFM6jg2Qy9imzdehyKlcKu4AWKk6mjeDTpcSPHEozHzfTZn+OW3PwW13nOTbI
 ead4HW+J0rtIcjSo83jVTdNYQtOUQUScK1Z89vgoKEu1dkCMKMzCXbOj1i3WjV7BGHkO
 GCn/672gByAellWHd2J/jziAwlXPO2Yw9TZNSmfa7Bjrcsj2mo1paKf6hh9orm70sKgg
 b9vyCKSy7Vj8gcKM885LK6AKPp3Y9ZSNGcWmEzn9BQM8tVT4ubBHfLqxqtNp47EkH0+y
 v9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759327256; x=1759932056;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EYsni1VBvs5YqLN8WcctEz3qmuBiq5eihYcUC9RPHrc=;
 b=utnMp6EG7aFXAERmz9PdxhwraZ2bmCxfpFdQRgFUWtu5QjrP0rCxGP9/XPcI2sc1oh
 a303p4uQMw1WcQIJ3WQBouI9oMGqBADJnyAqfUX4uswk6XP+AomDD2QIIcPiumrgS/R6
 AbakIkxQvv4rLHTFL5NzX45atYyp3kkCadb3zGCdenRQxyXRFicYzC9K5JT3Q5DVqbLL
 Xw9CnZpguJV7oAlJCIWydtYRI0hw+XW7RRdPj9lrDkJgx/Kt1MzHL4+Y/mjE48uwlio/
 qQDQ0bEQwU4TZksZdsgS4F//BKWgdiw1YfVCVB39U+J7sLTC6umJwzcmoIa6s2XcMa4P
 dmhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKrOiQ8AG02W9jSIQahQpod5VvZE/t+jn0Zd6J1HjPCG3RJKBE7LSGYJFsHKMf8blkCzTThktOCvg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxcgay3fUuSeCaSpybkpDdEHQEhv3o9+RL6RsuDFS2vQIPzFKQA
 GY45xDDdu94FQR26OFy46Fh44IYSiowNvwU75SG2iZd9suDPRoqBHfmW
X-Gm-Gg: ASbGncvaFAhJ6+nUBqVKYtz6HSuRtxsKgN0mXWu1w7UZFxc3qlCtx7wHcTcShzLQQoo
 q8VdU7+rOgtbFLgOXHMzE4qucACwU+v1LUhXFJooepf1hzmPukmOGtn2QzdkkuYdAmhh6HOmsFA
 aXUotyPoUSWh8j/lVSnOADMyYxL+63sYT3IbjdSyZnT372sDsk4vbNMT9DW3ZH55HIDDTZqBHbc
 JEL/cM9kSfekn214m5pAkPbz08Q/bJQbcRGB23DmzfBWF9IZsTIGl2GIi0AW8z78vQKruD7+cRG
 CwqBL484QAd5wnW3R6M8NQ20g5ydkVno1VfAYaUYKI4pJD9X9QL15eRJZHWXjpywWsOxTmIFdIl
 zzNWY3STR8rUDoLFX8PANcM9HK2H4cQopwV6AhL+qNxLtSFA2ZsK9CKkUEX/DABKPB9Z83hRtsD
 gp7FCXNTFBpBM5tnWEhj6/feDMNEs2oNzwQgu4D4bNY5HerxUaaxFdgaOWvXBfcb4a
X-Google-Smtp-Source: AGHT+IEbCi0xm7TZs0YjOtrOHHNATQAm6IprX3ckD0OQpGOtjk01tDJ8J2LVgeXv3ddJgQ52ljhLtg==
X-Received: by 2002:a05:6000:2901:b0:3ea:6680:8fb9 with SMTP id
 ffacd0b85a97d-425577761c8mr3272501f8f.3.1759327255965; 
 Wed, 01 Oct 2025 07:00:55 -0700 (PDT)
Received: from LAPTOP-AMJDAUEJ.soton.ac.uk
 (globalprotect-nat-extbord.soton.ac.uk. [152.78.0.24])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb89065b5sm27029828f8f.17.2025.10.01.07.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 07:00:55 -0700 (PDT)
From: Junjie Cao <caojunjie650@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Jonathan Marek <jonathan@marek.ca>, Eugene Lepshy <fekz115@gmail.com>,
 Jun Nie <jun.nie@linaro.org>
Cc: Junjie Cao <caojunjie650@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH 0/3] drm/panel: Add support for Novatek NT36532 panel
Date: Wed,  1 Oct 2025 21:59:11 +0800
Message-ID: <20251001135914.13754-1-caojunjie650@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 02 Oct 2025 05:43:06 +0000
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

This series adds support for panels using the Novatek NT36532 Display
Driver IC, a dual-DSI, dual-DSC controller that requires DPU support
for 'slice_per_pkt = 2'.

Since the current DPU driver lacks this capability, PATCH 2/3 is picked
up from Jonathan Marek and Jun Nie [1].

[1]: https://lore.kernel.org/all/20250220-dual-dsi-v2-3-6c0038d5a2ef@linaro.org

Jun Nie (1):
  drm/msm/dsi: support DSC configurations with slice_per_pkt > 1

Junjie Cao (2):
  dt-bindings: display: panel: Add Novatek NT36532
  drm/panel: Add Novatek NT36532 panel driver

 .../display/panel/novatek,nt36532.yaml        |  83 ++++
 MAINTAINERS                                   |   7 +
 drivers/gpu/drm/msm/dsi/dsi_host.c            |  25 +-
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt36532.c | 437 ++++++++++++++++++
 include/drm/drm_mipi_dsi.h                    |   2 +
 7 files changed, 550 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt36532.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36532.c


base-commit: bf2602a3cb2381fb1a04bf1c39a290518d2538d1
-- 
2.48.1


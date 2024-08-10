Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6003394DAC3
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2024 06:55:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A6AE10E008;
	Sat, 10 Aug 2024 04:55:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EWwy0Ny0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF8110E008
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Aug 2024 04:55:02 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id
 5614622812f47-3db130a872fso1903803b6e.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Aug 2024 21:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723265701; x=1723870501; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1SZjRA7QvngAVvypNtraGj8iaKVFlhYAXT8CiOPJsiA=;
 b=EWwy0Ny0pB0BGLs6tS1qLqO7P5fhhlUNr7jqmyhTc3rzPXVlYtgLddJya4nhMVccCT
 a3/iE/dglilM3y3SMu3h9QlSEeDQxnBf80GDLOpUN+b85bv4oFXu79U6QuVL/EX578FG
 cgFTym3c3mVch/Wdq6s+24k5aIRZQKo6emVArpy4P/TF2Crxn0lUxoQiCpW573b3g8AP
 ev0LglMGazJf7StyYs6DHpcgQDjmbeFAYnr2vezNnZpRlHX+MLgRWZQiETMfHeGJrSP3
 tWidRv/G8a+PM+APOIBKQJLkpg+nOXgBgPXB7WobEt+aP5XCf8p/w/awoHDcbTEmvCYg
 QkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723265701; x=1723870501;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1SZjRA7QvngAVvypNtraGj8iaKVFlhYAXT8CiOPJsiA=;
 b=XuZH8nP6ouc0XQVWZWMear3jo9FD0DVBdoI7GwC1ZzT3LwiWhta3/UYTJaEBuTutxg
 wNeyfo9FlJCtI6bkArFcBrn41hc4Yh3wf1OPtKYcGZ/d7YGRc0u2tnc7quXSXf3dFaLx
 z29Qk4rUyzJScG9bIP5DspIorQw99nttFVsliEOB/NhiumQqq4aMbQxOof9bQLOiOAdL
 EcaK76Vin8FQLZpNBfmE03MMMIFALBdZ4MrP0GM/Gw9WasB8FZSJH8O03gSqJD5Cm1rB
 sH04kTRDmEYeZfPyT78z3KCx7HC7q7rCfxOPoknXIVH5EhRubUZLKm3MfwJGuHc94jnG
 Od3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8TkJLGjZxzekBtRV43KQCVdaR/bNoHIeuk2SRMw2sdPshEwAl3VAn9urAXyD2euATzqICJyaYuK2+Tk0j3Sm+i3Tqk8EG7+yuA9/0eo+4
X-Gm-Message-State: AOJu0YyBcIW6yy8Jgbc1wIl0nb7+cLFM8VosCeM0upSywB9vvuDYo6UW
 rNVGOA7u2rsGv80XQHjjgFf8oGCBsAgVqdi4QMkskHMHaqHHKksh
X-Google-Smtp-Source: AGHT+IFCpdECix9ySUNK/iLOdCLtYNnFJ9qFVXUZBFAfrUQMJf68JFWC2QWw0jFtauJ5lq+hwKLVXg==
X-Received: by 2002:a05:6808:2228:b0:3d9:3f51:f351 with SMTP id
 5614622812f47-3dc4167b9d8mr4408461b6e.11.1723265700956; 
 Fri, 09 Aug 2024 21:55:00 -0700 (PDT)
Received: from distilledx.srmu.edu.in ([103.4.221.252])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-200bb8fd82asm5227005ad.73.2024.08.09.21.54.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Aug 2024 21:55:00 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com
Cc: dianders@chromium.org, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH 0/2] add more multi functions for streamlined error handling
Date: Sat, 10 Aug 2024 10:24:02 +0530
Message-ID: <20240810045404.188146-1-tejasvipin76@gmail.com>
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

Tejas Vipin (2):
  drm/mipi-dsi: Add mipi_dsi_dcs_set_tear_scanline_multi
  drm/panel: jdi-fhd-r63452: transition to mipi_dsi wrapped functions

 drivers/gpu/drm/drm_mipi_dsi.c               |  31 +++++
 drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c | 125 ++++++-------------
 include/drm/drm_mipi_dsi.h                   |   2 +
 3 files changed, 72 insertions(+), 86 deletions(-)

-- 
2.46.0


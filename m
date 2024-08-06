Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DB494926F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 16:00:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8879A10E37D;
	Tue,  6 Aug 2024 14:00:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BIW35PPF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D7B10E37D
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 14:00:15 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-7104f93a20eso500124b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2024 07:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722952815; x=1723557615; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l/rRqO+TD/clunwejOFWYg0tXtD2dZ47q/KtEadlmnI=;
 b=BIW35PPFVwE6SKaOOuhb1kgQlfBDtTy6xHGUBFr/iFzCHnKkW0Z7z9Xuv8iuz8UFFF
 H563LLp3DUYlCunKSTHiU6/AgZyFkkYW0R1gPVm3gm5/CZxfJ/HSfj6wcl3HlNe/WU3Q
 vxZmYXnCBLKmqdutbP2tqgCgjcAyPAfakBIrM5YMgP7i86OBw6UBv47NYRmeBwICNo7h
 FI0+1Do1E8nQxpHVorldLlU6netCkzImHXM9m0q6ECBjSMvVTOCDoo0JHDrT5AtTdPez
 2eAXVl5TxerhTkRN8M+i1BvKVup+N1FfX2tiqPAwNGKjQI2IelVdMPEMYzQRI0l2ATQX
 08AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722952815; x=1723557615;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l/rRqO+TD/clunwejOFWYg0tXtD2dZ47q/KtEadlmnI=;
 b=JQNrCYVGacoGNEByTVVMCfg4VFu4Zw/X69pjP7XEiH7WDinPooW88COe7CfIdKWTun
 aUQrMADJFQta9CzzOHllk24IMRyLdW3fdhKTWBH5xm33JswX+RkGMW+PSO3jKJqPGVNH
 2BixuXh+LDdeF+OxIR+KLLTr7hKsU/8UUq/S58Nkr+sbBtupCCp2Sqd2mVgWR4MB1rkU
 +Y/g/xfG7FqSovJrufVmn8EDQOwVngVjBlodqCOYyKGbiBMGyLuuwIA5JlPn+2W0ZQm1
 kK/yuweXY+WEtT3H1+YMy+mfJ0O1ejd5FCJCSU539eQtBxRa1N+JqQMRRIVw3wrAu4gK
 ZHOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7YwMbeIhKO308XmuyLycKUWvWuWEI/BEDCVr2QENHip0jU9NY3JnbjcOH1aTEFQvaywr6oiWWEWUO6b9SohNjjb4cyWupVDCQsxnWS9+Y
X-Gm-Message-State: AOJu0YwaqNjpDkk0Kyvh3uIwn3SLXYim0BmlU7FRlB8byDJrDQ0z7E8v
 MnkoUJ9q0zj6AsgKvnn6aKQ7Ti1YZGXyqvMAeWu8xus9hOACRsPD
X-Google-Smtp-Source: AGHT+IHZeNN3cg+Jxj3sx/33KxsUD/ghfNrYFKoaO6S9lGUHf30kNSMQohmWeyYOuIOqoZgLCuzOkw==
X-Received: by 2002:a05:6a20:7484:b0:1c0:e9dd:1197 with SMTP id
 adf61e73a8af0-1c699589cc1mr16798510637.22.1722952814667; 
 Tue, 06 Aug 2024 07:00:14 -0700 (PDT)
Received: from distilledx.srmu.edu.in ([14.96.13.220])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7b8a7453e92sm4415203a12.41.2024.08.06.07.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Aug 2024 07:00:14 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com
Cc: dianders@chromium.org, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH v3 0/2] add more multi functions to streamline error handling
Date: Tue,  6 Aug 2024 19:29:47 +0530
Message-ID: <20240806135949.468636-1-tejasvipin76@gmail.com>
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

This series adds more multi style functions and uses them in the 
startek-kd070fhfid015 panel. Additionally it marks the older functions
as deprecated.
---
Changes in v3:
    - Removed mipi_dsi_dcs_get_display_brightness_multi
    - Unmarked mipi_dsi_dcs_get_display_brightness as deprecated

Changes in v2:
    - Improved formatting
    - Rewrote hex as lowercase
    - Marked old functions as deprecated
    - Added more functions to transition

v1: https://lore.kernel.org/all/20240628182428.171031-1-tejasvipin76@gmail.com/
v2: https://lore.kernel.org/all/20240730060659.455953-1-tejasvipin76@gmail.com/
---
Tejas Vipin (2):
  drm/mipi-dsi: add more multi functions for better error handling
  drm/panel: startek-kd070fhfid015: transition to mipi_dsi wrapped
    functions

 drivers/gpu/drm/drm_mipi_dsi.c                | 194 ++++++++++++++++++
 .../drm/panel/panel-startek-kd070fhfid015.c   | 115 ++++-------
 include/drm/drm_mipi_dsi.h                    |  10 +
 3 files changed, 239 insertions(+), 80 deletions(-)

-- 
2.46.0


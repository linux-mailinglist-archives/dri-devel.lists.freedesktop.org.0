Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED46CD3974
	for <lists+dri-devel@lfdr.de>; Sun, 21 Dec 2025 02:26:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF4210E25B;
	Sun, 21 Dec 2025 01:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZZdBsZz3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13EEB10E229
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 11:46:55 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id
 a640c23a62f3a-b72e7205953so43886566b.0
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 03:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766231213; x=1766836013; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IGC/wXUYiYQsnh5yWNhZ1+GGzCbr65mZk3jPLwzdXjQ=;
 b=ZZdBsZz3yAYWxS0od0NW9TlIJaT65mXFer87O7lcmqQjTffyF7HqurvfXkWQhEGzvs
 jsfpdoxqx7YVVFTViZ27bWCB4vYutsFOlcrs/oJH7eKs5jV/MU2L7HuN6WmxjogwGKIs
 cnsLcRZiZNRGgrMkssu1ZLSvQVT2vDYx7O27AUAlcE/0laCWkdzirVPrXRcsj7jj2hxX
 8RdQhrGZjtcVQCdluO3j0tmM/ew6Ym7sEw9r8BYbG2QOtxySp2IvVz68+hfHBWzhUyti
 U4MsV+Lpfk2zxwTJ9OLSlL4/ngpSB6Dx4pCeQuelr3UuUW2cwlUhaZwODaqz8GxFii9X
 HKSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766231213; x=1766836013;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IGC/wXUYiYQsnh5yWNhZ1+GGzCbr65mZk3jPLwzdXjQ=;
 b=K3Qbcmx/+Bosf4ztDOtqPpURJAeuGBTxTLvMcnaId/Zxien5kavCPA+C4Q9j79Rnl2
 l+TFm4QkUBPr9vfcm44IYEzP7WDz46IXny4Pa+Rvt/jCTgP2V3z82CSPVIuAOlvIp+7V
 GPiOiwJBKb0ESMqmDOnX8J6l+NmUmLnFczL3KzNuBOHPmNk+jvRtrgxShXh9w2btrH4I
 PxQoEKyW1bHHp0HCpqiseus2rIZzIbOraRUOzF3tPuvfq0QwTNDCb2ivuDClN6UwJum5
 mnSknUlYGz+WP+IIAcEc+ikxPGM1/Ib0R/4qi6g2Kzbvif8j8FA7HuKgU+4dpzxIKPhC
 ShaA==
X-Gm-Message-State: AOJu0YznFdAv1v3VDANMkiIZPmrUzoXDxrKkcpTGRpJr+Us8lc9YQr/w
 gOTXdj+uSgFlibfB2fE1aT3FsQY6wd/Y48ttoFA/lq3H1xFZIx4nZ4wr
X-Gm-Gg: AY/fxX4m0XgoHTES2I9b+KBSKCvKm5UcboWMHuZYWXYe4D0kQxQPCQkEyyjJ/F01uCV
 dazcMGDU9/9YNykou/H1URHzMdHVUaamdE7xZ7Kc/ny4GkImIQ38yfHLSO4d6Qn+oLoJNv9+K68
 6RpyJSQIWPtjiIV8J7zCHGXYokUMBB0dsl9k9ex3fMD0Dzc6Px3RjAc6SDdcLU2jvyn3JvEwU/3
 U/wY3bW/VNPcZXACAw0RUxnJitG+kMzuVlU7FWJtmzKn0vNbvYnSsuB52E8AgUK7hDu4GwD2gjr
 YtDoAfpyn9fCt7OZa3DNtXSn4vKZb/Wf8nTsTqqjONyGdki92L/exRHZQrD3QqNYYGeRcMwUCph
 akdettaDWFhonUejthfss+/yf9Ilc4VPx6zXyla0SMROwPtL93PhFsW+8xBJc/DqYC4KbCM2V06
 Ad6PPUhHlvY5ymtJVkZcDdd5O6oTGLpJvj4jjr6ku6X2r9oXbK25C8fpaiGOxR3rZa
X-Google-Smtp-Source: AGHT+IGQ6x7ZnQVQeDaeNCXSqDdMpW3yy2ZBTCiOeV9sMFDd0x+AREowv3nhxI5iwK9TUZGpZQMLkQ==
X-Received: by 2002:a17:906:dc91:b0:b76:3d45:51d9 with SMTP id
 a640c23a62f3a-b8036954bddmr355980566b.0.1766231213246; 
 Sat, 20 Dec 2025 03:46:53 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037a5bdb9sm495449066b.7.2025.12.20.03.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Dec 2025 03:46:53 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, harry.wentland@amd.com, sunpeng.li@amd.com,
 siqueira@igalia.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 bernhard.berger@gmail.com
Subject: [PATCH 0/4] amdgpu: Enable Adaptive Sync over PCON with HDMI VRR
Date: Sat, 20 Dec 2025 12:46:45 +0100
Message-ID: <20251220114649.169147-1-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 21 Dec 2025 01:26:28 +0000
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

Adaptive Sync over PCON is only available as FreeSync over HDMI. TVs which do
not support FreeSync, do not have working VRR with DP -> HDMI 2.1 adapters even
though adapters will take care of HDMI VRR info packets.

First two patches add generic drm edid parsing for HDMI VRR and ALLM.

Since HDMI VRR relies on FRL modes, this will only be enabled for PCONs in the
VRR whitelist. HDMI VRR for native HDMI connector will still not be
possible/attempted.

I myself validated these changes with my Samsung S95B + Bernhard validated on
LG C4 + FreeSync-less Sony Bravia 8. I used Alienware AW3423DWF that only
has HDMI 2.0 to check that FreeSync still triggers properly for "older" hardware

Tomasz Pakuła (4):
  drm/edid: parse HDMI ALLM info
  drm/edid: parse HDMI VRR information
  drm/amd/display: rename PCON adaptive sync types
  drm/amd/display: enable HDMI VRR over PCON

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 24 +++++++++++++++----
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  2 +-
 .../amd/display/modules/inc/mod_info_packet.h |  4 ++--
 .../display/modules/info_packet/info_packet.c |  4 ++--
 drivers/gpu/drm/drm_edid.c                    | 20 ++++++++++++++++
 include/drm/drm_connector.h                   | 23 ++++++++++++++++++
 6 files changed, 67 insertions(+), 10 deletions(-)

-- 
2.52.0


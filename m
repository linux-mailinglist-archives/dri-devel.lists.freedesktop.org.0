Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D333AA7FC2
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 11:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E5F910E387;
	Sat,  3 May 2025 09:47:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AKNtd8/J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF9510E387
 for <dri-devel@lists.freedesktop.org>; Sat,  3 May 2025 09:47:37 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5e5e63162a0so4315993a12.3
 for <dri-devel@lists.freedesktop.org>; Sat, 03 May 2025 02:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746265651; x=1746870451; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9I+WuMxG+yM19m/Xo/oViiJ4PvSxtCjT+rihYnJXMW4=;
 b=AKNtd8/J5A/JIppDS8G4YCwfltRLzjXmDTEUPGMdwaMPg853nVN8t/QeTyGyarm57l
 kpm/MBKHoqsAN4anW8KDQKfSo6hUbWmKZ0qWyhucPBWXSW7AoGlQUbNht7cnhViNHwVu
 s3ZuNOib/LWqZzcNUdvrh1IqYov8DlLvZBJosib1UKEY4Es9o4n/aBUuzpRBmDvTRp29
 71AzFZ1Ghdbs13ZsF9+L4/J7yeTB1hoCYpUg0EAK3fyMGntDsgTev4k5P/9oiYQEO4ne
 Hrzi1zYO463tY5pmbRYj+y+wgFOgz20wbgQzZ2a78qVeFfvAMqR4TkduUnjEkRLkQWo7
 dI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746265651; x=1746870451;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9I+WuMxG+yM19m/Xo/oViiJ4PvSxtCjT+rihYnJXMW4=;
 b=VUP6gR86jqeFDXKNjHe2m9Q4yu4ICgPcqA5m4dI/p2U6FE+AXFXU3mYMSaEwYEc5AR
 vvasJVAYTVsWY+8gwVgRolSdX+tIL+dN5nQl+UAGek9mCkD3M/4xqwpiMOnYwCVMRaHv
 2/vnczm3xpK4Z8IAk2SC8Td6E0W4DnvtMybj0KDh5qoeVcDfwHjLjZSYAvyybOV/So43
 Nsrt2ho9N469GbPw5PzlvLFqT5RVM3CNcVyoMaLbnbQRTomJs2kPK2yF44PaBMD2YBBW
 pqFsiaC1kpnub3tZx0YPIOGNYLIkLMXu3eWkRBzGMmLSbYmI20FN3j0UaOcjUNs5f/bn
 Fs2A==
X-Gm-Message-State: AOJu0YzfQcdDisplQs2qEbm5AW8FDa9pkLMEL4iDCd6vksGhOHhqRlE+
 LL+7Rrq5rFXOIs+E4pbBP66nOOAJRspTEQbr1xCrjVBSIjOWTeumDE+cFQ==
X-Gm-Gg: ASbGncvW8pEXD5axokYNs3MD4h+p6uFdd3P39rwIO8CAPpUTbjhXa3pG89iq/MBQQ5N
 TVZwpMsi59+posrt6qurgYSI8yAvaZ1En1ICRLSGYZs8clZVp1UQKSkNEZBt2es4DLBAn4rverl
 67jlXc2vQghZ8IZCIgsTg3erSV8uhRGHO92Jo/5YtDqFaNJjTNLsCSbINQZvV1akRvzPISeQ5VG
 TBFZXXi8Fm3/a5tFM25lhuS8uTp79G0q2DsQ1Rv3IYO6LjVQG7iGNkenerTmK7LT8mlIPBBhUiX
 C6VsM7Y9+3oXFFsa0MPmpJFCyLUgGT4v
X-Google-Smtp-Source: AGHT+IEob68icKGhCLKpOzZkwnmbURPV97UnwtKQJjFLj2dXSi0jDN7gPZJwVDO+ZP5fftTLN++1gg==
X-Received: by 2002:a17:907:6ea2:b0:acb:6eb9:b488 with SMTP id
 a640c23a62f3a-ad17b832445mr579628966b.41.1746265651496; 
 Sat, 03 May 2025 02:47:31 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad188ea7f41sm174732066b.0.2025.05.03.02.47.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 May 2025 02:47:31 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] drm: bridge: add ssd2825 RGB/DSI bridge support
Date: Sat,  3 May 2025 12:47:18 +0300
Message-ID: <20250503094721.29572-1-clamor95@gmail.com>
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

Solomon SSD2825 is a RGB to MIPI DSI bridge used in LG Optimus 4D P880
and LG Optimus Vu P895

---
Changes on switching from v3 to v4:
- no changes, resend

Changes on switching from v2 to v3:
- added mutex guard
- configuration register flags parametrized using panel flags
- removed unneded debug messages
- removed unimplemented modes checks
- added check for maximum pixel row length
- use types header
- remove ssd2825_to_ns
- shift bridge setup into atomic pre-enable
- cleaned default values of hzd and hpd

Changes on switching from v1 to v2:
- added description for clock
- removed clock-names
- added boundries for hs-zero-delay-ns and hs-prep-delay-ns
- added mutex lock for host transfers
- converted to atomic ops
- get drm_display_mode mode with atomic helpers
- parameterized INTERFACE_CTRL_REG_6 configuration
- added video mode validation and fixup
- removed clock name
- switched to devm_regulator_bulk_get_const
- added default timings
---

Svyatoslav Ryhel (2):
  dt-bindings: display: bridge: Document Solomon SSD2825
  drm: bridge: Add support for Solomon SSD2825 RGB/DSI bridge

 .../display/bridge/solomon,ssd2825.yaml       | 141 +++
 drivers/gpu/drm/bridge/Kconfig                |  13 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/ssd2825.c              | 813 ++++++++++++++++++
 4 files changed, 968 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/solomon,ssd2825.yaml
 create mode 100644 drivers/gpu/drm/bridge/ssd2825.c

-- 
2.48.1


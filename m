Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8A8B1589A
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 07:55:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F3910E35D;
	Wed, 30 Jul 2025 05:55:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MnL9Sq9y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB2210E35D
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 05:55:06 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-ae36dc91dc7so1077530166b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 22:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753854905; x=1754459705; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rEQjQUYSKvzxJm5N20PdRW2h2XKmpKdlgrVQR8zsmLo=;
 b=MnL9Sq9yO4SIu9BnSs5ALV1Bh0zHMGX2dOOB4fYwAk0IzU+lxGk9FsaSwGnRk2PP8j
 KAnLkbKnOwlmqZWiZEa1Qn85kUhfi8XY/PGgXsteu/4ggABwBa8JQizWDzSeds25rnci
 RA6+3Vesujc1z2pOefAlIGKeRI120nDRcWS+pXt8aRzl+z0rH1iPy2RUl00diZNUpxKN
 fK3TXtMAYZGRsm56NvS3iTWjmIIGvFOPo0yuLesMwf7Kq24FtOCttVUON0pj1L31L4Cj
 8N/M0MjKQW9fvvcPn71UBnik72lz/GMTicH1qnbDh/ntHi3twUc2XSh4E+oanWhYUjrr
 RwTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753854905; x=1754459705;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rEQjQUYSKvzxJm5N20PdRW2h2XKmpKdlgrVQR8zsmLo=;
 b=HLWhZrtcR1M1HXsymqZNnCko8LVyVcDcyZ32/jDvQd9NTBynwI+OL9Wq6ESR2B7o/C
 n294OazUztjraArUqDXsY35BQ8oLFRzSEyGIfD9JO6GR5Yt8dZ7zn3ckzTC43wUt6UOK
 vaxGJ6GnWcoL8N3jwNWIMg0EwfQOroqbB46BSqu1hNsTsbJVr7ohksMrCxx9hZDHH5Ah
 SGv/9Bpj6isaYnPsH2o2GhERTUAXOfemEZOJDKkUkSwNukSR+ac6VbhBxupHrewb26GR
 XoxMsFv6PKt57i1GA+Uz5uXM0KYMCmb/YoBc8YLcGvUtNDgg2hSF7bTfGfMX1XhKlCrE
 cGMw==
X-Gm-Message-State: AOJu0YwCvqVVcj0WhcGhO6jj/KIZKW3jewyITHOYP7WeUgscQBr3wtKE
 ScHubeFiszU0IvqAyAQln47sCLZ34SlWVi2EjV5trs1RydZpFnMSa/6J
X-Gm-Gg: ASbGnct0phhvwt6uiNEpKCk0ZK/Y2Xscf8gi1WwYKRbuXv8kFC2dj5sKrh5a//QVGsx
 J2pwQju5ER1r094R/mkf0IbGirp3Th8KdUWaE77XzosXXnvER0UGKhF3RbmBtjgRymnBrNm0QPT
 CVAHGaDnOQ9pijfJNlB66U627oGaoHEMK0rNdJzWRG+eM+FiKD3CxZyKVfUsRXw8Y+FRUMrmyfC
 95AYjXkHZiA2pZgm+E2fnb3uMEC0rK0xLETe3sumuwRWD/cQys5me5V3eErGqm1uGFczpSjKAwU
 ojZgJlW81IwhTP84I2xooZC+TQsYXoE6yZ4mg3IBP2m/mtn3msoYtTSFpBm7+XVlJ7GiMXtH1KV
 UZptHsZLubtEvWg==
X-Google-Smtp-Source: AGHT+IG8T0ZDzRB6oewO94j2PhAHhqbgoT2vO1y0rMUH9KlNOXkJaaxwmF/O/Ub/w2NeS9gfw8MUWQ==
X-Received: by 2002:a17:907:7216:b0:ae0:bbd2:68d1 with SMTP id
 a640c23a62f3a-af8fd95cabemr204331966b.37.1753854904605; 
 Tue, 29 Jul 2025 22:55:04 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6157f2d6b94sm1014803a12.57.2025.07.29.22.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 22:55:04 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Heidelberg <david@ixit.cz>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/2 RESEND] drm: bridge: add ssd2825 RGB/DSI bridge support
Date: Wed, 30 Jul 2025 08:54:22 +0300
Message-ID: <20250730055424.6718-1-clamor95@gmail.com>
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
Changes on switching from v6 to v7:
- removed enabled checks
- configuration complete quirk moved from host_transfer to
  atomic_enable
- switched to devm_drm_bridge_alloc
- removed redundant dev_set_drvdata use

Changes on switching from v5 to v6:
- set correct module name in Kconfig help
- return error if spi sync failed for reading

Changes on switching from v4 to v5:
- rebased on top of drm-misc-next with adjustments to fit

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

 .../display/bridge/solomon,ssd2825.yaml       | 141 ++++
 drivers/gpu/drm/bridge/Kconfig                |  13 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/ssd2825.c              | 775 ++++++++++++++++++
 4 files changed, 930 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/solomon,ssd2825.yaml
 create mode 100644 drivers/gpu/drm/bridge/ssd2825.c

-- 
2.48.1


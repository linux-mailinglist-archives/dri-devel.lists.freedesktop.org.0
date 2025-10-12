Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F370CBD0AEE
	for <lists+dri-devel@lfdr.de>; Sun, 12 Oct 2025 21:23:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB72610E156;
	Sun, 12 Oct 2025 19:23:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DENzcAfc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B476810E03F
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 19:23:41 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-afcb7ae31caso728468566b.3
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 12:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760297020; x=1760901820; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7J9gAExUq+Oz4yzs8pY69VKrstKlhFOaCqrIXbzFC7U=;
 b=DENzcAfcS/V3ylgPV8AB5HCPmY9XSz6fMIQ23XkS4UcxSJYE+l1PzAror/AKEqPQdM
 qpvv4xt8gee2Oo0ustSPn3FTuZEVg31BM4efOmBlB79aWgjkPqasMA3TcW6fZTyWkt92
 rdzjPy/qAEbBZ2vTz3lARwTe+NE0/COS3fgc8QwATw+5VW5fys+oglYJOEPKDO9DTRUP
 Td2tmf2v6vC+Kqa6te7vaGrrMAnHCC/sin3GFyJ99OrTx+6L1AWeDMDFzKqXlse9z31W
 ApHSJJws/crrA8gwIWqnfvYPZjHZK2amKDrH2tmTmNlNZqHss+hS3tTkGnkQa3dZ2+Gx
 Y+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760297020; x=1760901820;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7J9gAExUq+Oz4yzs8pY69VKrstKlhFOaCqrIXbzFC7U=;
 b=TYFnrcFeLgAyOxJjkjDj4zCaZJNsrRO/lN1rQ7C1qZ4SB6R2PHlAOlWPW0gDg/mnG5
 WcI4N3IARbDlzqRpwV1CB7LU+C8wObBi1dKm8LJaaQxq0ozWDDMcU6jk2459h7+pJ4AY
 lRYMufayqXS7wA/P1XpuNQHQrRiAau0SVC4MV4X//oQuJ8h3eeY3R/tXOv9ZpINiMqNK
 DBTcffmUehDzd+LmUSLGQUGWoIfizHOKKadh/f5ZxN81mFL+5UE5rtBN+sXNklWzhCpm
 23F8tvBBAmKcbrFT0Q7r15icvFk7kgfi8y4hUhSJFTMnFJvRvaZNNiJxnTJJA8jB2xet
 /BmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBAJF5JiFw1Y2CpOrXt4HaavAI1udLTk7MgWHVi8xBz8GImQXfiRqaMFWBjBa8eilv74zJKfL/560=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrCjH7iSIHx6GmANXbx5BrN9hDIMVNkAn++v7JKKXEjtBVuUZc
 roK+eBnETlSteXfNDCZ4dS9Xft1DyJzzovbMchU/C+7gVxLslr0s0BwT
X-Gm-Gg: ASbGnculCCOQHqhaTLK02d4MOn3meSF54G8cgtj8oWLjxhLGKaWfA4KHH9ObcFMxH5s
 WCkbN3h9qGHRjDlbP5fpqCYaNRR4p9sxIU8BsZbotcHXzVnTQ90UWNlUtvsw6lgXPTBQkIbMj0o
 hConssepOnMgqOJ/+tkR8IkhcsnAPzHomYLJ+VKHAxB9eRL00f7FZmsJrBpGG3oPMxHluQrKPNc
 Lki9PCHhYljAR91iQTrNBqhxyNAeavHMlDiDohAUjYyqFYyRI6xQx/imped4VguE+fscMzsRHxQ
 +5R7Zycj8mN7KgvAUYePYDoDRM2zqlRN8z8QHF65E6krVCk6Lih2ub6Xp2vbN5LYgEfSLdcJeh5
 /QDm70/oX01uk1UX8u6Vmb2FdiykMQOx8Ctw4HiFBtNI0K255WD5GjNvjxtlLaiwuL5QDBhk+tF
 RjPXgOcYSlAyYvmhDR4ds9hqAYVU5tGAA=
X-Google-Smtp-Source: AGHT+IF/Uy/U1nByaSaW88fFTBwL3trPURZFYBw8aStQyXQaj4POBOaMIpn0nvPCtXBb63j96D2NZg==
X-Received: by 2002:a17:906:c1d1:b0:b50:b508:d0e9 with SMTP id
 a640c23a62f3a-b50b508d6d1mr1500404166b.46.1760297019654; 
 Sun, 12 Oct 2025 12:23:39 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net.
 [178.79.73.218]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Oct 2025 12:23:39 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, samuel@sholland.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 00/30] drm/sun4i: Refactor layer code for proper DE33 support
Date: Sun, 12 Oct 2025 21:23:00 +0200
Message-ID: <20251012192330.6903-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.0
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

Current DE33 support in sun4i-drm driver is based on my PoC code. It was
written with *a lot* of hacks, because it was never meant to be upstreamed.
Fortunately, DT parts were never merged which give us a chance to do it
right.

This is first of three series with proper DE33 support for H616 SoC. It's
the longest, since it prepares terrain for new drivers in remaining series.
Point of this work is to completely decouple mixer and layer code. Till
DE3, mixer and layers were intimately connected. However, from DE33
onwards, this is no longer the case. DE33 and upcoming DE35 planes are
shared comodity between all mixers and can be assigned in any way driver
(or user) prefers. This requires planes code to be completely independent
from mixer. The only exception is mixer clock frequency which is used in
VI scaler, but in that case mixer pointer is obtained through currently
assigned CRTC.

Second series will introduce separate driver for DE33 planes and adjust
mixer code to new DT bindings. Third series will introduce TCON(-TOP)
adjustments, HDMI PHY and finally, DT updates for several boards.

Current WIP code for remaining two series can be found at [1]. Code has
been tested on Tanix TX6, which has DE3, for any regressions and on Myir
MYD-YT507H board [2], which has DE33, with HDMI and LVDS panel outputs
running simultaneously and independently. This confirms that plane code
is properly decoupled.

Please review.

Best regards,
Jernej

[1] https://github.com/jernejsk/linux-1/commits/sun4i-drm-refactor/
[2] https://github.com/jernejsk/linux-1/commits/okt507c-v3

Jernej Skrabec (30):
  drm/sun4i: mixer: Fix up DE33 channel macros
  drm/sun4i: mixer: Remove ccsc cfg for >= DE3
  drm/sun4i: de2: Initialize layer fields earlier
  drm/sun4i: ui_layer: Move check from update to check callback
  drm/sun4i: vi_layer: Move check from update to check callback
  drm/sun4i: layers: Make atomic commit functions void
  drm/sun4i: Move blender config from layers to mixer
  drm/sun4i: ui layer: Write attributes in one go
  drm/sun4i: vi layer: Write attributes in one go
  drm/sun4i: mixer: Remove setting layer enable bit
  drm/sun4i: de2/de3: Simplify CSC config interface
  drm/sun4i: csc: Simplify arguments with taking plane state
  drm/sun4i: de2/de3: Move plane type determination to mixer
  drm/sun4i: ui_layer: Change index meaning
  drm/sun4i: layer: move num of planes calc out of layer code
  drm/sun4i: ui_layer: use layer struct instead of multiple args
  drm/sun4i: vi_layer: use layer struct instead of multiple args
  drm/sun4i: ui_scaler: use layer instead of mixer for args
  drm/sun4i: vi_scaler: use layer instead of mixer for args
  drm/sun4i: layers: Make regmap for layers configurable
  drm/sun4i: csc: use layer arg instead of mixer
  drm/sun4i: layers: add physical index arg
  drm/sun4i: vi_scaler: Update DE33 base calculation
  drm/sun4i: mixer: Convert heuristics to quirk
  drm/sun4i: ui_scaler: drop sanity checks
  drm/sun4i: mixer: Add quirk for number of VI scalers
  drm/sun4i: mixer: split out layer config
  drm/sun4i: layer: replace mixer with layer struct
  drm/sun4i: vi_scaler: Find mixer from crtc
  drm/sun4i: Nuke mixer pointer from layer code

 drivers/gpu/drm/sun4i/sun8i_csc.c       | 113 ++++++-----
 drivers/gpu/drm/sun4i/sun8i_csc.h       |  16 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c     | 217 +++++++++++++--------
 drivers/gpu/drm/sun4i/sun8i_mixer.h     |  64 ++++---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c  | 183 +++++++-----------
 drivers/gpu/drm/sun4i/sun8i_ui_layer.h  |   7 +-
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c |  44 ++---
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.h |   4 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c  | 244 +++++++++---------------
 drivers/gpu/drm/sun4i/sun8i_vi_layer.h  |   7 +-
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c |  51 ++---
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.h |   6 +-
 12 files changed, 474 insertions(+), 482 deletions(-)

-- 
2.51.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C00C606C6
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 15:14:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6862A10E2A1;
	Sat, 15 Nov 2025 14:14:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O/QivbUa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 881AE10E2A1
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 14:14:14 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-6431b0a1948so5085086a12.3
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 06:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763216053; x=1763820853; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tO9M0rK2lTwB71cTYp3Jpf3ChX0WRs4mW1Amu6CT/w0=;
 b=O/QivbUa4J4Lgn5dz4cnxmMT7lTg3db2UA0smGuSNcpfCj3kglK3FhzhwUgXq/uFTs
 NIeEdH1bH076C6ECSCzspdA9+h4CLwNPsAOWrQ3sy9QZTlAz/2jwNiKS/r6avVFLgJgC
 FL8jgWS3GI1qxGFZ0NmE9hot1PVoYxIKtG0Hp+9oIPSmISxreIx/T6xE9+fD6vNcLV5q
 cjhhRTqPdbHKvT2H3FA5RrHvufd0CNxxJEejDEEow0V6LD9MHyRGF49PlkQDZZhWQUrb
 6cyM+CPxPO9f5vYgTdvZoBafvhsonW2xdIxgylmjA+vho0qlavLK0EB+prA6tVDTX7HV
 UL/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763216053; x=1763820853;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tO9M0rK2lTwB71cTYp3Jpf3ChX0WRs4mW1Amu6CT/w0=;
 b=bwsf1BNNhxslfr/Wteq/HglXR27goqI0MaJt70a9SOvaBLIeWsx28ofPf4aCuMaF/c
 aTcn+zlUJAK78A/MaDBa+aPUekXeRoewWcpx4iATGTsPZaFSRKk1hbAsgw6JD1MAQV/+
 Be4yv/lO1afRs7G3uiPQhqrm4pu+7mos+GQrMQE0aMRwm+0fc+cTgrEkrWfWwGwI7wiu
 s5ZYWMbAnc4oDKFBaaBSkfm/PQmQqtO0J0ifjph3UKaeWd8h6wwEPLfKkvyT83hpUM8k
 vtriuV9ryq3LIGVMbu3fSYvv4TnXauONZLAtaZ6DL7TlWm5gXH84YkIQ3D/7ZUiKyBOG
 GxVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/wTvTT+60MVGn0WLjE2rSILeL4EO5JWQE4fCwcHxSktIxMurzfzaXtFfoll/h1j6TFAvtgke/aW4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+YESdBCyp48Mf/N1fCmGve12GUoEjQzqTYCbnND18mu5iUfP5
 lRMoHaO4iidt05VzBkP6Rdk/xuHM8pu5Y3LXAz/qL1Ixgf6bZbkq20vI
X-Gm-Gg: ASbGncvw7KH8Qo5OMt+4R0DfKKjO3UUdMv6I8tKD8IDSZ78zwH+QPy0KmEiSELmXnCR
 Bgs9529L/BSMXyY4j7ng/mcl34375CtsdKk5bUUTXuWEEzvD2yoSEBW8F5fvkNnZR2JxBRQJQk8
 2ghGLo8OSo2sa6Aw+3nFgQzafJDxmcZ6s1joVZ8QdWKdsYi16gbxcm+1k/VfklHzscD+w64CS0v
 13Z4fmZ7ncQ/YFtwdiKpEufP6pLM4uBQLf7cATXMg5O8tr48rqR1ARxKdt43sMR2DlwIJuLkkbO
 DoiX2iMrFPgr4o/PH8dBG86SVwqjvBIwQL/eWeo97ZZOD5FNS59SOU7efrt/ZwOuWNil+Hb6BSD
 rOO3IfbEu/uksu58RCZKOWMNoleQBo7v/FfMVg6ijkjBZM31/KOpnzgLv4akK63NJ88vsNxb5Ao
 iMloxkhyEubGX6e+xITZrbIihI7l5xtvM4TzvOcN9w4Pw3BBmwu+wQRtZ9
X-Google-Smtp-Source: AGHT+IFp+Taw68EnwDXLkJFHgktvsI4Q2Kx6E5s2D/JuSsEx96b8Hqrxaybkmry8X04xeOfOSy8LRw==
X-Received: by 2002:a17:907:25cd:b0:b72:6383:4c57 with SMTP id
 a640c23a62f3a-b7367b79f4fmr713777466b.55.1763216052568; 
 Sat, 15 Nov 2025 06:14:12 -0800 (PST)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net.
 [178.79.73.218]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fda933fsm606189866b.56.2025.11.15.06.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Nov 2025 06:14:12 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org,
	samuel@sholland.org
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 0/7] drm/sun4i: update DE33 support
Date: Sat, 15 Nov 2025 15:13:40 +0100
Message-ID: <20251115141347.13087-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
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

This is second series out of tree which aims at properly introducing
support for H616 Display Engine 3.3. Previous series [1] reorganized
driver so proper DE33 support can be easily implemented.

H616 DE33 support was actually introduced a while back, but it was done
without fully understanding hardware design. Fortunately, no user of
H616 DE33 binding was introduced, so we have a chance to update bindings
and introduce proper DE33 support. Issue with existing binding is that it
considers planes as resource which is hardwired to each mixer as it was
done on older Display Engine generations (DE3 and lower). That is not the
case anymore. This series introduces new driver for planes management,
which allows doing proper plane assignments.

Remaining patches, which introduce all the missing bits to fully support
display pipeline on H616 SoC, will be sent once this series is merged.
WIP patches, which can be used for testing purposes, can be found at [2].

Please take a look.

Best regards,
Jernej

[1] https://lore.kernel.org/linux-sunxi/20251104180942.61538-1-jernej.skrabec@gmail.com/T/#t
[2] https://github.com/jernejsk/linux-1/commits/sun4i-drm-refactor/

Jernej Skrabec (7):
  drm/sun4i: Add support for DE33 CSC
  drm/sun4i: vi_layer: Limit formats for DE33
  clk: sunxi-ng: de2: Export register regmap for DE33
  dt-bindings: display: allwinner: Add DE33 planes
  drm/sun4i: Add planes driver
  dt-bindings: display: allwinner: Update H616 DE33 binding
  drm/sun4i: switch DE33 to new bindings

 .../allwinner,sun50i-h616-de33-planes.yaml    |  44 ++++
 .../allwinner,sun8i-a83t-de2-mixer.yaml       |  16 +-
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c          |  53 ++++-
 drivers/gpu/drm/sun4i/Kconfig                 |   8 +
 drivers/gpu/drm/sun4i/Makefile                |   1 +
 drivers/gpu/drm/sun4i/sun50i_planes.c         | 205 ++++++++++++++++++
 drivers/gpu/drm/sun4i/sun50i_planes.h         |  43 ++++
 drivers/gpu/drm/sun4i/sun8i_csc.c             |  71 ++++++
 drivers/gpu/drm/sun4i/sun8i_csc.h             |   5 +
 drivers/gpu/drm/sun4i/sun8i_mixer.c           | 130 ++++++-----
 drivers/gpu/drm/sun4i/sun8i_mixer.h           |  10 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  36 ++-
 12 files changed, 543 insertions(+), 79 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.c
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.h

-- 
2.51.2


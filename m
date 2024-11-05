Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1EC9BC4EF
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 06:54:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7718010E511;
	Tue,  5 Nov 2024 05:54:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qv0Noplv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D084610E511
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 05:53:59 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-20ce5e3b116so39766265ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2024 21:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730786039; x=1731390839; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HXw37Ptzu3bimMSf6CQ8Y9edFpEMJyd3FD+X6maYWNw=;
 b=Qv0NoplvyMiLehPwF8Y2hk1dDq24MHJdRY2nfCwP1W83M3pIe0UwGFp6tRvyqVmCaX
 qiPVlfWjugWSZboTuly67BuPgpNVX+MLHur5brQftWsApJi7s9cbfHDmxmpLSrXaJhsJ
 eF9MMMx/1LrLnTOuns9ID6li1zH52ECsTLbhz4Dpk/LN9vSFAJaSEpeb3IeG50dvZYWY
 6hZMTZUkXJtIM3v7IE+GjYxmx2ryo3YKDf7RTf43XtKU3aP6E30DAf9rAQyZLHFzhyfm
 czYjKeKbQxMftKG/dT/5fuJ234XkN48F8CqwXdYrIxL80P0lNwtZGjyKq3w3s5CmGWNr
 fQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730786039; x=1731390839;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HXw37Ptzu3bimMSf6CQ8Y9edFpEMJyd3FD+X6maYWNw=;
 b=fRsNx+kR6cs1ei/TWq3DNXewpmqbWnqEHkIY6isfZYAJoDRbFFmHnUCMI7K2N4ySDI
 rYkEdx392dE62425W/vTZMqf4x3sZw3Avta0aFzp7hvJ8zLPxlIlxSluvpCoWW8HLB0Z
 Gj45EKSHQZO2i200Ismoebch0ljxfpNuP/0ic40uv8+CB+rzd0lSQbjStUaevP76A/is
 5vgNN81M+QjIPLLna8yOvWcGYk042mYTZ4ypV3J3Q2+ZzrkVEkreAIktIZ993aioe6+d
 qBUVnwFx9a1F+CCcoT+zZ7tEyrnjr3mp6gho2eAshwPrHcky573Y2jrS2AKtNX9U8Kyt
 LHpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzHn0BSBgKyhjcqW3lKz05TQxNGm41HntkSIh/pNWttrdmQyg3exZSRqv0ccg8qb25vvf8KQzPb9I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBgHqhWYeUwGxGay9QpKCn1nKwf8EteSS+M/FtixiWOYIH3Tyw
 LSzvVwy1Ryn1pe4MQ9H3Lc487P4reihd1Hk4TwYV5E4QjHjk6D5U
X-Google-Smtp-Source: AGHT+IGE8hLPgyIsD8XZ5fAG8QHLyPTIRX4wdhKnkWxPCzFaV/bk2LDqzjSVdlgHw2RBoRD/r1w3eQ==
X-Received: by 2002:a17:90b:54c4:b0:2e3:b168:70f5 with SMTP id
 98e67ed59e1d1-2e94c2e472emr20606914a91.21.1730786038268; 
 Mon, 04 Nov 2024 21:53:58 -0800 (PST)
Received: from noel.flets-west.jp ([2405:6586:4480:a10:fa8f:7c3e:835f:c642])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e92fa4570fsm10952198a91.30.2024.11.04.21.53.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2024 21:53:57 -0800 (PST)
From: Hironori KIKUCHI <kikuchan98@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Hironori KIKUCHI <kikuchan98@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ryan Walklin <ryan@testtoast.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH 0/7] drm/panel: nv3052c: Fix Anbernic RG35XX panel support
 (and add RG40XX panel)
Date: Tue,  5 Nov 2024 14:52:28 +0900
Message-ID: <20241105055239.1577275-1-kikuchan98@gmail.com>
X-Mailer: git-send-email 2.47.0
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

Fix support for panels used in the Anbernic RG35XX series.

We previously decided to use the integrated vendor and device name for the panel, but the recent revision of the RG35XX series has a different panel that is not compatible with the old panel.
Unfortunately, these two RG35XX models have the same name and cannot be distinguished without opening them, so the name `anbernic,rg35xx-plus-panel` is no longer suitable as a unique identifier.

This patch series fixes the situation by:
* Renaming rg35xx-plus-panel back to WL-355608-A8, but with a vendor-prefixed `anbernic,wl-355608-a8` for the older RG35XX series
* Adding new panel, YLM-LBV0345001H-V2 (`anbernic,ylm-lbv0345001h-v2`), for the newer RG35XX series
(Detecting the connected panel is another problem.)

Additionally, this patch series adds another panel, YLM-LBV0400001X-V1 (`anbernic,ylm-lbv0400001x-v1`), which is similar to YLM-LBV0345001H-V2, for the RG40XX series.

This patch series should be applied after:
[1]: https://lore.kernel.org/dri-devel/20241020083836.175733-1-ryan@testtoast.com/

Hironori KIKUCHI (7):
  dt-bindings: display: panel: Rename rg35xx-plus-panel back to
    WL-355608-A8
  drm: panel: nv3052c: Rename rg35xx-plus-panel back to WL-355608-A8
  drm: panel: nv3052c: Fix size of WL-355608-A8
  dt-bindings: display: panel: Add YLM-LBV0345001H-V2 panel
  drm: panel: nv3052c: Add YLM-LBV0345001H-V2 panel
  dt-bindings: display: panel: Add YLM-LBV0400001X-V1 panel
  drm: panel: nv3052c: Add YLM-LBV0400001X-V1 panel

 ...-panel.yaml => anbernic,wl-355608-a8.yaml} |   9 +-
 .../panel/anbernic,ylm-lbv0345001h-v2.yaml    |  68 +++
 .../panel/anbernic,ylm-lbv0400001x-v1.yaml    |  65 +++
 .../gpu/drm/panel/panel-newvision-nv3052c.c   | 396 +++++++++++++++++-
 4 files changed, 530 insertions(+), 8 deletions(-)
 rename Documentation/devicetree/bindings/display/panel/{anbernic,rg35xx-plus-panel.yaml => anbernic,wl-355608-a8.yaml} (83%)
 create mode 100644 Documentation/devicetree/bindings/display/panel/anbernic,ylm-lbv0345001h-v2.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/anbernic,ylm-lbv0400001x-v1.yaml

-- 
2.47.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2551AC983
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 17:25:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0DBD6E2ED;
	Thu, 16 Apr 2020 15:25:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 292E26E2ED
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 15:25:06 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id a25so5369299wrd.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 08:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MC9RC4OOYOTP32+3XNp7wtNFT17uV5Ek7QfI8e7TLeo=;
 b=av4SWgmAtX8p7gi1AsSSRhSkIO8kXiG7Gc5yAUoDxLuQLFB2+YyPCpAsF+UiXwGO16
 +RTClbCkA+GdD940Ag1J2VIJ8Bt6Qhq1jnTdieVlr1Fg+D1baxB/12zCvOR13kOJBNrx
 qSOGs5Gu064uzBGBaxMahp1GaKPBHga6AIJ/uGx0dNi6xBArRg+RYZUFJVyh+b+5/hkO
 qBDaeo7vY3BUYTQSMikC0l55Cj3qUnOcmRbe/2/+XiiHMyghqaydmsbwbht3//6eiT2F
 d7EE7b+troPC5AmV+nhY8ocQcqrZkq4kHsfNdDdLWWh/kHtibBYV7qNsTV4iHzymk9cM
 4h6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MC9RC4OOYOTP32+3XNp7wtNFT17uV5Ek7QfI8e7TLeo=;
 b=lBBzvjxro5zWu1+5GGUJ2jFydcnEZ7G0CoHYDCeWPyr7shjDz51Wh2spMnoPckApRS
 lD3/Rjae3etBc3azgQ3cuziukhgKkg/cPHqiGgmurRXXgADc4eMi6RID83Cv0rTnffLB
 Ty5nETkiU577L1hIdwak+mQnqBw/twWyFSLCPT2nhqrm3MBjD5tMDMd2idKb39YKUifB
 HE+/jBspDgYBFQS65Lk+YihFDviamiDY7iwG58jtrf2Y64GhaPlKdI2LkCAdZY28yQtp
 HpSaAkWxAccZJh3FT0xZyqUBiYrVhbzVL8XPEXXoPq4U00MyE7oNq5JWYT8sAFi0UHMs
 2weQ==
X-Gm-Message-State: AGi0PuYqhAfJnGWzPENvZjdDxwU6RL3la1EsNjE5x3d7AYBUvJ5r2/jW
 y9iSYqvNg6pNE8+qTYysdgoT6w==
X-Google-Smtp-Source: APiQypIl+0gLXQFH0DVOclNzoYwFPgHGOgZCv5kErtoHhYcJAHaQM8n7WhFcobA+2fZkAQ6FkWe+2A==
X-Received: by 2002:adf:ed46:: with SMTP id u6mr7635635wro.327.1587050704557; 
 Thu, 16 Apr 2020 08:25:04 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56])
 by smtp.gmail.com with ESMTPSA id
 i17sm18019489wru.39.2020.04.16.08.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 08:25:03 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 0/8] drm/meson: add support for Amlogic Video FBC
Date: Thu, 16 Apr 2020 17:24:52 +0200
Message-Id: <20200416152500.29429-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Amlogic uses a proprietary lossless image compression protocol and format
for their hardware video codec accelerators, either video decoders or
video input encoders.

It considerably reduces memory bandwidth while writing and reading
frames in memory.

The underlying storage is considered to be 3 components, 8bit or 10-bit
per component, YCbCr 420, single plane :
- DRM_FORMAT_YUV420_8BIT
- DRM_FORMAT_YUV420_10BIT

This modifier will be notably added to DMA-BUF frames imported from the V4L2
Amlogic VDEC decoder.

At least two layout are supported :
- Basic: composed of a body and a header
- Scatter: the buffer is filled with a IOMMU scatter table referring
  to the encoder current memory layout. This mode if more efficient in terms
  of memory allocation but frames are not dumpable and only valid during until
  the buffer is freed and back in control of the encoder

At least two options are supported :
- Memory saving: when the pixel bpp is 8b, the size of the superblock can
  be reduced, thus saving memory.

This serie adds the missing register, updated the FBC decoder registers
content to be committed by the crtc code.

The Amlogic FBC has been tested with compressed content from the Amlogic
HW VP9 decoder on S905X (GXL), S905D2 (G12A) and S905X3 (SM1) in 8bit
(Scatter+Mem Saving on G12A/SM1, Mem Saving on GXL) and 10bit
(Scatter on G12A/SM1, default on GXL).

It's expected to work as-is on GXM and G12B SoCs.

Changes since v4 at [4]:
- added layout and options mask
- cosmetic changes in fourcc.h
- fixed mod check using the masks
- fixed plane apply using the masks

Changes since v3 at [3]:
- added dropped fourcc patch for scatter
- fixed build of last patch

Changes since v2 at [2]:
- Added "BASIC" layout and moved the SCATTER mode as layout, making
  BASIC and SCATTER layout exclusives
- Moved the Memory Saving at bit 8 for options fields
- Split fourcc and overlay patch to introduce basic, mem saving and then
  scatter in separate patches
- Added comment about "transferability" of the buffers

Changes since v1 at [1]:
- s/VD1_AXI_SEL_AFB/VD1_AXI_SEL_AFBC/ into meson_registers.h

[1] https://patchwork.freedesktop.org/series/73722/#rev1
[2] https://patchwork.freedesktop.org/series/73722/#rev2
[3] https://patchwork.freedesktop.org/series/73722/#rev3
[4] https://patchwork.freedesktop.org/series/73722/#rev4

Neil Armstrong (8):
  drm/fourcc: Add modifier definitions for describing Amlogic Video
    Framebuffer Compression
  drm/meson: add Amlogic Video FBC registers
  drm/meson: overlay: setup overlay for Amlogic FBC
  drm/meson: crtc: handle commit of Amlogic FBC frames
  drm/fourcc: amlogic: Add modifier definitions for Memory Saving option
  drm/meson: overlay: setup overlay for Amlogic FBC Memory Saving mode
  drm/fourcc: amlogic: Add modifier definitions for the Scatter layout
  drm/meson: overlay: setup overlay for Amlogic FBC Scatter Memory
    layout

 drivers/gpu/drm/meson/meson_crtc.c      | 118 +++++++---
 drivers/gpu/drm/meson/meson_drv.h       |  16 ++
 drivers/gpu/drm/meson/meson_overlay.c   | 289 +++++++++++++++++++++++-
 drivers/gpu/drm/meson/meson_registers.h |  22 ++
 include/uapi/drm/drm_fourcc.h           |  68 ++++++
 5 files changed, 475 insertions(+), 38 deletions(-)

-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

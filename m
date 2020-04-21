Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B9B1B2C2D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 18:16:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B146E072;
	Tue, 21 Apr 2020 16:16:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A9F6E072
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 16:16:05 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id z6so4386829wml.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 09:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oBXmUVijjl77qmlPJjceabUZhKXPDQu30ucjlCWJLm8=;
 b=zTcqxvYVH3V2nN32H6116A8cns9nt9Jpmu7xJFjkr0jvy37yVdA303M5a34KILWxLo
 Q8GI/lqn62BIwjr+5j0scfwmXHyc0OuPCGX21RH2ie71+C0W+LZ6Ogl0nNuwTE29Rq7u
 jlJJdCV1o8VjezXu7qMgqtzuC+2hqz6ObWTB1/MlnxfptH2SeO946uXbpzEg+QdchicC
 zxcESoE2lLWr/hK0JfVmRvMbVifObY85Yc6DOuDvVzZIWjtiVMDwZKNVcuIOwHwfORKD
 qKSimoTghbyjU0z/6qRjzKJjfiq8F4c6JDloqnUJWaLO8hKnip+dmiRGPjf7z5Dl0mtn
 CkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oBXmUVijjl77qmlPJjceabUZhKXPDQu30ucjlCWJLm8=;
 b=NA5M/49msBMmlWjzwxlGDpGcBwlKGz2O5WGbyCmbH2VpeNgwNvIMaw6XEZTmCEIXoB
 SwiKrhZRp1rwGINmIe5KgU0g3SjDQBUeWtYcvp89affO9DLg+oRxHddC+Ggb0129G5xd
 SQ0yYxZ9C9uf7udfb3GZgqx7TTZKGOkSBD2TU+vFawFeHoBoAX+azP7crhrtccj2UbQT
 CDH627wjAVADGAQ1mvnymdB31XqroWw+7ql9q/NbR1sw9HVJdvOXBhr3MbzQPdUVeca7
 GOsVjX2XCShP3dwqbnkMKGhJOXhz5JZVnE/Qx8vqimyXpVAR1w7H04Js+VmpONgiWYbe
 pdLQ==
X-Gm-Message-State: AGi0PuZ3bCoTP92AgQ6lO+wgqPYdvug0OXDRvAy9Bc59AaSQsgefS8rl
 lR54ki5PUHSpye2lNHKe7jX6jQ==
X-Google-Smtp-Source: APiQypLNjUCb6VGu7+SdjDGqKPYjok1sR95NqggclMqD39jzf+Kt7RT7+hcKHV1dlfZrLkjO6+6OlQ==
X-Received: by 2002:a05:600c:414b:: with SMTP id
 h11mr5600881wmm.9.1587485764463; 
 Tue, 21 Apr 2020 09:16:04 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56])
 by smtp.gmail.com with ESMTPSA id
 m8sm4410873wrx.54.2020.04.21.09.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 09:16:03 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 0/6] drm/meson: add support for Amlogic Video FBC
Date: Tue, 21 Apr 2020 18:15:53 +0200
Message-Id: <20200421161559.2347-1-narmstrong@baylibre.com>
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

Changes since v5 at [5]:
- merged all fourcc patches in 1
- fixed fourcc definition to have only a single DRM_MOD_
- fixed 2 checkpatch issues

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
[4] https://patchwork.freedesktop.org/series/73722/#rev5

Neil Armstrong (6):
  drm/fourcc: Add modifier definitions for describing Amlogic Video
    Framebuffer Compression
  drm/meson: add Amlogic Video FBC registers
  drm/meson: overlay: setup overlay for Amlogic FBC
  drm/meson: overlay: setup overlay for Amlogic FBC Memory Saving mode
  drm/meson: overlay: setup overlay for Amlogic FBC Scatter Memory
    layout
  drm/meson: crtc: handle commit of Amlogic FBC frames

 drivers/gpu/drm/meson/meson_crtc.c      | 118 +++++++---
 drivers/gpu/drm/meson/meson_drv.h       |  16 ++
 drivers/gpu/drm/meson/meson_overlay.c   | 290 +++++++++++++++++++++++-
 drivers/gpu/drm/meson/meson_registers.h |  22 ++
 include/uapi/drm/drm_fourcc.h           |  74 ++++++
 5 files changed, 482 insertions(+), 38 deletions(-)

-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

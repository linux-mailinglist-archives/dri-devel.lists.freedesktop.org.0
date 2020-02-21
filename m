Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8CE1678F6
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 10:08:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF5F6EEC0;
	Fri, 21 Feb 2020 09:08:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7696B6EEC0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 09:08:50 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id t14so845101wmi.5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 01:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3kb32uRYkhezIHBTmj+5SdLW5ETiBbDtA9WwDv9jFqg=;
 b=MHq30fHLCK1yAJBfIiqeZy2r0lRKlMQNNi0H+yiAO1uObLJy/V8lgFd0bW7GRlbdZA
 pVm+zKouDVsFeYirga2GLz6wxiIIIXU73yRTJnQWpy3+2jzqpfvbRD0GzW1r6Kfwahhq
 9em/BTeVTo9+SWaF0nC8xs4UoEhcx2w7NhKWVJpP77auP3klD1qQPWIwj1tSXmIRUmPp
 rRm7bqD8lP+V5f8+tZn6Iy7XDqtZJXzu3n1VCNq0Nyq+cSXoXbaCPtApVhwnN2UFx/8a
 8Pk7xV8Me2jOJ+nIvyIBR0AVtt5DEm/ZQQhklA60Qwjfv4CEyIeXbYS/rSRF5eBX9XZP
 0wQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3kb32uRYkhezIHBTmj+5SdLW5ETiBbDtA9WwDv9jFqg=;
 b=PrQn66tw9+61V+1cRHOBbEhJGf83iKoPEiItSpPjVNJQm21RXC6rMW97XO8b3ig/Gx
 CjV0/2lsglrb1llXFu/mgtj1r6NRDOh4EH9ykBE5IUIOA2o0bjPu2ZeCfiPYLtpb7LZh
 kkRqoIBEacpH+BBnOIKDynU4ag1uDeP7jXWzpsBC9yMkzQGbj2jU3HeyHaXm0UepBbn9
 mYBCxNzA4ig2mFP0Gyzx84kc2Xch8DrqO0hk85ytgbrNf2mXcNtYqWzYhUnMomyQkLCw
 w2TxHPgK5tS3g8nFovFUJkAoDIupByfrPP21712tGlB5xWq3Pp1YtE0o6M3zTvNXx8+Q
 fvKQ==
X-Gm-Message-State: APjAAAXtSpfKDeWheOv1BVBIssoV3nGvpbQLOsRnu50TXbjHR4//uUi4
 Q0MPri+53pFw1RPldwOxOI7t5A==
X-Google-Smtp-Source: APXvYqyASv2VhtyTE+GbLI9Iyxv1oYm6p8uGHIxc63RjQjtV3HCvpFF/TwD2nkmX9SvFBq2eEeVOoQ==
X-Received: by 2002:a05:600c:414e:: with SMTP id
 h14mr2419247wmm.179.1582276128899; 
 Fri, 21 Feb 2020 01:08:48 -0800 (PST)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:4ca8:b25b:98e4:858])
 by smtp.gmail.com with ESMTPSA id
 h5sm3173288wmf.8.2020.02.21.01.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 01:08:48 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/4] drm/meson: add support for Amlogic Video FBC
Date: Fri, 21 Feb 2020 10:08:41 +0100
Message-Id: <20200221090845.7397-1-narmstrong@baylibre.com>
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

At least two options are supported :
- Scatter mode: the buffer is filled with a IOMMU scatter table referring
  to the encoder current memory layout. This mode if more efficient in terms
  of memory allocation but frames are not dumpable and only valid during until
  the buffer is freed and back in control of the encoder
- Memory saving: when the pixel bpp is 8b, the size of the superblock can
  be reduced, thus saving memory.

This serie adds the missing register, updated the FBC decoder registers
content to be committed by the crtc code.

The Amlogic FBC has been tested with compressed content from the Amlogic
HW VP9 decoder on S905X (GXL), S905D2 (G12A) and S905X3 (SM1) in 8bit
(Scatter+Mem Saving on G12A/SM1, Mem Saving on GXL) and 10bit
(Scatter on G12A/SM1, default on GXL).

It's expected to work as-is on GXM and G12B SoCs.

Changes since v1 at [1]:
- s/VD1_AXI_SEL_AFB/VD1_AXI_SEL_AFBC/ into meson_registers.h

[1] https://patchwork.freedesktop.org/series/73722/#rev1

Neil Armstrong (4):
  drm/fourcc: Add modifier definitions for describing Amlogic Video
    Framebuffer Compression
  drm/meson: add Amlogic Video FBC registers
  drm/meson: overlay: setup overlay for Amlogic FBC
  drm/meson: crtc: handle commit of Amlogic FBC frames

 drivers/gpu/drm/meson/meson_crtc.c      | 118 ++++++++---
 drivers/gpu/drm/meson/meson_drv.h       |  16 ++
 drivers/gpu/drm/meson/meson_overlay.c   | 257 +++++++++++++++++++++++-
 drivers/gpu/drm/meson/meson_registers.h |  22 ++
 include/uapi/drm/drm_fourcc.h           |  56 ++++++
 5 files changed, 431 insertions(+), 38 deletions(-)

-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF83D9EA685
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 04:23:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0A3910E0D3;
	Tue, 10 Dec 2024 03:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="aa2Yq1lo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A684410E0D3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 03:22:57 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-46760d9e4daso14284071cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2024 19:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1733800975; x=1734405775;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:reply-to:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Dro4naoxwnk2zif5hx3koRBW27IE/i7uKasbGxdBR3A=;
 b=aa2Yq1loy+LZ+HgOLVKEnFII5nQXVJpzrwa/rABbT6Zp0QKmFXVsle74RV0FRa2lSU
 qUIQPMOMIHtSL9n/mhPTibiozJx39MdIQIhyVYGwrvg9qm4Ex+Um0Ekw9uct4Lk7SOym
 BFvAZNQX1thIQBmZk8/WhaWJX6SvGpBlPfRGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733800975; x=1734405775;
 h=content-transfer-encoding:mime-version:reply-to:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dro4naoxwnk2zif5hx3koRBW27IE/i7uKasbGxdBR3A=;
 b=fMQibG7IDAly+ztiqTFjmzvwtJfYq7cHx2UYtR0b/hNOz7YiX3vcSXKgsBAgHLuBBD
 y6SF43LG0HbDRABgQhqPnimLANJNjBl2xyb/vPvTJpOL9iJybDwrO+sBgSCapzaR6cMo
 oU94Osy+Jzk7WlDNSkZOBzFXtUxLOBd68sJTPyhm+ON+ixXQRmKludg3YunxH47aNdAc
 Ox0sR7kCtzb4T3Wv/5ECma2BlLlfIATaifsW5HXxXaobqmxhPkVHehcgBSmQrqfzk/ZA
 MAJxBxf40/ALE3xQcoP0Cg3YRQa1lAXkRfMzzeZm8wuQOm4qtphIaCPNyPE7JvweEsKx
 Fj8A==
X-Gm-Message-State: AOJu0YxLeozWCIwhQ99i+00K37hNSJIwMpzB7DkO/1QrrZi3Fvoq1J6i
 ef+0X2+eQK/dB/EprNtXwXphTsUUF5SoR3YrqydT2xCZlgIzNhZeMCzn+RxonDB8PNwVTrvpDy3
 wJQcecD6kegA2iom9JhhPGqH/rygtsp7s+Y95saJYtFq7VB/xbsJ3bhrYBoMz+fUjoZRiDCjLEZ
 +2NUdSKsLWQ37yB1pS5zxsP+Ov+Qcj+S+EP0tZBmE1FykJLt4wDlMbTh3DbMEr
X-Gm-Gg: ASbGncvmRzlFXcVUJfBOZtl3IzP5lRriTcZgL6a+H5p2ZoHMMGcOGQklv19q0P1fgQ7
 VOdXO5EVmwTClsl5l8NYbMXfxEAZzRzmsc1EPqe0JWHT466e4w/ZbEGqfkigr13DPojAznnbv0q
 X6ubk96jFR2ORwF1PbzSuXnHxoQ2Vm9hrShVntRiis/i1PlpjESXr0V7fBIWM1T2NCnbx2SuVGZ
 odPaFnjGj39gi9hYdPgFnPX7UAL0ZXD/623PTcRVoZdQYRFdXTBgIdSW1iVtpwuzb+hlPOdHkgB
 G8dh1oxDJMXm0ypMeSFU8oqH3bO+KGhwWeHfK2dFQkQB1VwZIRrKg+BMhzEnWvnm
X-Google-Smtp-Source: AGHT+IGeNoFwMxePfpMXR4L6hVQuDeoDmOI3RbNZaMbqEvT7PR2V5pxt2lUgnuyHXcvzKR6CkdhmZA==
X-Received: by 2002:a05:6214:5189:b0:6d8:a1fe:72a2 with SMTP id
 6a1803df08f44-6d8e723a069mr256167676d6.44.1733800975161; 
 Mon, 09 Dec 2024 19:22:55 -0800 (PST)
Received: from mombasawalam-Precision-5820-Tower.cap.broadcom.net
 ([216.221.25.44]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6d8ef223d18sm40871956d6.99.2024.12.09.19.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 19:22:53 -0800 (PST)
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, ian.forbes@broadcom.com,
 zack.rusin@broadcom.com, martin.krastev@broadcom.com,
 Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Subject: [PATCH v3 0/3] drm/vmwgfx: Add support for userspace managed
 surfaces. 
Date: Mon,  9 Dec 2024 19:21:46 -0800
Message-ID: <20241210032149.2084068-1-maaz.mombasawala@broadcom.com>
X-Mailer: git-send-email 2.43.0
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
Reply-To: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series introduces basic support for userspace managed surfaces. The
lifetime and id's of these surfaces is managed by userspace submitted
commands instead of relying on the kernel to manage them.

v2: Add flag for userspace to check userspace surface support.

v3:
- Unref surface resource properly if there is error in creating surface object.
- Check that guest backed objects are supported when reporting DRM_VMW_PARAM_USER_SRF.
- Bind hw_destroy function when command buffer gets commited.

Maaz Mombasawala (3):
  drm/vmwgfx: Introduce userspace managed surfaces
  drm/vmwgfx: Support hw_destroy for userspace managed surfaces
  drm/vmwgfx: Add support for older define commands for userspace
    surfaces

 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h     |  24 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 331 ++++++++++++++++++++++--
 drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c   |   3 +
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 198 +++++++++++++-
 include/uapi/drm/vmwgfx_drm.h           |   4 +
 5 files changed, 527 insertions(+), 33 deletions(-)


Maaz Mombasawala (3):
  drm/vmwgfx: Introduce userspace managed surfaces
  drm/vmwgfx: Support hw_destroy for userspace managed surfaces
  drm/vmwgfx: Add support for older define commands for userspace
    surfaces

 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h     |  23 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 326 ++++++++++++++++++++++--
 drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c   |   3 +
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 203 ++++++++++++++-
 include/uapi/drm/vmwgfx_drm.h           |   4 +
 5 files changed, 526 insertions(+), 33 deletions(-)

-- 
2.43.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F339DA11895
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 05:51:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 671E210E4C5;
	Wed, 15 Jan 2025 04:51:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="cpxQvmH3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A7FA10E4D5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 04:50:59 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-2164b662090so108780555ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 20:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1736916599; x=1737521399;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qm0TaJTo5gYx73ftDx/CmByhJ3giKcGQyC6o6U8LRAs=;
 b=cpxQvmH3k2EfXniyh6LPJaHvL1oAiohqv1N0s86Y0R34zyfjf4+sfRzGNzt3Jfvj2X
 tzhC9f1nkos53zUoSrTc57eBv7LqheK5ZJvZAnFzdzxrh5eTXNUfMByEmjtH+CGKIaol
 ODlpHpHS7FlP63ZzTLQ/11c6llvw5tWBOsXlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736916599; x=1737521399;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qm0TaJTo5gYx73ftDx/CmByhJ3giKcGQyC6o6U8LRAs=;
 b=YfYyGs71Exf+K92j53z7OrYh0GFnsc+xu95P4mqz89v2WKzoT2BCfUU7V0OYwcE0dG
 dNaP8dDGjl2Jn1mSYgZP8udLjrC2CccWtADD5O5TkwfS7G4MX9SxeQjG3Y8873bkmw1r
 6Voq7xiZbzWRB7fte8luTWxq1/FhWojNaV16aA0uwabjFdpPbQTeKypXM7Rl28hfPAd5
 qDbvkhGIhy7dsG+KbvqhQ8ksHD0pvmYnsbQkxARBDi8wsgx5k4I/Y9MH/3ELDR1e9wX5
 W7L592MjG1kACOscgBQh+VjmMsszSmiwPEk8vFQYjHlt5pt/E9mxHLwE/VbTsi9fht6Z
 wJgQ==
X-Gm-Message-State: AOJu0YxSJ0XNRqphjgTAdIt2nCDKdFm30JI208rtgqzyVOSp7yvpVGhN
 3uT9Blyl2f0KdOouZLyveWbfgefsnyuYKn6d1nP4yjXXYdTazJIcrs2EWRwS1JPKybB6fgZXTgC
 hcOtOJvGQwHwabkaau9AWmZzPnVOhWwWEqzMf9Yi6/SkY+JucgnHWMMBRVaE9WTKAZdsFU4knET
 9ANGeHhiTltb2+ettarZyKVDtV6XX1fpM46eTHYh/tBMfYxEirQw==
X-Gm-Gg: ASbGncv8n7hb4GRQ4XgCLqbdpQtT/+uG5B9kaxGesysvSXXjRkV0A9AMqldWuQn1IUl
 ZylBFG/vT1Q/9X4k/5HOs/GUKB95J04Afxej1yOxo/0jYDwewbVjjgH/FMMyLrJzFdvvF816ruh
 LOrYOrfy32KYSPy0Q0uqp9teAK+7CbROhHd2N1lQ4si+xVrbLDgEWUlVIw14u0ElyLemS0DYgNF
 iq7hXfsDgm14OmOT9ekPWSGmdiJvF80nn275ATbpQcQF7gokrCLMQSxnYHfD9OZ3LFtWqRVl37c
 /5hQ8F22GuRvuoKI9jSm92LnriNH1NGuX2NgZxmVcNKeM7hd
X-Google-Smtp-Source: AGHT+IFaG0EtNnhzJUTGBUJ6dGljC/524HIWWahNo+hdrO47KBIzusJGOdKa+/RIgyn0JrRZAVuJ4g==
X-Received: by 2002:a17:902:d552:b0:216:60a3:b3fd with SMTP id
 d9443c01a7336-21a83f4bbd3mr384762595ad.3.1736916598766; 
 Tue, 14 Jan 2025 20:49:58 -0800 (PST)
Received: from localhost.localdomain
 (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21a9f13c92dsm73905325ad.97.2025.01.14.20.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 20:49:58 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH 0/2] Fix native cursors with vmwgfx
Date: Tue, 14 Jan 2025 23:49:33 -0500
Message-ID: <20250115044954.2496547-1-zack.rusin@broadcom.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

vmwgfx had a number of cursor issues that related both to our handling
of dumb buffers and general detection when a cursor has actually changed.
Fix those issues and bump the kernel module version to allow userspace
to recognize fixed versions of the driver.

Zack Rusin (2):
  drm/vmwgfx: Refactor cursor handling
  drm/vmwgfx: Bump the minor version

 drivers/gpu/drm/vmwgfx/Makefile              |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c           |   6 +
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h           |   2 +
 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c | 844 +++++++++++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.h |  81 ++
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c          |   3 -
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h          |  12 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c      |   2 -
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c          | 838 +-----------------
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h          |  49 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c          |  10 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c   |  40 +
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c         |  10 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c         |  11 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c      |  25 +-
 15 files changed, 1018 insertions(+), 917 deletions(-)
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.h

-- 
2.43.0


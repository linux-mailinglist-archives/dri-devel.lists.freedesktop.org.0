Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AC3A5418E
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 05:12:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05CD410E10A;
	Thu,  6 Mar 2025 04:12:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="R7smkGf8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C28C10E10A
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 04:12:34 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id
 5614622812f47-3f674752049so155987b6e.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Mar 2025 20:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1741234353; x=1741839153;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NN63h7YeveGxs+uaI6t2rrHz/CtFwn7QXO+y7dx8/MY=;
 b=R7smkGf8PtSgJvPy7DadSYgVL31J41fRmf58hlLiDKPS46jUj6deQhLVZBRrNh/u/9
 FcmzhBmYlXZbdgICyvzZQGsJ2gFGfbzYKNidqDiHi3V6cgYIeM6mNdMXw75B826Ulfr6
 dwtkV6lfmxs7whP/4DayIArZelBOwxVX4ammk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741234353; x=1741839153;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NN63h7YeveGxs+uaI6t2rrHz/CtFwn7QXO+y7dx8/MY=;
 b=HO8U7WZFGvrdSLBiW+0AuMz74UHKyDLNh8xmUI9JxbLiIq1QF33aTCDx79fuhYSRyb
 LyQ6wDA9k96sIA0ZSZDUAsghpqGOnn0v84wXI6GhciZn4fR7KJ2fA37wM4fX0XhRoYQw
 zuvpEMI4OiOu6REkVCX/muRnSfU+nqLu9ANGmWuXmJmohoHo48fCkv279yCQcxP3fr3s
 ka9rp6FjtHxOTLjbGGSdT2YOJ/J+mCqj69zsMmHe/E0wwuIGF+JgaLYKo5ny09fbp8e+
 UmdO7hBVIYB3RcC+WofSBFiYFEpCWLb2x9HnqjdD9vaodOqhx+l0zAg5B93bS//0tmsM
 G7NA==
X-Gm-Message-State: AOJu0YwnKfmk/zTq7/P78L6tRem96Q9JaMO9T790EzndLvl+xBgGBKSx
 xgS9d/OuE8laRiV60vLJQaPUCYRdc7O3/55JiXvfJr20nz6oWMxAs0qfzJS/jV9/8ZNEkj0kyqv
 ssEul4O8zryM9civ11g5zHdNEISldqwCRtqkOUJzv9U368fLkshExOhjXge+bIygPnbrRbO/SUf
 dl+f+/vlFwlL+uSvSwXo1a13xd0bfVPUngKwN1UNPXjdNAJQdLeA==
X-Gm-Gg: ASbGnctxfxSrnpgBLTfAeASUYOdUIpRv1gHmRJ5Oqtt1ak2HrDyd5ntHr0gniJD3eC9
 GbW+W3GrWzCH5a7MaY8gQmZHZVbEoxSOdCg6TvVD3Kys8XOheFk0V7J0QCyFwNSSpbR1sezASXk
 Y5/Pce8+mQL53Ip2alQlFTAUraK8io7kaZG6lJhwg6E/x8rEi3RCNrs+KL/o7CgDnDoS0dACBeo
 PTq04yoqbzG6G40gWdA1Oy4iTdiRv9Pgh50k/85ZM4qyI4cY1Pyy8vbWMxRhRvctbosFsERZZgJ
 lXcQYaFVrK0t7+32ppYweTO5+cClRQJZE6PQb387liij4w3qnIexjss0XWy/wXWrScpHowlLegG
 veaPehnzFV/+4TGUrKnzdSsyevhL5OqFM+ajm
X-Google-Smtp-Source: AGHT+IEYsikwKKpHuHWg8cOaNzt3uenPST9cHIVQ8s0HP58XJozPrlWERmXV+8Y432Uiq8W8VM0LQg==
X-Received: by 2002:a05:6808:19a0:b0:3e7:e38a:722b with SMTP id
 5614622812f47-3f68c97d825mr1039621b6e.14.1741234353255; 
 Wed, 05 Mar 2025 20:12:33 -0800 (PST)
Received: from localhost.localdomain
 (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-3f68efc5811sm74428b6e.30.2025.03.05.20.12.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 20:12:32 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v2 0/2] Fix native cursors with vmwgfx
Date: Wed,  5 Mar 2025 23:11:08 -0500
Message-ID: <20250306041222.2776379-1-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.45.2
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

v2: Include the fix for leaked dirty trackers in kms fb surface
cleanup code.

Zack Rusin (2):
  drm/vmwgfx: Refactor cursor handling
  drm/vmwgfx: Bump the minor version

 drivers/gpu/drm/vmwgfx/Makefile              |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c           |   6 +
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h           |   2 +
 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c | 844 ++++++++++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.h |  81 ++
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c          |   3 -
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h          |  12 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c      |   2 -
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c          | 851 +------------------
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h          |  49 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c          |  10 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c   |  40 +
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c         |  10 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c         |  11 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c      |  25 +-
 15 files changed, 1031 insertions(+), 917 deletions(-)
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.h

-- 
2.45.2


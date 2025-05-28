Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87423AC6568
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 11:13:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD6E10E5AA;
	Wed, 28 May 2025 09:13:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="TnV3r4Xh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5352F10E59F
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 09:13:20 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so33782135e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 02:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1748423598; x=1749028398; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KxvUhkzyK09LCXKLx7FGoJ45MvcFpxmn56wr8qda5vk=;
 b=TnV3r4XhKWguZGRvfEMZmN7NnvxuxGBj9XA8IoCY+gM3HY7m8+LGQx05kk2/gV7Fhz
 7M1gM6s5XH598ukSU8siohQLzmf3YyAAvprPOSdTNiDRWXzk0bCoNKpWP3h6isVAaavl
 zt5VcyyONzAb4BIA4UhUcogKcAfYqjwGOEVVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748423598; x=1749028398;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KxvUhkzyK09LCXKLx7FGoJ45MvcFpxmn56wr8qda5vk=;
 b=XJg9AsGIYY2vB/bV5crwOxUn3JhOhpnUdaqIF1sr0Heg4QQG282eOKHbxn5HvA/IwU
 gsRleHARQE6WaC4ga96X/2eKd02EEomuOxIDkVhWv2yz/+QVNKO/tt1c5jWHQrfDjGoC
 5O036aq9UBAmkbuM8r9Zw1jwTCOZ5N+a2Krd+56GrKLxdlzbJwFEZs8JUf0OY7FJnRtQ
 yLqLAIzrHZoKUpaC9lcbT65iWzTp6tOntOn/nCHiO/WwsB2Gh/1ffxC27SjDhKNZIK37
 sc6tnK53jjdLiqQUk/p+9Dz6/Omx7e0Oaa4MpNFdgM52rUSmxlHrwsBe7Bnuafn2+AL2
 4hmQ==
X-Gm-Message-State: AOJu0YxIZoeyAS0eUtKocgWV2KS+ao2GqV0cdJDQifvBKgjHaddgDfac
 yb8fMWVWeyu4hh0YAIaZW7lbL0m8XMNI1ZATruETNVRs4fHrYJ4KPqkkDoN1tbDmGif/gyJs2Qg
 FPGUY
X-Gm-Gg: ASbGncuD2kIU46mBLRXQckPJ0ksS7JU8HdbiMH4k8JF+NQsxrnN3Y4/7V1KW6AQPwl0
 EljITJ69JXgany89oydT9jB69La6WcASYsfwpIELd1xoeLC24p/d8ojP1Fjs3Jkgv+gknHDEeof
 mnbV63WbJJ1zID77nDyfKx4pi6eciVUTkADQFyp3U+VvfvhF0Ak+bXdpbsJtcuWDkY8b8MLudJT
 hIg2ozaNDf6J683CzTseFngPBEdmL0zHBxgphGQZMZfL9rm3M+0v2sO0OCCeMUHzKOMa+bx9p3u
 evhP264+Qe0aEXqT3A2mDcZ3COwsX848raQ24rJb+c291yA9Q14Yby3ps/gejeg=
X-Google-Smtp-Source: AGHT+IEbmCZiVG865mZLo5+7RJm8r2o9XPjBFzxv8/gHi5WhloGsJ0uCG0WUaVPE45IR7XZbXx45YA==
X-Received: by 2002:a05:600c:4e52:b0:43c:e7ae:4bcf with SMTP id
 5b1f17b1804b1-44c8ee84a83mr159101545e9.0.1748423598210; 
 Wed, 28 May 2025 02:13:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4500e1d85b5sm14811715e9.32.2025.05.28.02.13.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 02:13:16 -0700 (PDT)
From: Simona Vetter <simona.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: intel-xe@lists.freedesktop.org,
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: [PATCH 0/8] drm/gem: Audit around handle_create races
Date: Wed, 28 May 2025 11:12:58 +0200
Message-ID: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Hi all,

Thanks to a report by Jacek Lawrynowicz I've crawled around in core and
driver code around drm_gem_handle_create() and found a bunch of issues.

Attached series is either fixes where I could do them, or RFC-style
patches that just add a comment about what looks wrong. The conversion
from idr_for_each_entry to idr_for_each only fixes temporary premature idr
iteration termination, and so fairly benign impact.

Testing and review very much welcome.

Cheers, Sima

Simona Vetter (8):
  drm/gem: Fix race in drm_gem_handle_create_tail()
  drm/fdinfo: Switch to idr_for_each() in drm_show_memory_stats()
  drm/panthor: Fix UAF in panthor_gem_create_with_handle() debugfs code
  accel/qaic: delete qaic_bo.handle
  drm/amd/kfd: Add comment about possible drm_gem_handle_create() race
  drm/amdgpu: Add comments about drm_file.object_idr issues
  drm/vmwgfx: Add comments about drm_file.object_idr issues
  drm/xe: Add comments about drm_file.object_idr issues

 drivers/accel/qaic/qaic.h                     |  2 -
 drivers/accel/qaic/qaic_data.c                |  1 -
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       |  2 +
 drivers/gpu/drm/drm_file.c                    | 95 +++++++++++--------
 drivers/gpu/drm/drm_gem.c                     | 10 +-
 drivers/gpu/drm/panthor/panthor_gem.c         | 31 +++---
 drivers/gpu/drm/panthor/panthor_gem.h         |  3 -
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c           |  1 +
 drivers/gpu/drm/xe/xe_drm_client.c            |  3 +
 include/drm/drm_file.h                        |  3 +
 11 files changed, 90 insertions(+), 63 deletions(-)

-- 
2.49.0


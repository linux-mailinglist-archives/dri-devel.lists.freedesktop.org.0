Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DCBBCB33D
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 01:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8138C10E045;
	Thu,  9 Oct 2025 23:39:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WNxcVm2D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3D8B10E248
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 23:39:18 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-46e61ebddd6so15286825e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 16:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760053157; x=1760657957; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yJFaIMUPoYmzAjPmdOJ59lzNVZeNVTShHGh4jV4ztic=;
 b=WNxcVm2Dyj2RajpjjD7x5DoLMulgPu5KwV2cPlLz45ui4tFMMr3yHiHq6Mf8lM6sBQ
 GZgH7GPrLyQG01qAlKh2ymgiqdtyo6bCozC2ObhT/4Vytj4rfbEWHAPwjhuh5Rd+ttv5
 6RPLU812Bwir/boSbhG38BOE+Y3fu42GQMkSuNnAK3LerYCf6SxkWvx8iTVDU5HC+za/
 4+Zb6ydkLhyd6r/sfJsQTC6+F+sK7aTabt8mUa4LGxiEpor3bPIv/nx5uDBNOkPpEXss
 A586ETwnRTwBmftSLftEIZxdE5O+OeWBE11ZDr0KoR0Bgm9l1g6IFNlnswWyPE5IRL6w
 /Psg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760053157; x=1760657957;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yJFaIMUPoYmzAjPmdOJ59lzNVZeNVTShHGh4jV4ztic=;
 b=nP7gapr0v08EFkJlMJuF/WM+TtiprCJ87vz2xg2+hD6kNwvvDp0M835e2DXfWemnwG
 fqQf7iQVs+1PTOs5q91H0+Pe8xpKRS1aD61QkTg/3k9qwhKlkbpsVdpnJ6QzrDh1B95l
 NoXWAYr0+4CHn3cbqlbI0Cp7i7QGltItpETAWjMWHQyc+OSZYYbB8caZkEt3YBZrFbd8
 WNWxmi2fOmkWUaPKZqjdkhBppsApyAMSIJQMfTSDT4oIx4IMP3xAyw0zUFhFWNIjMRdI
 ris1JpdEpc6LTHa1xrVwJecV+kNuFsz97yG/HcBQlofUvwp303q1K5XyAMUbEwxQ61eN
 DWiA==
X-Gm-Message-State: AOJu0YxPGxiBhSazLTcG9a51LJDn9dtwErRiqThFeWuzxCZcrWGA+6Iz
 z+1BUUW8J91I/VfAmpADysJxxkNuFJKoLv+GZcM7SnJGkdAMdsWH6lZY
X-Gm-Gg: ASbGncuV2sA2/kaVD9gGjUD3NqD4yPqRQSkUs9Wy7IXxqXFoj4hRSwFKiS6+BO7cOdS
 r2hUGAZuhpRMF1KFJaqM81oPX3tzKT7ws4eK+DGJ1Lh+FYRXT8hQbGgj3fk6wFq3KBOegekzQpW
 lShRvT3CFwDGYAA6ktmIbQbeeP+EgpKgm+tHs2rSerNsoegVSs51OpD0+KBxO/Kb/md1/Z9dRdc
 mHgs4Mk5vNYj2sNe7luU4OoweAw06n7G7P5vveQAB2cAsxVz0N5RYNDb9896kDOii7uUZ5dq2rw
 mXWN/LcCc7JV6gsg+HjbG8lnwue63/fr3gMKEPiiZknQ9EojiM7bhMk1auwmHk3Gf9g1zkd9PeI
 5LxlzR54Kt6EpRqDmnj1px3ocLlC6Kza1pcBS1HJCemKybzXZIzQQ
X-Google-Smtp-Source: AGHT+IEWq4VpnqfU8FFLrzl/DHl5jygZ2q4d7dLrByZ4bLt3b/dzlYCAmwAed5vYoO1IY1J7qpOOUg==
X-Received: by 2002:a05:600c:a08b:b0:45f:2bc5:41c3 with SMTP id
 5b1f17b1804b1-46fa9a8f261mr65000185e9.8.1760053156830; 
 Thu, 09 Oct 2025 16:39:16 -0700 (PDT)
Received: from fedora ([41.45.27.42]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fab3e3206sm46066075e9.4.2025.10.09.16.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 16:39:15 -0700 (PDT)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Mary Guillemard <mary@mary.zone>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Subject: [PATCH 0/5 v2] drm/nouveau: Enable variable page sizes and compression
Date: Fri, 10 Oct 2025 02:38:32 +0300
Message-ID: <20251009233837.10283-1-mohamedahmedegypt2001@gmail.com>
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

The new VM_BIND interface only supported 4K pages. This was problematic as
it left performance on the table because GPUs don't have sophisticated TLB
and page walker hardware. 

Additionally, the HW can only do compression on large (64K) and huge (2M)
pages, which is a major performance booster (>50% in some cases).

This patchset sets out to add support for larger page sizes and also
enable compression and set the compression tags when userspace binds with
the corresponding PTE kinds and alignment. It also increments the nouveau
version number which allows userspace to use compression only when the
kernel actually supports both features and avoid breaking the system if a
newer mesa version is paired with an older kernel version.

For the associated userspace MR, please see !36450:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/36450

- v2: Implement review comments.
- v1: Initial implementation.

Ben Skeggs (2):
  drm/nouveau/mmu/gp100: Remove unused/broken support for compression
  drm/nouveau/mmu/tu102: Add support for compressed kinds

Mary Guillemard (2):
  drm/nouveau/uvmm: Prepare for larger pages
  drm/nouveau/uvmm: Allow larger pages

Mohamed Ahmed (1):
  drm/nouveau/drm: Bump the driver version to 1.4.1 to report new
    features

 drivers/gpu/drm/nouveau/nouveau_drv.h         |  4 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c        | 71 ++++++++++++++-----
 drivers/gpu/drm/nouveau/nouveau_uvmm.h        |  1 +
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    | 69 ++++++++++--------
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c    |  4 +-
 5 files changed, 100 insertions(+), 49 deletions(-)

-- 
2.51.0


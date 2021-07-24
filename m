Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CB63D475A
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jul 2021 13:19:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBDDE6EDC7;
	Sat, 24 Jul 2021 11:19:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 759B86EDC7
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jul 2021 11:19:00 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 k4-20020a17090a5144b02901731c776526so12657441pjm.4
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jul 2021 04:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fu+EOl8MzFHnqJUqNfrpGZTo0/rhrJKaN+eR+XuGHMc=;
 b=O85DMHyeVRIuNVgeITMNvJFbLraGrRkBIWg4sV/aVqhdxkebXDwNJJLp+AUkqsDeEL
 Na7LsPIPk6TvdsnmYa2vHP35R21S4kl96KOk9HSz0FzBQ6wgclLdqQZs74HukQKS0ckC
 shl5r8IQqN4Esh1S1GLl8L4MppOhtJku495fCCLt1X6Zj601Rljo4zYNmKVItA6h8/St
 D/mC85zB75DvGX/fE3DM0VpUNJeagVUTRdXcN4jxdZOE+Nq6WlYcWdZqOEFZ5mU6BCY9
 2VniXcW1EHtTMG0eT76mpjoJcRkv6UMuoA0DWDS2+bmBoQrSfP6m8FFfTG3slhbMHdZo
 jEhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fu+EOl8MzFHnqJUqNfrpGZTo0/rhrJKaN+eR+XuGHMc=;
 b=jPAPiTTS2UhWadphiZ3l8L9+ugsX0ZBv0+/DThqEI/Ls/cL/6w0LkJkIHF5x19VEPw
 cD9zZTs0wKGDXKiHM2zBubEYyvMCSSAOvD0Nlr67o2yFHJhZxLrgh+8TTE1w/jR0zxTv
 bSUoDkHx0LnL9iYJ7Ik+dLNDNb0O6gc/5kiTJuS6wbwmpf6KaMNta/MsvDgIZxI2sfIZ
 TE1TON6YIZe6HT2sL8kUEFtupKKNVggnULpJ8pGB/SgK6cOoWYvdo/qNE4kzMZsXAVTb
 3s6EhJsB0UZtiui2M8ZW5NI7vMdAjxXnYCh/uxzVD1awJ73o2Q9gTgM59V+ES2pCQ/2T
 qc5A==
X-Gm-Message-State: AOAM531cH5hQMiv/CnpvSnI+2T1Pc3n4iUs6soCA/C0aniwAnRyVdFP8
 tzb1mQnJtdyDZzvg8PXhBl4=
X-Google-Smtp-Source: ABdhPJxbdpJ6RuIPKFdq0gqilzFZT9DQCDdNnN2S5MzYOUyd3XCuX/ms1akPJbumH/5igHmyD+GLbg==
X-Received: by 2002:a17:90b:b12:: with SMTP id
 bf18mr17739337pjb.74.1627125540031; 
 Sat, 24 Jul 2021 04:19:00 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id v15sm21310057pff.105.2021.07.24.04.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 04:18:59 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: linux-graphics-maintainer@vmware.com, zackr@vmware.com, airlied@linux.ie,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, corbet@lwn.net
Subject: [PATCH v2 0/3] drm,
 drm/vmwgfx: fixes and updates related to drm_master
Date: Sat, 24 Jul 2021 19:18:21 +0800
Message-Id: <20210724111824.59266-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, skhan@linuxfoundation.org,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Just a note that only patch 2 changed from v1 to v2 of this series.

This series contains some improvements that Daniel Vetter proposed following a discussion on a recent series:
https://lore.kernel.org/lkml/20210712043508.11584-1-desmondcheongzx@gmail.com/

While preparing these patches, I also noticed some unprotected uses of drm_master in the vmwgfx driver that can be addressed by new functions from the previous series.

This series is thus broken up into three patches:

1. Switch from the outer drm_device.master_mutex to the inner drm_file.master_lookup_lock in drm_is_current_master.

2. Update the kerneldoc for drm leases to clarify usage and lifetime/locking rules.

3. Prevent potential use-after-free bugs by replacing calls to drm_master_get with drm_file_get_master in vmwgfx_surface.c.

v1 -> v2:
Changes to patch 2:
- Clarified description of lease fields in drm_master with suggestions from Daniel Vetter.
- Added an overview DOC: section for drm leases in drm-uapi.rst.
- Cleaned up function documentation in drm_lease.c to use kernel-doc formatting.

Best wishes,
Desmond

Desmond Cheong Zhi Xi (3):
  drm: use the lookup lock in drm_is_current_master
  drm: clarify usage of drm leases
  drm/vmwgfx: fix potential UAF in vmwgfx_surface.c

 Documentation/gpu/drm-uapi.rst          |  15 ++
 drivers/gpu/drm/drm_auth.c              |   9 +-
 drivers/gpu/drm/drm_lease.c             | 182 ++++++++++++++----------
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c |   4 +-
 include/drm/drm_auth.h                  |  67 +++++++--
 5 files changed, 187 insertions(+), 90 deletions(-)

-- 
2.25.1


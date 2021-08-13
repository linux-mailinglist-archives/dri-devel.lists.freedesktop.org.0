Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DEC3EB31C
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 11:03:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26B36E598;
	Fri, 13 Aug 2021 09:03:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8705A6E58A;
 Fri, 13 Aug 2021 09:02:26 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 qe12-20020a17090b4f8c00b00179321cbae7so4472697pjb.2; 
 Fri, 13 Aug 2021 02:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QyadB7FpuNKWDpEAZ8pIq2q37loKngbMavtVP6UOn6M=;
 b=otuX9qtW7oO7slcAr8Qx9A7t9+t16sjcuBTl0Nz1CiCb/f+XIczvOF3wPAf72bjlA0
 eh9bVUdU+CbC57B3GtKBbNP5C3gC9FbLyiunBYxysyO+TmTxoXWr+pR8FqLuKMqy7ndv
 X42dGivelzNOJPCYdAKl5b9GYZGUPQJhA9z3g5boJaeMcB+MJCqDza6JXTKzu5V+i4Je
 pDYKKtsBFnyJ+68KHYwtwFf8z774UFQYQu8cPjX3Iuzcbas3mGrsFkhyzJ/dcN2WwrT+
 aDca6bW8UBPIF0QqZXCnPVSh4gJB4cThZ/dK+FzKoXsr7HOu+vRrnKGK3IKk8sQVZS0s
 lLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QyadB7FpuNKWDpEAZ8pIq2q37loKngbMavtVP6UOn6M=;
 b=U96U5bqRO/8uRvmOw5vq9aKZ6YY/JG89ivtHJWQzOMMyZaqvwyiKdG4nAxbOIqAhWn
 Pd4v7ukluicxpI70OTVxAv5u9FKpaIY4zCc8c5+v0efP2LsPK9ujP+/6Bvaehhlo5QRB
 qzeE+6TTTUcp0enWwWMIq12GdNVG2dx12Jm/Ax8ppUt1WNVNWx8XBA9zK7JMXW52td/I
 +0J09dh+pe2tnwDk43v+h4ueENg2RWMy9tlszO3RJRkUswzKOoYo7zdKbBN5mh1VLsEH
 Yias3KXR4SIKp7ilUhQrZXjr3SXvlHj7qV9BxhwlXKo0Em2bzRe990JIPaYMiQIw4/NR
 UVIQ==
X-Gm-Message-State: AOAM532dQcbMwMy/Z5fmewNqBd6Z6wk2R52mgCCX3Bge/pwtvgOqhSri
 1jH5JXEUNQMfVFNTSCJIfUw=
X-Google-Smtp-Source: ABdhPJzwOPIahHcMzCFDYaA2ZSWs+PyhnrGetdTzb2NAmo63L/38ue6X0HTkv/G8tJ/ZUe0l9S34hA==
X-Received: by 2002:a65:468c:: with SMTP id h12mr1473806pgr.423.1628845346151; 
 Fri, 13 Aug 2021 02:02:26 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id 31sm1818428pgy.26.2021.08.13.02.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 02:02:25 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Cc: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 intel-gfx@lists.freedesktop.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH 0/2] drm: update the ioctl handler
Date: Fri, 13 Aug 2021 16:54:48 +0800
Message-Id: <20210813085450.32494-1-desmondcheongzx@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Finally got around to it. This patchset implements some updates to the
drm ioctl handler that were first raised by Daniel Vetter in [1].
Namely:

- Flush concurrent processes that can change the modeset when
DRM masters are set/dropped or a lease is revoked
- Unexport drm_ioctl_permit()

Thoughts and comments would be very appreciated.

Link: https://lore.kernel.org/lkml/YN9kAFcfGoB13x7f@phenom.ffwll.local/ [1]

Best wishes,
Desmond

Desmond Cheong Zhi Xi (2):
  drm: avoid races with modesetting rights
  drm: unexport drm_ioctl_permit

 drivers/gpu/drm/drm_auth.c           | 17 +++++++++---
 drivers/gpu/drm/drm_client_modeset.c | 10 ++++---
 drivers/gpu/drm/drm_drv.c            |  2 ++
 drivers/gpu/drm/drm_fb_helper.c      | 20 ++++++++------
 drivers/gpu/drm/drm_internal.h       |  5 ++--
 drivers/gpu/drm/drm_ioctl.c          | 40 +++++++++++++++-------------
 include/drm/drm_device.h             | 11 ++++++++
 include/drm/drm_ioctl.h              |  8 +++++-
 8 files changed, 77 insertions(+), 36 deletions(-)

-- 
2.25.1


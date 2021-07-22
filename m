Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3553D20E3
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 11:30:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C37F46EE6D;
	Thu, 22 Jul 2021 09:30:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 413C76EE6D;
 Thu, 22 Jul 2021 09:30:05 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 nt18-20020a17090b2492b02901765d605e14so3685821pjb.5; 
 Thu, 22 Jul 2021 02:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hdUv+GXySeA885YGpZmLXS+2jizmvcJ4lSDniuXWHI4=;
 b=EhYdQIseNy6lMDk8YjKQ1veyCiTbOgIoJ/VBVn2vLDHGjdPFhTNSRUWUK0bPWotrpJ
 XSI48OOBzprocJPN7b707Qc5XV1f9dLIpRoM7q+PNMy9LwG20xJmvNbKcGSK6p/43ngv
 jDxmxG5TXCq5VK530lsn/vAQrKCaKcQpM7lW3d1Fq/JexqDaA+V87C8Xhqbqp1A/6NrL
 WmSWXzObWM7UDCKqx7X0RGvebf9a9LFGYQcEiQtpFff0ndaFx1/emvMQExqEB3bVyCHs
 Z5PVVvZNWxv6xwAeBz0zwPyunJkYBvTruohXRBUZOy/c20hg9bs5aXsGxSpOS4Gj/5oz
 L9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hdUv+GXySeA885YGpZmLXS+2jizmvcJ4lSDniuXWHI4=;
 b=Z3PE28vwqtIhUPrhVumQTrKOrOyhtzhMOseOfMiYScNgn3GHa1b1bUiebypLD0wi15
 SneK1iPW9EQXhUAXw5QxvxsISzJajO3rpWCxMmxIs411ZskoPLYjimJKbazLbeh1W0x3
 VU+x0rbqcvthh8hL0pJnudVRT4w/885SlIUaKgJ7CwRUMWNSplqUEQpxo9XDMo0b2Xsc
 BL7bsybEM3C7j5KCsG3JK44uQiK285qvhyngKBjl7fJDgKfMhsS4VZhydVUKwuph20hE
 H7a6y7HS2C9ya/mOGEDIJlD7LjfHADawH+KgK6LIWC5F9DtUghMJUw8iiccYAApq5dyQ
 588A==
X-Gm-Message-State: AOAM532rB8cZdGf6KFRjGsd61hMLRIqWHqIG9ffO3AhAEfqjGnf4xbUh
 P9mJANXnPW5GL1Pqoh60ueE=
X-Google-Smtp-Source: ABdhPJzNOnM2Xiyy747iVpPkppzdexY5XMa3HjOqEYwbnOjXK0DTZlH0ZcQCcNQf3tlBT+6SeQX2yA==
X-Received: by 2002:a63:e250:: with SMTP id y16mr40565172pgj.247.1626946204761; 
 Thu, 22 Jul 2021 02:30:04 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id q5sm1069592pjo.7.2021.07.22.02.30.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 02:30:04 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: linux-graphics-maintainer@vmware.com, zackr@vmware.com, airlied@linux.ie,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de
Subject: [PATCH 0/3] drm, drm/vmwgfx: fixes and updates related to drm_master
Date: Thu, 22 Jul 2021 17:29:26 +0800
Message-Id: <20210722092929.244629-1-desmondcheongzx@gmail.com>
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
Cc: gregkh@linuxfoundation.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 skhan@linuxfoundation.org, Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This series contains some improvements that Daniel Vetter proposed following a discussion on a recent series:
https://lore.kernel.org/lkml/20210712043508.11584-1-desmondcheongzx@gmail.com/

While preparing these patches, I also noticed some unprotected uses of drm_master in the vmwgfx driver that can be addressed by new functions from the previous series.

This series is thus broken up into three patches:

1. Switch from the outer drm_device.master_mutex to the inner drm_file.master_lookup_lock in drm_is_current_master.

2. Update the kerneldoc for lease fields in drm_master to clarify lifetime/locking rules.

3. Prevent potential use-after-free bugs by replacing calls to drm_master_get with drm_file_get_master in vmwgfx_surface.c.

Best wishes,
Desmond

Desmond Cheong Zhi Xi (3):
  drm: use the lookup lock in drm_is_current_master
  drm: clarify lifetime/locking for drm_master's lease fields
  drm/vmwgfx: fix potential UAF in vmwgfx_surface.c

 drivers/gpu/drm/drm_auth.c              |  9 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c |  4 +-
 include/drm/drm_auth.h                  | 62 ++++++++++++++++++++-----
 3 files changed, 58 insertions(+), 17 deletions(-)

-- 
2.25.1


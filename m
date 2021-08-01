Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A67C73DCC90
	for <lists+dri-devel@lfdr.de>; Sun,  1 Aug 2021 18:03:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57BC06E04B;
	Sun,  1 Aug 2021 16:03:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 095476E04B
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Aug 2021 16:02:59 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id c16so16808404plh.7
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Aug 2021 09:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=9WHfa05emgeYdvg5zaeTSJK9ZWbxQqTP0TmxQ8412Lk=;
 b=WBCJxWSj4Mccb35DFcRn0E0dbWa792cNXI8FF77t2qSdMsMAXe5QmSrOqv2vANeWhr
 /1uMuPe6GoK+V/6HYWjagRy72GmzC1vuLBSJyeawE5F+40o7kvzI3ySRBo+3+ONYyiDy
 +ABlPm0BI6kRuYofIDDt7g6i6UU0Dm9ijxwnLNXxwOTK8mEfhBlU9rUgltfNCcBUBbMZ
 5eREZLA3YY4Us9pb9ZpLcpeTidLOnXti7qDTUsMNm5z0GLwV63oBCBGWiBJuzTBMX5gQ
 Gk/VjbRsXoLhcruOfNNIVn47oiLO7vm3oWURD/zRP5J8yuAgOSCkSlTEu5E5Av4QGTWH
 yyDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=9WHfa05emgeYdvg5zaeTSJK9ZWbxQqTP0TmxQ8412Lk=;
 b=r9Z6BMfhHhptT2uXxcNSKWx1KUUYvci2n+rIJ5q34x0li3qFS+orDtZ1UBJ2FbI/gX
 ys5W0kduN2QoUJoHlFk+Rt84HHXrbIq+Bf9VRiTEX3u7SNOHNmB4Hmm8movF1RHxxKH0
 SSXQ/EsfhDfkdQPZ/TeRTV7u1EYbm3kEpzjCbxa0HpgmUwSdLyxiG9Pxoo5VA/v9FKZF
 +fVeT38EfbDehOW/lis29dRrHZOLhHMT1v9L6AFwiXnVBz8Gy4LYriuv2aC45WN4L6ZQ
 exr56vlRCxuaPTHnKovqWoAN1fvQDX6TQP7O1Qt6AcL4N0CVtsEO4caQ8e6rsiERwE7W
 lEsQ==
X-Gm-Message-State: AOAM531Gfs4BfKo5JMBfdL47lUeNcUrIYsBBn7r9J3XwayjPDPaAMHCB
 ZoOdFtHe1GCwvgzhm07mT+M=
X-Google-Smtp-Source: ABdhPJwl/Y8S13DMfmsEfy4Oq0KQ4o1v/Q8AdJysvZqXDXVDTO49IrkHsCcEKz6Ds6TBOmHA+QbSDA==
X-Received: by 2002:a17:902:8493:b029:12c:552f:1fb1 with SMTP id
 c19-20020a1709028493b029012c552f1fb1mr10997498plo.26.1627833778689; 
 Sun, 01 Aug 2021 09:02:58 -0700 (PDT)
Received: from adolin ([49.207.203.94])
 by smtp.gmail.com with ESMTPSA id k8sm8618416pfu.116.2021.08.01.09.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 09:02:58 -0700 (PDT)
Date: Sun, 1 Aug 2021 21:31:48 +0530
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
To: melissa.srw@gmail.com
Cc: rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com, daniel@ffwll.ch,
 airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH V5 0/2] drm/vkms: Add virtual hardware module
Message-ID: <cover.1627831087.git.sylphrenadin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

This patchset adds support for emulating virtual hardware with VKMS.
The virtual hardware mode can be enabled by using the following command
while loading the module:
        sudo modprobe vkms enable_virtual_hw=1

The first patch is prep work for adding virtual_hw mode and refactors
the plane composition in vkms by adding a helper function vkms_composer_common()
which can be used for both vblank mode and virtual mode.

The second patch adds virtual hardware support as a module option. It
adds new atomic helper functions for the virtual mode
and modifies the existing atomic helpers for usage by the vblank mode
This gives us two sets of drm_crtc_helper_funcs struct for both modes,
making the code flow cleaner and easier to debug.

This patchset has been tested with the igt tests- kms_writeback, kms_atomic,
kms_lease, kms_flip, kms_pipe_get_crc and preserves results except for
subtests related to crc reads and skips tests that rely on vertical
blanking.

Sumera Priyadarsini (2):
  drm/vkms: Refactor vkms_composer_worker() to prep for virtual_hw mode
  drm/vkms: Add support for virtual hardware mode

 drivers/gpu/drm/vkms/vkms_composer.c | 93 ++++++++++++++++++----------
 drivers/gpu/drm/vkms/vkms_crtc.c     | 51 ++++++++++-----
 drivers/gpu/drm/vkms/vkms_drv.c      | 16 +++--
 drivers/gpu/drm/vkms/vkms_drv.h      |  4 ++
 4 files changed, 112 insertions(+), 52 deletions(-)

-- 
2.31.1


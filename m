Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE35B7FABB
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 16:02:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F0310E835;
	Wed, 17 Sep 2025 14:02:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="iXYQYtMU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5B27F10E835
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 14:02:36 +0000 (UTC)
Received: from
 linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
 (linux.microsoft.com [13.77.154.182])
 by linux.microsoft.com (Postfix) with ESMTPSA id E5C2A201B1BD;
 Wed, 17 Sep 2025 07:02:35 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E5C2A201B1BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1758117756;
 bh=VLC2Tckh3tcwZAMr/z4UuSQpR3++Fdb4yhz3jPFTmj8=;
 h=From:To:Subject:Date:From;
 b=iXYQYtMUZn8+3BzAe9ItI/R5lcluv4XNWcbOtGuryzS6E1acx3vCywPpp+rOiXItp
 tIrjL2c9keEvk66+cQNkQKlzZnFO0o45Ik20MDBHCp8fMK0C6DsbGBUWf22m/A/uMo
 4jwqk4zrRK/2DG0HgIg6xTywhD3JaYVC/fR/xK5U=
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
To: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 ssengar@linux.microsoft.com, mhklinux@outlook.com,
 ptsm@linux.microsoft.com, rdunlap@infradead.org,
 bartosz.golaszewski@linaro.org, gonzalo.silvalde@gmail.com, arnd@arndb.de,
 tzimmermann@suse.de, decui@microsoft.com, wei.liu@kernel.org,
 deller@gmx.de, kys@microsoft.com, haiyangz@microsoft.com
Subject: [PATCH 0/2] deprecate Hyper-V fb driver in favor of Hyper-V DRM driver
Date: Wed, 17 Sep 2025 07:02:28 -0700
Message-Id: <1758117748-20457-1-git-send-email-ptsm@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
X-Spam-Status: No, score=-2.0 required=1.7 tests=BAYES_00,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
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

The Hyper-V DRM driver is available since kernel version 5.14 and it
provides full KMS support and fbdev emulation via the DRM fbdev helpers.
Deprecate this driver in favor of Hyper-V DRM driver.

Prasanna Kumar T S M (2):
  fbdev/hyperv_fb: deprecate this in favor of Hyper-V DRM driver
  MAINTAINERS: Mark hyperv_fb driver Obsolete

 MAINTAINERS                     | 11 ++++++++++-
 drivers/video/fbdev/Kconfig     |  5 ++++-
 drivers/video/fbdev/hyperv_fb.c |  2 ++
 3 files changed, 16 insertions(+), 2 deletions(-)

-- 
2.49.0


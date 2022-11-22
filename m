Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0848D633B37
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 12:22:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79BBB10E3C9;
	Tue, 22 Nov 2022 11:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D809F10E3C9
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 11:22:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 51A8061656;
 Tue, 22 Nov 2022 11:22:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E948C433B5;
 Tue, 22 Nov 2022 11:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669116147;
 bh=6WgNlDauiyoEDo3ITsLg57Fz3J8mYviYy1mteCmoMGU=;
 h=Date:From:To:Cc:Subject:From;
 b=JwPzwHJj3qxNLVJ+nqH+Vua1RDEjfa3e8XaGTndRtJ5wkv2y+fczKvjbhiQw5yBoM
 Tb+vjZQGHRaoPbAKC2JEgztqrzoLu0n3ge7MJp4LGE6EBrP19+HM55AQHTAvDN5Tbh
 dnjzAKgy45vEuHSm/v7aBX4yAB1pLhE8yfMGVv59LumYApzAwEIEYgcCxroDYfvgoi
 ypttE9xFQkRL7Dh6NYjzgw0sn/U6VaYxfF2pGbzCzYW+UEMZgxEGTRScX9oeYH+TY/
 e3gG1TeSuYyi396npS3rP8SrIV6nqGPzKO3Qy/okm1Uh+DJ7Ox4QjzGTIwQ2UdNNT2
 lYjHK3mmlVWWA==
Date: Tue, 22 Nov 2022 13:22:22 +0200
From: Oded Gabbay <ogabbay@kernel.org>
To: Dave Airlie <airlied@gmail.com>
Subject: [git pull v2] new subsystem for compute accelerator devices
Message-ID: <20221122112222.GA352082@ogabbay-vm-u20.habana-labs.com>
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
Cc: daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

Resending the pull-request with the fix of the build when CONFIG_DRM_ACCEL is
set to N.

Thanks,
Oded

The following changes since commit fc58764bbf602b65a6f63c53e5fd6feae76c510c:

  Merge tag 'amd-drm-next-6.2-2022-11-18' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2022-11-22 13:41:11 +1000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/accel.git tags/drm-accel-2022-11-22

for you to fetch changes up to 8c5577a5ccc632685e65168fc6890b72a779f93a:

  doc: add documentation for accel subsystem (2022-11-22 13:14:52 +0200)

----------------------------------------------------------------
This tag contains the patches that add the new compute acceleration
subsystem, which is part of the DRM subsystem.

The patches:
- Add a new directory at drivers/accel.
- Add a new major (261) for compute accelerators.
- Add a new DRM minor type for compute accelerators.
- Integrate the accel core code with DRM core code.
- Add documentation for the accel subsystem.

----------------------------------------------------------------
Oded Gabbay (4):
      drivers/accel: define kconfig and register a new major
      accel: add dedicated minor for accelerator devices
      drm: initialize accel framework
      doc: add documentation for accel subsystem

 Documentation/accel/index.rst         |  17 ++
 Documentation/accel/introduction.rst  | 110 ++++++++++++
 Documentation/admin-guide/devices.txt |   5 +
 Documentation/subsystem-apis.rst      |   1 +
 MAINTAINERS                           |   9 +
 drivers/Kconfig                       |   2 +
 drivers/accel/Kconfig                 |  24 +++
 drivers/accel/drm_accel.c             | 323 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/Makefile              |   1 +
 drivers/gpu/drm/drm_drv.c             | 101 ++++++++---
 drivers/gpu/drm/drm_file.c            |   2 +-
 drivers/gpu/drm/drm_sysfs.c           |  24 ++-
 include/drm/drm_accel.h               |  97 ++++++++++
 include/drm/drm_device.h              |   3 +
 include/drm/drm_drv.h                 |   8 +
 include/drm/drm_file.h                |  21 ++-
 16 files changed, 711 insertions(+), 37 deletions(-)
 create mode 100644 Documentation/accel/index.rst
 create mode 100644 Documentation/accel/introduction.rst
 create mode 100644 drivers/accel/Kconfig
 create mode 100644 drivers/accel/drm_accel.c
 create mode 100644 include/drm/drm_accel.h

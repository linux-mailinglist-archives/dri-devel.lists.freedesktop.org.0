Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECE636A01B
	for <lists+dri-devel@lfdr.de>; Sat, 24 Apr 2021 10:22:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 591D96E0CB;
	Sat, 24 Apr 2021 08:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5346E0CB
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Apr 2021 08:22:30 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id s7so50531547wru.6
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Apr 2021 01:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=qN+v1Lct2njpZc/Y5ouNqPjL3TC5C9AdS4ToALawVG0=;
 b=gkKt+S8nVq48LlekXsBjz9ZpzUAq5ZLEVbvI59CjVXs30KZIq43PvcGFSqzlnulb+5
 /wC/Kot7nCX2m8/tswA4m3GUuNzdTfcEMAaVemb1/PnzRJnN0w2Y91gkHanGpIAHsBMV
 OYfwMBG9/IMcGP/pWAi/o1L3j6zLIIfg8fo+K2l7VvVwrBMnxo/D/v7RsDAJUFDCpGnl
 X0nFFMCEhSvyA2PIu5BeYHW9DCPY89OOJ1yznBZEmXzFFo1OsqhwZtT4lUFSklO3Hy73
 C10mpkrlZdSe7VkSY+7rINAcEAM1+PQmHPMu3fEIZGlqsv1iWxZiuY5dYwKr4AkxRZ3f
 0gHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=qN+v1Lct2njpZc/Y5ouNqPjL3TC5C9AdS4ToALawVG0=;
 b=CWJRaM3zcHYbGW8DTKZ1urAVWDy2C0S5qPKTeRA3vgEfp+YVqSSUUmdEWSlS9YUCyS
 HI1dDQl9p8vz0qbiOgylFCPyA8m8KZvo6ZJcz83gjXylzINfyPcDJwvouTIjW9GWhbnL
 pne2xlJ2SMskY7MrKyocpsQPcJ8vtJo/M3AC1ApiFe5e2s8eRgGaQbJhXi9oi70tFFHt
 uIaZsdAE7MmdNyDm8Rfo8X5iCTxp1XQSyEgOAgVOEix/qDeFy8BtrZtwL8kz74ucys/J
 s5aFc5Fx+GdNVUIOH72h82My4wMahEZQeJu5yoXykU9imAFlI/dFrh66+vexwun35wpB
 n34Q==
X-Gm-Message-State: AOAM531rZAP6NEvJHz+zvURyXeEUkLWAcp0HlCiX6TJD/lY5Q+mUlIcl
 1ehnFX16i0QWBEggSQbVagpNwzxZOabxI4Kx
X-Google-Smtp-Source: ABdhPJzS5nnNZmnBPoLSHigjLtMtK1kqwuiTtF0gjPKzzo9y44ORq5fuSWg/zUVYgY0bAL0TGN8ewA==
X-Received: by 2002:adf:90f0:: with SMTP id i103mr9400669wri.318.1619252548421; 
 Sat, 24 Apr 2021 01:22:28 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id b15sm11912729wrt.57.2021.04.24.01.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Apr 2021 01:22:27 -0700 (PDT)
Date: Sat, 24 Apr 2021 05:22:21 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/4] drm/vkms: add overlay plane support
Message-ID: <cover.1619250933.git.melissa.srw@gmail.com>
MIME-Version: 1.0
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Sumera Priyadarsini <sylphrenadin@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding support to overlay type in addition to primary and cursor plane.
The planes composition relies on the z order of the active planes and
only occurs if there is a primary plane (as in the current behavior).

The first patch switches the function of initializing planes from
drm_universal_plane_init to drmm_universal_plane_alloc. It aims to
improve aspects of allocation and cleanup operations, leaving it to the
DRM infrastructure.

The second patch generalizes variables and functions names to refer to
any kind of plane, not only cursor. The goal is to reuse them for
blending overlay and cursor planes to primary.

The third patch enables the plane composition to select a pixel blend
operation according to the plane format (XRGB8888 or ARGB8888).

The last patch creates a module option to enable overlay, and includes
overlay to supported types of plane. When the overlay option is enabled,
one overlay plane is initialized (plus primary and cursor) and it is
included in the planes composition.

This work preserves the current results of IGT tests: kms_cursor_crc;
kms_flip and kms_writeback. In addition, subtests related to overlay in
kms_atomic and kms_plane_cursor start to pass (pointed out in the commit
message).

v2:

- Drop unnecessary changes that init crtc without cursor (Daniel)
- Replace function to initialize planes (Daniel)
- Add proper pixel blending op according to the plane format (Daniel)

v3:

- Proper use of the variable funcs (kernel bot)
- Adjust the patch series format

v4:
- use better names for functions of plane composition (Daniel)
- clear alpha channel (0xff) after blend color values by pixel
- improve comments on blend ops to reflect the current state
- describe in the commit message future improvements for plane composition

Melissa Wen (4):
  drm/vkms: init plane using drmm_universal_plane_alloc
  drm/vkms: rename cursor to plane on ops of planes composition
  drm/vkms: add XRGB planes composition
  drm/vkms: add overlay support

 drivers/gpu/drm/vkms/vkms_composer.c | 104 ++++++++++++++++++---------
 drivers/gpu/drm/vkms/vkms_drv.c      |   5 ++
 drivers/gpu/drm/vkms/vkms_drv.h      |   9 ++-
 drivers/gpu/drm/vkms/vkms_output.c   |  28 ++++----
 drivers/gpu/drm/vkms/vkms_plane.c    |  51 ++++++-------
 5 files changed, 125 insertions(+), 72 deletions(-)

-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E810A96EEDA
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 11:13:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD36210E9B4;
	Fri,  6 Sep 2024 09:13:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gce33grr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE04B10E9B4
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 09:13:36 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-718d962ad64so283159b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Sep 2024 02:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725614016; x=1726218816; darn=lists.freedesktop.org;
 h=message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=leB/EuZR76FE79r8CZx4icvbD1A2uzJHnNuq1c7iWUk=;
 b=gce33grrCkUEgufVk4GOIIVF0daxeia+EgmLLgLY6UWGTTfQ4VrWwKT8NBJCwEWgbB
 GojPyZ73Y/5kfHJrGX0RPYgoNrYHCzYMTiLCkDKhyCtRUcXodSIBVAX049BYHyHTxc/h
 tiKLySpm9YCDSv+d+QwDeJAKaXGE+MLwUHLqWICMgwgDWPejn6/UVe5yHxneuwoor7bH
 O8H5uDQXxT+5YUbC8UbgRTiF6LKAO8pA2ThBa/IbIhKCXjkCqd/OVRJJwIkEjYUD7Kp8
 n859WEyiJ53dJrtKDTibPtnwL5CMte++h/BEzj42zJGNlKrELyOfHbsicYnOGlQKIryf
 VhJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725614016; x=1726218816;
 h=message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=leB/EuZR76FE79r8CZx4icvbD1A2uzJHnNuq1c7iWUk=;
 b=cVmcoVSmTU+9lfLPSTQRV299Wr4jDjBD7WWSxRgZMJ8R5V78fpAfO+sObTubW99Uc3
 x2daKbCswhrVswssapMZX992D10Jt1RFpSvgZiazXHxf4doX8SCLTJV+7Wi4Huk7UKQ3
 RsIiuMHu89wMhtpTteUSvvsf9hbGZX9088liDyQT4myHVN84mp3xYCOHfeU9VQsJ3lYm
 AfPoolhOCYy3AbCy+m986vRpj6mi1BTmfUGjuK3dDsS5byGFUNdjEhKomN7a1E2KPKPi
 tUvbcUDuD87tfx8XG9H214RLirPU+XwWVG/SM9Y4Tl7LBuOdYWC3ng8ujidgt0xERj2K
 TNAQ==
X-Gm-Message-State: AOJu0YwgL1rnDRd9fH2CNhleKelT3+utRqEFzSBOrjLYPEyTPqS7BtOy
 SeMzGguMLiQZSExUJRC7+bBRTT/rI5bZSf35cFDFperucYDhhmdz
X-Google-Smtp-Source: AGHT+IE46PuAltnoIqw7EddONWrjHM9xv3Zdvz5L6wCzwu9Jw1e+3mLn1DpvovbhSwFWwhoREdC6vA==
X-Received: by 2002:a05:6a00:b42:b0:714:2069:d90e with SMTP id
 d2e1a72fcca58-718d5f0839amr1898716b3a.26.1725614015968; 
 Fri, 06 Sep 2024 02:13:35 -0700 (PDT)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-717938470e6sm1927034b3a.183.2024.09.06.02.13.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 02:13:35 -0700 (PDT)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-next
Date: Fri,  6 Sep 2024 18:13:31 +0900
Message-Id: <20240906091331.34244-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.17.1
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

Hi Dave and Daniel,

   Just three cleanups and one fixup.

Please kindly let me know if there is any problem.

Thanks,


The following changes since commit b1aa0491fad27f030c94ed42c873c3f46f5e7364:

  drm/xe: Fix merge fails related to display runtime PM (2024-09-02 14:14:07 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-v6.12

for you to fetch changes up to 94ebc3d3235c5c516f67315059ce657e5090e94b:

  drivers:drm:exynos_drm_gsc:Fix wrong assignment in gsc_bind() (2024-09-06 16:08:30 +0900)

----------------------------------------------------------------
Three cleanups
- Drop stale exynos file pattern from MAINTAINERS file
  The old "exynos" directory is removed from MAINTAINERS as Samsung Exynos
  display bindings have been relocated. This resolves a warning
  from get_maintainers.pl about no files matching the outdated directory.

- Constify struct exynos_drm_ipp_funcs
  By making struct exynos_drm_ipp_funcs constant, the patch enhances security
  by moving the structure to a read-only section of memory.
  This change results in a slight reduction in the data section size.

- Remove unnecessary code
  The function exynos_atomic_commit is removed as it became redundant
  after a previous update. This cleans up the code and eliminates
  unused function declarations.

One fixup
- Fix wrong assignment in gsc_bind()
  A double assignment in gsc_bind() was flagged by the cocci tool and
  corrected to fix an incorrect assignment, addressing a potential issue
  introduced in a prior commit.

----------------------------------------------------------------
Christophe JAILLET (1):
      drm/exynos: Constify struct exynos_drm_ipp_funcs

Krzysztof Kozlowski (1):
      dt-bindings: MAINTAINERS: drop stale exynos file pattern

Kwanghoon Son (1):
      drm/exynos: Remove unnecessary code

Simona Vetter (1):
      MAINATINERS: update drm maintainer contacts

Yuesong Li (1):
      drivers:drm:exynos_drm_gsc:Fix wrong assignment in gsc_bind()

 .mailmap                                   |  4 ++++
 Documentation/gpu/introduction.rst         | 10 ++++-----
 Documentation/gpu/todo.rst                 | 34 +++++++++++++++---------------
 MAINTAINERS                                |  7 +++---
 drivers/gpu/drm/exynos/exynos_drm_drv.h    |  4 ----
 drivers/gpu/drm/exynos/exynos_drm_fimc.c   |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_gsc.c    |  4 ++--
 drivers/gpu/drm/exynos/exynos_drm_scaler.c |  2 +-
 8 files changed, 33 insertions(+), 34 deletions(-)

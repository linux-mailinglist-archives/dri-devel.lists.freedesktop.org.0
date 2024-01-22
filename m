Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B481C835B92
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 08:25:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD4E710E605;
	Mon, 22 Jan 2024 07:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1939110E602
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 07:25:14 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 46e09a7af769-6ddef319fabso1912384a34.1
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jan 2024 23:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705908253; x=1706513053; darn=lists.freedesktop.org;
 h=message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a5fFm2KcnyXnguNHsY0zXxWKy+lJ/vtZz2kmhMHeAyY=;
 b=Nv0BiRdZhqNC1+IJ8O0Xj2ci990QPmOGfAA4jEidywYMJ363PU2GzVbhlvuUiM5aV6
 svbj5NNafohp/W/OVYqhgIEFIE0PO3AgBEAO6Uvrc2CSmZLwymavy5DbOV2AvJRZENPn
 DGiH/IJ8gnlj9nb2syreUz40t380QDyB5bWLsQO+R818qeasdVGjtLyuFY9xE7ah+e8u
 QkkukpyW+Es8iRtfv9KjdCk9PIBHVqGjghKshWX9kuhaZ3Iwt8rZ9Is5TkWEyMuzUDOu
 BOW416THVUcZECpag5xaM0AasmK0konHq+CI2619UnabNy6dm2viq7mLyz3Lp8McaOT9
 Q+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705908253; x=1706513053;
 h=message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=a5fFm2KcnyXnguNHsY0zXxWKy+lJ/vtZz2kmhMHeAyY=;
 b=X0DFZ+W0IFmRQ5G2MmUEQ+VS+S5TMPJbTdADv5jwZFEqrEOPSWccY/CZNNCq96cf/f
 MRVyTf53w+9ouiQT+xFmBDqIRAblDCQmwDtfZtaXxMj9qff/P/9tul13vaL0OXxyt+re
 xkDFSphwrGeVYO1NRJTKEBhYl0qbp3ZZnCFX6jXSMmpzyrbp77m3q/xeXYKwAVK5w89z
 VxxVGC57159x8EQZK5oRwZv+8hrPbOejaNCt7zOHWl7UsjU4A+aJfZTI/e3sjX0jm8mk
 rI6AcpSBGdPkG2HIQw2m5YLgEdVS6X+m70vaUt+63fLbn+qItsn+BeVMly2tpEnzLDDz
 XV1g==
X-Gm-Message-State: AOJu0YxumVJHO2UytuKVT6a3COza+OxBkQ7cSCtbw1NBhqTdUnG+oEK+
 d1JXQdPsXTXt/zFn9aIBttwoAEUw/0JMZW5eex9VnZEY7T/7qurvV2d2x4O38VU58w==
X-Google-Smtp-Source: AGHT+IG3x4BSRyAKjJPAIptEl+AIntHmyPaj/Rt/Cde3JatgIO7y1fR5x6yZLIA3FItOU3QeWYNp4A==
X-Received: by 2002:a9d:5a11:0:b0:6dc:4f4:f4e0 with SMTP id
 v17-20020a9d5a11000000b006dc04f4f4e0mr3711496oth.45.1705908253323; 
 Sun, 21 Jan 2024 23:24:13 -0800 (PST)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
 by smtp.gmail.com with ESMTPSA id
 y37-20020a634965000000b005ceeeea1816sm7913752pgk.77.2024.01.21.23.24.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jan 2024 23:24:12 -0800 (PST)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [GIT PULL] exynos-drm-fixes
Date: Mon, 22 Jan 2024 16:24:07 +0900
Message-Id: <20240122072407.39546-1-inki.dae@samsung.com>
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
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

   Just several fixups.

   Please kindly let me know if there is any problem.

Thanks,
Inki Dae


The following changes since commit 0dd3ee31125508cd67f7e7172247f05b7fd1753a:

  Linux 6.7 (2024-01-07 12:18:38 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-fixes-for-v6.8-rc2

for you to fetch changes up to 4050957c7c2c14aa795dbf423b4180d5ac04e113:

  drm/exynos: gsc: minor fix for loop iteration in gsc_runtime_resume (2024-01-22 12:24:55 +0900)

----------------------------------------------------------------
Several fixups
   - Minor fix in `drm/exynos: gsc: gsc_runtime_resume`
     . The patch ensures `clk_disable_unprepare()` is called on the first
       element of `ctx->clocks` array.
       This issue was identified by the Linux Verification Center.

   - Fix excessive stack usage in `fimd_win_set_pixfmt()` in `drm/exynos`
     . The issue, highlighted by gcc, involved an unnecessary on-stack copy of
       the large `exynos_drm_plane` structure, now replaced with a pointer.

   - Fix an incorrect type issue in `exynos_drm_fimd.c` module
     . Addresses an incorrect type issue in `fimd_commit()` within the
       `exynos_drm_fimd.c` The problem was reported by the kernel test robot[1].

     [1] https://lore.kernel.org/oe-kbuild-all/202312140930.Me9yWf8F-lkp@intel.com/

   - Fix a typo in the dt-bindings for `samsung,exynos-mixer`
     . Changes 'regs' to the correct property name 'reg' in the dt-bindings
       documentation for `samsung,exynos-mixer`

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/exynos: fix accidental on-stack copy of exynos_drm_plane

Fedor Pchelkin (1):
      drm/exynos: gsc: minor fix for loop iteration in gsc_runtime_resume

Inki Dae (1):
      drm/exynos: fix incorrect type issue

Rob Herring (1):
      dt-bindings: display: samsung,exynos-mixer: Fix 'regs' typo

 .../devicetree/bindings/display/samsung/samsung,exynos-mixer.yaml   | 6 +++---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c                       | 4 ++--
 drivers/gpu/drm/exynos/exynos_drm_fimd.c                            | 6 +++---
 drivers/gpu/drm/exynos/exynos_drm_gsc.c                             | 2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

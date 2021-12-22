Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FF247CBFC
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 04:53:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7545C10E3D5;
	Wed, 22 Dec 2021 03:53:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F0810E3AA
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 03:53:49 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id 205so1174864pfu.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 19:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9+ILluygVf09oo0/ytFG0XaIKzjqiECjOUqJvlR//O8=;
 b=niCGrvMli4Kq1cYMkwRNJ96Mt4j9E0O91ceJnWmHM2Y9V+kpZl3Pznlp9rosRKYHsp
 59vhTPh9bvH3TbPhaSbXbFzAPB8TZ/Ih9ZX+NDfbTwcJS4sZkEcBYDH3HajhvcDrfzFN
 ioAt5R6q/pOsS7np+F7fWGwsViHeOHbc+SHwz26ApzsBOjZhrWt6kwn52sRAvAhYvfVS
 TrarxLcJyrfEsAK0XYu2sjqh943QQVk/0gv5y+gzTxa2SIz1Al7drRkN4/TQIUYANIbg
 014haQM4DJG9KIrRPHGAigXkbVljj1S/ACj0eC/eY0xerkPYvw9+E1XM5fVyzLnzSu/m
 WmPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=9+ILluygVf09oo0/ytFG0XaIKzjqiECjOUqJvlR//O8=;
 b=r4my8akFb0tsTw3Wx/PMZLY3c9bpiGzN3X1lwykyZutrMFbLI4iIOeyDFhYLo+ja92
 YIPHo9JwwBNjKVTykoYwzsLfxzEGAgh/4r6psaD2WfHd3URDQjfwtjAxPtrlB7tuMv2H
 9ZeQW9tlgwlGv88I6FWYK1ToklOC25SD5wmGE/F9zwqB8p8JMrQM/1ZWSHXOTRB69RR0
 4DVt8qb8hbbDTQsOc7hwik/NbHkBO1dj8U92M066nDEytG4//JssJ7/zdxjITEklIdEW
 eRgXlopKYNpp+a/SfgoLOCNM7HtVzInfNbsRoA0c4RX8JsBTDV2guPXiF+Aywm6+aAL9
 ibiw==
X-Gm-Message-State: AOAM532C5AI+QxVxEE9hp+xugajHn2b9/C2j4YWmzCRadrPoi6xJiozj
 CeXMOCsaPclEFyMXme40kCk=
X-Google-Smtp-Source: ABdhPJwk2yejgoUrXXjC4TJ7R2fFVhDaeMWhvItOkiihrqRrLTpWGdZ0LnLCRXngku5C5OAIOgrHkQ==
X-Received: by 2002:a63:1f5b:: with SMTP id q27mr1255936pgm.608.1640145229393; 
 Tue, 21 Dec 2021 19:53:49 -0800 (PST)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
 by smtp.gmail.com with ESMTPSA id np17sm438165pjb.8.2021.12.21.19.53.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 19:53:48 -0800 (PST)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel.vetter@ffwll.ch
Subject: [GIT PULL] exynos-drm-next
Date: Wed, 22 Dec 2021 12:53:45 +0900
Message-Id: <20211222035345.26595-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

   Just four cleanups such as replacing the use of legacy interface, implementing generic gem mmap,
   fixing a build warning and dropping unnecessary code.

Please let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit 1c405ca11bf563de1725e5ecfb4a74ee289d2ee9:

  Merge tag 'mediatek-drm-next-5.17' of https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux into drm-next (2021-12-17 16:16:16 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-v5.17

for you to fetch changes up to 760cceff996135fd4830f3d339446a04bd37ca0c:

  drm/exynos: drop the use of label from exynos_dsi_register_te_irq (2021-12-22 11:39:39 +0900)

----------------------------------------------------------------
Four cleanups
- Replacing lagacy gpio interface of dsi driver with gpiod one.
- Implementing a generic GEM object mmap and use it instead of
  exynos specific one.
- Dropping the use of label from dsi driver. Which also fixes
  a build warning.
- Just trivial cleanup by dropping unnecessay code.

----------------------------------------------------------------
Bernard Zhao (1):
      drm/exynos: remove useless type conversion

Inki Dae (1):
      drm/exynos: drop the use of label from exynos_dsi_register_te_irq

Maíra Canal (1):
      drm/exynos: Replace legacy gpio interface for gpiod interface

Thomas Zimmermann (1):
      drm/exynos: Implement mmap as GEM object function

 drivers/gpu/drm/exynos/exynos_drm_drv.c   | 13 ++------
 drivers/gpu/drm/exynos/exynos_drm_dsi.c   | 49 +++++++++++--------------------
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 20 ++-----------
 drivers/gpu/drm/exynos/exynos_drm_fimc.c  |  4 +--
 drivers/gpu/drm/exynos/exynos_drm_gem.c   | 43 ++++++---------------------
 drivers/gpu/drm/exynos/exynos_drm_gem.h   |  5 ----
 6 files changed, 32 insertions(+), 102 deletions(-)

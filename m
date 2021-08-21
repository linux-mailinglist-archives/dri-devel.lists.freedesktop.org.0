Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C64E3F3BBC
	for <lists+dri-devel@lfdr.de>; Sat, 21 Aug 2021 19:28:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1292C6E03E;
	Sat, 21 Aug 2021 17:28:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 480366E03E
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Aug 2021 17:28:30 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id a21so11529387pfh.5
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Aug 2021 10:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=C5bdnNLXW/3a03Da92T1tNYI9jbJ+iBX8hk1AZBK69k=;
 b=lPCT56fvdHhbMeaNM/ljtItbgIsd+ynybDNkESbxyq1PY0QqgViI70CKj1boq8zjY5
 uIqHxKPuCDg0V+tfidN7qCTm0PwSTU//6eP1ObGfJyn02TkffSs7P/LGGUZoin+41A+8
 6gatgzAL8py1LAIWZOF3aMpAXiYVxXy8aIHom4DXozXcNc1uTIYGmxBrIZXq6CuaBOiQ
 nV4SD/JCOaktp/kMvjsGuJeigTa81aPYBdeSB87mdP+sTyZebhfDFwlqEjvosG4rNdA8
 aH4RV8FvcG/Pk6IpGOgUIYWvBrGnAzTABwliQ3mgckt4/W8cpf/gtNYqBCpVGaDcClY2
 EMXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=C5bdnNLXW/3a03Da92T1tNYI9jbJ+iBX8hk1AZBK69k=;
 b=M9NFEkr2+L7rC1oZlNSto99/FyL36kAx9KQDtiNeRTlp/MEzI3Osouwz24idGkay0b
 kaqcbxrzA1gklOSGii3q7QptzUoJq5/SH9JcPsNyi9bSBEjOURec+QxbYDdJTD05y1e5
 lF3Hwkpj+wKsnvxn5gD0QsGhy0v9Xpqqe+aQjrfc5hMYGeVvHr7tWxPH1dijil33qLJg
 ZttueNYCUv7Z/ZF/P4TjRo8vw4Yxv1IxNaZlwcnBoHGuT0RvmAycufN120fvK4L+1kEA
 lXTnf1qMguO7+oBKTaiiRtc+OL62kXXl9l+HV9p5OAdX1PVwPwoaqPZ8JTzr/bsK8U/a
 3m9A==
X-Gm-Message-State: AOAM531rbzzoyxAxT6UeqpjDQQhDkr7XgiJBN4GWB6by372YBbNlO99b
 /kMTQo+yhVOsB47mEFcKZUU=
X-Google-Smtp-Source: ABdhPJyM3QDjqE31vQvc4MhN+5picZL2CRZaxyUGcHqIF7f1Qcc1p5NVmD9nuZ3AOLmw0mzgfhIjhQ==
X-Received: by 2002:a05:6a00:1989:b0:3e2:a387:e1d9 with SMTP id
 d9-20020a056a00198900b003e2a387e1d9mr23648446pfl.64.1629566909900; 
 Sat, 21 Aug 2021 10:28:29 -0700 (PDT)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
 by smtp.gmail.com with ESMTPSA id n22sm10938169pff.57.2021.08.21.10.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 10:28:28 -0700 (PDT)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie
Cc: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-next
Date: Sun, 22 Aug 2021 02:28:25 +0900
Message-Id: <20210821172825.54720-1-inki.dae@samsung.com>
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

Hi Dave,

   Just two fixups - fixing one build warning and missing unlock,
   and one cleanup - replaceing atomic_t with refcount_t.

   Please kindly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit 397ab98e2d69cede84444a28eab77a171983d14e:

  Merge tag 'drm-msm-next-2021-08-12' of https://gitlab.freedesktop.org/drm/msm into drm-next (2021-08-17 10:53:52 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-v5.15

for you to fetch changes up to c626f3864bbbb28bbe06476b0b497c1330aa4463:

  drm/exynos: Always initialize mapping in exynos_drm_register_dma() (2021-08-22 01:56:39 +0900)

----------------------------------------------------------------
Two fixups
- Fix missing unlock issue in exynos_drm_g2d.c
- Fix a build warning in exynos_drm_dma.c

One cleanup
- Replace atomic_t with refcount_t in exynos_drm_g2d.c

----------------------------------------------------------------
Nathan Chancellor (1):
      drm/exynos: Always initialize mapping in exynos_drm_register_dma()

Wei Yongjun (1):
      drm/exynos: g2d: fix missing unlock on error in g2d_runqueue_worker()

Xiyu Yang (1):
      drm/exynos: Convert from atomic_t to refcount_t on g2d_cmdlist_userptr->refcount

 drivers/gpu/drm/exynos/exynos_drm_dma.c |  2 ++
 drivers/gpu/drm/exynos/exynos_drm_g2d.c | 14 ++++++++------
 2 files changed, 10 insertions(+), 6 deletions(-)

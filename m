Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06777702761
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 10:39:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD2010E16E;
	Mon, 15 May 2023 08:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E88E10E16E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 08:39:49 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1aaea3909d1so116516325ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 01:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684139988; x=1686731988;
 h=message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0Amoq70hJo95bJKTUhw34c70+hMrAHPIR1QAD0MEHOU=;
 b=hxPK0WxB9Vd205mAXPeYmUI/v5OdIhm6ike/rZ/FOd5XHroZvrUz7SUk8H4oIOuU0n
 ITpLBotnnJI5qcIQir1QD6rONPLnGvqGjZf1Dk9luB108f4MWAVJTUFNNiZJHwRjBtjm
 69fok9g2sPW2WfxIyLHMeKWeWvxLblDj+5EsynX1RMQGVpoWbR6FmIA8OcVPNT5J6t0H
 T1cxYZqvCFIuoisA6odhiOvx2N2x9l7hckeHOt+1gKHc+e0H9J1URXwP8V+GFMlokBpo
 nSAYpl1iCbxonWINcrkEMeWrXfMU77+mkGXe+uoGbT62dJd1pCpsaByqZvNhBVJxo2RY
 Jbjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684139988; x=1686731988;
 h=message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0Amoq70hJo95bJKTUhw34c70+hMrAHPIR1QAD0MEHOU=;
 b=dzwShNZ/ufzQVRAlosHQRrvh5DoABhybyfJh/Sorv1soqCbFSSY6O8mLPWFiwOaHR6
 4t/G0eK9YgGF1rgPQKoxgCG8+jvJ0FQLkBgsMz93GEYxCNLwp6h3LxhJDy1K5l6eKFJT
 u1eEp8ecQ/e9WhM8Td3oSijXxwKYxMoca1e86wsxW8w0mOH469bHtSYTetw44yV7wkwm
 SR0xccQe2I4uJdgQRJ0MqidtBE2Njldh978vOSTFyT0M0hQjh0ZQjGVHP6/9mWfP93+7
 6xwdZVB7vi1Ya2fpNb8/RQMfBTJC5gNCdg3hIVar7UV68L23U388rDzwzGVjlYAd4A3J
 sGYg==
X-Gm-Message-State: AC+VfDy0lyi6GTKFh/d2DjTDpSyQw/bO3Qr1R+L1ubf4w2OGtOTEg0CP
 VptXHFSyaXq4zNJaMuq7Jg4=
X-Google-Smtp-Source: ACHHUZ6ILvv6weLQnLUsBdUVXWZNoEu/AENG0wlalTDEiXqqNISRfL8AcnnhPToRo1R3hvqbV8//8w==
X-Received: by 2002:a17:902:efc5:b0:19c:f096:bbef with SMTP id
 ja5-20020a170902efc500b0019cf096bbefmr30750375plb.49.1684139988247; 
 Mon, 15 May 2023 01:39:48 -0700 (PDT)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
 by smtp.gmail.com with ESMTPSA id
 r21-20020a170902be1500b001a80ad9c599sm1325267pls.294.2023.05.15.01.39.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 01:39:47 -0700 (PDT)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [GIT PULL] exynos-drm-fixes
Date: Mon, 15 May 2023 17:39:43 +0900
Message-Id: <20230515083943.43933-1-inki.dae@samsung.com>
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

   Just one fixup to graphics 2d module for exynos.

   Please kindly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit d8843eebbbd15b78c6a7745717b3705eca923b0f:

  Merge tag 'amd-drm-fixes-6.4-2023-05-11' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2023-05-12 06:46:34 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-fixes-for-v6.4-rc3

for you to fetch changes up to 2ef0785b30bd6549ddbc124979f1b6596e065ae2:

  drm/exynos: fix g2d_open/close helper function definitions (2023-05-15 14:10:34 +0900)

----------------------------------------------------------------
Just one fixup to exynos_drm_g2d module.
- Fix below build warning by marking them as 'static inline'
    drivers/gpu/drm/exynos/exynos_drm_g2d.h:37:5: error: no previous prototype for 'g2d_open'
    drivers/gpu/drm/exynos/exynos_drm_g2d.h:42:5: error: no previous prototype for 'g2d_close'

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/exynos: fix g2d_open/close helper function definitions

 drivers/gpu/drm/exynos/exynos_drm_g2d.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

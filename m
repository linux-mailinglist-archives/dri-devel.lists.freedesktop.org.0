Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E0C353C08
	for <lists+dri-devel@lfdr.de>; Mon,  5 Apr 2021 08:12:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDCAC6E122;
	Mon,  5 Apr 2021 06:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C94F6E122
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Apr 2021 06:11:57 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id h25so7518503pgm.3
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Apr 2021 23:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=NlN6KbhYqIPvr2/7x4/KY0Pw6vbwxZNfvJPFeHzAzZk=;
 b=LRMiUHwAA79sCFDI4KhMhVXxTJ+JsUd4r1tdGwcTZmrYoa/ZZjhdTZMKKszcwU5pYi
 jG/DDKzc2+ZWeT5odmKIlrJPGTsVvkTyczbjqFPz5tFYqRsUhxySiBvaCRwm2LuL6Gg1
 p+i4xZsMFjxOP5UmN0GoPdwocaQbMQDUJsHhpmcspEPmZaHdGB5C7y3ce8dExJYLyuMl
 4C9rYnQmuMaFW+eMXukIBsqusUVk0XddKm15aBcbTkHNmuWNozjioeqTyH3v1VaseE9i
 JeVSn1NK9KjeRL2AJfaq69rhvW6qoqCH8E6jE7aND7B4HAOaknKdfKKewtMIqgmrh7ai
 P5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=NlN6KbhYqIPvr2/7x4/KY0Pw6vbwxZNfvJPFeHzAzZk=;
 b=kQrLDzDgN9CPkRPtew3pJsCJHtatm5xeBQhnKj3Ldhs+HLWiZ9ZMAVFjCsyZCA6LLO
 0PF8zsU0uHbGEuwMvLEZt2KnIh6UGLanZTGwV9J4kQuDLr2Dg89bMOoDsrL5eg996Qqe
 kkFd1qomXom7Wasy59vZ0CU10oFMzsdBJEziIJuanaUzgluHHh0pJbKSioQ2CWZ8POPY
 CqXs6ycj2ARhZaE4lH6UQLhPL2tRRx++o3AnyD0QI+QINorYG0xNZo/zv2crnI7jDkLi
 10kJstDd/K+uZkg/W4k9VAa4Ns/eSqmb71wHryMcTnoNukupA7GkDYpKo4XizYjavWgS
 vyAQ==
X-Gm-Message-State: AOAM532wXGHmINiXaUv90OmOss/bOPnC0U7Cq8KMC4QBuCGgcHAPpasW
 WyX0lpTh0RePGXfvbtwzW60=
X-Google-Smtp-Source: ABdhPJw+sJpRcyjs0gH3rVbmZq3N5Ue26fGHgAK+0KQBiO3N4I+Fmq0u4ocTY7jt7xelebmWlOElYA==
X-Received: by 2002:a65:4083:: with SMTP id t3mr21660869pgp.150.1617603117041; 
 Sun, 04 Apr 2021 23:11:57 -0700 (PDT)
Received: from adolin ([49.207.194.193])
 by smtp.gmail.com with ESMTPSA id c128sm14425727pfc.76.2021.04.04.23.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Apr 2021 23:11:56 -0700 (PDT)
Date: Mon, 5 Apr 2021 11:41:50 +0530
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
To: melissa.srw@gmail.com
Subject: [PATCH V4 0/2] Add virtual hardware module
Message-ID: <cover.1617602076.git.sylphrenadin@gmail.com>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
blanking. This patchset must be tested after incorporating the
igt-tests patch: https://lists.freedesktop.org/archives/igt-dev/2021-February/029355.html

Sumera Priyadarsini (2):
  drm/vkms: Refactor vkms_composer_worker() to prep for virtual_hw mode
  drm/vkms: Add support for virtual hardware mode

 drivers/gpu/drm/vkms/vkms_composer.c | 88 +++++++++++++++++-----------
 drivers/gpu/drm/vkms/vkms_crtc.c     | 51 +++++++++++-----
 drivers/gpu/drm/vkms/vkms_drv.c      | 18 ++++--
 drivers/gpu/drm/vkms/vkms_drv.h      |  4 ++
 4 files changed, 109 insertions(+), 52 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

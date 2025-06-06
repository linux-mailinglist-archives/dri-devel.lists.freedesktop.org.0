Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1B1AD0526
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 17:28:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BAC110EADE;
	Fri,  6 Jun 2025 15:28:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="flVvogXo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40FB710E38E
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 15:27:53 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-43ea40a6e98so28923565e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jun 2025 08:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1749223672; x=1749828472; darn=lists.freedesktop.org; 
 h=content-disposition:mime-version:mail-followup-to:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HV+zyLjQ0HNvp2YJ2dyJWt9/49NJYivF2xYtOj/CuJk=;
 b=flVvogXovgM9PcVWZBRMBgnjTUGIVAO+pbjghRKqIqoYWQ04Yjrpp0sEbqV0IS85yQ
 3Ynu+GX64zQp20F2MeKLAx2LeYIrh69fLqoUSL7sWozmlJPrOFhQG5rPuJG3IJeUwRCQ
 nYgOTSFM1xyVVgN9kXVdo7tlkuMj8UIoVwf0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749223672; x=1749828472;
 h=content-disposition:mime-version:mail-followup-to:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HV+zyLjQ0HNvp2YJ2dyJWt9/49NJYivF2xYtOj/CuJk=;
 b=wFp974p/A+A4b8cgelrpkcKyOp+6MPBNQttkFSOPJIiAImMZ/Jl5/h+Ogb+1NPEFmX
 0X6FZ9hW6g3RaTdp+oqfUer9az8MNi0xEifuAVhpn1pAp0SPhwboBbuS8ywNpM+zaVe7
 lJjl+Ii126FONyvkKNOd9+qBFdhPkMetgvmoh25W9KJiiWkztcFSlFOjX484OwDXg2kL
 xgbNqs7lS/HIn6ERgdplgLcF8rrs4mnVU6FiSUpo5dMc0QOaUjuc9hce3/5+8FLdug0u
 jx5//Emiqa69H7zsSm26gDhFhFsQMNhuwt3WSEk4IjlSRsqO+iYSdws3fvFMkE1vKaqN
 cOpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8eGxxzPLvIyzMM8FQoxxukdDmZHP2rU+XobnvopFYmOVK5Qt6/Xs51k1w20imGd7scU24RzQN6z8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+SJUsInNYlRm5JRQyzKoTVmXND+ACaHH2Jz5WxemZu9mZr/NV
 mCGEC0AQEqVixXMDJwpErk4Pn+o4VLDQ80J6iXK9xUMUNNFtUheZBPX3yaJo/sG1Hao=
X-Gm-Gg: ASbGncvlEhFPKiJbGi/vMfeEH1p/07wsOEeoazewUwM7BVmkcNGUUVm1fQGC+Ov5Ctx
 L/xOgmgD5t63IEaaaumEUc0NaU51kYgptHHTwY0ZFF+pW3OHN4fLR9JNYMRogzCwGKsR5HpJUnH
 ooTrBfyyAmP7CGVc6vRQtOECj95v/hJNS07djjRslbteuXeOYQ9wcgJIPHCDnPocdvu41IaTM5h
 8uESHZqFbVxKJjaonU4Ha1btJv9iY8ShG5kjNmH08P0O5864oBRv49vWTi+o3IZ3P+FlhY2UhkK
 z39rZNY86R6gRQd3JQso5RWYOkYiIeKdz9Ux1JCdBcX3K72YAONS94daW7+0bDfZKcawJjfARA=
 =
X-Google-Smtp-Source: AGHT+IEcaPeLT7DBJWnAMobQr9n3IUdJGVV6M4ddpXjS8Lw4C+oT20Nu8NffeHJtFVcrfNR8SyTNMw==
X-Received: by 2002:adf:ce8e:0:b0:3a4:f513:7f03 with SMTP id
 ffacd0b85a97d-3a531cafabdmr2549452f8f.44.1749223671948; 
 Fri, 06 Jun 2025 08:27:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a532463905sm2202708f8f.92.2025.06.06.08.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 08:27:51 -0700 (PDT)
Date: Fri, 6 Jun 2025 17:27:48 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Dave Airlie <airlied@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [PULL] drm-fixes, yet another one
Message-ID: <aEMI9P_NF-K-_sLv@phenom.ffwll.local>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Airlie <airlied@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Operating-System: Linux phenom 6.12.25-amd64 
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

Hi Linus,

Another small batch of drm fixes, this time with a different baseline and
hence separate. Also due to this context conflict in ivpu with what you
have already, linux-next resolution matches what I have:

https://lore.kernel.org/dri-devel/20250606094711.4b9909af@canb.auug.org.au/

Cheers, Sima

drm-fixes-2025-06-06:
drm-fixes for v6.16-rc1

Drivers:
- ivpu: dma_resv locking, warnings, reset failure handling, improve
  logging, update fw file names, fix cmdqueue unregister
- panel-simple: add Evervision VGG644804

Core Changes:
- sysfb: screen_info type check
- video: screen_info for relocated pci fb
- drm/sched: signal fence of killed job
- dummycon: deferred takeover fix

Cheers, Sima

The following changes since commit 0ff41df1cb268fc69e703a08a57ee14ae967d0ca:

  Linux 6.15 (2025-05-25 16:09:23 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-06-06

for you to fetch changes up to 6f7e234f74caf5f8863bbca51b1b135d0736b0b3:

  Merge tag 'drm-misc-fixes-2025-06-06' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes (2025-06-06 14:38:51 +0200)

----------------------------------------------------------------
drm-fixes for v6.16-rc1

Drivers:
- ivpu: dma_resv locking, warnings, reset failure handling, improve
  logging, update fw file names, fix cmdqueue unregister
- panel-simple: add Evervision VGG644804

Core Changes:
- sysfb: screen_info type check
- video: screen_info for relocated pci fb
- drm/sched: signal fence of killed job
- dummycon: deferred takeover fix

----------------------------------------------------------------
Jacek Lawrynowicz (4):
      accel/ivpu: Improve buffer object logging
      accel/ivpu: Use firmware names from upstream repo
      accel/ivpu: Use dma_resv_lock() instead of a custom mutex
      accel/ivpu: Fix warning in ivpu_gem_bo_free()

Karol Wachowski (2):
      accel/ivpu: Reorder Doorbell Unregister and Command Queue Destruction
      accel/ivpu: Trigger device recovery on engine reset/resume failure

Lin.Cao (1):
      drm/scheduler: signal scheduled fence when kill job

Michael Walle (1):
      drm/panel-simple: fix the warnings for the Evervision VGG644804

Simona Vetter (2):
      Merge tag 'drm-misc-fixes-2025-05-28' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-misc-fixes-2025-06-06' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes

Thomas Zimmermann (3):
      dummycon: Trigger redraw when switching consoles with deferred takeover
      video: screen_info: Relocate framebuffers behind PCI bridges
      sysfb: Fix screen_info type check for VGA

 drivers/accel/ivpu/ivpu_fw.c             | 12 ++---
 drivers/accel/ivpu/ivpu_gem.c            | 91 +++++++++++++++++++-------------
 drivers/accel/ivpu/ivpu_gem.h            |  2 +-
 drivers/accel/ivpu/ivpu_job.c            | 14 ++---
 drivers/accel/ivpu/ivpu_jsm_msg.c        |  9 +++-
 drivers/firmware/sysfb.c                 | 26 ++++++---
 drivers/gpu/drm/panel/panel-simple.c     |  5 +-
 drivers/gpu/drm/scheduler/sched_entity.c |  1 +
 drivers/video/console/dummycon.c         | 18 +++++--
 drivers/video/screen_info_pci.c          | 75 ++++++++++++++++----------
 10 files changed, 158 insertions(+), 95 deletions(-)

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

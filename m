Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76008321335
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 10:37:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F8FF6E929;
	Mon, 22 Feb 2021 09:37:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C21B06E929
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 09:37:37 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id n4so18333906wrx.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 01:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:mime-version
 :content-disposition;
 bh=wMCik8OMhKRvlGn7Bn8d2Q4kMtrUNEeYNGZWFYz3tEM=;
 b=HSPHghvo9TAtYjbkPJrhU0lNbF3S3PxaEgT4aSX5mASOSNmB/ez6PG9Na4va9rVe+C
 Mzv0z0Kv8UgGn+wg+3B7x/ZNUYRInSpU62g8vANa+cmtIdj5pJIoYEFcPwULZiw707d7
 y0t6vUXET1NvZeTbS32ipJaZU/UAjLIvK+20U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:mime-version:content-disposition;
 bh=wMCik8OMhKRvlGn7Bn8d2Q4kMtrUNEeYNGZWFYz3tEM=;
 b=qPANWBUstpjEYnC05q5QpQ9UYMqpZM3vLKU5xx01jzN3W5WejoV+prW7XRj5OS5jiA
 S7hp9EdD2GkWBEwmvVn4fZwizaBFyPjXFmiJC90tIT+NuqeYRWZC3EAEB4Y3iablnRdJ
 LyfKwMs7WcqGaD/ah6FwupLSBqcB/kg+s4N3NOyLm/oEfJqec+hmM+/bIJq/J97X4YFs
 V4yearqvYgSsrPFh1zrD9c2KpUA77/fegC3J0Iq36IOlcJrVWC+iQKnwTNRclwW30iY5
 g3or30X9mpQsjh/fDjX2qMMNamNhLRYT5hXlmY4IW/qoK9ktg063A4Muf15PYNgHsCjl
 yddg==
X-Gm-Message-State: AOAM532gWabKvAZN9sEM1R/Yev8ASscWsNg4EmpfQ2EiQEvoqTDiysw5
 zCihsMFIW+dlOQK8zevdr+1ovA==
X-Google-Smtp-Source: ABdhPJxf4EpB2oHzM6hdAxC1zUf2GYli1mGy4hf8Jirrzeu9oFK9WYMdIUkvVW3QSaWT/7gGPl0dQA==
X-Received: by 2002:a5d:6808:: with SMTP id w8mr18158234wru.290.1613986656449; 
 Mon, 22 Feb 2021 01:37:36 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u8sm25466wmb.36.2021.02.22.01.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 01:37:36 -0800 (PST)
Date: Mon, 22 Feb 2021 10:37:27 +0100
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PULL] topic/kcmp-kconfig
Message-ID: <YDNrq+mpwta0f0vt@phenom.ffwll.local>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
 dri-devel@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>,
 Dave Airlie <airlied@gmail.com>, Kees Cook <keescook@chromium.org>,
 Andy Lutomirski <luto@amacapital.net>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Andy Lutomirski <luto@amacapital.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

One patch pull request for you to ponder in the hopefully less stressful
2nd week of the merge window :-)

It's also marked cc: stable so people can stop building kernels that don't
work so well.

topic/kcmp-kconfig-2021-02-22:
kconfig for kcmp syscall

drm userspaces uses this, systemd uses this, makes sense to pull it
out from the checkpoint-restore bundle. Kees reviewed this from
security pov and is happy with the final version.

LWN coverage: https://lwn.net/Articles/845448/

Cheers, Daniel

The following changes since commit f40ddce88593482919761f74910f42f4b84c004b:

  Linux 5.11 (2021-02-14 14:32:24 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/topic/kcmp-kconfig-2021-02-22

for you to fetch changes up to bfe3911a91047557eb0e620f95a370aee6a248c7:

  kcmp: Support selection of SYS_kcmp without CHECKPOINT_RESTORE (2021-02-16 09:59:41 +0100)

----------------------------------------------------------------
kconfig for kcmp syscall

drm userspaces uses this, systemd uses this, makes sense to pull it
out from the checkpoint-restore bundle. Kees reviewed this from
security pov and is happy with the final version.

LWN coverage: https://lwn.net/Articles/845448/

----------------------------------------------------------------
Chris Wilson (1):
      kcmp: Support selection of SYS_kcmp without CHECKPOINT_RESTORE

 drivers/gpu/drm/Kconfig                       |  3 +++
 fs/eventpoll.c                                |  4 ++--
 include/linux/eventpoll.h                     |  2 +-
 init/Kconfig                                  | 11 +++++++++++
 kernel/Makefile                               |  2 +-
 tools/testing/selftests/seccomp/seccomp_bpf.c |  2 +-
 6 files changed, 19 insertions(+), 5 deletions(-)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

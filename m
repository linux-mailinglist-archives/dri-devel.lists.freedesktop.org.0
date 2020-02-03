Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 452DD150563
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 12:38:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2B216E1ED;
	Mon,  3 Feb 2020 11:38:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc2a.google.com (mail-yw1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 540806E1ED
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2020 11:38:42 +0000 (UTC)
Received: by mail-yw1-xc2a.google.com with SMTP id b81so13297880ywe.9
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2020 03:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=h3RjsNXcw8FF9PvxWckcrCMKtJFlRi5cR2o5gHOFy9I=;
 b=F2z5lna0SJXbZLxD0SpeYkSMydJdg5ntjK3e/SKk0DCgn4Ft4lOZqtV2ZrzOKg4eKK
 Hk620kYnctZI1xSerpiS3fA6/gId6/i75/DJkr+MiZmucJadV1/SCDyBzMNo6yB8kCQE
 DoTFSXIDy3MjFoZRjjH+juzARmsoz2y7Dr7Hr/TlGeMgT4VpmBxBf6yFwGIR/z2Hgd3E
 O+BPplB8wheY4iYibcP9Ar9E9Fbrp2FW5MtcTeknUkoEhmPwaxXLqMHmdCB3CQ9448o+
 BLjlGKV/h1OqHYAAvVNnnHLBH5RuONo0LaKmfdXyQpI85d/oN7uuskQSlVKJ3Hx9LZvw
 LTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=h3RjsNXcw8FF9PvxWckcrCMKtJFlRi5cR2o5gHOFy9I=;
 b=dtfDrMQ31DZieyIEwRLHeZgsvqOWFLLBao6NqEGGCxnhJNIgBq4uSdwCT7hVw5SqP6
 0JbAPOZFHpaRyGnHzRwtICGGjHOuMH6K4FBSZkg2TbvhuT+QurDL1/uDRq8L1tHuBVPY
 RF+2hUlaaFUSfEUdU7oLUWQUKkATSiTG9W+XY2khsPNuXQizMRZV4r/QQFf8EBgJ+mEU
 rtVdEU8OnDGpkrVeQ8dZg3FYfVn53zlWA5YCxYR5VVSWizlbsD4gKUwIYKVbwHqIdIvY
 S2u/tmcCMoMx4HYcYutAkWbAiWgTg+Ji+bFGOvfLugfDVC1Sdk/yh893uA8PSpLPgXKd
 T91Q==
X-Gm-Message-State: APjAAAVEpQ88erKuWd2dFEtMSYzF3pZmI9kKJGXZfU8lKaJCPei/gTy8
 GpEp70LOR40w1U21sZhJgjI/YOwh/0K57dAL1fVF17FKWcZpsA==
X-Google-Smtp-Source: APXvYqyWmzD/7VS3ZsRxodK2ye0D62emRyRxx4hBtY2PLgKV8uj0v6pQyUB8KWtTTDI+DWy+YXqUzi6Oc4WkXRhfjWs=
X-Received: by 2002:a25:dc46:: with SMTP id y67mr20223789ybe.83.1580729921243; 
 Mon, 03 Feb 2020 03:38:41 -0800 (PST)
MIME-Version: 1.0
From: Ben Skeggs <skeggsb@gmail.com>
Date: Mon, 3 Feb 2020 21:38:30 +1000
Message-ID: <CACAvsv7=eP+Ai1ouoMyYyo1xMF0pTQki=owYjJkS=NpvKQd1fg@mail.gmail.com>
Subject: nouveau-fixes 5.6
To: ML dri-devel <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey,

Just a couple of fixes to Volta/Turing modesetting on some systems.

Thanks,
Ben.

The following changes since commit c3463aed05abf06bd5ebaac12f2c015db298b98f:

  drm/nouveau/fb/gp102-: allow module to load even when scrubber
binary is missing (2020-01-29 15:49:56 +1000)

are available in the Git repository at:

  git://github.com/skeggsb/linux linux-5.6

for you to fetch changes up to 137c4ba7163ad9d5696b9fde78b1c0898a9c115b:

  drm/nouveau/kms/gv100-: avoid sending a core update until the first
modeset (2020-02-03 21:36:54 +1000)

----------------------------------------------------------------
Ben Skeggs (3):
      drm/nouveau/disp/gv100-: halt
NV_PDISP_FE_RM_INTR_STAT_CTRL_DISP_ERROR storms
      drm/nouveau/kms/gv100-: move window ownership setup into modesetting path
      drm/nouveau/kms/gv100-: avoid sending a core update until the
first modeset

 drivers/gpu/drm/nouveau/dispnv50/core.h          |  6 ++++++
 drivers/gpu/drm/nouveau/dispnv50/corec37d.c      | 23 ++++++++++++++++++-----
 drivers/gpu/drm/nouveau/dispnv50/corec57d.c      |  9 ++++-----
 drivers/gpu/drm/nouveau/dispnv50/disp.c          | 16 ++++++++++++++++
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c |  6 ++++++
 5 files changed, 50 insertions(+), 10 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

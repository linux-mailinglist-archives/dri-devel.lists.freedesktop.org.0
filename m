Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE01C1186AE
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 12:42:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C34D66E05D;
	Tue, 10 Dec 2019 11:41:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com
 [IPv6:2607:f8b0:4864:20::e2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 202BE6E05D
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 11:41:58 +0000 (UTC)
Received: by mail-vs1-xe2a.google.com with SMTP id g15so12779589vsf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 03:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=vSN7XZ9NgIX0BNKJuxLg950ydfBXwzbMfAHWuhG0UQs=;
 b=XhrpH3FvEsgAThrou1B3Tk3EwJeVTDt7EVLb8z8xqnlCmGobFoPZuIY4Aaa7zfXY8P
 UjGC1FKetDQKnIMxyKI0G4IVyjgV8LkcADez1FO9QY7BSmxYHXhEbN+I5m4WCOZa6mUV
 MiBBCMMutGpC5lGyRAk05Ms8jVKtF+ZtXcaFQOkamITEvmk1pKZYskfEAByoE+5Bp0CO
 ThcHsWGuKksZJhI9T34MU/4xvPlNIzn5vSgFlYL+RIXLa7ZCWU1SQxfY3tIu0q97fxR9
 x8gCEE6f1pQDdJ+xzbsZfnMjeqzeBZv+KjiXukPGWN0zcVzjTyRvNMHDE2GpRct5g6oF
 caoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=vSN7XZ9NgIX0BNKJuxLg950ydfBXwzbMfAHWuhG0UQs=;
 b=RW2FgNOvccPd3SYbaXZ8L5ZL/LfGy7FKdUxm7bdC5FJTvRT8q29ZNqK09Yv8lHVDvT
 i/POIFuevjswX8WGXZXN2YxOkhOKZquZbnIpAZwt8IEJlWjLKnFyfTBBgilTBr5lCFLM
 FjoNxvLDBGHiNEqyf0BClYcU0y05LOfAFudq9bGhAGxwUsb1hVc41fJLRMJnxQeKxkew
 O+BI04sdvWuW1ByifM+OnjzJoQeeBfJZSuBPDf/Spycs40+p9J+Zx9H09ea9nYF7vn2r
 ZdmnjEoiPNUv+rTzkK3YoXejDHkybjmTBC8SZXkP9p1sRnszmCfRrA+YmlzV+4y3sA8T
 mbLA==
X-Gm-Message-State: APjAAAUrRQmhdiJjtCeXkqaNfI6oVALV5W/Okr3SjCGS0S5C/FZBuul9
 1ZcmhBJu33vy/MpR/PyFby09ZeIVJPwwLdyA3XGoyLm9ekk=
X-Google-Smtp-Source: APXvYqzm7CRKrSO0nLPMDjRXrd9D96UYccvsQTZqNob2CRzG4L/ivuCWKMHfjCVHobZmI9IJaDARMIkj+JqQUEaa72Y=
X-Received: by 2002:a67:e94c:: with SMTP id p12mr24812149vso.84.1575978117112; 
 Tue, 10 Dec 2019 03:41:57 -0800 (PST)
MIME-Version: 1.0
From: Ben Skeggs <skeggsb@gmail.com>
Date: Tue, 10 Dec 2019 21:41:46 +1000
Message-ID: <CACAvsv56Am90okV334eXgxDuK228sb9UJxMiOYjNAMShvvv4cg@mail.gmail.com>
Subject: nouveau-fixes 5.5
To: Dave Airlie <airlied@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
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

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://github.com/skeggsb/linux.git linux-5.5

for you to fetch changes up to 3d1890ef8023e61934e070021b06cc9f417260c0:

  drm/nouveau/kms/nv50-: fix panel scaling (2019-12-10 21:34:52 +1000)

----------------------------------------------------------------
Ben Skeggs (1):
      drm/nouveau/kms/nv50-: fix panel scaling

Hans de Goede (2):
      drm/nouveau: Move the declaration of struct nouveau_conn_atom up a bit
      drm/nouveau: Fix drm-core using atomic code-paths on pre-nv50 hardware

Lyude Paul (3):
      drm/nouveau/kms/nv50-: Call outp_atomic_check_view() before handling PBN
      drm/nouveau/kms/nv50-: Store the bpc we're using in nv50_head_atom
      drm/nouveau/kms/nv50-: Limit MST BPC to 8

 drivers/gpu/drm/nouveau/dispnv50/atom.h     |   1 +
 drivers/gpu/drm/nouveau/dispnv50/disp.c     | 108 +++++++++++++++----------
 drivers/gpu/drm/nouveau/dispnv50/head.c     |   5 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c |  28 +++++--
 drivers/gpu/drm/nouveau/nouveau_connector.h | 116 ++++++++++++++-------------
 5 files changed, 149 insertions(+), 109 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

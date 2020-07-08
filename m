Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED162217D93
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 05:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 731F76E84F;
	Wed,  8 Jul 2020 03:32:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9487B6E84F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 03:32:33 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id l19so8750135ybl.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jul 2020 20:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=INeTNl3Uo9Yc/yjrLH6G4YOMWynvOVDOCmaPzSWK+8E=;
 b=FDzLhVpSyl3EB5suJEeOOso/ZH0Z2aZcO0xsSHFidXjJlihKJguS+85l58+uV6yrq0
 mRfrdg6cRIA87/YF0A2t0TkNgEOpkDt2arBEPOA+2w8uqgdoAa1CaN2Huyjc3tLXofWB
 aNqO5XGoZnYt0QrxXBSHMV6cgAVm5AGVwMcnrSAV/59fsl2EUa4kcTVhxvMOHcM74VKh
 T6T6h0Rtwix48u7CS/UoRH2zp3RdgeHOCsLreTPBLhwkRuwDPkoRFuFDtGVNFbAfJXZZ
 0umgJR0OLVC7FmUwCthHEWFN5RTQqg7pSENgm9XvLQbhKKfhNFGPAQGttUMDlC2uc0zm
 gGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=INeTNl3Uo9Yc/yjrLH6G4YOMWynvOVDOCmaPzSWK+8E=;
 b=JBzYMd2auHkB5ous1ZH8i6647mvWQr/CwalebvNf8Tfxrdqc94RIWqfzrc3V4pnQmA
 42niZs4t5/mYxTbkOMfHw4I965NvoqTcEoFXxN2Ps79lIuuKcB5XTpmB25jAzNXzKWUL
 wpwiTFVpkXGGMFgCVdEVAmwdyHsFoJxaCKYo7sMBaTCgUcghv9dIk+7tBU0dJl9GPtgk
 kwtPs4/lErclRa0HCBa2UTCtr3HOsKstfl2oGs9PFxq+kSHelqV9+tPe30NSdcWKcC0d
 N6J8EWgZNHXcdmAsmWh/pgQspJRExCvxhTEbBF2/7m1ROoeojNd/1/nc74obM/NnPkM2
 WM/w==
X-Gm-Message-State: AOAM531HGLTiJPI4LFdRU+qCWrjSVe2uAqRkHuHgJ2ZtCH/nnfYJCWen
 tOneieBlLnNUX98Wx2rVisN7g/vunNW+Yh4opvk=
X-Google-Smtp-Source: ABdhPJzHYKyFrK8BFmYXWtE4uI3v0xefo81cQsJB5OnReriieMATHgGhzB6vb1iWjgalvKckb7JyslTPn5A1y9IdQDg=
X-Received: by 2002:a25:e088:: with SMTP id
 x130mr65465546ybg.147.1594179152629; 
 Tue, 07 Jul 2020 20:32:32 -0700 (PDT)
MIME-Version: 1.0
From: Ben Skeggs <skeggsb@gmail.com>
Date: Wed, 8 Jul 2020 13:32:21 +1000
Message-ID: <CACAvsv5i-dc0Onbk8FWzd-PTgXHHWi6jcE3O0hVx8+V5qEOeqg@mail.gmail.com>
Subject: [PULL] nouveau-fixes 5.8
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

The following changes since commit dcb7fd82c75ee2d6e6f9d8cc71c52519ed52e258:

  Linux 5.8-rc4 (2020-07-05 16:20:22 -0700)

are available in the Git repository at:

  git://github.com/skeggsb/linux linux-5.8

for you to fetch changes up to ed710a6ed797430026aa5116dd0ab22378798b69:

  drm/nouveau/nouveau: fix page fault on device private memory
(2020-07-08 13:30:42 +1000)

----------------------------------------------------------------
Ben Skeggs (2):
      drm/nouveau/kms/nv50-: bail from nv50_audio_disable() early if
audio not enabled
      drm/nouveau/i2c/g94-: increase NV_PMGR_DP_AUXCTL_TRANSACTREQ timeout

Ralph Campbell (2):
      drm/nouveau/svm: fix migrate page regression
      drm/nouveau/nouveau: fix page fault on device private memory

 drivers/gpu/drm/nouveau/dispnv50/disp.c            | 3 +++
 drivers/gpu/drm/nouveau/nouveau_dmem.c             | 2 +-
 drivers/gpu/drm/nouveau/nouveau_svm.c              | 1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c   | 4 ++--
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c | 4 ++--
 5 files changed, 9 insertions(+), 5 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

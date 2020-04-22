Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 336611B507A
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 00:47:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C1B6E129;
	Wed, 22 Apr 2020 22:47:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B42666E120;
 Wed, 22 Apr 2020 22:47:17 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id v38so1872107qvf.6;
 Wed, 22 Apr 2020 15:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wu/f+MuDQPT/HkMrn4CdZALymYPJ7qPBSrtCsthdypM=;
 b=ZgWiz3cIudKQ0vr99j0FR5VMJNNtv+yy+BozwCBB0hXjIxtNDT1DCzhCk6zNQ98umC
 yfhKBmnE0J44oSvlyD7tpacO5Qon1HcqXOJfQcsYVuQbBb3Se3eYNgs1jP4K/p0Mb3Eb
 KxpIDB6wRnyJbg07dWq1YLAkTukXe37nTiy5s5vb13sBcpcc/HUnItoZ09HpzMNzU6YL
 gty1cgxVz27ni4tVZiJ8ijiO7OnM8KukmuG91t7rJ2gC5hFMm0pQ5x8EinEFjo2Nq11C
 j8yJYxVDl4tUiTGrbjE1SgjpvLp3XmWRjsUC6WK3APDFhP17nEyn0vTo+SN5TTbylfTa
 eAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wu/f+MuDQPT/HkMrn4CdZALymYPJ7qPBSrtCsthdypM=;
 b=sg7C41QDamlnKgEccuivbF0KRmNd39ny0iowZ4rRasrlCx0q5aKnbgV/z+KzUJuZqC
 m6WbKus1wtA7fF6NKhGMJ3OKQI7HAWkzgLuCK1vBW/cDdigL/NDCxjXzQsVKLCJ5cqUl
 D7CXSVqtnVyyQ+9PZsPbVpXAb7T8JHsbClgj/FfJ7PvzLSWz9taHKXK6PzdyWjpbeYsn
 pDV2OiyFcQ6RvlAYNFO1e+++QtgVkvkDEY1pIA5RmyFCmcyZtlHEq0KXZo24n36r/kCk
 d0usIi2dWil49YCyczn3jt69+Tt+LXYv3AqBD5TpsIC0vTRaJCR4aO6Q5sotCiqJ3Tco
 1bdQ==
X-Gm-Message-State: AGi0PuYBQBl09dj2MKpD6n3IoscJakNFeKulQOjLl2RiFO9sF6bk3hja
 WcFRa/Qlf+CarLf7u553ynmw2j2m
X-Google-Smtp-Source: APiQypIItlOvdPS8u2pJxS0vNvQC4A0xrQRvfdmh28F1mBzyQEDFd7zU5BeqwGvsmH6ownrOoZYatg==
X-Received: by 2002:a0c:fa81:: with SMTP id o1mr1396132qvn.52.1587595636608;
 Wed, 22 Apr 2020 15:47:16 -0700 (PDT)
Received: from localhost.localdomain ([71.219.72.172])
 by smtp.gmail.com with ESMTPSA id o43sm518229qtf.46.2020.04.22.15.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 15:47:16 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.7
Date: Wed, 22 Apr 2020 18:46:47 -0400
Message-Id: <20200422224647.617724-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.3
MIME-Version: 1.0
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

Fixes for 5.7.

The following changes since commit 4da858c086433cd012c0bb16b5921f6fafe3f803:

  Merge branch 'linux-5.7' of git://github.com/skeggsb/linux into drm-fixes (2020-04-16 15:40:02 +1000)

are available in the Git repository at:

  git://people.freedesktop.org/~agd5f/linux tags/amd-drm-fixes-5.7-2020-04-22

for you to fetch changes up to 7daec99fdcde7b01595134a3d8f385bc1009f1d8:

  drm/amdgpu/display: give aux i2c buses more meaningful names (2020-04-17 17:31:38 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.7-2020-04-22:

amdgpu:
- Fix resume issue on renoir
- Thermal fix for older CI dGPUs
- Fix some fallout from dropping drm load/unload callbacks

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu/display: fix aux registration (v2)
      drm/amdgpu/display: give aux i2c buses more meaningful names

Prike Liang (1):
      drm/amd/powerplay: fix resume failed as smu table initialize early exit

Sandeep Raghuraman (1):
      drm/amdgpu: Correctly initialize thermal controller for GPUs with Powerplay table v0 (e.g Hawaii)

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 14 ++++++++++--
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    | 15 ++++++++-----
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.h    |  3 ++-
 .../gpu/drm/amd/powerplay/hwmgr/processpptables.c  | 26 ++++++++++++++++++++++
 drivers/gpu/drm/amd/powerplay/renoir_ppt.c         |  7 +++++-
 5 files changed, 55 insertions(+), 10 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

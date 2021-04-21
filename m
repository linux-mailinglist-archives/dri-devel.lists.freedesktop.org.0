Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C61367391
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 21:42:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA8126E9E2;
	Wed, 21 Apr 2021 19:42:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BFD56E9E1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 19:42:53 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id g9so26485905wrx.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 12:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JU6/Qfl9n+QXWwBGt0462NZzcBDiybmlQ03LCPVjDcM=;
 b=EF4lWCEaoKX8fLy8cm5aOM/qjMBsBPcQxY6gh7z1b6zRT0KzOLOCYtnYT2OLC64JbL
 rzQ4CI8LNWIewiRGfBk3db2sk9X0ITizHMfXEx/Y2SMgBvuJ459nGLhFpSsjSbrG0kZe
 HfMkpztZZ/ki5VMyPg1iW5fC26ijNiTbKL47LjdIPjS5/Nvmefod6zmqaC2qJg/UILlX
 01eY3CBfTf0+doHRt6V/+PIs0FRC9J17kKkXKz+XC9FMuGsQ6ECfcI5rPqRwc1BePWvp
 tk5nyun6WSPL/nx080ahNpi59LafdJssw6pQ2dpr9Y+rPhgK3SC+9y211CksOFi3xh9P
 yrug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JU6/Qfl9n+QXWwBGt0462NZzcBDiybmlQ03LCPVjDcM=;
 b=DHdehOsouULamFVBslhtv6hBBNNyY4z6QJzJTaZk0W2z5vgUfURQsCEHM33aAA3v8X
 IUc0VBUyvaBoTo6dbdPuTQA39DxZ3DWTICh7hAHIF027Y93KG6eUniFl882A54Ob5Bsz
 njcHdTb/kiLEcE/wQwXcFOWS1AikLREMtYEUt4q75AwXXMsS+DC8AIVHiJ/HduhT1rEM
 aPZcLIHRm2Cv0uYTy3nfLHQ5BjArO42LRtIZED3AtxQR+75MedXMTmTZWZoehM9lnZ1u
 J6jZ03Wu/Ni8gXT/eFmftmx1+hErokr+rei6oB9GehqdAvO2ADCiVaHu4qNSeN8gOvOE
 cPzQ==
X-Gm-Message-State: AOAM533z2Y8wMA0tI6a/q55wBbxPaP+LtVZCuAiQdVFnGJs3OVrJARsG
 ykDrWzfM6bqtNlck3RQx8l4=
X-Google-Smtp-Source: ABdhPJxwLLpPCAGgCKzl/unvPvqM8+kZJPO3R33aSTcElWruEpi/1NIOV+MzVBGeU40BkA90bykGHQ==
X-Received: by 2002:adf:cf09:: with SMTP id o9mr29478140wrj.366.1619034172365; 
 Wed, 21 Apr 2021 12:42:52 -0700 (PDT)
Received: from bcarvalho-Ubuntu.lan ([2001:818:de85:7e00:6d3d:2d8b:5417:831c])
 by smtp.gmail.com with ESMTPSA id
 o4sm484163wrn.81.2021.04.21.12.42.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 12:42:51 -0700 (PDT)
From: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 0/3] drm: Use tabs for code indents 
Date: Wed, 21 Apr 2021 20:42:46 +0100
Message-Id: <cover.1618828127.git.martinsdecarvalhobeatriz@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: melissa.srw@gmail.com, outreachy-kernel@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove space and use tabs for indent the code to follow the
Linux kernel coding conventions.
Problem found by checkpatch

Beatriz Martins de Carvalho (3):
  drm: drm_atomic_uapi.c: Use tabs for code indents
  drm: drm_blend.c: Use tabs for code indents
  drm: drm_connector.c: Use tabs for code indents

 drivers/gpu/drm/drm_atomic_uapi.c |  6 ++---
 drivers/gpu/drm/drm_blend.c       |  4 ++--
 drivers/gpu/drm/drm_connector.c   | 38 +++++++++++++++----------------
 3 files changed, 24 insertions(+), 24 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 208FB168C0F
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2020 03:43:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C656F5BB;
	Sat, 22 Feb 2020 02:43:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA636F5BB;
 Sat, 22 Feb 2020 02:43:05 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id j9so2251875pfa.8;
 Fri, 21 Feb 2020 18:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=jl6vr7UWR0nnpM8j/ALbDa2/HAnUrEfvjRx7BLpgwYw=;
 b=NtDPTxevIBnoMdTW3rjzbt0kL5qDit08F8JctPGl7mU8+1oCqFfSc/dRRxwqb5Yfjc
 e1xuWvjWkhya7TLAEFLMeEFE5a0GN5nmUVEFpYfZAga4R1J5n8KkZpCOT7aolnAd1o8s
 o6slOXW+/PHgkuIjrkkXyX4IYlgpPT3MYBk6M+DtL5CpG/5X1i+M10y0vscxnXTuO8JD
 /IG2Z1nzdCwoOhqfSI7NfivJm2LX70Mk0vAbkFTabw5oPoXhGRzN3FK9hs9LRU5rM3VS
 KX07rlavU59H39HUCBUYhzJmXzxx1EROVLaUYngzeDVXxUxTL64QtGwXmdIA8JLvXb3P
 7Khg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=jl6vr7UWR0nnpM8j/ALbDa2/HAnUrEfvjRx7BLpgwYw=;
 b=Nx7y1c0akZvhIIuqdYhwIw+R+jIHsdfiCH+2sGP342g4cNdTBWsXFxiOy8IsGCXEvw
 T/4x1PtTGLa2RebY1OBW6JpBZoaCWkkKkfpp1FeO3ZzrcMf9A2UGc7z8UhnZxKlX6RhQ
 zQzjUdka1xQGMZU0d8rtfpmRWnjl3ANtaAmOGftTV81XQqM8Ny/wec+HdzAvzph4E7P3
 +YJHYh84W0ols7tdip1EajKRgNGnZk5sjatqmH8PADbO4UCyFsBg/82uVNb9BFB7yc3L
 kEqzuRzSX8f7O2PtGuAEpKov3Ips3Dm1MSY1LN/5NjzeOMf9fIEtJn93jHP/yQyb3rC4
 NtgQ==
X-Gm-Message-State: APjAAAXB4W2KOCN0SK5++4qsL0eGmzRwTjYdHOZ2U3MLMMMtJgDemiFX
 9u6TQlAp9UgJh8olXvYfGaQW23Lgnf3H5Q==
X-Google-Smtp-Source: APXvYqy3WAqsqAKTzVMWBPhW5HWtSgR93gIGuiEy7UjIU9pIYHENaSDLgKKgO/g7L0uZNQCZBuFlZA==
X-Received: by 2002:a63:5fcf:: with SMTP id
 t198mr40852962pgb.383.1582339384736; 
 Fri, 21 Feb 2020 18:43:04 -0800 (PST)
Received: from localhost.localdomain ([103.219.195.110])
 by smtp.gmail.com with ESMTPSA id u13sm3797317pjn.29.2020.02.21.18.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 18:43:03 -0800 (PST)
From: Qiang Yu <yuq825@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/5] drm/lima: add error debug functionality
Date: Sat, 22 Feb 2020 10:42:05 +0800
Message-Id: <20200222024210.18697-1-yuq825@gmail.com>
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Andreas Baierl <ichgeh@imkreisrum.de>,
 Qiang Yu <yuq825@gmail.com>, Icenowy Zheng <icenowy@aosc.io>,
 Erico Nunes <nunes.erico@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Save task error state when it fail and export to user by
sysfs as a binary file which can be dumped and replayed
by lima_dump tool at:
https://gitlab.freedesktop.org/lima/lima_dump

Qiang Yu (5):
  drm/lima: save process info for debug usage
  drm/lima: add max_error_tasks module parameter
  drm/lima: save task info dump when task fail
  drm/lima: add error sysfs to export error task dump
  drm/lima: add LIMA_BO_FLAG_FORCE_VA

 drivers/gpu/drm/lima/lima_ctx.c    |   3 +
 drivers/gpu/drm/lima/lima_ctx.h    |   5 ++
 drivers/gpu/drm/lima/lima_device.c |  13 +++
 drivers/gpu/drm/lima/lima_device.h |   8 ++
 drivers/gpu/drm/lima/lima_drv.c    | 123 +++++++++++++++++++++++++--
 drivers/gpu/drm/lima/lima_drv.h    |   1 +
 drivers/gpu/drm/lima/lima_dump.h   |  77 +++++++++++++++++
 drivers/gpu/drm/lima/lima_gem.c    |   7 +-
 drivers/gpu/drm/lima/lima_gem.h    |   4 +-
 drivers/gpu/drm/lima/lima_sched.c  | 128 +++++++++++++++++++++++++++++
 drivers/gpu/drm/lima/lima_sched.h  |   7 ++
 drivers/gpu/drm/lima/lima_vm.c     |  13 ++-
 include/uapi/drm/lima_drm.h        |   9 +-
 13 files changed, 385 insertions(+), 13 deletions(-)
 create mode 100644 drivers/gpu/drm/lima/lima_dump.h

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

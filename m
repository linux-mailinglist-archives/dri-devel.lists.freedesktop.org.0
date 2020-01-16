Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A1013DB34
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 14:12:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B9E6ECF5;
	Thu, 16 Jan 2020 13:12:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BABC6ECF5;
 Thu, 16 Jan 2020 13:12:28 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id c23so8322489plz.4;
 Thu, 16 Jan 2020 05:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=NgEAAHXQ8sxH2W8dz+VI4Ho2Mv3PQGgM2HaweIxbSXc=;
 b=T9ED0/XpusvTuTCodjYc+X1UvhMO1Q9Du6RlXCAxqQn4bv7dJrDAHovjVUm66fM+ee
 LIZLxyc5k5h/DjG7IY+2Qlk49YrmO86b4++loAsthW/LsN+cFCP0hn1xcvIiN3XvfLtD
 3q7qAT9qtr3ghZI7tgnHwA1WttdGzxBxWEBwpgMUvv+5iQgLOYOK5P3k9XYIdGGlC76n
 bjIabhEHU9RiXTPARHVoB+uVVwW2rvxYRoj7Hm2PjqlNX21B5/9aOEiPylXDVzV5CEUD
 yJO2KW7d6VGr4SmEq8s/rEnXl4BFMQAA4AHqh7fHfn0NSMOIF6dxkrfItLFltB9/ObRw
 3xWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=NgEAAHXQ8sxH2W8dz+VI4Ho2Mv3PQGgM2HaweIxbSXc=;
 b=CBZFmTAKB2F65hH5yxJYDLbmHkbbfZhaHoOpnIHuUgr0DfAKc8sGvgpDLD30hCmYp4
 +3l5noNDSKtd6MiIcJ/W3ZzS/963fck5QBNa1Pg3c+CTCs9dlopeOK0bTiX5dnUKhLA4
 HF16ddpM+UP5zDUDosURejjHZ8TGOGufFzRbCrn4nj+VsdfpWc1v6Lh9i2yTGwNHLWZo
 +Zdb1cqE/m09Ic5qSQ9+v08yK+M1iUOQgS8GQ6aj534UrPIhL7ldXAXbEmTsBM3jqbxk
 MvEtyiY5fxTAR8DbuWYXqrYlHT7IieNNIdiCegz8sDjb1Tg7lkp0h1YJVFdw1DWXkE7W
 d2JA==
X-Gm-Message-State: APjAAAX6f7o95Y8GhIn91rM4NCCJbGCtV2V3Ekj1TpWojREIZdisn1E/
 WSxTs3v9vVvynfTbeVMwzPfBSjNX
X-Google-Smtp-Source: APXvYqxFAWMPtiw2MXsxWrZ/tEbA3bRJ1srqy61Riijvt8NiKq6govls95DPNhdPY/qd/IUVPkznNw==
X-Received: by 2002:a17:90a:2808:: with SMTP id
 e8mr6651246pjd.63.1579180347948; 
 Thu, 16 Jan 2020 05:12:27 -0800 (PST)
Received: from localhost.localdomain ([103.219.195.110])
 by smtp.gmail.com with ESMTPSA id v9sm25945877pfi.37.2020.01.16.05.12.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2020 05:12:27 -0800 (PST)
From: Qiang Yu <yuq825@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/5] drm/lima: add heap buffer support
Date: Thu, 16 Jan 2020 21:11:52 +0800
Message-Id: <20200116131157.13346-1-yuq825@gmail.com>
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
 Qiang Yu <yuq825@gmail.com>, Erico Nunes <nunes.erico@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Support heap buffer allocation which can grow the back memory
size when GP has an out of memory interrupt so that user don't
need to allocate a very large buffer at the beginning.

Qiang Yu (5):
  drm/lima: update register info
  drm/lima: add lima_vm_map_bo
  drm/lima: support heap buffer creation
  drm/lima: recover task by enlarging heap buffer
  drm/lima: increase driver version to 1.1

 drivers/gpu/drm/lima/lima_drv.c   |  16 +++-
 drivers/gpu/drm/lima/lima_drv.h   |   1 +
 drivers/gpu/drm/lima/lima_gem.c   | 130 ++++++++++++++++++++++++++++--
 drivers/gpu/drm/lima/lima_gem.h   |   4 +
 drivers/gpu/drm/lima/lima_gp.c    |  51 +++++++++++-
 drivers/gpu/drm/lima/lima_mmu.c   |   5 ++
 drivers/gpu/drm/lima/lima_mmu.h   |   1 +
 drivers/gpu/drm/lima/lima_regs.h  |   1 +
 drivers/gpu/drm/lima/lima_sched.c |  35 ++++++--
 drivers/gpu/drm/lima/lima_sched.h |   6 ++
 drivers/gpu/drm/lima/lima_vm.c    |  44 +++++++++-
 drivers/gpu/drm/lima/lima_vm.h    |   1 +
 include/uapi/drm/lima_drm.h       |   9 ++-
 13 files changed, 284 insertions(+), 20 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

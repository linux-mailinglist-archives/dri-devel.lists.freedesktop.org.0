Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3424F1AA910
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 15:53:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943556E988;
	Wed, 15 Apr 2020 13:53:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC426E988;
 Wed, 15 Apr 2020 13:53:11 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id c138so1547084pfc.0;
 Wed, 15 Apr 2020 06:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=OPBTjEu+Pj1PvOtGESP4rq37t/UF7hS1wB7mWbonuLE=;
 b=mUMSpTSAkpjV91dK++QOlVA2Dt+rkM5+k/LQjqBiN/x21Ot7aTsj8z7yNipoX49fO5
 DMUifJ0rwaKrSh7DMxt9sqyTwNpGgBcz6JvzJ8y88DXjumUodnpNjSQYTpAeCdTC0tN/
 jtjorM1HHrcAUCzl1hIF9haiBGAG7+v3FcllM00EHzOpGKChNtlJykkv+O4ck0WbgFk6
 XF1bHTbSlzk5YUnzF36Ym5zfoGBdTVdullNnMx6KJPCFOeyaJtGt0GsU634ciSMy8bQn
 ofJll53iugbFr1irR0fmwMqvcKVSOUNBnQkY2qbeALwh1Ot6YHHyxoYWsx725vi4uKny
 ZxrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=OPBTjEu+Pj1PvOtGESP4rq37t/UF7hS1wB7mWbonuLE=;
 b=hULlkF0MjWfaTmdgcCjAz/NQk5eC9YO7IS3Rg+3IX1jmRd/w2z3F/c6K/z7r79g42+
 Yr1JmdYlGaip5xYemR0l1wuWZqwrj7hJcd5Vr3MBYTe0yg2hU9zs56m1VjeQW9E2Ok8s
 qGcAjVurI3oMOZBCCq3k5L9/biCpLTbTro5JL2V7PGsJptt20sul/7ynm9noEE4SPifC
 6ycm9iOrbL0j6mArwoUb88S6vhn3Qj17JQLkcmDFhFC4rIYRusyo+Of7XceTG1Q0X1Q3
 B+oVGUqrm0R4GIJL9+ACkgv85SkulJJUdRU39AZWFdFGxRj8N9rO73ywFf+GyTdbmcvl
 Zogg==
X-Gm-Message-State: AGi0PuZoQAG4m62TK51XEgsY2a0dWhg4gFhIPLjzSfASPqfAcVImpYAp
 a0Mh/5DieSEZ9TWMewjB6v6qHl13vfQ=
X-Google-Smtp-Source: APiQypJRhkVTf1Wm7IS31qq/9rjYsHcHw9K8Az/xpU0wCoqfTK5OO13CpbyRFl+DzvpleEuM5JTC6g==
X-Received: by 2002:a63:5c06:: with SMTP id q6mr26122882pgb.187.1586958790596; 
 Wed, 15 Apr 2020 06:53:10 -0700 (PDT)
Received: from yuq-Aspire-4738G.lan (li2017-195.members.linode.com.
 [172.105.124.195])
 by smtp.gmail.com with ESMTPSA id z1sm3331069pjt.42.2020.04.15.06.53.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 06:53:09 -0700 (PDT)
From: Qiang Yu <yuq825@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/4] drm/lima: add suspend/resume support
Date: Wed, 15 Apr 2020 21:52:04 +0800
Message-Id: <20200415135208.8960-1-yuq825@gmail.com>
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
 Bhushan Shah <bshah@kde.org>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Andreas Baierl <ichgeh@imkreisrum.de>, Qiang Yu <yuq825@gmail.com>,
 Erico Nunes <nunes.erico@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Suspend need to wait running jobs finish and put hardware in
poweroff state. Resume need to re-init hardware.

Qiang Yu (4):
  drm/lima: add lima_devfreq_resume/suspend
  drm/lima: power down ip blocks when pmu exit
  drm/lima: add resume/suspend callback for each ip
  drm/lima: add pm resume/suspend

 drivers/gpu/drm/lima/lima_bcast.c    | 25 ++++++++--
 drivers/gpu/drm/lima/lima_bcast.h    |  2 +
 drivers/gpu/drm/lima/lima_devfreq.c  | 24 ++++++++++
 drivers/gpu/drm/lima/lima_devfreq.h  |  3 ++
 drivers/gpu/drm/lima/lima_device.c   | 69 ++++++++++++++++++++++++++++
 drivers/gpu/drm/lima/lima_device.h   |  5 ++
 drivers/gpu/drm/lima/lima_dlbu.c     | 17 ++++++-
 drivers/gpu/drm/lima/lima_dlbu.h     |  2 +
 drivers/gpu/drm/lima/lima_drv.c      |  7 +++
 drivers/gpu/drm/lima/lima_gp.c       | 21 +++++++--
 drivers/gpu/drm/lima/lima_gp.h       |  2 +
 drivers/gpu/drm/lima/lima_l2_cache.c | 37 +++++++++++----
 drivers/gpu/drm/lima/lima_l2_cache.h |  2 +
 drivers/gpu/drm/lima/lima_mmu.c      | 45 +++++++++++++-----
 drivers/gpu/drm/lima/lima_mmu.h      |  2 +
 drivers/gpu/drm/lima/lima_pmu.c      | 68 ++++++++++++++++++++++++++-
 drivers/gpu/drm/lima/lima_pmu.h      |  2 +
 drivers/gpu/drm/lima/lima_pp.c       | 31 +++++++++++--
 drivers/gpu/drm/lima/lima_pp.h       |  4 ++
 19 files changed, 332 insertions(+), 36 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

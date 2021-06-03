Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2AB39A3E6
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 17:03:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC3776E1E0;
	Thu,  3 Jun 2021 15:03:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 408456F48E
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 15:03:33 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id h24so9748975ejy.2
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 08:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mpf+22HJp3bXTLvdn/Ycffjhcm4o9o/MNAerroFOnOE=;
 b=U7IQY+Yqtz8Hrs1nZlKCD2HYN2Uwh9i/SaVt9a8FCgR1Hqe0kGwMmrDJFOcHByMJP/
 mRjVr8TzYc4a/3ub/VBedTorux2Z4d69vFEaftpVWp1cIrZMCmXC9FCywAJ1pnzfSlZ/
 eruSWGAN4HZ3hlo5u5dTlfL5BsnVVjyFExfdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mpf+22HJp3bXTLvdn/Ycffjhcm4o9o/MNAerroFOnOE=;
 b=DxmNA3SyjoWJCHiWgc9Ed7qA2wmfvsfHiNp/mK0FLICR0OD0thnGZyLwji+3tsue1J
 cUaMsVplF8ILmGq1nKgkcxxhaM06X8o3TG3vEVXwNYB06L5jH1pYYklH8zgeigWvfcd6
 g+DN3qwR54pY0gFk3kHpV29osZn7qw7Hqx4uRLTniEm7bKCoqQzG2+Wb42TrpWPV6jph
 xUDr+ue563M8GQVV0MFnGyOG1EmdzBmCiRtsSVueb3ByzIHEczS9L9twv7SFnAaV4lRX
 fMxqpiBpzufAB8x8q1HaEWBIh1rINDqfg1b/l6IMX4fP9l9ZP4CapWmXJU4Gauv9CC42
 WtRw==
X-Gm-Message-State: AOAM532M9YgjFN6wVzGViaMU2rYhIaseEN0zZDDH+Vziyl6OjUVgBhEI
 YD1ImTg3GfkMgoJfjItY8qumqnbbdCBkcA==
X-Google-Smtp-Source: ABdhPJy9MJtoY89TBW+O0pLEcP09O9i8V8ABSjmBxpFj085wKOBfvRcttMvXAKfEerjN5ZUybgdPqA==
X-Received: by 2002:a17:906:1701:: with SMTP id c1mr13936eje.425.1622732611935; 
 Thu, 03 Jun 2021 08:03:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id hz10sm1621791ejc.40.2021.06.03.08.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:03:31 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v2 0/4] shmem helpers for igt
Date: Thu,  3 Jun 2021 17:03:22 +0200
Message-Id: <20210603150326.1326658-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

I finally figured out why CI is unhappy on some machines, we've lost WC
mode on the vgem side!

Test-with: 20210527140732.5762-1-daniel.vetter@ffwll.ch

Cheers, Daniel

Daniel Vetter (4):
  drm/gem-shmem-helper: Export drm_gem_shmem_funcs
  drm/shmem-helper: Switch to vmf_insert_pfn
  drm/shmem-helper: Align to page size in dumb_create
  drm/vgem: use shmem helpers

 drivers/gpu/drm/Kconfig                |   3 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c |  11 +-
 drivers/gpu/drm/vgem/vgem_drv.c        | 346 ++-----------------------
 include/drm/drm_gem_shmem_helper.h     |   1 +
 4 files changed, 25 insertions(+), 336 deletions(-)

-- 
2.31.0


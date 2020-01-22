Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5467145EE6
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 00:00:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E5C86F924;
	Wed, 22 Jan 2020 23:00:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc2d.google.com (mail-yw1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C2486F923
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 23:00:50 +0000 (UTC)
Received: by mail-yw1-xc2d.google.com with SMTP id v126so636467ywc.10
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 15:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=AzYz4egvav0esFkZ4BUy2lRzavIwB8v3jHypg9I93nc=;
 b=PcWEXUpqj0wFRetSDSV+rQpnGOg8LwMJfPo0YfMiB/wwwWXRXGA39NY0qA4crqD2wS
 BDMR8QCl6+UczpRKXFClcMKqEZwjj2ZlVULMhGmfa+jRKk7y78L5saQ+pbXd8eL+Qgt9
 8ndrsy6idRQ+NlQNZl3mF0BKv+Y5Gmr0PiyuUPGhXplzVRdON23Qd4gg131ztv6dMPFd
 z0MwRXjPD51yuoz52IaG5fA2JgWsqiOEOrO75f6SynzDmWCEa0vra7wS8dTmal25EsFV
 1Q+sclO3syhU7Y9b0j9KvI1DITr1SunB8gpPpxgaQEzxG+bidAeT/jZcKh+Xu0j/f2nA
 sj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=AzYz4egvav0esFkZ4BUy2lRzavIwB8v3jHypg9I93nc=;
 b=TI4StO4M9pR49cNhB7yhyHXj3n+BhvXnD/+Ti7sgFhB8BmZ8hUAXAmLNUstqxQThH9
 ck3VDXZpF+w9Vajb7XmlQXXk9eBAL/9eKHUe8NqamVxOPziffD487ZGnXdDjBhvWgPqg
 Yt8Qf6cWU/VPnJADweQiPTuvS7kCiaUfJS2F+5R5cdRr2zfQfQSfsLG8rhLsqVQdfneG
 taF2HtNmGJm54+wMidrDnrYJe+DD36GaDlo9eoCGQ5mxtwk9W+5NPkDvWA4fVoqUq+Pn
 PMWVI1kUCHQwrPMC7UeoTuUZgybF8jtkfoRd2JF4sDXT9rHlj+BL+w2XzeSrvjfvC1vY
 z7EQ==
X-Gm-Message-State: APjAAAWQmw2mSlMpw1vb0sCzo+DTYxPXriLhJNpgotk53yOLS900dTrq
 +jyhztcBUKpSCaHb9/35EaUi0fs655STJNAixvWBC9hNLOk=
X-Google-Smtp-Source: APXvYqx9YZoZqd0EYcFOugy3Bqj7Wtnr7faEXD5f9lSdR5MJ5dC+ijII8zNRAC1i3muL3aikx7v7kPSt51dEQtExF38=
X-Received: by 2002:a81:9e0f:: with SMTP id m15mr3589603ywj.407.1579734049307; 
 Wed, 22 Jan 2020 15:00:49 -0800 (PST)
MIME-Version: 1.0
From: Ben Skeggs <skeggsb@gmail.com>
Date: Thu, 23 Jan 2020 09:00:38 +1000
Message-ID: <CACAvsv51mZaRuT5R=VhbKSTPzd15L4FbDiPQ+wsF+C23c_fOAQ@mail.gmail.com>
Subject: [PULL] nouveau-next 5.6 fixes
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

Hey Dave,

Just a couple of fixes to GP10x ACR support after the work, and a
(fairly severe if you're running piglit a lot) memory leak fix.

Ben.

The following changes since commit afa3b96b058d87c2c44d1c83dadb2ba6998d03ce:

  drm/nouveau/gr/tu10x: initial support (2020-01-15 10:50:30 +1000)

are available in the Git repository at:

  git://github.com/skeggsb/linux linux-5.6

for you to fetch changes up to ee8642162a9edd40daafd3fb894e3fd3f909e361:

  drm/nouveau: fix build error without CONFIG_IOMMU_API (2020-01-23
08:56:51 +1000)

----------------------------------------------------------------
Ben Skeggs (1):
      drm/nouveau/mmu: fix comptag memory leak

Chen Zhou (1):
      drm/nouveau: fix build error without CONFIG_IOMMU_API

Thierry Reding (2):
      drm/nouveau/pmu/gm20b,gp10b: Fix Falcon bootstrapping
      drm/nouveau/gr/gp10b: Use gp100_grctx and gp100_gr_zbc

YueHaibing (2):
      drm/nouveau/kms/nv50: remove set but not unused variable 'nv_connector'
      drm/nouveau/kms/nv04: remove set but not used variable 'width'

 drivers/gpu/drm/nouveau/Kconfig                 | 1 +
 drivers/gpu/drm/nouveau/dispnv04/arb.c          | 3 +--
 drivers/gpu/drm/nouveau/dispnv50/disp.c         | 2 --
 drivers/gpu/drm/nouveau/nvkm/core/memory.c      | 2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h  | 1 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gp100.c  | 2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gp10b.c  | 4 ++--
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.c | 9 +++++++--
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c | 9 +++++++--
 9 files changed, 21 insertions(+), 12 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

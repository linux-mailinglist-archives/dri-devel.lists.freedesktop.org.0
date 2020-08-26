Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F37252841
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 09:15:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 679C36EA27;
	Wed, 26 Aug 2020 07:15:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDDFF6EA27
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 07:15:25 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id q93so707544pjq.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 00:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=0Q6scoxL+d70qkSwAGY56y4zy3DvXODuXPU5bPQHzOc=;
 b=uETILQoS7qsMgRSI6GsDvBM0d4XFagE1Ud4CXHsIbqBM7fWQPUakOYAe20BEtnXfpE
 sz8XY6mSozCGdDR2UjWBgRh2dLp5fZZM+fY7jKUPNn4RFEGFdKpnIvR4tFeAVLYelnjF
 qaIqDllUg+SeEq0B/tSUKxRMvg6CS42i2VIjiqmyF/M2laAIkaC02cb8nTjVhopYlMZt
 gMTOBsfSglY/oYHP453fO1xpS2Q3Dbuki69Z1H9FCh9AjvNKGOz9PtJ1CjyjgLztru7a
 8ZpO6uVtbE6a+Vpx3CxMLfJRvq1X+sq9PEe60+GuwC4ptFBaUmGT6WayKR9VhLBImQNO
 +4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=0Q6scoxL+d70qkSwAGY56y4zy3DvXODuXPU5bPQHzOc=;
 b=NZOUr+QTAcuYY5EMizlZAdmayH8gZhJom5OIzlkaMFiHllsfKrLq/Lroazwy6HBWGf
 FtHoKiYTj0RlXH66ArYrt5DxM/AQpl8iz9DMe9cCira+9net1vS8D7wnATC6wmVatB7v
 iRbyf1QIxtEpdfIqkHS5qhJiRGaPXvyRhGl6mcjVaoEjdNgUX5RbdUMgoS9NvNXVGUns
 EgzO+VnTVDaT8bQLVnYRdbyhtZ+zU/mOENrtGMv0+KErwSsOvJgV/pIYywH2EIfjmQzn
 744vMXj9uvStTim2jBU+4WDIBXtkuhsZj4s5gqQp6WusOouYbSlPtRNuWrX69Ok+XCSv
 GsyA==
X-Gm-Message-State: AOAM5311gxU2zrRn9ojeueLSoroTLhtOgz2gXnyIDDob0twO5boZEukN
 59pw0V6J/7lksnWrQBZ0Eyo=
X-Google-Smtp-Source: ABdhPJwymBjSQnCvHIlxla4xQpv5y4P/j/BjFN9Q2DRcXwBn1G5emfkIEo6gGTh2k+SYpeRGmxhrtQ==
X-Received: by 2002:a17:902:8546:: with SMTP id
 d6mr10970772plo.218.1598426125191; 
 Wed, 26 Aug 2020 00:15:25 -0700 (PDT)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
 by smtp.gmail.com with ESMTPSA id m7sm1571520pfm.31.2020.08.26.00.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 00:15:24 -0700 (PDT)
From: Inki Dae <daeinki@gmail.com>
To: airlied@linux.ie
Subject: [GIT PULL] exynos-drm-fixes
Date: Wed, 26 Aug 2020 16:15:20 +0900
Message-Id: <20200826071520.3140-1-daeinki@gmail.com>
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
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

   Just one fixup to fix sparse warning reported.

   Please kindly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit d012a7190fc1fd72ed48911e77ca97ba4521bccd:

  Linux 5.9-rc2 (2020-08-23 14:08:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-fixes-v5.9-rc3

for you to fetch changes up to d4035d104313cc43b34381b585a7407f069a5132:

  drm/exynos: gem: Fix sparse warning (2020-08-26 16:03:05 +0900)

----------------------------------------------------------------
One fixup
- Just drop __iommu annotation to fix sparse warning.

----------------------------------------------------------------
Marek Szyprowski (1):
      drm/exynos: gem: Fix sparse warning

 drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_gem.h   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

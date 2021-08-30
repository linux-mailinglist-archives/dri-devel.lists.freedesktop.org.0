Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 530CF3FB9E7
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 18:13:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C16389A59;
	Mon, 30 Aug 2021 16:13:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C3C089A59
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 16:13:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 48D5960F92
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 16:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630339982;
 bh=40inKDhWzSvdGsiJaHfcPhn4GTMQWygcBLFqeqAn4/g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NzTicYRYkcQru4sLkEttXtHEU1G2mK+qzPV//QJM+KiX9BKTip5JYE9M3m6jBzokj
 jWrfOGUKySmn7oe5uU5PXq1vfJpwSD2dL46K14+ZvUTwHhRid4W9JYILYeBgH66bUn
 7lCah/C3lQpIpxbNQRtB69JGMeAo0m+IwISOnPAP3Vmzafm1h2uyHbf+uIfiEpRrWR
 ldywnKXG8xILvroo+EMzAQ4RpMMKWlfAqYLHATbCg84KgFFekl598B4cTR65PXCBKs
 Lbte+tcrlHLINyZyLkCuvQDD18RkvV1lGwhG7FenBdKK1r79sl2PU5/Rygd+Dq8Dix
 rh6gS3yxsIgfA==
Received: by mail-ej1-f43.google.com with SMTP id x11so32436039ejv.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 09:13:02 -0700 (PDT)
X-Gm-Message-State: AOAM530MjK7m1s/zgKT9MB5YMl1dkBtXoTW5iyVfNQk+RvBjgIiJCmT6
 vU+LNNoRBxkSOZyoKkAJYU8klBRTzr5SM8PmTw==
X-Google-Smtp-Source: ABdhPJzgx5cNjX+gTraGFHxZN+e1334aj9v6T19QNMRMy0fo5AFPAJt2/mH9BWnDA3HXjDRaNHV50rJYr6iuSxAiU4U=
X-Received: by 2002:a17:906:b4d:: with SMTP id
 v13mr26478063ejg.468.1630339980797; 
 Mon, 30 Aug 2021 09:13:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210821031357.289-1-yuzenghui@huawei.com>
 <YSPuMqd1QgnRIVCB@robh.at.kernel.org>
 <YSddYSKvGneVKNjW@phenom.ffwll.local>
In-Reply-To: <YSddYSKvGneVKNjW@phenom.ffwll.local>
From: Rob Herring <robh@kernel.org>
Date: Mon, 30 Aug 2021 11:12:48 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+gapHO79i1BY8AhCJX6H67FgLmZV7xXcjBn9yY4q=6iQ@mail.gmail.com>
Message-ID: <CAL_Jsq+gapHO79i1BY8AhCJX6H67FgLmZV7xXcjBn9yY4q=6iQ@mail.gmail.com>
Subject: Re: [PATCH] drm: remove zxdrm driver
To: Zenghui Yu <yuzenghui@huawei.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 wanghaibin.wang@huawei.com, 
 Jun Nie <jun.nie@linaro.org>, David Airlie <airlied@linux.ie>,
 Shawn Guo <shawnguo@kernel.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 26, 2021 at 4:22 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Aug 23, 2021 at 01:51:30PM -0500, Rob Herring wrote:
> > On Sat, 21 Aug 2021 11:13:57 +0800, Zenghui Yu wrote:
> > > The zte zx platform had been removed in commit 89d4f98ae90d ("ARM: remove
> > > zte zx platform"), so this driver is no longer needed.
> > >
> > > Cc: Arnd Bergmann <arnd@arndb.de>
> > > Cc: Jun Nie <jun.nie@linaro.org>
> > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> > > ---
> > >  .../devicetree/bindings/display/zte,vou.txt   | 120 ---
> > >  drivers/gpu/drm/Kconfig                       |   2 -
> > >  drivers/gpu/drm/Makefile                      |   1 -
> > >  drivers/gpu/drm/zte/Kconfig                   |  10 -
> > >  drivers/gpu/drm/zte/Makefile                  |  10 -
> > >  drivers/gpu/drm/zte/zx_common_regs.h          |  28 -
> > >  drivers/gpu/drm/zte/zx_drm_drv.c              | 190 ----
> > >  drivers/gpu/drm/zte/zx_drm_drv.h              |  34 -
> > >  drivers/gpu/drm/zte/zx_hdmi.c                 | 760 ---------------
> > >  drivers/gpu/drm/zte/zx_hdmi_regs.h            |  66 --
> > >  drivers/gpu/drm/zte/zx_plane.c                | 537 ----------
> > >  drivers/gpu/drm/zte/zx_plane.h                |  26 -
> > >  drivers/gpu/drm/zte/zx_plane_regs.h           | 120 ---
> > >  drivers/gpu/drm/zte/zx_tvenc.c                | 400 --------
> > >  drivers/gpu/drm/zte/zx_tvenc_regs.h           |  27 -
> > >  drivers/gpu/drm/zte/zx_vga.c                  | 527 ----------
> > >  drivers/gpu/drm/zte/zx_vga_regs.h             |  33 -
> > >  drivers/gpu/drm/zte/zx_vou.c                  | 921 ------------------
> > >  drivers/gpu/drm/zte/zx_vou.h                  |  64 --
> > >  drivers/gpu/drm/zte/zx_vou_regs.h             | 212 ----
> > >  20 files changed, 4088 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/display/zte,vou.txt
> > >  delete mode 100644 drivers/gpu/drm/zte/Kconfig
> > >  delete mode 100644 drivers/gpu/drm/zte/Makefile
> > >  delete mode 100644 drivers/gpu/drm/zte/zx_common_regs.h
> > >  delete mode 100644 drivers/gpu/drm/zte/zx_drm_drv.c
> > >  delete mode 100644 drivers/gpu/drm/zte/zx_drm_drv.h
> > >  delete mode 100644 drivers/gpu/drm/zte/zx_hdmi.c
> > >  delete mode 100644 drivers/gpu/drm/zte/zx_hdmi_regs.h
> > >  delete mode 100644 drivers/gpu/drm/zte/zx_plane.c
> > >  delete mode 100644 drivers/gpu/drm/zte/zx_plane.h
> > >  delete mode 100644 drivers/gpu/drm/zte/zx_plane_regs.h
> > >  delete mode 100644 drivers/gpu/drm/zte/zx_tvenc.c
> > >  delete mode 100644 drivers/gpu/drm/zte/zx_tvenc_regs.h
> > >  delete mode 100644 drivers/gpu/drm/zte/zx_vga.c
> > >  delete mode 100644 drivers/gpu/drm/zte/zx_vga_regs.h
> > >  delete mode 100644 drivers/gpu/drm/zte/zx_vou.c
> > >  delete mode 100644 drivers/gpu/drm/zte/zx_vou.h
> > >  delete mode 100644 drivers/gpu/drm/zte/zx_vou_regs.h
> > >
> >
> > Acked-by: Rob Herring <robh@kernel.org>
>
> I just merged another patch to delete the zte driver.

Unfortunately, that one missed the binding doc, so please send me a
patch removing the binding doc.

Rob

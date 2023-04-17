Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A87B26E3D2F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 03:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACB0310E131;
	Mon, 17 Apr 2023 01:18:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD0310E131
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 01:18:20 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-504eccc8fc8so3550978a12.2
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 18:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681694297; x=1684286297;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vukoh+Tup8ynWs7RiNuRL+4E7Xm5EcD+FBfZKi8qbHo=;
 b=moIibPJVhxKW3e7HCpTJGpxXVdrWSfN7lyM1dbeK1Shp+ORSXPpLWxaRHYQDQnmrn7
 +/AYlAr8NPYh6oTkvwzfKH9jSpDq+JrpsNyfu/iU8RxO/3jsDd8VFIdx9L8s8jqidUtf
 wR3Mx8fylR8/AA50PWiF+EG3g2+lXkY2GB7NKOqubjV6S369ageNvinlppOIYuhQzCqK
 Jb6d7DZU3I3FsKtsxYi+5tgjgt5eCSM2E2z4ukQyXdLItemekW8tgunh3JvIvQ38ex8A
 cYGw1ST2WcNVHmbWmH1wio5+zwCwEnfaDVa4vKNHOw0zQMWiMzUYBKOiUR6GCngajqfd
 FASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681694297; x=1684286297;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vukoh+Tup8ynWs7RiNuRL+4E7Xm5EcD+FBfZKi8qbHo=;
 b=cd5oWUS7KsIFe4y3pEbCSPd9+jsB3P3ZWnQmf2pg8MaBY3QMr6HXslOsaLjUUmtrbn
 GQJ1QSOmdXY1ljtplq189CkaTvhXJsH79hJCfqdgHpAu2Q+celmrMDVIPGpaZTIEPanr
 tIpWmrR4KPciS0D5Pwkl44plqN9EL16sFtreWpo/eiTMb1E0Z45hJBilw2Ys9l7anxyW
 APjkkNukJmYUZknLvAVz4irVBfstJfH74xuAp7dmALUWKzx5kwgE3nSz/7trDnxyBpuf
 aVODtqdBormOfwmoXgArk+BSG0Q+jb/EtGRWRPGn3Ww4YOk54QzG4je3feVeThyRJ/+w
 o0Dw==
X-Gm-Message-State: AAQBX9fP4bmMmTOEuhsceV0VGV2YbNaqrWrtZj5OVgY8E9Qe64w6lCwQ
 ytrg3jzdcRHiUNRGTeDD81cb338DQUosqMSLQ4I=
X-Google-Smtp-Source: AKy350ZHUVbJHbl8xoe1HgtY4IEt6uIXEVkpHUp24lCrmjfGEESKe7vedu4oClCc/l2dZXgnIfK9QCrT8guzX/35BCE=
X-Received: by 2002:a50:9fe1:0:b0:504:8548:ab4d with SMTP id
 c88-20020a509fe1000000b005048548ab4dmr6483583edf.5.1681694296652; Sun, 16 Apr
 2023 18:18:16 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20230328040524epcas1p270b050efedfe53d8e59c7e9103d5b84c@epcas1p2.samsung.com>
 <20230328040524.49278-1-inki.dae@samsung.com>
 <ZCMkXPW5vdps3xQE@phenom.ffwll.local>
 <011101d96200$d8aa45e0$89fed1a0$@samsung.com>
In-Reply-To: <011101d96200$d8aa45e0$89fed1a0$@samsung.com>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 17 Apr 2023 10:17:41 +0900
Message-ID: <CAAQKjZPdv0X=HhuvA2VBP2=EQXno_MB_zDkePerdA-D_J_bqiQ@mail.gmail.com>
Subject: Re: [GIT PULL] exynos-drm-next
To: Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

2023=EB=85=84 3=EC=9B=94 29=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 2:39, =
=EB=8C=80=EC=9D=B8=EA=B8=B0 <inki.dae@samsung.com>=EB=8B=98=EC=9D=B4 =EC=9E=
=91=EC=84=B1:
>
>
>
> > -----Original Message-----
> > From: Daniel Vetter <daniel@ffwll.ch>
> > Sent: Wednesday, March 29, 2023 2:31 AM
> > To: Inki Dae <inki.dae@samsung.com>
> > Cc: airlied@linux.ie; daniel@ffwll.ch; dri-devel@lists.freedesktop.org;
> > linux-samsung-soc@vger.kernel.org
> > Subject: Re: [GIT PULL] exynos-drm-next
> >
> > On Tue, Mar 28, 2023 at 01:05:24PM +0900, Inki Dae wrote:
> > > Hi Dave and Daniel,
> > >
> > >    Just one patch series that moves the existing Exynos DSI driver
> > >    to drm/bridge directory to support both SoCs family - Exynos
> > >    and I.MX - because same Exynos MIPI DSI ip can be used by the two
> > >    different SoC family.
> > >
> > >    Of course, there are some concerns about this patch series because
> > Exynos
> > >    and I.MX SoCs have different HW characteristic but use the same HW
> > driver.
> > >    However, I believe that there should be no problem as Exynos and I=
.MX
> > >    developers have conducted tests and reviews enough for about a yea=
r
> > >    since last April.
> > >
> > >    This would be the first case that we allow different vendor SoCs t=
o use
> > >    same device driver at least in DRM world so we anticipate experien=
cing
> > >    and resolving new issues through ongoing maintenance, and ultimate=
ly,
> > >    the experiences gained here will undoubtedly be able to contribute
> > >    the development of the community as well.
> > >
> > >    Please kindly let me know if there is any problem.
> > >
> > > Thanks,
> > > Inki Dae

Could you kindly help me understand if there are any missed steps on
my part? I applied for commit access to the drm and drm-misc
repositories through the link provided below two weeks ago, but
haven't received any updates on my request.
https://gitlab.freedesktop.org/freedesktop/freedesktop/-/issues/569

Thanks,
Inki Dae

> > >
> > > The following changes since commit
> > 46f28427f6f824b6cff06fa025a55350b7de454a:
> > >
> > >   Merge tag 'drm-rcar-next-20230325' of
> > git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux into drm-=
next
> > (2023-03-27 18:20:20 +0200)
> > >
> > > are available in the Git repository at:
> > >
> > >   git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos
> > tags/exynos-drm-next-for-v6.4
> >
> > Merged, but usually all drm bridge stuff goes through drm-misc, least s=
o
> > that there's some amount of collaboration and not so much inter-tree
> > syncing.
> >
> > Please apply for drm-misc commit rights (at least a quick check shows n=
o
> > one from samsung) and land future bridge patches through that tree.
> >
> > Cheers, Daniel
>
> I will apply for drm-misc commit rights. :)
>
> Thanks,
> Inki Dae
>
> >
> > >
> > > for you to fetch changes up to b2cfec52feb3bb737c4b65018ef4bfe9789e4b=
e8:
> > >
> > >   drm: bridge: samsung-dsim: Add i.MX8M Plus support (2023-03-28 09:0=
5:41
> > +0900)
> > >
> > > ----------------------------------------------------------------
> > > A patch series for moving MIPI-DSI driver for Exynos DRM to drm/bridg=
e
> > > directory so that I.MX SoC family can also share the same device driv=
er.
> > > Samsung MIPI DSIM device is a common IP that can be used by Exynos an=
d
> > I.MX8M
> > > Mini/Nano/Plus SoC. Regarding this, this patch series has added sever=
al
> > > things below to existing MIPI DSI driver,
> > >     - Add exynos_dsi_type enum type to provide controller data from
> > different
> > >       platforms.
> > >     - Add two pipeline detection ways support - existing Exynos DSI c=
hild
> > node
> > >       and I.MX family of-graph port or ports.
> > >     - Consider component and bridged based DRM drivers.
> > >     - Add device tree binding support of I.MX family.
> > >
> > > ----------------------------------------------------------------
> > > Jagan Teki (14):
> > >       drm: exynos: dsi: Drop explicit call to bridge detach
> > >       drm: exynos: dsi: Lookup OF-graph or Child node devices
> > >       drm: exynos: dsi: Mark PHY as optional
> > >       drm: exynos: dsi: Add platform PLL_P (PMS_P) offset
> > >       drm: exynos: dsi: Introduce hw_type platform data
> > >       drm: exynos: dsi: Add atomic check
> > >       drm: exynos: dsi: Add input_bus_flags
> > >       drm: exynos: dsi: Add atomic_get_input_bus_fmts
> > >       drm: exynos: dsi: Consolidate component and bridge
> > >       drm: exynos: dsi: Add host helper for te_irq_handler
> > >       drm: bridge: Generalize Exynos-DSI driver into a Samsung DSIM b=
ridge
> > >       dt-bindings: display: exynos: dsim: Add NXP i.MX8M Mini/Nano su=
pport
> > >       drm: bridge: samsung-dsim: Add i.MX8M Mini/Nano support
> > >       dt-bindings: display: exynos: dsim: Add NXP i.MX8M Plus support
> > >
> > > Marek Szyprowski (1):
> > >       drm: exynos: dsi: Handle proper host initialization
> > >
> > > Marek Vasut (1):
> > >       drm: bridge: samsung-dsim: Add i.MX8M Plus support
> > >
> > >  .../bindings/display/exynos/exynos_dsim.txt        |    2 +
> > >  MAINTAINERS                                        |    9 +
> > >  drivers/gpu/drm/bridge/Kconfig                     |   12 +
> > >  drivers/gpu/drm/bridge/Makefile                    |    1 +
> > >  drivers/gpu/drm/bridge/samsung-dsim.c              | 1967
> > ++++++++++++++++++++
> > >  drivers/gpu/drm/exynos/Kconfig                     |    1 +
> > >  drivers/gpu/drm/exynos/exynos_drm_dsi.c            | 1813 +---------=
-------
> -
> > >  include/drm/bridge/samsung-dsim.h                  |  115 ++
> > >  8 files changed, 2191 insertions(+), 1729 deletions(-)
> > >  create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
> > >  create mode 100644 include/drm/bridge/samsung-dsim.h
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > https://protect2.fireeye.com/v1/url?k=3D7fdd2b55-1e563e63-7fdca01a-
> > 74fe485cbff1-6c2178cc05019313&q=3D1&e=3De4f34328-cc9e-48f9-80e0-
> > ec8c0c4246f2&u=3Dhttp%3A%2F%2Fblog.ffwll.ch%2F
>

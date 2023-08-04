Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C5A76F7D7
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 04:26:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B02AB10E13B;
	Fri,  4 Aug 2023 02:26:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D2E610E130
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 02:26:15 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-76731802203so122791685a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 19:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691115975; x=1691720775;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CTpwPYIEtJZhEQMyoZFlpz+eyGuIfW/wEpS8AWrCqsM=;
 b=WObKCCCmKSuLaHalMGxKJKzoB4rHBSwzFjPxUvE1DZwdVHLsCnHjzUL9HGAGQNuLwz
 sxx3LWYU2CQDntsQJpJe+X6CiGQwvomwTC6T573uga2UOEqGQGzxio8FzdnXyk1Ywr2U
 L3S2pxTU1KIWKJuPmol5ww0J6TfHb6G+/+3S1dGDZMQow/V0Zsg53hVGEqzRlXKwCSQ0
 oglKOc6rN4P3zNaXNg5NCGzn3TV434WSEgABnpTz1fvMKw59O5bBW8/gT6cqy6WT7BK6
 Fx1F9Nijbzs2viRuEse3DAImS2VBqyOLvcfikM+1RDsaTmQRhW0ID+beHYgFtNOwr1Fv
 mqvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691115975; x=1691720775;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CTpwPYIEtJZhEQMyoZFlpz+eyGuIfW/wEpS8AWrCqsM=;
 b=EXoIbNeoCcWH+JEyNZbdO0/KoYCBrPrEDkX5Jx+JuJqneoPpJKjDHu4mC9S/AEisGC
 16enqNwy6uWMUFSWtVn6GPnttGzzYOQkUAHuHAOC6fovCkSU5vMtkrVn8awPDjRkAlet
 TRfNgtonE19QP+RvJh9V5XUEj2OTHx4Sv3Jpb60/UBzTkrokKf7LWoZDyG7tvTxLJzIZ
 fTWbUgeAFgBhi4FUZcIfUOX6DWe+gDrBZtG27+Xub0dTZF3NyuGZ4h5dfK3DgFO9jT+x
 i8B3fFEodaSjXn4EQMiivnCKiqELeIj5/M9XzMWYMSgPAljOU0r2al9kJYNPsMaB8qNP
 IHkw==
X-Gm-Message-State: AOJu0Yxj3P6qJR7kSNPf/ZIQZC8VlYOBBsuffju4bbXSG8tLtAo/d/6i
 7zDA+bnai+SIebeSw+YN7No5JeEK6PAkdvRBvHA=
X-Google-Smtp-Source: AGHT+IFzsm7efu5mxOJh5yGjdaQKx5K9M96EchYul4CIs05wM29OEAS92BFCbBTOkxDZcZ52EKn1DB6i1dCMSOQWpP0=
X-Received: by 2002:a05:620a:2182:b0:76c:bc4b:92b9 with SMTP id
 g2-20020a05620a218200b0076cbc4b92b9mr578889qka.11.1691115974950; Thu, 03 Aug
 2023 19:26:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230803144227.2187749-1-nogikh@google.com>
 <CAHCN7x+8Qq6w0eRC0NwBfhgS7XH7fmmPr9xwhR54rWFNY37Ugg@mail.gmail.com>
 <9e77ccc3-07db-f1fe-ef99-981852d4772b@infradead.org>
In-Reply-To: <9e77ccc3-07db-f1fe-ef99-981852d4772b@infradead.org>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 3 Aug 2023 21:26:03 -0500
Message-ID: <CAHCN7xKG=8ygSi8st31fe+t3Mn+k-7VUHKixFCZUuuDLOX8-kQ@mail.gmail.com>
Subject: Re: drivers/gpu/drm/bridge/samsung-dsim.c link error
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Aleksandr Nogikh <nogikh@google.com>, syzkaller@googlegroups.com,
 jagan@amarulasolutions.com, dvyukov@google.com, m.szyprowski@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 3, 2023 at 9:01=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org>=
 wrote:
>
> Hi--
>
> On 8/3/23 08:24, Adam Ford wrote:
> > On Thu, Aug 3, 2023 at 9:42=E2=80=AFAM Aleksandr Nogikh <nogikh@google.=
com> wrote:
> >>
> >> Hello,
> >>
> >> We've been seing the following linker error on arm64 syzbot instances:
> >>
> >> ld.lld: error: undefined symbol: phy_mipi_dphy_get_default_config_for_=
hsclk
> >>>>> referenced by samsung-dsim.c:731 (drivers/gpu/drm/bridge/samsung-ds=
im.c:731)
> >>>>>               drivers/gpu/drm/bridge/samsung-dsim.o:(samsung_dsim_i=
nit) in archive vmlinux.a
> >>
> >> Steps to reproduce on the latest linux-next:
> >>
> >> $ git checkout next-20230803
> >> $ wget -O '.config' 'https://raw.githubusercontent.com/google/syzkalle=
r/master/dashboard/config/linux/upstream-arm64-kasan.config'
> >> $ make CC=3Dclang ARCH=3Darm64 LD=3Dld.lld CROSS_COMPILE=3Daarch64-lin=
ux-gnu- olddefconfig
> >>
> >> This also prints:
> >>
> >> WARNING: unmet direct dependencies detected for GENERIC_PHY_MIPI_DPHY
> >>   Depends on [n]: GENERIC_PHY [=3Dn]
> >>   Selected by [y]:
> >>   - DRM_NWL_MIPI_DSI [=3Dy] && DRM_BRIDGE [=3Dy] && DRM [=3Dy] && COMM=
ON_CLK [=3Dy] && OF [=3Dy] && HAS_IOMEM [=3Dy]
> >>   - DRM_SAMSUNG_DSIM [=3Dy] && DRM [=3Dy] && DRM_BRIDGE [=3Dy] && COMM=
ON_CLK [=3Dy] && OF [=3Dy] && HAS_IOMEM [=3Dy]
> >>
> >> $ make CC=3Dclang ARCH=3Darm64 LD=3Dld.lld CROSS_COMPILE=3Daarch64-lin=
ux-gnu- -j$(nproc)
> >>
> >> The kernel should have still compiled fine even despite the message ab=
ove, right?
>
> No. See drivers/Makefile:
> obj-$(CONFIG_GENERIC_PHY)       +=3D phy/
>
> so the drivers/phy/ subdir is only built when CONFIG_GENERIC_PHY is set,
> but it's not set.
>
> >> Could you please take a look?
> >
> > GENERIC_PHY_MIPI_DPHY was enabled to use
> > phy_mipi_dphy_get_default_config() which takes in the pixel clock,
> > bits-per-pixel, number of lanes and phy structure.  It applies a bunch
> > of math based on the info passed and fills in the structure, but that
> > function itself doesn't appear to be referencing phy code, so it's
> > likely safe.
> >
> > I think this can be resolved by enabling GENERIC_PHY.  I just checked
> > linux-next and when I built the arm64 defconfig, it enables
> > GENERIC_PHY=3Dy, so I don't think this is an issue.  I also checked the
>
> defconfig doesn't matter in this case. The .config that was provided has:
> # CONFIG_GENERIC_PHY is not set
> CONFIG_GENERIC_PHY_MIPI_DPHY=3Dy
>

Where/how was the .config generated?

Are you building linux-next or something else?  The .config file
generated when I build the arm64 defconfig  show both enabled:

$ grep GENERIC_PHY .config
CONFIG_GENERIC_PHY=3Dy
CONFIG_GENERIC_PHY_MIPI_DPHY=3Dy


> but yes, selecting GENERIC_PHY (needed in 3 places) does fix the warnings
> and build error.  2 instance in drm/bridge/Kconfig and one in
> drm/bridge/cadence/Kconfig (found by inspection).
>
>
>
> > multi_v7_defconfig for ARM and it also sets GENERIC_PHY=3Dy for 32-bit
> > ARM people using some of the Exynos boards.
> >
> > I don't know what version of Linux you're trying to build, but I can't
> > replicate your issue.
>
> I had no problem replicating the kconfig warnings and build error.

If you can replicate the problem, I'd suggest submitting a patch.

adam
>
> --
> ~Randy

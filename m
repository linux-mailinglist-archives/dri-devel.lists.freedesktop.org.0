Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A63176F7F0
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 04:42:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CABCE10E188;
	Fri,  4 Aug 2023 02:42:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5A510E188
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 02:42:53 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-26814f65d7fso908834a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 19:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691116973; x=1691721773;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SaU132AsVWTNpVn9AAedpCpeKo8rmE5ysTz6Gn+cdGk=;
 b=a24flyY4LVxUQEurTyMLb4nEQbhBcMQnwaZMqB8g/AhIjtV75KquLrY2f2Rlmf186/
 NzLA8L5GGprH/QXl+iYAsPxb5xr9env3kcow7qu9sWMUXmGxt0CpJEcLXri9TWDm7+zD
 L5jnKUQDLHkSC5Fxj+emTNAjGhv8pe8y/6dkVgcqgJQpPLx7Ale6wtjDkvIENoyuSMrV
 9Jqpal4xnu9GJQKM00ZiVRn5cldfGeXO1StSM5pJC2Fulu9koI0nSoXa7Y2KrUNGg2aj
 VE9L6Gci87NM/sgNr2h2W85XuY+eDZfjVlciH8tGMlkWTzgcpWc8hPV5d68Mlf0u3uTU
 1pzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691116973; x=1691721773;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SaU132AsVWTNpVn9AAedpCpeKo8rmE5ysTz6Gn+cdGk=;
 b=PwqU6yZJo1uRhixkLyLrF/ZuHd2XhUA8TzGBk7bLMne5oopc2xhHHD+yW5TLTcCxsm
 rJ6cW8uOpwTivzQOsFdilExv2SERoF8E1/k1X4wdw6NVf5myuC510yI44pvT3A+DynjV
 69SIgARPGqdLiVVcjNALXeO92/L6D8oFjytQ2VnKNfT7Rf+6tva14UqbrZEghLYNz+Tt
 DG6ysaWPyreVcIglXPImdefQntPtF3lS4VDmyuE0AHdEO2+C71TLyFyDHmRIH8CwKJbO
 HYkNviGiVS+0aiNt6GitZDaHPfOb6gnL476kHQCMGcEfqCfqW+SFYMUOFVjy4VZphSjF
 92HA==
X-Gm-Message-State: AOJu0Yzrs4G6417/8FTkqVc7K2+LdW6mhHWuTrvCCARyUIyt6tZZ59PU
 WVQGVUTWO9L88QK0wosLFaGG2MaIf4nW2ziF6Qw6e6iQ
X-Google-Smtp-Source: AGHT+IEUGyvzmFvMLOR7ZEhxrnvUObzTuvnWYWvE6k85qmnnKqVqBrGY4OutqH1PHZ3PbKjKKtoVlGGGXtxc0f52dpM=
X-Received: by 2002:a17:90b:4b0f:b0:268:4df5:8b29 with SMTP id
 lx15-20020a17090b4b0f00b002684df58b29mr437297pjb.19.1691116972532; Thu, 03
 Aug 2023 19:42:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230803144227.2187749-1-nogikh@google.com>
 <CAHCN7x+8Qq6w0eRC0NwBfhgS7XH7fmmPr9xwhR54rWFNY37Ugg@mail.gmail.com>
 <9e77ccc3-07db-f1fe-ef99-981852d4772b@infradead.org>
 <CAHCN7xKG=8ygSi8st31fe+t3Mn+k-7VUHKixFCZUuuDLOX8-kQ@mail.gmail.com>
 <d8a57aee-bb8a-dc5a-7c4f-b8a293d37bec@infradead.org>
In-Reply-To: <d8a57aee-bb8a-dc5a-7c4f-b8a293d37bec@infradead.org>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 3 Aug 2023 21:42:41 -0500
Message-ID: <CAHCN7xKnRAmKh60dAtVaxz-dQtjzhBNtS0aN2swmddfo5FAD-Q@mail.gmail.com>
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

On Thu, Aug 3, 2023 at 9:37=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org>=
 wrote:
>
>
>
> On 8/3/23 19:26, Adam Ford wrote:
> > On Thu, Aug 3, 2023 at 9:01=E2=80=AFPM Randy Dunlap <rdunlap@infradead.=
org> wrote:
> >>
> >> Hi--
> >>
> >> On 8/3/23 08:24, Adam Ford wrote:
> >>> On Thu, Aug 3, 2023 at 9:42=E2=80=AFAM Aleksandr Nogikh <nogikh@googl=
e.com> wrote:
> >>>>
> >>>> Hello,
> >>>>
> >>>> We've been seing the following linker error on arm64 syzbot instance=
s:
> >>>>
> >>>> ld.lld: error: undefined symbol: phy_mipi_dphy_get_default_config_fo=
r_hsclk
> >>>>>>> referenced by samsung-dsim.c:731 (drivers/gpu/drm/bridge/samsung-=
dsim.c:731)
> >>>>>>>               drivers/gpu/drm/bridge/samsung-dsim.o:(samsung_dsim=
_init) in archive vmlinux.a
> >>>>
> >>>> Steps to reproduce on the latest linux-next:
> >>>>
> >>>> $ git checkout next-20230803
> >>>> $ wget -O '.config' 'https://raw.githubusercontent.com/google/syzkal=
ler/master/dashboard/config/linux/upstream-arm64-kasan.config'
> >>>> $ make CC=3Dclang ARCH=3Darm64 LD=3Dld.lld CROSS_COMPILE=3Daarch64-l=
inux-gnu- olddefconfig
> >>>>
> >>>> This also prints:
> >>>>
> >>>> WARNING: unmet direct dependencies detected for GENERIC_PHY_MIPI_DPH=
Y
> >>>>   Depends on [n]: GENERIC_PHY [=3Dn]
> >>>>   Selected by [y]:
> >>>>   - DRM_NWL_MIPI_DSI [=3Dy] && DRM_BRIDGE [=3Dy] && DRM [=3Dy] && CO=
MMON_CLK [=3Dy] && OF [=3Dy] && HAS_IOMEM [=3Dy]
> >>>>   - DRM_SAMSUNG_DSIM [=3Dy] && DRM [=3Dy] && DRM_BRIDGE [=3Dy] && CO=
MMON_CLK [=3Dy] && OF [=3Dy] && HAS_IOMEM [=3Dy]
> >>>>
> >>>> $ make CC=3Dclang ARCH=3Darm64 LD=3Dld.lld CROSS_COMPILE=3Daarch64-l=
inux-gnu- -j$(nproc)
> >>>>
> >>>> The kernel should have still compiled fine even despite the message =
above, right?
> >>
> >> No. See drivers/Makefile:
> >> obj-$(CONFIG_GENERIC_PHY)       +=3D phy/
> >>
> >> so the drivers/phy/ subdir is only built when CONFIG_GENERIC_PHY is se=
t,
> >> but it's not set.
> >>
> >>>> Could you please take a look?
> >>>
> >>> GENERIC_PHY_MIPI_DPHY was enabled to use
> >>> phy_mipi_dphy_get_default_config() which takes in the pixel clock,
> >>> bits-per-pixel, number of lanes and phy structure.  It applies a bunc=
h
> >>> of math based on the info passed and fills in the structure, but that
> >>> function itself doesn't appear to be referencing phy code, so it's
> >>> likely safe.
> >>>
> >>> I think this can be resolved by enabling GENERIC_PHY.  I just checked
> >>> linux-next and when I built the arm64 defconfig, it enables
> >>> GENERIC_PHY=3Dy, so I don't think this is an issue.  I also checked t=
he
> >>
> >> defconfig doesn't matter in this case. The .config that was provided h=
as:
> >> # CONFIG_GENERIC_PHY is not set
> >> CONFIG_GENERIC_PHY_MIPI_DPHY=3Dy
> >>
> >
> > Where/how was the .config generated?
> >
>
> Aleksandr posted a link to the config file above.

I get that, but I am not sure how this was generated.

>
> > Are you building linux-next or something else?  The .config file
> > generated when I build the arm64 defconfig  show both enabled:
>
> linux-next.
>
>
> > $ grep GENERIC_PHY .config
> > CONFIG_GENERIC_PHY=3Dy
> > CONFIG_GENERIC_PHY_MIPI_DPHY=3Dy
> >
>
> Yes, this is not a defconfig file.

I know, but it is a .config file that is generated from make defconfig
ARCH=3Darm64
>
> >
> >> but yes, selecting GENERIC_PHY (needed in 3 places) does fix the warni=
ngs
> >> and build error.  2 instance in drm/bridge/Kconfig and one in
> >> drm/bridge/cadence/Kconfig (found by inspection).
> >>
> >>
> >>
> >>> multi_v7_defconfig for ARM and it also sets GENERIC_PHY=3Dy for 32-bi=
t
> >>> ARM people using some of the Exynos boards.
> >>>
> >>> I don't know what version of Linux you're trying to build, but I can'=
t
> >>> replicate your issue.
> >>
> >> I had no problem replicating the kconfig warnings and build error.
> >
> > If you can replicate the problem, I'd suggest submitting a patch.
>
> Sure, I'll do that.

Great!  thanks.

adam
>
> --
> ~Randy

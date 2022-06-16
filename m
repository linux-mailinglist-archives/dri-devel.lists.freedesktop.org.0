Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED58854D869
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 04:35:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF14113B78;
	Thu, 16 Jun 2022 02:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54BFC10F304;
 Thu, 16 Jun 2022 02:34:59 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id p129so367566oig.3;
 Wed, 15 Jun 2022 19:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Z+baxgZVjyFXn6w264zRymr+l4Ymj2TLezhZxUKrmHM=;
 b=F/yCITmzFs0hg4SkLRaXumjGJXAS4ZBbtKjQIOZom/YSp1ADvlCB4w9hT2GdHxJ5r+
 YHWq6vPSOMnGFh6GhmiTjTgzc40+WiotLlOdUy/Q6lrWpf2Aqxl6fBXZgbwZ9sDlSNfd
 cogu2b0diJfKNZkTJbqLiaFUdgV/TrCVZu/T3HcJ2OKNtgx3cEjCjElHczQ1tjAqmU//
 ATn8mM6y2W8bJUtzsoeL0OsVrekw7jDakarEzJhl/+IRddFyNTxTKkkOVhisws+d6Ss0
 jPXVygEt5I0NgeGWinbuQhCN0XbIBYasmDGJ8fJHfTOVHB59+8ELJu81SmCg3ZxgNOSW
 UR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Z+baxgZVjyFXn6w264zRymr+l4Ymj2TLezhZxUKrmHM=;
 b=Sdw2U5b46huQRJgJxc6CGO6p+Qd57xWFlvPSEOjAy2BspGvIGBxP88aY3TWI7QwiK4
 orkxOsQeU3iqY6OvHEnQRNSHNg3OIdGCWV6Ws6Bzq5LiDcbzmcRpPMdgHQnxVG9W9FOU
 WJVlo2wEN4FDzfb18Zit/xmlpxyYzSdb0hBscmxzBzAHHBHCpUEvoZBdYI+WYKHNNfLX
 q7iOBCHe1q2pC0PhpDn6duHUjRXEmv9+9xRG0ZBXvZesebS+OkxgP0oGhXT5t5/wBYct
 gyhxngcB1SVHacnKAgxMNeXaERwMgOBkOAcXpwAx0eFUh+b8cXMKuqhhiru24D+v+hfc
 lFnw==
X-Gm-Message-State: AJIora9co1bYInnUoRDmChFQpA3u3prHw4EJTaLDEMkQRiHhl0icZzXM
 yfGUPGZaa6OEUeU6YGdiyo963Y8m37owA3aNWBs=
X-Google-Smtp-Source: AGRyM1tr2sCkLpCfF2HxNSytPyXlzPTkZQJm0Ghb609cKKhF1uG0xIrf+QbQYOJ7vekovMm2LGhy8d8JD2u4k/Od5q4=
X-Received: by 2002:a05:6808:23c6:b0:331:3ab2:6fb9 with SMTP id
 bq6-20020a05680823c600b003313ab26fb9mr1401221oib.200.1655346898632; Wed, 15
 Jun 2022 19:34:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220615160116.528c324b@canb.auug.org.au>
 <d1a48a84-6d07-e8f7-5fd8-d24a7a1cf187@infradead.org>
 <CADnq5_N6gfaPfZJAX4+poWFFruxNdFKZqzXZXosj1A55e-O1mA@mail.gmail.com>
 <YqpACmvbwiEcUfta@dev-arch.thelio-3990X>
 <CADnq5_OnrxUiM+aTWRLjixp=vY6adV3w4p2cfTkdS32uq_UsiQ@mail.gmail.com>
 <YqpGknQvigfwZU6b@dev-arch.thelio-3990X>
 <20220616092628.7cd86f4c@canb.auug.org.au>
In-Reply-To: <20220616092628.7cd86f4c@canb.auug.org.au>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 15 Jun 2022 22:34:47 -0400
Message-ID: <CADnq5_OBCaYgrQDpX7x9VH9SQ2XcH8LhY4VTSiB7qX8J9nt+ZQ@mail.gmail.com>
Subject: Re: linux-next: Tree for Jun 15
 (drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c)
To: Stephen Rothwell <sfr@canb.auug.org.au>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, Jani Nikula <jani.nikula@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pushed to drm-misc-next.

Alex

On Wed, Jun 15, 2022 at 7:26 PM Stephen Rothwell <sfr@canb.auug.org.au> wro=
te:
>
> Hi all,
>
> On Wed, 15 Jun 2022 13:52:34 -0700 Nathan Chancellor <nathan@kernel.org> =
wrote:
> >
> > On Wed, Jun 15, 2022 at 04:45:16PM -0400, Alex Deucher wrote:
> > > On Wed, Jun 15, 2022 at 4:24 PM Nathan Chancellor <nathan@kernel.org>=
 wrote:
> > > >
> > > > On Wed, Jun 15, 2022 at 03:28:52PM -0400, Alex Deucher wrote:
> > > > > On Wed, Jun 15, 2022 at 3:01 PM Randy Dunlap <rdunlap@infradead.o=
rg> wrote:
> > > > > >
> > > > > >
> > > > > >
> > > > > > On 6/14/22 23:01, Stephen Rothwell wrote:
> > > > > > > Hi all,
> > > > > > >
> > > > > > > Changes since 20220614:
> > > > > > >
> > > > > >
> > > > > > on i386:
> > > > > > # CONFIG_DEBUG_FS is not set
> > > > > >
> > > > > >
> > > > > > ../drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:=
 In function =E2=80=98amdgpu_dm_crtc_late_register=E2=80=99:
> > > > > > ../drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:=
6599:2: error: implicit declaration of function =E2=80=98crtc_debugfs_init=
=E2=80=99; did you mean =E2=80=98amdgpu_debugfs_init=E2=80=99? [-Werror=3Di=
mplicit-function-declaration]
> > > > > >   crtc_debugfs_init(crtc);
> > > > > >   ^~~~~~~~~~~~~~~~~
> > > > > >   amdgpu_debugfs_init
> > > > > >
> > > > > >
> > > > > > Full randconfig file is attached.
> > > > >
> > > > > I tried building with your config and I can't repro this.  As Har=
ry
> > > > > noted, that function and the whole secure display feature depend =
on
> > > > > debugfs.  It should never be built without CONFIG_DEBUG_FS.  See
> > > > > drivers/gpu/drm/amd/display/Kconfig:
> > > > >
> > > > > > config DRM_AMD_SECURE_DISPLAY
> > > > > >         bool "Enable secure display support"
> > > > > >         default n
> > > > > >         depends on DEBUG_FS
> > > > > >         depends on DRM_AMD_DC_DCN
> > > > > >         help
> > > > > >             Choose this option if you want to
> > > > > >             support secure display
> > > > > >
> > > > > >             This option enables the calculation
> > > > > >             of crc of specific region via debugfs.
> > > > > >             Cooperate with specific DMCU FW.
> > > > >
> > > > > amdgpu_dm_crtc_late_register is guarded by
> > > > > CONIG_DRM_AMD_SECURE_DISPLAY.  It's not clear to me how we could =
hit
> > > > > this.
> > > >
> > > > I think the problem is that you are not looking at the right tree.
> > > >
> > > > The kernel test robot reported [1] [2] this error is caused by comm=
it
> > > > 4cd79f614b50 ("drm/amd/display: Move connector debugfs to drm"), wh=
ich
> > > > is in the drm-misc tree on the drm-misc-next branch. That change re=
moves
> > > > the #ifdef around amdgpu_dm_crtc_late_register(), meaning that
> > > > crtc_debugfs_init() can be called without CONFIG_DRM_AMD_SECURE_DIS=
PLAY
> > > > and CONFIG_DEBUG_FS.
> > > >
> > > >   $ git show -s --format=3D'%h ("%s")'
> > > >   abf0ba5a34ea ("drm/bridge: it6505: Add missing CRYPTO_HASH depend=
ency")
> > > >
> > > >   $ make -skj"$(nproc)" ARCH=3Dx86_64 mrproper defconfig
> > > >
> > > >   $ scripts/config -d BLK_DEV_IO_TRACE -d DEBUG_FS -e DRM_AMDGPU
> > > >
> > > >   $ make -skj"$(nproc)" ARCH=3Dx86_64 olddefconfig drivers/gpu/drm/=
amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.o
> > > >   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In f=
unction =E2=80=98amdgpu_dm_crtc_late_register=E2=80=99:
> > > >   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6622:=
9: error: implicit declaration of function =E2=80=98crtc_debugfs_init=E2=80=
=99; did you mean =E2=80=98amdgpu_debugfs_init=E2=80=99? [-Werror=3Dimplici=
t-function-declaration]
> > > >    6622 |         crtc_debugfs_init(crtc);
> > > >         |         ^~~~~~~~~~~~~~~~~
> > > >         |         amdgpu_debugfs_init
> > > >   cc1: all warnings being treated as errors
> > > >
> > > > Contrast that with the current top of your tree:
> > > >
> > > >   $ git show -s --format=3D'%h ("%s")'
> > > >   c435f61d0eb3 ("drm/amd/display: Drop unnecessary guard from DC re=
source")
> > > >
> > > >   $ make -skj"$(nproc)" ARCH=3Dx86_64 mrproper defconfig
> > > >
> > > >   $ scripts/config -d BLK_DEV_IO_TRACE -d DEBUG_FS -e DRM_AMDGPU
> > > >
> > > >   $ make -skj"$(nproc)" ARCH=3Dx86_64 olddefconfig drivers/gpu/drm/=
amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.o
> > > >
> > > >   $ echo $?
> > > >   0
> > > >
> > > > Randy's patch [3] seems like it should resolve the issue just fine =
but
> > > > it needs to be applied to drm-misc-next, not the amdgpu tree.
> > >
> > > Thanks for tracking this down.  I think something like the attached
> > > patch is cleaner since the whole thing is only valid for debugfs.
> >
> > Makes sense! I tested the below patch with and without DEBUG_FS and saw
> > no errors.
> >
> > > From b0bcacd86344998e0ca757f89c6c4cd3b6298999 Mon Sep 17 00:00:00 200=
1
> > > From: Alex Deucher <alexander.deucher@amd.com>
> > > Date: Wed, 15 Jun 2022 16:40:39 -0400
> > > Subject: [PATCH] drm/amdgpu/display: fix build when CONFIG_DEBUG_FS i=
s not set
> > >
> > > amdgpu_dm_crtc_late_register is only used when CONFIG_DEBUG_FS
> > > so make it dependent on that.
> > >
> > > Fixes: 4cd79f614b50 ("drm/amd/display: Move connector debugfs to drm"=
)
> > > Reported-by: Randy Dunlap <rdunlap@infradead.org>
> > > Reported-by: Nathan Chancellor <nathan@kernel.org>
> >
> > Tested-by: Nathan Chancellor <nathan@kernel.org> # build
> >
> > > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > > ---
> > >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/driv=
ers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > index c9004f7e700d..33cd7a3d4ecb 100644
> > > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > @@ -6594,12 +6594,14 @@ dm_crtc_duplicate_state(struct drm_crtc *crtc=
)
> > >     return &state->base;
> > >  }
> > >
> > > +#ifdef CONFIG_DEBUG_FS
> > >  static int amdgpu_dm_crtc_late_register(struct drm_crtc *crtc)
> > >  {
> > >     crtc_debugfs_init(crtc);
> > >
> > >     return 0;
> > >  }
> > > +#endif
> > >
> > >  static inline int dm_set_vupdate_irq(struct drm_crtc *crtc, bool ena=
ble)
> > >  {
> > > @@ -6693,7 +6695,9 @@ static const struct drm_crtc_funcs amdgpu_dm_cr=
tc_funcs =3D {
> > >     .enable_vblank =3D dm_enable_vblank,
> > >     .disable_vblank =3D dm_disable_vblank,
> > >     .get_vblank_timestamp =3D drm_crtc_vblank_helper_get_vblank_times=
tamp,
> > > +#if defined(CONFIG_DEBUG_FS)
> > >     .late_register =3D amdgpu_dm_crtc_late_register,
> > > +#endif
> > >  };
> > >
> > >  static enum drm_connector_status
>
> OK, I will apply that patch to the merge of the drm-misc tree from
> today (until someone actaully applies it to some tree).
> --
> Cheers,
> Stephen Rothwell

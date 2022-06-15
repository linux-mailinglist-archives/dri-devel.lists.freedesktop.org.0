Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D81854D277
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 22:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496D210E270;
	Wed, 15 Jun 2022 20:24:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7A3A112CD1;
 Wed, 15 Jun 2022 20:24:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0EB51B82173;
 Wed, 15 Jun 2022 20:24:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 109CDC3411B;
 Wed, 15 Jun 2022 20:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655324684;
 bh=XK636mdXdT1uGqQeknFaYJJJ7lcdHw6ppBm0gfvPEw0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WPNRXrH6ueN30M5V0s+H/8D+ImKS6tmkzsFra+OXWTW+gXJ5Rr5ZmIXpXfXKiNZsP
 Eoaxbzkl4OIT8mtPQuRKzHf3g9G1V+JlrTpYO+IwfUF/XO7mAtmR5dYwO3Se0itpQQ
 Kogp8viN7kZZr1bGac6ks+BngLbz6BYZJycF9Cup5XS3wRrPo+eQ/BmpAv2qd96+BN
 xkgt9P9+F1FJ3glPx1jks4UcB2CeuCsEKTJJwkqzyfJkvizbGVG7HegwFABNZRNbgC
 ZVfz7tRokgNKuQNaDXvKudBfa/UNHIMhKRhmFT9SQR968jun25HAYyhDusWt61MsGl
 QjEyAsWzLLDUg==
Date: Wed, 15 Jun 2022 13:24:42 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: linux-next: Tree for Jun 15
 (drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c)
Message-ID: <YqpACmvbwiEcUfta@dev-arch.thelio-3990X>
References: <20220615160116.528c324b@canb.auug.org.au>
 <d1a48a84-6d07-e8f7-5fd8-d24a7a1cf187@infradead.org>
 <CADnq5_N6gfaPfZJAX4+poWFFruxNdFKZqzXZXosj1A55e-O1mA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_N6gfaPfZJAX4+poWFFruxNdFKZqzXZXosj1A55e-O1mA@mail.gmail.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Randy Dunlap <rdunlap@infradead.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 15, 2022 at 03:28:52PM -0400, Alex Deucher wrote:
> On Wed, Jun 15, 2022 at 3:01 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> >
> >
> >
> > On 6/14/22 23:01, Stephen Rothwell wrote:
> > > Hi all,
> > >
> > > Changes since 20220614:
> > >
> >
> > on i386:
> > # CONFIG_DEBUG_FS is not set
> >
> >
> > ../drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function ‘amdgpu_dm_crtc_late_register’:
> > ../drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6599:2: error: implicit declaration of function ‘crtc_debugfs_init’; did you mean ‘amdgpu_debugfs_init’? [-Werror=implicit-function-declaration]
> >   crtc_debugfs_init(crtc);
> >   ^~~~~~~~~~~~~~~~~
> >   amdgpu_debugfs_init
> >
> >
> > Full randconfig file is attached.
> 
> I tried building with your config and I can't repro this.  As Harry
> noted, that function and the whole secure display feature depend on
> debugfs.  It should never be built without CONFIG_DEBUG_FS.  See
> drivers/gpu/drm/amd/display/Kconfig:
> 
> > config DRM_AMD_SECURE_DISPLAY
> >         bool "Enable secure display support"
> >         default n
> >         depends on DEBUG_FS
> >         depends on DRM_AMD_DC_DCN
> >         help
> >             Choose this option if you want to
> >             support secure display
> >
> >             This option enables the calculation
> >             of crc of specific region via debugfs.
> >             Cooperate with specific DMCU FW.
> 
> amdgpu_dm_crtc_late_register is guarded by
> CONIG_DRM_AMD_SECURE_DISPLAY.  It's not clear to me how we could hit
> this.

I think the problem is that you are not looking at the right tree.

The kernel test robot reported [1] [2] this error is caused by commit
4cd79f614b50 ("drm/amd/display: Move connector debugfs to drm"), which
is in the drm-misc tree on the drm-misc-next branch. That change removes
the #ifdef around amdgpu_dm_crtc_late_register(), meaning that
crtc_debugfs_init() can be called without CONFIG_DRM_AMD_SECURE_DISPLAY
and CONFIG_DEBUG_FS.

  $ git show -s --format='%h ("%s")'
  abf0ba5a34ea ("drm/bridge: it6505: Add missing CRYPTO_HASH dependency")

  $ make -skj"$(nproc)" ARCH=x86_64 mrproper defconfig

  $ scripts/config -d BLK_DEV_IO_TRACE -d DEBUG_FS -e DRM_AMDGPU

  $ make -skj"$(nproc)" ARCH=x86_64 olddefconfig drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.o
  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function ‘amdgpu_dm_crtc_late_register’:
  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6622:9: error: implicit declaration of function ‘crtc_debugfs_init’; did you mean ‘amdgpu_debugfs_init’? [-Werror=implicit-function-declaration]
   6622 |         crtc_debugfs_init(crtc);
        |         ^~~~~~~~~~~~~~~~~
        |         amdgpu_debugfs_init
  cc1: all warnings being treated as errors

Contrast that with the current top of your tree:

  $ git show -s --format='%h ("%s")'
  c435f61d0eb3 ("drm/amd/display: Drop unnecessary guard from DC resource")

  $ make -skj"$(nproc)" ARCH=x86_64 mrproper defconfig

  $ scripts/config -d BLK_DEV_IO_TRACE -d DEBUG_FS -e DRM_AMDGPU

  $ make -skj"$(nproc)" ARCH=x86_64 olddefconfig drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.o

  $ echo $?
  0

Randy's patch [3] seems like it should resolve the issue just fine but
it needs to be applied to drm-misc-next, not the amdgpu tree.

[1]: https://lore.kernel.org/202205241843.8EWKesIA-lkp@intel.com/
[2]: https://lore.kernel.org/202205240207.KmDLuSrC-lkp@intel.com/
[3]: https://lore.kernel.org/20220614155726.26211-1-rdunlap@infradead.org/

Cheers,
Nathan

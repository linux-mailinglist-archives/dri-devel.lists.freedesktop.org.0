Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A54C464E32
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 13:49:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E251C6EC4A;
	Wed,  1 Dec 2021 12:49:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta-p8.oit.umn.edu (mta-p8.oit.umn.edu [134.84.196.208])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6209B6E5BF
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 12:49:02 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p8.oit.umn.edu (Postfix) with ESMTP id 4J3zRc2GLtz9vfDC
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 12:49:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uJ13DkAZaqrw for <dri-devel@lists.freedesktop.org>;
 Wed,  1 Dec 2021 06:49:00 -0600 (CST)
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 4J3zRb64cCz9vfDG
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 06:48:59 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p8.oit.umn.edu 4J3zRb64cCz9vfDG
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 4J3zRb64cCz9vfDG
Received: by mail-yb1-f198.google.com with SMTP id
 l28-20020a25b31c000000b005c27dd4987bso35751338ybj.18
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Dec 2021 04:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rjbyT9NQvKb0PdUVyrC25UNpdX/h6dETHfgi+DE81Ts=;
 b=WqZQONy8PbitUhLhnn+RUv/Fl0mrvzL8Y+DqTvxvY4CmDAkeZn9UTqgO788+5M22LV
 ++urKOeSB7DLLff5bSutYuFPfgi7c2So0aDjMBbbnO2rxR996QqxdvNF7UOnkw2x29dz
 Cc1rRmGnGbj/vafEdMu7OYA+Ayz0jE0Hbyv69qjCHfp2A9l7H4CcRP/9pFuns2qjXM6+
 6CVeA2O2zJxxAPkjRhe07UEGR9LdjYcUS1elU/g5rEXVJlD35+Nv5iw/thBz9KAAgVN9
 yuofmGEhMxF1n/yRY6IPjgcrJJ8IRwzOwjpcZRAjVnlRA9rz+uBf+e2XodxAHk6qNrvT
 YI/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rjbyT9NQvKb0PdUVyrC25UNpdX/h6dETHfgi+DE81Ts=;
 b=wZ+hs7QoNtGgnpPZp9+PHAb92J4rCk1XXdveoX8zg9Y+oc/3LFH5vpZoq5Netvitll
 AfD0P/dpN31Sf5GRpHUN5C/TY1HFR8cg6FUnFqbyyR61RF8XoppA74Yk49/SzgnmHvjC
 Os6vFl14sGjLQT09qzZ5TdKHo+GG+FbmyMrIvbfqqyMtQm6ajyQdLuZ9lSvhn/Ys1f/x
 lVQm4TrTci85mWYhSFnCu1/bn3T8rR7XoksCZ+SHQtpM7iTNC8knRMD1WuE74GH8hcLl
 D1uDn93r5ylThVfc4FgjmrP4k0LZV5RiLvNlCaz/a06cw1/KklUKpmuo/YnXj8OOPSyF
 VANw==
X-Gm-Message-State: AOAM531LX4+NP6VCqXcitTzbkZbP2NDzsuclIzuXSj2x0vCZWe7sH4it
 zotWQl5MkT2LEvYQ4z9OxcHVFigCcTv4I17pDLRk6oNulcItej8cjibXBpF9fMb0JLmTYvrIlsC
 t5BvDQJTjfZOpI7M3aC2SVtu3tZSF2EpBy8dqyABHVTMyAElZ
X-Received: by 2002:a25:a362:: with SMTP id d89mr7548712ybi.664.1638362938719; 
 Wed, 01 Dec 2021 04:48:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwYcaMDyPNC1ykvENp+7Nx+fv4wu+rvGS7Kqwoi55CqPKjwYiLRvHMQaRJ5yqbQ+g+kx60vDOk2RNzuVGOr0MA=
X-Received: by 2002:a25:a362:: with SMTP id d89mr7548665ybi.664.1638362938382; 
 Wed, 01 Dec 2021 04:48:58 -0800 (PST)
MIME-Version: 1.0
References: <20211130155720.178214-1-zhou1615@umn.edu>
 <20211201032214.26889-1-zhou1615@umn.edu>
 <d7c890d8-9535-b349-0c28-b08e5074f714@amd.com>
In-Reply-To: <d7c890d8-9535-b349-0c28-b08e5074f714@amd.com>
From: Qingyang Zhou <zhou1615@umn.edu>
Date: Wed, 1 Dec 2021 20:48:47 +0800
Message-ID: <CA+Cm_xRjYWun_u7rod9X=c0-WExb798TLGJ6fMJMBqOMxAeuHw@mail.gmail.com>
Subject: Re: [PATCH v4] drm/radeon/radeon_kms: Fix a NULL pointer dereference
 in radeon_driver_open_kms()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: multipart/alternative; boundary="000000000000f4b31205d21518b3"
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
Cc: kernel test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Kangjie Lu <kjlu@umn.edu>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000f4b31205d21518b3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christian:

The warning is from the kernel test robot, I quote it here. The key point
is that vm may be used in radeon_vm_fini(rdev, vm) without initialization.
Although it is not possible in practice, I still add initializations to
silence the warning of llvm.

---------- Forwarded message ---------
From: kernel test robot <lkp@intel.com>
Date: Wed, Dec 1, 2021 at 4:32 AM
Subject: drivers/gpu/drm/radeon/radeon_kms.c:672:7: warning: variable 'vm'
is used uninitialized whenever 'if' condition is false
To: Zhou Qingyang <zhou1615@umn.edu>
Cc: <llvm@lists.linux.dev>, <kbuild-all@lists.01.org>, <
linux-kernel@vger.kernel.org>, 0day robot <lkp@intel.com>


tree:
https://github.com/0day-ci/linux/commits/UPDATE-20211130-233655/Zhou-Qingya=
ng/drm-radeon-radeon_kms-Fix-a-NULL-pointer-dereference-in-radeon_driver_op=
en_kms/20211130-231509
head:   123fb3d217e89c4388fdb08b63991bac7c324219
commit: 123fb3d217e89c4388fdb08b63991bac7c324219 drm/radeon/radeon_kms: Fix
a NULL pointer dereference in radeon_driver_open_kms()
date:   5 hours ago
config: mips-randconfig-r014-20211128 (
https://download.01.org/0day-ci/archive/20211201/202112010420.xkXHciHS-lkp@=
intel.com/config
)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project
 25eb7fa01d7ebbe67648ea03841cda55b4239ab2)
reproduce (this is a W=3D1 build):
        wget
https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O
~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        #
https://github.com/0day-ci/linux/commit/123fb3d217e89c4388fdb08b63991bac7c3=
24219
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review
UPDATE-20211130-233655/Zhou-Qingyang/drm-radeon-radeon_kms-Fix-a-NULL-point=
er-dereference-in-radeon_driver_open_kms/20211130-231509
        git checkout 123fb3d217e89c4388fdb08b63991bac7c324219
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=3D=
1
O=3Dbuild_dir ARCH=3Dmips SHELL=3D/bin/bash drivers/gpu/drm/radeon/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/radeon/radeon_kms.c:672:7: warning: variable 'vm' is
used uninitialized whenever 'if' condition is false
[-Wsometimes-uninitialized]
                   if (rdev->accel_working) {
                       ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_kms.c:705:23: note: uninitialized use
occurs here
           radeon_vm_fini(rdev, vm);
                                ^~
   drivers/gpu/drm/radeon/radeon_kms.c:672:3: note: remove the 'if' if its
condition is always true
                   if (rdev->accel_working) {
                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_kms.c:664:6: warning: variable 'vm' is
used uninitialized whenever 'if' condition is false
[-Wsometimes-uninitialized]
           if (rdev->family >=3D CHIP_CAYMAN) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_kms.c:705:23: note: uninitialized use
occurs here
           radeon_vm_fini(rdev, vm);
                                ^~
   drivers/gpu/drm/radeon/radeon_kms.c:664:2: note: remove the 'if' if its
condition is always true
           if (rdev->family >=3D CHIP_CAYMAN) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_kms.c:653:22: note: initialize the
variable 'vm' to silence this warning
           struct radeon_vm *vm;
                               ^
                                =3D NULL
   2 warnings generated.


vim +672 drivers/gpu/drm/radeon/radeon_kms.c

771fe6b912fca54 Jerome Glisse      2009-06-05  638
f482a1419545ded Alex Deucher       2012-07-17  639  /**
f482a1419545ded Alex Deucher       2012-07-17  640   *
radeon_driver_open_kms - drm callback for open
f482a1419545ded Alex Deucher       2012-07-17  641   *
f482a1419545ded Alex Deucher       2012-07-17  642   * @dev: drm dev pointe=
r
f482a1419545ded Alex Deucher       2012-07-17  643   * @file_priv: drm file
f482a1419545ded Alex Deucher       2012-07-17  644   *
f482a1419545ded Alex Deucher       2012-07-17  645   * On device open, init
vm on cayman+ (all asics).
f482a1419545ded Alex Deucher       2012-07-17  646   * Returns 0 on
success, error on failure.
f482a1419545ded Alex Deucher       2012-07-17  647   */
771fe6b912fca54 Jerome Glisse      2009-06-05  648  int
radeon_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
771fe6b912fca54 Jerome Glisse      2009-06-05  649  {
721604a15b934f0 Jerome Glisse      2012-01-05  650      struct
radeon_device *rdev =3D dev->dev_private;
10ebc0bc09344ab Dave Airlie        2012-09-17  651      int r;
123fb3d217e89c4 Zhou Qingyang      2021-11-30  652      struct radeon_fpriv
*fpriv;
123fb3d217e89c4 Zhou Qingyang      2021-11-30  653      struct radeon_vm
*vm;
721604a15b934f0 Jerome Glisse      2012-01-05  654
721604a15b934f0 Jerome Glisse      2012-01-05  655
file_priv->driver_priv =3D NULL;
721604a15b934f0 Jerome Glisse      2012-01-05  656
10ebc0bc09344ab Dave Airlie        2012-09-17  657      r =3D
pm_runtime_get_sync(dev->dev);
9fb10671011143d Aditya Pakki       2020-06-13  658      if (r < 0) {
9fb10671011143d Aditya Pakki       2020-06-13  659
pm_runtime_put_autosuspend(dev->dev);
10ebc0bc09344ab Dave Airlie        2012-09-17  660              return r;
9fb10671011143d Aditya Pakki       2020-06-13  661      }
10ebc0bc09344ab Dave Airlie        2012-09-17  662
721604a15b934f0 Jerome Glisse      2012-01-05  663      /* new gpu have
virtual address space support */
721604a15b934f0 Jerome Glisse      2012-01-05  664      if (rdev->family >=
=3D
CHIP_CAYMAN) {
721604a15b934f0 Jerome Glisse      2012-01-05  665
721604a15b934f0 Jerome Glisse      2012-01-05  666              fpriv =3D
kzalloc(sizeof(*fpriv), GFP_KERNEL);
721604a15b934f0 Jerome Glisse      2012-01-05  667              if
(unlikely(!fpriv)) {
32c59dc14b72803 Alex Deucher       2016-08-31  668                      r =
=3D
-ENOMEM;
32c59dc14b72803 Alex Deucher       2016-08-31  669
goto out_suspend;
721604a15b934f0 Jerome Glisse      2012-01-05  670              }
721604a15b934f0 Jerome Glisse      2012-01-05  671
544143f9e01a60a Alex Deucher       2015-01-28 @672              if
(rdev->accel_working) {
cc9e67e3d7000c1 Christian K=C3=B6nig    2014-07-18  673                    =
  vm
=3D &fpriv->vm;
cc9e67e3d7000c1 Christian K=C3=B6nig    2014-07-18  674                    =
  r =3D
radeon_vm_init(rdev, vm);
74073c9dd299056 Quentin Casasnovas 2014-03-18  675                      if
(r) {
123fb3d217e89c4 Zhou Qingyang      2021-11-30  676
    goto out_fpriv;
74073c9dd299056 Quentin Casasnovas 2014-03-18  677                      }
d72d43cfc5847c1 Christian K=C3=B6nig    2012-10-09  678
f1e3dc708aaadb9 Christian K=C3=B6nig    2014-02-20  679                    =
  r =3D
radeon_bo_reserve(rdev->ring_tmp_bo.bo, false);
74073c9dd299056 Quentin Casasnovas 2014-03-18  680                      if
(r) {
123fb3d217e89c4 Zhou Qingyang      2021-11-30  681
    goto out_vm_fini;
74073c9dd299056 Quentin Casasnovas 2014-03-18  682                      }
f1e3dc708aaadb9 Christian K=C3=B6nig    2014-02-20  683
d72d43cfc5847c1 Christian K=C3=B6nig    2012-10-09  684                    =
  /*
map the ib pool buffer read only into
d72d43cfc5847c1 Christian K=C3=B6nig    2012-10-09  685                    =
   *
virtual address space */
cc9e67e3d7000c1 Christian K=C3=B6nig    2014-07-18  686
vm->ib_bo_va =3D radeon_vm_bo_add(rdev, vm,
d72d43cfc5847c1 Christian K=C3=B6nig    2012-10-09  687
                            rdev->ring_tmp_bo.bo);
123fb3d217e89c4 Zhou Qingyang      2021-11-30  688                      if
(!vm->ib_bo_va) {
123fb3d217e89c4 Zhou Qingyang      2021-11-30  689
    r =3D -ENOMEM;
123fb3d217e89c4 Zhou Qingyang      2021-11-30  690
    goto out_vm_fini;
123fb3d217e89c4 Zhou Qingyang      2021-11-30  691                      }
123fb3d217e89c4 Zhou Qingyang      2021-11-30  692
cc9e67e3d7000c1 Christian K=C3=B6nig    2014-07-18  693                    =
  r =3D
radeon_vm_bo_set_addr(rdev, vm->ib_bo_va,
cc9e67e3d7000c1 Christian K=C3=B6nig    2014-07-18  694
                      RADEON_VA_IB_OFFSET,
d72d43cfc5847c1 Christian K=C3=B6nig    2012-10-09  695
                      RADEON_VM_PAGE_READABLE |
d72d43cfc5847c1 Christian K=C3=B6nig    2012-10-09  696
                      RADEON_VM_PAGE_SNOOPED);
721604a15b934f0 Jerome Glisse      2012-01-05  697                      if
(r) {
123fb3d217e89c4 Zhou Qingyang      2021-11-30  698
    goto out_vm_fini;
721604a15b934f0 Jerome Glisse      2012-01-05  699                      }
24f47acc78b0ab5 J=C3=A9r=C3=B4me Glisse      2014-05-07  700              }
721604a15b934f0 Jerome Glisse      2012-01-05  701
file_priv->driver_priv =3D fpriv;
721604a15b934f0 Jerome Glisse      2012-01-05  702      }
10ebc0bc09344ab Dave Airlie        2012-09-17  703
123fb3d217e89c4 Zhou Qingyang      2021-11-30  704  out_vm_fini:
123fb3d217e89c4 Zhou Qingyang      2021-11-30  705
radeon_vm_fini(rdev, vm);
123fb3d217e89c4 Zhou Qingyang      2021-11-30  706  out_fpriv:
123fb3d217e89c4 Zhou Qingyang      2021-11-30  707      kfree(fpriv);
32c59dc14b72803 Alex Deucher       2016-08-31  708  out_suspend:
10ebc0bc09344ab Dave Airlie        2012-09-17  709
pm_runtime_mark_last_busy(dev->dev);
10ebc0bc09344ab Dave Airlie        2012-09-17  710
pm_runtime_put_autosuspend(dev->dev);
32c59dc14b72803 Alex Deucher       2016-08-31  711      return r;
771fe6b912fca54 Jerome Glisse      2009-06-05  712  }
771fe6b912fca54 Jerome Glisse      2009-06-05  713

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

On Wed, Dec 1, 2021 at 3:20 PM Christian K=C3=B6nig <christian.koenig@amd.c=
om>
wrote:

> Am 01.12.21 um 04:22 schrieb Zhou Qingyang:
> > In radeon_driver_open_kms(), radeon_vm_bo_add() is assigned to
> > vm->ib_bo_va and passes and used in radeon_vm_bo_set_addr(). In
> > radeon_vm_bo_set_addr(), there is a dereference of vm->ib_bo_va,
> > which could lead to a NULL pointer dereference on failure of
> > radeon_vm_bo_add().
> >
> > Fix this bug by adding a check of vm->ib_bo_va.
> >
> > This bug was found by a static analyzer. The analysis employs
> > differential checking to identify inconsistent security operations
> > (e.g., checks or kfrees) between two code paths and confirms that the
> > inconsistent operations are not recovered in the current function or
> > the callers, so they constitute bugs.
> >
> > Note that, as a bug found by static analysis, it can be a false
> > positive or hard to trigger. Multiple researchers have cross-reviewed
> > the bug.
> >
> > Builds with CONFIG_DRM_RADEON=3Dm show no new warnings,
> > and our static analyzer no longer warns about this code.
> >
> > Fixes: cc9e67e3d700 ("drm/radeon: fix VM IB handling")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
> > ---
> > Changes in v2:
> >    -  Initialize the variables to silence warning
>
> What warning do you get? Double checking the code that shouldn't be
> necessary and is usually rather frowned upon.
>
> Thanks,
> Christian.
>
> >
> > Changes in v3:
> >    -  Fix the bug that good case will also be freed
> >    -  Improve code style
> >
> > Changes in v2:
> >    -  Improve the error handling into goto style
> >
> >   drivers/gpu/drm/radeon/radeon_kms.c | 37 ++++++++++++++++------------=
-
> >   1 file changed, 20 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/radeon/radeon_kms.c
> b/drivers/gpu/drm/radeon/radeon_kms.c
> > index 482fb0ae6cb5..9d0f840286a1 100644
> > --- a/drivers/gpu/drm/radeon/radeon_kms.c
> > +++ b/drivers/gpu/drm/radeon/radeon_kms.c
> > @@ -648,7 +648,9 @@ void radeon_driver_lastclose_kms(struct drm_device
> *dev)
> >   int radeon_driver_open_kms(struct drm_device *dev, struct drm_file
> *file_priv)
> >   {
> >       struct radeon_device *rdev =3D dev->dev_private;
> > -     int r;
> > +     struct radeon_fpriv *fpriv =3D NULL;
> > +     struct radeon_vm *vm =3D NULL;
> > +     int r =3D 0;
> >
> >       file_priv->driver_priv =3D NULL;
> >
> > @@ -660,8 +662,6 @@ int radeon_driver_open_kms(struct drm_device *dev,
> struct drm_file *file_priv)
> >
> >       /* new gpu have virtual address space support */
> >       if (rdev->family >=3D CHIP_CAYMAN) {
> > -             struct radeon_fpriv *fpriv;
> > -             struct radeon_vm *vm;
> >
> >               fpriv =3D kzalloc(sizeof(*fpriv), GFP_KERNEL);
> >               if (unlikely(!fpriv)) {
> > @@ -672,35 +672,38 @@ int radeon_driver_open_kms(struct drm_device *dev=
,
> struct drm_file *file_priv)
> >               if (rdev->accel_working) {
> >                       vm =3D &fpriv->vm;
> >                       r =3D radeon_vm_init(rdev, vm);
> > -                     if (r) {
> > -                             kfree(fpriv);
> > -                             goto out_suspend;
> > -                     }
> > +                     if (r)
> > +                             goto out_fpriv;
> >
> >                       r =3D radeon_bo_reserve(rdev->ring_tmp_bo.bo,
> false);
> > -                     if (r) {
> > -                             radeon_vm_fini(rdev, vm);
> > -                             kfree(fpriv);
> > -                             goto out_suspend;
> > -                     }
> > +                     if (r)
> > +                             goto out_vm_fini;
> >
> >                       /* map the ib pool buffer read only into
> >                        * virtual address space */
> >                       vm->ib_bo_va =3D radeon_vm_bo_add(rdev, vm,
> >                                                       rdev->
> ring_tmp_bo.bo);
> > +                     if (!vm->ib_bo_va) {
> > +                             r =3D -ENOMEM;
> > +                             goto out_vm_fini;
> > +                     }
> > +
> >                       r =3D radeon_vm_bo_set_addr(rdev, vm->ib_bo_va,
> >                                                 RADEON_VA_IB_OFFSET,
> >                                                 RADEON_VM_PAGE_READABLE=
 |
> >                                                 RADEON_VM_PAGE_SNOOPED)=
;
> > -                     if (r) {
> > -                             radeon_vm_fini(rdev, vm);
> > -                             kfree(fpriv);
> > -                             goto out_suspend;
> > -                     }
> > +                     if (r)
> > +                             goto out_vm_fini;
> >               }
> >               file_priv->driver_priv =3D fpriv;
> >       }
> >
> > +out_vm_fini:
> > +     if (r)
> > +             radeon_vm_fini(rdev, vm);
> > +out_fpriv:
> > +     if (r)
> > +             kfree(fpriv);
> >   out_suspend:
> >       pm_runtime_mark_last_busy(dev->dev);
> >       pm_runtime_put_autosuspend(dev->dev);
>
>

--000000000000f4b31205d21518b3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi=C2=A0Christian:<div><br></div><div>The=
 warning is from the kernel test robot, I quote it here. The key point is t=
hat vm may be used in radeon_vm_fini(rdev, vm) without initialization. Alth=
ough it is not possible in practice, I still add initializations to silence=
=C2=A0the warning of llvm.</div><div><br></div><div><div dir=3D"ltr" class=
=3D"gmail_attr">---------- Forwarded message ---------<br>From:=C2=A0<stron=
g class=3D"gmail_sendername" dir=3D"auto">kernel test robot</strong>=C2=A0<=
span dir=3D"auto">&lt;<a href=3D"mailto:lkp@intel.com">lkp@intel.com</a>&gt=
;</span><br>Date: Wed, Dec 1, 2021 at 4:32 AM<br>Subject: drivers/gpu/drm/r=
adeon/radeon_kms.c:672:7: warning: variable &#39;vm&#39; is used uninitiali=
zed whenever &#39;if&#39; condition is false<br>To: Zhou Qingyang &lt;<a hr=
ef=3D"mailto:zhou1615@umn.edu">zhou1615@umn.edu</a>&gt;<br>Cc: &lt;<a href=
=3D"mailto:llvm@lists.linux.dev">llvm@lists.linux.dev</a>&gt;, &lt;<a href=
=3D"mailto:kbuild-all@lists.01.org">kbuild-all@lists.01.org</a>&gt;, &lt;<a=
 href=3D"mailto:linux-kernel@vger.kernel.org">linux-kernel@vger.kernel.org<=
/a>&gt;, 0day robot &lt;<a href=3D"mailto:lkp@intel.com">lkp@intel.com</a>&=
gt;<br></div><br><br>tree:=C2=A0 =C2=A0<a href=3D"https://github.com/0day-c=
i/linux/commits/UPDATE-20211130-233655/Zhou-Qingyang/drm-radeon-radeon_kms-=
Fix-a-NULL-pointer-dereference-in-radeon_driver_open_kms/20211130-231509" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/0day-ci/linux/commit=
s/UPDATE-20211130-233655/Zhou-Qingyang/drm-radeon-radeon_kms-Fix-a-NULL-poi=
nter-dereference-in-radeon_driver_open_kms/20211130-231509</a><br>head:=C2=
=A0 =C2=A0123fb3d217e89c4388fdb08b63991bac7c324219<br>commit: 123fb3d217e89=
c4388fdb08b63991bac7c324219 drm/radeon/radeon_kms: Fix a NULL pointer deref=
erence in radeon_driver_open_kms()<br>date:=C2=A0 =C2=A05 hours ago<br>conf=
ig: mips-randconfig-r014-20211128 (<a href=3D"https://download.01.org/0day-=
ci/archive/20211201/202112010420.xkXHciHS-lkp@intel.com/config" rel=3D"nore=
ferrer" target=3D"_blank">https://download.01.org/0day-ci/archive/20211201/=
202112010420.xkXHciHS-lkp@intel.com/config</a>)<br>compiler: clang version =
14.0.0 (<a href=3D"https://github.com/llvm/llvm-project" rel=3D"noreferrer"=
 target=3D"_blank">https://github.com/llvm/llvm-project</a>=C2=A025eb7fa01d=
7ebbe67648ea03841cda55b4239ab2)<br>reproduce (this is a W=3D1 build):<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 wget=C2=A0<a href=3D"https://raw.githubusercont=
ent.com/intel/lkp-tests/master/sbin/make.cross" rel=3D"noreferrer" target=
=3D"_blank">https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/m=
ake.cross</a>=C2=A0-O ~/bin/make.cross<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 chmod=
 +x ~/bin/make.cross<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 # install mips cross co=
mpiling tool for clang build<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 # apt-get insta=
ll binutils-mips-linux-gnu<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 #=C2=A0<a href=3D=
"https://github.com/0day-ci/linux/commit/123fb3d217e89c4388fdb08b63991bac7c=
324219" rel=3D"noreferrer" target=3D"_blank">https://github.com/0day-ci/lin=
ux/commit/123fb3d217e89c4388fdb08b63991bac7c324219</a><br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 git remote add linux-review=C2=A0<a href=3D"https://github.com/0=
day-ci/linux" rel=3D"noreferrer" target=3D"_blank">https://github.com/0day-=
ci/linux</a><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 git fetch --no-tags linux-revie=
w UPDATE-20211130-233655/Zhou-Qingyang/drm-radeon-radeon_kms-Fix-a-NULL-poi=
nter-dereference-in-radeon_driver_open_kms/20211130-231509<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 git checkout 123fb3d217e89c4388fdb08b63991bac7c324219<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 # save the config file to linux build tree<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 mkdir build_dir<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 COM=
PILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=3D1 O=3Dbuild=
_dir ARCH=3Dmips SHELL=3D/bin/bash drivers/gpu/drm/radeon/<br><br>If you fi=
x the issue, kindly add following tag as appropriate<br>Reported-by: kernel=
 test robot &lt;<a href=3D"mailto:lkp@intel.com" target=3D"_blank">lkp@inte=
l.com</a>&gt;<br><br>All warnings (new ones prefixed by &gt;&gt;):<br><br>&=
gt;&gt; drivers/gpu/drm/radeon/radeon_kms.c:672:7: warning: variable &#39;v=
m&#39; is used uninitialized whenever &#39;if&#39; condition is false [-Wso=
metimes-uninitialized]<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0if (rdev-&gt;accel_working) {<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~=
~~~~~~<br>=C2=A0 =C2=A0drivers/gpu/drm/radeon/radeon_kms.c:705:23: note: un=
initialized use occurs here<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rad=
eon_vm_fini(rdev, vm);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~<br>=C2=A0=
 =C2=A0drivers/gpu/drm/radeon/radeon_kms.c:672:3: note: remove the &#39;if&=
#39; if its condition is always true<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (rdev-&gt;accel_working) {<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~=
~~~~~~~~~~~~<br>=C2=A0 =C2=A0drivers/gpu/drm/radeon/radeon_kms.c:664:6: war=
ning: variable &#39;vm&#39; is used uninitialized whenever &#39;if&#39; con=
dition is false [-Wsometimes-uninitialized]<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if (rdev-&gt;family &gt;=3D CHIP_CAYMAN) {<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~~~~~~~~<br>=C2=
=A0 =C2=A0drivers/gpu/drm/radeon/radeon_kms.c:705:23: note: uninitialized u=
se occurs here<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0radeon_vm_fini(r=
dev, vm);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~<br>=C2=A0 =C2=A0driver=
s/gpu/drm/radeon/radeon_kms.c:664:2: note: remove the &#39;if&#39; if its c=
ondition is always true<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (rde=
v-&gt;family &gt;=3D CHIP_CAYMAN) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>=C2=A0 =C2=A0drivers/gpu/drm/rad=
eon/radeon_kms.c:653:22: note: initialize the variable &#39;vm&#39; to sile=
nce this warning<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct radeon_=
vm *vm;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D NULL<br>=C2=A0 =C2=A02 warnings generated.<br><br><br=
>vim +672 drivers/gpu/drm/radeon/radeon_kms.c<br><br>771fe6b912fca54 Jerome=
 Glisse=C2=A0 =C2=A0 =C2=A0 2009-06-05=C2=A0 638=C2=A0<br>f482a1419545ded A=
lex Deucher=C2=A0 =C2=A0 =C2=A0 =C2=A02012-07-17=C2=A0 639=C2=A0 /**<br>f48=
2a1419545ded Alex Deucher=C2=A0 =C2=A0 =C2=A0 =C2=A02012-07-17=C2=A0 640=C2=
=A0 =C2=A0* radeon_driver_open_kms - drm callback for open<br>f482a1419545d=
ed Alex Deucher=C2=A0 =C2=A0 =C2=A0 =C2=A02012-07-17=C2=A0 641=C2=A0 =C2=A0=
*<br>f482a1419545ded Alex Deucher=C2=A0 =C2=A0 =C2=A0 =C2=A02012-07-17=C2=
=A0 642=C2=A0 =C2=A0* @dev: drm dev pointer<br>f482a1419545ded Alex Deucher=
=C2=A0 =C2=A0 =C2=A0 =C2=A02012-07-17=C2=A0 643=C2=A0 =C2=A0* @file_priv: d=
rm file<br>f482a1419545ded Alex Deucher=C2=A0 =C2=A0 =C2=A0 =C2=A02012-07-1=
7=C2=A0 644=C2=A0 =C2=A0*<br>f482a1419545ded Alex Deucher=C2=A0 =C2=A0 =C2=
=A0 =C2=A02012-07-17=C2=A0 645=C2=A0 =C2=A0* On device open, init vm on cay=
man+ (all asics).<br>f482a1419545ded Alex Deucher=C2=A0 =C2=A0 =C2=A0 =C2=
=A02012-07-17=C2=A0 646=C2=A0 =C2=A0* Returns 0 on success, error on failur=
e.<br>f482a1419545ded Alex Deucher=C2=A0 =C2=A0 =C2=A0 =C2=A02012-07-17=C2=
=A0 647=C2=A0 =C2=A0*/<br>771fe6b912fca54 Jerome Glisse=C2=A0 =C2=A0 =C2=A0=
 2009-06-05=C2=A0 648=C2=A0 int radeon_driver_open_kms(struct drm_device *d=
ev, struct drm_file *file_priv)<br>771fe6b912fca54 Jerome Glisse=C2=A0 =C2=
=A0 =C2=A0 2009-06-05=C2=A0 649=C2=A0 {<br>721604a15b934f0 Jerome Glisse=C2=
=A0 =C2=A0 =C2=A0 2012-01-05=C2=A0 650=C2=A0 =C2=A0 =C2=A0 struct radeon_de=
vice *rdev =3D dev-&gt;dev_private;<br>10ebc0bc09344ab Dave Airlie=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 2012-09-17=C2=A0 651=C2=A0 =C2=A0 =C2=A0 int r;<br>123=
fb3d217e89c4 Zhou Qingyang=C2=A0 =C2=A0 =C2=A0 2021-11-30=C2=A0 652=C2=A0 =
=C2=A0 =C2=A0 struct radeon_fpriv *fpriv;<br>123fb3d217e89c4 Zhou Qingyang=
=C2=A0 =C2=A0 =C2=A0 2021-11-30=C2=A0 653=C2=A0 =C2=A0 =C2=A0 struct radeon=
_vm *vm;<br>721604a15b934f0 Jerome Glisse=C2=A0 =C2=A0 =C2=A0 2012-01-05=C2=
=A0 654=C2=A0<br>721604a15b934f0 Jerome Glisse=C2=A0 =C2=A0 =C2=A0 2012-01-=
05=C2=A0 655=C2=A0 =C2=A0 =C2=A0 file_priv-&gt;driver_priv =3D NULL;<br>721=
604a15b934f0 Jerome Glisse=C2=A0 =C2=A0 =C2=A0 2012-01-05=C2=A0 656=C2=A0<b=
r>10ebc0bc09344ab Dave Airlie=C2=A0 =C2=A0 =C2=A0 =C2=A0 2012-09-17=C2=A0 6=
57=C2=A0 =C2=A0 =C2=A0 r =3D pm_runtime_get_sync(dev-&gt;dev);<br>9fb106710=
11143d Aditya Pakki=C2=A0 =C2=A0 =C2=A0 =C2=A02020-06-13=C2=A0 658=C2=A0 =
=C2=A0 =C2=A0 if (r &lt; 0) {<br>9fb10671011143d Aditya Pakki=C2=A0 =C2=A0 =
=C2=A0 =C2=A02020-06-13=C2=A0 659=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 pm_runtime_put_autosuspend(dev-&gt;dev);<br>10ebc0bc09344ab Dave Air=
lie=C2=A0 =C2=A0 =C2=A0 =C2=A0 2012-09-17=C2=A0 660=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 return r;<br>9fb10671011143d Aditya Pakki=C2=A0 =
=C2=A0 =C2=A0 =C2=A02020-06-13=C2=A0 661=C2=A0 =C2=A0 =C2=A0 }<br>10ebc0bc0=
9344ab Dave Airlie=C2=A0 =C2=A0 =C2=A0 =C2=A0 2012-09-17=C2=A0 662=C2=A0<br=
>721604a15b934f0 Jerome Glisse=C2=A0 =C2=A0 =C2=A0 2012-01-05=C2=A0 663=C2=
=A0 =C2=A0 =C2=A0 /* new gpu have virtual address space support */<br>72160=
4a15b934f0 Jerome Glisse=C2=A0 =C2=A0 =C2=A0 2012-01-05=C2=A0 664=C2=A0 =C2=
=A0 =C2=A0 if (rdev-&gt;family &gt;=3D CHIP_CAYMAN) {<br>721604a15b934f0 Je=
rome Glisse=C2=A0 =C2=A0 =C2=A0 2012-01-05=C2=A0 665=C2=A0<br>721604a15b934=
f0 Jerome Glisse=C2=A0 =C2=A0 =C2=A0 2012-01-05=C2=A0 666=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fpriv =3D kzalloc(sizeof(*fpriv), GFP_KERNE=
L);<br>721604a15b934f0 Jerome Glisse=C2=A0 =C2=A0 =C2=A0 2012-01-05=C2=A0 6=
67=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (unlikely(!fpriv)) {<=
br>32c59dc14b72803 Alex Deucher=C2=A0 =C2=A0 =C2=A0 =C2=A02016-08-31=C2=A0 =
668=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 r =3D -ENOMEM;<br>32c59dc14b72803 Alex Deucher=C2=A0 =C2=A0 =C2=A0 =
=C2=A02016-08-31=C2=A0 669=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out_suspend;<br>721604a15b934f0 Jerome Gli=
sse=C2=A0 =C2=A0 =C2=A0 2012-01-05=C2=A0 670=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 }<br>721604a15b934f0 Jerome Glisse=C2=A0 =C2=A0 =C2=A0 20=
12-01-05=C2=A0 671=C2=A0<br>544143f9e01a60a Alex Deucher=C2=A0 =C2=A0 =C2=
=A0 =C2=A02015-01-28 @672=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
f (rdev-&gt;accel_working) {<br>cc9e67e3d7000c1 Christian K=C3=B6nig=C2=A0 =
=C2=A0 2014-07-18=C2=A0 673=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vm =3D &amp;fpriv-&gt;vm;<br>cc9e67e3d7000c1 C=
hristian K=C3=B6nig=C2=A0 =C2=A0 2014-07-18=C2=A0 674=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D radeon_vm_ini=
t(rdev, vm);<br>74073c9dd299056 Quentin Casasnovas 2014-03-18=C2=A0 675=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
f (r) {<br>123fb3d217e89c4 Zhou Qingyang=C2=A0 =C2=A0 =C2=A0 2021-11-30=C2=
=A0 676=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out_fpriv;<br>74073c9dd299056 Q=
uentin Casasnovas 2014-03-18=C2=A0 677=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>d72d43cfc5847c1 Christian K=
=C3=B6nig=C2=A0 =C2=A0 2012-10-09=C2=A0 678=C2=A0<br>f1e3dc708aaadb9 Christ=
ian K=C3=B6nig=C2=A0 =C2=A0 2014-02-20=C2=A0 679=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D radeon_bo_reserve(r=
dev-&gt;<a href=3D"http://ring_tmp_bo.bo/" rel=3D"noreferrer" target=3D"_bl=
ank">ring_tmp_bo.bo</a>, false);<br>74073c9dd299056 Quentin Casasnovas 2014=
-03-18=C2=A0 680=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if (r) {<br>123fb3d217e89c4 Zhou Qingyang=C2=A0 =C2=A0 =
=C2=A0 2021-11-30=C2=A0 681=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out_vm_fini;<=
br>74073c9dd299056 Quentin Casasnovas 2014-03-18=C2=A0 682=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>f1e3dc708a=
aadb9 Christian K=C3=B6nig=C2=A0 =C2=A0 2014-02-20=C2=A0 683=C2=A0<br>d72d4=
3cfc5847c1 Christian K=C3=B6nig=C2=A0 =C2=A0 2012-10-09=C2=A0 684=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* map t=
he ib pool buffer read only into<br>d72d43cfc5847c1 Christian K=C3=B6nig=C2=
=A0 =C2=A0 2012-10-09=C2=A0 685=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* virtual address space */<br>cc9e=
67e3d7000c1 Christian K=C3=B6nig=C2=A0 =C2=A0 2014-07-18=C2=A0 686=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vm-&g=
t;ib_bo_va =3D radeon_vm_bo_add(rdev, vm,<br>d72d43cfc5847c1 Christian K=C3=
=B6nig=C2=A0 =C2=A0 2012-10-09=C2=A0 687=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 rdev-&gt;<a href=3D"http://ring_tmp_bo.bo/" rel=3D"noreferrer" targe=
t=3D"_blank">ring_tmp_bo.bo</a>);<br>123fb3d217e89c4 Zhou Qingyang=C2=A0 =
=C2=A0 =C2=A0 2021-11-30=C2=A0 688=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!vm-&gt;ib_bo_va) {<br>123fb3d217e8=
9c4 Zhou Qingyang=C2=A0 =C2=A0 =C2=A0 2021-11-30=C2=A0 689=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 r =3D -ENOMEM;<br>123fb3d217e89c4 Zhou Qingyang=C2=A0 =C2=A0 =
=C2=A0 2021-11-30=C2=A0 690=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out_vm_fini;<=
br>123fb3d217e89c4 Zhou Qingyang=C2=A0 =C2=A0 =C2=A0 2021-11-30=C2=A0 691=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>123fb3d217e89c4 Zhou Qingyang=C2=A0 =C2=A0 =C2=A0 2021-11-30=C2=A0=
 692=C2=A0<br>cc9e67e3d7000c1 Christian K=C3=B6nig=C2=A0 =C2=A0 2014-07-18=
=C2=A0 693=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 r =3D radeon_vm_bo_set_addr(rdev, vm-&gt;ib_bo_va,<br>cc9e67e=
3d7000c1 Christian K=C3=B6nig=C2=A0 =C2=A0 2014-07-18=C2=A0 694=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 RADEON_VA_IB_OFFSET,<br>d72d43cfc5847c1 Christian K=C3=B6nig=C2=
=A0 =C2=A0 2012-10-09=C2=A0 695=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RADEON_VM_PAGE_READABL=
E |<br>d72d43cfc5847c1 Christian K=C3=B6nig=C2=A0 =C2=A0 2012-10-09=C2=A0 6=
96=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 RADEON_VM_PAGE_SNOOPED);<br>721604a15b934f0 Jerome Gli=
sse=C2=A0 =C2=A0 =C2=A0 2012-01-05=C2=A0 697=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r) {<br>123fb3d217e89c4 Z=
hou Qingyang=C2=A0 =C2=A0 =C2=A0 2021-11-30=C2=A0 698=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 goto out_vm_fini;<br>721604a15b934f0 Jerome Glisse=C2=A0 =C2=A0 =
=C2=A0 2012-01-05=C2=A0 699=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>24f47acc78b0ab5 J=C3=A9r=C3=B4me Glisse=
=C2=A0 =C2=A0 =C2=A0 2014-05-07=C2=A0 700=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 }<br>721604a15b934f0 Jerome Glisse=C2=A0 =C2=A0 =C2=A0 2012-=
01-05=C2=A0 701=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file_priv-&=
gt;driver_priv =3D fpriv;<br>721604a15b934f0 Jerome Glisse=C2=A0 =C2=A0 =C2=
=A0 2012-01-05=C2=A0 702=C2=A0 =C2=A0 =C2=A0 }<br>10ebc0bc09344ab Dave Airl=
ie=C2=A0 =C2=A0 =C2=A0 =C2=A0 2012-09-17=C2=A0 703=C2=A0<br>123fb3d217e89c4=
 Zhou Qingyang=C2=A0 =C2=A0 =C2=A0 2021-11-30=C2=A0 704=C2=A0 out_vm_fini:<=
br>123fb3d217e89c4 Zhou Qingyang=C2=A0 =C2=A0 =C2=A0 2021-11-30=C2=A0 705=
=C2=A0 =C2=A0 =C2=A0 radeon_vm_fini(rdev, vm);<br>123fb3d217e89c4 Zhou Qing=
yang=C2=A0 =C2=A0 =C2=A0 2021-11-30=C2=A0 706=C2=A0 out_fpriv:<br>123fb3d21=
7e89c4 Zhou Qingyang=C2=A0 =C2=A0 =C2=A0 2021-11-30=C2=A0 707=C2=A0 =C2=A0 =
=C2=A0 kfree(fpriv);<br>32c59dc14b72803 Alex Deucher=C2=A0 =C2=A0 =C2=A0 =
=C2=A02016-08-31=C2=A0 708=C2=A0 out_suspend:<br>10ebc0bc09344ab Dave Airli=
e=C2=A0 =C2=A0 =C2=A0 =C2=A0 2012-09-17=C2=A0 709=C2=A0 =C2=A0 =C2=A0 pm_ru=
ntime_mark_last_busy(dev-&gt;dev);<br>10ebc0bc09344ab Dave Airlie=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 2012-09-17=C2=A0 710=C2=A0 =C2=A0 =C2=A0 pm_runtime_put_a=
utosuspend(dev-&gt;dev);<br>32c59dc14b72803 Alex Deucher=C2=A0 =C2=A0 =C2=
=A0 =C2=A02016-08-31=C2=A0 711=C2=A0 =C2=A0 =C2=A0 return r;<br>771fe6b912f=
ca54 Jerome Glisse=C2=A0 =C2=A0 =C2=A0 2009-06-05=C2=A0 712=C2=A0 }<br>771f=
e6b912fca54 Jerome Glisse=C2=A0 =C2=A0 =C2=A0 2009-06-05=C2=A0 713=C2=A0<br=
><br>---<br>0-DAY CI Kernel Test Service, Intel Corporation<br><a href=3D"h=
ttps://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org" rel=3D"norefer=
rer" target=3D"_blank">https://lists.01.org/hyperkitty/list/kbuild-all@list=
s.01.org</a><br></div><div><br></div></div><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 1, 2021 at 3:20 PM Christian K=
=C3=B6nig &lt;<a href=3D"mailto:christian.koenig@amd.com" target=3D"_blank"=
>christian.koenig@amd.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">Am 01.12.21 um 04:22 schrieb Zhou Qingyang:<br>
&gt; In radeon_driver_open_kms(), radeon_vm_bo_add() is assigned to<br>
&gt; vm-&gt;ib_bo_va and passes and used in radeon_vm_bo_set_addr(). In<br>
&gt; radeon_vm_bo_set_addr(), there is a dereference of vm-&gt;ib_bo_va,<br=
>
&gt; which could lead to a NULL pointer dereference on failure of<br>
&gt; radeon_vm_bo_add().<br>
&gt;<br>
&gt; Fix this bug by adding a check of vm-&gt;ib_bo_va.<br>
&gt;<br>
&gt; This bug was found by a static analyzer. The analysis employs<br>
&gt; differential checking to identify inconsistent security operations<br>
&gt; (e.g., checks or kfrees) between two code paths and confirms that the<=
br>
&gt; inconsistent operations are not recovered in the current function or<b=
r>
&gt; the callers, so they constitute bugs.<br>
&gt;<br>
&gt; Note that, as a bug found by static analysis, it can be a false<br>
&gt; positive or hard to trigger. Multiple researchers have cross-reviewed<=
br>
&gt; the bug.<br>
&gt;<br>
&gt; Builds with CONFIG_DRM_RADEON=3Dm show no new warnings,<br>
&gt; and our static analyzer no longer warns about this code.<br>
&gt;<br>
&gt; Fixes: cc9e67e3d700 (&quot;drm/radeon: fix VM IB handling&quot;)<br>
&gt; Reported-by: kernel test robot &lt;<a href=3D"mailto:lkp@intel.com" ta=
rget=3D"_blank">lkp@intel.com</a>&gt;<br>
&gt; Signed-off-by: Zhou Qingyang &lt;<a href=3D"mailto:zhou1615@umn.edu" t=
arget=3D"_blank">zhou1615@umn.edu</a>&gt;<br>
&gt; ---<br>
&gt; Changes in v2:<br>
&gt;=C2=A0 =C2=A0 -=C2=A0 Initialize the variables to silence warning<br>
<br>
What warning do you get? Double checking the code that shouldn&#39;t be <br=
>
necessary and is usually rather frowned upon.<br>
<br>
Thanks,<br>
Christian.<br>
<br>
&gt;<br>
&gt; Changes in v3:<br>
&gt;=C2=A0 =C2=A0 -=C2=A0 Fix the bug that good case will also be freed<br>
&gt;=C2=A0 =C2=A0 -=C2=A0 Improve code style<br>
&gt;<br>
&gt; Changes in v2:<br>
&gt;=C2=A0 =C2=A0 -=C2=A0 Improve the error handling into goto style<br>
&gt;<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/radeon/radeon_kms.c | 37 ++++++++++++++++-=
------------<br>
&gt;=C2=A0 =C2=A01 file changed, 20 insertions(+), 17 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/rad=
eon/radeon_kms.c<br>
&gt; index 482fb0ae6cb5..9d0f840286a1 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/radeon_kms.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/radeon_kms.c<br>
&gt; @@ -648,7 +648,9 @@ void radeon_driver_lastclose_kms(struct drm_device=
 *dev)<br>
&gt;=C2=A0 =C2=A0int radeon_driver_open_kms(struct drm_device *dev, struct =
drm_file *file_priv)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct radeon_device *rdev =3D dev-&gt;dev_p=
rivate;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0int r;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct radeon_fpriv *fpriv =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct radeon_vm *vm =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int r =3D 0;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file_priv-&gt;driver_priv =3D NULL;<br>
&gt;<br>
&gt; @@ -660,8 +662,6 @@ int radeon_driver_open_kms(struct drm_device *dev,=
 struct drm_file *file_priv)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* new gpu have virtual address space suppor=
t */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rdev-&gt;family &gt;=3D CHIP_CAYMAN) {<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct radeon_fpriv *=
fpriv;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct radeon_vm *vm;=
<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fpriv =3D kzallo=
c(sizeof(*fpriv), GFP_KERNEL);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (unlikely(!fp=
riv)) {<br>
&gt; @@ -672,35 +672,38 @@ int radeon_driver_open_kms(struct drm_device *de=
v, struct drm_file *file_priv)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (rdev-&gt;acc=
el_working) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0vm =3D &amp;fpriv-&gt;vm;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0r =3D radeon_vm_init(rdev, vm);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (r) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(fpriv);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_suspend;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (r)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_fpriv;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0r =3D radeon_bo_reserve(rdev-&gt;<a href=3D"http://ring_tmp_bo=
.bo" rel=3D"noreferrer" target=3D"_blank">ring_tmp_bo.bo</a>, false);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (r) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0radeon_vm_fini(rdev, vm);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(fpriv);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_suspend;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (r)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_vm_fini;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/* map the ib pool buffer read only into<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 * virtual address space */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0vm-&gt;ib_bo_va =3D radeon_vm_bo_add(rdev, vm,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&gt;<a href=3D"htt=
p://ring_tmp_bo.bo" rel=3D"noreferrer" target=3D"_blank">ring_tmp_bo.bo</a>=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (!vm-&gt;ib_bo_va) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D -ENOMEM;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_vm_fini;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0r =3D radeon_vm_bo_set_addr(rdev, vm-&gt;ib_bo_va,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RADEON_VA_IB_OFFSET,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RADEON_VM_PAGE_READABLE |<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RADEON_VM_PAGE_SNOOPED);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (r) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0radeon_vm_fini(rdev, vm);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(fpriv);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_suspend;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (r)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_vm_fini;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file_priv-&gt;dr=
iver_priv =3D fpriv;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +out_vm_fini:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (r)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0radeon_vm_fini(rdev, =
vm);<br>
&gt; +out_fpriv:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (r)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(fpriv);<br>
&gt;=C2=A0 =C2=A0out_suspend:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_mark_last_busy(dev-&gt;dev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_put_autosuspend(dev-&gt;dev);<br>
<br>
</blockquote></div>
</div>

--000000000000f4b31205d21518b3--


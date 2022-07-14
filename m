Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C708B574E6A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 14:54:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B03E10E3D9;
	Thu, 14 Jul 2022 12:54:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C9710E4CD;
 Thu, 14 Jul 2022 12:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657803268; x=1689339268;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nVxv68xMPE+AuIH7tc8FWnRjkDb0pKqrBwhh/So085o=;
 b=UhX5aHZWCvU4eDWlDK391kD3Bb+xfP58avl+bm7hNtsobz8as2FLmRds
 Snoq7B7COAcxqjiq8joNMZHOmMgX/i0SlATapMlLPXWlHncwq+LV85LVk
 tzw6iNml+8GYBdgBdA98tAjto9owSGFf4NyZlH/G0aeN+eVKKnDVUtmgp
 I60k+8YjxTsR3L6bTitoJddOMZb245mTjcEKfXk0yISrHne/Agobw19s/
 +y8YASTfrvXDDjrp1eDS+VBy/QSPxSPjOSEleptVUjHxRPgNyeNlzJU5K
 Bk6fuj72ORSPqtkWVNpZpQTC4p+h63vqNyhraZKTxLgUUacH9vclOywFl Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="285524582"
X-IronPort-AV: E=Sophos;i="5.92,271,1650956400"; d="scan'208";a="285524582"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2022 05:54:28 -0700
X-IronPort-AV: E=Sophos;i="5.92,271,1650956400"; d="scan'208";a="653861744"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO maurocar-mobl2)
 ([10.252.37.128])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2022 05:54:26 -0700
Date: Thu, 14 Jul 2022 14:54:23 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Subject: Re: [PATCH] Revert "drm/amdgpu: add drm buddy support to amdgpu"
Message-ID: <20220714145423.721e1c3b@maurocar-mobl2>
In-Reply-To: <20220708102124.493372-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220708102124.493372-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 8 Jul 2022 03:21:24 -0700
Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com> wrote:

> This reverts the following commits:
> commit 708d19d9f362 ("drm/amdgpu: move internal vram_mgr function into th=
e C file")
> commit 5e3f1e7729ec ("drm/amdgpu: fix start calculation in amdgpu_vram_mg=
r_new")
> commit c9cad937c0c5 ("drm/amdgpu: add drm buddy support to amdgpu")
>=20
> [WHY]
> Few users reported garbaged graphics as soon as x starts,
> reverting until this can be resolved.
>=20
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>

This revert is currently breaking drm-tip. Please revert it ASAP, as it
is preventing CI bots to properly test new patches on the top of current
drm-tip:

drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: In function =E2=80=98amdgpu_v=
ram_mgr_new=E2=80=99:
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:459:13: error: =E2=80=98cur_si=
ze=E2=80=99 undeclared (first use in this function)
  459 |         if (cur_size !=3D size) {
      |             ^~~~~~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:459:13: note: each undeclared =
identifier is reported only once for each function it appears in
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:459:25: error: =E2=80=98size=
=E2=80=99 undeclared (first use in this function); did you mean =E2=80=98ks=
ize=E2=80=99?
  459 |         if (cur_size !=3D size) {
      |                         ^~~~
      |                         ksize
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:465:30: error: =E2=80=98vres=
=E2=80=99 undeclared (first use in this function); did you mean =E2=80=98re=
s=E2=80=99?
  465 |                 trim_list =3D &vres->blocks;
      |                              ^~~~
      |                              res
In file included from ./include/linux/bits.h:22,
                 from ./include/linux/ratelimit_types.h:5,
                 from ./include/linux/ratelimit.h:5,
                 from ./include/linux/dev_printk.h:16,
                 from ./include/linux/device.h:15,
                 from ./include/linux/dma-mapping.h:7,
                 from drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:25:
./include/linux/container_of.h:19:54: error: invalid use of undefined type =
=E2=80=98struct drm_buddy_block=E2=80=99
   19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||  =
     \
      |                                                      ^~
./include/linux/build_bug.h:78:56: note: in definition of macro =E2=80=98__=
static_assert=E2=80=99
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
./include/linux/container_of.h:19:9: note: in expansion of macro =E2=80=98s=
tatic_assert=E2=80=99
   19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||  =
     \
      |         ^~~~~~~~~~~~~
./include/linux/container_of.h:19:23: note: in expansion of macro =E2=80=98=
__same_type=E2=80=99
   19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||  =
     \
      |                       ^~~~~~~~~~~
./include/linux/list.h:520:9: note: in expansion of macro =E2=80=98containe=
r_of=E2=80=99
  520 |         container_of(ptr, type, member)
      |         ^~~~~~~~~~~~
./include/linux/list.h:542:9: note: in expansion of macro =E2=80=98list_ent=
ry=E2=80=99
  542 |         list_entry((ptr)->prev, type, member)
      |         ^~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:473:33: note: in expansion of =
macro =E2=80=98list_last_entry=E2=80=99
  473 |                         block =3D list_last_entry(&vres->blocks, ty=
peof(*block), link);
      |                                 ^~~~~~~~~~~~~~~
././include/linux/compiler_types.h:295:27: error: expression in static asse=
rtion is not an integer
  295 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), t=
ypeof(b))
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/build_bug.h:78:56: note: in definition of macro =E2=80=98__=
static_assert=E2=80=99
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
./include/linux/container_of.h:19:9: note: in expansion of macro =E2=80=98s=
tatic_assert=E2=80=99
   19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||  =
     \
      |         ^~~~~~~~~~~~~
./include/linux/container_of.h:19:23: note: in expansion of macro =E2=80=98=
__same_type=E2=80=99
   19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||  =
     \
      |                       ^~~~~~~~~~~
./include/linux/list.h:520:9: note: in expansion of macro =E2=80=98containe=
r_of=E2=80=99
  520 |         container_of(ptr, type, member)
      |         ^~~~~~~~~~~~
./include/linux/list.h:542:9: note: in expansion of macro =E2=80=98list_ent=
ry=E2=80=99
  542 |         list_entry((ptr)->prev, type, member)
      |         ^~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:473:33: note: in expansion of =
macro =E2=80=98list_last_entry=E2=80=99
  473 |                         block =3D list_last_entry(&vres->blocks, ty=
peof(*block), link);
      |                                 ^~~~~~~~~~~~~~~
In file included from ./include/uapi/linux/posix_types.h:5,
                 from ./include/uapi/linux/types.h:14,
                 from ./include/linux/types.h:6,
                 from ./include/linux/kasan-checks.h:5,
                 from ./include/asm-generic/rwonce.h:26,
                 from ./arch/x86/include/generated/asm/rwonce.h:1,
                 from ./include/linux/compiler.h:248,
                 from ./include/linux/string.h:5,
                 from ./include/linux/dma-mapping.h:6:
./include/linux/stddef.h:16:33: error: invalid use of undefined type =E2=80=
=98struct drm_buddy_block=E2=80=99
   16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
      |                                 ^~~~~~~~~~~~~~~~~~
./include/linux/container_of.h:22:28: note: in expansion of macro =E2=80=98=
offsetof=E2=80=99
   22 |         ((type *)(__mptr - offsetof(type, member))); })
      |                            ^~~~~~~~
./include/linux/list.h:520:9: note: in expansion of macro =E2=80=98containe=
r_of=E2=80=99
  520 |         container_of(ptr, type, member)
      |         ^~~~~~~~~~~~
./include/linux/list.h:542:9: note: in expansion of macro =E2=80=98list_ent=
ry=E2=80=99
  542 |         list_entry((ptr)->prev, type, member)
      |         ^~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:473:33: note: in expansion of =
macro =E2=80=98list_last_entry=E2=80=99
  473 |                         block =3D list_last_entry(&vres->blocks, ty=
peof(*block), link);
      |                                 ^~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:474:46: error: invalid use of =
undefined type =E2=80=98struct drm_buddy_block=E2=80=99
  474 |                         list_move_tail(&block->link, &temp);
      |                                              ^~
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:480:41: error: implicit declar=
ation of function =E2=80=98amdgpu_vram_mgr_block_size=E2=80=99; did you mea=
n =E2=80=98amdgpu_vram_mgr_vis_size=E2=80=99? [-Werror=3Dimplicit-function-=
declaration]
  480 |                         original_size =3D amdgpu_vram_mgr_block_siz=
e(block) - (size - cur_size);
      |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                         amdgpu_vram_mgr_vis_size
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:483:28: error: passing argumen=
t 1 of =E2=80=98mutex_lock=E2=80=99 from incompatible pointer type [-Werror=
=3Dincompatible-pointer-types]
  483 |                 mutex_lock(&mgr->lock);
      |                            ^~~~~~~~~~
      |                            |
      |                            spinlock_t * {aka struct spinlock *}
In file included from ./include/linux/rhashtable-types.h:14,
                 from ./include/linux/ipc.h:7,
                 from ./include/uapi/linux/sem.h:5,
                 from ./include/linux/sem.h:5,
                 from ./include/linux/sched.h:15,
                 from ./include/linux/ratelimit.h:6:
./include/linux/mutex.h:199:38: note: expected =E2=80=98struct mutex *=E2=
=80=99 but argument is of type =E2=80=98spinlock_t *=E2=80=99 {aka =E2=80=
=98struct spinlock *=E2=80=99}
  199 | extern void mutex_lock(struct mutex *lock);
      |                        ~~~~~~~~~~~~~~^~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:484:17: error: implicit declar=
ation of function =E2=80=98drm_buddy_block_trim=E2=80=99 [-Werror=3Dimplici=
t-function-declaration]
  484 |                 drm_buddy_block_trim(mm,
      |                 ^~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:487:30: error: passing argumen=
t 1 of =E2=80=98mutex_unlock=E2=80=99 from incompatible pointer type [-Werr=
or=3Dincompatible-pointer-types]
  487 |                 mutex_unlock(&mgr->lock);
      |                              ^~~~~~~~~~
      |                              |
      |                              spinlock_t * {aka struct spinlock *}
./include/linux/mutex.h:218:40: note: expected =E2=80=98struct mutex *=E2=
=80=99 but argument is of type =E2=80=98spinlock_t *=E2=80=99 {aka =E2=80=
=98struct spinlock *=E2=80=99}
  218 | extern void mutex_unlock(struct mutex *lock);
      |                          ~~~~~~~~~~~~~~^~~~
In file included from ./include/linux/rculist.h:10,
                 from ./include/linux/pid.h:5,
                 from ./include/linux/sched.h:14:
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:493:29: error: =E2=80=98block=
=E2=80=99 undeclared (first use in this function); did you mean =E2=80=98fl=
ock=E2=80=99?
  493 |         list_for_each_entry(block, &vres->blocks, link)
      |                             ^~~~~
./include/linux/list.h:674:14: note: in definition of macro =E2=80=98list_f=
or_each_entry=E2=80=99
  674 |         for (pos =3D list_first_entry(head, typeof(*pos), member); =
       \
      |              ^~~
././include/linux/compiler_types.h:295:27: error: expression in static asse=
rtion is not an integer
  295 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), t=
ypeof(b))
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/build_bug.h:78:56: note: in definition of macro =E2=80=98__=
static_assert=E2=80=99
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
./include/linux/container_of.h:19:9: note: in expansion of macro =E2=80=98s=
tatic_assert=E2=80=99
   19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||  =
     \
      |         ^~~~~~~~~~~~~
./include/linux/container_of.h:19:23: note: in expansion of macro =E2=80=98=
__same_type=E2=80=99
   19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||  =
     \
      |                       ^~~~~~~~~~~
./include/linux/list.h:520:9: note: in expansion of macro =E2=80=98containe=
r_of=E2=80=99
  520 |         container_of(ptr, type, member)
      |         ^~~~~~~~~~~~
./include/linux/list.h:531:9: note: in expansion of macro =E2=80=98list_ent=
ry=E2=80=99
  531 |         list_entry((ptr)->next, type, member)
      |         ^~~~~~~~~~
./include/linux/list.h:674:20: note: in expansion of macro =E2=80=98list_fi=
rst_entry=E2=80=99
  674 |         for (pos =3D list_first_entry(head, typeof(*pos), member); =
       \
      |                    ^~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:493:9: note: in expansion of m=
acro =E2=80=98list_for_each_entry=E2=80=99
  493 |         list_for_each_entry(block, &vres->blocks, link)
      |         ^~~~~~~~~~~~~~~~~~~
././include/linux/compiler_types.h:295:27: error: expression in static asse=
rtion is not an integer
  295 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), t=
ypeof(b))
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/build_bug.h:78:56: note: in definition of macro =E2=80=98__=
static_assert=E2=80=99
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
./include/linux/container_of.h:19:9: note: in expansion of macro =E2=80=98s=
tatic_assert=E2=80=99
   19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||  =
     \
      |         ^~~~~~~~~~~~~
./include/linux/container_of.h:19:23: note: in expansion of macro =E2=80=98=
__same_type=E2=80=99
   19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||  =
     \
      |                       ^~~~~~~~~~~
./include/linux/list.h:520:9: note: in expansion of macro =E2=80=98containe=
r_of=E2=80=99
  520 |         container_of(ptr, type, member)
      |         ^~~~~~~~~~~~
./include/linux/list.h:564:9: note: in expansion of macro =E2=80=98list_ent=
ry=E2=80=99
  564 |         list_entry((pos)->member.next, typeof(*(pos)), member)
      |         ^~~~~~~~~~
./include/linux/list.h:676:20: note: in expansion of macro =E2=80=98list_ne=
xt_entry=E2=80=99
  676 |              pos =3D list_next_entry(pos, member))
      |                    ^~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:493:9: note: in expansion of m=
acro =E2=80=98list_for_each_entry=E2=80=99
  493 |         list_for_each_entry(block, &vres->blocks, link)
      |         ^~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:496:17: error: implicit declar=
ation of function =E2=80=98amdgpu_vram_mgr_first_block=E2=80=99; did you me=
an =E2=80=98amdgpu_vram_mgr_virt_start=E2=80=99? [-Werror=3Dimplicit-functi=
on-declaration]
  496 |         block =3D amdgpu_vram_mgr_first_block(&vres->blocks);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                 amdgpu_vram_mgr_virt_start
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:502:28: error: implicit declar=
ation of function =E2=80=98amdgpu_vram_mgr_block_start=E2=80=99; did you me=
an =E2=80=98amdgpu_vram_mgr_virt_start=E2=80=99? [-Werror=3Dimplicit-functi=
on-declaration]
  502 |         vres->base.start =3D amdgpu_vram_mgr_block_start(block) >> =
PAGE_SHIFT;
      |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                            amdgpu_vram_mgr_virt_start
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:504:13: error: implicit declar=
ation of function =E2=80=98amdgpu_is_vram_mgr_blocks_contiguous=E2=80=99 [-=
Werror=3Dimplicit-function-declaration]
  504 |         if (amdgpu_is_vram_mgr_blocks_contiguous(&vres->blocks))
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[4]: *** [scripts/Makefile.build:249: drivers/gpu/drm/amd/amdgpu/amdgpu=
_vram_mgr.o] Error 1
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [scripts/Makefile.build:466: drivers/gpu/drm/amd/amdgpu] Error=
 2
make[2]: *** [scripts/Makefile.build:466: drivers/gpu/drm] Error 2
make[1]: *** [scripts/Makefile.build:466: drivers/gpu] Error 2
make: *** [Makefile:1843: drivers] Error 2
mchehab@sal /new_devel/v4l/tmp $ nano drivers/gpu/drm/amd/amdgpu/amdgpu_vra=
m_mgr.c
mchehab@sal /new_devel/v4l/tmp $ make drivers/gpu/drm/amd/amdgpu/
  DESCEND objtool
  CALL    scripts/atomic/check-atomics.sh
  CALL    scripts/checksyscalls.sh
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_csa.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_umc.o
In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:30:
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h:29:8: error: redefinition of =
=E2=80=98struct amdgpu_vram_mgr=E2=80=99
   29 | struct amdgpu_vram_mgr {
      |        ^~~~~~~~~~~~~~~
In file included from drivers/gpu/drm/amd/amdgpu/amdgpu.h:73,
                 from drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:28:
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h:41:8: note: originally defined here
   41 | struct amdgpu_vram_mgr {
      |        ^~~~~~~~~~~~~~~
In file included from ./include/linux/bits.h:22,
                 from ./include/linux/ratelimit_types.h:5,
                 from ./include/linux/ratelimit.h:5,
                 from ./include/linux/dev_printk.h:16,
                 from ./include/linux/device.h:15,
                 from ./include/linux/dma-mapping.h:7,
                 from drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:25:
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: In function =E2=80=98to_amdgp=
u_device=E2=80=99:
./include/linux/build_bug.h:78:41: error: static assertion failed: "pointer=
 type mismatch in container_of()"
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                         ^~~~~~~~~~~~~~
./include/linux/build_bug.h:77:34: note: in expansion of macro =E2=80=98__s=
tatic_assert=E2=80=99
   77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS_=
_, #expr)
      |                                  ^~~~~~~~~~~~~~~
./include/linux/container_of.h:19:9: note: in expansion of macro =E2=80=98s=
tatic_assert=E2=80=99
   19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||  =
     \
      |         ^~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:49:16: note: in expansion of m=
acro =E2=80=98container_of=E2=80=99
   49 |         return container_of(mgr, struct amdgpu_device, mman.vram_mg=
r);
      |                ^~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: In function =E2=80=98amdgpu_v=
ram_mgr_do_reserve=E2=80=99:
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:244:29: error: initialization =
of =E2=80=98struct drm_mm *=E2=80=99 from incompatible pointer type =E2=80=
=98struct drm_buddy *=E2=80=99 [-Werror=3Dincompatible-pointer-types]
  244 |         struct drm_mm *mm =3D &mgr->mm;
      |                             ^
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: At top level:
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:273:5: error: conflicting type=
s for =E2=80=98amdgpu_vram_mgr_reserve_range=E2=80=99; have =E2=80=98int(st=
ruct amdgpu_vram_mgr *, uint64_t,  uint64_t)=E2=80=99 {aka =E2=80=98int(str=
uct amdgpu_vram_mgr *, long long unsigned int,  long long unsigned int)=E2=
=80=99}
  273 | int amdgpu_vram_mgr_reserve_range(struct amdgpu_vram_mgr *mgr,
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h:129:5: note: previous declaration o=
f =E2=80=98amdgpu_vram_mgr_reserve_range=E2=80=99 with type =E2=80=98int(st=
ruct amdgpu_vram_mgr *, uint64_t,  uint64_t)=E2=80=99 {aka =E2=80=98int(str=
uct amdgpu_vram_mgr *, long long unsigned int,  long long unsigned int)=E2=
=80=99}
  129 | int amdgpu_vram_mgr_reserve_range(struct amdgpu_vram_mgr *mgr,
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: In function =E2=80=98amdgpu_v=
ram_mgr_reserve_range=E2=80=99:
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:286:19: error: passing argumen=
t 1 of =E2=80=98spin_lock=E2=80=99 from incompatible pointer type [-Werror=
=3Dincompatible-pointer-types]
  286 |         spin_lock(&mgr->lock);
      |                   ^~~~~~~~~~
      |                   |
      |                   struct mutex *
In file included from ./include/linux/wait.h:9,
                 from ./include/linux/pid.h:6,
                 from ./include/linux/sched.h:14,
                 from ./include/linux/ratelimit.h:6:
./include/linux/spinlock.h:347:51: note: expected =E2=80=98spinlock_t *=E2=
=80=99 {aka =E2=80=98struct spinlock *=E2=80=99} but argument is of type =
=E2=80=98struct mutex *=E2=80=99
  347 | static __always_inline void spin_lock(spinlock_t *lock)
      |                                       ~~~~~~~~~~~~^~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:289:21: error: passing argumen=
t 1 of =E2=80=98spin_unlock=E2=80=99 from incompatible pointer type [-Werro=
r=3Dincompatible-pointer-types]
  289 |         spin_unlock(&mgr->lock);
      |                     ^~~~~~~~~~
      |                     |
      |                     struct mutex *
./include/linux/spinlock.h:387:53: note: expected =E2=80=98spinlock_t *=E2=
=80=99 {aka =E2=80=98struct spinlock *=E2=80=99} but argument is of type =
=E2=80=98struct mutex *=E2=80=99
  387 | static __always_inline void spin_unlock(spinlock_t *lock)
      |                                         ~~~~~~~~~~~~^~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: At top level:
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:305:5: error: conflicting type=
s for =E2=80=98amdgpu_vram_mgr_query_page_status=E2=80=99; have =E2=80=98in=
t(struct amdgpu_vram_mgr *, uint64_t)=E2=80=99 {aka =E2=80=98int(struct amd=
gpu_vram_mgr *, long long unsigned int)=E2=80=99}
  305 | int amdgpu_vram_mgr_query_page_status(struct amdgpu_vram_mgr *mgr,
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h:131:5: note: previous declaration o=
f =E2=80=98amdgpu_vram_mgr_query_page_status=E2=80=99 with type =E2=80=98in=
t(struct amdgpu_vram_mgr *, uint64_t)=E2=80=99 {aka =E2=80=98int(struct amd=
gpu_vram_mgr *, long long unsigned int)=E2=80=99}
  131 | int amdgpu_vram_mgr_query_page_status(struct amdgpu_vram_mgr *mgr,
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: In function =E2=80=98amdgpu_v=
ram_mgr_query_page_status=E2=80=99:
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:311:19: error: passing argumen=
t 1 of =E2=80=98spin_lock=E2=80=99 from incompatible pointer type [-Werror=
=3Dincompatible-pointer-types]
  311 |         spin_lock(&mgr->lock);
      |                   ^~~~~~~~~~
      |                   |
      |                   struct mutex *
./include/linux/spinlock.h:347:51: note: expected =E2=80=98spinlock_t *=E2=
=80=99 {aka =E2=80=98struct spinlock *=E2=80=99} but argument is of type =
=E2=80=98struct mutex *=E2=80=99
  347 | static __always_inline void spin_lock(spinlock_t *lock)
      |                                       ~~~~~~~~~~~~^~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:331:21: error: passing argumen=
t 1 of =E2=80=98spin_unlock=E2=80=99 from incompatible pointer type [-Werro=
r=3Dincompatible-pointer-types]
  331 |         spin_unlock(&mgr->lock);
      |                     ^~~~~~~~~~
      |                     |
      |                     struct mutex *
./include/linux/spinlock.h:387:53: note: expected =E2=80=98spinlock_t *=E2=
=80=99 {aka =E2=80=98struct spinlock *=E2=80=99} but argument is of type =
=E2=80=98struct mutex *=E2=80=99
  387 | static __always_inline void spin_unlock(spinlock_t *lock)
      |                                         ~~~~~~~~~~~~^~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: In function =E2=80=98amdgpu_v=
ram_mgr_new=E2=80=99:
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:377:29: error: initialization =
of =E2=80=98struct drm_mm *=E2=80=99 from incompatible pointer type =E2=80=
=98struct drm_buddy *=E2=80=99 [-Werror=3Dincompatible-pointer-types]
  377 |         struct drm_mm *mm =3D &mgr->mm;
      |                             ^
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:429:19: error: passing argumen=
t 1 of =E2=80=98spin_lock=E2=80=99 from incompatible pointer type [-Werror=
=3Dincompatible-pointer-types]
  429 |         spin_lock(&mgr->lock);
      |                   ^~~~~~~~~~
      |                   |
      |                   struct mutex *
./include/linux/spinlock.h:347:51: note: expected =E2=80=98spinlock_t *=E2=
=80=99 {aka =E2=80=98struct spinlock *=E2=80=99} but argument is of type =
=E2=80=98struct mutex *=E2=80=99
  347 | static __always_inline void spin_lock(spinlock_t *lock)
      |                                       ~~~~~~~~~~~~^~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:458:21: error: passing argumen=
t 1 of =E2=80=98spin_unlock=E2=80=99 from incompatible pointer type [-Werro=
r=3Dincompatible-pointer-types]
  458 |         spin_unlock(&mgr->lock);
      |                     ^~~~~~~~~~
      |                     |
      |                     struct mutex *
./include/linux/spinlock.h:387:53: note: expected =E2=80=98spinlock_t *=E2=
=80=99 {aka =E2=80=98struct spinlock *=E2=80=99} but argument is of type =
=E2=80=98struct mutex *=E2=80=99
  387 | static __always_inline void spin_unlock(spinlock_t *lock)
      |                                         ~~~~~~~~~~~~^~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:460:13: error: =E2=80=98cur_si=
ze=E2=80=99 undeclared (first use in this function)
  460 |         if (cur_size !=3D size) {
      |             ^~~~~~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:460:13: note: each undeclared =
identifier is reported only once for each function it appears in
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:460:25: error: =E2=80=98size=
=E2=80=99 undeclared (first use in this function); did you mean =E2=80=98ks=
ize=E2=80=99?
  460 |         if (cur_size !=3D size) {
      |                         ^~~~
      |                         ksize
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:466:30: error: =E2=80=98vres=
=E2=80=99 undeclared (first use in this function); did you mean =E2=80=98re=
s=E2=80=99?
  466 |                 trim_list =3D &vres->blocks;
      |                              ^~~~
      |                              res
././include/linux/compiler_types.h:295:27: error: expression in static asse=
rtion is not an integer
  295 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), t=
ypeof(b))
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/build_bug.h:78:56: note: in definition of macro =E2=80=98__=
static_assert=E2=80=99
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
./include/linux/container_of.h:19:9: note: in expansion of macro =E2=80=98s=
tatic_assert=E2=80=99
   19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||  =
     \
      |         ^~~~~~~~~~~~~
./include/linux/container_of.h:19:23: note: in expansion of macro =E2=80=98=
__same_type=E2=80=99
   19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||  =
     \
      |                       ^~~~~~~~~~~
./include/linux/list.h:520:9: note: in expansion of macro =E2=80=98containe=
r_of=E2=80=99
  520 |         container_of(ptr, type, member)
      |         ^~~~~~~~~~~~
./include/linux/list.h:542:9: note: in expansion of macro =E2=80=98list_ent=
ry=E2=80=99
  542 |         list_entry((ptr)->prev, type, member)
      |         ^~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:474:33: note: in expansion of =
macro =E2=80=98list_last_entry=E2=80=99
  474 |                         block =3D list_last_entry(&vres->blocks, ty=
peof(*block), link);
      |                                 ^~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:485:38: error: passing argumen=
t 1 of =E2=80=98drm_buddy_block_trim=E2=80=99 from incompatible pointer typ=
e [-Werror=3Dincompatible-pointer-types]
  485 |                 drm_buddy_block_trim(mm,
      |                                      ^~
      |                                      |
      |                                      struct drm_mm *
In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h:27:
./include/drm/drm_buddy.h:146:44: note: expected =E2=80=98struct drm_buddy =
*=E2=80=99 but argument is of type =E2=80=98struct drm_mm *=E2=80=99
  146 | int drm_buddy_block_trim(struct drm_buddy *mm,
      |                          ~~~~~~~~~~~~~~~~~~^~
In file included from ./include/linux/rculist.h:10,
                 from ./include/linux/pid.h:5:
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:494:29: error: =E2=80=98block=
=E2=80=99 undeclared (first use in this function); did you mean =E2=80=98fl=
ock=E2=80=99?
  494 |         list_for_each_entry(block, &vres->blocks, link)
      |                             ^~~~~
./include/linux/list.h:674:14: note: in definition of macro =E2=80=98list_f=
or_each_entry=E2=80=99
  674 |         for (pos =3D list_first_entry(head, typeof(*pos), member); =
       \
      |              ^~~
././include/linux/compiler_types.h:295:27: error: expression in static asse=
rtion is not an integer
  295 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), t=
ypeof(b))
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/build_bug.h:78:56: note: in definition of macro =E2=80=98__=
static_assert=E2=80=99
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
./include/linux/container_of.h:19:9: note: in expansion of macro =E2=80=98s=
tatic_assert=E2=80=99
   19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||  =
     \
      |         ^~~~~~~~~~~~~
./include/linux/container_of.h:19:23: note: in expansion of macro =E2=80=98=
__same_type=E2=80=99
   19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||  =
     \
      |                       ^~~~~~~~~~~
./include/linux/list.h:520:9: note: in expansion of macro =E2=80=98containe=
r_of=E2=80=99
  520 |         container_of(ptr, type, member)
      |         ^~~~~~~~~~~~
./include/linux/list.h:531:9: note: in expansion of macro =E2=80=98list_ent=
ry=E2=80=99
  531 |         list_entry((ptr)->next, type, member)
      |         ^~~~~~~~~~
./include/linux/list.h:674:20: note: in expansion of macro =E2=80=98list_fi=
rst_entry=E2=80=99
  674 |         for (pos =3D list_first_entry(head, typeof(*pos), member); =
       \
      |                    ^~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:494:9: note: in expansion of m=
acro =E2=80=98list_for_each_entry=E2=80=99
  494 |         list_for_each_entry(block, &vres->blocks, link)
      |         ^~~~~~~~~~~~~~~~~~~
././include/linux/compiler_types.h:295:27: error: expression in static asse=
rtion is not an integer
  295 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), t=
ypeof(b))
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/build_bug.h:78:56: note: in definition of macro =E2=80=98__=
static_assert=E2=80=99
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
./include/linux/container_of.h:19:9: note: in expansion of macro =E2=80=98s=
tatic_assert=E2=80=99
   19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||  =
     \
      |         ^~~~~~~~~~~~~
./include/linux/container_of.h:19:23: note: in expansion of macro =E2=80=98=
__same_type=E2=80=99
   19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||  =
     \
      |                       ^~~~~~~~~~~
./include/linux/list.h:520:9: note: in expansion of macro =E2=80=98containe=
r_of=E2=80=99
  520 |         container_of(ptr, type, member)
      |         ^~~~~~~~~~~~
./include/linux/list.h:564:9: note: in expansion of macro =E2=80=98list_ent=
ry=E2=80=99
  564 |         list_entry((pos)->member.next, typeof(*(pos)), member)
      |         ^~~~~~~~~~
./include/linux/list.h:676:20: note: in expansion of macro =E2=80=98list_ne=
xt_entry=E2=80=99
  676 |              pos =3D list_next_entry(pos, member))
      |                    ^~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:494:9: note: in expansion of m=
acro =E2=80=98list_for_each_entry=E2=80=99
  494 |         list_for_each_entry(block, &vres->blocks, link)
      |         ^~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:520:21: error: passing argumen=
t 1 of =E2=80=98spin_unlock=E2=80=99 from incompatible pointer type [-Werro=
r=3Dincompatible-pointer-types]
  520 |         spin_unlock(&mgr->lock);
      |                     ^~~~~~~~~~
      |                     |
      |                     struct mutex *
./include/linux/spinlock.h:387:53: note: expected =E2=80=98spinlock_t *=E2=
=80=99 {aka =E2=80=98struct spinlock *=E2=80=99} but argument is of type =
=E2=80=98struct mutex *=E2=80=99
  387 | static __always_inline void spin_unlock(spinlock_t *lock)
      |                                         ~~~~~~~~~~~~^~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: In function =E2=80=98amdgpu_v=
ram_mgr_del=E2=80=99:
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:545:19: error: passing argumen=
t 1 of =E2=80=98spin_lock=E2=80=99 from incompatible pointer type [-Werror=
=3Dincompatible-pointer-types]
  545 |         spin_lock(&mgr->lock);
      |                   ^~~~~~~~~~
      |                   |
      |                   struct mutex *
./include/linux/spinlock.h:347:51: note: expected =E2=80=98spinlock_t *=E2=
=80=99 {aka =E2=80=98struct spinlock *=E2=80=99} but argument is of type =
=E2=80=98struct mutex *=E2=80=99
  347 | static __always_inline void spin_lock(spinlock_t *lock)
      |                                       ~~~~~~~~~~~~^~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:554:21: error: passing argumen=
t 1 of =E2=80=98spin_unlock=E2=80=99 from incompatible pointer type [-Werro=
r=3Dincompatible-pointer-types]
  554 |         spin_unlock(&mgr->lock);
      |                     ^~~~~~~~~~
      |                     |
      |                     struct mutex *
./include/linux/spinlock.h:387:53: note: expected =E2=80=98spinlock_t *=E2=
=80=99 {aka =E2=80=98struct spinlock *=E2=80=99} but argument is of type =
=E2=80=98struct mutex *=E2=80=99
  387 | static __always_inline void spin_unlock(spinlock_t *lock)
      |                                         ~~~~~~~~~~~~^~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: At top level:
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:680:10: error: conflicting typ=
es for =E2=80=98amdgpu_vram_mgr_vis_usage=E2=80=99; have =E2=80=98uint64_t(=
struct amdgpu_vram_mgr *)=E2=80=99 {aka =E2=80=98long long unsigned int(str=
uct amdgpu_vram_mgr *)=E2=80=99}
  680 | uint64_t amdgpu_vram_mgr_vis_usage(struct amdgpu_vram_mgr *mgr)
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h:128:10: note: previous declaration =
of =E2=80=98amdgpu_vram_mgr_vis_usage=E2=80=99 with type =E2=80=98uint64_t(=
struct amdgpu_vram_mgr *)=E2=80=99 {aka =E2=80=98long long unsigned int(str=
uct amdgpu_vram_mgr *)=E2=80=99}
  128 | uint64_t amdgpu_vram_mgr_vis_usage(struct amdgpu_vram_mgr *mgr);
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: In function =E2=80=98amdgpu_v=
ram_mgr_debug=E2=80=99:
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:701:19: error: passing argumen=
t 1 of =E2=80=98spin_lock=E2=80=99 from incompatible pointer type [-Werror=
=3Dincompatible-pointer-types]
  701 |         spin_lock(&mgr->lock);
      |                   ^~~~~~~~~~
      |                   |
      |                   struct mutex *
./include/linux/spinlock.h:347:51: note: expected =E2=80=98spinlock_t *=E2=
=80=99 {aka =E2=80=98struct spinlock *=E2=80=99} but argument is of type =
=E2=80=98struct mutex *=E2=80=99
  347 | static __always_inline void spin_lock(spinlock_t *lock)
      |                                       ~~~~~~~~~~~~^~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:702:22: error: passing argumen=
t 1 of =E2=80=98drm_mm_print=E2=80=99 from incompatible pointer type [-Werr=
or=3Dincompatible-pointer-types]
  702 |         drm_mm_print(&mgr->mm, printer);
      |                      ^~~~~~~~
      |                      |
      |                      struct drm_buddy *
In file included from ./include/drm/ttm/ttm_range_manager.h:8,
                 from drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:26:
./include/drm/drm_mm.h:551:40: note: expected =E2=80=98const struct drm_mm =
*=E2=80=99 but argument is of type =E2=80=98struct drm_buddy *=E2=80=99
  551 | void drm_mm_print(const struct drm_mm *mm, struct drm_printer *p);
      |                   ~~~~~~~~~~~~~~~~~~~~~^~
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:703:21: error: passing argumen=
t 1 of =E2=80=98spin_unlock=E2=80=99 from incompatible pointer type [-Werro=
r=3Dincompatible-pointer-types]
  703 |         spin_unlock(&mgr->lock);
      |                     ^~~~~~~~~~
      |                     |
      |                     struct mutex *
./include/linux/spinlock.h:387:53: note: expected =E2=80=98spinlock_t *=E2=
=80=99 {aka =E2=80=98struct spinlock *=E2=80=99} but argument is of type =
=E2=80=98struct mutex *=E2=80=99
  387 | static __always_inline void spin_unlock(spinlock_t *lock)
      |                                         ~~~~~~~~~~~~^~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: In function =E2=80=98amdgpu_v=
ram_mgr_init=E2=80=99:
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:721:39: error: initialization =
of =E2=80=98struct amdgpu_vram_mgr *=E2=80=99 from incompatible pointer typ=
e =E2=80=98struct amdgpu_vram_mgr *=E2=80=99 [-Werror=3Dincompatible-pointe=
r-types]
  721 |         struct amdgpu_vram_mgr *mgr =3D &adev->mman.vram_mgr;
      |                                       ^
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:729:21: error: passing argumen=
t 1 of =E2=80=98drm_mm_init=E2=80=99 from incompatible pointer type [-Werro=
r=3Dincompatible-pointer-types]
  729 |         drm_mm_init(&mgr->mm, 0, man->size >> PAGE_SHIFT);
      |                     ^~~~~~~~
      |                     |
      |                     struct drm_buddy *
./include/drm/drm_mm.h:467:33: note: expected =E2=80=98struct drm_mm *=E2=
=80=99 but argument is of type =E2=80=98struct drm_buddy *=E2=80=99
  467 | void drm_mm_init(struct drm_mm *mm, u64 start, u64 size);
      |                  ~~~~~~~~~~~~~~~^~
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:730:24: error: passing argumen=
t 1 of =E2=80=98spinlock_check=E2=80=99 from incompatible pointer type [-We=
rror=3Dincompatible-pointer-types]
  730 |         spin_lock_init(&mgr->lock);
      |                        ^~~~~~~~~~
      |                        |
      |                        struct mutex *
./include/linux/spinlock.h:341:24: note: in definition of macro =E2=80=98sp=
in_lock_init=E2=80=99
  341 |         spinlock_check(_lock);                  \
      |                        ^~~~~
./include/linux/spinlock.h:322:67: note: expected =E2=80=98spinlock_t *=E2=
=80=99 {aka =E2=80=98struct spinlock *=E2=80=99} but argument is of type =
=E2=80=98struct mutex *=E2=80=99
  322 | static __always_inline raw_spinlock_t *spinlock_check(spinlock_t *l=
ock)
      |                                                       ~~~~~~~~~~~~^=
~~~
In file included from ./include/linux/spinlock.h:87:
./include/linux/spinlock_types.h:41:9: error: incompatible types when assig=
ning to type =E2=80=98struct mutex=E2=80=99 from type =E2=80=98spinlock_t=
=E2=80=99 {aka =E2=80=98struct spinlock=E2=80=99}
   41 |         (spinlock_t) __SPIN_LOCK_INITIALIZER(lockname)
      |         ^
./include/linux/spinlock.h:342:20: note: in expansion of macro =E2=80=98__S=
PIN_LOCK_UNLOCKED=E2=80=99
  342 |         *(_lock) =3D __SPIN_LOCK_UNLOCKED(_lock); \
      |                    ^~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:730:9: note: in expansion of m=
acro =E2=80=98spin_lock_init=E2=80=99
  730 |         spin_lock_init(&mgr->lock);
      |         ^~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: In function =E2=80=98amdgpu_v=
ram_mgr_fini=E2=80=99:
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:749:39: error: initialization =
of =E2=80=98struct amdgpu_vram_mgr *=E2=80=99 from incompatible pointer typ=
e =E2=80=98struct amdgpu_vram_mgr *=E2=80=99 [-Werror=3Dincompatible-pointe=
r-types]
  749 |         struct amdgpu_vram_mgr *mgr =3D &adev->mman.vram_mgr;
      |                                       ^
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:760:19: error: passing argumen=
t 1 of =E2=80=98spin_lock=E2=80=99 from incompatible pointer type [-Werror=
=3Dincompatible-pointer-types]
  760 |         spin_lock(&mgr->lock);
      |                   ^~~~~~~~~~
      |                   |
      |                   struct mutex *
./include/linux/spinlock.h:347:51: note: expected =E2=80=98spinlock_t *=E2=
=80=99 {aka =E2=80=98struct spinlock *=E2=80=99} but argument is of type =
=E2=80=98struct mutex *=E2=80=99
  347 | static __always_inline void spin_lock(spinlock_t *lock)
      |                                       ~~~~~~~~~~~~^~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:768:25: error: passing argumen=
t 1 of =E2=80=98drm_mm_takedown=E2=80=99 from incompatible pointer type [-W=
error=3Dincompatible-pointer-types]
  768 |         drm_mm_takedown(&mgr->mm);
      |                         ^~~~~~~~
      |                         |
      |                         struct drm_buddy *
./include/drm/drm_mm.h:468:37: note: expected =E2=80=98struct drm_mm *=E2=
=80=99 but argument is of type =E2=80=98struct drm_buddy *=E2=80=99
  468 | void drm_mm_takedown(struct drm_mm *mm);
      |                      ~~~~~~~~~~~~~~~^~
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:769:21: error: passing argumen=
t 1 of =E2=80=98spin_unlock=E2=80=99 from incompatible pointer type [-Werro=
r=3Dincompatible-pointer-types]
  769 |         spin_unlock(&mgr->lock);
      |                     ^~~~~~~~~~
      |                     |
      |                     struct mutex *
./include/linux/spinlock.h:387:53: note: expected =E2=80=98spinlock_t *=E2=
=80=99 {aka =E2=80=98struct spinlock *=E2=80=99} but argument is of type =
=E2=80=98struct mutex *=E2=80=99
  387 | static __always_inline void spin_unlock(spinlock_t *lock)
      |                                         ~~~~~~~~~~~~^~~~
cc1: all warnings being treated as errors
make[4]: *** [scripts/Makefile.build:249: drivers/gpu/drm/amd/amdgpu/amdgpu=
_vram_mgr.o] Error 1
make[4]: *** Waiting for unfinished jobs....
  CC [M]  drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.o
make[3]: *** [scripts/Makefile.build:466: drivers/gpu/drm/amd/amdgpu] Error=
 2
make[2]: *** [scripts/Makefile.build:466: drivers/gpu/drm] Error 2
make[1]: *** [scripts/Makefile.build:466: drivers/gpu] Error 2
make: *** [Makefile:1843: drivers] Error 2

Regards,
Mauro

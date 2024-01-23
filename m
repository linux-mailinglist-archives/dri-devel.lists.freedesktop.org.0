Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5339B838DFF
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 12:54:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D64310E78B;
	Tue, 23 Jan 2024 11:54:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 464 seconds by postgrey-1.36 at gabe;
 Tue, 23 Jan 2024 11:54:28 UTC
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D4F910E78B
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 11:54:28 +0000 (UTC)
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by cantor.telenet-ops.be (Postfix) with ESMTPS id 4TK50J01V2z4x1Tq
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 12:46:40 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:8ec8:24bf:c2ed:213e])
 by andre.telenet-ops.be with bizsmtp
 id eBlV2B0032E7G5801BlVKu; Tue, 23 Jan 2024 12:45:37 +0100
Received: from geert (helo=localhost)
 by ramsan.of.borg with local-esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1rSFDd-00GLOZ-05;
 Tue, 23 Jan 2024 12:45:29 +0100
Date: Tue, 23 Jan 2024 12:45:28 +0100 (CET)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: linux-kernel@vger.kernel.org
Subject: Re: Build regressions/improvements in v6.8-rc1
In-Reply-To: <20240123111235.3097079-1-geert@linux-m68k.org>
Message-ID: <d03e90ca-8485-4d1b-5ec1-c3398e0e8da@linux-m68k.org>
References: <CAHk-=wiB4iHTtfZKiy5pC24uOjun4fbj4kSX0=ZnGsOXadMf6g@mail.gmail.com>
 <20240123111235.3097079-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-792708632-1706010328=:3895412"
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
Cc: Chris Zankel <chris@zankel.net>, Arnd Bergmann <arnd@arndb.de>,
 linux-scsi@vger.kernel.org, linux-sh@vger.kernel.org, netdev@vger.kernel.org,
 mpi3mr-linuxdrv.pdl@broadcom.com, qat-linux@intel.com,
 dri-devel@lists.freedesktop.org, Max Filippov <jcmvbkbc@gmail.com>,
 linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org,
 sparclinux@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org,
 linux-crypto@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-792708632-1706010328=:3895412
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 23 Jan 2024, Geert Uytterhoeven wrote:
> Below is the list of build error/warning regressions/improvements in
> v6.8-rc1[1] compared to v6.7[2].
>
> Summarized:
>  - build errors: +68/-18
>  - build warnings: +129/-1487
>
> Happy fixing! ;-)
>
> Thanks to the linux-next team for providing the build service.
>
> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/6613476e225e090cc9aad49be7fa504e290dd33d/ (all 239 configs)
> [2] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/0dd3ee31125508cd67f7e7172247f05b7fd1753a/ (all 239 configs)
>
>
> *** ERRORS ***
>
> 68 error regressions:

>  + /kisskb/src/arch/powerpc/sysdev/udbg_memcons.c: error: no previous prototype for 'memcons_getc' [-Werror=missing-prototypes]:  => 80:5
>  + /kisskb/src/arch/powerpc/sysdev/udbg_memcons.c: error: no previous prototype for 'memcons_getc_poll' [-Werror=missing-prototypes]:  => 57:5
>  + /kisskb/src/arch/powerpc/sysdev/udbg_memcons.c: error: no previous prototype for 'memcons_putc' [-Werror=missing-prototypes]:  => 44:6

powerpc-gcc{5,12,13}/ppc64_book3e_allmodconfig

>  + /kisskb/src/arch/sh/kernel/cpu/init.c: error: no previous prototype for 'l2_cache_init' [-Werror=missing-prototypes]:  => 99:29

sh4-gcc1[123]/se7{619,750}_defconfig
sh4-gcc1[123]/sh-{all{mod,no,yes},def}config
sh4-gcc11/sh-allnoconfig

>  + /kisskb/src/arch/sh/math-emu/math.c: error: no previous prototype for 'do_fpu_inst' [-Werror=missing-prototypes]:  => 492:5

sh4-gcc1[123]/sh-all{mod,yes}config

>  + /kisskb/src/arch/sh/mm/cache-sh2.c: error: no previous prototype for 'sh2_cache_init' [-Werror=missing-prototypes]:  => 85:13

sh4-gcc1[123]/se7619_defconfig
sh4-gcc1[123]/sh-all{mod,yes}config

>  + /kisskb/src/arch/sh/mm/nommu.c: error: no previous prototype for 'kmap_coherent' [-Werror=missing-prototypes]:  => 80:7
>  + /kisskb/src/arch/sh/mm/nommu.c: error: no previous prototype for 'kmap_coherent_init' [-Werror=missing-prototypes]:  => 76:13
>  + /kisskb/src/arch/sh/mm/nommu.c: error: no previous prototype for 'kunmap_coherent' [-Werror=missing-prototypes]:  => 86:6

sh4-gcc1[123]/se7619_defconfig
sh4-gcc1[123]/sh-allnoconfig
sh4-gcc12/sh-allyesconfig

>  + /kisskb/src/arch/sparc/include/asm/floppy_64.h: error: no previous prototype for 'sparc_floppy_irq' [-Werror=missing-prototypes]:  => 200:13
>  + /kisskb/src/arch/sparc/include/asm/floppy_64.h: error: no previous prototype for 'sun_pci_fd_dma_callback' [-Werror=missing-prototypes]:  => 437:6

sparc64-gcc{5,11,12,13}/sparc64-allmodconfig

>  + /kisskb/src/arch/sparc/kernel/traps_64.c: error: no previous prototype for 'do_mcd_err' [-Werror=missing-prototypes]:  => 2035:6
>  + /kisskb/src/arch/sparc/kernel/traps_64.c: error: no previous prototype for 'is_no_fault_exception' [-Werror=missing-prototypes]:  => 253:6
>  + /kisskb/src/arch/sparc/kernel/traps_64.c: error: no previous prototype for 'sun4v_nonresum_error_user_handled' [-Werror=missing-prototypes]:  => 2153:6
>  + /kisskb/src/arch/sparc/prom/misc_64.c: error: no previous prototype for 'prom_get_mmu_ihandle' [-Werror=missing-prototypes]:  => 165:5
>  + /kisskb/src/arch/sparc/prom/p1275.c: error: no previous prototype for 'prom_cif_init' [-Werror=missing-prototypes]:  => 52:6
>  + /kisskb/src/kernel/dma.c: error: no previous prototype for 'free_dma' [-Werror=missing-prototypes]:  => 88:6
>  + /kisskb/src/kernel/dma.c: error: no previous prototype for 'request_dma' [-Werror=missing-prototypes]:  => 70:5

sparc64-gcc{5,1[123]}/sparc64-{all{mod,no},def}config

>  + /kisskb/src/arch/sparc/lib/cmpdi2.c: error: no previous prototype for '__cmpdi2' [-Werror=missing-prototypes]:  => 6:11

sparc64-gcc{5,1[123]}/sparc-{all{mod,no},def}config

>  + /kisskb/src/arch/sparc/mm/init_64.c: error: no previous prototype for 'vmemmap_free' [-Werror=missing-prototypes]:  => 2644:6

sparc64-gcc{5,1[123]}/sparc64-{allmod,def}config

>  + /kisskb/src/arch/sparc/power/hibernate.c: error: no previous prototype for 'pfn_is_nosave' [-Werror=missing-prototypes]:  => 22:5
>  + /kisskb/src/arch/sparc/power/hibernate.c: error: no previous prototype for 'restore_processor_state' [-Werror=missing-prototypes]:  => 35:6
>  + /kisskb/src/arch/sparc/power/hibernate.c: error: no previous prototype for 'save_processor_state' [-Werror=missing-prototypes]:  => 30:6
>  + /kisskb/src/drivers/gpu/drm/xe/xe_lrc.c: error: "CTX_VALID" redefined [-Werror]:  => 24, 24:0
>  + /kisskb/src/drivers/mtd/maps/sun_uflash.c: error: no previous prototype for 'uflash_devinit' [-Werror=missing-prototypes]:  => 50:5

sparc64-gcc{5,1[123]}/sparc64-allmodconfig

>  + /kisskb/src/arch/sparc/vdso/vclock_gettime.c: error: no previous prototype for '__vdso_clock_gettime' [-Werror=missing-prototypes]:  => 254:1
>  + /kisskb/src/arch/sparc/vdso/vclock_gettime.c: error: no previous prototype for '__vdso_clock_gettime_stick' [-Werror=missing-prototypes]:  => 282:1
>  + /kisskb/src/arch/sparc/vdso/vclock_gettime.c: error: no previous prototype for '__vdso_gettimeofday' [-Werror=missing-prototypes]:  => 307:1
>  + /kisskb/src/arch/sparc/vdso/vclock_gettime.c: error: no previous prototype for '__vdso_gettimeofday_stick' [-Werror=missing-prototypes]:  => 343:1
>  + /kisskb/src/arch/sparc/vdso/vdso32/../vclock_gettime.c: error: no previous prototype for '__vdso_clock_gettime' [-Werror=missing-prototypes]:  => 254:1
>  + /kisskb/src/arch/sparc/vdso/vdso32/../vclock_gettime.c: error: no previous prototype for '__vdso_clock_gettime_stick' [-Werror=missing-prototypes]:  => 282:1
>  + /kisskb/src/arch/sparc/vdso/vdso32/../vclock_gettime.c: error: no previous prototype for '__vdso_gettimeofday' [-Werror=missing-prototypes]:  => 307:1
>  + /kisskb/src/arch/sparc/vdso/vdso32/../vclock_gettime.c: error: no previous prototype for '__vdso_gettimeofday_stick' [-Werror=missing-prototypes]:  => 343:1
>  + /kisskb/src/arch/sparc/vdso/vma.c: error: no previous prototype for 'init_vdso_image' [-Werror=missing-prototypes]:  => 246:12

sparc64-gcc{5,12,13}/sparc64-{allno,def}config
sparc64-gcc11/sparc64-{all{mod,no},def}config

>  + /kisskb/src/arch/x86/um/shared/sysdep/kernel-offsets.h: error: no previous prototype for ‘foo’ [-Werror=missing-prototypes]:  => 9:6

um-x86_64-gcc12/um-{all{mod,yes},def}config

>  + /kisskb/src/drivers/sbus/char/bbc_envctrl.c: error: no previous prototype for 'bbc_envctrl_cleanup' [-Werror=missing-prototypes]:  => 594:6
>  + /kisskb/src/drivers/sbus/char/bbc_envctrl.c: error: no previous prototype for 'bbc_envctrl_init' [-Werror=missing-prototypes]:  => 566:5

sparc64-gcc1[12]/sparc64-allmodconfig

>  + /kisskb/src/drivers/scsi/mpi3mr/mpi3mr_transport.c: error: the frame size of 1680 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]:  => 1818:1

xtensa-gcc11/xtensa-allmodconfig

>  + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_1044' declared with attribute error: FIELD_GET: mask is not constant:  => 435:38
>  + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_1064' declared with attribute error: FIELD_PREP: mask is not constant:  => 435:38

in drivers/net/ethernet/intel/ice/ice_base.c

powerpc-gcc5/ppc32_allmodconfig


>  + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_1083' declared with attribute error: FIELD_GET: mask is not constant:  => 435:38
>  + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_1136' declared with attribute error: FIELD_GET: mask is not constant:  => 435:38
>  + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_923' declared with attribute error: FIELD_GET: mask is not constant:  => 435:38

in drivers/net/ethernet/intel/ice/ice_nvm.c

aarcharm64-gcc5/arm64-allmodconfig
powerpc-gcc5/ppc32_allmodconfig
powerpc-gcc5/powerpc-allmodconfig
powerpc-gcc5/ppc64le_allmodconfig

>  + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_1094' declared with attribute error: FIELD_GET: mask is not constant:  => 435:38
>  + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_1147' declared with attribute error: FIELD_GET: mask is not constant:  => 435:38
>  + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_934' declared with attribute error: FIELD_GET: mask is not constant:  => 435:38

in drivers/net/ethernet/intel/ice/ice_common.c

arm64-gcc5/arm64-allmodconfig
powerpc-gcc5/ppc32_allmodconfig

>  + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_453' declared with attribute error: FIELD_PREP: mask is not constant:  => 435:38
>  + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_485' declared with attribute error: FIELD_PREP: mask is not constant:  => 435:38
>  + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_544' declared with attribute error: FIELD_GET: mask is not constant:  => 435:38
>  + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_565' declared with attribute error: FIELD_GET: mask is not constant:  => 435:38
>  + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_614' declared with attribute error: FIELD_PREP: mask is not constant:  => 435:38
>  + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_646' declared with attribute error: FIELD_PREP: mask is not constant:  => 435:38
>  + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_656' declared with attribute error: FIELD_PREP: mask is not constant:  => 435:38
>  + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_688' declared with attribute error: FIELD_PREP: mask is not constant:  => 435:38
>  + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_705' declared with attribute error: FIELD_GET: mask is not constant:  => 435:38
>  + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_747' declared with attribute error: FIELD_GET: mask is not constant:  => 435:38

in drivers/gpu/drm/xe/xe_guc_ct.c
arm64-gcc5/arm64-allmodconfig
powerpc-gcc5/ppc64_book3e_allmodconfig
powerpc-gcc5/powerpc-allmodconfig

>  + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_693' declared with attribute error: FIELD_GET: mask is not constant:  => 435:38
>  + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_704' declared with attribute error: FIELD_GET: mask is not constant:  => 435:38
>  + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_748' declared with attribute error: FIELD_GET: mask is not constant:  => 435:38

in drivers/net/ethernet/intel/i40e/i40e_dcb.c

powerpc-gcc5/powerpc-allmodconfig
powerpc-gcc5/ppc32_allmodconfig
powerpc-gcc5/ppc64_book3e_allmodconfig


arm64-gcc5/arm64-allmodconfig
powerpc-gcc5/powerpc-all{mod,yes}config
powerpc-gcc5/ppc{32,64le,64_book3e}_allmodconfig

>  + /kisskb/src/include/linux/fortify-string.h: error: call to '__read_overflow2_field' declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror]:  => 537:4
>  + /kisskb/src/include/linux/fortify-string.h: error: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror]:  => 528:4

mips-gcc8/mips-allmodconfig

>  + {standard input}: Error: displacement to undefined symbol .L105 overflows 8-bit field :  => 590, 593
>  + {standard input}: Error: displacement to undefined symbol .L135 overflows 8-bit field :  => 603
>  + {standard input}: Error: displacement to undefined symbol .L140 overflows 8-bit field :  => 606
>  + {standard input}: Error: displacement to undefined symbol .L76 overflows 12-bit field:  => 591, 594
>  + {standard input}: Error: displacement to undefined symbol .L77 overflows 8-bit field : 607 => 607, 582, 585
>  + {standard input}: Error: displacement to undefined symbol .L97 overflows 12-bit field:  => 607
>  + {standard input}: Error: pcrel too far: 604, 590, 577, 593, 572, 569, 598, 599, 596, 610 => 610, 574, 599, 569, 598, 596, 601, 590, 604, 595, 572, 577, 593

SH ICE crickets

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
--8323329-792708632-1706010328=:3895412--

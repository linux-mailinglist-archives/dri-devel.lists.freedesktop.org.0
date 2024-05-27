Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA15D8CFB2E
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 10:21:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 297A710F95F;
	Mon, 27 May 2024 08:21:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be
 [195.130.137.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E17810F95F
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 08:21:42 +0000 (UTC)
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4VnpX43CX7z4wxqp
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 10:21:40 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:c993:5573:f894:7353])
 by laurent.telenet-ops.be with bizsmtp
 id U8Ma2C00B2nC7mg018Ma4k; Mon, 27 May 2024 10:21:40 +0200
Received: from geert (helo=localhost)
 by ramsan.of.borg with local-esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1sBVbq-00C8pf-Cj;
 Mon, 27 May 2024 10:21:34 +0200
Date: Mon, 27 May 2024 10:21:34 +0200 (CEST)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: linux-kernel@vger.kernel.org
cc: sparclinux@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 mpi3mr-linuxdrv.pdl@broadcom.com, linux-scsi@vger.kernel.org, 
 linux-um@lists.infradead.org, bpf@vger.kernel.org, 
 loongarch@lists.linux.dev, linux-parisc@vger.kernel.org
Subject: Re: Build regressions/improvements in v6.10-rc1
In-Reply-To: <20240527075047.4004654-1-geert@linux-m68k.org>
Message-ID: <5483dbca-9826-4d15-8d4-cacce091666c@linux-m68k.org>
References: <CAHk-=wjQv_CSPzhjOMoOjGO3FmuHe5hzm6Ds69zZSFPa4PeuCA@mail.gmail.com>
 <20240527075047.4004654-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="8323329-1442935893-1716798094=:2884583"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1442935893-1716798094=:2884583
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 27 May 2024, Geert Uytterhoeven wrote:
> Below is the list of build error/warning regressions/improvements in
> v6.10-rc1[1] compared to v6.9[2].
>
> Summarized:
>  - build errors: +27/-20
>  - build warnings: +3/-1601
>
> Happy fixing! ;-)
>
> Thanks to the linux-next team for providing the build service.
>
> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0/ (all 138 configs)
> [2] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6/ (all 138 configs)
>
>
> *** ERRORS ***
>
> 27 error regressions:
>  + /kisskb/src/arch/sparc/prom/p1275.c: error: no previous prototype for 'prom_cif_init' [-Werror=missing-prototypes]:  => 52:6

sparc64-gcc13/sparc64-allmodconfig (seen before)

>  + /kisskb/src/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c: error: the frame size of 2192 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]:  => 5118:1
>  + /kisskb/src/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c: error: the frame size of 2280 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]:  => 5234:1
>  + /kisskb/src/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c: error: the frame size of 2096 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]:  => 5188:1
>  + /kisskb/src/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c: error: the frame size of 2184 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]:  => 3049:1
>  + /kisskb/src/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c: error: the frame size of 2264 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]:  => 3274:1
>  + /kisskb/src/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c: error: the frame size of 2232 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]:  => 3296:1
>  + /kisskb/src/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c: error: the frame size of 2080 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]:  => 1646:1

powerpc-gcc5/ppc32_allmodconfig

>  + /kisskb/src/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c: error: unknown option after '#pragma GCC diagnostic' kind [-Werror=pragmas]:  => 16:9
>  + /kisskb/src/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h: error: 'gen7_9_0_external_core_regs' defined but not used [-Werror=unused-variable]:  => 1438:19
>  + /kisskb/src/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h: error: 'gen7_9_0_sptp_clusters' defined but not used [-Werror=unused-variable]:  => 1188:43

arm64-gcc5/arm64-allmodconfig
powerpc-gcc5/powerpc-all{mod,yes}config
powerpc-gcc5/ppc32_allmodconfig
powerpc-gcc5/ppc64_book3e_allmodconfig
powerpc-gcc5/ppc64le_allmodconfig
sparc64-gcc5/sparc64-allmodconfig

Looks like #pragma "-Wunused-const-variable" is not supported by gcc-5

>  + /kisskb/src/drivers/gpu/drm/nouveau/nvif/object.c: error: 'memcpy' accessing 4294967240 or more bytes at offsets 0 and 56 overlaps 6442450833 bytes at offset -2147483593 [-Werror=restrict]:  => 298:17
>  + /kisskb/src/drivers/gpu/drm/nouveau/nvif/object.c: error: 'memcpy' accessing 4294967264 or more bytes at offsets 0 and 32 overlaps 6442450881 bytes at offset -2147483617 [-Werror=restrict]:  => 161:9

parisc-gcc13/generic-32bit_defconfig
parisc-gcc13/parisc-{def,allmod}config

>  + /kisskb/src/include/linux/kern_levels.h: error: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'unsigned int' [-Werror=format=]:  => 5:18, 5:25

mips-gcc{8,13}/mips-allmodconfig
parisc-gcc13/parisc-allmodconfig
powerpc-gcc{5,13}/ppc32_allmodconfig
sparc64-gcc{5,13}/sparc-allmodconfig
xtensa-gcc13/xtensa-allmodconfig

drivers/scsi/mpi3mr/mpi3mr_transport.c: In function 'mpi3mr_sas_port_add':
drivers/scsi/mpi3mr/mpi3mr_transport.c:1367:62: note: format string is defined here
     ioc_warn(mrioc, "skipping port %u, max allowed value is %lu\n",
                                                             ~~^
                                                             %u

>  + /kisskb/src/kernel/bpf/verifier.c: error: ‘pcpu_hot’ undeclared (first use in this function):  => 20317:85
>  + /kisskb/src/lib/iomap.c: error: no previous prototype for ‘ioread64_hi_lo’ [-Werror=missing-prototypes]:  => 163:5
>  + /kisskb/src/lib/iomap.c: error: no previous prototype for ‘ioread64_lo_hi’ [-Werror=missing-prototypes]:  => 156:5
>  + /kisskb/src/lib/iomap.c: error: no previous prototype for ‘ioread64be_hi_lo’ [-Werror=missing-prototypes]:  => 178:5
>  + /kisskb/src/lib/iomap.c: error: no previous prototype for ‘ioread64be_lo_hi’ [-Werror=missing-prototypes]:  => 170:5
>  + /kisskb/src/lib/iomap.c: error: no previous prototype for ‘iowrite64_hi_lo’ [-Werror=missing-prototypes]:  => 272:6
>  + /kisskb/src/lib/iomap.c: error: no previous prototype for ‘iowrite64_lo_hi’ [-Werror=missing-prototypes]:  => 264:6
>  + /kisskb/src/lib/iomap.c: error: no previous prototype for ‘iowrite64be_hi_lo’ [-Werror=missing-prototypes]:  => 288:6
>  + /kisskb/src/lib/iomap.c: error: no previous prototype for ‘iowrite64be_lo_hi’ [-Werror=missing-prototypes]:  => 280:6

um-x86_64-gcc12/um-all{mod,yes}config

>  + {standard input}: Error: displacement to undefined symbol .L137 overflows 8-bit field :  => 1105, 1031
>  + {standard input}: Error: displacement to undefined symbol .L158 overflows 8-bit field :  => 1110
>  + {standard input}: Error: unknown pseudo-op: `.al':  => 1270
>  + {standard input}: Error: unknown pseudo-op: `.siz':  => 1273

sh4-gcc13/sh-all{mod,yes}config (SH ICE crickets)

> 3 warning regressions:
>  + /kisskb/src/drivers/gpu/drm/nouveau/nvif/object.c: warning: 'memcpy' accessing 4294967240 or more bytes at offsets 0 and 56 overlaps 6442450833 bytes at offset -2147483593 [-Wrestrict]:  => 298:17
>  + /kisskb/src/drivers/gpu/drm/nouveau/nvif/object.c: warning: 'memcpy' accessing 4294967264 or more bytes at offsets 0 and 32 overlaps 6442450881 bytes at offset -2147483617 [-Wrestrict]:  => 161:9

parisc-gcc13/generic-32bit_defconfig
parisc-gcc13/parisc-{def,allmod}config

>  + {standard input}: Warning: setting incorrect section attributes for .rodata..c_jump_table:  => 10174

loongarch-gcc13/loongson3_defconfig

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
--8323329-1442935893-1716798094=:2884583--

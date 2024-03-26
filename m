Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB7288BBD6
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 09:00:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1869610E7ED;
	Tue, 26 Mar 2024 08:00:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 579 seconds by postgrey-1.36 at gabe;
 Tue, 26 Mar 2024 08:00:38 UTC
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be
 [195.130.137.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 884B710EDAC
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 08:00:38 +0000 (UTC)
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4V3hnF25zgz4x0K7
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 08:50:57 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
 by xavier.telenet-ops.be with bizsmtp
 id 3Kqp2C00C0SSLxL01KqpkN; Tue, 26 Mar 2024 08:50:56 +0100
Received: from geert (helo=localhost)
 by ramsan.of.borg with local-esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1rp1a5-004zii-Gc;
 Tue, 26 Mar 2024 08:50:49 +0100
Date: Tue, 26 Mar 2024 08:50:49 +0100 (CET)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: linux-kernel@vger.kernel.org
cc: linux-crypto@vger.kernel.org, Chris Zankel <chris@zankel.net>, 
 Max Filippov <jcmvbkbc@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Oded Gabbay <ogabbay@kernel.org>, 
 =?ISO-8859-15?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org
Subject: Re: Build regressions/improvements in v6.9-rc1
In-Reply-To: <20240325200315.3896021-1-geert@linux-m68k.org>
Message-ID: <8d78894-dd89-9f4d-52bb-1b873c50be9c@linux-m68k.org>
References: <CAHk-=wgOw_13JuuX4khpn4K+n09cRG3EBQWufAPBWoa0GLLQ0A@mail.gmail.com>
 <20240325200315.3896021-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
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

On Mon, 25 Mar 2024, Geert Uytterhoeven wrote:
> Below is the list of build error/warning regressions/improvements in
> v6.9-rc1[1] compared to v6.8[2].
>
> Summarized:
>  - build errors: +8/-8

   + /kisskb/src/crypto/scompress.c: error: unused variable 'dst_page' [-Werror=unused-variable]:  => 174:38

xtensa-gcc13/xtensa-allmodconfig

   + /kisskb/src/drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h: error: 'gen7_0_0_external_core_regs' defined but not used [-Werror=unused-variable]:  => 924:19
   + /kisskb/src/drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h: error: 'gen7_2_0_external_core_regs' defined but not used [-Werror=unused-variable]:  => 748:19

arm64-gcc5/arm64-allmodconfig
powerpc-gcc5/powerpc-allmodconfig
powerpc-gcc5/powerpc-allyesconfig
powerpc-gcc5/ppc32_allmodconfig
powerpc-gcc5/ppc64_book3e_allmodconfig
powerpc-gcc5/ppc64le_allmodconfig
sparc64-gcc5/sparc64-allmodconfig

   + /kisskb/src/drivers/gpu/drm/xe/xe_lrc.c: error: "END" redefined [-Werror]:  => 100

mips-gcc8/mips-allmodconfig
mips-gcc13/mips-allmodconfig

   + error: arch/sparc/kernel/process_32.o: relocation truncated to fit: R_SPARC_WDISP22 against `.text':  => (.fixup+0xc), (.fixup+0x4)
   + error: arch/sparc/kernel/signal_32.o: relocation truncated to fit: R_SPARC_WDISP22 against `.text':  => (.fixup+0x18), (.fixup+0x8), (.fixup+0x0), (.fixup+0x20), (.fixup+0x10)
   + error: relocation truncated to fit: R_SPARC_WDISP22 against `.init.text':  => (.head.text+0x5100), (.head.text+0x5040)
   + error: relocation truncated to fit: R_SPARC_WDISP22 against symbol `leon_smp_cpu_startup' defined in .text section in arch/sparc/kernel/trampoline_32.o:  => (.init.text+0xa4)

sparc64-gcc13/sparc-allmodconfig

> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/4cece764965020c22cff7665b18a012006359095/ (all 138 configs)
> [2] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/e8f897f4afef0031fe618a8e94127a0934896aba/ (all 138 configs)

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds

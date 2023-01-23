Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A930678108
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 17:12:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D34C710E506;
	Mon, 23 Jan 2023 16:12:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92A9D10E502;
 Mon, 23 Jan 2023 16:12:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1AC61B80DCE;
 Mon, 23 Jan 2023 16:11:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BC20C433EF;
 Mon, 23 Jan 2023 16:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674490317;
 bh=45mhFq9YDMVcNdd2xkCq4u+U7UCgDMs1bAiH53dwA5g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YjiD3zZtEFJIkA+Nor+5GCqgslFnaX5gEiCIFf0yNlmFHAVZXoLk57mUvhhZFjOaF
 kWMXW2bDKxSnTvn1pt8WMauceMZhWdbXzymXk94z+XrBUS6HfWdn1TJshmre8OiQZn
 fOAdnMEXacbTs4G9yC7ZrgvhVHrLdnaTwDqlDnTRvsZZJV4aDg6QKcya511GvE5uq5
 kZhuhklNnmb3B0aNLy63mtrZalOeiz6gJirUHcUWx+/2Bp9i/LL1rKnDZ2bm2igyJ+
 I7kRtRgnWJWse7sgv1KSq1G7R68QmB3slY2POODY2LOv2rHYEGOC28wPaEiBp8X6sp
 HnKIGE9JiGgQQ==
Date: Mon, 23 Jan 2023 09:11:54 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: Re: [PATCH v2 00/14] Remove clang's -Qunused-arguments from
 KBUILD_CPPFLAGS
Message-ID: <Y86xyqe+Rd9wri7I@dev-arch.thelio-3990X>
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
 <CA+G9fYs58vWj705MdaBKomVfHxNJ5ekSTmf53S4=4oVmc43CZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+G9fYs58vWj705MdaBKomVfHxNJ5ekSTmf53S4=4oVmc43CZg@mail.gmail.com>
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
Cc: trix@redhat.com, dave.hansen@linux.intel.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-s390@vger.kernel.org, kernel test robot <lkp@intel.com>,
 mpe@ellerman.id.au, masahiroy@kernel.org, x86@kernel.org,
 christophe.leroy@csgroup.eu, mingo@redhat.com, llvm@lists.linux.dev,
 nicolas@fjasle.eu, Segher Boessenkool <segher@kernel.crashing.org>,
 linux-kbuild@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 npiggin@gmail.com, bp@alien8.de, lkft-triage@lists.linaro.org,
 tglx@linutronix.de, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 ndesaulniers@google.com, linux-mips@vger.kernel.org,
 Sven Schnelle <svens@linux.ibm.com>, Alex Deucher <alexander.deucher@amd.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Naresh,

On Mon, Jan 23, 2023 at 07:28:10PM +0530, Naresh Kamboju wrote:
> FYI,
> [ please provide comments, feedback and improvements on build/ ltp smoke tests ]
> 
> LKFT test farm have fetched your patch series [1]
> [PATCH v2 00/14] Remove clang's -Qunused-arguments from KBUILD_CPPFLAGS
>  [1] https://lore.kernel.org/llvm/20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org/

Thank you a lot for testing this series, it is much appreciated!

It looks like this was applied on top of 6.2-rc3 if I am reading your
logs right but your mainline testing is recent, 6.2-rc5. I think the
errors you are seeing here are just existing mainline regressions that
were later fixed.

> Following build warnings and errors reported.
> 
> sh:
> gcc-11-defconfig — FAIL
> gcc-11-shx3_defconfig — FAIL
> https://qa-reports.linaro.org/~anders.roxell/linux-mainline-patches/build/https___lore_kernel_org_llvm_20221228-drop-qunused-arguments-v2-1-9adbddd20d86_kernel_org/testrun/14221835/suite/build/tests/
> 
> mainline getting passed.
> https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.2-rc5/testrun/14298156/suite/build/test/gcc-11-defconfig/history/
> https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.2-rc5/testrun/14298156/suite/build/test/gcc-11-shx3_defconfig/history/
> 
> Build error:
> In function 'follow_pmd_mask',
>     inlined from 'follow_pud_mask' at /builds/linux/mm/gup.c:735:9,
>     inlined from 'follow_p4d_mask' at /builds/linux/mm/gup.c:752:9,
>     inlined from 'follow_page_mask' at /builds/linux/mm/gup.c:809:9:
> /builds/linux/include/linux/compiler_types.h:358:45: error: call to
> '__compiletime_assert_263' declared with attribute error: Unsupported
> access size for {READ,WRITE}_ONCE().
>   358 |         _compiletime_assert(condition, msg,
> __compiletime_assert_, __COUNTER__)

I think this was fixed with mainline commit 526970be53d5 ("sh/mm: Fix
pmd_t for real"), released in 6.2-rc4. You can see a previous build
failing in the same manner:

https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.2-rc3-9-g5a41237ad1d4/testrun/14056384/suite/build/tests/

> s390:
> clang-15-defconfig — FAIL
> https://qa-reports.linaro.org/~anders.roxell/linux-mainline-patches/build/https___lore_kernel_org_llvm_20221228-drop-qunused-arguments-v2-1-9adbddd20d86_kernel_org/testrun/14221913/suite/build/tests/
> 
> mainline getting passed.
> https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.2-rc5/testrun/14300495/suite/build/test/clang-15-defconfig/history/
> 
> Build error:
> make --silent --keep-going --jobs=8
> O=/home/tuxbuild/.cache/tuxmake/builds/1/build LLVM_IAS=0 ARCH=s390
> CROSS_COMPILE=s390x-linux-gnu- 'HOSTCC=sccache clang' 'CC=sccache
> clang'
> `.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o:
> defined in discarded section `.exit.text' of fs/fuse/inode.o
> `.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o:
> defined in discarded section `.exit.text' of fs/fuse/inode.o
> `.exit.text' referenced in section `__bug_table' of crypto/algboss.o:
> defined in discarded section `.exit.text' of crypto/algboss.o
> `.exit.text' referenced in section `__bug_table' of drivers/scsi/sd.o:
> defined in discarded section `.exit.text' of drivers/scsi/sd.o
> `.exit.text' referenced in section `__jump_table' of drivers/md/md.o:
> defined in discarded section `.exit.text' of drivers/md/md.o
> `.exit.text' referenced in section `__jump_table' of drivers/md/md.o:
> defined in discarded section `.exit.text' of drivers/md/md.o
> `.exit.text' referenced in section `.altinstructions' of
> drivers/md/md.o: defined in discarded section `.exit.text' of
> drivers/md/md.o
> `.exit.text' referenced in section `.altinstructions' of
> drivers/md/md.o: defined in discarded section `.exit.text' of
> drivers/md/md.o
> `.exit.text' referenced in section `.altinstructions' of
> net/iucv/iucv.o: defined in discarded section `.exit.text' of
> net/iucv/iucv.o
> `.exit.text' referenced in section `__bug_table' of
> drivers/s390/cio/qdio_thinint.o: defined in discarded section
> `.exit.text' of drivers/s390/cio/qdio_thinint.o
> `.exit.text' referenced in section `__bug_table' of
> drivers/s390/net/qeth_l3_main.o: defined in discarded section
> `.exit.text' of drivers/s390/net/qeth_l3_main.o
> `.exit.text' referenced in section `__bug_table' of
> drivers/s390/net/qeth_l3_main.o: defined in discarded section
> `.exit.text' of drivers/s390/net/qeth_l3_main.o
> s390x-linux-gnu-ld: BFD (GNU Binutils for Debian) 2.35.2 assertion
> fail ../../bfd/elf64-s390.c:3349
> make[2]: *** [/builds/linux/scripts/Makefile.vmlinux:34: vmlinux] Error 1

This should be fixed with mainline commit a494398bde27 ("s390: define
RUNTIME_DISCARD_EXIT to fix link error with GNU ld < 2.36"), released in
6.2-rc4 as well. Same as before, visible in mainline at one point
without this series:

https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.2-rc3-9-g5a41237ad1d4/testrun/14057142/suite/build/tests/

> But,
> Build and boot pass on arm64, arm, x86_64 and i386.
> Build test performed for mips, parisc, riscv, s390, sh, sparc and
> powerpc (known build errors for maple_defconfig and cell_defconfig),

Good to hear!

Please consider retesting this series on top of 6.2-rc5 or testing the
current kbuild tree, which has this series applied in it:

https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/log/?h=for-next

Cheers,
Nathan

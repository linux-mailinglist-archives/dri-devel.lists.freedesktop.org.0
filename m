Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF75A679D80
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 16:30:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE5110E6B1;
	Tue, 24 Jan 2023 15:30:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com
 [IPv6:2607:f8b0:4864:20::929])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55AA410E6CE
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 15:30:11 +0000 (UTC)
Received: by mail-ua1-x929.google.com with SMTP id r10so909368ual.3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 07:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UyCfMSVt5YQ93dvQzsfOUKEDIKXZpwg4MvkDLyqNHiA=;
 b=XZ2VY4ncaYA9BICy27D7vfCt1S+bUXYea16Cc2fJhPUE0OX1kj8HsB47D77IsDONZl
 U6Cf5/aXnbFjyoJeW1LaVZ0Kw7VnuZvBsCo/9vOQkt8jCc6eTkSOZJaQ35OEDIebTY4e
 wjfhJgqG6HfeXBAulPceXNd5fs697ZnmJhzHhbgdi8A72RuX/LdvU2wr7GWOWSyJ6p3P
 vXBUBFY+QVUd9X8Out3vC1ZXZ7XMAtzXt/A5seZeMwxTDUohxC6h/ktDqD4qVtfwcrDA
 qpxk9+y+gGehYvlG9VMUupGcLXEPj8YK5MYH8uzIwwlrpGSEhJZdRnBGcARX68T3MR2A
 ys1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UyCfMSVt5YQ93dvQzsfOUKEDIKXZpwg4MvkDLyqNHiA=;
 b=qBdXS5D9jEIw1Y1W3X4Kp6wtSGMrCvQar6+YOdH6ODGawF8800saIe+S9B66JrpuYm
 eMT+fMFE4sKcKsVDrawb/R+jalKsgSPOP5ev4I7yzBIzhaLqnP/iBDl/QXF00XYZdfWF
 XdRk8nEA3DLZYkN7CkM2atp4K+Rs1D+izd1twkKv915QhEfqnOkjPsuv6PUabF8zU8/D
 xnjBbgHCId6wwk6zqj0+nLDAjpafQ7IRSpJ5bO2ZdTMQdZU0h7hbs1SAPsKpJzzw4Aqi
 oThrkOOjJKykwloFN9O0EEViJBhPgLoEVH6F2DzeHX+zLsdIbYUpBn3uhsa/qQg1WWFa
 HTKg==
X-Gm-Message-State: AFqh2kpjy3JpQJADyIlYakswFc7otSr3LfPjUr9wMyQE9f1j4y4GV8+r
 5tBOo/J5PwZOoD8BRosZwk3jJ5+yQI8/ZXhn7Kvemw==
X-Google-Smtp-Source: AMrXdXuKRuAD41xpguf1eHKBlJO8W4vD7lac7tM28Emygp2ffmu3CfYnqjmwkMJDzMpgKkJSkz2p0bDht+YE9XQTmVE=
X-Received: by 2002:a9f:3263:0:b0:5d5:d02:8626 with SMTP id
 y32-20020a9f3263000000b005d50d028626mr3149869uad.115.1674574209956; Tue, 24
 Jan 2023 07:30:09 -0800 (PST)
MIME-Version: 1.0
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
 <CA+G9fYs58vWj705MdaBKomVfHxNJ5ekSTmf53S4=4oVmc43CZg@mail.gmail.com>
 <Y86xyqe+Rd9wri7I@dev-arch.thelio-3990X>
In-Reply-To: <Y86xyqe+Rd9wri7I@dev-arch.thelio-3990X>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 24 Jan 2023 20:59:58 +0530
Message-ID: <CA+G9fYv1cAfGUDmz-+XC-E7aXQdU55D7SW=-WFc_RiUuNgGNsw@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] Remove clang's -Qunused-arguments from
 KBUILD_CPPFLAGS
To: Nathan Chancellor <nathan@kernel.org>
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
Cc: trix@redhat.com, dave.hansen@linux.intel.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-s390@vger.kernel.org, Anders Roxell <anders.roxell@linaro.org>,
 kernel test robot <lkp@intel.com>, mpe@ellerman.id.au, masahiroy@kernel.org,
 x86@kernel.org, christophe.leroy@csgroup.eu, mingo@redhat.com,
 llvm@lists.linux.dev, nicolas@fjasle.eu,
 Segher Boessenkool <segher@kernel.crashing.org>, linux-kbuild@vger.kernel.org,
 Heiko Carstens <hca@linux.ibm.com>, npiggin@gmail.com, bp@alien8.de,
 lkft-triage@lists.linaro.org, tglx@linutronix.de,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>,
 ndesaulniers@google.com, linux-mips@vger.kernel.org,
 Sven Schnelle <svens@linux.ibm.com>, Alex Deucher <alexander.deucher@amd.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nathan,

On Mon, 23 Jan 2023 at 21:41, Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi Naresh,
>
> On Mon, Jan 23, 2023 at 07:28:10PM +0530, Naresh Kamboju wrote:
> > FYI,
> > [ please provide comments, feedback and improvements on build/ ltp smok=
e tests ]
> >
> > LKFT test farm have fetched your patch series [1]
> > [PATCH v2 00/14] Remove clang's -Qunused-arguments from KBUILD_CPPFLAGS
> >  [1] https://lore.kernel.org/llvm/20221228-drop-qunused-arguments-v2-0-=
9adbddd20d86@kernel.org/
>
> Thank you a lot for testing this series, it is much appreciated!
>
> It looks like this was applied on top of 6.2-rc3 if I am reading your
> logs right but your mainline testing is recent, 6.2-rc5. I think the
> errors you are seeing here are just existing mainline regressions that
> were later fixed.
>
> > Following build warnings and errors reported.
> >
> > sh:
> > gcc-11-defconfig =E2=80=94 FAIL
> > gcc-11-shx3_defconfig =E2=80=94 FAIL
> > https://qa-reports.linaro.org/~anders.roxell/linux-mainline-patches/bui=
ld/https___lore_kernel_org_llvm_20221228-drop-qunused-arguments-v2-1-9adbdd=
d20d86_kernel_org/testrun/14221835/suite/build/tests/
> >
> > mainline getting passed.
> > https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.2-rc5=
/testrun/14298156/suite/build/test/gcc-11-defconfig/history/
> > https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.2-rc5=
/testrun/14298156/suite/build/test/gcc-11-shx3_defconfig/history/
> >
> > Build error:
> > In function 'follow_pmd_mask',
> >     inlined from 'follow_pud_mask' at /builds/linux/mm/gup.c:735:9,
> >     inlined from 'follow_p4d_mask' at /builds/linux/mm/gup.c:752:9,
> >     inlined from 'follow_page_mask' at /builds/linux/mm/gup.c:809:9:
> > /builds/linux/include/linux/compiler_types.h:358:45: error: call to
> > '__compiletime_assert_263' declared with attribute error: Unsupported
> > access size for {READ,WRITE}_ONCE().
> >   358 |         _compiletime_assert(condition, msg,
> > __compiletime_assert_, __COUNTER__)
>
> I think this was fixed with mainline commit 526970be53d5 ("sh/mm: Fix
> pmd_t for real"), released in 6.2-rc4. You can see a previous build
> failing in the same manner:
>
> https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.2-rc3-9=
-g5a41237ad1d4/testrun/14056384/suite/build/tests/
>
> > s390:
> > clang-15-defconfig =E2=80=94 FAIL
> > https://qa-reports.linaro.org/~anders.roxell/linux-mainline-patches/bui=
ld/https___lore_kernel_org_llvm_20221228-drop-qunused-arguments-v2-1-9adbdd=
d20d86_kernel_org/testrun/14221913/suite/build/tests/
> >
> > mainline getting passed.
> > https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.2-rc5=
/testrun/14300495/suite/build/test/clang-15-defconfig/history/
> >
> > Build error:
> > make --silent --keep-going --jobs=3D8
> > O=3D/home/tuxbuild/.cache/tuxmake/builds/1/build LLVM_IAS=3D0 ARCH=3Ds3=
90
> > CROSS_COMPILE=3Ds390x-linux-gnu- 'HOSTCC=3Dsccache clang' 'CC=3Dsccache
> > clang'
> > `.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o:
> > defined in discarded section `.exit.text' of fs/fuse/inode.o
> > `.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o:
> > defined in discarded section `.exit.text' of fs/fuse/inode.o
> > `.exit.text' referenced in section `__bug_table' of crypto/algboss.o:
> > defined in discarded section `.exit.text' of crypto/algboss.o
> > `.exit.text' referenced in section `__bug_table' of drivers/scsi/sd.o:
> > defined in discarded section `.exit.text' of drivers/scsi/sd.o
> > `.exit.text' referenced in section `__jump_table' of drivers/md/md.o:
> > defined in discarded section `.exit.text' of drivers/md/md.o
> > `.exit.text' referenced in section `__jump_table' of drivers/md/md.o:
> > defined in discarded section `.exit.text' of drivers/md/md.o
> > `.exit.text' referenced in section `.altinstructions' of
> > drivers/md/md.o: defined in discarded section `.exit.text' of
> > drivers/md/md.o
> > `.exit.text' referenced in section `.altinstructions' of
> > drivers/md/md.o: defined in discarded section `.exit.text' of
> > drivers/md/md.o
> > `.exit.text' referenced in section `.altinstructions' of
> > net/iucv/iucv.o: defined in discarded section `.exit.text' of
> > net/iucv/iucv.o
> > `.exit.text' referenced in section `__bug_table' of
> > drivers/s390/cio/qdio_thinint.o: defined in discarded section
> > `.exit.text' of drivers/s390/cio/qdio_thinint.o
> > `.exit.text' referenced in section `__bug_table' of
> > drivers/s390/net/qeth_l3_main.o: defined in discarded section
> > `.exit.text' of drivers/s390/net/qeth_l3_main.o
> > `.exit.text' referenced in section `__bug_table' of
> > drivers/s390/net/qeth_l3_main.o: defined in discarded section
> > `.exit.text' of drivers/s390/net/qeth_l3_main.o
> > s390x-linux-gnu-ld: BFD (GNU Binutils for Debian) 2.35.2 assertion
> > fail ../../bfd/elf64-s390.c:3349
> > make[2]: *** [/builds/linux/scripts/Makefile.vmlinux:34: vmlinux] Error=
 1
>
> This should be fixed with mainline commit a494398bde27 ("s390: define
> RUNTIME_DISCARD_EXIT to fix link error with GNU ld < 2.36"), released in
> 6.2-rc4 as well. Same as before, visible in mainline at one point
> without this series:
>
> https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.2-rc3-9=
-g5a41237ad1d4/testrun/14057142/suite/build/tests/
>
> > But,
> > Build and boot pass on arm64, arm, x86_64 and i386.
> > Build test performed for mips, parisc, riscv, s390, sh, sparc and
> > powerpc (known build errors for maple_defconfig and cell_defconfig),
>
> Good to hear!
>
> Please consider retesting this series on top of 6.2-rc5 or testing the
> current kbuild tree, which has this series applied in it:

This is the perfect place to test.

> https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.gi=
t/log/?h=3Dfor-next

Build test pass on arm, arm64, i386, mips, parisc, powerpc, riscv, s390, sh=
,
sparc and x86_64.
Boot and LTP smoke pass on qemu-arm64, qemu-armv7, qemu-i386 and qemu-x86_6=
4.

  Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
  Tested-by: Anders Roxell <anders.roxell@linaro.org>

Please refer to the following link for details of testing.
  https://qa-reports.linaro.org/~anders.roxell/linux-mainline-patches/build=
/linux-kbuild_masahiroy-branch-kbuild-20230124/?failures_only=3Dfalse&resul=
ts_layout=3Dtable#!#test-results

metadata:
  git_describe : v6.2-rc5-46-ga778c9dd138b
  git_repo : https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linu=
x-kbuild.git
  git_sha : a778c9dd138b4f4410779705b444d58ce6f8fc44
  git_short_log : a778c9dd138b ("builddeb: clean generated package content"=
)

--
Linaro LKFT
https://lkft.linaro.org

>
> Cheers,
> Nathan

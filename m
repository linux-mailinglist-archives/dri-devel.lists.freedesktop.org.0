Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B2531111E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 20:26:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 842C86F4B5;
	Fri,  5 Feb 2021 19:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F16D56F4B4;
 Fri,  5 Feb 2021 19:26:41 +0000 (UTC)
IronPort-SDR: s679om0hdcopM0kQ8ipzGKBoVz6h3gUX879GXLvGkPpvFUAaJfty6+NHHrFqxv/cVr5OrgZD20
 lf1ROCuBXINQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9886"; a="242981349"
X-IronPort-AV: E=Sophos;i="5.81,155,1610438400"; 
 d="gz'50?scan'50,208,50";a="242981349"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2021 11:26:34 -0800
IronPort-SDR: 2SCrlu2kAgduNiBczER04nTF4s/d15kzscZtnS/yatnUrUBOFvwr2YNwroxbRb9dGFz3ruR0ef
 JG78Kasfm46g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,155,1610438400"; 
 d="gz'50?scan'50,208,50";a="508643451"
Received: from lkp-server02.sh.intel.com (HELO 8b832f01bb9c) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 05 Feb 2021 11:26:31 -0800
Received: from kbuild by 8b832f01bb9c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1l86kQ-0001xI-Ct; Fri, 05 Feb 2021 19:26:30 +0000
Date: Sat, 6 Feb 2021 03:25:50 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kernel: Expose SYS_kcmp by default
Message-ID: <202102060325.uqZRgPog-lkp@intel.com>
References: <20210205163752.11932-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="h31gzZEtNLTqOjlF"
Content-Disposition: inline
In-Reply-To: <20210205163752.11932-1-chris@chris-wilson.co.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: kbuild-all@lists.01.org, Kees Cook <keescook@chromium.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Andy Lutomirski <luto@amacapital.net>, clang-built-linux@googlegroups.com,
 Will Drewry <wad@chromium.org>, Andrew Morton <akpm@linux-foundation.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chris,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linux/master]
[also build test ERROR on kees/for-next/seccomp kees/for-next/pstore linus/master v5.11-rc6 next-20210125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Chris-Wilson/kernel-Expose-SYS_kcmp-by-default/20210206-004006
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 2ab38c17aac10bf55ab3efde4c4db3893d8691d2
config: powerpc-randconfig-r023-20210205 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project c9439ca36342fb6013187d0a69aef92736951476)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/0day-ci/linux/commit/f7694e48ae81aac5a226e74421dbda1dcdc3ca92
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Chris-Wilson/kernel-Expose-SYS_kcmp-by-default/20210206-004006
        git checkout f7694e48ae81aac5a226e74421dbda1dcdc3ca92
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=powerpc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:45:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:190:1: note: expanded from here
   __do_insw
   ^
   arch/powerpc/include/asm/io.h:557:56: note: expanded from macro '__do_insw'
   #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from kernel/kcmp.c:3:
   In file included from include/linux/syscalls.h:84:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:10:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:192:1: note: expanded from here
   __do_insl
   ^
   arch/powerpc/include/asm/io.h:558:56: note: expanded from macro '__do_insl'
   #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from kernel/kcmp.c:3:
   In file included from include/linux/syscalls.h:84:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:10:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:194:1: note: expanded from here
   __do_outsb
   ^
   arch/powerpc/include/asm/io.h:559:58: note: expanded from macro '__do_outsb'
   #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from kernel/kcmp.c:3:
   In file included from include/linux/syscalls.h:84:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:10:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:196:1: note: expanded from here
   __do_outsw
   ^
   arch/powerpc/include/asm/io.h:560:58: note: expanded from macro '__do_outsw'
   #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from kernel/kcmp.c:3:
   In file included from include/linux/syscalls.h:84:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:10:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:198:1: note: expanded from here
   __do_outsl
   ^
   arch/powerpc/include/asm/io.h:561:58: note: expanded from macro '__do_outsl'
   #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
>> kernel/kcmp.c:117:13: error: implicit declaration of function 'get_epoll_tfile_raw_ptr' [-Werror,-Wimplicit-function-declaration]
           filp_tgt = get_epoll_tfile_raw_ptr(filp_epoll, slot.tfd, slot.toff);
                      ^
   kernel/kcmp.c:117:13: note: did you mean 'get_file_raw_ptr'?
   kernel/kcmp.c:62:1: note: 'get_file_raw_ptr' declared here
   get_file_raw_ptr(struct task_struct *task, unsigned int idx)
   ^
>> kernel/kcmp.c:117:11: warning: incompatible integer to pointer conversion assigning to 'struct file *' from 'int' [-Wint-conversion]
           filp_tgt = get_epoll_tfile_raw_ptr(filp_epoll, slot.tfd, slot.toff);
                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   13 warnings and 1 error generated.


vim +/get_epoll_tfile_raw_ptr +117 kernel/kcmp.c

d97b46a64674a2 Cyrill Gorcunov   2012-05-31   96  
0791e3644e5ef2 Cyrill Gorcunov   2017-07-12   97  #ifdef CONFIG_EPOLL
0791e3644e5ef2 Cyrill Gorcunov   2017-07-12   98  static int kcmp_epoll_target(struct task_struct *task1,
0791e3644e5ef2 Cyrill Gorcunov   2017-07-12   99  			     struct task_struct *task2,
0791e3644e5ef2 Cyrill Gorcunov   2017-07-12  100  			     unsigned long idx1,
0791e3644e5ef2 Cyrill Gorcunov   2017-07-12  101  			     struct kcmp_epoll_slot __user *uslot)
0791e3644e5ef2 Cyrill Gorcunov   2017-07-12  102  {
0791e3644e5ef2 Cyrill Gorcunov   2017-07-12  103  	struct file *filp, *filp_epoll, *filp_tgt;
0791e3644e5ef2 Cyrill Gorcunov   2017-07-12  104  	struct kcmp_epoll_slot slot;
0791e3644e5ef2 Cyrill Gorcunov   2017-07-12  105  
0791e3644e5ef2 Cyrill Gorcunov   2017-07-12  106  	if (copy_from_user(&slot, uslot, sizeof(slot)))
0791e3644e5ef2 Cyrill Gorcunov   2017-07-12  107  		return -EFAULT;
0791e3644e5ef2 Cyrill Gorcunov   2017-07-12  108  
0791e3644e5ef2 Cyrill Gorcunov   2017-07-12  109  	filp = get_file_raw_ptr(task1, idx1);
0791e3644e5ef2 Cyrill Gorcunov   2017-07-12  110  	if (!filp)
0791e3644e5ef2 Cyrill Gorcunov   2017-07-12  111  		return -EBADF;
0791e3644e5ef2 Cyrill Gorcunov   2017-07-12  112  
f43c283a89a7dc Eric W. Biederman 2020-11-20  113  	filp_epoll = fget_task(task2, slot.efd);
f43c283a89a7dc Eric W. Biederman 2020-11-20  114  	if (!filp_epoll)
0791e3644e5ef2 Cyrill Gorcunov   2017-07-12  115  		return -EBADF;
0791e3644e5ef2 Cyrill Gorcunov   2017-07-12  116  
0791e3644e5ef2 Cyrill Gorcunov   2017-07-12 @117  	filp_tgt = get_epoll_tfile_raw_ptr(filp_epoll, slot.tfd, slot.toff);
0791e3644e5ef2 Cyrill Gorcunov   2017-07-12  118  	fput(filp_epoll);
0791e3644e5ef2 Cyrill Gorcunov   2017-07-12  119  
0791e3644e5ef2 Cyrill Gorcunov   2017-07-12  120  	if (IS_ERR(filp_tgt))
0791e3644e5ef2 Cyrill Gorcunov   2017-07-12  121  		return PTR_ERR(filp_tgt);
0791e3644e5ef2 Cyrill Gorcunov   2017-07-12  122  
0791e3644e5ef2 Cyrill Gorcunov   2017-07-12  123  	return kcmp_ptr(filp, filp_tgt, KCMP_FILE);
0791e3644e5ef2 Cyrill Gorcunov   2017-07-12  124  }
0791e3644e5ef2 Cyrill Gorcunov   2017-07-12  125  #else
0791e3644e5ef2 Cyrill Gorcunov   2017-07-12  126  static int kcmp_epoll_target(struct task_struct *task1,
0791e3644e5ef2 Cyrill Gorcunov   2017-07-12  127  			     struct task_struct *task2,
0791e3644e5ef2 Cyrill Gorcunov   2017-07-12  128  			     unsigned long idx1,
0791e3644e5ef2 Cyrill Gorcunov   2017-07-12  129  			     struct kcmp_epoll_slot __user *uslot)
0791e3644e5ef2 Cyrill Gorcunov   2017-07-12  130  {
0791e3644e5ef2 Cyrill Gorcunov   2017-07-12  131  	return -EOPNOTSUPP;
0791e3644e5ef2 Cyrill Gorcunov   2017-07-12  132  }
0791e3644e5ef2 Cyrill Gorcunov   2017-07-12  133  #endif
0791e3644e5ef2 Cyrill Gorcunov   2017-07-12  134  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--h31gzZEtNLTqOjlF
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--h31gzZEtNLTqOjlF--

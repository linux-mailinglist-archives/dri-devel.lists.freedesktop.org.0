Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EC72C86A9
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 15:28:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE7556E4D0;
	Mon, 30 Nov 2020 14:28:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96FFA6E4D0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 14:28:26 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id f190so22372181wme.1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 06:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=eHLcaoGR3OBMxI8Ka9Vg7O4WIQrlDq3JLjO4ywGlLGY=;
 b=dfMrMYg+Imtd1PT+Ug3KAxUR66mYTe9vAIQKEVg0p13ToattxxKgowHojH4QkVsl8o
 qWCIFLhhk7c1mD01OWMkZ5hkSkRlkmPm+bVkb34eSimeJ1VnWw2ym78YElm9GSziyfkJ
 EEgXBw3Tprvet3blzGCzAx/h7Dl9EX4sL5AEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=eHLcaoGR3OBMxI8Ka9Vg7O4WIQrlDq3JLjO4ywGlLGY=;
 b=gK1+YpNrzMrwym66RmIItVPOaGIu7Nlo7Cc/w8MCxvL6VXnwNdqPziG0OjMOuLeUI4
 4Qoss2bpkFNhPOhh6Pp2ssZsbEGkS6Zj/MmUh0eHuoBpZmrH9VYanRCQdn3ZCwOrUwTM
 3F+7za0HBCmZdQVIOIwP9ATNuAyjNRf+HUFMr5KN4JhmLmvrerdbkF24j3bqu6sueFkv
 C7/fEmLLy0sqAwq4lZZ02cZaLf5tzMCy03i0YnGp6BiO/6P/ehjsRrqvbbaLvDQdOuRN
 dLIhH8k9n3Q3KIEIxDxZogqB+9Z+8ME3DqgSR6/AvLsB05GxYTrboSTrlj59C0IB7oYG
 0uhA==
X-Gm-Message-State: AOAM533ns5nSLiSqvYZQeKKgEnXevPIZIPI+2NZo5JKCpV7CVeSiO157
 c4QqL1AMWPwFAxQDeIq1R7kesg==
X-Google-Smtp-Source: ABdhPJw0HCNBfCYYbfgmPNymctRPGyVxi7hp50ZBAm3Q4du98rsXy8jIiPNtdF8UeMGO2YaRzuWbEw==
X-Received: by 2002:a7b:c05a:: with SMTP id u26mr23719527wmc.159.1606746503617; 
 Mon, 30 Nov 2020 06:28:23 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v3sm270080wrq.72.2020.11.30.06.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 06:28:22 -0800 (PST)
Date: Mon, 30 Nov 2020 15:28:20 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v7 17/17] mm: add mmu_notifier argument to follow_pfn
Message-ID: <20201130142820.GN401619@phenom.ffwll.local>
Mail-Followup-To: kernel test robot <lkp@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, kbuild-all@lists.01.org,
 clang-built-linux@googlegroups.com, kvm@vger.kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>
References: <20201127164131.2244124-18-daniel.vetter@ffwll.ch>
 <202011280356.rPWHFNW4-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202011280356.rPWHFNW4-lkp@intel.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Jason Gunthorpe <jgg@ziepe.ca>, linux-samsung-soc@vger.kernel.org,
 kbuild-all@lists.01.org, kvm@vger.kernel.org, linux-mm@kvack.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>, clang-built-linux@googlegroups.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

So I guess kvm platforms that don't set KVM_ARCH_WANT_MMU_NOTIFIER exist,
and at least on powerpc they're consistent with KVM_CAP_SYNC_MMU
signalling that the guest pagetables stays in sync automatically with any
updates. So for that case I guess we could use unsafe_follow_pfn.

But on s390 this seems different: No mmu notifier, but KVM_CAP_SYNC_MMU is
set. So I guess there's some hardware magic on s390 that I don't know
about.

Not sure what to do with this now here ...
-Daniel


On Sat, Nov 28, 2020 at 03:10:40AM +0800, kernel test robot wrote:
> Hi Daniel,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on linuxtv-media/master]
> [also build test ERROR on char-misc/char-misc-testing v5.10-rc5]
> [cannot apply to hnaz-linux-mm/master next-20201127]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Daniel-Vetter/follow_pfn-and-other-iomap-races/20201128-004421
> base:   git://linuxtv.org/media_tree.git master
> config: s390-randconfig-r032-20201127 (attached as .config)
> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project f095ac11a9550530a4a54298debb8b04b36422be)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install s390 cross compiling tool for clang build
>         # apt-get install binutils-s390x-linux-gnu
>         # https://github.com/0day-ci/linux/commit/d76a3489433ce67d45da86aa12953385427f0ac9
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Daniel-Vetter/follow_pfn-and-other-iomap-races/20201128-004421
>         git checkout d76a3489433ce67d45da86aa12953385427f0ac9
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from arch/s390/include/asm/kvm_para.h:25:
>    In file included from arch/s390/include/asm/diag.h:12:
>    In file included from include/linux/if_ether.h:19:
>    In file included from include/linux/skbuff.h:31:
>    In file included from include/linux/dma-mapping.h:10:
>    In file included from include/linux/scatterlist.h:9:
>    In file included from arch/s390/include/asm/io.h:80:
>    include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
>                                                            ~~~~~~~~~~ ^
>    include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from macro '__le32_to_cpu'
>    #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
>                                                              ^
>    include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
>            ___constant_swab32(x) :                 \
>                               ^
>    include/uapi/linux/swab.h:21:12: note: expanded from macro '___constant_swab32'
>            (((__u32)(x) & (__u32)0x00ff0000UL) >>  8) |            \
>                      ^
>    In file included from arch/s390/kvm/../../../virt/kvm/kvm_main.c:18:
>    In file included from include/linux/kvm_host.h:32:
>    In file included from include/linux/kvm_para.h:5:
>    In file included from include/uapi/linux/kvm_para.h:36:
>    In file included from arch/s390/include/asm/kvm_para.h:25:
>    In file included from arch/s390/include/asm/diag.h:12:
>    In file included from include/linux/if_ether.h:19:
>    In file included from include/linux/skbuff.h:31:
>    In file included from include/linux/dma-mapping.h:10:
>    In file included from include/linux/scatterlist.h:9:
>    In file included from arch/s390/include/asm/io.h:80:
>    include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
>                                                            ~~~~~~~~~~ ^
>    include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from macro '__le32_to_cpu'
>    #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
>                                                              ^
>    include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
>            ___constant_swab32(x) :                 \
>                               ^
>    include/uapi/linux/swab.h:22:12: note: expanded from macro '___constant_swab32'
>            (((__u32)(x) & (__u32)0xff000000UL) >> 24)))
>                      ^
>    In file included from arch/s390/kvm/../../../virt/kvm/kvm_main.c:18:
>    In file included from include/linux/kvm_host.h:32:
>    In file included from include/linux/kvm_para.h:5:
>    In file included from include/uapi/linux/kvm_para.h:36:
>    In file included from arch/s390/include/asm/kvm_para.h:25:
>    In file included from arch/s390/include/asm/diag.h:12:
>    In file included from include/linux/if_ether.h:19:
>    In file included from include/linux/skbuff.h:31:
>    In file included from include/linux/dma-mapping.h:10:
>    In file included from include/linux/scatterlist.h:9:
>    In file included from arch/s390/include/asm/io.h:80:
>    include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
>                                                            ~~~~~~~~~~ ^
>    include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from macro '__le32_to_cpu'
>    #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
>                                                              ^
>    include/uapi/linux/swab.h:120:12: note: expanded from macro '__swab32'
>            __fswab32(x))
>                      ^
>    In file included from arch/s390/kvm/../../../virt/kvm/kvm_main.c:18:
>    In file included from include/linux/kvm_host.h:32:
>    In file included from include/linux/kvm_para.h:5:
>    In file included from include/uapi/linux/kvm_para.h:36:
>    In file included from arch/s390/include/asm/kvm_para.h:25:
>    In file included from arch/s390/include/asm/diag.h:12:
>    In file included from include/linux/if_ether.h:19:
>    In file included from include/linux/skbuff.h:31:
>    In file included from include/linux/dma-mapping.h:10:
>    In file included from include/linux/scatterlist.h:9:
>    In file included from arch/s390/include/asm/io.h:80:
>    include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            __raw_writeb(value, PCI_IOBASE + addr);
>                                ~~~~~~~~~~ ^
>    include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
>                                                          ~~~~~~~~~~ ^
>    include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
>                                                          ~~~~~~~~~~ ^
>    include/asm-generic/io.h:609:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            readsb(PCI_IOBASE + addr, buffer, count);
>                   ~~~~~~~~~~ ^
>    include/asm-generic/io.h:617:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            readsw(PCI_IOBASE + addr, buffer, count);
>                   ~~~~~~~~~~ ^
>    include/asm-generic/io.h:625:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            readsl(PCI_IOBASE + addr, buffer, count);
>                   ~~~~~~~~~~ ^
>    include/asm-generic/io.h:634:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            writesb(PCI_IOBASE + addr, buffer, count);
>                    ~~~~~~~~~~ ^
>    include/asm-generic/io.h:643:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            writesw(PCI_IOBASE + addr, buffer, count);
>                    ~~~~~~~~~~ ^
>    include/asm-generic/io.h:652:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            writesl(PCI_IOBASE + addr, buffer, count);
>                    ~~~~~~~~~~ ^
> >> arch/s390/kvm/../../../virt/kvm/kvm_main.c:1894:40: error: no member named 'mmu_notifier' in 'struct kvm'
>            r = follow_pfn(vma, addr, &pfn, &kvm->mmu_notifier);
>                                             ~~~  ^
>    arch/s390/kvm/../../../virt/kvm/kvm_main.c:1909:41: error: no member named 'mmu_notifier' in 'struct kvm'
>                    r = follow_pfn(vma, addr, &pfn, &kvm->mmu_notifier);
>                                                     ~~~  ^
>    20 warnings and 2 errors generated.
> 
> vim +1894 arch/s390/kvm/../../../virt/kvm/kvm_main.c
> 
>   1885	
>   1886	static int hva_to_pfn_remapped(struct kvm *kvm, struct vm_area_struct *vma,
>   1887				       unsigned long addr, bool *async,
>   1888				       bool write_fault, bool *writable,
>   1889				       kvm_pfn_t *p_pfn)
>   1890	{
>   1891		unsigned long pfn;
>   1892		int r;
>   1893	
> > 1894		r = follow_pfn(vma, addr, &pfn, &kvm->mmu_notifier);
>   1895		if (r) {
>   1896			/*
>   1897			 * get_user_pages fails for VM_IO and VM_PFNMAP vmas and does
>   1898			 * not call the fault handler, so do it here.
>   1899			 */
>   1900			bool unlocked = false;
>   1901			r = fixup_user_fault(current->mm, addr,
>   1902					     (write_fault ? FAULT_FLAG_WRITE : 0),
>   1903					     &unlocked);
>   1904			if (unlocked)
>   1905				return -EAGAIN;
>   1906			if (r)
>   1907				return r;
>   1908	
>   1909			r = follow_pfn(vma, addr, &pfn, &kvm->mmu_notifier);
>   1910			if (r)
>   1911				return r;
>   1912	
>   1913		}
>   1914	
>   1915		if (writable)
>   1916			*writable = true;
>   1917	
>   1918		/*
>   1919		 * Get a reference here because callers of *hva_to_pfn* and
>   1920		 * *gfn_to_pfn* ultimately call kvm_release_pfn_clean on the
>   1921		 * returned pfn.  This is only needed if the VMA has VM_MIXEDMAP
>   1922		 * set, but the kvm_get_pfn/kvm_release_pfn_clean pair will
>   1923		 * simply do nothing for reserved pfns.
>   1924		 *
>   1925		 * Whoever called remap_pfn_range is also going to call e.g.
>   1926		 * unmap_mapping_range before the underlying pages are freed,
>   1927		 * causing a call to our MMU notifier.
>   1928		 */ 
>   1929		kvm_get_pfn(pfn);
>   1930	
>   1931		*p_pfn = pfn;
>   1932		return 0;
>   1933	}
>   1934	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F368EA908DB
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 18:28:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9905010E971;
	Wed, 16 Apr 2025 16:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="e/B70CuV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4115610E971
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 16:28:27 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43cf3192d8bso62955e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 09:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1744820906; x=1745425706;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dcKONrIAwY+Efjpusl4unIszUT6B68ir1oyM8EH1UJY=;
 b=e/B70CuVGc7qRAvPARGNjmEWF0/6gDKhUsVa7kZ66xIEJa+DE4W9ON2SaGW2BEihWx
 +2Dc5zx2ODAb3X4DoFPQQJtcumUuhYvijDmI2ieTOLREsM9jd2TUbTgJqrSuu0fnhMvn
 iXS1wukjK5I/txb64tEvKzXCCWbqEY0IEIW6DKB57rshUQkzZzeUA0FsjGyvDPV3qXGj
 7UWTj4KL8ULwwpM5uSnl3xViR2WL2agUittrxvcJPYgx+XLPfnoHQbmnPv1sbnJxgFjq
 hBDOwN7iluM0N3BYmkbrsXySxsRrF1REso8HTNdJr8w9lg9NEic+6QR8q8lBdbDqENhH
 Mjaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744820906; x=1745425706;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dcKONrIAwY+Efjpusl4unIszUT6B68ir1oyM8EH1UJY=;
 b=R7yxafmd/IhQFUNgZltBlor60mRBQkW5p1RhdmfxMQXX6JU/7hc9dRmS3vKfOLUSFP
 FQeq1eL/H23jQ47B+5LtyUh7C8rjHxxO/6oYYKeJv5IF4BQj2hjQadmmnfm6KlZjYo9v
 RKSPFML8nKWGcTchDU4ZkTXdtFWQ+ysZB1s8L642aEH3polZQ1Lzamd8luWvsYDR9xKk
 d+uQguIEL53QcoSLMsvAPTnQInRaOKLaqjdL/F7FXXoMAIl5ygfrU+qeWCM5Cbi0N3Uv
 zoyvknqe41slq7PEkwNWVobqbG3uPC2QgJzrgHGH2+Zu+qQQu3DFoEpSY3PR4I5Ymyoj
 xHgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkS4HDjdbr/kaizPgUvixC+FuXmo9rz97o5IncsBgy5wvDQVGHK1i81EFoPguSj0VlgYm+TL6xNB8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyV02prFnyeNodzXrjUuS+lZTcp7nifxxtGKRkCNdoVn7z+M4xY
 1K/7j/zjFiBM/2NJPC0NBYumARJ4C2IwcyKHNx7h3Wg9sjtDfPPonM1JfQaZ1N4vHQV7RVrlkpN
 zDgK1X4bLvSC2mRdcZUtOzxZCHqwdxKaTBO7t
X-Gm-Gg: ASbGncvA96J2U0QMwJLPcJu75Ud/5xIAefJgDwz9kolof5tpwML7+ygB/3jle8WjV6Z
 v06N6Y3808A+5sfmRGZ20L4hvVCCbQ/TiozSgCueFdRBU0+JM2e3ZyZCwT1D9OoL4M8vXccoGd6
 KdB0fxPzWncWtn+BBNxKTWhsQoG8dkY/lKEexeK4jsPzAT7HoziD5u
X-Google-Smtp-Source: AGHT+IECcvlnv6xPe9UB0/XJHO7q92sQEEqdeeGFlPVCn4BZ/toc+Qo3v9Dc1e4mY/RgIEckbUeu3UbXyA3ppO6oN3o=
X-Received: by 2002:a05:600c:6a87:b0:439:4a76:c246 with SMTP id
 5b1f17b1804b1-4405d26eadcmr1009515e9.6.1744820905359; Wed, 16 Apr 2025
 09:28:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250414225227.3642618-3-tjmercier@google.com>
 <202504161015.x2XLaha2-lkp@intel.com>
In-Reply-To: <202504161015.x2XLaha2-lkp@intel.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 16 Apr 2025 09:28:13 -0700
X-Gm-Features: ATxdqUFoAbnFhGEzvGofJporgvqMuSJROlNX-nlFC0ORBP_b5Axo3RH1otfUvlU
Message-ID: <CABdmKX16QttfxRYHaq1B92U8nw+S6Gte+mFVhOTnCy4H3cLFcA@mail.gmail.com>
Subject: Re: [PATCH 2/4] bpf: Add dmabuf iterator
To: kernel test robot <lkp@intel.com>
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, ast@kernel.org, 
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
 skhan@linuxfoundation.org, llvm@lists.linux.dev, 
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, android-mm@google.com, 
 simona@ffwll.ch, corbet@lwn.net, eddyz87@gmail.com, song@kernel.org, 
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
 sdf@fomichev.me, jolsa@kernel.org, mykolal@fb.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 15, 2025 at 9:43=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Mercier,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on bpf-next/net]
> [also build test ERROR on bpf-next/master bpf/master linus/master v6.15-r=
c2 next-20250415]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/T-J-Mercier/dma-bu=
f-Rename-and-expose-debugfs-symbols/20250415-065354
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git =
net
> patch link:    https://lore.kernel.org/r/20250414225227.3642618-3-tjmerci=
er%40google.com
> patch subject: [PATCH 2/4] bpf: Add dmabuf iterator
> config: i386-buildonly-randconfig-005-20250416
> compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df=
0ef89dd64126512e4ee27b4ac3fd8ddf6247)
> reproduce (this is a W=3D1 build):
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504161015.x2XLaha2-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> ld.lld: error: undefined symbol: dmabuf_debugfs_list_mutex
>    >>> referenced by dmabuf_iter.c:44 (kernel/bpf/dmabuf_iter.c:44)
>    >>>               vmlinux.o:(dmabuf_iter_seq_next)
>    >>> referenced by dmabuf_iter.c:53 (kernel/bpf/dmabuf_iter.c:53)
>    >>>               vmlinux.o:(dmabuf_iter_seq_next)
>    >>> referenced by dmabuf_iter.c:26 (kernel/bpf/dmabuf_iter.c:26)
>    >>>               vmlinux.o:(dmabuf_iter_seq_start)
>    >>> referenced 1 more times
> --
> >> ld.lld: error: undefined symbol: dma_buf_put
>    >>> referenced by dmabuf_iter.c:45 (kernel/bpf/dmabuf_iter.c:45)
>    >>>               vmlinux.o:(dmabuf_iter_seq_next)
>    >>> referenced by dmabuf_iter.c:90 (kernel/bpf/dmabuf_iter.c:90)
>    >>>               vmlinux.o:(dmabuf_iter_seq_stop)
> --
> >> ld.lld: error: undefined symbol: dmabuf_debugfs_list
>    >>> referenced by list.h:354 (include/linux/list.h:354)
>    >>>               vmlinux.o:(dmabuf_iter_seq_next)
>    >>> referenced by dmabuf_iter.c:0 (kernel/bpf/dmabuf_iter.c:0)
>    >>>               vmlinux.o:(dmabuf_iter_seq_start)
>    >>> referenced by list.h:364 (include/linux/list.h:364)
>    >>>               vmlinux.o:(dmabuf_iter_seq_start)
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

This is due to no CONFIG_DMA_SHARED_BUFFER. Fixed by:

--- a/kernel/bpf/Makefile
+++ b/kernel/bpf/Makefile
@@ -53,7 +53,7 @@ obj-$(CONFIG_BPF_SYSCALL) +=3D relo_core.o
 obj-$(CONFIG_BPF_SYSCALL) +=3D btf_iter.o
 obj-$(CONFIG_BPF_SYSCALL) +=3D btf_relocate.o
 obj-$(CONFIG_BPF_SYSCALL) +=3D kmem_cache_iter.o
-ifeq ($(CONFIG_DEBUG_FS),y)
+ifeq ($(CONFIG_DMA_SHARED_BUFFER)$(CONFIG_DEBUG_FS),yy)
 obj-$(CONFIG_BPF_SYSCALL) +=3D dmabuf_iter.o
 endif

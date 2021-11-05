Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D9E446831
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 18:59:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 689D46EC6E;
	Fri,  5 Nov 2021 17:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 966F56EC6E
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 17:59:15 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id b12so14960471wrh.4
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Nov 2021 10:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=tGkFto0SREmSqUA5YI0n/LIXjjGKHRviX7CKssvc+BM=;
 b=H3jiklJ/Y/eada1RvgM3UfPQsPX0by+cBlb6mu+HZpANjjDP2EAco1y7vZs0KY5Z3K
 C8MdQ3+I5NEL9N/8IXXGyNI+uyZ82MNp7mVpaN4cTft5wEm0pU8+BSK0UHCLXzGllUnZ
 noFTpfuPfo5PmpoXi87sKvb6OeEHMYA2hz+qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tGkFto0SREmSqUA5YI0n/LIXjjGKHRviX7CKssvc+BM=;
 b=ZvFj0Fn6fJDb/DfMZ0kpyVn/lqU86DGuPuvDF1JcdLMVN5y8WkeFCLeyNPuF606/bJ
 M3riBo1urq3olreIyMBYpdM/vNsjw+t0ceMQZMW2wslhSi0lCBD/XeHBljHhCxC2zGuP
 Fq/+M7KjjV3/+I3QlNUV5FqJQjnwfm/uehTtS1oCKiOnrzXX5crAzV3N7yxsEgFy5pKe
 SZMZ73X+9NQKPPTV0eK7aMTKgSS44gw9wqkV91csR2DNUefAheGSfKZwtTXcYuLQ1x4r
 bBZLt+2+B3Lq1Y72xZ8QuzzZ+TNLm6JOVDSIbmK3j2mnDfGtAJKzgzrPEVmEDTACPDWH
 /+VA==
X-Gm-Message-State: AOAM531YVRgaYGR3iJsrN+EY/1QTQV6+jYhmGTs4B+v3ewRvvRqw7kFL
 5XwdrTk7vhfuRrR6+1rw9nJZ1A==
X-Google-Smtp-Source: ABdhPJwNq7bzeIgDFzjtJqF6GB5todXBINJj4e6J3QfytVexB5YUgQf8SyXm53D1wok8LpIRuN/xuA==
X-Received: by 2002:adf:f98c:: with SMTP id f12mr38342127wrr.184.1636135154166; 
 Fri, 05 Nov 2021 10:59:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n7sm8549638wro.68.2021.11.05.10.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 10:59:13 -0700 (PDT)
Date: Fri, 5 Nov 2021 18:59:11 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/2] drm: Remove CONFIG_DRM_KMS_CMA_HELPER option
Message-ID: <YYVw70934dYhyGVZ@phenom.ffwll.local>
References: <20211101081751.24613-3-tzimmermann@suse.de>
 <202111012344.tYv3YxkG-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202111012344.tYv3YxkG-lkp@intel.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: dri-devel@lists.freedesktop.org, kbuild-all@lists.01.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-aspeed@lists.ozlabs.org,
 airlied@linux.ie, naresh.kamboju@linaro.org, llvm@lists.linux.dev,
 linux-mips@vger.kernel.org, noralf@tronnes.org, marcel@ziswiler.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 01, 2021 at 11:59:15PM +0800, kernel test robot wrote:
> Hi Thomas,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on next-20211029]
> [cannot apply to drm/drm-next shawnguo/for-next pinchartl-media/drm/du/next v5.15 v5.15-rc7 v5.15-rc6 v5.15]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Thomas-Zimmermann/drm-Small-CMA-cleanups/20211101-161911
> base:    bdcc9f6a568275aed4cc32fd2312432d2ff1b704
> config: x86_64-randconfig-a004-20211101 (attached as .config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 82ed106567063ea269c6d5669278b733e173a42f)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/c3c7ec5f9ccd90e78f0f2d3143505db4060bbf17
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Thomas-Zimmermann/drm-Small-CMA-cleanups/20211101-161911
>         git checkout c3c7ec5f9ccd90e78f0f2d3143505db4060bbf17
>         # save the attached .config to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> >> ERROR: modpost: module drm_cma_helper uses symbol dma_buf_vmap from namespace DMA_BUF, but does not import it.
> >> ERROR: modpost: module drm_cma_helper uses symbol dma_buf_vunmap from namespace DMA_BUF, but does not import it.

I guess this is simply because kbuild tests on top of linux-next, where
the namespacing is a bit funny. We might need a fixup when we backmerge.

Either way this looks like a good simplification to me, on the series:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

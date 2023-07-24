Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A8975EC7D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 09:27:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B798810E11D;
	Mon, 24 Jul 2023 07:27:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A845810E11D
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 07:27:49 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E464F6606FC0;
 Mon, 24 Jul 2023 08:27:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1690183668;
 bh=XMKKLII5nUySx8GObgtYJSIP1MVBrzoDtfSH2ygtRrQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=g7wt4r794/zqagb2wH81Uvh2KnmsA7rrhGIf550sG4y3F5IukdrZnrbrz5n8RnxJB
 opW+hw744NZVx1+hx4ukL1oPbwe1cPYKdo8bmpB8n07zgD9jVRQ+92lo0c0YVWq10w
 GBUPhRGOf4nANxV5hUf2Z2CACGG6+GQ2u7PXv6OaAqy+upravAyrhadGxPAmqhsfFS
 tpSU/fzTSRe+REnSrwajje+2EaE8SAEjkS6PFBp69YRvOidOQt57qiuLuPVVOrIFGj
 yofXxIHThkUVvkF0Z1RHYAb3P2S53isDCxKgLm0k3axqsUH0Ulg12h3Ir6r+ar1mAC
 qqMD9eKtmrbIQ==
Date: Mon, 24 Jul 2023 09:27:44 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: kernel test robot <lkp@intel.com>
Subject: Re: [drm-misc:for-linux-next 2/2]
 drivers/gpu/drm/drm_debugfs.c:212:33: sparse: sparse: non size-preserving
 pointer to integer cast
Message-ID: <20230724092744.5c5b5700@collabora.com>
In-Reply-To: <202307210230.t2OnM5g0-lkp@intel.com>
References: <202307210230.t2OnM5g0-lkp@intel.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Boris Brezillon <bbrezillon@kernel.org>, Danilo Krummrich <dakr@redhat.com>,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 21 Jul 2023 02:06:16 +0800
kernel test robot <lkp@intel.com> wrote:

> tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
> head:   c7a472297169156252a50d76965eb36b081186e2
> commit: 4f66feeab173bd73e71028b8c2e1dcea07e32dd5 [2/2] drm: debugfs: provide infrastructure to dump a DRM GPU VA space
> config: i386-randconfig-r092-20230720 (https://download.01.org/0day-ci/archive/20230721/202307210230.t2OnM5g0-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20230721/202307210230.t2OnM5g0-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307210230.t2OnM5g0-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
> >> drivers/gpu/drm/drm_debugfs.c:212:33: sparse: sparse: non size-preserving pointer to integer cast  
> 
> vim +212 drivers/gpu/drm/drm_debugfs.c
> 
>    178	
>    179	/**
>    180	 * drm_debugfs_gpuva_info - dump the given DRM GPU VA space
>    181	 * @m: pointer to the &seq_file to write
>    182	 * @mgr: the &drm_gpuva_manager representing the GPU VA space
>    183	 *
>    184	 * Dumps the GPU VA mappings of a given DRM GPU VA manager.
>    185	 *
>    186	 * For each DRM GPU VA space drivers should call this function from their
>    187	 * &drm_info_list's show callback.
>    188	 *
>    189	 * Returns: 0 on success, -ENODEV if the &mgr is not initialized
>    190	 */
>    191	int drm_debugfs_gpuva_info(struct seq_file *m,
>    192				   struct drm_gpuva_manager *mgr)
>    193	{
>    194		struct drm_gpuva *va, *kva = &mgr->kernel_alloc_node;
>    195	
>    196		if (!mgr->name)
>    197			return -ENODEV;
>    198	
>    199		seq_printf(m, "DRM GPU VA space (%s) [0x%016llx;0x%016llx]\n",
>    200			   mgr->name, mgr->mm_start, mgr->mm_start + mgr->mm_range);
>    201		seq_printf(m, "Kernel reserved node [0x%016llx;0x%016llx]\n",
>    202			   kva->va.addr, kva->va.addr + kva->va.range);
>    203		seq_puts(m, "\n");
>    204		seq_puts(m, " VAs | start              | range              | end                | object             | object offset\n");
>    205		seq_puts(m, "-------------------------------------------------------------------------------------------------------------\n");
>    206		drm_gpuva_for_each_va(va, mgr) {
>    207			if (unlikely(va == kva))
>    208				continue;
>    209	
>    210			seq_printf(m, "     | 0x%016llx | 0x%016llx | 0x%016llx | 0x%016llx | 0x%016llx\n",
>    211				   va->va.addr, va->va.range, va->va.addr + va->va.range,
>  > 212				   (u64)va->gem.obj, va->gem.offset);  

Oops, I didn't notice it when reviewing. You're leaking a kernel address
to user space here. You should probably use %p to print the GEM object
address, and add `no_hash_pointers` to your cmdline when you want to
debug things.

>    213		}
>    214	
>    215		return 0;
>    216	}
>    217	EXPORT_SYMBOL(drm_debugfs_gpuva_info);
>    218	
> 


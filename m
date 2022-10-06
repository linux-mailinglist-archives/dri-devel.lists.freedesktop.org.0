Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E99A5F642D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 12:11:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F1410E34E;
	Thu,  6 Oct 2022 10:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D70AD10E7FD;
 Thu,  6 Oct 2022 07:55:19 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 130-20020a1c0288000000b003b494ffc00bso2316012wmc.0; 
 Thu, 06 Oct 2022 00:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t0gHcHj95iQot3u9dJoUqW0N9thU/AXtlSvNItR2GnU=;
 b=Xg5EbkkoECjKyMhve2o8QWXRInBF/7eHGahoOil5v2VGd+U3ER/Fg1rafVO4QYY6Ok
 0/FmT8reVmLkwrs8oNBUfJ8ZP96i5FcqfuJxeTmOvTAquWVKG8iwScJ4V8aEmbz/rOJG
 i/dPpYO40FEmNV16LT4AzPN4EJlpB02k5it1WWTLGxE4kVllqXu2x6BfSPBiQ5qwjUkc
 /GPmGeBIxHeMzNx/A8aEtFjQmTw+blvwly5o+9+tN0KTg6fwMgfhF7Y2GjEgcD03hn28
 MBMupp6wO+TbmhcOriP2kMpH0XfTtrPA5SfkUYE19cSVgVIgAAOEheYdIMx0teDxc3q1
 9ggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t0gHcHj95iQot3u9dJoUqW0N9thU/AXtlSvNItR2GnU=;
 b=0ZKNnU8AdgYJVD8dhLVvia3dC9paYxI4Ug4utDfv8PyG6VRcb1RJ/+aPRt4wHTtF3z
 I/x1ADttelJmh9Z7a4t+BcA3RMT0nCnT2r0AIawSSBLZEdETvr95hThOTdOv/+msudSY
 8i04AZ2sxpoQqffjy4yd/ZkdVgESy/ro4MIFtDyyCOYJFDm57fsy1PbPcxTPxxuWcpWe
 N4NzRwV/9jMTsn1qtWeERw1+MsBIOCAUTli+0J870jD1hHxfGPgLFnrY4lMbCr011qoo
 kFLiuvo50MFARLSTFcvjjnhy257Tt3kxQXyAviawD1kGBbEhTvUF8GfVm/bcUIUkXscz
 E4lw==
X-Gm-Message-State: ACrzQf2LsihPm/Hs0Sgqk6Olofhw9J4/dy9zAXSpb8tWDIeMvz3RSDBP
 4T+aqvRzb4JSUDs2ZilCML0=
X-Google-Smtp-Source: AMsMyM4yZuATsxI76joOkdOGKIW2YefUnFNV6FRsb/lH7FBatZ7Cl0qGBSX/NLEem/el3jbtQ2ZSUQ==
X-Received: by 2002:a05:600c:4f55:b0:3b4:b687:a7b7 with SMTP id
 m21-20020a05600c4f5500b003b4b687a7b7mr5783994wmq.185.1665042916799; 
 Thu, 06 Oct 2022 00:55:16 -0700 (PDT)
Received: from krava ([193.85.244.190]) by smtp.gmail.com with ESMTPSA id
 x16-20020adfec10000000b0022a2dbc80fdsm17139125wrn.10.2022.10.06.00.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 00:55:16 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 6 Oct 2022 09:55:13 +0200
To: kernel test robot <lkp@intel.com>
Subject: Re: [linux-next:master] BUILD REGRESSION
 67ae4f7434cee86ee318d46fb10b8a9840ad2e81
Message-ID: <Yz6J4eMvHOnK+CXb@krava>
References: <633deff4.q8bW3fyM79Uz0A/F%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <633deff4.q8bW3fyM79Uz0A/F%lkp@intel.com>
X-Mailman-Approved-At: Thu, 06 Oct 2022 10:11:21 +0000
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
Cc: kvm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-wireless@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>, iommu@lists.linux.dev,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 loongarch@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
 linux-ext4@vger.kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 06, 2022 at 04:58:28AM +0800, kernel test robot wrote:
> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> branch HEAD: 67ae4f7434cee86ee318d46fb10b8a9840ad2e81  Add linux-next specific files for 20221005
> 
> Error/Warning reports:
> 
> https://lore.kernel.org/linux-mm/202209060229.dVuyxjBv-lkp@intel.com
> https://lore.kernel.org/llvm/202209220019.Yr2VuXhg-lkp@intel.com
> https://lore.kernel.org/llvm/202210041553.k9dc1Joc-lkp@intel.com
> https://lore.kernel.org/llvm/202210060148.UXBijOcS-lkp@intel.com
> 
> Error/Warning: (recently discovered and may have been fixed)
> 
> ERROR: modpost: "devm_ioremap_resource" [drivers/dma/fsl-edma.ko] undefined!
> ERROR: modpost: "devm_ioremap_resource" [drivers/dma/idma64.ko] undefined!
> ERROR: modpost: "devm_ioremap_resource" [drivers/dma/qcom/hdma.ko] undefined!
> ERROR: modpost: "devm_memremap" [drivers/misc/open-dice.ko] undefined!
> ERROR: modpost: "devm_memunmap" [drivers/misc/open-dice.ko] undefined!
> ERROR: modpost: "devm_platform_ioremap_resource" [drivers/char/xillybus/xillybus_of.ko] undefined!
> ERROR: modpost: "ioremap" [drivers/net/ethernet/8390/pcnet_cs.ko] undefined!
> ERROR: modpost: "ioremap" [drivers/tty/ipwireless/ipwireless.ko] undefined!
> ERROR: modpost: "iounmap" [drivers/net/ethernet/8390/pcnet_cs.ko] undefined!
> ERROR: modpost: "iounmap" [drivers/tty/ipwireless/ipwireless.ko] undefined!
> arch/arm64/kernel/alternative.c:199:6: warning: no previous prototype for 'apply_alternatives_vdso' [-Wmissing-prototypes]
> arch/arm64/kernel/alternative.c:295:14: warning: no previous prototype for 'alt_cb_patch_nops' [-Wmissing-prototypes]
> arch/loongarch/kernel/traps.c:250 die() warn: variable dereferenced before check 'regs' (see line 244)
> arch/loongarch/mm/init.c:166:24: warning: variable 'new' set but not used [-Wunused-but-set-variable]
> drivers/gpu/drm/amd/amdgpu/../display/dc/virtual/virtual_link_hwss.c:40:6: warning: no previous prototype for 'virtual_disable_link_output' [-Wmissing-prototypes]
> drivers/gpu/drm/bridge/ite-it6505.c:2712 it6505_extcon_work() warn: pm_runtime_get_sync() also returns 1 on success
> drivers/platform/loongarch/loongson-laptop.c:377 loongson_laptop_get_brightness() warn: impossible condition '(level < 0) => (0-255 < 0)'
> drivers/vfio/pci/vfio_pci_core.c:775 vfio_pci_ioctl_get_region_info() warn: potential spectre issue 'pdev->resource' [w]
> drivers/vfio/pci/vfio_pci_core.c:855 vfio_pci_ioctl_get_region_info() warn: potential spectre issue 'vdev->region' [r]
> fs/ext4/super.c:1744:19: warning: 'deprecated_msg' defined but not used [-Wunused-const-variable=]
> include/linux/compiler_types.h:357:45: error: call to '__compiletime_assert_417' declared with attribute error: FIELD_GET: mask is not constant
> kernel/bpf/memalloc.c:500 bpf_mem_alloc_destroy() error: potentially dereferencing uninitialized 'c'.

looks like false warning in here, c should always have value,
not sure how to disable it in here

jirka

> net/mac80211/iface.c:251 ieee80211_can_powered_addr_change() warn: inconsistent returns '&local->mtx'.
> 
> Unverified Error/Warning (likely false positive, please contact us if interested):
> 
> ERROR: modpost: "__tsan_memcpy" [arch/s390/crypto/ghash_s390.ko] undefined!
> ERROR: modpost: "__tsan_memcpy" [arch/s390/crypto/sha512_s390.ko] undefined!
> ERROR: modpost: "__tsan_memcpy" [fs/binfmt_misc.ko] undefined!
> ERROR: modpost: "__tsan_memcpy" [fs/pstore/ramoops.ko] undefined!
> ERROR: modpost: "__tsan_memset" [arch/s390/crypto/ghash_s390.ko] undefined!
> ERROR: modpost: "__tsan_memset" [arch/s390/crypto/sha512_s390.ko] undefined!
> ERROR: modpost: "__tsan_memset" [fs/autofs/autofs4.ko] undefined!
> ERROR: modpost: "__tsan_memset" [fs/binfmt_misc.ko] undefined!
> ERROR: modpost: "__tsan_memset" [fs/cramfs/cramfs.ko] undefined!
> ERROR: modpost: "__tsan_memset" [fs/pstore/ramoops.ko] undefined!
> s390x-linux-ld: self.c:(.text+0xf6): undefined reference to `__tsan_memcpy'
> thread_self.c:(.text+0xe4): undefined reference to `__tsan_memcpy'
> 
> Error/Warning ids grouped by kconfigs:
> 
> gcc_recent_errors
> |-- alpha-allyesconfig
> |   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-virtual-virtual_link_hwss.c:warning:no-previous-prototype-for-virtual_disable_link_output
> |-- alpha-randconfig-s042-20221002
> |   |-- drivers-thermal-broadcom-ns-thermal.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-data-got-void-noderef-__iomem-assigned-pvtmon
> |   |-- drivers-thermal-broadcom-ns-thermal.c:sparse:sparse:incorrect-type-in-initializer-(different-address-spaces)-expected-void-noderef-__iomem-pvtmon-got-void
> |   |-- drivers-thermal-broadcom-ns-thermal.c:sparse:sparse:incorrect-type-in-initializer-(different-address-spaces)-expected-void-noderef-__iomem-pvtmon-got-void-devdata
> |   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-int-priv1-got-restricted-__le16-addressable-usertype-fc_len
> |   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-int-tag-got-restricted-__le16-addressable-usertype-fc_tag
> |   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-short-usertype-tag-got-restricted-__le16-addressable-usertype-fc_tag
> |   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__le16-usertype-fc_len-got-unsigned-short-usertype
> |   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__le16-usertype-fc_tag-got-unsigned-short-usertype
> |   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-int-tag-got-restricted-__le16-usertype-fc_tag
> |   `-- fs-ext4-fast_commit.c:sparse:sparse:restricted-__le16-degrades-to-integer
> |-- arc-randconfig-s051-20221002
> |   |-- drivers-gpu-drm-tiny-simpledrm.c:sparse:sparse:incorrect-type-in-initializer-(different-address-spaces)-expected-void-vaddr-got-void-noderef-__iomem-screen_base
> |   |-- drivers-gpu-drm-vkms-vkms_formats.c:sparse:sparse:cast-to-restricted-__le16
> |   |-- drivers-gpu-drm-vkms-vkms_formats.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-unsigned-short-usertype-got-restricted-__le16-usertype
> |   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-int-priv1-got-restricted-__le16-addressable-usertype-fc_len
> |   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-int-tag-got-restricted-__le16-addressable-usertype-fc_tag
> |   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-short-usertype-tag-got-restricted-__le16-addressable-usertype-fc_tag
> |   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__le16-usertype-fc_len-got-unsigned-short-usertype
> |   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__le16-usertype-fc_tag-got-unsigned-short-usertype
> |   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-int-tag-got-restricted-__le16-usertype-fc_tag
> |   |-- fs-ext4-fast_commit.c:sparse:sparse:restricted-__le16-degrades-to-integer
> |   |-- kernel-bpf-hashtab.c:sparse:sparse:cast-removes-address-space-__percpu-of-expression
> |   |-- kernel-bpf-hashtab.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-noderef-__percpu-assigned-pptr-got-void
> |   |-- kernel-bpf-hashtab.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-ptr_to_pptr-got-void-noderef-__percpu-assigned-pptr
> |   |-- kernel-bpf-memalloc.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-noderef-__percpu-__pdata-got-void
> |   |-- kernel-bpf-memalloc.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-noderef-__percpu-__pdata-got-void-pptr
> |   `-- kernel-bpf-memalloc.c:sparse:sparse:incorrect-type-in-initializer-(different-address-spaces)-expected-void-pptr-got-void-noderef-__percpu
> |-- arc-randconfig-s053-20221002
> |   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-int-priv1-got-restricted-__le16-addressable-usertype-fc_len
> |   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-int-tag-got-restricted-__le16-addressable-usertype-fc_tag
> |   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-short-usertype-tag-got-restricted-__le16-addressable-usertype-fc_tag
> |   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__le16-usertype-fc_len-got-unsigned-short-usertype
> |   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__le16-usertype-fc_tag-got-unsigned-short-usertype
> |   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-int-tag-got-restricted-__le16-usertype-fc_tag
> |   |-- fs-ext4-fast_commit.c:sparse:sparse:restricted-__le16-degrades-to-integer
> |   |-- kernel-bpf-hashtab.c:sparse:sparse:cast-removes-address-space-__percpu-of-expression
> |   |-- kernel-bpf-hashtab.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-noderef-__percpu-assigned-pptr-got-void
> |   |-- kernel-bpf-hashtab.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-ptr_to_pptr-got-void-noderef-__percpu-assigned-pptr
> |   |-- kernel-bpf-memalloc.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-noderef-__percpu-__pdata-got-void
> |   |-- kernel-bpf-memalloc.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-noderef-__percpu-__pdata-got-void-pptr
> |   `-- kernel-bpf-memalloc.c:sparse:sparse:incorrect-type-in-initializer-(different-address-spaces)-expected-void-pptr-got-void-noderef-__percpu
> |-- arm64-allyesconfig
> |   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-alt_cb_patch_nops
> |   `-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-apply_alternatives_vdso
> |-- arm64-randconfig-c023-20221005
> |   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-alt_cb_patch_nops
> |   `-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-apply_alternatives_vdso
> clang_recent_errors
> |-- arm-randconfig-r016-20221003
> |   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-virtual-virtual_link_hwss.c:warning:no-previous-prototype-for-function-virtual_disable_link_output
> |   |-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8173.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:
> |   `-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8183.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:
> |-- arm-randconfig-r033-20221002
> |   |-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8173.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:
> |   |-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8183.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:
> |   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
> |-- arm64-buildonly-randconfig-r002-20221003
> |   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-function-apply_alternatives_vdso
> |   `-- ld.lld:error:assignment-to-symbol-__efistub_kernel_size-does-not-converge
> |-- hexagon-randconfig-r013-20221002
> |   |-- ld.lld:error:vmlinux.a(arch-hexagon-kernel-head.o):(.init.text):relocation-R_HEX_B22_PCREL-out-of-range:is-not-in-references-__vmnewmap
> |   |-- ld.lld:error:vmlinux.a(arch-hexagon-kernel-head.o):(.init.text):relocation-R_HEX_B22_PCREL-out-of-range:is-not-in-references-__vmsetvec
> |   `-- ld.lld:error:vmlinux.a(arch-hexagon-kernel-head.o):(.init.text):relocation-R_HEX_B22_PCREL-out-of-range:is-not-in-references-memset
> |-- hexagon-randconfig-r025-20221003
> |   |-- drivers-phy-mediatek-phy-mtk-tphy.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(unsigned-c
> |   |-- ld.lld:error:vmlinux.a(arch-hexagon-kernel-head.o):(.init.text):relocation-R_HEX_B22_PCREL-out-of-range:is-not-in-references-__vmnewmap
> |   |-- ld.lld:error:vmlinux.a(arch-hexagon-kernel-head.o):(.init.text):relocation-R_HEX_B22_PCREL-out-of-range:is-not-in-references-__vmsetvec
> |   `-- ld.lld:error:vmlinux.a(arch-hexagon-kernel-head.o):(.init.text):relocation-R_HEX_B22_PCREL-out-of-range:is-not-in-references-memset
> |-- hexagon-randconfig-r031-20221002
> |   |-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8173.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:
> |   |-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8183.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:
> |   `-- drivers-phy-mediatek-phy-mtk-tphy.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(unsigned-c
> |-- hexagon-randconfig-r041-20221003
> |   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
> |-- hexagon-randconfig-r045-20221002
> |   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
> |-- i386-randconfig-a002-20221003
> |   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
> |-- i386-randconfig-a005-20221003
> |   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
> |-- i386-randconfig-a006-20221003
> |   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
> |-- i386-randconfig-r001-20221003
> |   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
> |-- mips-loongson1c_defconfig
> |   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
> |-- mips-randconfig-r006-20221002
> |   |-- drivers-phy-mediatek-phy-mtk-hdmi-mt2701.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(uns
> |   |-- drivers-phy-mediatek-phy-mtk-hdmi-mt8173.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(uns
> |   |-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8173.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:
> |   |-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8183.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:
> |   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
> |-- powerpc-allyesconfig
> |   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-virtual-virtual_link_hwss.c:warning:no-previous-prototype-for-function-virtual_disable_link_output
> |   |-- drivers-phy-mediatek-phy-mtk-hdmi-mt2701.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(uns
> |   |-- drivers-phy-mediatek-phy-mtk-hdmi-mt8173.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(uns
> |   |-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8173.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:
> |   |-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8183.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:
> 
> elapsed time: 729m
> 
> configs tested: 94
> configs skipped: 3
> 
> gcc tested configs:
> i386                                defconfig
> arc                                 defconfig
> x86_64                          rhel-8.3-func
> s390                             allmodconfig
> x86_64                    rhel-8.3-kselftests
> um                             i386_defconfig
> um                           x86_64_defconfig
> alpha                               defconfig
> s390                                defconfig
> powerpc                           allnoconfig
> powerpc                          allmodconfig
> x86_64                           rhel-8.3-syz
> mips                             allyesconfig
> s390                             allyesconfig
> x86_64                         rhel-8.3-kunit
> x86_64                              defconfig
> x86_64                           rhel-8.3-kvm
> arm                            pleb_defconfig
> alpha                             allnoconfig
> powerpc                      chrp32_defconfig
> i386                             allyesconfig
> arc                          axs101_defconfig
> x86_64                               rhel-8.3
> riscv                             allnoconfig
> arc                    vdk_hs38_smp_defconfig
> arm                                 defconfig
> powerpc                 linkstation_defconfig
> i386                 randconfig-a014-20221003
> sh                             espt_defconfig
> sh                               allmodconfig
> csky                              allnoconfig
> x86_64                           allyesconfig
> i386                 randconfig-a011-20221003
> arc                               allnoconfig
> arm                           h3600_defconfig
> x86_64               randconfig-a011-20221003
> i386                 randconfig-a012-20221003
> arm64                            allyesconfig
> s390                       zfcpdump_defconfig
> sparc64                             defconfig
> x86_64               randconfig-a015-20221003
> i386                 randconfig-a013-20221003
> sh                   sh7770_generic_defconfig
> m68k                             allmodconfig
> x86_64               randconfig-a014-20221003
> arm                              allyesconfig
> powerpc                       maple_defconfig
> arc                              allyesconfig
> sh                             shx3_defconfig
> ia64                             allmodconfig
> m68k                            q40_defconfig
> i386                 randconfig-a015-20221003
> x86_64               randconfig-a012-20221003
> arm                       imx_v6_v7_defconfig
> i386                 randconfig-a016-20221003
> mips                            ar7_defconfig
> alpha                            allyesconfig
> x86_64               randconfig-a013-20221003
> arm                          gemini_defconfig
> m68k                                defconfig
> x86_64               randconfig-a016-20221003
> m68k                             allyesconfig
> i386                          randconfig-c001
> mips                          rb532_defconfig
> riscv                randconfig-r042-20221003
> arc                  randconfig-r043-20221003
> arc                  randconfig-r043-20221002
> s390                 randconfig-r044-20221003
> riscv                            allyesconfig
> 
> clang tested configs:
> x86_64               randconfig-a003-20221003
> x86_64               randconfig-a002-20221003
> x86_64               randconfig-a001-20221003
> x86_64               randconfig-a004-20221003
> x86_64               randconfig-a006-20221003
> arm                        neponset_defconfig
> x86_64               randconfig-a005-20221003
> i386                 randconfig-a003-20221003
> i386                 randconfig-a002-20221003
> i386                 randconfig-a001-20221003
> i386                 randconfig-a004-20221003
> riscv                          rv32_defconfig
> i386                 randconfig-a005-20221003
> hexagon              randconfig-r041-20221003
> x86_64                        randconfig-k001
> riscv                randconfig-r042-20221002
> i386                 randconfig-a006-20221003
> hexagon              randconfig-r041-20221002
> s390                 randconfig-r044-20221002
> mips                     loongson1c_defconfig
> hexagon              randconfig-r045-20221002
> powerpc                 mpc8272_ads_defconfig
> hexagon              randconfig-r045-20221003
> powerpc                          allyesconfig
> x86_64                          rhel-8.3-rust
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://01.org/lkp

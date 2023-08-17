Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C2077FE0D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 20:44:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75ED010E58A;
	Thu, 17 Aug 2023 18:44:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D663D10E57F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 18:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=s+yMCPhjOL7dlSQxxy56NPES58qbEzmGhM9FA47BA0A=; b=Qhnpe5SeMJkLfyfzpBPvYDPI3R
 j4P85C4Uh4ATWL6Qq1ONYids/qrE8DOZasKvViv0jyxEQbwpZir0Hh4l6jtLAIp6gXzVIXmDT6SMv
 Tc6Rc9QiP2qmdoOE21PNA7mCn9O2oj32s4xmFtpj8bh6J/6y+sHNvV0WaZSAIJdBVzM6jB7ETjlmW
 Jkxg+4/TUq8LxBCINDUk1fiBOk9CY8pqYN2xKyc5JeWUbzGROI//o3ZUAIW41v5BQZTEbrPexe4tB
 uryMhitBnum3WIHq6pdDOhbiix7W+6C2XiOCMsSDMv2BIgECJ0gsPDn3WW+YAELEepiYWi5DRCnUy
 pVLPNISw==;
Received: from [2601:1c2:980:9ec0::2764]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qWhyt-006ztU-1Q; Thu, 17 Aug 2023 18:44:27 +0000
Message-ID: <17065c3f-87bb-c2a9-e8f6-82fecd15b9c7@infradead.org>
Date: Thu, 17 Aug 2023 11:44:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: linux-next: Tree for Aug 17 (DRM_TTM KUNIT tests)
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20230817144729.7d2b1b53@canb.auug.org.au>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230817144729.7d2b1b53@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Huang Rui <ray.huang@amd.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Christian Koenig <christian.koenig@amd.com>,
 KUnit Development <kunit-dev@googlegroups.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/16/23 21:47, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20230816:
> 

on risc-v 32-bit:
when
# CONFIG_MMU is not set


WARNING: unmet direct dependencies detected for DRM_TTM
  Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
  Selected by [y]:
  - DRM_TTM_KUNIT_TEST [=y] && HAS_IOMEM [=y] && DRM [=y] && KUNIT [=y]

WARNING: unmet direct dependencies detected for DRM_TTM
  Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
  Selected by [y]:
  - DRM_TTM_KUNIT_TEST [=y] && HAS_IOMEM [=y] && DRM [=y] && KUNIT [=y]

WARNING: unmet direct dependencies detected for DRM_TTM
  Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
  Selected by [y]:
  - DRM_TTM_KUNIT_TEST [=y] && HAS_IOMEM [=y] && DRM [=y] && KUNIT [=y]

/opt/crosstool/gcc-13.1.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: drivers/gpu/drm/ttm/ttm_bo_vm.o: in function `.L31':
ttm_bo_vm.c:(.text+0x42c): undefined reference to `vmf_insert_pfn_prot'
/opt/crosstool/gcc-13.1.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: drivers/gpu/drm/ttm/ttm_bo_vm.o: in function `.L104':
ttm_bo_vm.c:(.text+0xa70): undefined reference to `vmf_insert_pfn_prot'


-- 
~Randy

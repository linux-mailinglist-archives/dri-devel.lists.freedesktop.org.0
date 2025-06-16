Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDA1ADAB7F
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 11:09:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77FA410E2F7;
	Mon, 16 Jun 2025 09:09:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="NJjjWtui";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC2AD10E300
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 09:09:46 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250616090945euoutp0271c0410735c3643358e256dd51e8040e~JetToJfm11964519645euoutp02g
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 09:09:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250616090945euoutp0271c0410735c3643358e256dd51e8040e~JetToJfm11964519645euoutp02g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1750064985;
 bh=Z0yVDNlBuUeI2U5G9pnG88sUo+3LU8vld6YvrIkhECY=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=NJjjWtuiH8rQP1rLO+Qn29ldm7aH/ChlGrzo5voO7FGEzkE4eRwYtrAghrMJ1qEdP
 pYXMDPXEvc2SPnERO/SvJoRqMWNMp9pPt5+Fk5/14cuWB2tFCkCnyX/0IA0ziX3vRw
 E3glhShhovdXx4zJ4e/ZUFX1+Bhtz2spsF/SNLmQ=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250616090944eucas1p1ffc6fcf91024df239946d55f78cd73ab~JetTDE54A2755827558eucas1p16;
 Mon, 16 Jun 2025 09:09:44 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250616090943eusmtip1582353473f82f3f625b89a1041e9e149~JetR4HUmp2738727387eusmtip1M;
 Mon, 16 Jun 2025 09:09:43 +0000 (GMT)
Message-ID: <9765c970-55cc-4413-9fd0-5e0cdfa900fa@samsung.com>
Date: Mon, 16 Jun 2025 11:09:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/8] drm/imagination: Enable PowerVR driver for RISC-V
To: kernel test robot <lkp@intel.com>, Drew Fustini <drew@pdp7.com>, Guo Ren
 <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel
 <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, Matt Coster
 <matt.coster@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>, Marek
 Szyprowski <m.szyprowski@samsung.com>
Cc: Paul Gazzillo <paul@pgazz.com>, Necip Fazil Yildiran
 <fazilyildiran@gmail.com>, oe-kbuild-all@lists.linux.dev,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <202506151839.IKkZs0Z0-lkp@intel.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250616090944eucas1p1ffc6fcf91024df239946d55f78cd73ab
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250615105256eucas1p21dba29a1450757d9201b2a9c7f0e34e8
X-EPHeader: CA
X-CMS-RootMailID: 20250615105256eucas1p21dba29a1450757d9201b2a9c7f0e34e8
References: <20250614-apr_14_for_sending-v4-8-8e3945c819cd@samsung.com>
 <CGME20250615105256eucas1p21dba29a1450757d9201b2a9c7f0e34e8@eucas1p2.samsung.com>
 <202506151839.IKkZs0Z0-lkp@intel.com>
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



On 6/15/25 12:51, kernel test robot wrote:
> Hi Michal,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on 4774cfe3543abb8ee98089f535e28ebfd45b975a]
> 
> url:    https://protect2.fireeye.com/v1/url?k=6c3bc994-0cd954c9-6c3a42db-000babd9f1ba-30c2378fa012fc4a&q=1&e=c39c960c-4d5f-44d7-aed7-0097394dfc81&u=https%3A%2F%2Fgithub.com%2Fintel-lab-lkp%2Flinux%2Fcommits%2FMichal-Wilczynski%2Fpower-sequencing-Add-T-HEAD-TH1520-GPU-power-sequencer-driver%2F20250615-021142
> base:   4774cfe3543abb8ee98089f535e28ebfd45b975a
> patch link:    https://lore.kernel.org/r/20250614-apr_14_for_sending-v4-8-8e3945c819cd%40samsung.com
> patch subject: [PATCH v4 8/8] drm/imagination: Enable PowerVR driver for RISC-V
> config: riscv-kismet-CONFIG_DRM_GEM_SHMEM_HELPER-CONFIG_DRM_POWERVR-0-0 (https://download.01.org/0day-ci/archive/20250615/202506151839.IKkZs0Z0-lkp@intel.com/config)
> reproduce: (https://download.01.org/0day-ci/archive/20250615/202506151839.IKkZs0Z0-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506151839.IKkZs0Z0-lkp@intel.com/
> 
> kismet warnings: (new ones prefixed by >>)
>>> kismet: WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER when selected by DRM_POWERVR
>    WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
>      Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]

I believe this is triggered because RISC-V can be compiled without MMU
support, while MMU support is mandatory for ARM64.

Would an acceptable fix be to require an explicit dependency on the MMU,
like so?

depends on (ARM64 || RISCV) && MMU

>      Selected by [y]:
>      - DRM_POWERVR [=y] && HAS_IOMEM [=y] && (ARM64 || RISCV [=y]) && DRM [=y] && PM [=y]
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

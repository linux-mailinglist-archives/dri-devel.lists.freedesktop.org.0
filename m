Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D314D1C2363
	for <lists+dri-devel@lfdr.de>; Sat,  2 May 2020 07:52:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9CE86ED84;
	Sat,  2 May 2020 05:52:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 300 seconds by postgrey-1.36 at gabe;
 Sat, 02 May 2020 05:52:40 UTC
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38FBA6E02E;
 Sat,  2 May 2020 05:52:40 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ead09360000>; Fri, 01 May 2020 22:46:31 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 01 May 2020 22:47:39 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 01 May 2020 22:47:39 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 2 May
 2020 05:47:38 +0000
Received: from [10.2.59.220] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 2 May 2020
 05:47:37 +0000
Subject: Re: [PATCH hmm v2 1/5] mm/hmm: make CONFIG_DEVICE_PRIVATE into a
 select
To: Jason Gunthorpe <jgg@ziepe.ca>, <linux-mm@kvack.org>, Ralph Campbell
 <rcampbell@nvidia.com>
References: <1-v2-b4e84f444c7d+24f57-hmm_no_flags_jgg@mellanox.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <17b40a00-658a-1bf4-c14a-7543dd0d2f8c@nvidia.com>
Date: Fri, 1 May 2020 22:47:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1-v2-b4e84f444c7d+24f57-hmm_no_flags_jgg@mellanox.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1588398391; bh=9WVhNWEwbrdSv0IZ+XjrYrQTjZYFLJxQOn+wzBze+IE=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=jJbUjZIFpsl+z/WpjRf+dQtCXmX45b2domJ6ui2m0qQLXPCNWeAK2d+Lt4SbMdTHW
 g6h3pk5CkJS4IW8FgDWLONNamvZn4bouhO81p+K/1DKwCbicz1zs5jlW7h5lYehaw/
 clXb1ncut+A5uh78Ae8RCl1Pxjlxo56PG1PTgpCitHzCJSjToSTeViTPgNwElLgtfg
 qk2aJkzLeiGCZUHBkqurTPk4fTAp+5LR5mZhDn33zl2pf7bJhWSK1TYnaIbhFSoqYr
 /cE70NsFQkUcb0lx6FJJ0mKaFJCNfqcecIhbKwZbc17bnzzdzQMurqGa0/qeJJkiSP
 Uti4fpB1h8oTA==
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
Cc: amd-gfx@lists.freedesktop.org, "Yang, Philip" <Philip.Yang@amd.com>,
 nouveau@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-05-01 11:20, Jason Gunthorpe wrote:
> From: Jason Gunthorpe <jgg@mellanox.com>
> 
> There is no reason for a user to select this or not directly - it should
> be selected by drivers that are going to use the feature, similar to how
> CONFIG_HMM_MIRROR works.

Yes, this is a nice touch.

Reviewed-by: John Hubbard <jhubbard@nvidia.com>

thanks,
-- 
John Hubbard
NVIDIA

> 
> Currently all drivers provide a feature kconfig that will disable use of
> DEVICE_PRIVATE in that driver, allowing users to avoid enabling this if
> they don't want the overhead.
> 
> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
> ---
>   arch/powerpc/Kconfig            | 2 +-
>   drivers/gpu/drm/nouveau/Kconfig | 2 +-
>   mm/Kconfig                      | 7 +------
>   3 files changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 924c541a926008..8de52aefdc74cc 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -455,7 +455,7 @@ config PPC_TRANSACTIONAL_MEM
>   config PPC_UV
>   	bool "Ultravisor support"
>   	depends on KVM_BOOK3S_HV_POSSIBLE
> -	depends on DEVICE_PRIVATE
> +	select DEVICE_PRIVATE
>   	default n
>   	help
>   	  This option paravirtualizes the kernel to run in POWER platforms that
> diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
> index d6e4ae1ef7053a..af5793f3e7c2cf 100644
> --- a/drivers/gpu/drm/nouveau/Kconfig
> +++ b/drivers/gpu/drm/nouveau/Kconfig
> @@ -86,10 +86,10 @@ config DRM_NOUVEAU_BACKLIGHT
>   
>   config DRM_NOUVEAU_SVM
>   	bool "(EXPERIMENTAL) Enable SVM (Shared Virtual Memory) support"
> -	depends on DEVICE_PRIVATE
>   	depends on DRM_NOUVEAU
>   	depends on MMU
>   	depends on STAGING
> +	select DEVICE_PRIVATE
>   	select HMM_MIRROR
>   	select MMU_NOTIFIER
>   	default n
> diff --git a/mm/Kconfig b/mm/Kconfig
> index c1acc34c1c358c..7ca36bf5f5058e 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -805,15 +805,10 @@ config HMM_MIRROR
>   	depends on MMU
>   
>   config DEVICE_PRIVATE
> -	bool "Unaddressable device memory (GPU memory, ...)"
> +	bool
>   	depends on ZONE_DEVICE
>   	select DEV_PAGEMAP_OPS
>   
> -	help
> -	  Allows creation of struct pages to represent unaddressable device
> -	  memory; i.e., memory that is only accessible from the device (or
> -	  group of devices). You likely also want to select HMM_MIRROR.
> -
>   config FRAME_VECTOR
>   	bool
>   
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD71646D386
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 13:43:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C0872C89;
	Wed,  8 Dec 2021 12:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DAF872C89;
 Wed,  8 Dec 2021 12:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 435243F3A3;
 Wed,  8 Dec 2021 13:43:50 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -3.11
X-Spam-Level: 
X-Spam-Status: No, score=-3.11 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.011,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Authentication-Results: ste-pvt-msa1.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j_LNOhDnzbrL; Wed,  8 Dec 2021 13:43:49 +0100 (CET)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id ABF6D3F2BA;
 Wed,  8 Dec 2021 13:43:48 +0100 (CET)
Received: from [192.168.0.209] (h-155-4-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 0FE14362AD5;
 Wed,  8 Dec 2021 13:43:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1638967428; bh=Vnjh/rwjY5pEUQbAi5NHBWfwvB2JgTimbzUPdqEI+OM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mv93Du13AcqWKiEHUFAHADV5WiQgV6paT8evVliB9vAh/cj3EWvy813sUZcyeVwvq
 ckNDmWWOOeftXote2ZZqNNzZgwW5BKxC1k4DV3N+nxGiW5YtXGgnc98SMUbE5YFm1l
 7IKlx4HKKG0H8kH+hk/xrE4JGe2hfWdOCQa14EO8=
Message-ID: <801b9d8b-1b5c-ce2f-dc05-e804cafc3683@shipmail.org>
Date: Wed, 8 Dec 2021 13:43:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [Intel-gfx] [PATCH 1/4] drm/i915: Add has_64k_pages flag
Content-Language: en-US
To: Ramalingam C <ramalingam.c@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20211207165156.31244-1-ramalingam.c@intel.com>
 <20211207165156.31244-2-ramalingam.c@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <20211207165156.31244-2-ramalingam.c@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>, Andi <andi.shyti@intel.com>,
 Chris_intel_ID <chris.p.wilson@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 12/7/21 17:51, Ramalingam C wrote:
> From: Stuart Summers <stuart.summers@intel.com>
>
> Add a new platform flag, has_64k_pages, for platforms supporting
> base page sizes of 64k.
>
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_drv.h          | 2 ++
>   drivers/gpu/drm/i915/i915_pci.c          | 2 ++
>   drivers/gpu/drm/i915/intel_device_info.h | 1 +
>   3 files changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 85bb8d3107f0..6132163e1cb3 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1528,6 +1528,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>   #define HAS_MSLICES(dev_priv) \
>   	(INTEL_INFO(dev_priv)->has_mslices)
>   
> +#define HAS_64K_PAGES(dev_priv) (INTEL_INFO(dev_priv)->has_64k_pages)
> +

Could we please have some documentation of the exact meaning of this flag.
Like, smallest page size of LMEM is 64K. Hardware supports 64k pages etc?

for future reference.

/Thomas





>   #define HAS_IPC(dev_priv)		 (INTEL_INFO(dev_priv)->display.has_ipc)
>   
>   #define HAS_REGION(i915, i) (INTEL_INFO(i915)->memory_regions & (i))
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index 6aaa7c644c9b..634282edadb7 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -1029,6 +1029,7 @@ static const struct intel_device_info xehpsdv_info = {
>   	DGFX_FEATURES,
>   	PLATFORM(INTEL_XEHPSDV),
>   	.display = { },
> +	.has_64k_pages = 1,
>   	.pipe_mask = 0,
>   	.platform_engine_mask =
>   		BIT(RCS0) | BIT(BCS0) |
> @@ -1047,6 +1048,7 @@ static const struct intel_device_info dg2_info = {
>   	.graphics.rel = 55,
>   	.media.rel = 55,
>   	PLATFORM(INTEL_DG2),
> +	.has_64k_pages = 1,
>   	.platform_engine_mask =
>   		BIT(RCS0) | BIT(BCS0) |
>   		BIT(VECS0) | BIT(VECS1) |
> diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
> index 669f0d26c3c3..f38ac5bd837b 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.h
> +++ b/drivers/gpu/drm/i915/intel_device_info.h
> @@ -123,6 +123,7 @@ enum intel_ppgtt_type {
>   	func(is_dgfx); \
>   	/* Keep has_* in alphabetical order */ \
>   	func(has_64bit_reloc); \
> +	func(has_64k_pages); \
>   	func(gpu_reset_clobbers_display); \
>   	func(has_reset_engine); \
>   	func(has_global_mocs); \

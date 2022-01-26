Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F21DF49CBCC
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 15:06:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9BEC10E766;
	Wed, 26 Jan 2022 14:06:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC4210E63B;
 Wed, 26 Jan 2022 14:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id E2CB73F689;
 Wed, 26 Jan 2022 15:05:56 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Authentication-Results: ste-pvt-msa1.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hMX6J1oMPg-X; Wed, 26 Jan 2022 15:05:56 +0100 (CET)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 293F03F66F;
 Wed, 26 Jan 2022 15:05:53 +0100 (CET)
Received: from [192.168.0.209] (unknown [192.55.55.54])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 2B3B33626AA;
 Wed, 26 Jan 2022 15:05:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1643205953; bh=0MTfgcCysP/q4eVXnuzFoCi2k0Jnuri0D10FI7Hd3AM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RsLQLxnyua74FxEE2/64ThYR5+k3uN1bMz9T9qsxrPQ1BBbccs1J23+KBzWmVyycK
 fpvxv6rm07BNAZdm2ViUlwSDsmVVJQAtVlSH4bjf5Q7Hx6dKWMn3UeKr4FAXKxk811
 oaT7tYG4JF1jHX1nFr7EF/NUCkPQpW/pox9SPkCE=
Message-ID: <b6e9a900-435f-148c-826f-a8f6c188df94@shipmail.org>
Date: Wed, 26 Jan 2022 15:05:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [Intel-gfx] [PATCH v5 4/5] drm/i915: add gtt misalignment test
Content-Language: en-US
To: Robert Beckett <bob.beckett@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20220125193530.3272386-1-bob.beckett@collabora.com>
 <20220125193530.3272386-5-bob.beckett@collabora.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <20220125193530.3272386-5-bob.beckett@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/25/22 20:35, Robert Beckett wrote:
> add test to check handling of misaligned offsets and sizes
>
> v4:
> 	* remove spurious blank lines
> 	* explicitly cast intel_region_id to intel_memory_type in misaligned_pin
> Reported-by: kernel test robot <lkp@intel.com>
>
> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
> ---
>   drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 128 ++++++++++++++++++
>   1 file changed, 128 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> index b80788a2b7f9..f082b5ff3b5e 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> @@ -22,10 +22,12 @@
>    *
>    */
>   
> +#include "gt/intel_gtt.h"
>   #include <linux/list_sort.h>
>   #include <linux/prime_numbers.h>
>   
>   #include "gem/i915_gem_context.h"
> +#include "gem/i915_gem_region.h"
>   #include "gem/selftests/mock_context.h"
>   #include "gt/intel_context.h"
>   #include "gt/intel_gpu_commands.h"
> @@ -1067,6 +1069,120 @@ static int shrink_boom(struct i915_address_space *vm,
>   	return err;
>   }
>   
> +static int misaligned_case(struct i915_address_space *vm, struct intel_memory_region *mr,
> +			   u64 addr, u64 size, unsigned long flags)
> +{
> +	struct drm_i915_gem_object *obj;
> +	struct i915_vma *vma;
> +	int err = 0;
> +	u64 expected_vma_size, expected_node_size;
> +
> +	obj = i915_gem_object_create_region(mr, size, 0, 0);
> +	if (IS_ERR(obj))
> +		return PTR_ERR(obj);
> +
> +	vma = i915_vma_instance(obj, vm, NULL);
> +	if (IS_ERR(vma)) {
> +		err = PTR_ERR(vma);
> +		goto err_put;
> +	}
> +
> +	err = i915_vma_pin(vma, 0, 0, addr | flags);
> +	if (err)
> +		goto err_put;
> +	i915_vma_unpin(vma);
> +
> +	if (!drm_mm_node_allocated(&vma->node)) {
> +		err = -EINVAL;
> +		goto err_put;
> +	}
> +
> +	if (i915_vma_misplaced(vma, 0, 0, addr | flags)) {
> +		err = -EINVAL;
> +		goto err_put;
> +	}
> +
> +	expected_vma_size = round_up(size, 1 << (ffs(vma->resource->page_sizes_gtt) - 1));
> +	expected_node_size = expected_vma_size;
> +
> +	if (IS_DG2(vm->i915) && i915_gem_object_is_lmem(obj)) {
> +		/* dg2 should expand lmem node to 2MB */

Should this test be NEEDS_COMPACT_PT()?

Otherwise LGTM. Reviewed-by: Thomas Hellström 
<thomas.hellstrom@linux.intel.com>



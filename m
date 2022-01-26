Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFA949CED3
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 16:45:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCCDB10E171;
	Wed, 26 Jan 2022 15:45:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F79B10E171;
 Wed, 26 Jan 2022 15:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 0D4B83F606;
 Wed, 26 Jan 2022 16:45:35 +0100 (CET)
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
 with ESMTP id pkcjr9YNR3c6; Wed, 26 Jan 2022 16:45:33 +0100 (CET)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id B2F6E3F480;
 Wed, 26 Jan 2022 16:45:31 +0100 (CET)
Received: from [192.168.0.209] (unknown [192.55.55.54])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 855513626AA;
 Wed, 26 Jan 2022 16:45:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1643211931; bh=OAVs3hYBXF9umhJz4d5fI5nR0JlCGZSrkHnQDPk4XIE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Uri7ihhQXMgDT8l7FQq3wMoLcvY8yvVWeSjh7sIYdW5/I5XXmYPXSvdSQklJJgmP+
 BHRIjKzxohhl/4jMv86ba+YRbmzWzmllpGG0zG3GKmLP10UDBXUyLsC2UFeW2Fm/xI
 WsOi19IAAFEtUE88Fegq268OdrazKWPfE8EKO34g=
Message-ID: <9f011e69-2d6d-d6a1-db78-d4a061b4ef2c@shipmail.org>
Date: Wed, 26 Jan 2022 16:45:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [Intel-gfx] [PATCH v5 2/5] drm/i915: enforce min GTT alignment
 for discrete cards
Content-Language: en-US
To: Robert Beckett <bob.beckett@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20220125193530.3272386-1-bob.beckett@collabora.com>
 <20220125193530.3272386-3-bob.beckett@collabora.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <20220125193530.3272386-3-bob.beckett@collabora.com>
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/25/22 20:35, Robert Beckett wrote:
> From: Matthew Auld <matthew.auld@intel.com>
>
> For local-memory objects we need to align the GTT addresses
> to 64K, both for the ppgtt and ggtt.
>
> We need to support vm->min_alignment > 4K, depending
> on the vm itself and the type of object we are inserting.
> With this in mind update the GTT selftests to take this
> into account.
>
> For compact-pt we further align and pad lmem object GTT addresses
> to 2MB to ensure PDEs contain consistent page sizes as
> required by the HW.
>
> v3:
> 	* use needs_compact_pt flag to discriminate between
> 	  64K and 64K with compact-pt
> 	* add i915_vm_obj_min_alignment
> 	* use i915_vm_obj_min_alignment to round up vma reservation
> 	  if compact-pt instead of hard coding
> v5:
> 	* fix i915_vm_obj_min_alignment for internal objects which
> 	  have no memory region
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   .../i915/gem/selftests/i915_gem_client_blt.c  | 23 +++--
>   drivers/gpu/drm/i915/gt/intel_gtt.c           | 12 +++
>   drivers/gpu/drm/i915/gt/intel_gtt.h           | 18 ++++
>   drivers/gpu/drm/i915/i915_vma.c               |  9 ++
>   drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 96 ++++++++++++-------
>   5 files changed, 117 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
> index c8ff8bf0986d..f0bfce53258f 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
> @@ -39,6 +39,7 @@ struct tiled_blits {
>   	struct blit_buffer scratch;
>   	struct i915_vma *batch;
>   	u64 hole;
> +	u64 align;
>   	u32 width;
>   	u32 height;
>   };
> @@ -410,14 +411,21 @@ tiled_blits_create(struct intel_engine_cs *engine, struct rnd_state *prng)
>   		goto err_free;
>   	}
>   
> -	hole_size = 2 * PAGE_ALIGN(WIDTH * HEIGHT * 4);
> +	t->align = I915_GTT_PAGE_SIZE_2M; /* XXX worst case, derive from vm! */
> +	t->align = max(t->align,
> +		       i915_vm_min_alignment(t->ce->vm, INTEL_MEMORY_LOCAL));
> +	t->align = max(t->align,
> +		       i915_vm_min_alignment(t->ce->vm, INTEL_MEMORY_SYSTEM));

Don't we always end up with 2M here, regardless of the vm restrictions?



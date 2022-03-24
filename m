Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB674E66BD
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 17:15:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B078C10E9AC;
	Thu, 24 Mar 2022 16:15:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2788810E90F;
 Thu, 24 Mar 2022 16:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 66F7D3F456;
 Thu, 24 Mar 2022 17:15:02 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.111
X-Spam-Level: 
X-Spam-Status: No, score=-2.111 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y7w1PYQvXdLR; Thu, 24 Mar 2022 17:15:01 +0100 (CET)
Received: by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 634123F300;
 Thu, 24 Mar 2022 17:14:59 +0100 (CET)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="UZxnCoCY";
 dkim-atps=neutral
Received: from [192.168.0.209] (unknown [192.55.54.50])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 52830362508;
 Thu, 24 Mar 2022 17:14:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1648138499; bh=fcI/CbjeiUfeu2PTkXr0IwW5WRbO71TTkCHNL6isKPo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UZxnCoCYwDhMQblHC4+ZExJgRm0JWthfEsUxkwAJ4YZF5MBBDbqMX3oEsmEat3Izg
 0ba0Rc7XEMRn2kHlNvYmowvG4T7pQjGbT3SG/qCtv/xHw9x+1H0zqr6ZIv7TY4pDMz
 cuIO9D4CXYu8RQttGcZXf59f/ll5dYqR+mV25+Zc=
Message-ID: <eaedf459-b504-2716-5c73-9c8ec338bd65@shipmail.org>
Date: Thu, 24 Mar 2022 17:14:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Intel-gfx] [PATCH v5 3/9] drm/i915/gt: Clear compress metadata
 for Flat-ccs objects
Content-Language: en-US
To: Ramalingam C <ramalingam.c@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20220321224459.12223-1-ramalingam.c@intel.com>
 <20220321224459.12223-4-ramalingam.c@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <20220321224459.12223-4-ramalingam.c@intel.com>
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
Cc: Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Ram

On 3/21/22 23:44, Ramalingam C wrote:
> Xe-HP and latest devices support Flat CCS which reserved a portion of
> the device memory to store compression metadata, during the clearing of
> device memory buffer object we also need to clear the associated
> CCS buffer.
>
> XY_CTRL_SURF_COPY_BLT is a BLT cmd used for reading and writing the
> ccs surface of a lmem memory. So on Flat-CCS capable platform we use
> XY_CTRL_SURF_COPY_BLT  to clear the CCS meta data.
>
> v2: Fixed issues with platform naming [Lucas]
> v3: Rebased [Ram]
>      Used the round_up funcs [Bob]
> v4: Fixed ccs blk calculation [Ram]
>      Added Kdoc on flat-ccs.
> v5: GENMASK is used [Matt]
>      mocs fix [Matt]
>      Comments Fix [Matt]
>      Flush address programming [Ram]
> v6: FLUSH_DW is fixed
>      Few coding style fix
> v7: Adopting the XY_FAST_COLOR_BLT (Thomas]
> v8: XY_CTRL_SURF_COPY_BLT for ccs clearing.
> v9: emit_copy_ccs is used.
>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> Signed-off-by: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_gpu_commands.h |  15 ++
>   drivers/gpu/drm/i915/gt/intel_migrate.c      | 164 ++++++++++++++++++-
>   2 files changed, 175 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> index 925e55b6a94f..6b4eb7927ec7 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> @@ -153,8 +153,10 @@
>   #define   MI_FLUSH_DW_PROTECTED_MEM_EN	(1 << 22)
>   #define   MI_FLUSH_DW_STORE_INDEX	(1<<21)
>   #define   MI_INVALIDATE_TLB		(1<<18)
> +#define   MI_FLUSH_DW_CCS		(1<<16)
>   #define   MI_FLUSH_DW_OP_STOREDW	(1<<14)
>   #define   MI_FLUSH_DW_OP_MASK		(3<<14)
> +#define   MI_FLUSH_DW_LLC		(1<<9)
>   #define   MI_FLUSH_DW_NOTIFY		(1<<8)
>   #define   MI_INVALIDATE_BSD		(1<<7)
>   #define   MI_FLUSH_DW_USE_GTT		(1<<2)
> @@ -203,6 +205,19 @@
>   #define GFX_OP_DRAWRECT_INFO     ((0x3<<29)|(0x1d<<24)|(0x80<<16)|(0x3))
>   #define GFX_OP_DRAWRECT_INFO_I965  ((0x7900<<16)|0x2)
>   
> +#define XY_CTRL_SURF_INSTR_SIZE		5
> +#define MI_FLUSH_DW_SIZE		3
> +#define XY_CTRL_SURF_COPY_BLT		((2 << 29) | (0x48 << 22) | 3)
> +#define   SRC_ACCESS_TYPE_SHIFT		21
> +#define   DST_ACCESS_TYPE_SHIFT		20
> +#define   CCS_SIZE_MASK			GENMASK(17, 8)
> +#define   XY_CTRL_SURF_MOCS_MASK	GENMASK(31, 25)
> +#define   NUM_CCS_BYTES_PER_BLOCK	256
> +#define   NUM_BYTES_PER_CCS_BYTE	256
> +#define   NUM_CCS_BLKS_PER_XFER		1024
> +#define   INDIRECT_ACCESS		0
> +#define   DIRECT_ACCESS			1
> +
>   #define COLOR_BLT_CMD			(2 << 29 | 0x40 << 22 | (5 - 2))
>   #define XY_COLOR_BLT_CMD		(2 << 29 | 0x50 << 22)
>   #define XY_FAST_COLOR_BLT_CMD		(2 << 29 | 0x44 << 22)
> diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
> index b656685a486d..39a5f8ae664d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_migrate.c
> +++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
> @@ -16,7 +16,8 @@ struct insert_pte_data {
>   };
>   
>   #define CHUNK_SZ SZ_8M /* ~1ms at 8GiB/s preemption delay */
> -
> +#define GET_CCS_BYTES(i915, size)	(HAS_FLAT_CCS(i915) ? \
> +					 DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE) : 0)
>   static bool engine_supports_migration(struct intel_engine_cs *engine)
>   {
>   	if (!engine)
> @@ -467,6 +468,145 @@ static bool wa_1209644611_applies(int ver, u32 size)
>   	return height % 4 == 3 && height <= 8;
>   }
>   
> +/**
> + * DOC: Flat-CCS - Memory compression for Local memory
> + *
> + * On Xe-HP and later devices, we use dedicated compression control state (CCS)
> + * stored in local memory for each surface, to support the 3D and media
> + * compression formats.
> + *
> + * The memory required for the CCS of the entire local memory is 1/256 of the
> + * local memory size. So before the kernel boot, the required memory is reserved
> + * for the CCS data and a secure register will be programmed with the CCS base
> + * address.
> + *
> + * Flat CCS data needs to be cleared when a lmem object is allocated.
> + * And CCS data can be copied in and out of CCS region through
> + * XY_CTRL_SURF_COPY_BLT. CPU can't access the CCS data directly.
> + *
> + * When we exhaust the lmem, if the object's placements support smem, then we can
> + * directly decompress the compressed lmem object into smem and start using it
> + * from smem itself.
> + *
> + * But when we need to swapout the compressed lmem object into a smem region
> + * though objects' placement doesn't support smem, then we copy the lmem content
> + * as it is into smem region along with ccs data (using XY_CTRL_SURF_COPY_BLT).
> + * When the object is referred, lmem content will be swaped in along with
> + * restoration of the CCS data (using XY_CTRL_SURF_COPY_BLT) at corresponding
> + * location.
> + */
> +
> +static inline u32 *i915_flush_dw(u32 *cmd, u32 flags)
> +{
> +	*cmd++ = MI_FLUSH_DW | flags;
> +	*cmd++ = 0;
> +	*cmd++ = 0;
> +
> +	return cmd;
> +}
> +
> +static u32 calc_ctrl_surf_instr_size(struct drm_i915_private *i915, int size)
> +{
> +	u32 num_cmds, num_blks, total_size;
> +
> +	if (!GET_CCS_BYTES(i915, size))
> +		return 0;
> +
> +	/*
> +	 * XY_CTRL_SURF_COPY_BLT transfers CCS in 256 byte
> +	 * blocks. one XY_CTRL_SURF_COPY_BLT command can
> +	 * transfer upto 1024 blocks.
> +	 */
> +	num_blks = DIV_ROUND_UP(GET_CCS_BYTES(i915, size),
> +				NUM_CCS_BYTES_PER_BLOCK);
> +	num_cmds = DIV_ROUND_UP(num_blks, NUM_CCS_BLKS_PER_XFER);
> +	total_size = XY_CTRL_SURF_INSTR_SIZE * num_cmds;
> +
> +	/*
> +	 * Adding a flush before and after XY_CTRL_SURF_COPY_BLT
> +	 */
> +	total_size += 2 * MI_FLUSH_DW_SIZE;
> +
> +	return total_size;
> +}
> +
> +static u32 *_i915_ctrl_surf_copy_blt(u32 *cmd, u64 src_addr, u64 dst_addr,
> +				     u8 src_mem_access, u8 dst_mem_access,
> +				     int src_mocs, int dst_mocs,
> +				     u32 ccs_blocks)
> +{
> +	/*
> +	 * The XY_CTRL_SURF_COPY_BLT instruction is used to copy the CCS
> +	 * data in and out of the CCS region.
> +	 *
> +	 * We can copy at most 1024 blocks of 256 bytes using one
> +	 * XY_CTRL_SURF_COPY_BLT instruction.
> +	 *
> +	 * In case we need to copy more than 1024 blocks, we need to add
> +	 * another instruction to the same batch buffer.
> +	 *
> +	 * 1024 blocks of 256 bytes of CCS represent a total 256KB of CCS.
> +	 *
> +	 * 256 KB of CCS represents 256 * 256 KB = 64 MB of LMEM.
> +	 */
> +	do {
> +		int blks_per_copy;

Considering that the main surface copy only ever is CHUNK_SZ,
We will never do more than one iteration here, right? Perhaps consider 
merging with the below function, with a  check that blks_per_copy never 
exceeds NUM_CCS_BLKS_PER_XFER.

> +
> +		blks_per_copy = ccs_blocks >= NUM_CCS_BLKS_PER_XFER ?
> +				NUM_CCS_BLKS_PER_XFER : ccs_blocks;
> +		*cmd++ = XY_CTRL_SURF_COPY_BLT |
> +			 src_mem_access << SRC_ACCESS_TYPE_SHIFT |
> +			 dst_mem_access << DST_ACCESS_TYPE_SHIFT |
> +			 FIELD_PREP(CCS_SIZE_MASK, blks_per_copy - 1);
> +		*cmd++ = lower_32_bits(src_addr);
> +		*cmd++ = (upper_32_bits(src_addr) & 0xFFFF) |
> +			  FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, src_mocs);
> +		*cmd++ = lower_32_bits(dst_addr);
> +		*cmd++ = (upper_32_bits(dst_addr) & 0xFFFF) |
> +			  FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, dst_mocs);
> +		src_addr += SZ_64M;
> +		dst_addr += SZ_64M;
> +		ccs_blocks -= blks_per_copy;
> +	} while (ccs_blocks > 0);
> +
> +	return cmd;
> +}
> +
> +static int emit_copy_ccs(struct i915_request *rq,
> +			 u32 dst_offset, u8 dst_access,
> +			 u32 src_offset, u8 src_access, int size)
> +{
> +	struct drm_i915_private *i915 = rq->engine->i915;
> +	int mocs = rq->engine->gt->mocs.uc_index << 1;
> +	u32 num_ccs_blks, ccs_ring_size;
> +	u32 *cs;
> +
> +	src_offset += (u64)rq->engine->instance << 32;
> +	dst_offset += (u64)rq->engine->instance << 32;

These are nops, considering that the offsets are 32-bit. Better to pass 
the instance as a separate parameter to the above function, like is done 
elsewhere.

> +
> +	ccs_ring_size = calc_ctrl_surf_instr_size(i915, size);
> +	WARN_ON(!ccs_ring_size);
> +
> +	cs = intel_ring_begin(rq, round_up(ccs_ring_size, 2));
> +	if (IS_ERR(cs))
> +		return PTR_ERR(cs);
> +
> +	num_ccs_blks = DIV_ROUND_UP(GET_CCS_BYTES(i915, size),
> +				    NUM_CCS_BYTES_PER_BLOCK);
> +
> +	cs = i915_flush_dw(cs, MI_FLUSH_DW_LLC | MI_FLUSH_DW_CCS);
> +	cs = _i915_ctrl_surf_copy_blt(cs, src_offset, dst_offset,
> +				      src_access, dst_access,
> +				      mocs, mocs, num_ccs_blks);
> +	cs = i915_flush_dw(cs, MI_FLUSH_DW_LLC | MI_FLUSH_DW_CCS);
> +	if (ccs_ring_size & 1)
> +		*cs++ = MI_NOOP;
> +
> +	intel_ring_advance(rq, cs);
> +
> +	return 0;
> +}
> +
>   static int emit_copy(struct i915_request *rq,
>   		     u32 dst_offset, u32 src_offset, int size)
>   {
> @@ -616,7 +756,7 @@ static int emit_clear(struct i915_request *rq, u64 offset, int size,
>   		      u32 value, bool is_lmem)
>   {
>   	struct drm_i915_private *i915 = rq->engine->i915;
> -	int mocs = rq->engine->gt->mocs.uc_index << 1;
> +	u32 mocs = rq->engine->gt->mocs.uc_index << 1;
>   	const int ver = GRAPHICS_VER(i915);
>   	int ring_sz;
>   	u32 *cs;
> @@ -632,7 +772,7 @@ static int emit_clear(struct i915_request *rq, u64 offset, int size,
>   	else
>   		ring_sz = 6;
>   
> -	cs = intel_ring_begin(rq, ring_sz);
> +	cs = intel_ring_begin(rq, round_up(ring_sz, 2));

ring_sz is always even in this function? If not, then this is a bugfix 
and should be in a separate patch.


>   	if (IS_ERR(cs))
>   		return PTR_ERR(cs);
>   
> @@ -690,6 +830,7 @@ intel_context_migrate_clear(struct intel_context *ce,
>   			    u32 value,
>   			    struct i915_request **out)
>   {
> +	struct drm_i915_private *i915 = ce->engine->i915;
>   	struct sgt_dma it = sg_sgt(sg);
>   	struct i915_request *rq;
>   	u32 offset;
> @@ -701,7 +842,7 @@ intel_context_migrate_clear(struct intel_context *ce,
>   	GEM_BUG_ON(ce->ring->size < SZ_64K);
>   
>   	offset = 0;
> -	if (HAS_64K_PAGES(ce->engine->i915) && is_lmem)
> +	if (HAS_64K_PAGES(i915) && is_lmem)
>   		offset = CHUNK_SZ;
>   
>   	do {
> @@ -743,6 +884,21 @@ intel_context_migrate_clear(struct intel_context *ce,
>   			goto out_rq;
>   
>   		err = emit_clear(rq, offset, len, value, is_lmem);
> +		if (err)
> +			goto out_rq;
> +
> +		if (HAS_FLAT_CCS(i915) && is_lmem && !value) {
> +			/*
> +			 * copy the content of memory into corresponding
> +			 * ccs surface
> +			 */
> +			err = emit_copy_ccs(rq, offset, INDIRECT_ACCESS, offset,
> +					    DIRECT_ACCESS, len);
> +			if (err)
> +				goto out_rq;
> +		}
> +
> +		err = rq->engine->emit_flush(rq, EMIT_INVALIDATE);
>   
>   		/* Arbitration is re-enabled between requests. */
>   out_rq:

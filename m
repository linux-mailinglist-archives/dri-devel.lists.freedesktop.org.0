Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CDC4EFE0D
	for <lists+dri-devel@lfdr.de>; Sat,  2 Apr 2022 05:02:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C507F10E101;
	Sat,  2 Apr 2022 03:01:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E18C10E0F5;
 Sat,  2 Apr 2022 03:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648868519; x=1680404519;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=nGLFQ+VrJ4zI+alv7uVVWx6t08ELTGEjqdxhrS7T0JY=;
 b=GvExgpq6g8gob5o8TLVlWDZgeqpPZ/6blOuA8ewKR/bcre4j7+J4EAWy
 DLdL1HLH9bqmOpOvqNmL8uDdyjnR4Mhady1CQlwvYe49u40+PLJdTJO5H
 NhYWHIeqZH/m9DCirD0Q2klE4RB21Qc4Un17iguhhpKt+yix3lZmIxfo9
 GCD3TFPgJy9iNW3tOg73R8cvxmcIG7Vo8TYOCNwPJ603YbkpzCwtkuYKU
 0x1IR5MrMXFC+SKk/43fS3B1ZgJKlDESFXXlQ5aKIznUphAYNmUyGggRf
 jJMHQ7cX05HbH2GrmPMrtR1dn68lDFZQpKLmro2tyMqKeQpfJJ1+wFVko w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10304"; a="346709737"
X-IronPort-AV: E=Sophos;i="5.90,229,1643702400"; d="scan'208";a="346709737"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 20:01:58 -0700
X-IronPort-AV: E=Sophos;i="5.90,229,1643702400"; d="scan'208";a="522994817"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.203.144.108])
 by orsmga006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2022 20:01:56 -0700
Date: Sat, 2 Apr 2022 08:32:38 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH v7 7/9] drm/ttm: Add a parameter to add extra pages into
 ttm_tt
Message-ID: <20220402030237.GA29661@intel.com>
References: <20220401123751.27771-1-ramalingam.c@intel.com>
 <20220401123751.27771-8-ramalingam.c@intel.com>
 <20220401142853.GF12046@intel.com>
 <7517726e-c828-ace8-9968-e542e23d97f1@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7517726e-c828-ace8-9968-e542e23d97f1@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-04-01 at 16:31:19 +0200, Christian König wrote:
> I would be nicer to push this through drm-misc-next, but the intel branch
> works for me as well.
Hi Christian

I have pushed this patch into drm-misc-next.

Regards,
Ram.
> 
> Regards,
> Christian.
> 
> Am 01.04.22 um 16:28 schrieb Ramalingam C:
> > Christian, Joonas and vivi
> > 
> > Once the premerge results are greeen, if this patch can be merged into
> > drm-intel-gt-next along with other patches could you please ack the
> > request to merge into drm-intel-gt-next?
> > 
> > Thanks
> > Ram
> > 
> > On 2022-04-01 at 18:07:49 +0530, Ramalingam C wrote:
> > > Add a parameter called "extra_pages" for ttm_tt_init, to indicate that
> > > driver needs extra pages in ttm_tt.
> > > 
> > > v2:
> > >    Used imperative wording [Thomas and Christian]
> > > 
> > > Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> > > cc: Christian Koenig <christian.koenig@amd.com>
> > > cc: Hellstrom Thomas <thomas.hellstrom@intel.com>
> > > Reviewed-by: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
> > > Reviewed-by: Christian Konig <christian.koenig@amd.com>
> > > Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> > > ---
> > >   drivers/gpu/drm/drm_gem_vram_helper.c      |  2 +-
> > >   drivers/gpu/drm/i915/gem/i915_gem_ttm.c    |  2 +-
> > >   drivers/gpu/drm/qxl/qxl_ttm.c              |  2 +-
> > >   drivers/gpu/drm/ttm/ttm_agp_backend.c      |  2 +-
> > >   drivers/gpu/drm/ttm/ttm_tt.c               | 12 +++++++-----
> > >   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |  2 +-
> > >   include/drm/ttm/ttm_tt.h                   |  4 +++-
> > >   7 files changed, 15 insertions(+), 11 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> > > index dc7f938bfff2..123045b58fec 100644
> > > --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> > > +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> > > @@ -867,7 +867,7 @@ static struct ttm_tt *bo_driver_ttm_tt_create(struct ttm_buffer_object *bo,
> > >   	if (!tt)
> > >   		return NULL;
> > > -	ret = ttm_tt_init(tt, bo, page_flags, ttm_cached);
> > > +	ret = ttm_tt_init(tt, bo, page_flags, ttm_cached, 0);
> > >   	if (ret < 0)
> > >   		goto err_ttm_tt_init;
> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > > index c40aca99442f..a878910a563c 100644
> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > > @@ -293,7 +293,7 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
> > >   		i915_tt->is_shmem = true;
> > >   	}
> > > -	ret = ttm_tt_init(&i915_tt->ttm, bo, page_flags, caching);
> > > +	ret = ttm_tt_init(&i915_tt->ttm, bo, page_flags, caching, 0);
> > >   	if (ret)
> > >   		goto err_free;
> > > diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
> > > index 95df5750f47f..9ba871bd19b1 100644
> > > --- a/drivers/gpu/drm/qxl/qxl_ttm.c
> > > +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
> > > @@ -113,7 +113,7 @@ static struct ttm_tt *qxl_ttm_tt_create(struct ttm_buffer_object *bo,
> > >   	ttm = kzalloc(sizeof(struct ttm_tt), GFP_KERNEL);
> > >   	if (ttm == NULL)
> > >   		return NULL;
> > > -	if (ttm_tt_init(ttm, bo, page_flags, ttm_cached)) {
> > > +	if (ttm_tt_init(ttm, bo, page_flags, ttm_cached, 0)) {
> > >   		kfree(ttm);
> > >   		return NULL;
> > >   	}
> > > diff --git a/drivers/gpu/drm/ttm/ttm_agp_backend.c b/drivers/gpu/drm/ttm/ttm_agp_backend.c
> > > index 6ddc16f0fe2b..d27691f2e451 100644
> > > --- a/drivers/gpu/drm/ttm/ttm_agp_backend.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_agp_backend.c
> > > @@ -134,7 +134,7 @@ struct ttm_tt *ttm_agp_tt_create(struct ttm_buffer_object *bo,
> > >   	agp_be->mem = NULL;
> > >   	agp_be->bridge = bridge;
> > > -	if (ttm_tt_init(&agp_be->ttm, bo, page_flags, ttm_write_combined)) {
> > > +	if (ttm_tt_init(&agp_be->ttm, bo, page_flags, ttm_write_combined, 0)) {
> > >   		kfree(agp_be);
> > >   		return NULL;
> > >   	}
> > > diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> > > index d234aab800a0..1a66d9fc589a 100644
> > > --- a/drivers/gpu/drm/ttm/ttm_tt.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> > > @@ -134,9 +134,10 @@ void ttm_tt_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
> > >   static void ttm_tt_init_fields(struct ttm_tt *ttm,
> > >   			       struct ttm_buffer_object *bo,
> > >   			       uint32_t page_flags,
> > > -			       enum ttm_caching caching)
> > > +			       enum ttm_caching caching,
> > > +			       unsigned long extra_pages)
> > >   {
> > > -	ttm->num_pages = PAGE_ALIGN(bo->base.size) >> PAGE_SHIFT;
> > > +	ttm->num_pages = (PAGE_ALIGN(bo->base.size) >> PAGE_SHIFT) + extra_pages;
> > >   	ttm->caching = ttm_cached;
> > >   	ttm->page_flags = page_flags;
> > >   	ttm->dma_address = NULL;
> > > @@ -146,9 +147,10 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
> > >   }
> > >   int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
> > > -		uint32_t page_flags, enum ttm_caching caching)
> > > +		uint32_t page_flags, enum ttm_caching caching,
> > > +		unsigned long extra_pages)
> > >   {
> > > -	ttm_tt_init_fields(ttm, bo, page_flags, caching);
> > > +	ttm_tt_init_fields(ttm, bo, page_flags, caching, extra_pages);
> > >   	if (ttm_tt_alloc_page_directory(ttm)) {
> > >   		pr_err("Failed allocating page table\n");
> > > @@ -180,7 +182,7 @@ int ttm_sg_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
> > >   {
> > >   	int ret;
> > > -	ttm_tt_init_fields(ttm, bo, page_flags, caching);
> > > +	ttm_tt_init_fields(ttm, bo, page_flags, caching, 0);
> > >   	if (page_flags & TTM_TT_FLAG_EXTERNAL)
> > >   		ret = ttm_sg_tt_alloc_page_directory(ttm);
> > > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> > > index b84ecc6d6611..4e3938e62c08 100644
> > > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> > > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> > > @@ -517,7 +517,7 @@ static struct ttm_tt *vmw_ttm_tt_create(struct ttm_buffer_object *bo,
> > >   				     ttm_cached);
> > >   	else
> > >   		ret = ttm_tt_init(&vmw_be->dma_ttm, bo, page_flags,
> > > -				  ttm_cached);
> > > +				  ttm_cached, 0);
> > >   	if (unlikely(ret != 0))
> > >   		goto out_no_init;
> > > diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> > > index f20832139815..17a0310e8aaa 100644
> > > --- a/include/drm/ttm/ttm_tt.h
> > > +++ b/include/drm/ttm/ttm_tt.h
> > > @@ -140,6 +140,7 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bool zero_alloc);
> > >    * @bo: The buffer object we create the ttm for.
> > >    * @page_flags: Page flags as identified by TTM_TT_FLAG_XX flags.
> > >    * @caching: the desired caching state of the pages
> > > + * @extra_pages: Extra pages needed for the driver.
> > >    *
> > >    * Create a struct ttm_tt to back data with system memory pages.
> > >    * No pages are actually allocated.
> > > @@ -147,7 +148,8 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bool zero_alloc);
> > >    * NULL: Out of memory.
> > >    */
> > >   int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
> > > -		uint32_t page_flags, enum ttm_caching caching);
> > > +		uint32_t page_flags, enum ttm_caching caching,
> > > +		unsigned long extra_pages);
> > >   int ttm_sg_tt_init(struct ttm_tt *ttm_dma, struct ttm_buffer_object *bo,
> > >   		   uint32_t page_flags, enum ttm_caching caching);
> > > -- 
> > > 2.20.1
> > > 
> 

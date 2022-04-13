Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B124FF1E1
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 10:28:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E89E10F143;
	Wed, 13 Apr 2022 08:28:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1820410F143;
 Wed, 13 Apr 2022 08:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649838513; x=1681374513;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:to:cc:from:message-id:date;
 bh=L+OZNj90+AdPcJBQS0p2Z5B16rtPE3u9y8tyW5Ki0Ng=;
 b=bQuMGn3lrkKEzju8Q8Ht0EqCGHf8va56784KYZLhXwYBIiLPDVvuAWW6
 4OigxJluw77FJtyQEleMOGd0VHj7rde6JhIJbkJs5w2Dkc6Fw4uXqeGFx
 od7b5zCW0YocASGBeknzDLgZM/AUcaPTmVp/SH4QbmoNGgWiDcVYUGitL
 rQlhI5H0gJso27ULVNidU2/1hyQr5FQSyhXsQktGIbFC7s7iJcFbL+eSv
 6sjj6rVx+EDzQvdZQsGtBKgq9/2/KImyax0ZC0RWJMDZZRTiblfWHtZxI
 UtIo301TB/BirEpsEKW3ZnM1VxbsS7AR5eJznSVJFHxV5FQpp/WlzWBw8 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="262787310"
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; d="scan'208";a="262787310"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 01:28:32 -0700
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; d="scan'208";a="724809778"
Received: from ebruchet-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.45.44])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 01:28:30 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220402030237.GA29661@intel.com>
References: <20220401123751.27771-1-ramalingam.c@intel.com>
 <20220401123751.27771-8-ramalingam.c@intel.com>
 <20220401142853.GF12046@intel.com>
 <7517726e-c828-ace8-9968-e542e23d97f1@amd.com>
 <20220402030237.GA29661@intel.com>
Subject: Re: [PATCH v7 7/9] drm/ttm: Add a parameter to add extra pages into
 ttm_tt
To: Christian König <christian.koenig@amd.com>, Ramalingam C <ramalingam.c@intel.com>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <164983850800.14850.12943794917384272373@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Wed, 13 Apr 2022 11:28:28 +0300
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(+ Tvrtko and Jani)

Quoting Ramalingam C (2022-04-02 06:02:38)
> On 2022-04-01 at 16:31:19 +0200, Christian K=C3=B6nig wrote:
> > I would be nicer to push this through drm-misc-next, but the intel bran=
ch
> > works for me as well.
> Hi Christian
>=20
> I have pushed this patch into drm-misc-next.

I've now backmerged drm-next containing this commit to drm-intel-gt-next
in order to unblock merging the rest of the series.

> Regards,
> Ram.
> >=20
> > Regards,
> > Christian.
> >=20
> > Am 01.04.22 um 16:28 schrieb Ramalingam C:
> > > Christian, Joonas and vivi
> > >=20
> > > Once the premerge results are greeen, if this patch can be merged into
> > > drm-intel-gt-next along with other patches could you please ack the
> > > request to merge into drm-intel-gt-next?

For future reference, when in doubt who are the right ones to handle,
add all the maintainers and wait for them to reply before proceeding.

Then we can avoid some unnecessary churn where there are more
straightforward options like here: merge via drm-intel-gt-next as
nobody else needs the new functions yet.

Regards, Joonas

> > > Thanks
> > > Ram
> > >=20
> > > On 2022-04-01 at 18:07:49 +0530, Ramalingam C wrote:
> > > > Add a parameter called "extra_pages" for ttm_tt_init, to indicate t=
hat
> > > > driver needs extra pages in ttm_tt.
> > > >=20
> > > > v2:
> > > >    Used imperative wording [Thomas and Christian]
> > > >=20
> > > > Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> > > > cc: Christian Koenig <christian.koenig@amd.com>
> > > > cc: Hellstrom Thomas <thomas.hellstrom@intel.com>
> > > > Reviewed-by: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
> > > > Reviewed-by: Christian Konig <christian.koenig@amd.com>
> > > > Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> > > > ---
> > > >   drivers/gpu/drm/drm_gem_vram_helper.c      |  2 +-
> > > >   drivers/gpu/drm/i915/gem/i915_gem_ttm.c    |  2 +-
> > > >   drivers/gpu/drm/qxl/qxl_ttm.c              |  2 +-
> > > >   drivers/gpu/drm/ttm/ttm_agp_backend.c      |  2 +-
> > > >   drivers/gpu/drm/ttm/ttm_tt.c               | 12 +++++++-----
> > > >   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |  2 +-
> > > >   include/drm/ttm/ttm_tt.h                   |  4 +++-
> > > >   7 files changed, 15 insertions(+), 11 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/dr=
m/drm_gem_vram_helper.c
> > > > index dc7f938bfff2..123045b58fec 100644
> > > > --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> > > > +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> > > > @@ -867,7 +867,7 @@ static struct ttm_tt *bo_driver_ttm_tt_create(s=
truct ttm_buffer_object *bo,
> > > >           if (!tt)
> > > >                   return NULL;
> > > > - ret =3D ttm_tt_init(tt, bo, page_flags, ttm_cached);
> > > > + ret =3D ttm_tt_init(tt, bo, page_flags, ttm_cached, 0);
> > > >           if (ret < 0)
> > > >                   goto err_ttm_tt_init;
> > > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/=
drm/i915/gem/i915_gem_ttm.c
> > > > index c40aca99442f..a878910a563c 100644
> > > > --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > > > @@ -293,7 +293,7 @@ static struct ttm_tt *i915_ttm_tt_create(struct=
 ttm_buffer_object *bo,
> > > >                   i915_tt->is_shmem =3D true;
> > > >           }
> > > > - ret =3D ttm_tt_init(&i915_tt->ttm, bo, page_flags, caching);
> > > > + ret =3D ttm_tt_init(&i915_tt->ttm, bo, page_flags, caching, 0);
> > > >           if (ret)
> > > >                   goto err_free;
> > > > diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qx=
l_ttm.c
> > > > index 95df5750f47f..9ba871bd19b1 100644
> > > > --- a/drivers/gpu/drm/qxl/qxl_ttm.c
> > > > +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
> > > > @@ -113,7 +113,7 @@ static struct ttm_tt *qxl_ttm_tt_create(struct =
ttm_buffer_object *bo,
> > > >           ttm =3D kzalloc(sizeof(struct ttm_tt), GFP_KERNEL);
> > > >           if (ttm =3D=3D NULL)
> > > >                   return NULL;
> > > > - if (ttm_tt_init(ttm, bo, page_flags, ttm_cached)) {
> > > > + if (ttm_tt_init(ttm, bo, page_flags, ttm_cached, 0)) {
> > > >                   kfree(ttm);
> > > >                   return NULL;
> > > >           }
> > > > diff --git a/drivers/gpu/drm/ttm/ttm_agp_backend.c b/drivers/gpu/dr=
m/ttm/ttm_agp_backend.c
> > > > index 6ddc16f0fe2b..d27691f2e451 100644
> > > > --- a/drivers/gpu/drm/ttm/ttm_agp_backend.c
> > > > +++ b/drivers/gpu/drm/ttm/ttm_agp_backend.c
> > > > @@ -134,7 +134,7 @@ struct ttm_tt *ttm_agp_tt_create(struct ttm_buf=
fer_object *bo,
> > > >           agp_be->mem =3D NULL;
> > > >           agp_be->bridge =3D bridge;
> > > > - if (ttm_tt_init(&agp_be->ttm, bo, page_flags, ttm_write_combined)=
) {
> > > > + if (ttm_tt_init(&agp_be->ttm, bo, page_flags, ttm_write_combined,=
 0)) {
> > > >                   kfree(agp_be);
> > > >                   return NULL;
> > > >           }
> > > > diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm=
_tt.c
> > > > index d234aab800a0..1a66d9fc589a 100644
> > > > --- a/drivers/gpu/drm/ttm/ttm_tt.c
> > > > +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> > > > @@ -134,9 +134,10 @@ void ttm_tt_destroy(struct ttm_device *bdev, s=
truct ttm_tt *ttm)
> > > >   static void ttm_tt_init_fields(struct ttm_tt *ttm,
> > > >                                  struct ttm_buffer_object *bo,
> > > >                                  uint32_t page_flags,
> > > > -                        enum ttm_caching caching)
> > > > +                        enum ttm_caching caching,
> > > > +                        unsigned long extra_pages)
> > > >   {
> > > > - ttm->num_pages =3D PAGE_ALIGN(bo->base.size) >> PAGE_SHIFT;
> > > > + ttm->num_pages =3D (PAGE_ALIGN(bo->base.size) >> PAGE_SHIFT) + ex=
tra_pages;
> > > >           ttm->caching =3D ttm_cached;
> > > >           ttm->page_flags =3D page_flags;
> > > >           ttm->dma_address =3D NULL;
> > > > @@ -146,9 +147,10 @@ static void ttm_tt_init_fields(struct ttm_tt *=
ttm,
> > > >   }
> > > >   int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
> > > > -         uint32_t page_flags, enum ttm_caching caching)
> > > > +         uint32_t page_flags, enum ttm_caching caching,
> > > > +         unsigned long extra_pages)
> > > >   {
> > > > - ttm_tt_init_fields(ttm, bo, page_flags, caching);
> > > > + ttm_tt_init_fields(ttm, bo, page_flags, caching, extra_pages);
> > > >           if (ttm_tt_alloc_page_directory(ttm)) {
> > > >                   pr_err("Failed allocating page table\n");
> > > > @@ -180,7 +182,7 @@ int ttm_sg_tt_init(struct ttm_tt *ttm, struct t=
tm_buffer_object *bo,
> > > >   {
> > > >           int ret;
> > > > - ttm_tt_init_fields(ttm, bo, page_flags, caching);
> > > > + ttm_tt_init_fields(ttm, bo, page_flags, caching, 0);
> > > >           if (page_flags & TTM_TT_FLAG_EXTERNAL)
> > > >                   ret =3D ttm_sg_tt_alloc_page_directory(ttm);
> > > > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/g=
pu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> > > > index b84ecc6d6611..4e3938e62c08 100644
> > > > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> > > > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> > > > @@ -517,7 +517,7 @@ static struct ttm_tt *vmw_ttm_tt_create(struct =
ttm_buffer_object *bo,
> > > >                                        ttm_cached);
> > > >           else
> > > >                   ret =3D ttm_tt_init(&vmw_be->dma_ttm, bo, page_fl=
ags,
> > > > -                           ttm_cached);
> > > > +                           ttm_cached, 0);
> > > >           if (unlikely(ret !=3D 0))
> > > >                   goto out_no_init;
> > > > diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> > > > index f20832139815..17a0310e8aaa 100644
> > > > --- a/include/drm/ttm/ttm_tt.h
> > > > +++ b/include/drm/ttm/ttm_tt.h
> > > > @@ -140,6 +140,7 @@ int ttm_tt_create(struct ttm_buffer_object *bo,=
 bool zero_alloc);
> > > >    * @bo: The buffer object we create the ttm for.
> > > >    * @page_flags: Page flags as identified by TTM_TT_FLAG_XX flags.
> > > >    * @caching: the desired caching state of the pages
> > > > + * @extra_pages: Extra pages needed for the driver.
> > > >    *
> > > >    * Create a struct ttm_tt to back data with system memory pages.
> > > >    * No pages are actually allocated.
> > > > @@ -147,7 +148,8 @@ int ttm_tt_create(struct ttm_buffer_object *bo,=
 bool zero_alloc);
> > > >    * NULL: Out of memory.
> > > >    */
> > > >   int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
> > > > -         uint32_t page_flags, enum ttm_caching caching);
> > > > +         uint32_t page_flags, enum ttm_caching caching,
> > > > +         unsigned long extra_pages);
> > > >   int ttm_sg_tt_init(struct ttm_tt *ttm_dma, struct ttm_buffer_obje=
ct *bo,
> > > >                      uint32_t page_flags, enum ttm_caching caching);
> > > > --=20
> > > > 2.20.1
> > > >=20
> >=20

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 480D96E0E3E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 15:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9178510EAE1;
	Thu, 13 Apr 2023 13:13:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83E310EAEC
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 13:13:16 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1842e8a8825so17739843fac.13
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 06:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681391596; x=1683983596;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gW9iXfLiVcSd0qqJBYrW2iur47VSTJAoOV5UCZWT5Sw=;
 b=Xoa9jdGcgMQVo3FrwO+GwwAFKJuRoC8g55N4JExGeBroXz3Ut7iYDg/RmH91ZaGJUJ
 BnrVBl7VCpEYXnZFWG7YNlYw57+wuUHcWX4jVMmMIWIxE8c3LdKYMN0753w3QVr21N2Q
 qjdmjXkNljl5zPkzIQnNWzjwoh51b1m5dn4vA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681391596; x=1683983596;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gW9iXfLiVcSd0qqJBYrW2iur47VSTJAoOV5UCZWT5Sw=;
 b=hZPyDnIWcCY6x7jRNZ5TF3tvHscNbOfXL5Zqden2xHUlK+USF7A64+4wK2eTYh6OjK
 hJUv0FN41IHhoKpWpZPt8b7ijhiqZ9cThzGxWok39MjKET3G4g+VFiwM5VpeD3p34CYa
 7r5ewLYwFGo1CwU8e3kSwZWTzP88jkiaRy99RTXZkUi1UR2k26Ho907mjNYuOhQKSjLz
 gy96W/vS+cKaKcgYvx8heCxSKDUaxgxpvOSsAvYE5t6UhCq6SgVvN/Y3J6kEnbRmxOhM
 Uw2040ve7+Nb2gACffhdZ/GOwyB7IrZSrKmFQUX8SdWvh0lx/oSIx0vnrwTDikGczzmA
 AqbA==
X-Gm-Message-State: AAQBX9fFlIB/p9Gz93lb88h/0AMFhacliXI2XajmRtz2VrhFtuESwBH9
 QSGV+BlZAHOpwVNhFIw2pJwqr6c4GdZQjOm30lSDzA==
X-Google-Smtp-Source: AKy350bb8H9RmY8f3PuN5wWD/tN5wchOjdSfJIu9ds9lcJXPqKtkOjoX8BaNiiedlhk7UB06iV6QEimLStHhfLzMpt4=
X-Received: by 2002:a05:6870:b290:b0:177:bf3e:5d4f with SMTP id
 c16-20020a056870b29000b00177bf3e5d4fmr1243459oao.8.1681391595742; Thu, 13 Apr
 2023 06:13:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230404200650.11043-1-thomas.hellstrom@linux.intel.com>
 <20230404200650.11043-3-thomas.hellstrom@linux.intel.com>
 <ZDUtqsNtXcU4W3O6@phenom.ffwll.local>
 <33b145f1-fce5-95f1-357d-dda128e3548d@amd.com>
 <ZDVkhtx1/uToLM5R@phenom.ffwll.local>
 <CAKMK7uEZdWjs9snGdNpzBthOWz0YSCZh-rNKOGywLWozzpFwbA@mail.gmail.com>
 <ae672182-f7a4-7107-1071-1561c49bc122@amd.com>
 <CAKMK7uFVWh16ng_tyuTu-0k4k7Wq5LjpwvJgYuidy-YVPEEQ=A@mail.gmail.com>
 <178a7ee4-1406-ff0f-4529-034f600785a9@amd.com>
In-Reply-To: <178a7ee4-1406-ff0f-4529-034f600785a9@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 13 Apr 2023 15:13:04 +0200
Message-ID: <CAKMK7uHgUuqWJuqmZKrxi2mNiqExhmMif-naYnzUSj-puW-x+A@mail.gmail.com>
Subject: Re: [PATCH RESEND v3 2/3] drm/ttm: Reduce the number of used
 allocation orders for TTM pages
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 13 Apr 2023 at 11:46, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> Am 13.04.23 um 10:48 schrieb Daniel Vetter:
> > On Wed, 12 Apr 2023 at 16:18, Christian K=C3=B6nig <christian.koenig@am=
d.com> wrote:
> >> Am 12.04.23 um 11:08 schrieb Daniel Vetter:
> >>> On Tue, 11 Apr 2023 at 15:45, Daniel Vetter <daniel@ffwll.ch> wrote:
> >>>> On Tue, Apr 11, 2023 at 02:11:18PM +0200, Christian K=C3=B6nig wrote=
:
> >>>>> Am 11.04.23 um 11:51 schrieb Daniel Vetter:
> >>>>>> On Tue, Apr 04, 2023 at 10:06:49PM +0200, Thomas Hellstr=C3=B6m wr=
ote:
> >>>>>>> When swapping out, we will split multi-order pages both in order =
to
> >>>>>>> move them to the swap-cache and to be able to return memory to th=
e
> >>>>>>> swap cache as soon as possible on a page-by-page basis.
> >>>>>>> Reduce the page max order to the system PMD size, as we can then =
be nicer
> >>>>>>> to the system and avoid splitting gigantic pages.
> >>>>>>>
> >>>>>>> Looking forward to when we might be able to swap out PMD size fol=
ios
> >>>>>>> without splitting, this will also be a benefit.
> >>>>>>>
> >>>>>>> v2:
> >>>>>>> - Include all orders up to the PMD size (Christian K=C3=B6nig)
> >>>>>>> v3:
> >>>>>>> - Avoid compilation errors for architectures with special PFN_SHI=
FTs
> >>>>>>>
> >>>>>>> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.inte=
l.com>
> >>>>>>> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>>>>> Apparently this fails on ppc build testing. Please supply build fi=
x asap
> >>>>>> (or I guess we need to revert). I'm kinda not clear why this only =
showed
> >>>>>> up when I merged the drm-misc-next pr into drm-next ...
> >>>>> I'm really wondering this as well. It looks like PMD_SHIFT isn't a =
constant
> >>>>> on this particular platform.
> >>>>>
> >>>>> But from what I can find in the upstream 6.2 kernel PMD_SHIFT alway=
s seems
> >>>>> to be a constant.
> >>>>>
> >>>>> So how exactly can that here break?
> >>>> There's some in-flight patches to rework MAX_ORDER and other things =
in
> >>>> linux-next, maybe it's recent? If you check out linux-next then you =
need
> >>>> to reapply the patch (since sfr reverted it).
> >>> So I looked and on ppc64 PMD_SHIFT is defined in terms of
> >>> PTE_INDEX_SIZE, which is defined (for book3s) in terms of the variabl=
e
> >>> __pte_index_size. This is in 6.3 already and seems pretty old.
> >> Ah! I missed that one, thanks.
> >>
> >>> So revert? Or fixup patch to make this work on ppc?
> >> I think for now just revert or change it so that we check if PMD_SHIFT
> >> is a constant.
> >>
> >> Thomas do you have any quick solution?
> > I guess Thomas is on vacations. Can you pls do the revert and push it
> > to drm-misc-next-fixes so this won't get lost?
>
> The offending patch hasn't showed up in drm-misc-next-fixes nor
> drm-misc-fixes yet. Looks like the branches are lacking behind.
>
> I can revert it on drm-misc-next, but I', not 100% sure that will then
> get picked up in time.

It's there now, Maarten forwarded drm-misc-next-fixes this morning.
That's why I pinged here again, trees are ready to land the revert :-)
-Daniel

>
> Christian.
>
> >
> > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >
> > preemptively for that. Normally I think we could wait a bit more but
> > it's really close to merge window PR and I don't like handing too many
> > open things to Dave when he's back :-)
> > -Daniel
> >
> >> Christian.
> >>
> >>>
> >>>>>>> ---
> >>>>>>>     drivers/gpu/drm/ttm/ttm_pool.c | 30 +++++++++++++++++++------=
-----
> >>>>>>>     1 file changed, 19 insertions(+), 11 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm=
/ttm_pool.c
> >>>>>>> index dfce896c4bae..18c342a919a2 100644
> >>>>>>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> >>>>>>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> >>>>>>> @@ -47,6 +47,11 @@
> >>>>>>>     #include "ttm_module.h"
> >>>>>>> +#define TTM_MAX_ORDER (PMD_SHIFT - PAGE_SHIFT)
> >>>>>>> +#define __TTM_DIM_ORDER (TTM_MAX_ORDER + 1)
> >>>>>>> +/* Some architectures have a weird PMD_SHIFT */
> >>>>>>> +#define TTM_DIM_ORDER (__TTM_DIM_ORDER <=3D MAX_ORDER ? __TTM_DI=
M_ORDER : MAX_ORDER)
> >>>>>>> +
> >>>>>>>     /**
> >>>>>>>      * struct ttm_pool_dma - Helper object for coherent DMA mappi=
ngs
> >>>>>>>      *
> >>>>>>> @@ -65,11 +70,11 @@ module_param(page_pool_size, ulong, 0644);
> >>>>>>>     static atomic_long_t allocated_pages;
> >>>>>>> -static struct ttm_pool_type global_write_combined[MAX_ORDER];
> >>>>>>> -static struct ttm_pool_type global_uncached[MAX_ORDER];
> >>>>>>> +static struct ttm_pool_type global_write_combined[TTM_DIM_ORDER]=
;
> >>>>>>> +static struct ttm_pool_type global_uncached[TTM_DIM_ORDER];
> >>>>>>> -static struct ttm_pool_type global_dma32_write_combined[MAX_ORDE=
R];
> >>>>>>> -static struct ttm_pool_type global_dma32_uncached[MAX_ORDER];
> >>>>>>> +static struct ttm_pool_type global_dma32_write_combined[TTM_DIM_=
ORDER];
> >>>>>>> +static struct ttm_pool_type global_dma32_uncached[TTM_DIM_ORDER]=
;
> >>>>>>>     static spinlock_t shrinker_lock;
> >>>>>>>     static struct list_head shrinker_list;
> >>>>>>> @@ -444,7 +449,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, str=
uct ttm_tt *tt,
> >>>>>>>             else
> >>>>>>>                     gfp_flags |=3D GFP_HIGHUSER;
> >>>>>>> - for (order =3D min_t(unsigned int, MAX_ORDER - 1, __fls(num_pag=
es));
> >>>>>>> + for (order =3D min_t(unsigned int, TTM_MAX_ORDER, __fls(num_pag=
es));
> >>>>>>>                  num_pages;
> >>>>>>>                  order =3D min_t(unsigned int, order, __fls(num_p=
ages))) {
> >>>>>>>                     struct ttm_pool_type *pt;
> >>>>>>> @@ -563,7 +568,7 @@ void ttm_pool_init(struct ttm_pool *pool, str=
uct device *dev,
> >>>>>>>             if (use_dma_alloc) {
> >>>>>>>                     for (i =3D 0; i < TTM_NUM_CACHING_TYPES; ++i)
> >>>>>>> -                 for (j =3D 0; j < MAX_ORDER; ++j)
> >>>>>>> +                 for (j =3D 0; j < TTM_DIM_ORDER; ++j)
> >>>>>>>                                     ttm_pool_type_init(&pool->cac=
hing[i].orders[j],
> >>>>>>>                                                        pool, i, j=
);
> >>>>>>>             }
> >>>>>>> @@ -583,7 +588,7 @@ void ttm_pool_fini(struct ttm_pool *pool)
> >>>>>>>             if (pool->use_dma_alloc) {
> >>>>>>>                     for (i =3D 0; i < TTM_NUM_CACHING_TYPES; ++i)
> >>>>>>> -                 for (j =3D 0; j < MAX_ORDER; ++j)
> >>>>>>> +                 for (j =3D 0; j < TTM_DIM_ORDER; ++j)
> >>>>>>>                                     ttm_pool_type_fini(&pool->cac=
hing[i].orders[j]);
> >>>>>>>             }
> >>>>>>> @@ -637,7 +642,7 @@ static void ttm_pool_debugfs_header(struct se=
q_file *m)
> >>>>>>>             unsigned int i;
> >>>>>>>             seq_puts(m, "\t ");
> >>>>>>> - for (i =3D 0; i < MAX_ORDER; ++i)
> >>>>>>> + for (i =3D 0; i < TTM_DIM_ORDER; ++i)
> >>>>>>>                     seq_printf(m, " ---%2u---", i);
> >>>>>>>             seq_puts(m, "\n");
> >>>>>>>     }
> >>>>>>> @@ -648,7 +653,7 @@ static void ttm_pool_debugfs_orders(struct tt=
m_pool_type *pt,
> >>>>>>>     {
> >>>>>>>             unsigned int i;
> >>>>>>> - for (i =3D 0; i < MAX_ORDER; ++i)
> >>>>>>> + for (i =3D 0; i < TTM_DIM_ORDER; ++i)
> >>>>>>>                     seq_printf(m, " %8u", ttm_pool_type_count(&pt=
[i]));
> >>>>>>>             seq_puts(m, "\n");
> >>>>>>>     }
> >>>>>>> @@ -751,13 +756,16 @@ int ttm_pool_mgr_init(unsigned long num_pag=
es)
> >>>>>>>     {
> >>>>>>>             unsigned int i;
> >>>>>>> + BUILD_BUG_ON(TTM_DIM_ORDER > MAX_ORDER);
> >>>>>>> + BUILD_BUG_ON(TTM_DIM_ORDER < 1);
> >>>>>>> +
> >>>>>>>             if (!page_pool_size)
> >>>>>>>                     page_pool_size =3D num_pages;
> >>>>>>>             spin_lock_init(&shrinker_lock);
> >>>>>>>             INIT_LIST_HEAD(&shrinker_list);
> >>>>>>> - for (i =3D 0; i < MAX_ORDER; ++i) {
> >>>>>>> + for (i =3D 0; i < TTM_DIM_ORDER; ++i) {
> >>>>>>>                     ttm_pool_type_init(&global_write_combined[i],=
 NULL,
> >>>>>>>                                        ttm_write_combined, i);
> >>>>>>>                     ttm_pool_type_init(&global_uncached[i], NULL,=
 ttm_uncached, i);
> >>>>>>> @@ -790,7 +798,7 @@ void ttm_pool_mgr_fini(void)
> >>>>>>>     {
> >>>>>>>             unsigned int i;
> >>>>>>> - for (i =3D 0; i < MAX_ORDER; ++i) {
> >>>>>>> + for (i =3D 0; i < TTM_DIM_ORDER; ++i) {
> >>>>>>>                     ttm_pool_type_fini(&global_write_combined[i])=
;
> >>>>>>>                     ttm_pool_type_fini(&global_uncached[i]);
> >>>>>>> --
> >>>>>>> 2.39.2
> >>>>>>>
> >>>> --
> >>>> Daniel Vetter
> >>>> Software Engineer, Intel Corporation
> >>>> http://blog.ffwll.ch
> >>>
> >
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

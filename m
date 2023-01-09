Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F7B662946
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 16:04:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBF4B10E0BA;
	Mon,  9 Jan 2023 15:04:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E316910E0BA;
 Mon,  9 Jan 2023 15:04:08 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-14ffd3c5b15so8896783fac.3; 
 Mon, 09 Jan 2023 07:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hb6l/3EQCXcQMc9Oj7FE1RlQn9zpzjkC52YbW7YGrj8=;
 b=Hied4hLJvh3RLMwiYkX33n7hp4wHWNoW4vQLKWYeAO4Y7S3IGiBkaoMzESEPLY+I3i
 td6flMNVJ969zSiEOrk2Sz8xgwbOR6eAKPCXf14829qYAM3LYo/iBwMeMyDArBfYxNgI
 eZ+H8GtpeDu74SBK2wSiIVnYNsNcO8df+q9D/tWB75GFf+gnDiULybo3gu+000tsPHCA
 rNp/iyRBSp+pn7TIewHlVrD9MYSKJvnDzNa2pl3PNNnPsbnBefSUdLuLYu+8hDXETYdc
 iwnXbEuOWY7Y3Rj2B5s3fhaKUrb+vIpFH/h3ak4alUNKnVQl1ZXfNS0jyzfZ7aCVrpDl
 n2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hb6l/3EQCXcQMc9Oj7FE1RlQn9zpzjkC52YbW7YGrj8=;
 b=DWOihfAiyAJJQns4FNHPFWsyBhIG8c3bSY6HH+lA8/eV1D2UJJgMZDa512Rse0IdHg
 rqIIm4cGTVP8ymSKL4lqAsSG7KINJy7qn9n8dKAywrLvSkFsVhtheJjbXtuJi05mxw6Q
 EFnLUGUgvdN0H9+6DRGb/gklxX78ChxWltGeJngbB5lknyWRAKM4RSMdkoTgDkrS3bbe
 1fZfE1ElJpm4OBVQFbzgt/hpqlh31gMlR6zpOG/yw0q6HPEYMtr2jZdZouD05skhMMfP
 xFf++dm34+dYA0ObYXfeN+1apTalAW+5KX+TkzXggjS2woK7lmtZEHCQ92uALobGqZOD
 NFgw==
X-Gm-Message-State: AFqh2krInqc4LANm4B95hIfBFzWK+heELFV6eJnGTyk1/rsCwm838mBf
 7Dfj9gDCO+iflDU5gjnBXh7BaD1LZ8QHAKBBKSw=
X-Google-Smtp-Source: AMrXdXuUBBLeoXIryLLbNKhZB9cwzDxnNAuRunoFD5OIMJKZHirancGnUd8FGm+5nhFGPx2NWLW1OyHHKkhCb5Zp/ss=
X-Received: by 2002:a05:6870:c59c:b0:150:d9aa:4011 with SMTP id
 ba28-20020a056870c59c00b00150d9aa4011mr1900031oab.96.1673276647911; Mon, 09
 Jan 2023 07:04:07 -0800 (PST)
MIME-Version: 1.0
References: <20230107151523.29864-1-Arunpravin.PaneerSelvam@amd.com>
 <8354c408-623a-1fc0-d5e0-201a0bce0309@gmail.com>
In-Reply-To: <8354c408-623a-1fc0-d5e0-201a0bce0309@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 9 Jan 2023 10:03:56 -0500
Message-ID: <CADnq5_OnFGBrkDaeGetCujUA2m1aZ1q+hG2vCAT5cX82U252cg@mail.gmail.com>
Subject: Re: [PATCH] drm: Alloc high address for drm buddy topdown flag
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 9, 2023 at 5:13 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 07.01.23 um 16:15 schrieb Arunpravin Paneer Selvam:
> > As we are observing low numbers in viewperf graphics benchmark, we
> > are strictly not allowing the top down flag enabled allocations
> > to steal the memory space from cpu visible region.
> >
> > The approach is, we are sorting each order list entries in
> > ascending order and compare the last entry of each order
> > list in the freelist and return the max block.
> >
> > This patch improves the viewperf 3D benchmark scores.
> >
> > Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.co=
m>
>
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>, but somebody w=
ith more insight of the drm buddy allocator should take a closer look at th=
is.

I'm not a drm_buddy expert either, but this patch fixes a lot of
issues on both dGPUs and APUs:
Acked-by: Alex Deucher <alexander.deucher@amd.com>

>
>
> > ---
> >   drivers/gpu/drm/drm_buddy.c | 81 ++++++++++++++++++++++++------------=
-
> >   1 file changed, 54 insertions(+), 27 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> > index 11bb59399471..50916b2f2fc5 100644
> > --- a/drivers/gpu/drm/drm_buddy.c
> > +++ b/drivers/gpu/drm/drm_buddy.c
> > @@ -38,6 +38,25 @@ static void drm_block_free(struct drm_buddy *mm,
> >       kmem_cache_free(slab_blocks, block);
> >   }
> >
> > +static void list_insert_sorted(struct drm_buddy *mm,
> > +                            struct drm_buddy_block *block)
> > +{
> > +     struct drm_buddy_block *node;
> > +     struct list_head *head;
> > +
> > +     head =3D &mm->free_list[drm_buddy_block_order(block)];
> > +     if (list_empty(head)) {
> > +             list_add(&block->link, head);
> > +             return;
> > +     }
> > +
> > +     list_for_each_entry(node, head, link)
> > +             if (drm_buddy_block_offset(block) < drm_buddy_block_offse=
t(node))
> > +                     break;
> > +
> > +     __list_add(&block->link, node->link.prev, &node->link);
> > +}
> > +
> >   static void mark_allocated(struct drm_buddy_block *block)
> >   {
> >       block->header &=3D ~DRM_BUDDY_HEADER_STATE;
> > @@ -52,8 +71,7 @@ static void mark_free(struct drm_buddy *mm,
> >       block->header &=3D ~DRM_BUDDY_HEADER_STATE;
> >       block->header |=3D DRM_BUDDY_FREE;
> >
> > -     list_add(&block->link,
> > -              &mm->free_list[drm_buddy_block_order(block)]);
> > +     list_insert_sorted(mm, block);
> >   }
> >
> >   static void mark_split(struct drm_buddy_block *block)
> > @@ -387,20 +405,26 @@ alloc_range_bias(struct drm_buddy *mm,
> >   }
> >
> >   static struct drm_buddy_block *
> > -get_maxblock(struct list_head *head)
> > +get_maxblock(struct drm_buddy *mm, unsigned int order)
> >   {
> >       struct drm_buddy_block *max_block =3D NULL, *node;
> > +     unsigned int i;
> >
> > -     max_block =3D list_first_entry_or_null(head,
> > -                                          struct drm_buddy_block,
> > -                                          link);
> > -     if (!max_block)
> > -             return NULL;
> > +     for (i =3D order; i <=3D mm->max_order; ++i) {
> > +             if (!list_empty(&mm->free_list[i])) {
> > +                     node =3D list_last_entry(&mm->free_list[i],
> > +                                            struct drm_buddy_block,
> > +                                            link);
> > +                     if (!max_block) {
> > +                             max_block =3D node;
> > +                             continue;
> > +                     }
> >
> > -     list_for_each_entry(node, head, link) {
> > -             if (drm_buddy_block_offset(node) >
> > -                 drm_buddy_block_offset(max_block))
> > -                     max_block =3D node;
> > +                     if (drm_buddy_block_offset(node) >
> > +                             drm_buddy_block_offset(max_block)) {
> > +                             max_block =3D node;
> > +                     }
> > +             }
> >       }
> >
> >       return max_block;
> > @@ -412,20 +436,23 @@ alloc_from_freelist(struct drm_buddy *mm,
> >                   unsigned long flags)
> >   {
> >       struct drm_buddy_block *block =3D NULL;
> > -     unsigned int i;
> > +     unsigned int tmp;
> >       int err;
> >
> > -     for (i =3D order; i <=3D mm->max_order; ++i) {
> > -             if (flags & DRM_BUDDY_TOPDOWN_ALLOCATION) {
> > -                     block =3D get_maxblock(&mm->free_list[i]);
> > -                     if (block)
> > -                             break;
> > -             } else {
> > -                     block =3D list_first_entry_or_null(&mm->free_list=
[i],
> > -                                                      struct drm_buddy=
_block,
> > -                                                      link);
> > -                     if (block)
> > -                             break;
> > +     if (flags & DRM_BUDDY_TOPDOWN_ALLOCATION) {
> > +             block =3D get_maxblock(mm, order);
> > +             if (block)
> > +                     /* Store the obtained block order */
> > +                     tmp =3D drm_buddy_block_order(block);
> > +     } else {
> > +             for (tmp =3D order; tmp <=3D mm->max_order; ++tmp) {
> > +                     if (!list_empty(&mm->free_list[tmp])) {
> > +                             block =3D list_last_entry(&mm->free_list[=
tmp],
> > +                                                     struct drm_buddy_=
block,
> > +                                                     link);
> > +                             if (block)
> > +                                     break;
> > +                     }
> >               }
> >       }
> >
> > @@ -434,18 +461,18 @@ alloc_from_freelist(struct drm_buddy *mm,
> >
> >       BUG_ON(!drm_buddy_block_is_free(block));
> >
> > -     while (i !=3D order) {
> > +     while (tmp !=3D order) {
> >               err =3D split_block(mm, block);
> >               if (unlikely(err))
> >                       goto err_undo;
> >
> >               block =3D block->right;
> > -             i--;
> > +             tmp--;
> >       }
> >       return block;
> >
> >   err_undo:
> > -     if (i !=3D order)
> > +     if (tmp !=3D order)
> >               __drm_buddy_free(mm, block);
> >       return ERR_PTR(err);
> >   }
>

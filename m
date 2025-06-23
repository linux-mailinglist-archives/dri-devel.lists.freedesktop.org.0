Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FC7AE4493
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 15:44:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FC4B10E3B8;
	Mon, 23 Jun 2025 13:43:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S0RTzfMZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1879C10E1FF;
 Mon, 23 Jun 2025 13:43:53 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-311ef4fb43dso3209334a91.3; 
 Mon, 23 Jun 2025 06:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750686233; x=1751291033; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sQ1iNfzmERtyZY1B9/MdNXTqqwS3BjEyE6ZYiTugAiU=;
 b=S0RTzfMZQECu5YdzFQZaKyd9Z8w1vq+Z3tEdZZHJTOolB01KwVDMBnFPzoNeXVoXGX
 wJ9QOpnc/xgWwaQ4VJ+3JsjXkWn9EzdugPyM7uiq5EhA+tYiHrOoJleS4N6pDHeI65sc
 dlzn81NEqQ6E4zuj6FNQG38k7MJ5jXwHstdxB+OtNIRTynkWTEWvIUVHD5Rbxmse/Vpn
 O1epSjRCaJRl7/vvi/zo7+wx0Sk6hCoJsK7RJiRxQz9dbA5msKGSi0OKOQ0mpY8ongb9
 qdi7QfQvTVnngYLCDwZ97san4jir9Yz890zyChXzYN9LtfQho9FTraCJoHpABlga1S9Z
 5MJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750686233; x=1751291033;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sQ1iNfzmERtyZY1B9/MdNXTqqwS3BjEyE6ZYiTugAiU=;
 b=AnPJ96ZFv8qo3MTG3xeO091P/Z8XCRl3JYr28Bzm45XbzR7XDeL6D5QilEr+fKou1y
 IHOLMxhlgv5IC8k01x0WUtzbAWtMjbSn+/50j5o9eYW8EYC1QifWe6dAQzN5bDprCQdf
 6XlXeWWDFjvP2PmkpurG/3fFK3EYWda5gap3obD0PxBWyrKvKU18mNvIJzs6ugBAg8Ol
 IQfpARgOQXBeM9xAWrJ8Uaa2GxAH83oY6HJvOF1Gug+/1APCxgnOa5f4mj3K7aiUS1nc
 3PaOmrKbnRSrIhS7ADsATAz4DXx7B2ilc2msPXbrKNISVp7s8leoMOhZallXHogKDjtE
 KHPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYhnayvFCJbOT4+416oFwzQe2g4B5wISffQJziB6TlyJppKhQNFpYY+CkGRMPzdGmOBkW9H1u3tHk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5D++8LWIbbc3IQobyg0M0CDkxoA+86DISiKyTpcK8mMhfciRV
 wUGtha5OJRHi5DsCAmJ1HY66UXBo95MSub7mfKKIMfZ6evtmme/qH/4yv7eod613WrXgF9rYecW
 J2aH8/9zJTG5GkY9bFmrPptnef2nkNUo=
X-Gm-Gg: ASbGncsuM9oT3BDduyrDpCgZFMK2WOuCvCPhmcoiS4Bqv8B5g/2vUETZTBcJ4+Zl3es
 A1FveNHGL/tUQf4CUAJ/qDr6QevkSyiFunfX95KOglf+8o+Q77SyCj05YlX0miGA9SRDljPZKAt
 tvDYfhLPbRWiLekLKzON43R452xuPULNTqgECJTm2dLiGuJg==
X-Google-Smtp-Source: AGHT+IGUtMD2QPa31U8d4RtYxOh7uw/awxfXMfOh9XYZfXpdR7pUPQPPFwLaFMvVHr7JmquH7KwQj7IE04EGplHAL04=
X-Received: by 2002:a17:90b:3505:b0:312:959:dc49 with SMTP id
 98e67ed59e1d1-3159d642a58mr19868257a91.13.1750686232832; Mon, 23 Jun 2025
 06:43:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250610070241.875636-1-dev@lankhorst.se>
 <20250610070241.875636-5-dev@lankhorst.se>
In-Reply-To: <20250610070241.875636-5-dev@lankhorst.se>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Mon, 23 Jun 2025 16:43:41 +0300
X-Gm-Features: AX0GCFtQzbwaupt7rA8IIr6hboWLlPYrWOy0pp4HDpbXrc-ZMiWrdqxuMrgc_3I
Message-ID: <CAJ=qYWQmth_BkxO-1OC_CfTDSnDhhor7O3P4SQStaGvYzkDbGA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] drm/xe: Convert xe_fb_pin to use a callback for
 insertion into GGTT
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Look ok to me. Imo that xe_fb_pin part bit unnecessarily maintain
complexity but I'll eventually come back to try to take out
unnecessary parts and try to get it fixed..

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On Tue, Jun 10, 2025 at 10:02=E2=80=AFAM Maarten Lankhorst <dev@lankhorst.s=
e> wrote:
>
> From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>
> The rotation details belong in xe_fb_pin.c, while the operations involvin=
g
> GGTT belong to xe_ggtt.c. As directly locking xe_ggtt etc results in
> exposing all of xe_ggtt details anyway, create a special function that
> allocates a ggtt_node, and allow display to populate it using a callback
> as a compromise.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 111 ++++++++++++-------------
>  drivers/gpu/drm/xe/xe_ggtt.c           |  92 ++++++++++++++------
>  drivers/gpu/drm/xe/xe_ggtt.h           |   9 +-
>  drivers/gpu/drm/xe/xe_ggtt_types.h     |   8 +-
>  4 files changed, 132 insertions(+), 88 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/=
display/xe_fb_pin.c
> index 6b362695d6b61..99f2863daebb5 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -167,12 +167,13 @@ static int __xe_pin_fb_vma_dpt(const struct intel_f=
ramebuffer *fb,
>  }
>
>  static void
> -write_ggtt_rotated(struct xe_bo *bo, struct xe_ggtt *ggtt, u32 *ggtt_ofs=
, u32 bo_ofs,
> +write_ggtt_rotated(struct xe_ggtt *ggtt, u32 *ggtt_ofs,
> +                  u64 pte_flags,
> +                  xe_ggtt_set_pte_fn write_pte,
> +                  struct xe_bo *bo, u32 bo_ofs,
>                    u32 width, u32 height, u32 src_stride, u32 dst_stride)
>  {
> -       struct xe_device *xe =3D xe_bo_device(bo);
>         u32 column, row;
> -       u64 pte =3D ggtt->pt_ops->pte_encode_flags(bo, xe->pat.idx[XE_CAC=
HE_NONE]);
>
>         for (column =3D 0; column < width; column++) {
>                 u32 src_idx =3D src_stride * (height - 1) + column + bo_o=
fs;
> @@ -180,7 +181,7 @@ write_ggtt_rotated(struct xe_bo *bo, struct xe_ggtt *=
ggtt, u32 *ggtt_ofs, u32 bo
>                 for (row =3D 0; row < height; row++) {
>                         u64 addr =3D xe_bo_addr(bo, src_idx * XE_PAGE_SIZ=
E, XE_PAGE_SIZE);
>
> -                       ggtt->pt_ops->ggtt_set_pte(ggtt, *ggtt_ofs, pte |=
 addr);
> +                       write_pte(ggtt, *ggtt_ofs, pte_flags | addr);
>                         *ggtt_ofs +=3D XE_PAGE_SIZE;
>                         src_idx -=3D src_stride;
>                 }
> @@ -190,6 +191,28 @@ write_ggtt_rotated(struct xe_bo *bo, struct xe_ggtt =
*ggtt, u32 *ggtt_ofs, u32 bo
>         }
>  }
>
> +struct fb_rotate_args {
> +       const struct i915_gtt_view *view;
> +       struct xe_bo *bo;
> +};
> +
> +static void write_ggtt_rotated_node(struct xe_ggtt *ggtt, struct xe_ggtt=
_node *node,
> +                                   u64 pte_flags, xe_ggtt_set_pte_fn wri=
te_pte, void *data)
> +{
> +       struct fb_rotate_args *args =3D data;
> +       struct xe_bo *bo =3D args->bo;
> +       const struct intel_rotation_info *rot_info =3D &args->view->rotat=
ed;
> +       u32 ggtt_ofs =3D node->base.start;
> +
> +       for (u32 i =3D 0; i < ARRAY_SIZE(rot_info->plane); i++)
> +               write_ggtt_rotated(ggtt, &ggtt_ofs, pte_flags, write_pte,
> +                                  bo, rot_info->plane[i].offset,
> +                                  rot_info->plane[i].width,
> +                                  rot_info->plane[i].height,
> +                                  rot_info->plane[i].src_stride,
> +                                  rot_info->plane[i].dst_stride);
> +}
> +
>  static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
>                                 const struct i915_gtt_view *view,
>                                 struct i915_vma *vma,
> @@ -200,70 +223,40 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_=
framebuffer *fb,
>         struct xe_device *xe =3D to_xe_device(fb->base.dev);
>         struct xe_tile *tile0 =3D xe_device_get_root_tile(xe);
>         struct xe_ggtt *ggtt =3D tile0->mem.ggtt;
> +       u64 pte, size;
>         u32 align;
> -       int ret;
> -
> -       /* TODO: Consider sharing framebuffer mapping?
> -        * embed i915_vma inside intel_framebuffer
> -        */
> -       xe_pm_runtime_get_noresume(xe);
> -       ret =3D mutex_lock_interruptible(&ggtt->lock);
> -       if (ret)
> -               goto out;
> +       int ret =3D 0;
>
>         align =3D XE_PAGE_SIZE;
> -       if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
> -               align =3D max_t(u32, align, SZ_64K);
> +       if (xe_bo_is_vram(bo) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED=
64K)
> +               align =3D max(align, SZ_64K);
>
> +       /* Fast case, preallocated GGTT view? */
>         if (bo->ggtt_node[tile0->id] && view->type =3D=3D I915_GTT_VIEW_N=
ORMAL) {
>                 vma->node =3D bo->ggtt_node[tile0->id];
> -       } else if (view->type =3D=3D I915_GTT_VIEW_NORMAL) {
> -               vma->node =3D xe_ggtt_node_init(ggtt);
> -               if (IS_ERR(vma->node)) {
> -                       ret =3D PTR_ERR(vma->node);
> -                       goto out_unlock;
> -               }
> -
> -               ret =3D xe_ggtt_node_insert_locked(vma->node, bo->size, a=
lign, 0);
> -               if (ret) {
> -                       xe_ggtt_node_fini(vma->node);
> -                       goto out_unlock;
> -               }
> -
> -               xe_ggtt_map_bo(ggtt, vma->node, bo, xe->pat.idx[XE_CACHE_=
NONE]);
> -       } else {
> -               u32 i, ggtt_ofs;
> -               const struct intel_rotation_info *rot_info =3D &view->rot=
ated;
> -
> -               /* display seems to use tiles instead of bytes here, so c=
onvert it back.. */
> -               u32 size =3D intel_rotation_info_size(rot_info) * XE_PAGE=
_SIZE;
> -
> -               vma->node =3D xe_ggtt_node_init(ggtt);
> -               if (IS_ERR(vma->node)) {
> -                       ret =3D PTR_ERR(vma->node);
> -                       goto out_unlock;
> -               }
> -
> -               ret =3D xe_ggtt_node_insert_locked(vma->node, size, align=
, 0);
> -               if (ret) {
> -                       xe_ggtt_node_fini(vma->node);
> -                       goto out_unlock;
> -               }
> +               return 0;
> +       }
>
> -               ggtt_ofs =3D vma->node->base.start;
> +       /* TODO: Consider sharing framebuffer mapping?
> +        * embed i915_vma inside intel_framebuffer
> +        */
> +       xe_pm_runtime_get_noresume(xe);
>
> -               for (i =3D 0; i < ARRAY_SIZE(rot_info->plane); i++)
> -                       write_ggtt_rotated(bo, ggtt, &ggtt_ofs,
> -                                          rot_info->plane[i].offset,
> -                                          rot_info->plane[i].width,
> -                                          rot_info->plane[i].height,
> -                                          rot_info->plane[i].src_stride,
> -                                          rot_info->plane[i].dst_stride)=
;
> -       }
> +       if (view->type =3D=3D I915_GTT_VIEW_NORMAL)
> +               size =3D bo->size;
> +       else
> +               /* display uses tiles instead of bytes here, so convert i=
t back.. */
> +               size =3D intel_rotation_info_size(&view->rotated) * XE_PA=
GE_SIZE;
> +
> +       pte =3D xe_ggtt_encode_pte_flags(ggtt, bo, xe->pat.idx[XE_CACHE_N=
ONE]);
> +       vma->node =3D xe_ggtt_node_insert_transform(ggtt, bo, pte,
> +                                                 ALIGN(size, align), ali=
gn,
> +                                                 view->type =3D=3D I915_=
GTT_VIEW_NORMAL ?
> +                                                 NULL : write_ggtt_rotat=
ed_node,
> +                                                 &(struct fb_rotate_args=
){view, bo});
> +       if (IS_ERR(vma->node))
> +               ret =3D PTR_ERR(vma->node);
>
> -out_unlock:
> -       mutex_unlock(&ggtt->lock);
> -out:
>         xe_pm_runtime_put(xe);
>         return ret;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 4c58626f002f9..c9ee2a4ff8ab9 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -479,19 +479,7 @@ void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, s64 s=
hift)
>         mutex_unlock(&ggtt->lock);
>  }
>
> -/**
> - * xe_ggtt_node_insert_locked - Locked version to insert a &xe_ggtt_node=
 into the GGTT
> - * @node: the &xe_ggtt_node to be inserted
> - * @size: size of the node
> - * @align: alignment constrain of the node
> - * @mm_flags: flags to control the node behavior
> - *
> - * It cannot be called without first having called xe_ggtt_init() once.
> - * To be used in cases where ggtt->lock is already taken.
> - *
> - * Return: 0 on success or a negative error code on failure.
> - */
> -int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
> +static int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
>                                u32 size, u32 align, u32 mm_flags)
>  {
>         return drm_mm_insert_node_generic(&node->ggtt->mm, &node->base, s=
ize, align, 0,
> @@ -528,9 +516,13 @@ int xe_ggtt_node_insert(struct xe_ggtt_node *node, u=
32 size, u32 align)
>   * @ggtt: the &xe_ggtt where the new node will later be inserted/reserve=
d.
>   *
>   * This function will allocate the struct %xe_ggtt_node and return its p=
ointer.
> - * This struct will then be freed after the node removal upon xe_ggtt_no=
de_remove().
> - * Having %xe_ggtt_node struct allocated doesn't mean that the node is a=
lready allocated
> - * in GGTT. Only xe_ggtt_node_insert() will ensure the node is inserted =
or reserved in GGTT.
> + * This struct will then be freed after the node removal upon
> + * xe_ggtt_node_remove().
> + *
> + * Having %xe_ggtt_node struct allocated doesn't mean that the node is a=
lready
> + * allocated in GGTT. Only xe_ggtt_node_insert() or allocation through
> + * xe_ggtt_node_insert_transform() will ensure the node is inserted or r=
eserved
> + * in GGTT.
>   *
>   * Return: A pointer to %xe_ggtt_node struct on success. An ERR_PTR othe=
rwise.
>   **/
> @@ -579,13 +571,12 @@ bool xe_ggtt_node_allocated(const struct xe_ggtt_no=
de *node)
>   * @ggtt: the &xe_ggtt where node will be mapped
>   * @node: the &xe_ggtt_node where this BO is mapped
>   * @bo: the &xe_bo to be mapped
> - * @pat_index: Which pat_index to use.
> + * @pte: The pte flags to append.
>   */
> -void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
> -                   struct xe_bo *bo, u16 pat_index)
> +static void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_ggtt_node *no=
de,
> +                          struct xe_bo *bo, u64 pte)
>  {
> -
> -       u64 start, pte, end;
> +       u64 start, end;
>         struct xe_res_cursor cur;
>
>         if (XE_WARN_ON(!node))
> @@ -594,7 +585,6 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_g=
gtt_node *node,
>         start =3D node->base.start;
>         end =3D start + bo->size;
>
> -       pte =3D ggtt->pt_ops->pte_encode_flags(bo, pat_index);
>         if (!xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo)) {
>                 xe_assert(xe_bo_device(bo), bo->ttm.ttm);
>
> @@ -624,12 +614,65 @@ void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, =
struct xe_bo *bo)
>  {
>         u16 cache_mode =3D bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NON=
E : XE_CACHE_WB;
>         u16 pat_index =3D tile_to_xe(ggtt->tile)->pat.idx[cache_mode];
> +       u64 pte;
>
>         mutex_lock(&ggtt->lock);
> -       xe_ggtt_map_bo(ggtt, bo->ggtt_node[ggtt->tile->id], bo, pat_index=
);
> +       pte =3D ggtt->pt_ops->pte_encode_flags(bo, pat_index);
> +       xe_ggtt_map_bo(ggtt, bo->ggtt_node[ggtt->tile->id], bo, pte);
>         mutex_unlock(&ggtt->lock);
>  }
>
> +/**
> + * xe_ggtt_node_insert_transform - Insert a newly allocated &xe_ggtt_nod=
e into the GGTT
> + * @ggtt: the &xe_ggtt where the node will inserted/reserved.
> + * @bo: The bo to be transformed
> + * @pte_flags: The extra GGTT flags to add to mapping.
> + * @size: size of the node
> + * @align: required alignment for node
> + * @transform: transformation function that will populate the GGTT node,=
 or NULL for linear mapping.
> + * @arg: Extra argument to pass to the transformation function.
> + *
> + * This function allows inserting a GGTT node with a custom transformati=
on function.
> + * This is useful for display to allow inserting rotated framebuffers to=
 GGTT.
> + *
> + * Return: A pointer to %xe_ggtt_node struct on success. An ERR_PTR othe=
rwise.
> + */
> +struct xe_ggtt_node *xe_ggtt_node_insert_transform(struct xe_ggtt *ggtt,
> +                                                  struct xe_bo *bo, u64 =
pte_flags,
> +                                                  u64 size, u32 align,
> +                                                  xe_ggtt_transform_cb t=
ransform, void *arg)
> +{
> +       struct xe_ggtt_node *node;
> +       int ret;
> +
> +       node =3D xe_ggtt_node_init(ggtt);
> +       if (IS_ERR(node))
> +               return ERR_CAST(node);
> +
> +       if (mutex_lock_interruptible(&ggtt->lock) < 0) {
> +               ret =3D -ERESTARTSYS;
> +               goto err;
> +       }
> +
> +       ret =3D xe_ggtt_node_insert_locked(node, size, align, 0);
> +       if (ret)
> +               goto err_unlock;
> +
> +       if (transform)
> +               transform(ggtt, node, pte_flags, ggtt->pt_ops->ggtt_set_p=
te, arg);
> +       else
> +               xe_ggtt_map_bo(ggtt, node, bo, pte_flags);
> +
> +       mutex_unlock(&ggtt->lock);
> +       return node;
> +
> +err_unlock:
> +       mutex_unlock(&ggtt->lock);
> +err:
> +       xe_ggtt_node_fini(node);
> +       return ERR_PTR(ret);
> +}
> +
>  static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo=
,
>                                   u64 start, u64 end)
>  {
> @@ -668,8 +711,9 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggt=
t, struct xe_bo *bo,
>         } else {
>                 u16 cache_mode =3D bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_C=
ACHE_NONE : XE_CACHE_WB;
>                 u16 pat_index =3D tile_to_xe(ggtt->tile)->pat.idx[cache_m=
ode];
> +               u64 pte =3D ggtt->pt_ops->pte_encode_flags(bo, pat_index)=
;
>
> -               xe_ggtt_map_bo(ggtt, bo->ggtt_node[tile_id], bo, pat_inde=
x);
> +               xe_ggtt_map_bo(ggtt, bo->ggtt_node[tile_id], bo, pte);
>         }
>         mutex_unlock(&ggtt->lock);
>
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index c00d6c8f687ac..e25b40845456d 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -21,12 +21,13 @@ void xe_ggtt_node_fini(struct xe_ggtt_node *node);
>  void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, s64 shift);
>
>  int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align);
> -int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
> -                              u32 size, u32 align, u32 mm_flags);
> +struct xe_ggtt_node *
> +xe_ggtt_node_insert_transform(struct xe_ggtt *ggtt,
> +                             struct xe_bo *bo, u64 pte,
> +                             u64 size, u32 align,
> +                             xe_ggtt_transform_cb transform, void *arg);
>  void xe_ggtt_node_remove(struct xe_ggtt_node *node, bool invalidate);
>  bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node);
> -void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
> -                   struct xe_bo *bo, u16 pat_index);
>  void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo);
>  int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
>  int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
> diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_g=
gtt_types.h
> index a27919302d6b2..f4aa5671cb3e3 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
> @@ -71,6 +71,11 @@ struct xe_ggtt_node {
>         bool invalidate_on_remove;
>  };
>
> +typedef void (*xe_ggtt_set_pte_fn)(struct xe_ggtt *ggtt, u64 addr, u64 p=
te);
> +typedef void (*xe_ggtt_transform_cb)(struct xe_ggtt *ggtt,
> +                                    struct xe_ggtt_node *node,
> +                                    u64 pte_flags,
> +                                    xe_ggtt_set_pte_fn set_pte, void *ar=
g);
>  /**
>   * struct xe_ggtt_pt_ops - GGTT Page table operations
>   * Which can vary from platform to platform.
> @@ -78,8 +83,9 @@ struct xe_ggtt_node {
>  struct xe_ggtt_pt_ops {
>         /** @pte_encode_flags: Encode PTE flags for a given BO */
>         u64 (*pte_encode_flags)(struct xe_bo *bo, u16 pat_index);
> +
>         /** @ggtt_set_pte: Directly write into GGTT's PTE */
> -       void (*ggtt_set_pte)(struct xe_ggtt *ggtt, u64 addr, u64 pte);
> +       xe_ggtt_set_pte_fn ggtt_set_pte;
>  };
>
>  #endif
> --
> 2.45.2
>

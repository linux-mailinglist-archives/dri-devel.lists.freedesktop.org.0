Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2D01762AE
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 19:29:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B48E6E442;
	Mon,  2 Mar 2020 18:29:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 283366E46B
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 18:29:26 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id a19so595310vsp.6
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 10:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=olrR+JSn2E4EQgdpphIWt9dU/4myCV0vVUEAdGgS0T4=;
 b=T6WwE/sFz9LPxrVh4ZW7YojE01WCMd2k8z5ascVmoE7gMph1cTnNSLHJBXEJv+xwRl
 V81E0nWfgeeoJYMstuaKJ2SqpDEuQBrsL+Vb+uh9n34Zyp4Khav9f/FAV0FA2Joek2hQ
 bzyfS/TBQ+VJFZDOQcjDnt4/ChIWRn8gsudyn5h6WaLPywQqZGFJ4yUEhMhb4nT/guqI
 /qfdaMVcmh/9L4WG7R96jJzClc9r3S8vCwxaiOg6wq1KT2v/jR1nHht8z5V/dp4y5K8X
 bgKmKv2EEEySzGhfz7jhlDzUzUWxSrT/GolL8v9k5aG54dNew/NuI0Dqg7yJe1lbKGbK
 Q9RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=olrR+JSn2E4EQgdpphIWt9dU/4myCV0vVUEAdGgS0T4=;
 b=doeyGH7vrCKPnQJkTDs2m50jjMrZLjHbhHx++S1+UCrBlRJ6YyFi1rSDrWrBEzW7z3
 bVB1qR1c5WA2ugjLGQok310441PqyuCEVVF5XcwNzVA8YmIJQK2r02o3fMnSvOsMwGWd
 bmyaYa2AZ8a0RSY3r+34pNTHpJAdCCTIs6clu3FBBDTJ3invpdxJiHLwLPeY9+EOATIJ
 5AHJIB/NTDinnaAEdxtlBncLboW+DksRBM639pONRYru8zz/99dzDPcP4XaDRt4v9OgX
 ZLCCYfH4ld7l/pYglnhcy09TxNxGMPDHNnhVL1Fn0wTXIz73myxuHeUa5TSsU2p0yaQ2
 gI5Q==
X-Gm-Message-State: ANhLgQ1OZcTa63FvVEctw6H1sOI21liPQZHgXORWTTp3soRAgfNbr7h+
 p3wYOMBR2oalEoGaqCFKcxxfynAAkOCIDsWUb4zoyNNilkY=
X-Google-Smtp-Source: ADFU+vsNW8QVQjqtATY+EYKwnTeM8LPL5IAAX45mPTpGV4/cuaL0Waywq8nJ5sARyejjF+FCIVaUZsimDO7aIuVTtTc=
X-Received: by 2002:a05:6102:2365:: with SMTP id
 o5mr147024vsa.85.1583173765166; 
 Mon, 02 Mar 2020 10:29:25 -0800 (PST)
MIME-Version: 1.0
References: <1582710377-15489-1-git-send-email-kevin3.tang@gmail.com>
 <1582710377-15489-5-git-send-email-kevin3.tang@gmail.com>
In-Reply-To: <1582710377-15489-5-git-send-email-kevin3.tang@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 2 Mar 2020 18:28:53 +0000
Message-ID: <CACvgo53dME1ioYebimSzdOMvjAudtmzpz_-5Q7rNqQnZoBpaqA@mail.gmail.com>
Subject: Re: [PATCH RFC v4 4/6] drm/sprd: add Unisoc's drm display controller
 driver
To: Kevin Tang <kevin3.tang@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Baolin Wang <baolin.wang@linaro.org>,
 Dave Airlie <airlied@linux.ie>, Chunyan Zhang <zhang.lyra@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Orson Zhai <orsonzhai@gmail.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kevin,

There's a few small suggestions, although overall the driver looks a lot better.

On Thu, 27 Feb 2020 at 08:14, Kevin Tang <kevin3.tang@gmail.com> wrote:

> --- /dev/null
> +++ b/drivers/gpu/drm/sprd/dpu/Makefile
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +ifdef CONFIG_ARM64
> +KBUILD_CFLAGS += -mstrict-align


There are many other drivers that do not use readl/writel for register access,
yet none has this workaround... Even those that they are exclusively ARM64.

Have you tried that it's not a buggy version of GCC? At the very least, I'd
encourage you to add a brief comment about the problem + setup.

... In general I think one should follow the suggestions from Rob Herring.


> +static void dpu_dump(struct dpu_context *ctx)
> +{
> +       u32 *reg = (u32 *)ctx->base;
> +       int i;
> +
> +       pr_info("      0          4          8          C\n");
> +       for (i = 0; i < 256; i += 4) {
> +               pr_info("%04x: 0x%08x 0x%08x 0x%08x 0x%08x\n",
> +                       i * 4, reg[i], reg[i + 1], reg[i + 2], reg[i + 3]);

Using some of the helpers from drm_print.h would be better than pr_*.
This applies for the rest of the patch.


> +static void dpu_clean_all(struct dpu_context *ctx)
> +{
> +       int i;
> +       struct dpu_reg *reg = (struct dpu_reg *)ctx->base;
> +
> +       for (i = 0; i < 8; i++)

This "< 8" seem pretty magical. How about "< ARRAY_SIZE(reg->layers)"
Same logic applies through the rest of the patch.


> +static int dpu_wait_stop_done(struct dpu_context *ctx)
> +{
> +       int rc;
> +
> +       if (ctx->stopped)
> +               return 0;
> +
The stopped handling does look suspicious. Admittedly I did not look too closely
at the dpu_flip code, which seems to require it.

Let's add a small comment in the struct dpu_context::stopped declaration, why it
is needed, if it truely is.

> +       rc = wait_event_interruptible_timeout(ctx->wait_queue, ctx->evt_stop,
> +                                              msecs_to_jiffies(500));
> +       ctx->evt_stop = false;
> +
> +       ctx->stopped = true;
> +
> +       if (!rc) {
> +               pr_err("dpu wait for stop done time out!\n");
> +               return -ETIMEDOUT;
> +       }
> +
> +       return 0;
> +}
> +

> +static void dpu_stop(struct dpu_context *ctx)
> +{
> +       struct dpu_reg *reg = (struct dpu_reg *)ctx->base;
> +
> +       if (ctx->stopped)
> +               return;
> +
> +       if (ctx->if_type == SPRD_DISPC_IF_DPI)
> +               reg->dpu_ctrl |= BIT(1);
> +
> +       dpu_wait_stop_done(ctx);
> +
> +       pr_info("dpu stop\n");

This and the dpu_run pr_info() messages can be removed.


> +}
> +
> +static void dpu_run(struct dpu_context *ctx)
> +{
> +       struct dpu_reg *reg = (struct dpu_reg *)ctx->base;
> +
> +       if (!ctx->stopped)
> +               return;
> +
> +       reg->dpu_ctrl |= BIT(0);
> +
> +       ctx->stopped = false;
> +
> +       pr_info("dpu run\n");
> +}
> +
> +static int dpu_init(struct dpu_context *ctx)
> +{
> +       struct dpu_reg *reg = (struct dpu_reg *)ctx->base;
> +       u32 size;
> +
> +       reg->bg_color = 0;
> +
> +       size = (ctx->vm.vactive << 16) | ctx->vm.hactive;
> +       reg->panel_size = size;
> +       reg->blend_size = size;
> +
> +       reg->dpu_cfg0 = BIT(4) | BIT(5);
> +
> +       reg->dpu_cfg1 = 0x004466da;
> +       reg->dpu_cfg2 = 0;
> +
> +       if (ctx->stopped)
> +               dpu_clean_all(ctx);
> +
> +       reg->mmu_en = 0;
> +       reg->mmu_min_ppn1 = 0;
> +       reg->mmu_ppn_range1 = 0xffff;
> +       reg->mmu_min_ppn2 = 0;
> +       reg->mmu_ppn_range2 = 0xffff;
> +       reg->mmu_vpn_range = 0x1ffff;
> +
> +       reg->dpu_int_clr = 0xffff;
> +
> +       init_waitqueue_head(&ctx->wait_queue);
> +
> +       return 0;

Function always returns 0. Let's make it static void dpu_init()



> +static u32 to_dpu_rotation(u32 angle)
> +{
> +       u32 rot = DPU_LAYER_ROTATION_0;
> +
> +       switch (angle) {
> +       case 0:
> +       case DRM_MODE_ROTATE_0:
> +               rot = DPU_LAYER_ROTATION_0;
> +               break;
> +       case DRM_MODE_ROTATE_90:
> +               rot = DPU_LAYER_ROTATION_90;
> +               break;
> +       case DRM_MODE_ROTATE_180:
> +               rot = DPU_LAYER_ROTATION_180;
> +               break;
> +       case DRM_MODE_ROTATE_270:
> +               rot = DPU_LAYER_ROTATION_270;
> +               break;
> +       case DRM_MODE_REFLECT_Y:
> +               rot = DPU_LAYER_ROTATION_180_M;
> +               break;
> +       case (DRM_MODE_REFLECT_Y | DRM_MODE_ROTATE_90):
> +               rot = DPU_LAYER_ROTATION_90_M;
> +               break;
> +       case DRM_MODE_REFLECT_X:
> +               rot = DPU_LAYER_ROTATION_0_M;
> +               break;
> +       case (DRM_MODE_REFLECT_X | DRM_MODE_ROTATE_90):
> +               rot = DPU_LAYER_ROTATION_270_M;
> +               break;
> +       default:
> +               pr_err("rotation convert unsupport angle (drm)= 0x%x\n", angle);
> +               break;

Have you seen a case where the 0 or default case are reached? AFAICT they will
never trigger. So one might as well use:
    switch (angle) {
    case DRM_MODE_FOO:
        return DPU_LAYER_ROTATION_FOO;
    ...
    case DRM_MODE_BAR:
        return DPU_LAYER_ROTATION_BAR;
    }


> +       }
> +
> +       return rot;
> +}
> +
> +static u32 dpu_img_ctrl(u32 format, u32 blending, u32 rotation)
> +{
> +       int reg_val = 0;
> +
> +       /* layer enable */
> +       reg_val |= BIT(0);
> +
> +       switch (format) {
> +       case DRM_FORMAT_BGRA8888:
> +               /* BGRA8888 -> ARGB8888 */
> +               reg_val |= SPRD_IMG_DATA_ENDIAN_B3B2B1B0 << 8;
> +               reg_val |= (DPU_LAYER_FORMAT_ARGB8888 << 4);
> +               break;
> +       case DRM_FORMAT_RGBX8888:
> +       case DRM_FORMAT_RGBA8888:
> +               /* RGBA8888 -> ABGR8888 */
> +               reg_val |= SPRD_IMG_DATA_ENDIAN_B3B2B1B0 << 8;
> +               /* FALLTHRU */
> +       case DRM_FORMAT_ABGR8888:
> +               /* rb switch */
> +               reg_val |= BIT(10);
> +               /* FALLTHRU */
> +       case DRM_FORMAT_ARGB8888:
> +               reg_val |= (DPU_LAYER_FORMAT_ARGB8888 << 4);
> +               break;
> +       case DRM_FORMAT_XBGR8888:
> +               /* rb switch */
> +               reg_val |= BIT(10);
> +               /* FALLTHRU */
> +       case DRM_FORMAT_XRGB8888:
> +               reg_val |= (DPU_LAYER_FORMAT_ARGB8888 << 4);
> +               break;
> +       case DRM_FORMAT_BGR565:
> +               /* rb switch */
> +               reg_val |= BIT(10);
> +               /* FALLTHRU */
> +       case DRM_FORMAT_RGB565:
> +               reg_val |= (DPU_LAYER_FORMAT_RGB565 << 4);
> +               break;
> +       case DRM_FORMAT_NV12:
> +               /* 2-Lane: Yuv420 */
> +               reg_val |= DPU_LAYER_FORMAT_YUV420_2PLANE << 4;
> +               /* Y endian */
> +               reg_val |= SPRD_IMG_DATA_ENDIAN_B0B1B2B3 << 8;
> +               /* UV endian */
> +               reg_val |= SPRD_IMG_DATA_ENDIAN_B0B1B2B3 << 10;
> +               break;
> +       case DRM_FORMAT_NV21:
> +               /* 2-Lane: Yuv420 */
> +               reg_val |= DPU_LAYER_FORMAT_YUV420_2PLANE << 4;
> +               /* Y endian */
> +               reg_val |= SPRD_IMG_DATA_ENDIAN_B0B1B2B3 << 8;
> +               /* UV endian */
> +               reg_val |= SPRD_IMG_DATA_ENDIAN_B3B2B1B0 << 10;
> +               break;
> +       case DRM_FORMAT_NV16:
> +               /* 2-Lane: Yuv422 */
> +               reg_val |= DPU_LAYER_FORMAT_YUV422_2PLANE << 4;
> +               /* Y endian */
> +               reg_val |= SPRD_IMG_DATA_ENDIAN_B3B2B1B0 << 8;
> +               /* UV endian */
> +               reg_val |= SPRD_IMG_DATA_ENDIAN_B3B2B1B0 << 10;
> +               break;
> +       case DRM_FORMAT_NV61:
> +               /* 2-Lane: Yuv422 */
> +               reg_val |= DPU_LAYER_FORMAT_YUV422_2PLANE << 4;
> +               /* Y endian */
> +               reg_val |= SPRD_IMG_DATA_ENDIAN_B0B1B2B3 << 8;
> +               /* UV endian */
> +               reg_val |= SPRD_IMG_DATA_ENDIAN_B0B1B2B3 << 10;
> +               break;
> +       case DRM_FORMAT_YUV420:
> +               reg_val |= DPU_LAYER_FORMAT_YUV420_3PLANE << 4;
> +               /* Y endian */
> +               reg_val |= SPRD_IMG_DATA_ENDIAN_B0B1B2B3 << 8;
> +               /* UV endian */
> +               reg_val |= SPRD_IMG_DATA_ENDIAN_B0B1B2B3 << 10;
> +               break;
> +       case DRM_FORMAT_YVU420:
> +               reg_val |= DPU_LAYER_FORMAT_YUV420_3PLANE << 4;
> +               /* Y endian */
> +               reg_val |= SPRD_IMG_DATA_ENDIAN_B0B1B2B3 << 8;
> +               /* UV endian */
> +               reg_val |= SPRD_IMG_DATA_ENDIAN_B3B2B1B0 << 10;
> +               break;
> +       default:
> +               pr_err("error: invalid format %c%c%c%c\n", format,
> +                                               format >> 8,
> +                                               format >> 16,
> +                                               format >> 24);
> +               break;
The default case here should be unreachable. Either it is or the upper layer (or
earlier code) should ensure that.

> +       }
> +
> +       switch (blending) {
> +       case DRM_MODE_BLEND_PIXEL_NONE:
> +               /* don't do blending, maybe RGBX */
> +               /* alpha mode select - layer alpha */
> +               reg_val |= BIT(2);
> +               break;
> +       case DRM_MODE_BLEND_COVERAGE:
> +               /* alpha mode select - combo alpha */
> +               reg_val |= BIT(3);
> +               /*Normal mode*/
> +               reg_val &= (~BIT(16));
> +               break;
> +       case DRM_MODE_BLEND_PREMULTI:
> +               /* alpha mode select - combo alpha */
> +               reg_val |= BIT(3);
> +               /*Pre-mult mode*/
> +               reg_val |= BIT(16);
> +               break;
> +       default:
> +               /* alpha mode select - layer alpha */
> +               reg_val |= BIT(2);
> +               break;
Ditto

> +       }
> +
> +       rotation = to_dpu_rotation(rotation);
> +       reg_val |= (rotation & 0x7) << 20;
> +
> +       return reg_val;
> +}
> +

> +static void dpu_layer(struct dpu_context *ctx,
> +                   struct sprd_dpu_layer *hwlayer)
> +{
> +       struct dpu_reg *reg = (struct dpu_reg *)ctx->base;
> +       const struct drm_format_info *info;
> +       struct layer_reg *layer;
> +       u32 addr, size, offset;
> +       int i;
> +
> +       layer = &reg->layers[hwlayer->index];
> +       offset = (hwlayer->dst_x & 0xffff) | ((hwlayer->dst_y) << 16);
> +
> +       if (hwlayer->src_w && hwlayer->src_h)
> +               size = (hwlayer->src_w & 0xffff) | ((hwlayer->src_h) << 16);
> +       else
> +               size = (hwlayer->dst_w & 0xffff) | ((hwlayer->dst_h) << 16);
> +
> +       for (i = 0; i < hwlayer->planes; i++) {
> +               addr = hwlayer->addr[i];
> +
> +               if (addr % 16)
> +                       pr_err("layer addr[%d] is not 16 bytes align, it's 0x%08x\n",
> +                               i, addr);
> +               layer->addr[i] = addr;
> +       }
> +
> +       layer->pos = offset;
> +       layer->size = size;
> +       layer->crop_start = (hwlayer->src_y << 16) | hwlayer->src_x;
> +       layer->alpha = hwlayer->alpha;
> +
> +       info = drm_format_info(hwlayer->format);
> +       if (info->cpp[0] == 0) {

Ditto

> +               pr_err("layer[%d] bytes per pixel is invalid\n", hwlayer->index);
> +               return;
> +       }
> +




> +static int dpu_capability(struct dpu_context *ctx,
> +                       struct dpu_capability *cap)
> +{
> +       if (!cap)
> +               return -EINVAL;
> +
Ensure the caller always passes cap != NULL and drop the function return type?

> +       cap->max_layers = 6;
> +       cap->fmts_ptr = primary_fmts;
> +       cap->fmts_cnt = ARRAY_SIZE(primary_fmts);
> +
> +       return 0;
> +}


> +static int sprd_plane_atomic_check(struct drm_plane *plane,
> +                                 struct drm_plane_state *state)
> +{
> +       DRM_DEBUG("%s()\n", __func__);
> +

Would be nice to hear from the atomic experts, how a no-op atomic_check goes
with the overall atomic semantics.


> +       return 0;
> +}
> +


> +static void sprd_plane_atomic_disable(struct drm_plane *plane,
> +                                    struct drm_plane_state *old_state)
> +{
> +       struct sprd_plane *p = to_sprd_plane(plane);
> +
> +       /*
> +        * NOTE:
> +        * The dpu->core->flip() will disable all the planes each time.
> +        * So there is no need to impliment the atomic_disable() function.
> +        * But this function can not be removed, because it will change
> +        * to call atomic_update() callback instead. Which will cause
> +        * kernel panic in sprd_plane_atomic_update().
> +        *
> +        * We do nothing here but just print a debug log.
> +        */
> +       DRM_DEBUG("%s() layer_id = %u\n", __func__, p->index);

Similar to the check - would be nice to see a confirmation, that this isn't
abusing atomics in some way.


> +}
> +
> +static int sprd_plane_create_properties(struct sprd_plane *p, int index)
> +{
> +       unsigned int supported_modes = BIT(DRM_MODE_BLEND_PIXEL_NONE) |
> +                                      BIT(DRM_MODE_BLEND_PREMULTI) |
> +                                      BIT(DRM_MODE_BLEND_COVERAGE);
> +
> +       /* create rotation property */
> +       drm_plane_create_rotation_property(&p->plane,
> +                                          DRM_MODE_ROTATE_0,
> +                                          DRM_MODE_ROTATE_MASK |
> +                                          DRM_MODE_REFLECT_MASK);
> +
> +       /* create alpha property */
> +       drm_plane_create_alpha_property(&p->plane);
> +
> +       /* create blend mode property */
> +       drm_plane_create_blend_mode_property(&p->plane, supported_modes);
> +
> +       /* create zpos property */
> +       drm_plane_create_zpos_immutable_property(&p->plane, index);
> +
Either check if creating the properties fail (and propagate the error) or drop
the function return type. As-is it's in the middle making it fairly misleading.

> +       return 0;
> +}
> +


> +static struct drm_plane *sprd_plane_init(struct drm_device *drm,
> +                                       struct sprd_dpu *dpu)
> +{
> +       struct drm_plane *primary = NULL;
> +       struct sprd_plane *p = NULL;
> +       struct dpu_capability cap = {};
> +       int err, i;
> +
> +       if (dpu->core && dpu->core->capability)
As mentioned before - this always evaluates to true, so drop the check.
Same applies for the other dpu->core->foo checks.

Still not a huge fan of the abstraction layer, but I guess you're hesitant on
removing it.

> +               dpu->core->capability(&dpu->ctx, &cap);
> +
> +       dpu->layers = devm_kcalloc(drm->dev, cap.max_layers,
> +                                 sizeof(struct sprd_dpu_layer), GFP_KERNEL);
> +       if (!dpu->layers)
> +               return ERR_PTR(-ENOMEM);
> +
> +       for (i = 0; i < cap.max_layers; i++) {
> +
> +               p = devm_kzalloc(drm->dev, sizeof(*p), GFP_KERNEL);
> +               if (!p)
> +                       return ERR_PTR(-ENOMEM);
> +
> +               err = drm_universal_plane_init(drm, &p->plane, 1,
> +                                              &sprd_plane_funcs, cap.fmts_ptr,
> +                                              cap.fmts_cnt, NULL,
> +                                              DRM_PLANE_TYPE_PRIMARY, NULL);
> +               if (err) {
> +                       DRM_ERROR("fail to init primary plane\n");
> +                       return ERR_PTR(err);
> +               }
> +
> +               drm_plane_helper_add(&p->plane, &sprd_plane_helper_funcs);
> +
> +               sprd_plane_create_properties(p, i);
> +
> +               p->index = i;
> +               if (i == 0)
> +                       primary = &p->plane;
> +       }
> +
> +       if (p)
> +               DRM_INFO("dpu plane init ok\n");

This and nearly all the other DRM_INFO() messages look like a debug/development
left over. Please remove them - the driver does not need to print when functions
are successfull.


> +
> +       return primary;
> +}
> +
> +static void sprd_crtc_mode_set_nofb(struct drm_crtc *crtc)
> +{
> +       struct sprd_dpu *dpu = crtc_to_dpu(crtc);
> +
> +       if ((dpu->mode->hdisplay == dpu->mode->htotal) ||
> +           (dpu->mode->vdisplay == dpu->mode->vtotal))
> +               dpu->ctx.if_type = SPRD_DISPC_IF_EDPI;
> +       else
> +               dpu->ctx.if_type = SPRD_DISPC_IF_DPI;
> +}
> +
> +static enum drm_mode_status sprd_crtc_mode_valid(struct drm_crtc *crtc,
> +                                       const struct drm_display_mode *mode)
> +{
> +       struct sprd_dpu *dpu = crtc_to_dpu(crtc);
> +
> +       DRM_INFO("%s() mode: "DRM_MODE_FMT"\n", __func__, DRM_MODE_ARG(mode));
> +

If needed, let's move this to core and make it a debug message. As-is it will
cause spam for no reason.


> +       if (mode->type & DRM_MODE_TYPE_DEFAULT)
> +               dpu->mode = (struct drm_display_mode *)mode;
> +
> +       if (mode->type & DRM_MODE_TYPE_PREFERRED) {
> +               dpu->mode = (struct drm_display_mode *)mode;

Casting away the constness is a bad idea.

Instead, let's move the if_type decision here, thus we can remove the
nsprd_crtc_mode_set_nofb function? This way we can also remove sprd_dpu::mode.


> +               drm_display_mode_to_videomode(dpu->mode, &dpu->ctx.vm);

Similarly, one could derive the vm based attributes here and remove dpu->ctx.vm.


> +       }
> +
> +       return MODE_OK;
> +}
> +
> +static void sprd_crtc_atomic_enable(struct drm_crtc *crtc,
> +                                  struct drm_crtc_state *old_state)
> +{
> +       struct sprd_dpu *dpu = crtc_to_dpu(crtc);
> +
> +       DRM_INFO("%s()\n", __func__);
> +
More sprurious info messages - debug leftover?



> +static int sprd_crtc_enable_vblank(struct drm_crtc *crtc)
> +{
> +       struct sprd_dpu *dpu = crtc_to_dpu(crtc);
> +
> +       DRM_DEBUG("%s()\n", __func__);
> +
Personally, I don't see the appeal in these debug messages. While a few display
controllers have the odd piece, they are an exception in DRM.



> +static int sprd_crtc_create_properties(struct drm_crtc *crtc)
> +{
> +       struct sprd_dpu *dpu = crtc_to_dpu(crtc);
> +       struct drm_device *drm = dpu->crtc.dev;
> +       struct drm_property *prop;
> +       struct drm_property_blob *blob;
> +       size_t blob_size;
> +
> +       blob_size = strlen(dpu->ctx.version) + 1;
> +
> +       blob = drm_property_create_blob(dpu->crtc.dev, blob_size,
> +                       dpu->ctx.version);
> +       if (IS_ERR(blob)) {
> +               DRM_ERROR("drm_property_create_blob dpu version failed\n");
> +               return PTR_ERR(blob);
> +       }
> +
> +       /* create dpu version property */
> +       prop = drm_property_create(drm,
> +               DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_BLOB,
> +               "dpu version", 0);

Note: Custom properties should be separate patches. This includes documentation
why they are needed and references to open-source userspace.


HTH
Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

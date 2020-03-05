Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4081917B7E7
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 09:03:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 601AD6EC75;
	Fri,  6 Mar 2020 08:03:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D4516EBBF
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 13:15:34 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id b5so5183123qkh.8
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2020 05:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aXpgRu4p03s4mo69f7FZxdok1P6cziMNZMnDy/DdqHc=;
 b=XN9vDlSvfrw+0LcOZV2D0Zi7E+HJ9Nrv1dYONnpTXr+ixtLoKIbqTvfOKUbX3MyM90
 J6nIxmIfTbl9V3M1gPQGcCNMNAgK8+r3LvnSKqBcb5moitv1W+VQouTSgWjyjXkFt3om
 kABb5COj7SOx23NFJKM9TtJ0M3cTeV1v9/aGOhxtZxJGSWwMOT43tK50FefCPabR2SAT
 lUaAmcdOISmDzIshEvAn7qtIQ9un18qu/b6evfiKVR5tp2OR94B1Z3nfhC6EMBU2Dp/T
 fcO7RFQsgVqP318dM96WT1gqWYf2Z7Fn4bWe9UrCLae/QzHd5AhO8Qpci0/P4qxsoduP
 Fw9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aXpgRu4p03s4mo69f7FZxdok1P6cziMNZMnDy/DdqHc=;
 b=H6G9LaZ9JgYs/TULHhFQP4ns8uLT7zHmo6w2IFPQDiZOKRvz+wgHfZ0nptbVzLIbT7
 wOefcyZNXO0SL1JftHAhQ7hM3sf9m6UPfcvSGOepop4t9np9JdcVTASPd60eD+blSEig
 5/rZ6wGtiOQn/xLVHmTmVvMgGKWggP2EF/pWEulZQKKrzzCq29DghZxRky+EZtBo3GHw
 VAVKtMPrWGDFNjVEVA2ALd0Ba+KI3/O289F0eXnnHmjwd7zS/DsYDZ3Ik0HqHc2nd6Wu
 U+hi60ylEUc/xGgshIIHQ7GmmBVUuxinJ+/YAzIRP8RnRY2g2Hq8Ns1xhWrKbUmv2NSR
 lUsw==
X-Gm-Message-State: ANhLgQ3h4sZ/Y+4Op7LmZegFyvsI1HgBV0/Dk/n0M84CFHQ0uK7K4Na5
 h3KEp1RLmiMtGy05qsZ2yxltw4+6spSIbIRVcjU=
X-Google-Smtp-Source: ADFU+vsVmrdffySOdZnuTwph9eRwBmdBcAXsTBiyKZAC4NupFquDDzSaFLP5AmbZX5k/U3rT8JipyEzGl/Xjkjip4hA=
X-Received: by 2002:a37:4c82:: with SMTP id z124mr7987019qka.47.1583414133300; 
 Thu, 05 Mar 2020 05:15:33 -0800 (PST)
MIME-Version: 1.0
References: <1582710377-15489-1-git-send-email-kevin3.tang@gmail.com>
 <1582710377-15489-5-git-send-email-kevin3.tang@gmail.com>
 <CACvgo53dME1ioYebimSzdOMvjAudtmzpz_-5Q7rNqQnZoBpaqA@mail.gmail.com>
In-Reply-To: <CACvgo53dME1ioYebimSzdOMvjAudtmzpz_-5Q7rNqQnZoBpaqA@mail.gmail.com>
From: tang pengchuan <kevin3.tang@gmail.com>
Date: Thu, 5 Mar 2020 21:15:13 +0800
Message-ID: <CAFPSGXYgY7=vgX6ZPWRgfxfZfBeVRj7=gUOwrcTyYpkYE1C1cA@mail.gmail.com>
Subject: Re: [PATCH RFC v4 4/6] drm/sprd: add Unisoc's drm display controller
 driver
To: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailman-Approved-At: Fri, 06 Mar 2020 08:03:01 +0000
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
Content-Type: multipart/mixed; boundary="===============1592030368=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1592030368==
Content-Type: multipart/alternative; boundary="000000000000f2a3dd05a01b5478"

--000000000000f2a3dd05a01b5478
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 3, 2020 at 2:29 AM Emil Velikov <emil.l.velikov@gmail.com>
wrote:

> Hi Kevin,
>
> There's a few small suggestions, although overall the driver looks a lot
> better.
>
> On Thu, 27 Feb 2020 at 08:14, Kevin Tang <kevin3.tang@gmail.com> wrote:
>
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/dpu/Makefile
> > @@ -0,0 +1,7 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +ifdef CONFIG_ARM64
> > +KBUILD_CFLAGS += -mstrict-align
>
>
> There are many other drivers that do not use readl/writel for register
> access,
> yet none has this workaround... Even those that they are exclusively ARM64.
>
> Have you tried that it's not a buggy version of GCC? At the very least, I'd
> encourage you to add a brief comment about the problem + setup.
>
> ... In general I think one should follow the suggestions from Rob Herring.
>
>
> > +static void dpu_dump(struct dpu_context *ctx)
> > +{
> > +       u32 *reg = (u32 *)ctx->base;
> > +       int i;
> > +
> > +       pr_info("      0          4          8          C\n");
> > +       for (i = 0; i < 256; i += 4) {
> > +               pr_info("%04x: 0x%08x 0x%08x 0x%08x 0x%08x\n",
> > +                       i * 4, reg[i], reg[i + 1], reg[i + 2], reg[i +
> 3]);
>
> Using some of the helpers from drm_print.h would be better than pr_*.
> This applies for the rest of the patch.
>
>
> > +static void dpu_clean_all(struct dpu_context *ctx)
> > +{
> > +       int i;
> > +       struct dpu_reg *reg = (struct dpu_reg *)ctx->base;
> > +
> > +       for (i = 0; i < 8; i++)
>
> This "< 8" seem pretty magical. How about "< ARRAY_SIZE(reg->layers)"
> Same logic applies through the rest of the patch.
>
>
> > +static int dpu_wait_stop_done(struct dpu_context *ctx)
> > +{
> > +       int rc;
> > +
> > +       if (ctx->stopped)
> > +               return 0;
> > +
> The stopped handling does look suspicious. Admittedly I did not look too
> closely
> at the dpu_flip code, which seems to require it.
>
> Let's add a small comment in the struct dpu_context::stopped declaration,
> why it
> is needed, if it truely is.
>
Dpu have running and stopped states, "stopped " declaration is for dpu stop
done isr signal.
if we need to stop the dpu or dpu_flip, we must wait for stop done isr
signal, for waiting last h/w composer done.

Not only suspend/resume and dpu_flip, we have other scenes that need this
flag, eg: background color, PQ enhance...
All this need "stopped" flag to sync.

>
> > +       rc = wait_event_interruptible_timeout(ctx->wait_queue,
> ctx->evt_stop,
> > +                                              msecs_to_jiffies(500));
> > +       ctx->evt_stop = false;
> > +
> > +       ctx->stopped = true;
> > +
> > +       if (!rc) {
> > +               pr_err("dpu wait for stop done time out!\n");
> > +               return -ETIMEDOUT;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
>
> > +static void dpu_stop(struct dpu_context *ctx)
> > +{
> > +       struct dpu_reg *reg = (struct dpu_reg *)ctx->base;
> > +
> > +       if (ctx->stopped)
> > +               return;
> > +
> > +       if (ctx->if_type == SPRD_DISPC_IF_DPI)
> > +               reg->dpu_ctrl |= BIT(1);
> > +
> > +       dpu_wait_stop_done(ctx);
> > +
> > +       pr_info("dpu stop\n");
>
> This and the dpu_run pr_info() messages can be removed.
>
>
> > +}
> > +
> > +static void dpu_run(struct dpu_context *ctx)
> > +{
> > +       struct dpu_reg *reg = (struct dpu_reg *)ctx->base;
> > +
> > +       if (!ctx->stopped)
> > +               return;
> > +
> > +       reg->dpu_ctrl |= BIT(0);
> > +
> > +       ctx->stopped = false;
> > +
> > +       pr_info("dpu run\n");
> > +}
> > +
> > +static int dpu_init(struct dpu_context *ctx)
> > +{
> > +       struct dpu_reg *reg = (struct dpu_reg *)ctx->base;
> > +       u32 size;
> > +
> > +       reg->bg_color = 0;
> > +
> > +       size = (ctx->vm.vactive << 16) | ctx->vm.hactive;
> > +       reg->panel_size = size;
> > +       reg->blend_size = size;
> > +
> > +       reg->dpu_cfg0 = BIT(4) | BIT(5);
> > +
> > +       reg->dpu_cfg1 = 0x004466da;
> > +       reg->dpu_cfg2 = 0;
> > +
> > +       if (ctx->stopped)
> > +               dpu_clean_all(ctx);
> > +
> > +       reg->mmu_en = 0;
> > +       reg->mmu_min_ppn1 = 0;
> > +       reg->mmu_ppn_range1 = 0xffff;
> > +       reg->mmu_min_ppn2 = 0;
> > +       reg->mmu_ppn_range2 = 0xffff;
> > +       reg->mmu_vpn_range = 0x1ffff;
> > +
> > +       reg->dpu_int_clr = 0xffff;
> > +
> > +       init_waitqueue_head(&ctx->wait_queue);
> > +
> > +       return 0;
>
> Function always returns 0. Let's make it static void dpu_init()
>
>
>
> > +static u32 to_dpu_rotation(u32 angle)
> > +{
> > +       u32 rot = DPU_LAYER_ROTATION_0;
> > +
> > +       switch (angle) {
> > +       case 0:
> > +       case DRM_MODE_ROTATE_0:
> > +               rot = DPU_LAYER_ROTATION_0;
> > +               break;
> > +       case DRM_MODE_ROTATE_90:
> > +               rot = DPU_LAYER_ROTATION_90;
> > +               break;
> > +       case DRM_MODE_ROTATE_180:
> > +               rot = DPU_LAYER_ROTATION_180;
> > +               break;
> > +       case DRM_MODE_ROTATE_270:
> > +               rot = DPU_LAYER_ROTATION_270;
> > +               break;
> > +       case DRM_MODE_REFLECT_Y:
> > +               rot = DPU_LAYER_ROTATION_180_M;
> > +               break;
> > +       case (DRM_MODE_REFLECT_Y | DRM_MODE_ROTATE_90):
> > +               rot = DPU_LAYER_ROTATION_90_M;
> > +               break;
> > +       case DRM_MODE_REFLECT_X:
> > +               rot = DPU_LAYER_ROTATION_0_M;
> > +               break;
> > +       case (DRM_MODE_REFLECT_X | DRM_MODE_ROTATE_90):
> > +               rot = DPU_LAYER_ROTATION_270_M;
> > +               break;
> > +       default:
> > +               pr_err("rotation convert unsupport angle (drm)= 0x%x\n",
> angle);
> > +               break;
>
> Have you seen a case where the 0 or default case are reached? AFAICT they
> will
> never trigger. So one might as well use:

    switch (angle) {
>     case DRM_MODE_FOO:
>         return DPU_LAYER_ROTATION_FOO;
>     ...
>     case DRM_MODE_BAR:
>         return DPU_LAYER_ROTATION_BAR;
>     }
>
> Yeah, the 0 maybe unused code, i will remove it.
But i think default is need, because userspace could give an incorrect
value .
So we need to setup a default value and doing error check.

>
> > +       }
> > +
> > +       return rot;
> > +}
> > +
> > +static u32 dpu_img_ctrl(u32 format, u32 blending, u32 rotation)
> > +{
> > +       int reg_val = 0;
> > +
> > +       /* layer enable */
> > +       reg_val |= BIT(0);
> > +
> > +       switch (format) {
> > +       case DRM_FORMAT_BGRA8888:
> > +               /* BGRA8888 -> ARGB8888 */
> > +               reg_val |= SPRD_IMG_DATA_ENDIAN_B3B2B1B0 << 8;
> > +               reg_val |= (DPU_LAYER_FORMAT_ARGB8888 << 4);
> > +               break;
> > +       case DRM_FORMAT_RGBX8888:
> > +       case DRM_FORMAT_RGBA8888:
> > +               /* RGBA8888 -> ABGR8888 */
> > +               reg_val |= SPRD_IMG_DATA_ENDIAN_B3B2B1B0 << 8;
> > +               /* FALLTHRU */
> > +       case DRM_FORMAT_ABGR8888:
> > +               /* rb switch */
> > +               reg_val |= BIT(10);
> > +               /* FALLTHRU */
> > +       case DRM_FORMAT_ARGB8888:
> > +               reg_val |= (DPU_LAYER_FORMAT_ARGB8888 << 4);
> > +               break;
> > +       case DRM_FORMAT_XBGR8888:
> > +               /* rb switch */
> > +               reg_val |= BIT(10);
> > +               /* FALLTHRU */
> > +       case DRM_FORMAT_XRGB8888:
> > +               reg_val |= (DPU_LAYER_FORMAT_ARGB8888 << 4);
> > +               break;
> > +       case DRM_FORMAT_BGR565:
> > +               /* rb switch */
> > +               reg_val |= BIT(10);
> > +               /* FALLTHRU */
> > +       case DRM_FORMAT_RGB565:
> > +               reg_val |= (DPU_LAYER_FORMAT_RGB565 << 4);
> > +               break;
> > +       case DRM_FORMAT_NV12:
> > +               /* 2-Lane: Yuv420 */
> > +               reg_val |= DPU_LAYER_FORMAT_YUV420_2PLANE << 4;
> > +               /* Y endian */
> > +               reg_val |= SPRD_IMG_DATA_ENDIAN_B0B1B2B3 << 8;
> > +               /* UV endian */
> > +               reg_val |= SPRD_IMG_DATA_ENDIAN_B0B1B2B3 << 10;
> > +               break;
> > +       case DRM_FORMAT_NV21:
> > +               /* 2-Lane: Yuv420 */
> > +               reg_val |= DPU_LAYER_FORMAT_YUV420_2PLANE << 4;
> > +               /* Y endian */
> > +               reg_val |= SPRD_IMG_DATA_ENDIAN_B0B1B2B3 << 8;
> > +               /* UV endian */
> > +               reg_val |= SPRD_IMG_DATA_ENDIAN_B3B2B1B0 << 10;
> > +               break;
> > +       case DRM_FORMAT_NV16:
> > +               /* 2-Lane: Yuv422 */
> > +               reg_val |= DPU_LAYER_FORMAT_YUV422_2PLANE << 4;
> > +               /* Y endian */
> > +               reg_val |= SPRD_IMG_DATA_ENDIAN_B3B2B1B0 << 8;
> > +               /* UV endian */
> > +               reg_val |= SPRD_IMG_DATA_ENDIAN_B3B2B1B0 << 10;
> > +               break;
> > +       case DRM_FORMAT_NV61:
> > +               /* 2-Lane: Yuv422 */
> > +               reg_val |= DPU_LAYER_FORMAT_YUV422_2PLANE << 4;
> > +               /* Y endian */
> > +               reg_val |= SPRD_IMG_DATA_ENDIAN_B0B1B2B3 << 8;
> > +               /* UV endian */
> > +               reg_val |= SPRD_IMG_DATA_ENDIAN_B0B1B2B3 << 10;
> > +               break;
> > +       case DRM_FORMAT_YUV420:
> > +               reg_val |= DPU_LAYER_FORMAT_YUV420_3PLANE << 4;
> > +               /* Y endian */
> > +               reg_val |= SPRD_IMG_DATA_ENDIAN_B0B1B2B3 << 8;
> > +               /* UV endian */
> > +               reg_val |= SPRD_IMG_DATA_ENDIAN_B0B1B2B3 << 10;
> > +               break;
> > +       case DRM_FORMAT_YVU420:
> > +               reg_val |= DPU_LAYER_FORMAT_YUV420_3PLANE << 4;
> > +               /* Y endian */
> > +               reg_val |= SPRD_IMG_DATA_ENDIAN_B0B1B2B3 << 8;
> > +               /* UV endian */
> > +               reg_val |= SPRD_IMG_DATA_ENDIAN_B3B2B1B0 << 10;
> > +               break;
> > +       default:
> > +               pr_err("error: invalid format %c%c%c%c\n", format,
> > +                                               format >> 8,
> > +                                               format >> 16,
> > +                                               format >> 24);
> > +               break;
> The default case here should be unreachable. Either it is or the upper
> layer (or
> earlier code) should ensure that.
>
There will be some differences in the formats supported by different chips,
but userspace will only have one set of code.
So it is necessary to check whether the parameters passed by the user layer
are wrong. I think it is necessary

>
> > +       }
> > +
> > +       switch (blending) {
> > +       case DRM_MODE_BLEND_PIXEL_NONE:
> > +               /* don't do blending, maybe RGBX */
> > +               /* alpha mode select - layer alpha */
> > +               reg_val |= BIT(2);
> > +               break;
> > +       case DRM_MODE_BLEND_COVERAGE:
> > +               /* alpha mode select - combo alpha */
> > +               reg_val |= BIT(3);
> > +               /*Normal mode*/
> > +               reg_val &= (~BIT(16));
> > +               break;
> > +       case DRM_MODE_BLEND_PREMULTI:
> > +               /* alpha mode select - combo alpha */
> > +               reg_val |= BIT(3);
> > +               /*Pre-mult mode*/
> > +               reg_val |= BIT(16);
> > +               break;
> > +       default:
> > +               /* alpha mode select - layer alpha */
> > +               reg_val |= BIT(2);
> > +               break;
> Ditto
>
> > +       }
> > +
> > +       rotation = to_dpu_rotation(rotation);
> > +       reg_val |= (rotation & 0x7) << 20;
> > +
> > +       return reg_val;
> > +}
> > +
>
> > +static void dpu_layer(struct dpu_context *ctx,
> > +                   struct sprd_dpu_layer *hwlayer)
> > +{
> > +       struct dpu_reg *reg = (struct dpu_reg *)ctx->base;
> > +       const struct drm_format_info *info;
> > +       struct layer_reg *layer;
> > +       u32 addr, size, offset;
> > +       int i;
> > +
> > +       layer = &reg->layers[hwlayer->index];
> > +       offset = (hwlayer->dst_x & 0xffff) | ((hwlayer->dst_y) << 16);
> > +
> > +       if (hwlayer->src_w && hwlayer->src_h)
> > +               size = (hwlayer->src_w & 0xffff) | ((hwlayer->src_h) <<
> 16);
> > +       else
> > +               size = (hwlayer->dst_w & 0xffff) | ((hwlayer->dst_h) <<
> 16);
> > +
> > +       for (i = 0; i < hwlayer->planes; i++) {
> > +               addr = hwlayer->addr[i];
> > +
> > +               if (addr % 16)
> > +                       pr_err("layer addr[%d] is not 16 bytes align,
> it's 0x%08x\n",
> > +                               i, addr);
> > +               layer->addr[i] = addr;
> > +       }
> > +
> > +       layer->pos = offset;
> > +       layer->size = size;
> > +       layer->crop_start = (hwlayer->src_y << 16) | hwlayer->src_x;
> > +       layer->alpha = hwlayer->alpha;
> > +
> > +       info = drm_format_info(hwlayer->format);
> > +       if (info->cpp[0] == 0) {
>
> Ditto
>
> > +               pr_err("layer[%d] bytes per pixel is invalid\n",
> hwlayer->index);
> > +               return;
> > +       }
> > +
>
>
>
>
> > +static int dpu_capability(struct dpu_context *ctx,
> > +                       struct dpu_capability *cap)
> > +{
> > +       if (!cap)
> > +               return -EINVAL;
> > +
> Ensure the caller always passes cap != NULL and drop the function return
> type?


> > +       cap->max_layers = 6;
> > +       cap->fmts_ptr = primary_fmts;
> > +       cap->fmts_cnt = ARRAY_SIZE(primary_fmts);
> > +
> > +       return 0;
> > +}
>
>
> > +static int sprd_plane_atomic_check(struct drm_plane *plane,
> > +                                 struct drm_plane_state *state)
> > +{
> > +       DRM_DEBUG("%s()\n", __func__);
> > +
>
> Would be nice to hear from the atomic experts, how a no-op atomic_check
> goes
> with the overall atomic semantics.
>
>
> > +       return 0;
> > +}
> > +
>
>
> > +static void sprd_plane_atomic_disable(struct drm_plane *plane,
> > +                                    struct drm_plane_state *old_state)
> > +{
> > +       struct sprd_plane *p = to_sprd_plane(plane);
> > +
> > +       /*
> > +        * NOTE:
> > +        * The dpu->core->flip() will disable all the planes each time.
> > +        * So there is no need to impliment the atomic_disable()
> function.
> > +        * But this function can not be removed, because it will change
> > +        * to call atomic_update() callback instead. Which will cause
> > +        * kernel panic in sprd_plane_atomic_update().
> > +        *
> > +        * We do nothing here but just print a debug log.
> > +        */
> > +       DRM_DEBUG("%s() layer_id = %u\n", __func__, p->index);
>
> Similar to the check - would be nice to see a confirmation, that this isn't
> abusing atomics in some way.
>
>
> > +}
> > +
> > +static int sprd_plane_create_properties(struct sprd_plane *p, int index)
> > +{
> > +       unsigned int supported_modes = BIT(DRM_MODE_BLEND_PIXEL_NONE) |
> > +                                      BIT(DRM_MODE_BLEND_PREMULTI) |
> > +                                      BIT(DRM_MODE_BLEND_COVERAGE);
> > +
> > +       /* create rotation property */
> > +       drm_plane_create_rotation_property(&p->plane,
> > +                                          DRM_MODE_ROTATE_0,
> > +                                          DRM_MODE_ROTATE_MASK |
> > +                                          DRM_MODE_REFLECT_MASK);
> > +
> > +       /* create alpha property */
> > +       drm_plane_create_alpha_property(&p->plane);
> > +
> > +       /* create blend mode property */
> > +       drm_plane_create_blend_mode_property(&p->plane, supported_modes);
> > +
> > +       /* create zpos property */
> > +       drm_plane_create_zpos_immutable_property(&p->plane, index);
> > +
> Either check if creating the properties fail (and propagate the error) or
> drop
> the function return type. As-is it's in the middle making it fairly
> misleading.
>
Ok, i will drop the func return type.

>
> > +       return 0;
> > +}
> > +
>
>
> > +static struct drm_plane *sprd_plane_init(struct drm_device *drm,
> > +                                       struct sprd_dpu *dpu)
> > +{
> > +       struct drm_plane *primary = NULL;
> > +       struct sprd_plane *p = NULL;
> > +       struct dpu_capability cap = {};
> > +       int err, i;
> > +
> > +       if (dpu->core && dpu->core->capability)
> As mentioned before - this always evaluates to true, so drop the check.
> Same applies for the other dpu->core->foo checks.
>
> Still not a huge fan of the abstraction layer, but I guess you're hesitant
> on
> removing it.
>
Sometimes,  some "dpu->core->foo" maybe always need, compatibility will be
better.
eg:

    if (dpu->glb && dpu->glb->power)
        dpu->glb->power(ctx, true);
    if (dpu->glb && dpu->glb->enable)
        dpu->glb->enable(ctx);

    if (ctx->is_stopped && dpu->glb && dpu->glb->reset)
        dpu->glb->reset(ctx);

    if (dpu->clk && dpu->clk->init)
        dpu->clk->init(ctx);
    if (dpu->clk && dpu->clk->enable)
        dpu->clk->enable(ctx);

    if (dpu->core && dpu->core->init)
        dpu->core->init(ctx);
    if (dpu->core && dpu->core->ifconfig)
        dpu->core->ifconfig(ctx);

But here, "dpu->core->capability", your are right, this always evaluates to
true
So i will remove the error checking about always being true...
> +               dpu->core->capability(&dpu->ctx, &cap);
> +
> +       dpu->layers = devm_kcalloc(drm->dev, cap.max_layers,
> +                                 sizeof(struct sprd_dpu_layer),
GFP_KERNEL);
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
> +                                              &sprd_plane_funcs,
cap.fmts_ptr,
> +                                              cap.fmts_cnt, NULL,
> +                                              DRM_PLANE_TYPE_PRIMARY,
NULL);
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

This and nearly all the other DRM_INFO() messages look like a
debug/development
left over. Please remove them - the driver does not need to print when
functions
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
> +                                       const struct drm_display_mode
*mode)
> +{
> +       struct sprd_dpu *dpu = crtc_to_dpu(crtc);
> +
> +       DRM_INFO("%s() mode: "DRM_MODE_FMT"\n", __func__,
DRM_MODE_ARG(mode));
> +

If needed, let's move this to core and make it a debug message. As-is it
will
cause spam for no reason.


> +       if (mode->type & DRM_MODE_TYPE_DEFAULT)
> +               dpu->mode = (struct drm_display_mode *)mode;
> +
> +       if (mode->type & DRM_MODE_TYPE_PREFERRED) {
> +               dpu->mode = (struct drm_display_mode *)mode;

Casting away the constness is a bad idea.

Instead, let's move the if_type decision here, thus we can remove the
nsprd_crtc_mode_set_nofb function? This way we can also remove
sprd_dpu::mode.

> +               drm_display_mode_to_videomode(dpu->mode, &dpu->ctx.vm);

Similarly, one could derive the vm based attributes here and remove
dpu->ctx.vm.


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
Personally, I don't see the appeal in these debug messages. While a few
display
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
> +               DRM_ERROR("drm_property_create_blob dpu version
failed\n");
> +               return PTR_ERR(blob);
> +       }
> +
> +       /* create dpu version property */
> +       prop = drm_property_create(drm,
> +               DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_BLOB,
> +               "dpu version", 0);

Note: Custom properties should be separate patches. This includes
documentation
why they are needed and references to open-source userspace.
This only need for our chips, what documentation do we need to provide?


HTH
Emil

--000000000000f2a3dd05a01b5478
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 3, 2020 =
at 2:29 AM Emil Velikov &lt;<a href=3D"mailto:emil.l.velikov@gmail.com">emi=
l.l.velikov@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Hi Kevin,<br>
<br>
There&#39;s a few small suggestions, although overall the driver looks a lo=
t better.<br>
<br>
On Thu, 27 Feb 2020 at 08:14, Kevin Tang &lt;<a href=3D"mailto:kevin3.tang@=
gmail.com" target=3D"_blank">kevin3.tang@gmail.com</a>&gt; wrote:<br>
<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/dpu/Makefile<br>
&gt; @@ -0,0 +1,7 @@<br>
&gt; +# SPDX-License-Identifier: GPL-2.0<br>
&gt; +<br>
&gt; +ifdef CONFIG_ARM64<br>
&gt; +KBUILD_CFLAGS +=3D -mstrict-align<br>
<br>
<br>
There are many other drivers that do not use readl/writel for register acce=
ss,<br>
yet none has this workaround... Even those that they are exclusively ARM64.=
<br>
<br>
Have you tried that it&#39;s not a buggy version of GCC? At the very least,=
 I&#39;d<br>
encourage you to add a brief comment about the problem + setup.<br>
<br>
... In general I think one should follow the suggestions from Rob Herring.<=
br>
<br>
<br>
&gt; +static void dpu_dump(struct dpu_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 *reg =3D (u32 *)ctx-&gt;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_info(&quot;=C2=A0 =C2=A0 =C2=A0 0=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 8=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 C\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; 256; i +=3D 4) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_info(&quot;=
%04x: 0x%08x 0x%08x 0x%08x 0x%08x\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0i * 4, reg[i], reg[i + 1], reg[i + 2], reg[i + 3]);<br>
<br>
Using some of the helpers from drm_print.h would be better than pr_*.<br>
This applies for the rest of the patch.<br>
<br>
<br>
&gt; +static void dpu_clean_all(struct dpu_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dpu_reg *reg =3D (struct dpu_reg *)=
ctx-&gt;base;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; 8; i++)<br>
<br>
This &quot;&lt; 8&quot; seem pretty magical. How about &quot;&lt; ARRAY_SIZ=
E(reg-&gt;layers)&quot;<br>
Same logic applies through the rest of the patch.<br>
<br>
<br>
&gt; +static int dpu_wait_stop_done(struct dpu_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int rc;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ctx-&gt;stopped)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
The stopped handling does look suspicious. Admittedly I did not look too cl=
osely<br>
at the dpu_flip code, which seems to require it.<br>
<br>
Let&#39;s add a small comment in the struct dpu_context::stopped declaratio=
n, why it<br>
is needed, if it truely is.<br></blockquote><div>Dpu have running and stopp=
ed states, &quot;stopped &quot; declaration is for dpu stop done isr signal=
.</div><div>if we need to stop the dpu or dpu_flip, we must wait for stop d=
one isr signal, for waiting last h/w composer done.</div><div><br></div><di=
v>Not only suspend/resume and dpu_flip, we have other scenes that need this=
 flag, eg: background color, PQ enhance...<br></div><div>All this need &quo=
t;stopped&quot; flag to sync.</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D wait_event_interruptible_timeout(ct=
x-&gt;wait_queue, ctx-&gt;evt_stop,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 msecs_to_jiffies(500));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;evt_stop =3D false;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;stopped =3D true;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!rc) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;d=
pu wait for stop done time out!\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ETIMED=
OUT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
<br>
&gt; +static void dpu_stop(struct dpu_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dpu_reg *reg =3D (struct dpu_reg *)=
ctx-&gt;base;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ctx-&gt;stopped)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ctx-&gt;if_type =3D=3D SPRD_DISPC_IF_D=
PI)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;dpu_ct=
rl |=3D BIT(1);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0dpu_wait_stop_done(ctx);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_info(&quot;dpu stop\n&quot;);<br>
<br>
This and the dpu_run pr_info() messages can be removed.<br>
<br>
<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void dpu_run(struct dpu_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dpu_reg *reg =3D (struct dpu_reg *)=
ctx-&gt;base;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ctx-&gt;stopped)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;dpu_ctrl |=3D BIT(0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;stopped =3D false;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_info(&quot;dpu run\n&quot;);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int dpu_init(struct dpu_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dpu_reg *reg =3D (struct dpu_reg *)=
ctx-&gt;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 size;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;bg_color =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D (ctx-&gt;vm.vactive &lt;&lt; 16) =
| ctx-&gt;vm.hactive;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;panel_size =3D size;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;blend_size =3D size;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;dpu_cfg0 =3D BIT(4) | BIT(5);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;dpu_cfg1 =3D 0x004466da;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;dpu_cfg2 =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ctx-&gt;stopped)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu_clean_all(=
ctx);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;mmu_en =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;mmu_min_ppn1 =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;mmu_ppn_range1 =3D 0xffff;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;mmu_min_ppn2 =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;mmu_ppn_range2 =3D 0xffff;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;mmu_vpn_range =3D 0x1ffff;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;dpu_int_clr =3D 0xffff;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0init_waitqueue_head(&amp;ctx-&gt;wait_queu=
e);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
<br>
Function always returns 0. Let&#39;s make it static void dpu_init()<br>
<br>
<br>
<br>
&gt; +static u32 to_dpu_rotation(u32 angle)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 rot =3D DPU_LAYER_ROTATION_0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (angle) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case 0:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_MODE_ROTATE_0:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rot =3D DPU_LA=
YER_ROTATION_0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_MODE_ROTATE_90:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rot =3D DPU_LA=
YER_ROTATION_90;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_MODE_ROTATE_180:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rot =3D DPU_LA=
YER_ROTATION_180;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_MODE_ROTATE_270:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rot =3D DPU_LA=
YER_ROTATION_270;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_MODE_REFLECT_Y:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rot =3D DPU_LA=
YER_ROTATION_180_M;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case (DRM_MODE_REFLECT_Y | DRM_MODE_ROTATE=
_90):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rot =3D DPU_LA=
YER_ROTATION_90_M;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_MODE_REFLECT_X:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rot =3D DPU_LA=
YER_ROTATION_0_M;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case (DRM_MODE_REFLECT_X | DRM_MODE_ROTATE=
_90):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rot =3D DPU_LA=
YER_ROTATION_270_M;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;r=
otation convert unsupport angle (drm)=3D 0x%x\n&quot;, angle);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
<br>
Have you seen a case where the 0 or default case are reached? AFAICT they w=
ill<br>
never trigger. So one might as well use:</blockquote><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
=C2=A0 =C2=A0 switch (angle) {<br>
=C2=A0 =C2=A0 case DRM_MODE_FOO:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return DPU_LAYER_ROTATION_FOO;<br>
=C2=A0 =C2=A0 ...<br>
=C2=A0 =C2=A0 case DRM_MODE_BAR:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return DPU_LAYER_ROTATION_BAR;<br>
=C2=A0 =C2=A0 }<br>
<br></blockquote><div>

Yeah, the 0 maybe unused code, i will remove it.</div><div>But i think defa=
ult is need, because userspace could give an incorrect value .</div><div>So=
 we need to setup a default value and doing error check.</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return rot;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static u32 dpu_img_ctrl(u32 format, u32 blending, u32 rotation)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int reg_val =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* layer enable */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D BIT(0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (format) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_BGRA8888:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* BGRA8888 -&=
gt; ARGB8888 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D S=
PRD_IMG_DATA_ENDIAN_B3B2B1B0 &lt;&lt; 8;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D (=
DPU_LAYER_FORMAT_ARGB8888 &lt;&lt; 4);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_RGBX8888:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_RGBA8888:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* RGBA8888 -&=
gt; ABGR8888 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D S=
PRD_IMG_DATA_ENDIAN_B3B2B1B0 &lt;&lt; 8;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* FALLTHRU */=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_ABGR8888:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* rb switch *=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D B=
IT(10);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* FALLTHRU */=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_ARGB8888:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D (=
DPU_LAYER_FORMAT_ARGB8888 &lt;&lt; 4);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_XBGR8888:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* rb switch *=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D B=
IT(10);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* FALLTHRU */=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_XRGB8888:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D (=
DPU_LAYER_FORMAT_ARGB8888 &lt;&lt; 4);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_BGR565:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* rb switch *=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D B=
IT(10);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* FALLTHRU */=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_RGB565:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D (=
DPU_LAYER_FORMAT_RGB565 &lt;&lt; 4);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_NV12:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 2-Lane: Yuv=
420 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D D=
PU_LAYER_FORMAT_YUV420_2PLANE &lt;&lt; 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Y endian */=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D S=
PRD_IMG_DATA_ENDIAN_B0B1B2B3 &lt;&lt; 8;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* UV endian *=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D S=
PRD_IMG_DATA_ENDIAN_B0B1B2B3 &lt;&lt; 10;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_NV21:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 2-Lane: Yuv=
420 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D D=
PU_LAYER_FORMAT_YUV420_2PLANE &lt;&lt; 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Y endian */=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D S=
PRD_IMG_DATA_ENDIAN_B0B1B2B3 &lt;&lt; 8;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* UV endian *=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D S=
PRD_IMG_DATA_ENDIAN_B3B2B1B0 &lt;&lt; 10;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_NV16:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 2-Lane: Yuv=
422 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D D=
PU_LAYER_FORMAT_YUV422_2PLANE &lt;&lt; 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Y endian */=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D S=
PRD_IMG_DATA_ENDIAN_B3B2B1B0 &lt;&lt; 8;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* UV endian *=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D S=
PRD_IMG_DATA_ENDIAN_B3B2B1B0 &lt;&lt; 10;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_NV61:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 2-Lane: Yuv=
422 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D D=
PU_LAYER_FORMAT_YUV422_2PLANE &lt;&lt; 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Y endian */=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D S=
PRD_IMG_DATA_ENDIAN_B0B1B2B3 &lt;&lt; 8;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* UV endian *=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D S=
PRD_IMG_DATA_ENDIAN_B0B1B2B3 &lt;&lt; 10;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_YUV420:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D D=
PU_LAYER_FORMAT_YUV420_3PLANE &lt;&lt; 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Y endian */=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D S=
PRD_IMG_DATA_ENDIAN_B0B1B2B3 &lt;&lt; 8;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* UV endian *=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D S=
PRD_IMG_DATA_ENDIAN_B0B1B2B3 &lt;&lt; 10;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_YVU420:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D D=
PU_LAYER_FORMAT_YUV420_3PLANE &lt;&lt; 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Y endian */=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D S=
PRD_IMG_DATA_ENDIAN_B0B1B2B3 &lt;&lt; 8;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* UV endian *=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D S=
PRD_IMG_DATA_ENDIAN_B3B2B1B0 &lt;&lt; 10;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;e=
rror: invalid format %c%c%c%c\n&quot;, format,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0format &gt;&gt; 8,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0format &gt;&gt; 16,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0format &gt;&gt; 24);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
The default case here should be unreachable. Either it is or the upper laye=
r (or<br>
earlier code) should ensure that.<br></blockquote><div>There will be some d=
ifferences in the formats supported by=C2=A0different chips, but userspace =
will only have one set of code.</div><div>So it is necessary to check wheth=
er the parameters passed by the user layer are wrong. I think it is necessa=
ry<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (blending) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_MODE_BLEND_PIXEL_NONE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* don&#39;t d=
o blending, maybe RGBX */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* alpha mode =
select - layer alpha */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D B=
IT(2);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_MODE_BLEND_COVERAGE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* alpha mode =
select - combo alpha */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D B=
IT(3);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*Normal mode*=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val &amp;=
=3D (~BIT(16));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_MODE_BLEND_PREMULTI:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* alpha mode =
select - combo alpha */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D B=
IT(3);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*Pre-mult mod=
e*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D B=
IT(16);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* alpha mode =
select - layer alpha */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D B=
IT(2);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
Ditto<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0rotation =3D to_dpu_rotation(rotation);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D (rotation &amp; 0x7) &lt;&lt;=
 20;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return reg_val;<br>
&gt; +}<br>
&gt; +<br>
<br>
&gt; +static void dpu_layer(struct dpu_context *ctx,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
struct sprd_dpu_layer *hwlayer)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dpu_reg *reg =3D (struct dpu_reg *)=
ctx-&gt;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct drm_format_info *info;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct layer_reg *layer;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 addr, size, offset;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0layer =3D &amp;reg-&gt;layers[hwlayer-&gt;=
index];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0offset =3D (hwlayer-&gt;dst_x &amp; 0xffff=
) | ((hwlayer-&gt;dst_y) &lt;&lt; 16);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (hwlayer-&gt;src_w &amp;&amp; hwlayer-&=
gt;src_h)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D (hwla=
yer-&gt;src_w &amp; 0xffff) | ((hwlayer-&gt;src_h) &lt;&lt; 16);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D (hwla=
yer-&gt;dst_w &amp; 0xffff) | ((hwlayer-&gt;dst_h) &lt;&lt; 16);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; hwlayer-&gt;planes; i=
++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addr =3D hwlay=
er-&gt;addr[i];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (addr % 16)=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0pr_err(&quot;layer addr[%d] is not 16 bytes align, it&#39;s 0=
x%08x\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i, addr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;addr=
[i] =3D addr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;pos =3D offset;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;size =3D size;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;crop_start =3D (hwlayer-&gt;src_=
y &lt;&lt; 16) | hwlayer-&gt;src_x;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;alpha =3D hwlayer-&gt;alpha;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0info =3D drm_format_info(hwlayer-&gt;forma=
t);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (info-&gt;cpp[0] =3D=3D 0) {<br>
<br>
Ditto<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;l=
ayer[%d] bytes per pixel is invalid\n&quot;, hwlayer-&gt;index);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
<br>
<br>
<br>
<br>
&gt; +static int dpu_capability(struct dpu_context *ctx,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0struct dpu_capability *cap)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!cap)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL=
;<br>
&gt; +<br>
Ensure the caller always passes cap !=3D NULL and drop the function return =
type?=C2=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cap-&gt;max_layers =3D 6;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cap-&gt;fmts_ptr =3D primary_fmts;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cap-&gt;fmts_cnt =3D ARRAY_SIZE(primary_fm=
ts);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
<br>
<br>
&gt; +static int sprd_plane_atomic_check(struct drm_plane *plane,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_plane_state *st=
ate)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DEBUG(&quot;%s()\n&quot;, __func__);<b=
r>
&gt; +<br>
<br>
Would be nice to hear from the atomic experts, how a no-op atomic_check goe=
s<br>
with the overall atomic semantics.<br>
<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
<br>
<br>
&gt; +static void sprd_plane_atomic_disable(struct drm_plane *plane,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_plane_s=
tate *old_state)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sprd_plane *p =3D to_sprd_plane(pla=
ne);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * NOTE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * The dpu-&gt;core-&gt;flip() will disabl=
e all the planes each time.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * So there is no need to impliment the at=
omic_disable() function.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * But this function can not be removed, b=
ecause it will change<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * to call atomic_update() callback instea=
d. Which will cause<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * kernel panic in sprd_plane_atomic_updat=
e().<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * We do nothing here but just print a deb=
ug log.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DEBUG(&quot;%s() layer_id =3D %u\n&quo=
t;, __func__, p-&gt;index);<br>
<br>
Similar to the check - would be nice to see a confirmation, that this isn&#=
39;t<br>
abusing atomics in some way.<br>
<br>
<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sprd_plane_create_properties(struct sprd_plane *p, int ind=
ex)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int supported_modes =3D BIT(DRM_M=
ODE_BLEND_PIXEL_NONE) |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(DRM_MOD=
E_BLEND_PREMULTI) |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(DRM_MOD=
E_BLEND_COVERAGE);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* create rotation property */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_plane_create_rotation_property(&amp;p-=
&gt;plane,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 DRM_MODE_ROTATE_0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 DRM_MODE_ROTATE_MASK |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 DRM_MODE_REFLECT_MASK);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* create alpha property */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_plane_create_alpha_property(&amp;p-&gt=
;plane);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* create blend mode property */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_plane_create_blend_mode_property(&amp;=
p-&gt;plane, supported_modes);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* create zpos property */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_plane_create_zpos_immutable_property(&=
amp;p-&gt;plane, index);<br>
&gt; +<br>
Either check if creating the properties fail (and propagate the error) or d=
rop<br>
the function return type. As-is it&#39;s in the middle making it fairly mis=
leading.<br></blockquote><div>Ok, i will drop the func return type.=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
<br>
<br>
&gt; +static struct drm_plane *sprd_plane_init(struct drm_device *drm,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struc=
t sprd_dpu *dpu)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_plane *primary =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sprd_plane *p =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dpu_capability cap =3D {};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int err, i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (dpu-&gt;core &amp;&amp; dpu-&gt;core-&=
gt;capability)<br>
As mentioned before - this always evaluates to true, so drop the check.<br>
Same applies for the other dpu-&gt;core-&gt;foo checks.<br>
<br>
Still not a huge fan of the abstraction layer, but I guess you&#39;re hesit=
ant on<br>
removing it.<br></blockquote><div>Sometimes,=C2=A0 some &quot;dpu-&gt;core-=
&gt;foo&quot; maybe always need, compatibility will be better.</div><div>eg=
:</div><div><div style=3D"font-family:Consolas;font-size:10pt;color:rgb(0,0=
,0)">
<pre>    <span style=3D"color:rgb(128,0,128)">if</span> (dpu-&gt;glb &amp;&=
amp; dpu-&gt;glb-&gt;power)
        dpu-&gt;glb-&gt;<span style=3D"font-weight:bolder">power</span>(ctx=
, <span style=3D"color:rgb(128,0,128)">true</span>);
    <span style=3D"color:rgb(128,0,128)">if</span> (dpu-&gt;glb &amp;&amp; =
dpu-&gt;glb-&gt;enable)
        dpu-&gt;glb-&gt;<span style=3D"font-weight:bolder">enable</span>(ct=
x);

    <span style=3D"color:rgb(128,0,128)">if</span> (ctx-&gt;is_stopped &amp=
;&amp; dpu-&gt;glb &amp;&amp; dpu-&gt;glb-&gt;reset)
        dpu-&gt;glb-&gt;<span style=3D"font-weight:bolder">reset</span>(ctx=
);

    <span style=3D"color:rgb(128,0,128)">if</span> (dpu-&gt;clk &amp;&amp; =
dpu-&gt;clk-&gt;init)
        dpu-&gt;clk-&gt;<span style=3D"font-weight:bolder">init</span>(ctx)=
;
    <span style=3D"color:rgb(128,0,128)">if</span> (dpu-&gt;clk &amp;&amp; =
dpu-&gt;clk-&gt;enable)
        dpu-&gt;clk-&gt;<span style=3D"font-weight:bolder">enable</span>(ct=
x);

    <span style=3D"color:rgb(128,0,128)">if</span> (dpu-&gt;core &amp;&amp;=
 dpu-&gt;core-&gt;init)
        dpu-&gt;core-&gt;<span style=3D"font-weight:bolder">init</span>(ctx=
);
    <span style=3D"color:rgb(128,0,128)">if</span> (dpu-&gt;core &amp;&amp;=
 dpu-&gt;core-&gt;ifconfig)
        dpu-&gt;core-&gt;<span style=3D"font-weight:bolder">ifconfig</span>=
(ctx);</pre></div></div><div>But here, &quot;dpu-&gt;core-&gt;capability&qu=
ot;, your are right, this always evaluates to true=C2=A0</div><div>
So i will remove the error checking about always being true...<br>&gt; +=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu-&gt;core-&gt;capabi=
lity(&amp;dpu-&gt;ctx, &amp;cap);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0dpu-&gt;layers =3D devm_kcalloc(drm-&gt;de=
v, cap.max_layers,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(struct sprd_dpu_lay=
er), GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!dpu-&gt;layers)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_PTR=
(-ENOMEM);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; cap.max_layers; i++) =
{<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p =3D devm_kza=
lloc(drm-&gt;dev, sizeof(*p), GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!p)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return ERR_PTR(-ENOMEM);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D drm_un=
iversal_plane_init(drm, &amp;p-&gt;plane, 1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &amp;sprd_plane_funcs, cap.fmts_ptr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 cap.fmts_cnt, NULL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 DRM_PLANE_TYPE_PRIMARY, NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (err) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0DRM_ERROR(&quot;fail to init primary plane\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return ERR_PTR(err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_plane_help=
er_add(&amp;p-&gt;plane, &amp;sprd_plane_helper_funcs);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sprd_plane_cre=
ate_properties(p, i);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p-&gt;index =
=3D i;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (i =3D=3D 0=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0primary =3D &amp;p-&gt;plane;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (p)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_INFO(&quot=
;dpu plane init ok\n&quot;);<br>
<br>
This and nearly all the other DRM_INFO() messages look like a debug/develop=
ment<br>
left over. Please remove them - the driver does not need to print when func=
tions<br>
are successfull.<br>
<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return primary;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_crtc_mode_set_nofb(struct drm_crtc *crtc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sprd_dpu *dpu =3D crtc_to_dpu(crtc)=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((dpu-&gt;mode-&gt;hdisplay =3D=3D dpu-=
&gt;mode-&gt;htotal) ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(dpu-&gt;mode-&gt;vdisplay =
=3D=3D dpu-&gt;mode-&gt;vtotal))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu-&gt;ctx.if=
_type =3D SPRD_DISPC_IF_EDPI;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu-&gt;ctx.if=
_type =3D SPRD_DISPC_IF_DPI;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static enum drm_mode_status sprd_crtc_mode_valid(struct drm_crtc *crt=
c,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const=
 struct drm_display_mode *mode)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sprd_dpu *dpu =3D crtc_to_dpu(crtc)=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_INFO(&quot;%s() mode: &quot;DRM_MODE_F=
MT&quot;\n&quot;, __func__, DRM_MODE_ARG(mode));<br>
&gt; +<br>
<br>
If needed, let&#39;s move this to core and make it a debug message. As-is i=
t will<br>
cause spam for no reason.<br>
<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (mode-&gt;type &amp; DRM_MODE_TYPE_DEFA=
ULT)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu-&gt;mode =
=3D (struct drm_display_mode *)mode;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (mode-&gt;type &amp; DRM_MODE_TYPE_PREF=
ERRED) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu-&gt;mode =
=3D (struct drm_display_mode *)mode;<br>
<br>
Casting away the constness is a bad idea.<br>
<br>
Instead, let&#39;s move the if_type decision here, thus we can remove the<b=
r>
nsprd_crtc_mode_set_nofb function? This way we can also remove sprd_dpu::mo=
de.</div><div>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_display_mo=
de_to_videomode(dpu-&gt;mode, &amp;dpu-&gt;ctx.vm);<br>
<br>
Similarly, one could derive the vm based attributes here and remove dpu-&gt=
;ctx.vm.<br>
<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return MODE_OK;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_crtc_atomic_enable(struct drm_crtc *crtc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_crtc_state *ol=
d_state)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sprd_dpu *dpu =3D crtc_to_dpu(crtc)=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_INFO(&quot;%s()\n&quot;, __func__);<br=
>
&gt; +<br>
More sprurious info messages - debug leftover?<br>
<br>
<br>
<br>
&gt; +static int sprd_crtc_enable_vblank(struct drm_crtc *crtc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sprd_dpu *dpu =3D crtc_to_dpu(crtc)=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DEBUG(&quot;%s()\n&quot;, __func__);<b=
r>
&gt; +<br>
Personally, I don&#39;t see the appeal in these debug messages. While a few=
 display<br>
controllers have the odd piece, they are an exception in DRM.<br>
<br>
<br>
<br>
&gt; +static int sprd_crtc_create_properties(struct drm_crtc *crtc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sprd_dpu *dpu =3D crtc_to_dpu(crtc)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *drm =3D dpu-&gt;<a href=
=3D"http://crtc.dev" rel=3D"noreferrer" target=3D"_blank">crtc.dev</a>;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_property *prop;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_property_blob *blob;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t blob_size;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0blob_size =3D strlen(dpu-&gt;ctx.version) =
+ 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0blob =3D drm_property_create_blob(dpu-&gt;=
<a href=3D"http://crtc.dev" rel=3D"noreferrer" target=3D"_blank">crtc.dev</=
a>, blob_size,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0dpu-&gt;ctx.version);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(blob)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quo=
t;drm_property_create_blob dpu version failed\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR=
(blob);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* create dpu version property */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0prop =3D drm_property_create(drm,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_MODE_PROP_=
IMMUTABLE | DRM_MODE_PROP_BLOB,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;dpu vers=
ion&quot;, 0);<br>
<br>
Note: Custom properties should be separate patches. This includes documenta=
tion<br>
why they are needed and references to open-source userspace.</div><div>This=
 only need for our chips, what documentation do we need to provide?</div><d=
iv>
<br>
<br>
HTH<br>
Emil<br>
</div></div></div></div>

--000000000000f2a3dd05a01b5478--

--===============1592030368==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1592030368==--

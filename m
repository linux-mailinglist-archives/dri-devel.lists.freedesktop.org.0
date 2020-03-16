Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE880186CD9
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 15:11:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB5F6E42A;
	Mon, 16 Mar 2020 14:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 265A36E42A
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 14:11:53 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id x206so2617365vsx.5
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 07:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vmP6LOZnzmbhZ1E7QkRmYfL0txRb4enzK6IcGqzjbFw=;
 b=r+wCKtLeaX2msV/Lw55oZPSLxUsQp89t1Jy22xQgvl2undiXizO2cIye2W2k+u4hZs
 buEDPJSKfNgyYyldufoIj7lwgFd+/1x284l0T2S3iuRR7CTgCMF5SG8u+PczRA56cGRI
 mdjUAU/o25sp5wEnKixQ9wPWx0L+liR/ewLcGZT8H6u6w5fBzpyYXSuJYSHNF7NZ0qeK
 RS2o0PJN0Q60xSrA9M3haMly9SVzcs6yJLzfz1fqurCqrPsff4+3YkCrWjz7PBBlBTLO
 xcfu2BYg61vZcLV6ie4y/Z0QyzvZSKR1/fiNGSS6Fjs7qgK/f3WdCrhk4r+ltTIjuWfe
 PC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vmP6LOZnzmbhZ1E7QkRmYfL0txRb4enzK6IcGqzjbFw=;
 b=KPcvMSfSlp20B8pL0FItcdOLQ1gGcJ2BJ+nsrWvFdJsQqNHwVchHw3R8vHOZQrvHK5
 f9h12+LihXiNhGLqOOopGtFO0/0GqsNmyRY1wRVP9slKZmLDajnQRLhmpgmBdvYMLuoy
 3CyLpheMDLzjTIg3B1/jN/gqOMVtCn4WQQjWBPrbuVixSPWVYusxEElNgb0zAtaE5dvN
 lLxnK9p1IflloffbXOraWrdPuqcfNCv32iAwk6escp08+cQg4we2ImkSFxb73WkGS44f
 CygQLKQTeDWhCLbbxWG+PItFyIuDv7VYfP9CBZkf9QTddOukOmB+PJ5VBQN0R6edIr4V
 MNvQ==
X-Gm-Message-State: ANhLgQ33DgNbMSLzFYTfy9qzb5TYirXKfp5zHjFb+u51Uv+LhnqYEQl9
 ozOBOSOIlEmVSdI1XGOJnmZ6957RoCJKwjArxSQ=
X-Google-Smtp-Source: ADFU+vvYZcqplsou0r2MgOptgWp+Jahr0hZYJS8IgSZ5A0eAl8dxf23EpKMZ0OJPV2vY963Dx85MZcOhckdsAoxSGi8=
X-Received: by 2002:a67:8d43:: with SMTP id p64mr17235313vsd.37.1584367911951; 
 Mon, 16 Mar 2020 07:11:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200311145541.29186-1-andrzej.p@collabora.com>
 <20200311145541.29186-7-andrzej.p@collabora.com>
In-Reply-To: <20200311145541.29186-7-andrzej.p@collabora.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 16 Mar 2020 14:10:53 +0000
Message-ID: <CACvgo51t=o2g8SENzqd+2EKbTgE++z5sna8ZFGRrCKfMW2bjyw@mail.gmail.com>
Subject: Re: [PATCHv7 6/6] drm/rockchip: Add support for afbc
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
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
Cc: kernel@collabora.com, Mihail Atanassov <mihail.atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Sandy Huang <hjc@rock-chips.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 James Wang <james.qian.wang@arm.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Ayan Halder <Ayan.Halder@arm.com>, Mark Yao <mark.yao@rock-chips.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 11 Mar 2020 at 14:56, Andrzej Pietrasiewicz
<andrzej.p@collabora.com> wrote:
>
> This patch adds support for afbc handling. afbc is a compressed format
> which reduces the necessary memory bandwidth.
>
> Co-developed-by: Mark Yao <mark.yao@rock-chips.com>
> Signed-off-by: Mark Yao <mark.yao@rock-chips.com>
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.h |   1 +
>  drivers/gpu/drm/rockchip/rockchip_drm_fb.c  |  43 +++++-
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 137 +++++++++++++++++++-
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.h |  17 +++
>  drivers/gpu/drm/rockchip/rockchip_vop_reg.c |  83 +++++++++++-
>  5 files changed, 276 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
> index c5b06048124e..e33c2dcd0d4b 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
> @@ -30,6 +30,7 @@ struct rockchip_crtc_state {
>         int output_mode;
>         int output_bpc;
>         int output_flags;
> +       bool enable_afbc;
>  };
>  #define to_rockchip_crtc_state(s) \
>                 container_of(s, struct rockchip_crtc_state, base)
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> index 221e72e71432..9b13c784b347 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> @@ -57,8 +57,49 @@ static const struct drm_mode_config_helper_funcs rockchip_mode_config_helpers =
>         .atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
>  };
>
> +static struct drm_framebuffer *
> +rockchip_fb_create(struct drm_device *dev, struct drm_file *file,
> +                  const struct drm_mode_fb_cmd2 *mode_cmd)
> +{
> +       struct drm_afbc_framebuffer *afbc_fb;
> +       const struct drm_format_info *info;
> +       int ret;
> +
> +       info = drm_get_format_info(dev, mode_cmd);
> +       if (!info)
> +               return ERR_PTR(-ENOMEM);
> +
> +       afbc_fb = kzalloc(sizeof(*afbc_fb), GFP_KERNEL);
> +       if (!afbc_fb)
> +               return ERR_PTR(-ENOMEM);
> +
> +       ret = drm_gem_fb_init_with_funcs(dev, &afbc_fb->base, file, mode_cmd,
> +                                        &rockchip_drm_fb_funcs);
> +       if (ret) {
> +               kfree(afbc_fb);
> +               return ERR_PTR(ret);
> +       }
> +
> +       if (drm_is_afbc(mode_cmd->modifier[0])) {
> +               int ret, i;
> +
> +               ret = drm_gem_fb_afbc_init(dev, mode_cmd, afbc_fb);
> +               if (ret) {
> +                       struct drm_gem_object **obj = afbc_fb->base.obj;
> +
> +                       for (i = 0; i < info->num_planes; ++i)
> +                               drm_gem_object_put_unlocked(obj[i]);
> +
> +                       kfree(afbc_fb);
> +                       return ERR_PTR(ret);
> +               }
> +       }
> +
> +       return &afbc_fb->base;
> +}
> +
>  static const struct drm_mode_config_funcs rockchip_drm_mode_config_funcs = {
> -       .fb_create = drm_gem_fb_create_with_dirty,
> +       .fb_create = rockchip_fb_create,
>         .output_poll_changed = drm_fb_helper_output_poll_changed,
>         .atomic_check = drm_atomic_helper_check,
>         .atomic_commit = drm_atomic_helper_commit,
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> index cecb2cc781f5..b87d22eb6ae1 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> @@ -91,9 +91,22 @@
>  #define VOP_WIN_TO_INDEX(vop_win) \
>         ((vop_win) - (vop_win)->vop->win)
>
> +#define VOP_AFBC_SET(vop, name, v) \
> +       do { \
> +               if ((vop)->data->afbc) \
> +                       vop_reg_set((vop), &(vop)->data->afbc->name, \
> +                                   0, ~0, v, #name); \
> +       } while (0)
> +
>  #define to_vop(x) container_of(x, struct vop, crtc)
>  #define to_vop_win(x) container_of(x, struct vop_win, base)
>
> +#define AFBC_FMT_RGB565                0x0
> +#define AFBC_FMT_U8U8U8U8      0x5
> +#define AFBC_FMT_U8U8U8                0x4
> +
> +#define AFBC_TILE_16x16                BIT(4)
> +
>  /*
>   * The coefficients of the following matrix are all fixed points.
>   * The format is S2.10 for the 3x3 part of the matrix, and S9.12 for the offsets.
> @@ -274,6 +287,29 @@ static enum vop_data_format vop_convert_format(uint32_t format)
>         }
>  }
>
> +static int vop_convert_afbc_format(uint32_t format)
> +{
> +       switch (format) {
> +       case DRM_FORMAT_XRGB8888:
> +       case DRM_FORMAT_ARGB8888:
> +       case DRM_FORMAT_XBGR8888:
> +       case DRM_FORMAT_ABGR8888:
> +               return AFBC_FMT_U8U8U8U8;
> +       case DRM_FORMAT_RGB888:
> +       case DRM_FORMAT_BGR888:
> +               return AFBC_FMT_U8U8U8;
> +       case DRM_FORMAT_RGB565:
> +       case DRM_FORMAT_BGR565:
> +               return AFBC_FMT_RGB565;
> +       /* either of the below should not be reachable */
> +       default:
> +               DRM_WARN_ONCE("unsupported AFBC format[%08x]\n", format);
> +               return -EINVAL;
> +       }
> +
> +       return -EINVAL;
> +}
> +
>  static uint16_t scl_vop_cal_scale(enum scale_mode mode, uint32_t src,
>                                   uint32_t dst, bool is_horizontal,
>                                   int vsu_mode, int *vskiplines)
> @@ -598,6 +634,17 @@ static int vop_enable(struct drm_crtc *crtc, struct drm_crtc_state *old_state)
>                         vop_win_disable(vop, vop_win);
>                 }
>         }
> +
> +       if (vop->data->afbc) {
> +               struct rockchip_crtc_state *s;
> +               /*
> +                * Disable AFBC and forget there was a vop window with AFBC
> +                */
> +               VOP_AFBC_SET(vop, enable, 0);
> +               s = to_rockchip_crtc_state(crtc->state);
> +               s->enable_afbc = false;
> +       }
> +
>         spin_unlock(&vop->reg_lock);
>
>         vop_cfg_done(vop);
> @@ -710,6 +757,26 @@ static void vop_plane_destroy(struct drm_plane *plane)
>         drm_plane_cleanup(plane);
>  }
>
> +static inline bool rockchip_afbc(u64 modifier)
> +{
> +       return modifier == ROCKCHIP_AFBC_MOD;
> +}
> +
> +static bool rockchip_mod_supported(struct drm_plane *plane,
> +                                  u32 format, u64 modifier)
> +{
> +       if (modifier == DRM_FORMAT_MOD_LINEAR)
> +               return true;
> +
> +       if (!rockchip_afbc(modifier)) {
> +               DRM_DEBUG_KMS("Unsupported format modifer 0x%llx\n", modifier);
> +
> +               return false;
> +       }
> +
> +       return vop_convert_afbc_format(format) >= 0;
> +}
> +
>  static int vop_plane_atomic_check(struct drm_plane *plane,
>                            struct drm_plane_state *state)
>  {
> @@ -758,6 +825,30 @@ static int vop_plane_atomic_check(struct drm_plane *plane,
>                 return -EINVAL;
>         }
>
> +       if (rockchip_afbc(fb->modifier)) {
> +               struct vop *vop = to_vop(crtc);
> +
> +               if (!vop->data->afbc) {
> +                       DRM_ERROR("vop does not support AFBC\n");
> +                       return -EINVAL;
> +               }
> +
> +               ret = vop_convert_afbc_format(fb->format->format);
> +               if (ret < 0)
> +                       return ret;
> +
> +               if (state->src.x1 || state->src.y1) {
> +                       DRM_ERROR("AFBC does not support offset display, xpos=%d, ypos=%d, offset=%d\n", state->src.x1, state->src.y1, fb->offsets[0]);
> +                       return -EINVAL;
> +               }
> +
> +               if (state->rotation && state->rotation != DRM_MODE_ROTATE_0) {
> +                       DRM_ERROR("No rotation support in AFBC, rotation=%d\n",
> +                                 state->rotation);
> +                       return -EINVAL;
> +               }
> +       }
> +
>         return 0;
>  }
>
> @@ -846,6 +937,16 @@ static void vop_plane_atomic_update(struct drm_plane *plane,
>
>         spin_lock(&vop->reg_lock);
>
> +       if (rockchip_afbc(fb->modifier)) {
> +               int afbc_format = vop_convert_afbc_format(fb->format->format);
> +
> +               VOP_AFBC_SET(vop, format, afbc_format | AFBC_TILE_16x16);
> +               VOP_AFBC_SET(vop, hreg_block_split, 0);
> +               VOP_AFBC_SET(vop, win_sel, VOP_WIN_TO_INDEX(vop_win));
> +               VOP_AFBC_SET(vop, hdr_ptr, dma_addr);
> +               VOP_AFBC_SET(vop, pic_size, act_info);
> +       }
> +
>         VOP_WIN_SET(vop, win, format, format);
>         VOP_WIN_SET(vop, win, yrgb_vir, DIV_ROUND_UP(fb->pitches[0], 4));
>         VOP_WIN_SET(vop, win, yrgb_mst, dma_addr);
> @@ -1001,6 +1102,7 @@ static const struct drm_plane_funcs vop_plane_funcs = {
>         .reset = drm_atomic_helper_plane_reset,
>         .atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
>         .atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
> +       .format_mod_supported = rockchip_mod_supported,
>  };
>
>  static int vop_crtc_enable_vblank(struct drm_crtc *crtc)
> @@ -1310,6 +1412,10 @@ static int vop_crtc_atomic_check(struct drm_crtc *crtc,
>                                  struct drm_crtc_state *crtc_state)
>  {
>         struct vop *vop = to_vop(crtc);
> +       struct drm_plane *plane;
> +       struct drm_plane_state *plane_state;
> +       struct rockchip_crtc_state *s;
> +       int afbc_planes = 0;
>
>         if (vop->lut_regs && crtc_state->color_mgmt_changed &&
>             crtc_state->gamma_lut) {
> @@ -1323,6 +1429,27 @@ static int vop_crtc_atomic_check(struct drm_crtc *crtc,
>                 }
>         }
>
> +       drm_atomic_crtc_state_for_each_plane(plane, crtc_state) {
> +               plane_state =
> +                       drm_atomic_get_plane_state(crtc_state->state, plane);
> +               if (IS_ERR(plane_state)) {
> +                       DRM_DEBUG_KMS("Cannot get plane state for plane %s\n",
> +                                     plane->name);
> +                       return PTR_ERR(plane_state);
> +               }
> +
> +               if (drm_is_afbc(plane_state->fb->modifier))
> +                       ++afbc_planes;
> +       }
> +
> +       if (afbc_planes > 1) {
> +               DRM_DEBUG_KMS("Invalid number of AFBC planes; got %d, expected at most 1\n", afbc_planes);
> +               return -EINVAL;
> +       }
> +
> +       s = to_rockchip_crtc_state(crtc_state);
> +       s->enable_afbc = afbc_planes > 0;
> +
>         return 0;
>  }
>
> @@ -1333,6 +1460,7 @@ static void vop_crtc_atomic_flush(struct drm_crtc *crtc,
>         struct drm_plane_state *old_plane_state, *new_plane_state;
>         struct vop *vop = to_vop(crtc);
>         struct drm_plane *plane;
> +       struct rockchip_crtc_state *s;
>         int i;
>
>         if (WARN_ON(!vop->is_enabled))
> @@ -1340,6 +1468,9 @@ static void vop_crtc_atomic_flush(struct drm_crtc *crtc,
>
>         spin_lock(&vop->reg_lock);
>
> +       /* Enable AFBC if there is some AFBC window, disable otherwise. */
> +       s = to_rockchip_crtc_state(crtc->state);
> +       VOP_AFBC_SET(vop, enable, s->enable_afbc);
>         vop_cfg_done(vop);
>
>         spin_unlock(&vop->reg_lock);
> @@ -1634,7 +1765,8 @@ static int vop_create_crtc(struct vop *vop)
>                                                0, &vop_plane_funcs,
>                                                win_data->phy->data_formats,
>                                                win_data->phy->nformats,
> -                                              NULL, win_data->type, NULL);
> +                                              win_data->phy->format_modifiers,
> +                                              win_data->type, NULL);
>                 if (ret) {
>                         DRM_DEV_ERROR(vop->dev, "failed to init plane %d\n",
>                                       ret);
> @@ -1678,7 +1810,8 @@ static int vop_create_crtc(struct vop *vop)
>                                                &vop_plane_funcs,
>                                                win_data->phy->data_formats,
>                                                win_data->phy->nformats,
> -                                              NULL, win_data->type, NULL);
> +                                              win_data->phy->format_modifiers,
> +                                              win_data->type, NULL);
>                 if (ret) {
>                         DRM_DEV_ERROR(vop->dev, "failed to init overlay %d\n",
>                                       ret);
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
> index cc672620d6e0..d03bdb531ef2 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
> @@ -17,6 +17,11 @@
>
>  #define NUM_YUV2YUV_COEFFICIENTS 12
>
> +#define ROCKCHIP_AFBC_MOD \
> +       DRM_FORMAT_MOD_ARM_AFBC( \
> +               AFBC_FORMAT_MOD_BLOCK_SIZE_16x16 | AFBC_FORMAT_MOD_SPARSE \
> +       )
> +
>  enum vop_data_format {
>         VOP_FMT_ARGB8888 = 0,
>         VOP_FMT_RGB888,
> @@ -34,6 +39,16 @@ struct vop_reg {
>         bool relaxed;
>  };
>
> +struct vop_afbc {
> +       struct vop_reg enable;
> +       struct vop_reg win_sel;
> +       struct vop_reg format;
> +       struct vop_reg hreg_block_split;
> +       struct vop_reg pic_size;
> +       struct vop_reg hdr_ptr;
> +       struct vop_reg rstn;
> +};
> +
>  struct vop_modeset {
>         struct vop_reg htotal_pw;
>         struct vop_reg hact_st_end;
> @@ -134,6 +149,7 @@ struct vop_win_phy {
>         const struct vop_scl_regs *scl;
>         const uint32_t *data_formats;
>         uint32_t nformats;
> +       const uint64_t *format_modifiers;
>
>         struct vop_reg enable;
>         struct vop_reg gate;
> @@ -173,6 +189,7 @@ struct vop_data {
>         const struct vop_misc *misc;
>         const struct vop_modeset *modeset;
>         const struct vop_output *output;
> +       const struct vop_afbc *afbc;
>         const struct vop_win_yuv2yuv_data *win_yuv2yuv;
>         const struct vop_win_data *win;
>         unsigned int win_size;
> diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
> index 7a9d979c8d5d..2413deded22c 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
> @@ -50,6 +50,17 @@ static const uint32_t formats_win_full[] = {
>         DRM_FORMAT_NV24,
>  };
>
> +static const uint64_t format_modifiers_win_full[] = {
> +       DRM_FORMAT_MOD_LINEAR,
> +       DRM_FORMAT_MOD_INVALID,
> +};
> +
> +static const uint64_t format_modifiers_win_full_afbc[] = {
> +       ROCKCHIP_AFBC_MOD,
> +       DRM_FORMAT_MOD_LINEAR,
> +       DRM_FORMAT_MOD_INVALID,
> +};
> +
>  static const uint32_t formats_win_lite[] = {
>         DRM_FORMAT_XRGB8888,
>         DRM_FORMAT_ARGB8888,
> @@ -61,6 +72,11 @@ static const uint32_t formats_win_lite[] = {
>         DRM_FORMAT_BGR565,
>  };
>
> +static const uint64_t format_modifiers_win_lite[] = {
> +       DRM_FORMAT_MOD_LINEAR,
> +       DRM_FORMAT_MOD_INVALID,
> +};
> +
>  static const struct vop_scl_regs rk3036_win_scl = {
>         .scale_yrgb_x = VOP_REG(RK3036_WIN0_SCL_FACTOR_YRGB, 0xffff, 0x0),
>         .scale_yrgb_y = VOP_REG(RK3036_WIN0_SCL_FACTOR_YRGB, 0xffff, 16),
> @@ -72,6 +88,7 @@ static const struct vop_win_phy rk3036_win0_data = {
>         .scl = &rk3036_win_scl,
>         .data_formats = formats_win_full,
>         .nformats = ARRAY_SIZE(formats_win_full),
> +       .format_modifiers = format_modifiers_win_full,
>         .enable = VOP_REG(RK3036_SYS_CTRL, 0x1, 0),
>         .format = VOP_REG(RK3036_SYS_CTRL, 0x7, 3),
>         .rb_swap = VOP_REG(RK3036_SYS_CTRL, 0x1, 15),
> @@ -87,6 +104,7 @@ static const struct vop_win_phy rk3036_win0_data = {
>  static const struct vop_win_phy rk3036_win1_data = {
>         .data_formats = formats_win_lite,
>         .nformats = ARRAY_SIZE(formats_win_lite),
> +       .format_modifiers = format_modifiers_win_lite,
>         .enable = VOP_REG(RK3036_SYS_CTRL, 0x1, 1),
>         .format = VOP_REG(RK3036_SYS_CTRL, 0x7, 6),
>         .rb_swap = VOP_REG(RK3036_SYS_CTRL, 0x1, 19),
> @@ -153,6 +171,7 @@ static const struct vop_data rk3036_vop = {
>  static const struct vop_win_phy rk3126_win1_data = {
>         .data_formats = formats_win_lite,
>         .nformats = ARRAY_SIZE(formats_win_lite),
> +       .format_modifiers = format_modifiers_win_lite,
>         .enable = VOP_REG(RK3036_SYS_CTRL, 0x1, 1),
>         .format = VOP_REG(RK3036_SYS_CTRL, 0x7, 6),
>         .rb_swap = VOP_REG(RK3036_SYS_CTRL, 0x1, 19),
> @@ -234,6 +253,7 @@ static const struct vop_win_phy px30_win0_data = {
>         .scl = &px30_win_scl,
>         .data_formats = formats_win_full,
>         .nformats = ARRAY_SIZE(formats_win_full),
> +       .format_modifiers = format_modifiers_win_full,
>         .enable = VOP_REG(PX30_WIN0_CTRL0, 0x1, 0),
>         .format = VOP_REG(PX30_WIN0_CTRL0, 0x7, 1),
>         .rb_swap = VOP_REG(PX30_WIN0_CTRL0, 0x1, 12),
> @@ -249,6 +269,7 @@ static const struct vop_win_phy px30_win0_data = {
>  static const struct vop_win_phy px30_win1_data = {
>         .data_formats = formats_win_lite,
>         .nformats = ARRAY_SIZE(formats_win_lite),
> +       .format_modifiers = format_modifiers_win_lite,
>         .enable = VOP_REG(PX30_WIN1_CTRL0, 0x1, 0),
>         .format = VOP_REG(PX30_WIN1_CTRL0, 0x7, 4),
>         .rb_swap = VOP_REG(PX30_WIN1_CTRL0, 0x1, 12),
> @@ -261,6 +282,7 @@ static const struct vop_win_phy px30_win1_data = {
>  static const struct vop_win_phy px30_win2_data = {
>         .data_formats = formats_win_lite,
>         .nformats = ARRAY_SIZE(formats_win_lite),
> +       .format_modifiers = format_modifiers_win_lite,
>         .gate = VOP_REG(PX30_WIN2_CTRL0, 0x1, 4),
>         .enable = VOP_REG(PX30_WIN2_CTRL0, 0x1, 0),
>         .format = VOP_REG(PX30_WIN2_CTRL0, 0x3, 5),
> @@ -316,6 +338,7 @@ static const struct vop_win_phy rk3066_win0_data = {
>         .scl = &rk3066_win_scl,
>         .data_formats = formats_win_full,
>         .nformats = ARRAY_SIZE(formats_win_full),
> +       .format_modifiers = format_modifiers_win_full,
>         .enable = VOP_REG(RK3066_SYS_CTRL1, 0x1, 0),
>         .format = VOP_REG(RK3066_SYS_CTRL0, 0x7, 4),
>         .rb_swap = VOP_REG(RK3066_SYS_CTRL0, 0x1, 19),
> @@ -332,6 +355,7 @@ static const struct vop_win_phy rk3066_win1_data = {
>         .scl = &rk3066_win_scl,
>         .data_formats = formats_win_full,
>         .nformats = ARRAY_SIZE(formats_win_full),
> +       .format_modifiers = format_modifiers_win_full,
>         .enable = VOP_REG(RK3066_SYS_CTRL1, 0x1, 1),
>         .format = VOP_REG(RK3066_SYS_CTRL0, 0x7, 7),
>         .rb_swap = VOP_REG(RK3066_SYS_CTRL0, 0x1, 23),
> @@ -347,6 +371,7 @@ static const struct vop_win_phy rk3066_win1_data = {
>  static const struct vop_win_phy rk3066_win2_data = {
>         .data_formats = formats_win_lite,
>         .nformats = ARRAY_SIZE(formats_win_lite),
> +       .format_modifiers = format_modifiers_win_lite,
>         .enable = VOP_REG(RK3066_SYS_CTRL1, 0x1, 2),
>         .format = VOP_REG(RK3066_SYS_CTRL0, 0x7, 10),
>         .rb_swap = VOP_REG(RK3066_SYS_CTRL0, 0x1, 27),
> @@ -426,6 +451,7 @@ static const struct vop_win_phy rk3188_win0_data = {
>         .scl = &rk3188_win_scl,
>         .data_formats = formats_win_full,
>         .nformats = ARRAY_SIZE(formats_win_full),
> +       .format_modifiers = format_modifiers_win_full,
>         .enable = VOP_REG(RK3188_SYS_CTRL, 0x1, 0),
>         .format = VOP_REG(RK3188_SYS_CTRL, 0x7, 3),
>         .rb_swap = VOP_REG(RK3188_SYS_CTRL, 0x1, 15),
> @@ -440,6 +466,7 @@ static const struct vop_win_phy rk3188_win0_data = {
>  static const struct vop_win_phy rk3188_win1_data = {
>         .data_formats = formats_win_lite,
>         .nformats = ARRAY_SIZE(formats_win_lite),
> +       .format_modifiers = format_modifiers_win_lite,
>         .enable = VOP_REG(RK3188_SYS_CTRL, 0x1, 1),
>         .format = VOP_REG(RK3188_SYS_CTRL, 0x7, 6),
>         .rb_swap = VOP_REG(RK3188_SYS_CTRL, 0x1, 19),
> @@ -545,6 +572,7 @@ static const struct vop_win_phy rk3288_win01_data = {
>         .scl = &rk3288_win_full_scl,
>         .data_formats = formats_win_full,
>         .nformats = ARRAY_SIZE(formats_win_full),
> +       .format_modifiers = format_modifiers_win_full,
>         .enable = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 0),
>         .format = VOP_REG(RK3288_WIN0_CTRL0, 0x7, 1),
>         .rb_swap = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 12),
> @@ -563,6 +591,7 @@ static const struct vop_win_phy rk3288_win01_data = {
>  static const struct vop_win_phy rk3288_win23_data = {
>         .data_formats = formats_win_lite,
>         .nformats = ARRAY_SIZE(formats_win_lite),
> +       .format_modifiers = format_modifiers_win_lite,
>         .enable = VOP_REG(RK3288_WIN2_CTRL0, 0x1, 4),
>         .gate = VOP_REG(RK3288_WIN2_CTRL0, 0x1, 0),
>         .format = VOP_REG(RK3288_WIN2_CTRL0, 0x7, 1),
> @@ -677,6 +706,7 @@ static const struct vop_win_phy rk3368_win01_data = {
>         .scl = &rk3288_win_full_scl,
>         .data_formats = formats_win_full,
>         .nformats = ARRAY_SIZE(formats_win_full),
> +       .format_modifiers = format_modifiers_win_full,
>         .enable = VOP_REG(RK3368_WIN0_CTRL0, 0x1, 0),
>         .format = VOP_REG(RK3368_WIN0_CTRL0, 0x7, 1),
>         .rb_swap = VOP_REG(RK3368_WIN0_CTRL0, 0x1, 12),
> @@ -697,6 +727,7 @@ static const struct vop_win_phy rk3368_win01_data = {
>  static const struct vop_win_phy rk3368_win23_data = {
>         .data_formats = formats_win_lite,
>         .nformats = ARRAY_SIZE(formats_win_lite),
> +       .format_modifiers = format_modifiers_win_lite,
>         .gate = VOP_REG(RK3368_WIN2_CTRL0, 0x1, 0),
>         .enable = VOP_REG(RK3368_WIN2_CTRL0, 0x1, 4),
>         .format = VOP_REG(RK3368_WIN2_CTRL0, 0x3, 5),
> @@ -817,6 +848,53 @@ static const struct vop_win_yuv2yuv_data rk3399_vop_big_win_yuv2yuv_data[] = {
>           .y2r_en = VOP_REG(RK3399_YUV2YUV_WIN, 0x1, 9) },
>         { .base = 0xC0, .phy = &rk3399_yuv2yuv_win23_data },
>         { .base = 0x120, .phy = &rk3399_yuv2yuv_win23_data },
> +
> +};
> +
> +static const struct vop_win_phy rk3399_win01_data = {
> +       .scl = &rk3288_win_full_scl,
> +       .data_formats = formats_win_full,
> +       .nformats = ARRAY_SIZE(formats_win_full),
> +       .format_modifiers = format_modifiers_win_full_afbc,
> +       .enable = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 0),
> +       .format = VOP_REG(RK3288_WIN0_CTRL0, 0x7, 1),
> +       .rb_swap = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 12),
> +       .y_mir_en = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 22),
> +       .act_info = VOP_REG(RK3288_WIN0_ACT_INFO, 0x1fff1fff, 0),
> +       .dsp_info = VOP_REG(RK3288_WIN0_DSP_INFO, 0x0fff0fff, 0),
> +       .dsp_st = VOP_REG(RK3288_WIN0_DSP_ST, 0x1fff1fff, 0),
> +       .yrgb_mst = VOP_REG(RK3288_WIN0_YRGB_MST, 0xffffffff, 0),
> +       .uv_mst = VOP_REG(RK3288_WIN0_CBR_MST, 0xffffffff, 0),
> +       .yrgb_vir = VOP_REG(RK3288_WIN0_VIR, 0x3fff, 0),
> +       .uv_vir = VOP_REG(RK3288_WIN0_VIR, 0x3fff, 16),
> +       .src_alpha_ctl = VOP_REG(RK3288_WIN0_SRC_ALPHA_CTRL, 0xff, 0),
> +       .dst_alpha_ctl = VOP_REG(RK3288_WIN0_DST_ALPHA_CTRL, 0xff, 0),
> +};
> +
> +/*
> + * rk3399 vop big windows register layout is same as rk3288, but we
> + * have a separate rk3399 win data array here so that we can advertise
> + * AFBC on the primary plane.
> + */
> +static const struct vop_win_data rk3399_vop_win_data[] = {
> +       { .base = 0x00, .phy = &rk3399_win01_data,
> +         .type = DRM_PLANE_TYPE_PRIMARY },
> +       { .base = 0x40, .phy = &rk3288_win01_data,
> +         .type = DRM_PLANE_TYPE_OVERLAY },
> +       { .base = 0x00, .phy = &rk3288_win23_data,
> +         .type = DRM_PLANE_TYPE_OVERLAY },
> +       { .base = 0x50, .phy = &rk3288_win23_data,
> +         .type = DRM_PLANE_TYPE_CURSOR },
> +};
> +
> +static const struct vop_afbc rk3399_vop_afbc = {
> +       .rstn = VOP_REG(RK3399_AFBCD0_CTRL, 0x1, 3),
> +       .enable = VOP_REG(RK3399_AFBCD0_CTRL, 0x1, 0),
> +       .win_sel = VOP_REG(RK3399_AFBCD0_CTRL, 0x3, 1),
> +       .format = VOP_REG(RK3399_AFBCD0_CTRL, 0x1f, 16),
> +       .hreg_block_split = VOP_REG(RK3399_AFBCD0_CTRL, 0x1, 21),
> +       .hdr_ptr = VOP_REG(RK3399_AFBCD0_HDR_PTR, 0xffffffff, 0),
> +       .pic_size = VOP_REG(RK3399_AFBCD0_PIC_SIZE, 0xffffffff, 0),
>  };
>
>  static const struct vop_data rk3399_vop_big = {
> @@ -826,9 +904,10 @@ static const struct vop_data rk3399_vop_big = {
>         .common = &rk3288_common,
>         .modeset = &rk3288_modeset,
>         .output = &rk3399_output,
> +       .afbc = &rk3399_vop_afbc,
>         .misc = &rk3368_misc,
> -       .win = rk3368_vop_win_data,
> -       .win_size = ARRAY_SIZE(rk3368_vop_win_data),
> +       .win = rk3399_vop_win_data,
> +       .win_size = ARRAY_SIZE(rk3399_vop_win_data),
>         .win_yuv2yuv = rk3399_vop_big_win_yuv2yuv_data,
>  };
>
> --
> 2.17.1

Heiko, Sandy, being the maintainers of the Rockchip driver, can you
review/ack this patch?

I believe the intention is to merge the series via drm-misc. Andrzej
already has commit access.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

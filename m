Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B11F467F0C7
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 23:00:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FABD10E1B5;
	Fri, 27 Jan 2023 22:00:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1436110E1B5
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 22:00:04 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id z1so1202185pfg.12
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 14:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MleSlqBPzFKRTf0US9J7uS09Y4mRHY0IjYS38IETijI=;
 b=TLB5hNxOR2xyTyxf7MbSt2T/+KpFqPHhG9dEJqdzJDYEck7/RRGajp4K0DRMB7PTD1
 ZLLoZMCgjtSlnaHz1HH+kwPCxtg2vlT5UVodT7vraT/MIwZ7to1Dt4MvCnFnQ0tpF/jq
 31lQ9EXgNn4/EOVm/OYEZFprXXl5XCpIMuFEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MleSlqBPzFKRTf0US9J7uS09Y4mRHY0IjYS38IETijI=;
 b=p5Zt7Lf+249HS1Z8qU7FCKxDFmBgk6ggUBjHCKyqCNLP++h++ty+iuaxql77dDsjBI
 k5dd+P17XRICfYKocGO2c54hY6r+PGhLwQn8hHLbzb7Nt4x+v7Mh9Lro1NBrOOFsM5Gy
 PrRn7ckXQdQjde0DzPZNbXs2jUw4QyfPta2bBhqPjbTiZNSZSXvndNncodJTWN3+HlT0
 4uEP5eFx93bvz2rwilzWe/yOwGp1whcDR3e9I3U4+9kqwRmykp6O5DxywB9rNw5YDhdw
 OCmC2xqCoLNyKkRZTbkK+FoD6HXZsOaximo5YAvwaoAksj4T4qHa5yib6/i7TKqfkbrc
 Srqg==
X-Gm-Message-State: AO0yUKX1Jnv+p5MK9iM9SAYZdEFOnV8c38bBcgyEh1bJOZO1CfxXjtRp
 ay4SFQEhS7bd6VuGs6cTYM46W7aC6WGQhxqUVjEipw==
X-Google-Smtp-Source: AK7set+/wUE6nxoSYvbFiYWaYD+msKqtbVD4fY7+bMCU9kBMQDGJ3dZ0UGXXl5gFzgzMK/29iCDajl2pXRH4UlA5mQI=
X-Received: by 2002:a63:5418:0:b0:4d7:fc60:7ec1 with SMTP id
 i24-20020a635418000000b004d7fc607ec1mr1887297pgb.106.1674856803489; Fri, 27
 Jan 2023 14:00:03 -0800 (PST)
MIME-Version: 1.0
References: <20230110204742.1354797-1-greenjustin@chromium.org>
 <CAAOTY_8iPJAku-SGgd3NoHA8LOWbXiKfNtfVt_oGuEJqA-=Q-w@mail.gmail.com>
In-Reply-To: <CAAOTY_8iPJAku-SGgd3NoHA8LOWbXiKfNtfVt_oGuEJqA-=Q-w@mail.gmail.com>
From: Justin Green <greenjustin@chromium.org>
Date: Fri, 27 Jan 2023 16:59:52 -0500
Message-ID: <CAHC42RdnQ_=XzufhQRonYE3mM+Nr_dO+x2PiS+7Ad-pN5pz0cA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: Add support for AR30 and BA30
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
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
Cc: airlied@linux.ie, jason-jh.lin@mediatek.com, justin.yeh@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for the suggestion! That's a lot cleaner than manually
traversing the device tree. Will send out another patch.

On Thu, Jan 26, 2023 at 7:36 PM Chun-Kuang Hu <chunkuang.hu@kernel.org> wro=
te:
>
> Hi, Justin:
>
> Justin Green <greenjustin@chromium.org> =E6=96=BC 2023=E5=B9=B41=E6=9C=88=
11=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=884:47=E5=AF=AB=E9=81=93=EF=
=BC=9A
> >
> > Add support for AR30 and BA30 pixel formats to the Mediatek DRM driver.
> >
> > Tested using "modetest -P" on an MT8195.
> >
> > Signed-off-by: Justin Green <greenjustin@chromium.org>
> > ---
> > v2:
> >  * Rebase and resolve merge conflicts with the AFBC patch.
> >
> >  drivers/gpu/drm/mediatek/mtk_disp_ovl.c  | 28 +++++++++++++++++
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c  | 19 +++++++++++-
> >  drivers/gpu/drm/mediatek/mtk_drm_plane.c | 39 +++++++++++++++++++++---
> >  drivers/gpu/drm/mediatek/mtk_drm_plane.h |  2 +-
> >  4 files changed, 81 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/=
mediatek/mtk_disp_ovl.c
> > index 84daeaffab6a..667ae57c8754 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > @@ -41,6 +41,7 @@
> >  #define DISP_REG_OVL_RDMA_CTRL(n)              (0x00c0 + 0x20 * (n))
> >  #define DISP_REG_OVL_RDMA_GMC(n)               (0x00c8 + 0x20 * (n))
> >  #define DISP_REG_OVL_ADDR_MT2701               0x0040
> > +#define DISP_REG_OVL_CLRFMT_EXT                        0x02D0
> >  #define DISP_REG_OVL_ADDR_MT8173               0x0f40
> >  #define DISP_REG_OVL_ADDR(ovl, n)              ((ovl)->data->addr + 0x=
20 * (n))
> >  #define DISP_REG_OVL_HDR_ADDR(ovl, n)          ((ovl)->data->addr + 0x=
20 * (n) + 0x04)
> > @@ -61,6 +62,10 @@
> >                                         0 : OVL_CON_CLRFMT_RGB)
> >  #define OVL_CON_CLRFMT_RGB888(ovl)     ((ovl)->data->fmt_rgb565_is_0 ?=
 \
> >                                         OVL_CON_CLRFMT_RGB : 0)
> > +#define OVL_CON_CLRFMT_BIT_DEPTH_MASK(ovl)     (0xFF << 4 * (ovl))
> > +#define OVL_CON_CLRFMT_BIT_DEPTH(depth, ovl)   (depth << 4 * (ovl))
> > +#define OVL_CON_CLRFMT_8_BIT                   0x00
> > +#define OVL_CON_CLRFMT_10_BIT                  0x01
> >  #define        OVL_CON_AEN             BIT(8)
> >  #define        OVL_CON_ALPHA           0xff
> >  #define        OVL_CON_VIRT_FLIP       BIT(9)
> > @@ -188,6 +193,26 @@ static void mtk_ovl_set_afbc(struct mtk_disp_ovl *=
ovl, struct cmdq_pkt *cmdq_pkt
> >                            DISP_REG_OVL_DATAPATH_CON, OVL_LAYER_AFBC_EN=
(idx));
> >  }
> >
> > +static void mtk_ovl_set_bit_depth(struct device *dev, int idx, u32 for=
mat,
> > +                                 struct cmdq_pkt *cmdq_pkt)
> > +{
> > +       struct mtk_disp_ovl *ovl =3D dev_get_drvdata(dev);
> > +       unsigned int reg;
> > +       unsigned int bit_depth =3D OVL_CON_CLRFMT_8_BIT;
> > +
> > +       reg =3D readl(ovl->regs + DISP_REG_OVL_CLRFMT_EXT);
> > +       reg &=3D ~OVL_CON_CLRFMT_BIT_DEPTH_MASK(idx);
> > +
> > +       if (format =3D=3D DRM_FORMAT_RGBA1010102 ||
> > +           format =3D=3D DRM_FORMAT_BGRA1010102 ||
> > +           format =3D=3D DRM_FORMAT_ARGB2101010)
> > +               bit_depth =3D OVL_CON_CLRFMT_10_BIT;
> > +
> > +       reg |=3D OVL_CON_CLRFMT_BIT_DEPTH(bit_depth, idx);
> > +
> > +       mtk_ddp_write(cmdq_pkt, reg, &ovl->cmdq_reg, ovl->regs, DISP_RE=
G_OVL_CLRFMT_EXT);
> > +}
> > +
> >  void mtk_ovl_config(struct device *dev, unsigned int w,
> >                     unsigned int h, unsigned int vrefresh,
> >                     unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> > @@ -302,9 +327,11 @@ static unsigned int ovl_fmt_convert(struct mtk_dis=
p_ovl *ovl, unsigned int fmt)
> >                 return OVL_CON_CLRFMT_ARGB8888;
> >         case DRM_FORMAT_BGRX8888:
> >         case DRM_FORMAT_BGRA8888:
> > +       case DRM_FORMAT_BGRA1010102:
> >                 return OVL_CON_CLRFMT_ARGB8888 | OVL_CON_BYTE_SWAP;
> >         case DRM_FORMAT_XRGB8888:
> >         case DRM_FORMAT_ARGB8888:
> > +       case DRM_FORMAT_ARGB2101010:
> >                 return OVL_CON_CLRFMT_RGBA8888;
> >         case DRM_FORMAT_XBGR8888:
> >         case DRM_FORMAT_ABGR8888:
> > @@ -388,6 +415,7 @@ void mtk_ovl_layer_config(struct device *dev, unsig=
ned int idx,
> >                                       &ovl->cmdq_reg, ovl->regs, DISP_R=
EG_OVL_PITCH_MSB(idx));
> >         }
> >
> > +       mtk_ovl_set_bit_depth(dev, idx, fmt, cmdq_pkt);
> >         mtk_ovl_layer_on(dev, idx, cmdq_pkt);
> >  }
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/=
mediatek/mtk_drm_crtc.c
> > index 112615817dcb..d50379c97c4b 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > @@ -842,6 +842,21 @@ enum drm_plane_type mtk_drm_crtc_plane_type(unsign=
ed int plane_idx,
> >
> >  }
> >
> > +static const char *ovls_with_10bit_cap[] =3D {
> > +       "mediatek,mt8195-disp-ovl",
> > +};
> > +
> > +static bool is_10bit_cap_device(void)
> > +{
> > +       for (int i =3D 0; i < ARRAY_SIZE(ovls_with_10bit_cap); i++) {
> > +               if (of_find_compatible_node(NULL, NULL,
> > +                                           ovls_with_10bit_cap[i]))
> > +                       return true;
> > +       }
> > +
> > +       return false;
> > +}
> > +
> >  static int mtk_drm_crtc_init_comp_planes(struct drm_device *drm_dev,
> >                                          struct mtk_drm_crtc *mtk_crtc,
> >                                          int comp_idx, int pipe)
> > @@ -849,6 +864,7 @@ static int mtk_drm_crtc_init_comp_planes(struct drm=
_device *drm_dev,
> >         int num_planes =3D mtk_drm_crtc_num_comp_planes(mtk_crtc, comp_=
idx);
> >         struct mtk_ddp_comp *comp =3D mtk_crtc->ddp_comp[comp_idx];
> >         int i, ret;
> > +       bool supports_10bit =3D is_10bit_cap_device();
> >
> >         for (i =3D 0; i < num_planes; i++) {
> >                 ret =3D mtk_plane_init(drm_dev,
> > @@ -856,7 +872,8 @@ static int mtk_drm_crtc_init_comp_planes(struct drm=
_device *drm_dev,
> >                                 BIT(pipe),
> >                                 mtk_drm_crtc_plane_type(mtk_crtc->layer=
_nr,
> >                                                         num_planes),
> > -                               mtk_ddp_comp_supported_rotations(comp))=
;
> > +                               mtk_ddp_comp_supported_rotations(comp),
> > +                               supports_10bit);
> >                 if (ret)
> >                         return ret;
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm=
/mediatek/mtk_drm_plane.c
> > index d54fbf34b000..7fe5c47b4d50 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> > @@ -12,6 +12,8 @@
> >  #include <drm/drm_framebuffer.h>
> >  #include <drm/drm_gem_atomic_helper.h>
> >  #include <linux/align.h>
> > +#include <drm/drm_plane_helper.h>
> > +#include <linux/of.h>
> >
> >  #include "mtk_drm_crtc.h"
> >  #include "mtk_drm_ddp_comp.h"
> > @@ -19,7 +21,7 @@
> >  #include "mtk_drm_gem.h"
> >  #include "mtk_drm_plane.h"
> >
> > -static const u32 formats[] =3D {
> > +static const u32 default_formats[] =3D {
> >         DRM_FORMAT_XRGB8888,
> >         DRM_FORMAT_ARGB8888,
> >         DRM_FORMAT_BGRX8888,
> > @@ -41,6 +43,22 @@ static const u64 modifiers[] =3D {
> >         DRM_FORMAT_MOD_INVALID,
> >  };
> >
> > +static const u32 formats_with_10bit_cap[] =3D {
> > +       DRM_FORMAT_XRGB8888,
> > +       DRM_FORMAT_ARGB8888,
> > +       DRM_FORMAT_ARGB2101010,
> > +       DRM_FORMAT_BGRX8888,
> > +       DRM_FORMAT_BGRA8888,
> > +       DRM_FORMAT_BGRA1010102,
> > +       DRM_FORMAT_ABGR8888,
> > +       DRM_FORMAT_XBGR8888,
> > +       DRM_FORMAT_RGB888,
> > +       DRM_FORMAT_BGR888,
> > +       DRM_FORMAT_RGB565,
> > +       DRM_FORMAT_UYVY,
> > +       DRM_FORMAT_YUYV,
> > +};
>
> I would like to move these array to ovl/rdma driver and query these
> array with ovl/rdma driver (struct mtk_ddp_comp *comp in
> mtk_drm_crtc_init_comp_planes()).
>
> Regards,
> Chun-Kuang.
>
> > +
> >  static void mtk_plane_reset(struct drm_plane *plane)
> >  {
> >         struct mtk_plane_state *state;
> > @@ -315,13 +333,24 @@ static const struct drm_plane_helper_funcs mtk_pl=
ane_helper_funcs =3D {
> >
> >  int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
> >                    unsigned long possible_crtcs, enum drm_plane_type ty=
pe,
> > -                  unsigned int supported_rotations)
> > +                  unsigned int supported_rotations, bool supports_10bi=
t)
> >  {
> >         int err;
> >
> > -       err =3D drm_universal_plane_init(dev, plane, possible_crtcs,
> > -                                      &mtk_plane_funcs, formats,
> > -                                      ARRAY_SIZE(formats), modifiers, =
type, NULL);
> > +       if (supports_10bit) {
> > +               err =3D drm_universal_plane_init(dev, plane, possible_c=
rtcs,
> > +                                              &mtk_plane_funcs,
> > +                                              formats_with_10bit_cap,
> > +                                              ARRAY_SIZE(formats_with_=
10bit_cap),
> > +                                              modifiers, type, NULL);
> > +       } else {
> > +               err =3D drm_universal_plane_init(dev, plane, possible_c=
rtcs,
> > +                                              &mtk_plane_funcs,
> > +                                              default_formats,
> > +                                              ARRAY_SIZE(default_forma=
ts),
> > +                                              modifiers, type, NULL);
> > +       }
> > +
> >         if (err) {
> >                 DRM_ERROR("failed to initialize plane\n");
> >                 return err;
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.h b/drivers/gpu/drm=
/mediatek/mtk_drm_plane.h
> > index 8f39011cdbfc..d3e6f29a1e25 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> > @@ -48,6 +48,6 @@ to_mtk_plane_state(struct drm_plane_state *state)
> >
> >  int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
> >                    unsigned long possible_crtcs, enum drm_plane_type ty=
pe,
> > -                  unsigned int supported_rotations);
> > +                  unsigned int supported_rotations, bool supports_10bi=
t);
> >
> >  #endif
> > --
> > 2.39.0.314.g84b9a713c41-goog
> >

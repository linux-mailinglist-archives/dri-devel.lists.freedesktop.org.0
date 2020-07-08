Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D0B217D82
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 05:22:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 120196E850;
	Wed,  8 Jul 2020 03:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF1D66E84E;
 Wed,  8 Jul 2020 03:22:47 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id 133so4330869ybu.7;
 Tue, 07 Jul 2020 20:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ABQG2oadx0VCp89OceBbcXp6yzUWBQHoxJqUgABMtqo=;
 b=hPnsVq2+1w2ASc44yTlzbbm2HIXKjHXMOkZ/d9w3MO9Xvl+XRBkzhDI3Zd3O9Lda3t
 opWhWc00iOl+gGBKjREX7uwXRX9K8LGvY6Ai+QqHRkNK638yHQrV7vHx5pQvuvbpSONK
 ahjTFSIJ8by6Hcj+/+y79N7HQMa4UZRyV7qaOeLkuLHMcHYQYx3rgB3NXf22PoBI+zrU
 3JjN9rkrmumH0sgjpGGISdUp4WDSlcZgCcf/94mtqhYjCQpvAnZrp93omVC4/5MZYjVf
 IjZoiNBtF9Y97fQDjhrbg+Ms/7kAYv8K5Qk9LPU+OJU8l7Q/zqzCpQ8IOt7hC+BYeITd
 VCLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ABQG2oadx0VCp89OceBbcXp6yzUWBQHoxJqUgABMtqo=;
 b=R235gUceXQYmb6w8DDYPFJqX1qBpzs8OsWxlE5HY6+AKWR9X3ZlWpx+gST4GbY0wEj
 FbmiuazzgkQKqY6apfq7ntjpzkPI82zA7JfCZw6dN78tytO2VkBXcRmmGe48fI+9cLqn
 nwZmrAwKm3pv9uqf1K8GtSVVEm1qxWN87gYfdow+buZEB11nwjMMetl4dvA4LJoxF9Y5
 6Rpl1VSlj0GNtF6LZkZJky9G9GkwcEAER3DtivX8jNNeruZrx/zwdLE5QZzQC29dCjEj
 E1Xec5+WVwVR5JK5uT90vdC/4Tprlb95WBd0s3gCy+SvBW/Q4HLA/EumOeBXLLxDxuzm
 AEFw==
X-Gm-Message-State: AOAM533wPQjTLiN+UG2RoEoVAw+kmvl5XlJH4ANdFL3BpM5g49X9ySXs
 XgLiluZksm29XjzkP/4eDqrUT0g82lsA8sZUKnc=
X-Google-Smtp-Source: ABdhPJzGTCsJKb78k2k1arIKwlGc8x5TR/DquAelbv8xv7aZAf53QVEHOuGaOwVEqJ4Ev0bFrmrmOEpKPNfJO8DzwYw=
X-Received: by 2002:a25:70c2:: with SMTP id l185mr31366508ybc.83.1594178567010; 
 Tue, 07 Jul 2020 20:22:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200707173628.GA29695@embeddedor>
In-Reply-To: <20200707173628.GA29695@embeddedor>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Wed, 8 Jul 2020 13:22:35 +1000
Message-ID: <CACAvsv4ahps=4gWwGXwvHFZOTBg1ubW86t3++dN4fAJ6JsBhDw@mail.gmail.com>
Subject: Re: [PATCH][next] drm/nouveau: Use fallthrough pseudo-keyword
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>, ML nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 8 Jul 2020 at 03:31, Gustavo A. R. Silva <gustavoars@kernel.org> wrote:
>
> Replace the existing /* fall through */ comments and its variants with
> the new pseudo-keyword macro fallthrough[1]. Also, remove unnecessary
> fall-through markings when it is the case.
I really like this!  I was not a fan of explicitly marking those with comments.

Thank you, taken in my tree.
Ben.

>
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through
>
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c            |    2 -
>  drivers/gpu/drm/nouveau/nouveau_bo.c               |    2 -
>  drivers/gpu/drm/nouveau/nouveau_connector.c        |    4 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmi.c    |   34 ++++++++++-----------
>  drivers/gpu/drm/nouveau/nvkm/engine/dma/usernv04.c |    2 -
>  drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv04.c    |    4 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv40.c    |    2 -
>  drivers/gpu/drm/nouveau/nvkm/subdev/bios/dcb.c     |    2 -
>  drivers/gpu/drm/nouveau/nvkm/subdev/bios/dp.c      |    2 -
>  drivers/gpu/drm/nouveau/nvkm/subdev/bios/perf.c    |    2 -
>  drivers/gpu/drm/nouveau/nvkm/subdev/bios/pll.c     |    2 -
>  drivers/gpu/drm/nouveau/nvkm/subdev/bios/timing.c  |   10 +++---
>  drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c     |    2 -
>  drivers/gpu/drm/nouveau/nvkm/subdev/clk/mcp77.c    |    2 -
>  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv04.c |   12 +++----
>  drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv40.c   |    4 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/mxm/nv50.c     |    2 -
>  17 files changed, 45 insertions(+), 45 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index d472942102f5..ee365f31056b 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -932,7 +932,7 @@ nv50_dp_bpc_to_depth(unsigned int bpc)
>         switch (bpc) {
>         case  6: return 0x2;
>         case  8: return 0x5;
> -       case 10: /* fall-through */
> +       case 10: fallthrough;
>         default: return 0x6;
>         }
>  }
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index c40f127de3d0..00581e6d183f 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -1458,7 +1458,7 @@ nouveau_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_mem_reg *reg)
>                 if (drm->client.mem->oclass < NVIF_CLASS_MEM_NV50 || !mem->kind)
>                         /* untiled */
>                         break;
> -               /* fall through - tiled memory */
> +               fallthrough;    /* tiled memory */
>         case TTM_PL_VRAM:
>                 reg->bus.offset = reg->start << PAGE_SHIFT;
>                 reg->bus.base = device->func->resource_addr(device, 1);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
> index 1b383ae0248f..ae3b3002d737 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -331,7 +331,7 @@ nouveau_conn_attach_properties(struct drm_connector *connector)
>         case DRM_MODE_CONNECTOR_VGA:
>                 if (disp->disp.object.oclass < NV50_DISP)
>                         break; /* Can only scale on DFPs. */
> -               /* Fall-through. */
> +               fallthrough;
>         default:
>                 drm_object_attach_property(&connector->base, dev->mode_config.
>                                            scaling_mode_property,
> @@ -446,7 +446,7 @@ nouveau_connector_ddc_detect(struct drm_connector *connector)
>                 case DCB_OUTPUT_LVDS:
>                         switcheroo_ddc = !!(vga_switcheroo_handler_flags() &
>                                             VGA_SWITCHEROO_CAN_SWITCH_DDC);
> -               /* fall-through */
> +                       fallthrough;
>                 default:
>                         if (!nv_encoder->i2c)
>                                 break;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmi.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmi.c
> index 7147dc6d9018..1ccfc8314812 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmi.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmi.c
> @@ -23,55 +23,55 @@ void pack_hdmi_infoframe(struct packed_hdmi_infoframe *packed_frame,
>                  */
>         case 17:
>                 subpack1_high = (raw_frame[16] << 16);
> -               /* fall through */
> +               fallthrough;
>         case 16:
>                 subpack1_high |= (raw_frame[15] << 8);
> -               /* fall through */
> +               fallthrough;
>         case 15:
>                 subpack1_high |= raw_frame[14];
> -               /* fall through */
> +               fallthrough;
>         case 14:
>                 subpack1_low = (raw_frame[13] << 24);
> -               /* fall through */
> +               fallthrough;
>         case 13:
>                 subpack1_low |= (raw_frame[12] << 16);
> -               /* fall through */
> +               fallthrough;
>         case 12:
>                 subpack1_low |= (raw_frame[11] << 8);
> -               /* fall through */
> +               fallthrough;
>         case 11:
>                 subpack1_low |= raw_frame[10];
> -               /* fall through */
> +               fallthrough;
>         case 10:
>                 subpack0_high = (raw_frame[9] << 16);
> -               /* fall through */
> +               fallthrough;
>         case 9:
>                 subpack0_high |= (raw_frame[8] << 8);
> -               /* fall through */
> +               fallthrough;
>         case 8:
>                 subpack0_high |= raw_frame[7];
> -               /* fall through */
> +               fallthrough;
>         case 7:
>                 subpack0_low = (raw_frame[6] << 24);
> -               /* fall through */
> +               fallthrough;
>         case 6:
>                 subpack0_low |= (raw_frame[5] << 16);
> -               /* fall through */
> +               fallthrough;
>         case 5:
>                 subpack0_low |= (raw_frame[4] << 8);
> -               /* fall through */
> +               fallthrough;
>         case 4:
>                 subpack0_low |= raw_frame[3];
> -               /* fall through */
> +               fallthrough;
>         case 3:
>                 header = (raw_frame[2] << 16);
> -               /* fall through */
> +               fallthrough;
>         case 2:
>                 header |= (raw_frame[1] << 8);
> -               /* fall through */
> +               fallthrough;
>         case 1:
>                 header |= raw_frame[0];
> -               /* fall through */
> +               fallthrough;
>         case 0:
>                 break;
>         }
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/dma/usernv04.c b/drivers/gpu/drm/nouveau/nvkm/engine/dma/usernv04.c
> index 7f1adab21a5f..5159d5df20a2 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/dma/usernv04.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/dma/usernv04.c
> @@ -122,7 +122,7 @@ nv04_dmaobj_new(struct nvkm_dma *dma, const struct nvkm_oclass *oclass,
>                 break;
>         case NV_MEM_ACCESS_WO:
>                 dmaobj->flags0 |= 0x00008000;
> -               /* fall through */
> +               fallthrough;
>         case NV_MEM_ACCESS_RW:
>                 dmaobj->flags2 |= 0x00000002;
>                 break;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv04.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv04.c
> index 93493b335d76..c1d1b1aa5bc6 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv04.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv04.c
> @@ -117,10 +117,10 @@ nv04_fifo_swmthd(struct nvkm_device *device, u32 chid, u32 addr, u32 data)
>         switch (mthd) {
>         case 0x0000 ... 0x0000: /* subchannel's engine -> software */
>                 nvkm_wr32(device, 0x003280, (engine &= ~mask));
> -               /* fall through */
> +               fallthrough;
>         case 0x0180 ... 0x01fc: /* handle -> instance */
>                 data = nvkm_rd32(device, 0x003258) & 0x0000ffff;
> -               /* fall through */
> +               fallthrough;
>         case 0x0100 ... 0x017c:
>         case 0x0200 ... 0x1ffc: /* pass method down to sw */
>                 if (!(engine & mask) && sw)
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv40.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv40.c
> index 47c16821c37f..2d61fd832ddb 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv40.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv40.c
> @@ -81,7 +81,7 @@ nv40_fifo_init(struct nvkm_fifo *base)
>         case 0x49:
>         case 0x4b:
>                 nvkm_wr32(device, 0x002230, 0x00000001);
> -               /* fall through */
> +               fallthrough;
>         case 0x40:
>         case 0x41:
>         case 0x42:
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/dcb.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/dcb.c
> index a8d5d67feeaf..8698f260b988 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/dcb.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/dcb.c
> @@ -172,8 +172,8 @@ dcb_outp_parse(struct nvkm_bios *bios, u8 idx, u8 *ver, u8 *len,
>                                         outp->dpconf.link_nr = 1;
>                                         break;
>                                 }
> +                               fallthrough;
>
> -                               /* fall-through... */
>                         case DCB_OUTPUT_TMDS:
>                         case DCB_OUTPUT_LVDS:
>                                 outp->link = (conf & 0x00000030) >> 4;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/dp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/dp.c
> index b099d1209be8..c694501ae206 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/dp.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/dp.c
> @@ -100,7 +100,7 @@ nvbios_dpout_parse(struct nvkm_bios *bios, u8 idx,
>                 switch (*ver) {
>                 case 0x20:
>                         info->mask |= 0x00c0; /* match any link */
> -                       /* fall-through */
> +                       fallthrough;
>                 case 0x21:
>                 case 0x30:
>                         info->flags     = nvbios_rd08(bios, data + 0x05);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/perf.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/perf.c
> index 7112992e0e38..f039388f0676 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/perf.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/perf.c
> @@ -135,7 +135,7 @@ nvbios_perfEp(struct nvkm_bios *bios, int idx,
>                 break;
>         case 0x30:
>                 info->script   = nvbios_rd16(bios, perf + 0x02);
> -               /* fall through */
> +               fallthrough;
>         case 0x35:
>                 info->fanspeed = nvbios_rd08(bios, perf + 0x06);
>                 info->voltage  = nvbios_rd08(bios, perf + 0x07);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pll.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pll.c
> index bda6cc9a7aaf..350f10a3de37 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pll.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pll.c
> @@ -134,7 +134,7 @@ pll_map(struct nvkm_bios *bios)
>                     device->chipset == 0xaa ||
>                     device->chipset == 0xac)
>                         return g84_pll_mapping;
> -               /* fall through */
> +               fallthrough;
>         default:
>                 return NULL;
>         }
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/timing.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/timing.c
> index 20ff5173cf8f..2da45e29f68b 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/timing.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/timing.c
> @@ -115,21 +115,21 @@ nvbios_timingEp(struct nvkm_bios *bios, int idx,
>                 switch (min_t(u8, *hdr, 25)) {
>                 case 25:
>                         p->timing_10_24  = nvbios_rd08(bios, data + 0x18);
> -                       /* fall through */
> +                       fallthrough;
>                 case 24:
>                 case 23:
>                 case 22:
>                         p->timing_10_21  = nvbios_rd08(bios, data + 0x15);
> -                       /* fall through */
> +                       fallthrough;
>                 case 21:
>                         p->timing_10_20  = nvbios_rd08(bios, data + 0x14);
> -                       /* fall through */
> +                       fallthrough;
>                 case 20:
>                         p->timing_10_CWL = nvbios_rd08(bios, data + 0x13);
> -                       /* fall through */
> +                       fallthrough;
>                 case 19:
>                         p->timing_10_18  = nvbios_rd08(bios, data + 0x12);
> -                       /* fall through */
> +                       fallthrough;
>                 case 18:
>                 case 17:
>                         p->timing_10_16  = nvbios_rd08(bios, data + 0x10);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> index 40e564524b7a..dc184e857f85 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> @@ -90,7 +90,7 @@ nvkm_cstate_valid(struct nvkm_clk *clk, struct nvkm_cstate *cstate,
>                         case NVKM_CLK_BOOST_NONE:
>                                 if (clk->base_khz && freq > clk->base_khz)
>                                         return false;
> -                               /* fall through */
> +                               fallthrough;
>                         case NVKM_CLK_BOOST_BIOS:
>                                 if (clk->boost_khz && freq > clk->boost_khz)
>                                         return false;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/mcp77.c b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/mcp77.c
> index 4f000237796f..efa50274df97 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/mcp77.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/mcp77.c
> @@ -363,7 +363,7 @@ mcp77_clk_prog(struct nvkm_clk *base)
>         switch (clk->vsrc) {
>         case nv_clk_src_cclk:
>                 mast |= 0x00400000;
> -               /* fall through */
> +               fallthrough;
>         default:
>                 nvkm_wr32(device, 0x4600, clk->vdiv);
>         }
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv04.c b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv04.c
> index c3dae05348eb..317ce9fb8225 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv04.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv04.c
> @@ -119,11 +119,11 @@ powerctrl_1_shift(int chip_version, int reg)
>
>         switch (reg) {
>         case 0x680520:
> -               shift += 4; /* fall through */
> +               shift += 4; fallthrough;
>         case 0x680508:
> -               shift += 4; /* fall through */
> +               shift += 4; fallthrough;
>         case 0x680504:
> -               shift += 4; /* fall through */
> +               shift += 4; fallthrough;
>         case 0x680500:
>                 shift += 4;
>         }
> @@ -245,11 +245,11 @@ setPLL_double_highregs(struct nvkm_devinit *init, u32 reg1,
>
>                 switch (reg1) {
>                 case 0x680504:
> -                       shift_c040 += 2; /* fall through */
> +                       shift_c040 += 2; fallthrough;
>                 case 0x680500:
> -                       shift_c040 += 2; /* fall through */
> +                       shift_c040 += 2; fallthrough;
>                 case 0x680520:
> -                       shift_c040 += 2; /* fall through */
> +                       shift_c040 += 2; fallthrough;
>                 case 0x680508:
>                         shift_c040 += 2;
>                 }
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv40.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv40.c
> index 5f4c287d7943..97b3a28ca5c0 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv40.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv40.c
> @@ -131,13 +131,13 @@ nv40_ram_prog(struct nvkm_ram *base)
>                 nvkm_mask(device, 0x00402c, 0xc0771100, ram->ctrl);
>                 nvkm_wr32(device, 0x004048, ram->coef);
>                 nvkm_wr32(device, 0x004030, ram->coef);
> -               /* fall through */
> +               fallthrough;
>         case 0x43:
>         case 0x49:
>         case 0x4b:
>                 nvkm_mask(device, 0x004038, 0xc0771100, ram->ctrl);
>                 nvkm_wr32(device, 0x00403c, ram->coef);
> -               /* fall through */
> +               fallthrough;
>         default:
>                 nvkm_mask(device, 0x004020, 0xc0771100, ram->ctrl);
>                 nvkm_wr32(device, 0x004024, ram->coef);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mxm/nv50.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mxm/nv50.c
> index 2a6150ab5611..70e2c414bb7b 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mxm/nv50.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mxm/nv50.c
> @@ -159,7 +159,7 @@ mxm_dcb_sanitise_entry(struct nvkm_bios *bios, void *data, int idx, u16 pdcb)
>                 break;
>         case 0x0e: /* eDP, falls through to DPint */
>                 ctx.outp[1] |= 0x00010000;
> -               /* fall through */
> +               fallthrough;
>         case 0x07: /* DP internal, wtf is this?? HP8670w */
>                 ctx.outp[1] |= 0x00000004; /* use_power_scripts? */
>                 type = DCB_CONNECTOR_eDP;
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

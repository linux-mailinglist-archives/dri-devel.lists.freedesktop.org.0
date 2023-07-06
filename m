Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8C5749E58
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 15:58:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12AB310E096;
	Thu,  6 Jul 2023 13:58:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7B1410E096;
 Thu,  6 Jul 2023 13:58:38 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-3a1d9b64837so763290b6e.0; 
 Thu, 06 Jul 2023 06:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688651917; x=1691243917;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5Hp8tU9cWu6R6f3sn+8A1XNNoAmV3ki5dbuL76Q7q/g=;
 b=jW8fZyoU3DO00/VknLBRC1h6kBMu8XI1LsUcKUKbG7uS5K1zHOZBpp0CDxgpvDTFKw
 +5FkbPG7Q9BwXmE1ZYHxTwB7BM4JadMfceYFtCn07I0gnGEOHbDw3Y4g3euxTJn17A6G
 NmkXaQsNHQ20wcd9dWE9ayH70yxcuwfl3TonKln0gWcCqgO3A7voL187FesbmfRYIg1b
 WIQvbCmy5b2Lo2HrqAjcbhWboCl225wSoQ+oL8U5+yMAKgb5dagv5oGgo7zCR0T9aWKy
 jRrdwXUITSOIUq9BgJvgnuKEX8bW1agbSp6/6Og0vPnJD79JI5iigu9n5yVyvcg3sRv9
 BPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688651917; x=1691243917;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5Hp8tU9cWu6R6f3sn+8A1XNNoAmV3ki5dbuL76Q7q/g=;
 b=LHRY/IaF91TnGmjnygHSK3XkGNKMSgkDPRz2ne/E3s7i+ZukFg0lfSgDjJTJJG5zjT
 B4WNmctKpP2LVhQsLvEYOi63yydPBRl6buf5Q3lmVfioHLYHxhl+pN2WsC3PAP49cPru
 rHMKtrGOkWjgNNz7rCSNCX4Kg3r51OH7rwcg2fcqdqQpyq4R58hPFiQTKt4KsTDLs7ah
 f4SkPXwnV9tp1IGEXgnk7gyGArT2zh0bFp/Gyx9rBVQxjlL+DOHYEUItIDAT5PRHGU8/
 RVNJfSZNk7uNutHgvi/qWng953JE8n0/lGQcEfQHDvrX+fW3TIvJzMCeffGMXuuCAv7R
 7BFA==
X-Gm-Message-State: ABy/qLZuV6WnN5/+VXReiD+RY4jZJM5lQr9WDPisIEnGrz5B9n64E0P6
 N/ed/WbefL6jsLJDNu7v2L9AEdkyo5Dx4xpNJig=
X-Google-Smtp-Source: APBJJlHwWrHIAzdFBa636bFDMNRZF9RFGE1HyH/tDHgJxsmdjuaeJ2kJEJRRwYbbDY70pb0vxaKHA7rj0kFXbVJUIRU=
X-Received: by 2002:a05:6808:1d6:b0:3a0:4dc3:25ff with SMTP id
 x22-20020a05680801d600b003a04dc325ffmr2199089oic.7.1688651917567; Thu, 06 Jul
 2023 06:58:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230706021102.2066-1-yangrong@vivo.com>
In-Reply-To: <20230706021102.2066-1-yangrong@vivo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 6 Jul 2023 09:58:26 -0400
Message-ID: <CADnq5_MSkJf=-QMPYNQp03=6mbb+OEHnPFW0=WKiS0VMc6ricQ@mail.gmail.com>
Subject: Re: [PATCH] Fix max/min warnings in virtio_net, amd/display,
 and io_uring
To: Yang Rong <yangrong@vivo.com>
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
Cc: Max Tseng <Max.Tseng@amd.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO CORE AND NET DRIVERS"
 <virtualization@lists.linux-foundation.org>,
 Eric Dumazet <edumazet@google.com>, Jun Lei <Jun.Lei@amd.com>,
 Josip Pavic <Josip.Pavic@amd.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 "open list:AMD DISPLAY CORE" <amd-gfx@lists.freedesktop.org>,
 "open list:IO_URING" <io-uring@vger.kernel.org>,
 Alvin Lee <Alvin.Lee2@amd.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, opensource.kernel@vivo.com,
 Leo Li <sunpeng.li@amd.com>, Cruise Hung <cruise.hung@amd.com>,
 Jens Axboe <axboe@kernel.dk>,
 "open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 open list <linux-kernel@vger.kernel.org>, luhongfei@vivo.com,
 "David S. Miller" <davem@davemloft.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pavel Begunkov <asml.silence@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 6, 2023 at 3:37=E2=80=AFAM Yang Rong <yangrong@vivo.com> wrote:
>
> The files drivers/net/virtio_net.c, drivers/gpu/drm/amd/display/dc/dc_dmu=
b_srv.c, and io_uring/io_uring.c were modified to fix warnings.
> Specifically, the opportunities for max() and min() were utilized to addr=
ess the warnings.

Please split this into 3 patches, one for each component.

Alex

>
> Signed-off-by: Yang Rong <yangrong@vivo.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c | 6 +++---
>  drivers/net/virtio_net.c                     | 3 ++-
>  io_uring/io_uring.c                          | 3 ++-
>  3 files changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c b/drivers/gpu/d=
rm/amd/display/dc/dc_dmub_srv.c
> index c753c6f30dd7..df79aea49a3c 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
> +++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
> @@ -22,7 +22,7 @@
>   * Authors: AMD
>   *
>   */
> -
> +#include <linux/minmax.h>
>  #include "dc.h"
>  #include "dc_dmub_srv.h"
>  #include "../dmub/dmub_srv.h"
> @@ -481,7 +481,7 @@ static void populate_subvp_cmd_drr_info(struct dc *dc=
,
>         max_drr_vblank_us =3D div64_u64((subvp_active_us - prefetch_us -
>                         dc->caps.subvp_fw_processing_delay_us - drr_activ=
e_us), 2) + drr_active_us;
>         max_drr_mallregion_us =3D subvp_active_us - prefetch_us - mall_re=
gion_us - dc->caps.subvp_fw_processing_delay_us;
> -       max_drr_supported_us =3D max_drr_vblank_us > max_drr_mallregion_u=
s ? max_drr_vblank_us : max_drr_mallregion_us;
> +       max_drr_supported_us =3D max(max_drr_vblank_us, max_drr_mallregio=
n_us);
>         max_vtotal_supported =3D div64_u64(((uint64_t)drr_timing->pix_clk=
_100hz * 100 * max_drr_supported_us),
>                         (((uint64_t)drr_timing->h_total * 1000000)));
>
> @@ -771,7 +771,7 @@ void dc_dmub_setup_subvp_dmub_command(struct dc *dc,
>                 wm_val_refclk =3D context->bw_ctx.bw.dcn.watermarks.a.cst=
ate_pstate.pstate_change_ns *
>                                 (dc->res_pool->ref_clocks.dchub_ref_clock=
_inKhz / 1000) / 1000;
>
> -               cmd.fw_assisted_mclk_switch_v2.config_data.watermark_a_ca=
che =3D wm_val_refclk < 0xFFFF ? wm_val_refclk : 0xFFFF;
> +               cmd.fw_assisted_mclk_switch_v2.config_data.watermark_a_ca=
che =3D min(wm_val_refclk, 0xFFFF);
>         }
>
>         dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index 9b3721424e71..5bb7da885f00 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -22,6 +22,7 @@
>  #include <net/route.h>
>  #include <net/xdp.h>
>  #include <net/net_failover.h>
> +#include <linux/minmax.h>
>
>  static int napi_weight =3D NAPI_POLL_WEIGHT;
>  module_param(napi_weight, int, 0444);
> @@ -1291,7 +1292,7 @@ static struct sk_buff *build_skb_from_xdp_buff(stru=
ct net_device *dev,
>         __skb_put(skb, data_len);
>
>         metasize =3D xdp->data - xdp->data_meta;
> -       metasize =3D metasize > 0 ? metasize : 0;
> +       metasize =3D max(metasize, 0);
>         if (metasize)
>                 skb_metadata_set(skb, metasize);
>
> diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
> index e8096d502a7c..875ca657227d 100644
> --- a/io_uring/io_uring.c
> +++ b/io_uring/io_uring.c
> @@ -47,6 +47,7 @@
>  #include <linux/refcount.h>
>  #include <linux/uio.h>
>  #include <linux/bits.h>
> +#include <linux/minmax.h>
>
>  #include <linux/sched/signal.h>
>  #include <linux/fs.h>
> @@ -2660,7 +2661,7 @@ static void *__io_uaddr_map(struct page ***pages, u=
nsigned short *npages,
>                                         page_array);
>         if (ret !=3D nr_pages) {
>  err:
> -               io_pages_free(&page_array, ret > 0 ? ret : 0);
> +               io_pages_free(&page_array, max(ret, 0));
>                 return ret < 0 ? ERR_PTR(ret) : ERR_PTR(-EFAULT);
>         }
>         /*
> --
> 2.35.3
>
>
> ________________________________
> =E6=9C=AC=E9=82=AE=E4=BB=B6=E5=8F=8A=E5=85=B6=E9=99=84=E4=BB=B6=E5=86=85=
=E5=AE=B9=E5=8F=AF=E8=83=BD=E5=90=AB=E6=9C=89=E6=9C=BA=E5=AF=86=E5=92=8C/=
=E6=88=96=E9=9A=90=E7=A7=81=E4=BF=A1=E6=81=AF=EF=BC=8C=E4=BB=85=E4=BE=9B=E6=
=8C=87=E5=AE=9A=E4=B8=AA=E4=BA=BA=E6=88=96=E6=9C=BA=E6=9E=84=E4=BD=BF=E7=94=
=A8=E3=80=82=E8=8B=A5=E6=82=A8=E9=9D=9E=E5=8F=91=E4=BB=B6=E4=BA=BA=E6=8C=87=
=E5=AE=9A=E6=94=B6=E4=BB=B6=E4=BA=BA=E6=88=96=E5=85=B6=E4=BB=A3=E7=90=86=E4=
=BA=BA=EF=BC=8C=E8=AF=B7=E5=8B=BF=E4=BD=BF=E7=94=A8=E3=80=81=E4=BC=A0=E6=92=
=AD=E3=80=81=E5=A4=8D=E5=88=B6=E6=88=96=E5=AD=98=E5=82=A8=E6=AD=A4=E9=82=AE=
=E4=BB=B6=E4=B9=8B=E4=BB=BB=E4=BD=95=E5=86=85=E5=AE=B9=E6=88=96=E5=85=B6=E9=
=99=84=E4=BB=B6=E3=80=82=E5=A6=82=E6=82=A8=E8=AF=AF=E6=94=B6=E6=9C=AC=E9=82=
=AE=E4=BB=B6=EF=BC=8C=E8=AF=B7=E5=8D=B3=E4=BB=A5=E5=9B=9E=E5=A4=8D=E6=88=96=
=E7=94=B5=E8=AF=9D=E6=96=B9=E5=BC=8F=E9=80=9A=E7=9F=A5=E5=8F=91=E4=BB=B6=E4=
=BA=BA=EF=BC=8C=E5=B9=B6=E5=B0=86=E5=8E=9F=E5=A7=8B=E9=82=AE=E4=BB=B6=E3=80=
=81=E9=99=84=E4=BB=B6=E5=8F=8A=E5=85=B6=E6=89=80=E6=9C=89=E5=A4=8D=E6=9C=AC=
=E5=88=A0=E9=99=A4=E3=80=82=E8=B0=A2=E8=B0=A2=E3=80=82
> The contents of this message and any attachments may contain confidential=
 and/or privileged information and are intended exclusively for the address=
ee(s). If you are not the intended recipient of this message or their agent=
, please note that any use, dissemination, copying, or storage of this mess=
age or its attachments is not allowed. If you receive this message in error=
, please notify the sender by reply the message or phone and delete this me=
ssage, any attachments and any copies immediately.
> Thank you

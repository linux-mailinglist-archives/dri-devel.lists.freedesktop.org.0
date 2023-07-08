Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D17FF74C005
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jul 2023 01:42:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DC6110E0BF;
	Sat,  8 Jul 2023 23:42:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3482F10E0AD
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jul 2023 23:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688859746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zuXUWar5it67xzTLsfG6dq75MzwcYYcoVnZ3Qa6+OwQ=;
 b=PKr0KnBTegGuOk9QOHkuSmAqRC4uj9GrrWpLoTHwHQ5yN/9xe/5z8F+lbFYPZqMVqcjD7C
 hyW2VVfRHy3sKjesJ/Mz09YWQyr6EB8gN1YFupMkwdzVTWP2w1wVNA1ZiCBK+P8Bs96mRI
 qtJ17GBKkfg2qQL97V4Nz2U3/CKb+Ug=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-163-XcHvvztoMpipyC5og5EHjw-1; Sat, 08 Jul 2023 19:42:24 -0400
X-MC-Unique: XcHvvztoMpipyC5og5EHjw-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2b04d5ed394so5412991fa.1
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Jul 2023 16:42:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688859742; x=1691451742;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zuXUWar5it67xzTLsfG6dq75MzwcYYcoVnZ3Qa6+OwQ=;
 b=b/mNXDnabkHdzjx4x24db4dXhKAhgL3NX8xiDS1L0whipFt75BwTnqe9uL02A3PvAZ
 1tbvgYZswdQJI9jDPoI8ScDTe3BaYu7uhtiK3kUSxxYVox5tG+BpNeZsmc29epQUMcw7
 qFwQtMIwN/BnEUpiaPve/ENxKNcsbTowNuuk6JbZn+zgCHl9Tb0tGIGryi4S8wVoCVkw
 zFWh/uFLtTi4ElaqtXHEdK1szfdvjVp5f+ALX5nzRWbRCYPLXkx4bIDEsi+jn91jPuzR
 PYwIHzULRq14T9e3JFHJ5eXLaDH/xL52Ge2w9GQ46M0uoCglRZqwHgUwqZLh+xaOXNjt
 Hyww==
X-Gm-Message-State: ABy/qLYpgo2nkxXgd4m/XzkAdYh/44dOJi/s/QFXjXeR3QTo+4pzdITu
 fZDRhaLcqc6rDtdRr52RaRn4JWkd9qUW+O/gTXKFfabmwUwwLVDIv+R0L7OdlWoY7IPmWKacDRV
 rC3QJ8gpE3LUHEmob/i64rLJtm+GjYKxAepjaf5gPFB3h
X-Received: by 2002:a2e:a10b:0:b0:2b6:9a47:c4bd with SMTP id
 s11-20020a2ea10b000000b002b69a47c4bdmr7458203ljl.1.1688859742161; 
 Sat, 08 Jul 2023 16:42:22 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE5X3CBQWtiEdrj3rZYiIrmAV14yV6EXlVIUUteCnODFqXHRUw2+sSlSUsqusjTgXVX8PP6eFgmtiIYHbhX8EI=
X-Received: by 2002:a2e:a10b:0:b0:2b6:9a47:c4bd with SMTP id
 s11-20020a2ea10b000000b002b69a47c4bdmr7458188ljl.1.1688859741870; Sat, 08 Jul
 2023 16:42:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230707215851.590754-1-lyude@redhat.com>
In-Reply-To: <20230707215851.590754-1-lyude@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Sun, 9 Jul 2023 01:42:10 +0200
Message-ID: <CACO55tvfTDu8XcKowWXcSRqp8OMLb8Q4jnPG_Fn5y=yJy-Dqbw@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/nvkm/dp: Add hack to fix DP 1.3+ DPCD issues
To: Lyude Paul <lyude@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: nouveau@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 7, 2023 at 11:58=E2=80=AFPM Lyude Paul <lyude@redhat.com> wrote=
:
>
> Currently we use the drm_dp_dpcd_read_caps() helper in the DRM side of
> nouveau in order to read the DPCD of a DP connector, which makes sure we =
do
> the right thing and also check for extended DPCD caps. However, it turns
> out we're not currently doing this on the nvkm side since we don't have
> access to the drm_dp_aux structure there - which means that the DRM side =
of
> the driver and the NVKM side can end up with different DPCD capabilities
> for the same connector.
>
> Ideally to fix this, we want to start setting up the drm_dp_aux device in
> NVKM before we've made contact with the DRM side - which should be pretty
> easy to accomplish (I'm already working on it!). Until then however, let'=
s
> workaround this problem by porting a copy of drm_dp_read_dpcd_caps() into
> NVKM - which should fix this issue.
>
> Issue: https://gitlab.freedesktop.org/drm/nouveau/-/issues/211

Should a Fixes: or Cc: stable tag be added so it gets backported?

> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c | 48 ++++++++++++++++++-
>  1 file changed, 47 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c b/drivers/gpu/=
drm/nouveau/nvkm/engine/disp/dp.c
> index 40c8ea43c42f..b8ac66b4a2c4 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
> @@ -26,6 +26,8 @@
>  #include "head.h"
>  #include "ior.h"
>
> +#include <drm/display/drm_dp.h>
> +
>  #include <subdev/bios.h>
>  #include <subdev/bios/init.h>
>  #include <subdev/gpio.h>
> @@ -634,6 +636,50 @@ nvkm_dp_enable_supported_link_rates(struct nvkm_outp=
 *outp)
>         return outp->dp.rates !=3D 0;
>  }
>
> +/* XXX: This is a big fat hack, and this is just drm_dp_read_dpcd_caps()

Well.. maybe we should rephrase that _if_ we want to see it
backported. But is this code really that bad? It kinda looks
reasonable enough.

> + * converted to work inside nvkm. This is a temporary holdover until we =
start
> + * passing the drm_dp_aux device through NVKM
> + */
> +static int
> +nvkm_dp_read_dpcd_caps(struct nvkm_outp *outp)
> +{
> +       struct nvkm_i2c_aux *aux =3D outp->dp.aux;
> +       u8 dpcd_ext[DP_RECEIVER_CAP_SIZE];
> +       int ret;
> +
> +       ret =3D nvkm_rdaux(aux, DPCD_RC00_DPCD_REV, outp->dp.dpcd, DP_REC=
EIVER_CAP_SIZE);
> +       if (ret < 0)
> +               return ret;
> +
> +       /*
> +        * Prior to DP1.3 the bit represented by
> +        * DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT was reserved.
> +        * If it is set DP_DPCD_REV at 0000h could be at a value less tha=
n
> +        * the true capability of the panel. The only way to check is to
> +        * then compare 0000h and 2200h.
> +        */
> +       if (!(outp->dp.dpcd[DP_TRAINING_AUX_RD_INTERVAL] &
> +             DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT))
> +               return 0;
> +
> +       ret =3D nvkm_rdaux(aux, DP_DP13_DPCD_REV, dpcd_ext, sizeof(dpcd_e=
xt));
> +       if (ret < 0)
> +               return ret;
> +
> +       if (outp->dp.dpcd[DP_DPCD_REV] > dpcd_ext[DP_DPCD_REV]) {
> +               OUTP_DBG(outp, "Extended DPCD rev less than base DPCD rev=
 (%d > %d)\n",
> +                        outp->dp.dpcd[DP_DPCD_REV], dpcd_ext[DP_DPCD_REV=
]);
> +               return 0;
> +       }
> +
> +       if (!memcmp(outp->dp.dpcd, dpcd_ext, sizeof(dpcd_ext)))
> +               return 0;
> +
> +       memcpy(outp->dp.dpcd, dpcd_ext, sizeof(dpcd_ext));
> +
> +       return 0;
> +}
> +
>  void
>  nvkm_dp_enable(struct nvkm_outp *outp, bool auxpwr)
>  {
> @@ -689,7 +735,7 @@ nvkm_dp_enable(struct nvkm_outp *outp, bool auxpwr)
>                         memset(outp->dp.lttpr, 0x00, sizeof(outp->dp.lttp=
r));
>                 }
>
> -               if (!nvkm_rdaux(aux, DPCD_RC00_DPCD_REV, outp->dp.dpcd, s=
izeof(outp->dp.dpcd))) {
> +               if (!nvkm_dp_read_dpcd_caps(outp)) {
>                         const u8 rates[] =3D { 0x1e, 0x14, 0x0a, 0x06, 0 =
};
>                         const u8 *rate;
>                         int rate_max;
> --
> 2.40.1
>


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A7D74DF20
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 22:21:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0458810E2D4;
	Mon, 10 Jul 2023 20:21:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA3010E2D3;
 Mon, 10 Jul 2023 20:21:12 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-1b45fe36cd9so1856607fac.2; 
 Mon, 10 Jul 2023 13:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689020471; x=1691612471;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zQI7m/PWW5lx/D1YlUvsvyQDeza06QWfMVyhiJmEv7Y=;
 b=RnAddbMZgLA1Og/B+xpbcbXdBD0VrjWG1NaGXJ07JDYcAd7mttQcInm7ak3KUcgvgs
 VS/Oe21tZHO5LUJob8/k9ycA1yIIonZKDl9Tsngj9Y9j9dmgyGPmNz0T/kdFyrD/sxpu
 oa8nxCKP/L9NkWSJY76ShahPBYulQi1uuR9tUl/FqW7e7i3Z/93fPceRg8+H/CVD3Nwv
 EngiLnl6gHr2OGQKcwmma/JwnOR5EkHKRGE0Hp6iSQiuiB8uoXP7m5/bzTzCJzzSFAks
 HUlsePXzctmi0WIBbohNSjrp+UNMVnGJhKYcZYRcMGNSK8Jj3UrTV5rAp38VjhXNkDYb
 ayug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689020471; x=1691612471;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zQI7m/PWW5lx/D1YlUvsvyQDeza06QWfMVyhiJmEv7Y=;
 b=hVK/Y27w9996iiTckTui4Ywz1SkWQzqBFOTfhCK68KsZJB9OldZMaSjxF33mjdfTNw
 Mj9j5iPGGwmkqNEcadohJPk0mKpD/Lvc4Llv/w8p1Waz2xU/VrXVsjfzoPVJhR/cBg8u
 2VBGDRQJKO6CPeC88zFH1PT7BfZHARxmzkutgML8hOy89bZCJsdnpqcd0lKA6iYCHY0t
 qQDAsxpw+KnmjksIQKzyeld88kVUentoQq7++l5m999NydA5DSmWHvDWyxYM1Zbe/Tmu
 N1f4XElGgRVtZO7kIwMa28x1ronPoGyb9RAO3JvTTpbLlPXMoD+0G1M3OlrVb59/5/Y6
 kPgg==
X-Gm-Message-State: ABy/qLYFI+1fBQy7fCuMqGhDGAog73z/6cnDuHfH3M2/MJHOP5n/y8If
 c1sDxVnC/QilZQrTRoGdAtTYMMTgADDC0lz8weI=
X-Google-Smtp-Source: APBJJlFMuBmCDJiTe5d+q61B/wbJExJt0gPJw1oc4QmfseKkn8o+8hegLmwGvAiXF6SS3Y9BxgIni1lufhYJje9rRSo=
X-Received: by 2002:a05:6870:e2c9:b0:1b7:3065:abe with SMTP id
 w9-20020a056870e2c900b001b730650abemr3891540oad.26.1689020471456; Mon, 10 Jul
 2023 13:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-11-robdclark@gmail.com>
 <1ecc63d0-db62-c8aa-74b7-36ad2eff89a1@linaro.org>
In-Reply-To: <1ecc63d0-db62-c8aa-74b7-36ad2eff89a1@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 10 Jul 2023 13:21:00 -0700
Message-ID: <CAF6AEGtJifJZd94iP4n65mrcOda9L367NJGNpR8R2x1kjVZGmQ@mail.gmail.com>
Subject: Re: [PATCH 10/12] drm/msm/adreno: Add helper for formating chip-id
To: Konrad Dybcio <konrad.dybcio@linaro.org>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 6, 2023 at 4:36=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linaro.=
org> wrote:
>
> On 6.07.2023 23:10, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > This is used in a few places, including one that is parsed by userspace
> > tools.  So let's standardize it a bit better.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> Userspace parsed this weird string instead of the hex-based chipid?
>
> weird^2

AFAICT it is just crashdec (the creatively named tool for parsing gpu
devcore dumps) which parses using "%u.%u.%u.%u"..  I suppose one
_could_ make the argument that, since userspace doesn't yet support
any device where "%x.%x.%x.%x" parsing would be different, we could
get away with switching to hex without it being an ABI break..

BR,
-R

> Konrad
> >  drivers/gpu/drm/msm/adreno/adreno_device.c |  8 +++-----
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 19 ++++++++-----------
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  6 ++++++
> >  3 files changed, 17 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/d=
rm/msm/adreno/adreno_device.c
> > index dcd6363ac7b0..fd2e183bce60 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > @@ -661,14 +661,12 @@ static int adreno_bind(struct device *dev, struct=
 device *master, void *data)
> >       info =3D adreno_info(config.rev);
> >
> >       if (!info) {
> > -             dev_warn(drm->dev, "Unknown GPU revision: %u.%u.%u.%u\n",
> > -                     config.rev.core, config.rev.major,
> > -                     config.rev.minor, config.rev.patchid);
> > +             dev_warn(drm->dev, "Unknown GPU revision: %"ADRENO_CHIPID=
_FMT"\n",
> > +                     ADRENO_CHIPID_ARGS(config.rev));
> >               return -ENXIO;
> >       }
> >
> > -     DBG("Found GPU: %u.%u.%u.%u", config.rev.core, config.rev.major,
> > -             config.rev.minor, config.rev.patchid);
> > +     DBG("Found GPU: %"ADRENO_CHIPID_FMT, ADRENO_CHIPID_ARGS(config.re=
v));
> >
> >       priv->is_a2xx =3D info->family < ADRENO_3XX;
> >       priv->has_cached_coherent =3D
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/=
msm/adreno/adreno_gpu.c
> > index 75ff7fb46099..1a982a926f21 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > @@ -847,10 +847,9 @@ void adreno_show(struct msm_gpu *gpu, struct msm_g=
pu_state *state,
> >       if (IS_ERR_OR_NULL(state))
> >               return;
> >
> > -     drm_printf(p, "revision: %d (%d.%d.%d.%d)\n",
> > -                     adreno_gpu->info->revn, adreno_gpu->rev.core,
> > -                     adreno_gpu->rev.major, adreno_gpu->rev.minor,
> > -                     adreno_gpu->rev.patchid);
> > +     drm_printf(p, "revision: %u (%"ADRENO_CHIPID_FMT")\n",
> > +                     adreno_gpu->info->revn,
> > +                     ADRENO_CHIPID_ARGS(adreno_gpu->rev));
> >       /*
> >        * If this is state collected due to iova fault, so fault related=
 info
> >        *
> > @@ -921,10 +920,9 @@ void adreno_dump_info(struct msm_gpu *gpu)
> >       struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> >       int i;
> >
> > -     printk("revision: %d (%d.%d.%d.%d)\n",
> > -                     adreno_gpu->info->revn, adreno_gpu->rev.core,
> > -                     adreno_gpu->rev.major, adreno_gpu->rev.minor,
> > -                     adreno_gpu->rev.patchid);
> > +     printk("revision: %u (%"ADRENO_CHIPID_FMT")\n",
> > +                     adreno_gpu->info->revn,
> > +                     ADRENO_CHIPID_ARGS(adreno_gpu->rev));
> >
> >       for (i =3D 0; i < gpu->nr_rings; i++) {
> >               struct msm_ringbuffer *ring =3D gpu->rb[i];
> > @@ -1105,9 +1103,8 @@ int adreno_gpu_init(struct drm_device *drm, struc=
t platform_device *pdev,
> >               speedbin =3D 0xffff;
> >       adreno_gpu->speedbin =3D (uint16_t) (0xffff & speedbin);
> >
> > -     gpu_name =3D devm_kasprintf(dev, GFP_KERNEL, "%d.%d.%d.%d",
> > -                     rev->core, rev->major, rev->minor,
> > -                     rev->patchid);
> > +     gpu_name =3D devm_kasprintf(dev, GFP_KERNEL, "%"ADRENO_CHIPID_FMT=
,
> > +                     ADRENO_CHIPID_ARGS(config->rev));
> >       if (!gpu_name)
> >               return -ENOMEM;
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/=
msm/adreno/adreno_gpu.h
> > index 2fa14dcd4e40..73e7155f164c 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > @@ -66,6 +66,12 @@ struct adreno_rev {
> >  #define ADRENO_REV(core, major, minor, patchid) \
> >       ((struct adreno_rev){ core, major, minor, patchid })
> >
> > +/* Helper for formating the chip_id in the way that userspace tools li=
ke
> > + * crashdec expect.
> > + */
> > +#define ADRENO_CHIPID_FMT "u.%u.%u.%u"
> > +#define ADRENO_CHIPID_ARGS(_r) (_r).core, (_r).major, (_r).minor, (_r)=
.patchid
> > +
> >  struct adreno_gpu_funcs {
> >       struct msm_gpu_funcs base;
> >       int (*get_timestamp)(struct msm_gpu *gpu, uint64_t *value);

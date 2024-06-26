Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BFD918EB9
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 20:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A068810E0BD;
	Wed, 26 Jun 2024 18:43:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="md9Wnl1S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAEF910E0BD;
 Wed, 26 Jun 2024 18:43:23 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2ec10324791so85152101fa.1; 
 Wed, 26 Jun 2024 11:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719427402; x=1720032202; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UR9Qp1fTrxNM5LeM1DAR7Mfemmm10TsjmtqQdGlQAqQ=;
 b=md9Wnl1SsKvIU2VfuipqAJJfShcy21A6ooP+Z72F2HNOAFfqkZHDKoE/re2IZt/1Pu
 qU8GifSweIKq6PgLe8R2+VfN3WXcplqVIGL4Lud9ZwRT3Fgkl6+DAWoeSkuNaaGUoi2F
 6APE2srRdXnBZU4ajc74RCKABZA66F35oQu6JbgmqtUw/NnlsN6WmJFCeRD+vyOH6M6T
 RDYepwbsUZwEV2uIUhwYZSfnHytthbmxJvOXbPhy5JuFg+IAuC/XdrlwnK5pZeviwQTK
 Weda2uIjrxR++76sD1rAFeldiabGls0czPLZZh1shXWtuGITQGz/3q8YA6N2RXHRAxBP
 DgqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719427402; x=1720032202;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UR9Qp1fTrxNM5LeM1DAR7Mfemmm10TsjmtqQdGlQAqQ=;
 b=MtHjkBh25C6h2L6DJETy3/xQO43Nc4kL4iLOuf55P18ZWX8ZSSeihsOxrTE/AZDzTZ
 gLCK64ND3hvPIsXXKjSmdoT2ERSnuajDu2SNp4hKmdTL0QMPgH5AANKIgHfTXJLBAR8m
 wcKaU6P2WidCif1mqooAuWI3rnRXOKBRyMFEmsub+KvlrIaePIQgAQuCIGDXREr915OH
 xcc1z7EHMv1WntqNkiTBGpuAHCDjU7TxtPP/6rivvYn13IKm9nNkrywZbTBrtf3HKwfq
 lvSRIJzA7nOMzOXe5zfw6aYDMyoWKXksjQWfZuXUG59clFcY7+ooaY085fUqdkD4dNor
 csRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHwcbZZdwR7xewb9bNpVBF5kDj9tzv31e5XlFqMV6rkHXkYi+HvBq/SH05BhYKOZzDdQJEEya9ruzlCyZOLRG/UfUdNFQgCGAO5av5Xz3RrDrz3RF1iQIglGeK1nbWqZYo7a++W0iql0A8ALN6XGRj
X-Gm-Message-State: AOJu0YzP4ofOGY9l1ef3O4LTarw0wAxdLzJYtX/FbJQT52UGU2jOdAAT
 n1VvvIwYgOFBo9GTqJFM+tojzRcq2GzOkvVDorRNsYfxttVYG2XN64eXCxpxIqknaJU2eDOLSO8
 3aHw542omgtBoc8k7tNUwlW8LdmM=
X-Google-Smtp-Source: AGHT+IHcVoQPlUh58ZF730tguw7awKEfLSWtoXlp6zbrPUNXFzV92ij1Ty9lCtgGGz5ceWeK1xuzEN4UQOUqo7+eyi4=
X-Received: by 2002:a2e:8242:0:b0:2ec:50ed:b59f with SMTP id
 38308e7fff4ca-2ec5b2dd950mr64610811fa.34.1719427401351; Wed, 26 Jun 2024
 11:43:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240623110753.141400-1-quic_akhilpo@quicinc.com>
 <20240623110753.141400-3-quic_akhilpo@quicinc.com>
 <5947559d-30dd-4da1-93cc-a15dc65cb77d@linaro.org>
 <20240626082422.zcsari27yoskayuo@hu-akhilpo-hyd.qualcomm.com>
In-Reply-To: <20240626082422.zcsari27yoskayuo@hu-akhilpo-hyd.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 26 Jun 2024 11:43:08 -0700
Message-ID: <CAF6AEGvCaGq8ukxra_bzc=4pUf8y5NndKRagQspD0=uCZdBfoA@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] drm/msm/adreno: Add support for X185 GPU
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>, 
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>, 
 linux-kernel@vger.kernel.org
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

On Wed, Jun 26, 2024 at 1:24=E2=80=AFAM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On Mon, Jun 24, 2024 at 03:53:48PM +0200, Konrad Dybcio wrote:
> >
> >
> > On 6/23/24 13:06, Akhil P Oommen wrote:
> > > Add support in drm/msm driver for the Adreno X185 gpu found in
> > > Snapdragon X1 Elite chipset.
> > >
> > > Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> > > ---
> > >
> > >   drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 19 +++++++++++++++----
> > >   drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  6 ++----
> > >   drivers/gpu/drm/msm/adreno/adreno_device.c | 14 ++++++++++++++
> > >   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  5 +++++
> > >   4 files changed, 36 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/=
msm/adreno/a6xx_gmu.c
> > > index 0e3dfd4c2bc8..168a4bddfaf2 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > > @@ -830,8 +830,10 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gm=
u, unsigned int state)
> > >      */
> > >     gmu_write(gmu, REG_A6XX_GMU_CM3_CFG, 0x4052);
> > > +   if (adreno_is_x185(adreno_gpu)) {
> > > +           chipid =3D 0x7050001;
> >
> > What's wrong with using the logic below?
>
> patchid is BITS(7, 0), not (15, 8) in the case of x185. Due to the
> changes in the chipid scheme within the a7x family, this is a bit
> confusing. I will try to improve here in another series.

I'm thinking we should just add gmu_chipid to struct a6xx_info, tbh

Maybe to start with, we can fall back to the existing logic if
a6xx_info::gmu_chipid is zero so we don't have to add it for _every_
a6xx/a7xx

BR,
-R

> >
> > >     /* NOTE: A730 may also fall in this if-condition with a future GM=
U fw update. */
> > > -   if (adreno_is_a7xx(adreno_gpu) && !adreno_is_a730(adreno_gpu)) {
> > > +   } else if (adreno_is_a7xx(adreno_gpu) && !adreno_is_a730(adreno_g=
pu)) {
> > >             /* A7xx GPUs have obfuscated chip IDs. Use constant maj =
=3D 7 */
> > >             chipid =3D FIELD_PREP(GENMASK(31, 24), 0x7);
> > > @@ -1329,9 +1331,18 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct=
 device *dev, u32 *votes,
> > >     if (!pri_count)
> > >             return -EINVAL;
> > > -   sec =3D cmd_db_read_aux_data("mx.lvl", &sec_count);
> > > -   if (IS_ERR(sec))
> > > -           return PTR_ERR(sec);
> > > +   /*
> > > +    * Some targets have a separate gfx mxc rail. So try to read that=
 first and then fall back
> > > +    * to regular mx rail if it is missing
> > > +    */
> > > +   sec =3D cmd_db_read_aux_data("gmxc.lvl", &sec_count);
> > > +   if (PTR_ERR_OR_ZERO(sec) =3D=3D -EPROBE_DEFER) {
> > > +           return -EPROBE_DEFER;
> > > +   } else if (IS_ERR(sec)) {
> > > +           sec =3D cmd_db_read_aux_data("mx.lvl", &sec_count);
> > > +           if (IS_ERR(sec))
> > > +                   return PTR_ERR(sec);
> > > +   }
> >
> > I assume GMXC would always be used if present, although please use the
> > approach Dmitry suggested
>
> Correct.
>
> -Akhil
> >
> >
> > The rest looks good!
> >
> > Konrad

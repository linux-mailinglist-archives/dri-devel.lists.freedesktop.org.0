Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D54691733B
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 23:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1843B10E190;
	Tue, 25 Jun 2024 21:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hKQbRUA5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF6510E190;
 Tue, 25 Jun 2024 21:19:52 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id
 5614622812f47-3d229baccc4so3204846b6e.1; 
 Tue, 25 Jun 2024 14:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719350392; x=1719955192; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8pE+mGdO/b9jNU7f8ar060kbPsajGXfM93JqBNGUkgg=;
 b=hKQbRUA5D69B5p5eCuOkMIq2dJsOBSSD8RpysyAzJvRbTdkHo/KxZK409HhVxGUE9M
 Nnbu2kIA3NLIBhh/DuugL5gxQADkrmU17PCVP2Jas6GzS6Z/RN4mqWk/DonDVPREEURS
 KtY/SkzaUnaNpZicdcubIMkJBl1HNhTcT1Li9PmZEdPWP5fIbnPPZtfTBZw62eopiwax
 AYUHHkCAWnxPPiIh+9o1V3LItUnPURu3vGUftCiOgXlV6RK0QOK3nIZyXowr+AAWh8V2
 8Lde3hQJ0WnrQmd/TRzGnuJ1J6Escbb799gbr6gkeNRbZa6oXlITOCa+z7Ch7HJGy6n1
 0DeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719350392; x=1719955192;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8pE+mGdO/b9jNU7f8ar060kbPsajGXfM93JqBNGUkgg=;
 b=JduF77fhdNYGIAa4kVNkQ+zIZfi7+aM2l5cZikVPVnJIiBrEBqJfaPvJJinPITYw0P
 bnbH6kF0R1ZDEtYIjBaM0giQBiHHEkml/nTj92TMzn8L6qMbtW5fTus+AZHlVOJkhFAx
 VzZO176yQzhTw6pG/uXfgLFhjpZ+Kn38kDQ6meLgpMm4n7WU40I5LkgF7C8Q2uzE5Vyf
 Wghb8qgYqcKXVsxj2nPFSGJEcc0lhUq/3ATxPvCjvDxbNmKS96WJtUqlNRnv/QBR9WuA
 C7QdAEueYWQG0Hz2hCqRRuYnxAxtrDTXcShU5+g9rh9r2m/O0KXo8983+tOmlcvYcJBR
 FleQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+4Zj2NLrEIln/XCMF2JtTmIT0ZTfGcYlzZSJ379OAwYRGzz8BwVoECbXTPwDSKXQT1gG9nCLNIH6fssBrFXf+N7YjlyRT5lfLEU5sC6MNWDmI7c0tbd75ONFliIa5wQStGEImIhg45riHx7qM52ev
X-Gm-Message-State: AOJu0Yz4AWlvfkyWwV9oXA7DJ8wdZAtxG2o8BiJD8mU/Vnj7ZbCY9srQ
 ovUgjHfU37dcIKriy5hFSO2QG4EBB+MT5ohK2g8Lbe1dwMn1LRQqBjuTlogHsWLpL8lgKBQj783
 OSy5O+mMkYMncRsyBMC9UfuHimSU=
X-Google-Smtp-Source: AGHT+IFfpS/mJqzmwoGoJ1zaWvoriUTloqnkED1TLqGgvkdc3QDnupkHUmMDbY7hT8896/uRk2P5PekLygV2OxySsj8=
X-Received: by 2002:a05:6808:1491:b0:3d1:be9f:c9a3 with SMTP id
 5614622812f47-3d54587950amr10755257b6e.0.1719350391814; Tue, 25 Jun 2024
 14:19:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240608-adreno-v1-1-2e470480eee7@gmail.com>
 <CAF6AEGsd6jfDqV-EOWr+oMjPpVr2S+71VYmp1JoY8xU51eeEEw@mail.gmail.com>
 <20240625175926.4xyzwjyx7oxcwnzx@hu-akhilpo-hyd.qualcomm.com>
 <CAF6AEGt5=bcni0K1ysot3-hVj9gWECJ5qP=M-sEDkRrAmEHFGg@mail.gmail.com>
 <20240625202308.prg72urp4mvtxzax@hu-akhilpo-hyd.qualcomm.com>
In-Reply-To: <20240625202308.prg72urp4mvtxzax@hu-akhilpo-hyd.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 25 Jun 2024 14:19:38 -0700
Message-ID: <CAF6AEGs4i4mM9dpD3weG8GunHHfM0JESkzgX1Wd4PBDYatbQqg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: request memory region
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Kiarash Hajian <kiarash8112hajian@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
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

On Tue, Jun 25, 2024 at 1:23=E2=80=AFPM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On Tue, Jun 25, 2024 at 11:03:42AM -0700, Rob Clark wrote: > On Tue, Jun =
25, 2024 at 10:59=E2=80=AFAM Akhil P Oommen <quic_akhilpo@quicinc.com> wrot=
e:
> > >
> > > On Fri, Jun 21, 2024 at 02:09:58PM -0700, Rob Clark wrote:
> > > > On Sat, Jun 8, 2024 at 8:44=E2=80=AFAM Kiarash Hajian
> > > > <kiarash8112hajian@gmail.com> wrote:
> > > > >
> > > > > The driver's memory regions are currently just ioremap()ed, but n=
ot
> > > > > reserved through a request. That's not a bug, but having the requ=
est is
> > > > > a little more robust.
> > > > >
> > > > > Implement the region-request through the corresponding managed
> > > > > devres-function.
> > > > >
> > > > > Signed-off-by: Kiarash Hajian <kiarash8112hajian@gmail.com>
> > > > > ---
> > > > > Changes in v6:
> > > > >     -Fix compile error
> > > > >     -Link to v5: https://lore.kernel.org/all/20240607-memory-v1-1=
-8664f52fc2a1@gmail.com
> > > > >
> > > > > Changes in v5:
> > > > >     - Fix error hanlding problems.
> > > > >     - Link to v4: https://lore.kernel.org/r/20240512-msm-adreno-m=
emory-region-v4-1-3881a64088e6@gmail.com
> > > > >
> > > > > Changes in v4:
> > > > >     - Combine v3 commits into a singel commit
> > > > >     - Link to v3: https://lore.kernel.org/r/20240512-msm-adreno-m=
emory-region-v3-0-0a728ad45010@gmail.com
> > > > >
> > > > > Changes in v3:
> > > > >     - Remove redundant devm_iounmap calls, relying on devres for =
automatic resource cleanup.
> > > > >
> > > > > Changes in v2:
> > > > >     - update the subject prefix to "drm/msm/a6xx:", to match the =
majority of other changes to this file.
> > > > > ---
> > > > >  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 33 +++++++++++----------=
------------
> > > > >  1 file changed, 11 insertions(+), 22 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/=
drm/msm/adreno/a6xx_gmu.c
> > > > > index 8bea8ef26f77..d26cc6254ef9 100644
> > > > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > > > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > > > > @@ -525,7 +525,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gm=
u *gmu)
> > > > >         bool pdc_in_aop =3D false;
> > > > >
> > > > >         if (IS_ERR(pdcptr))
> > > > > -               goto err;
> > > > > +               return;
> > > > >
> > > > >         if (adreno_is_a650(adreno_gpu) ||
> > > > >             adreno_is_a660_family(adreno_gpu) ||
> > > > > @@ -541,7 +541,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gm=
u *gmu)
> > > > >         if (!pdc_in_aop) {
> > > > >                 seqptr =3D a6xx_gmu_get_mmio(pdev, "gmu_pdc_seq")=
;
> > > > >                 if (IS_ERR(seqptr))
> > > > > -                       goto err;
> > > > > +                       return;
> > > > >         }
> > > > >
> > > > >         /* Disable SDE clock gating */
> > > > > @@ -633,12 +633,6 @@ static void a6xx_gmu_rpmh_init(struct a6xx_g=
mu *gmu)
> > > > >         wmb();
> > > > >
> > > > >         a6xx_rpmh_stop(gmu);
> > > > > -
> > > > > -err:
> > > > > -       if (!IS_ERR_OR_NULL(pdcptr))
> > > > > -               iounmap(pdcptr);
> > > > > -       if (!IS_ERR_OR_NULL(seqptr))
> > > > > -               iounmap(seqptr);
> > > > >  }
> > > > >
> > > > >  /*
> > > > > @@ -1503,7 +1497,7 @@ static void __iomem *a6xx_gmu_get_mmio(stru=
ct platform_device *pdev,
> > > > >                 return ERR_PTR(-EINVAL);
> > > > >         }
> > > > >
> > > > > -       ret =3D ioremap(res->start, resource_size(res));
> > > > > +       ret =3D devm_ioremap_resource(&pdev->dev, res);
> > > >
> > > > So, this doesn't actually work, failing in __request_region_locked(=
),
> > > > because the gmu region partially overlaps with the gpucc region (wh=
ich
> > > > is busy).  I think this is intentional, since gmu is controlling th=
e
> > > > gpu clocks, etc.  In particular REG_A6XX_GPU_CC_GX_GDSCR is in this
> > > > overlapping region.  Maybe Akhil knows more about GMU.
> > >
> > > We don't really need to map gpucc region from driver on behalf of gmu=
.
> > > Since we don't access any gpucc register from drm-msm driver, we can
> > > update the range size to correct this. But due to backward compatibil=
ity
> > > requirement with older dt, can we still enable region locking? I pref=
er
> > > it if that is possible.
> >
> > Actually, when I reduced the region size to not overlap with gpucc,
> > the region is smaller than REG_A6XX_GPU_CC_GX_GDSCR * 4.
> >
> > So I guess that register is actually part of gpucc?
>
> Yes. It has *GPU_CC* in its name. :P
>
> I just saw that we program this register on legacy a6xx targets to
> ensure retention is really ON before collapsing gdsc. So we can't
> avoid mapping gpucc region in legacy a6xx GPUs. That is unfortunate!

I guess we could still use devm_ioremap().. idk if there is a better
way to solve this

BR,
-R

> -Akhil.
>
> >
> > BR,
> > -R
> >
> > > FYI, kgsl accesses gpucc registers to ensure gdsc has collapsed. So
> > > gpucc region has to be mapped by kgsl and that is reflected in the kg=
sl
> > > device tree.
> > >
> > > -Akhil
> > >
> > > >
> > > > BR,
> > > > -R
> > > >
> > > > >         if (!ret) {
> > > > >                 DRM_DEV_ERROR(&pdev->dev, "Unable to map the %s r=
egisters\n", name);
> > > > >                 return ERR_PTR(-EINVAL);
> > > > > @@ -1613,13 +1607,13 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu=
 *a6xx_gpu, struct device_node *node)
> > > > >         gmu->mmio =3D a6xx_gmu_get_mmio(pdev, "gmu");
> > > > >         if (IS_ERR(gmu->mmio)) {
> > > > >                 ret =3D PTR_ERR(gmu->mmio);
> > > > > -               goto err_mmio;
> > > > > +               goto err_cleanup;
> > > > >         }
> > > > >
> > > > >         gmu->cxpd =3D dev_pm_domain_attach_by_name(gmu->dev, "cx"=
);
> > > > >         if (IS_ERR(gmu->cxpd)) {
> > > > >                 ret =3D PTR_ERR(gmu->cxpd);
> > > > > -               goto err_mmio;
> > > > > +               goto err_cleanup;
> > > > >         }
> > > > >
> > > > >         if (!device_link_add(gmu->dev, gmu->cxpd, DL_FLAG_PM_RUNT=
IME)) {
> > > > > @@ -1635,7 +1629,7 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *=
a6xx_gpu, struct device_node *node)
> > > > >         gmu->gxpd =3D dev_pm_domain_attach_by_name(gmu->dev, "gx"=
);
> > > > >         if (IS_ERR(gmu->gxpd)) {
> > > > >                 ret =3D PTR_ERR(gmu->gxpd);
> > > > > -               goto err_mmio;
> > > > > +               goto err_cleanup;
> > > > >         }
> > > > >
> > > > >         gmu->initialized =3D true;
> > > > > @@ -1645,9 +1639,7 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *=
a6xx_gpu, struct device_node *node)
> > > > >  detach_cxpd:
> > > > >         dev_pm_domain_detach(gmu->cxpd, false);
> > > > >
> > > > > -err_mmio:
> > > > > -       iounmap(gmu->mmio);
> > > > > -
> > > > > +err_cleanup:
> > > > >         /* Drop reference taken in of_find_device_by_node */
> > > > >         put_device(gmu->dev);
> > > > >
> > > > > @@ -1762,7 +1754,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu=
, struct device_node *node)
> > > > >                 gmu->rscc =3D a6xx_gmu_get_mmio(pdev, "rscc");
> > > > >                 if (IS_ERR(gmu->rscc)) {
> > > > >                         ret =3D -ENODEV;
> > > > > -                       goto err_mmio;
> > > > > +                       goto err_cleanup;
> > > > >                 }
> > > > >         } else {
> > > > >                 gmu->rscc =3D gmu->mmio + 0x23000;
> > > > > @@ -1774,13 +1766,13 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_g=
pu, struct device_node *node)
> > > > >
> > > > >         if (gmu->hfi_irq < 0 || gmu->gmu_irq < 0) {
> > > > >                 ret =3D -ENODEV;
> > > > > -               goto err_mmio;
> > > > > +               goto err_cleanup;
> > > > >         }
> > > > >
> > > > >         gmu->cxpd =3D dev_pm_domain_attach_by_name(gmu->dev, "cx"=
);
> > > > >         if (IS_ERR(gmu->cxpd)) {
> > > > >                 ret =3D PTR_ERR(gmu->cxpd);
> > > > > -               goto err_mmio;
> > > > > +               goto err_cleanup;
> > > > >         }
> > > > >
> > > > >         link =3D device_link_add(gmu->dev, gmu->cxpd, DL_FLAG_PM_=
RUNTIME);
> > > > > @@ -1824,10 +1816,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gp=
u, struct device_node *node)
> > > > >  detach_cxpd:
> > > > >         dev_pm_domain_detach(gmu->cxpd, false);
> > > > >
> > > > > -err_mmio:
> > > > > -       iounmap(gmu->mmio);
> > > > > -       if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "r=
scc"))
> > > > > -               iounmap(gmu->rscc);
> > > > > +err_cleanup:
> > > > >         free_irq(gmu->gmu_irq, gmu);
> > > > >         free_irq(gmu->hfi_irq, gmu);
> > > > >
> > > > >
> > > > > ---
> > > > > base-commit: 1b294a1f35616977caddaddf3e9d28e576a1adbc
> > > > > change-id: 20240608-adreno-98c412bfdc03
> > > > >
> > > > > Best regards,
> > > > > --
> > > > > Kiarash Hajian <kiarash8112hajian@gmail.com>
> > > > >

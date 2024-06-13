Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8419068C1
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 11:31:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 168AD10E9D1;
	Thu, 13 Jun 2024 09:31:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="alvBDEQe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C8AA10E9D0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 09:31:19 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-43fecdecd32so3865121cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 02:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1718271078;
 x=1718875878; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5M3ELKqqsvIZfzOpsu+gAgFZkgR2tBXp2Hwr3Ne0u3I=;
 b=alvBDEQe7oXW5pxbDa2wCcpa0DMlSpDHoGJA460ut7ue3v8ssRPayuEPt0O1ozzOaW
 l5PpZ+oMs5JJc0DKJ++0VXNlNBdtAL2gX4bG22PE9aZhsoB/o4WbvXJf3GG1JH+eEzp4
 dVFmhEYfRrYL5ciMvk+t/2DP4n6evYfW9agteibjX8L+auK/RcTHOVcEmnpdgRdTLhWb
 ur4l7RwbeJzcaRj/yehnEKhVf13QZ9OSDC4rhfOCROD0EYshaVmGE1qPNNCvxuPPxQRI
 gx+IABvXIg0yyDGg2igozbFrtL3JA2luePHcvKIh1vjN1secCzUAwvS7jhRA6fX19okg
 b4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718271078; x=1718875878;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5M3ELKqqsvIZfzOpsu+gAgFZkgR2tBXp2Hwr3Ne0u3I=;
 b=HF/MdNa6H7u4Ma2CPeGpbHDZMbRiZ47YpwoMZMvhnlUNpHor2P4PDDUQI+/Zko3T6n
 cCA3WzzEhKDKWMKzOa0fKENMOORxvtMf+XpJzyazqIOhW4IDhz/zZ2E1DJa5pMi5dk7v
 eUrJ07AQlmYY9VbL07x/ZOFOFay+NVIGKFbf2zFn5PbnXTV4DQGmeCHRN1i/OETood4h
 S5DOlFBkEnnUIbHTaI8FKmWVmzpqvHawuaCbt8abuwc9UBnkZvBiJ1cpoSYpJ/KIXxZh
 SeM6rn9gU7WXkzIexIehiMNgSTtA/MJz88U0TM4eBZQr3l3VSpp6nRBiL2sbTriPZYN+
 rt/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIp+6/NNlzziqlMDaG0VTn/GWUf+9GIpVdaLxI0VU02AVrQeQEOM0q0dAd+695sh8523LSGvBCUg9GFb4lLwCss9PLBU+jLFbirMFbGMAQ
X-Gm-Message-State: AOJu0YwI2+zGfghe8GuDEJGw3PZZg2BIs5d846U5vf9TsLSjgYnUWjAM
 48j7jH1CIdpJVFggcjAbdHNmAJUKiASqg8ICg+s1gL9c19Aa+k4aS0ASyOxpImKPKAo00nCocHR
 lqKp94Q==
X-Google-Smtp-Source: AGHT+IGEg+msqhcKahAqNVmdcivwLBQhVqV7OGWDJqAoB7wg423qxIwqBQzXJTxRJa8BeIgGzCDuxg==
X-Received: by 2002:a05:622a:347:b0:441:2d9:566d with SMTP id
 d75a77b69052e-4415ac0dd14mr35675571cf.10.1718271078549; 
 Thu, 13 Jun 2024 02:31:18 -0700 (PDT)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com.
 [209.85.160.173]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-441ef3d96e8sm4533641cf.1.2024.06.13.02.31.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jun 2024 02:31:18 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-440f035214eso4263391cf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 02:31:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVgips8Ud1zi10/rQ8QoJhsy31l+sZ5PE3uwyMPeUIqp+3Q/Ri4wFtlWef2ezcLMIUPe21r30abg4J3s92pscravkeoHT4RLR0cilqdAWjm
X-Received: by 2002:a05:6902:2207:b0:dfe:6002:683 with SMTP id
 3f1490d57ef6-dfe67063c46mr4743823276.32.1718270658168; Thu, 13 Jun 2024
 02:24:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net>
 <20240612-6-10-rocket-v1-2-060e48eea250@tomeuvizoso.net>
 <ffviz6ak6qsn2reg5y35aerzy7wxfx6fzix6xjyminbhfcguus@clszdjakdcjd>
In-Reply-To: <ffviz6ak6qsn2reg5y35aerzy7wxfx6fzix6xjyminbhfcguus@clszdjakdcjd>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Thu, 13 Jun 2024 11:24:06 +0200
X-Gmail-Original-Message-ID: <CAAObsKCx+r5UuESnrPem1Rb1-BF4i8FVwu6uozWhABOWoq+M4Q@mail.gmail.com>
Message-ID: <CAAObsKCx+r5UuESnrPem1Rb1-BF4i8FVwu6uozWhABOWoq+M4Q@mail.gmail.com>
Subject: Re: [PATCH 2/9] iommu/rockchip: Attach multiple power domains
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Heiko Stuebner <heiko@sntech.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Oded Gabbay <ogabbay@kernel.org>, Tomeu Vizoso <tomeu.vizoso@tomeuvizoso.net>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
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

On Thu, Jun 13, 2024 at 2:05=E2=80=AFAM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hi,
>
> On Wed, Jun 12, 2024 at 03:52:55PM GMT, Tomeu Vizoso wrote:
> > IOMMUs with multiple base addresses can also have multiple power
> > domains.
> >
> > The base framework only takes care of a single power domain, as some
> > devices will need for these power domains to be powered on in a specifi=
c
> > order.
> >
> > Use a helper function to stablish links in the order in which they are
> > in the DT.
> >
> > This is needed by the IOMMU used by the NPU in the RK3588.
> >
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > ---
>
> To me it looks like this is multiple IOMMUs, which should each get
> their own node. I don't see a good reason for merging these
> together.

I have made quite a few attempts at splitting the IOMMUs and also the
cores, but I wasn't able to get things working stably. The TRM is
really scant about how the 4 IOMMU instances relate to each other, and
what the fourth one is for.

Given that the vendor driver treats them as a single IOMMU with four
instances and we don't have any information on them, I resigned myself
to just have them as a single device.

I would love to be proved wrong though and find a way fo getting
things stably as different devices so they can be powered on and off
as needed. We could save quite some code as well.

> I will still review this assuming there is one. That would require
> to first of all update the DT binding:
>
> Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
>
> 1. It does not allow using "power-domain-names" property
> 2. It limits the number of allowed power-domains to 1
> 3. It limits the number of allowed base addresses to 2
>
> Looking at the DT patch you also add more interrupts and clocks,
> which are also limited by the binding. You should see a bunch of
> warnings when you check the DTBS via 'make dtbs_check'

Oops, yeah, I was limiting dtbs_check with DT_SCHEMA_FILES, now I see
the errors.

> >  drivers/iommu/rockchip-iommu.c | 36 ++++++++++++++++++++++++++++++++++=
++
> >  1 file changed, 36 insertions(+)
> >
> > diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-io=
mmu.c
> > index f5629515bd78..673b0ebb6262 100644
> > --- a/drivers/iommu/rockchip-iommu.c
> > +++ b/drivers/iommu/rockchip-iommu.c
> > @@ -6,6 +6,8 @@
> >   *                   Daniel Kurtz <djkurtz@chromium.org>
> >   */
> >
> > +#include "linux/err.h"
> > +#include "linux/pm_domain.h"
> >  #include <linux/clk.h>
> >  #include <linux/compiler.h>
> >  #include <linux/delay.h>
> > @@ -115,6 +117,7 @@ struct rk_iommu {
> >       struct iommu_device iommu;
> >       struct list_head node; /* entry in rk_iommu_domain.iommus */
> >       struct iommu_domain *domain; /* domain to which iommu is attached=
 */
> > +     struct dev_pm_domain_list *pmdomains;
> >  };
> >
> >  struct rk_iommudata {
> > @@ -1186,6 +1189,7 @@ static int rk_iommu_probe(struct platform_device =
*pdev)
> >       struct resource *res;
> >       const struct rk_iommu_ops *ops;
> >       int num_res =3D pdev->num_resources;
> > +     int pm_domain_count;
> >       int err, i;
> >
> >       iommu =3D devm_kzalloc(dev, sizeof(*iommu), GFP_KERNEL);
> > @@ -1271,6 +1275,35 @@ static int rk_iommu_probe(struct platform_device=
 *pdev)
> >       if (!dma_dev)
> >               dma_dev =3D &pdev->dev;
> >
> > +     pm_domain_count =3D of_property_count_strings(iommu->dev->of_node=
, "power-domain-names");
>
> pm_domain_count =3D device_property_string_array_count(iommu->dev, "power=
-domain-names");
>
> When possible using device_property_ is prefered, since it allows
> reusing code for systems not using DT.
>
> > +     if (pm_domain_count > 0) {
> > +             const char **pm_domains =3D kvmalloc_array(pm_domain_coun=
t, sizeof(*pm_domains), GFP_KERNEL);
> > +             struct dev_pm_domain_attach_data pm_domain_data =3D {
> > +                     .pd_names =3D pm_domains,
> > +                     .num_pd_names =3D pm_domain_count,
> > +                     .pd_flags =3D PD_FLAG_DEV_LINK_ON,
> > +             };
> > +             int i;
> > +
> > +             if (!pm_domain_data.pd_names) {
> > +                     err =3D -ENOMEM;
> > +                     goto err_remove_sysfs;
> > +             }
> > +
> > +             for (i =3D 0; i < pm_domain_count; i++) {
> > +                     err =3D of_property_read_string_index(iommu->dev-=
>of_node, "power-domain-names", i, &pm_domains[i]);
> > +                     if (err) {
> > +                             kfree(pm_domains);
> > +                             goto err_remove_sysfs;
> > +                     }
> > +             }
>
> There is a helper to read a string array:
>
> err =3D device_property_read_string_array(iommu->dev, "power-domain-names=
", pm_domains, pm_domain_count);


Thanks for the review,

Tomeu

> -- Sebastian
>
> > +
> > +             err =3D dev_pm_domain_attach_list(iommu->dev, &pm_domain_=
data, &iommu->pmdomains);
> > +             kfree(pm_domains);
> > +             if (err < 0)
> > +                     goto err_remove_sysfs;
> > +     }
> > +
> >       pm_runtime_enable(dev);
> >
> >       for (i =3D 0; i < iommu->num_irq; i++) {
> > @@ -1292,6 +1325,7 @@ static int rk_iommu_probe(struct platform_device =
*pdev)
> >       return 0;
> >  err_pm_disable:
> >       pm_runtime_disable(dev);
> > +     dev_pm_domain_detach_list(iommu->pmdomains);
> >  err_remove_sysfs:
> >       iommu_device_sysfs_remove(&iommu->iommu);
> >  err_unprepare_clocks:
> > @@ -1310,6 +1344,8 @@ static void rk_iommu_shutdown(struct platform_dev=
ice *pdev)
> >               devm_free_irq(iommu->dev, irq, iommu);
> >       }
> >
> > +     dev_pm_domain_detach_list(iommu->pmdomains);
> > +
> >       pm_runtime_force_suspend(&pdev->dev);
> >  }
> >
> >
> > --
> > 2.45.2
> >
> >

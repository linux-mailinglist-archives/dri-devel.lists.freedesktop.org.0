Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 723AA906922
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 11:41:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A191F10E9EA;
	Thu, 13 Jun 2024 09:41:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="OmE4yW/O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F1D10E9EA
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 09:41:30 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-1f6e183f084so6323535ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 02:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1718271690;
 x=1718876490; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tCGcmMkVAYD3NfdijGLTxRKIxsWVC1ouY5NCrb4R7to=;
 b=OmE4yW/OzvDQ3Wp61HFYHpulayT5EmPaIFw/9FWNMmhUtKKrlf6zQzZothhHbYhKz+
 7VLI2KJRp26BuanYlxww+b1/xfx5dnFT2swWGVkvpfWomlbo0LAehqf6+Q9oQf31ajjr
 GBEp9RwPKEI5aFeEpWwrlg2tOo90gM56wFsDO6ICeFOPq46foKIWS5oAAsXkz7StQ8qH
 NJinodTIfFM87wKsshlzZ3K6bnfkfDFP8LF5gSdUHBVUQrXTQnkz3sXKwMeZ0Zvh/Oti
 K2w9w/eQf0r4i6+7uAHBdWHIUJMol1HOnRPdPxhH8r3jT+d0Vds1ymVvEze/2tG8Ng0G
 yY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718271690; x=1718876490;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tCGcmMkVAYD3NfdijGLTxRKIxsWVC1ouY5NCrb4R7to=;
 b=H7PfMLglX1Cv4UaL5CRdElfO7t1GT0iH8fKXCplDt0ib/I0RCLszNKYNG4verc5alP
 9k+wTo3m2+THWcJKty6iAnw0KKJP6oC8rMLKIqMQVtW7KKzE8LAFEy7MCnm7keunJPa9
 G0IL/rpDdUrZ4l4DW/zuEzjwbupeCqKb8NKzERR5E2ChV/N206fsRYj7/GdscUFWdgV2
 gUaOFaBWsUSwQTD0AkSDBQ53rAfTOa0JeezpU135Cg0ph57onvv3hH1ynJvTv1ATEw99
 BDCAtGni9AhfwwWkP/yk2fQO9vdd8iqdg0Bm1PPmBIjuPHOlgF5BU/Me7Fz431SSolRf
 zUdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUffYaYNRbh04hekZSLRuxuLPo4ie66WNW8RxyWiAuD7yvOV3qV6KN1eGWy5ai6legkLW+WSxgy9L0zOlxbYHO6NqHVv6KRCImzmj9omAmy
X-Gm-Message-State: AOJu0Yy6KiAn80FLqlKHltskHrAI019jGOlhQGWQksA6UNdbR3sgv41P
 GNXCI4F3zlInAYeTz1S2Fr0crokOUHi98PRBOBiaoC/GcO1hXEM10flqaLvNPT+o5xzbhj65SIl
 /jHo=
X-Google-Smtp-Source: AGHT+IGqCfcQs0fKDunxuTdSTAqBX8LQJfpJU0HCquXN7/rvhIoMT9ob/6UJxxaeiMddWdKQ4z791w==
X-Received: by 2002:a17:902:b683:b0:1f7:1ba3:b93e with SMTP id
 d9443c01a7336-1f83b569cdfmr38084115ad.21.1718271689584; 
 Thu, 13 Jun 2024 02:41:29 -0700 (PDT)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com.
 [209.85.216.42]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855f15231sm9390355ad.220.2024.06.13.02.41.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jun 2024 02:41:29 -0700 (PDT)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2c313edc316so605449a91.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 02:41:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVstBRRtaMIyrh9a0sQLdz5FUnImAzJvvuRaGgtV4v14NFyfflBUoFWkmjVifEHFCF2V93rZ3UZ9Kk6k7oebbrPVdqh/duF4ajJN9zKcVv0
X-Received: by 2002:a5b:5d2:0:b0:dfa:cd4a:b3aa with SMTP id
 3f1490d57ef6-dfe691067efmr4261141276.56.1718271253175; Thu, 13 Jun 2024
 02:34:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net>
 <20240612-6-10-rocket-v1-2-060e48eea250@tomeuvizoso.net>
 <ffviz6ak6qsn2reg5y35aerzy7wxfx6fzix6xjyminbhfcguus@clszdjakdcjd>
 <CAAObsKCx+r5UuESnrPem1Rb1-BF4i8FVwu6uozWhABOWoq+M4Q@mail.gmail.com>
In-Reply-To: <CAAObsKCx+r5UuESnrPem1Rb1-BF4i8FVwu6uozWhABOWoq+M4Q@mail.gmail.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Thu, 13 Jun 2024 11:34:02 +0200
X-Gmail-Original-Message-ID: <CAAObsKChaBZ2C5ezWsiZ_LoN6R2HFhFA9=UNSRYB6cyeo-jreg@mail.gmail.com>
Message-ID: <CAAObsKChaBZ2C5ezWsiZ_LoN6R2HFhFA9=UNSRYB6cyeo-jreg@mail.gmail.com>
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

On Thu, Jun 13, 2024 at 11:24=E2=80=AFAM Tomeu Vizoso <tomeu@tomeuvizoso.ne=
t> wrote:
>
> On Thu, Jun 13, 2024 at 2:05=E2=80=AFAM Sebastian Reichel
> <sebastian.reichel@collabora.com> wrote:
> >
> > Hi,
> >
> > On Wed, Jun 12, 2024 at 03:52:55PM GMT, Tomeu Vizoso wrote:
> > > IOMMUs with multiple base addresses can also have multiple power
> > > domains.
> > >
> > > The base framework only takes care of a single power domain, as some
> > > devices will need for these power domains to be powered on in a speci=
fic
> > > order.
> > >
> > > Use a helper function to stablish links in the order in which they ar=
e
> > > in the DT.
> > >
> > > This is needed by the IOMMU used by the NPU in the RK3588.
> > >
> > > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > > ---
> >
> > To me it looks like this is multiple IOMMUs, which should each get
> > their own node. I don't see a good reason for merging these
> > together.
>
> I have made quite a few attempts at splitting the IOMMUs and also the
> cores, but I wasn't able to get things working stably. The TRM is
> really scant about how the 4 IOMMU instances relate to each other, and
> what the fourth one is for.
>
> Given that the vendor driver treats them as a single IOMMU with four
> instances and we don't have any information on them, I resigned myself
> to just have them as a single device.
>
> I would love to be proved wrong though and find a way fo getting
> things stably as different devices so they can be powered on and off
> as needed. We could save quite some code as well.

FWIW, here a few ways how I tried to structure the DT nodes, none of
these worked reliably:

https://gitlab.freedesktop.org/tomeu/linux/-/blob/6.10-rocket-multiple-devi=
ces-power/arch/arm64/boot/dts/rockchip/rk3588s.dtsi?ref_type=3Dheads#L1163
https://gitlab.freedesktop.org/tomeu/linux/-/blob/6.10-rocket-schema-subnod=
es//arch/arm64/boot/dts/rockchip/rk3588s.dtsi?ref_type=3Dheads#L1162
https://gitlab.freedesktop.org/tomeu/linux/-/blob/6.10-rocket-multiple-devi=
ces//arch/arm64/boot/dts/rockchip/rk3588s.dtsi?ref_type=3Dheads#L1163
https://gitlab.freedesktop.org/tomeu/linux/-/blob/6.10-rocket-multiple-iomm=
us//arch/arm64/boot/dts/rockchip/rk3588s.dtsi?ref_type=3Dheads#L2669

I can very well imagine I missed some way of getting this to work, but
for every attempt, the domains, iommus and cores were resumed in
different orders that presumably caused problems during concurrent
execution fo workloads.

So I fell back to what the vendor driver does, which works reliably
(but all cores have to be powered on at the same time).

Thanks,

Tomeu

> > I will still review this assuming there is one. That would require
> > to first of all update the DT binding:
> >
> > Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
> >
> > 1. It does not allow using "power-domain-names" property
> > 2. It limits the number of allowed power-domains to 1
> > 3. It limits the number of allowed base addresses to 2
> >
> > Looking at the DT patch you also add more interrupts and clocks,
> > which are also limited by the binding. You should see a bunch of
> > warnings when you check the DTBS via 'make dtbs_check'
>
> Oops, yeah, I was limiting dtbs_check with DT_SCHEMA_FILES, now I see
> the errors.
>
> > >  drivers/iommu/rockchip-iommu.c | 36 ++++++++++++++++++++++++++++++++=
++++
> > >  1 file changed, 36 insertions(+)
> > >
> > > diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-=
iommu.c
> > > index f5629515bd78..673b0ebb6262 100644
> > > --- a/drivers/iommu/rockchip-iommu.c
> > > +++ b/drivers/iommu/rockchip-iommu.c
> > > @@ -6,6 +6,8 @@
> > >   *                   Daniel Kurtz <djkurtz@chromium.org>
> > >   */
> > >
> > > +#include "linux/err.h"
> > > +#include "linux/pm_domain.h"
> > >  #include <linux/clk.h>
> > >  #include <linux/compiler.h>
> > >  #include <linux/delay.h>
> > > @@ -115,6 +117,7 @@ struct rk_iommu {
> > >       struct iommu_device iommu;
> > >       struct list_head node; /* entry in rk_iommu_domain.iommus */
> > >       struct iommu_domain *domain; /* domain to which iommu is attach=
ed */
> > > +     struct dev_pm_domain_list *pmdomains;
> > >  };
> > >
> > >  struct rk_iommudata {
> > > @@ -1186,6 +1189,7 @@ static int rk_iommu_probe(struct platform_devic=
e *pdev)
> > >       struct resource *res;
> > >       const struct rk_iommu_ops *ops;
> > >       int num_res =3D pdev->num_resources;
> > > +     int pm_domain_count;
> > >       int err, i;
> > >
> > >       iommu =3D devm_kzalloc(dev, sizeof(*iommu), GFP_KERNEL);
> > > @@ -1271,6 +1275,35 @@ static int rk_iommu_probe(struct platform_devi=
ce *pdev)
> > >       if (!dma_dev)
> > >               dma_dev =3D &pdev->dev;
> > >
> > > +     pm_domain_count =3D of_property_count_strings(iommu->dev->of_no=
de, "power-domain-names");
> >
> > pm_domain_count =3D device_property_string_array_count(iommu->dev, "pow=
er-domain-names");
> >
> > When possible using device_property_ is prefered, since it allows
> > reusing code for systems not using DT.
> >
> > > +     if (pm_domain_count > 0) {
> > > +             const char **pm_domains =3D kvmalloc_array(pm_domain_co=
unt, sizeof(*pm_domains), GFP_KERNEL);
> > > +             struct dev_pm_domain_attach_data pm_domain_data =3D {
> > > +                     .pd_names =3D pm_domains,
> > > +                     .num_pd_names =3D pm_domain_count,
> > > +                     .pd_flags =3D PD_FLAG_DEV_LINK_ON,
> > > +             };
> > > +             int i;
> > > +
> > > +             if (!pm_domain_data.pd_names) {
> > > +                     err =3D -ENOMEM;
> > > +                     goto err_remove_sysfs;
> > > +             }
> > > +
> > > +             for (i =3D 0; i < pm_domain_count; i++) {
> > > +                     err =3D of_property_read_string_index(iommu->de=
v->of_node, "power-domain-names", i, &pm_domains[i]);
> > > +                     if (err) {
> > > +                             kfree(pm_domains);
> > > +                             goto err_remove_sysfs;
> > > +                     }
> > > +             }
> >
> > There is a helper to read a string array:
> >
> > err =3D device_property_read_string_array(iommu->dev, "power-domain-nam=
es", pm_domains, pm_domain_count);
>
>
> Thanks for the review,
>
> Tomeu
>
> > -- Sebastian
> >
> > > +
> > > +             err =3D dev_pm_domain_attach_list(iommu->dev, &pm_domai=
n_data, &iommu->pmdomains);
> > > +             kfree(pm_domains);
> > > +             if (err < 0)
> > > +                     goto err_remove_sysfs;
> > > +     }
> > > +
> > >       pm_runtime_enable(dev);
> > >
> > >       for (i =3D 0; i < iommu->num_irq; i++) {
> > > @@ -1292,6 +1325,7 @@ static int rk_iommu_probe(struct platform_devic=
e *pdev)
> > >       return 0;
> > >  err_pm_disable:
> > >       pm_runtime_disable(dev);
> > > +     dev_pm_domain_detach_list(iommu->pmdomains);
> > >  err_remove_sysfs:
> > >       iommu_device_sysfs_remove(&iommu->iommu);
> > >  err_unprepare_clocks:
> > > @@ -1310,6 +1344,8 @@ static void rk_iommu_shutdown(struct platform_d=
evice *pdev)
> > >               devm_free_irq(iommu->dev, irq, iommu);
> > >       }
> > >
> > > +     dev_pm_domain_detach_list(iommu->pmdomains);
> > > +
> > >       pm_runtime_force_suspend(&pdev->dev);
> > >  }
> > >
> > >
> > > --
> > > 2.45.2
> > >
> > >

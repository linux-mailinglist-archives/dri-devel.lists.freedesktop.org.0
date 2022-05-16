Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 808C0528677
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 16:07:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88AA110E4DC;
	Mon, 16 May 2022 14:07:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF5C10E4DC
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 14:07:18 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id m1so20695634wrb.8
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 07:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=sM2sRGLVCJ3Fk4PRrn+4dC0xyoX9H+fcNcN8bioAh10=;
 b=XEldJpEHMASSsGBrI5Mmn0Pi9N670GLUxxVJp9B5HOBl43K97MwoAJgO8rLsByNaeb
 lGFHZLdSMp5plsxPECl1hu/RCE92lA3mQMUkELx5ggDkbKbIrRbWl2CF5epTn2VVa9Bk
 EKleAupnQa510VCDAbAdsbYftuIScC1x7XiBfKKGJN4+Q4XS1jPWRU5vVJ/+q3ubfCcV
 CqQx3Zr2V7XIS4AOAoBetY/mlyaYWA5HTpaVMVfXp3aqrxwJLDkgz7shVZ2/UZ8uhN3P
 XQJSOuKhPUftPUtyRVyYYoaZl0WFTnNY6kIltroHODF1It8/lBZoYSRFsyKFcmYNaD1w
 gFVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=sM2sRGLVCJ3Fk4PRrn+4dC0xyoX9H+fcNcN8bioAh10=;
 b=kK3p4C0OEA6i/lSW+QxcahX3UWfia+rmjpp0AE09+6QZY2PfLgZzGZUgceHKFFtlY/
 99cpBQRF5EKQHAbIlLtVIJ89CbHyTIxNnsspIj+abn64V6zY6Vl8MJFvUKncEFFjsLaL
 RtFmz8VxcnoE3soWcswMzc3C+zKhFWJXaVY9+okCuUcUN21skuyNlWJBsmgpxuXC9MJO
 3+caXGqSC6OePs4HjDnTPf0llrmUqIG7sQjJA0OOPi4Z3qSc4Q2BNCx0cPiC5Gf/+OR8
 T6y3U0of0MCQd7Iqf4VEmc6Atgp2up4a+8ToB2eGd4FLlGllC7LDegy0sebvPYBJlBTa
 jFhA==
X-Gm-Message-State: AOAM533+rV2K6xQ6rZwidb09yJL2fDuANpPN5BtCEB4nYq7Py5RwYMz7
 ZIbrC00nUYNyxveH8mlBJ1I=
X-Google-Smtp-Source: ABdhPJy6o0QTxOZPvxVZf6UA03LSbXaPI3cJ5caJlhMXQFfhV3BWO5alGfIPKD4PGJbIVes3G4Q8Uw==
X-Received: by 2002:a5d:4988:0:b0:20d:9b8:e560 with SMTP id
 r8-20020a5d4988000000b0020d09b8e560mr3799784wrq.33.1652710036571; 
 Mon, 16 May 2022 07:07:16 -0700 (PDT)
Received: from orome (pd9e518f7.dip0.t-ipconnect.de. [217.229.24.247])
 by smtp.gmail.com with ESMTPSA id
 v8-20020adfa1c8000000b0020d050461c9sm5287367wrv.54.2022.05.16.07.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 07:07:15 -0700 (PDT)
Date: Mon, 16 May 2022 16:07:13 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [PATCH v5 5/9] iommu/arm-smmu: Attach to host1x context device bus
Message-ID: <YoJakX0ms7rBF3ia@orome>
References: <20220516085258.1227691-1-cyndis@kapsi.fi>
 <20220516085258.1227691-6-cyndis@kapsi.fi>
 <20220516100721.GA1927@willie-the-truck>
 <4a170997-c893-1788-dcaa-8ed2193146ae@kapsi.fi>
 <099cf0f9-5c27-0247-7c5e-6704a9527b11@arm.com>
 <020a8244-760e-fe7c-594a-1d85e5645dbe@kapsi.fi>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pzcJQLU+ls3tyqds"
Content-Disposition: inline
In-Reply-To: <020a8244-760e-fe7c-594a-1d85e5645dbe@kapsi.fi>
User-Agent: Mutt/2.2.4 (c3baa83e) (2022-04-30)
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski@canonical.com,
 Robin Murphy <robin.murphy@arm.com>, joro@8bytes.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jonathanh@nvidia.com, iommu@lists.linux-foundation.org, robh+dt@kernel.org,
 linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--pzcJQLU+ls3tyqds
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 16, 2022 at 02:20:18PM +0300, Mikko Perttunen wrote:
> On 5/16/22 13:44, Robin Murphy wrote:
> > On 2022-05-16 11:13, Mikko Perttunen wrote:
> > > On 5/16/22 13:07, Will Deacon wrote:
> > > > On Mon, May 16, 2022 at 11:52:54AM +0300, cyndis@kapsi.fi wrote:
> > > > > From: Mikko Perttunen <mperttunen@nvidia.com>
> > > > >=20
> > > > > Set itself as the IOMMU for the host1x context device bus, contai=
ning
> > > > > "dummy" devices used for Host1x context isolation.
> > > > >=20
> > > > > Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> > > > > ---
> > > > > =C2=A0 drivers/iommu/arm/arm-smmu/arm-smmu.c | 13 +++++++++++++
> > > > > =C2=A0 1 file changed, 13 insertions(+)
> > > > >=20
> > > > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > > > b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > > > index 568cce590ccc..9ff54eaecf81 100644
> > > > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > > > @@ -39,6 +39,7 @@
> > > > > =C2=A0 #include <linux/amba/bus.h>
> > > > > =C2=A0 #include <linux/fsl/mc.h>
> > > > > +#include <linux/host1x_context_bus.h>
> > > > > =C2=A0 #include "arm-smmu.h"
> > > > > @@ -2053,8 +2054,20 @@ static int arm_smmu_bus_init(struct
> > > > > iommu_ops *ops)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 goto err_reset_pci_ops;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > > =C2=A0 #endif
> > > > > +#ifdef CONFIG_TEGRA_HOST1X_CONTEXT_BUS
> > > > > +=C2=A0=C2=A0=C2=A0 if (!iommu_present(&host1x_context_device_bus=
_type)) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D bus_set_iommu=
(&host1x_context_device_bus_type, ops);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 goto err_reset_fsl_mc_ops;
> > > > > +=C2=A0=C2=A0=C2=A0 }
> > > > > +#endif
> > > > > +
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> > > > > +err_reset_fsl_mc_ops: __maybe_unused;
> > > > > +#ifdef CONFIG_FSL_MC_BUS
> > > > > +=C2=A0=C2=A0=C2=A0 bus_set_iommu(&fsl_mc_bus_type, NULL);
> > > > > +#endif
> > > >=20
> > > > bus_set_iommu() is going away:
> > > >=20
> > > > https://lore.kernel.org/r/cover.1650890638.git.robin.murphy@arm.com
> > > >=20
> > > > Will
> > >=20
> > > Thanks for the heads-up. Robin had pointed out that this work was
> > > ongoing but I hadn't seen the patches yet. I'll look into it.
> >=20
> > Although that *is* currently blocked on the mystery intel-iommu problem
> > that I can't reproduce... If this series is ready to land right now for
> > 5.19 then in principle that might be the easiest option overall.
> > Hopefully at least patch #2 could sneak in so that the compile-time
> > dependencies are ready for me to roll up host1x into the next rebase of
> > "iommu: Always register bus notifiers".
> >=20
> > Cheers,
> > Robin.
>=20
> My guess is that the series as a whole is not ready to land in the 5.19
> timeframe, but #2 could be possible.
>=20
> Thierry, any opinion?

Dave and Daniel typically want new material to be in by -rc6 and I've
already sent the PR for this cycle. I can ask them if they'd take
another one, though, if it make things simpler for the next cycle.

Thierry

--pzcJQLU+ls3tyqds
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmKCWpEACgkQ3SOs138+
s6HS5g/+NDlKp3MuR8qOz2HUhNTb5hZJliQREJuGJiH3Lb+xlTr9HRTYFTog5h2o
/8FYXEz/xNe0Ksteb58UEMgTzATGtPWYulLdKMfCLgHRSw9jwEG6IOtCweZv5fNf
9oAzyL/ZTpTOF330ce1BRfk/PvlNVLnetImK4b8OGmaj9ZMgvfNhgJpzq0jSkf7S
hTZozfgJ++nan7UBRnZofuYzhpbDGrTAbxhTgksppbF0nM6AykU1je/eQBZL6I05
ASNkCmDqun5PBmXYyMZChBXBhJl6Di2qKGy1kuFwrT2/K8a1WghA+J4ZiW6nGCH+
9jcbkiXYNiq6T8mwywq3zxONLKKB2gDr07doUPHr2ERBfmXtG+X6lxXq97Zq+eyV
N8RGawUV8cCELULq/U9t7k9WjNtCLNiLIhXKGj7c1QNK8PervlLaJqY2+t1HQzwt
JFWZcP2I1S3246kEhCbh+mPTKS+J5HkOgfgbVRkjcDY/lZrcK1QLmvsL95UFIt1f
pPRcBG9O2CNtjsN2rH8mOHs7dMpR6G1562YhRiRjGJubFFCg5Tmt/Mt7KyER4HGS
kosQh4xTIxzi6Cs0RIXDO/2krGcibkv3vlWJBsxNczzpoq63d7TIjXM5WaV0UKqL
UreHGegFDP9Q2xzfuJhqmaYOYg/E/VuRbZOO19Zn28tLtD/wiGY=
=fv4K
-----END PGP SIGNATURE-----

--pzcJQLU+ls3tyqds--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0428C03F5E
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 02:35:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C82910E984;
	Fri, 24 Oct 2025 00:35:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qe6AISXA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E4FF10E984
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 00:35:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2BA5C4B1CE
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 00:35:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ECDFC19423
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 00:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761266142;
 bh=PTncCyO74ELUzyL0VC+KcHhY+qg3bMKHZCe+2nsn7iQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qe6AISXAncGjND3Hg5i5xoFA245mb6Df8yHAuR7NgV7cFutjfq2sjnyQesy6O0rnM
 aXMIBo69Grpm3rHiIN1cYNpP0fhXf9n5l/GOYz43WAtUZANiaS49ZgqIA4ll72zaWU
 LJCpVlHiyggI0G+HANBmd3AWBkQnv/mmoVvkc22lXXsMKWS4IbrnFHgwCLKG1p9pKk
 jpNSRvkNeEHFvKhOOv4bAa7X45VgkAXmZzElB90MkCQa1t35yCldHG4jZkJ6GVDgKd
 xgX9FkppKc4Eds+0Th89WLeRZD4rpnqR7q/wL8WqCx9dGDi5dxPrzM3vrQ1FnSYuAt
 +MJNJZRsIngbQ==
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-b6cf30e5bbcso1034191a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 17:35:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVJcVA82IPVXL4mnxxsLSHHoUL65LwJ6plQ4d4FWjwZqLAeXiXN1N6LFf0B1jbJGKVoP6M3l+gckaA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxUP71Je44TS+mHVyil5RhC+uJpxNZqf1J3qoeohstOwHTK/+T
 wUgdIeP3yr6222b2IOTpLZfdwhkER0PkyIywb5YN1WTRuTRljDKQveYbumCuhRRGpRvlzmCfvzM
 uXquvkbSy2rJkZuu+sFicL7OB7CX7SA==
X-Google-Smtp-Source: AGHT+IGOMKLHi0CZOHqSh5IjaE+DgAa5Vkrkmi7gYN42ujUfgl+FvecwlSbnjr8WAwwoIN6a4Crw3ctvyAP+BawLEjM=
X-Received: by 2002:a17:902:f712:b0:26b:3cb5:a906 with SMTP id
 d9443c01a7336-29489e109b9mr8169415ad.16.1761266141410; Thu, 23 Oct 2025
 17:35:41 -0700 (PDT)
MIME-Version: 1.0
References: <20251023-mediatek-drm-hdmi-v2-v11-0-7873ec4a1edf@collabora.com>
 <20251023-mediatek-drm-hdmi-v2-v11-5-7873ec4a1edf@collabora.com>
 <CAAOTY_8y6C5=jSjzBVVJ2vJq1L+Nf9U0tZvxzVX-e-3g91xEeQ@mail.gmail.com>
 <a55c9480da785a8618dd60c3f3e0ddc398c5d45f.camel@collabora.com>
In-Reply-To: <a55c9480da785a8618dd60c3f3e0ddc398c5d45f.camel@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 24 Oct 2025 00:35:29 +0000
X-Gmail-Original-Message-ID: <CAAOTY_-f89vzGXzb_xRgpmx050tVM2+Ud6afR5iNycTROSmcYw@mail.gmail.com>
X-Gm-Features: AS18NWCs-ZOjPVHuitqceUJYqSJStFRyUNsop7HMJ8Io7hasX41agsqyg9N4J9c
Message-ID: <CAAOTY_-f89vzGXzb_xRgpmx050tVM2+Ud6afR5iNycTROSmcYw@mail.gmail.com>
Subject: Re: [PATCH v11 05/11] drm/mediatek: mtk_hdmi_common: Make CEC support
 optional
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 CK Hu <ck.hu@mediatek.com>, 
 kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
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

Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com> =E6=96=BC 2025=E5=B9=
=B410=E6=9C=8823=E6=97=A5
=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=885:05=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi,
>
> On Thu, 2025-10-23 at 15:59 +0000, Chun-Kuang Hu wrote:
> > Hi, Louis:
> >
> > Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com> =E6=96=BC 2025=
=E5=B9=B410=E6=9C=8823=E6=97=A5
> > =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8810:32=E5=AF=AB=E9=81=93=EF=BC=9A
> > >
> > > From: AngeloGioacchino Del Regno
> > > <angelogioacchino.delregno@collabora.com>
> > >
> > > In preparation for adding a new driver for HDMIv2, for which CEC
> > > is not strictly required, change the of_get_compatible_child()
> > > failure error to -ENOTSUPP to be able to differentiate between
> > > error conditions in mtk_hdmi_dt_parse_pdata().
> > >
> > > In that case, if -ENOTSUPP is returned, this driver will print
> > > an informative message saying that CEC support is unavailable,
> > > as the devicetree node for that was not found, but after that,
> > > function mtk_hdmi_dt_parse_pdata() will not return error to
> > > the caller.
> > >
> > > This will not change functionality of the mtk_hdmi (v1) driver
> > > as that is still checking whether CEC is present and, if not,
> > > will fail probing with an error saying that CEC is required
> > > by HDMIv1.
> > >
> > > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> > > Signed-off-by: AngeloGioacchino Del Regno
> > > <angelogioacchino.delregno@collabora.com>
> > > Signed-off-by: Louis-Alexis Eyraud
> > > <louisalexis.eyraud@collabora.com>
> > > ---
> > >  drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 9 +++++----
> > >  1 file changed, 5 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
> > > b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
> > > index
> > > f28e63716d7c2e2c6bdf5b28d24789bc926d2beb..989479fdfe40952762a1b6379
> > > 7bf602b520dcac5 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
> > > @@ -253,12 +253,11 @@ static int mtk_hdmi_get_cec_dev(struct
> > > mtk_hdmi *hdmi, struct device *dev, struc
> > >         /* The CEC module handles HDMI hotplug detection */
> > >         cec_np =3D of_get_compatible_child(np->parent,
> > > "mediatek,mt8173-cec");
> > >         if (!cec_np)
> > > -               return dev_err_probe(dev, -EINVAL, "Failed to find
> > > CEC node\n");
> > > +               return dev_err_probe(dev, -ENOTSUPP, "Failed to
> > > find CEC node\n");
> >
> > The checkpatch show the warning:
> >
> > WARNING: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
> > #40: FILE: drivers/gpu/drm/mediatek/mtk_hdmi_common.c:256:
> > +        return dev_err_probe(dev, -ENOTSUPP, "Failed to find CEC
> > node\n");
> >
> > I find many driver use ENOTSUPP, so I'm not sure which one is better.
> > I really don't understand the description about these two error code
> > [1].
> > If you choose ENOTSUPP, please give me some explain.
> >
> > [1] https://man7.org/linux/man-pages/man3/errno.3.html
> >
> > Regards,
> > Chun-Kuang.
> >
> >
> I think ENOTSUPP can be replaced by EOPNOTSUPP in this patch safely.
>
> There is only a single call of the mtk_hdmi_get_cec_dev function in the
> driver and the code that checks this particular return code value in
> mtk_hdmi_dt_parse_pdata function is also added by this patch.
>
> I also don't see no other occurrence of ENOTSUPP code in mediatek-drm
> and since checkpatch recommends to prefer EOPNOTSUPP over ENOTSUPP,
> let's replace it in this patch (both code and commit message).
>
> Do you want me to send a new version of the series for this change?

It's not necessary to send a new version of this series.
I would modify this patch when I apply it.

Regards,
Chun-Kuang.

>
> Regards,
> Louis-Alexis
>
> > >         cec_pdev =3D of_find_device_by_node(cec_np);
> > >         if (!cec_pdev) {
> > > -               dev_err(hdmi->dev, "Waiting for CEC device %pOF\n",
> > > -                       cec_np);
> > > +               dev_err(hdmi->dev, "Waiting for CEC device %pOF\n",
> > > cec_np);
> > >                 of_node_put(cec_np);
> > >                 return -EPROBE_DEFER;
> > >         }
> > > @@ -319,7 +318,9 @@ static int mtk_hdmi_dt_parse_pdata(struct
> > > mtk_hdmi *hdmi, struct platform_device
> > >                 return dev_err_probe(dev, -EINVAL, "Failed to get
> > > ddc i2c adapter by node\n");
> > >
> > >         ret =3D mtk_hdmi_get_cec_dev(hdmi, dev, np);
> > > -       if (ret)
> > > +       if (ret =3D=3D -ENOTSUPP)
> > > +               dev_info(dev, "CEC support unavailable: node not
> > > found\n");
> > > +       else if (ret)
> > >                 return ret;
> > >
> > >         return 0;
> > >
> > > --
> > > 2.51.0
> > >

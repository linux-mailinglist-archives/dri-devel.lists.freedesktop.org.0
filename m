Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AEC4BFE8E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 17:29:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9CC610E139;
	Tue, 22 Feb 2022 16:29:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6522E89F85;
 Tue, 22 Feb 2022 16:29:26 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 w16-20020a056830281000b005ad480e8dd5so8500605otu.9; 
 Tue, 22 Feb 2022 08:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WDMkvcXrvFCIfwqXXj8ZNdlL4q1BzrbMD+9YGad2AC8=;
 b=ZQuVn+wn8BmdTuzrfTawxJB39mBQLQL6meMaDkhqzCs4+MZJo4uIj2rK2As1Iy71K8
 oHmjvuOuQ2/hifwFKaEn3a/E2gRi9N+iAghYFkZw0CskSWl8EWbfkryk/KkDw2JtjxN1
 PXTeyv7nFMk1xanQhxh6EtkS89DKWEk/d3crdZnicKat0xUdnYCTUmuqUuewk/Xy68cE
 1LIVHLaZBVB7Wh+lB/oS/pfkZ3gDPELfX4GUEh+fvXfXv/rJSyfc4Kq+YqxjuOTRyRrn
 JTo8AuCVL1VfTrTJXovPhwzaBnGDK/CeZbFKlY1kaUW8hNod961VNY18Oyc3uRx68yba
 d9/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WDMkvcXrvFCIfwqXXj8ZNdlL4q1BzrbMD+9YGad2AC8=;
 b=vhV1pM0zX0OfZni1n8og5sNB8D+0ijhnZa2ogF2/t0sXdxuDeRkXkOfGsrsusiUsea
 L5by9+9a83UcPt4lqKSaetk1g71a01BFAE3BV7sJHPtZ7FdGGzhuynVyPVuahVpdCDCq
 yK8geI6w59XuR8ZBGtqBHkPwMZVgjf1Wi0Xo8XZTWucBwgvagF9W5CJWmIPdopW7jg8+
 /p1Ij4a59bMuDiVLLTsNeBmjptgsifQ19SCi84heO5sRX3HW2cgpM1F8MT+K5Jur315J
 wuY0eryWb+DChNs1BC0E7LLapYausKyPp0dNNkYhbUNPKN48uYdNutUH9kWQBlaWixD2
 9pBA==
X-Gm-Message-State: AOAM533sJGTfyoHdWqyLNOsMsh57P7DWn63W9SPGd1j3nobqEVNW/neW
 JnLhqXcLA5lFIw+v/89L6TNGwGC1BAhY2kWnU9s=
X-Google-Smtp-Source: ABdhPJyqybFdBgdg9H9adcKp77StqxCc/9gl0TUfTIrR8e+SE0PRdqtKFJXe9fzrIxbFvnbqaPxtZFFSNdcyN627NEA=
X-Received: by 2002:a05:6830:573:b0:5ad:5207:41d6 with SMTP id
 f19-20020a056830057300b005ad520741d6mr6208407otc.357.1645547365691; Tue, 22
 Feb 2022 08:29:25 -0800 (PST)
MIME-Version: 1.0
References: <20220222131701.356117-1-maira.canal@usp.br>
 <20220222131701.356117-3-maira.canal@usp.br>
In-Reply-To: <20220222131701.356117-3-maira.canal@usp.br>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 22 Feb 2022 11:29:14 -0500
Message-ID: <CADnq5_Nj1f+6mhd-w9XC62vuvA8Ndep9dV=AQED4v7D6YjzH4w@mail.gmail.com>
Subject: Re: [PATCH 02/10] drm/amdgpu: Remove tmp unused variable
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>
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
Cc: "Tuikov, Luben" <luben.tuikov@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>, "Joshi, Mukul" <mukul.joshi@amd.com>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>, xinhui pan <Xinhui.Pan@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 mwen@igalia.com, "Chai, Thomas" <YiPeng.Chai@amd.com>,
 "Stanley.Yang" <Stanley.Yang@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Magali Lemes <magalilemes00@gmail.com>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Isabella Basso <isabbasso@riseup.net>,
 John Clements <john.clements@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, Dennis Li <Dennis.Li@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 22, 2022 at 8:17 AM Ma=C3=ADra Canal <maira.canal@usp.br> wrote=
:
>
> The variable tmp is not used in the dce_v6_0_hpd_fini and
> dce_v8_0_hpd_fini functions. Therefor, the variable is removed in order t=
o
> avoid the following Clang warnings:
>
> drivers/gpu/drm/amd/amdgpu/dce_v6_0.c:331:6: warning: variable 'tmp' set =
but
> not used [-Wunused-but-set-variable]
>     u32 tmp;
>         ^
> drivers/gpu/drm/amd/amdgpu/dce_v8_0.c:325:6: warning: variable 'tmp' set =
but
> not used [-Wunused-but-set-variable]
>     u32 tmp;
>         ^
>
> Signed-off-by: Ma=C3=ADra Canal <maira.canal@usp.br>
> ---
>  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c | 4 +---
>  drivers/gpu/drm/amd/amdgpu/dce_v8_0.c | 4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/=
amdgpu/dce_v6_0.c
> index b90bc2adf778..2c61f0c2e709 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> @@ -328,7 +328,6 @@ static void dce_v6_0_hpd_fini(struct amdgpu_device *a=
dev)
>         struct drm_device *dev =3D adev_to_drm(adev);
>         struct drm_connector *connector;
>         struct drm_connector_list_iter iter;
> -       u32 tmp;
>
>         drm_connector_list_iter_begin(dev, &iter);
>         drm_for_each_connector_iter(connector, &iter) {
> @@ -337,8 +336,7 @@ static void dce_v6_0_hpd_fini(struct amdgpu_device *a=
dev)
>                 if (amdgpu_connector->hpd.hpd >=3D adev->mode_info.num_hp=
d)
>                         continue;
>
> -               tmp =3D RREG32(mmDC_HPD1_CONTROL + hpd_offsets[amdgpu_con=
nector->hpd.hpd]);
> -               tmp &=3D ~DC_HPD1_CONTROL__DC_HPD1_EN_MASK;
> +               RREG32(mmDC_HPD1_CONTROL + hpd_offsets[amdgpu_connector->=
hpd.hpd]);
>                 WREG32(mmDC_HPD1_CONTROL + hpd_offsets[amdgpu_connector->=
hpd.hpd], 0);

We should be writing tmp out here rather than 0.

>
>                 amdgpu_irq_put(adev, &adev->hpd_irq, amdgpu_connector->hp=
d.hpd);
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/=
amdgpu/dce_v8_0.c
> index 7c1379b02f94..c5e9c5dbd165 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> @@ -322,7 +322,6 @@ static void dce_v8_0_hpd_fini(struct amdgpu_device *a=
dev)
>         struct drm_device *dev =3D adev_to_drm(adev);
>         struct drm_connector *connector;
>         struct drm_connector_list_iter iter;
> -       u32 tmp;
>
>         drm_connector_list_iter_begin(dev, &iter);
>         drm_for_each_connector_iter(connector, &iter) {
> @@ -331,8 +330,7 @@ static void dce_v8_0_hpd_fini(struct amdgpu_device *a=
dev)
>                 if (amdgpu_connector->hpd.hpd >=3D adev->mode_info.num_hp=
d)
>                         continue;
>
> -               tmp =3D RREG32(mmDC_HPD1_CONTROL + hpd_offsets[amdgpu_con=
nector->hpd.hpd]);
> -               tmp &=3D ~DC_HPD1_CONTROL__DC_HPD1_EN_MASK;
> +               RREG32(mmDC_HPD1_CONTROL + hpd_offsets[amdgpu_connector->=
hpd.hpd]);
>                 WREG32(mmDC_HPD1_CONTROL + hpd_offsets[amdgpu_connector->=
hpd.hpd], 0);

Same here.  Care to send a patch to fix this up?

Thanks,

Alex

>
>                 amdgpu_irq_put(adev, &adev->hpd_irq, amdgpu_connector->hp=
d.hpd);
> --
> 2.35.1
>

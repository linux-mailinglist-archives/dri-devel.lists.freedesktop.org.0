Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C87B3F427
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 07:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94FBA10E59A;
	Tue,  2 Sep 2025 05:05:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hZMhVXM8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A28EA10E59A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 05:05:25 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-45b8b25296fso12993165e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 22:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756789524; x=1757394324; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UsvxK8OTvjy6mRY2UF8u2ijfI8Gfv3ds+RCWrhu9dI8=;
 b=hZMhVXM8nisBO6BL9Rvchfrd0V2V9XeGOw6wp47CKf5lPpR2VKIsntVtQIXzcAY5DG
 DQs0jp0c0NkuvVF1SJpLdnckcmx3zX7SAzauNjzWSpukRX/ZytzGjhPdtgfB/WegTo6y
 pv0CvGD3my0GT1ZKIMtEDzSVk1gMUHDPzFHUORU9gWV003eGp8KntXTVkcPrt/ugp3OQ
 uaKjgGf/ZHgLink7n1bXwdjNAxgZlTnAPITT+GdQIYwOI3bRFGHyvdePUYDejaJBh8Mh
 gUG+ga+NVzqR35d2eYaHQ/P84tBvmVU1zWCDQjuNI7f2f8LF/kn29ra1bzOrUirBSLyJ
 sz7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756789524; x=1757394324;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UsvxK8OTvjy6mRY2UF8u2ijfI8Gfv3ds+RCWrhu9dI8=;
 b=VqitxWwGf9ExzKtlBGL1b0K1lZh7o2d+J/PQeRtnwofEJwNz3HxclNjtwsUsGTHytn
 gLogvwBnRdEt1SvldI+zq9BoeGPYmFK4khcTtL1tyb0/7lqSfdsxp2t937XxmvENDAhH
 vmFlKIQywqSQ2/MR/GkrSbxoegNSYFaniBp8H8LKUvFUc0eYsjSZuL2fCFPPa+rmiuwU
 /MUICrf2D2R1ZGW3hT93J59lRUArTesbGBvqcuehWGUM8saE2SxAyspAj47k+fvseGeq
 3RT7cLrJWel185LiWKWCjcJojrhC+j3zC3Rn1FBfq+9iLGIBrfI2/dks5yrsTTYsHIJv
 XCDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWG5eRj0+UCsY1udr3zWFtMbpqsCWa6sMcsuSfoCg2pMOllKWLXkx7WeTXCuJR/eX7+krv9fSbrO00=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwzSv6YjC1gxaSfPUqjd0lMQrwmNlFayGD83lkZj+tNC98rO2Qc
 9nqKl1YjhzX8xcoPh8Q5lnCrjlNS3F7MEQqCFMJwDb/wwjE/ULTmAWLjqaz7f8VY3bB+LdpJJ71
 is/pnOOJRKTszjNsl0lwM68SHsY3bDI4=
X-Gm-Gg: ASbGncvn0B121Sk2JiJswu3E5un6+uCa3bFKf65XQEMxf3bmvnDttZ8qig8vknSlRI+
 YH5nQUqkogxiiFi2YO4ccRXHz8bDNm3XiCXK0/BIIov6n17ekFtlBSonRbZZ+ESpnb2k1yKufGn
 8ptLTQloWF2TSVVPoAXsP4Pll9dkVwoARuoGnrG0+1pV/BTUHK5h/3z5JFmpDweWS3Ah+UQXC3n
 Yob0VPw
X-Google-Smtp-Source: AGHT+IFaLGWrhMd9gaUFsjIuhaYuop/TR0fhRThMUYmbG5VO5CB2x6zfi844hhIhJImP7arGJuqPWad7TwuKTeA/xGg=
X-Received: by 2002:a5d:5f95:0:b0:3d0:b3cc:c21c with SMTP id
 ffacd0b85a97d-3d1e06aff5bmr7629522f8f.55.1756789523601; Mon, 01 Sep 2025
 22:05:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250819121631.84280-1-clamor95@gmail.com>
 <20250819121631.84280-8-clamor95@gmail.com>
 <6948375.lOV4Wx5bFT@senjougahara>
In-Reply-To: <6948375.lOV4Wx5bFT@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 2 Sep 2025 08:05:12 +0300
X-Gm-Features: Ac12FXyFWFQp9zyC-dC-muHX4hjhMNXKuUIlIfX1jsnphJFz8uYCWTVS01gjz_M
Message-ID: <CAPVz0n2dp7kdCWFLWQjQY+tGO_ayzxGW=zxx3FwX_yeeR9J2Bg@mail.gmail.com>
Subject: Re: [PATCH v1 07/19] staging: media: tegra-video: csi: parametrize
 MIPI calibration device presence
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>,
 linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-staging@lists.linux.dev
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

=D0=B2=D1=82, 2 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 03:47 Mikko=
 Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tuesday, August 19, 2025 9:16=E2=80=AFPM Svyatoslav Ryhel wrote:
> > Dedicated MIPI calibration block appears only in Tegra114, before Tegra=
114
> > all MIPI calibration pads were part of VI block.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/staging/media/tegra-video/csi.c      | 12 +++++++-----
> >  drivers/staging/media/tegra-video/csi.h      |  1 +
> >  drivers/staging/media/tegra-video/tegra210.c |  1 +
> >  3 files changed, 9 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/staging/media/tegra-video/csi.c
> > b/drivers/staging/media/tegra-video/csi.c index 74c92db1032f..2f9907a20=
db1
> > 100644
> > --- a/drivers/staging/media/tegra-video/csi.c
> > +++ b/drivers/staging/media/tegra-video/csi.c
> > @@ -485,11 +485,13 @@ static int tegra_csi_channel_alloc(struct tegra_c=
si
> > *csi, if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
> >               return 0;
> >
> > -     chan->mipi =3D tegra_mipi_request(csi->dev, node);
> > -     if (IS_ERR(chan->mipi)) {
> > -             ret =3D PTR_ERR(chan->mipi);
> > -             chan->mipi =3D NULL;
> > -             dev_err(csi->dev, "failed to get mipi device: %d\n", ret)=
;
> > +     if (csi->soc->has_mipi_calibration) {
> > +             chan->mipi =3D tegra_mipi_request(csi->dev, node);
>
> The way I would read 'soc->has_mipi_calibration' is that this device (CSI=
)
> contains the MIPI calibration hardware. I.e. the opposite of here. I woul=
d
> invert the logic and optionally call it e.g. 'internal_mipi_calib'.
>
> A cleaner way to do this might be to always call tegra_mipi_request et al=
. --
> on pre-Tegra114 SoCs this would just call back to the VI/CSI driver using=
 the
> callbacks registered in the MIPI driver as we discussed before. That way =
the
> CSI driver won't need separate code paths for SoCs with internal MIPI
> calibration and SoCs with the external MIPI calibration device.
>

So basically MIPI calibration device for Tegra20/Tegra30 has to be
created within CSI and when MIPI calibration is requested, CSI phandle
is used. Question: may I use a dedicated node for MIPI calibration
within CSI or it has to use CSI node itself? With dedicated node
configuration should be much simpler and can help avoiding probe of
entire.

> Cheers,
> Mikko
>
> > +             if (IS_ERR(chan->mipi)) {
> > +                     ret =3D PTR_ERR(chan->mipi);
> > +                     chan->mipi =3D NULL;
> > +                     dev_err(csi->dev, "failed to get mipi device:
> %d\n", ret);
> > +             }
> >       }
> >
> >       return ret;
> > diff --git a/drivers/staging/media/tegra-video/csi.h
> > b/drivers/staging/media/tegra-video/csi.h index 3ed2dbc73ce9..400b913bb=
1cb
> > 100644
> > --- a/drivers/staging/media/tegra-video/csi.h
> > +++ b/drivers/staging/media/tegra-video/csi.h
> > @@ -128,6 +128,7 @@ struct tegra_csi_soc {
> >       unsigned int num_clks;
> >       const struct tpg_framerate *tpg_frmrate_table;
> >       unsigned int tpg_frmrate_table_size;
> > +     bool has_mipi_calibration;
> >  };
> >
> >  /**
> > diff --git a/drivers/staging/media/tegra-video/tegra210.c
> > b/drivers/staging/media/tegra-video/tegra210.c index
> > da99f19a39e7..305472e94af4 100644
> > --- a/drivers/staging/media/tegra-video/tegra210.c
> > +++ b/drivers/staging/media/tegra-video/tegra210.c
> > @@ -1218,4 +1218,5 @@ const struct tegra_csi_soc tegra210_csi_soc =3D {
> >       .num_clks =3D ARRAY_SIZE(tegra210_csi_cil_clks),
> >       .tpg_frmrate_table =3D tegra210_tpg_frmrate_table,
> >       .tpg_frmrate_table_size =3D ARRAY_SIZE(tegra210_tpg_frmrate_table=
),
> > +     .has_mipi_calibration =3D true,
> >  };
>
>
>
>

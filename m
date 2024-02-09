Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 490C584F8B1
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 16:37:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 629C210F615;
	Fri,  9 Feb 2024 15:37:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="k6W2HO/6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB1EC10F615
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Feb 2024 15:37:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2551761DA0;
 Fri,  9 Feb 2024 15:37:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70F1EC433F1;
 Fri,  9 Feb 2024 15:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707493031;
 bh=pBxvQLSKhW0Vb+9sHbY5CZPr2bjHazBXEcaGBWdKWdA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k6W2HO/6cdwQN8D0khmZ4Izj4y0QMnmk1xgVLyL3+ROLye1f39SAvjYWgPizyk+B0
 auM5x/TpYU3TCQ/1Kc2ZjhCpqtHq+VnpmVk3pFZhhRpMdVVnA8icN1CVceii2lUM9N
 pgyYgtGFB+qPM1gZKs9vQHWCkLMF/1PVs2DBygMSb+asvVKJh0GbF0vpKXxs5UAt2N
 2Htauka95menjoN0LDSZLjq1/4Q3MSQiHcq/rf1aZ/+tYYNL21mm3EhQaZcH8cYkwc
 +9YRz6hnUOu4Q948SR7FCeu752iykRldvkZt+TkA5uo7P9AYQMohtGVpnLE7aAocu/
 nPqcmZ8ify9IA==
Date: Fri, 9 Feb 2024 16:37:09 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Keith Zhao <keith.zhao@starfivetech.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, 
 "airlied@gmail.com" <airlied@gmail.com>, 
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 William Qiu <william.qiu@starfivetech.com>, 
 Xingyu Wu <xingyu.wu@starfivetech.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, 
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>, 
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 Shengyang Chen <shengyang.chen@starfivetech.com>, 
 Jack Zhu <jack.zhu@starfivetech.com>,
 Changhuang Liang <changhuang.liang@starfivetech.com>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Subject: Re: RE: [v3 4/6] drm/vs: Add KMS crtc&plane
Message-ID: <veb4fyixov4wqlkpanbgxhd36shrqmsow5hpx4pji7mhfk5mxs@57mpolgixriz>
References: <20231204123315.28456-1-keith.zhao@starfivetech.com>
 <20231204123315.28456-5-keith.zhao@starfivetech.com>
 <o4ica2jg2rqfx6znir6j7mkoojoqzejjuqvlwcnehanw5mvop6@a3t6vi7c55tz>
 <NTZPR01MB1050C46113AD71AA5E93C67BEE7CA@NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn>
 <rvwcfjon4hjdx4youknherj2rrvvbfrn4bufdqlcd7tn3l5lc2@74rwotxzgyuq>
 <NTZPR01MB1050C500508E29152E845511EE43A@NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3gny2qe4uevq2gnc"
Content-Disposition: inline
In-Reply-To: <NTZPR01MB1050C500508E29152E845511EE43A@NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn>
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


--3gny2qe4uevq2gnc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 01, 2024 at 02:22:16AM +0000, Keith Zhao wrote:
>=20
>=20
>=20
>=20
> > -----Original Message-----
>=20
> > From: Maxime Ripard <mripard@kernel.org>
>=20
> > Sent: 2024=E5=B9=B41=E6=9C=8831=E6=97=A5 21:24
>=20
> > To: Keith Zhao <keith.zhao@starfivetech.com>
>=20
> > Cc: devicetree@vger.kernel.org; dri-devel@lists.freedesktop.org;
>=20
> > linux-kernel@vger.kernel.org; linux-riscv@lists.infradead.org;
>=20
> > tzimmermann@suse.de; airlied@gmail.com; krzysztof.kozlowski+dt@linaro.o=
rg;
>=20
> > William Qiu <william.qiu@starfivetech.com>; Xingyu Wu
>=20
> > <xingyu.wu@starfivetech.com>; paul.walmsley@sifive.com;
>=20
> > aou@eecs.berkeley.edu; palmer@dabbelt.com; p.zabel@pengutronix.de;
>=20
> > Shengyang Chen <shengyang.chen@starfivetech.com>; Jack Zhu
>=20
> > <jack.zhu@starfivetech.com>; Changhuang Liang
>=20
> > <changhuang.liang@starfivetech.com>; maarten.lankhorst@linux.intel.com
>=20
> > Subject: Re: [v3 4/6] drm/vs: Add KMS crtc&plane
>=20
> >
>=20
> > On Wed, Jan 31, 2024 at 09:33:06AM +0000, Keith Zhao wrote:
>=20
> > >
>=20
> > >
>=20
> > > > -----=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6-----
>=20
> > > > =E5=8F=91=E4=BB=B6=E4=BA=BA: Maxime Ripard <mripard@kernel.org<mail=
to:mripard@kernel.org>>
>=20
> > > > =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2023=E5=B9=B412=E6=9C=886=E6=
=97=A5 16:56
>=20
> > > > =E6=94=B6=E4=BB=B6=E4=BA=BA: Keith Zhao <keith.zhao@starfivetech.co=
m<mailto:keith.zhao@starfivetech.com>>
>=20
> > > > =E6=8A=84=E9=80=81: devicetree@vger.kernel.org<mailto:devicetree@vg=
er.kernel.org>; dri-devel@lists.freedesktop.org<mailto:dri-devel@lists.free=
desktop.org>;
>=20
> > > > linux-kernel@vger.kernel.org<mailto:linux-kernel@vger.kernel.org>; =
linux-riscv@lists.infradead.org<mailto:linux-riscv@lists.infradead.org>;
>=20
> > > > tzimmermann@suse.de<mailto:tzimmermann@suse.de>; airlied@gmail.com<=
mailto:airlied@gmail.com>;
>=20
> > > > krzysztof.kozlowski+dt@linaro.org<mailto:krzysztof.kozlowski+dt@lin=
aro.org>;
>=20
> > > > William Qiu <william.qiu@starfivetech.com<mailto:william.qiu@starfi=
vetech.com>>; Xingyu Wu
>=20
> > > > <xingyu.wu@starfivetech.com<mailto:xingyu.wu@starfivetech.com>>; pa=
ul.walmsley@sifive.com<mailto:paul.walmsley@sifive.com>;
>=20
> > > > aou@eecs.berkeley.edu<mailto:aou@eecs.berkeley.edu>; palmer@dabbelt=
=2Ecom<mailto:palmer@dabbelt.com>; p.zabel@pengutronix.de<mailto:p.zabel@pe=
ngutronix.de>;
>=20
> > > > Shengyang Chen <shengyang.chen@starfivetech.com<mailto:shengyang.ch=
en@starfivetech.com>>; Jack Zhu
>=20
> > > > <jack.zhu@starfivetech.com<mailto:jack.zhu@starfivetech.com>>; Chan=
ghuang Liang
>=20
> > > > <changhuang.liang@starfivetech.com<mailto:changhuang.liang@starfive=
tech.com>>;
>=20
> > > > maarten.lankhorst@linux.intel.com<mailto:maarten.lankhorst@linux.in=
tel.com>;
>=20
> > > > suijingfeng@loongson.cn<mailto:suijingfeng@loongson.cn>
>=20
> > > > =E4=B8=BB=E9=A2=98: Re: [v3 4/6] drm/vs: Add KMS crtc&plane
>=20
> > > >
>=20
> > > > On Mon, Dec 04, 2023 at 08:33:13PM +0800, Keith Zhao wrote:
>=20
> > > > > +static const struct vs_plane_info dc_hw_planes_rev0[PLANE_NUM] =
=3D {
>=20
> > > > > +   {
>=20
> > > > > +            .name                         =3D "Primary",
>=20
> > > > > +            .id                       =3D PRIMARY_PLANE_0,
>=20
> > > > > +            .type                            =3D DRM_PLANE_TYPE_=
PRIMARY,
>=20
> > > > > +            .num_formats           =3D ARRAY_SIZE(primary_overla=
y_format0),
>=20
> > > > > +            .formats            =3D primary_overlay_format0,
>=20
> > > > > +            .num_modifiers                 =3D ARRAY_SIZE(format=
_modifier0),
>=20
> > > > > +            .modifiers                   =3D format_modifier0,
>=20
> > > > > +            .min_width                =3D 0,
>=20
> > > > > +            .min_height               =3D 0,
>=20
> > > > > +            .max_width               =3D 4096,
>=20
> > > > > +            .max_height              =3D 4096,
>=20
> > > > > +            .rotation           =3D DRM_MODE_ROTATE_0 |
>=20
> > > > > +                                          DRM_MODE_ROTATE_90 |
>=20
> > > > > +                                          DRM_MODE_ROTATE_180 |
>=20
> > > > > +                                          DRM_MODE_ROTATE_270 |
>=20
> > > > > +                                          DRM_MODE_REFLECT_X |
>=20
> > > > > +                                          DRM_MODE_REFLECT_Y,
>=20
> > > > > +            .blend_mode             =3D BIT(DRM_MODE_BLEND_PIXEL=
_NONE) |
>=20
> > > > > +                                          BIT(DRM_MODE_BLEND_PRE=
MULTI) |
>=20
> > > > > +                                          BIT(DRM_MODE_BLEND_COV=
ERAGE),
>=20
> > > > > +            .color_encoding                 =3D BIT(DRM_COLOR_YC=
BCR_BT709) |
>=20
> > > > > +                                          BIT(DRM_COLOR_YCBCR_BT=
2020),
>=20
> > > > > +            .degamma_size                  =3D DEGAMMA_SIZE,
>=20
> > > > > +            .min_scale                 =3D FRAC_16_16(1, 3),
>=20
> > > > > +            .max_scale                =3D FRAC_16_16(10, 1),
>=20
> > > > > +            .zpos                            =3D 0,
>=20
> > > > > +            .watermark               =3D true,
>=20
> > > > > +            .color_mgmt             =3D true,
>=20
> > > > > +            .roi                      =3D true,
>=20
> > > > > +   },
>=20
> > > > > +   {
>=20
> > > > > +            .name                         =3D "Overlay",
>=20
> > > > > +            .id                       =3D OVERLAY_PLANE_0,
>=20
> > > > > +            .type                            =3D DRM_PLANE_TYPE_=
OVERLAY,
>=20
> > > > > +            .num_formats           =3D ARRAY_SIZE(primary_overla=
y_format0),
>=20
> > > > > +            .formats            =3D primary_overlay_format0,
>=20
> > > > > +            .num_modifiers                 =3D ARRAY_SIZE(format=
_modifier0),
>=20
> > > > > +            .modifiers                   =3D format_modifier0,
>=20
> > > > > +            .min_width                =3D 0,
>=20
> > > > > +            .min_height               =3D 0,
>=20
> > > > > +            .max_width               =3D 4096,
>=20
> > > > > +            .max_height              =3D 4096,
>=20
> > > > > +            .rotation           =3D DRM_MODE_ROTATE_0 |
>=20
> > > > > +                                          DRM_MODE_ROTATE_90 |
>=20
> > > > > +                                          DRM_MODE_ROTATE_180 |
>=20
> > > > > +                                          DRM_MODE_ROTATE_270 |
>=20
> > > > > +                                          DRM_MODE_REFLECT_X |
>=20
> > > > > +                                          DRM_MODE_REFLECT_Y,
>=20
> > > > > +            .blend_mode             =3D BIT(DRM_MODE_BLEND_PIXEL=
_NONE) |
>=20
> > > > > +                                          BIT(DRM_MODE_BLEND_PRE=
MULTI) |
>=20
> > > > > +                                          BIT(DRM_MODE_BLEND_COV=
ERAGE),
>=20
> > > > > +            .color_encoding                 =3D BIT(DRM_COLOR_YC=
BCR_BT709) |
>=20
> > > > > +                                          BIT(DRM_COLOR_YCBCR_BT=
2020),
>=20
> > > > > +            .degamma_size                  =3D DEGAMMA_SIZE,
>=20
> > > > > +            .min_scale                 =3D FRAC_16_16(1, 3),
>=20
> > > > > +            .max_scale                =3D FRAC_16_16(10, 1),
>=20
> > > > > +            .zpos                            =3D 1,
>=20
> > > > > +            .watermark               =3D true,
>=20
> > > > > +            .color_mgmt             =3D true,
>=20
> > > > > +            .roi                      =3D true,
>=20
> > > > > +   },
>=20
> > > > > +   {
>=20
> > > > > +            .name                         =3D "Overlay_1",
>=20
> > > > > +            .id                       =3D OVERLAY_PLANE_1,
>=20
> > > > > +            .type                            =3D DRM_PLANE_TYPE_=
OVERLAY,
>=20
> > > > > +            .num_formats           =3D ARRAY_SIZE(primary_overla=
y_format0),
>=20
> > > > > +            .formats            =3D primary_overlay_format0,
>=20
> > > > > +            .num_modifiers                 =3D
>=20
> > ARRAY_SIZE(secondary_format_modifiers),
>=20
> > > > > +            .modifiers                   =3D secondary_format_mo=
difiers,
>=20
> > > > > +            .min_width                =3D 0,
>=20
> > > > > +            .min_height               =3D 0,
>=20
> > > > > +            .max_width               =3D 4096,
>=20
> > > > > +            .max_height              =3D 4096,
>=20
> > > > > +            .rotation           =3D 0,
>=20
> > > > > +            .blend_mode             =3D BIT(DRM_MODE_BLEND_PIXEL=
_NONE) |
>=20
> > > > > +                                          BIT(DRM_MODE_BLEND_PRE=
MULTI) |
>=20
> > > > > +                                          BIT(DRM_MODE_BLEND_COV=
ERAGE),
>=20
> > > > > +            .color_encoding                 =3D BIT(DRM_COLOR_YC=
BCR_BT709) |
>=20
> > > > > +                                          BIT(DRM_COLOR_YCBCR_BT=
2020),
>=20
> > > > > +            .degamma_size                  =3D DEGAMMA_SIZE,
>=20
> > > > > +            .min_scale                 =3D DRM_PLANE_NO_SCALING,
>=20
> > > > > +            .max_scale                =3D DRM_PLANE_NO_SCALING,
>=20
> > > > > +            .zpos                            =3D 2,
>=20
> > > > > +            .watermark               =3D true,
>=20
> > > > > +            .color_mgmt             =3D true,
>=20
> > > > > +            .roi                      =3D true,
>=20
> > > > > +   },
>=20
> > > > > +   {
>=20
> > > > > +            .name                         =3D "Primary_1",
>=20
> > > > > +            .id                       =3D PRIMARY_PLANE_1,
>=20
> > > > > +            .type                            =3D DRM_PLANE_TYPE_=
PRIMARY,
>=20
> > > > > +            .num_formats           =3D ARRAY_SIZE(primary_overla=
y_format0),
>=20
> > > > > +            .formats            =3D primary_overlay_format0,
>=20
> > > > > +            .num_modifiers                 =3D ARRAY_SIZE(format=
_modifier0),
>=20
> > > > > +            .modifiers                   =3D format_modifier0,
>=20
> > > > > +            .min_width                =3D 0,
>=20
> > > > > +            .min_height               =3D 0,
>=20
> > > > > +            .max_width               =3D 4096,
>=20
> > > > > +            .max_height              =3D 4096,
>=20
> > > > > +            .rotation           =3D DRM_MODE_ROTATE_0 |
>=20
> > > > > +                                          DRM_MODE_ROTATE_90 |
>=20
> > > > > +                                          DRM_MODE_ROTATE_180 |
>=20
> > > > > +                                          DRM_MODE_ROTATE_270 |
>=20
> > > > > +                                          DRM_MODE_REFLECT_X |
>=20
> > > > > +                                          DRM_MODE_REFLECT_Y,
>=20
> > > > > +            .blend_mode             =3D BIT(DRM_MODE_BLEND_PIXEL=
_NONE) |
>=20
> > > > > +                                          BIT(DRM_MODE_BLEND_PRE=
MULTI) |
>=20
> > > > > +                                          BIT(DRM_MODE_BLEND_COV=
ERAGE),
>=20
> > > > > +            .color_encoding                 =3D BIT(DRM_COLOR_YC=
BCR_BT709) |
>=20
> > > > > +                                          BIT(DRM_COLOR_YCBCR_BT=
2020),
>=20
> > > > > +            .degamma_size                  =3D DEGAMMA_SIZE,
>=20
> > > > > +            .min_scale                 =3D FRAC_16_16(1, 3),
>=20
> > > > > +            .max_scale                =3D FRAC_16_16(10, 1),
>=20
> > > > > +            .zpos                            =3D 3,
>=20
> > > > > +            .watermark               =3D true,
>=20
> > > > > +            .color_mgmt             =3D true,
>=20
> > > > > +            .roi                      =3D true,
>=20
> > > > > +   },
>=20
> > > > > +   {
>=20
> > > > > +            .name                         =3D "Overlay_2",
>=20
> > > > > +            .id                       =3D OVERLAY_PLANE_2,
>=20
> > > > > +            .type                            =3D DRM_PLANE_TYPE_=
OVERLAY,
>=20
> > > > > +            .num_formats           =3D ARRAY_SIZE(primary_overla=
y_format0),
>=20
> > > > > +            .formats            =3D primary_overlay_format0,
>=20
> > > > > +            .num_modifiers                 =3D ARRAY_SIZE(format=
_modifier0),
>=20
> > > > > +            .modifiers                   =3D format_modifier0,
>=20
> > > > > +            .min_width                =3D 0,
>=20
> > > > > +            .min_height               =3D 0,
>=20
> > > > > +            .max_width               =3D 4096,
>=20
> > > > > +            .max_height              =3D 4096,
>=20
> > > > > +            .rotation           =3D DRM_MODE_ROTATE_0 |
>=20
> > > > > +                                          DRM_MODE_ROTATE_90 |
>=20
> > > > > +                                          DRM_MODE_ROTATE_180 |
>=20
> > > > > +                                          DRM_MODE_ROTATE_270 |
>=20
> > > > > +                                          DRM_MODE_REFLECT_X |
>=20
> > > > > +                                          DRM_MODE_REFLECT_Y,
>=20
> > > > > +            .blend_mode             =3D BIT(DRM_MODE_BLEND_PIXEL=
_NONE) |
>=20
> > > > > +                                          BIT(DRM_MODE_BLEND_PRE=
MULTI) |
>=20
> > > > > +                                          BIT(DRM_MODE_BLEND_COV=
ERAGE),
>=20
> > > > > +            .color_encoding                 =3D BIT(DRM_COLOR_YC=
BCR_BT709) |
>=20
> > > > > +                                          BIT(DRM_COLOR_YCBCR_BT=
2020),
>=20
> > > > > +            .degamma_size                  =3D DEGAMMA_SIZE,
>=20
> > > > > +            .min_scale                 =3D FRAC_16_16(1, 3),
>=20
> > > > > +            .max_scale                =3D FRAC_16_16(10, 1),
>=20
> > > > > +            .zpos                            =3D 4,
>=20
> > > > > +            .watermark               =3D true,
>=20
> > > > > +            .color_mgmt             =3D true,
>=20
> > > > > +            .roi                      =3D true,
>=20
> > > > > +   },
>=20
> > > > > +   {
>=20
> > > > > +            .name                         =3D "Overlay_3",
>=20
> > > > > +            .id                       =3D OVERLAY_PLANE_3,
>=20
> > > > > +            .type                            =3D DRM_PLANE_TYPE_=
OVERLAY,
>=20
> > > > > +            .num_formats           =3D ARRAY_SIZE(primary_overla=
y_format0),
>=20
> > > > > +            .formats            =3D primary_overlay_format0,
>=20
> > > > > +            .num_modifiers                 =3D
>=20
> > ARRAY_SIZE(secondary_format_modifiers),
>=20
> > > > > +            .modifiers                   =3D secondary_format_mo=
difiers,
>=20
> > > > > +            .min_width                =3D 0,
>=20
> > > > > +            .min_height               =3D 0,
>=20
> > > > > +            .max_width               =3D 4096,
>=20
> > > > > +            .max_height              =3D 4096,
>=20
> > > > > +            .rotation           =3D 0,
>=20
> > > > > +            .blend_mode             =3D BIT(DRM_MODE_BLEND_PIXEL=
_NONE) |
>=20
> > > > > +                                          BIT(DRM_MODE_BLEND_PRE=
MULTI) |
>=20
> > > > > +                                          BIT(DRM_MODE_BLEND_COV=
ERAGE),
>=20
> > > > > +            .color_encoding                 =3D BIT(DRM_COLOR_YC=
BCR_BT709) |
>=20
> > > > > +                                          BIT(DRM_COLOR_YCBCR_BT=
2020),
>=20
> > > > > +            .degamma_size                  =3D DEGAMMA_SIZE,
>=20
> > > > > +            .min_scale                 =3D DRM_PLANE_NO_SCALING,
>=20
> > > > > +            .max_scale                =3D DRM_PLANE_NO_SCALING,
>=20
> > > > > +            .zpos                            =3D 5,
>=20
> > > > > +            .watermark               =3D true,
>=20
> > > > > +            .color_mgmt             =3D true,
>=20
> > > > > +            .roi                      =3D true,
>=20
> > > > > +   },
>=20
> > > > > +   {
>=20
> > > > > +            .name                         =3D "Cursor",
>=20
> > > > > +            .id                       =3D CURSOR_PLANE_0,
>=20
> > > > > +            .type                            =3D DRM_PLANE_TYPE_=
CURSOR,
>=20
> > > > > +            .num_formats           =3D ARRAY_SIZE(cursor_formats=
),
>=20
> > > > > +            .formats            =3D cursor_formats,
>=20
> > > > > +            .num_modifiers                 =3D 0,
>=20
> > > > > +            .modifiers                   =3D NULL,
>=20
> > > > > +            .min_width                =3D 32,
>=20
> > > > > +            .min_height               =3D 32,
>=20
> > > > > +            .max_width               =3D 64,
>=20
> > > > > +            .max_height              =3D 64,
>=20
> > > > > +            .rotation           =3D 0,
>=20
> > > > > +            .degamma_size                  =3D 0,
>=20
> > > > > +            .min_scale                 =3D DRM_PLANE_NO_SCALING,
>=20
> > > > > +            .max_scale                =3D DRM_PLANE_NO_SCALING,
>=20
> > > > > +            .zpos                            =3D 255,
>=20
> > > > > +            .watermark               =3D false,
>=20
> > > > > +            .color_mgmt             =3D false,
>=20
> > > > > +            .roi                      =3D false,
>=20
> > > > > +   },
>=20
> > > > > +   {
>=20
> > > > > +            .name                         =3D "Cursor_1",
>=20
> > > > > +            .id                       =3D CURSOR_PLANE_1,
>=20
> > > > > +            .type                            =3D DRM_PLANE_TYPE_=
CURSOR,
>=20
> > > > > +            .num_formats           =3D ARRAY_SIZE(cursor_formats=
),
>=20
> > > > > +            .formats            =3D cursor_formats,
>=20
> > > > > +            .num_modifiers                 =3D 0,
>=20
> > > > > +            .modifiers                   =3D NULL,
>=20
> > > > > +            .min_width                =3D 32,
>=20
> > > > > +            .min_height               =3D 32,
>=20
> > > > > +            .max_width               =3D 64,
>=20
> > > > > +            .max_height              =3D 64,
>=20
> > > > > +            .rotation           =3D 0,
>=20
> > > > > +            .degamma_size                  =3D 0,
>=20
> > > > > +            .min_scale                 =3D DRM_PLANE_NO_SCALING,
>=20
> > > > > +            .max_scale                =3D DRM_PLANE_NO_SCALING,
>=20
> > > > > +            .zpos                            =3D 255,
>=20
> > > > > +            .watermark               =3D false,
>=20
> > > > > +            .color_mgmt             =3D false,
>=20
> > > > > +            .roi                      =3D false,
>=20
> > > > > +   },
>=20
> > > > > +};
>=20
> > > > > +
>=20
> > > > > +static const struct vs_dc_info dc8200_info =3D {
>=20
> > > > > +   .name                         =3D "DC8200",
>=20
> > > > > +   .panel_num               =3D 2,
>=20
> > > > > +   .plane_num               =3D 8,
>=20
> > > > > +   .planes                        =3D dc_hw_planes_rev0,
>=20
> > > > > +   .layer_num                =3D 6,
>=20
> > > > > +   .max_bpc          =3D 10,
>=20
> > > > > +   .color_formats          =3D DRM_COLOR_FORMAT_RGB444 |
>=20
> > > > > +                                 DRM_COLOR_FORMAT_YCBCR444 |
>=20
> > > > > +                                 DRM_COLOR_FORMAT_YCBCR422 |
>=20
> > > > > +                                 DRM_COLOR_FORMAT_YCBCR420,
>=20
> > > > > +   .gamma_size             =3D GAMMA_EX_SIZE,
>=20
> > > > > +   .gamma_bits             =3D 12,
>=20
> > > > > +   .pitch_alignment     =3D 128,
>=20
> > > > > +   .pipe_sync                  =3D false,
>=20
> > > > > +   .background              =3D true,
>=20
> > > > > +   .panel_sync               =3D true,
>=20
> > > > > +   .cap_dec           =3D true,
>=20
> > > > > +};
>=20
> > > >
>=20
> > > > I really think that entire thing is to workaround a suboptimal devi=
ce tree
>=20
> > binding.
>=20
> > > > You should have two CRTCs in the device tree, you'll probe twice,
>=20
> > > > and you won't get to do that whole dance.
>=20
> > > >
>=20
> >
>=20
> > > I tried to modify it according to this idea Found it too difficult In
>=20
> > > terms of hardware, the two crtc designs are too close to separate, and
>=20
> > > they are even designed into the same reg with different bits
>=20
> > > representing crtc0 and crtc1. It seems not easy to described the 2
>=20
> > > ctrc hardware by 2 device nodes
>=20
> >
>=20
> > What are these bits doing?
>=20
>=20
>=20
> [cid:image001.png@01DA54F5.ECEA9C10]
>=20
> For example:
>=20
> like this , bit0 and bit1 match ctrc0 and crtc1 , it is used to start crtc
>=20
> A similar situation exists for other register definitions.
>=20
>=20
>=20
> Another case is that ctrc0 and crtc1 have the same function and their off=
set is continuous,
>=20
> instead of crtc0 being a continuous area, crtc1 being a continuous area
>=20
> reg:
>=20
> crtc0 X
>=20
> crtc1 X+4
>=20
> crtc0 X+8
>=20
> crtc1 X+12
>=20
> if to make it two separate devices, the device node dts reg attribute wou=
ld be complex

Yeah, ok, that makes sense then.

In which case, if we're going to have one big device in the DT with all
the planes and CRTCs, why do we need the display-subsystem device? Just
make your driver probe on the dc8200 device.

Maxime

--3gny2qe4uevq2gnc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZcZGpAAKCRDj7w1vZxhR
xeYCAQCFaDMj37GQT3knM6ZXa1vkO6nsgIBfYeTxEkLjVbhK5gEAlAzvrCqkQ+dR
h+x7odM6Dd8NjS/5fn6EytEC6RSN9w8=
=kOxh
-----END PGP SIGNATURE-----

--3gny2qe4uevq2gnc--

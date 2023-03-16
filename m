Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C1E6BCE4B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 12:35:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C4F010E09E;
	Thu, 16 Mar 2023 11:35:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A49D10E09E;
 Thu, 16 Mar 2023 11:35:04 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id j11so1877848lfg.13;
 Thu, 16 Mar 2023 04:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678966502;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=0NTi0Rm4FBOrE1e5nttxmZfpM/hTXqGa5E2wpZ7mipQ=;
 b=Q9bpyqS0i4GU9TmSyUuGs057bXv8znHnH4f5oEhwwJDj8qrtPTkDCHp79MyD0hAJ97
 S5LJrQIeqAtgUzhOHCwu1oIi9tpJFsF0hOo+hK6EFYb8BpLdzGpc46kTVMT24hs8APh2
 iy9owUzCSn8MipwFirdLCBA1wXMCM0QwRq+yb5tp+H53622R+vPv69vLZL12Z0SYvOuO
 Vh+2FhXTrf4BgdRvSoj0gWBXfeojrppRWjCWdcrvc1t3vR5vaGmbWGhFLi3BHi60BHak
 PQzUcuWwlYX5YOW8+WiPZRh7og9NvCBTBZROLC/jekCCdaW7L89jpp+uHv5QoVLpDjXy
 2hsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678966502;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0NTi0Rm4FBOrE1e5nttxmZfpM/hTXqGa5E2wpZ7mipQ=;
 b=SMr0OYO7PBv+wYzd+0UbJ32bv0RxdahdkBDCnJbn51vz5QDlXfeNo1jlPuDWloZok8
 4Qm5OeWWUKci6SPBpFU0ywYQ8b4yXKAbiCXuWnR5F3K3nGVad8Zvzh937TZWu0RW6J16
 CaVBCTxdda1veHd4uuOK67LCFcvk4LFAr2XkLY94JSIKZ60OG7xeZRklByAl50osv3e7
 /yB1KEXOSHfQWwHqEA7rMGfGNPwfx0IwsZ/EccncEux7S/AOf7l2jcQ6y7lmAd8rBp4c
 AJ3+yjfX/8jRxLbVpnZKNFjB64xjHCNvv1aEykQThLW0fpNHWQVwCbwnfMBn8QLhN+dl
 MM7w==
X-Gm-Message-State: AO0yUKXwVY8Tnr/vZYVOL/1tZxeVLO316itcUaJNrYDHC7PHQTXVjRkJ
 WjG1AtnA4ql5r0mN8xR253g=
X-Google-Smtp-Source: AK7set/CfYRLlDZLgma6fJuH4XXQgP05ve9Imx/8OjI8M172/mMoXX34YzX1KIG1/K3VP/6qfgnuXg==
X-Received: by 2002:ac2:518c:0:b0:4dc:8129:2700 with SMTP id
 u12-20020ac2518c000000b004dc81292700mr2672691lfi.54.1678966501998; 
 Thu, 16 Mar 2023 04:35:01 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 v20-20020ac25614000000b004dc83d04840sm1189924lfd.79.2023.03.16.04.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 04:35:01 -0700 (PDT)
Date: Thu, 16 Mar 2023 13:34:49 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v3 09/17] drm/amd/display: Register Colorspace property
 for DP and HDMI
Message-ID: <20230316133449.26b62760@eldfell>
In-Reply-To: <ZBLz17f8YFmNEJlY@intel.com>
References: <20230307151107.49649-1-harry.wentland@amd.com>
 <20230307151107.49649-10-harry.wentland@amd.com>
 <CA+hFU4yiniJdxWOxDKnD7bTGw3QA8uSLyG5sbeiQ5oWqitTZcQ@mail.gmail.com>
 <ZBLmYzVcnBgU6uo5@intel.com> <20230316120701.523bcb37@eldfell>
 <ZBLz17f8YFmNEJlY@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.24; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kNWgExMIUIs5V4+8.DafZeq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Joshua Ashton <joshua@froggi.es>,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/kNWgExMIUIs5V4+8.DafZeq
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 16 Mar 2023 12:47:51 +0200
Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:

> On Thu, Mar 16, 2023 at 12:07:01PM +0200, Pekka Paalanen wrote:
> > On Thu, 16 Mar 2023 11:50:27 +0200
> > Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:
> >  =20
> > > On Thu, Mar 16, 2023 at 01:37:24AM +0100, Sebastian Wick wrote: =20
> > > > On Tue, Mar 7, 2023 at 4:12=E2=80=AFPM Harry Wentland <harry.wentla=
nd@amd.com> wrote:   =20
> > > > >
> > > > > We want compositors to be able to set the output
> > > > > colorspace on DP and HDMI outputs, based on the
> > > > > caps reported from the receiver via EDID.   =20
> > > >=20
> > > > About that... The documentation says that user space has to check t=
he
> > > > EDID for what the sink actually supports. So whatever is in
> > > > supported_colorspaces is just what the driver/hardware is able to s=
et
> > > > but doesn't actually indicate that the sink supports it.
> > > >=20
> > > > So the only way to enable bt2020 is by checking if the sink supports
> > > > both RGB and YUV variants because both could be used by the driver.
> > > > Not great at all. Something to remember for the new property.   =20
> > >=20
> > > Hmm. I wonder if that's even legal... Looks like maybe it
> > > is since I can't immediately spot anything in CTA-861 to
> > > forbid it :/ =20
> >=20
> > Wouldn't the driver do the same EDID check before choosing whether it
> > uses RGB or YCbCr signalling? =20
>=20
> I suppose it could. The modeset would then fail, which is perhaps

Could? What are they missing?

I mean, drivers are already automatically choosing between RGB and YCbCr
signalling based on e.g. available bandwidth. Surely they already will
not attempt to send a signal format to a monitor that does not say it
supports that?

> not a huge issue, except maybe for suspend+resume if we fail in
> the resume path. Although I guess the EDID/etc. should not yet
> be refreshed at that point so if the modeset worked before suspend
> resume should be able to restore it without failures.

I assumed that if a monitor can be driven, and it supports any BT2020
format, then it always supports the BT2020 format it is being driven
in (RGB vs. YCbCr flavors). Bad assumption?


Thanks,
pq

> >=20
> > So if EDID says only one of them is supported, userspace should be
> > confident that that is the BT2020 mode the driver will match?
> >=20
> >=20
> > Thanks,
> > pq
> >  =20
> > >  =20
> > > >    =20
> > > > > Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> > > > > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > > > > Cc: Sebastian Wick <sebastian.wick@redhat.com>
> > > > > Cc: Vitaly.Prosyak@amd.com
> > > > > Cc: Joshua Ashton <joshua@froggi.es>
> > > > > Cc: dri-devel@lists.freedesktop.org
> > > > > Cc: amd-gfx@lists.freedesktop.org
> > > > > Reviewed-By: Joshua Ashton <joshua@froggi.es>
> > > > > ---
> > > > >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 15 +++++++++=
++++++
> > > > >  1 file changed, 15 insertions(+)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/=
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > > > index f91b2ea13d96..2d883c6dae90 100644
> > > > > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > > > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > > > @@ -7184,6 +7184,12 @@ static int amdgpu_dm_connector_get_modes(s=
truct drm_connector *connector)
> > > > >         return amdgpu_dm_connector->num_modes;
> > > > >  }
> > > > >
> > > > > +static const u32 supported_colorspaces =3D
> > > > > +       BIT(DRM_MODE_COLORIMETRY_BT709_YCC) |
> > > > > +       BIT(DRM_MODE_COLORIMETRY_OPRGB) |
> > > > > +       BIT(DRM_MODE_COLORIMETRY_BT2020) |
> > > > > +       BIT(DRM_MODE_COLORIMETRY_BT2020_DEPRECATED);
> > > > > +
> > > > >  void amdgpu_dm_connector_init_helper(struct amdgpu_display_manag=
er *dm,
> > > > >                                      struct amdgpu_dm_connector *=
aconnector,
> > > > >                                      int connector_type,
> > > > > @@ -7264,6 +7270,15 @@ void amdgpu_dm_connector_init_helper(struc=
t amdgpu_display_manager *dm,
> > > > >                                 adev->mode_info.abm_level_propert=
y, 0);
> > > > >         }
> > > > >
> > > > > +       if (connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIA) {
> > > > > +               if (!drm_mode_create_hdmi_colorspace_property(&ac=
onnector->base, supported_colorspaces))
> > > > > +                       drm_connector_attach_colorspace_property(=
&aconnector->base);
> > > > > +       } else if (connector_type =3D=3D DRM_MODE_CONNECTOR_Displ=
ayPort ||
> > > > > +                  connector_type =3D=3D DRM_MODE_CONNECTOR_eDP) {
> > > > > +               if (!drm_mode_create_dp_colorspace_property(&acon=
nector->base, supported_colorspaces))
> > > > > +                       drm_connector_attach_colorspace_property(=
&aconnector->base);
> > > > > +       }
> > > > > +
> > > > >         if (connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIA ||
> > > > >             connector_type =3D=3D DRM_MODE_CONNECTOR_DisplayPort =
||
> > > > >             connector_type =3D=3D DRM_MODE_CONNECTOR_eDP) {
> > > > > --
> > > > > 2.39.2
> > > > >   =20
> > >  =20
> >  =20
>=20
>=20
>=20


--Sig_/kNWgExMIUIs5V4+8.DafZeq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmQS/tkACgkQI1/ltBGq
qqdNdxAApeij1mIIGW3FUnHo8n1YSdAX6tkXSyMJu9xZnP1MgOC1qwMepr/06aXd
V6Qu7fGJ/C656X4CEK/PCjFD93qRUY0CPwVB3NR9YBO+P4ghf0zbP7f2qjO6mDfz
L4ja8+BcioR/yaOTxEzF7+BbejB3iQ8dGeIV4Y2QVwzCMtRBw0zLZfpVaxOKKr3U
oAq5ZKa+61yH8w94nlxnp1nkx8Ap1kystJZXHTDJzsMc65va439/JloyKtGBeWeH
r+Cr0pLhc6vfT1C9sM3506VPGcIHF+XI/6QzwsLzXUDs9HVj/ejjzyZyJQ7daEiA
ax0HMVYkn7czO+PU7Nm7RjqDA+jWzHkhSuEDsIg2CqzJcBYjqCRZbUsi59QFpcrJ
jJBxvIOgCCl2Xyg5cQl/5S/oeBPz51RB/orFTqTkblBz+DLaYYahSL33pITPdRiZ
R6ellQew7Fs9p0eV8FvsItqBrAgfUx1UfJgZWyxiMiY1g1VL26yNNytRFsHoK3Gq
V2jvU1nWGvX0DIsGCWLwCJ0HPt61p2xFcumQG3iZQrSX7cQzMSPOrZhxDPhaOux9
3BtHnl7HYzpiRlSRT+3GTEvYR4kdn8ULG1qkg+N2Th6bB4741v1LppS0KuM6qu8G
uLHFDbUzC/tSftVD6v8LEmpJtflmILEY+kyOGCY3ytF7PWlhHYY=
=yWl9
-----END PGP SIGNATURE-----

--Sig_/kNWgExMIUIs5V4+8.DafZeq--

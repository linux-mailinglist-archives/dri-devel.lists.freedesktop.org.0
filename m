Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF16C6BCC09
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 11:07:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B30C10EC8A;
	Thu, 16 Mar 2023 10:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 880E710EC8A;
 Thu, 16 Mar 2023 10:07:30 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id a32so1059657ljq.1;
 Thu, 16 Mar 2023 03:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678961249;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=OeKMiB8adCyAuvfspP826Eu3GVifkkC1oxu/iYbrcbs=;
 b=Jry7G0JcbOmrkjxGJd1fXKpKo8bO4FkutPdbb8BmFr6NYTnzzuNYYhK6LAlXSzFHfD
 ezSMXjpInys3yfsNk42WdxuHrG0Bhl3pL8zbUzPT15D2oOUaTdY4lvwdN0ap8eWb7zY3
 qiNMLVi1LxsWSLyiFFRC1NSXrDGSpsVDwAd7OEgy/bgAiyVdd/tQebd1mYKfvW0tq5Yd
 3X/Ek+4nymixhjc29YaSxZfF9nLrehlV/mXPKwURaS8UQjZH5dtIO83AYnL6mar5bI0N
 qlasSetkMOuSvNK19sgZPQZAmFsh+RnygiYX4FzXpg4IL3kbQCwH/5crx6+fgdQXEw+t
 /jWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678961249;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OeKMiB8adCyAuvfspP826Eu3GVifkkC1oxu/iYbrcbs=;
 b=DDFMNS1GnS5IVsNweAi/SofF1CgY41e2vqwEfLYTkX+nEaxdmCf/Gx4q0STgDxsFGq
 vJthkpzLVl8x1r5zQG+ECZO9tmPvVdD428tbweYH90X+r9nbUiS4WBaF5EyyV+XUZlnN
 /c88dcWMhOH4zyBABd6xar71CzntpoKrsHEIsJZWFF8H/cTIs8yduwdGndZSFMUlF8Ad
 s2qLQlUFG2TQY+Bm6IBFqzdCkpZk8XN5vksA3+8PThk4LA+G8gECIhG9VouIXPtfKFHP
 618egR7q6P8d2cJAlEaXH36RjqUyXGS2xP11okY18LvJr7BLUNQWKIa6UnROLn/RqeCe
 ZveQ==
X-Gm-Message-State: AO0yUKXj1wvzHcyyVus1X1IHRKn2nVe2sj1XWv+gKg8UYLCV907a/c4J
 V176xX9luGBN2i98f9zfGaM=
X-Google-Smtp-Source: AK7set9nRtmCSJrKJqVGo0gAXBfQQY4ldyrn+CMw01Wqk65eOOYMxTjs3/y+knOW11jKFcBNUpNGow==
X-Received: by 2002:a05:651c:515:b0:295:9021:450a with SMTP id
 o21-20020a05651c051500b002959021450amr2597967ljp.49.1678961248595; 
 Thu, 16 Mar 2023 03:07:28 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 q11-20020a19a40b000000b00497a61453a9sm1171954lfc.243.2023.03.16.03.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 03:07:28 -0700 (PDT)
Date: Thu, 16 Mar 2023 12:07:01 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v3 09/17] drm/amd/display: Register Colorspace property
 for DP and HDMI
Message-ID: <20230316120701.523bcb37@eldfell>
In-Reply-To: <ZBLmYzVcnBgU6uo5@intel.com>
References: <20230307151107.49649-1-harry.wentland@amd.com>
 <20230307151107.49649-10-harry.wentland@amd.com>
 <CA+hFU4yiniJdxWOxDKnD7bTGw3QA8uSLyG5sbeiQ5oWqitTZcQ@mail.gmail.com>
 <ZBLmYzVcnBgU6uo5@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.24; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ocMAbpmXjkZ0NAkzayXrY1j";
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

--Sig_/ocMAbpmXjkZ0NAkzayXrY1j
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 16 Mar 2023 11:50:27 +0200
Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:

> On Thu, Mar 16, 2023 at 01:37:24AM +0100, Sebastian Wick wrote:
> > On Tue, Mar 7, 2023 at 4:12=E2=80=AFPM Harry Wentland <harry.wentland@a=
md.com> wrote: =20
> > >
> > > We want compositors to be able to set the output
> > > colorspace on DP and HDMI outputs, based on the
> > > caps reported from the receiver via EDID. =20
> >=20
> > About that... The documentation says that user space has to check the
> > EDID for what the sink actually supports. So whatever is in
> > supported_colorspaces is just what the driver/hardware is able to set
> > but doesn't actually indicate that the sink supports it.
> >=20
> > So the only way to enable bt2020 is by checking if the sink supports
> > both RGB and YUV variants because both could be used by the driver.
> > Not great at all. Something to remember for the new property. =20
>=20
> Hmm. I wonder if that's even legal... Looks like maybe it
> is since I can't immediately spot anything in CTA-861 to
> forbid it :/

Wouldn't the driver do the same EDID check before choosing whether it
uses RGB or YCbCr signalling?

So if EDID says only one of them is supported, userspace should be
confident that that is the BT2020 mode the driver will match?


Thanks,
pq

>=20
> >  =20
> > > Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> > > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > > Cc: Sebastian Wick <sebastian.wick@redhat.com>
> > > Cc: Vitaly.Prosyak@amd.com
> > > Cc: Joshua Ashton <joshua@froggi.es>
> > > Cc: dri-devel@lists.freedesktop.org
> > > Cc: amd-gfx@lists.freedesktop.org
> > > Reviewed-By: Joshua Ashton <joshua@froggi.es>
> > > ---
> > >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 15 +++++++++++++=
++
> > >  1 file changed, 15 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/driv=
ers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > index f91b2ea13d96..2d883c6dae90 100644
> > > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > @@ -7184,6 +7184,12 @@ static int amdgpu_dm_connector_get_modes(struc=
t drm_connector *connector)
> > >         return amdgpu_dm_connector->num_modes;
> > >  }
> > >
> > > +static const u32 supported_colorspaces =3D
> > > +       BIT(DRM_MODE_COLORIMETRY_BT709_YCC) |
> > > +       BIT(DRM_MODE_COLORIMETRY_OPRGB) |
> > > +       BIT(DRM_MODE_COLORIMETRY_BT2020) |
> > > +       BIT(DRM_MODE_COLORIMETRY_BT2020_DEPRECATED);
> > > +
> > >  void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *=
dm,
> > >                                      struct amdgpu_dm_connector *acon=
nector,
> > >                                      int connector_type,
> > > @@ -7264,6 +7270,15 @@ void amdgpu_dm_connector_init_helper(struct am=
dgpu_display_manager *dm,
> > >                                 adev->mode_info.abm_level_property, 0=
);
> > >         }
> > >
> > > +       if (connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIA) {
> > > +               if (!drm_mode_create_hdmi_colorspace_property(&aconne=
ctor->base, supported_colorspaces))
> > > +                       drm_connector_attach_colorspace_property(&aco=
nnector->base);
> > > +       } else if (connector_type =3D=3D DRM_MODE_CONNECTOR_DisplayPo=
rt ||
> > > +                  connector_type =3D=3D DRM_MODE_CONNECTOR_eDP) {
> > > +               if (!drm_mode_create_dp_colorspace_property(&aconnect=
or->base, supported_colorspaces))
> > > +                       drm_connector_attach_colorspace_property(&aco=
nnector->base);
> > > +       }
> > > +
> > >         if (connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIA ||
> > >             connector_type =3D=3D DRM_MODE_CONNECTOR_DisplayPort ||
> > >             connector_type =3D=3D DRM_MODE_CONNECTOR_eDP) {
> > > --
> > > 2.39.2
> > > =20
>=20


--Sig_/ocMAbpmXjkZ0NAkzayXrY1j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmQS6kUACgkQI1/ltBGq
qqfdpw//eyT3oV8KT//BbXtGp2mvbD6JmTX7Z2E9b3GaG1J3ANyJJvPq1Hc00pv3
6h49R+pa1MmVo2Mwlg9zDieTNHAzQ0tAexKn4e1rUMtTpdJI1JpYjpkyBvbHqHvh
O1TCihe+QQAyOiFix9nN8bbD3+ddkpWd9REpQsz2SzOu7EllvYsBc/eattj8lLk1
csP/AZu6nutF9h+l7xUrNEIfaWdcfur8B6Az8o1xjRPz3ewLqcXqJ/D9dPcAX6j2
VfmrX++uxssknw+kuEfZklsaGzbfQieL3bQBUG3pfPCt9ELMHQvQCCCPKnpXdA9D
3OTnOsJs7Wu60AYSTcH/0le5IUGwvKcUZhjdbsEH0B00OunzcSnWbI+H13+zgqCr
mlD7flt+xzwdllXLk4+Qbgz2n/EN8Aib2Jrgfz+ikJgfU8OmUUQUis9E6JUg5y13
xtjhHEC2nLELrqZPQjT5XZK8i6fsZ3D0q+NqBwta9/0cRzcy5d7Y1vNbkT9joXvv
LbaO6TJw4Nulx/MjJJAG0riO+p3X9491tB9CRLZ5iH7n1WyAY4AhMpXLYTfaZ8zZ
ANpFiQ21fTfdM/ihjJD/Ul9vFM5QIIN4QQkptABToeKeY5akBiYOxb4IOx/zvfSp
WLrE/mR9aGkX7oh+YQNzEqxnf2Hp6hsvZcTYHVBEtEcnyeUQOB8=
=m4pO
-----END PGP SIGNATURE-----

--Sig_/ocMAbpmXjkZ0NAkzayXrY1j--

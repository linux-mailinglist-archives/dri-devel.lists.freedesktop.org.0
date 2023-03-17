Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F2F6BE45D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 09:53:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EB2310EE99;
	Fri, 17 Mar 2023 08:53:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E083010EE87;
 Fri, 17 Mar 2023 08:53:48 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id b13so4298699ljf.6;
 Fri, 17 Mar 2023 01:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679043227;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=u1tSKWd7jwjz4W9W5fnkRbJuEz10zSkE/FZ+BjgevGQ=;
 b=hTvE66oOdQX0aaixHJSH0OOHBzm0WhEyjrl5rZss/nkpGTmkT/eQyDVq+wFPdeYPYh
 KeScxeH7DAdA/f+u6siI72lCs28Dew0CY2CiofzOWZiPQqKArgkgEx/CyzBqfnzHfNzg
 /1zGKjPAyyMU64oMNODQcMpLw+EZDMlO8AbrCxPCjBSLMb6cXheprfcCSmYNtdXt8rSH
 gbC78xH1hB27kQiDNeR78HzSleDfOvS++JuaaS9gMgB5Y872rJN9teGmPEqpvyVDvTzA
 0pbgJis6s3ZYvmRCMEU230LNIis8q52Ggvp6rkGK6X3cgWq1pHBzO7XlzdH9dndLfgXX
 g2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679043227;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u1tSKWd7jwjz4W9W5fnkRbJuEz10zSkE/FZ+BjgevGQ=;
 b=VqYuGzpdUbcKfet+jNbWu9rZwVagWAiMBqkbycUJR/WKsGSfeSaWSJzaT2GDfcqC2D
 7pyO3YEsTRt895RAYlNg6M6lF7BveVtxMZjllYiduQlhV5ISyP4Kp8IsMwItKnUmSfxB
 +PUzsQLmJWgngbelz4zmHb62OcrX+gpk8cf8+OEglYIFb4BBA8MUroz1gc/h1c2ONsue
 cpqowEbgS1am/5EKdtRZOz1+Vabt6FtiKkKf9f71Hi0ewdoTaKwudH5Qlg0wDIDPyC9U
 VsJUCg6oV0ChutF/OXnfVV8CrW4GjcGL0Pxf4E31GtZ7r2owPcyCHKKnG6ORl1InxFu7
 Kcag==
X-Gm-Message-State: AO0yUKXj/hzw7lt+fhQQlDSoRpzygKwGL80CHecvdlA/Sui8DfR2lurR
 fIAKjykYxjC5RzW+QbePW+E=
X-Google-Smtp-Source: AK7set9bcUv/100g6QvPiYHxBcaeBa3LjDIwGYcIrzpT6XKHJdppYEmZBBGCAaTJjSqM/PWV+6j4IA==
X-Received: by 2002:a05:651c:b29:b0:290:603d:4337 with SMTP id
 b41-20020a05651c0b2900b00290603d4337mr4087932ljr.51.1679043226859; 
 Fri, 17 Mar 2023 01:53:46 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 w2-20020a2e8202000000b00295a7f35206sm295144ljg.48.2023.03.17.01.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 01:53:46 -0700 (PDT)
Date: Fri, 17 Mar 2023 10:53:35 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v3 09/17] drm/amd/display: Register Colorspace property
 for DP and HDMI
Message-ID: <20230317105335.45d6a629@eldfell>
In-Reply-To: <ZBOf0m6W3ZWPy7nc@intel.com>
References: <20230307151107.49649-1-harry.wentland@amd.com>
 <20230307151107.49649-10-harry.wentland@amd.com>
 <CA+hFU4yiniJdxWOxDKnD7bTGw3QA8uSLyG5sbeiQ5oWqitTZcQ@mail.gmail.com>
 <ZBLmYzVcnBgU6uo5@intel.com> <20230316120701.523bcb37@eldfell>
 <ZBLz17f8YFmNEJlY@intel.com> <20230316133449.26b62760@eldfell>
 <ZBMNEdYWsyfVq46p@intel.com>
 <CA+hFU4zWvm3-SSjtF17zjRnshEDw27gkQDLGZRk2AbnWN8+1Vg@mail.gmail.com>
 <ZBOf0m6W3ZWPy7nc@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.24; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yEwkilZB.4hm+fLWcniVUwr";
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

--Sig_/yEwkilZB.4hm+fLWcniVUwr
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 17 Mar 2023 01:01:38 +0200
Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:

> On Thu, Mar 16, 2023 at 10:13:54PM +0100, Sebastian Wick wrote:
> > On Thu, Mar 16, 2023 at 1:35=E2=80=AFPM Ville Syrj=C3=A4l=C3=A4
> > <ville.syrjala@linux.intel.com> wrote: =20
> > >
> > > On Thu, Mar 16, 2023 at 01:34:49PM +0200, Pekka Paalanen wrote: =20
> > > > On Thu, 16 Mar 2023 12:47:51 +0200
> > > > Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:
> > > > =20
> > > > > On Thu, Mar 16, 2023 at 12:07:01PM +0200, Pekka Paalanen wrote: =
=20
> > > > > > On Thu, 16 Mar 2023 11:50:27 +0200
> > > > > > Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:
> > > > > > =20
> > > > > > > On Thu, Mar 16, 2023 at 01:37:24AM +0100, Sebastian Wick wrot=
e: =20
> > > > > > > > On Tue, Mar 7, 2023 at 4:12=E2=80=AFPM Harry Wentland <harr=
y.wentland@amd.com> wrote: =20
> > > > > > > > >
> > > > > > > > > We want compositors to be able to set the output
> > > > > > > > > colorspace on DP and HDMI outputs, based on the
> > > > > > > > > caps reported from the receiver via EDID. =20
> > > > > > > >
> > > > > > > > About that... The documentation says that user space has to=
 check the
> > > > > > > > EDID for what the sink actually supports. So whatever is in
> > > > > > > > supported_colorspaces is just what the driver/hardware is a=
ble to set
> > > > > > > > but doesn't actually indicate that the sink supports it.
> > > > > > > >
> > > > > > > > So the only way to enable bt2020 is by checking if the sink=
 supports
> > > > > > > > both RGB and YUV variants because both could be used by the=
 driver.
> > > > > > > > Not great at all. Something to remember for the new propert=
y. =20
> > > > > > >
> > > > > > > Hmm. I wonder if that's even legal... Looks like maybe it
> > > > > > > is since I can't immediately spot anything in CTA-861 to
> > > > > > > forbid it :/ =20
> > > > > >
> > > > > > Wouldn't the driver do the same EDID check before choosing whet=
her it
> > > > > > uses RGB or YCbCr signalling? =20
> > > > >
> > > > > I suppose it could. The modeset would then fail, which is perhaps=
 =20
> > > >
> > > > Could? What are they missing? =20
> > >
> > > The fact that the new property that also affects the rgb->ycbcr matrix
> > > doesn't even exist? =20
> >=20
> > I think the question was about the current Colorspace property.

Yes.

We need to be able to set ColourPrimaries infoframe field for the sink.
Only userspace knows what ColourPrimaries it uses, and the driver has
no need to care at all, other than tell the sink what we have.

When a driver chooses to use YCbCr, it needs to use the
MatrixCoefficients the sink expects.

If we send the infoframe to the sink telling the signal uses BT.2020
ColourPrimaries, does that same bit pattern also tell the sink we are
using the BT.2020 NCL MatrixCoefficients if the driver chooses YCbCr?

Do drivers actually use BT.2020 NCL MatrixCoefficients in that case?

If they don't, then YCbCr BT.2020 has never worked, which is another
nail in the coffin for "Colorspace" property. But it still means that
RGB BT.2020 may have worked correctly, and then drivers would regress
if they started picking YCbCr for any reason where they previously used
RGB.

> > > >
> > > > I mean, drivers are already automatically choosing between RGB and =
YCbCr
> > > > signalling based on e.g. available bandwidth. Surely they already w=
ill
> > > > not attempt to send a signal format to a monitor that does not say =
it
> > > > supports that? =20
> >=20
> > That's exactly what they do. The drivers don't check the EDID for the
> > colorimetry the sink supports and the responsibility is punted off to
> > user space.

I suspect there are two different things:

- which of RGB, YCbCr 4:4:4, YCbCr 4:2:0 can the sink take
- the supported MatrixCoefficients for each of the YCbCr

Surely drivers are already checking the former point?

I'm not surprised if they are not checking the latter point, but they
do need to, because it is the driver making the choice between RGB and
some YCbCr.

> > >
> > > We just signal default/bt.709 colorimetry. There is nothing to
> > > check for those IIRC. =20
> >=20
> > You do support bt.2020, no? =20
>=20
> Not for rgb->ycbcr conversion.

I see there is confusion about what "colorimetry" is.

Please, let's use the H.273 terminology to make the difference clear
between ColourPrimaries and MatrixCoefficients.


Thanks,
pq

--Sig_/yEwkilZB.4hm+fLWcniVUwr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmQUKo8ACgkQI1/ltBGq
qqe/tw/+MWbXlmNamuWisqUpD8+aS8Xp/IVgTrFUvJEOcoF6YaHK6tONF+5+zZzl
nJbL41monmMO7ItxLxvc0J4JGBZMt+7+n+/E2jPLzHWVnXvlsEMEuWSpS+zvSVnp
WOeHp/Ei4HP7C/1+KqIpwada3xoXsROL123z9qTlfNIY/OSWKRsBbmjT0+U7ez13
Y/QdO7Mj+vURVWuHFz0PprWOBRWLygzycIun9gC5VslxYJFLvENJxdd9tdszW7C/
pTdTZY5OS2G01QZRS09fQaS27RKFQzhuRyXjz2O1nMzUdWDfQjYZ8ToN9M6Ab5PF
NTXOWwglRI6O8GCdelGE5PcROQ4DxUakdRmugssDSAPe58HG8IM2GrAJW5DffvF2
Y5b0FkQbAVj0d/f5ncJNaeglkNA11lqoZALFybV18Q1v3aBW+f4xnzqRo6fFacdl
vuENYvskzGPdxqtZ+R5iF/4rBiEnMi+B0/41fmQM2HP9BoZ/b1CRJn10+dWDCLlk
CcmCRbKRtYjvQIeijmAhsw7XUdjhhnUuy9ek4ARCkEO4jy780ZMZ9/+/1odhJMly
xRl1YVBUYmZAHoosDze7OQ+rL2mI4WqfqLtXCzRKgQFIRkDEsJyxIJuifn75WM1Z
behDd59Sn2XL9Bq6skhkzU1OAtv+NHRO/+1sOWE4xlf2d1fC/CU=
=q5Xo
-----END PGP SIGNATURE-----

--Sig_/yEwkilZB.4hm+fLWcniVUwr--

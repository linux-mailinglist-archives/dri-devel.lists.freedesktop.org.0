Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B456B20DC
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 11:04:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7913310E0CE;
	Thu,  9 Mar 2023 10:03:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4185410E0CE;
 Thu,  9 Mar 2023 10:03:55 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id s20so1532517lfb.11;
 Thu, 09 Mar 2023 02:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678356233;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Xh5PHN8dJb3W4i1nQyu2ip6mx2yHreI4cKKZZj6lDqI=;
 b=G7exZZkZINKQN0OpHZJIj7ObkwGCgLuEA4l+cKWasstWN0+TO1uthFb33Bv/3DaAAx
 d67Pg0XKQ5h81ZncqVGhluPT+GVYhVQQLwQtYl92jim3huXrr96a1V0Zgv6DyrMdeHSb
 K5HqQw91ur5KcTI/8p6vfqAPkbJdFCrLWaRH6VPyoN1Cpo9kppBqTeyUzuVeQbUbdLoo
 43/+gPkBDCVCr/WLfHjlHOVT0LCwWRwv8X2BisBcCkko3zIVFESc0eGnxxuGVROJbo9g
 bszS6vy4CjndzcWQNNoJtM8cxLeelAMBK701/U3ionEBbJGudKsp7kNdlB2SV6zzifQR
 Nyyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678356233;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xh5PHN8dJb3W4i1nQyu2ip6mx2yHreI4cKKZZj6lDqI=;
 b=BSe0eZYkDeI6QYfVkAj+44ToVFraJQSuaebE/LM7XpW+AO6ws1RfNjbgshwc+rhFX3
 WIhrNGmq6mn0C13GIi897JxJ2PWGThX95CIolUj9zs1qMBvPJOE3zJduWXes9q7EV0+K
 KpIowZeHsJtBmH/HAVqdZgPMgtI4g8txyHe3FUuGL1Op2XnEjpmt8Oq4Y5p0nk/pgg2O
 FXvkjmpOaiY0KSn8UQv218zZPVdPRRcezxyKfzrbi/rb61zKD/gzGZbTmooYy+XMlwe4
 xO5QBk0OvfraGaYvwcsKxKNhbrCoQRs5t6/g6t5ACeJK1Sm7QJDPTv1u7HIjPjF/lwyg
 r+Ow==
X-Gm-Message-State: AO0yUKVj2oBN9V6BfLECapMX7Ms32aVITx50JfUDD3bxBPUnL3+Xge41
 qMtWx8sUzUdUUapOxjvtGpQ=
X-Google-Smtp-Source: AK7set/biH9U0bk3VjHwm3dfvd6q3cBTeBvuj7EqX09qrZTOvHLJpgpbAHTx6PuE2WN6PiYPGNL0bQ==
X-Received: by 2002:ac2:5214:0:b0:4cb:4378:9c6 with SMTP id
 a20-20020ac25214000000b004cb437809c6mr5249636lfl.23.1678356233298; 
 Thu, 09 Mar 2023 02:03:53 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 q10-20020a19a40a000000b004d58e782886sm2616360lfc.303.2023.03.09.02.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 02:03:52 -0800 (PST)
Date: Thu, 9 Mar 2023 12:03:42 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Sebastian Wick <sebastian.wick@redhat.com>
Subject: Re: [PATCH v3 02/17] drm/connector: Add enum documentation to
 drm_colorspace
Message-ID: <20230309120342.6260cf94@eldfell>
In-Reply-To: <CA+hFU4zt4ykkHpB2NyY7Eu2SnMKnMB_b+sUh7NfTTzNyZ3A4mQ@mail.gmail.com>
References: <20230307151107.49649-1-harry.wentland@amd.com>
 <20230307151107.49649-3-harry.wentland@amd.com>
 <20230308105944.05fb9377@eldfell>
 <CA+hFU4zt4ykkHpB2NyY7Eu2SnMKnMB_b+sUh7NfTTzNyZ3A4mQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xRfyiUsF+7c.9PVYWqJoKxk";
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
Cc: dri-devel@lists.freedesktop.org, Uma Shankar <uma.shankar@intel.com>,
 amd-gfx@lists.freedesktop.org, Joshua Ashton <joshua@froggi.es>,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/xRfyiUsF+7c.9PVYWqJoKxk
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 9 Mar 2023 01:56:11 +0100
Sebastian Wick <sebastian.wick@redhat.com> wrote:

> On Wed, Mar 8, 2023 at 9:59=E2=80=AFAM Pekka Paalanen <ppaalanen@gmail.co=
m> wrote:
> >
> > On Tue, 7 Mar 2023 10:10:52 -0500
> > Harry Wentland <harry.wentland@amd.com> wrote:
> > =20
> > > From: Joshua Ashton <joshua@froggi.es>
> > >
> > > To match the other enums, and add more information about these values.
> > >
> > > v2:
> > >  - Specify where an enum entry comes from
> > >  - Clarify DEFAULT and NO_DATA behavior
> > >  - BT.2020 CYCC is "constant luminance"
> > >  - correct type for BT.601
> > >
> > > Signed-off-by: Joshua Ashton <joshua@froggi.es>
> > > Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> > > Reviewed-by: Harry Wentland <harry.wentland@amd.com> =20
> >
> > Hi,
> >
> > this effort is really good, but of course I still find things to
> > nitpick about. If there is no answer to my questions, then I would
> > prefer the documentation to spell out the unknowns and ambiguities.
> > =20
> > > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > > Cc: Sebastian Wick <sebastian.wick@redhat.com>
> > > Cc: Vitaly.Prosyak@amd.com
> > > Cc: Uma Shankar <uma.shankar@intel.com>
> > > Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > > Cc: Joshua Ashton <joshua@froggi.es>
> > > Cc: dri-devel@lists.freedesktop.org
> > > Cc: amd-gfx@lists.freedesktop.org
> > > ---
> > >  include/drm/drm_connector.h | 67 +++++++++++++++++++++++++++++++++++=
--
> > >  1 file changed, 65 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > > index 6d6a53a6b010..bb078666dc34 100644
> > > --- a/include/drm/drm_connector.h
> > > +++ b/include/drm/drm_connector.h
> > > @@ -363,13 +363,76 @@ enum drm_privacy_screen_status {
> > >       PRIVACY_SCREEN_ENABLED_LOCKED,
> > >  };
> > >
> > > -/*
> > > - * This is a consolidated colorimetry list supported by HDMI and
> > > +/**
> > > + * enum drm_colorspace - color space
> > > + *
> > > + * This enum is a consolidated colorimetry list supported by HDMI and
> > >   * DP protocol standard. The respective connectors will register
> > >   * a property with the subset of this list (supported by that
> > >   * respective protocol). Userspace will set the colorspace through
> > >   * a colorspace property which will be created and exposed to
> > >   * userspace.
> > > + *
> > > + * DP definitions come from the DP v2.0 spec
> > > + * HDMI definitions come from the CTA-861-H spec
> > > + *
> > > + * @DRM_MODE_COLORIMETRY_DEFAULT:
> > > + *   Driver specific behavior.
> > > + *   For DP:
> > > + *           RGB encoded: sRGB (IEC 61966-2-1)
> > > + *           YCbCr encoded: ITU-R BT.601 colorimetry format =20
> >
> > Does this mean that HDMI behavior is driver-specific while DP behavior
> > is as defined?
> >
> > Is it intentional that YCbCr encoding also uses different RGB-primaries
> > than RGB-encoded signal? (BT.601 vs. BT.709/sRGB)
> >
> > Or do you need to be more explicit on which parts of each spec apply
> > (ColourPrimaries vs. TransferCharacteristics vs. MatrixCoefficients in
> > CICP parlance)?
> >
> > E.g. BT.709/sRGB ColourPrimaries with BT.601 MatrixCoefficients. =20
>=20
> Yeah, just adding to this: The Default Colorspace is something well
> defined. CTA-861 says:
>=20
> "If bits C0 and C1 are zero, the colorimetry shall correspond to the
> default colorimetry defined in Section 5.1"
>=20
> and in Section 5.1
>=20
> "In all cases described above, the RGB color space used should be the
> RGB color space the Sink declares in the Basic Display Parameters and
> Feature Block of its EDID."
>=20
> If I set DRM_MODE_COLORIMETRY_DEFAULT, I expect the Colorimetry the
> EDID reports to be in effect and not some driver specific nonsense.

Does that also define the MatrixCoefficients for YCbCr signal with
DRM_MODE_COLORIMETRY_DEFAULT?

Not that userspace would even care, since RGB-to-YCbCr is all
driver-internal.

It is interesting you point that out. I guess it means that the basic
colorimetry from EDID is supposed to be really only the default
colorimetry and might not have anything to do with the actual panel
primaries.


Thanks,
pq

--Sig_/xRfyiUsF+7c.9PVYWqJoKxk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmQJrv4ACgkQI1/ltBGq
qqdNFA//UAmscNR41M+Qx5Swt7DnS7SiNQzGzTuDo4VSn0MQmkAsEr9mla7RL2Eo
JgL1ci8OLRW1Dg+/iqyYSLivjaEvRtNX/Xjp95oKxHDWn1J/McKukWP/eCa7LEQ2
MHwUv4xFeOrFi0HwNJxW1OCQmI3s1Ue+X5IaGj0f6f8xtOv1gya6PDb1rfZ9FQ/u
H9OnqMmcdynW8kyNZezD+RjiDrMMbHSMQR4MK8dO20JNgZ7elvbMs87nbGzWTmHp
EPK0i7gE9pqcels9LqPSlxHq4suGyUD+8l16m++1k8BNIJImfNqwe/Jkmhhc5r2w
rVkJZluKIBlShBsGUhKu5VbL4p7SPyii7m4TiYEmlN1K0ObUuP6zWDmXnx8xPcrA
+E+S7sw+HkcICtNkK6o5godWMVVAKwjTjS2vkz6U0HLUOrGGxin2egxOrKzSKIE3
6avW6GtClJxgSPE6Re3v280Zl49csFhlKcbzYoMXSIUzX0qiI4IYIwLeUyeaFfUG
swpaSP6V+n5xQXQY6GKb++p+kciZNYLpKCq3JXyKzvv1n4tPAf3x469gLkmaQS9X
xZicpL1Pq9zXcXdfr0HzxzRhVcx5+0aDMQrFAN8ZfJ6kaAbji1AhmcPzy759mtzY
hqRWj+CSHWpwim7l0eVU81N1dJXLrOShu3L14hzuVekHnvJU0Ww=
=UaW4
-----END PGP SIGNATURE-----

--Sig_/xRfyiUsF+7c.9PVYWqJoKxk--

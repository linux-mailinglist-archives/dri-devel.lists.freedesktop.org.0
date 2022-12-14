Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DB364C55A
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 09:56:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C65210E101;
	Wed, 14 Dec 2022 08:56:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D609E89EAC;
 Wed, 14 Dec 2022 08:56:01 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id z4so5977528ljq.6;
 Wed, 14 Dec 2022 00:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=jEkf8aHujPThgFhfHhjsPQUbLPyAxaZBtHCvt+qqZHE=;
 b=JxZVVPD2kA+0ZOb4wIghIP6/6Jd2H4d5YTk+MijO0y/YGB9SzMoVjxX8WLBTEqCWBE
 exMWL06cMTzYyHdlRM7PvX+MWID5i37IG/0E2hwFWjv2+K/61u8naE2UzLQ5ilcZSwIH
 +gaZiElz3QTPiYHw17PKjiGsxeZkdnZBmPn/W+mdC5oDotcqce6H4BkIHR7wuTwgIy9o
 PbNRGzJtQM5RG4s71Y4fislkefSiaYaXC9edPo+03Cu8k/3ymmHO5Rdk7YAhgEoQf5B9
 JSTMQExTNFGzUNMOrXbScu3TWsUC8sNM60lh+ljYriESx3jqzk20E7hl9g33FDCF179a
 K98A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jEkf8aHujPThgFhfHhjsPQUbLPyAxaZBtHCvt+qqZHE=;
 b=z/aBbi2m39KPz9mbFmWVAKsHobSgSZgZZ4YNKgiR6Kawl9+roclF1xKBMzE553asaA
 9kWRJ4pWQWfjVrj7Gx5hwn+viQUcV6cR3whz4bspN3Abc1Idjj/wMX9chXChPoQotXow
 FXIbio249oMQKHtG7Fl+1EDdGtFsl0z3LU+ulM1AVg+u0L4le3ezgoEXkI0FAE6zDEuz
 mSjOogwRp1JkBBXGQcIwdLE1OAgyrzMdm4WCuKZyRsiLNxdimCOXDnqlmQbTL6iUzq4g
 PudPjPdup3OiySDAtB/PJb2BPbAMNOtjS+uY226sCw8SJYL/syKeT+Ibn/fw32Miqxzi
 HvZA==
X-Gm-Message-State: ANoB5pnneBAA/GOjQUB05XVZqjgDuqQu2MUyAsMaFO6e2m3Ixbw3ajrh
 sSv64Tk6Oq8MnEv5NJoB4a0=
X-Google-Smtp-Source: AA0mqf5uDNliBDiBHv4lIGGGafUO+NLN/WjP1XrzcHUSpmeu+zje40nKOwcqJNbipZEycDHXfBzWCA==
X-Received: by 2002:a2e:be1f:0:b0:26f:db35:7e42 with SMTP id
 z31-20020a2ebe1f000000b0026fdb357e42mr7585549ljq.17.1671008160104; 
 Wed, 14 Dec 2022 00:56:00 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 q23-20020a2e9697000000b0026bf0d71b1esm541585lji.93.2022.12.14.00.55.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 00:55:59 -0800 (PST)
Date: Wed, 14 Dec 2022 10:55:56 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH 06/16] drm/connector: Allow drivers to pass list of
 supported colorspaces
Message-ID: <20221214105556.63a9296e@eldfell>
In-Reply-To: <25da5107-9bdf-abc9-adf8-98778d87dafc@amd.com>
References: <20221212182137.374625-1-harry.wentland@amd.com>
 <20221212182137.374625-7-harry.wentland@amd.com>
 <20221213122342.548631bf@eldfell>
 <25da5107-9bdf-abc9-adf8-98778d87dafc@amd.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OOUJNJZSbRzwizT4zIw54Mn";
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 Uma Shankar <uma.shankar@intel.com>, amd-gfx@lists.freedesktop.org,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/OOUJNJZSbRzwizT4zIw54Mn
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 13 Dec 2022 11:32:01 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> On 12/13/22 05:23, Pekka Paalanen wrote:
> > On Mon, 12 Dec 2022 13:21:27 -0500
> > Harry Wentland <harry.wentland@amd.com> wrote:
> >  =20
> >> Drivers might not support all colorspaces defined in
> >> dp_colorspaces and hdmi_colorspaces. This results in
> >> undefined behavior when userspace is setting an
> >> unsupported colorspace.
> >>
> >> Allow drivers to pass the list of supported colorspaces
> >> when creating the colorspace property. =20
> >=20
> > Hi Harry,
> >=20
> > what is there for drivers to support? Isn't this just infoframe data
> > that shall be sent down to the sink as-is with no other effect?
> >  =20
>=20
> You have a good point.
>=20
> Right now the supported colorspaces de-facto depend on driver implementat=
ions
> as you can see in [1] for i915 and [2] for amdgpu. The amdgpu driver will
> also program the MSA [3] for DP connections, and a bunch of other things =
which
> are deeper in the driver.
>=20
> [1] https://gitlab.freedesktop.org/hwentland/linux/-/blob/hdr-colorimetry=
/drivers/gpu/drm/i915/display/intel_dp.c#L1741
> [2] https://gitlab.freedesktop.org/hwentland/linux/-/blob/hdr-colorimetry=
/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c#L5155
> [3] https://gitlab.freedesktop.org/hwentland/linux/-/blob/hdr-colorimetry=
/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.c#L368
>=20
> I don't know why the DP VSC stuff needs to be in drivers. It should be
> common. The MSA packing would likely have to be driver specific since the
> mechanism of packing it is HW specific.

What's MSA?

I don't see it in
https://www.kernel.org/doc/html/latest/gpu/amdgpu/display/dc-glossary.html
or anywhere under Documentation/gpu or in CTA-861-H.

> I'll have a closer look and see if we can eliminate the "driver supported"
> bit. If we can't we'll probably need to describe the reasoning better.

That would be nice, thanks!

> Will it be a problem if the list of supported colorspaces differs between
> drivers?

I do not think so. It's just normal KMS UAPI that one must always
inspect an enumeration to see what values are possible. Userspace
cannot use a header with pre-defined numerical values, they always need
to be introspected first like everything else about KMS properties.

I know there were some opinions about hard-coding enum numerical values
in headers, but I think in the end everyone agreed to the introspection
even if it didn't seem useful at the time.

Besides, if a driver never supported a given value but misbehaved or
refused, I don't think that counts as a kernel regression?


Thanks,
pq

>=20
> Harry
>=20
> > Is the driver confusing colorimetry with color-representation (the
> > RGB-YCbCr conversion)? Or is this property defining both?
> >=20
> > I feel that the documentation of "Colorspace" KMS connector property
> > needs clarification, and a list of potentially available values with
> > explanations, more than just a reference to CTA-816-H which it does not
> > even do yet.
> >=20
> > Perhaps a table, where for each enum drm_colorspace entry has a row exp=
laining:
> >=20
> >=20
> > Thanks,
> > pq
> >=20
> >  =20
> >> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> >> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> >> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> >> Cc: Vitaly.Prosyak@amd.com
> >> Cc: Uma Shankar <uma.shankar@intel.com>
> >> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> >> Cc: Joshua Ashton <joshua@froggi.es>
> >> Cc: dri-devel@lists.freedesktop.org
> >> Cc: amd-gfx@lists.freedesktop.org
> >> ---
> >>  drivers/gpu/drm/drm_connector.c               | 140 +++++++++---------
> >>  .../gpu/drm/i915/display/intel_connector.c    |   4 +-
> >>  drivers/gpu/drm/vc4/vc4_hdmi.c                |   2 +-
> >>  include/drm/drm_connector.h                   |   8 +-
> >>  4 files changed, 83 insertions(+), 71 deletions(-)
> >>

--Sig_/OOUJNJZSbRzwizT4zIw54Mn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmOZj5wACgkQI1/ltBGq
qqe8hQ//f+X190eG8XTRkBcgzNabBUgyLz0s4bIr0c6YOz0S82rSTykflosNNG16
a1BJxmEeSg5EKr3VsMBxN1ptkaeQiebcs6oaHYiXSqt4P75GRjfOZfJlbQHioRMf
qO9JbAd6vdjGWH+YJ2a+ASbEkIJ43Qhc6PY0bLCb9xJac507kG107aeB4War4vRp
mhJ6KtKGXeRF/j3mANCX1cxj9OkuGNpxBjWkl+6jP0mn2bmJhARA9Dq9kvIwgG22
N0+WbxWO66oks48fBKOm6tuV2agXB2ACEe/tYJ0MPsNjexJJSzvMuW24NdRRpZWH
bR/UOGjkt6ouIzowjablRVyrZDUR2g7XxlRuh7m74tYCsFSSDYWFLbhpSCLQ2PRn
2+LjpWKBgV26TBPi4jn/t+RYgro7KwAxFgQysb+5Lke6ZGHmTx+k+ZKUDQAsxACT
0n4IUyQoMtNqo+dhZsECY66NahBbBhCD39aPb3ytW24YSjny5LkTbeGpa+KhdzQo
RdxxjFzLco+iDC/4L0foJZRMvxh63nPMUYBBGQvpg1CupdxcwsggR10CqBZ2bvHi
RxLNMWLSCt2Vy5HC6idviSVWaIf8OsKW//q8eXjD6FNknPQMbOgzqYj/IcRkTPUG
ubWOnJm5ct/4KNAU5q4iz1XyAS1KreM1ZXbdDcnaxuffu7bh288=
=cz91
-----END PGP SIGNATURE-----

--Sig_/OOUJNJZSbRzwizT4zIw54Mn--

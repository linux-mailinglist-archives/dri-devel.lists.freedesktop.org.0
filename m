Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D4E6527F
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 09:29:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAFC589C60;
	Thu, 11 Jul 2019 07:29:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C71BD89C60;
 Thu, 11 Jul 2019 07:29:35 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id r15so3324927lfm.11;
 Thu, 11 Jul 2019 00:29:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=dH+7Wdjzw5CSmOjB2GXowTgRMjAtunaaYHA0nrjqNdA=;
 b=Hu22p66H6G568CwlmTY+GFgvc051+tvYQ9FPaIiLSflRUogKdRfm/vYhlV/klt/yyL
 bf6IASIPGTm4590UJjq+mY9YeUKPKnT0u1ujyROrGA01quZQq2BF11/G+CSlxUVNztDY
 7n/dzG5pPT4bonhLo9BHQlguuf8eWRU+wWJppjM/p70MtnEQ4I7XtfhTEZbJN8eWzvzz
 cyouSWyYv/MimF/wqAnKbWeUlWtqnuKgHSgCOR+WbcUAMQQssR89OcrG2eBzlTfmO/mO
 4gM3aad4K/W17Ez/JJCpEwk8Dyl04x+PWDIxqLA8sTnls/NFh9/QUuKUN9XsbLCE821D
 p+fg==
X-Gm-Message-State: APjAAAVZBgwixLmX0gngfzK0b6spJ1iUMGguAh16pQrKlM1AiMaFWvHV
 u6g+rmpr10abhWHI+iZqaMo=
X-Google-Smtp-Source: APXvYqyluACLWERxNG740O5nTnKiHcRSfhjrQnw+9Kmhym72mSW9T2pKVh0RVveJW2eC1d+HFbw6GQ==
X-Received: by 2002:a05:6512:48f:: with SMTP id
 v15mr1055595lfq.37.1562830174152; 
 Thu, 11 Jul 2019 00:29:34 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id d16sm840986ljc.96.2019.07.11.00.29.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 11 Jul 2019 00:29:33 -0700 (PDT)
Date: Thu, 11 Jul 2019 10:29:23 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [Intel-gfx] [RFC][PATCH 0/2] drm: PATH prop for all connectors?
Message-ID: <20190711102923.3d219640@eldfell.localdomain>
In-Reply-To: <11bb4ca1d27d3ab2d169deb57951855c4ddcd563.camel@redhat.com>
References: <20190613184335.7970-1-ville.syrjala@linux.intel.com>
 <11bb4ca1d27d3ab2d169deb57951855c4ddcd563.camel@redhat.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=dH+7Wdjzw5CSmOjB2GXowTgRMjAtunaaYHA0nrjqNdA=;
 b=PBSoeNkJzx5ShLJTe/BPvKuayiudkggrQo1yOHglLE7QAR3z5im6mR7p1DkM2KoTm4
 f0yvKP2efxXrBp7/wTVlQ8ExGzdp/yj54rRBfcQ88aCYuMZph3+k59zvlS8AR0JwpNHA
 nPRHraHp7Mug3YSkMFihXlm4SLAE6qQiAZwBwRfmYTjai/UL49v/xcSS5V9znqBWbORK
 hCdkBCet/aQBCY++5fBEK9w2XvRzHDH1nMmGGhnXu5UTrSDFzu06Zl4j5zIR9IhhGRaG
 AG8nIqJyWyVcxfRyI8anBX6R+SN/guTwWjjUeSP8q1/9voYg8ATiFvGkN5TR+FjJuCOL
 J1ig==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2036911346=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2036911346==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/+0Jw/1b9rrO3Jp9+yo2w91N"; protocol="application/pgp-signature"

--Sig_/+0Jw/1b9rrO3Jp9+yo2w91N
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 10 Jul 2019 18:43:53 -0400
Lyude Paul <lyude@redhat.com> wrote:

> (adding sunpeng.li@amd.com to the thread here, since this is relevant to =
the DP
> aux device work)
>=20
> I mentioned this in IRC, but figured I should mention it on the ML as wel=
l so it
> can be discussed further. Honestly: I don't like the way we implement the=
 path
> prop for MST. Mainly because
>=20
>  * It looks ugly: mst:<obj-id>-<port#1>-<port#2> is ambiguous looking. I =
didn't
>    even realize the first number was actually supposed to be the object I=
D until
>    I looked at the code
>  * I strongly doubt object IDs are consistent enough for the path prop to
>    actually be as meaningful as it looks
>  *=20
> Obviously we can't just remove the path property, since it's being used in
> userspace. This has me somewhat convinced that I think it might be a bett=
er idea
> to just make a whole new path_v2 prop, and document that the path prop wa=
s a bad
> idea and is now deprecated (but still functional). If we did this, we cou=
ld come
> up with a much nicer MST naming scheme as well! Consider:
>=20
> For a connector with the RAD 0.1 living on the topology on DP-1 on card0:
>=20
> mst:DP-1:0.1
>=20
> I see multiple benefits to this:
>  * Look how easy it is to read!
>  * DP-1 isn't guaranteed to be consistent, but it is certainly far more l=
ikely
>    to be consistent than an object ID.

Hi,

please, do not go with "more consistent but not fully". If the name is
not all the way persistent, then it's useless because it will break
things in rare cases. We already have a 80% or a 95% solutions, adding
one more <100% solution does not help.

>  * This seems a lot easier to write udev rules for, imho

Wait, one can write udev rules for connectors and stuff?
How? What can they do?

> The only thing I'm not sure about whether or not we should also prepend t=
he
> connector name with the device (e.g. card0, card1, etc.). I thought this =
might
> be necessary at first, but thinking about it - it shouldn't be hard to fi=
gure
> out the device in question from looking at sysfs since any userspace appl=
ication
> will know which DRM fd the connector comes from.

=46rom a display server perspective using the libdrm KMS API, yes, we
always know from which device a connector comes from, and can make up a
persistent name for the device ("card0" is not a persistent name).


Thanks,
pq

>=20
> Does this sound like a good idea? If so, I'd be happy to write up some pa=
tches
> for this
>=20
> On Thu, 2019-06-13 at 21:43 +0300, Ville Syrjala wrote:
> > From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> >=20
> > Here's a possible apporoach for providing userspace with
> > some stable connector identifiers. Combine with the bus
> > name of the GPU and you should have some kind of real
> > physical path description. Unfortunately the ship has
> > sailed for MST connectors because userspace is already
> > parsing the property and expects to find certain things
> > there. So if we want stable names for those we'd probably
> > have introduce another PATH prop (PHYS_PATH?).
> >=20
> > I suppose one alternative would to make the connector=20
> > type_id stable. Currently that is being populated by drm=20
> > core and it's just a global counter. Not sure how badly
> > things would turn out if we'd allow each driver to set
> > that. It could result in conflicting xrandr connector
> > names between different GPUs which I suppose would
> > confuse existing userspace?
> >=20
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > Cc: Ilia Mirkin <imirkin@alum.mit.edu>
> >=20
> > Ville Syrj=C3=A4l=C3=A4 (2):
> >   drm: Improve PATH prop docs
> >   drm/i915: Populate PATH prop for every connector
> >=20
> >  drivers/gpu/drm/drm_connector.c        | 13 ++++++++--
> >  drivers/gpu/drm/i915/icl_dsi.c         |  3 +++
> >  drivers/gpu/drm/i915/intel_connector.c | 20 +++++++++++++++
> >  drivers/gpu/drm/i915/intel_connector.h |  3 +++
> >  drivers/gpu/drm/i915/intel_crt.c       |  2 ++
> >  drivers/gpu/drm/i915/intel_dp.c        |  6 ++++-
> >  drivers/gpu/drm/i915/intel_dp_mst.c    |  3 +--
> >  drivers/gpu/drm/i915/intel_dvo.c       |  3 +++
> >  drivers/gpu/drm/i915/intel_hdmi.c      |  4 +++
> >  drivers/gpu/drm/i915/intel_lvds.c      |  2 ++
> >  drivers/gpu/drm/i915/intel_sdvo.c      | 35 ++++++++++++++++++--------
> >  drivers/gpu/drm/i915/intel_tv.c        |  2 ++
> >  drivers/gpu/drm/i915/vlv_dsi.c         |  3 +++
> >  13 files changed, 83 insertions(+), 16 deletions(-)
> >  =20
>=20


--Sig_/+0Jw/1b9rrO3Jp9+yo2w91N
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl0m5VMACgkQI1/ltBGq
qqe0phAAghZL7EsC/LixdimBug2fwI4H4u52OE0oiO0s6qnKn09FMFu3qPJaYmSJ
1DcTBd2uOZ0xsiYpgdZL0y1m6V6gdUlWtP+DPz9hrTH7EYMK18FETppzcmmeI+Ob
QUudEZkiKzyu4MjhsBrEVwnXm/5Fg0VkF3l6VEUZAKQ7enqOOLj0un7wTkk83TAb
k401Hg080kNWYU2RMuH9rxDtytZMTAg7/cr3mLQZo5Fjf+5yd9JWtltdJXZwveYT
1rp5cidkcwRpe5k6DWCZZFUEXg60pZKjFEuxaSfo8Us078xgrN9z3EICy8EnAshI
OO43Zi89klHgf6NI4kp86SKAMLbrHsEojy5WZrbkWmLFy0vvfiEahxJHQ0YEJDr0
hub3NBW8+5AGavydUwgffQ3oTkX2k61+clZ/wXAP1FEK61U1G62jYY3k0LcHdXxQ
Z/8gAkwWhyE/0bv3DhHzFZpKk3Jdv+B7K1Gr4g6oB5dvh5YBtW+xAs+bYvNkaXi1
UjALg33IZajOKjHUCKSJ9lXYFUlb8YMHP+n2Aw8s41bdqwNXoPLCKMOHbn523dyO
v6ONtYw0W+aR1dcxT7oSngE281TcYOK5/wIX3nd/IRuDeW4k9ZDVnyfu/2v039xq
jzKGGI5OsiQDgB1EeAPnUra/7ZN1us4SXsmZyCj/LHvG37hDsns=
=UBoq
-----END PGP SIGNATURE-----

--Sig_/+0Jw/1b9rrO3Jp9+yo2w91N--

--===============2036911346==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2036911346==--

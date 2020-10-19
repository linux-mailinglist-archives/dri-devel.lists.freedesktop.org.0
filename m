Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B07929231C
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 09:50:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BFB06E8DD;
	Mon, 19 Oct 2020 07:50:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A17C6E8DD
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 07:50:00 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id p15so10842774ljj.8
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 00:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=5X36yZN/0RCwsmaShgktzPBGQv4A1LnIfs6f2Pwaut4=;
 b=XbxJxMWeN1198XTUbkWlMYD57zPnXr+1tnSzk6wz90KfjUUGQWZJJtif1tl1Kx7jpA
 Y7dqqhyGyFX/nGpTBfStxVbXBXA/EgF0ncr0Sr9B9ocylt5mulnSsLcQkBGHMeDbodmj
 nSCJakcokBFzA5SkYxCAlOJ6C+dKOPYy68s4oWArOrQrkvcdPMphFCexs1zLCxCQnpLC
 ygMUJYAUhItGuDvuR6mcb/3S/Z3B1IhJs+8F8ZwAwnd32dwvQhllqra1XNR+e7eQn3Eo
 N3OgxhaFnU3aFw4th08ACAcT27GG2uwverMOPSZxW86+wKfdqCRx44+oAjWgxUkLqWr/
 OZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=5X36yZN/0RCwsmaShgktzPBGQv4A1LnIfs6f2Pwaut4=;
 b=kZ6sLI9KW3Brb2dmCjw9VHnj4qac2L4pMFoGS+tmFJz8Y8saEc2/OwCURilQoCsCVp
 AYc0TtT4iuiNDUiGvWkakk4miIIi/kirBae8wVIWFykIfGy0jALOiY0oC9mtYWKK/ORw
 McxccCAkx5NLl96KBewCOmn/uE2S9lILztxDoQpE9ykjkhyZlC5wtnLm8GJ2qGGRMjM6
 GN+Eh+8vFqLsjUX9FZAQkENTfFHUe/Lr6ZNkWFvFMmxcxw6dXIWHntlTIb3lhEH4SRyq
 2zSfK8fX0sTES80X5MxE0pfnq/+invQIvJbXUSEx2oLshafC4zRcycI9Vd4rQs/gibJZ
 LkGg==
X-Gm-Message-State: AOAM532z0aAFHgT6b1uuaLNOdN66NM2JZYQXjX8+94uPWbkvU1qUycJV
 mCKN1DZ4ho1WOOf0etBEYpU=
X-Google-Smtp-Source: ABdhPJx3Pq0YdgxZqvg9UZPTltPuEkZLtOV/7weaauH1M7ZYGA5GXIIqlO90ttY+CZr6XGuDp6UqUA==
X-Received: by 2002:a2e:8986:: with SMTP id c6mr6225813lji.29.1603093798818;
 Mon, 19 Oct 2020 00:49:58 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id i63sm3142553lfi.53.2020.10.19.00.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 00:49:58 -0700 (PDT)
Date: Mon, 19 Oct 2020 10:49:48 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm: document that user-space should avoid parsing EDIDs
Message-ID: <20201019104948.5ae842c0@eldfell>
In-Reply-To: <20201016135016.GO6112@intel.com>
References: <izOAkOJk67APzk9XP_DhUGr5Nvo_KwmIXlGQhiL101xxttvMO3K1DUdEQryIFXe2EjG16XGuc_YPMlTimZjqePYR3dB0m4Xs4J8Isa3mBAI=@emersion.fr>
 <CAPj87rM3H+kNzMgw1B00iDzH94gZPoLfr17KrAAiCXuUB2VHKA@mail.gmail.com>
 <20201009131025.GS6112@intel.com> <20201009165651.31199071@eldfell>
 <20201009142018.GT6112@intel.com> <20201012101101.12c6bbb8@eldfell>
 <20201016135016.GO6112@intel.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Sebastian Wick <sebastian@sebastianwick.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Content-Type: multipart/mixed; boundary="===============1262637503=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1262637503==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/XhKJWOk+ZXMLfzdg4okuG/x"; protocol="application/pgp-signature"

--Sig_/XhKJWOk+ZXMLfzdg4okuG/x
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 16 Oct 2020 16:50:16 +0300
Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:

> On Mon, Oct 12, 2020 at 10:11:01AM +0300, Pekka Paalanen wrote:
> > On Fri, 9 Oct 2020 17:20:18 +0300
> > Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:
> >  =20
> > > On Fri, Oct 09, 2020 at 04:56:51PM +0300, Pekka Paalanen wrote: =20
> > > > On Fri, 9 Oct 2020 16:10:25 +0300
> > > > Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:
> > > >    =20
> > > > > On Fri, Oct 09, 2020 at 01:07:20PM +0100, Daniel Stone wrote:   =
=20
> > > > > > Hi,
> > > > > >=20
> > > > > > On Fri, 9 Oct 2020 at 10:24, Simon Ser <contact@emersion.fr> wr=
ote:     =20
> > > > > > > User-space should avoid parsing EDIDs for metadata already ex=
posed via
> > > > > > > other KMS interfaces and properties. For instance, user-space=
 should not
> > > > > > > try to extract a list of modes from the EDID: the kernel migh=
t mutate
> > > > > > > the mode list (because of link capabilities or quirks for ins=
tance).
> > > > > > >
> > > > > > > Other metadata not exposed by KMS can be parsed by user-space=
. This
> > > > > > > includes for instance monitor identification (make/model/seri=
al) and
> > > > > > > supported color-spaces.     =20
> > > > > >=20
> > > > > > So I take it the only way to get modes is through the connector=
's list
> > > > > > of modes. That sounds reasonable enough to me, but I think to p=
roperly
> > > > > > handle colour (e.g. CEA modes have different behaviour for
> > > > > > limited/full range depending on which VIC they correspond to II=
RC)     =20
> > > > >=20
> > > > > If the mode has a VIC and that VIC is not 1, then it's limited ra=
nge,
> > > > > otherwise full range. There are fortunately no cases where you wo=
uld
> > > > > have the same exact timings corresponding to different quantizati=
on
> > > > > range depending on the VIC.
> > > > >=20
> > > > > And the only reason the same timings could correspond to multiple=
 VICs
> > > > > is aspect ratio. Which is already exposed via the mode flags, ass=
uming
> > > > > the appropriate client cap is enabled.
> > > > >=20
> > > > > So I think the only reason to expose the VIC would be if userspac=
e is
> > > > > non-lazy and wants to manage its colors presicely, but is otherwi=
se lazy
> > > > > and doesn't want to figure out what the VIC of the mode is on its=
 own.   =20
> > > >=20
> > > > What would "figure out what the VIC of the mode is" require in user=
space?
> > > >=20
> > > > A database of all VIC modes and then compare if the detailed timing=
s match?
> > > >=20
> > > > Is that also how the kernel recognises that userspace wants to set a
> > > > certain VIC mode instead of some arbitrary mode?   =20
> > >=20
> > > Yes and yes.
> > >=20
> > > Note that atm we also don't have a way for userspace to say that it
> > > wants to signal limited range to the sink but wants the kernel
> > > to not do the full->limited range conversion. Ie. no way for userspace
> > > to pass in pixels that are already in limited range. There was a patch
> > > for that posted quite long ago, but it didn't go in. =20
> >=20
> > Thanks for the heads-up.
> >=20
> > If userspace uses all available KMS color management properties
> > (CTM, LUTs, etc.) *and* the video mode implies limited range on the
> > cable, at what point in the pixel pipeline does that conversion from
> > full to limited range occur? =20
>=20
> It should be the last step.
>=20
> <stop reading now if you don't care about Intel hw details>
>=20
> There is a slight snag on some Intel platforms that the gamma LUT
> is sitting after the CSC unit, and currently we use the CSC for
> the range compression.
>=20
> On glk in particular I *think* we currently just do the wrong
> thing do the range compression before gamma. The same probably
> applies to hsw+ when both gamma and degamma are used at the same
> time. But that is clearly buggy, and we should fix it to either:
> a) return an error, which isn't super awesome since then you
>    can't do gamma+limited range at the same time on glk, nor
>    gamma+degamma+limited range on hsw+.
> b) for the glk case we could use the hw degamma LUT for the
>    gamma, which isn't great becasue the hw gamma and degamma
>    LUTs are quite different beasts, and so the hw degamma LUT
>    might not be able to do exactly what we need. On hsw+ we do
>    use this trick already to get the gamma+limited range right,
>    but on these platforms the hw gamma and degamma LUTs have
>    identical capabilities.
> c) do the range compression with the hw gamma LUT instead, which
>    of course means we have to combine the user gamma and range
>    compression into the same gamma LUT.
>=20
> So I think c) is what it should be. Would just need to find the time
> to implement it, and figure out how to not totally mess up our
> driver's hw state checker. Hmm, except this won't help at all
> with YCbCr output since we need to apply gamma before the
> RGB->YCbCr conversion (which uses the same CSC again). Argh.
> So YCbCr output would still need option b).
>=20
> Thankfully icl+ fixed all this by adding a dedicated output CSC
> unit which sits after the gamma LUT in the pipeline. And pre-hsw
> is almost fine as well since the hw has a dedicated fixed function
> thing for the range compression. So the only snag on pre-hsw
> is the YCbCr+degamma+gamma case.

Interesting.

I gather that if I stick to RGB and full-range, or maybe just
full-range regardless of RGB vs. YCbCr on the cable, I should be fine.
I'd need to have color management disable all limited-range (VIC)
modes in a compositor... no, not disable, but maybe print a warning in
the log.

I'd love if there was a test suite ensuring these work correctly, but
that's a lot of work. I'm not sure if writeback or CRC helps with
it, or does it need actual HDMI or DP frame grabber hardware?

I presume that there is too much acceptable fuzz in output signal that
CRC testing is not going to be useful anyway.

The Wayland color management design, or more like compositor designs,
kind of rely on the KMS hardware doing exactly what it's told.


Thanks,
pq

--Sig_/XhKJWOk+ZXMLfzdg4okuG/x
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl+NRRwACgkQI1/ltBGq
qqdJqQ/+KSGz/hgff9V27/4hpWnh3jIbSjilgyC31ob6kzuW1orY3oqDec5kSW0O
ooLy5n8MBw5FKZnpbHfpyDnT3GFsdqs3PcV2nPhZWm44dQn2aDQxlgfdAi4FwoX5
B5vVsf+QNpaNq57cVOjT/7x6PyBhE6uANmVwycCa4NjS1uXEej0koObJimEDExrN
6R9W0+DSUDPxdzBbNihprvcDQ4oeKTZ8lPlUuetR5uGzVm3gZzpvLZb/tfu35TQS
oIn/5Pbf2Lkz5/SE3JzSkqkYTEuWOVnxljQngW1iIX9KWIdaVnP4gaPTxDBcEDwK
WiJN24dgw5m62PlOT2Yq1tl9rD/xHFchJrp1VqsLK9p3g9v+IAqTmp2I3bxG5Po3
LjdECqCEpwNsbayeF0Brfzp0yDFiHpKB4SNX8eaOhU3TBaG4u1X1GLSAblk65UJo
Bv3Q2D+abssGxcsD6wPHOR6JrIUApQ4yzoqhxZOVG3wH2KwMO5UlcNI9b2ksygC0
5alo5T8rcmoR5BHGL7yBPwDC+cbQUqCEBs9xrhbxVHfq/LsznMJkfHBs3umAr+/C
K7hJ1JbSRQCYCh3QWc1ix0huD/d/NGtPpKlY4WolFYohbsRKXTxlsuQ8/h72sGmy
ovh8TvDhV4YOAI/31uAtt+4/eK3TUj3/egULQKf5Eb7ukdpF3Qk=
=pzRz
-----END PGP SIGNATURE-----

--Sig_/XhKJWOk+ZXMLfzdg4okuG/x--

--===============1262637503==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1262637503==--

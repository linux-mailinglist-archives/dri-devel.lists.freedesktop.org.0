Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE1E28AED1
	for <lists+dri-devel@lfdr.de>; Mon, 12 Oct 2020 09:11:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB716E0BF;
	Mon, 12 Oct 2020 07:11:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B0936E0BF
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 07:11:14 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id v6so1601219lfa.13
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 00:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=qnIDWVzs4N24jsPe/bGQ+UEySKFgXhzxHHD1jNeTmO0=;
 b=ZuA8eTfwb8UtWYtjOb5MCuccKR4ox/sdPVMzGc7o2B2DPjf/51tDutpD2929NdzJ1a
 4sCWxd6qtG2LllEE6YkHcm6SOnHO7JQSyT3Gm58NlbBjTXT6CLKpSgRka+taTTYOMlWr
 uMDXttrtEpYTqRl9z21VWCgEVeo4mSnYAQwKCQcJy5QXhYuZpsHGz1jOIrc+o9IsqEBx
 NIorzpYoX5p/4sQvkkkef+7s9TJPHPq7s+IAmRuEV16YJjSSgKyHXldKnKKwi3rVbrtT
 /FrY4W+WLoyDYmD4aa15duw4GrBIHpbF5NboseTYpBIrLDINVVLT7oLu+2P/bNUer98x
 BNaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=qnIDWVzs4N24jsPe/bGQ+UEySKFgXhzxHHD1jNeTmO0=;
 b=DbhXBtGHDnU4ltvs7XikstmJamjef4uohQXdiI2EWEwEzW/4OsJIRqU2F/btNQZJXd
 cc4zTP2o5BHxOXCY8ue4rwGFbvZf6v5rr40nFBYZ/ss73JoBZOR7cDQlyCnoZvstQcnq
 M7gbzRiKCYP6Wz1KccjKnGB3mmCnW6cFXGIqkqAIbulERrJhPLDd719YFfPPYzvRXpbd
 8quJgYCt+pTHsnMgPybia9lJCFFtnLS0knrtpN6bYH4RTj9JzFL+vyH5JkFrQZW/F2Td
 RVcMvLno44noljCYdkK8hYpXdvQnXaKhp2svxlVQackdB5shD0jTlEvOUNQ8FoLhXHAl
 klPw==
X-Gm-Message-State: AOAM531E4Sp2jAsA88r20HXtNGv/CHCQVoPpJwXZCg4kiikjvNWf6qso
 OqkdesGFKNny1iddqaCmYh0=
X-Google-Smtp-Source: ABdhPJzUvxrPl8hXgGTpnuRh7cP1tPrtrxRha8njomefDEKYQKz1trqZHMt2HiAtnsLb7o3tbRRmqQ==
X-Received: by 2002:a19:8296:: with SMTP id e144mr8091884lfd.463.1602486672906; 
 Mon, 12 Oct 2020 00:11:12 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id i10sm512157lfl.243.2020.10.12.00.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 00:11:12 -0700 (PDT)
Date: Mon, 12 Oct 2020 10:11:01 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm: document that user-space should avoid parsing EDIDs
Message-ID: <20201012101101.12c6bbb8@eldfell>
In-Reply-To: <20201009142018.GT6112@intel.com>
References: <izOAkOJk67APzk9XP_DhUGr5Nvo_KwmIXlGQhiL101xxttvMO3K1DUdEQryIFXe2EjG16XGuc_YPMlTimZjqePYR3dB0m4Xs4J8Isa3mBAI=@emersion.fr>
 <CAPj87rM3H+kNzMgw1B00iDzH94gZPoLfr17KrAAiCXuUB2VHKA@mail.gmail.com>
 <20201009131025.GS6112@intel.com> <20201009165651.31199071@eldfell>
 <20201009142018.GT6112@intel.com>
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
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============2017554473=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2017554473==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/XTolmFF6Lv0RUuVT=prfkS/"; protocol="application/pgp-signature"

--Sig_/XTolmFF6Lv0RUuVT=prfkS/
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 9 Oct 2020 17:20:18 +0300
Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:

> On Fri, Oct 09, 2020 at 04:56:51PM +0300, Pekka Paalanen wrote:
> > On Fri, 9 Oct 2020 16:10:25 +0300
> > Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:
> >  =20
> > > On Fri, Oct 09, 2020 at 01:07:20PM +0100, Daniel Stone wrote: =20
> > > > Hi,
> > > >=20
> > > > On Fri, 9 Oct 2020 at 10:24, Simon Ser <contact@emersion.fr> wrote:=
   =20
> > > > > User-space should avoid parsing EDIDs for metadata already expose=
d via
> > > > > other KMS interfaces and properties. For instance, user-space sho=
uld not
> > > > > try to extract a list of modes from the EDID: the kernel might mu=
tate
> > > > > the mode list (because of link capabilities or quirks for instanc=
e).
> > > > >
> > > > > Other metadata not exposed by KMS can be parsed by user-space. Th=
is
> > > > > includes for instance monitor identification (make/model/serial) =
and
> > > > > supported color-spaces.   =20
> > > >=20
> > > > So I take it the only way to get modes is through the connector's l=
ist
> > > > of modes. That sounds reasonable enough to me, but I think to prope=
rly
> > > > handle colour (e.g. CEA modes have different behaviour for
> > > > limited/full range depending on which VIC they correspond to IIRC) =
  =20
> > >=20
> > > If the mode has a VIC and that VIC is not 1, then it's limited range,
> > > otherwise full range. There are fortunately no cases where you would
> > > have the same exact timings corresponding to different quantization
> > > range depending on the VIC.
> > >=20
> > > And the only reason the same timings could correspond to multiple VICs
> > > is aspect ratio. Which is already exposed via the mode flags, assuming
> > > the appropriate client cap is enabled.
> > >=20
> > > So I think the only reason to expose the VIC would be if userspace is
> > > non-lazy and wants to manage its colors presicely, but is otherwise l=
azy
> > > and doesn't want to figure out what the VIC of the mode is on its own=
. =20
> >=20
> > What would "figure out what the VIC of the mode is" require in userspac=
e?
> >=20
> > A database of all VIC modes and then compare if the detailed timings ma=
tch?
> >=20
> > Is that also how the kernel recognises that userspace wants to set a
> > certain VIC mode instead of some arbitrary mode? =20
>=20
> Yes and yes.
>=20
> Note that atm we also don't have a way for userspace to say that it
> wants to signal limited range to the sink but wants the kernel
> to not do the full->limited range conversion. Ie. no way for userspace
> to pass in pixels that are already in limited range. There was a patch
> for that posted quite long ago, but it didn't go in.

Thanks for the heads-up.

If userspace uses all available KMS color management properties
(CTM, LUTs, etc.) *and* the video mode implies limited range on the
cable, at what point in the pixel pipeline does that conversion from
full to limited range occur?

That is something I expect to need codify into Weston at some point so
that the complete pixel pipeline works as intended.


Thanks,
pq

--Sig_/XTolmFF6Lv0RUuVT=prfkS/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl+EAYUACgkQI1/ltBGq
qqfWpg//dm67NMKij+t7oIBx4LSEEtehHUarJwsDiZW5P0BLO9b2dtT7cPwD8hqE
f2aTq7xpDbWwi5tRVFDL78pJbQicY9yaHEB7WF4zWu3ZfWx9wzF5LLxf8bj66po1
vmQI0y8CP4pC0UufKGSpXbTZpnhnCHAQCgKQydbI5Ns84TIYeo0XNS5Cs6tMw1dj
3phVxi9py2XO1VMaxHIHyel5LIi4hbgyUwkOf8QNTQRVv9iGNaN53pCW/48mLHJ3
dXwl2e4gWtXc3EZ9ETrldQE7ss8Lc3TLOuL2FeGljXKsWa82Ku+xTPKtpni+yKTa
WmKKRFotxC5BndWjUKIShTMJ79+K8ldoFF4TqX6rygLbdK8z+2rEMuii+eEAg4vW
k4nM3aE5CcmcH9LE5e7pM/oYpqLxIS+DOcldRzCxEvA5jOJJ22zRi95PFjoU7yt9
VUR9ZkjrTLwm5QAKjIwwe1ET2+pelr18/xDTtBbNRypetrKiTn6Gy0YUhtyl9h6N
qjMZ/D+aPjrxhv/eC+j6XjIBsbxOCVtNpcjQj+3KJ35jLZuLs0y/5kpb9ZfpkjG1
Wb26k+jCYBEdGUI+Y7oWON4ppz1eA3uTtJ/BirCTVRonELEaoox0/NMF4XxI2Os0
eZk9rAhCbN4pWen8z77+7AL4pCVkixPJaqyW7NCzRj9YrFPzaAg=
=R9jH
-----END PGP SIGNATURE-----

--Sig_/XTolmFF6Lv0RUuVT=prfkS/--

--===============2017554473==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2017554473==--

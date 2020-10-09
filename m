Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0057E288A1B
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 15:57:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D896ECE2;
	Fri,  9 Oct 2020 13:57:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFCE86ECE2
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 13:57:04 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id a7so9700814lfk.9
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 06:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=gxvKXMreRAFV2yTA3to+hDfZWzJaWe8MV4Aw23HeYc8=;
 b=CMI/vWQi4y5k0ELBDqusVm1ClKmw3LlkiHIWwg9CdycenHcz71VvfVNZhVecI8y9zW
 0gDEy6lJ1Nke7JkaBG9KxCQsoYz89LzI2liIfhqbZkC8Crv5AMfenreA4KvQT/pe72OI
 F/d87AhZRfytC98CgPGUzt62Q+O5jTrGNELrZderw9ZrjnGtVaGpx0OImYlj7U6vwfzT
 v6ZyB+4IuBB08vJLZtSZgF8ozl6SYOWXUw7gOtfALU4Q9vjDEeI85AX/AK80MhNWglgx
 dzLepO5HhiQo/7sqvfQRZ5Et2IRfGnDR7/Z5H20aJpxlY98+BSbkVIQ/ugNL8npkMWSX
 S1eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=gxvKXMreRAFV2yTA3to+hDfZWzJaWe8MV4Aw23HeYc8=;
 b=D355/+4eRgTh84re6B0OMW1QetB7QPqqlXnbR9nCgEQMx1UHs3v+VEMirPxI81blZ1
 caFJYv5pTdtNy6bS3MyzpFWCUx4KN4RsfBlrImKMt+w/DvhysPJDzhg1SCnEhDktQw3a
 8xXtG9bXxOZ/6fZJuMZcItCP55IcEqosr9P5CCHIjqWbrHNJDHWR3sRqK0DLGYwnGKhx
 K8oBzgTXrFoUcK1m30OXVV1OzWvm9Km8oxmmx6ZyblPrAzKfQqtWaJAZgJul0WnsUXWm
 vuv++MYm+vvPQFWfXjxN8m76lbeRBtQqa5u/CuagR7guPErgug9HmPaXCzLQ0bHXd4OY
 w/ow==
X-Gm-Message-State: AOAM532JgX3/WTWy6Xy0BSWWDcLxA0mgCzjXCAYkg7bg3/WShfvpZ4vH
 JmdrH0HBtURetrJXLKCqrqQ=
X-Google-Smtp-Source: ABdhPJy4Q4q0rc/5b/ORQtPDKnYKG+V1JVKH+gbqur8DGz61F3WJf9V2l3Xuz9fR2CAoO9uTGUuOiA==
X-Received: by 2002:a05:6512:3191:: with SMTP id
 i17mr4118187lfe.409.1602251823098; 
 Fri, 09 Oct 2020 06:57:03 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id o128sm1481562lfa.126.2020.10.09.06.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 06:57:02 -0700 (PDT)
Date: Fri, 9 Oct 2020 16:56:51 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm: document that user-space should avoid parsing EDIDs
Message-ID: <20201009165651.31199071@eldfell>
In-Reply-To: <20201009131025.GS6112@intel.com>
References: <izOAkOJk67APzk9XP_DhUGr5Nvo_KwmIXlGQhiL101xxttvMO3K1DUdEQryIFXe2EjG16XGuc_YPMlTimZjqePYR3dB0m4Xs4J8Isa3mBAI=@emersion.fr>
 <CAPj87rM3H+kNzMgw1B00iDzH94gZPoLfr17KrAAiCXuUB2VHKA@mail.gmail.com>
 <20201009131025.GS6112@intel.com>
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
Content-Type: multipart/mixed; boundary="===============1243181858=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1243181858==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/xraxIPwmX.n_97qxJDI.5QK"; protocol="application/pgp-signature"

--Sig_/xraxIPwmX.n_97qxJDI.5QK
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 9 Oct 2020 16:10:25 +0300
Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:

> On Fri, Oct 09, 2020 at 01:07:20PM +0100, Daniel Stone wrote:
> > Hi,
> >=20
> > On Fri, 9 Oct 2020 at 10:24, Simon Ser <contact@emersion.fr> wrote: =20
> > > User-space should avoid parsing EDIDs for metadata already exposed via
> > > other KMS interfaces and properties. For instance, user-space should =
not
> > > try to extract a list of modes from the EDID: the kernel might mutate
> > > the mode list (because of link capabilities or quirks for instance).
> > >
> > > Other metadata not exposed by KMS can be parsed by user-space. This
> > > includes for instance monitor identification (make/model/serial) and
> > > supported color-spaces. =20
> >=20
> > So I take it the only way to get modes is through the connector's list
> > of modes. That sounds reasonable enough to me, but I think to properly
> > handle colour (e.g. CEA modes have different behaviour for
> > limited/full range depending on which VIC they correspond to IIRC) =20
>=20
> If the mode has a VIC and that VIC is not 1, then it's limited range,
> otherwise full range. There are fortunately no cases where you would
> have the same exact timings corresponding to different quantization
> range depending on the VIC.
>=20
> And the only reason the same timings could correspond to multiple VICs
> is aspect ratio. Which is already exposed via the mode flags, assuming
> the appropriate client cap is enabled.
>=20
> So I think the only reason to expose the VIC would be if userspace is
> non-lazy and wants to manage its colors presicely, but is otherwise lazy
> and doesn't want to figure out what the VIC of the mode is on its own.

What would "figure out what the VIC of the mode is" require in userspace?

A database of all VIC modes and then compare if the detailed timings match?

Is that also how the kernel recognises that userspace wants to set a
certain VIC mode instead of some arbitrary mode?

Can CVT or GVT produce those exact timings? Can that accidentally
result in limited range?

Sounds like the hypothetical libedid needs a libvic as a friend... and
libpixel-format while at it. :-)


Thanks,
pq

--Sig_/xraxIPwmX.n_97qxJDI.5QK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl+AbCMACgkQI1/ltBGq
qqdZjhAAhn+3ML5fJz6eQX3DTlLwYqE7RAnUb7b7cgoilQgPzJ2RV082+cXpxzuu
TmSXJ0ntFR+L46k7JozbS4xB1Km2HtBcNhj3YcqUJhKCy1J01VTcRimh49csou8u
XQ+BvM9ngUyPIEu+Qnc0BzWGZq9iQTS1T7dETWHttq2kexgi16xc0hzroOcTAKRp
Eebd04sgEvc1EjuxesnvKLxoLdb/MVOh+xlkO/znpVAsS/LK0J8VLedbWXtS5coH
jB0x+6/LspabPQTZQ0ieqbvOCJy+uuTUifb6p255UlnkRjY0GXKlOeJWWwBVQBA1
ZV0dDAnMA5Bz35JkW72NaOOyJEryzVfxCiWaR1ZWTfKkKyIgsLtbXzokGTwDqKMM
O2B7YUnwa6GnUtrRBlSs1HxlR5o1Cfpsl7no9AQJ985t9qXRj3iGrkgiVteufzpc
1D1H96oLFGo1yEi5B80NDyVvspbsXtL5xvyyxKIy98h/egDCyMI2QIsxEFwBDGGX
E0U4QvdHHgh2JSZViMQMNKld75UL4LcHH+rx1n9SkY8+sQvPgFcfLHoLU+D08+vz
t3rVMM4tJFJjuDuN89UranKsTXFooZQJFOl+Mr2V0I3HPqtVspfsE6bOrwi9aUSY
3oAaWim5sD8GJzAqNbdmA507Jhr+9707xttthswgZQw59sTD21M=
=RlwC
-----END PGP SIGNATURE-----

--Sig_/xraxIPwmX.n_97qxJDI.5QK--

--===============1243181858==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1243181858==--

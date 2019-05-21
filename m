Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4685F24B0E
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 11:01:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78B4B8921B;
	Tue, 21 May 2019 09:01:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE7308921B;
 Tue, 21 May 2019 09:01:35 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id l26so12411853lfh.13;
 Tue, 21 May 2019 02:01:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=PtVhATZFCdMrNMeNaXq/dBa4oF4LDNOsQG7RgNOHY40=;
 b=URG/hte+oF/BHxiOZXEqgerOyTfTlyMW8gfgQIXTi2zRHKJiKlb3wIVgOfOWgf+t9L
 Jymkzg0CPuDMv10NvNOvcL4yTB3V0/aLz9ZnKjJBcK7nhBKR2I0Q1rwJfJpNRfjfk6bx
 TjJX0fX7etYACHI5HsXqQVya6ol4zlNP5jINw4GGFGcM5AZ4akuQeWqpHVpkVxNuyFUe
 lMfOhA9l+tFIGAQ5Nkp/+QzNt78AUh6dS0MRi9Lgc0pacCJPmNp7VaFCXMQuluCRLcBF
 i3jYhXY0+b4T3SJSOuPD7UwKMQhGelWJk2icc10wCWcx5GYCHycSsiBZF9TVw6byMy1d
 wFIA==
X-Gm-Message-State: APjAAAXwMPPBLE/R3w7MgdBqEY2cew3K+UKvOH1JGJJn9JLlRgTG2lRF
 TmNo97Lzb9MrcKx4kWbOJcg=
X-Google-Smtp-Source: APXvYqzJM0jhbYfG95tBGMaicwhq9YRS+50HLNfe7LLTg2ihTJuzFxSDRmkLa5iTJuJfGiGFh+iwZw==
X-Received: by 2002:a19:9f01:: with SMTP id i1mr38333519lfe.98.1558429293912; 
 Tue, 21 May 2019 02:01:33 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id x20sm4440810ljc.15.2019.05.21.02.01.33
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 21 May 2019 02:01:33 -0700 (PDT)
Date: Tue, 21 May 2019 12:01:29 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v7 09/11] drm: uevent for connector status change
Message-ID: <20190521120129.2d06d88e@eldfell.localdomain>
In-Reply-To: <CAKMK7uGoVhAOkZN7G1fuzdUjihjxqRhVuVvE3K5HFZwGjyC6Hg@mail.gmail.com>
References: <20190514110242.6f6ba4b0@eldfell.localdomain>
 <9b6386239ecae396fc4f5cc4467f8e76721f2c83.camel@intel.com>
 <CAKMK7uHJPugRWJx32oWVF94jBf28P0nBirZNbSBRMS1SbUaS9A@mail.gmail.com>
 <20190514163602.7d252b12@eldfell.localdomain>
 <CAKMK7uGMJMZiOP4rhhiu=Obu6sO0oav5se-vy8bNLu8dfoZmvA@mail.gmail.com>
 <20190515103731.16855195@eldfell.localdomain>
 <20190515082449.GA17751@phenom.ffwll.local>
 <20190516112211.1cd5a8c6@eldfell.localdomain>
 <20190516122455.GA3851@phenom.ffwll.local>
 <20190517130824.17372663@eldfell.localdomain>
 <20190520161107.GA21222@phenom.ffwll.local>
 <20190521095505.7ef1cbdf@eldfell.localdomain>
 <CAKMK7uGoVhAOkZN7G1fuzdUjihjxqRhVuVvE3K5HFZwGjyC6Hg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=PtVhATZFCdMrNMeNaXq/dBa4oF4LDNOsQG7RgNOHY40=;
 b=kCRzaIfwacj9Bb2tyPVd6xoksfI6G/H3IixGxzn9hPQy/gzR3kETo8LPkw7M0DpA2x
 9Xp2cWZuVbEYfde4WJaxlYjzFBE8CszKdBq8RTkNWuYOdiS7mrg0i3liesHISSrTFbg/
 qhMVxcbcze9/74obgtWU3MQcgzitm98sSy0wYjvep/1LeWZAld23YH5mT/Z3gHJE8mon
 MjUkdZEeY2eyb3Xh/OFOpivgC5cOoIWMF/jWgRvovM8u4PqtFquMq7xK2L61TEr5DqbP
 TOaJyCieynyfNNfYSVhN+pxVqam2L8kLMcaWhgjBA8SRSUomqbESEvXiP19FCsAeSeif
 azjQ==
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
Cc: "Ser, Simon" <simon.ser@intel.com>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Mun, 
 Gwan-gyeong" <gwan-gyeong.mun@intel.com>,
 "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>, "Vetter, 
 Daniel" <daniel.vetter@intel.com>, "sean@poorly.run" <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============1199668869=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1199668869==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/3bo6fQCg9G6.W+NNcH46DHI"; protocol="application/pgp-signature"

--Sig_/3bo6fQCg9G6.W+NNcH46DHI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 21 May 2019 09:52:50 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Tue, May 21, 2019 at 8:55 AM Pekka Paalanen <ppaalanen@gmail.com> wrot=
e:
> >
> > On Mon, 20 May 2019 18:11:07 +0200
> > Daniel Vetter <daniel@ffwll.ch> wrote:
> > =20
> > > On Fri, May 17, 2019 at 01:08:24PM +0300, Pekka Paalanen wrote: =20
> > > > On Thu, 16 May 2019 14:24:55 +0200
> > > > Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > =20
> > > > > On Thu, May 16, 2019 at 11:22:11AM +0300, Pekka Paalanen wrote: =
=20

...

> > > > > > No, my concern is not an issue with netlink reliability. It is a
> > > > > > potential issue when userspace chooses to not use netlink, and =
uses
> > > > > > something else instead. I'm not sure what that else is but Paul=
 says
> > > > > > there is code in libudev and that is completely outside the con=
trol of
> > > > > > KMS apps like display servers. =20
> > > > >
> > > > > afaik this other path only exists because it's the older one, for=
 uapi
> > > > > backwards compatibility with older userspace. Shouldn't be used f=
or
> > > > > anything. =20
> > > >
> > > > "Shouldn't be used" and someone screaming "kernel regression"... ar=
e you
> > > > sure that path won't matter?
> > > >
> > > > Like some home-brewn distribution that happens to configure their
> > > > libudev and kernel to use the old method, uses already new userspac=
e,
> > > > and then upgrades the kernel that starts sending fine-grained hotpl=
ug
> > > > events, resulting the display server randomly handling hotplug wron=
g.
> > > >
> > > > Reading Airlie's recent rant about kernel regression handling make =
this
> > > > a scary scenario where you would have no other choice than to rip a=
ll
> > > > the fine-grained uevents out again.
> > > >
> > > > Is there any difference in the kernel code between the old method a=
nd
> > > > the netlink method? Would it be possible to send fine-grained hotpl=
ug
> > > > events only through netlink, and fall back to the old 'HOTPLUG=3D1'=
 for
> > > > the old method? =20
> > >
> > > There's a lot of grey in kernel regressions, and for fringe setups us=
ed by
> > > few people I wouldn't worry about this. If they expect their shit to =
keep
> > > working when using new stuff and crappy old interfaces, they get to k=
eep
> > > all the pieces. =20
> >
> > It didn't sound gray at all, reading Dave Airlie's email about it. If
> > someone updates the kernel, and something works worse after that, then
> > it is by definition a kernel regression. Period. And the earliest
> > regression wins, i.e. if a revert breaks other things, the revert will
> > be done regardless.
> > =20
> > > Dave's recent rant was a bit special, since userspace is clearly smok=
ing
> > > some strong stuff (-modesetting's atomic is seriously not using atomic
> > > correctly), but it was also affecting too many people, and changing t=
he
> > > boot setup meant you'd get a black screen on boot-up already. Instead=
 of
> > > just on the first modeset with more than 1 screen. =20
> >
> > Then I think I missed the context of Dave's email. Reading it again, I
> > still do not see that context.
> >
> > Btw. how do you determine "not using atomic correctly"? Has some uAPI
> > specification for atomic appeared? I wasn't aware there was any uAPI
> > specs, so there is no "incorrect use" if it happened to work once. =20
>=20
> -modesetting atomic blows up with more than one screen (even if you
> just move that screen between crtc). The breakage was that with the
> fastboot changes we've put the one screen onto crtc 1, but by default
> modesetting wants it on crtc 0, and it couldn't do that switch
> anymore.

Hi Daniel,

what says the assumption of the only monitor being driven by CRTC 0
was a bad one? :-p

It's probably not obvious that userspace needs to explicitly try to
avoid invalid configuration combinations by inspecting the current full
configuration and not just the one CRTC/connector it wants to use.

> All current atomic in -modesetting can do is pageflip and dpms off/on
> on the first screen on the first crtc. Anything more fancy goes boom,
> like where you change the connector/crtc links.
>=20
> It's _really_ broken :-)

But it worked exactly that much, until a kernel change broke it, right?
Yes, I totally see the sillyness, but if it worked and we have these
no-regression rules...

> > I don't personally really like these rules, but if these are the rules,
> > then so be it. In my opinion it would be a huge step forward to get and
> > require uAPI specifications, that people could verify both kernel and
> > userspace against. Verifying against kernel code with no spec is what
> > leads to the -modesetting issue by the sounds of it.
> >
> > Documenting kernel internal interfaces is not it. People reading
> > DRM internal interface docs would need to know how DRM works internally
> > before they could map that information into uAPI, which makes it less
> > useful if not even useless for userspace developers. =20
>=20
> vgem is the idea here for validation, but if people ship atomic code
> that was never tested except for "boots on my laptop", then nothing is
> going to help.

A testing pattern library with vkms would be awesome indeed.

> And yes we have a huge gap with uapi documentation. btw for properties
> those section are meant to be useful for userspace people too:
>=20
> https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#standard-connector-=
properties
>=20
> and all subsequent chapters. I guess it's a bit burried, but this part
> is meant to be the uapi spec for properties. Is that also failing your
> expectations?

Yes: it is hard to find (it is in Driver Developer's Guide, buried
several chapters in), it is interleaved with lots of DRM internal
details, makes references to DRM internal functions, and probably
relies on DRM internals behaviour through the references by not
repeating what they do.

It is useful once you find it, but I don't think it's enough for making
good use in userspace for someone who hasn't been a DRM kernel
developer.


Thanks,
pq

--Sig_/3bo6fQCg9G6.W+NNcH46DHI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAlzjvmkACgkQI1/ltBGq
qqdZVxAApeeOIzpTPW9ArVhdRtSgmbyucPH9QqP8HSZ5K9Sx/gwSqfFz0aFSFUdX
a9dd/6B6s4nJ2NewoN1kRphyTwkJjwPrKEZxubQDsHH+2c+Zl9KSJ1smO3xjeD+z
bKOcgF1Qcs7KDG7oHTcj6jlcLL/rO5H9Z4vL5DxBKmnRpbd6uHbK3c13uf1p7z7E
mJ+43uhWGgjYsEtok8Nzc8CsNtnXLLX63CLiQ0RgnrF/2+kqk89P1JTssqV30v2r
XOkKhAMq4CqkbcI+nhY1vKrcaSsXPYrUFU7itNqtkVqgYENKR4AD0AZvBtVK2/bz
qBbln78SNZYdOjNN/4K5KuoHN0ezBtJ+JBm37cLNeyDSU6+Z/01p4T2w34frDh1p
88M02hWIGU3i20f1sdeNCrn9+z9pFP9JoK2r/+7H/R3EkaAEdj22vt5Hvd0x5vL7
hLgtM86at9q7aY/XVs1cCkE9BQZCTjtgL4OwIlDwNRDcVFICGo77TceqkoX24xK5
1KBs2CaFVsayHmDpksUFg0iNkXP5EM9yeo8fJYja/fwoCKSqadrNSaOVbYxcIIw9
tE1IZ3B/r/bmlMdkWJYrbZTWwju6eDnvL/nT8QkdqZZly6rrhnu38bnzEVss3eu7
hr8ZBBb5gmbiId7ACa62o9Q25ZTluC1ff3ihQUfnUCUpsP7ZA88=
=0zpr
-----END PGP SIGNATURE-----

--Sig_/3bo6fQCg9G6.W+NNcH46DHI--

--===============1199668869==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1199668869==--

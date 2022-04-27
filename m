Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3DC511530
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 12:53:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7425D10F16D;
	Wed, 27 Apr 2022 10:53:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B2E10F16D
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 10:53:11 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id g19so2460916lfv.2
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 03:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=vV73iH034mH8n9d5T9c+luo0V3AWxRqePd7wWoOzqOs=;
 b=d6R99kV8smicIdWXg+6tt7qX3ig7LRmSBRFwBMCAVh+fGJo4fJ+mdxZ4ylSxSCD6vG
 dyTpKX3IN3VGcs6/A2yvHFZ+FJXAmnlDmyvmZoowlaiIHhyOVR859Lk3J7ULg63uQNu2
 oQqy6hVKxj8HH0km3TiUStFT7ajw9eTQ454IJ3JtKwt2Bu5WHAkIhOeciGMuRRQvzyZW
 KEYywblQoqjwqiVwwi8tf5QPyDDUdQx0v3RKfepH0svGlx4F33rftQ0qe70Nf4mF0uW3
 nIHexxNXW34pxNdQC+rWMrKE7yLQsICnfxoblszhALvtqCNadnZ8LpMZOkibPXAqgsd0
 UOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=vV73iH034mH8n9d5T9c+luo0V3AWxRqePd7wWoOzqOs=;
 b=UJKeDp7U8m14+FMHei4pqeYRDIjeMEv1FBIR518eOq26vA05Y9q7bNdRGlWpxa2Hiz
 lcDAVV4ZbIqxCwyGYr8K1sb8e8vdMGYLlIbyqpK+20CCwmNCmoNq5wZ2aOAbTR7gP4R9
 6lZekiD6rYq9gSFJu4gXliuAR0peie8ejEby7zi47cA2ZbZGqh7HAoH+B61eh96GbunK
 +7I+J4ojY0mG/r2POZU7mlKiB2iKnZ0R8IuRJe92pX47Hjod9LlSsIpl2MjeNHWDR1e7
 jfw+ivEl43i8caP0IlKuMKVHceHuvG9kLk94tRWSPN0mRph0n6v83S1jlJmhwS9B4CXX
 lUGg==
X-Gm-Message-State: AOAM532fcCiFTnpwHlgNtEGXXqetX4pydEYoD9nx+gnQ7n2isAUWkjzO
 gDIisFwDc+XwYBjXJLHGol4=
X-Google-Smtp-Source: ABdhPJz4KWvhKrrVuFYzG6P4H1OqdTmMMHPzrYNs/UzBzIadmnYu59Jeb3ZCLEcypZMFtttVdS5MAw==
X-Received: by 2002:a05:6512:a83:b0:472:1817:145b with SMTP id
 m3-20020a0565120a8300b004721817145bmr5565114lfu.437.1651056789365; 
 Wed, 27 Apr 2022 03:53:09 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 a5-20020a2e9805000000b0024f12f0eb37sm850432ljj.95.2022.04.27.03.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 03:53:09 -0700 (PDT)
Date: Wed, 27 Apr 2022 13:52:59 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: How should "max bpc" KMS property work?
Message-ID: <20220427135259.5e615945@eldfell>
In-Reply-To: <YmgyArRaJCh6JkQh@intel.com>
References: <20220426113502.224d0a90@eldfell>
	<YmgyArRaJCh6JkQh@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CYeZHxKZOl4.bRF5CuwMYI.";
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/CYeZHxKZOl4.bRF5CuwMYI.
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Ville and Alex,

thanks for the replies. More below.

TL;DR:

My take-away from this is that I should slam 'max bpc' to the max by
default, and offer a knob for the user in case they want to lower it.


On Tue, 26 Apr 2022 20:55:14 +0300
Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:

> On Tue, Apr 26, 2022 at 11:35:02AM +0300, Pekka Paalanen wrote:
> > Hi all,
> >=20
> > I'm working on setting HDR & WCG video modes in Weston, and I thought
> > setting "max bpc" KMS property on the connector would be a good idea.
> > I'm confused about how it works though.
> >=20
> > I did some digging in https://gitlab.freedesktop.org/wayland/weston/-/i=
ssues/612
> >=20
> > Summary:
> >=20
> > - Apparently the property was originally added as a manual workaround
> >   for sink hardware behaving badly with high depth. A simple end user
> >   setting for "max bpc" would suffice for this use.
> >=20
> > - Drivers will sometimes automatically choose a lower bpc than the "max
> >   bpc" value, but never bigger.
> >=20
> > - amdgpu seems to (did?) default "max bpc" to 8, meaning that I
> >   definitely want to raise it. =20
>=20
> I've occasionally pondered about doing the same for i915, just to have
> the safest default possible. But I'd hate to lose the deep color testing
> coverage knowing very few people would in practice raise the limit.
> Also the number of systems where deep color doesn't work reliably
> (or can't be made to work by not using a crap cable) seems to be quite
> low.

I think when HDR and WCG get into display servers, setting 'max bpc'
will become a standard action.

It's bit moot to e.g. render everything in electrical 10 bit RGB, if
the link is just going to squash that into electrical 8 bit RGB, right?

So even 10 bit color would require setting 'max bpc' to at least 10 to
be able to actually see it, source-side dithering aside.

> >=20
> > If I always slam "max bpc" to the highest supported value for that
> > property, do I lose more than workarounds for bad sink hardware? =20
>=20
> We don't have any workarounds implemented like this in the kernel.
> Or should not have at least. "max bpc" exists purely for the user
> to have a say in the matter in addition to whatever the EDID/quirks
> say. Ie. if the kernel knows for sure that deep color won't work on
> a particular setup then it should just not allow deep color at all
> despite what the prop value says.
>=20
> So the only danger is fighting with the user's wishes which I guess
> you can overcome with some kind of user visible knob.

Right, good.

Furthermore, as a KMS client cannot make much assumptions about the KMS
state it inherits from some other KMS client, it should know and
program all possible KMS properties according to its own desires
anyway. That, and the DRM master concept make sure that there cannot be
any "third party" KMS configuration programs, like V4L2 has.

> > Do I lose the ability to set video modes that take too much bandwidth
> > at uncapped driver-selected bpc while capping the bpc lower would allow
> > me to use those video modes?
> >=20
> > Or, are drivers required to choose a lower-than-usual but highest
> > usable bpc to make the requested video mode squeeze through the
> > connector and link? =20
>=20
> IMO drivers should implement the "reduce bpc until it fits"
> fallback. We have that in i915, except for MST where we'd need
> to potentially involve multiple streams in the fallback. That
> is something we intend to remedy eventually but it's not an
> entirely trivial thing to implement so will take some actual
> work. ATM we just cap MST to <=3D8bpc to avoid users getting into
> this situation so often.

Excellent, but judging from what Alex said, this is also not what
amdgpu does. We have two drivers doing different things then?

So with Weston I probably have to document, that if you can't get the
video mode you want working, try turning the 'max bpc' knob down and
try again.

Or, I could cap 'max bpc' based on my framebuffer depth. If I have an
electrical 8 bit FB (default in Weston), then there is not much use for
having 'max bpc' > 8. This ignores the KMS color pipeline a bit. Does
that make sense?

Does KMS use dithering automatically, btw?

The only mention of dithering in KMS docs is some nouveau-specific KMS
properties and another for radeon.

> >=20
> > Do I need to implement a fallback strategy in a display server,
> > starting from the highest possible "max bpc" value, and if my modeset
> > is rejected, repeatedly try with lower "max bpc" setting until it works
> > or I'm out of bpc options? =20
>=20
> IMO the bpc part should be handled by the kernel since we already
> had this behaviour even before the "max bpc" prop was introduced
> and we didn't add an explicit "use this bpc or fail" prop. But of
> course you should have some kind of sensible fallback strategy for
> things that just fail for other reasons.

Right, but this means that I don't have to add 'max bpc' as yet another
dimension in the combinatorial explosion of KMS parameters I would need
to search to find a working setup. That's really good.

The one thing missing is seeing what format and bpc we actually got on
the link.

> The one problem we have in the kernel is that we have no way to
> ask the user if the display we tried to light up is actually
> working. So our policy decisions can't really involve user input.
> Userspace should not generally have that problem.

Indeed.

Also like Alex said, the kernel does not know if the user prefers high
color depth or high refresh rate either. One way to solve that is to
light up the requested video mode any way the kernel can, and then
report what the resulting color depth is. Another way is to have
explicit "use this bpc or fail" KMS property, maybe in the form of 'min
bpc' as I recall being discussed in the past, and let userspace guess
what might work. The former is easier to light up, but probing requires
actually setting the modes. The latter may require a lot of
trial-and-error from userspace to find anything that works, but it
takes only time and not blinking - as far as things can be detected
with TEST_ONLY commits. Then one still has to ask the user if it
actually worked.


Thanks,
pq

--Sig_/CYeZHxKZOl4.bRF5CuwMYI.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmJpIIsACgkQI1/ltBGq
qqck6w/9ENRvKOQ++hI2+Gvq5j3QAWC6w8t6DLdGymX9dy7B6WGhm0P4NZADHtLZ
hdK1QDpstIKIly1gPYVfX2H2qt5uCyrAvKFE0+UzA8aIfLGnabC0KC9fOz8qEfKB
yw2uNSQ7HsndXzED3MUZyXncJvViLlhUJzQ836lhZM/82Vt7h30WcvsWhDtzhftA
cWhWdnrNnVeuPYhaGXdy2KYUnknDEQoI+4OG2wBSmBygpB3bVM5EC+tMe0mrQhCl
efkQaplpN7G9/tZJ5CLNl2zY8hjYYKpzao/DXWN2YQR2ga+iRJXBoi4F9pmFKu1h
UM39Ci3xUWhjv57NrePipV930C+Bw1AZ+XHkgPXvMKW30cS9pL6dhzntXTEZHDU0
oXgqMdWvM2sN0k437bzTH6g6Ib7hbJ3xbRGKxihahsihvheMBHesol9BWsf7I6zc
VBtuLlMuQAn54t7MQPsYtJ4X5gKTd0emIGaBYq01cJuali0JKRggeIcijgoVWkLN
wGtPedETGcm3TGdCpv8ad45J9yIzjIHmZIkWPNKl1Z25l57XOrCH17snaWIWOzm9
W8aC/GbhnwpbCccPPAxLFWYpMFHyVqYAumSJvg5LhHmoApcTFPk0kjyaGQXbXhL0
WRPBMZWUEcj8Xmto+bCMrED2B9H6HRAJgtp6PSUnvmuxFsXIIFw=
=H7P9
-----END PGP SIGNATURE-----

--Sig_/CYeZHxKZOl4.bRF5CuwMYI.--

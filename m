Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F327D512D54
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 09:50:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 014A610EA26;
	Thu, 28 Apr 2022 07:50:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F60410EA26
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 07:50:29 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id p12so7138575lfs.5
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 00:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=q7tZPRTrlEMSuUDGPsOL1eQlqJGaqpGkpxLKP/+ie1M=;
 b=NuwVz3Q9baAYk791/gfY86DegvKVu1B276LaEMID7CzFYUG/ZrLJ22a54i24CRnCcH
 9MycNfWOhTZb4eGltKkNRUYrChp1Gf/E5T/+HgS2eD1tlI9Pt/+bYbY39VRrNQv+ZQN2
 R3fbhahUR4jpeSLoauj+LgA0Cmues+baL2EId9aYxHbCsUBSbsO9Gz+DYVgEr51lRgfA
 bC/wntyXY5E46vQmlAs/zEVAiumwdlipI9f2/mkWuDx9mcXB9lOA2ZAHWz9VZGnSyre1
 DVVKOl98geUzM/OhjfnwGH2sStMhWrB7duNmRi/n41N+kWkgtRjP/yhhSdhN9n6dp5Ul
 Ki4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=q7tZPRTrlEMSuUDGPsOL1eQlqJGaqpGkpxLKP/+ie1M=;
 b=QyhF91MRnyUSHDromXKGem3lggo3UtVlPocFbUFXIO+X1yVooJGKnO3QJRYUGfG3oe
 Kx70FhXHDziWqFtQxUQIe5DpAkD0BlM3w8UTuvem5uJ6ew4d3fZ9RcuDu9GlCz+xcF1u
 pM9J+ux9AIqjO1dZ7InmZKMtOdWgzSdZw3I0XtVXsHu5c68hMeiXsmkpIb+kevaJaQfC
 qBpRJiQ7szeA3yxlBaQsGP/tHcrUqTzj0wEGJAFAxsbdBCZBZS0YfT/2k9MMRS+sFzCl
 w92yf9vC/FGGQZ8A2bufEhcVAkGtWSK8X7vQ27Y2LYH0Zo/RxRnmuPSBfWoKh/ED3yYl
 vTtQ==
X-Gm-Message-State: AOAM532CYmAAuw49nWJSTj+C2R0+mVUlAPsw+ede1tHI9XpTfVS9S5yr
 YbUGpYCIHFNILF79bplvR78=
X-Google-Smtp-Source: ABdhPJwAZOQCdli720xS5WK56Ixz9/6o4u0GoC02laPlwNxLdmMgts8aGNpHzyaiUlwJ0+N3GF4J4w==
X-Received: by 2002:a05:6512:3b83:b0:472:28c3:cac4 with SMTP id
 g3-20020a0565123b8300b0047228c3cac4mr5720544lfv.238.1651132227470; 
 Thu, 28 Apr 2022 00:50:27 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 f11-20020ac2498b000000b0047223ff0224sm570059lfl.169.2022.04.28.00.50.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 00:50:27 -0700 (PDT)
Date: Thu, 28 Apr 2022 10:50:17 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Sebastian Wick <sebastian.wick@redhat.com>
Subject: Re: How should "max bpc" KMS property work?
Message-ID: <20220428105017.75d9aefe@eldfell>
In-Reply-To: <CA+hFU4ykm-8difozGJ5QtAYc=5RGQTUDiagBNmNccf06sGYGZQ@mail.gmail.com>
References: <20220426113502.224d0a90@eldfell> <YmgyArRaJCh6JkQh@intel.com>
 <20220427135259.5e615945@eldfell>
 <4ceca4d9-c58c-9e33-36a6-dbf0c4bb82a7@amd.com>
 <CA+hFU4ykm-8difozGJ5QtAYc=5RGQTUDiagBNmNccf06sGYGZQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/D3rdefWZ.d47hF9rjY1zxV_";
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/D3rdefWZ.d47hF9rjY1zxV_
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 27 Apr 2022 23:29:02 +0200
Sebastian Wick <sebastian.wick@redhat.com> wrote:

> On Wed, Apr 27, 2022 at 5:41 PM Harry Wentland <harry.wentland@amd.com> w=
rote:
> >
> >
> >
> > On 2022-04-27 06:52, Pekka Paalanen wrote: =20
> > > Hi Ville and Alex,
> > >
> > > thanks for the replies. More below.
> > >
> > > TL;DR:
> > >
> > > My take-away from this is that I should slam 'max bpc' to the max by
> > > default, and offer a knob for the user in case they want to lower it.
> > >
> > >
> > > On Tue, 26 Apr 2022 20:55:14 +0300
> > > Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:
> > > =20
> > >> On Tue, Apr 26, 2022 at 11:35:02AM +0300, Pekka Paalanen wrote: =20
> > >>> Hi all,
> > >>>
> > >>> I'm working on setting HDR & WCG video modes in Weston, and I thoug=
ht
> > >>> setting "max bpc" KMS property on the connector would be a good ide=
a.
> > >>> I'm confused about how it works though.
> > >>>
> > >>> I did some digging in https://gitlab.freedesktop.org/wayland/weston=
/-/issues/612
> > >>>
> > >>> Summary:
> > >>>
> > >>> - Apparently the property was originally added as a manual workarou=
nd
> > >>>   for sink hardware behaving badly with high depth. A simple end us=
er
> > >>>   setting for "max bpc" would suffice for this use.
> > >>>
> > >>> - Drivers will sometimes automatically choose a lower bpc than the =
"max
> > >>>   bpc" value, but never bigger.
> > >>>
> > >>> - amdgpu seems to (did?) default "max bpc" to 8, meaning that I
> > >>>   definitely want to raise it. =20
> > >> =20
> >
> > I've wanted to remove the 8 bpc limitations for a while now but it
> > looks like we never did for anything other than eDP.
> >
> > The original problem we solved was that some monitors default timing
> > couldn't be driven at a high bpc. Therefore users were faced with black
> > displays. On some displays you also can't drive high refresh rate modes
> > with a higher bpc.

Aha, so there was nothing that the driver could have checked in order
to avoid those practical failures with high bpc. That makes sense.

I mean, link training succeeded fine and all looked good from the
source-side, but the sink just malfunctioned?

Rather than display servers not handling 'link-status' changes at all.

> > >> I've occasionally pondered about doing the same for i915, just to ha=
ve
> > >> the safest default possible. But I'd hate to lose the deep color tes=
ting
> > >> coverage knowing very few people would in practice raise the limit.
> > >> Also the number of systems where deep color doesn't work reliably
> > >> (or can't be made to work by not using a crap cable) seems to be qui=
te
> > >> low. =20
> > >
> > > I think when HDR and WCG get into display servers, setting 'max bpc'
> > > will become a standard action.
> > >
> > > It's bit moot to e.g. render everything in electrical 10 bit RGB, if
> > > the link is just going to squash that into electrical 8 bit RGB, righ=
t?
> > >
> > > So even 10 bit color would require setting 'max bpc' to at least 10 to
> > > be able to actually see it, source-side dithering aside.
> > > =20
> > >>>
> > >>> If I always slam "max bpc" to the highest supported value for that
> > >>> property, do I lose more than workarounds for bad sink hardware? =20
> > >>
> > >> We don't have any workarounds implemented like this in the kernel.
> > >> Or should not have at least. "max bpc" exists purely for the user
> > >> to have a say in the matter in addition to whatever the EDID/quirks
> > >> say. Ie. if the kernel knows for sure that deep color won't work on
> > >> a particular setup then it should just not allow deep color at all
> > >> despite what the prop value says.
> > >>
> > >> So the only danger is fighting with the user's wishes which I guess
> > >> you can overcome with some kind of user visible knob. =20
> > >
> > > Right, good.
> > >
> > > Furthermore, as a KMS client cannot make much assumptions about the K=
MS
> > > state it inherits from some other KMS client, it should know and
> > > program all possible KMS properties according to its own desires
> > > anyway. That, and the DRM master concept make sure that there cannot =
be
> > > any "third party" KMS configuration programs, like V4L2 has.
> > > =20
> > >>> Do I lose the ability to set video modes that take too much bandwid=
th
> > >>> at uncapped driver-selected bpc while capping the bpc lower would a=
llow
> > >>> me to use those video modes?
> > >>>
> > >>> Or, are drivers required to choose a lower-than-usual but highest
> > >>> usable bpc to make the requested video mode squeeze through the
> > >>> connector and link? =20
> > >>
> > >> IMO drivers should implement the "reduce bpc until it fits"
> > >> fallback. We have that in i915, except for MST where we'd need
> > >> to potentially involve multiple streams in the fallback. That
> > >> is something we intend to remedy eventually but it's not an
> > >> entirely trivial thing to implement so will take some actual
> > >> work. ATM we just cap MST to <=3D8bpc to avoid users getting into
> > >> this situation so often. =20
> > >
> > > Excellent, but judging from what Alex said, this is also not what
> > > amdgpu does. We have two drivers doing different things then? =20
> > > > So with Weston I probably have to document, that if you can't get t=
he =20
> > > video mode you want working, try turning the 'max bpc' knob down and
> > > try again.
> > >
> > > Or, I could cap 'max bpc' based on my framebuffer depth. If I have an
> > > electrical 8 bit FB (default in Weston), then there is not much use f=
or
> > > having 'max bpc' > 8. This ignores the KMS color pipeline a bit. Does
> > > that make sense?
> > > =20
> >
> > I think both of those options make sense. I'll need to think about the
> > automatic fallback if we don't have enough bandwidth for max_bpc.
> >
> > If a KMS driver falls back automatically we probably want some way
> > for a (color managed) compositor to know if the output bpc is reduced.

The notion of 'max bpc' already implies that KMS drivers will
automatically fall back to lower bpc under some conditions, or at least
that the link bpc is chosen by the driver.


> > =20
> > > Does KMS use dithering automatically, btw?
> > > =20
> >
> > amdgpu's display driver does.
> > =20
> > > The only mention of dithering in KMS docs is some nouveau-specific KMS
> > > properties and another for radeon.
> > > =20
> > >>>
> > >>> Do I need to implement a fallback strategy in a display server,
> > >>> starting from the highest possible "max bpc" value, and if my modes=
et
> > >>> is rejected, repeatedly try with lower "max bpc" setting until it w=
orks
> > >>> or I'm out of bpc options? =20
> > >>
> > >> IMO the bpc part should be handled by the kernel since we already
> > >> had this behaviour even before the "max bpc" prop was introduced
> > >> and we didn't add an explicit "use this bpc or fail" prop. But of
> > >> course you should have some kind of sensible fallback strategy for
> > >> things that just fail for other reasons. =20
> > >
> > > Right, but this means that I don't have to add 'max bpc' as yet anoth=
er
> > > dimension in the combinatorial explosion of KMS parameters I would ne=
ed
> > > to search to find a working setup. That's really good.
> > >
> > > The one thing missing is seeing what format and bpc we actually got on
> > > the link.
> > > =20
> > >> The one problem we have in the kernel is that we have no way to
> > >> ask the user if the display we tried to light up is actually
> > >> working. So our policy decisions can't really involve user input.
> > >> Userspace should not generally have that problem. =20
> > >
> > > Indeed.
> > >
> > > Also like Alex said, the kernel does not know if the user prefers high
> > > color depth or high refresh rate either. One way to solve that is to
> > > light up the requested video mode any way the kernel can, and then
> > > report what the resulting color depth is. Another way is to have
> > > explicit "use this bpc or fail" KMS property, maybe in the form of 'm=
in
> > > bpc' as I recall being discussed in the past, and let userspace guess
> > > what might work. The former is easier to light up, but probing requir=
es
> > > actually setting the modes. The latter may require a lot of
> > > trial-and-error from userspace to find anything that works, but it
> > > takes only time and not blinking - as far as things can be detected
> > > with TEST_ONLY commits. Then one still has to ask the user if it
> > > actually worked.
> > > =20
> >
> > min_bpc sounds like something we might want for HDR use-cases, unless
> > the compositor has a way to confirm the output box (and format). min_bpc
> > would allow the KMS driver to pick the lowest required bpc so the
> > compositor always has a guarantee of quality. =20
>=20
> IMO that would be ideal. The driver should try to reduce bandwidth by low=
ering
> the bpc down to the min_bpc if the hardware can't drive the selected mode=
 at a
> higher bpc. User space usually knows which bpc is sufficient for the use =
case
> but will never complain about too much bpc. Drivers which don't support
> lowering the bpc dynamically can then still go with the min_bpc and user =
space
> still gets all the modes which work with the minimum required bpc.

This would be nice, yes.

I'm fairly sure 'min bpc' was discussed here on the dri-devel mailing
list in the past, but I don't remember when or by whom.


Thanks,
pq

--Sig_/D3rdefWZ.d47hF9rjY1zxV_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmJqRzkACgkQI1/ltBGq
qqdjJQ/6AgpSkTCS4kisk30u5v9DFs+6VwT6qC+m8n/Pj7nGerqdOoIZQ5hd16D8
z6PRiYpVbrKBUHjAwuH2EUiNC5FZYn0v6a+xII0UnibD0aePaWIPszF+e9Ej7o98
hou0QCRlS7+5e408fO4Vcxc69NKz+MsHjt6ZZgshJNyG5yfXVv5EmohEU4V3oo16
iFh6NIOqD26aK7tVqj4kzy99FT1zgFDQpq2LHwPJKuzsa8UJujZuR3y0KMZFK1aB
vO1DlDtd9riWftrTQ8XFOKtbMp7H94jQ5xxv37NH+/vnbLysNSrBLkiosE3yibWq
pQ2k0VSJaZ5R++f4wxVW0oXKA79yIyavpHdcWAjp7QUk9jsOzlivYApsNxYS++Yb
+2uHRlQSKfsaFgXi0uy2v/oP60HY6wj8BfrnPe91uD61/8Z9UY1jkZBtfi07A4vW
X1r7+MAfCMihMUYcl1cE5WkCpspa51nXdbGNWbmK1yr4x6sFBlDdl9uaEqMSifxv
BgSA996xGfFD/A2fHdto8iLcblpUXf/pAxR/JmPKZceWpV2EfAwYcv5jDiwgXeNu
+DQnHb/hmAXkA5hAMfnwspFUPbnO1SnZV0czyiil1ofeuIUcvCgh+lTUb7EUPZbc
nbd+Jhjt0e6PycX3c7WDWneSAoJUImnAeV6yInYw5YwKOHDSi18=
=Kk7q
-----END PGP SIGNATURE-----

--Sig_/D3rdefWZ.d47hF9rjY1zxV_--

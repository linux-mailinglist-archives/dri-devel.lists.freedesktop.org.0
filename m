Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CF453B48C
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 09:48:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B56F610FF5C;
	Thu,  2 Jun 2022 07:48:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C15D10FF5C
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 07:48:11 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id s6so6496932lfo.13
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 00:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=vINVwIGyCjAvP7yGfcYfec3Mo++9kaL01HYuwU0ljl0=;
 b=n/vdHz253gM9j39WIoIGPOUDK/xFQOmGuOfdBHy8MePrX8FxDFq7SICRXKR2evvvVz
 ERkb3l8FfDtBD+pRBIPhmnaQsfr0hRycIEkjOyZr/hsRCc4ZMFRBycbXCQWHsd/cnzql
 BhsAOr+ZWH8U4hc2LvEF+f9QVtPA7rw78vmJ0Z2KDN47yO5UqhsUyDuZ9YJUPOtNmPij
 KKaSMtJTaE/ubuLEo2xPW1f+qYjyHiaxTb96PqXoDGzmyThwubzObKcS+xn3li1brb81
 KRoX3FF+lo9h+9TFgeZvtxWcQizZoKTM2DWKVFvFXzSHD4ZEfkHJVyCZyvYmCKyBxHRG
 i4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=vINVwIGyCjAvP7yGfcYfec3Mo++9kaL01HYuwU0ljl0=;
 b=TjlnR0qhjGj14KKqJTWDI2UtEFYpxulm8ZHVYQeO/Go7jbhI69eNXVPn3QgrvWMdIq
 V8Lk+axmj2jZcQtEBPJMCGxogxlUMyUPZpYtwZM2nLEmfK7TGIgsP+jO472IZ7cyZWWy
 Rd/9P2W5g58Xp/mcItZgmsJ3sICEdRCY9DxDXDeGgVsPm+K5S4A3Q1EUNeR5SxcnEMl0
 IOH27uY23rk3nGedNP8YiboxKd08r+8LUbOhXUYeCFAfrVyUnojCYj5smT+gdNYFaZ2K
 tiH1cJT0CV2dgxFfzML3crMan8KDEPveyzAUteKUCRWma4JbnSlb1nL0id7hrevgTMb5
 MN5g==
X-Gm-Message-State: AOAM532lcYvmqFOLKkkeIUcwOTSK0ARjDfiCYkhIfC47ZDW1JoZF03tR
 UtghbnItS10wROQKx0ronpU=
X-Google-Smtp-Source: ABdhPJxNmXXUyb6/dcM5qxKDZQeXj7OlWyvfRtXdnMEPcBEyA35CmfrbJs5cgNJv04km6ySKJpx1sg==
X-Received: by 2002:a05:6512:3e09:b0:478:f180:2264 with SMTP id
 i9-20020a0565123e0900b00478f1802264mr2576276lfv.448.1654156089375; 
 Thu, 02 Jun 2022 00:48:09 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 j14-20020a2e824e000000b0025574e803fasm216695ljh.18.2022.06.02.00.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 00:48:08 -0700 (PDT)
Date: Thu, 2 Jun 2022 10:47:59 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: How should "max bpc" and "Colorspace" KMS property work?
Message-ID: <20220602104759.60f5a68f@eldfell>
In-Reply-To: <YpdyYbRZP2fdG9Fz@intel.com>
References: <YmgyArRaJCh6JkQh@intel.com>
 <57d16ed5-8bfc-ce29-9250-14e2de18710a@redhat.com>
 <20220523112246.056ddc99@eldfell>
 <CA+hFU4wTHR9kLrFY3XkbeROZgxWamiZ6yGYL4jH+wpe8MzLvMw@mail.gmail.com>
 <20220525102850.5a70e58f@eldfell>
 <80798931-dbe7-54d7-8e1a-aaebfc39780c@mailbox.org>
 <U2A3FifHdFH9yDVrigaioxCTNx60MgkND7jcyIeKP2S4Ghu-BmmRaODqBDp6K0Q-aPBjPcqa2zUGuJNkGmRWZyQx2FjRJe9dVtJhQG9ZNCk=@emersion.fr>
 <20220525133647.052d09da@eldfell> <YpZSWwVkhJOalM4M@intel.com>
 <20220601102126.4f3602fd@eldfell> <YpdyYbRZP2fdG9Fz@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6fBy+BlkLOcZTfE8T3PuO4d";
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
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel.daenzer@mailbox.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/6fBy+BlkLOcZTfE8T3PuO4d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 1 Jun 2022 17:06:25 +0300
Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:

> On Wed, Jun 01, 2022 at 10:21:26AM +0300, Pekka Paalanen wrote:
> > On Tue, 31 May 2022 20:37:31 +0300
> > Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:
> >  =20
> > > On Wed, May 25, 2022 at 01:36:47PM +0300, Pekka Paalanen wrote: =20
> > > > On Wed, 25 May 2022 09:23:51 +0000
> > > > Simon Ser <contact@emersion.fr> wrote:
> > > >    =20
> > > > > On Wednesday, May 25th, 2022 at 10:35, Michel D=C3=A4nzer <michel=
.daenzer@mailbox.org> wrote:
> > > > >    =20
> > > > > > > Mind that "max bpc" is always in auto. It's only an upper lim=
it, with
> > > > > > > the assumption that the driver can choose less.     =20
> > > > > >
> > > > > > It seems to me like the "max bpc" property is just kind of bad =
API,
> > > > > > and trying to tweak it to cater to more use cases as we discove=
r them
> > > > > > will take us down a rabbit hole. It seems better to replace it =
with
> > > > > > new properties which allow user space to determine the current
> > > > > > effective bpc and to explicitly control it.     =20
> > > > >=20
> > > > > +1, this sounds much more robust, and allows better control by us=
er-space.
> > > > > User-space needs to have fallback logic for other state as well a=
nyways.
> > > > > If the combinatorial explosion is too much, we should think about=
 optimizing
> > > > > the KMS implementation, or improve the uAPI.   =20
> > > >=20
> > > > +1 as well, with some recommendations added and the running off to =
the
> > > > sunset:
> > > >=20
> > > > Use two separate KMS properties for reporting current vs.
> > > > programming desired. The KMS property reporting the current value
> > > > must be read-only (immutable). This preserves the difference between
> > > > what userspace wanted and what it got, making it possible to read
> > > > back both without confusing them. It also allows preserving driver =
behaviour   =20
> > >=20
> > > I don't see much real point in a property to report the current bpc.
> > > That can't be used to do anything atomically. So I suppose plymouth
> > > would be the only user. =20
> >=20
> > Hi Ville,
> >=20
> > I think also professional color managed display servers would need it.
> >=20
> > If they detect that the link bpc is no longer the same as it was when
> > the monitor was profiled, the profile will need to be re-verified by
> > measuring the monitor again.
> >=20
> > See "Color calibration auditing system" notes in
> > https://gitlab.freedesktop.org/wayland/weston/-/issues/467 description.
> >  =20
> > > So IMO if someone really need explicit control over this then we=20
> > > should just expose properties to set things explicitly. So we'd
> > > need at least props for the actual bpc and some kind of color=20
> > > encoding property (RGB/YCbCr 4:4:4/4:2:2:/4:2:0, etc.). And someone
> > > would really need to figure out how DSC would interact with those. =20
> >=20
> > I believe there still must be "auto" setting for bpc, and a separate
> > feedback property, so that userspace can use "auto" to see what it can
> > get without doing thousands of TEST_ONLY commits plus a few "link
> > status" failure handlings in order to find a working configuration (I'm
> > assuming we have many more properties than just "max bpc" to figure
> > out). After "auto" has told userspace what actually works without blind
> > trial and error, then userspace can program than value explicitly to
> > make sure it doesn't change accidentally in the future. =20
>=20
> Yeah we need "auto", but IMO mainly just to keep the current userspace
> working. Using that to probe what's possible doesn't sound particularly
> workable since you can't use it with TEST_ONLY commits. Also change to
> some other property could still cause the whole thing to fail after the
> max bpc has been probed so not sure it really buys you anything.

Hi Ville,

earlier in this thread I drafted how the property-pair with "auto"
could be made useful also with TEST_ONLY commits:

> Thinking even further, about the problem of TEST_ONLY commits not
> telling you what "auto" settings would actually give you; there could
> be a new/extended KMS ioctl that would be the same as commit now, but
> allow the kernel to return another set of KMS state back with
> TEST_ONLY. Like reading back all KMS state after commit was done for
> real. The "current" KMS properties would be part of that set, and tell
> userspace what would happen in a real commit.

I do believe the combinatorial explosion of the KMS state search space
to find a working configuration is going to be a very real problem
sooner or later.


> > Now that you mentioned some kind of color encoding property (I assume
> > you referred mostly to the sub-sampling aspect), how does the connector
> > property "Colorspace" factor in? =20
>=20
> The "Colorspace" property just changes what we report to the display
> via infoframes/MSA/SDP. It does not cause the display hardware to do
> any colorspace conversion/etc.

Good.

> To actually force the display hardware to do the desired conversion
> we need some new properties. ATM the only automagic conversion that
> can happen (at least with i915) is the RGB 4:4:4->YCbCr 4:2:0 fallback,
> which is needed on some displays to get 4k+ modes to work at all.

When "Colorspace" says RGB, and the automatic fallback would kick in to
create a conflict, what happens?

> >=20
> > The enum values (which are not documented in KMS docs, btw.) are tuples
> > of color space + color model, e.g. on Intel:
> >=20
> > "Colorspace": enum {Default, SMPTE_170M_YCC, BT709_YCC, XVYCC_601,
> > XVYCC_709, SYCC_601, opYCC_601, opRGB, BT2020_CYCC, BT2020_RGB,
> > BT2020_YCC, DCI-P3_RGB_D65, DCI-P3_RGB_Theater} =20
>=20
> The accepted values are just what the CTA-861/DP specs
> allow us to transmit in he infoframe/SDP/MSA.

Sure, but I mean the KMS doc a) does not refer to any standard, and b)
does not even list what the possible values could be.


> >=20
> > Reading the KMS docs from
> > https://www.kernel.org/doc/html/latest/gpu/drm-kms.html#standard-connec=
tor-properties
> > they say:
> >  =20
> > > Basically the expectation from userspace is:
> > >=20
> > >         Set up CRTC DEGAMMA/CTM/GAMMA to convert to some sink
> > > colorspace
> > >=20
> > >         Set this new property to let the sink know what it converted
> > > the CRTC output to.
> > >=20
> > >         This property is just to inform sink what colorspace source
> > > is trying to drive.  =20
> >=20
> > However, where does userspace program the actual conversion from RGB to
> > NNN? Is it expected to be embedded in CTM?
> >=20
> > Or does setting "Colorspace" imply some additional automatic
> > conversion? If so, where does it happen and how is it chosen?
> >  =20
> > > For just the plymouth case I guess the easiest thing would be to
> > > just clamp "max bpc" to the current value. The problem with that
> > > is that we'd potentially break existing userspace. Eg. I don't think
> > > the modesetting ddx or perhaps even most of the wayland compositors
> > > set "max bpc" at all. So we'd need to roll out a bunch of userspace
> > > updates first. And the "current bpc" prop idea would also have this
> > > same problem since plymouth would just clamp "max bpc" based on the
> > > current bpc before the real userspace starts. =20
> >=20
> > True, but I believe once color management spreads through Wayland, so
> > will KMS clients also learn to set it. =20
>=20
> Sure. But my point is that if we want to change how the "max bpc"
> works I think we need to roll out the userspace stuff first so that
> we at least can tell the user "please update you userspace to release x"
> when they hit the regression.

Sorry, I lost track on who is suggesting to change what.

I thought we agreed that "max bpc" means limiting link bpc to at most
that value, but the driver will automatically pick a lower value if
that makes the requested video mode work (and in lack of new KMS
properties).

I have no desire that change that. I also think the Plymouth issue is
not fully fixable without some new KMS property, and until then the
only thing Plymouth could do is to smash "max bpc" always to 8 - which
mostly stops being a problem once display servers learn to handle "max
bpc".

However, when new KMS properties are introduced, I very much like to
promote the two property setup for anything that could be a) set to
"auto", or b) be changed by the kernel *and* userspace.


Thanks,
pq

--Sig_/6fBy+BlkLOcZTfE8T3PuO4d
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmKYay8ACgkQI1/ltBGq
qqdlWQ//W6IsAc0k9DN9D2JOEuLzStNNo0BhLPD3Lil4YHxtSuTV8X1sfml4C8Pf
CdJLPf4Mwt8FAsn7PPY8zIyF1PGH+GyCoRKTfzaA63WuV5zkqBOQVd1hYcCdQiZH
L/Wh+CJXivTUxvDaB19IHhDWqY+9jKI+tHcvpAKJSdwK87WBNexBxEasjB8gfh7C
2VP74lKd/rcXUiIuB5DywDXzcrjiAnFN7/DPyBSzPbUMxTmA2t2lVP3ZE165E+ZK
DJ6I6knRxEY600HnwbrdFdtchKRqjcRgLky9uFOQe9cttSSKfR0By2r/UxOBM0Rt
jzafejEwCwXJM7/Kmv8Rw+3JUUTSmQ6/44hNv09q0WOgQwd/ywcuiBWygssPNVdp
PfGzzFgOlyKzGFUGz7/VaGNW38liGgRFKcy0KYZx6tJoAUS0Cekyw+HHGXn64Mh3
m20bKmZMKsRofBCuAJGDtWJ3dQl4wFiT1qMlcUlqIeOqEhBlxzQwHGoqQq2FkD9o
bc+xSj0IWF1e+bxszr+9wESmkmnZlk+h0iIARdKP4ZCt8+ad95gVbc3SGwrwoLkT
ubP4V5dlnGGVFXtXN81+WtUI+FEav/0UCyIPV5rB8O5CuMCD/I4L/0xm3U+ryC27
f8RWqjZTrodQNDqkcnaH4jGqCQ8hDFDapnlpytOIMOO06oMOxvY=
=lmqB
-----END PGP SIGNATURE-----

--Sig_/6fBy+BlkLOcZTfE8T3PuO4d--

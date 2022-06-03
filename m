Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2C853C5DC
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 09:19:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E8FE10ECEA;
	Fri,  3 Jun 2022 07:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C171610ECEA
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 07:19:21 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id g12so7573592lja.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jun 2022 00:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=EwcPibQxUKikaMckIpnVjLWfk3Z5bGgFmuRu+8ZACwE=;
 b=dL0esFEfVCecA+wrFzLxVI+dQdSGTqfTN+8rJhvDqzcp8hJoWkfNU/E4tRxOv7Rb6Q
 L0MavwcSrhq92M4b0eHnRQwpmC/jR682nmqUnDkSov5TxQhf/cGnT6Ni+xzwfzCCC/BY
 pngeZuSd2/r10ZthWlbeBqr09CklBI/OE72vltqExT/cNDqBe5tDFyyh9Y9pGEeOwSIa
 jJ2CBHU/jatoA5QjhMkr/wdbU2M/51zE+y0uHSp9gNb11nZhBYiPmmo1zINz5sjE605f
 2H0LRUs/pTu2fOH43W0vm2ijR2jDhN0Osso0Qiz4+69RWfrxVt8M/V8nt7dGIjWx4S0W
 Kfcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=EwcPibQxUKikaMckIpnVjLWfk3Z5bGgFmuRu+8ZACwE=;
 b=JFNqTvvWF3Yvj7LY0inep5lXwZyEBIPMpHCgwFTH0vXcOmCftKZ6ixJk4cUgwTM0oo
 5FEn1V/6BDPhOYPy9eUY5+Tft8YmHbYyfZnH9puQdZlVjAlooMEf2ktRh9Z0Pqa+LqtE
 A/KJahwk+6YvYrTScpKSJQ3Hryr0PjljP0MZQTSGeSqN7Pnll/9+Ad2qy4JePJUkHMZh
 yCtQaSQKtJtfn5zTN3qPGhdlCjA4b5lVrpIeXAb3mww0o6YhjuPPpa+HozmGWApH+YcX
 8xzSwcHvRTTv5rF03Kocu3WVcZV2+jrLbQhNMTnXNK0uu2mSWMbq8mqPm3I4ov3IV6SM
 Ml5A==
X-Gm-Message-State: AOAM531ZoWxb0J7+SZjwXVhEN1ZhaGwN4c7w78LBKsRLq3QNmNZGsmy0
 3pVxHg3enNjojAjxDFO84HQ=
X-Google-Smtp-Source: ABdhPJymYveyjZG4b1Bu1/LGejMP6wWwnCifMwVhFZS5fsWDyt83cm3OYehPyS1jG9x4U6FuNPBhvg==
X-Received: by 2002:a2e:95d3:0:b0:255:6cf3:107f with SMTP id
 y19-20020a2e95d3000000b002556cf3107fmr6558989ljh.296.1654240759868; 
 Fri, 03 Jun 2022 00:19:19 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 y27-20020ac2447b000000b004785b0dfba4sm1423111lfl.195.2022.06.03.00.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 00:19:19 -0700 (PDT)
Date: Fri, 3 Jun 2022 10:19:09 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: How should "max bpc" and "Colorspace" KMS property work?
Message-ID: <20220603101909.76254ddb@eldfell>
In-Reply-To: <Ypjn4YZWUY5Vi0Xj@intel.com>
References: <20220523112246.056ddc99@eldfell>
 <CA+hFU4wTHR9kLrFY3XkbeROZgxWamiZ6yGYL4jH+wpe8MzLvMw@mail.gmail.com>
 <20220525102850.5a70e58f@eldfell>
 <80798931-dbe7-54d7-8e1a-aaebfc39780c@mailbox.org>
 <U2A3FifHdFH9yDVrigaioxCTNx60MgkND7jcyIeKP2S4Ghu-BmmRaODqBDp6K0Q-aPBjPcqa2zUGuJNkGmRWZyQx2FjRJe9dVtJhQG9ZNCk=@emersion.fr>
 <20220525133647.052d09da@eldfell> <YpZSWwVkhJOalM4M@intel.com>
 <20220601102126.4f3602fd@eldfell> <YpdyYbRZP2fdG9Fz@intel.com>
 <20220602104759.60f5a68f@eldfell> <Ypjn4YZWUY5Vi0Xj@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NeyZ3k5qyITpCppc9utFGzQ";
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

--Sig_/NeyZ3k5qyITpCppc9utFGzQ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 2 Jun 2022 19:40:01 +0300
Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:

> On Thu, Jun 02, 2022 at 10:47:59AM +0300, Pekka Paalanen wrote:
> > On Wed, 1 Jun 2022 17:06:25 +0300
> > Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:
> >  =20

...

> > > The "Colorspace" property just changes what we report to the display
> > > via infoframes/MSA/SDP. It does not cause the display hardware to do
> > > any colorspace conversion/etc. =20
> >=20
> > Good.
> >  =20
> > > To actually force the display hardware to do the desired conversion
> > > we need some new properties. ATM the only automagic conversion that
> > > can happen (at least with i915) is the RGB 4:4:4->YCbCr 4:2:0 fallbac=
k,
> > > which is needed on some displays to get 4k+ modes to work at all. =20
> >=20
> > When "Colorspace" says RGB, and the automatic fallback would kick in to
> > create a conflict, what happens? =20
>=20
> I would put that in the "Doctor, it hurts when I..." category.

Hi Ville,

I meant specifically the case where the driver chooses to use YCbCr
4:2:0 even though userspace is setting absolutely everything to RGB.

So yeah, that is a problem, like you and Sebastian agreed later.

Am I safe from that automatic driver fallback if I don't use 4k or
bigger video modes? What about e.g. 1080p@120 or something? Can I
calculate when the fallback will happen and choose my "Colorspace"
accordingly? Which also requires me to set up the RGB->YCbCR color
model conversion myself?

What about failing the modeset instead if userspace sets "Colorspace"
explicitly to RGB, and the driver would need to fall back to YCbCR
4:2:0?

That would make the most sense to me, as then the driver would not
silently do a buggy thing.


> > I thought we agreed that "max bpc" means limiting link bpc to at most
> > that value, but the driver will automatically pick a lower value if
> > that makes the requested video mode work (and in lack of new KMS
> > properties).
> >=20
> > I have no desire that change that. I also think the Plymouth issue is
> > not fully fixable without some new KMS property, and until then the
> > only thing Plymouth could do is to smash "max bpc" always to 8 - which
> > mostly stops being a problem once display servers learn to handle "max
> > bpc". =20
>=20
> There's no real differene between the kernel automagically clamping
> "max bpc" to the current BIOS programmed value vs. plymouth doing it.
> Either approach will break deep color support for current userspace
> which doesn't reset "max bpc" back to the max.

There is one big difference: if Plymouth does it, then people cannot
scream "kernel regression". People can point fingers at Plymouth, but I
would imagine the actual fixes will come as patches to other KMS clients
and not Plymouth.


Thanks,
pq

--Sig_/NeyZ3k5qyITpCppc9utFGzQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmKZte0ACgkQI1/ltBGq
qqdazw/8C/cD2SpRmTqodaXm3jAGUxLnU7C9yJSDURtspj2URj4oCd2UUCUi1/6N
LEHLDhKIOp5cDya45nta0cT5JKZ9qxzcD3NduMKv3HHlIrD8wB62Gi0yAlejzyZn
+ZvzvBU91vEyvC1uUXf6wUiNC138HPAa4JPTJHa99PYN8HxSFKBRMg6/PcezGgvZ
7Kg/1VP/KASmaN9xU16sJ2AWBcq6sfeYPf0zf77+KRLspBu0QpWDs4owuDqjmE8/
688YiOwJrZlNDSSRva/9c4laXN7cfz7VBsxPOebHJZnwR9+zgdbUBt20Ev8d6df5
kDr5ivQJpk4PJRkEhTf8MGBZyDKaLq0ubO2IUoN5kMXpUA46E+FNZbiQBgpZJESx
CGETEblv4eUL55xWukxpX6dcTDXbH7qnqlgL0DdIcoBioqbztGMobGxhRD9H14IB
/KyiG42LBISLGNx/RJRJiUDI9OZzndMO80Ami6fsraFBsg2hEXnZkK/+2Bu8Tllk
ipXxvpMrgZsX2NB9Pqblm78M2DWjw2zVXt5rRIjIz9KiOF0mvqca+P9UTLLRGyfX
EbP7tlrI8HJQoBGzaTTKq89lZ5V5gOqTpf8ENVFjLeHWLcH3gmZfLRtT4d+L5RzZ
xe8WPhNzThO7Hv95n7ogb/P+X4iytM8yuyc1TeE4iaqL3TQI3gw=
=9ccq
-----END PGP SIGNATURE-----

--Sig_/NeyZ3k5qyITpCppc9utFGzQ--

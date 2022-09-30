Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B022F5F05E4
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 09:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5152C10EB9B;
	Fri, 30 Sep 2022 07:40:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A9510E1CB;
 Fri, 30 Sep 2022 07:40:10 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id u18so5616150lfo.8;
 Fri, 30 Sep 2022 00:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date;
 bh=iSDogXcMB5tECSQFKugdXCriDiQQHek9FCpeT6g3DS0=;
 b=cp2b59kDD5outIRKe48fQ8tG15iNricRLLl/AFlUQUnZVxr9rIxsgdfa1S815jkOA1
 GQgUTX9aLk3DxAgt1n5hdmiZo5IP+tuW/XkweJxAqHsucwq5wVfebhmCRR9jKaAQyFss
 632uGd4Fm6zUblzP1ki+n1z6ja1C5QnN8gv9SrgY/kUDcgOyyHwpjWgPofQor1L3DEAi
 59Z4WqIQAPz4V+naDI5h48dIrmcaCNkHh3B+gpmZkf1LHQpHYgKK5FII20gqjYr13s6c
 PizPdHxTdULMDaJ8M6YWUldQYVX3YG3yFat71MOexPPeU8LoDKmuA4BwY8i/Pefb5BCW
 PtNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date;
 bh=iSDogXcMB5tECSQFKugdXCriDiQQHek9FCpeT6g3DS0=;
 b=abFkW56S47M7cpOpzXoRV8/1bOeF4JZYoVVzU5DcpcTyVAJOVt3q+1ihSoY0PNjvRL
 p18Cnk+k9UvLI6n7EAeLHW5PvwavfvWsgUbd3edBDeOM53ZsKzBknFAVkrE+rwtLdDgb
 nJvOllHONNZqLGYRsM0JSUeXYzeM1OsIcuIZQQ0AhhRLEMI1Qu60zjnXlVKRg09D4eic
 a1emROYJWqH+3w9mI+cGILqlvDnOeO2svVroQtD44iYJ6EIpVULUIT8vajl4uS+LTwPi
 LFZyOw5pM3eX/y2jvREpzNzATGzzihQdAn4ca0N9Gys+YWVsd7ilW41OsDWeWF9qoyyR
 iEmQ==
X-Gm-Message-State: ACrzQf3PSw5OVoyG+RWyGtQxVxAjrGRPCQNPG7Gg5kMU7q4S4XNwSYkC
 zGSzmvFJjKqa4pl+NK3fJ1k=
X-Google-Smtp-Source: AMsMyM4ODISR3V2NEbE9IKof9/cR3i/FK5Wapipz8EMQMC0HhEw83Y3mwfMLpAMVt67VWPkgkRukBQ==
X-Received: by 2002:a05:6512:3e23:b0:498:fbf1:c480 with SMTP id
 i35-20020a0565123e2300b00498fbf1c480mr3157446lfv.473.1664523608530; 
 Fri, 30 Sep 2022 00:40:08 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 i18-20020a056512007200b00494a8fecacesm208237lfo.192.2022.09.30.00.40.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 00:40:08 -0700 (PDT)
Date: Fri, 30 Sep 2022 10:39:56 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Sebastian Wick <sebastian.wick@redhat.com>
Subject: Re: [RFC v2] drm/kms: control display brightness through
 drm_connector properties
Message-ID: <20220930103956.1c3df79e@eldfell>
In-Reply-To: <CA+hFU4xRV74r3Wbs-TTWmtAkEwdJaEb+1QXUZSh52LVRwfddeA@mail.gmail.com>
References: <b61d3eeb-6213-afac-2e70-7b9791c86d2e@redhat.com>
 <878rm3zuge.fsf@intel.com> <YzQojrDOGNhm4D8l@intel.com>
 <YzQseBFa5EvDUDSw@intel.com>
 <CA+hFU4xRV74r3Wbs-TTWmtAkEwdJaEb+1QXUZSh52LVRwfddeA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kvd=njEk7KSGdDnUGNMouuk";
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
Cc: Christoph Grenz <christophg+lkml@grenz-bonn.de>,
 Martin Roukala <martin.roukala@mupuf.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Yusuf Khan <yusisamerican@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/kvd=njEk7KSGdDnUGNMouuk
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 29 Sep 2022 20:06:50 +0200
Sebastian Wick <sebastian.wick@redhat.com> wrote:

> If it is supposed to be a non-linear luminance curve, which one is it?
> It would be much clearer if user space can control linear luminance
> and use whatever definition of perceived brightness it wants. The
> obvious downside of it is that it requires bits to encode changes that
> users can't perceive. What about backlights which only have a few
> predefined luminance levels? How would user space differentiate
> between the continuous and discrete backlight? What about
> self-emitting displays? They usually increase the dynamic range when
> they increase in brightness because the black level doesn't rise. They
> also probably employ some tonemapping to adjust for that. What about
> the range of the backlight? What about the absolute luminance of the
> backlight? I want to know about that all in user space.
>=20
> I understand that most of the time the kernel doesn't have answers to
> those questions right now but the API should account for all of that.

Hi,

if the API accounts for all that, and the kernel doesn't know, then how
can the API not lie? If the API sometimes lies, how could we ever trust
it at all?

Personally I have the feeling that if we can even get to the level of
"each step in the value is a more or less perceivable change", that
would be good enough. Think of UI, e.g. hotkeys to change brightness.
You'd expect almost every press to change it a bit.

If an end user wants defined and controlled luminance, I'd suggest they
need to profile (physically measure) the response of the display at
hand. This is no different from color profiling displays, but you need
a measurement device that produces absolute measurements if absolute
control is what they want.

If there ever becomes an industry standard and conformance test
definitions for luminance levels and backlight control, then things
could be different. But until that, I believe trying to make one in the
kernel is futile, because I have got the impression that there is
practically no consistency between different displays in general.

Besides, I would expect some backlights to wear over time, grow dimmer
for the same input value. Without a physical active feedback loop
(measurements), it just won't work.

If this is mostly for laptop displays, would end users even care?


Thanks,
pq

> On Wed, Sep 28, 2022 at 1:14 PM Ville Syrj=C3=A4l=C3=A4
> <ville.syrjala@linux.intel.com> wrote:
> >
> > On Wed, Sep 28, 2022 at 01:57:18PM +0300, Ville Syrj=C3=A4l=C3=A4 wrote=
: =20
> > > On Wed, Sep 28, 2022 at 01:04:01PM +0300, Jani Nikula wrote: =20
> > > > On Fri, 09 Sep 2022, Hans de Goede <hdegoede@redhat.com> wrote: =20
> > > > > Hi all,
> > > > >
> > > > > Here is v2 of my "drm/kms: control display brightness through drm=
_connector properties" RFC:

...

> > > > > Unlike the /sys/class/backlight/foo/brightness this brightness pr=
operty
> > > > > has a clear definition for the value 0. The kernel must ensure th=
at 0
> > > > > means minimum brightness (so 0 should _never_ turn the backlight =
off).
> > > > > If necessary the kernel must enforce a minimum value by adding
> > > > > an offset to the value seen in the property to ensure this behavi=
or.
> > > > >
> > > > > For example if necessary the driver must clamp 0-255 to 10-255, w=
hich then
> > > > > becomes 0-245 on the brightness property, adding 10 internally to=
 writes
> > > > > done to the brightness property. This adding of an extra offset w=
hen
> > > > > necessary must only be done on the brightness property,
> > > > > the /sys/class/backlight interface should be left unchanged to no=
t break
> > > > > userspace which may rely on 0 =3D off on some systems.
> > > > >
> > > > > Note amdgpu already does something like this even for /sys/class/=
backlight,
> > > > > see the use of AMDGPU_DM_DEFAULT_MIN_BACKLIGHT in amdgpu.
> > > > >
> > > > > Also whenever possible the kernel must ensure that the brightness=
 range
> > > > > is in perceived brightness, but this cannot always be guaranteed.=
 =20
> > > >
> > > > Do you mean every step should be a visible change? =20
> > >
> > > Hmm. I guess due to this. I'd prefer the opposite tbh so I could
> > > just put in my opregion BCLM patch. It's annoying to have to
> > > carry it locally just to have reasonable backlight behaviour =20
> >
> > After second though I guess I'm actually agreeing with Hans here.
> > The current situation is where small change in the value near one
> > end of the range does basically nothing, while a small change at
> > the other of the range causes a massive brightness change. That
> > is no good.
> >
> > --
> > Ville Syrj=C3=A4l=C3=A4
> > Intel
> > =20
>=20


--Sig_/kvd=njEk7KSGdDnUGNMouuk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmM2nUwACgkQI1/ltBGq
qqfTEg/+NeZJDo6Z/Jcyav3xuQDRxYqS6GbwRpkyWBpCPCFN2cb1Y0yxc6AtdUGj
XJCXJ7bWdtKeVH5bW7sOJWwTKbxV7a1uTado9VPJyLpksUtZAa8STafdWnrQ+m9+
5LJFWfgqpaLhVTJvMR2EnUSV7YtW69kRpYv0nuPrAFBRfIOJB+yc4gnXPjiknfde
4Xa0nHotJCmGzR0bmhCiEvni8rd/frwC7+yeI+DWcyz9wq4IPLRdjlCykYSjDU7i
fhPaCnZwOZlATU46ilD7cSaii7JTRVcfYjb5CuZBmIkUbvw4ujTatbX8t/gAWoxP
ll+uhdJoy6tszlcnOLZU8Ml5n+AUxFQ4gsdLoRm7KVR6krX2l99NY1yU9gGIXzAm
A895slMy0rkxFwqTyq7SKuWl6QMcj48CZy4HdV5uOxBAb8CdATB+B7CcKzzzog/F
1UYF2muF2qMWt5epzsPvhNP4JVaREQL4WTyTfJHqkN+vVPegkgDqy4uSdQw4pZQn
/lx23x0u4kqaRGwpmrTRiadn5Drc0V13VmZZKwEuOxDCclU53NUKOO0t8kmLI1Yh
hcPzJqYCDkeEOTbrsfX7Auy3AJ7AV0+t1dBCdoGkno5xuVm/i2IWuFZ4zixC+bGy
v6gevz7QGim4Hh1g7AAeN9qgKwmasHBle44WKf6c3TMgcFJqBfc=
=Bn4c
-----END PGP SIGNATURE-----

--Sig_/kvd=njEk7KSGdDnUGNMouuk--

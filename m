Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFCD1F5690
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 16:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B14F6E5B6;
	Wed, 10 Jun 2020 14:09:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 372936E5B6
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jun 2020 14:09:47 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id u16so1528827lfl.8
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jun 2020 07:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=g1Vbv5jIfItHhDqkKeHNDtDgP2ht/ZKzi3Ih3IRAI3Y=;
 b=Uuf5KTA4izDyFJhEIdW3llJnZwZ2C2wUl4Qwadcvm2oXm+U7IW7sOnBTCmTtOn0xCb
 Ucr1h9+PhbLRUTrbc9qVYUkS5BoRYjV7EOK/qk989lrwS69qmnd/hht00cJ/4gCv+Wic
 NuH3sUNoxIEL49oslu5KP7HIx412QcIslSN5NFcw2HreSaXh4uI/WAQonym14gtdVAUg
 E2aAb8axT3sDSkORQbTlnzszsfTfNEB27jD56i2W/wZEIGqSoQgs0V57CEqOnB+lAjIK
 vjIv0jtIyM8X65C+t05MzpincsfZtCa4/zAeNvM8DdETier4fQavYfncpe6iqRKkAfDc
 HD6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=g1Vbv5jIfItHhDqkKeHNDtDgP2ht/ZKzi3Ih3IRAI3Y=;
 b=nLIrz+oi/QQQd5za4GTtVHkX37Q4AUn6pvcIy8eUy9u/S5T74CBK3Arzc3R4iWh3r3
 8/53mkJK+Yw2NMH8G7bTZsoWd7IMi/PJ0WmyhYqFUvWpEcwApK8Pyr62/KCJ3S6DVNCJ
 YQOPqkOTFFX3PDQIiLtOsUpLZ55tdcC7mVlW5G9a6hpT2HOg28mr69GCcqvlsNCbrLil
 LjzbvzHeYN7ZIgtH6Oe83QnVzLkqYwlxfG8xnWhn1RNZEj16i0R3FpaZpPM0pPKpLEwO
 wg2H57YO5kYp0ebXXaJInKQODpiVuh5b1Y9FUdY4eS+6Amppqffs0oosm5+42egyPmsA
 +JtQ==
X-Gm-Message-State: AOAM5330McF/3llaSTdqiEmXJWnuQwlBQiXbC1iOno4dvpYC9QyFMiXc
 a4FtLOKh0ULn+zoO1y8EAds=
X-Google-Smtp-Source: ABdhPJwtuDzU1ix+gsp5bEpnokAtwMVrdvgraipzsVp6qg8K7KdCXEvdinymrbx3yz+i8gc5k2hm4Q==
X-Received: by 2002:ac2:544b:: with SMTP id d11mr1853518lfn.157.1591798185443; 
 Wed, 10 Jun 2020 07:09:45 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id r17sm5677114ljd.0.2020.06.10.07.09.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 07:09:45 -0700 (PDT)
Date: Wed, 10 Jun 2020 17:09:40 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v5 13/13] drm/print: Add tracefs support to the drm
 logging helpers
Message-ID: <20200610170940.4716a2ea@eldfell.localdomain>
In-Reply-To: <CAMavQKJ6LGK=bPcECdrsEv9LGsiE9EXokTKq36jwxY0ei2-amw@mail.gmail.com>
References: <20200608210505.48519-1-sean@poorly.run>
 <20200608210505.48519-14-sean@poorly.run>
 <20200610105724.2cddc703@eldfell.localdomain>
 <CAMavQKJ6LGK=bPcECdrsEv9LGsiE9EXokTKq36jwxY0ei2-amw@mail.gmail.com>
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
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Chris Wilson <chris@chris-wilson.co.uk>, Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Steven Rostedt <rostedt@goodmis.org>
Content-Type: multipart/mixed; boundary="===============1715690810=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1715690810==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/1bMJG7bM6D/6shRRSH4kjU8"; protocol="application/pgp-signature"

--Sig_/1bMJG7bM6D/6shRRSH4kjU8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 10 Jun 2020 09:29:37 -0400
Sean Paul <sean@poorly.run> wrote:

> On Wed, Jun 10, 2020 at 3:57 AM Pekka Paalanen <ppaalanen@gmail.com> wrot=
e:
> >
> > On Mon,  8 Jun 2020 17:05:03 -0400
> > Sean Paul <sean@poorly.run> wrote:
> > =20
> > > From: Sean Paul <seanpaul@chromium.org>
> > >
> > > This patch adds a new module parameter called drm.trace which accepts
> > > the same mask as drm.debug. When a debug category is enabled, log
> > > messages will be put in a new tracefs instance called drm for
> > > consumption.
> > >
> > > Using the new tracefs instance will allow distros to enable drm loggi=
ng
> > > in production without impacting performance or spamming the system
> > > logs.
> > >
> > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Cc: David Airlie <airlied@gmail.com>
> > > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > > Cc: Rob Clark <robdclark@gmail.com>
> > > Cc: Steven Rostedt <rostedt@goodmis.org>
> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > > Cc: Steven Rostedt <rostedt@goodmis.org>
> > > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> > > Link: https://patchwork.freedesktop.org/patch/msgid/20191010204823.19=
5540-1-sean@poorly.run #v1
> > > Link: https://lists.freedesktop.org/archives/dri-devel/2019-November/=
243230.html #v2
> > > Link: https://patchwork.freedesktop.org/patch/msgid/20191212203301.14=
2437-1-sean@poorly.run #v3
> > > Link: https://patchwork.freedesktop.org/patch/msgid/20200114172155.21=
5463-1-sean@poorly.run #v4
> > >
> > > Changes in v5:
> > > -Re-write to use trace_array and the tracefs instance support
> > > ---
> > >  Documentation/gpu/drm-uapi.rst |   6 +
> > >  drivers/gpu/drm/drm_drv.c      |   3 +
> > >  drivers/gpu/drm/drm_print.c    | 209 ++++++++++++++++++++++++++++---=
--
> > >  include/drm/drm_print.h        |  63 ++++++++--
> > >  4 files changed, 241 insertions(+), 40 deletions(-)
> > >

...

> > >  #include <drm/drm.h>
> > >  #include <drm/drm_drv.h>
> > > @@ -43,17 +44,34 @@
> > >  unsigned int __drm_debug_syslog;
> > >  EXPORT_SYMBOL(__drm_debug_syslog);
> > >
> > > -MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables=
 a debug category.\n"
> > > -"\t\tBit 0 (0x01)  will enable CORE messages (drm core code)\n"
> > > -"\t\tBit 1 (0x02)  will enable DRIVER messages (drm controller code)=
\n"
> > > -"\t\tBit 2 (0x04)  will enable KMS messages (modesetting code)\n"
> > > -"\t\tBit 3 (0x08)  will enable PRIME messages (prime code)\n"
> > > -"\t\tBit 4 (0x10)  will enable ATOMIC messages (atomic code)\n"
> > > -"\t\tBit 5 (0x20)  will enable VBL messages (vblank code)\n"
> > > -"\t\tBit 7 (0x80)  will enable LEASE messages (leasing code)\n"
> > > -"\t\tBit 8 (0x100) will enable DP messages (displayport code)");
> > > +/*
> > > + * __drm_debug_trace: Enable debug output in drm tracing instance.
> > > + * Bitmask of DRM_UT_x. See include/drm/drm_print.h for details.
> > > + */
> > > +unsigned int __drm_debug_trace;
> > > +EXPORT_SYMBOL(__drm_debug_trace); =20
> >
> > Hi! =20
>=20
> Hi Pekka,
> Thanks again for the feedback, I'm happy that we seem to be converging!
>=20
> >
> > Might distributions perhaps want to set a default value for this via
> > Kconfig? Or could setting it via sysfs happen early enough to diagnose
> > e.g. Plymouth problems?
> >
> > Or maybe there is nothing to see from early boot?
> >
> > The general usefulness of this feature depends on whether people
> > actually run with it enabled. =20
>=20
> I had assumed that the cmdline argument would be sufficient for
> distros, is Kconfig preferable here? The module parameter has the
> advantage of being runtime configurable and is more in line with
> drm.debug. We can do either in CrOS, so I'm happy to go with crowd
> consensus.

Hi,

I don't know. I did mean only *default* value for the module parameter
via Kconfig. Right now your default value is implicit 0.

But that's just me thinking that making kernel command lines even
longer would be somehow bad. Maybe it's fine?


Thanks,
pq

--Sig_/1bMJG7bM6D/6shRRSH4kjU8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl7g6aQACgkQI1/ltBGq
qqfGFw//XnsBRy9ekiB6PwetfZzye6EeAUYw4Kj2bjCYIawn+eY39H45E467FXYE
dekQ/lBzzv3J4fH3k7f11GC0H4wpSSMSTkm9oWk/zCH5BdX6z7BJU8Yucl1QDgAC
BCTp2m8jEfHmtefNjIL0zGKhzgmQ/gwHAqDfXqpBTIEl3aF+76nrxImdskjY6Dth
JAF8OvN6WPbYp/ZwMn7iCw745R2qILPiLmB6koCHNa+UDUjHnoQZJ8llbu8s6k/C
A0aqfqbI572raObuiGlQkunYFnVRSoCrxlB9mYxicbdxDJKMNmxHEbLdfj7onUbE
XxQwyKF7RZ+fIjs8kqKTgCp6UF7fys+2j4S9DXfhbPTs/FGJznlejo/G/571ymfv
nxgJCLMuZkJbQ3H62yRIopoAw8OWiNELp8Du99BaKkwNGDwODo8roYxIt/4JC4DV
s1alquFoGtWgzFvYdkll5rhlbr+sh0Ut+YSwaq6MjCWMlJwRnO3mZfVlU7zX9p9K
ekuWDwbTLWkpHA+6xN+WVkg5fYbpAFTB0yZ8QAlhsgX4aL9XaAlfjm0kzApZ8Ad6
DsDRA9rgUurc5DPJghMxDkksc5Qz/4uUsz6yJt2Jw+9NwSxDrlwndAiFsSgZ9hu0
C4jf+k2m2e97GjaVqNMDcI1sUjwRwN4G0rBcImbS6+WTcnX+YTE=
=hPpZ
-----END PGP SIGNATURE-----

--Sig_/1bMJG7bM6D/6shRRSH4kjU8--

--===============1715690810==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1715690810==--

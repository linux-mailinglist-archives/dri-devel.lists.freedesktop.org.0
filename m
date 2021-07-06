Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7393BC891
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 11:37:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C340389864;
	Tue,  6 Jul 2021 09:37:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8532E89864
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 09:37:38 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id r16so28252297ljk.9
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jul 2021 02:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=tFb1B+jQzkIH5rpOAqJzz5mcZ2A6uWFLxSsl6HittW0=;
 b=j3Jg8+G8taUoUdFKXzvC6FXcNErQhJJ/mVwNRI1i+TbPdE+lp+UwyVRjXCKc2RZo2p
 LVuauw5rFsDOJKtI2Zsd8Utq92m4k6gTG/8Evryf7QnkVHEcEREAOyaiZWHniEVKVogs
 WxQMGUxRA0SGxr33c8ZNn/deo08b/yYr+cysFl4PHka+sBr21lFqsMqw98TjCD9O2jg2
 atqXX6C9HW05FcMOMdayHiESwmMoWnkaumkUmbveFmf/NPnOQhigzHbSpaEqEWxAAihm
 aSKvILdTMLHxDLarak25uXK1Fcc38QflEPIwAxY5+j8oCwliu8Q8ZwSodMSVEWQpNL2x
 2edQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=tFb1B+jQzkIH5rpOAqJzz5mcZ2A6uWFLxSsl6HittW0=;
 b=RjYaRs4GtkW87iE8YasQUl8K9uT/n3sEmjl++NaKB933Nb+FKcSmU8qgYoRG0brN3P
 rlx0OXPEgE0vxBEPYnd5+myc40XJhBAaMJhUU4Ofc9G2cBicoC2eAh1tXN7Q4rdxNtRx
 DmCYxRlWJ7Pv8DuSZVVL2iDGjLusI3jGmsm69iJct0XmTf/7jqRXstAAggA24JeYnW86
 nsPMVuWcflImzP2YgPp/PKXnTngzphw+7MjdNq0eI2aupd5BvXiL+WqSvhK9B4P1MgHU
 jxR6b3jL5cxUCSz6YFjz/UMOhn2URVOSNL/6G4ozJ0Eqtc4n4B/Z2mTREfiM5dU6jYpz
 Yhxw==
X-Gm-Message-State: AOAM53387L8LAa8ieCiu/OEdq0cJQJp+UQvMAwrAw6/bQL86+esk/DTn
 sunkRJJSTP6ibX5s9EpNw7E=
X-Google-Smtp-Source: ABdhPJy+7Gao5d3e1ruoSvb8ysjpEFYtqqTdfOGw0gPGSHKcikGYak9tlr9V6tltN8Cv8x2SjxfW1g==
X-Received: by 2002:a05:651c:48b:: with SMTP id
 s11mr301677ljc.237.1625564256645; 
 Tue, 06 Jul 2021 02:37:36 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id x192sm257660lff.50.2021.07.06.02.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 02:37:36 -0700 (PDT)
Date: Tue, 6 Jul 2021 12:37:23 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v4] Documentation: gpu: Mention the requirements for new
 properties
Message-ID: <20210706123723.6194abc5@eldfell>
In-Reply-To: <20210706085202.6o4fapfmq7osj5wf@gilmour>
References: <20210616143842.632829-1-maxime@cerno.tech>
 <20210617112036.7373fdab@eldfell>
 <20210706085202.6o4fapfmq7osj5wf@gilmour>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hj9QZ7arv3mj=0xn=Pt87Ya";
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Edmund Dea <edmund.j.dea@intel.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Russell King <linux@armlinux.org.uk>,
 Melissa Wen <melissa.srw@gmail.com>, Eric Anholt <eric@anholt.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Steven Price <steven.price@arm.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 Jerome Brunet <jbrunet@baylibre.com>, Paul Cercueil <paul@crapouillou.net>,
 Marek Vasut <marex@denx.de>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Qiang Yu <yuq825@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Kevin Hilman <khilman@baylibre.com>, Tomi Valkeinen <tomba@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Xinliang Liu <xinliang.liu@linaro.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 NXP Linux Team <linux-imx@nxp.com>, Chen Feng <puck.chen@hisilicon.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Ben Skeggs <bskeggs@redhat.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Roland Scheidegger <sroland@vmware.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alison Wang <alison.wang@nxp.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Chen-Yu Tsai <wens@csie.org>,
 Sean Paul <sean@poorly.run>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Hyun Kwon <hyun.kwon@xilinx.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Huang Rui <ray.huang@amd.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>, Jonathan Corbet <corbet@lwn.net>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Sandy Huang <hjc@rock-chips.com>,
 Robert Foss <robert.foss@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Noralf =?UTF-8?B?VHLDuG5uZXM=?= <noralf@tronnes.org>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/hj9QZ7arv3mj=0xn=Pt87Ya
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 6 Jul 2021 10:52:02 +0200
Maxime Ripard <maxime@cerno.tech> wrote:

> Hi Pekka,
>=20
> On Thu, Jun 17, 2021 at 11:20:36AM +0300, Pekka Paalanen wrote:
> > On Wed, 16 Jun 2021 16:38:42 +0200
> > Maxime Ripard <maxime@cerno.tech> wrote:
> >  =20
> > > New KMS properties come with a bunch of requirements to avoid each
> > > driver from running their own, inconsistent, set of properties,
> > > eventually leading to issues like property conflicts, inconsistencies
> > > between drivers and semantics, etc.
> > >=20
> > > Let's document what we expect.
> > >=20
> > > Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > > Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > Cc: Alison Wang <alison.wang@nxp.com>
> > > Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> > > Cc: Andrew Jeffery <andrew@aj.id.au>
> > > Cc: Andrzej Hajda <a.hajda@samsung.com>
> > > Cc: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> > > Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> > > Cc: Ben Skeggs <bskeggs@redhat.com>
> > > Cc: Boris Brezillon <bbrezillon@kernel.org>
> > > Cc: Brian Starkey <brian.starkey@arm.com>
> > > Cc: Chen Feng <puck.chen@hisilicon.com>
> > > Cc: Chen-Yu Tsai <wens@csie.org>
> > > Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> > > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > > Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > > Cc: Edmund Dea <edmund.j.dea@intel.com>
> > > Cc: Eric Anholt <eric@anholt.net>
> > > Cc: Fabio Estevam <festevam@gmail.com>
> > > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> > > Cc: Hans de Goede <hdegoede@redhat.com>
> > > Cc: "Heiko St=C3=BCbner" <heiko@sntech.de>
> > > Cc: Huang Rui <ray.huang@amd.com>
> > > Cc: Hyun Kwon <hyun.kwon@xilinx.com>
> > > Cc: Inki Dae <inki.dae@samsung.com>
> > > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > > Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> > > Cc: Jerome Brunet <jbrunet@baylibre.com>
> > > Cc: Joel Stanley <joel@jms.id.au>
> > > Cc: John Stultz <john.stultz@linaro.org>
> > > Cc: Jonas Karlman <jonas@kwiboo.se>
> > > Cc: Jonathan Hunter <jonathanh@nvidia.com>
> > > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > > Cc: Joonyoung Shim <jy0922.shim@samsung.com>
> > > Cc: Jyri Sarha <jyri.sarha@iki.fi>
> > > Cc: Kevin Hilman <khilman@baylibre.com>
> > > Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > > Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> > > Cc: Kyungmin Park <kyungmin.park@samsung.com>
> > > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > Cc: Liviu Dudau <liviu.dudau@arm.com>
> > > Cc: Lucas Stach <l.stach@pengutronix.de>
> > > Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> > > Cc: Marek Vasut <marex@denx.de>
> > > Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > > Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: Melissa Wen <melissa.srw@gmail.com>
> > > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > > Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> > > Cc: "Noralf Tr=C3=B8nnes" <noralf@tronnes.org>
> > > Cc: NXP Linux Team <linux-imx@nxp.com>
> > > Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> > > Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> > > Cc: Paul Cercueil <paul@crapouillou.net>
> > > Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > > Cc: Philippe Cornu <philippe.cornu@foss.st.com>
> > > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > > Cc: Qiang Yu <yuq825@gmail.com>
> > > Cc: Rob Clark <robdclark@gmail.com>
> > > Cc: Robert Foss <robert.foss@linaro.org>
> > > Cc: Rob Herring <robh@kernel.org>
> > > Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Roland Scheidegger <sroland@vmware.com>
> > > Cc: Russell King <linux@armlinux.org.uk>
> > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > Cc: Sandy Huang <hjc@rock-chips.com>
> > > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > > Cc: Sean Paul <sean@poorly.run>
> > > Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > Cc: Simon Ser <contact@emersion.fr>
> > > Cc: Stefan Agner <stefan@agner.ch>
> > > Cc: Steven Price <steven.price@arm.com>
> > > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > > Cc: Thierry Reding <thierry.reding@gmail.com>
> > > Cc: Tian Tao <tiantao6@hisilicon.com>
> > > Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> > > Cc: Tomi Valkeinen <tomba@kernel.org>
> > > Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
> > > Cc: Xinliang Liu <xinliang.liu@linaro.org>
> > > Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
> > > Cc: Yannick Fertre <yannick.fertre@foss.st.com>
> > > Cc: Zack Rusin <zackr@vmware.com>
> > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > >=20
> > > ---
> > >=20
> > > Changes from v3:
> > >   - Roll back to the v2
> > >   - Add Simon and Pekka in Cc
> > >=20
> > > Changes from v2:
> > >   - Take into account the feedback from Laurent and Lidiu to no longer
> > >     force generic properties, but prefix vendor-specific properties w=
ith
> > >     the vendor name
> > >=20
> > > Changes from v1:
> > >   - Typos and wording reported by Daniel and Alex
> > > ---
> > >  Documentation/gpu/drm-kms.rst | 19 +++++++++++++++++++
> > >  1 file changed, 19 insertions(+)
> > >=20
> > > diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-km=
s.rst
> > > index 87e5023e3f55..c28b464dd397 100644
> > > --- a/Documentation/gpu/drm-kms.rst
> > > +++ b/Documentation/gpu/drm-kms.rst
> > > @@ -463,6 +463,25 @@ KMS Properties
> > >  This section of the documentation is primarily aimed at user-space d=
evelopers.
> > >  For the driver APIs, see the other sections.
> > > =20
> > > +Requirements
> > > +------------
> > > +
> > > +KMS drivers might need to add extra properties to support new featur=
es.
> > > +Each new property introduced in a driver need to meet a few
> > > +requirements, in addition to the one mentioned above.:
> > > +
> > > +- It must be standardized, with some documentation to describe how t=
he
> > > +  property can be used. =20
> >=20
> > Hi,
> >=20
> > I might replace "some" with "full" documentation. Also not only how it
> > can be used but also what it does.
> >=20
> > FYI, some common things that tend to be forgotten IME:
> > - Spell out exactly the name string for the property in the
> >   documentation so that it is unambiguous what string userspace should
> >   look for.
> > - The same for string names of enum values.
> > - Explicitly document what each enum value means, do not trust that the
> >   value name describes it well enough.
> > - Explain how the property interacts with other, existing properties.
> >=20
> > Not sure if these should be written down here or anywhere though.
> > Interaction with other properties is kind of important.
> >  =20
> > > +
> > > +- It must provide a generic helper in the core code to register that
> > > +  property on the object it attaches to.
> > > +
> > > +- Its content must be decoded by the core and provided in the object=
's
> > > +  associated state structure. That includes anything drivers might w=
ant to
> > > +  precompute, like :c:type:`struct drm_clip_rect <drm_clip_rect>` fo=
r planes.
> > > +
> > > +- An IGT test must be submitted where reasonable. =20
> >=20
> > Would it be too much to replace "where reasonable" with "if it is at
> > all possible to write a test."?
> >  =20
> > > + =20
> >=20
> > How about adding the following somewhere?
> >=20
> > - The initial state of the property (set during driver initialization)
> >   must match how the driver+hardware behaved before introducing this
> >   property. It may be some fixed value or it may be inherited from e.g.
> >   the firmware that booted the system. How the initial state is
> >   determined must also be documented, that is, where does it come from.
> >=20
> > The initial state must not be called "default", because I want to
> > reserve the term default for something else if possible: the phrase
> > "reset everything to defaults", which is a whole another discussion. =20
>=20
> I've taken into account your previous comments, thanks
>=20
> > How about also saying that fbcon/fbdev must set this property when
> > taking over? That sounds to be like a common omission leading to funky
> > KMS state in fbcon. The value fbdev sets it to only needs to make
> > sense to fbdev, and it does not need to be ~~the initial value~~ nor the
> > default value. Or are we hoping to kill fbcon in favor of a userspace
> > kmscon soon? ;-)
> >=20
> > Ooh, maybe the KMS property documentation should also say what value
> > fbdev will set the property to. That's kind of UABI, because userspace
> > probably implicitly relies on it in many cases. ...which means fbdev
> > should set the property to its initial value, otherwise userspace will
> > break. =20
>=20
> I'm not sure about this one: fbdev and fbcon are still optional features
> of the kernel and can be disabled at the user discretion. Having any
> part of the user-space rely on the fbdev behavior seems a bit broken,
> especially when we have a mechanism to retrieve the state when the
> application starts.

Hi,

yes, exactly that is why fbdev/fbcon should reset the properties to
their initial values. You would not want userspace inheriting a
different KMS state with vs. without fbcon when it starts.

Retrieving the current KMS state is useless if the current KMS state is
somehow wonky and the application does not understand that specific KMS
property that is wonky. It cannot set the property to any value other
than it already had without user intervention.

I'd say fbcon causing all KMS state to be reset is a quality of life
thing. It's possible to live without by rebooting, but it would
certainly make at least developers' and testers' life easier until we
get the real "reset KMS" knob (which fbcon could then use too).

Besides, even if it is broken for userspace to rely on the KMS state
set by fbcon/fbdev, userspace is already doing that and not on purpose
because new KMS properties get added in the kernel. I would bet that
there is not a single userspace program that would actually set all KMS
properties that drivers might expose. So they are depending on
inherited KMS state, which could be left by driver initialization, by
fbdev/fbcon, or by any other userspace.

But yeah, this idea is something new, so don't let this discussion
delay landing the docs.


Thanks,
pq

--Sig_/hj9QZ7arv3mj=0xn=Pt87Ya
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDkJFMACgkQI1/ltBGq
qqfliw/+MUWug6n+qNhB1f35QWbJxIcAqQq3XzX9YqNvSnjNlqLXFvgi0snMY7Hk
lCYqqBDKyUDUCrrzKWhjFoHxthTZrtQPWLWoU581FyLGYHoQTU6pDD9a0ZPpgWDh
RSYZ6sc2Do46j85sa3DUMZfSThSYUr7YAjPD7koy8x1qWgn2m0BnFMdo1z1+p5Wm
4fmi5NuRYZjijE2J7Mn97aW+MK+7eLyoq0JsOxgVQOwu6N8pCZAia85Jvdf0yi8R
d2kYkkbYWnUxAHBB82dMituFOvCSW7bSRDsHaGulrJI7dvAzRrtdDSNMnsFPRjnE
0i2XWZVs8FlyXNnZUsGzWvoTRbCnaeQ8tZKynpuaHcYEy3meeMVaCfMW8/ShVFjr
hhfUqVyA+d/UKFzVM24yln0+esK+0HaxUGCOYHuBmUk8f0FUSE+QoFD/JxyiDzAS
mGhqv9p+ZTuk+AIilUXWyLr08jJFkMmufFJkomHT3fgZ5x3GI3VoEfFjwd09RtRG
/OwzJ8YbgKn+KQcp+MPg8E3QgxQ62Q9gMRENewfqszm5uhLlbfyAlSL0IURGh+Id
NCvA7RMvA+mVAE+wiBVEzFTWSXdjzcp6cBO+KyN0JcexwVEkY/7PoDJxOvfOQUvW
rePsDzKR8QQn5rQhjUAcZJpXyDXb1+do1p4X6BfRTkYW9+Ak7O8=
=x+Xo
-----END PGP SIGNATURE-----

--Sig_/hj9QZ7arv3mj=0xn=Pt87Ya--

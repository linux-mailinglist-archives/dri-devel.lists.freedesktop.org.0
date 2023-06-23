Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D296C73B33E
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 11:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D1810E060;
	Fri, 23 Jun 2023 09:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E6B10E060
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 09:08:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2EFEB619B2;
 Fri, 23 Jun 2023 09:08:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCA2DC433C0;
 Fri, 23 Jun 2023 09:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687511310;
 bh=XDe+QpmXX6ZcmTCp4Pqic6C3Q49nghoQCRwh4dRmpUU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BqvIt0bC0bF8EFUlTMtyW/XKDnuHrJ0oreIq6vIRnAqFhkGBOm2Gt75Ch4cMoWVRO
 W2ZvdkvLo5n0AM9ToAlzIPyd433I3knQzQN42KqbPvUCWKOAA9rJtlslA10vpocZUx
 mo2AHzJ6iSCOFa4g0nop4a9wXLreDdgufJxQeVde4zpMELwloI0yGeZ5NhsmGGufpd
 VadbC2Ogqa/ruMpHB6npS8INUSqbqBs0C9cXloGSYXUGoO5thHrSGYoCvmhUu9O4eg
 jsaI3hDjWo5LxnbT4jADCMd+zBeG0J8bAXKTcaQ6fFp60RufsrYZF+8FUEvZxdAdWM
 zSuZpNSD6KCNg==
Date: Fri, 23 Jun 2023 11:08:26 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 00/10] drm/panel and i2c-hid: Allow panels and
 touchscreens to power sequence together
Message-ID: <gkwymmfkdy2p2evz22wmbwgw42ii4wnvmvu64m3bghmj2jhv7x@4mbstjxnagxd>
References: <20230607215224.2067679-1-dianders@chromium.org>
 <jehxiy3z4aieop5qgzmlon4u76n7gvt3kc6knxhb5yqkiz3rsp@mx27m75sx43r>
 <CAD=FV=Wr7Xatw1LsofiZ5Xx7WBvAuMMdq4D5Po1yJUC1VdtZdg@mail.gmail.com>
 <z7wi4z4lxpkhvooqhihlkpubyvueb37gvrpmwk6v7xwj2lm6jn@b7rwyr5ic5x5>
 <CAD=FV=XnANRM=+2D9+DzcXx9Gw6iKKQsgkAiq8=izNEN-91f_Q@mail.gmail.com>
 <boqzlmbrp5rvepmckkqht4h5auspjlbt5leam4xivy7a4bqxnj@iuxxhooxcphk>
 <CAD=FV=VO=GE5BEw6kKK19Qj9tcia509Pb-bvMcq0uA05sVLvHw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="k3mpzbb6xqnkqo6k"
Content-Disposition: inline
In-Reply-To: <CAD=FV=VO=GE5BEw6kKK19Qj9tcia509Pb-bvMcq0uA05sVLvHw@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, Chris Morgan <macroalpha82@gmail.com>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Frank Rowand <frowand.list@gmail.com>,
 linux-input@vger.kernel.org, hsinyi@google.com, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 linux-arm-msm@vger.kernel.org, yangcong5@huaqin.corp-partner.google.com,
 Jiri Kosina <jikos@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--k3mpzbb6xqnkqo6k
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2023 at 08:56:39AM -0700, Doug Anderson wrote:
> Hi,
>=20
> On Tue, Jun 13, 2023 at 5:06=E2=80=AFAM Maxime Ripard <mripard@kernel.org=
> wrote:
> >
> > > > What I'm trying to say is: could we just make it work by passing a =
bunch
> > > > of platform_data, 2-3 callbacks and a device registration from the =
panel
> > > > driver directly?
> > >
> > > I think I'm still confused about what you're proposing. Sorry! :( Let
> > > me try rephrasing why I'm confused and perhaps we can get on the same
> > > page. :-)
> > >
> > > First, I guess I'm confused about how you have one of these devices
> > > "register" the other device.
> > >
> > > I can understand how one device might "register" its sub-devices in
> > > the MFD case. To make it concrete, we can look at a PMIC like
> > > max77686.c. The parent MFD device gets probed and then it's in charge
> > > of creating all of its sub-devices. These sub-devices are intimately
> > > tied to one another. They have shared data structures and can
> > > coordinate power sequencing and whatnot. All good.
> >
> > We don't necessarily need to use MFD, but yeah, we could just register a
> > device for the i2c-hid driver to probe from (using
> > i2c_new_client_device?)
>=20
> I think this can work for devices where the panel and touchscreen are
> truly integrated where the panel driver knows enough about the related
> touchscreen to fully describe and instantiate it. It doesn't work
> quite as well for cases where the power and reset lines are shared
> just because of what a given board designer did. To handle that, each
> panel driver would need to get enough DT properties added to it so
> that it could fully describe any arbitrary touchscreen, right?
>=20
> Let's think about the generic panel-edp driver. This driver runs the
> panel on many sc7180-trogdor laptops, including coachz, lazor, and
> pompom. All three of those boards have a shared power rail for the
> touchscreen and panel. If you look at "sc7180-trogdor-coachz.dtsi",
> you can see the touchscreen currently looks like this:
>=20
> ap_ts: touchscreen@5d {
>     compatible =3D "goodix,gt7375p";
>     reg =3D <0x5d>;
>     pinctrl-names =3D "default";
>     pinctrl-0 =3D <&ts_int_l>, <&ts_reset_l>;
>=20
>     interrupt-parent =3D <&tlmm>;
>     interrupts =3D <9 IRQ_TYPE_LEVEL_LOW>;
>=20
>     reset-gpios =3D <&tlmm 8 GPIO_ACTIVE_LOW>;
>=20
>     vdd-supply =3D <&pp3300_ts>;
> };
>=20
> In "sc7180-trogdor-lazor.dtsi" we have:
>=20
> ap_ts: touchscreen@10 {
>     compatible =3D "hid-over-i2c";
>     reg =3D <0x10>;
>     pinctrl-names =3D "default";
>     pinctrl-0 =3D <&ts_int_l>, <&ts_reset_l>;
>=20
>     interrupt-parent =3D <&tlmm>;
>     interrupts =3D <9 IRQ_TYPE_LEVEL_LOW>;
>=20
>     post-power-on-delay-ms =3D <20>;
>     hid-descr-addr =3D <0x0001>;
>=20
>     vdd-supply =3D <&pp3300_ts>;
> };
>=20
> In both cases "pp3300_ts" is simply another name for "pp3300_dx_edp"
>=20
> So I think to do what you propose, we need to add this information to
> the panel-edp DT node so that it could dynamically construct the i2c
> device for the touchscreen:
>=20
> a) Which touchscreen is actually connected (generic hid-over-i2c,
> goodix, ...). I guess this would be a "compatible" string?
>=20
> b) Which i2c bus that device is hooked up to.
>=20
> c) Which i2c address that device is hooked up to.
>=20
> d) What the touchscreen interrupt GPIO is.
>=20
> e) Possibly what the "hid-descr-addr" for the touchscreen is.
>=20
> f) Any extra timing information needed to be passed to the touchscreen
> driver, like "post-power-on-delay-ms"
>=20
> The "pinctrl" stuff would be easy to subsume into the panel's DT node,
> at least. ...and, in this case, we could skip the "vdd-supply" since
> the panel and eDP are sharing power rails (which is what got us into
> this situation). ...but, the above is still a lot. At this point, it
> would make sense to have a sub-node under the panel to describe it,
> which we could do but it starts to feel weird. We'd essentially be
> describing an i2c device but not under the i2c controller it belongs
> to.
>=20
> I guess I'd also say that the above design also need additional code
> if/when someone had a touchscreen that used a different communication
> method, like SPI.
>
> So I guess the tl;dr of all the above is that I think it could all work i=
f:
>=20
> 1. We described the touchscreen in a sub-node of the panel.
>=20
> 2. We added a property to the panel saying what the true parent of the
> touchscreen was (an I2C controller, a SPI controller, ...) and what
> type of controller it was ("SPI" vs "I2C").
>=20
> 3. We added some generic helpers that panels could call that would
> understand how to instantiate the touchscreen under the appropriate
> controller.
>=20
> 4. From there, we added a new private / generic API between panels and
> touchscreens letting them know that the panel was turning on/off.
>=20
> That seems much more complex to me, though. It also seems like an
> awkward way to describe it in DT.

Yeah, I guess you're right. I wish we had something simpler, but I can't
think of any better way.

Sorry for the distraction.

> > > In any case, is there any chance that we're in violent agreement
> >
> > Is it even violent? Sorry if it came across that way, it's really isn't
> > on my end.
>=20
> Sorry, maybe a poor choice of words on my end. I've heard that term
> thrown about when two people spend a lot of time discussing something
> / trying to persuade the other person only to find out in the end that
> they were both on the same side of the issue. ;-)
>=20
> > > and that if you dig into my design more you might like it? Other than
> > > the fact that the panel doesn't "register" the touchscreen device, it
> > > kinda sounds as if what my patches are already doing is roughly what
> > > you're describing. The touchscreen and panel driver are really just
> > > coordinating with each other through a shared data structure (struct
> > > drm_panel_follower) that has a few callback functions. Just like with
> > > "hdmi-codec", the devices probe separately but find each other through
> > > a phandle. The coordination between the two happens through a few
> > > simple helper functions.
> >
> > I guess we very much agree on the end-goal, and I'd really like to get
> > this addressed somehow. There's a couple of things I'm not really
> > sold on with your proposal though:
> >
> >  - It creates a ad-hoc KMS API for some problem that looks fairly
> >    generic. It's also redundant with the notifier mechanism without
> >    using it (probably for the best though).
> >
> >  - MIPI-DSI panel probe sequence is already fairly complex and fragile
> >    (See https://www.kernel.org/doc/html/latest/gpu/drm-kms-helpers.html=
#special-care-with-mipi-dsi-bridges).
> >    I'd rather avoid creating a new dependency in that graph.
> >
> >  - And yeah, to some extent it's inconsistent with how we dealt with
> >    secondary devices in KMS so far.
>=20
> Hmmmm. To a large extent, my current implementation actually has no
> impact on the DRM probe sequence. The panel itself never looks for the
> touchscreen code and everything DRM-related can register without a
> care in the world. From reading your bullet points, I guess that's
> both a strength and a weakness of my current proposal. It's really
> outside the world of bridge chains and DRM components which makes it a
> special snowflake that people need to understand on its own. ...but,
> at the same time, the fact that it is outside all the rest of that
> stuff means it doesn't add complexity to an already complex system.
>=20
> I guess I'd point to the panel backlight as a preexisting design
> that's not totally unlike what I'm doing. The backlight is not part of
> the DRM bridge chain and doesn't fit in like other components. This
> actually makes sense since the backlight doesn't take in or put out
> video data and it's simply something associated with the panel. The
> backlight also has a loose connection to the panel driver and a given
> panel could be associated with any number of different backlight
> drivers depending on the board design. I guess one difference between
> the backlight and what I'm doing with "panel follower" is that we
> typically don't let the panel probe until after the backlight has
> probed. In the case of my "panel follower" proposal it's the opposite.
> As per above, from a DRM probe point of view this actually makes my
> proposal less intrusive. I guess also a difference between backlight
> and "panel follower" is that I allow an arbitrary number of followers
> but there's only one backlight.
>=20
> One additional note: if I actually make the panel probe function start
> registering the touchscreen, that actually _does_ add more complexity
> to the already complex DRM probe ordering. It's yet another thing that
> could fail and/or defer...
>=20
> Also, I'm curious: would my proposal be more or less palatable if I
> made it less generic? Instead of "panel follower", I could hardcode it
> to "touchscreen" and then remove all the list management. From a DRM
> point of view this would make it even more like the preexisting
> "backlight" except for the ordering difference.

No, that's fine. I guess I don't have any objections to your work, so
feel free to send a v2 :)

Maxime

--k3mpzbb6xqnkqo6k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZJVhCgAKCRDj7w1vZxhR
xW+5APwJp/mnUVm6p+WU2acbD2UpQ96WlsVnv+rw+bcWT7s5PAEAmMPgVJKB18RU
kj8QoiN4WNWP0PvCrWcYPAvffCfYeA4=
=WfaZ
-----END PGP SIGNATURE-----

--k3mpzbb6xqnkqo6k--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B4472E274
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 14:06:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E933B10E259;
	Tue, 13 Jun 2023 12:06:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B7F10E06A
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 12:06:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F016361FC3;
 Tue, 13 Jun 2023 12:06:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5685C433EF;
 Tue, 13 Jun 2023 12:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686657983;
 bh=BIozQFeKN2aJ2jZ8p8QET0oaMrJoGdkmGxw7siSplFg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OkR4DKQ0GbOQL2zHAL3MwYkCx8Z06jPZxzdYzUjNUfgLdd8hdRv3F2M0ytfUApHAE
 isEoOaYSdyvNDdEf8lvBBirbqd7P7N6drBz6wAB/xuXD/Mcb5JFutURj8ZLagV9wYi
 k1f983F/a4l32CQzltJbP9wyAxhUpSkEZXlED73KePN7e1xNwTBpjtSA2O312iDzb1
 7hoNLZYBbNaNmdCLFEA+9mPbHz0vQCrpNQgoXvZRgD8YROuDpaxhh40KLNA0pNKPCE
 KQDe3cxh0+li6i7tTY9CR/xZZ59de+lv7wXvTcfFT+8CDa/w5X4NDszYWZGH7526sg
 foa38RB5gH6GQ==
Date: Tue, 13 Jun 2023 14:06:20 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 00/10] drm/panel and i2c-hid: Allow panels and
 touchscreens to power sequence together
Message-ID: <boqzlmbrp5rvepmckkqht4h5auspjlbt5leam4xivy7a4bqxnj@iuxxhooxcphk>
References: <20230607215224.2067679-1-dianders@chromium.org>
 <jehxiy3z4aieop5qgzmlon4u76n7gvt3kc6knxhb5yqkiz3rsp@mx27m75sx43r>
 <CAD=FV=Wr7Xatw1LsofiZ5Xx7WBvAuMMdq4D5Po1yJUC1VdtZdg@mail.gmail.com>
 <z7wi4z4lxpkhvooqhihlkpubyvueb37gvrpmwk6v7xwj2lm6jn@b7rwyr5ic5x5>
 <CAD=FV=XnANRM=+2D9+DzcXx9Gw6iKKQsgkAiq8=izNEN-91f_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yl5nvno6lnks7ke3"
Content-Disposition: inline
In-Reply-To: <CAD=FV=XnANRM=+2D9+DzcXx9Gw6iKKQsgkAiq8=izNEN-91f_Q@mail.gmail.com>
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


--yl5nvno6lnks7ke3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2023 at 02:13:46PM -0700, Doug Anderson wrote:
> Hi,
>=20
> On Mon, Jun 12, 2023 at 9:03=E2=80=AFAM Maxime Ripard <mripard@kernel.org=
> wrote:
> >
> > > > I guess we can have
> > > > something much simpler with a bunch of helpers that would register a
> > > > i2c-hid device and would be called by the panel driver itself.
> > > >
> > > > And then, since everything is self-contained managing the power sta=
te
> > > > becomes easier as well.
> > >
> > > Can you give me more details about how you think this would work?
> > >
> > > When you say that the panel would register an i2c-hid device itself,
> > > do you mean that we'd do something like give a phandle to the i2c bus
> > > to the panel and then the panel would manually instantiate the i2c-hid
> > > device on it? ...and I guess it would need to be a "subclass" of
> > > i2c-hid that knew about the connection to the panel code? This
> > > subclass and the panel code would communicate with each other about
> > > power sequencing needs through some private API (like MFD devices
> > > usually do?). Assuming I'm understanding correctly, I think that could
> > > work.
> >
> > I guess what I had in mind is to do something similar to what we're
> > doing with hdmi-codec already for example.
>=20
> By this you mean "rockchip,hdmi-codec" and "mediatek,hdmi-codec", right?

No, sorry it was a bit ambiguous. I meant how we instantiate the
hdmi-codec driver here for example:

https://elixir.bootlin.com/linux/v6.3.7/source/drivers/gpu/drm/exynos/exyno=
s_hdmi.c#L1665
https://elixir.bootlin.com/linux/v6.3.7/source/drivers/gpu/drm/vc4/vc4_hdmi=
=2Ec#L2539
https://elixir.bootlin.com/linux/v6.3.7/source/drivers/gpu/drm/tegra/hdmi.c=
#L1525

> > We have several logical components already, in separate drivers, that
> > still need some cooperation.
> >
> > If the panel and touchscreen are on the same i2c bus, I think we could
> > even just get a reference to the panel i2c adapter, get a reference, and
> > pass that to i2c-hid (with a nice layer of helpers).
>=20
> Just for reference: the panel and touchscreen aren't on the same i2c
> bus. In the cases that I've looked at the panel is either controlled
> entirely by eDP or MIPI signals and isn't on any i2c bus at all. The
> touchscreen is on the i2c bus in the cases I've looked at, though I
> suppose I could imagine one that used a different bus.

Ok, so we would indeed need a phandle to the i2c controller

> > What I'm trying to say is: could we just make it work by passing a bunch
> > of platform_data, 2-3 callbacks and a device registration from the panel
> > driver directly?
>=20
> I think I'm still confused about what you're proposing. Sorry! :( Let
> me try rephrasing why I'm confused and perhaps we can get on the same
> page. :-)
>=20
> First, I guess I'm confused about how you have one of these devices
> "register" the other device.
>=20
> I can understand how one device might "register" its sub-devices in
> the MFD case. To make it concrete, we can look at a PMIC like
> max77686.c. The parent MFD device gets probed and then it's in charge
> of creating all of its sub-devices. These sub-devices are intimately
> tied to one another. They have shared data structures and can
> coordinate power sequencing and whatnot. All good.

We don't necessarily need to use MFD, but yeah, we could just register a
device for the i2c-hid driver to probe from (using
i2c_new_client_device?)

> ...but here, we really have something different in two fundamental ways:
>=20
> a) In this case, the two components (panel and touchscreen) both use
> separate primary communication methods. In DT the primary
> communication method determines where the device is described in the
> hierarchy. For eDP, this means that the DT node for the panel should
> be under the eDP controller. For an i2c touchscreen, this means that
> the DT node for the touchscreen should be under the i2c controller.
> Describing things like this causes the eDP controller to "register"
> the panel and the i2c controller to "register" the touchscreen. If we
> wanted the panel driver to "register" the touchscreen then it would
> get really awkward. Do we leave the touchscreen DT node under the i2c
> controller but somehow tell the i2c subsytem not to register it? Do we
> try to dynamically construct the touchscreen i2c node? Do we make a
> fake i2c controller under our panel DT node and somehow tell the i2c
> core to look at it?

I would expect not to have any DT node for the touchscreen, but we would
register a new i2c device on the bus that it's connected to.

In essence, it's also fairly similar to what we're doing with
i2c_new_ancillary_device() on some bridges. Except the primary device
isn't necessarily controlled through the I2C bus (but could be, I'm
pretty sure we have that situation for RGB or LVDS panels too).

The plus side would also be that we don't really need a DT to make it
work either. We just need the panel driver to probe somehow and a
pointer to the i2c_adapter.

> b) Things are different because the two devices here are not nearly as
> intimately tied to one another. At least in the case of "homestar",
> the only reason that the devices were tied to one another was because
> the board designers chose to share power rails, but otherwise the
> drivers were both generic.

Yeah, and that's fine I guess?

> In any case, is there any chance that we're in violent agreement

Is it even violent? Sorry if it came across that way, it's really isn't
on my end.

> and that if you dig into my design more you might like it? Other than
> the fact that the panel doesn't "register" the touchscreen device, it
> kinda sounds as if what my patches are already doing is roughly what
> you're describing. The touchscreen and panel driver are really just
> coordinating with each other through a shared data structure (struct
> drm_panel_follower) that has a few callback functions. Just like with
> "hdmi-codec", the devices probe separately but find each other through
> a phandle. The coordination between the two happens through a few
> simple helper functions.

I guess we very much agree on the end-goal, and I'd really like to get
this addressed somehow. There's a couple of things I'm not really
sold on with your proposal though:

 - It creates a ad-hoc KMS API for some problem that looks fairly
   generic. It's also redundant with the notifier mechanism without
   using it (probably for the best though).

 - MIPI-DSI panel probe sequence is already fairly complex and fragile
   (See https://www.kernel.org/doc/html/latest/gpu/drm-kms-helpers.html#spe=
cial-care-with-mipi-dsi-bridges).
   I'd rather avoid creating a new dependency in that graph.

 - And yeah, to some extent it's inconsistent with how we dealt with
   secondary devices in KMS so far.

Maxime

--yl5nvno6lnks7ke3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZIhbvAAKCRDj7w1vZxhR
xXIAAQCiA6UpybaCLDHQkulMGBLH5FKxWq5xq17fc71pttcy+AEA8RVO666uTh5l
w20OfxJELeyiCmUVWLP2lpv8iqIY9Q4=
=cOpc
-----END PGP SIGNATURE-----

--yl5nvno6lnks7ke3--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FF77EEF44
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 10:52:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E6C10E739;
	Fri, 17 Nov 2023 09:52:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F4FC10E739
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 09:52:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 81D3B61CC1;
 Fri, 17 Nov 2023 09:52:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5940C433C8;
 Fri, 17 Nov 2023 09:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700214746;
 bh=e2z5EMr6FCn2C9zht/MhpP6zwsy6ds3cEVm9SxjeNFQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WdGxFaiUbS/AXp/E94wu62V9kYbiyG4i6SfuldSKbgMqt/WmXPOojCotxb0ygNJDk
 7s4eSOU+bxIB2/NMGiHO0SBQTHYEXvZDiDi43EQmmBJUv1Km7JrayqoTrAmr0N9jk8
 ZGnq0R+ksber/D9G5ZjQwjkNR5lkC38Yv68cFHeLoet8b/4+Tsp2mMF762CeJZ4pn/
 L3kb0cIc5N/htVl0Y1LJ0xwi9KIdaY79Rffm7rh3FOmeucReC0va7D207bkN/VYSwx
 zY9eCM8zwc4rlyHZ3nVDM3Uc17NcD5LaDIj3PbpBq6VRX03OfLLUZz6Mupbl0NfVFg
 udyJ1x2mpTOaw==
Date: Fri, 17 Nov 2023 10:52:23 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: Re: [PATCH 8/8] drm/bridge: it66121: Allow link this driver as a lib
Message-ID: <xnamb346y56gviu6n3kqdrmbm6piaypf6kxeefm7bhou2yqqhd@w7tvtmmgh2j5>
References: <20231114150130.497915-1-sui.jingfeng@linux.dev>
 <20231114150130.497915-9-sui.jingfeng@linux.dev>
 <CAA8EJprQq3aDhzE+yKGZ2-nsuHWcptzMvApsyOi9D63PgeiZ3w@mail.gmail.com>
 <1b59d647-c345-4260-b07b-22abb70ae17a@linux.dev>
 <CAA8EJppY2+ymX0kLY+cuR=SV1Po2J24r=NQecmb3ZhSE9NHG7Q@mail.gmail.com>
 <7b85d057-3d66-435a-a657-dd69067b6bef@linux.dev>
 <b9eacd91-8d6f-4265-931e-bc31cadd54d4@linux.dev>
 <CAA8EJpo1KhzTpaSqjbOuQvNKw4WGaqrtNBtNfdNLn28eZVgwhw@mail.gmail.com>
 <61f1dc2f-84f8-4f04-8348-7a4470a1276c@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="y4yamxv4wyjgt2qh"
Content-Disposition: inline
In-Reply-To: <61f1dc2f-84f8-4f04-8348-7a4470a1276c@linux.dev>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Sui Jingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phong LE <ple@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--y4yamxv4wyjgt2qh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 17, 2023 at 01:18:49AM +0800, Sui Jingfeng wrote:
>=20
> On 2023/11/16 23:23, Dmitry Baryshkov wrote:
> > On Thu, 16 Nov 2023 at 14:08, Sui Jingfeng <sui.jingfeng@linux.dev> wro=
te:
> > >=20
> > > On 2023/11/16 19:53, Sui Jingfeng wrote:
> > > > Hi,
> > > >=20
> > > >=20
> > > > On 2023/11/16 19:29, Dmitry Baryshkov wrote:
> > > > > On Thu, 16 Nov 2023 at 13:18, Sui Jingfeng <sui.jingfeng@linux.de=
v>
> > > > > wrote:
> > > > > > Hi,
> > > > > >=20
> > > > > >=20
> > > > > > On 2023/11/15 00:30, Dmitry Baryshkov wrote:
> > > > > > > > +
> > > > > > > > +               ctx->connector =3D connector;
> > > > > > > > +       }
> > > > > > > >=20
> > > > > > > >            if (ctx->info->id =3D=3D ID_IT66121) {
> > > > > > > >                    ret =3D regmap_write_bits(ctx->regmap,
> > > > > > > > IT66121_CLK_BANK_REG,
> > > > > > > > @@ -1632,16 +1651,13 @@ static const char * const
> > > > > > > > it66121_supplies[] =3D {
> > > > > > > >            "vcn33", "vcn18", "vrf12"
> > > > > > > >     };
> > > > > > > >=20
> > > > > > > > -static int it66121_probe(struct i2c_client *client)
> > > > > > > > +int it66121_create_bridge(struct i2c_client *client, bool
> > > > > > > > of_support,
> > > > > > > > +                         bool hpd_support, bool audio_supp=
ort,
> > > > > > > > +                         struct drm_bridge **bridge)
> > > > > > > >     {
> > > > > > > > +       struct device *dev =3D &client->dev;
> > > > > > > >            int ret;
> > > > > > > >            struct it66121_ctx *ctx;
> > > > > > > > -       struct device *dev =3D &client->dev;
> > > > > > > > -
> > > > > > > > -       if (!i2c_check_functionality(client->adapter,
> > > > > > > > I2C_FUNC_I2C)) {
> > > > > > > > -               dev_err(dev, "I2C check functionality faile=
d.\n");
> > > > > > > > -               return -ENXIO;
> > > > > > > > -       }
> > > > > > > >=20
> > > > > > > >            ctx =3D devm_kzalloc(dev, sizeof(*ctx), GFP_KERN=
EL);
> > > > > > > >            if (!ctx)
> > > > > > > > @@ -1649,24 +1665,19 @@ static int it66121_probe(struct i2c=
_client
> > > > > > > > *client)
> > > > > > > >=20
> > > > > > > >            ctx->dev =3D dev;
> > > > > > > >            ctx->client =3D client;
> > > > > > > > -       ctx->info =3D i2c_get_match_data(client);
> > > > > > > > -
> > > > > > > > -       ret =3D it66121_of_read_bus_width(dev, &ctx->bus_wi=
dth);
> > > > > > > > -       if (ret)
> > > > > > > > -               return ret;
> > > > > > > > -
> > > > > > > > -       ret =3D it66121_of_get_next_bridge(dev, &ctx->next_=
bridge);
> > > > > > > > -       if (ret)
> > > > > > > > -               return ret;
> > > > > > > > -
> > > > > > > > -       i2c_set_clientdata(client, ctx);
> > > > > > > >            mutex_init(&ctx->lock);
> > > > > > > >=20
> > > > > > > > -       ret =3D devm_regulator_bulk_get_enable(dev,
> > > > > > > > ARRAY_SIZE(it66121_supplies),
> > > > > > > > - it66121_supplies);
> > > > > > > > -       if (ret) {
> > > > > > > > -               dev_err(dev, "Failed to enable power suppli=
es\n");
> > > > > > > > -               return ret;
> > > > > > > > +       if (of_support) {
> > > > > > > > +               ret =3D it66121_of_read_bus_width(dev,
> > > > > > > > &ctx->bus_width);
> > > > > > > > +               if (ret)
> > > > > > > > +                       return ret;
> > > > > > > > +
> > > > > > > > +               ret =3D it66121_of_get_next_bridge(dev,
> > > > > > > > &ctx->next_bridge);
> > > > > > > > +               if (ret)
> > > > > > > > +                       return ret;
> > > > > > > > +       } else {
> > > > > > > > +               ctx->bus_width =3D 24;
> > > > > > > > +               ctx->next_bridge =3D NULL;
> > > > > > > >            }
> > > > > > > A better alternative would be to turn OF calls into fwnode ca=
lls and
> > > > > > > to populate the fwnode properties. See
> > > > > > > drivers/platform/x86/intel/chtwc_int33fe.c for example.
> > > > > > Honestly, I don't want to leave any scratch(breadcrumbs).
> > > > > > I'm worries about that turn OF calls into fwnode calls will lea=
ve
> > > > > > something unwanted.
> > > > > >=20
> > > > > > Because I am not sure if fwnode calls will make sense in the DT
> > > > > > world, while my patch
> > > > > > *still* be useful in the DT world.
> > > > > fwnode calls work for both DT and non-DT cases. In the DT case th=
ey
> > > > > work with DT nodes and properties. In the non-DT case, they work =
with
> > > > > manually populated properties.
> > > > >=20
> > > > > > Because the newly introduced it66121_create_bridge()
> > > > > > function is a core. I think It's better leave this task to a mo=
re
> > > > > > advance programmer.
> > > > > > if there have use case. It can be introduced at a latter time,
> > > > > > probably parallel with
> > > > > > the DT.
> > > > > >=20
> > > > > > I think DT and/or ACPI is best for integrated devices, but it66=
121
> > > > > > display bridges is
> > > > > > a i2c slave device. Personally, I think slave device shouldn't =
be
> > > > > > standalone. I'm more
> > > > > > prefer to turn this driver to support hot-plug, even remove the
> > > > > > device on the run time
> > > > > > freely when detach and allow reattach. Like the I2C EEPROM devi=
ce in
> > > > > > the monitor (which
> > > > > > contains the EDID, with I2C slave address 0x50). The I2C EEPROM
> > > > > > device *also* don't has
> > > > > > a corresponding struct device representation in linux kernel.
> > > > > It has. See i2c_client::dev.
> > > > No, what I mean is that there don't have a device driver for
> > > > monitor(display) hardware entity.
> > > > And the drm_do_probe_ddc_edid() is the static linked driver, which =
is
> > > > similar with the idea
> > > > this series want to express.
> > Because the monitor is not a part of the display pipeline.
> >=20
> I think the monitor *is definitely* part of the display pipeline, and it
> is the most important part of the entire display pipeline.
>=20
> 1)
>=20
> DPMS, self-refreshing, display timings, resolutions supported, HDR, DSC,
> gsync and freesync etc can be part of whole mode-set. Please consider
> what the various ->mode_valid() and -> the atomic_check() are for?
>=20
> 2)
>=20
> If the monitor is not a part of the display pipeline, then the various
> display panels hardware should also not be part of the display pipeline.
> Because they are all belong to display category.
> the monitor =3D panel + panel drive IC(such as RTD2281CL, HT1622, ssd130x=
).

To expand further on that, I guess one of the key difference is that you
don't really expect to interact with the EEPROM, you'll only read it,
which is fairly different from your bridge.

And if someone wanted to instatiate nvmem devices for the various
EEPROMs in the monitor, I would very much welcome that change.

Maxime

--y4yamxv4wyjgt2qh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZVc31wAKCRDj7w1vZxhR
xYZpAQDC+NBYUdhGqkywRq2u3ZurPDRJLEi6r6pPCyo4kOgR1wD/YaNMcJ0ZKaji
XNixAiiJmE+scOKOyWwoXI53pUQcqQ8=
=T/V1
-----END PGP SIGNATURE-----

--y4yamxv4wyjgt2qh--

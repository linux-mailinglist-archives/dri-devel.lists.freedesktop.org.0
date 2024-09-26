Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5569B9874EA
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 15:58:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CAD210EB5F;
	Thu, 26 Sep 2024 13:58:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oj7n3S/e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A78D10EB5F
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 13:58:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DA1965C5EE0;
 Thu, 26 Sep 2024 13:58:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C997C4CEC6;
 Thu, 26 Sep 2024 13:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727359094;
 bh=kBvN9cGMEurWhh8TzHMy8VeOxvub6a3MAU2ernR+bag=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oj7n3S/eeJ8dhqTRESEi/32JgUN0NAsCjeP8GOfO1w+Gx5SkYLYxKicrTaIh6elRe
 CzGq2/iTV5dDbS0YKamvbIWUx4YVs43pbAMe/D5NYNjIIkSskjTom8SidUCpdgNRWi
 LImHnSlF6y3zQGGeb+oqje544CNB0GsKP/mjLvfMIXVRFGKDyfFz7bCoQle/I2jm8s
 CRaFbkW7PGQf0yS1IliKov3x99KP8we2ssHTRXTG5J43H9Rx/hkzt9lWjQw5iMuOra
 qLTibnHFikdZvH6uBokn3bfc80l2kyu1HOJ3yWDQxdaEn/b6Yw3qhqNagGIfuWFgv5
 gN6i6Kj1wU9DQ==
Date: Thu, 26 Sep 2024 15:58:11 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Manikandan.M@microchip.com, neil.armstrong@linaro.org, 
 quic_jesszhan@quicinc.com, airlied@gmail.com, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, 
 conor+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Dharma.B@microchip.com
Subject: Re: [PATCH v2 2/2] drm/panel: simple: Add Microchip AC69T88A LVDS
 Display panel
Message-ID: <20240926-foamy-oarfish-of-passion-ec6fa2@houat>
References: <20240919091548.430285-1-manikandan.m@microchip.com>
 <20240919091548.430285-2-manikandan.m@microchip.com>
 <zognzunciriytm3uvoolxjsvu43v3m2lnctsz5swusnmm3aj2z@ag7zkncccdmf>
 <83e9d20d-f294-4303-b570-816ebc989bcf@microchip.com>
 <f4z2egmrcoh7kih2pyr3mq7fzuwtvod6vxlzzim2iw3ly7jcr3@2uxiyzlfixhp>
 <17b5a11c-b9a8-4172-831e-d52f1a4270e9@microchip.com>
 <quxjqmx5yc27cxmjvnq6irltr36josag4yltxbiweh4femqbqo@j34pxmfxglc5>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="nwxok5rybyzngc7q"
Content-Disposition: inline
In-Reply-To: <quxjqmx5yc27cxmjvnq6irltr36josag4yltxbiweh4femqbqo@j34pxmfxglc5>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--nwxok5rybyzngc7q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 04:32:59PM GMT, Dmitry Baryshkov wrote:
> On Thu, Sep 26, 2024 at 08:17:09AM GMT, Manikandan.M@microchip.com wrote:
> > On 23/09/24 11:37 am, Dmitry Baryshkov wrote:
> > > EXTERNAL EMAIL: Do not click links or open attachments unless you kno=
w the content is safe
> > >=20
> > > On Mon, Sep 23, 2024 at 05:50:22AM GMT, Manikandan.M@microchip.com wr=
ote:
> > >> On 20/09/24 9:13 pm, Dmitry Baryshkov wrote:
> > >>> EXTERNAL EMAIL: Do not click links or open attachments unless you k=
now the content is safe
> > >>>
> > >>> On Thu, Sep 19, 2024 at 02:45:48PM GMT, Manikandan Muralidharan wro=
te:
> > >>>> Add support for Microchip AC69T88A 5 inch TFT LCD 800x480
> > >>>> Display module with LVDS interface.The panel uses the Sitronix
> > >>>> ST7262 800x480 Display driver
> > >>>
> > >>> AC69T88A seems to be a module name, rather than a panel name. What =
is
> > >>> the actual panel name present on this module?
> > >> Both names, "Microchip AC69T88A" and "MPU32-LVDS-DISPLAY-WVGA" are
> > >> present on the display module
> > >=20
> > > Which panel was used for the module? I don't think that Microchip
> > > produces LVDS panels.
> > Its a new LVDS display from Microchip that uses Sitronix ST7262 TFT LCD=
=20
> > driver
> >=20
> > https://www.crystalfontz.com/controllers/datasheet-viewer.php?id=3D486
>=20
> Ok. Anyway if somebody ends up looking for the panel, they'll probably
> find the module and vice versa.
>=20
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Given that aside from that mail, the module name isn't mentionned
anywhere, I'm not sure they would.

The way we usually deal with controllers is to have a separate driver
for panels based on that controller, even more so since that controller
seems to be able to affect the display.

Maxime

--nwxok5rybyzngc7q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZvVocwAKCRAnX84Zoj2+
dkWSAX9uTIkjmWmHidYR8RI+SHflvLYoq1mHYHmx0FKy/H5CLsNsXxl1N04pR/rl
GbDENO4BgMvc1UyrpreNjD7xtbJ664F0LkjLMBwZHFQUloyUm+10s2oyYzHgkAgp
DNKQgfI3/A==
=4/es
-----END PGP SIGNATURE-----

--nwxok5rybyzngc7q--

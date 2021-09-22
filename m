Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C9041444F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 10:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B495B6EB1E;
	Wed, 22 Sep 2021 08:57:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 559806EB1E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 08:57:13 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id B6DFA5802BF;
 Wed, 22 Sep 2021 04:57:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 22 Sep 2021 04:57:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=7nh2OaBNhdhEMW4Zegg2B+NrTP1
 XdzNcvYRzKw/Wl3A=; b=iDcMKwn+bqpWf7dTIYyvIdo5u50WHQ77/X5wGm8aFjj
 yIFnv0UI7UtjodhdrtTfJ5/zJwytzywdyoiXiDkl5RH3su/erphOJKSOkQLgmcjU
 2BjSf5QFwfSq4BmkK0SI/3Dz0XFf7e2/NEsLrACFmUqaX7FqFA2B0NQ9mESU+wJ5
 RXIeymf3yEMh/1ZJP298CIjUncAc9SR5fdjtQNf0gAnZcyeNNwHXxNSUF7UgYtXA
 /L/jLwttiF+2ndwKedSLBR/E8W1zFMotYmTRKkdnCoQsVGC9aBOUWTGDlCDpGFcB
 cd7WKxASYb1BQRXXN34+7ERBXxC8+Np7k22QtgwXDWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=7nh2Oa
 BNhdhEMW4Zegg2B+NrTP1XdzNcvYRzKw/Wl3A=; b=kmUrzeGSSyw5nyDhY/0Ztg
 2JfLH4xedbJ9le3sOOwZFApcu0D+nGDP/LskhUAtvY3nTbNTdZiR5lxaACr3Ny+z
 LOK67SdXIc3VUjKESo2WEtE1N/5gwSdXQpjlKCn0mnjCo5RHct3Y0kmumxi3lLqt
 2trrk2DxeqFjFK3x4kwrA/JiDTayW523QK8et/Ee4GvRyYlq5cicMEvcgdF5q6i4
 MhpOh37Z2MDs/WTO4FQS2DrrPw4URj7e6E7vqKnSdZwSRMY3be4lue2tjY+UBV39
 hRsF1DdgclU8woYnQwAX2u6UgLA4l9lhPDqD6yFcK2Y5cW0CKqCXKq4REIBLjY/A
 ==
X-ME-Sender: <xms:5u9KYUHHpgHPYCJLvfOaAMv5cwjflEqcL2JmBw7C9Vzx56UUcgOfTg>
 <xme:5u9KYdVY6eCMVMC5sedDGBqA8pCoNBquJNTnNwXafWD2MAItROEt2_V_ieD7I2i-M
 riQO5v4bcf2hToFtBY>
X-ME-Received: <xmr:5u9KYeKI5vqbyrT9hf96H1CSJrDnc8ZmHVzAMtZGO7ZsQ12EP9Db5nVQe7j1kRzYLrvY0VinAH_9T8n0XlVnYJawzAj7dZdUJOkD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeijedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepuddvudfhkeekhefgffetffelgffftdehffduffegveetffehueeivddvjedv
 gfevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:5u9KYWHAXmTPeGMK2WUkDxfD23AHx5m7l7BRETz0_L-jOzDGuV4dHA>
 <xmx:5u9KYaXT3pB5F9rGBBYpbF79jvZbT38tkQqmtB3wKw_Fp8n_pqdIJg>
 <xmx:5u9KYZP3CJTkdRA5K5T9QqOMI_V4BDOuQUme-F-2U0dr3LmfMCUOdw>
 <xmx:6O9KYdrtARzZVcrde821ZotQ8wHBzELXuK7ca6IVc2HciGwi176qEQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Sep 2021 04:57:10 -0400 (EDT)
Date: Wed, 22 Sep 2021 10:57:07 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@intel.com>, 
 David Airlie <airlied@linux.ie>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,	Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>,	linux-kernel@vger.kernel.org,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Tian Tao <tiantao6@hisilicon.com>, Inki Dae <inki.dae@samsung.com>,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 John Stultz <john.stultz@linaro.org>, Chen Feng <puck.chen@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH v4 02/24] drm/bridge: Document the probe issue with
 MIPI-DSI bridges
Message-ID: <20210922085707.dr3fautmyowof7cr@gilmour>
References: <20210910101218.1632297-1-maxime@cerno.tech>
 <CGME20210910101246eucas1p17191a80c37b0e1784d6d9b8bf6fbcd60@eucas1p1.samsung.com>
 <20210910101218.1632297-3-maxime@cerno.tech>
 <7ad18d53-3ad6-a614-a8e1-cce6505f90a8@samsung.com>
 <20210914143541.433ucx2kvz36tw42@gilmour>
 <e5ec9763-37fe-6cd8-6eca-52792afbdb94@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ogv2yceu2bvyarnp"
Content-Disposition: inline
In-Reply-To: <e5ec9763-37fe-6cd8-6eca-52792afbdb94@samsung.com>
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


--ogv2yceu2bvyarnp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Sep 14, 2021 at 09:00:28PM +0200, Andrzej Hajda wrote:
>=20
> W dniu 14.09.2021 o=A016:35, Maxime Ripard pisze:
> > Hi,
> >
> > On Mon, Sep 13, 2021 at 08:29:37AM +0200, Andrzej Hajda wrote:
> >> W dniu 10.09.2021 o=A012:11, Maxime Ripard pisze:
> >>> Interactions between bridges, panels, MIPI-DSI host and the component
> >>> framework are not trivial and can lead to probing issues when
> >>> implementing a display driver. Let's document the various cases we ne=
ed
> >>> too consider, and the solution to support all the cases.
> >>>
> >>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >>> ---
> >>>    Documentation/gpu/drm-kms-helpers.rst |  6 +++
> >>>    drivers/gpu/drm/drm_bridge.c          | 57 +++++++++++++++++++++++=
++++
> >>>    2 files changed, 63 insertions(+)
> >>>
> >>> diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gp=
u/drm-kms-helpers.rst
> >>> index 10f8df7aecc0..ec2f65b31930 100644
> >>> --- a/Documentation/gpu/drm-kms-helpers.rst
> >>> +++ b/Documentation/gpu/drm-kms-helpers.rst
> >>> @@ -157,6 +157,12 @@ Display Driver Integration
> >>>    .. kernel-doc:: drivers/gpu/drm/drm_bridge.c
> >>>       :doc: display driver integration
> >>>   =20
> >>> +Special Care with MIPI-DSI bridges
> >>> +----------------------------------
> >>> +
> >>> +.. kernel-doc:: drivers/gpu/drm/drm_bridge.c
> >>> +   :doc: special care dsi
> >>> +
> >>>    Bridge Operations
> >>>    -----------------
> >>>   =20
> >>> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridg=
e.c
> >>> index baff74ea4a33..7cc2d2f94ae3 100644
> >>> --- a/drivers/gpu/drm/drm_bridge.c
> >>> +++ b/drivers/gpu/drm/drm_bridge.c
> >>> @@ -96,6 +96,63 @@
> >>>     * documentation of bridge operations for more details).
> >>>     */
> >>>   =20
> >>> +/**
> >>> + * DOC: special care dsi
> >>> + *
> >>> + * The interaction between the bridges and other frameworks involved=
 in
> >>> + * the probing of the upstream driver and the bridge driver can be
> >>> + * challenging. Indeed, there's multiple cases that needs to be
> >>> + * considered:
> >>> + *
> >>> + * - The upstream driver doesn't use the component framework and isn=
't a
> >>> + *   MIPI-DSI host. In this case, the bridge driver will probe at so=
me
> >>> + *   point and the upstream driver should try to probe again by retu=
rning
> >>> + *   EPROBE_DEFER as long as the bridge driver hasn't probed.
> >>> + *
> >>> + * - The upstream driver doesn't use the component framework, but is=
 a
> >>> + *   MIPI-DSI host. The bridge device uses the MIPI-DCS commands to =
be
> >>> + *   controlled. In this case, the bridge device is a child of the
> >>> + *   display device and when it will probe it's assured that the dis=
play
> >>> + *   device (and MIPI-DSI host) is present. The upstream driver will=
 be
> >>> + *   assured that the bridge driver is connected between the
> >>> + *   &mipi_dsi_host_ops.attach and &mipi_dsi_host_ops.detach operati=
ons.
> >>> + *   Therefore, it must run mipi_dsi_host_register() in its probe
> >>> + *   function, and then run drm_bridge_attach() in its
> >>> + *   &mipi_dsi_host_ops.attach hook.
> >>> + *
> >>> + * - The upstream driver uses the component framework and is a MIPI-=
DSI
> >>> + *   host. The bridge device uses the MIPI-DCS commands to be
> >>> + *   controlled. This is the same situation than above, and can run
> >>> + *   mipi_dsi_host_register() in either its probe or bind hooks.
> >>> + *
> >>> + * - The upstream driver uses the component framework and is a MIPI-=
DSI
> >>> + *   host. The bridge device uses a separate bus (such as I2C) to be
> >>> + *   controlled. In this case, there's no correlation between the pr=
obe
> >>> + *   of the bridge and upstream drivers, so care must be taken to av=
oid
> >>> + *   an endless EPROBE_DEFER loop, with each driver waiting for the
> >>> + *   other to probe.
> >>> + *
> >>> + * The ideal pattern to cover the last item (and all the others in t=
he
> >>> + * MIPI-DSI host driver case) is to split the operations like this:
> >>> + *
> >>> + * - The MIPI-DSI host driver must run mipi_dsi_host_register() in i=
ts
> >>> + *   probe hook. It will make sure that the MIPI-DSI host sticks aro=
und,
> >>> + *   and that the driver's bind can be called.
> >>> + *
> >>> + * - In its probe hook, the bridge driver must try to find its MIPI-=
DSI
> >>> + *   host, register as a MIPI-DSI device and attach the MIPI-DSI dev=
ice
> >>> + *   to its host. The bridge driver is now functional.
> >>> + *
> >>> + * - In its &struct mipi_dsi_host_ops.attach hook, the MIPI-DSI host=
 can
> >>> + *   now add its component. Its bind hook will now be called and sin=
ce
> >>> + *   the bridge driver is attached and registered, we can now look f=
or
> >>> + *   and attach it.
> >>> + *
> >>> + * At this point, we're now certain that both the upstream driver and
> >>> + * the bridge driver are functional and we can't have a deadlock-like
> >>> + * situation when probing.
> >>> + */
> >>> +
> >>>    static DEFINE_MUTEX(bridge_lock);
> >>>    static LIST_HEAD(bridge_list);
> >>
> >> Nice work with documenting this initialization dance. It clearly shows
> >> that bridge API lacks better mechanism - usage of mipi dsi callbacks to
> >> get notifications about bridge appearance is ugly.
> > Yeah, there's so many moving parts it's definitely not great.
> >
> >> It remains me my resource tracking patches which I have posted long
> >> time ago [1] - they would solve the issue in much more elegant way,
> >> described here [2]. Apparently I was not stubborn enough in promoting
> >> this solution.
> > Wow, that sounds like a massive change indeed :/
> >
> >> Anyway:
> >>
> >> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
> > I assume you'll want me to hold off that patch before someone reviews
> > the rest?
>=20
> The last exynos patch should be dropped,

Done

> kirin patch should be tested/reviewed/acked by kirin maintaner. I am
> not sure about bridge patches, which ones have been tested by you, and
> which one have other users.

Rob was nice enough to give it a try last week for msm and do the needed
changes. He tested it with the sn65dsi86 bridge. John was also saying it
was on their todo list (for kirin I assume?). So hopefully it can be
fairly smooth for everyone.

I tested sn65dsi83 and ps8640 with the vc4 driver. I don't have the
hardware so it was just making sure that everything was probing
properly, but it's what we're interested in anyway.

> If yes it would be good to test them as well - changes in initialization=
=20
> flow can beat sometimes :)
>=20
> I think patches 1-4 can be merged earlier, if you like, as they are on=20
> the list for long time.

Ack, I'll merge them, thanks!
Maxime

--ogv2yceu2bvyarnp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYUrv4wAKCRDj7w1vZxhR
xQoBAP920qamAHvLMhCg5u1wp+EEFBEufqValUOHaOJZojlTCwEA/7pqFJGHB8T3
DdmJKwivFSWQ4kYOXp5/PsK5KM2l7wM=
=MG4a
-----END PGP SIGNATURE-----

--ogv2yceu2bvyarnp--

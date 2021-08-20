Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C0A3F31BB
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 18:52:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2207B6EACF;
	Fri, 20 Aug 2021 16:52:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 691916EACF
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 16:52:00 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1A33F5800F5;
 Fri, 20 Aug 2021 12:49:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 20 Aug 2021 12:49:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=s6i/N6kug4HBurK8lYVaEHfU/qC
 +w14m1meq5QcLypw=; b=jzUwFvNHSnky2fJVWMG8FeWAXiTc7zvMecWmzPZXMTW
 5rPzhaeHCgpj07VPQZxMU6qIgSFHdVUK2UqnhpwADyoH0kXGpdgwePsiTIZMU+Iq
 nlkCXjx8FVEO6E/IcFVCVnhl8zk8U0tUP5VTk7F8+CDwx8Ddn0Gp38Un86hvWuPz
 lpZCMl3Fr1lfhPIAvDUfq7lcKqPOuldU6aVSt5brTlgWRJ+KgXNpd7FQ8qnoroCL
 /LajLumexaZYZXywvsgctKAm2k1uJKYs2HZE8H44vxCWyKlccsY/27GTizTC4wQX
 b5J13f7ZuQsLawfUP+/08F/eFrUB0p9Kl/CxdBtf9Lw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=s6i/N6
 kug4HBurK8lYVaEHfU/qC+w14m1meq5QcLypw=; b=JrakuMBSCwUYelRIEix1z1
 oah9w8txJUS/EFjRMIfbQMP0tNQAuKP0YkJ/ZBwaPCkwJW2l1gycnJf4kYQRGXDE
 desxiEh0OnXOZ8JGgCog2h2Ndir0LyL0Pur9TfRUFml0MLiQtkSE8trgFg9mftyr
 Cqc0mpiFIFqF/niyT0ikwZ8X75O7agZXv2eNkRthdtRs+u9QEXr0qimLMheC/IYo
 dTVhGetGEbcSiJ+UZzYMY9VKkGuMEuuwlj+kZgAl1wZ30OLNNDyXtMiLxmyiwdxt
 6WWxIcrTj7JzLrBbJYtdyPW7/vNwKaOBA+bIUUSBbnFy69L4P1Ag4KNkwGBz63xw
 ==
X-ME-Sender: <xms:BN0fYSHlTq92E9a3SU55bxqg0LnqAosgpy57EHSX_08fqLcM8eNM7w>
 <xme:BN0fYTVR1aYUrTdzwiZWbsb_lEiE63Qu_TjtDYMduaYWy9vb-VZki45dmxfHhTy4k
 oerx8Qs7oI1pqTDBoQ>
X-ME-Received: <xmr:BN0fYcKJBXqgaf7ybw8Ju1yx43BC8uAFcfn4rfChuKW5lN_6g1KvLTcYD0-yR2vbUjAMgANy5BUnZURHrVGevmKl5-KJzJ_UH9an>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleelgddutdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:BN0fYcFf221iSe6dFZ5hRLv4vu1pLQEYxMZ6oV6CWwOJMgZ-P5q55A>
 <xmx:BN0fYYXvnr7RGmVo3RArAzKDBAaoDNEoVzWWq0M8yj-81QzBUHXDIw>
 <xmx:BN0fYfMVYJoxpkVqfK2KHcdxapaJ9L6VNkD6Qou-kKpv6mY0fMqVnQ>
 <xmx:CN0fYZs12oPsGDWlxRpC2Gvf73TyhLDDblF2P4uKWd4ih74HtPuRZg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Aug 2021 12:49:07 -0400 (EDT)
Date: Fri, 20 Aug 2021 18:49:06 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: "a.hajda" <a.hajda@samsung.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Robert Foss <robert.foss@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 0/8] drm/bridge: Make panel and bridge probe order
 consistent
Message-ID: <20210820164906.3xfxy43udc7hxflj@gilmour>
References: <20210728133229.2247965-1-maxime@cerno.tech>
 <CGME20210804140941eucas1p2d4d4ec491074530c714797523aec05ea@eucas1p2.samsung.com>
 <cc638e20-aa7c-7014-f70b-1bb68e629d87@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sbpyoycfgn424k53"
Content-Disposition: inline
In-Reply-To: <cc638e20-aa7c-7014-f70b-1bb68e629d87@samsung.com>
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


--sbpyoycfgn424k53
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrzej,

On Wed, Aug 04, 2021 at 04:09:38PM +0200, a.hajda wrote:
> Hi Maxime,
>=20
> I have been busy with other tasks, and I did not follow the list last=20
> time, so sorry for my late response.
>=20
> On 28.07.2021 15:32, Maxime Ripard wrote:
> > Hi,
> >=20
> > We've encountered an issue with the RaspberryPi DSI panel that prevente=
d the
> > whole display driver from probing.
> >=20
> > The issue is described in detail in the commit 7213246a803f ("drm/vc4: =
dsi:
> > Only register our component once a DSI device is attached"), but the ba=
sic idea
> > is that since the panel is probed through i2c, there's no synchronizati=
on
> > between its probe and the registration of the MIPI-DSI host it's attach=
ed to.
> >=20
> > We initially moved the component framework registration to the MIPI-DSI=
 Host
> > attach hook to make sure we register our component only when we have a =
DSI
> > device attached to our MIPI-DSI host, and then use lookup our DSI devic=
e in our
> > bind hook.
> >=20
> > However, all the DSI bridges controlled through i2c are only registerin=
g their
> > associated DSI device in their bridge attach hook, meaning with our cha=
nge
>=20
> I guess this is incorrect. I have promoted several times the pattern=20
> that device driver shouldn't expose its interfaces (for example=20
> component_add, drm_panel_add, drm_bridge_add) until it gathers all=20
> required dependencies. In this particular case bridges should defer=20
> probe until DSI bus becomes available. I guess this way the patch you=20
> reverts would work.
>=20
> I advised few times this pattern in case of DSI hosts, apparently I=20
> didn't notice the similar issue can appear in case of bridges. Or there=
=20
> is something I have missed???
>=20
> Anyway there are already eleven(?) bridge drivers using this pattern. I=
=20
> wonder if fixing it would be difficult, or if it expose other issues???
> The patches should be quite straightforward - move=20
> of_find_mipi_dsi_host_by_node and mipi_dsi_device_register_full to probe=
=20
> time.

I gave this a try today, went back to the current upstream code and
found that indeed it works. I converted two bridges that works now. I'll
send a new version some time next week and will convert all the others
if we agree on the approach.

Thanks for the suggestion!

> Finally I think that if we will not fix these bridge drivers we will=20
> encounter another set of issues with new platforms connecting "DSI host=
=20
> drivers assuming this pattern" and "i2c/dsi device drivers assuming=20
> pattern already present in the bridges".

Yeah, this is exactly the situation I'm in :)

Maxime

--sbpyoycfgn424k53
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYR/dAgAKCRDj7w1vZxhR
xYyIAP9QJYMcMeJKGOWtfkVHWa6UcWUgQjWFK6FrcjkrrWVtxwD/a8rMGvXmVVJq
OoGA9td4D3UANC1W0k+LCikxHGQpvwQ=
=E8Tv
-----END PGP SIGNATURE-----

--sbpyoycfgn424k53--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C836A5B29
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 15:56:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC3D10E1FE;
	Tue, 28 Feb 2023 14:56:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0096A10E1FE
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 14:56:47 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 4BF385C0040;
 Tue, 28 Feb 2023 09:56:47 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 28 Feb 2023 09:56:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1677596207; x=1677682607; bh=//kyISGwnS
 d2/XENSU0w/aoJBqe774J5Px7PyluB3vQ=; b=CKO6M0/dbNEEQnbjeLFpx1Bbcw
 XJ/1jdmtJs4dFt0wq+lhWurNqsXAYXzYOdYF1xTe0DBRhptRmpmjG2WPX4aoseee
 AIkh9ts+i/cNnZylGeFqewuIiTJoKjX+tluwOtYT7YP9qvN1/91iNBi4306G+igT
 MnTm9lc9mdFEEwSM7rSpyeBTXV75hwGWX913iP1rfg385sWw57sCutEDEGNdTtFT
 HQR/TH7UpEUZOy5XHY5AUOHK87RlkvzRPYr0hSpS9QFGhl3Dw0WAFBodWF4MceuV
 eAO4e+uZHe9o2ZHspHBAd2R9qykhTexV/POE7bJLxQoEIsR6Q20Wqxs0B77w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1677596207; x=1677682607; bh=//kyISGwnSd2/XENSU0w/aoJBqe7
 74J5Px7PyluB3vQ=; b=qW6FgtkvnUiaLk5jip160ezTp5GGtdXRH3GGgNrjpIzE
 3GLTjFf4hP5PJXa+os5zVhJgXmqAHXLSLPXNLTj09f7acavcuP39qOW5O19rpf4j
 l/aPT4x3HaQHzy+XpJbn6aW9MtWenvG5Ghl7DzYTsiXpGJiOvMC3Q6xcWSMcmoeV
 0tUqs6pHHlFBpoTnvJt4zJwogBpHtHTIBNUilzmbFqUY10D2sQRcqLP1ffyytyt7
 EU2jsy2z4xf1xYHAyxmFbjZ0R0kCm+yZ3VrS47bLUpkIFqnJWXvm2jfnMHbqm6GW
 u+SqjFJ4utqHCp0tvgQTTTHwU5P7iZz+0L01oVImvQ==
X-ME-Sender: <xms:Lhb-YygKo9zePq_GPyb1eoZF83K2X81BLIrQ7dYFvg-zrIkhN7jrHQ>
 <xme:Lhb-YzBfYcEZjLFEQwbftCLzOEDxLDLei7FnISaukpB0BuSTxS8uoKKxQwkdNBeHJ
 KHDIMhsos7sz7FNQ5Q>
X-ME-Received: <xmr:Lhb-Y6H_milBrUmqjWu2iFns1GfyXpUYv4xO0PKSRfEFccij2Jjxbv9Ni8I8DDGsj0HNJIgmjbmOe8CWf6IiqKDBoMaso7U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelfedgtdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefhjeehgedvfeeggeeiledvheduueefleduhefgudeuffefheejtddvveej
 udehffenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhn
 ohdrthgvtghh
X-ME-Proxy: <xmx:Lhb-Y7Tp-IOd_cYPxbHMLZmF9f1nklHUpJjWxXKY0kmd82IJNYIeEg>
 <xmx:Lhb-Y_z9Jpm-_aPhblBqiIbHXulG7UYgz1Ljgefa9M8brsqS2adEEg>
 <xmx:Lhb-Y54oAWuDs5DtiVdys_m0ObhDplHr6EPa0BsLiygB_Uap-IRaWQ>
 <xmx:Lxb-Y6KY8jMNE4VlOSzx0h9CEMIPQjec8Vmiq23cEJrFmdunFYO1VQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Feb 2023 09:56:45 -0500 (EST)
Date: Tue, 28 Feb 2023 15:56:43 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v13 04/18] drm: exynos: dsi: Switch to DSI panel or
 bridge find helper
Message-ID: <20230228145643.b537y4uuc4ep3epc@houat>
References: <7b59aaf9-1f72-fd9f-29ac-1857ec3f91f3@denx.de>
 <CAMty3ZC6vqpFfdh2F=KUsAgm_KCksVXBV9ON1csjJd1m+gJpVQ@mail.gmail.com>
 <6066dff9-5a66-0da5-14d9-66162a2fbb39@denx.de>
 <CAMty3ZDjwD+3SKJiOgZLbYYTtq=udWkXbqnsyYaM73rsYxDumQ@mail.gmail.com>
 <47b8ad7d-cfc1-112c-2117-cb3612c1bba5@denx.de>
 <CAMty3ZDMJFW36g5=A1=_08VT1dZUMemEg3YcQMh08iZNRa+cTw@mail.gmail.com>
 <5c10d1e6-75ce-d926-fba9-a9bf5e240895@denx.de>
 <CAMty3ZBpWd817b5Ye_AQse1zruUtWOm2E4WUz0b7a4k9mVEzEQ@mail.gmail.com>
 <20230228120447.q7k5xup6hbvagg33@houat>
 <CAMty3ZAG_zONg181mmEzx=7y7kk=kX1pObQ379d3m8_TsPzHaA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zzb427pzpp6ztjxj"
Content-Disposition: inline
In-Reply-To: <CAMty3ZAG_zONg181mmEzx=7y7kk=kX1pObQ379d3m8_TsPzHaA@mail.gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 Matteo Lisi <matteo.lisi@engicam.com>, dri-devel@lists.freedesktop.org,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, NXP Linux Team <linux-imx@nxp.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--zzb427pzpp6ztjxj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2023 at 08:09:26PM +0530, Jagan Teki wrote:
> On Tue, Feb 28, 2023 at 5:34 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > On Tue, Feb 28, 2023 at 02:08:53AM +0530, Jagan Teki wrote:
> > > On Tue, Feb 28, 2023 at 1:40 AM Marek Vasut <marex@denx.de> wrote:
> > > >
> > > > On 2/27/23 20:49, Jagan Teki wrote:
> > > > > On Tue, Feb 28, 2023 at 1:11 AM Marek Vasut <marex@denx.de> wrote:
> > > > >>
> > > > >> On 2/27/23 20:34, Jagan Teki wrote:
> > > > >>> On Tue, Feb 28, 2023 at 12:54 AM Marek Vasut <marex@denx.de> wr=
ote:
> > > > >>>>
> > > > >>>> On 2/27/23 20:15, Jagan Teki wrote:
> > > > >>>>> On Tue, Feb 28, 2023 at 12:38 AM Marek Vasut <marex@denx.de> =
wrote:
> > > > >>>>>>
> > > > >>>>>> On 2/27/23 20:01, Jagan Teki wrote:
> > > > >>>>>>> On Tue, Feb 28, 2023 at 12:25 AM Marek Vasut <marex@denx.de=
> wrote:
> > > > >>>>>>>>
> > > > >>>>>>>> On 2/27/23 12:39, Jagan Teki wrote:
> > > > >>>>>>>>> drm_of_dsi_find_panel_or_bridge is capable of looking up =
the
> > > > >>>>>>>>> downstream DSI bridge and panel and trying to add a panel=
 bridge
> > > > >>>>>>>>> if the panel is found.
> > > > >>>>>>>>>
> > > > >>>>>>>>> Replace explicit finding calls with drm_of_dsi_find_panel=
_or_bridge
> > > > >>>>>>>>> followed with drmm_panel_bridge_add.
> > > > >>>>>>>>>
> > > > >>>>>>>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > > >>>>>>>>> ---
> > > > >>>>>>>>> Changes for v13, v12, v11:
> > > > >>>>>>>>> - none
> > > > >>>>>>>>> Changes for v10:
> > > > >>>>>>>>> - new patch
> > > > >>>>>>>>>
> > > > >>>>>>>>>       drivers/gpu/drm/exynos/exynos_drm_dsi.c | 25 ++++++=
+++++++------------
> > > > >>>>>>>>>       1 file changed, 13 insertions(+), 12 deletions(-)
> > > > >>>>>>>>>
> > > > >>>>>>>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/dr=
ivers/gpu/drm/exynos/exynos_drm_dsi.c
> > > > >>>>>>>>> index df15501b1075..12a6dd987e8f 100644
> > > > >>>>>>>>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > > > >>>>>>>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > > > >>>>>>>>> @@ -25,6 +25,7 @@
> > > > >>>>>>>>>       #include <drm/drm_atomic_helper.h>
> > > > >>>>>>>>>       #include <drm/drm_bridge.h>
> > > > >>>>>>>>>       #include <drm/drm_mipi_dsi.h>
> > > > >>>>>>>>> +#include <drm/drm_of.h>
> > > > >>>>>>>>>       #include <drm/drm_panel.h>
> > > > >>>>>>>>>       #include <drm/drm_print.h>
> > > > >>>>>>>>>       #include <drm/drm_probe_helper.h>
> > > > >>>>>>>>> @@ -1470,24 +1471,26 @@ static int exynos_dsi_host_attach=
(struct mipi_dsi_host *host,
> > > > >>>>>>>>>           struct device *dev =3D dsi->dev;
> > > > >>>>>>>>>           struct drm_encoder *encoder =3D &dsi->encoder;
> > > > >>>>>>>>>           struct drm_device *drm =3D encoder->dev;
> > > > >>>>>>>>> +     struct drm_bridge *bridge;
> > > > >>>>>>>>>           struct drm_panel *panel;
> > > > >>>>>>>>>           int ret;
> > > > >>>>>>>>>
> > > > >>>>>>>>> -     panel =3D of_drm_find_panel(device->dev.of_node);
> > > > >>>>>>>>> -     if (!IS_ERR(panel)) {
> > > > >>>>>>>>> -             dsi->out_bridge =3D devm_drm_panel_bridge_a=
dd(dev, panel);
> > > > >>>>>>>>> -     } else {
> > > > >>>>>>>>> -             dsi->out_bridge =3D of_drm_find_bridge(devi=
ce->dev.of_node);
> > > > >>>>>>>>> -             if (!dsi->out_bridge)
> > > > >>>>>>>>> -                     dsi->out_bridge =3D ERR_PTR(-EINVAL=
);
> > > > >>>>>>>>> -     }
> > > > >>>>>>>>
> > > > >>>>>>>> As far as I understand this from my conversation with Maxi=
me (please put
> > > > >>>>>>>> him on CC of V15), the change here should instead perform =
the panel look
> > > > >>>>>>>> up NOT in exynos_dsi_host_attach() , but in exynos_dsi_bin=
d() , i.e. in
> > > > >>>>>>>> the component_ops .bind callback . Here is an example of c=
orrect
> > > > >>>>>>>> implementation:
> > > > >>>>>>>>
> > > > >>>>>>>> https://cgit.freedesktop.org/drm-misc/tree/drivers/gpu/drm=
/vc4/vc4_dsi.c#n1805
> > > > >>>>>>>
> > > > >>>>>>> But, we don't have component_ops.bind for imx8m case, so wh=
ere do we
> > > > >>>>>>> want to place the panel hook?
> > > > >>>>>>>
> > > > >>>>>>> Exynos drm drivers are component-based but, imx8mm is not.
> > > > >>>>>>
> > > > >>>>>> In 14/18 patch, the same should be added to generic_dsim_reg=
ister_host()
> > > > >>>>>> , which is called from the driver .probe() callback, but tha=
t is OK.
> > > > >>>>>>
> > > > >>>>>> That's ^ is the iMX part.
> > > > >>>>>
> > > > >>>>> Ohh. You mean, we need to find the panel hook separately in t=
wo places like
> > > > >>>>> - bind for exynos
> > > > >>>>> - probe for imx8mm
> > > > >>>>
> > > > >>>> Yes
> > > > >>>>
> > > > >>>>> If so? how can I find the drm_device pointer in the probe?
> > > > >>>>
> > > > >>>> What for ? The panel lookup uses OF graph . Where do you need =
the
> > > > >>>> drm_device in it ?
> > > > >>>
> > > > >>> May I can summarize the whole setback here so that everybody is=
 on the
> > > > >>> same page and find the proper solution?
> > > > >>>
> > > > >>> The key blocker is accessing the DRM pointer in order to use the
> > > > >>> DRM-managed action helper.
> > > > >>>
> > > > >>> 1. If we find the panel hook in Exynos component_ops.bind then =
we can
> > > > >>> use the DRM pointer directly as VC4 does.
> > > > >>> 2. if we find the panel hook in Samsung drm_bridge_funcs.attach=
 (for
> > > > >>> imx8mm) then we can use the DRM pointer directly via bridge->de=
v.
> > > > >>>
> > > > >>> If we make 2) has common across like finding the panel hook in
> > > > >>> drm_bridge_funcs.attach the Exynos drm pipeline cannot find the
> > > > >>> panels.
> > > > >>>
> > > > >>> The common solution for both exynos and imx8m is host.attach bu=
t if we
> > > > >>> do so we cannot get find the DRM pointer.
> > > > >>
> > > > >> There isn't going to be common solution, you would really have t=
o do the
> > > > >> look up in component_ops .bind callback for exynos , and
> > > > >> generic_dsim_register_host() for i.MX .
> > > > >>
> > > > >>> If we go ahead with no need for DRM-managed helper at the momen=
t, then
> > > > >>> find the panel hook in host.attach and then drop 2/18.
> > > > >>
> > > > >> The panel lookup must happen in .bind/.probe for exynos/imx resp=
ectively
> > > > >> , that's really all that is required here. Then you can drop 1,2=
,3/18
> > > > >> and get this series applied (I hope) .
> > > > >
> > > > > I'm not quite sure, if the panel hook in .bind work for exynos or=
 not?
> > > >
> > > > Marek should be able to test exynos for you one more time I hope.
> > > >
> > > > > the host. attach has KMS hotplug code after the panel hook and
> > > > > bridge_attach as before. I believe that is a working scenario for
> > > > > Exynos to be the panel hook in the host. attach.
> > > >
> > > > As far as I understand it, the look up has to be in .bind callback =
(and
> > > > generic_dsim_register_host() for imx). Can you try if/how that work=
s ?
> > > >
> > > > >> Can you implement just this one change ?
> > > > >>
> > > > >> There is no need to use drmm_* helper for now, that can be impro=
ved
> > > > >> later if possible.
> > > > >
> > > > > If this is the case then 1/18 will need otherwise
> > > >
> > > > Ah yes, 1/18 will be needed indeed. It should just be called from .=
bind
> > > > callback or generic_dsim_register_host() (i.e. probe callback).
> > >
> > > panel hook at the probe call would be wrong.
> >
> > Why?
> >
> > > the downstream bridge will call mipi_dsi_attach for finding the
> > > connected upstream, so it indeed calls host.attach. If we move the
> > > panel hook at the probe, then probing will defer.
> > >
> > > [   12.046862] platform 32e10000.dsi: deferred probe pending
> > > [   12.052309] platform 32e00000.lcdif: deferred probe pending
> >
> > What is the dependency chain there, and why doesn't it probe?
>=20
> Let me answer here for the above 2 queries.
>=20
> This is clearly a point 2 scenario from the documentation.
>=20
> "
> The upstream driver doesn=E2=80=99t use the component framework, but is a
> MIPI-DSI host. The bridge device uses the MIPI-DCS commands to be
> controlled. In this case, the bridge device is a child of the display
> device and when it will probe it=E2=80=99s assured that the display device
> (and MIPI-DSI host) is present. The upstream driver will be assured
> that the bridge driver is connected between the
> mipi_dsi_host_ops.attach and mipi_dsi_host_ops.detach operations.
> Therefore, it must run mipi_dsi_host_register() in its probe function,
> and then run drm_bridge_attach() in its mipi_dsi_host_ops.attach hook.
> "
>=20
> So, the samsung-dsim follows the same rule, mipi_dsi_host_register()
> in the probe and drm_bridge_attach() in mipi_dsi_host_ops.attach hook.

But samsung-dsim is used together with the component framework, so this
doesn't work.

Seriously, I've been telling you that it doesn't work. We spent an hour
discussing this with Marek yesterday who also explained this to you.
Stop trying to make that happen, it just doesn't work.

Can we leave that solution behind and move forward?

> Above also mentioned "The upstream driver will be assured that the
> bridge driver is connected between the mipi_dsi_host_ops.attach and
> mipi_dsi_host_ops.detach operations" that means we need to find the
> panel or bridge in mipi_dsi_host_ops.attach am I correct? not in the
> probe.

No, you're not correct. Just like the documentation, Marek and I have
repeatedly told you.

> lcdif =3D> samsung-ti =3D> dsim-sn65dsi (I2C) =3D> panel this is the brid=
ge
> chain. ti-sn65dsi is registered the MIPI Device and attaches the
> upstream driver via mipi_dsi_attach that indeed calls upstream driver
> mipi_dsi_host_ops.attach so if we move finding panel or bridge from
> mipi_dsi_host_ops.attach to the probe then dev->of_node cannot be
> valid so it will not find the bridge driver.

Why not, dev->of_node is very much valid at probe time.

Maxime

--zzb427pzpp6ztjxj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY/4WKwAKCRDj7w1vZxhR
xYB1AP98XI291kpJn1Taa/xAMYXr0/AQSM6V08qqph63xpN4JwEA1WPCd5OKdy2b
XTw0bb88/uiklWLtHMe/r1XWI6OuNgY=
=TPi9
-----END PGP SIGNATURE-----

--zzb427pzpp6ztjxj--

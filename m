Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BB96A58CD
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 13:04:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A26C10E691;
	Tue, 28 Feb 2023 12:04:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B280410E692
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 12:04:53 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 200275C00F9;
 Tue, 28 Feb 2023 07:04:51 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 28 Feb 2023 07:04:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1677585891; x=
 1677672291; bh=xt0cVO30u9MTB9E9agjdh8Q9YTBHVN3jpWwB0oVkt+4=; b=d
 9rWWoP4gCDgBL19wSUZqfiQJ41mUk5ss0sRJMTH7EICr3XcmEFhLAZ28jcIhOubH
 pZnGol4fru9qHo8CEsKeWPSprxlIslbD8mN/+H8ob2hu1Z5gCpGakUE7BJpJamBk
 AE8dLjqPPKRsd9sSpbYQEWbOk0/NxAmMpiil3Ubk46iKlX2Fp2upc3zHXTx+mXt3
 1CcrqATzRyKv/vPMErAGR2rhZkKuYl9h+CdWT4izx2/RCWjBMdTijaT2awU5teHQ
 b6EVzg+lCcBwLm4z7ayn7iWkgYUXWp6B+ZkK5nviEwxtplg+jYeoxe81gxYBF4HF
 EWNjicKE4JUy3BX5U+SCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677585891; x=
 1677672291; bh=xt0cVO30u9MTB9E9agjdh8Q9YTBHVN3jpWwB0oVkt+4=; b=r
 7Q1OPTIh6/gEpEAxqtRrQ4g5ieN4On8HuXnukLlCu1MOjGXAxesUIQ4QFT1AGee2
 eFYi3imj6nJQ7XcKsqDLcOl2cM8nmbWd6++uyTmpve/hMQwsnhS83HELi27/2f99
 koEKFs3R2LMnsRa2TAY4XtBHvPFLxI0umkVOnP899oTFPmi5CYztD3y9HEwQCA/l
 eFyAEka2c3u+P4mZVEL8j2hTtMG6KZp7ZkXk3yv+gZbySwMGYc8iws90IpsET7NK
 TjGxf7ScYxcM3wLxfKmQFt+zCIvR68QZlUFlNCOgOH93rrhvv1I8AoBYKsUiKWzb
 a9m+gWCYS2NECUa8BAmFw==
X-ME-Sender: <xms:4u39Y0-JYd6iNYYBb7ZmliOHHjcbtCNhJu0bmM9pYKUuwGfdZUA_lA>
 <xme:4u39Y8uMrq8lvZlpMQ8yHSSDjbOzQgOwrvMwTxIYusFOkQwISR-DUOi5_msKzioiM
 oFL_2QSH_Tk8Mg_vgg>
X-ME-Received: <xmr:4u39Y6CsVGx2vec0xLpgMgVPaNDerQVWELl6mZWaqGEhA8Oo5SWUJM-vijVdfqEkj8R5qfkPTZ6ohVI42Zp2uPMUmVCAW0Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelvddgfeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepuedthfekgedtfeekfeeijeelleetgfdujedtvdejkeeitdeitdeggeei
 teehffelnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsth
 gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghr
 nhhordhtvggthh
X-ME-Proxy: <xmx:4u39Y0esiFske5QRT4dW83lHeH_QJ978UwoeWwLlz0VWumcBqT5BoA>
 <xmx:4u39Y5PosGNbdcnCpn_CW7wwQ_XuHB6s-pgYpBwee-UpW8qIEqzmOQ>
 <xmx:4u39Y-m0scVEOxxCJr2Pjw3qrAO0OkjdGApEuugyBxDczLptfERzOw>
 <xmx:4-39YwGijktp5p4jjK1RRj8T9XpJ7gttDjRm4A8btLDf1MCWlLS5mw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Feb 2023 07:04:49 -0500 (EST)
Date: Tue, 28 Feb 2023 13:04:47 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v13 04/18] drm: exynos: dsi: Switch to DSI panel or
 bridge find helper
Message-ID: <20230228120447.q7k5xup6hbvagg33@houat>
References: <3c2f91d3-0406-7730-d4e4-c94868f23c91@denx.de>
 <CAMty3ZA6_pKiOK6gWq4iQFtKsoxfUgnSFBqkgDBzEp1DcBEt3A@mail.gmail.com>
 <7b59aaf9-1f72-fd9f-29ac-1857ec3f91f3@denx.de>
 <CAMty3ZC6vqpFfdh2F=KUsAgm_KCksVXBV9ON1csjJd1m+gJpVQ@mail.gmail.com>
 <6066dff9-5a66-0da5-14d9-66162a2fbb39@denx.de>
 <CAMty3ZDjwD+3SKJiOgZLbYYTtq=udWkXbqnsyYaM73rsYxDumQ@mail.gmail.com>
 <47b8ad7d-cfc1-112c-2117-cb3612c1bba5@denx.de>
 <CAMty3ZDMJFW36g5=A1=_08VT1dZUMemEg3YcQMh08iZNRa+cTw@mail.gmail.com>
 <5c10d1e6-75ce-d926-fba9-a9bf5e240895@denx.de>
 <CAMty3ZBpWd817b5Ye_AQse1zruUtWOm2E4WUz0b7a4k9mVEzEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMty3ZBpWd817b5Ye_AQse1zruUtWOm2E4WUz0b7a4k9mVEzEQ@mail.gmail.com>
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

On Tue, Feb 28, 2023 at 02:08:53AM +0530, Jagan Teki wrote:
> On Tue, Feb 28, 2023 at 1:40 AM Marek Vasut <marex@denx.de> wrote:
> >
> > On 2/27/23 20:49, Jagan Teki wrote:
> > > On Tue, Feb 28, 2023 at 1:11 AM Marek Vasut <marex@denx.de> wrote:
> > >>
> > >> On 2/27/23 20:34, Jagan Teki wrote:
> > >>> On Tue, Feb 28, 2023 at 12:54 AM Marek Vasut <marex@denx.de> wrote:
> > >>>>
> > >>>> On 2/27/23 20:15, Jagan Teki wrote:
> > >>>>> On Tue, Feb 28, 2023 at 12:38 AM Marek Vasut <marex@denx.de> wrot=
e:
> > >>>>>>
> > >>>>>> On 2/27/23 20:01, Jagan Teki wrote:
> > >>>>>>> On Tue, Feb 28, 2023 at 12:25 AM Marek Vasut <marex@denx.de> wr=
ote:
> > >>>>>>>>
> > >>>>>>>> On 2/27/23 12:39, Jagan Teki wrote:
> > >>>>>>>>> drm_of_dsi_find_panel_or_bridge is capable of looking up the
> > >>>>>>>>> downstream DSI bridge and panel and trying to add a panel bri=
dge
> > >>>>>>>>> if the panel is found.
> > >>>>>>>>>
> > >>>>>>>>> Replace explicit finding calls with drm_of_dsi_find_panel_or_=
bridge
> > >>>>>>>>> followed with drmm_panel_bridge_add.
> > >>>>>>>>>
> > >>>>>>>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > >>>>>>>>> ---
> > >>>>>>>>> Changes for v13, v12, v11:
> > >>>>>>>>> - none
> > >>>>>>>>> Changes for v10:
> > >>>>>>>>> - new patch
> > >>>>>>>>>
> > >>>>>>>>>       drivers/gpu/drm/exynos/exynos_drm_dsi.c | 25 ++++++++++=
+++------------
> > >>>>>>>>>       1 file changed, 13 insertions(+), 12 deletions(-)
> > >>>>>>>>>
> > >>>>>>>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/driver=
s/gpu/drm/exynos/exynos_drm_dsi.c
> > >>>>>>>>> index df15501b1075..12a6dd987e8f 100644
> > >>>>>>>>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > >>>>>>>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > >>>>>>>>> @@ -25,6 +25,7 @@
> > >>>>>>>>>       #include <drm/drm_atomic_helper.h>
> > >>>>>>>>>       #include <drm/drm_bridge.h>
> > >>>>>>>>>       #include <drm/drm_mipi_dsi.h>
> > >>>>>>>>> +#include <drm/drm_of.h>
> > >>>>>>>>>       #include <drm/drm_panel.h>
> > >>>>>>>>>       #include <drm/drm_print.h>
> > >>>>>>>>>       #include <drm/drm_probe_helper.h>
> > >>>>>>>>> @@ -1470,24 +1471,26 @@ static int exynos_dsi_host_attach(str=
uct mipi_dsi_host *host,
> > >>>>>>>>>           struct device *dev =3D dsi->dev;
> > >>>>>>>>>           struct drm_encoder *encoder =3D &dsi->encoder;
> > >>>>>>>>>           struct drm_device *drm =3D encoder->dev;
> > >>>>>>>>> +     struct drm_bridge *bridge;
> > >>>>>>>>>           struct drm_panel *panel;
> > >>>>>>>>>           int ret;
> > >>>>>>>>>
> > >>>>>>>>> -     panel =3D of_drm_find_panel(device->dev.of_node);
> > >>>>>>>>> -     if (!IS_ERR(panel)) {
> > >>>>>>>>> -             dsi->out_bridge =3D devm_drm_panel_bridge_add(d=
ev, panel);
> > >>>>>>>>> -     } else {
> > >>>>>>>>> -             dsi->out_bridge =3D of_drm_find_bridge(device->=
dev.of_node);
> > >>>>>>>>> -             if (!dsi->out_bridge)
> > >>>>>>>>> -                     dsi->out_bridge =3D ERR_PTR(-EINVAL);
> > >>>>>>>>> -     }
> > >>>>>>>>
> > >>>>>>>> As far as I understand this from my conversation with Maxime (=
please put
> > >>>>>>>> him on CC of V15), the change here should instead perform the =
panel look
> > >>>>>>>> up NOT in exynos_dsi_host_attach() , but in exynos_dsi_bind() =
, i.e. in
> > >>>>>>>> the component_ops .bind callback . Here is an example of corre=
ct
> > >>>>>>>> implementation:
> > >>>>>>>>
> > >>>>>>>> https://cgit.freedesktop.org/drm-misc/tree/drivers/gpu/drm/vc4=
/vc4_dsi.c#n1805
> > >>>>>>>
> > >>>>>>> But, we don't have component_ops.bind for imx8m case, so where =
do we
> > >>>>>>> want to place the panel hook?
> > >>>>>>>
> > >>>>>>> Exynos drm drivers are component-based but, imx8mm is not.
> > >>>>>>
> > >>>>>> In 14/18 patch, the same should be added to generic_dsim_registe=
r_host()
> > >>>>>> , which is called from the driver .probe() callback, but that is=
 OK.
> > >>>>>>
> > >>>>>> That's ^ is the iMX part.
> > >>>>>
> > >>>>> Ohh. You mean, we need to find the panel hook separately in two p=
laces like
> > >>>>> - bind for exynos
> > >>>>> - probe for imx8mm
> > >>>>
> > >>>> Yes
> > >>>>
> > >>>>> If so? how can I find the drm_device pointer in the probe?
> > >>>>
> > >>>> What for ? The panel lookup uses OF graph . Where do you need the
> > >>>> drm_device in it ?
> > >>>
> > >>> May I can summarize the whole setback here so that everybody is on =
the
> > >>> same page and find the proper solution?
> > >>>
> > >>> The key blocker is accessing the DRM pointer in order to use the
> > >>> DRM-managed action helper.
> > >>>
> > >>> 1. If we find the panel hook in Exynos component_ops.bind then we c=
an
> > >>> use the DRM pointer directly as VC4 does.
> > >>> 2. if we find the panel hook in Samsung drm_bridge_funcs.attach (for
> > >>> imx8mm) then we can use the DRM pointer directly via bridge->dev.
> > >>>
> > >>> If we make 2) has common across like finding the panel hook in
> > >>> drm_bridge_funcs.attach the Exynos drm pipeline cannot find the
> > >>> panels.
> > >>>
> > >>> The common solution for both exynos and imx8m is host.attach but if=
 we
> > >>> do so we cannot get find the DRM pointer.
> > >>
> > >> There isn't going to be common solution, you would really have to do=
 the
> > >> look up in component_ops .bind callback for exynos , and
> > >> generic_dsim_register_host() for i.MX .
> > >>
> > >>> If we go ahead with no need for DRM-managed helper at the moment, t=
hen
> > >>> find the panel hook in host.attach and then drop 2/18.
> > >>
> > >> The panel lookup must happen in .bind/.probe for exynos/imx respecti=
vely
> > >> , that's really all that is required here. Then you can drop 1,2,3/18
> > >> and get this series applied (I hope) .
> > >
> > > I'm not quite sure, if the panel hook in .bind work for exynos or not?
> >
> > Marek should be able to test exynos for you one more time I hope.
> >
> > > the host. attach has KMS hotplug code after the panel hook and
> > > bridge_attach as before. I believe that is a working scenario for
> > > Exynos to be the panel hook in the host. attach.
> >
> > As far as I understand it, the look up has to be in .bind callback (and
> > generic_dsim_register_host() for imx). Can you try if/how that works ?
> >
> > >> Can you implement just this one change ?
> > >>
> > >> There is no need to use drmm_* helper for now, that can be improved
> > >> later if possible.
> > >
> > > If this is the case then 1/18 will need otherwise
> >
> > Ah yes, 1/18 will be needed indeed. It should just be called from .bind
> > callback or generic_dsim_register_host() (i.e. probe callback).
>=20
> panel hook at the probe call would be wrong.

Why?

> the downstream bridge will call mipi_dsi_attach for finding the
> connected upstream, so it indeed calls host.attach. If we move the
> panel hook at the probe, then probing will defer.
>=20
> [   12.046862] platform 32e10000.dsi: deferred probe pending
> [   12.052309] platform 32e00000.lcdif: deferred probe pending

What is the dependency chain there, and why doesn't it probe?

> What is the problem to have it in host.attach for both cases?

You've put a link to the documentation that explains what the problem is
in your mail.

> some DSI host bridges still do the same (mtk_dsi)

Then some are broken. How is that an argument?

> and this is what is mentioned in documentation point 2 and 3 here,
> https://dri.freedesktop.org/docs/drm/gpu/drm-kms-helpers.html#special-car=
e-with-mipi-dsi-bridges
>=20
> "
> The upstream driver doesn=E2=80=99t use the component framework, but is a
> MIPI-DSI host.

Exynos uses the component framework. So that point doesn't apply to it.

> The bridge device uses the MIPI-DCS commands to be
> controlled. In this case, the bridge device is a child of the display
> device and when it will probe it=E2=80=99s assured that the display device
> (and MIPI-DSI host) is present. The upstream driver will be assured
> that the bridge driver is connected between the
> mipi_dsi_host_ops.attach and mipi_dsi_host_ops.detach operations.
> Therefore, it must run mipi_dsi_host_register() in its probe function,
> and then run drm_bridge_attach() in its mipi_dsi_host_ops.attach hook.
>=20
> The upstream driver uses the component framework and is a MIPI-DSI
> host. The bridge device uses the MIPI-DCS commands to be controlled.
> This is the same situation than above, and can run
> mipi_dsi_host_register() in either its probe or bind hooks.
> "
>=20
> Point 2 for Exynos and 3 for imx8m flow, for both the cases
> drm_bridge_attach in host_ops.attach hook so the panel hook must be in
> same place.

And you forgot the fourth point:

> The upstream driver uses the component framework and is a MIPI-DSI
> host. The bridge device uses a separate bus (such as I2C) to be
> controlled. In this case, there=E2=80=99s no correlation between the prob=
e of
> the bridge and upstream drivers, so care must be taken to avoid an
> endless EPROBE_DEFER loop, with each driver waiting for the other to
> probe.

Which is what the whole discussion is about.

Maxime

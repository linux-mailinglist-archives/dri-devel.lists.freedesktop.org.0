Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BAA6A5B65
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 16:10:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5276110E4CD;
	Tue, 28 Feb 2023 15:10:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B54E810E4CD
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 15:10:08 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-536c02c9dfbso280527807b3.11
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 07:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ul8Ozd8UFTebNc6cj/DNYpyGqRAWtFXadOEA1glf6w8=;
 b=IsxOC/IxpilBfzVS0mILeYiAp5NRIfhPpwWtK2A88xcbe5ZMVaVrbKWjE15iDDsSxJ
 nP/0BfuUhiFpyoe4ut8Tiwd2P5wuHV5N6NlxYY5aZtAqbIZ7Q4PR8XoVzMF/qx4ZSjdV
 r59DedOoGqQGWyr3TN9h6qxn4EtlZkTm20mzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ul8Ozd8UFTebNc6cj/DNYpyGqRAWtFXadOEA1glf6w8=;
 b=6zVGHfciNqzRpHfUcKgXH3mfqUunkAn3b5DfvaYR0xu0ifgiu3jbhPgKE4w6M/SaWz
 RM+hdlCWijxu9jwL9+98uC5IbY9OP9OViUbEOZ0NLwaBRwUykT2jTqsDOTbq+R15Q4jJ
 SCEKJC5gMCaKlIGqdXXuAtLF5vi1jJsHXujTZoprxSB16WiZB9qhnh/Dn5HQqFUy7RNQ
 6zouYyCQKKUowJn551PhMMbRVxNoWOTwDZ8GKoYZwteIVyz7t/T/emrDEeYL/GVDn245
 wNj+g+na8LqswCw3CxCa0OFjcCTqfM/z6H8v0cLZzFCz8TzR0lyY/gTnZHy8QB3qMmyy
 YE0w==
X-Gm-Message-State: AO0yUKXAZnDnXRH9khmWFSo6rCJcG/1V6IlVtJsWs0M0O7sO5qcZc6sU
 I9F9YTE5PZUg2kSCp63QZ+OXgUBoCoeqEtPwTkf63A==
X-Google-Smtp-Source: AK7set+CcGU79o8oyPBRmTOSY6bh4PMWBO83d0ITuE9LZBiFgdsZ3StCl7ZhKmcAnACLpdb24Tqa2V4MDqndjgnurNQ=
X-Received: by 2002:a81:b664:0:b0:52e:bb2d:2841 with SMTP id
 h36-20020a81b664000000b0052ebb2d2841mr1825981ywk.10.1677597006510; Tue, 28
 Feb 2023 07:10:06 -0800 (PST)
MIME-Version: 1.0
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
 <20230228145643.b537y4uuc4ep3epc@houat>
In-Reply-To: <20230228145643.b537y4uuc4ep3epc@houat>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 28 Feb 2023 20:39:54 +0530
Message-ID: <CAMty3ZC-YfNLCy-Sx9UdG6W=cHzoEid-NdRFZqGxRgtLeMDy+A@mail.gmail.com>
Subject: Re: [PATCH v13 04/18] drm: exynos: dsi: Switch to DSI panel or bridge
 find helper
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Feb 28, 2023 at 8:26 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Tue, Feb 28, 2023 at 08:09:26PM +0530, Jagan Teki wrote:
> > On Tue, Feb 28, 2023 at 5:34 PM Maxime Ripard <maxime@cerno.tech> wrote=
:
> > >
> > > On Tue, Feb 28, 2023 at 02:08:53AM +0530, Jagan Teki wrote:
> > > > On Tue, Feb 28, 2023 at 1:40 AM Marek Vasut <marex@denx.de> wrote:
> > > > >
> > > > > On 2/27/23 20:49, Jagan Teki wrote:
> > > > > > On Tue, Feb 28, 2023 at 1:11 AM Marek Vasut <marex@denx.de> wro=
te:
> > > > > >>
> > > > > >> On 2/27/23 20:34, Jagan Teki wrote:
> > > > > >>> On Tue, Feb 28, 2023 at 12:54 AM Marek Vasut <marex@denx.de> =
wrote:
> > > > > >>>>
> > > > > >>>> On 2/27/23 20:15, Jagan Teki wrote:
> > > > > >>>>> On Tue, Feb 28, 2023 at 12:38 AM Marek Vasut <marex@denx.de=
> wrote:
> > > > > >>>>>>
> > > > > >>>>>> On 2/27/23 20:01, Jagan Teki wrote:
> > > > > >>>>>>> On Tue, Feb 28, 2023 at 12:25 AM Marek Vasut <marex@denx.=
de> wrote:
> > > > > >>>>>>>>
> > > > > >>>>>>>> On 2/27/23 12:39, Jagan Teki wrote:
> > > > > >>>>>>>>> drm_of_dsi_find_panel_or_bridge is capable of looking u=
p the
> > > > > >>>>>>>>> downstream DSI bridge and panel and trying to add a pan=
el bridge
> > > > > >>>>>>>>> if the panel is found.
> > > > > >>>>>>>>>
> > > > > >>>>>>>>> Replace explicit finding calls with drm_of_dsi_find_pan=
el_or_bridge
> > > > > >>>>>>>>> followed with drmm_panel_bridge_add.
> > > > > >>>>>>>>>
> > > > > >>>>>>>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > > > >>>>>>>>> ---
> > > > > >>>>>>>>> Changes for v13, v12, v11:
> > > > > >>>>>>>>> - none
> > > > > >>>>>>>>> Changes for v10:
> > > > > >>>>>>>>> - new patch
> > > > > >>>>>>>>>
> > > > > >>>>>>>>>       drivers/gpu/drm/exynos/exynos_drm_dsi.c | 25 ++++=
+++++++++------------
> > > > > >>>>>>>>>       1 file changed, 13 insertions(+), 12 deletions(-)
> > > > > >>>>>>>>>
> > > > > >>>>>>>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/=
drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > > > > >>>>>>>>> index df15501b1075..12a6dd987e8f 100644
> > > > > >>>>>>>>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > > > > >>>>>>>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > > > > >>>>>>>>> @@ -25,6 +25,7 @@
> > > > > >>>>>>>>>       #include <drm/drm_atomic_helper.h>
> > > > > >>>>>>>>>       #include <drm/drm_bridge.h>
> > > > > >>>>>>>>>       #include <drm/drm_mipi_dsi.h>
> > > > > >>>>>>>>> +#include <drm/drm_of.h>
> > > > > >>>>>>>>>       #include <drm/drm_panel.h>
> > > > > >>>>>>>>>       #include <drm/drm_print.h>
> > > > > >>>>>>>>>       #include <drm/drm_probe_helper.h>
> > > > > >>>>>>>>> @@ -1470,24 +1471,26 @@ static int exynos_dsi_host_atta=
ch(struct mipi_dsi_host *host,
> > > > > >>>>>>>>>           struct device *dev =3D dsi->dev;
> > > > > >>>>>>>>>           struct drm_encoder *encoder =3D &dsi->encoder=
;
> > > > > >>>>>>>>>           struct drm_device *drm =3D encoder->dev;
> > > > > >>>>>>>>> +     struct drm_bridge *bridge;
> > > > > >>>>>>>>>           struct drm_panel *panel;
> > > > > >>>>>>>>>           int ret;
> > > > > >>>>>>>>>
> > > > > >>>>>>>>> -     panel =3D of_drm_find_panel(device->dev.of_node);
> > > > > >>>>>>>>> -     if (!IS_ERR(panel)) {
> > > > > >>>>>>>>> -             dsi->out_bridge =3D devm_drm_panel_bridge=
_add(dev, panel);
> > > > > >>>>>>>>> -     } else {
> > > > > >>>>>>>>> -             dsi->out_bridge =3D of_drm_find_bridge(de=
vice->dev.of_node);
> > > > > >>>>>>>>> -             if (!dsi->out_bridge)
> > > > > >>>>>>>>> -                     dsi->out_bridge =3D ERR_PTR(-EINV=
AL);
> > > > > >>>>>>>>> -     }
> > > > > >>>>>>>>
> > > > > >>>>>>>> As far as I understand this from my conversation with Ma=
xime (please put
> > > > > >>>>>>>> him on CC of V15), the change here should instead perfor=
m the panel look
> > > > > >>>>>>>> up NOT in exynos_dsi_host_attach() , but in exynos_dsi_b=
ind() , i.e. in
> > > > > >>>>>>>> the component_ops .bind callback . Here is an example of=
 correct
> > > > > >>>>>>>> implementation:
> > > > > >>>>>>>>
> > > > > >>>>>>>> https://cgit.freedesktop.org/drm-misc/tree/drivers/gpu/d=
rm/vc4/vc4_dsi.c#n1805
> > > > > >>>>>>>
> > > > > >>>>>>> But, we don't have component_ops.bind for imx8m case, so =
where do we
> > > > > >>>>>>> want to place the panel hook?
> > > > > >>>>>>>
> > > > > >>>>>>> Exynos drm drivers are component-based but, imx8mm is not=
.
> > > > > >>>>>>
> > > > > >>>>>> In 14/18 patch, the same should be added to generic_dsim_r=
egister_host()
> > > > > >>>>>> , which is called from the driver .probe() callback, but t=
hat is OK.
> > > > > >>>>>>
> > > > > >>>>>> That's ^ is the iMX part.
> > > > > >>>>>
> > > > > >>>>> Ohh. You mean, we need to find the panel hook separately in=
 two places like
> > > > > >>>>> - bind for exynos
> > > > > >>>>> - probe for imx8mm
> > > > > >>>>
> > > > > >>>> Yes
> > > > > >>>>
> > > > > >>>>> If so? how can I find the drm_device pointer in the probe?
> > > > > >>>>
> > > > > >>>> What for ? The panel lookup uses OF graph . Where do you nee=
d the
> > > > > >>>> drm_device in it ?
> > > > > >>>
> > > > > >>> May I can summarize the whole setback here so that everybody =
is on the
> > > > > >>> same page and find the proper solution?
> > > > > >>>
> > > > > >>> The key blocker is accessing the DRM pointer in order to use =
the
> > > > > >>> DRM-managed action helper.
> > > > > >>>
> > > > > >>> 1. If we find the panel hook in Exynos component_ops.bind the=
n we can
> > > > > >>> use the DRM pointer directly as VC4 does.
> > > > > >>> 2. if we find the panel hook in Samsung drm_bridge_funcs.atta=
ch (for
> > > > > >>> imx8mm) then we can use the DRM pointer directly via bridge->=
dev.
> > > > > >>>
> > > > > >>> If we make 2) has common across like finding the panel hook i=
n
> > > > > >>> drm_bridge_funcs.attach the Exynos drm pipeline cannot find t=
he
> > > > > >>> panels.
> > > > > >>>
> > > > > >>> The common solution for both exynos and imx8m is host.attach =
but if we
> > > > > >>> do so we cannot get find the DRM pointer.
> > > > > >>
> > > > > >> There isn't going to be common solution, you would really have=
 to do the
> > > > > >> look up in component_ops .bind callback for exynos , and
> > > > > >> generic_dsim_register_host() for i.MX .
> > > > > >>
> > > > > >>> If we go ahead with no need for DRM-managed helper at the mom=
ent, then
> > > > > >>> find the panel hook in host.attach and then drop 2/18.
> > > > > >>
> > > > > >> The panel lookup must happen in .bind/.probe for exynos/imx re=
spectively
> > > > > >> , that's really all that is required here. Then you can drop 1=
,2,3/18
> > > > > >> and get this series applied (I hope) .
> > > > > >
> > > > > > I'm not quite sure, if the panel hook in .bind work for exynos =
or not?
> > > > >
> > > > > Marek should be able to test exynos for you one more time I hope.
> > > > >
> > > > > > the host. attach has KMS hotplug code after the panel hook and
> > > > > > bridge_attach as before. I believe that is a working scenario f=
or
> > > > > > Exynos to be the panel hook in the host. attach.
> > > > >
> > > > > As far as I understand it, the look up has to be in .bind callbac=
k (and
> > > > > generic_dsim_register_host() for imx). Can you try if/how that wo=
rks ?
> > > > >
> > > > > >> Can you implement just this one change ?
> > > > > >>
> > > > > >> There is no need to use drmm_* helper for now, that can be imp=
roved
> > > > > >> later if possible.
> > > > > >
> > > > > > If this is the case then 1/18 will need otherwise
> > > > >
> > > > > Ah yes, 1/18 will be needed indeed. It should just be called from=
 .bind
> > > > > callback or generic_dsim_register_host() (i.e. probe callback).
> > > >
> > > > panel hook at the probe call would be wrong.
> > >
> > > Why?
> > >
> > > > the downstream bridge will call mipi_dsi_attach for finding the
> > > > connected upstream, so it indeed calls host.attach. If we move the
> > > > panel hook at the probe, then probing will defer.
> > > >
> > > > [   12.046862] platform 32e10000.dsi: deferred probe pending
> > > > [   12.052309] platform 32e00000.lcdif: deferred probe pending
> > >
> > > What is the dependency chain there, and why doesn't it probe?
> >
> > Let me answer here for the above 2 queries.
> >
> > This is clearly a point 2 scenario from the documentation.
> >
> > "
> > The upstream driver doesn=E2=80=99t use the component framework, but is=
 a
> > MIPI-DSI host. The bridge device uses the MIPI-DCS commands to be
> > controlled. In this case, the bridge device is a child of the display
> > device and when it will probe it=E2=80=99s assured that the display dev=
ice
> > (and MIPI-DSI host) is present. The upstream driver will be assured
> > that the bridge driver is connected between the
> > mipi_dsi_host_ops.attach and mipi_dsi_host_ops.detach operations.
> > Therefore, it must run mipi_dsi_host_register() in its probe function,
> > and then run drm_bridge_attach() in its mipi_dsi_host_ops.attach hook.
> > "
> >
> > So, the samsung-dsim follows the same rule, mipi_dsi_host_register()
> > in the probe and drm_bridge_attach() in mipi_dsi_host_ops.attach hook.
>
> But samsung-dsim is used together with the component framework, so this
> doesn't work.
>
> Seriously, I've been telling you that it doesn't work. We spent an hour
> discussing this with Marek yesterday who also explained this to you.
> Stop trying to make that happen, it just doesn't work.
>
> Can we leave that solution behind and move forward?

I have given the logs of why it's not working. I did my best to
explain. Samsung-dsim is not component-based it is a non-component DSI
host bridge exclusively for imx8mm and Exynos DSI is component-based.
Samsung-dsim we have a platform calls to call Exynos which will
operate component binding. This means that imx8mm stuff cannot use the
component framework at all.

This is all I can explain. and adding panel or bridge finding code in
the probe simply not working on imx8mm as it is non-component based.

Thanks for your patience in answering queries.

Jagan.

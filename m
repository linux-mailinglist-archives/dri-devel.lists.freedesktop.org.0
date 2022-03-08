Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FB54D1A05
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 15:07:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D28010E27C;
	Tue,  8 Mar 2022 14:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A83310E20E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 14:07:45 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 127778C1;
 Tue,  8 Mar 2022 15:07:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1646748463;
 bh=I9pn+gAaOs5ACLCITz+5bOaDRx3tYfANL7NXlrzWLus=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=g/dYEex43tkGgF5eXhaf70rEOWL8a4Gv9jhU7zC9eKnSZrRbJmrJhWmwYLrGnIRvx
 tivr2UD0rzESfhZWSHE0jKH+LC5UZ8AScJMBvrQ3WhTwU1LUZC5VNXVJasEpxvcdQR
 3+EQvw71zMMykfw1xSnFRUP1TQrg2/ZBQvXInBIA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAD=FV=U5VPogd4Lf9TRhpqdpfyhxArkS=fgfXMJa-hC-JqnW1Q@mail.gmail.com>
References: <20220307175955.363057-1-kieran.bingham+renesas@ideasonboard.com>
 <20220307175955.363057-3-kieran.bingham+renesas@ideasonboard.com>
 <CAD=FV=U5VPogd4Lf9TRhpqdpfyhxArkS=fgfXMJa-hC-JqnW1Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm/bridge: ti-sn65dsi86: Make connector creation
 optional
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Doug Anderson <dianders@chromium.org>
Date: Tue, 08 Mar 2022 14:07:40 +0000
Message-ID: <164674846068.11309.5708337069896720074@Monstersaurus>
User-Agent: alot/0.10
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,

Quoting Doug Anderson (2022-03-07 23:21:28)
> Hi,
>=20
> On Mon, Mar 7, 2022 at 10:00 AM Kieran Bingham
> <kieran.bingham+renesas@ideasonboard.com> wrote:
> >
> > From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >
> > Now that the driver supports the connector-related bridge operations,
> > make the connector creation optional. This enables usage of the
> > sn65dsi86 with the DRM bridge connector helper.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.=
com>
> > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >
> > ---
> > Changes since v1:
> >  - None
> >
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 17 +++++++----------
> >  1 file changed, 7 insertions(+), 10 deletions(-)
>=20
> Can you please CC me on this series next time you send it out? I was
> pretty involved in previous reviews here. Luckily I got CCed on one of
> the patches so I knew to look, but since that one is (probably)
> getting dropped it'd be good to make sure I was on the others. It's
> also pretty important to include +Sam Ravnborg since there's a lot of
> overlap with his series [1]:

Absolutely - I was assuming you were the main target for reviews. I'm
sorry - I also assumed get_maintainer.pl had / would add you - and I
didn't check getting the patches out last night.

I'll be sure to manually add you.

> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/br=
idge/ti-sn65dsi86.c
> > index ffb6c04f6c46..29f5f7123ed9 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -745,11 +745,6 @@ static int  (struct drm_bridge *bridge,
> >         struct ti_sn65dsi86 *pdata =3D bridge_to_ti_sn65dsi86(bridge);
> >         int ret;
> >
> > -       if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> > -               DRM_ERROR("Fix bridge driver to make connector optional=
!");
> > -               return -EINVAL;
> > -       }
>=20
> That won't work without some other fixes, sorry!

Ok ;-)

To be clear, my goal here has been to get the IRQ HPD working - so
my main focus is there. I guess I now have to handle custodianship of
these dependencies somehow too though.


> The problem is that you'll break ti_sn_bridge_get_bpp(). That
> absolutely relies on having our own connector so you need to fix that
> _before_ making the connector optional.
>=20
> Rob Clark made an attempt on this [2] but Laurent didn't like the
> solution he came up with. Sam's series that I mentioned [1] also made
> an attempt at this, specifically in patch 5 ("drm/bridge:
> ti-sn65dsi86: Fetch bpc via drm_bridge_state") of his series.
> Unfortunately, it didn't work because the "output_bus_cfg.format"
> wasn't set to anything. Personally I wouldn't mind Rob's solution as a
> stopgap if Laurent removes his NAK. Then we're not stuck while someone
> tries to find time to fix this correctly.

Ok - all of that is going to take some time for me to review and
process.
=20
> One last problem here is that your patch doesn't actually apply to
> drm-misc/drm-misc-next, which is likely where it would land. I believe
> it conflicts with my recent commit e283820cbf80 ("drm/bridge:
> ti-sn65dsi86: Use drm_bridge_connector"). It looks like you based your
> series on mainline, but you should really be targeting drm-misc-next.

Ah sorry - I thought I had merged in drm-misc-next, but it was a week
ago or so so I guess I'm already outdated.

I'll cleanup for a new base now.


> -Doug
>=20
> [1] https://lore.kernel.org/r/20220206154405.1243333-1-sam@ravnborg.org/
> [2] https://lore.kernel.org/all/20210920225801.227211-4-robdclark@gmail.c=
om/

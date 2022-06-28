Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DAB55F003
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 22:56:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC8010EAF5;
	Tue, 28 Jun 2022 20:56:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D45410EAF5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 20:56:35 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id i7so24261039ybe.11
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 13:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yKQEF36ycuzYUOPVu3KHfZYhntaUg963Kzu5sKnBaTc=;
 b=hrycYo1Ilsww+6NSQ+00snPQqSnCaqYxagPNrHHbji/zEqKK13+YAs/PV+CuDfQbBu
 1hqyk4kUqZ87fcFU2QapjCjwUok2kTlDVLOgj8IhXpbiZ6Pk2rqljqQjXtn+fUJOBF4o
 lHcwA+kIIuZmPGVBLi+HinV4qMJyrpvEDpgMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yKQEF36ycuzYUOPVu3KHfZYhntaUg963Kzu5sKnBaTc=;
 b=7gVodCmwVjYUS6xpysCEcf+AbLfKlIs+cSfmvJs1Z6HUdrJPbBew3RQ+XJ4cYVlLQb
 m35zquhsOyunq7mByspxaw6tYzcgRAjg3Bafkj6kmRo/JjIeyjR/z/tB2nqA//y0Lxpu
 liCgUw03ufwVIDbwVrojLkGm6RdD70fvrJ+puwBoX6CK1NOmjgh5ELA1S9GWEnzRpLgP
 +ZfLTu6ARPGl+BVCclnvBE636ol4xeTvGlNvrhG0i0OgPMHjMn5pwtsB83Un3BXvEaPL
 DPPPGeT/ekPLctNdpt1GODBF/h1iSBUbQs8qYU6biISE1tj5U2hXEsHLUdyWg8GJQXCL
 lCSQ==
X-Gm-Message-State: AJIora8p0RdswiR7SSDDS3OFFjDxg5e5wS7OghtupJK0LtAJuNCRJbPi
 3i9T04NSt/Y0swd/sqKEkciJRlM0o4thQ5OVnAsgKw==
X-Google-Smtp-Source: AGRyM1vOU4sWRKsuKs1MQzRMOWXKj7H/A1ySaV28jwKyhx0FOruidnjEBvhX9AMkjs2jfYPoSZZSOGETFzHMDMKUVHo=
X-Received: by 2002:a25:da0b:0:b0:66c:850f:1b71 with SMTP id
 n11-20020a25da0b000000b0066c850f1b71mr22360839ybf.336.1656449794292; Tue, 28
 Jun 2022 13:56:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220622173605.1168416-1-pmalani@chromium.org>
 <20220622173605.1168416-6-pmalani@chromium.org>
 <CAE-0n517BB8YbN5AZG6M3ZrZGOJDV=+t0R9d8wD+gVqO1aD1Xg@mail.gmail.com>
 <CACeCKafR8hFke_tc2=1VGDNF-CFrZoAG1aUKuxGJG-6pd37hbg@mail.gmail.com>
 <CAE-0n50XbO5Wu4-429Ao05A4QrbSXoi1wBjTpGFjKm3pZj1Ybg@mail.gmail.com>
In-Reply-To: <CAE-0n50XbO5Wu4-429Ao05A4QrbSXoi1wBjTpGFjKm3pZj1Ybg@mail.gmail.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Tue, 28 Jun 2022 13:56:22 -0700
Message-ID: <CACeCKafzB0wW_B2TOEWywLMyB+UhYCpXYDVBV=UbyxBiGnv1Rw@mail.gmail.com>
Subject: Re: [PATCH v5 5/9] drm/bridge: anx7625: Add typec_mux_set callback
 function
To: Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: heikki.krogerus@linux.intel.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 Pin-Yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 28, 2022 at 1:40 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Prashant Malani (2022-06-28 12:48:11)
> > On Tue, Jun 28, 2022 at 12:25 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > > Quoting Prashant Malani (2022-06-22 10:34:34)
> > > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > index bd21f159b973..5992fc8beeeb 100644
> > > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> [..]
> > > > +
> > > > +       if (ctx->num_typec_switches == 1)
> > >
> > > How do we handle the case where the usb-c-connector is directly
> > > connected to the RX1/TX1 and RX2/TX2 pins? This device would be an
> > > orientation (normal/reverse) and mode switch (usb/dp) in that scenario,
> > > but this code is written in a way that the orientation switch isn't
> > > going to flip the crosspoint switch for the different pin assignments.
> >
> > If all 4 SS lanes are connected to 1 usb-c-connector; there would be
> > just 1 "typec-switch" node.
> > In that case, the DT would only specify it as an "orientation-switch"
> > and register
> > an orientation-switch with the Type-C framework. The orientation switch would
> > pretty much do what the mode-switch callback does here (configuring
> > the crosspoint
> > switch).
> > One could also register a "mode-switch" there but it wouldn't do
> > anything (all 4 lanes are already
> > connected so there is nothing to re-route in the crosspoint switch).
> > Hence the above "if" check.
>
> Would we still want to route the DP traffic out if the pin assignment
> didn't have DP? Does the hardware support some mode where the DP traffic
> is shutdown? Or maybe the HPD pin needs to be quieted unless DP is
> assigned?

I reference this below, but in the 1 connector case, CC lines would also be
routed to the anx7625 from the usb-connector, so it will know when HPD
is asserted
or not.

>
> I suppose none of those things matter though as long as there is some
> typec switch registered here so that the driver can be informed of the
> pin assignment. Is it right that the "mode-switch" property is only
> required in DT if this device is going to control the mode of the
> connector, i.e. USB+DP, or just DP? Where this device can't do that
> because it doesn't support only DP.

If the anx7625 is used just to route all lanes from 1 usb-c-connector (i.e
the USB+DP case), a mode-switch wouldn't be of much use, since one
would also route the CC lines to the built-in PD controller; so it will
already have knowledge of what mode the switch is in.

The mode-switch is likely only relevant for this hardware configuration(
it's "DP only" in the sense that the USB pins to the SoC never go anywhere).
One only has 2 SS lanes each (from each usb-c-connector).

Since there is no CC-line, the anx7625 needs to know which one has DP
enabled on it.

>
> >
> > Unfortunately, I don't have hardware which connects all 4 SS lanes
> > from 1 Type-C port
> > to the anx7625, so I didn't add the orientation switch handling to the
> > driver (since I have no way of verifying it).
>
> Alright. Maybe add a TODO then so it's more obvious that orientation
> isn't handled.

Ack. Will add a comment in v6.

>
> >
> > Regarding DP alt-mode pin assignments : I think anx7625 will only support Pin D
> > (only 2 lane DP, no 4 lane DP).
> >
>
> Makes sense. Thanks!

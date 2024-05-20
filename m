Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFD88C9CD4
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 14:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D400010E5DD;
	Mon, 20 May 2024 12:01:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="GF0AiLwi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E52410E59A
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 12:01:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3AF73E0004;
 Mon, 20 May 2024 12:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1716206512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lR9VoY3FIAk89C7/g6hG/jVXz1+H90c8VcbuRj3NpC4=;
 b=GF0AiLwi4yJVNHucyiXpRqmgep7Uh0wrdMIGhCoitZAQuw1MPyjb8vrWocQR6yMhyJLfSu
 XBNgoQ4qkBFYyJ8Q3Xoxls2ktzWCUEF1J40JYnwx0VldISXYYfQtHzAVUDTo2Da2vVYXG2
 qi0Ij20xw4T++9XqNYpoG+v0Yc+N/LOml5YlAcmT7Dn+BR39cQSq/yb/daaTkE4Ob43lp8
 L3zVJk3aCHp43LWKeSZDEbTdp+lV81XbcR8Li+vCbonc8v38MdLdXXM+WEIbwE31BSQWdG
 5yH+PQjKFf8Np9cam42IGqI5KhXYpOxloQBCIse7TjZuZZGs1dG9kpDspizI1A==
Date: Mon, 20 May 2024 14:01:48 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic
 <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Saravana Kannan <saravanak@google.com>, Paul
 Kocialkowski <contact@paulk.fr>, =?UTF-8?Q?Herv=C3=A9?= Codina
 <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Paul
 Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v2 0/5] Add support for GE SUNH hot-pluggable connector
 (was: "drm: add support for hot-pluggable bridges")
Message-ID: <20240520140148.26b91240@booty>
In-Reply-To: <ZkYIeWzYyxkURS79@phenom.ffwll.local>
References: <20240510-hotplug-drm-bridge-v2-0-ec32f2c66d56@bootlin.com>
 <ZkYIeWzYyxkURS79@phenom.ffwll.local>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: luca.ceresoli@bootlin.com
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

Hello Daniel,

On Thu, 16 May 2024 15:22:01 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> Apologies for missing v1 ...
>=20
> On Fri, May 10, 2024 at 09:10:36AM +0200, Luca Ceresoli wrote:
> > DRM hotplug bridge driver
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> >=20
> > DRM natively supports pipelines whose display can be removed, but all t=
he
> > components preceding it (all the display controller and any bridges) are
> > assumed to be fixed and cannot be plugged, removed or modified at runti=
me.
> >=20
> > This series adds support for DRM pipelines having a removable part after
> > the encoder, thus also allowing bridges to be removed and reconnected at
> > runtime, possibly with different components.
> >=20
> > This picture summarizes the  DRM structure implemented by this series:
> >=20
> >  .------------------------.
> >  |   DISPLAY CONTROLLER   |
> >  | .---------.   .------. |
> >  | | ENCODER |<--| CRTC | |
> >  | '---------'   '------' |
> >  '------|-----------------'
> >         |
> >         |DSI            HOTPLUG
> >         V              CONNECTOR
> >    .---------.        .--.    .-.        .---------.         .-------.
> >    | 0 to N  |        | _|   _| |        | 1 to N  |         |       |
> >    | BRIDGES |--DSI-->||_   |_  |--DSI-->| BRIDGES |--LVDS-->| PANEL |
> >    |         |        |  |    | |        |         |         |       |
> >    '---------'        '--'    '-'        '---------'         '-------'
> >=20
> >  [--- fixed components --]  [----------- removable add-on -----------]
> >=20
> > Fixed components include:
> >=20
> >  * all components up to the DRM encoder, usually part of the SoC
> >  * optionally some bridges, in the SoC and/or as external chips
> >=20
> > Components on the removable add-on include:
> >=20
> >  * one or more bridges
> >  * a fixed connector (not one natively supporting hotplug such as HDMI)
> >  * the panel =20
>=20
> So I think at a high level this design approach makes sense,

Good starting point :)

> but the
> implementation needs some serious thought. One big thing upfront though,
> we need to have a clear plan for the overlay hotunload issues, otherwise
> trying to make drm bridges hotpluggable makes no sense to me. Hotunload is
> very, very tricky, full of lifetime issues, and those need to be sorted
> out first or we're just trying to build a castle on quicksand.
>=20
> For bridges itself I don't think the current locking works. You're trying
> to really cleverly hide it all behind a normal-looking bridge driver, but
> there's many things beyond that which will blow up if bridges just
> disappear. Most importantly the bridge states part of an atomic update.

Surely possible as atomic updates are definitely not stimulated in my
use case. Can you recommend any testing tools to be able to trigger any
issues?

The main setups I used for my testing so far are 'modetest -s' for my
daily work and a simple weston setup to periodically test a complete
user space stack.

> Now in drm we have drm_connector as the only hotunpluggable thing, and it
> took years to sort out all the issues. I think we should either model the
> bridge hotunplug locking after that, or just outright reuse the connector
> locking and lifetime rules. I much prefer the latter personally.
>=20
> Anyway the big issues:
>=20
> - We need to refcount the hotpluggable bridges, because software (like
>   atomic state updates) might hang onto pointers for longer than the
>   bridge physically exists. Assuming that you can all tear it down
>   synchronously will not work.
>=20
>   If we reuse connector locking/lifetime then we could put the
>   hotpluggable part of the bridge chain into the drm_connector, since that
>   already has refcounting as needed. It would mean that finding the next
>   bridge in the chain becomes a lot more tricky though. With that model
>   we'd create a new connector every time the bridge is hotplugged, which I
>   think is also the cleaner model (because you might plug in a hdmi
>   connector after a panel, so things like the connector type change).

I have been investigating the option of adding/removing a connector
based on hot-plug/unplug events initially, see my reply to Maxime after
v1 [0]:

> The first approach is based on removing the drm_connector. My laptop
> uses the i915 driver, and I have observed that attaching/removing a
> USB-C dock with an HDMI connector connected to a monitor, a new
> drm_connector appears/disappears for the card. User space gets notified
> and the external monitor is enabled/disabled, just the way a desktop
> user would expect, so this is possible. I had a look at the driver but
> how this magic happens was not clear to me honestly.

So if you could point to where/how this is done, I would certainly
reconsider that.

> - No notifiers please. The create a locking mess with inversions, and
>   especially for hotunplug they create the illusion that you can
>   synchronously keep up to date with hardware state. That's not possible.
>   Fundamentally all bridge drivers which might be hotunplugged need to be
>   able to cope with the hardware disappearing any momemnt.

Can you clarify this point? I'm sorry I fail to understand the
relationship between the use of notifiers and the ability of bridge
drivers to cope with hardware disappearing.

In this patch, the hotplug-bridge uses notifiers to be informed when
the following bridge is disappearing: which other way would you suggest
to make the hotplug-bridge aware of that? OTOH the hotplug-bridge is
not meant to disappear, and it has no actual hardware that can go away,
being just a mechanical connector.

On the opposite side, the following bridges are physically removable
and so their drivers will have to be fixed (if needed) to work when
removal happens, but I don't see how that relates to the DRM core
emitting a notification of such bridges being removed.

> - Related to this: You're not allowed to shut down hardware behind the
>   user's back with drm_atomic_helper_shutdown. We've tried that approach
>   with dp mst, it really pisses off userspace when a page_flip that it
>   expected to work doesn't work.
>=20
> - There's also the design aspect that in atomic, only atomic_check is
>   allowed to fail, atomic_commit must succeed, even when the hardware is
>   gone. Using connectors and their refcounting should help with that.

IIUC here you are suggesting again to remove the connector instead of
marking it "disconnected". So, as above, pointers on how that is
achieved would be helpful.

> - Somewhat aside, but I noticed that the bridge->atomic_reset is in
>   drm_bridge_attach, and that's kinda the wrong place. It should be in
>   drm_mode_config_reset, like all the other ->atomic_reset hooks. That
>   would make it a lot clearer that we need to figure out who/when
>   ->atomic_reset should be called for hotplugged bridges, maybe as part o=
f =20
>   connector registration when the entire bridge and it's new connector is
>   assembled?
>=20
> - Finally this very much means we need to rethink who/how the connector
>   for a bridge is created. The new design is that the main driver creates
>   this connector, once the entire bridge exists. But with hotplugging this
>   gets a lot more complicated, so we might want to extract a pile of that
>   encoder related code from drivers (same way dp mst helpers take care of
>   connector creation too, it's just too much of a mess otherwise).
>=20
>   The current bridge chaining infrastructure requires a lot of hand-rolled
>   code in each bridge driver and the encoder, so that might be a good
>   thing anyway.
>=20
> - Finally I think the entire bridge hotplug infrastructure should be
>   irrespective of the underlying bus. Which means for the mipi dsi case we
>   might also want to look into what's missing to make mipi dsi
>   hotunpluggable, at least for the case where it's a proper driver. I
>   think we should ignore the old bridge model where driver's stitched it
>   all toghether using the component framework, in my opinion that approach
>   should be deprecated.

The DSI side was one of my headaches on writing this driver, and I
must say I dislike the code in hotplug_bridge_dsi_attach(), with the
need for an initial "dummy" attach and detach the first time. At first
sight I think we need a .update_format callback in struct
mipi_dsi_host_ops so the DSI host is aware of a format change.

Right now there are DSI host drivers which keep a copy of the struct
mipi_dsi_device pointer and read the format from there when starting a
stream (e.g. the tc358768.c driver [1]). That somewhat provides a way
to react to format changes, but keeping a pointer is bad when the DSI
device hot-unplugs, and the new format won't be seen until a
disable/enable cycle. So a new callback looks more robust overall.

Any opinion about this?

> - Finally I think we should have a lot of safety checks, like only bridges
>   which declare themselve to be hotunplug safe should be allowed as a part
>   of the hotpluggable bridge chain part. All others must still be attached
>   before the entire driver is registered with drm_dev_register.

I'm fine with the principle of a "HOTPLUG" flag.

I wonder how that should be implemented, though. Based on my (surely
simplistic) understanding, right now bridges can be both added and
removed, but only in a specific sequence:

 1. add all bridges
 2. use the card
 3. remove all bridges
 4. EOF

We'd need to change to allow:

 1. add fixed bridges (including hotplug-bridge)
 2. add bridges on removable add-on
 3. use card
 4. remove bridges on removable add-on
 5. optionally goto 2
 6. remove fixed bridges (including hotplug-bridge)
 7. EOF

One na=C3=AFve idea is that the DRM core keeps a flag whenever any fixed
bridge (no HOTLPUG flag) is removed and when that happens forbid adding
bridges as we are now at line 5.

Aside for tons of subtleties I'm surely missing, does this look a
proper approach? I'd not be surprised if there is something better and
more solid.

>   Or that we only allow bridges with the NO_CONNECTOR flag for
>   drm_bridge_attach.
>=20
> There's probably a pile more fundamental issues I've missed, but this
> should get a good discussion started.

Sure, I think it has.

Bottom line, I'm clearly not seeing some issues that need to be
considered, and that do not show up for my use case. Based on my
limited DRM knowledge, this was expected, and I'm glad to work on those
issues with some practical indications about the path forward.

Luca

[0] https://lore.kernel.org/all/20240327170849.0c14728d@booty/
[1] https://elixir.bootlin.com/linux/v6.9.1/source/drivers/gpu/drm/bridge/t=
c358768.c#L435

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

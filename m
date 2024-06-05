Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D278FD112
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 16:47:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1537B10E620;
	Wed,  5 Jun 2024 14:47:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="dMNzvEa/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 968C810E620
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 14:47:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B2720E0002;
 Wed,  5 Jun 2024 14:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1717598831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6lSFiDe9D95DGeCiF3FmE2yv4+FgrA5AYOa/C7Wu8MU=;
 b=dMNzvEa/6IeNdu+Sa2H6LFBOlZhrBV6eUXF4SgRKyv8nUGRrLZ/Wb42PEcnTXITqwDuOw7
 8h/Ek7e7fvurCClN7V1m7sA3x7yNleu4Z4twDXKqHQeCTzxP3i/9Toaki5PgBUgRR51nTc
 LyCx41/+TxG0RKCRmkjUds49rwnx3J58a2c0bhpNefRzaf44N1P4G8bsV3F+mB+3CQfazg
 YR1ElGQpkUFfvceclORYxZf4tPB+8hH7HxbqocqPe+9Jy7vUVGoV/voktuxE2ZJpSB99ql
 Xlo7Ucg1H9sW7y9Bs3giJJaPDdE1UokrB05Lj1i97qzcl+qtifcXhBLfHQc2IA==
Date: Wed, 5 Jun 2024 16:47:07 +0200
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
 Kocialkowski <paul.kocialkowski@bootlin.com>, Louis Chauvet
 <louis.chauvet@bootlin.com>
Subject: Re: [PATCH v2 0/5] Add support for GE SUNH hot-pluggable connector
 (was: "drm: add support for hot-pluggable bridges")
Message-ID: <20240605164707.3e020ea4@booty>
In-Reply-To: <ZkyND17TGj6y0Wjq@phenom.ffwll.local>
References: <20240510-hotplug-drm-bridge-v2-0-ec32f2c66d56@bootlin.com>
 <ZkYIeWzYyxkURS79@phenom.ffwll.local>
 <20240520140148.26b91240@booty>
 <ZkyND17TGj6y0Wjq@phenom.ffwll.local>
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

Hello Sima,

thanks again for your comments. Not yet enough for me to clearly focus
what you are suggesting, but getting closer. See my questions below.

On Tue, 21 May 2024 14:01:19 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Mon, May 20, 2024 at 02:01:48PM +0200, Luca Ceresoli wrote:
> > Hello Daniel,
> >=20
> > On Thu, 16 May 2024 15:22:01 +0200
> > Daniel Vetter <daniel@ffwll.ch> wrote:
> >  =20
> > > Apologies for missing v1 ...
> > >=20
> > > On Fri, May 10, 2024 at 09:10:36AM +0200, Luca Ceresoli wrote: =20
> > > > DRM hotplug bridge driver
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > > >=20
> > > > DRM natively supports pipelines whose display can be removed, but a=
ll the
> > > > components preceding it (all the display controller and any bridges=
) are
> > > > assumed to be fixed and cannot be plugged, removed or modified at r=
untime.
> > > >=20
> > > > This series adds support for DRM pipelines having a removable part =
after
> > > > the encoder, thus also allowing bridges to be removed and reconnect=
ed at
> > > > runtime, possibly with different components.
> > > >=20
> > > > This picture summarizes the  DRM structure implemented by this seri=
es:
> > > >=20
> > > >  .------------------------.
> > > >  |   DISPLAY CONTROLLER   |
> > > >  | .---------.   .------. |
> > > >  | | ENCODER |<--| CRTC | |
> > > >  | '---------'   '------' |
> > > >  '------|-----------------'
> > > >         |
> > > >         |DSI            HOTPLUG
> > > >         V              CONNECTOR
> > > >    .---------.        .--.    .-.        .---------.         .-----=
--.
> > > >    | 0 to N  |        | _|   _| |        | 1 to N  |         |     =
  |
> > > >    | BRIDGES |--DSI-->||_   |_  |--DSI-->| BRIDGES |--LVDS-->| PANE=
L |
> > > >    |         |        |  |    | |        |         |         |     =
  |
> > > >    '---------'        '--'    '-'        '---------'         '-----=
--'
> > > >=20
> > > >  [--- fixed components --]  [----------- removable add-on ---------=
--]
> > > >=20
> > > > Fixed components include:
> > > >=20
> > > >  * all components up to the DRM encoder, usually part of the SoC
> > > >  * optionally some bridges, in the SoC and/or as external chips
> > > >=20
> > > > Components on the removable add-on include:
> > > >=20
> > > >  * one or more bridges
> > > >  * a fixed connector (not one natively supporting hotplug such as H=
DMI)
> > > >  * the panel   =20
> > >=20
> > > So I think at a high level this design approach makes sense, =20
> >=20
> > Good starting point :)
> >  =20
> > > but the
> > > implementation needs some serious thought. One big thing upfront thou=
gh,
> > > we need to have a clear plan for the overlay hotunload issues, otherw=
ise
> > > trying to make drm bridges hotpluggable makes no sense to me. Hotunlo=
ad is
> > > very, very tricky, full of lifetime issues, and those need to be sort=
ed
> > > out first or we're just trying to build a castle on quicksand.
> > >=20
> > > For bridges itself I don't think the current locking works. You're tr=
ying
> > > to really cleverly hide it all behind a normal-looking bridge driver,=
 but
> > > there's many things beyond that which will blow up if bridges just
> > > disappear. Most importantly the bridge states part of an atomic updat=
e. =20
> >=20
> > Surely possible as atomic updates are definitely not stimulated in my
> > use case. Can you recommend any testing tools to be able to trigger any
> > issues? =20
>=20
> Uh really hard ... You'd need to create an atomic commit that's blocked on
> a sync_file in-fence (so that you can extend the race window). And then
> hotunplug the bridge chain _before_ you signal that fence.
>=20
> That's not going to cover all possible races, but at least a large chunk
> of the really big ones.
>=20
> > The main setups I used for my testing so far are 'modetest -s' for my
> > daily work and a simple weston setup to periodically test a complete
> > user space stack.
> >  =20
> > > Now in drm we have drm_connector as the only hotunpluggable thing, an=
d it
> > > took years to sort out all the issues. I think we should either model=
 the
> > > bridge hotunplug locking after that, or just outright reuse the conne=
ctor
> > > locking and lifetime rules. I much prefer the latter personally.
> > >=20
> > > Anyway the big issues:
> > >=20
> > > - We need to refcount the hotpluggable bridges, because software (like
> > >   atomic state updates) might hang onto pointers for longer than the
> > >   bridge physically exists. Assuming that you can all tear it down
> > >   synchronously will not work.
> > >=20
> > >   If we reuse connector locking/lifetime then we could put the
> > >   hotpluggable part of the bridge chain into the drm_connector, since=
 that
> > >   already has refcounting as needed. It would mean that finding the n=
ext
> > >   bridge in the chain becomes a lot more tricky though. With that mod=
el
> > >   we'd create a new connector every time the bridge is hotplugged, wh=
ich I
> > >   think is also the cleaner model (because you might plug in a hdmi
> > >   connector after a panel, so things like the connector type change).=
 =20
> >=20
> > I have been investigating the option of adding/removing a connector
> > based on hot-plug/unplug events initially, see my reply to Maxime after
> > v1 [0]:
> >  =20
> > > The first approach is based on removing the drm_connector. My laptop
> > > uses the i915 driver, and I have observed that attaching/removing a
> > > USB-C dock with an HDMI connector connected to a monitor, a new
> > > drm_connector appears/disappears for the card. User space gets notifi=
ed
> > > and the external monitor is enabled/disabled, just the way a desktop
> > > user would expect, so this is possible. I had a look at the driver but
> > > how this magic happens was not clear to me honestly. =20
> >=20
> > So if you could point to where/how this is done, I would certainly
> > reconsider that. =20
>=20
> Right now only the dp mst code uses hotplug/unplug (like you've observed
> in your testing with i915, usb-c docks are generally all dp mst). For code
> reading it might be best to start with the i915 dp mst code and then go
> through the helpers.
>=20
> > > - No notifiers please. The create a locking mess with inversions, and
> > >   especially for hotunplug they create the illusion that you can
> > >   synchronously keep up to date with hardware state. That's not possi=
ble.
> > >   Fundamentally all bridge drivers which might be hotunplugged need t=
o be
> > >   able to cope with the hardware disappearing any momemnt. =20
> >=20
> > Can you clarify this point? I'm sorry I fail to understand the
> > relationship between the use of notifiers and the ability of bridge
> > drivers to cope with hardware disappearing.
> >=20
> > In this patch, the hotplug-bridge uses notifiers to be informed when
> > the following bridge is disappearing: which other way would you suggest
> > to make the hotplug-bridge aware of that? OTOH the hotplug-bridge is
> > not meant to disappear, and it has no actual hardware that can go away,
> > being just a mechanical connector. =20
>=20
> Yeah you need code to handle that. My point is that using a notifier is
> the wrong design, because the notifier has it's own locking. Which tends
> to get in the way.
>=20
> Instead I think that code should be directly in core bridge code (I don't
> see the benefit of having this entirely in a separate driver), using drm
> locking to make sure there's no races.
>=20
> > On the opposite side, the following bridges are physically removable
> > and so their drivers will have to be fixed (if needed) to work when
> > removal happens, but I don't see how that relates to the DRM core
> > emitting a notification of such bridges being removed. =20
>=20
> Yeah it's not directly related, just my experience that people assume
> notifiers provide you more synchronization and race-preventation than they
> really do. So it's better to hand-roll to make it all really explicit.
>=20
> > > - Related to this: You're not allowed to shut down hardware behind the
> > >   user's back with drm_atomic_helper_shutdown. We've tried that appro=
ach
> > >   with dp mst, it really pisses off userspace when a page_flip that it
> > >   expected to work doesn't work.
> > >=20
> > > - There's also the design aspect that in atomic, only atomic_check is
> > >   allowed to fail, atomic_commit must succeed, even when the hardware=
 is
> > >   gone. Using connectors and their refcounting should help with that.=
 =20
> >=20
> > IIUC here you are suggesting again to remove the connector instead of
> > marking it "disconnected". So, as above, pointers on how that is
> > achieved would be helpful. =20
>=20
> See dp mst code. It's complex unfortunately, so there's some reading
> involved :-/
> > =20
> > > - Somewhat aside, but I noticed that the bridge->atomic_reset is in
> > >   drm_bridge_attach, and that's kinda the wrong place. It should be in
> > >   drm_mode_config_reset, like all the other ->atomic_reset hooks. That
> > >   would make it a lot clearer that we need to figure out who/when =20
> > >   ->atomic_reset should be called for hotplugged bridges, maybe as pa=
rt of   =20
> > >   connector registration when the entire bridge and it's new connecto=
r is
> > >   assembled?
> > >=20
> > > - Finally this very much means we need to rethink who/how the connect=
or
> > >   for a bridge is created. The new design is that the main driver cre=
ates
> > >   this connector, once the entire bridge exists. But with hotplugging=
 this
> > >   gets a lot more complicated, so we might want to extract a pile of =
that
> > >   encoder related code from drivers (same way dp mst helpers take car=
e of
> > >   connector creation too, it's just too much of a mess otherwise).
> > >=20
> > >   The current bridge chaining infrastructure requires a lot of hand-r=
olled
> > >   code in each bridge driver and the encoder, so that might be a good
> > >   thing anyway.
> > >=20
> > > - Finally I think the entire bridge hotplug infrastructure should be
> > >   irrespective of the underlying bus. Which means for the mipi dsi ca=
se we
> > >   might also want to look into what's missing to make mipi dsi
> > >   hotunpluggable, at least for the case where it's a proper driver. I
> > >   think we should ignore the old bridge model where driver's stitched=
 it
> > >   all toghether using the component framework, in my opinion that app=
roach
> > >   should be deprecated. =20
> >=20
> > The DSI side was one of my headaches on writing this driver, and I
> > must say I dislike the code in hotplug_bridge_dsi_attach(), with the
> > need for an initial "dummy" attach and detach the first time. At first
> > sight I think we need a .update_format callback in struct
> > mipi_dsi_host_ops so the DSI host is aware of a format change.
> >=20
> > Right now there are DSI host drivers which keep a copy of the struct
> > mipi_dsi_device pointer and read the format from there when starting a
> > stream (e.g. the tc358768.c driver [1]). That somewhat provides a way
> > to react to format changes, but keeping a pointer is bad when the DSI
> > device hot-unplugs, and the new format won't be seen until a
> > disable/enable cycle. So a new callback looks more robust overall.
> >=20
> > Any opinion about this? =20
>=20
> Yeah I don't like the code either.
>=20
> What might help for prototyping is if you start with a hotpluggeable
> bridge where the bridge is a i2c device. That way I think we should be
> able to benefit from the driver bind/unbind code that exists already.
> Although there's going to be issues with i2c hotunplug too in i2c core
> code.

Good news: the bridge here is an I2C device (ti-sn65dsi84, dsi-to-lvds).

> Then lift whatever we learn there to our dsi code. But essentially I think
> we should model the driver core model a lot more, so I guess you could use
> any hotunplug capable bus as a template. Usb might be closest, since
> that's also a packet/message based interface, mostly at least?
>=20
> > > - Finally I think we should have a lot of safety checks, like only br=
idges
> > >   which declare themselve to be hotunplug safe should be allowed as a=
 part
> > >   of the hotpluggable bridge chain part. All others must still be att=
ached
> > >   before the entire driver is registered with drm_dev_register. =20
> >=20
> > I'm fine with the principle of a "HOTPLUG" flag.
> >=20
> > I wonder how that should be implemented, though. Based on my (surely
> > simplistic) understanding, right now bridges can be both added and
> > removed, but only in a specific sequence:
> >=20
> >  1. add all bridges
> >  2. use the card
> >  3. remove all bridges
> >  4. EOF
> >=20
> > We'd need to change to allow:
> >=20
> >  1. add fixed bridges (including hotplug-bridge)
> >  2. add bridges on removable add-on
> >  3. use card
> >  4. remove bridges on removable add-on
> >  5. optionally goto 2
> >  6. remove fixed bridges (including hotplug-bridge)
> >  7. EOF
> >=20
> > One na=C3=AFve idea is that the DRM core keeps a flag whenever any fixed
> > bridge (no HOTLPUG flag) is removed and when that happens forbid adding
> > bridges as we are now at line 5. =20
>=20
> If a fixed bridge is removed while the driver is still in use (i.e. before
> drm_dev_unregister is called), that's a driver bug. Would be good to catch
> that, which is why I think a lot of all the bridge hotplug handling should
> be in core bridge code and not the separate hotplug driver, so that we can
> enforce all these constraints.
>=20
> Also conceptually 3 can happen before 2 (but also before), and that's how
> dp mst works too. It does add all kinds of complications though ...
>=20
> > Aside for tons of subtleties I'm surely missing, does this look a
> > proper approach? I'd not be surprised if there is something better and
> > more solid. =20
>=20
> Yeah roughly. If you look through dp mst code then that also adds all
> kinds of structures (since dp mst is a routed network really), not just
> the connectors. They also all come with refcounts (because the network is
> a tree), but like I said I think for your case we can avoid the per-bridge
> refcounts by relying on the connector refcount we have already.
>=20
> But I might be overlooking something, and we need refcounting for each
> bridge like dp mst also needs refcounting for all its internal structures
> that map the entire hotpluggable display chain. If you want to read some
> dp mst code, these internal structures are ports/branches with struct
> drm_dp_mst_branch/port.
>=20
> > >   Or that we only allow bridges with the NO_CONNECTOR flag for
> > >   drm_bridge_attach.
> > >=20
> > > There's probably a pile more fundamental issues I've missed, but this
> > > should get a good discussion started. =20
> >=20
> > Sure, I think it has.
> >=20
> > Bottom line, I'm clearly not seeing some issues that need to be
> > considered, and that do not show up for my use case. Based on my
> > limited DRM knowledge, this was expected, and I'm glad to work on those
> > issues with some practical indications about the path forward. =20
>=20
> Yeah for learning I think dp mst is best. It's a bit complex, but since
> you have a dock you should be able to play around and experiment with the
> code with some real hardware.
>=20
> That should help to get a bit a feel for the complexity, since lots of
> opportunities for you to ask why/how locking/refcounting is used and
> against which potential issue they protect.

I had an initial quick look at DP MSI and it looks like a huge amount
code where it's going to take forever to find my way without guidance.
Keep in mind there is no DP hardware involved in this whole work: as I
see it, DP MST is just one user (possibly the only one currently) of
runtime connector insertion and removal.

This is my understanding so far:

 1. DP MST creates/destroys connectors at runtime, based on MST protocol
    info the MST devices use to announce themselves
 2. the DRM core has no idea of how these connectors relate to each
    other (e.g. DP-1 is a child of DP-0, just another unrelated
    connector); only the drivers know, and implement this leveraging the
    dp_mst helpers
 3. DP MST does not involve DRM bridges: everything after the "first"
    connector (USB-C for docks) is just "DP MST stuff"

Point 3 is problematic as my primary need is exactly to have a
removable bridge. Besides, its creation is not under my driver control,
being done via device tree, and there could even be more than 1 bridge,
or even no bridges at all on the removable side.

I'd appreciate your guidance especially about:

 * test atomic change to expose any lifetime bugs, as you suggested
 * which are the exact APIs to handle connector insertion/removal (as
   done by DP MST)
 * comments about the three points above, especially point 3

Pointers to code or other specific indications that lead me to the
exact code would be very appreciated, and definitely save me days of
digging into complex code without a precise knowledge about where to go.

Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

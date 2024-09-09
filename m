Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D36C6971AF4
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 15:26:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE0B210E56C;
	Mon,  9 Sep 2024 13:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="a9SiEeCb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0019A10E56C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 13:26:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4247F20009;
 Mon,  9 Sep 2024 13:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1725888370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rj6u0uCaoI3E5WwnapVPSNbytM7qHz8or5YX3E1UxJY=;
 b=a9SiEeCbEt7y9wtjVZRwYF9sruJzzmU/+QkpsIRozfrDZc8ooyrKg54tjwS1hxNCgx6NQO
 LieWvFAU0B01RkOiZqR/r64x4ZfckEVATp/BR9dsE2BrvK4pSLUlV9au+PH3vyS7LMx0ad
 KBKXPGvDKGNCfK13aCui1wN47vsRpm3gTkYbyENmKFwT0ID8/cKXNhDzFpBENCE9XuiqSf
 yQNbfBjGAJN9Zt5xZNYEWOvvJfeGrTfbQLhkbIJn0iNr44dtnI9P+xte66XuHSgctGnuZK
 piNRajxmxHmYsUTXk8z637rt7a8dN1AuMWaezx26g4MPtcfNVHwN2uli0GuIMw==
Date: Mon, 9 Sep 2024 15:26:04 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic
 <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Saravana Kannan <saravanak@google.com>, Paul
 Kocialkowski <contact@paulk.fr>, =?UTF-8?Q?Herv=C3=A9?= Codina
 <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Paul
 Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v2 0/5] Add support for GE SUNH hot-pluggable connector
 (was: "drm: add support for hot-pluggable bridges")
Message-ID: <20240909152604.1dd27605@booty>
In-Reply-To: <Zs4AuPPHaFY0WzBZ@phenom.ffwll.local>
References: <20240510-hotplug-drm-bridge-v2-0-ec32f2c66d56@bootlin.com>
 <ZkYIeWzYyxkURS79@phenom.ffwll.local>
 <20240520140148.26b91240@booty>
 <ZkyND17TGj6y0Wjq@phenom.ffwll.local>
 <20240823123903.1c793c4b@booty>
 <Zs4AuPPHaFY0WzBZ@phenom.ffwll.local>
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

again thanks for your feedback, and again I'm afraid I'm having a hard
time in understanding large parts of your e-mail. Below I'm trying to
focus on one fundamental aspect only, which I need to understand the
overall approach you are suggesting.

On Tue, 27 Aug 2024 18:37:12 +0200
Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> On Fri, Aug 23, 2024 at 12:39:03PM +0200, Luca Ceresoli wrote:
> > Hello Sima,
> >=20
> > these days I started looking in more detail into some of the topics you
> > had mentioned in your v2 review. I have questions about those I have
> > investigated, see below.
> >=20
> > On Tue, 21 May 2024 14:01:19 +0200
> > Daniel Vetter <daniel@ffwll.ch> wrote:
> >  =20
> > > On Mon, May 20, 2024 at 02:01:48PM +0200, Luca Ceresoli wrote: =20
> > > > Hello Daniel,
> > > >=20
> > > > On Thu, 16 May 2024 15:22:01 +0200
> > > > Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >    =20
> > > > > Apologies for missing v1 ...
> > > > >=20
> > > > > On Fri, May 10, 2024 at 09:10:36AM +0200, Luca Ceresoli wrote:   =
=20
> > > > > > DRM hotplug bridge driver
> > > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> > > > > >=20
> > > > > > DRM natively supports pipelines whose display can be removed, b=
ut all the
> > > > > > components preceding it (all the display controller and any bri=
dges) are
> > > > > > assumed to be fixed and cannot be plugged, removed or modified =
at runtime.
> > > > > >=20
> > > > > > This series adds support for DRM pipelines having a removable p=
art after
> > > > > > the encoder, thus also allowing bridges to be removed and recon=
nected at
> > > > > > runtime, possibly with different components.
> > > > > >=20
> > > > > > This picture summarizes the  DRM structure implemented by this =
series:
> > > > > >=20
> > > > > >  .------------------------.
> > > > > >  |   DISPLAY CONTROLLER   |
> > > > > >  | .---------.   .------. |
> > > > > >  | | ENCODER |<--| CRTC | |
> > > > > >  | '---------'   '------' |
> > > > > >  '------|-----------------'
> > > > > >         |
> > > > > >         |DSI            HOTPLUG
> > > > > >         V              CONNECTOR
> > > > > >    .---------.        .--.    .-.        .---------.         .-=
------.
> > > > > >    | 0 to N  |        | _|   _| |        | 1 to N  |         | =
      |
> > > > > >    | BRIDGES |--DSI-->||_   |_  |--DSI-->| BRIDGES |--LVDS-->| =
PANEL |
> > > > > >    |         |        |  |    | |        |         |         | =
      |
> > > > > >    '---------'        '--'    '-'        '---------'         '-=
------'
> > > > > >=20
> > > > > >  [--- fixed components --]  [----------- removable add-on -----=
------]
> > > > > >=20
> > > > > > Fixed components include:
> > > > > >=20
> > > > > >  * all components up to the DRM encoder, usually part of the SoC
> > > > > >  * optionally some bridges, in the SoC and/or as external chips
> > > > > >=20
> > > > > > Components on the removable add-on include:
> > > > > >=20
> > > > > >  * one or more bridges
> > > > > >  * a fixed connector (not one natively supporting hotplug such =
as HDMI)
> > > > > >  * the panel     =20
> > > > >=20
> > > > > So I think at a high level this design approach makes sense,   =20
> > > >=20
> > > > Good starting point :)
> > > >    =20
> > > > > but the
> > > > > implementation needs some serious thought. One big thing upfront =
though,
> > > > > we need to have a clear plan for the overlay hotunload issues, ot=
herwise
> > > > > trying to make drm bridges hotpluggable makes no sense to me. Hot=
unload is
> > > > > very, very tricky, full of lifetime issues, and those need to be =
sorted
> > > > > out first or we're just trying to build a castle on quicksand.
> > > > >=20
> > > > > For bridges itself I don't think the current locking works. You'r=
e trying
> > > > > to really cleverly hide it all behind a normal-looking bridge dri=
ver, but
> > > > > there's many things beyond that which will blow up if bridges just
> > > > > disappear. Most importantly the bridge states part of an atomic u=
pdate.   =20
> > > >=20
> > > > Surely possible as atomic updates are definitely not stimulated in =
my
> > > > use case. Can you recommend any testing tools to be able to trigger=
 any
> > > > issues?   =20
> > >=20
> > > Uh really hard ... You'd need to create an atomic commit that's block=
ed on
> > > a sync_file in-fence (so that you can extend the race window). And th=
en
> > > hotunplug the bridge chain _before_ you signal that fence.
> > >=20
> > > That's not going to cover all possible races, but at least a large ch=
unk
> > > of the really big ones.
> > >  =20
> > > > The main setups I used for my testing so far are 'modetest -s' for =
my
> > > > daily work and a simple weston setup to periodically test a complete
> > > > user space stack.
> > > >    =20
> > > > > Now in drm we have drm_connector as the only hotunpluggable thing=
, and it
> > > > > took years to sort out all the issues. I think we should either m=
odel the
> > > > > bridge hotunplug locking after that, or just outright reuse the c=
onnector
> > > > > locking and lifetime rules. I much prefer the latter personally.
> > > > >=20
> > > > > Anyway the big issues:
> > > > >=20
> > > > > - We need to refcount the hotpluggable bridges, because software =
(like
> > > > >   atomic state updates) might hang onto pointers for longer than =
the
> > > > >   bridge physically exists. Assuming that you can all tear it down
> > > > >   synchronously will not work.
> > > > >=20
> > > > >   If we reuse connector locking/lifetime then we could put the
> > > > >   hotpluggable part of the bridge chain into the drm_connector, s=
ince that
> > > > >   already has refcounting as needed. It would mean that finding t=
he next
> > > > >   bridge in the chain becomes a lot more tricky though. With that=
 model
> > > > >   we'd create a new connector every time the bridge is hotplugged=
, which I
> > > > >   think is also the cleaner model (because you might plug in a hd=
mi
> > > > >   connector after a panel, so things like the connector type chan=
ge). =20
> >=20
> > So, based on your dp__mst hint I added connector creation/removal in the
> > v3 I sent a few days ago. All other aspects in your list are unchanged
> > from the v2 you have reviewed.
> >=20
> > Now I'm trying to tackle some other of the items you mentioned here,
> > and locking/lifetime is the hardest one for me to understand at the
> > moment.
> >=20
> > If I get you right, you suggest making all the removable bridges
> > "owned" by the connector that gets hotplugged, the reason being that
> > locking and lifetime issues for the hotplug connectors have already
> > been sorted out, while that has not been done for bridges.
> >=20
> > Correct? =20
>=20
> Yes.
>=20
> > Assuming the above is correct, I'm wondering whether this would be a
> > correct design or rather a shortcut to leverage the connector locking
> > instead of implementing bridge locking/lifetime. Note I'm not
> > criticizing, I'm really asking myself this question and I'd like to
> > know your position about that.
> >=20
> > Again about putting the removable bridges inside the hotplug connector,
> > I'm trying to understand how that may happen in the device tree case.
> > The hot-pluggable bridge is populated starting from the DT code
> > (through i2c-core-of in my case being an I2C chip), and that code is
> > not aware that it is being instantiating a DRM device. So there is
> > nothing we can do before the bridge probe is called. The bridge probe
> > then does know much about any connectors. It also does not know about
> > hotplug: this is a design decision I made to make the regular bridge
> > drivers reusable without edits for the hotplug case, but it can be
> > waived if needed.
> >=20
> > So the only way I currently to move the bridge inside the connector is
> > to catch it in the hotplug-bridge driver, when it gets notified about
> > the new bridge having appeared (was a notifier, I'm changing that, see
> > below). So the hotplug-bridge would need a function line
> > drm_connector_add_bridge(conn, br) to make the association.
> >=20
> > Is this the direction of development you had in mind? =20
>=20
> Not quite. The issue is that while bridges are getting hotplugged, you
> don't yet have a connector. So there's nothing you can attach to. What I
> had in mind is more:
>=20

There is a fundamental question where your position is not clear to me.
Based on this:

> - The last fixed bridges knows that all subsequent bridges are hotplugged.
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   Which means instead of just asking for the next bridge, it needs to ask
>   for the fully formed bridge chain, including the connector.
>=20

and this:

> - The hotplug bridge connector code checks every time a new bridge shows
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   up whether the chain is now complete. Once that is the case, it creates
>   the connector (with the new bridge design this is no longer the job of
>   the last bridge in the chain, so we need to require that for
>   hotpluggable bridges). Then it can attach all the bridges to that
>   connector, and hand the entire fully formed chain to the last fixed
>   bridge to hotplug insert and register.

The question is: do you think the hotplug-bridge driver should be
present, or not? To me the two above sentences appear to contradict each
other.

The reason we decided to implement a hotplug DRM bridge is it allows to
decouple the fixed and the remote segments of the pipeline, in such a
way that all the regular bridge drivers don't need any special handling
to support hotplug.

In my work the upstream bridge driver is samsung-dsim.c and the
downstream one is ti-sn65dsi83.c and none of them needed a single line
changed to support hotplug. I think this is useful: virtually any
physical bridge with pins can be used in a hotplug setup, either in the
fixed or in the removable section, so not needing to modify them is
valuable.

OTOH in various parts of this and other e-mails you seem to imply that
there should be no hotplug-bridge (not as a struct drm_bridge, not as
a driver, or both). Except for the fact that there is no chip
implementing such a bridge (there is a physical connector though) I do
not see many reasons.

> - Hotunplug is the same, but on inverse: The entire chain including the
>   connector gets removed in it's entirety, before it gets dissassembled
>   and freed (once the last refcount to the connector is dropped).
>=20
> There is a _lot_ of handwaving in this on the driver model side, but with
> this the drm side should be clear and clean at least.
>=20
> > > > I have been investigating the option of adding/removing a connector
> > > > based on hot-plug/unplug events initially, see my reply to Maxime a=
fter
> > > > v1 [0]:
> > > >    =20
> > > > > The first approach is based on removing the drm_connector. My lap=
top
> > > > > uses the i915 driver, and I have observed that attaching/removing=
 a
> > > > > USB-C dock with an HDMI connector connected to a monitor, a new
> > > > > drm_connector appears/disappears for the card. User space gets no=
tified
> > > > > and the external monitor is enabled/disabled, just the way a desk=
top
> > > > > user would expect, so this is possible. I had a look at the drive=
r but
> > > > > how this magic happens was not clear to me honestly.   =20
> > > >=20
> > > > So if you could point to where/how this is done, I would certainly
> > > > reconsider that.   =20
> > >=20
> > > Right now only the dp mst code uses hotplug/unplug (like you've obser=
ved
> > > in your testing with i915, usb-c docks are generally all dp mst). For=
 code
> > > reading it might be best to start with the i915 dp mst code and then =
go
> > > through the helpers.
> > >  =20
> > > > > - No notifiers please. The create a locking mess with inversions,=
 and
> > > > >   especially for hotunplug they create the illusion that you can
> > > > >   synchronously keep up to date with hardware state. That's not p=
ossible.
> > > > >   Fundamentally all bridge drivers which might be hotunplugged ne=
ed to be
> > > > >   able to cope with the hardware disappearing any momemnt.   =20
> > > >=20
> > > > Can you clarify this point? I'm sorry I fail to understand the
> > > > relationship between the use of notifiers and the ability of bridge
> > > > drivers to cope with hardware disappearing.
> > > >=20
> > > > In this patch, the hotplug-bridge uses notifiers to be informed when
> > > > the following bridge is disappearing: which other way would you sug=
gest
> > > > to make the hotplug-bridge aware of that? OTOH the hotplug-bridge is
> > > > not meant to disappear, and it has no actual hardware that can go a=
way,
> > > > being just a mechanical connector.   =20
> > >=20
> > > Yeah you need code to handle that. My point is that using a notifier =
is
> > > the wrong design, because the notifier has it's own locking. Which te=
nds
> > > to get in the way. =20
> >=20
> > I went into this subject to see how drm_bridge_add() could inform the
> > interested bridges using a DRM-specific mechanism instead of standard
> > notifiers.
> >=20
> > However I think to inform *the interested* bridges, at least in the
> > device tree case, there is a fundamental issue: DRM core has no idea
> > about the topology. Definitely not at drm_bridge_add() time, way before
> > drm_bridge_attach() where the 'previous' pointer introduces a minimum
> > of topology awareness in the DRM core. =20
>=20
> Yeah we need special functions, which the last fixed bridge needs to call
> instead of the current set of functions. So instead of of_drm_find_bridge
> we need something like of_drm_register_hotplug_source_bridge or similar.

Continuing on the above topic, are you suggesting that there should be
no hotplug-bridge, and that every bridge that can be used as the "last
fixed bridge" should handle the hotplug case individually?

If that is the case, we'd need to modify any bridge driver that people
want to use as "last fixed bridge" to:

 1. know they are the "last fixed bridge" (via device tree?)
 2. use of_drm_register_hotplug_source_bridge()
    instead of of_drm_find_bridge() accordingly

> > Option 1 is to iterate over all the ports and endpoints and for every
> > remote-endpoint pointing to a bridge, inform the remote bridge about
> > that via a new optional callback in drm_bridge_funcs. That means likely
> > informing more bridges than needed, so when they get informed the
> > bridges will still have to check whether they are interested or not.
> >=20
> > Pseudocode:
> >=20
> >   void drm_bridge_add(struct drm_bridge *new_bridge)
> >   {
> >      // existing code unchanged
> >=20
> > +    if (bridge->of_node) {
> > +       for_each_remote_endpoint(bridge->of_node) {
> > +          br =3D of_drm_find_bridge(remote_endpoint);
> > +          if (br && br->funcs.bridge_event_notify)
> > +              br->funcs->bridge_event_notify(br, DRM_EVENT_BRIDGE_ADD,
> > +                                             new_bridge);
> > +       }
> > +    }
> >   }
> >=20
> > That means informing both upstream and downstream bridges, which could
> > even be useful, but anyway there is no reliable way to pick only the
> > sink or source ports. It also implies having lots of of_*() calls which
> > iterate over the tree, which is not optimal, but it happens only at
> > add/removal so it's fine I guess.
> >=20
> > Option 2 is be to just inform all the bridges (using the global
> > bridge_list). Pros and cons:
> >=20
> >  * less of_*() calls to crawl around the remote-endpoints
> >  * simpler code
> >  * more bridges than needed would be informed, could be be an issue
> >    if many implement the .bridge_event_notify()
> >  * notifies even in the non-OF case too, not sure it's useful
> >=20
> > What are your thoughts about these two options? =20
>=20
> I'm not sure why you need to inform bridges? Currently for fixed bridges
> we retry with EPROBE_DEFER if the subsequent bridge isn't there yet, which
> means we only add the bridge when the entire chain exists. I think
> hotplugged bridge chains should work the same, which means you only ever
> need to watch the first element shows up. Then you create the connector
> for the entire chain and through special callbacks inform the bridge that
> called of_drm_register_hotplug_source_bridge that it now has a connector.
>=20
> All the other bridges can be ignored I think, even when they're part of
> the hotplug chain.
>=20
> I just realized that means we need at least a refcount on hotpluggable
> bridges, because otherwise drm_bridge_remove will result in use-after-free
> issues. So should probably rename those from drm_bridge_add/remove to
> drm_bridge_register/unregister.
>=20
> For fixed bridges no one else should ever increment the refcount, so
> should work exactly the same.
>=20
> > > Instead I think that code should be directly in core bridge code (I d=
on't
> > > see the benefit of having this entirely in a separate driver), using =
drm
> > > locking to make sure there's no races. =20
> >=20
> > Not sure I got what you mean here. Which one of the following?
> >=20
> >  1. The entire hotplug-bridge driver should not exist, and the DRM
> >     core should handle it all (seems not doable, this driver has lots of
> >     device-specific details)
> >  2. The hotplug-driver should exist, but the code to attach/detach the
> >     pipeline on hotplug/unplug should be moved to the core, with the
> >     hotplug-driver providing callbacks for the device-specific aspects
> >  3. Same as 2, but additionally the hotplug-bridge should become a
> >     connector driver (hotplug-connector.c?) -- not sure it can decouple
> >     the two sides without a bridge however
> >  4. None of the above =20
>=20
> 3, roughly. The connector creation must be in core bridge code, or things
> will go boom.

Based on this I think you mean:

 1. the hotplug-*something* driver should exist
 2. it should add the fixed connector (DSI in my case) on probe
 3. it should add/remove the removable connector (LVDS) on hot(un)plug
 4. it should add _no_ bridge (in the sense of struct drm_bridge)
    [not sure it can still decouple the fixed VS addon pipeline parts]

Could you please clearly state your position about the above points?

Best regards,
Luca

> If you also want to keep the current lifetime model for bridge (without a
> refcount, meaning drm_bridge_remove removes the bridge from all use right
> away) there's also additional locking and tricks you need in in that
> bridge connector code, including the entire bridge chain. Meaning those
> hotplugged bridges must not be visible at all to the wider driver.
>=20
> Or you refcount bridges and make them like driver model struct kobj (or
> kobj directly), but that's a pile of work too. That would be the other
> design approach, instead of only relying on drm_connector. We might need
> both, I haven't dug into the details enough to be sure here.
>=20
> Cheers, Sima
>=20
>=20
> > > > On the opposite side, the following bridges are physically removable
> > > > and so their drivers will have to be fixed (if needed) to work when
> > > > removal happens, but I don't see how that relates to the DRM core
> > > > emitting a notification of such bridges being removed.   =20
> > >=20
> > > Yeah it's not directly related, just my experience that people assume
> > > notifiers provide you more synchronization and race-preventation than=
 they
> > > really do. So it's better to hand-roll to make it all really explicit.
> > >  =20
> > > > > - Related to this: You're not allowed to shut down hardware behin=
d the
> > > > >   user's back with drm_atomic_helper_shutdown. We've tried that a=
pproach
> > > > >   with dp mst, it really pisses off userspace when a page_flip th=
at it
> > > > >   expected to work doesn't work.
> > > > >=20
> > > > > - There's also the design aspect that in atomic, only atomic_chec=
k is
> > > > >   allowed to fail, atomic_commit must succeed, even when the hard=
ware is
> > > > >   gone. Using connectors and their refcounting should help with t=
hat.   =20
> > > >=20
> > > > IIUC here you are suggesting again to remove the connector instead =
of
> > > > marking it "disconnected". So, as above, pointers on how that is
> > > > achieved would be helpful.   =20
> > >=20
> > > See dp mst code. It's complex unfortunately, so there's some reading
> > > involved :-/ =20
> > > >   =20
> > > > > - Somewhat aside, but I noticed that the bridge->atomic_reset is =
in
> > > > >   drm_bridge_attach, and that's kinda the wrong place. It should =
be in
> > > > >   drm_mode_config_reset, like all the other ->atomic_reset hooks.=
 That
> > > > >   would make it a lot clearer that we need to figure out who/when=
   =20
> > > > >   ->atomic_reset should be called for hotplugged bridges, maybe a=
s part of     =20
> > > > >   connector registration when the entire bridge and it's new conn=
ector is
> > > > >   assembled?
> > > > >=20
> > > > > - Finally this very much means we need to rethink who/how the con=
nector
> > > > >   for a bridge is created. The new design is that the main driver=
 creates
> > > > >   this connector, once the entire bridge exists. But with hotplug=
ging this
> > > > >   gets a lot more complicated, so we might want to extract a pile=
 of that
> > > > >   encoder related code from drivers (same way dp mst helpers take=
 care of
> > > > >   connector creation too, it's just too much of a mess otherwise).
> > > > >=20
> > > > >   The current bridge chaining infrastructure requires a lot of ha=
nd-rolled
> > > > >   code in each bridge driver and the encoder, so that might be a =
good
> > > > >   thing anyway.
> > > > >=20
> > > > > - Finally I think the entire bridge hotplug infrastructure should=
 be
> > > > >   irrespective of the underlying bus. Which means for the mipi ds=
i case we
> > > > >   might also want to look into what's missing to make mipi dsi
> > > > >   hotunpluggable, at least for the case where it's a proper drive=
r. I
> > > > >   think we should ignore the old bridge model where driver's stit=
ched it
> > > > >   all toghether using the component framework, in my opinion that=
 approach
> > > > >   should be deprecated.   =20
> > > >=20
> > > > The DSI side was one of my headaches on writing this driver, and I
> > > > must say I dislike the code in hotplug_bridge_dsi_attach(), with the
> > > > need for an initial "dummy" attach and detach the first time. At fi=
rst
> > > > sight I think we need a .update_format callback in struct
> > > > mipi_dsi_host_ops so the DSI host is aware of a format change.
> > > >=20
> > > > Right now there are DSI host drivers which keep a copy of the struct
> > > > mipi_dsi_device pointer and read the format from there when startin=
g a
> > > > stream (e.g. the tc358768.c driver [1]). That somewhat provides a w=
ay
> > > > to react to format changes, but keeping a pointer is bad when the D=
SI
> > > > device hot-unplugs, and the new format won't be seen until a
> > > > disable/enable cycle. So a new callback looks more robust overall.
> > > >=20
> > > > Any opinion about this?   =20
> > >=20
> > > Yeah I don't like the code either.
> > >=20
> > > What might help for prototyping is if you start with a hotpluggeable
> > > bridge where the bridge is a i2c device. That way I think we should be
> > > able to benefit from the driver bind/unbind code that exists already.
> > > Although there's going to be issues with i2c hotunplug too in i2c core
> > > code.
> > >=20
> > > Then lift whatever we learn there to our dsi code. But essentially I =
think
> > > we should model the driver core model a lot more, so I guess you coul=
d use
> > > any hotunplug capable bus as a template. Usb might be closest, since
> > > that's also a packet/message based interface, mostly at least?
> > >  =20
> > > > > - Finally I think we should have a lot of safety checks, like onl=
y bridges
> > > > >   which declare themselve to be hotunplug safe should be allowed =
as a part
> > > > >   of the hotpluggable bridge chain part. All others must still be=
 attached
> > > > >   before the entire driver is registered with drm_dev_register.  =
 =20
> > > >=20
> > > > I'm fine with the principle of a "HOTPLUG" flag.
> > > >=20
> > > > I wonder how that should be implemented, though. Based on my (surely
> > > > simplistic) understanding, right now bridges can be both added and
> > > > removed, but only in a specific sequence:
> > > >=20
> > > >  1. add all bridges
> > > >  2. use the card
> > > >  3. remove all bridges
> > > >  4. EOF
> > > >=20
> > > > We'd need to change to allow:
> > > >=20
> > > >  1. add fixed bridges (including hotplug-bridge)
> > > >  2. add bridges on removable add-on
> > > >  3. use card
> > > >  4. remove bridges on removable add-on
> > > >  5. optionally goto 2
> > > >  6. remove fixed bridges (including hotplug-bridge)
> > > >  7. EOF
> > > >=20
> > > > One na=C3=AFve idea is that the DRM core keeps a flag whenever any =
fixed
> > > > bridge (no HOTLPUG flag) is removed and when that happens forbid ad=
ding
> > > > bridges as we are now at line 5.   =20
> > >=20
> > > If a fixed bridge is removed while the driver is still in use (i.e. b=
efore
> > > drm_dev_unregister is called), that's a driver bug. Would be good to =
catch
> > > that, which is why I think a lot of all the bridge hotplug handling s=
hould
> > > be in core bridge code and not the separate hotplug driver, so that w=
e can
> > > enforce all these constraints.
> > >=20
> > > Also conceptually 3 can happen before 2 (but also before), and that's=
 how
> > > dp mst works too. It does add all kinds of complications though ...
> > >  =20
> > > > Aside for tons of subtleties I'm surely missing, does this look a
> > > > proper approach? I'd not be surprised if there is something better =
and
> > > > more solid.   =20
> > >=20
> > > Yeah roughly. If you look through dp mst code then that also adds all
> > > kinds of structures (since dp mst is a routed network really), not ju=
st
> > > the connectors. They also all come with refcounts (because the networ=
k is
> > > a tree), but like I said I think for your case we can avoid the per-b=
ridge
> > > refcounts by relying on the connector refcount we have already.
> > >=20
> > > But I might be overlooking something, and we need refcounting for each
> > > bridge like dp mst also needs refcounting for all its internal struct=
ures
> > > that map the entire hotpluggable display chain. If you want to read s=
ome
> > > dp mst code, these internal structures are ports/branches with struct
> > > drm_dp_mst_branch/port.
> > >  =20
> > > > >   Or that we only allow bridges with the NO_CONNECTOR flag for
> > > > >   drm_bridge_attach.
> > > > >=20
> > > > > There's probably a pile more fundamental issues I've missed, but =
this
> > > > > should get a good discussion started.   =20
> > > >=20
> > > > Sure, I think it has.
> > > >=20
> > > > Bottom line, I'm clearly not seeing some issues that need to be
> > > > considered, and that do not show up for my use case. Based on my
> > > > limited DRM knowledge, this was expected, and I'm glad to work on t=
hose
> > > > issues with some practical indications about the path forward.   =20
> > >=20
> > > Yeah for learning I think dp mst is best. It's a bit complex, but sin=
ce
> > > you have a dock you should be able to play around and experiment with=
 the
> > > code with some real hardware.
> > >=20
> > > That should help to get a bit a feel for the complexity, since lots of
> > > opportunities for you to ask why/how locking/refcounting is used and
> > > against which potential issue they protect.
> > >=20
> > > Cheers, Sima =20
> >=20
> > Luca
> >=20
> > --=20
> > Luca Ceresoli, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com =20
>=20



--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

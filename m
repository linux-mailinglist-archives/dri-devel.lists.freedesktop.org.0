Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A260CC40C30
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 17:08:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26D910EB06;
	Fri,  7 Nov 2025 16:08:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="lDre/oK/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF3D10EB06
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 16:08:35 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id BAFD6C0FAA4;
 Fri,  7 Nov 2025 16:08:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DD63A606A6;
 Fri,  7 Nov 2025 16:08:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D2C9D118524EA; Fri,  7 Nov 2025 17:08:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762531712; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=9KrRC/iuUffalSwvZGHWZynkxntW24OS0RG9e613pho=;
 b=lDre/oK/dVXuW+FoyGuK86hFY4guh3sWJxP1aGmqoiA65ZVUqAJs8wAj1RR1IKljBSeNIC
 0ZAKVIe0jFKWKogtrAsbBx9SelGMZt9km1ayzh1R2nRC/MFtC6K01Wq7Q7oSjw/et8NS+t
 ywd+ze5KbMaMnZ4dSfvZ0J5iCIdT9wCas0Ep8c8RwuA6j20Hsb/uBa7OCWV/bCDyb578eo
 cf8L1f93fzbjqjV6IHiG7TZntf+s5AO9XE59MnrkVGmNoZUramOU60kQnhPsUfZiKMqGPd
 HhXUYxCOCVFMGlHbi4a4V3y154GA+2jYM7bhSCXgNZ3vBGJG5XvF8m8gHDk4JA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Nov 2025 17:08:25 +0100
Message-Id: <DE2LCFM56Z2Y.2V9NIXP26QOM2@bootlin.com>
Subject: Re: [PATCH] samsung-dsim: move drm_bridge_add() call to probe
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
To: "Maxime Ripard" <mripard@kernel.org>
Cc: "Inki Dae" <inki.dae@samsung.com>, "Jagan Teki"
 <jagan@amarulasolutions.com>, "Marek Szyprowski"
 <m.szyprowski@samsung.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Robert Foss"
 <rfoss@kernel.org>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Jonas Karlman" <jonas@kwiboo.se>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
X-Mailer: aerc 0.20.1
References: <20250725-drm-bridge-samsung-dsim-add-in-probe-v1-1-b23d29c23fbd@bootlin.com>
 <20250728-diligent-brainy-hyena-109dde@houat> <20250728194430.082f9952@booty>
 <20250731-tactful-jellyfish-of-perspective-cb0324@houat>
In-Reply-To: <20250731-tactful-jellyfish-of-perspective-cb0324@houat>
X-Last-TLS-Session-Version: TLSv1.3
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

Hi Maxime,

On Thu Jul 31, 2025 at 12:05 PM CEST, Maxime Ripard wrote:
> On Mon, Jul 28, 2025 at 07:44:30PM +0200, Luca Ceresoli wrote:
>> Hi Maxime,
>>
>> thanks for the quick feedback.
>>
>> On Mon, 28 Jul 2025 10:10:38 +0200
>> Maxime Ripard <mripard@kernel.org> wrote:
>>
>> > Hi,
>> >
>> > On Fri, Jul 25, 2025 at 05:28:03PM +0200, Luca Ceresoli wrote:
>> > > This bridge driver calls drm_bridge_add() in the DSI host .attach ca=
llback
>> > > instead of in the probe function. This looks strange, even though
>> > > apparently not a problem for currently supported use cases.
>> > >
>> > > However it is a problem for supporting hotplug of DRM bridges, which=
 is in
>> > > the works [0][1][2]. The problematic case is when this DSI host is a=
lways
>> > > present while its DSI device is hot-pluggable. In such case with the
>> > > current code the DRM card will not be populated until after the DSI =
device
>> > > attaches to the host, and which could happen a very long time after
>> > > booting, or even not happen at all.
>> > >
>> > > Supporting hotplug in the latest public draft is based on an ugly
>> > > workaround in the hotplug-bridge driver code. This is visible in the
>> > > hotplug_bridge_dsi_attach implementation and documentation in [3] (b=
ut
>> > > keeping in mind that workaround is complicated as it is also circumv=
enting
>> > > another problem: updating the DSI host format when the DSI device ge=
ts
>> > > connected).
>> > >
>> > > As a preliminary step to supporting hotplug in a proper way, and als=
o make
>> > > this driver cleaner, move drm_bridge_add() at probe time, so that th=
e
>> > > bridge is available during boot.
>> > >
>> > > However simply moving drm_bridge_add() prevents populating the whole=
 card
>> > > when the hot-pluggable addon is not present at boot, for another
>> > > reason. The reason is:
>> > >
>> > >  * now the encoder driver finds this bridge instead of getting
>> > >    -EPROBE_DEFER as before
>> > >  * but it cannot attach it because the bridge attach function in tur=
n tries
>> > >    to attach to the following bridge, which has not yet been hot-plu=
gged
>> > >
>> > > This needs to be fixed in the bridge attach function by simply retur=
ning
>> > > -EPROBE_DEFER ifs the following bridge (i.e. the DSI device) is not =
yet
>> > > present.
>> > >
>> > > [0] https://lpc.events/event/18/contributions/1750/
>> > > [1] https://lore.kernel.org/lkml/20240924174254.711c7138@booty/
>> > > [2] https://lore.kernel.org/lkml/20250723-drm-bridge-alloc-getput-fo=
r_each_bridge-v1-0-be8f4ae006e9@bootlin.com/
>> > > [3] https://lore.kernel.org/lkml/20240917-hotplug-drm-bridge-v4-4-bc=
4dfee61be6@bootlin.com/
>> > >
>> > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> >
>> > There's many things lacking from that commit log to evaluate whether
>> > it's a good solution or not:
>>
>> Before answering your questions: I realized my patch is incomplete, it
>> should also move drm_bridge_remove() to samsung_dsim_remove() for
>> symmetry. This is a trivial change and it's done and tested locally:
>>
>> @@ -1825,8 +1825,6 @@ static int samsung_dsim_host_detach(struct mipi_ds=
i_host *host,
>>
>>  	samsung_dsim_unregister_te_irq(dsi);
>>
>> -	drm_bridge_remove(&dsi->bridge);
>> -
>>  	return 0;
>>  }
>>
>> @@ -2069,6 +2067,8 @@ void samsung_dsim_remove(struct platform_device *p=
dev)
>>  {
>>  	struct samsung_dsim *dsi =3D platform_get_drvdata(pdev);
>>
>> +	drm_bridge_remove(&dsi->bridge);
>> +
>>  	pm_runtime_disable(&pdev->dev);
>>
>>  	if (dsi->plat_data->host_ops && dsi->plat_data->host_ops->unregister_h=
ost)
>>
>>
>> Let me reorder your questions so the replies follow a step-by-step
>> path.
>>
>> > - What is the next bridge in your case? Did you try with a device
>> >   controlled through DCS, or with a bridge connected through I2C/SPI
>> >   that would typically have a lifetime disconnected from the DSI host.
>>
>> The pipeline is the following:
>>
>> |--------------------- fixed components --------------------|     |-----=
--- hot-pluggable addon --------|
>> |--------------- i.MX8MP ------------|
>>
>> +----------------+    +------------+     +------------------+     +-----=
--------------+      +----------+
>> |                |    |samsung-dsim|     |hotplug DSI bridge|     |   TI=
 SN65DSI84    |      |LVDS panel|
>> |fsl,imx8mp-lcdif| A  |            |  B  |                  |  C  |     =
              |  D   |          |
>> |                +--->|    DSI host+---->|device        host+---->|DSI h=
ost   LVDS out+----->|LVDS in   |
>> +----------------+    +------------+ DSI +------------------+ DSI +-----=
--------------+ LVDS +----------+
>>                                                                         =
   ^
>>                                                                       I2=
C -'
>>
>> This is a device tree based system (i.MX8MP, ARM64).
>>
>> This is the only hot-pluggable hardware I have access to and there is no
>> DCS.
>>
>> In the hardware the next bridge after the samsung-dsim is the sn65dsi84
>> (ti-sn65dsi83.c driver), and there the hotplug connector is between
>> them.
>>
>> In the software implementation the next bridge is currently the
>> hotplug-bridge, which "represents" the hotplug connector (!=3D DRM
>> connector). As discussed in the past, the hotplug-bridge may be removed
>> in future implementations but at the current stage of my work on DRM it
>> is still needed.
>>
>> The hotplug-bridge is not (yet?) in mainline, and so aren't some other
>> bits. However they haven't changed much since my old v4 series [0].
>
> I'd like to take the hotplug DSI bridge out of the equation for now.
> Does this issue happen without it?
>
>> Also, I expect this patch to be mostly valid regardless of whether the
>> hotplug-bridge will or not be in the final design.
>>
>> > - What is the typical sequence of probe / attach on your board?
>>
>> The probe/attach sequence before this patch is the following. This is
>> in the case the hotpluggable addon is not connected during boot, which
>> is the most problematic one.
>>
>>  1) The lcdif starts probing, but probe is deferred until (6.)
>>     because the samsung-dsim has not probed yet.
>>     Code path: lcdif_probe() -> lcdif_load() -> lcdif_attach_bridge() ->
>>                devm_drm_of_get_bridge() -> -EPROBE_DEFER
>>  2) samsung-dsim probes, but does not drm_bridge_add() itself, so the
>>     lcdif driver cannot find it
>>  3) lcdif tries to probe again
>>     A) it does not find the next bridge and returns -EPROBE_DEFER
>>  4) hotplug-bridge probes, including:
>>     A) drm_bridge_add()
>>     B) mipi_dsi_attach() to register as a "fake" DSI device to
>>        the samsung-dsim DSI host
>>        - this registration is fake, meaning it has a fake format;
>>          it's needed or the samsung-dsim driver would not
>>          drm_bridge_add() itself and the lcdif would not populate the
>>          DRM card
>>     C) look for the next bridge but in the typical case the TI bridge
>>        has not probed yet; this is not fatal by design of the
>>        hotplug-bridge (that's its goal indeed)
>>  5) reacting to 4.B, in the samsung_dsim_host_attach() func does, among
>>     other things, drm_bridge_add() itself
>>  6) lcdif tries to probe again
>>     A) this triggers a chain of drm_bridge_attach:
>>        * lcdif calls drm_bridge_attach() on the samsung-dsim
>>        * samsung-dsim calls drm_bridge_attach() on the hotplug-bridge
>>     B) the DRM card is populated and accessible to userspace
>>
>> When the addon is connected (can be hours later or even never):
>>
>>  7) the TI SN65DSI84 driver probes, including:
>>     * drm_bridge_add()
>>        - thanks to notifiers ([0] patch 2) the hotplug bridge is
>>          informed and takes note of its next_bridge
>>     * does mipi_dsi_attach() on its host (hotplug bridge)
>>  8) the hotplug-bridge DSI host side reacts to the mipi_dsi_attach() fro=
m
>>     the TI DSI device by calling:
>>     * mipi_dsi_detach() on the samsung-dsim to remove the
>>       fake registration
>>     * mipi_dsi_attach() with the correct format from the sn65dsi84
>>
>> Note: after 5) the global bridge_list has a samsung-dsim bridge, while
>> after an addon insertion/removal there is no samsung-dsim in there
>> anymore. This is due to the fake registration, which happens only the
>> first time: at every addon removal samsung_dsim_host_detach() will
>> drm_bridge_remove() itself.
>>
>> With the patch applied the sequence would become:
>>
>>  1) The lcdif starts probing multiple times, but probe is deferred
>>     until (5.) because the samsung-dsim has not probed yet.
>>     (so far no changes)
>>  2) samsung-dsim probes, _and_ does drm_bridge_add() itself
>>  3) lcdif tries to probe again
>>     A) this triggers a lcdif probe and a chain of drm_bridge_attach:
>>        * lcdif calls drm_bridge_attach() on the samsung-dsim
>>        * samsung-dsim returns -EPROBE_DEFER because there is no next
>>          bridge yet (with another error the lcdif would fail without
>>          further deferral)
>>  4) the hotplug-bridge probes
>>  5) lcdif tries to probe again
>>     A) this triggers a lcdif probe and a chain of drm_bridge_attach:
>>        * lcdif calls drm_bridge_attach() on the samsung-dsim
>>        * samsung-dsim calls drm_bridge_attach() on the hotplug-bridge
>>     B) the DRM card is populated and accessible to userspace
>>
>> When the addon is connected (can be hours later or even never):
>>
>>  6) the TI SN65DSI84 driver probes, including:
>>     A) drm_bridge_add()
>>        - thanks to notifiers ([0] patch 2) the hotplug bridge is
>>          informed and takes note of its next_bridge
>>     B) does mipi_dsi_attach() on its host (hotplug bridge)
>>     (so far no changes)
>>  7) the hotplug-bridge DSI host side reacts to the mipi_dsi_attach() fro=
m
>>     the TI DSI device without detaching/attaching from/to the
>>     samsung-dsim, but only by notifying to samsung-dsim the new format;
>>     for this my current draft adds a .format_changed op to struct
>>     mipi_dsi_host_ops, so the hotplug bridge can inform about the new
>>     format, but in the end we might as well get rid of the hotplug
>>     bridge entirely
>
> Thanks for the writeup. I'd still like to know what it looks like
> without the hotplug-bridge in there.

Here I am after a long time, having finally found time to experiment what
happens without the hotplug-bridge. It's unavoidably long, so I've split it
is logical steps.


** Foreword: device tree **

By the current device tree description, the hotplug-bridge is "in the
middle" between two bridges: the last bridge in the fixed part and the
first bridge on the hotpluggable addon (respectively samsung-dsim and
ti-sn65dsi84 in my case). So there are two bidirectional remote-endpoint
connections between them:

  samsung-dsim <=3D> hotplug-bridge <=3D> ti-sn65dsi84

With this DT represnetation, removing the hotplug-bridge means the other
two bridges cannot find each other via the usual graph walking procedures,
so wothing can work.

In order to focus on the DRM aspects for the sake of this experiment, I
have added a workaround in the samsung-dsim and ti-sn65dsi83 drivers, so
they can find each other. It is based on doing an additional
of_graph_get_remote_node() to "jump over" the hotplug-bridge DT node.


** Step 0: current samsung-dsim code **

This is the initial situation after adding the workaround mentioned in the
foreword.

When booting without add-on and using the current upstream samsung-dsim
code, which calls drm_bridge_add() in samsung_dsim_host_attach(), this
happens:

 [1 and 2 can happen in any order, same result]

 1) samsung-dsim probes (does not drm_bridge_add() itself)
 2) The lcdif starts probing multiple times, but
    lcdif_probe
    -> lcdif_load
       -> lcdif_attach_bridge
          -> devm_drm_of_get_bridge() returns -EPROBE_DEFER because
             the samsung-dsim is not in the global bridge_list
             (deferred probe pending: imx-lcdif: Cannot connect bridge)

 =3D> The card cannot probe

When the addon is connected:

 [lcdif tries to probe again and defers multiple times as before]

 3) sn65dsi83_probe
    -> sn65dsi83_host_attach       (finds samsung-dsim, see foreword)
       -> samsung_dsim_host_attach (finds ti-sn65dsi83, see foreword)
          -> drm_bridge_add()
    =3D> samsung-dsim() bridge published in global bridge_list

 4) lcdif tries to probe again
    lcdif_probe
    -> lcdif_load
       -> lcdif_attach_bridge
          -> devm_drm_of_get_bridge() --> OK, returns samsung-dsim ptr
          -> drm_bridge_attach() on the found bridge
             -> samsung_dsim_attach
                -> drm_bridge_attach
                   -> sn65dsi83_attach
                      ...
 =3D> card probed

When the addon is removed:

 5) sn65dsi83_remove
    -> samsung_dsim_host_detach (via devm)
       -> mipi_dsi_detach
          -> samsung_dsim_host_detach

 =3D> the card is still populated

So the main problem here is that the card does not get probed before the
add-on is added, because the lcdif cannot find the samsung-dsim bridge.


** Step 1: drm_bridge_add() moved to samsung_dsim_probe() **

To let the lcdif find the samsung-dsim bridge, I added this patch to move
drm_bridge_add() to probe time.

With this, when booting without add-on:

 [1 and 2 can happen in any order, same result, thanks to the addition in
  samsung_dsim_attach() of:
     if (!dsi->out_bridge)
        return -EPROBE_DEFER;
 ]

 1) samsung-dsim probes (and adds to drm_bridge_add() itself)
 2) The lcdif starts probing multiple times, but
    lcdif_probe
    -> lcdif_load
       -> lcdif_attach_bridge
          -> devm_drm_of_get_bridge() --> OK, returns samsung-dsim ptr
          -> drm_bridge_attach()
             -> samsung_dsim_attach()
                -> if (!dsi->out_bridge)
                   return -EPROBE_DEFER; -> deferral because addon
                                            bridge not yet present

 =3D> The card still cannot probe

When the addon is connected, similarly to step 0 the card probes after
samsung-dsim can find the ti-sn65dsi84 bridge. Details not shown, not much
different.

So, one step forward (lcdif finds the samsung-dsim bridge) but not yet
enough to probe the card without an add-on connected. The blocking point is
that the attach callback in the samsung-dsim driver returns -EPROBE_DEFER
if the next bridge is not present.

The hotplug-bridge handles this in a simple way: if the next bridge is not
present (!hpb->next_bridge) then it just returns 0 (it's normal, it can be
hot plugged later on), so the upstream components up to the encoder can
fully probe.


** Step 2: samsung_dsim_attach() does not error if out_bridge not present *=
*

By using in samsung_dsim_attach() this the same approach as the
hotplug-bridge:

 static int samsung_dsim_attach(struct drm_bridge *bridge,
                               struct drm_encoder *encoder,
                               enum drm_bridge_attach_flags flags)
 {
        struct samsung_dsim *dsi =3D bridge_to_dsi(bridge);

+       if (!dsi->out_bridge)
+               return 0;
+
       return drm_bridge_attach(encoder, dsi->out_bridge, bridge,
                                flags);
 }

i.e. returning 0 (OK) and not -EPROBE_DEFER as in this patch, the resulting
probe sequence is:

 1) samsung-dsim probes (and adds to drm_bridge_add() itself)
 2) The lcdif probes:
    lcdif_probe
    -> lcdif_load
       -> lcdif_attach_bridge
          -> devm_drm_of_get_bridge() --> OK, returns samsung-dsim ptr
          -> drm_bridge_attach()
             -> samsung_dsim_attach() --> NEW: out_bridge returns 0

 =3D> The card probes!

When the addon is connected:

 3) sn65dsi83_probe
    -> sn65dsi83_host_attach       (finds samsung-dsim, see foreword)
       -> samsung_dsim_host_attach (finds ti-sn65dsi83, see foreword)

One step forward, but not yet enough. Now we have a card but:
- bridges on the add-on have not been attached (*)
- after the add-on is added there is still no drm_connector

(*) Note: the additional, always-disconnected drm_connector that was
    discussed in the past [0] is not present anymore in my hotplug-bridge
    design as I have successfully got rid of it.
[0] https://lore.kernel.org/all/ourjepuvkhzpemhak3t6do3or6shrj4cq2plhii4afg=
ej4qhkk@p6tvptupr3ey/

Creation of the drm_connector is one of the features provided by the hotplu=
g-bridge.


** Step 3: samsung-dsim continues the attach chain **

The added 'return 0' in samsung_dsim_attach() make the following
drm_bridge_attach() call be skipped (in the hotplug case at least). As
there are no other places where the attach sequence is started, attach
simply does never happen.

So, as a proof of concept at least, I added in samsung_dsim_host_attach() a
call to samsung_dsim_attach().

When the addon is connected the probe sequence is the same as before, and
when adding the addon this happens:

 3) sn65dsi83_probe
    -> sn65dsi83_host_attach       (finds samsung-dsim, see foreword)
       -> samsung_dsim_host_attach (finds ti-sn65dsi83, see foreword)
          -> samsung_dsim_attach(..., flags=3D0)    <--- NEW
             -> drm_bridge_attach(..., flags=3D0)
                -> sn65dsi83_attach(..., flags=3D0)
                   ...up to the panel-bridge attach

Now the attach chain after the samsung-dsim bridge is continued, all
bridges are attached, the drm_connector is created by the final bridge
(panel-bridge) and the card is fully working.

This works by passing flags =3D 0 to attach. Is it an accepted practice to
not set the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag for new code?

Aside from the above question, it's noteworthy that I have done a few
changes to the samsung-dsim driver from step 0 to step 3. It's less than 10
lines, but some not trivial, and some details are still missing. Those
would need to be replicated to any drivers willing to make the following
component hot-pluggable.

Overall it looks to me that managing the attach chain by individual drivers
is unavoidably getting more complicated, and moving it to a centralized
place appears like a better approach to avoid complicating several
drivers. However each bridge driver calls the attach to the next bridge
(via drm_bridge_attach()), so I don't know how centralization could happen
without changing that established behaviour.

I have a few vague ideas in my mind, but I'll let them settle while I wait
for some feedback to this e-mail before taking decisions on the direction
to follow.

I look forward to receiving your comments.

Best regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

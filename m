Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 385ECB50197
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 17:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08F4510E264;
	Tue,  9 Sep 2025 15:39:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="wtV6en51";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B2C910E264
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 15:39:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id B5F81C6B39C;
 Tue,  9 Sep 2025 15:39:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 62EA160630;
 Tue,  9 Sep 2025 15:39:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6EEC2102F28E7; 
 Tue,  9 Sep 2025 17:39:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1757432391; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ts/SJluN6cQdUcCgVD3HQ7ETDwWBAUQodwnr68auTBU=;
 b=wtV6en51mclGmP5+mmQyZ21Zbg/GIh6mfEa/I9Q9yhw+lxzDl31FxvDetR72unXo8KSYWR
 fFsvxflfrD5KpTxM2euZDli9Wgzv3Is27i2JjKVXgkuow/qpJwMUb82Mk6Lw6bbKmdYOgW
 ghcFm1RshpaRjJqbiHWK/afodrh3XPL6SbYn3z6oqMe0mJ9W3U8BTpQE+ntC0uf8hvPv/k
 m++qUygy8A6Jo6Z/HXaL+LvOmstEj+e5xQURF04IHForwStJ5Lxd0npxS2atgqDWuGQyuw
 uqISDZrI9Q8hJNuC/upW6T0YSymLtxR6ZqiGDfXmB4OpemRR4fD/IhOYxG2dIw==
Date: Tue, 9 Sep 2025 17:39:33 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, Jagan
 Teki <jagan@amarulasolutions.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Paul Kocialkowski <contact@paulk.fr>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, =?UTF-8?B?SGVy?=
 =?UTF-8?B?dsOp?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, Paul
 Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v5 10/10] drm/bridge: hotplug-bridge: add driver to
 support hot-pluggable DSI bridges
Message-ID: <20250909173933.20fc5d6a@booty>
In-Reply-To: <20250909172907.09157d70@booty>
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
 <20241231-hotplug-drm-bridge-v5-10-173065a1ece1@bootlin.com>
 <ourjepuvkhzpemhak3t6do3or6shrj4cq2plhii4afgej4qhkk@p6tvptupr3ey>
 <20250102130140.59363125@booty> <20250909172907.09157d70@booty>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

Hello,

+Cc: Dmitry's current e-mail address

I replied to such an old thread that is had an old address for Dmitry.

On Tue, 9 Sep 2025 17:29:07 +0200
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

> Hello Dmitry, Maxime, DRM maintainers,
> 
> On Thu, 2 Jan 2025 13:01:40 +0100
> Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> 
> > Hi Dmitry,
> > 
> > On Tue, 31 Dec 2024 17:29:52 +0200
> > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> >   
> > > On Tue, Dec 31, 2024 at 11:40:04AM +0100, Luca Ceresoli wrote:    
> > > > This driver implements the point of a DRM pipeline where a connector allows
> > > > removal of all the following bridges up to the panel.
> > > > 
> > > > The DRM subsystem currently allows hotplug of the monitor but not preceding
> > > > components. However there are embedded devices where the "tail" of the DRM
> > > > pipeline, including one or more bridges, can be physically removed:
> > > > 
> > > >  .------------------------.
> > > >  |   DISPLAY CONTROLLER   |
> > > >  | .---------.   .------. |
> > > >  | | ENCODER |<--| CRTC | |
> > > >  | '---------'   '------' |
> > > >  '------|-----------------'
> > > >         |
> > > >         |               HOTPLUG
> > > >         V              CONNECTOR
> > > >    .---------.        .--.    .-.        .---------.         .-------.
> > > >    | 0 to N  |        | _|   _| |        | 1 to N  |         |       |
> > > >    | BRIDGES |--DSI-->||_   |_  |--DSI-->| BRIDGES |--LVDS-->| PANEL |
> > > >    |         |        |  |    | |        |         |         |       |
> > > >    '---------'        '--'    '-'        '---------'         '-------'
> > > > 
> > > >  [--- fixed components --]  [----------- removable add-on -----------]
> > > > 
> > > > This driver supports such a device, where the final segment of a MIPI DSI
> > > > bus, including one or more bridges, can be physically disconnected and
> > > > reconnected at runtime, possibly with a different model.
> > > > 
> > > > The add-on supported by this driver has a MIPI DSI bus traversing the
> > > > hotplug connector and a DSI to LVDS bridge and an LVDS panel on the add-on.
> > > > Hovever this driver is designed to be as far as possible generic and
> > > > extendable to other busses that have no native hotplug and model ID
> > > > discovery.
> > > > 
> > > > This driver does not itself add and remove the bridges or panel on the
> > > > add-on: this needs to be done by other means, e.g. device tree overlay
> > > > runtime insertion and removal. The hotplug-bridge gets notified by the DRM
> > > > bridge core after a removable bridge gets added or before it is removed.
> > > > 
> > > > The hotplug-bridge role is to implement the "hot-pluggable connector" in
> > > > the bridge chain. In this position, what the hotplug-bridge should ideally
> > > > do is:
> > > > 
> > > >  * communicate with the previous component (bridge or encoder) so that it
> > > >    believes it always has a connected bridge following it and the DRM card
> > > >    is always present
> > > >  * be notified of the addition and removal of the following bridge and
> > > >    attach/detach to/from it
> > > >  * communicate with the following bridge so that it will attach and detach
> > > >    using the normal procedure (as if the entire pipeline were being created
> > > >    or destroyed, not only the tail)
> > > >  * instantiate two DRM connectors (similarly to what the DisplayPort MST
> > > >    code does):
> > > >    - a DSI connector representing the video lines of the hotplug connector;
> > > >      the status is always "disconnected" (no panel is ever attached
> > > >      directly to it)
> > > >    - an LSVD connector representing the classic connection to the panel;
> > > >      this gets added/removed whenever the add-on gets
> > > >      connected/disconnected; the status is always "connected" as the panel
> > > >      is always connected to the preceding bridge      
> > > 
> > > I'd rather have just a single connector. MST connectors can be added and
> > > gone as there is fit, so should be your LVDS panel-related connector.    
> > 
> > The plan we discussed at LPC 2024 is to eventually get rid of the first
> > connector (see "Roadmap and current status" in the cover letter), so
> > you can consider this legacy code. However the current implementation
> > won't work without this connector, so it is still there for the time
> > being. Pointing this out in a note in the commit message of this patch
> > would probably be useful to avoid future misunderstanding, so I'm
> > adding one for v6.  
> 
> Reviving this old thread for a specific question I need to clarify.
> Before starting a work that I consider far from trivial I'd like to
> make sure the requirement is clear.
> 
> There was a precise request by both Dmitry and (IIRC) Maxime to remove
> the "always present, never connected" DSI connector.
> 
> [Recap of previous discussion: skip if unneeded]
> 
> The current status is that the hotplug-bridge, which can start without
> an add-on plugged, adds a DSI connector unconditionally:
> 
>   # modetest -c  | grep -i '^[a-z0-9]'
>   Connectors:
>   id    encoder status          name        size (mm)     modes   encoders
>   38    0       disconnected    DSI-1       0x0           0       37
> 
> That DSI connector status is always "unconnected" (in my implementation
> at least) because it does never a panel _directly_ attached, only a
> further bridge.
> 
> Then when the add-on is plugged, which contains a DSI-to-LVDS bridge, a
> new LVDS connector is added:
> 
>   # modetest -c  | grep -i '^[a-z0-9]'
>   Connectors:
>   id    encoder status          name        size (mm)     modes   encoders
>   38    0       disconnected    DSI-1       0x0           0       37
>   39    0       connected       LVDS-1      344x194       1       37
> 
> The LVDS connector has a panel attached and provides the modes, so it
> is "the connector" in the DRM logic. It is always in "connected" status
> because it drives a panel that is always tied to the DSI-to-LVDS bridge.
> It is removed when the add-on is removed and so the removable bridge(s)
> disappear(s).
> 
> The request is to get rid of the DSI connector, because it is not a DRM
> connector in the classic DRM sense (DRM connector ~= a modes +
> connection status provider). That would mean without addon plugged
> there is no DRM connector at all.
> 
> However for user space to be able to always have a card we need the
> card to be populated even before the addon is plugged and to persist
> after its removal. So, a card without any connectors.
> 
> [End of recap of previous discussion]
> 
> Now comes the question!
> 
> Based on the above, I understand that:
> 
>  * Current DRM code won't populate a card without at least a DRM
>    connector
>  * We now need to change the DRM code to allow populating a card,
>    and expose it to user space, without a DRM connector
>  * The previous bullet is a prerequisite to get rid of DSI connector as
>    requested
> 
> Is my understanding correct?
> 
> Best regards,
> Luca
> 



-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

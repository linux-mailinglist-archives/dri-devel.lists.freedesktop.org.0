Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6014B88E0B5
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 13:42:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 904DF10F715;
	Wed, 27 Mar 2024 12:42:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MfYSHL7L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD37610FC75
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 12:42:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 22878CE25FC;
 Wed, 27 Mar 2024 12:42:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7E6DC43390;
 Wed, 27 Mar 2024 12:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711543363;
 bh=060ldzSvr1r+sVWZLmOY7us7S/7PcOH4lo2/HCwzbME=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MfYSHL7LS+gP6qHLU5Fj7lhY2R9DQvdcVoRa+WhR+HqiIkQvrGW7o0q9CNZp5w4Hq
 v5z2dnYp/MoTMEU5rGjkHgoliUu9Nc3JtrfnBb1MiEC4Fm/eKY9K//VMS94/JpqgTb
 0KSR3fGWMcVX03uqN3SpJSRAJ5KXSrRP5K47Ie2/IkAMTlBQHkuptdj1/qENLbDJP9
 XiF/C4NcFDBsF+wzpVvJziT/sWURqLNiJY42ZQweDASb/l1oUhL7JxhT4B+5MpS37+
 fY8816V2T6o2zFPjHzXTjoNL/QH/PBedd46XQPJ5pS97dkL49Ff/fBgNVwIDmVJbLt
 XAwkUPm6gabnA==
Date: Wed, 27 Mar 2024 13:42:40 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Kocialkowski <contact@paulk.fr>,
 =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH 4/4] drm/bridge: hotplug-bridge: add driver to support
 hot-pluggable DSI bridges
Message-ID: <20240327-radiant-cherry-myna-25afc4@houat>
References: <20240326-hotplug-drm-bridge-v1-0-4b51b5eb75d5@bootlin.com>
 <20240326-hotplug-drm-bridge-v1-4-4b51b5eb75d5@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="smru7vmch6uoqfjy"
Content-Disposition: inline
In-Reply-To: <20240326-hotplug-drm-bridge-v1-4-4b51b5eb75d5@bootlin.com>
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


--smru7vmch6uoqfjy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2024 at 05:28:14PM +0100, Luca Ceresoli wrote:
> This driver implements the point of a DRM pipeline where a connector allo=
ws
> removal of all the following bridges up to the panel.
>=20
> The DRM subsystem currently allows hotplug of the monitor but not precedi=
ng
> components. However there are embedded devices where the "tail" of the DRM
> pipeline, including one or more bridges, can be physically removed:
>=20
>  .------------------------.
>  |   DISPLAY CONTROLLER   |
>  | .---------.   .------. |
>  | | ENCODER |<--| CRTC | |
>  | '---------'   '------' |
>  '------|-----------------'
>         |
>         |               HOTPLUG
>         V              CONNECTOR
>    .---------.        .--.    .-.        .---------.         .-------.
>    | 0 to N  |        | _|   _| |        | 1 to N  |         |       |
>    | BRIDGES |--DSI-->||_   |_  |--DSI-->| BRIDGES |--LVDS-->| PANEL |
>    |         |        |  |    | |        |         |         |       |
>    '---------'        '--'    '-'        '---------'         '-------'
>=20
>  [--- fixed components --]  [----------- removable add-on -----------]
>=20
> This driver supports such devices, where the final segment of a MIPI DSI
> bus, including one or more bridges, can be physically disconnected and
> reconnected at runtime, possibly with a different model.
>=20
> This implementation supports a MIPI DSI bus only, but it is designed to be
> as far as possible generic and extendable to other busses that have no
> native hotplug and model ID discovery.
>
> This driver does not provide facilities to add and remove the hot-pluggab=
le
> components from the kernel: this needs to be done by other means
> (e.g. device tree overlay runtime insertion and removal). The
> hotplug-bridge gets notified of hot-plugging by the DRM bridge notifier
> callbacks after they get added or before they get removed.
>=20
> The hotplug-bridge role is to implement the "hot-pluggable connector" in
> the bridge chain. In this position, what the hotplug-bridge should ideally
> do is:
>=20
>  * communicate with the previous component (bridge or encoder) so that it
>    believes it always has a connected bridge following it and the DRM card
>    is always present
>  * be notified of the addition and removal of the following bridge and
>    attach/detach to/from it
>  * communicate with the following bridge so that it will attach and detach
>    using the normal procedure (as if the entire pipeline were being creat=
ed
>    or destroyed, not only the tail)
>  * expose the "add-on connected/disconnected" status via the DRM connector
>    connected/disconnected status, so that users of the DRM pipeline know
>    when they can render output on the display
>=20
> However some aspects make it a bit more complex than that. Most notably:
>=20
>  * the next bridge can be probed and removed at any moment and all probing
>    sequences need to be handled
>  * the DSI host/device registration process, which adds to the DRM bridge
>    attach process, makes the initial card registration tricky
>  * the need to register and deregister the following bridges at runtime
>    without tearing down the whole DRM card prevents using the functions
>    that are normally recommended
>  * the automatic mechanism to call the appropriate .get_modes operation
>    (typically provided by the panel bridge) cannot work as the panel can
>    disappear and reappear as a different model, so an ad-hoc lookup is
>    needed

There's several additional hurdles there:

 - You mentioned the connector in your ideal scenario. But as soon as
   you remove the last bridge, the connector will probably go away too.
   There's two scenarii here then:

   - The driver is ok, and it will stay there until the last user its to
     the main DRM device. Which means that if you create a new one,
     you'll have the old one and the new one together, but you can't
     tell which one you're supposed to use.

   - If the driver isn't ok, the connector will be freed immediately.
     There's plenty of lingering pointers in the framework, and
     especially the states though, leading to use-after-free errors.

 - So far, we told everyone that the graphics pipeline wasn't going to
   change. How do you expect applications to deal with a connector going
   away without any regression? I guess the natural thing here would be
   to emit a uevent just like we do when the connection status change,
   but the thing is: we're doing that for the connector, and the
   connector is gone.

Between the userspace expectations and the memory-safety issue plaguing
way too many drivers, I'm not sure this approach can work.

I guess one way to somewhat achieve what you're trying to do would be to
introduce the connection status at the bridge level, reflect the
aggregate connection status of all bridges on the connector, and make
each bridge driver probe its device in the connect hook through DCS or
I2C.

We wouldn't be able to change the bridge halfway through the system's
life, but like I said, KMS cannot hotplug connectors at the moment and
doing so requires far more work.

Maxime

--smru7vmch6uoqfjy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZgQUOwAKCRAnX84Zoj2+
dh89AYC0DigxAGT86h4ujIKZDYh8aLMH+7++xfwqa5vubnN/TG4u3JA5729E+nAl
ZyDl3gABf0rN7Y5nsjQqQ1hkChegPiN0UnpVkGJfp+rRP+p/rc4xoED8H091rEe2
n7civUZ4iA==
=7Rs7
-----END PGP SIGNATURE-----

--smru7vmch6uoqfjy--

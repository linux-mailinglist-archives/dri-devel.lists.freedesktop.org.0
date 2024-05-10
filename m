Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A26608C2286
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 12:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 804EF10E908;
	Fri, 10 May 2024 10:54:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="k5pEdecO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0587110E2CE
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 10:54:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D47EE240009;
 Fri, 10 May 2024 10:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1715338461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7ZbeSwH31KNLEzlZsbO4/BJQ+b20T9k5ad6GKPN2gJ0=;
 b=k5pEdecOUcjybWCXmSFnjzR2CYToQByRP4ODnln3OHE+UVrMjMLae7UoSm9r3YSBC0Y6sI
 5eQbvi5Upp9AZp2kPwFHWvDQ8h/EC/NizbYtyf5h7SdAjlg+wiNqo1vJ26NnWl3CkVbplT
 NsH/SDZ2FL2GVASwKo+CN04ay1WfrEy+SZOHg6zT0p71CjsTU/aICRRyIiTK5Agf+zwKD7
 aao99eKmih9JYGZVIggxYhPr7S2rvTii0wXBJ4DcoAtLcYJY0KgLnJXxJ6Aub28Xn/Y0E9
 IIyo04oxzuREiWWuEXRNI7vBh9XX7iA81QkjHBEVWJ/1k+fyjE+IVEu/D+ulGg==
Date: Fri, 10 May 2024 12:54:17 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Derek Kiernan <derek.kiernan@amd.com>,
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Saravana Kannan <saravanak@google.com>, Paul Kocialkowski
 <contact@paulk.fr>, =?UTF-8?Q?Herv=C3=A9?= Codina
 <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Paul
 Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v2 5/5] misc: add ge-addon-connector driver
Message-ID: <20240510125417.1dddfd5c@booty>
In-Reply-To: <2024051039-decree-shrimp-45c6@gregkh>
References: <20240510-hotplug-drm-bridge-v2-0-ec32f2c66d56@bootlin.com>
 <20240510-hotplug-drm-bridge-v2-5-ec32f2c66d56@bootlin.com>
 <2024051039-decree-shrimp-45c6@gregkh>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

Hello Greg,

thanks for reviewing.

On Fri, 10 May 2024 08:55:29 +0100
Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Fri, May 10, 2024 at 09:10:41AM +0200, Luca Ceresoli wrote:
> > Add a driver to support the runtime hot-pluggable add-on connector on the
> > GE SUNH device. This connector allows connecting and disconnecting an
> > add-on to/from the main device to augment its features. Connection and
> > disconnection can happen at runtime at any moment without notice.
> > 
> > Different add-on models can be connected, and each has an EEPROM with a
> > model identifier at a fixed address.
> > 
> > The add-on hardware is added and removed using device tree overlay loading
> > and unloading.
> > 
> > Co-developed-by: Herve Codina <herve.codina@bootlin.com>
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > 
> > ---
> > 
> > This commit is new in v2.
> > ---
> >  MAINTAINERS                      |   1 +
> >  drivers/misc/Kconfig             |  15 ++
> >  drivers/misc/Makefile            |   1 +
> >  drivers/misc/ge-sunh-connector.c | 464 +++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 481 insertions(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 672c26372c92..0bdb4fc496b8 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -9905,6 +9905,7 @@ F:	drivers/iio/pressure/mprls0025pa*
> >  HOTPLUG CONNECTOR FOR GE SUNH ADDONS
> >  M:	Luca Ceresoli <luca.ceresoli@bootlin.com>
> >  S:	Maintained
> > +F:	drivers/misc/ge-sunh-connector.c
> >  F:	Documentation/devicetree/bindings/connector/ge,sunh-addon-connector.yaml
> >  
> >  HP BIOSCFG DRIVER
> > diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> > index 4fb291f0bf7c..99ef2eccbbaa 100644
> > --- a/drivers/misc/Kconfig
> > +++ b/drivers/misc/Kconfig
> > @@ -574,6 +574,21 @@ config NSM
> >  	  To compile this driver as a module, choose M here.
> >  	  The module will be called nsm.
> >  
> > +config GE_SUNH_CONNECTOR
> > +	tristate "GE SUNH hotplug add-on connector"
> > +	depends on OF
> > +	select OF_OVERLAY
> > +	select FW_LOADER
> > +	select NVMEM
> > +	select DRM_HOTPLUG_BRIDGE  
> 
> Can these be depends instead of select?  'select' causes dependencies
> that are hard, if not almost impossible, to detect at times why
> something is being enabled.

(see reply to Arnd's follow-up e-mail for this)

> > +	help
> > +	  Driver for the runtime hot-pluggable add-on connector on the GE SUNH
> > +	  device. This connector allows connecting and disconnecting an add-on
> > +	  to/from the main device to augment its features. Connection and
> > +	  disconnection can be done at runtime at any moment without
> > +	  notice. Different add-on models can be connected, and each has an EEPROM
> > +	  with a model identifier at a fixed address.  
> 
> Module name?

OK, will add.

> > +static void sunh_conn_reset(struct sunh_conn *conn, bool keep_reset)
> > +{
> > +	dev_dbg(conn->dev, "reset\n");  
> 
> ftrace is your friend.

ACK.

> > +static int sunh_conn_handle_event(struct sunh_conn *conn, bool plugged)
> > +{
> > +	int err;
> > +
> > +	if (plugged == conn->plugged)
> > +		return 0;
> > +
> > +	dev_info(conn->dev, "%s\n", plugged ? "connected" : "disconnected");  
> 
> Please remove debugging code from stuff you want to see merged.
> 
> Same for all dev_info() calls here, when drivers work properly, they are
> quiet.

While agree for other dev_info() calls, this one seems quite similar in
principle to the link up/down messages that get logged by the MII code
at [0]:

  [347229.872315] asix 1-1.3.2:1.0 enx000cf616fecb: link up, 100Mbps,
  full-duplex, lpa 0xC5E1 [347229.920449] asix 1-1.3.2:1.0 enx000cf616fecb: link down

In my case it is logging that a removable part of the hardware has been
added or removed, which appears useful. Do you think it make sense in
this scenario?

Luca

[0] https://elixir.bootlin.com/linux/v6.8.9/source/drivers/net/mii.c#L557

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 802808C2289
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 12:54:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDC8B10E2CE;
	Fri, 10 May 2024 10:54:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="K8/osNAe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DEB910E8E2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 10:54:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C3521BF209;
 Fri, 10 May 2024 10:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1715338468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HOtPKmgchyWmbrYBxXPn7lnbrTTGQ4uEd2Sa5ZRuwlA=;
 b=K8/osNAe6yE6WlZSa8kDL76s6DRm+Pr287W3LpLbtgxSpsaDIxWdGDgQ7rtcfdvMoj6sW3
 6smdCd36av8J2gBSTZyDfllC3FC9b0Wye2UHk3DPoifHiB+u6jKIOTxm+iP2pHt59JhJ07
 1MnbmnZ0yQzUPunOD0uEG1bYasiPNrOAt7PYxtZD8vXm/bta91ynh+X1fqvtN1Gba7lq5S
 SahPpF3qSwHSNJ/MYWLI160fLR2sAchbNfaXYYw4JpaCChKQ288Pej96+ZxCQd6m4aW0ig
 S67GjXdksqWDSDSZSHcEvS/fXRs5W9T8mAz/+mtEH0Xi9GLymQBAdiETwpf93A==
Date: Fri, 10 May 2024 12:54:23 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Robert Foss"
 <rfoss@kernel.org>, "laurent.pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Jonas Karlman" <jonas@kwiboo.se>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Dave Airlie"
 <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>,
 "derek.kiernan@amd.com" <derek.kiernan@amd.com>, "dragan.cvetic@amd.com"
 <dragan.cvetic@amd.com>, "Saravana Kannan" <saravanak@google.com>, "Paul
 Kocialkowski" <contact@paulk.fr>, "Herve Codina"
 <herve.codina@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, "Paul
 Kocialkowski" <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v2 5/5] misc: add ge-addon-connector driver
Message-ID: <20240510125423.25d4b3ed@booty>
In-Reply-To: <a1970921-f00b-411d-832d-5289f9812ba0@app.fastmail.com>
References: <20240510-hotplug-drm-bridge-v2-0-ec32f2c66d56@bootlin.com>
 <20240510-hotplug-drm-bridge-v2-5-ec32f2c66d56@bootlin.com>
 <2024051039-decree-shrimp-45c6@gregkh>
 <a1970921-f00b-411d-832d-5289f9812ba0@app.fastmail.com>
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

Hello Greg, Arnd,

On Fri, 10 May 2024 12:24:06 +0200
"Arnd Bergmann" <arnd@arndb.de> wrote:

> On Fri, May 10, 2024, at 09:55, Greg Kroah-Hartman wrote:
> > On Fri, May 10, 2024 at 09:10:41AM +0200, Luca Ceresoli wrote:  
> >>  
> >> +config GE_SUNH_CONNECTOR
> >> +	tristate "GE SUNH hotplug add-on connector"
> >> +	depends on OF
> >> +	select OF_OVERLAY
> >> +	select FW_LOADER
> >> +	select NVMEM
> >> +	select DRM_HOTPLUG_BRIDGE  
> >
> > Can these be depends instead of select?  'select' causes dependencies
> > that are hard, if not almost impossible, to detect at times why
> > something is being enabled.  
> 
> I think FW_LOADER needs to be 'select' since it is normally
> a hidden symbol and gets selected by its users, all the other
> ones should be 'depends on'.

I see, makes sense.

And as you pointed that out, I realize perhaps DRM_HOTPLUG_BRIDGE could
become a hidden symbol as it's not expected to be used alone.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 710BD8C27E2
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 17:33:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B711410E99E;
	Fri, 10 May 2024 15:32:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="FY24Fgx4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2899F10E99E
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 15:32:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3152820009;
 Fri, 10 May 2024 15:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1715355173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NvpIh3MztCy78ewXd3YEalmoL2kGSw4XpNzZDNRi4V0=;
 b=FY24Fgx49n4qxpJMFZ2zNBe4gD+NlYtYM+K2PWhBQIMz4VY3rBsbjivq51AzhfKaaPzBhL
 Ny1rTrjzvpHiG/Qjeotb652MOoT2be5dc0tgEilX2ZBMygBFeCLBbNT5qjU4kDyhPpaNp7
 UM0UxV2I0xVHNWGbkT32xL7p3F7RIm+T+RC/vfNHqeix/MI11t4mGJbSYFYhWWxcXm8BD2
 q1xiL13YX42hg89tlNgFd3UYeZTHkZfOLp98HmkA7SLK9Rxt5wiBnmwklHF36EK+xFY1yg
 ufym7uB3GJoauepOfcs0ghanlGM5elnTMzy/snz/qeOMAGthHqiM8kSMmmYolA==
Date: Fri, 10 May 2024 17:32:48 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Arnd Bergmann" <arnd@arndb.de>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "laurent.pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
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
Message-ID: <20240510173248.70fa3b60@booty>
In-Reply-To: <a4c55013-048f-4056-9866-f0505507d501@app.fastmail.com>
References: <20240510-hotplug-drm-bridge-v2-0-ec32f2c66d56@bootlin.com>
 <20240510-hotplug-drm-bridge-v2-5-ec32f2c66d56@bootlin.com>
 <2024051039-decree-shrimp-45c6@gregkh>
 <a1970921-f00b-411d-832d-5289f9812ba0@app.fastmail.com>
 <20240510125423.25d4b3ed@booty>
 <a4c55013-048f-4056-9866-f0505507d501@app.fastmail.com>
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

Hi Greg, Arnd,

On Fri, 10 May 2024 12:57:24 +0200
"Arnd Bergmann" <arnd@arndb.de> wrote:

> On Fri, May 10, 2024, at 12:54, Luca Ceresoli wrote:
> > On Fri, 10 May 2024 12:24:06 +0200 "Arnd Bergmann" <arnd@arndb.de> wrote:  
> >> On Fri, May 10, 2024, at 09:55, Greg Kroah-Hartman wrote:  
> >> > On Fri, May 10, 2024 at 09:10:41AM +0200, Luca Ceresoli wrote:    
> >> >>  
> >> >> +config GE_SUNH_CONNECTOR
> >> >> +	tristate "GE SUNH hotplug add-on connector"
> >> >> +	depends on OF
> >> >> +	select OF_OVERLAY
> >> >> +	select FW_LOADER
> >> >> +	select NVMEM
> >> >> +	select DRM_HOTPLUG_BRIDGE    
> >> >
> >> > Can these be depends instead of select?  'select' causes dependencies
> >> > that are hard, if not almost impossible, to detect at times why
> >> > something is being enabled.    
> >> 
> >> I think FW_LOADER needs to be 'select' since it is normally
> >> a hidden symbol and gets selected by its users, all the other
> >> ones should be 'depends on'.  
> >
> > I see, makes sense.
> >
> > And as you pointed that out, I realize perhaps DRM_HOTPLUG_BRIDGE could
> > become a hidden symbol as it's not expected to be used alone.  
> 
> It's slightly easier to keep it as a visible symbol
> with 'depends on' though, since otherwise you have to
> add 'depends on' statments for anything that DRM_HOTPLUG_BRIDGE
> in turn depends on, most notably DRM itself.

I see, sure. Thanks both, changes applied locally.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

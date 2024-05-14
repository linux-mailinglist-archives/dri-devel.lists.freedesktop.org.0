Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC988C5A16
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 19:11:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75AEB10E108;
	Tue, 14 May 2024 17:11:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="h9DaJlGC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A33310E108
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 17:11:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D2226C000A;
 Tue, 14 May 2024 17:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1715706681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P8Cv6K+hNAOMTSxkND2VnO0L0L1inZAjtqwoyrqFY7A=;
 b=h9DaJlGC+6C/mDVfK/AsaTg4yxGmOU9QB/6NcMOZzP5nn7EA0QcvVPRb2l73nChCwUWulE
 2Q0E3g4kgu71qAAISfkFW983lJZA+9EQmY20pATxXQORSqPihC4fr01C1TyG4zADlhDKUB
 iekUFtnGyMmRXb5W+MkapjZ4jfmTeO6tST2vwHIm3sVSpUsCzg8CEIp+v/td8+PuDKf4J7
 OTie7bIPOgYzbgcEbq2NTUMmaUTI7TQ5ca2byxWD+O5MUzgCO75moKdmluRb5zjLJvfqlc
 e6WxoGuE3WdXLAEp7KLwCWbDc2yP7A0KbRtjJNH6CdoxnGQgwrg1jZcCHv1USQ==
Date: Tue, 14 May 2024 19:11:17 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Derek Kiernan
 <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd
 Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>, Paul Kocialkowski
 <contact@paulk.fr>, =?UTF-8?Q?Herv=C3=A9?= Codina
 <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Paul
 Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v2 0/5] Add support for GE SUNH hot-pluggable connector
 (was: "drm: add support for hot-pluggable bridges")
Message-ID: <20240514191117.519b274c@booty>
In-Reply-To: <20240510164449.GB336987-robh@kernel.org>
References: <20240510-hotplug-drm-bridge-v2-0-ec32f2c66d56@bootlin.com>
 <20240510164449.GB336987-robh@kernel.org>
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

Hello Rob,

On Fri, 10 May 2024 11:44:49 -0500
Rob Herring <robh@kernel.org> wrote:

> On Fri, May 10, 2024 at 09:10:36AM +0200, Luca Ceresoli wrote:

[...]

> > Overall approach
> > ================
> > 
> > Device tree overlays appear as the most natural solution to support the
> > addition and removal of devices from a running system.
> > 
> > Several features are missing from the mainline Linux kernel in order to
> > support this use case:
> > 
> >  1. runtime (un)loading of device tree overlays is not supported  
> 
> Not true. Device specific applying of overlays has been supported 
> since we merged DT overlay support. What's not supported is a general 
> purpose interface to userspace to change any part of the DT at any point 
> in time.

I think I should replace "supported" with "exposed [to user space]". In
other words, there is no user of of_overlay_fdt_apply() /
of_overlay_remove*() in mainline Linux, except in unittest. Would it be
a correct rewording?

> >  2. if enabled, overlay (un)loading exposes several bugs  
> 
> Hence why there is no general purpose interface.

Absolutely.

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

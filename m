Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D659D637A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 18:44:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D176D10EC4E;
	Fri, 22 Nov 2024 17:44:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="NOmh0ROa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3CA110EC4E
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 17:44:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D45CF1C0005;
 Fri, 22 Nov 2024 17:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732297461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AdyHtCv1wL4VKWQwWV1p+h54gX2Q8uYJc9uLZKJoGjA=;
 b=NOmh0ROa0uuR361y6qeihtW21hrKTDuGvsQcAmiwRYXVXWe14xpRWZdA9XBhdwBX1fteJL
 wMyQOkrXyKnA7eF44SaUrrZqOT1P8FWeRHKHVz3KryIvGNB8qqbSDYhJbcyoLfo92thakR
 XKmgLrHsgzw7XZmE1uR1iHIRLDRPS6V4ztWQCE7i25zXCzwFwYPlw2yZ6svBzkzdVGkK7Q
 VK11j3QDgZmi8fwoqYS1Wgaq6ReJnOc4prfr4TwcqbytqTbRpzwbg5Wq6dtTUEZ7tuyeNA
 Cazfyh51zRwBVwrQFTff1POOu9fNlcW7GlcZKJoZ7rA/eRSIe5YuoNLG6SQBtw==
Date: Fri, 22 Nov 2024 18:44:18 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: jose.exposito89@gmail.com, dri-devel@lists.freedesktop.org,
 arthurgrillo@riseup.net, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH RFC v2 00/16] drm/vkms: ConfigFS interface
Message-ID: <Z0DC8nd1ZFN4A82-@louis-chauvet-laptop>
Mail-Followup-To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>, jose.exposito89@gmail.com,
 dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, nicolejadeyee@google.com
References: <20241122-google-config-fs-v2-0-4b7e6f183320@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241122-google-config-fs-v2-0-4b7e6f183320@bootlin.com>
X-GND-Sasl: louis.chauvet@bootlin.com
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

On 22/11/24 - 18:38, Louis Chauvet wrote:
> VKMS is manly used to test userspace program and its behavior. The current 
> implementation is not very configurable as you can only have one device, 
> with few specific planes.
> 
> This series aims to introduce a new interface, using ConfigFS, to create 
> and configure more devices. This will introduce:
> - Device creation
> - Plane creation
> - Plane configuration (type, color encoding, color range, rotations)
> - Encoder creation
> - CRTC creation
> - Linking between CRTC and planes/encoders
> 
> The proposition is:
> /config/vkms
> 	DEVICE_1
> 	┣━ enable
> 	┣━ writeback
> 	┣━ planes
> 	┃  ┣━ PLANE_1
> 	┃  ┃  ┣━ type
> 	┃  ┃  ┣━ supported_rotations
> 	┃  ┃  ┣━ color_range
> 	┃  ┃  ┣━ color_encoding
> 	┃  ┃  ┣━ default_color_encoding
> 	┃  ┃  ┣━ default_rotations
> 	┃  ┃  ┣━ default_color_range
> 	┃  ┃  ┗━ possible_crtcs
> 	┃  ┃     ┗━ >> /config/vkms/DEVICE_1/crtc/CRTC_1 
> 	┃  ┣━ PLANE_2
> 	┃  ┃  ┗━ ditto
> 	┃  ┗━ PLANE_3
> 	┃     ┗━ ditto
> 	┃
> 	┣━ encoders
> 	┃  ┣━ ENCODER_1
> 	┃  ┃  ┗━ possible_crtcs
> 	┃  ┃     ┗━ >> /config/vkms/DEVICE_1/crtc/CRTC_1
> 	┃  ┗━ ENCODER_2
> 	┃     ┗━ ditto
> 	┃
> 	┗━ crtc
> 	   ┗━ CRTC_1
> 	
> This interface aims to be extendable (new property can easly be added in 
> objects) and easy to use (objects are created simply by creating folders, 
> and configured by writing files).
> 
> This series depends on 
> https://lore.kernel.org/all/20241122-google-remove-crtc-index-from-parameter-v2-0-81540742535a@bootlin.com
> but as this is a bit complex to rebase, you can find a working branch 
> here:
> https://gitlab.freedesktop.org/louischauvet/kernel/-/tree/b4/vkms-configfs
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Hi all,

I am also currently working on MST emulation for VKMS. If someone can read 
what I already did and at tell me if my implementation seems on the right 
track it could be nice.

The current status is not very advanced: I can emulate a mst HUB, but not 
a screen. I am currently working on properly emulating the HUB by using an 
other hub.

You can find the branch for this work here:
https://gitlab.freedesktop.org/louischauvet/kernel/-/tree/b4/vkms-mst

Thanks a lot,
Louis Chauvet

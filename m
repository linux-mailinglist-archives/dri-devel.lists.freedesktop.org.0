Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1598C28E8
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 18:45:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E9DC10E1BE;
	Fri, 10 May 2024 16:44:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iwHTst/P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B4010E1BE
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 16:44:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C2353CE1C99;
 Fri, 10 May 2024 16:44:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3646C113CC;
 Fri, 10 May 2024 16:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715359492;
 bh=AKsuHfdNxYnH+Bp33dxu23hQYlBdH9/kq/GhGgLGp4Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iwHTst/PUBaIDeL/0I7NTk6xdKrE2X80x2nY/g63GwvfMQVE1XEAa5PIKamvPjV1w
 VzjanQL9YWSBgknLqj26H5/YGRB9ZpqfJFHSGV6wD1ewNvxq6GJ+toQkC+TfU14C/L
 IsbH/tSPax7zc+RF5X48zbJ8c96raFp0f0qYon0mY2yQ9YxBHOpwQL+lTZH+/sR3kK
 v5BjCblwT1wySlwrB7BwFo+/EPQGeFMEZJRvFZpTWUD0ocC1SuCfaq5v+YNRzz8efF
 DELIcPiCsxkxSHeQUEugE64fp389T9nMEWUCoHKmaM2zRP2Nz0r659xkK2aQC8w7b9
 aD+YspMtBolAw==
Date: Fri, 10 May 2024 11:44:49 -0500
From: Rob Herring <robh@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Derek Kiernan <derek.kiernan@amd.com>,
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>,
 Paul Kocialkowski <contact@paulk.fr>,
 =?iso-8859-1?Q?Herv=E9?= Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v2 0/5] Add support for GE SUNH hot-pluggable connector
 (was: "drm: add support for hot-pluggable bridges")
Message-ID: <20240510164449.GB336987-robh@kernel.org>
References: <20240510-hotplug-drm-bridge-v2-0-ec32f2c66d56@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240510-hotplug-drm-bridge-v2-0-ec32f2c66d56@bootlin.com>
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

On Fri, May 10, 2024 at 09:10:36AM +0200, Luca Ceresoli wrote:
> Hello,
> 
> this series aims at supporting a Linux device with a connector to
> physically add and remove an add-on to/from the main device to augment its
> features at runtime, using device tree overlays.
> 
> This is the v2 of "drm: add support for hot-pluggable bridges" [0] which
> was however more limited in scope, covering only the DRM aspects. This new
> series also takes a different approach to the DRM bridge instantiation.
> 
> [0] https://lore.kernel.org/all/20240326-hotplug-drm-bridge-v1-0-4b51b5eb75d5@bootlin.com/
> 
> Use case
> ========
> 
> This series targets a professional product (GE SUNH) that is composed of a
> "main" part running on battery, with the main SoC and able to work
> autonomously with limited features, and an optional "add-on" that enables
> more features by adding more hardware peripherals, some of which are on
> non-discoverable busses such as I2C and MIPI DSI.
> 
> The add-on can be connected and disconnected at runtime at any moment by
> the end user, and add-on features need to be enabled and disabled
> automatically at runtime.
> 
> The add-on has status pins that are connected to GPIOs on the main board,
> allowing the CPU to detect add-on insertion and removal. It also has a
> reset GPIO allowign to reset all peripherals on the add-on at once.
> 
> The features provided by the add-on include a display and a battery charger
> to recharge the battery of the main part. The display on the add-on has an
> LVDS input but the connector between the base and the add-on has a MIPI DSI
> bus, so a DSI-to-LVDS bridge is present on the add-on.
> 
> Different add-on models can be connected to the main part, and for this a
> model ID is stored in the add-on itself so the software running on the CPU
> on the main part knows which non-discoverable hardware to probe.
> 
> Overall approach
> ================
> 
> Device tree overlays appear as the most natural solution to support the
> addition and removal of devices from a running system.
> 
> Several features are missing from the mainline Linux kernel in order to
> support this use case:
> 
>  1. runtime (un)loading of device tree overlays is not supported

Not true. Device specific applying of overlays has been supported 
since we merged DT overlay support. What's not supported is a general 
purpose interface to userspace to change any part of the DT at any point 
in time.

>  2. if enabled, overlay (un)loading exposes several bugs

Hence why there is no general purpose interface.

>  3. the DRM subsystem assumes video bridges are non-removable

Rob

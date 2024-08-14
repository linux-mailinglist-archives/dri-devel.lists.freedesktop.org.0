Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D01951F46
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 18:00:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E5BA10E4DC;
	Wed, 14 Aug 2024 15:59:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="LuEz0ygT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C509610E4DC
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 15:59:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7F9BA60003;
 Wed, 14 Aug 2024 15:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723651196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GRkxoicq+udhmwg+wufaOSiQiJFaDc9CkC4zDEA03bI=;
 b=LuEz0ygT+vVGOFTRw10XG2JcHy16bomY6HgSOwv4iB8w9FdGfWYUimnPsQ0FpQT2qyEktF
 H+5dNZOCb+Bae54z7nLfHgytAqKvphUUx4wY7iieblyM8WJvSLWaigYTXH+nX+mkhOvhVz
 e4XmOQt2l61VH60ZRbCU8eVrAEkhEOIK2qjaN776bhNHKrQJ/LePEonItwIGt7FkDnKxtF
 z2rOAgj9/3SdEce+iCk5XLqXlIRvbfCTOuflqIL759mTgA8sQBoXQnrwZtAkXTdmn22Hbh
 97mA7zjflqvD16WR5dE8ze8O6eneug8zuqqB8lxYJqnvdO5vzs2RLd2ixCgPsQ==
Date: Wed, 14 Aug 2024 17:59:52 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Derek Kiernan
 <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd
 Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Paul Kocialkowski <contact@paulk.fr>, =?UTF-8?Q?Herv?=
 =?UTF-8?Q?=C3=A9?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, Paul Kocialkowski
 <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v3 0/7] Add support for GE SUNH hot-pluggable connector
Message-ID: <20240814175952.6b22b7ad@booty>
In-Reply-To: <20240809-hotplug-drm-bridge-v3-0-b4c178380bc9@bootlin.com>
References: <20240809-hotplug-drm-bridge-v3-0-b4c178380bc9@bootlin.com>
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

On Fri, 09 Aug 2024 17:34:48 +0200
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

...

> However a few new rough edges emerged that are not yet solved in this
> v3. Discussion would help in finding the right direction:
> 
>  * Describing the NVMEM cell addition still requires adding two properties
>    to a node in the base tree. Not sure the current NVMEM cell bindings
>    allow to do better.

Do you have any thoughts about how to describe the NVMEM cell in DT
without adding properties?

As of now...

> 2: the "base" overlay
> 
> The "base" overlay describes the common components that are required to
> read the model ID. These are identical for all add-on models, thus only one
> "base" overlay is needed:
> 
>     /dts-v1/;
>     /plugin/;
> 
>     / {
>         fragment@0 {
>             target-path = "";
> 
>             __overlay__ {
>                 nvmem-cells = <&addon_id>;
>                 nvmem-cell-names = "id";

...the nvmem-cell* properties are the only ones that for lack of a
good solution get added to a node in the base tree, causing the memory
leak issue to be still present.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E638697AEC0
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 12:29:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B5AC10E08C;
	Tue, 17 Sep 2024 10:29:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CG/gd26B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00FE210E08C
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2024 10:29:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9C419A40F2D;
 Tue, 17 Sep 2024 10:29:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E611CC4CEC5;
 Tue, 17 Sep 2024 10:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726568992;
 bh=c/H/tfRaw4LC01NWd9KvPpt2hWz/gwUbwReNEUrEQGM=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=CG/gd26BikxAze7Iu2fVUT4cEwoGzGnozfSSh1x/xhxMpuFRFN5wK1M547BuTGPtO
 7d9syGCWsZTzSwk7YKEieJbLlkxYcPDq2K1gssdEVaH7Kb3pqGfsYIxRUxIAtnqZ0p
 rUM9kZRhkcVj5YPgTjbiFRF70G49cCKdR+8rdhnS8/QPcs+20KLNvtPlNOI+f1pzAq
 /OuI0ANOSfRDrVCTb+H+MNTnT3JosDXy5X6WcfVtHR/y46FD+420oN314m522eUns5
 O/Bbzxxc7wvNlyF8U+hy0DhXE4UpBPtRyFooxeVG9P9fjLRLWamAw4s88ROIoPZIm3
 B0zq6NGo2rsPQ==
Date: Tue, 17 Sep 2024 05:29:51 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, linux-fbdev@vger.kernel.org, 
 Dragan Cvetic <dragan.cvetic@amd.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Derek Kiernan <derek.kiernan@amd.com>, Maxime Ripard <mripard@kernel.org>, 
 Robert Foss <rfoss@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Jingoo Han <jingoohan1@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org, 
 Paul Kocialkowski <contact@paulk.fr>, linux-i2c@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Saravana Kannan <saravanak@google.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Daniel Thompson <daniel.thompson@linaro.org>, Helge Deller <deller@gmx.de>, 
 devicetree@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Lee Jones <lee@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>
In-Reply-To: <20240917-hotplug-drm-bridge-v4-1-bc4dfee61be6@bootlin.com>
References: <20240917-hotplug-drm-bridge-v4-0-bc4dfee61be6@bootlin.com>
 <20240917-hotplug-drm-bridge-v4-1-bc4dfee61be6@bootlin.com>
Message-Id: <172656899099.2713363.6775764159513105143.robh@kernel.org>
Subject: Re: [PATCH v4 1/8] dt-bindings: connector: add GE SUNH hotplug
 addon connector
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


On Tue, 17 Sep 2024 10:53:05 +0200, Luca Ceresoli wrote:
> Add bindings for the GE SUNH add-on connector. This is a physical,
> hot-pluggable connector that allows to attach and detach at runtime an
> add-on adding peripherals on non-discoverable busses.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changed in v4:
>  - rename 'nobus-devices' to 'devices'
>  - use 'additionalProperties: true' for the 'devices' node (nodes are added
>    by overlays)
>  - document GPIO polarity
>  - add '|' for descriptions to preserve line breaks
>  - remove powergood-gpios (removed in hardware design)
>  - Omit "/" node, not needed and cause of warnings
>  - remove reference to v2 examples from example comment
>  - remove unneeded "addon_connector" label from example
> 
> Changed in v3:
>  - change the layout to only add subnodes, not properties
>  - add the 'nobus-devices' node description to hold devices not on any bus
>  - add 'i2c-*' nodes for the I2C busses, using a i2c-parent phandle
>  - and the 'dsi' node for the DSI bus
>  - move the entire port@1 node to the overlay (not only the remote-endpoint
>    property)
>  - remove the overlay examples (Overlays in examples are not supported)
>  - add more clarifying descriptions and comments for examples
>  - some rewording
> 
> This patch was added in v2.
> ---
>  .../connector/ge,sunh-addon-connector.yaml         | 177 +++++++++++++++++++++
>  MAINTAINERS                                        |   5 +
>  2 files changed, 182 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/connector/ge,sunh-addon-connector.example.dtb: addon-connector: Unevaluated properties are not allowed ('powergood-gpios' was unexpected)
	from schema $id: http://devicetree.org/schemas/connector/ge,sunh-addon-connector.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240917-hotplug-drm-bridge-v4-1-bc4dfee61be6@bootlin.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


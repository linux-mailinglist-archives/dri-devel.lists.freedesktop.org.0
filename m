Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1066E8C1FF4
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 10:41:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61B3110E414;
	Fri, 10 May 2024 08:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="r1uE/cTN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8768610E414
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 08:41:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DA22561E45;
 Fri, 10 May 2024 08:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52AEFC113CC;
 Fri, 10 May 2024 08:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715330497;
 bh=QrZjldcx0PT1fSwxfoSoW08cZCfk/kKr4QYZoy6vKeY=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=r1uE/cTNGkxzw+pkyt1aCe7blovbcqj3OAB+kGFw1Qn8RIjfEbRz5CqppnHvA3nQ/
 ZKx9QX+oYgEgijSE1jELmeI8HCFo9LHG2xwqXCAqnOWpknkfkkBuf1V328tP0NNXhV
 zbUjgeFwbC1PwFvgQtiTJugUEd+8PLUvNX+rsmfbShKaRY5HnOB97KNz+9FdGzt2xW
 nhrjjDxZNhcoVIGq3/JGoHe1Jgy/czX6GC2Xgiu/1M3/8uvhp2rU7SLyiPAOiq7k7h
 goztPzJ3JkNjboN0XM+ub5Q46yucjwZ3lZBbU5jN/H5k7nqMBApbkes4uOply8b8sa
 PDtCAM7EH7pfg==
Date: Fri, 10 May 2024 03:41:35 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Dragan Cvetic <dragan.cvetic@amd.com>, Maxime Ripard <mripard@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Robert Foss <rfoss@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Arnd Bergmann <arnd@arndb.de>, Derek Kiernan <derek.kiernan@amd.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Saravana Kannan <saravanak@google.com>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Paul Kocialkowski <contact@paulk.fr>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>, 
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, 
 Jonas Karlman <jonas@kwiboo.se>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20240510-hotplug-drm-bridge-v2-1-ec32f2c66d56@bootlin.com>
References: <20240510-hotplug-drm-bridge-v2-0-ec32f2c66d56@bootlin.com>
 <20240510-hotplug-drm-bridge-v2-1-ec32f2c66d56@bootlin.com>
Message-Id: <171533049583.3304069.11759668175103213313.robh@kernel.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: connector: add GE SUNH hotplug
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


On Fri, 10 May 2024 09:10:37 +0200, Luca Ceresoli wrote:
> Add bindings for the GE SUNH add-on connector. This is a physical,
> hot-pluggable connector that allows to attach and detach at runtime an
> add-on adding peripherals on non-discoverable busses.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> NOTE: the second and third examples fail 'make dt_binding_check' because
>       they are example of DT overlay code -- I'm not aware of a way to
>       validate overlay examples as of now
> 
> This patch is new in v2.
> ---
>  .../connector/ge,sunh-addon-connector.yaml         | 197 +++++++++++++++++++++
>  MAINTAINERS                                        |   5 +
>  2 files changed, 202 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/connector/ge,sunh-addon-connector.example.dts:49.9-14 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.lib:427: Documentation/devicetree/bindings/connector/ge,sunh-addon-connector.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1430: dt_binding_check] Error 2
make: *** [Makefile:240: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240510-hotplug-drm-bridge-v2-1-ec32f2c66d56@bootlin.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


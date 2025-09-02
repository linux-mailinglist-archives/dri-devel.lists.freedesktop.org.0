Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47079B40C0C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 19:29:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 758F210E7FB;
	Tue,  2 Sep 2025 17:29:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JzTJ3i2Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B940810E804
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 17:29:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B5C5260097;
 Tue,  2 Sep 2025 17:29:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4258C4CEED;
 Tue,  2 Sep 2025 17:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756834192;
 bh=QF6rJk+d+yRLqK+RoVOoN40zim7c43Q5kej5dXa9QoQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JzTJ3i2QQXTGUw+LwTXV6C0mU7snxe1Z6pJIjDyAbiEIijtpjboMwwpnPMhWLkgXn
 xmueJgwRfEJ+Jfksjurb8MDmu4mhF6qEmsez7cQb4bwDq1rk6/YoTWhcCcCKfhyivV
 nClsrvEZ2zAMfRVKBRlnWqKhgD/w112wpHA/H6dmjPUqIrwkfNsYClHo5ISO751MDK
 s66oq0KyoDP0f+GJb8faogaGBFGFoVrd1ZRuor8BynKDtkUkb+ToQl3Lkny1Fkaudp
 ez0eHzcbDioIrTIPVgebp2dERuj/GxnPi+4ZB86xjuRsOmIntpXBPFaY+E8copEnKx
 r5cCM4r4AtJiQ==
Date: Tue, 2 Sep 2025 19:29:48 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: dri-devel@lists.freedesktop.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: drm/bridge: ti-tmds181: Add TI
 TMDS181 and SN65DP159 bindings
Message-ID: <pml7rfbkerzkx5df26x7kxn3tk2o7oqrkqnx26tzikeg53djn5@islb4hlm4ks7>
References: <20250901142958.843678-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.edc18686-244f-441e-a6ac-0b62492b96c8@emailsignatures365.codetwo.com>
 <20250901142958.843678-2-mike.looijmans@topic.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="en5n6wehjgdxg5aa"
Content-Disposition: inline
In-Reply-To: <20250901142958.843678-2-mike.looijmans@topic.nl>
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


--en5n6wehjgdxg5aa
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v4 1/2] dt-bindings: drm/bridge: ti-tmds181: Add TI
 TMDS181 and SN65DP159 bindings
MIME-Version: 1.0

On Mon, Sep 01, 2025 at 04:29:01PM +0200, Mike Looijmans wrote:
> +  ti,retimer-threshold-hz:
> +    minimum: 25000000
> +    maximum: 600000000
> +    default: 200000000
> +    description:
> +      Cross-over point. Up until this pixel clock frequency
> +      the chip remains in the low-power redriver mode. Above
> +      the threshold the chip should operate in retimer mode.

Why should anyone want to tune this at the firmware level?

> +  ti,dvi-mode:
> +    type: boolean
> +    description: Makes the DP159 chip operate in DVI mode.

Ditto. Both describe policy, not hardware.

> +  ti,slew-rate:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 3
> +    default: 3
> +    description: Set slew rate, 0 is slowest, 3 is fastest.
> +
> +  ti,disable-equalizer:
> +    type: boolean
> +    description: Disable the equalizer (to save power).

Why shouldn't we disable all the time then? Again, it looks like a
policy, and not something that should be set in stone in the firmware.

> +  ti,adaptive-equalizer:
> +    type: boolean
> +    description: Set the equalizer to adaptive mode.

Ditto.

Maxime

--en5n6wehjgdxg5aa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaLcpjAAKCRAnX84Zoj2+
du5lAYCVEKByvBzuxFqjgUSVXaGA3CZ+VD10s9iZr871K1qm5IlhwpjWlIzrTpUM
n3KXj/IBgLwh3Fikc4FJpI7Rs+Lexry9cSG/dGO+e1hzbPEVUfBONtOdTWvpqTED
QTwwoWD8Vg==
=LfXL
-----END PGP SIGNATURE-----

--en5n6wehjgdxg5aa--

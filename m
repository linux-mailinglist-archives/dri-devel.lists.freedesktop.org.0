Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3597C54A098
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 22:58:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17ED810F9F5;
	Mon, 13 Jun 2022 20:58:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60ECB10F9F9
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 20:58:49 +0000 (UTC)
Received: from notapiano (pool-98-113-53-228.nycmny.fios.verizon.net
 [98.113.53.228])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1E55D6601671;
 Mon, 13 Jun 2022 21:58:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1655153927;
 bh=TmikzqWBrB46qOMNrEdA0IqJB77LnzkhuMwjJ/1ZJBw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iKZzCOUbY+UJhBB9Z3ZyUUmdIykmqpdNuQBWJpxbwBC0Wp+rz0VBIMnI6o7bt9BFW
 MgxULPUIwA82jhxgDNAUxqr8shbAVRhSkT2inQeb3BUQVZRJsZWWktIEw/NqBh24gF
 eMHrYrHdQ7WBJa4kltnWaNYpYTPRRoG3o9MbN8dnMsEXHM9bVoD6gO2sSVzlIKtoGC
 WmqmMXdSvwN+OiDvRYLb+xn266m0rnLiF/lfsoHXCalt2QsA4hiUOAW6Aa8Yp5P1D7
 t2zcgUao/fkmxW8wsrAwbyxmaNoVena1oizM/3KP4Gy2U0SGHkHr+kKpwBQwmu3y0a
 ThbGcSpSGXbww==
Date: Mon, 13 Jun 2022 16:58:40 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Prashant Malani <pmalani@chromium.org>
Subject: Re: [PATCH v2 0/7] usb: typec: Introduce typec-switch binding
Message-ID: <20220613205840.x7bgrj567prroede@notapiano>
References: <20220609181106.3695103-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220609181106.3695103-1-pmalani@chromium.org>
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
Cc: heikki.krogerus@linux.intel.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, swboyd@chromium.org,
 Pin-Yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 09, 2022 at 06:09:39PM +0000, Prashant Malani wrote:
> This series introduces a binding for Type-C data lane switches. These
> control the routing and operating modes of USB Type-C data lanes based
> on the PD messaging from the Type-C port driver regarding connected
> peripherals.
> 
> The first patch introduces a change to the Type-C mux class mode-switch
> matching code, while the second adds a config guard to a Type-C header.
> The next couple of patches introduce the new "typec-switch" binding as
> well as one user of it (the ANX7625 drm bridge).
> 
> The remaining patches add functionality to the anx7625 driver to
> register the mode-switches, as well as program its crosspoint
> switch depending on which Type-C port has a DisplayPort (DP) peripheral
> connected to it.
> 
> v1: https://lore.kernel.org/linux-usb/20220607190131.1647511-1-pmalani@chromium.org/
> 
> Changes since v1:
> - Fixed function signature error in "else case" of typec_mux.h
> - typec-switch.yaml: Fixed indentation, compatible, and node names in examples.
> - anx7625.yaml:
>     + Introduced patternProperties for "switch" children (suggested by Krzysztof Kozlowski).
>     + Added unevaluatedProperties descriptor (suggested by Krzysztof Kozlowski).
>     + Added "address-cells" and "size-cells" properties to "switches".
> 
> Pin-Yen Lin (1):
>   drm/bridge: anx7625: Add typec_mux_set callback function
> 
> Prashant Malani (6):
>   usb: typec: mux: Allow muxes to specify mode-switch
>   usb: typec: mux: Add CONFIG guards for functions
>   dt-bindings: usb: Add Type-C switch binding
>   dt-bindings: drm/bridge: anx7625: Add mode-switch support
>   drm/bridge: anx7625: Register number of Type C switches
>   drm/bridge: anx7625: Register Type-C mode switches

For the whole series,

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Tested that external display works on both ports of mt8192-asurada-spherion.

Thanks,
Nícolas

> 
>  .../display/bridge/analogix,anx7625.yaml      |  63 ++++++++
>  .../devicetree/bindings/usb/typec-switch.yaml |  74 +++++++++
>  drivers/gpu/drm/bridge/analogix/anx7625.c     | 151 ++++++++++++++++++
>  drivers/gpu/drm/bridge/analogix/anx7625.h     |  20 +++
>  drivers/usb/typec/mux.c                       |   8 +-
>  include/linux/usb/typec_mux.h                 |  38 +++++
>  6 files changed, 352 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/typec-switch.yaml
> 
> -- 
> 2.36.1.476.g0c4daa206d-goog
> 

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A88C354DDAC
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 10:56:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8456C113B89;
	Thu, 16 Jun 2022 08:55:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE48113B94
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 08:55:57 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1856A6601747;
 Thu, 16 Jun 2022 09:55:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1655369755;
 bh=O7PilF/o1r+d7NMD9LMHqoxJRhg19289oyK+92cn2Lw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=U5ebokBYeZaOcQdxx6viSf3M5OvdZ7pQ86Puj2mx3+JckPwT+K+oBg8QNVaS/SNBf
 P3BxQYNyBaEVJGHN4fTuUNrXfW0NWOfFSQ24T87PuMcRWF+YQLt0Qplc/Cd/EgeNCd
 rFfSmoVP4irWpSRlKPWimyTg42zT0B4Cv4nvW+0oyu5KCcp1THhdpzN5E02YWLAwHc
 5DfH5w02R2bZ4L85wuoEiaR6r2sYqYUI52ZB9YaXlBsI5lz+HU0DAYPEOL7i5biMJG
 sy17EheP5Y1RMPhTWk1j4QfoXjmBbAI7UhJz3xO/Ca7MmPJkClo3TWzMfWEPu/D8wo
 wkccZayaTzM3Q==
Message-ID: <b27b6a36-410e-e44d-e03b-d0194b794e90@collabora.com>
Date: Thu, 16 Jun 2022 10:55:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 0/7] usb: typec: Introduce typec-switch binding
Content-Language: en-US
To: Prashant Malani <pmalani@chromium.org>, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20220615172129.1314056-1-pmalani@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220615172129.1314056-1-pmalani@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: heikki.krogerus@linux.intel.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, swboyd@chromium.org,
 Pin-Yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Robert Foss <robert.foss@linaro.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 15/06/22 19:20, Prashant Malani ha scritto:
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
> v3: https://lore.kernel.org/linux-usb/20220614193558.1163205-1-pmalani@chromium.org/
> 

For the entire series:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Regards,
Angelo

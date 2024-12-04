Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5879E348B
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 08:54:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDA2C10EC24;
	Wed,  4 Dec 2024 07:54:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dg46Bgf9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78FA910EC24
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 07:54:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B5C105C64B8;
 Wed,  4 Dec 2024 07:53:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92EA3C4CED1;
 Wed,  4 Dec 2024 07:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733298852;
 bh=r7spAKgJ9nwULUJ94kYk71uQKUoe4HtwLYlFt5AYFJI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dg46Bgf9jwMe6I1uCUp3Lsqtqf6L/k+MOBRHQoLdYmuzUIj0YUPcWbX0FtmUbIOMh
 /+dpPtOR1Mg9DF47VITfak8t3HqsepZ8N0gAtcWbT/6pxjIAqvvjniAX1LLVgw7bAv
 V31ZZPZO5JGoHe70R9EUujt8ApeIxGQSN2FHtuLpDeFwBHMvZt7nUB4zPOdfIl+35Y
 shSaxILOJRNytxvk+PlaGNVVI6LhNiGKKuEe1HsxGlNunsHDkFmJ/hO3htzzthOhGs
 WoTh7KGN6Wdvj/s576JgluvmyghHZTCHILiPJucuZ5Ury76Jttc74A+mCtU4XIUUMJ
 t5DVVQuNwx9MQ==
Date: Wed, 4 Dec 2024 08:54:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrej Picej <andrej.picej@norik.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, marex@denx.de, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, upstream@lists.phytec.de
Subject: Re: [PATCH v3 1/3] dt-bindings: drm/bridge: ti-sn65dsi83: Add
 properties for ti,lvds-vod-swing
Message-ID: <vgg3bygtmj6sotatddkqfapset5bofsqvkzuj7ejuvomn6hs3n@mscq2jbhtaux>
References: <20241203110054.2506123-1-andrej.picej@norik.com>
 <20241203110054.2506123-2-andrej.picej@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241203110054.2506123-2-andrej.picej@norik.com>
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

On Tue, Dec 03, 2024 at 12:00:52PM +0100, Andrej Picej wrote:
> Add properties which can be used to specify LVDS differential output
> voltage. Since this also depends on near-end signal termination also
> include property which sets this. LVDS differential output voltage is
> specified with an array (min, max), which should match the one from
> connected device.
> 
> Signed-off-by: Andrej Picej <andrej.picej@norik.com>
> ---
> Changes in v3:
> - no change


One version of patchset per 24h.

> Changes in v2:
> - move LVDS port schema to a $defs and reference it from there
> - properties are now defined in microvolts/ohms
> - use 1 property for data-lane and 1 for clock-lane LVDS voltage swing
> - add 1 property which sets LVDS near-end termination
> - since major change was done change the authorship to myself
> ---
>  .../bindings/display/bridge/ti,sn65dsi83.yaml | 36 +++++++++++++++++--
>  1 file changed, 33 insertions(+), 3 deletions(-)

...

>  allOf:
>    - if:
>        properties:
> @@ -120,7 +150,7 @@ allOf:
>            properties:
>              port@1: false
>  
> -additionalProperties: false
> +additionalProperties: true

This cannot be true. Not explained in commit msg and this is not shared
schema.

>  
>  examples:
>    - |
> -- 
> 2.34.1
> 

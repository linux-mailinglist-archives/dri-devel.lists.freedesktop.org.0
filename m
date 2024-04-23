Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2665E8AEB3F
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 17:38:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90CDF10F72E;
	Tue, 23 Apr 2024 15:38:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Q/v0Pqjy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBA2610F72E
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 15:38:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1FC67CE0ECC;
 Tue, 23 Apr 2024 15:38:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 659DDC2BD10;
 Tue, 23 Apr 2024 15:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713886705;
 bh=MpUeJX8ffb4u+FjT+llCRbfgNL5taVVPGqoxL2U9JmI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q/v0PqjyczJtqEgG+JUcLV84YoFgLJidGcK4RsMz/RmACT6tmbL7BgySrfnPXo/yI
 Gu8UI+2a/rjJi221QPl60E7DW//v+o1CHj5xs/ZoUl48oBR0TsyK0kmpBQEUlLFCpe
 U0wpDqE+KCA3vFLMmRUlsEfTvIuGbslV1Xds9LNGb2ZPMd5BFrf2AUSjRpMCqWrb31
 N71IruaSA3LCyy5XHKNkx4RAevELxRiNPGf7bNbFB4VFEUXZXQ6dmYBAOzsn2WlsfQ
 K/M0Igsry36sb+dE2FHPvmEjdsyJMj6DsPNi1/m3WDaMgvAgBf1mMM/GK9JmVkXmfa
 2yEkDr8/16DaA==
From: Robert Foss <rfoss@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Conor Dooley <conor+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tony Lindgren <tony@atomide.com>, Simha BN <simhavcs@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Robert Foss <rfoss@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v5 00/10] Improvments for tc358775 with support for
 tc358765
Date: Tue, 23 Apr 2024 17:38:14 +0200
Message-ID: <171388665771.1455301.34959660424269300.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240225062008.33191-1-tony@atomide.com>
References: <20240225062008.33191-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Sun, 25 Feb 2024 08:19:29 +0200, Tony Lindgren wrote:
> Here are v5 patches to improve tc358775 driver and add support for
> tc358765.
> 
> Regards,
> 
> Tony
> 
> [...]

Thanks for the really nice series, sorry about the delay in applying it.

Applied, thanks!

[01/10] dt-bindings: display: bridge: tc358775: make stby gpio optional
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=51debb6d4a21
[02/10] dt-bindings: display: bridge: tc358775: Add data-lanes
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=497f0a1bdc06
[03/10] dt-bindings: display: bridge: tc358775: Add support for tc358765
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=efcfac3e8e37
[04/10] drm/bridge: tc358775: fix support for jeida-18 and jeida-24
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=30ea09a182cb
[05/10] drm/bridge: tc358775: make standby GPIO optional
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=733daaebe250
[06/10] drm/bridge: tc358775: Get bridge data lanes instead of the DSI host lanes
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=005102727d9e
[07/10] drm/bridge: tc358775: Add burst and low-power modes
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=a4ed72e85c46
[08/10] drm/bridge: tc358775: Enable pre_enable_prev_first flag
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=e2ee8e82cf42
[09/10] drm/bridge: tc358775: Add support for tc358765
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ce2196dbba66
[10/10] drm/bridge: tc358775: Configure hs_rate and lp_rate
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ec710af54a1c



Rob


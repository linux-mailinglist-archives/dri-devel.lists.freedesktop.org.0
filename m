Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7252AB9B153
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 19:38:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5761E10E79A;
	Wed, 24 Sep 2025 17:38:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HrkMdWsE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E50D10E79A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 17:38:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8D00460139;
 Wed, 24 Sep 2025 17:38:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CCF1C4CEF4;
 Wed, 24 Sep 2025 17:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758735526;
 bh=1MVE//E1DYLEL5jhgb+nbns0tdTRgS5W4QKqihFcG2Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HrkMdWsEw8ipZ0XAIFqSKEsGb7LNBO1vxNGUw0UcWlqei0Sp1BdpkBb9xrSodkH0O
 LcMmwiVyJdJEwynkUuHKMHuvodHIkaDpXq7BNYDB8tN3Ruz0NJrrQs3Z7x2PX8k0AR
 yn6ZVdydTzuH+CD6iJOT4pBLyLx4/zjr4zCnS99yBprhaP0ek8jy+ajoVc4Xh5kLaz
 HW5S2OL+cZ6XRYZpOd+HsJTA1y7LxKdcKfwP2bb41oEy0KUMdxyFKUeAlnwjhYvJbW
 vPbyoySV0fhxQuMiMPj1qc/mHjGG7fw7wiJnOpHbFnruIhkoBwVGNZ7nF7ony4vc3Z
 xwcu0mVPPygJw==
Date: Wed, 24 Sep 2025 12:38:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 David Airlie <airlied@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: drm/bridge: ti-tmds181: Add TI
 TMDS181 and SN65DP159 bindings
Message-ID: <175873552189.2235936.3746736501239939808.robh@kernel.org>
References: <20250922121902.88664-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.0c2f242e-bdcc-4862-a215-2a988591f8cc@emailsignatures365.codetwo.com>
 <20250922121902.88664-2-mike.looijmans@topic.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922121902.88664-2-mike.looijmans@topic.nl>
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


On Mon, 22 Sep 2025 14:18:44 +0200, Mike Looijmans wrote:
> Add DT binding document for TI TMDS181 and SN65DP159 HDMI retimers.
> 
> The two chips have similar register maps, but different applications
> (source vs. sink).
> 
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> 
> ---
> 
> Changes in v6:
> Rename ti,mode to ti,retimer-mode
> 
> Changes in v5:
> ti,equalizer and ti,mode changed to enum
> Rename ti,slew-rate to slew-rate
> Make properties conditional for DP159/TMDS181
> Remove ti,dvi-mode (always set to avoid conflict)
> 
> Changes in v4:
> Use fallback compatible
> 
> Changes in v3:
> Fix duplicate links
> Add vcc-supply and vdd-supply
> Fix missing type for ti,slew-rate
> 
> Changes in v2:
> Document driver specific bindings like slew-rate and threshold
> 
>  .../bindings/display/bridge/ti,tmds181.yaml   | 170 ++++++++++++++++++
>  1 file changed, 170 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,tmds181.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 205209C2BD9
	for <lists+dri-devel@lfdr.de>; Sat,  9 Nov 2024 11:34:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C6AE10E280;
	Sat,  9 Nov 2024 10:34:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DAUVuD7o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E8710E025
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Nov 2024 10:34:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DF4FD5C4D71;
 Sat,  9 Nov 2024 10:33:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B972C4CECE;
 Sat,  9 Nov 2024 10:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731148477;
 bh=YrjS963uNgkad88N3YmG6Ne3LmcmTYNa7B9ja3oPTXI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DAUVuD7odJA8ZaJz441KqxN3NmIqQCLjYWR8RQzmaUveErBU7c+eIqq3Ph/y2i25l
 ungvDimwUyi7vUmP94+VmI4x+JZGE84FhY6ShAia/3cQtejhNDTPZ7fvE53p3NFXmA
 Acm0p917oprNSaBtgQIkpex0HTxpepSIvweDJ8ObEL5037lYhloRTDLDTXW1PgwG5A
 VCbZfpbX9pcJhyfDbqxvXQHajV3nyY7aC1OLK+HFGelf47IhM4t0WARjemNab1ihq5
 UKYkCjnaFxZxxv0lYhVF8+Dorm9THbCNnzJM0ozpK+z1v0qrHa2FOvASnUw52j2Ucw
 cPESRXw4eIMdg==
Date: Sat, 9 Nov 2024 11:34:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mithil Bavishi <bavishimithil@gmail.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Thierry Reding <thierry.reding@gmail.com>, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 05/10] dt-bindings: display: panel-lvds: Add
 compatible for Samsung LTN101AL03 Panel
Message-ID: <5qnim7ibats5nduuvfxkfo3gbjidbwpo273xdgkgnqpfzp4dkb@t64beyf2ot3j>
References: <20241108200440.7562-1-bavishimithil@gmail.com>
 <20241108200440.7562-6-bavishimithil@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241108200440.7562-6-bavishimithil@gmail.com>
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

On Fri, Nov 08, 2024 at 08:04:34PM +0000, Mithil Bavishi wrote:
> The LTN101AL03 is a 10.1 inch 800x1280, 24 bit, VESA Compatible, TFT display panel
> 
> Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
> ---

Squash it with previous patch. Each of such trivial one-liners for
similar device is review step for me.

Best regards,
Krzysztof


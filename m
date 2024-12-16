Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 791829F2B41
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 08:58:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 056F710E11A;
	Mon, 16 Dec 2024 07:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KBZCiC5t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D19E10E11A
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 07:58:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B48F05C5F33;
 Mon, 16 Dec 2024 07:58:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB6B1C4CED0;
 Mon, 16 Dec 2024 07:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734335932;
 bh=86rMqP/WtCR5k4n5iIFjBozgm/ac1HefdAeeBPp6VTo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KBZCiC5tWu/KEnpK8VcmL9veMbh2v08TBDASgJs27RUsVHhdETI+TgilNZXdp8ken
 VHuGF9Fl6d3Uat8pzqKMuP4k9u7sRJuQMIMenTwWqbVxgd3gaIQiEIbHqUiQRgd56o
 dDMpwfohujadN+SXoQ0ZMmMdK5XCCx3YpbM5J/ZlN3yvYi1t+NSFsOjSasXfNy7WIv
 Z+K6DUpRD0GOHBDdzTie5jhHTtlykuhNLg9SIpz7VPQW4haBlPfaCIGop0djFH30cb
 N+zQNzsoC3hV9SAf9lr6eRPPc/wcB/cVNDJT2hCU4hUmxrHCFKqUMkTPDFm9ESKzr/
 uGlQBi/U5iMdQ==
Date: Mon, 16 Dec 2024 08:58:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>, dri-devel@lists.freedesktop.org, 
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-clk@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH v4 3/7] dt-bindings: display: renesas,du: Add missing
 maxItems
Message-ID: <l2r53ipif43k7kkjqc66z2mq6tyw6niiz4t4nnfge23hygx2pw@xrgk4mv5ljzx>
References: <20241213-rcar-gh-dsi-v4-0-f8e41425207b@ideasonboard.com>
 <20241213-rcar-gh-dsi-v4-3-f8e41425207b@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241213-rcar-gh-dsi-v4-3-f8e41425207b@ideasonboard.com>
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

On Fri, Dec 13, 2024 at 04:02:59PM +0200, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> The binding is missing maxItems for all renesas,cmms and renesas,vsps
> properties. As the amount of cmms or vsps is always a fixed amount, set
> the maxItems to match the minItems.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  Documentation/devicetree/bindings/display/renesas,du.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)

The top level property should define widest constraints as well.

Best regards,
Krzysztof


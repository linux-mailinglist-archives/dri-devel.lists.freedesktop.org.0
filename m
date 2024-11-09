Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE48F9C2BD1
	for <lists+dri-devel@lfdr.de>; Sat,  9 Nov 2024 11:33:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A66210E24D;
	Sat,  9 Nov 2024 10:33:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="s+w28rTX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC5810E24D
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Nov 2024 10:33:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1C445A4008A;
 Sat,  9 Nov 2024 10:31:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97E57C4CECE;
 Sat,  9 Nov 2024 10:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731148391;
 bh=hkIXgjeoP8Tr/1pRsgvqVGJ6QKu0159soEwLNEAlfLk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s+w28rTX6tKbp/9zGefNzDiTA+j3e2bVIuse2tSFkRmKokILwY58JxyaLIcaIM9ng
 gC05xzxIrLe/f+8qLjYNy/2/Q/JRpx1TevYiDGFp0yghxkwCUjyWBFmpVj7loZaAL0
 rnM9ZP1YlouaLp2Y8HkVFDyLl9zmC5Cllf4AL5RKNxxQuOyPvFYcgYbriZrH5UBsP+
 HrDQVxh+MTuLCGGcBQZNw2DDlmNvBjBYBA0U8avLM4DSAa9cBNcsnJDuAjyigXbd+M
 h9M9DobqV9DXoBbcYzEg7XBsIMlGeQlGhGv0ZN7/GobUjeYtb40rTjnx002rO8Ea0E
 H5CK9F98dJ9bQ==
Date: Sat, 9 Nov 2024 11:33:08 +0100
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
Subject: Re: [PATCH v3 03/10] dt-bindings: display: bridge: lvds-codec: add
 doestek,dtc34lm85am
Message-ID: <3qb4bnrh3ilivzcq6kwbg3vc5rp2mfhi7lnoqe3i77dvvw4dhg@bpy44nrq52nn>
References: <20241108200440.7562-1-bavishimithil@gmail.com>
 <20241108200440.7562-4-bavishimithil@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241108200440.7562-4-bavishimithil@gmail.com>
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

On Fri, Nov 08, 2024 at 08:04:32PM +0000, Mithil Bavishi wrote:
> Add compatible strings for the Doestek DTC34LM85AM Flat Panel Display
> Transmitter
> 
> Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
> ---
>  Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


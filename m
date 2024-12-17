Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C6C9F43B2
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 07:29:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C14D010E086;
	Tue, 17 Dec 2024 06:29:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RND4xKEW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE0E10E086
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 06:29:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7B923A41DB8;
 Tue, 17 Dec 2024 06:27:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14ED1C4CED3;
 Tue, 17 Dec 2024 06:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734416940;
 bh=WkBNe+eP+F4BK6723AWaUuVIWNcGrL/HjaD/Ci8rAP8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RND4xKEWxt7vdTWdkIU7it5yUpAtBOCNw97V/HIFGjfjMVVQLolzfEzVgmAOwAgWl
 +LJAi0F+aZ2tDy1eTyhD9U3QbntECczz3SGfdDJJiz/etAM9T78XubhhodBqawVNo5
 Jv+0+2kmYyNrQLKtujN09btdg+9JTzXF1OR/IkD/slvzw8jc+SIa1BrlZ3lqp09P6I
 pBqfkmygfzfc3BOVJMcvUF9Peh56u8Ob2fEhjeSZ7kFboSL2dNltIqEFAEPIfIbb37
 DfN0e8i1z4q0u5S5Z1xgOfRDuYrtOd5Hk6dMlgRJL21BXR1wKp0nOXOz4z9UdOjEfp
 pY/IE3iGZVjMw==
Date: Tue, 17 Dec 2024 07:28:57 +0100
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
Subject: Re: [PATCH v5 4/7] dt-bindings: display: renesas,du: Add r8a779h0
Message-ID: <g63spu33rn6hso3atynur7nepu62t2rspwptbot4mty4b4fldx@tpv2wnr6jixq>
References: <20241217-rcar-gh-dsi-v5-0-e77421093c05@ideasonboard.com>
 <20241217-rcar-gh-dsi-v5-4-e77421093c05@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241217-rcar-gh-dsi-v5-4-e77421093c05@ideasonboard.com>
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

On Tue, Dec 17, 2024 at 07:31:38AM +0200, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> Extend the Renesas DU display bindings to support the r8a779h0 V4M.
> 
> Note that we remove the requirement for two ports from the global part
> of the bindings, as each conditional part defines the number of required
> ports already. This came up with r8a779h0 as it's the first one that has
> only one port.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

TBH, I really dislike tested-by on bindings, because "testing" is
essentially "building". You cannot test the binding different way. You
can review it, that it matches datasheet. You can test the DTS on the
physical hardware, but not the binding.  So if this is equal to
"building" we do not act like: "I built a kernel, so add my Tested-by
tag".  Maybe this was added to cover letter, so the tag
populated here as well.

> ---
>  .../devicetree/bindings/display/renesas,du.yaml    | 52 ++++++++++++++++++++--
>  1 file changed, 48 insertions(+), 4 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


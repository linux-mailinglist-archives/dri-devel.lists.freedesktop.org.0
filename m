Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLogJlj+cGmgbAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 17:27:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2822F59E05
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 17:27:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 204B010E83D;
	Wed, 21 Jan 2026 16:27:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IsFrn/Vb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF21C10E83D
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 16:26:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AC08F401B2;
 Wed, 21 Jan 2026 16:26:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D8E6C4CEF1;
 Wed, 21 Jan 2026 16:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769012819;
 bh=lPZEsy/R0TWCo+vIlgpfWmuSY9TFELbqcAynRk1xTZo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IsFrn/VbHO2nn92pkkVJI9MKbIShiRgObfWNxeoMuMY+8XBh2y+wDDQsdNzWVry82
 pWMVvCoVGogcldv/4L1GEJRo/AXz1nBicDA2MTn/0okJXiwa8CH3MgioTm5gzWxfUI
 DhlkxGVAIWiA4jOr9n9byYIbxMTNvNLb5Xl/zmRF6qunSR22dc5mV+37bE8qj5ycCu
 lK7cflSEbi5K6kpPA8AsyTLg4EugTJttbzxTjhOr29wXeDiSaczR6Q5Eeq5X2IAmW4
 SQ4eGP0mWY6iHkWNZNeayWoezRc0dbzO3GOv9tmy6Y25Gl+wFtbH7nmLEh2GCkHIzG
 HVNGVVzKrzpqg==
Date: Wed, 21 Jan 2026 10:26:58 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-omap@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] dt-bindings: display: bridge: nxp,tda998x: Add missing
 clocks
Message-ID: <176901278536.3411449.15766842466714764313.robh@kernel.org>
References: <2b66577296583a6787f770f0eb13c42a6b50768b.1768233569.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b66577296583a6787f770f0eb13c42a6b50768b.1768233569.git.geert+renesas@glider.be>
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
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:linux-omap@vger.kernel.org,m:andrzej.hajda@intel.com,m:devicetree@vger.kernel.org,m:neil.armstrong@linaro.org,m:linux@armlinux.org.uk,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:geert@glider.be,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[robh@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,intel.com,linaro.org,armlinux.org.uk,kwiboo.se,gmail.com,kernel.org,ideasonboard.com,lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,renesas,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,glider.be:email,0.0.0.70:email]
X-Rspamd-Queue-Id: 2822F59E05
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 12 Jan 2026 17:02:40 +0100, Geert Uytterhoeven wrote:
> Some TDA998x variants (e.g. TDA19988) have an OSC_IN pin, to connect
> an external oscillator circuit or clock source.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This fixes "make dtbs_check":
> 
>     arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dtb: tda19988@70 (nxp,tda998x): Unevaluated properties are not allowed ('clocks' was unexpected)
> 	    from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml
>     arch/arm64/boot/dts/renesas/r8a774c0-cat874.dtb: tda19988@70 (nxp,tda998x): Unevaluated properties are not allowed ('clocks' was unexpected)
> 	    from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml
>     arch/arm64/boot/dts/renesas/r8a774c0-ek874.dtb: tda19988@70 (nxp,tda998x): Unevaluated properties are not allowed ('clocks' was unexpected)
> 	    from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml
>     arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dtb: tda19988@70 (nxp,tda998x): Unevaluated properties are not allowed ('clocks' was unexpected)
> 	    from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml
> 
> This patch can be considered v3 of "[PATCH v2 2/3] [RFC] arm64: dts:
> renesas: cat874: Drop bogus clocks property"[1], as the pin is actually
> connected to a clock source on that board.  On BeagleBone Black, it is
> also connected to a clock source, but not described in DT.
> 
> The linux driver does not use this clock directly, but I suspect[2] the
> use of this pin is controlled through the AP_ENA register value, as
> specified in the second cell of the the audio-ports property.
> 
> [1] https://lore.kernel.org/97b949cddd7e30e9c05873800330dccd3483b12b.1663165552.git.geert+renesas@glider.be
> [2] I do not have access to the programming manual.
> ---
>  .../devicetree/bindings/display/bridge/nxp,tda998x.yaml        | 3 +++
>  1 file changed, 3 insertions(+)
> 

Applied, thanks!


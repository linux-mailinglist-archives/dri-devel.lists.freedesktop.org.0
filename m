Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOI8CUB5imlWKwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 01:18:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EA51158EF
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 01:18:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 615F510E370;
	Tue, 10 Feb 2026 00:18:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jADlMy6q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EFB610E370
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 00:18:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5094F44240;
 Tue, 10 Feb 2026 00:18:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 096D5C116C6;
 Tue, 10 Feb 2026 00:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770682684;
 bh=yOKtSQ64lPH+pKZWkMpdayAgXkECYC0908XJETAT8rw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jADlMy6q+9AdYM2KScIob+gmZ/IqiIoFvLYXRsLWOxF2F1e63FrnosDByKhahgbET
 CiUgu7RfX6si66t8DZ6RYJur2473nH+9RhJ6xOIqjxzFGL95IAV9n52BsfJ/fCb+17
 HDgEJw37oIS1ID6uaLJLZWblIRU1LtykbDja5l0Et5ffQzZMmolMn6ao7nx0CgrFWi
 4kuQ9fc7a6LDDFuT4FsY2ib4pBlyBUB48RGUZ98FnEhjgunP+1ULeG4GL3oMhUEqsK
 G5Y8UfDtpOawnd07CpBLm53Dv3APYXuHFR+EUw4aHt/BXuYNy6VQVeblTL7VNgIhyD
 lT6JHc2e/6YYw==
Date: Mon, 9 Feb 2026 18:18:03 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: geert@linux-m68k.org, Conor Dooley <conor+dt@kernel.org>,
 biju.das.jz@bp.renesas.com, Maxime Ripard <mripard@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Stephen Boyd <sboyd@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, tomm.merciai@gmail.com,
 laurent.pinchart@ideasonboard.com, Simona Vetter <simona@ffwll.ch>,
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>
Subject: Re: [PATCH v4 10/20] dt-bindings: display: bridge: renesas,dsi: Add
 support for RZ/G3E SoC
Message-ID: <177068268250.2177961.13459546326597874034.robh@kernel.org>
References: <cover.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
 <9ae5c0d817ba697084be9022ad7fa20e9e167073.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ae5c0d817ba697084be9022ad7fa20e9e167073.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
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
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:tommaso.merciai.xr@bp.renesas.com,m:geert@linux-m68k.org,m:conor+dt@kernel.org,m:biju.das.jz@bp.renesas.com,m:mripard@kernel.org,m:magnus.damm@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:mturquette@baylibre.com,m:linux-kernel@vger.kernel.org,m:krzk+dt@kernel.org,m:maarten.lankhorst@linux.intel.com,m:geert+renesas@glider.be,m:sboyd@kernel.org,m:laurent.pinchart+renesas@ideasonboard.com,m:tzimmermann@suse.de,m:tomm.merciai@gmail.com,m:laurent.pinchart@ideasonboard.com,m:simona@ffwll.ch,m:devicetree@vger.kernel.org,m:airlied@gmail.com,m:conor@kernel.org,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:geert@glider.be,m:tommmerciai@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER(0.00)[robh@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux-m68k.org,kernel.org,bp.renesas.com,gmail.com,vger.kernel.org,baylibre.com,linux.intel.com,lists.freedesktop.org,glider.be,ideasonboard.com,suse.de,ffwll.ch];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A9EA51158EF
X-Rspamd-Action: no action


On Mon, 02 Feb 2026 12:57:41 +0100, Tommaso Merciai wrote:
> The MIPI DSI interface on the RZ/G3E SoC is nearly identical to that of
> the RZ/V2H(P) SoC, except that this have 2 input port and can use vclk1
> or vclk2 as DSI Video clock, depending on the selected port.
> 
> To accommodate these differences, a SoC-specific
> `renesas,r9a09g047-mipi-dsi` compatible string has been added for the
> RZ/G3E SoC.
> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v1->v2:
>  - Removed oneOf from clocks property, which is no sufficient to
>    differentiate between RZ/G3E, RZ/V2H(P) and RZ/G2L.
>    In particular both RZ/G3E and RZ/G2L have 6 clocks with different
>    meanings.
>  - Use the already exist vclk instead of vclk1 for RZ/G3E DSI bindings.
>  - Updated the allOf section accordingly.
> 
> v2->v3:
>  - No changes.
> 
> v3->v4:
>  - No changes.
> 
>  .../bindings/display/bridge/renesas,dsi.yaml  | 144 +++++++++++++-----
>  1 file changed, 109 insertions(+), 35 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


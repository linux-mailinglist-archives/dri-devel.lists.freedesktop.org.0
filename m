Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOeuB6aSnGnRJQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 18:47:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C9517B072
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 18:47:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0567310E203;
	Mon, 23 Feb 2026 17:47:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UfjzRdcq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6716210E203
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 17:47:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 868FF60141;
 Mon, 23 Feb 2026 17:47:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12A10C116C6;
 Mon, 23 Feb 2026 17:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771868832;
 bh=+Aw2Xh+r8FCGTL8bgRXwkwp9379G+pxf9QvZvi4Ov9E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UfjzRdcqugVEwJySaQoF8Tg2JbVpRGQjoltXaAY6vOcR0/CKJVAA0U8AVGGHmr7Df
 3TO1QDS/Ubrep1HG+Tyghh8ct97AEcM/JDi0IPu+Du5TGrBKQVwC5pCie7ggRQfl2V
 01jvn6qgzoqVgFTWqzKQ+v386ZKAS+3/EI8jFqzUJMIoL9bNiaBx9LYAC72GRDDzDk
 bBgsjKEIrvcng4kzxxti+FOo2mGfS0nZDs4nONvgkjIKd6v9TWksdkzIsISOzCp3oN
 C64jsq6YJXtIiKGGKO+8S/H0sLUzQZXjDqoInubpeDtWPVhgrYYhXs9HUj158z27zj
 2E0walVpXVuLQ==
Date: Mon, 23 Feb 2026 11:47:11 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: David Airlie <airlied@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-renesas-soc@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Conor Dooley <conor+dt@kernel.org>, geert@linux-m68k.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, tomm.merciai@gmail.com,
 linux-kernel@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Maxime Ripard <mripard@kernel.org>,
 laurent.pinchart@ideasonboard.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 09/20] dt-bindings: display: renesas,rzg2l-du: Add
 support for RZ/G3E SoC
Message-ID: <177186883089.4167672.1887646442668136506.robh@kernel.org>
References: <cover.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
 <ca022fdbba5236c36e0cb3095db4c31e8e0cb1b8.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca022fdbba5236c36e0cb3095db4c31e8e0cb1b8.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[robh@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[gmail.com,suse.de,vger.kernel.org,linux.intel.com,baylibre.com,kernel.org,linux-m68k.org,glider.be,ideasonboard.com,bp.renesas.com,ffwll.ch,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:tommaso.merciai.xr@bp.renesas.com,m:airlied@gmail.com,m:tzimmermann@suse.de,m:linux-renesas-soc@vger.kernel.org,m:maarten.lankhorst@linux.intel.com,m:mturquette@baylibre.com,m:conor+dt@kernel.org,m:geert@linux-m68k.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:laurent.pinchart+renesas@ideasonboard.com,m:magnus.damm@gmail.com,m:tomm.merciai@gmail.com,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:mripard@kernel.org,m:laurent.pinchart@ideasonboard.com,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:sboyd@kernel.org,m:simona@ffwll.ch,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,m:magnusdamm@gmail.com,m:tommmerciai@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A3C9517B072
X-Rspamd-Action: no action


On Fri, 13 Feb 2026 17:27:35 +0100, Tommaso Merciai wrote:
> The RZ/G3E Soc has 2 LCD controller (LCDC), contain a Frame Compression
> Processor (FCPVD), a Video Signal Processor (VSPD), Video Signal
> Processor (VSPD), and Display Unit (DU).
> 
>  - LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
>  - LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.
> 
> Add new SoC-specific compatible string 'renesas,r9a09g047-du'.
> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v4->v5:
>  - Dropped renesas,id property and updated bindings
>    accordingly.
> 
> v2->v3:
>  - No changes.
> 
> v2->v3:
>  - No changes.
> 
> v1->v2:
>  - Use single compatible string instead of multiple compatible strings
>    for the two DU instances, leveraging a 'renesas,id' property to
>    differentiate between DU0 and DU1.
>  - Updated commit message accordingly.
> 
>  .../bindings/display/renesas,rzg2l-du.yaml    | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


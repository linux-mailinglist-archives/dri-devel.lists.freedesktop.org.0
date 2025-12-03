Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 057D7C9E327
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 09:25:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D53010E70A;
	Wed,  3 Dec 2025 08:25:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YRdsc/jd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C919810E70A
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 08:25:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 147D8601A1;
 Wed,  3 Dec 2025 08:25:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5549FC113D0;
 Wed,  3 Dec 2025 08:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764750326;
 bh=GH9c445FS+Bv0QIjALZIfJHArmxubl1+AOj/4TvDSMY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YRdsc/jdu/qfgYZWWSDhpKphjvRNhizrsU/lvzj1fi+ToHZBRMMfnWKVgoAHQ98n+
 rWHOFI+WWyXxbC/8OarLudb6VgaUfjI5LmmN9mmAoS+WBD541Fae4N1fry5ARqYKCe
 MwV8/epLbGzVe97rVdnvag/1vEQux8kEh+89NtX1mxaAUL10WQX2eqt5lbjb5BwgEf
 5ZVh7fAXjq6QIFx6ymAZDpdEox6N8RHYl6LUfbkONTCMi3uql0DgrfWGOfa3khLkyP
 WhXVf1jafP23DnwSJGgrAjMtucn/9Utck32TghwRh/1emlK5YQeZcwjZGYsWC16Ihx
 gpBtFSKUzrJ0w==
Date: Wed, 3 Dec 2025 09:25:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
 biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 15/22] media: dt-bindings: media: renesas,vsp1: Document
 RZ/G3E
Message-ID: <20251203-competent-hypnotic-roadrunner-3a4e5e@quoll>
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <2483415f35dabe42ba3c35a0c50a3e9b28dd724a.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2483415f35dabe42ba3c35a0c50a3e9b28dd724a.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
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

On Wed, Nov 26, 2025 at 03:07:27PM +0100, Tommaso Merciai wrote:
> The VSPD block on the RZ/G3E SoC is identical to the one found on the
> RZ/G2L SoC.
> 
> No driver changes are required, as `renesas,r9a07g044-vsp2` will be used
> as a fallback compatible string on the RZ/G3E SoC.

Last statement is not necessary. The first one stating they are
identical implies this. Also, this is mostly about bindings not drivers.
If my other driver in other OS needs custom code for this compatible,
does it invalidate the commit msg?

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


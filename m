Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2541C9E2F9
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 09:24:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F3210E094;
	Wed,  3 Dec 2025 08:23:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="R3nlzz4V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A780C10E094
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 08:23:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A81FA6013C;
 Wed,  3 Dec 2025 08:23:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6F0AC4CEFB;
 Wed,  3 Dec 2025 08:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764750235;
 bh=n3u0bYIQmBFhwh73ozlRA2yCRbZDQPt995my3Yipc1Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R3nlzz4V/84NdWfa2+pF+O/3O3Pw4JNVli6LSummPV5P3DFPf5Gaaqqjp4Cygt84n
 f9BeCd3sI7+51uzpaq1kfagGLdFIIJyD8zg084EZtOHNei+OVB7eZM8GsBN2DJJOkL
 fSG7E20LZgQ5EtZWGq5uy/B6dGi33pCI9gVNvmcUgP1wZ4Pm4yuOgGSiOBlNjVlQjF
 dDMfnsEEATAxnrGZsyxXi77fUucXF+hOhdo/qtBzyzJraGPsj6EFgAPvrWrMaiQyFA
 sqxS9RlHylc4bUjYB2Zc0bbyxcka4Zu/T6IHoaNx7T3TRaBED+XoJNEyqw9Bh2NX34
 DeD+kVb5l0rag==
Date: Wed, 3 Dec 2025 09:23:53 +0100
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
Subject: Re: [PATCH 10/22] dt-bindings: display: renesas,rzg2l-du: Add
 support for RZ/G3E SoC
Message-ID: <20251203-shrew-of-original-tempering-8a8cfc@quoll>
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <fcfc4fc5123c2351d96ac102aa5081bd99c8a40e.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fcfc4fc5123c2351d96ac102aa5081bd99c8a40e.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
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

On Wed, Nov 26, 2025 at 03:07:22PM +0100, Tommaso Merciai wrote:
> The RZ/G3E Soc has 2 LCD controller (LCDC), contain a Frame Compression
> Processor (FCPVD), a Video Signal Processor (VSPD), Video Signal
> Processor (VSPD), and Display Unit (DU).
> 
>  - LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
>  - LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.
> 
> Add then two new SoC-specific compatible strings 'renesas,r9a09g047-du0'
> and 'renesas,r9a09g047-du1'.

LCDC0/1 but compatibles du0/du1...

What are the differences between DU0 and DU1? Just different outputs? Is
the programming model the same?

Best regards,
Krzysztof


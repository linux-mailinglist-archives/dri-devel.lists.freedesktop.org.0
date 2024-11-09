Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E08D9C2BCD
	for <lists+dri-devel@lfdr.de>; Sat,  9 Nov 2024 11:32:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA31410E1A5;
	Sat,  9 Nov 2024 10:32:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cC9Q6d/w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 685A410E1A5
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Nov 2024 10:32:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 67315A402F3;
 Sat,  9 Nov 2024 10:30:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF87DC4CECE;
 Sat,  9 Nov 2024 10:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731148372;
 bh=1uVBzAzPwdrzxRstjz/lLsiLKb6xVUh8k5XZSI+oQvI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cC9Q6d/wqajGGtP5Wc58Y5N0B3wfMSgY9xrXmPIW8WQEaHgtirmYlopIJBBYcMHsw
 5hq271vFdNuBIZz3LumXePencLrY6CZBzWjkBFM0VGuO9PtMIQkyGnUX8FepEPOpoy
 zT/wcGRlbPVyw13GFWALuwDRNyJPzMxmkjsI5wJm7WZZu/TWvex0IVKfIYVt7pmpCO
 msHb5VxzX3rHc6/kgJ+ojuFmRP2XH4nlYhlgpp3t+K1zPRj13X2PUFjzDPLI868iwP
 m1x4g4BUpp8DI/gCfkapdL90ouLeKiNmRdU3f2z25udMRTl4D2kAVB3nh2BLzkovSs
 NTr3L1Tmyh3ig==
Date: Sat, 9 Nov 2024 11:32:49 +0100
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
Subject: Re: [PATCH v3 02/10] dt-bindings: vendor-prefixes: Add Doestek
Message-ID: <u7fs4q6vbbaeza5mi374pc5jayhvi537rytzxczdb66cqwvwlt@gfa7l6f52dle>
References: <20241108200440.7562-1-bavishimithil@gmail.com>
 <20241108200440.7562-3-bavishimithil@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241108200440.7562-3-bavishimithil@gmail.com>
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

On Fri, Nov 08, 2024 at 08:04:31PM +0000, Mithil Bavishi wrote:
> Add vendor prefix for Doestek Co., Ltd.
> Link: http://www.doestek.co.kr/
> 
> Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


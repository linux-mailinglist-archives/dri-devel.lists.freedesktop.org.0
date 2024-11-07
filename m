Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D4A9C0244
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2024 11:24:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C6B910E7E9;
	Thu,  7 Nov 2024 10:24:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PZoO3a2k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D6C10E03E
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2024 10:24:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B6DC9A430F2;
 Thu,  7 Nov 2024 10:22:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E92CC4CECC;
 Thu,  7 Nov 2024 10:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730975058;
 bh=DBeMWR51I+1Rtf9+Dq6nWXoymfTOOib8j5IglKwsQx4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PZoO3a2k3GiD7E0k2KNXFJKBYN7H3XjbtLl5YjFrHrJ+pCwxt2ML5ZKBA1YIEq/Ad
 RmUK7rny61kbhxM2hySFecSKl9fhr4W23uBHs0aj7gmPmvRoAWgNvx8XNNsoaIlui5
 DfKiteqh9Zpw/Z1WTz6oxyMR0EyWwLY87mFS2aoEjx+kpdEW33iLQShKTFaHvFKe7O
 iSN6o+q9KuolB1qocr9ahke+7tM9dob2mABztaWR3uQWSoT9CCK3HXg+fWBU5zc6cM
 UcxQPCLb0C7EbCDdg2O48iy61+0C9DL9RBOIcwG5DhUWbG1ua3/nNxJWL4w0DlK8Pe
 kUyN/yS8K7qLQ==
Date: Thu, 7 Nov 2024 11:24:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: display: adi,adv7533: Drop single
 lane support
Message-ID: <3cs6rkd7tdsvqi4aqagpfmexeikustpnzoq3yfxjidnegruvns@pinbsj3vfrs3>
References: <20241106184935.294513-1-biju.das.jz@bp.renesas.com>
 <20241106184935.294513-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241106184935.294513-3-biju.das.jz@bp.renesas.com>
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

On Wed, Nov 06, 2024 at 06:49:29PM +0000, Biju Das wrote:
> As per [1], ADV7535/7533 support only 2-, 3-, or 4-lane. Drop
> unsupported 1-lane from bindings.
> 
> [1]
> https://www.analog.com/media/en/technical-documentation/data-sheets/ADV7535.pdf
> 
> Fixes: 1e4d58cd7f88 ("drm/bridge: adv7533: Create a MIPI DSI device")
> Cc: stable@vger.kernel.org
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


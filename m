Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CFA9C2BDD
	for <lists+dri-devel@lfdr.de>; Sat,  9 Nov 2024 11:35:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD2F10E025;
	Sat,  9 Nov 2024 10:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uk3lXw5J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB6710E025
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Nov 2024 10:35:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B0D60A402BA;
 Sat,  9 Nov 2024 10:33:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F6FCC4CECE;
 Sat,  9 Nov 2024 10:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731148501;
 bh=nq6mooPKeU7DUSC5ySOB0ohGQFdAzM2NupJ0qrZLsH4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uk3lXw5JdeGdvzCD3+P5FvUxcuPrLiFLYYYYTUN/3zTpA/u0QOSj86KWb5RoQYwAv
 +ytIP31Fzr+I7dRuh4uy8tEGkLWj59n+xj9zpsLfAotuNfW9daWQDb5/PmA1tKgbPe
 Gpoh7+2d7u+rgKVPB9UgrDDMpIF9JICohaECDtNjgnFzA1pf7xtQ0CIfEhErJLXVhs
 TMOdufcOBaxOXLTWjm5Q2bhO1Jtf0XHJnnuTPwD0TtzQlz7pflY2fSDSSZ1s8Td70l
 B1WUtWunm1O1DvK4+J3zMveL5M3INqcyugnkJSWYYgu+Z5zkdYQoR9Tez4MIVPKxfV
 qA/gzyWBTwiCg==
Date: Sat, 9 Nov 2024 11:34:57 +0100
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
Subject: Re: [PATCH v3 07/10] dt-bindings: omap: Add Samsung Galaxy Tab 2 7.0
Message-ID: <duiiumt2ma3g5qbdwedyehtfm45lovjhslmy6idf3xkqroipmv@qpimirp4aptd>
References: <20241108200440.7562-1-bavishimithil@gmail.com>
 <20241108200440.7562-8-bavishimithil@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241108200440.7562-8-bavishimithil@gmail.com>
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

On Fri, Nov 08, 2024 at 08:04:36PM +0000, Mithil Bavishi wrote:
> Add samsung-espresso7 codename for the 7 inch variant
> 
> Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/ti/omap.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documentation/devicetree/bindings/arm/ti/omap.yaml
> index 93e04a109..32978dd9e 100644
> --- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
> +++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
> @@ -138,6 +138,7 @@ properties:
>                - motorola,xyboard-mz617
>                - ti,omap4-panda
>                - ti,omap4-sdp
> +              - samsung,espresso7

Keep alphabetical order

Best regards,
Krzysztof


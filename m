Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33482B4853A
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 09:29:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B769710E472;
	Mon,  8 Sep 2025 07:29:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Zj1L94fI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9002E10E472
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 07:29:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5CFA54005E;
 Mon,  8 Sep 2025 07:29:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7EC4C4CEF5;
 Mon,  8 Sep 2025 07:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757316594;
 bh=JKJZKG96bHSPUzS7MGEeMQmHm9d6eIOzuYNf3OQR2W8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zj1L94fIB/aOlkMqqjv69Dam63SxLkk0C4DDwQglT/fPJle2FUaGfmMgZQia2bXDo
 2I8e/CvsyB7aKr9XRbmmcHsenqLHKJyds+P0agPOmxMyX+MK3Qd9dj37iTzS5CcyKK
 nxP0mEH0SfJUUUS9McY482YbVI/CKoe0QwZMZ08aJpGMlnnWIw+afE6LLBacBJTKuh
 /hEqVQeOZfI+9kuxsrZMYqjPz2/bJoatSFjOOz9mie6qM0zKzqadkjSASj6gfK5FHR
 Iy25ZyH6ePD4fSg3GlxX52CcNJPvzi5RHxtoH4pjl3yIHzPyrUC7MommJIvBjqgBg6
 KNeevhZ+4q06A==
Date: Mon, 8 Sep 2025 09:29:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: dri-devel@lists.freedesktop.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: drm/bridge: ti-tmds181: Add TI
 TMDS181 and SN65DP159 bindings
Message-ID: <20250908-azure-heron-of-experiment-9e4fcd@kuoka>
References: <20250908061605.76787-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.de794bf7-6833-4973-a353-90f9e4a06895@emailsignatures365.codetwo.com>
 <20250908061605.76787-2-mike.looijmans@topic.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250908061605.76787-2-mike.looijmans@topic.nl>
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

On Mon, Sep 08, 2025 at 08:15:57AM +0200, Mike Looijmans wrote:
> Add DT binding document for TI TMDS181 and SN65DP159 HDMI retimers.
> 
> The two chips have similar register maps, but different applications
> (source vs. sink).
> 
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> 
> binding

This does not belong here.

> 
> ---
>

...

> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: Video port for HDMI output (panel or bridge)
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +  ti,mode:

Conflicting type. There is already ti,mode as uint8. Anyway name is too
generic, so maybe ti,retimer-mode

Best regards,
Krzysztof


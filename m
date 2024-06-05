Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D238FD267
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 18:03:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E4410E458;
	Wed,  5 Jun 2024 16:03:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BPrxDYnr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E9EB10E50F
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 16:03:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B21C3CE1810;
 Wed,  5 Jun 2024 16:03:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53F05C2BD11;
 Wed,  5 Jun 2024 16:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717603414;
 bh=p5xoxXEmNvPPLt6YV1rvuZtTOD99XueXa+W4v1sd5zA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BPrxDYnrYPlk2tScYv1rpYxhbkHx+Y+kMDxYlttZ68K5Qga+nyPdjt0Ldf6LGzG03
 H7rcx2l3T+Zu4DTuc67VIpsn5EprgknxKvc44wVH+B1b6Fq4JAONHm8Gu0G5wjU8rF
 DlruPhuiOTEpZizdGuJ2jUnnCkui/qKYpCYebYK8ML8YrbxR/kKvRqK6hU2kt6QXRz
 3b8mfp+yUKChvYsctBzCc8JSpcHn0LP394zCyAB9v32Ek0d+mQyAfA5ZaNyw8X44uq
 SkbKl8k0rN0d997zgVxgE6o0pxNGf5xudCPp8JKHrPs6mETc04aKSEBZ9GWMv6VZQO
 aRCfhGQogB/Ig==
Date: Wed, 5 Jun 2024 10:03:31 -0600
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: tc358867: Document
 default DP preemphasis
Message-ID: <20240605160331.GA3222592-robh@kernel.org>
References: <20240531204339.277848-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531204339.277848-1-marex@denx.de>
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

On Fri, May 31, 2024 at 10:42:03PM +0200, Marek Vasut wrote:
> Document default DP port preemphasis configurable via new DT property
> "toshiba,pre-emphasis". This is useful in case the DP link properties
> are known and starting link training from preemphasis setting of 0 dB
> is not useful. The preemphasis can be set separately for both DP lanes
> in range 0=0dB, 1=3.5dB, 2=6dB .
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: kernel@dh-electronics.com
> ---
>  .../display/bridge/toshiba,tc358767.yaml       | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
> index 2ad0cd6dd49e0..dcf56e996ee22 100644
> --- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
> @@ -98,6 +98,24 @@ properties:
>              reference to a valid eDP panel input endpoint node. This port is
>              optional, treated as DP panel if not defined
>  
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              toshiba,pre-emphasis:

You didn't test adding this property. You will find it isn't allowed. 
That's because 'properties/port' schema above doesn't allow extra 
properties (on the port and endpoint).

> +                description:
> +                  Display port output Pre-Emphasis settings for both ports.

Both ports? This schema is for just port 2.

> +                $ref: /schemas/types.yaml#/definitions/uint32-array
> +                minItems: 2
> +                maxItems: 2
> +                items:
> +                  enum:
> +                    - 0 # -6dB de-emphasis
> +                    - 1 # -3.5dB de-emphasis
> +                    - 2 # No de-emphasis
> +
>      oneOf:
>        - required:
>            - port@0
> -- 
> 2.43.0
> 

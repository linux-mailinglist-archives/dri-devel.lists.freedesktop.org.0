Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 180539918F9
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2024 19:44:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C26310E11B;
	Sat,  5 Oct 2024 17:44:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RHfLjNLC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FADA10E0FD
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Oct 2024 17:44:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9335EA4012C;
 Sat,  5 Oct 2024 17:43:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2207CC4CEC2;
 Sat,  5 Oct 2024 17:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728150242;
 bh=djk9MX/9q9abJv7cF3LUfPXfJX9TOYq3vBr1RWrzieM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RHfLjNLCRptfy6ZcsFJ37LpVph/5PRErKNbnaWD/OQHHRV75W1s2mKnS9V7pe5Oph
 z2UtCjqDF/Q8ngjubuDlJrmph7kxxuBt0Z+S+vwuK0t33RuDUOoDjEomPGUN1IS70O
 fit2wOwkQg5RYg5L8Ig6S1v8NXz3y+EYzQrX6Cqm+tXxRnEiNmZMj+Oy2BPtxaq0Vb
 gu6N0gdFX7vPsago9jgvKP29iKlpc7+sfzJ/s3qwTKlFPicqW/r87leOAMZfDEqbON
 Winx8lUaLU+Pyok0JSSZbyJV3i3DIIvpaXG/pls09hAZkzeOqhoq7mRgMWoN5oguL8
 qrNukWMvDRmKQ==
Date: Sat, 5 Oct 2024 12:44:01 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, devicetree@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: tc358768: switch to
 bus-width
Message-ID: <172815024006.438324.4885049988134352168.robh@kernel.org>
References: <20241003133904.69244-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003133904.69244-1-krzysztof.kozlowski@linaro.org>
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


On Thu, 03 Oct 2024 15:39:03 +0200, Krzysztof Kozlowski wrote:
> "data-lines" property is way too similar to "data-lanes".  It is also
> duplicating "bus-width" from video-interfaces.yaml schema.  Deprecate
> "data-lines" and use the common property.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/display/bridge/toshiba,tc358768.yaml  | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


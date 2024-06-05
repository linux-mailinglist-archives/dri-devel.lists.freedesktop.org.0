Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF9C8FDA3D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 01:17:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFFC810E23B;
	Wed,  5 Jun 2024 23:17:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WnbQrubz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC1610E23B
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 23:17:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C173ECE1990;
 Wed,  5 Jun 2024 23:17:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6694C2BD11;
 Wed,  5 Jun 2024 23:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717629453;
 bh=lnKIPd9m2BvNZ7dvrm5wJgabwj5He/raDitj+DX7stM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WnbQrubzRxJ+nP15j+mEiTH/563m9To3n2zH3hrYhx5hYooX0CRNr2O0fYxpIEzXw
 hLCY/hLWR3413UGw2LO7rZzbVK5MRTKUUEZycf7SPmle3kBVLPDCzKbyNsW3MjHglJ
 1P5T72m2evygJCK8LtAAIex+HF/dVtFP8OYDw8gQuP2wYkZbzLeGpkxffhzU4OqO4z
 NSzz7Ch9pmowZ705IuhoMZ3oqqZmTYs+23Tzj1wO6j3lX4LMFnpEG+gve9jL8cZDpB
 ad8Ha1mvFzBRtyVKfPKet9fk6/sC4/CI2/B/EUKshiA8Jr2tEkox/QdZYb9AoX+Kg3
 3Wwp9rflvh8MA==
Date: Wed, 5 Jun 2024 17:17:28 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, kernel@dh-electronics.com,
 Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH] dt-bindings: display: bridge: tc358767: Keep enum sorted
Message-ID: <171762944380.3344258.9847218157696028022.robh@kernel.org>
References: <20240531203031.277334-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531203031.277334-1-marex@denx.de>
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


On Fri, 31 May 2024 22:30:18 +0200, Marek Vasut wrote:
> Keep the list sorted numerically. No functional change.
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
>  .../devicetree/bindings/display/bridge/toshiba,tc358767.yaml    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


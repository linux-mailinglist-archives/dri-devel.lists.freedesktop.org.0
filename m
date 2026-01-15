Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C336ED251A8
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 15:56:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2193E10E779;
	Thu, 15 Jan 2026 14:56:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Pn8Wmsp3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E3AE10E779
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 14:56:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7BDDB60129;
 Thu, 15 Jan 2026 14:56:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E586C16AAE;
 Thu, 15 Jan 2026 14:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768489012;
 bh=pomdXiTLxr/2XtCrCaKVDuxPsXlBYLkeUhFF6+dFURk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Pn8Wmsp3qVeFKqxCX7WF6/ajJkpXAkXD9YotsRGfQPpRnaw6pPqdBqDdIkNNU0XB0
 PFv/mfXYIRCir3udnL7Qe7iHFrey2kLqxZdmCT5WHpbQYSjRUsCnajC8yRcBcYN2Eb
 Wmksr0LnFlQdUaDQ978WT7DMewbQFO9bbGnGAxKJoszt7x8BOnwCpPk3ENYbU015Ka
 n/6E3tw/UxtCNdmkBEwBzctfnaCkRxPN4eXXp5PNzNj7GhN+n60PexcQqHotlNnASS
 v047wEdFVHFF5y3kKtBzFN8Y6TPNeCYxLRNJg/071ZK5G/g/sObCeDqbCL45HQypBr
 heLsXkE95UwwQ==
Date: Thu, 15 Jan 2026 08:56:51 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>
Subject: Re: [PATCH] dt-bindings: display: bridge: tc358867: mark port 0 and
 1 configuration as valid
Message-ID: <176848900568.627313.556775837566927230.robh@kernel.org>
References: <20260107213546.505137-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107213546.505137-1-marex@nabladev.com>
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


On Wed, 07 Jan 2026 22:35:21 +0100, Marek Vasut wrote:
> Current binding document enforces presence of either port@0 (DSI in) or
> port@1 (DPI IN/OUT), with port@2 (DP out) being optional. This bridge is
> capable of DSI->DP, DPI->DP and DPI->DP, it is therefore perfectly valid
> to have both port@0 and port@1 described in the DT, because this is fairy
> standard DPI->DP configuration of this bridge. Replace oneOf with anyOf
> to cover this configuration.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Andrey Gusakov <andrey.gusakov@cogentembedded.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  .../devicetree/bindings/display/bridge/toshiba,tc358767.yaml    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!


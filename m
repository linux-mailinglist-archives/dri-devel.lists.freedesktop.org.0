Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE267D2847B
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 21:01:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD7310E030;
	Thu, 15 Jan 2026 20:01:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WsGPH3Iv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F3A210E030
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 20:01:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 588B160130;
 Thu, 15 Jan 2026 20:01:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5F28C116D0;
 Thu, 15 Jan 2026 20:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768507309;
 bh=zJzmID6LrfZsolTF0bdsRqEDmsoqKjjDc5djAfmj4l4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WsGPH3IvDTZpkDAdmrFSsSJksFXsXDEIwUf4brF9zOSpK1BU4Srqp4VD5TgeQmjXf
 Gk2JGO/kSrV4sve6e1VR60Aj8rYmr/zOpdf0ZhbOO1IqT/KHxcJLwmyz00qSWt+43i
 WP8aadjzpLk4qIULQLKbLiMhKDTxrY1SIb2I4WQ8ldhfxI8BJzqnnErUgzFJg4CLub
 MtbHW6kLsSvEgr3BqOLmdTsI/9WQjn4EiaB64CwcEUiBJsSxni7vb3V4E4z5cRE/J6
 0HtwBcJpau83MI5acbqCgFRZ5vyUjNJ3vvbBZscBd1Rj9Obh4bUdBn/iaAh2nTRLds
 FOtRqet6YQP3w==
Date: Thu, 15 Jan 2026 14:01:47 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Maxime Ripard <mripard@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Simona Vetter <simona@ffwll.ch>, devicetree@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Joseph Guo <qijian.guo@nxp.com>, linux-renesas-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge: waveshare,dsi2dpi:
 Document 1..4 DSI lane support
Message-ID: <176850730712.1093165.15441480948491259694.robh@kernel.org>
References: <20260115024004.660986-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115024004.660986-1-marek.vasut+renesas@mailbox.org>
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


On Thu, 15 Jan 2026 03:39:42 +0100, Marek Vasut wrote:
> Describe 1..4 DSI lanes as supported. Internally, this bridge is
> an ChipOne ICN6211 which loads its register configuration from a
> dedicated storage and its I2C does not seem to be accessible. The
> ICN6211 supports up to 4 DSI lanes, so this is a hard limit for
> this bridge. The lane configuration is preconfigured in the bridge
> for each of the WaveShare panels.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Joseph Guo <qijian.guo@nxp.com>
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
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: No change
> ---
>  .../devicetree/bindings/display/bridge/waveshare,dsi2dpi.yaml  | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


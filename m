Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A95BD26603
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 18:27:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F38610E1CF;
	Thu, 15 Jan 2026 17:26:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OiNZPDv0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2DAC10E1CF
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 17:26:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BE8E5435D5;
 Thu, 15 Jan 2026 17:26:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77F35C16AAE;
 Thu, 15 Jan 2026 17:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768498017;
 bh=rxtUsKJLIbTkjOuK4B8HWZ1hvRnwTbMEmg8MB28cTn8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OiNZPDv08Wo2MHuqzRQxIOzTh/YJHkmwfmg5fzLuEql2snf+kRxZ2IzmjtGWloF9e
 UmL1j5uSRatEjGHhYEWBgF4HCixlAu3SDZ623gVAza6X9F9Hz4ocO29Qu+C0DhVXA8
 Q1aoxsywIfB8gsU9b9TS0AXEUlBhZQCDWGNvGAOfjSbE4hFrkLIoR06hqnTDupyuMx
 a0EmXuT5x7495meaaNJGeOYyX1GeJ7IXRA8Os7N3KLH+iPIx3immaXhrAtFXyTzoKg
 7JfQcdazBC9oY/CU0RsXDP2G0C4E6xL54Rkm7TCcpGlrcPjR2hqxnz/9uRgMlWE65v
 Afe/ednTHX82A==
Date: Thu, 15 Jan 2026 11:26:56 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Maxime Ripard <mripard@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/5] dt-bindings: display: bridge: simple: document the
 Algoltek AG6311 DP-to-HDMI bridge
Message-ID: <176849801599.918454.4274355104031576041.robh@kernel.org>
References: <20260111085726.634091-2-val@packett.cool>
 <20260111085726.634091-4-val@packett.cool>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260111085726.634091-4-val@packett.cool>
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


On Sun, 11 Jan 2026 05:35:10 -0300, Val Packett wrote:
> The Algoltek AG6311 is a transparent DisplayPort to HDMI bridge.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  .../devicetree/bindings/display/bridge/simple-bridge.yaml        | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


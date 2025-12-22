Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B34CD52BC
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 09:50:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28E8E10E260;
	Mon, 22 Dec 2025 08:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OIknjdVb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0166710E260
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 08:50:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B64E643ECC;
 Mon, 22 Dec 2025 08:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B0D8C116D0;
 Mon, 22 Dec 2025 08:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766393418;
 bh=/bsBl2MzAkIZMLL18XUVSb6jEQQ+/TaQ9ObI+wn75r0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OIknjdVbIXSCxLkd8+DonR0h/9ggW6yigkD4k54tG3YeDJDOSD8ogdgd/j1pm6Nux
 +ItFpJSa0BYUos3Cj5i63RkoCUnd83P9pml3uGWzHz4uFFD7w4wLPftBDYgg6k1v72
 a3E/kDiU+96EX8xnTFPZF2DRwLrqVDvZXH3uIQeY8Wv/qxR5vU8SDXzACnePSOn3Pd
 +Gd14Er3/YVg4Zir5Z522AKbQErP/Hg5BIQ2711THUj9W0LgA0qN6CEo1RJLcp0R9/
 qvjeuPFpYxRYoRRbseXNKgXWvBx/N+zXrPwTtBkEIiI+hu5K2CYoAsrjkMI4dXbPY/
 5u0kD1OrAYexQ==
Date: Mon, 22 Dec 2025 09:50:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pet Weng <pet.weng@ite.com.tw>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 Hermes Wu <hermes.Wu@ite.com.tw>, Kenneth Hung <kenneth.Hung@ite.com.tw>, 
 Pin-yen Lin <treapking@google.com>
Subject: Re: [PATCH v5 1/3] dt-binding: display: Add ITE IT61620 MIPI DSI to
 HDMI bridge
Message-ID: <20251222-melodic-lemming-of-bliss-7a4bbb@quoll>
References: <20251222-it61620-0714-v5-0-afb6479ad3ca@ite.com.tw>
 <20251222-it61620-0714-v5-1-afb6479ad3ca@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251222-it61620-0714-v5-1-afb6479ad3ca@ite.com.tw>
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

On Mon, Dec 22, 2025 at 11:10:12AM +0800, Pet Weng wrote:
> This chip receives MIPI DSI input and outputs HDMI, and is commonly
> connected to SoCs via I2C and DSI.
> 
> Signed-off-by: Pet Weng <pet.weng@ite.com.tw>
> ---
>  .../bindings/display/bridge/ite,it61620.yaml       | 142 +++++++++++++++++++++
>  1 file changed, 142 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 045FF9C2BD5
	for <lists+dri-devel@lfdr.de>; Sat,  9 Nov 2024 11:33:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7976510E27B;
	Sat,  9 Nov 2024 10:33:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Td5JXVZI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3662210E27B
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Nov 2024 10:33:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AD032A402C8;
 Sat,  9 Nov 2024 10:31:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 199B9C4CECE;
 Sat,  9 Nov 2024 10:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731148419;
 bh=fdJ8kKLr5diHlbxc+zf+bQRD4XLwbVaST3HTEi5AdBI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Td5JXVZIoLk5aD0ri8BCSz3BxFR9JFEjPuNiTJH3ZfUHaRBmimBqd5btEWCZL4MtS
 ZXwrcNY2yvVPM5SXZ79hN2AH24HeBuX25NcaE9CQ/bzEUlsQ7IAqDiTCxcaQWJDgIm
 knL9gdUu7P2p9gtXP1bElM5UcY/k7d7zcjc6GzmNB6cYQJSXpwMf+gxJXXNSt25581
 Gt9v676E/FWdWUO/1w+QBkJgnUAtK76xwXgjn/zKZ5lQlxRzqCjVcwL8fC+XnHntVd
 0fx4F4noLVG7bBX131RH8x1HVENtRJBhbU2gQHfNCEEWPOifzSDVaewSu5VLogM1JP
 PsqHtwCeqvMOw==
Date: Sat, 9 Nov 2024 11:33:35 +0100
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
Subject: Re: [PATCH v3 04/10] dt-bindings: display: panel-lvds: Add
 compatible for Samsung LTN070NL01 Panel
Message-ID: <3ds4bjqjr7z4fqtrmc2wgzdacvtfed4y36vtledlk7uj6dwont@tbbmfklxaf53>
References: <20241108200440.7562-1-bavishimithil@gmail.com>
 <20241108200440.7562-5-bavishimithil@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241108200440.7562-5-bavishimithil@gmail.com>
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

On Fri, Nov 08, 2024 at 08:04:33PM +0000, Mithil Bavishi wrote:
> The LTN070NL01 is a 7.0 inch 1024x600, 24 bit, VESA Compatible, TFT display panel

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


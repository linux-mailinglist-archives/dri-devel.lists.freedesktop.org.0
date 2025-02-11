Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3ADA30492
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 08:35:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3449010E203;
	Tue, 11 Feb 2025 07:35:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dZPD32ZX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BEF710E203
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 07:35:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 318E65C039F;
 Tue, 11 Feb 2025 07:35:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 004EBC4CEDD;
 Tue, 11 Feb 2025 07:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739259355;
 bh=wk9GcUBAUnFbpDFQjRgo/Y7jGVofCjD7NpuzPXMmbNU=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=dZPD32ZXuJAb3SaosBOD3nrgRXQVwSLTGR8Ip8SO5hn4R82fPCQCOVMFZeVWkwEKF
 CsRwWKh5X2FSpspky30RS9ud/WXOOYvuYTGh9gJyXV7D1DNqcd9eUIW1K3tG2pq8a8
 +tVA+ecHrDAe8SK7i8WdBt2OShsxmm23a9thPsNMCF5L36Pt+u2Jdd/WAo86kABVlP
 fq5gUv60xGYHo4U0usYfJ3gQzj6YA1M/4VVcctNHfxVRcmxGGctjnOvsw2DWKcoeBg
 Wba4XtAH4yUWtmjkKbAUIa0DaBtLcrhn+Cz53Ri/oj0MGdvkhuBue3+qUyD+sVodRw
 oJc95h1+ypBzA==
Message-ID: <e7d64ac755a644d680e5d69e91fac7ed@kernel.org>
Date: Tue, 11 Feb 2025 07:35:52 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Herve Codina" <herve.codina@bootlin.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: display: bridge: sn65dsi83: Add
 interrupt
In-Reply-To: <20250210132620.42263-2-herve.codina@bootlin.com>
References: <20250210132620.42263-2-herve.codina@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "Alexander
 Stein" <alexander.stein@ew.tq-group.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "Conor
 Dooley" <conor+dt@kernel.org>, "Conor Dooley" <conor.dooley@microchip.com>,
 "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>,
 "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Laurent
 Pinchart" <laurent.pinchart+renesas@ideasonboard.com>,
 "Louis Chauvet" <louis.chauvet@bootlin.com>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marek
 Vasut" <marex@denx.de>, "Maxime Ripard" <mripard@kernel.org>,
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Raspberry
 Pi Kernel Maintenance" <kernel-list@raspberrypi.com>,
 "Rob Herring" <robh@kernel.org>, "Robert
 Foss" <rfoss@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
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

On Mon, 10 Feb 2025 14:26:16 +0100, Herve Codina wrote:
> Both the TI SN65DSI83 and SN65DSI84 bridges have an IRQ pin to signal
> errors using interrupt.
> 
> This interrupt is not documented in the binding.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

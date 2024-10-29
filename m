Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 387869B429E
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 07:57:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB6010E5AF;
	Tue, 29 Oct 2024 06:57:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ti9VOJxP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C9510E5AF
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 06:57:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EA8DDA415FD;
 Tue, 29 Oct 2024 06:55:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E29BC4CECD;
 Tue, 29 Oct 2024 06:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730185041;
 bh=+Q/V6WXCYROq0Q1G3AsK/wbeGU4RqG8R0bxG0WnUNVw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ti9VOJxPFctnUTwirh+ch80KIKFIDoNfh2n0AhSXnf6ixc0zkDDvoWm+kv/xwDOSt
 VgNUyPQd+2sUJJy6CI7FGqpVU6FQa+4APolRk0lLqlt1Yl42PlpqwabdNb9yAZUKSv
 VrJUBIaH5Kv0AqZPkkQez731q1605KNwT0+n5fP7aDOhCsjYInGC1YJkghzP4VB3ig
 IZOSe9X9rqR9aAJAcVdhfjrhZz7a1v3+lW6bOttDpPhA1lfccbxzIqkeMYDUlUPWi9
 2zB48+HoHB7vMho6R3ViOjt/IE65XK4Ej/SkDYGu/WReJLUKTDYHjOXAp7Iyk6EmR2
 A0hrjklGdsG6g==
Date: Tue, 29 Oct 2024 07:57:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sandor Yu <Sandor.yu@nxp.com>
Cc: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 festevam@gmail.com, 
 vkoul@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, 
 mripard@kernel.org, kernel@pengutronix.de, linux-imx@nxp.com,
 oliver.brown@nxp.com, alexander.stein@ew.tq-group.com, sam@ravnborg.org
Subject: Re: [PATCH v18 3/8] dt-bindings: display: bridge: Add Cadence MHDP8501
Message-ID: <c664wq5wzzvivvkpedkicz6ku55epoa75oyycm3hohoms46yi5@myn542dqlpmu>
References: <cover.1730172244.git.Sandor.yu@nxp.com>
 <e11ba0cf836d6f27935f58b7987e792026ab0233.1730172244.git.Sandor.yu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e11ba0cf836d6f27935f58b7987e792026ab0233.1730172244.git.Sandor.yu@nxp.com>
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

On Tue, Oct 29, 2024 at 02:02:11PM +0800, Sandor Yu wrote:
> +  interrupts:
> +    items:
> +      - description: Hotplug cable plugin.
> +      - description: Hotplug cable plugout.
> +
> +  interrupt-names:
> +    items:
> +      - const: plug_in
> +      - const: plug_out
> +
> +  data-lanes:
> +    $ref: /schemas/media/video-interfaces.yaml#/properties/data-lanes
> +    minItems: 4
> +    maxItems: 4
> +    description: Lane reordering for HDMI or DisplayPort interface.

Please look how existing bindings do it. data-lanes is a property of
port. Otherwise why would you like this to be applied to the input?

Best regards,
Krzysztof


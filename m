Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAF6C6D22D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 08:34:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F4B10E595;
	Wed, 19 Nov 2025 07:34:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MSXbdbLC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 644F110E595
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 07:34:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6806B60209;
 Wed, 19 Nov 2025 07:34:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F574C16AAE;
 Wed, 19 Nov 2025 07:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763537640;
 bh=+VT0vHKyeNB2uauVAiq1vH/zwODt8yBbpa/doxp/yT8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MSXbdbLCrN8/wIdwz8onSD74ZzzjmhPk4AyN3HRUosYUhLg5YbIiOpn61SBcJn+/0
 rwtzpMNtnetEvCGV7JG5s1WDMOzO4gdouXwO5kqFk/X/J483ow62bLJDE37PEcVJ07
 PDfkD31ivbbZj+4OL9WQj946PPd0iEXd9rhg2H4nxO22ddP09BFGT6orW6V7Ljxicz
 Vff09qbKG+WXlosjWguLIDrLQES4i26ZYc9ZV8MvYD6plfmHzC+gU3gcdtLSW8v59c
 +OH2iE4x7XyquUhv3j//ZbeujrI74BvPMlRdhLIdgxMshqSvtluB6uq3QZkP9fHBEs
 6Fz+vqXK10cgA==
Date: Wed, 19 Nov 2025 08:33:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, Frank.li@nxp.com
Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge: ldb: Document
 nxp,enable-termination-resistor
Message-ID: <20251119-rainbow-wren-of-acceptance-c0e7f3@kuoka>
References: <20251119022946.268748-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251119022946.268748-1-festevam@gmail.com>
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

On Tue, Nov 18, 2025 at 11:29:45PM -0300, Fabio Estevam wrote:
> Document the optional nxp,enable-termination-resistor property for the
> i.MX LVDS display bridge.
> 
> This boolean property indicates that the built-in 100 Ohm termination
> resistor on the LVDS output is enabled. It is controlled via the HS_EN
> bit in the LVDS_CTRL register. Enabling the resistor can improve LVDS
> signal quality and may prevent visual artifacts on some boards, but
> increases the power consumption.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Changes since v1:
> - Change the property name to nxp,enable-termination-resistor (Frank).

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


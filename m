Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E0F955312
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 00:05:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5198210E845;
	Fri, 16 Aug 2024 22:05:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cBxCmD9x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4C5C10E845
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 22:05:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0F591CE0D9A;
 Fri, 16 Aug 2024 22:05:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1867CC32782;
 Fri, 16 Aug 2024 22:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723845919;
 bh=h9r1mnmS5fGiHw6Op7GOzpACqSXBQDNYwqVtGHhVfKQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cBxCmD9x+b6Xi2EztlTQr7l+0oKriA3Qm3EkwXTkYqJH8Gk9b2xMAlyG6hf679xB3
 skaSIzYrtNKtQdd3i8CrmCF4SX/bJgri+17By6gT/rcBd30VO2OYwQef0Ke/p0AwgD
 /tYhywnRQH7vc0/+W9Kiwt4Ulg7TmdIKclNfZ2focOnG+YwWkZX9Qa7oNweH6yopoW
 8K/c/NWFWcKneaHH1+Mc1zxxNENSA1zVPtk6ij6vs9RSCQdp9ozrYBaKXmhXUUtw3L
 nAucw6srxJ2UiuR4X0M1+p/Fj5ENlkqPsy2QL7IOYWvX93Hqx6SPdZvDQusoH2el2a
 Y4mVJBKbM5cEg==
Date: Fri, 16 Aug 2024 16:05:18 -0600
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liu Ying <victor.liu@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: display: panel-simple-lvds-dual-ports:
 use unevaluatedProperties
Message-ID: <20240816220518.GA2347670-robh@kernel.org>
References: <20240812193626.3826250-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812193626.3826250-1-Frank.Li@nxp.com>
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

On Mon, Aug 12, 2024 at 03:36:26PM -0400, Frank Li wrote:
> Replace additionalProperties with unevaluatedProperties because it ref to
> panel-common.yaml.
> 
> Remove properties (backlight, enable-gpios and power-supply), which defined
> in panel-common.yaml.
> 
> Fix below warning:
> arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: panel-lvds: 'panel-timing' does not match any of the regexes: 'pinctrl-[0-9]+'
>         from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-ports.yaml#
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../display/panel/panel-simple-lvds-dual-ports.yaml         | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)

Actually, I prefer doing it this way. Applied.

Rob

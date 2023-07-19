Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB4A75A163
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 00:08:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ABC310E523;
	Wed, 19 Jul 2023 22:08:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 510D510E520
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 22:08:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 56FE6617C9;
 Wed, 19 Jul 2023 22:08:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EF74C433C7;
 Wed, 19 Jul 2023 22:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689804498;
 bh=YKo1s2RcmQT9GEQkdwQRplIb4/3XIYip45dG1+IBkZo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UbVZZLPw4SW1i1Sf21v+wZagWRQykxFFTpNDvhLxKR86PKVY2daXzt5lpVGxR9aBa
 M7fpchvJ6GOXkep/h4hlLsMmmMu40KC5op6dI3KoaNX95exTW9OA/9W11AoPpdAw5R
 CsdbqoXDdOjzkSX/LY8N9gsitK38nYbJW5a/u9Fyda0pb9DMz/iE3siLhCd8Vm7Kug
 bxlabdPzn8e3iEuu96TS+amu4kF9OThW5bBKN9FVFS/GnALbYmjMKJwK1KdlTA+XyH
 BRuv+vkXvWEMCcrUUGIrRUrflzVhENpz0Mf8Gza7OE/PpEImE57ZcKxmhYPPagwjg6
 jcZBGI96TppKA==
Received: (nullmailer pid 865386 invoked by uid 1000);
 Wed, 19 Jul 2023 22:08:16 -0000
Date: Wed, 19 Jul 2023 16:08:16 -0600
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2 02/41] dt-bindings: display: Add Renesas SH-Mobile
 LCDC bindings
Message-ID: <168980449598.865332.8440260745722540866.robh@kernel.org>
References: <cover.1689698048.git.geert+renesas@glider.be>
 <3333e8e50572480dd57d7f0388ca7f06d76155d9.1689698048.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3333e8e50572480dd57d7f0388ca7f06d76155d9.1689698048.git.geert+renesas@glider.be>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 18 Jul 2023 18:54:07 +0200, Geert Uytterhoeven wrote:
> Add device tree bindings for the LCD Controller (LCDC) found in Renesas
> SuperH SH-Mobile and ARM SH/R-Mobile SOCs.
> 
> Based on a plain text prototype by Laurent Pinchart.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> 
> v2:
>   - Add myself as co-maintainer,
>   - Make fck clock required,
>   - Drop ports description referring to obsolete graph.txt,
>   - Condition ports to compatible strings,
>   - Drop label and status from example.
> 
> Changes compared to Laurent's original:
>   - Convert to json-schema,
>   - Rename compatible values from "renesas,lcdc-<SoC>" to
>     "renesas,<SoC>-lcdc",
>   - Add power-domains property,
>   - Add MIPI-DSI port on SH-Mobile AG5,
>   - Update example to reflect reality,
>   - Add to MAINTAINERS.
> ---
>  .../display/renesas,shmobile-lcdc.yaml        | 130 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 131 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/renesas,shmobile-lcdc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>


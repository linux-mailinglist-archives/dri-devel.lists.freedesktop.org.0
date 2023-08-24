Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A4F7876D8
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 19:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D0A10E008;
	Thu, 24 Aug 2023 17:21:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5FEF10E008
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 17:20:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 15EDA6245D;
 Thu, 24 Aug 2023 17:20:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 443E9C433C9;
 Thu, 24 Aug 2023 17:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692897656;
 bh=sExzA+ev19jx8Yh8PaMathy8y9f6OIK5w1nNHVQbmFw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AafaxhcCblZ3clnb1PBmWA0uKBBoteyLZbLCfslw8RPL69r7co5T59kXxI5X0qymV
 0mIL4j46su5fd0/NDKGtp9u2MMQRs4Kv7o20HsCcAKb5RD3K4RVUSR5kWncDYzKmsg
 lWkH2F6Fnf17GWpF39ZjZokvEQIooQQOZwkGybMM0m0DScHfHfnT+3TsoS6erObRAj
 6qtzxb+jsQustVq+PKlEd6MQrUutrDndX0isGq46Maa2JrlOcQGZGiASfoxLgiUfQW
 tpeyI2DqbFYCTqPg7Zk6A//8tTlaWk6XW5hbetk8UCKp2Bt++p5Eu2Q1/cMFUkPNRU
 DUsNbbz91HWrg==
Received: (nullmailer pid 1066767 invoked by uid 1000);
 Thu, 24 Aug 2023 17:20:54 -0000
Date: Thu, 24 Aug 2023 12:20:54 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: display: novatek,nt35950: define ports
Message-ID: <20230824172054.GA1065406-robh@kernel.org>
References: <20230823081500.84005-1-krzysztof.kozlowski@linaro.org>
 <20230823081500.84005-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230823081500.84005-2-krzysztof.kozlowski@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, Jianhua Lu <lujianhua000@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Del Regno <angelogioacchino.delregno@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 23, 2023 at 10:14:59AM +0200, Krzysztof Kozlowski wrote:
> The panel-common schema does not define what "ports" property is, so
> bring the definition by referencing the panel-common-dual.yaml. Panels
> can be single- or dual-link, thus require only one port@0.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes since v2:
> 1. Use panel-common-dual
> 
> Changes since v1:
> 1. Rework to add ports to device schema, not to panel-common.
> ---
>  .../devicetree/bindings/display/panel/novatek,nt35950.yaml     | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>

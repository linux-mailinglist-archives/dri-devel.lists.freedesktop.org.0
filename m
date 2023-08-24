Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CB07876D9
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 19:21:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C9310E0B4;
	Thu, 24 Aug 2023 17:21:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B7F10E0B4
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 17:21:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7CE0E67572;
 Thu, 24 Aug 2023 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93FE2C433C9;
 Thu, 24 Aug 2023 17:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692897662;
 bh=9yXrtO8fbh1grXof5RIUb0YcKlKXU12c1Zzn5iHyObE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FDrX7Rcp83NB2WpIiiMtrECnSTxd6CBscUgoQpV698UNM9zFlxKqt5L+Gee0AtsRP
 cf+kktoQr/cKwzbURzlGdTayHaj9BRS9J6Tp8+aIwahMWAhx/jyKOevssMOHj0xjhT
 w8z3MvJ6sRsdRx4sp+IeBZZ5RWhzzxMsgUtYc0AC85djfMmZYMkB1/MgLmAdQqQ3OR
 /m7uK4g39wqwWaDWg1XN8132lVjfT5SFNwMZUoSBWCUDLTeK38tsP0Ii9ccpzALpAC
 g/68KfAIloBdSqCddFRrUQpbDQFmWrGrqwcDW+Dd6sx+8SaxVa9WXIYlYhh1bs4593
 kcjuR0yppN02A==
Received: (nullmailer pid 1066930 invoked by uid 1000);
 Thu, 24 Aug 2023 17:21:00 -0000
Date: Thu, 24 Aug 2023 12:21:00 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 3/3] dt-bindings: display: novatek,nt36523: define ports
Message-ID: <169289765993.1066873.13186532623781949639.robh@kernel.org>
References: <20230823081500.84005-1-krzysztof.kozlowski@linaro.org>
 <20230823081500.84005-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230823081500.84005-3-krzysztof.kozlowski@linaro.org>
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
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Jianhua Lu <lujianhua000@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Thierry Reding <thierry.reding@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 23 Aug 2023 10:15:00 +0200, Krzysztof Kozlowski wrote:
> The panel-common schema does not define what "ports" property is, so
> bring the definition by referencing the panel-common-dual.yaml. Panels
> can be single- or dual-link, depending on the compatible, thus add
> if:then:else: block narrowing ports per variant.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes since v2:
> 1. Use panel-common-dual.
> 2. Add if:then:else:
> 
> Changes since v1:
> 1. Rework to add ports to device schema, not to panel-common.
> ---
>  .../display/panel/novatek,nt36523.yaml        | 25 +++++++++++++++----
>  1 file changed, 20 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


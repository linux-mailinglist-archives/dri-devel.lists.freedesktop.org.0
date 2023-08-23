Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2C5785809
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 14:48:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB1FB10E41D;
	Wed, 23 Aug 2023 12:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7272E10E41D
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 12:48:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5BA1B60FBD;
 Wed, 23 Aug 2023 12:48:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42453C433C7;
 Wed, 23 Aug 2023 12:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692794899;
 bh=hjen39C6ClFSUIbbViuLUmhXBL1KKbVLgLrYh3YC6l8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PrrmAVQUiUEcYhkXKySTgC9Zf52cjf70qkf+zaKQCtcN4BW39ZiO/XNWAdW/qkmzN
 YwMDhbRSBjUJMEZ79nBD4LVpazKA9MMMLmQC/Pqu02tJ9aJMfV/vBYHjH5Tg6zVEs0
 NKcohXDXKD5sUp0r9cyOvZudG82Vvwl8IIaJ4At74c1ky6c/WX7/BUBXGD7BoWO3xQ
 IMqnunuIQi4B21c8HraDLxX2BDoicsLQm5vJeQGrSYRKgc5b2dLKqvP6BAWpGddSAF
 Uxg2Df/Qh9CrZ6Sk0kvZNGTWqR6slVgvk+7ci7vLbjpIbQKynz4Dtc9lOZ6stStvvX
 v6usD8pzv9pZw==
Received: (nullmailer pid 2036422 invoked by uid 1000);
 Wed, 23 Aug 2023 12:48:17 -0000
Date: Wed, 23 Aug 2023 07:48:17 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: display: novatek,nt35950: define ports
Message-ID: <20230823124817.GA2034925-robh@kernel.org>
References: <20230823081500.84005-1-krzysztof.kozlowski@linaro.org>
 <20230823081500.84005-2-krzysztof.kozlowski@linaro.org>
 <169278171739.1524810.6441506448861500441.robh@kernel.org>
 <32667691-ec7f-0dd3-b3ba-fdcd40f1fbca@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32667691-ec7f-0dd3-b3ba-fdcd40f1fbca@linaro.org>
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
 Thierry Reding <thierry.reding@gmail.com>, Jianhua Lu <lujianhua000@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Del Regno <angelogioacchino.delregno@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 23, 2023 at 11:53:56AM +0200, Krzysztof Kozlowski wrote:
> On 23/08/2023 11:08, Rob Herring wrote:
> > 
> > On Wed, 23 Aug 2023 10:14:59 +0200, Krzysztof Kozlowski wrote:
> >> The panel-common schema does not define what "ports" property is, so
> >> bring the definition by referencing the panel-common-dual.yaml. Panels
> >> can be single- or dual-link, thus require only one port@0.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>
> >> ---
> >>
> >> Changes since v2:
> >> 1. Use panel-common-dual
> >>
> >> Changes since v1:
> >> 1. Rework to add ports to device schema, not to panel-common.
> >> ---
> >>  .../devicetree/bindings/display/panel/novatek,nt35950.yaml     | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> > 
> > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> > 
> > yamllint warnings/errors:
> 
> Previous patch seems to be missing in Patchwork, thus this error.
> 
> https://patchwork.ozlabs.org/project/devicetree-bindings/list/?submitter=83726&archive=both&state=*

Must have been some delay on that one as it is there now.

Rob

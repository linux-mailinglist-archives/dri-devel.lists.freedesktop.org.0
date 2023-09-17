Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C786C7A420D
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 09:17:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59A2310E1E4;
	Mon, 18 Sep 2023 07:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-223.mta0.migadu.com (out-223.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::df])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 371C010E02D
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Sep 2023 20:26:22 +0000 (UTC)
Date: Mon, 18 Sep 2023 06:24:24 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
 t=1694982379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qEy663wbTYgFkY8BNJi+ahfknVm89R9oplFVkVuCOzo=;
 b=v/DLL3KPs678sxsCZzCuk+NPwsJvuXXiy9+Dr36jVLgYb4b9d4OY35vNgwMK2ypjpq9xRb
 d9tuGdAEFz46FUzkxuZqbVkgP0Y/kseaN/ko/r7jjpJDiBkgnq5x3BL5SmljKQ4946CjEU
 AJKRHQRI5z4BuXZUQPF7nd/5Q/uMPUIs4Yso5FFP4dsZ+YyihpTZlgXNRGcNfrrDyu1+dX
 1HKWUn+R/Qt3miliSQkGsXXbL6+GBk3nk6pkZlQE+7xTr8L2T+XZzbi35WtgjjZPWazjDP
 zg/gOQPovAt+0exu6eStLjEvx67ew+yToElQE+vbmKmwUiSEGe3qiDzBfLE7hQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: John Watts <contact@jookia.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [RFC PATCH 8/8] dt-bindings: display: panel: add Fascontek
 FS035VG158 panel
Message-ID: <ZQdgeA5tQA4xK5qL@titan>
References: <20230911090206.3121440-1-contact@jookia.org>
 <20230911090206.3121440-9-contact@jookia.org>
 <e22e61e7-02b1-8127-888d-e470838f4a18@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e22e61e7-02b1-8127-888d-e470838f4a18@linaro.org>
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Mon, 18 Sep 2023 07:16:21 +0000
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
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Chris Morgan <macromorgan@hotmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@edgeble.ai>,
 Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 11, 2023 at 11:41:12AM +0200, Krzysztof Kozlowski wrote:
> Missing reg. Probably also port.

Hello again,

I've been working on v2 of this series and done some initial cleanup.

Right now it looks a bit like this:

> allOf:
>   - $ref: panel-common.yaml#
>   - $ref: /schemas/spi/spi-peripheral-props.yaml#
> 
> properties:
>   compatible:
>     const: fascontek,fs035vg158
> 
>   spi-3wire: true
> 
> required:
>   - compatible
>   - reg
>   - port
>   - power-supply
>   - reset-gpios

Does this seem correct?
- reg is required by spi-controller
- port is listed in panel-common
- power-supply is listed in panel-common

I'm guessing that the required section just lists the minimal
properties needed for this specific device tree yaml?
There's nothing implied by allOf?

> Best regards,
> Krzysztof
> 

John Watts.

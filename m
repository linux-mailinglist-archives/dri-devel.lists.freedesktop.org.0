Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A4D78B3E9
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 17:03:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1429310E2F9;
	Mon, 28 Aug 2023 15:03:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A7F510E2F9
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 15:03:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7865D64A80;
 Mon, 28 Aug 2023 15:03:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85EFDC433C7;
 Mon, 28 Aug 2023 15:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693235008;
 bh=WCke0F5eyHY4DNrnnCkGIBXzM8zbnzJYKIFi10qfwWc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PA+ShH6wwtdQBZAZwEQYYytcMJI/HnNIJcp+WdgsYgPU/N79LMpO47/u5OHQxLoQ/
 SiSg+0kz/FkYJOHkjToqPN4/1wCfahxD/nC6t7GgbwD+IbRWESAzJb8LblD30MMq7c
 DhWVlmtJA60DTefKwMCKmJ30IaUX/fXRZiraQMBxVr7brddnLzO1Ff5h81zWcntNkW
 XDx+FLkqRFo9vY9xF6cu+m81EzNfJs7dXDqhMzjRBtOYoOw9/LOjEo1wxaGiEYujnP
 sHt1yq1RSezW3JG6557eaEoaaKxj9hUP12jNZ1PCUcFJPpiZUwocEzN692GCTJSPck
 SAR2NgPohjSWg==
Received: (nullmailer pid 491243 invoked by uid 1000);
 Mon, 28 Aug 2023 15:03:26 -0000
Date: Mon, 28 Aug 2023 10:03:26 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: display: panel: add common dual-link
 schema
Message-ID: <169323500594.491192.1035869173529424762.robh@kernel.org>
References: <20230825121142.101759-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825121142.101759-1-krzysztof.kozlowski@linaro.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Jianhua Lu <lujianhua000@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri, 25 Aug 2023 14:11:40 +0200, Krzysztof Kozlowski wrote:
> Add schema with common properties shared among dual-link panel ICs.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes since v3:
> 1. Re-phrase description of binding and ports (Laurent)
> v3: https://lore.kernel.org/all/20230823081500.84005-1-krzysztof.kozlowski@linaro.org/
> 
> Changes since v2:
> 1. New Patch
> v2: https://lore.kernel.org/all/20230502120036.47165-1-krzysztof.kozlowski@linaro.org/
> v1: https://lore.kernel.org/all/20230416153929.356330-1-krzysztof.kozlowski@linaro.org/
> ---
>  .../display/panel/panel-common-dual.yaml      | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-common-dual.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>


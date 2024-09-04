Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0518B96C231
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 17:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6832010E7F1;
	Wed,  4 Sep 2024 15:25:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sg8e/hb6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 322C210E7F1
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 15:25:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 242675C57FA;
 Wed,  4 Sep 2024 15:25:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0628CC4CEC2;
 Wed,  4 Sep 2024 15:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725463524;
 bh=/pUv984IhiKK7uLBabAivPDZNjvchudFRmFo5PjiLuo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sg8e/hb6iy2z/VNvafzN1ZuqCFUdaQh7S2oEvHERXVG+5af+3iI8mXl7+GYYBo/ns
 JJYf6GOyd4LEVbciYC46vXhcHAu2SZXKXmRDeSUkTR/j9meNWVydm4EZnEB8hj7pYq
 lcTUddLF5XGz+eEyGlQcncyWK+0ZI4n2QYsXW9VcECZrfydYLQDfgWEBuJTH7Q4DJ9
 XKGUDMa56pG1n4q8SZ9dfzOQ9cUniQWT7Mt4jhIJiOB5IL/FGig3hw9sXVez5idMxT
 OBpYKnWHgLvPcuyN40wFrnXM3z0PoTLSvT8oOzJ9F8uMccz9sKeIMkknb3p0Yxx3Uz
 TFdN6npit2JSg==
Date: Wed, 4 Sep 2024 10:25:23 -0500
From: Rob Herring <robh@kernel.org>
To: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Cc: angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
 krzk+dt@kernel.org, conor+dt@kernel.org, knoxchiou@google.com,
 hsinyi@google.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: mediatek: Add MT8186 Ponyta
 Chromebook
Message-ID: <20240904152523.GA2602479-robh@kernel.org>
References: <20240904081501.2060933-1-cengjianeng@huaqin.corp-partner.google.com>
 <20240904081501.2060933-2-cengjianeng@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904081501.2060933-2-cengjianeng@huaqin.corp-partner.google.com>
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

On Wed, Sep 04, 2024 at 04:15:00PM +0800, Jianeng Ceng wrote:
> Add an entry for the MT8186 based Ponyta Chromebook (custom lable).

Still a typo.

Would be helpful to define what 'custom label' means here.

> 
> Signed-off-by: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
> ---
> Changes in v3:
> - PATCH 1/2: Modify lable to label.
> - Link to v2:https://lore.kernel.org/all/20240903061603.3007289-1-cengjianeng@huaqin.corp-partner.google.com/
> 
> Chage since V2:
> - No change.
> 
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index 1d4bb50fcd8d..410145976272 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -257,6 +257,17 @@ properties:
>            - const: google,steelix-sku393218
>            - const: google,steelix
>            - const: mediatek,mt8186
> +      - description: Google Ponyta (Custom label)
> +        items:
> +          - const: google,ponyta-sku0
> +          - const: google,ponyta-sku2147483647
> +          - const: google,ponyta
> +          - const: mediatek,mt8186
> +      - description: Google Ponyta (Custom label)
> +        items:
> +          - const: google,ponyta-sku1
> +          - const: google,ponyta
> +          - const: mediatek,mt8186
>        - description: Google Rusty (Lenovo 100e Chromebook Gen 4)
>          items:
>            - const: google,steelix-sku196609
> -- 
> 2.34.1
> 

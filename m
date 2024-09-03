Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A4E96945D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 08:59:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C289710E348;
	Tue,  3 Sep 2024 06:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QE/aQmHJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6C688E26
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 06:59:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7C4DAA4105E;
 Tue,  3 Sep 2024 06:59:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F8F0C4CEC5;
 Tue,  3 Sep 2024 06:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725346769;
 bh=JNtXEBV6t/Ur+CoAftaJeKqF0v5X7Y8stmeb2ra32hc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QE/aQmHJ+zVpDV5boPwwYuT63zREd59/h8vxKHTaTTq3W9Z7SLSfpkTbxUvuqXbvP
 VJu5fLGtycdEbb90lD5X2JhzOtEfcSe1MvHL4kSd01cEw+Tq3s14zNOGPGxTT6VPvJ
 2cAS8V9Gf/VzvVX9xBlK+dikTdTN6O7xu6RKxinEfP2jI6yc/KLDS4UdrJhbpXAby2
 pPXwG2W/h7+k1fWMAlKxY63k38ceOknutaoNI0m+P1LeSMV3XQHKfBb1De/+v/z3rh
 7RX/37leBziWWnY9CpkY1kmT9CaVSRBusAuDypA8aGI6CI4Zgss5Ou3S6TENeRtc1v
 Pcb9LRjFdZZTA==
Date: Tue, 3 Sep 2024 08:59:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Cc: angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, knoxchiou@google.com,
 hsinyi@google.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: mediatek: Add MT8186 Ponyta
 Chromebook
Message-ID: <a2jklrd7ozek6n3rhjby5pck5yho4g6ckxkii4toxf3s3k3pbi@mfvdaoz2ki6a>
References: <20240903061603.3007289-1-cengjianeng@huaqin.corp-partner.google.com>
 <20240903061603.3007289-2-cengjianeng@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240903061603.3007289-2-cengjianeng@huaqin.corp-partner.google.com>
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

On Tue, Sep 03, 2024 at 02:16:02PM +0800, Jianeng Ceng wrote:
> Add an entry for the MT8186 based Ponyta Chromebook (custom lable).
> 
> Signed-off-by: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
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
> +      - description: Google Ponyta (Custom lable)

lable? label? What is this?

> +        items:
> +          - const: google,ponyta-sku0
> +          - const: google,ponyta-sku2147483647

maxint? Really?

Best regards,
Krzysztof


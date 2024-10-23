Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 511189ABFF0
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 09:16:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C551110E76D;
	Wed, 23 Oct 2024 07:15:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JR7riPcE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF4510E76B
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 07:15:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8295A5C5D4E;
 Wed, 23 Oct 2024 07:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28ECCC4CEC6;
 Wed, 23 Oct 2024 07:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729667755;
 bh=4W+Tw8lSJUPRVKdVVjJ3ewzvg0TBWDpx8vwJiowNTbA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JR7riPcEnITY8aJKahja89zILrPz505v3WdTnDpFRm/kvLtIZRaOFaLW1Cdqh8Fkj
 B7OxBb+iMGLvj3Ks0iLpR2LEVZ4foWPrsAnpcizoigUgiXk+4p62a86bKd21EZFmkq
 6dnyHed9AVMs2993e67wuoTIrUbNQ7pKW3pfNJMGVpSJVgGL8xeFQfoqBkQQ90Swua
 VjwXEGjQAPwQmjhoq1UluYCHELsZYDwf1h/zs20k6HNGJfRhvrZ6ijs5sJ7xvzm2Di
 QT2PRajmIsH2bQ7ZN8632rcmC0XtYhPg+NwAdiqk7i9JAisGjCaQGyIVgh3Op3ljIy
 Ym/KgWFr+h9Ng==
Date: Wed, 23 Oct 2024 09:15:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jakob Hauser <jahau@rocketmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 1/5] dt-bindings: display: panel: Move flip properties
 to panel-common
Message-ID: <yq7usspbou5lj4zz5giw472icd655als7pdik4ito2ziaidkwv@7yrkrgqs462o>
References: <cover.1729630039.git.jahau@rocketmail.com>
 <18a0d8787b5714633a574f2e15f0cec1addddcfc.1729630039.git.jahau@rocketmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <18a0d8787b5714633a574f2e15f0cec1addddcfc.1729630039.git.jahau@rocketmail.com>
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

On Tue, Oct 22, 2024 at 11:33:35PM +0200, Jakob Hauser wrote:
> The flip properties were used by "samsung,s6e8aa0.yaml" only so far. By
> introducing "samsung,s6e88a0-ams427ap24.yaml" they become more common.
> 
> Signed-off-by: Jakob Hauser <jahau@rocketmail.com>
> ---
> Patch is based on current branch drm-misc-next.
> ---
>  .../bindings/display/panel/panel-common.yaml           |  8 ++++++++
>  .../bindings/display/panel/samsung,s6e8aa0.yaml        | 10 ++--------
>  2 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> index 0a57a31f4f3d..087415753d60 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> @@ -51,6 +51,14 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      enum: [0, 90, 180, 270]
>  
> +  flip-horizontal:
> +    description: boolean to flip image horizontally
> +    type: boolean
> +
> +  flip-vertical:
> +    description: boolean to flip image vertically
> +    type: boolean
> +

I actually wonder how or why would you need to flip the images. I
understand rotation, but this is mirror flip, right? Is it for some
transparent displays?

The change is fine, I just really wonder about hardware.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


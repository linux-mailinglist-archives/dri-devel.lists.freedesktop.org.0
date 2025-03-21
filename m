Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4995A6B5CD
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 09:10:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0F7210E705;
	Fri, 21 Mar 2025 08:10:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YF2mgQ8J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08F8810E705
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 08:10:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DC416A4973A;
 Fri, 21 Mar 2025 08:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 077CCC4CEE3;
 Fri, 21 Mar 2025 08:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742544648;
 bh=+rfm0VgNi58UlS6Mr9jdwghnEVpDGqTsgyDvBE7vOrI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YF2mgQ8JjPnKzwus08IDSkCkivQKkXgZE6e+3yN1hLybBSFtVGiIWMlGQQcbZLzbv
 ZQuUxLQ65euXlF7MdP7Q1iPsc8Ez0c8XdhHWdu73kj1Pkpd2PTYSIGlJnTu+8yVzo+
 3NevVzi8mWz7j7XWEJ382MBTpt83nTTuPSEYAxEVusWz8i4cWoddYWOlmszThmjciU
 QIvgV2tVJ0tx4YeZ85yMyIYWm/wUsrKlQ2fclkP+lVXZYsIE289NlSw33RUZGRJ1mX
 Gg4qoMgIgmXF/4LHaZhPEMzRWtgV0XyCm4tM0O8GKDpX6uzDyy4wt5ts9pqkF6ZNOY
 znmnTomGgFDDg==
Date: Fri, 21 Mar 2025 09:10:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Matt Coster <matt.coster@imgtec.com>
Cc: Frank Binns <frank.binns@imgtec.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Randolph Sapp <rs@ti.com>,
 Darren Etheridge <detheridge@ti.com>, 
 Michal Wilczynski <m.wilczynski@samsung.com>,
 Alessio Belle <alessio.belle@imgtec.com>, 
 Alexandru Dadu <alexandru.dadu@imgtec.com>
Subject: Re: [PATCH v4 02/18] dt-bindings: gpu: img: Add BXS-4-64 devicetree
 bindings
Message-ID: <20250321-liberal-muskox-of-reputation-edd6c0@krzk-bin>
References: <20250320-sets-bxs-4-64-patch-v1-v4-0-d987cf4ca439@imgtec.com>
 <20250320-sets-bxs-4-64-patch-v1-v4-2-d987cf4ca439@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250320-sets-bxs-4-64-patch-v1-v4-2-d987cf4ca439@imgtec.com>
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

On Thu, Mar 20, 2025 at 11:32:12AM +0000, Matt Coster wrote:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: img,img-bxs-4-64
> +    then:
> +      properties:
> +        power-domains:
> +          minItems: 2
> +        power-domain-names:
> +          minItems: 2
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            anyOf:

Instead: enum

> +              - const: ti,am62-gpu
> +              - const: ti,j721s2-gpu

Best regards,
Krzysztof


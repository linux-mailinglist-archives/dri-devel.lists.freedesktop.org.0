Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF150B310FD
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 10:00:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 482B510E0C7;
	Fri, 22 Aug 2025 08:00:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EHsW+l5l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0459B10E0C7
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 08:00:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A60E043974;
 Fri, 22 Aug 2025 08:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED615C4CEF1;
 Fri, 22 Aug 2025 08:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755849624;
 bh=3LSBrlgPclPcn4MCgtRigx2+6I/Y0aDUi3B5dRZXgJU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EHsW+l5lBzW6kIrQPVMAzO+pLHcaO9NHZlYPxnKMkHMJ4t0v1jWgeqNJeriGCTOXy
 4mj7Yj0W1lhPZncT1Q1rcwbsRxk1frpx6p7fK521064HLZoSTKOaSv50jbwGhAff/R
 IGcREZsoQUt7Fy2BogPc0NRiig+ip1MyOv3g5ntKq2/8rWKboO7f4bhSaFhujEu5CZ
 PSfI/bxD8EFetgLxg7/grV6GwCEP0bCMmDdQfUc/FVg9Ha6gKVnLj846fyyFWodWhN
 B02F0I1VKT99cWB6hfO4VHiOUqLVdHXNy+xBcWZ0KRY78b6KttQ2Z+JJfMSCAYO9Kh
 018gCc3WKLGrw==
Date: Fri, 22 Aug 2025 10:00:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: Yannick Fertre <yannick.fertre@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Christophe Roullier <christophe.roullier@foss.st.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 01/13] dt-bindings: display: st: add two new
 compatibles to LTDC device
Message-ID: <20250822-gifted-messy-fulmar-1eab63@kuoka>
References: <20250821-drm-misc-next-v4-0-7060500f8fd3@foss.st.com>
 <20250821-drm-misc-next-v4-1-7060500f8fd3@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250821-drm-misc-next-v4-1-7060500f8fd3@foss.st.com>
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

On Thu, Aug 21, 2025 at 01:08:51PM +0200, Raphael Gallais-Pou wrote:
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +        clock-names:
> +          maxItems: 1
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - st,stm32mp251-ltdc
> +    then:
> +      properties:
> +        clocks:

minItems: 2

> +          maxItems: 2
> +        clock-names:

minItems: 2

Best regards,
Krzysztof


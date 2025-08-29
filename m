Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D43B3B609
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 10:32:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E6E710E063;
	Fri, 29 Aug 2025 08:32:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="NBtnlWZA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E40B810E063
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 08:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1756456333;
 bh=D13BED59TY0YL/Ln9OiO8LUjI2j7bDBOhPSj9e11PN8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NBtnlWZAdNEqgz32lvf0exRIFJItqZQ8torG3lcyTpnUe+mruwJrTov2yauNrnsRk
 Y36RgdYOZSsXwmn48evOI0n/ikOpXw8vYtKbG2RFjYJFEP/+mJokTi9DDLXp4v91J7
 r0h4QTBZtqjlI4NBVeLvl+42PyogSW7Qhunnu3vqHfNe15VQFA9GmMIae9itGQtVG2
 /UlyCeB6NjsQSLnIHMjlJ2PfUCvghU4/rAg2Dlt8OrV0QAW/LDkzV9JfjinNuEONGF
 dVAGXva+hij7tDuEWERPZHt0suEJb8b1I6+DSjnnBhtgrWVxIj6nr/q+os9kJNQYT2
 p5CTySamlZ9ow==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B6ECA17E0489;
 Fri, 29 Aug 2025 10:32:12 +0200 (CEST)
Date: Fri, 29 Aug 2025 10:32:08 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: gpu: mali-valhall-csf: add asn-hash
Message-ID: <20250829103208.7d849319@fedora>
In-Reply-To: <20250828201806.3541261-2-olvaffe@gmail.com>
References: <20250828201806.3541261-1-olvaffe@gmail.com>
 <20250828201806.3541261-2-olvaffe@gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 28 Aug 2025 13:18:05 -0700
Chia-I Wu <olvaffe@gmail.com> wrote:

> The values are written to ASN_HASH[0..2] registers. The property is
> called "l2-hash-values" in the downstream driver.
> 
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> ---
>  .../devicetree/bindings/gpu/arm,mali-valhall-csf.yaml     | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> index a5b4e00217587..258bcba66d1d1 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> @@ -85,6 +85,14 @@ properties:
>  
>    dma-coherent: true
>  
> +  asn-hash:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +      The values are written to ASN_HASH[0..2] registers. They affect how
> +      physical addresses are mapped to L2 cache slices.

If this is per-SoC integration details, I would hide that behind the
compatible string and have some panthor_soc_data attached to the
of_device_id entries.

> +    minItems: 3
> +    maxItems: 3
> +
>  required:
>    - compatible
>    - reg


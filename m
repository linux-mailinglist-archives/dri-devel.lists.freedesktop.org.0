Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B23B0EC73
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 09:55:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A860810E09F;
	Wed, 23 Jul 2025 07:55:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eSKxe20+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC17810E772
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 07:55:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 400F5A55D78;
 Wed, 23 Jul 2025 07:55:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58A6CC4CEE7;
 Wed, 23 Jul 2025 07:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753257299;
 bh=ZDYcPCDUmn1VTBeGdo4epTjJXexbWNcEvLjw6WdeLHw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eSKxe20+g0A9UzE8VPgZt5ArBXuVTbs+X/NYjoqhp3MpcACaXHVjEYhVS/sDlPHPt
 pCQ3Q5NWj+cOaAgXpAMd72NDwogrPG9dZdW5sRtKQI47NL483qwslHo2vD61bnEOnw
 p2i9jqfnFBojlb+Lqidx33ObDNHkWERkgzd+w6gIVxhOr8yGoC1NwwSfcXUbXmh4lN
 vDyXwPP+Hum13QzrvCN+O5pW3DYWlszXIxeWNR2pCNTIzzYw3aVt+mXaCaeqh7L+12
 3XHLHBKFQypr53WR1kYriB+iTGAC4oSd7sJlqTfudrEUOKCaPcQFnn4OgRKSdAQMdf
 dqw6r+qkftZhg==
Date: Wed, 23 Jul 2025 09:54:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Otto =?utf-8?Q?Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Kevin Tang <kevin.tang@unisoc.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/15] dt-bindings: display: sprd: allow attaching a
 DSI panel
Message-ID: <20250723-dark-modest-mole-480bff@kuoka>
References: <20250722-ums9230-drm-v2-0-054276ec213d@abscue.de>
 <20250722-ums9230-drm-v2-3-054276ec213d@abscue.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250722-ums9230-drm-v2-3-054276ec213d@abscue.de>
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

On Tue, Jul 22, 2025 at 04:41:05PM +0200, Otto Pfl=C3=BCger wrote:
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +            description: The output endpoint, usually connected to the p=
anel

I never remember if the output should be a "port" here or a panel@ child
(as described by dsi-controller.yaml). Various users do it differently.

Syntax looks fine to me, so happy to get second opinion on above point.

Anyway:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


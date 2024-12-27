Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E59449FD179
	for <lists+dri-devel@lfdr.de>; Fri, 27 Dec 2024 08:41:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 786F0892AE;
	Fri, 27 Dec 2024 07:41:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JsuYEpYW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A49892AE
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2024 07:41:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8513C5C603C;
 Fri, 27 Dec 2024 07:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35F8BC4CED0;
 Fri, 27 Dec 2024 07:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735285260;
 bh=vZh45f7DcV/ihH8wAEQ9uEdqDbk/ADLKTkNo1deSqJM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JsuYEpYWKcziW/Nu1Vnug3S2gKroilmKL/BFlsVF38p/8VySn7MqxwFBj4DsDI5KI
 wRuU0pF0wBVGEvjYxwBoLuPExkkmy2nFrZ8Z9fu/VF0Jke7+ig1t0hYvBFtpKOoVb+
 Eh+zP/eHQPdk7TYczGd2yuLz8bR4ovAkzhuYUgxWirwIsy6wzzGcn8NUwIbaTg9stY
 9vi4y10qk8eBNGL5ihAyvODGM/1Zft/Qamxag6/x2YvoWmv2Sre4aKNvf3DpHa+BaJ
 srtCnDoYGW/vNc4EfV1cnAkXaCCrwpy1TNzcpwcZ+bgMjvZLNsY3B543hRWrirXC+Z
 NfTLTufwUVFkg==
Date: Fri, 27 Dec 2024 08:40:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 David Airlie <airlied@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v2 06/17] dt-bindings: gpu: Add rockchip,rk3562-mali
 compatible
Message-ID: <ebznnq7lhkgk6c4ft5e7q2u7vn4z6yi4ntyd5wiecvcme6eri3@zhgyttih2zxc>
References: <20241224094920.3821861-1-kever.yang@rock-chips.com>
 <20241224094920.3821861-7-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241224094920.3821861-7-kever.yang@rock-chips.com>
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

On Tue, Dec 24, 2024 at 05:49:09PM +0800, Kever Yang wrote:
> rk3562 has 1 ARM Mali-G52 GPU,.
> 

This we see from the diff. Say something not obvious. Where is the
driver change? Why devices are or are not compatible?

> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
> 
> Changes in v2: None
> 
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index 735c7f06c24e..b0d4806614aa 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -25,6 +25,7 @@ properties:
>                - renesas,r9a07g044-mali
>                - renesas,r9a07g054-mali
>                - rockchip,px30-mali
> +              - rockchip,rk3562-mali
>                - rockchip,rk3568-mali
>                - rockchip,rk3576-mali
>            - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
> @@ -60,7 +61,7 @@ properties:
>  
>    clocks:
>      minItems: 1
> -    maxItems: 3
> +    maxItems: 4

No, existing devices did not grow. Plus this is now desynced with the
names.

Best regards,
Krzysztof


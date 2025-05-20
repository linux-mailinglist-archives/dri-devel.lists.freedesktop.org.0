Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 162D7ABD03F
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 09:20:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7645310E10C;
	Tue, 20 May 2025 07:20:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CzksAmSc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06AC410E10C
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 07:20:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 172EB49B55;
 Tue, 20 May 2025 07:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B04AC4CEE9;
 Tue, 20 May 2025 07:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747725630;
 bh=5pfW76gzsZFj7G6lA9ya03YxgKxR658S/A6U1aae8yA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CzksAmSc4WrKjvyZ2M3isCeiTFwYp9AjNBsOsXciiiYrDr5mAYU3pADnvkXIGFOMP
 UGu7XfQnUuq64tXk4O/SnlGIceW8W3yH1ZG5RgTjDnoKdAZPDhIDM7u4zqY86Dh0qt
 ZlTnuOH9Dai3iAuxh5Ht0Og3A9BnR1yObnJxFhzLB85L7gNO7JOfvPlFQFe18p8jZ0
 HdVJwmu9Xw0dkBROtUyJ6WgLY9GOnCs7MOQtdLGj2nTgQn2ay096Jfz/FFnkdm2c7n
 fX08CvBEjofIgSUjRArIWCBZVT0GlAMrAVNncPc+lImXwb+j3xtLmvSETiTuDzSGtH
 p7zDyuGgG6Hew==
Date: Tue, 20 May 2025 09:20:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, Dragan Simic <dsimic@manjaro.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] dt-bindings: display: rockchip: Convert
 cdn-dp-rockchip.txt to yaml
Message-ID: <20250520-sexy-pronghorn-of-tact-f9cddf@kuoka>
References: <20250520024718.142-1-kernel@airkyi.com>
 <20250520024718.142-3-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250520024718.142-3-kernel@airkyi.com>
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

On Tue, May 20, 2025 at 10:47:18AM GMT, Chaoyi Chen wrote:
> +  interrupts:
> +    maxItems: 1
> +
> +  phys:
> +    minItems: 1
> +    items:
> +      - description: DP output to the DP PHY device 0
> +      - description: DP output to the DP PHY deivce 1

Typo here.

> +    description: |
> +      List of phandle to the PHY device for DP output.
> +      RK3399 have two DP-USB PHY, specifying one PHY which want to use,
> +      or specify two PHYs here to let the driver determine which PHY to use.

Best regards,
Krzysztof


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1E682216E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jan 2024 19:54:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE7410E135;
	Tue,  2 Jan 2024 18:54:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D6B10E135
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jan 2024 18:54:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 33E20611F1;
 Tue,  2 Jan 2024 18:54:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9FB8C433C7;
 Tue,  2 Jan 2024 18:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704221681;
 bh=xX4Lln/6UdI6zrqWnFMmp4/+v7+YVcoSF10ZkFApq7k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KC1iyssykDPzsGGG8MaQUfQHFqPp9xFvFt+UGJ3NoER5V7DLBYHHKxQE5/NTsvEtp
 lAcAe9lD/iqfAocAh/G1TQrqI37A5b7whMAF9n16lm1A70c1gsXLhmN5dsE4QQl0xR
 knYlcbH36heVUUc+OCtO+a9ycpfGU4DH44zi+oxqZlFQ2ECWjMA0zydn5+dAYbAp0E
 VaBucANI9tpayWfHX6peiWGA8IKD77Cuxrmlv+kEfsfJ4Lt4pBNpCQMZOClBv+Lvny
 sYb56s7uBk9Ss0gCpfBzXtDAwkdrxiNQn2+rpnwhO4McBCLAUM9G6XGKk29XfyILlx
 CMik/wcA9IcRg==
Received: (nullmailer pid 3374826 invoked by uid 1000);
 Tue, 02 Jan 2024 18:54:39 -0000
Date: Tue, 2 Jan 2024 11:54:39 -0700
From: Rob Herring <robh@kernel.org>
To: Alex Bee <knaerzche@gmail.com>
Subject: Re: [PATCH v4 01/29] dt-bindings: display: rockchip,inno-hdmi:
 Document RK3128 compatible
Message-ID: <170422164796.3374067.13785716763431704594.robh@kernel.org>
References: <20231222174220.55249-1-knaerzche@gmail.com>
 <20231222174220.55249-2-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231222174220.55249-2-knaerzche@gmail.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri, 22 Dec 2023 18:41:52 +0100, Alex Bee wrote:
> The integration for this SoC is different from the currently existing: It
> needs it's PHY's reference clock rate to calculate the DDC bus frequency
> correctly. The controller is also part of a powerdomain, so this gets added
> as an mandatory property for this variant.
> 
> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> changes in v2:
>  - clarify that the controller itself is part of the powerdomain
>  - simplify clock-names
>  - made power-domains property only allowed (and required) for new variant
> 
> changes in v3:
>  - collect RB
> 
> changes in v4:
>  - none
> 
>  .../display/rockchip/rockchip,inno-hdmi.yaml  | 40 ++++++++++++++++++-
>  1 file changed, 38 insertions(+), 2 deletions(-)
> 

Since I applied the conversion I applied this one, thanks!


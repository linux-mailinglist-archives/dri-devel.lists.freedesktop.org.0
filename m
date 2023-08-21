Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 251B1782F44
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 19:15:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D42E10E292;
	Mon, 21 Aug 2023 17:15:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9632F10E291
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 17:15:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F013F64067;
 Mon, 21 Aug 2023 17:15:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32B5EC433C7;
 Mon, 21 Aug 2023 17:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692638114;
 bh=moX1NDNRIw8jZEhzXh/VvYgaJynBFa9IjTOZmpRM6FI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q5rju92Kh4lU1L6z7wg4kSVd4xT8r5IdF27ap5RgXT+Wmwqn0nrXtUDMvXoUV2Nki
 VQ77gyf8z+mOXIpJrmDz/JLWHR0WmGyzsGyMx9T8bBZv824ueq3mz8Q66PwZ3LQZ6B
 gIw7B449eeVOthZaIIXXULOK4PWSlsc8SUJbuBRrNZM1klN9hmgXFJc4M+izI4sN82
 6d0O8vPFRKUxhbnQDDqNd7xGVoulVygoTeWMuu62k0vU0RiQIOlqdvIaWD+4o5Eghs
 fG+jH8Xrdf5M4vUO6nJlGaW/9ayMH8OHSGdeNscOFgcba7ZXUS9tP2sN20+81u3iyv
 EoOFuyKK3VpMQ==
Received: (nullmailer pid 1979228 invoked by uid 1000);
 Mon, 21 Aug 2023 17:15:11 -0000
Date: Mon, 21 Aug 2023 12:15:11 -0500
From: Rob Herring <robh@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 5/6] dt-bindings: timer: add imx7d compatible
Message-ID: <169263811048.1979170.9429510140636771779.robh@kernel.org>
References: <20230810144451.1459985-1-alexander.stein@ew.tq-group.com>
 <20230810144451.1459985-6-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230810144451.1459985-6-alexander.stein@ew.tq-group.com>
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
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 dri-devel@lists.freedesktop.org, Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, NXP Linux Team <linux-imx@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 10 Aug 2023 16:44:50 +0200, Alexander Stein wrote:
> Currently the dtbs_check for imx6ul generates warnings like this:
> 
> ['fsl,imx7d-gpt', 'fsl,imx6sx-gpt'] is too long
> 
> The driver has no special handling for fsl,imx7d-gpt, so fsl,imx6sx-gpt is
> used. Therefore make imx7d GPT compatible to the imx6sx one to fix the
> warning.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


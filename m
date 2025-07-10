Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CBAB00E96
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 00:15:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD3F10E97F;
	Thu, 10 Jul 2025 22:15:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XP3Hgnd6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1097410E97F
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 22:15:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 44DE4613AC;
 Thu, 10 Jul 2025 22:15:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5EEEC4CEE3;
 Thu, 10 Jul 2025 22:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752185745;
 bh=XimlN36y4mHX9POztPa8lYF1nw7bUqK+ofyTw7FTAA0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XP3Hgnd6XTz+S+bBceI/7rzVEZIoAyyHmW1pvnSA6JRnfCoYQinQH1oN6LeXm4JJO
 JQhINTpMn/xhAyUrQQ0pxU2HaqMQ9M+uUWk2TFPHyxkm0IH/nEl5ORLSdLWN7nX+fy
 o3+Uo5j4ujfy4R99yD6Rnqs+FH61cF4AUapWbf/7pUN2poOJbmI1psi2VfX8RB5YHI
 IiVQZVKtCsyV7PT6JfLsL3WHwDxFzroem0Dd7NddFBUWfENLkNrEjJXxoVTP8rxYvg
 tojvrd17IMNZkLbWZ34HquL5QHEyEqISQ2hDOR4cVCXJQEenailk2bdUruJE3i021I
 IsWwZ13wYgOlQ==
Date: Thu, 10 Jul 2025 17:15:43 -0500
From: Rob Herring <robh@kernel.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: imx@lists.linux.dev, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] dt-bindings: display: fsl, ldb: Add binding for i.MX94
Message-ID: <20250710221543.GA4115690-robh@kernel.org>
References: <20250709122332.2874632-1-laurentiu.palcu@oss.nxp.com>
 <20250709122332.2874632-3-laurentiu.palcu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709122332.2874632-3-laurentiu.palcu@oss.nxp.com>
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

On Wed, Jul 09, 2025 at 03:23:21PM +0300, Laurentiu Palcu wrote:
> i.MX94 LDB controller is compatible with i.MX93.

That's not what the schema says.

> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
>  Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
> index 07388bf2b90df..a54b8f1478049 100644
> --- a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
> @@ -20,6 +20,7 @@ properties:
>        - fsl,imx6sx-ldb
>        - fsl,imx8mp-ldb
>        - fsl,imx93-ldb
> +      - fsl,imx94-ldb
>  
>    clocks:
>      maxItems: 1
> @@ -68,6 +69,7 @@ allOf:
>              enum:
>                - fsl,imx6sx-ldb
>                - fsl,imx93-ldb
> +              - fsl,imx94-ldb
>      then:
>        properties:
>          ports:
> -- 
> 2.46.1
> 

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0834B9EC91A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 10:31:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 656F010E037;
	Wed, 11 Dec 2024 09:31:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MvWqNMMX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F72B10E037
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 09:31:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0D99DA41F59;
 Wed, 11 Dec 2024 09:29:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 875DBC4CEDE;
 Wed, 11 Dec 2024 09:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733909505;
 bh=JNi0/3oudx6uDms5WbJLo0swIVqX1h8w+/7VjhgYUGQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MvWqNMMXvUhTvZWxgzetbfm6yY3dOIOEBxzvPnoz8/rM8f35CW41AWsUko76vGn0W
 gxAIsC1oHBcU61LVKG1Befs0jxv3rey4zg8jglsnGTEbY2/dHpyVxZoMaKvtyGxBd9
 qHIgcXyNAGNBEuIg3bznfrMYmzQmeXaXMAwVc4qxDebrbYQxSCyRx7NLiRjJY6Fv3p
 nJx4fiQlVzK5akanxGBIVKOqu19SUl4x/3KO1iTuvdQUJgieGyZNG0IqRqJntyj+GP
 ly4ne6+N5h8xCzgSiLG5HHCrbQr4fudCr7dQMwa2RzCo5H/iXKkRaYZox8RweQpx5G
 Bk4kqeJXcE4Vw==
Date: Wed, 11 Dec 2024 10:31:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: neil.armstrong@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, shawnguo@kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel-lvds: Add compatible
 for AUO G084SN05 V9
Message-ID: <yujvdu3s6v7z7th2lrdscqfxocx2zy2u4owakisvnjppz2udqv@5ok2rcf4exd4>
References: <20241210105705.116116-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241210105705.116116-1-festevam@gmail.com>
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

On Tue, Dec 10, 2024 at 07:57:04AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> The AUO G084SN05 V9 is an 8.4" 800x600 LVDS display.
> 
> Add a compatible entry for this LVDS display model.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v1:
> - Added devicetree@vger.kernel.org on Cc.
> 
>  Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


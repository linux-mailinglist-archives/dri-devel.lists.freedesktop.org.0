Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F5F9BB935
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 16:42:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B531310E46F;
	Mon,  4 Nov 2024 15:42:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pW1x9gp4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2272010E46B
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 15:42:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B96915C1385;
 Mon,  4 Nov 2024 15:41:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12439C4CECE;
 Mon,  4 Nov 2024 15:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730734960;
 bh=ZcXj/+Ru/C7z54XGjpC8CnE2LPrcJkPTHoyWYQ9pIb4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pW1x9gp4OtQx8VqDjK0tsIaYR7endJuHczoLt6iYUv/95h4p332/L1+cC97vYrKXQ
 //gW+kRhjoe4ilQlsU68+SUsm9MLO9sdMiTbGDsfdP19fHLKez8w3oBFI17P7A/J2h
 1gadF1NH9mqoqADHr0S74m57GBUcqZiFTjUg7yJWPsLICz8Lq0th1uRT299z2RKeUc
 eFRdG8AGYExK5odt4EvAxfU5BNby34fmFB1p02tWytWbBBjASlFPY/+nc6JjYHzV9N
 452d+XtFt22hRTrRA+WKWWjTVBRBfS9fSij44NN5xbIu6dZq1ZMnz4HtEj+ft7MEaG
 ipyUeA5N8pQOA==
Date: Mon, 4 Nov 2024 09:42:38 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, shawnguo@kernel.org, imx@lists.linux.dev,
 conor+dt@kernel.org, Fabio Estevam <festevam@denx.de>,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 krzk+dt@kernel.org, a.fatoum@pengutronix.de,
 dri-devel@lists.freedesktop.org, andreas@kemnade.info, marex@denx.de
Subject: Re: [PATCH v4 1/3] dt-bindings: lcdif: Document a imx6sx-lcdif
 fallback
Message-ID: <173073495749.210192.9138587910771237679.robh@kernel.org>
References: <20241101135406.47836-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101135406.47836-1-festevam@gmail.com>
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


On Fri, 01 Nov 2024 10:54:04 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> imx6sx.dtsi has the following lcdif entries:
> 
> compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
> 
> This causes the following dt-schema warning:
> 
> ['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
> 
> To keep DT compatibility, document 'fsl,imx28-lcdif' as a possible
> 'fsl,imx6sx-lcdif' fallback.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v3:
> - Also update the example.
> 
>  Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


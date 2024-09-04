Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 031EB96C0F7
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 16:42:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3379E10E7DF;
	Wed,  4 Sep 2024 14:42:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HLQTKFcz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8DD010E7DF
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 14:42:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2F8BB5C5718;
 Wed,  4 Sep 2024 14:42:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 256B9C4CEC2;
 Wed,  4 Sep 2024 14:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725460955;
 bh=Jo1JvrQ5H5yhfAJevbZq1jgKTsHuKAXsQmXH5r2YKKs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HLQTKFczPA8mIxAwLgXte6IQKfDlmzxC0pR8j4jA8mNT+MmQLLFOMe1f/EEY9WFov
 s44x4QlmcZ6d3nV1YfyjY9nLvp2Nn1hRI8mHxdwKUMHC0bL/mxqT8THSq//ow8ELX7
 5zOjlM3/u5y7MLp+dlqaEpfEsLz9HlDeQXHV6u3QkE536/ZRIXOQo3fxdXPXVUfUvY
 4UWmYY5wWmClHdUXwq+GhrHlvVVEjwVtru21xlS2CI5YveBrYNtiikeN3/jq0BELse
 0DwbCpPyv3yZUiphdyh0oNCu5YfwcBrN4BpQHD5DLSqQU2PPj2PB8Kbjj4TTSkyTSA
 4GtqY3RPaSYjg==
Date: Wed, 4 Sep 2024 09:42:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, marex@denx.de,
 Fabio Estevam <festevam@denx.de>, devicetree@vger.kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, mripard@kernel.org
Subject: Re: [PATCH v2] dt-bindings: lcdif: Document the dmas/dma-names
 properties
Message-ID: <172546095254.2537937.13693682822295899426.robh@kernel.org>
References: <20240904104027.2065621-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904104027.2065621-1-festevam@gmail.com>
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


On Wed, 04 Sep 2024 07:40:27 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> i.MX28 has an RX DMA channel associated with the LCDIF controller.
> 
> Document the 'dmas' and 'dma-names' properties to fix the following
> dt-schema warnings:
> 
> lcdif@80030000: 'dma-names', 'dmas' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> Changes since v1:
> - Add a blank line before the examples. (Krzysztof)
> 
>  .../bindings/display/fsl,lcdif.yaml           | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 

Applied, thanks!


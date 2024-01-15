Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA7E82DC91
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 16:47:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B8610E300;
	Mon, 15 Jan 2024 15:47:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0108210E300
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 15:47:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 44CD860EDF;
 Mon, 15 Jan 2024 15:47:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A87F6C433C7;
 Mon, 15 Jan 2024 15:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705333621;
 bh=CKlMsBgiRFguC4EeGf8G4YmTN9XESV+58mgkD1W4SPw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=skFXbUDCV/2M/7goc7hXpkMmxJNhc6isLScK4FQwrlU9+0IKA2Ue7/tEKI/9xiUcl
 QMuMMNeQlAtjNBoBcuqibBIwMirN0OAwrDE89FoCcS/zC8USBomywfB6cY22ZYX/cB
 WfElSbPDp0DqEDhYvF9DjIc/m0jAXJeVo26uom6+1s9eMYAizNjiZ6j6BPOUaCMPps
 A7iUNWfw7taRvEDEbpmWkgyHies6OKZfU9QqJgvDrvRT3onnSi/8H//NLXGRPYyIKg
 ydN83g3LT/GqiV7q21OZUw3K82CE2bJ1mAyVVq/xskSlX+TRtrH7GOYq5x/mPoz7da
 tx48yxQpVT/XA==
Date: Mon, 15 Jan 2024 09:46:59 -0600
From: Rob Herring <robh@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: display: add dt-bindings for STM32
 LVDS device
Message-ID: <20240115154659.GA815331-robh@kernel.org>
References: <20240115132009.101718-1-raphael.gallais-pou@foss.st.com>
 <20240115132009.101718-2-raphael.gallais-pou@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240115132009.101718-2-raphael.gallais-pou@foss.st.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Yannick Fertre <yannick.fertre@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 Philippe Cornu <philippe.cornu@foss.st.com>, David Airlie <airlied@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 15, 2024 at 02:20:04PM +0100, Raphael Gallais-Pou wrote:
> Add "st,stm32mp25-lvds" compatible.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
> Depends on: "dt-bindings: stm32: add clocks and reset binding for
> 	    stm32mp25 platform" by Gabriel Fernandez
> 
> Changes in v3:
> 	- Clarify commit dependency
> 	- Fix includes in the example
> 	- Fix YAML
> 	- Add "clock-cells" description
> 	- s/regroups/is composed of/
> 	- Changed compatible to show SoC specificity
> 
> Changes in v2:
> 	- Switch compatible and clock-cells related areas
> 	- Remove faulty #include in the example.
> 	- Add entry in MAINTAINERS
> ---
>  .../bindings/display/st,stm32-lvds.yaml       | 119 ++++++++++++++++++

Filename matching compatible.

> +properties:
> +  compatible:
> +    const: st,stm32mp25-lvds


> +examples:
> +  - |
> +    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
> +    #include <dt-bindings/reset/st,stm32mp25-rcc.h>
> +
> +    lvds: lvds@48060000 {
> +        compatible = "st,stm32-lvds";

Wrong compatible.

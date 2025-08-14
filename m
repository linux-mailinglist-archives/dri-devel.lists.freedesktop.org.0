Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C79B26034
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 11:08:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0794710E28F;
	Thu, 14 Aug 2025 09:08:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IEhar6bM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58EB010E28F
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 09:08:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 265916020E;
 Thu, 14 Aug 2025 09:08:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 441AFC4CEED;
 Thu, 14 Aug 2025 09:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755162529;
 bh=SrgIKHyQzZsNRjZjaedpryVUikg6Qu1TuEDXZ4F66GY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IEhar6bMklvfkyPidpHaCkPhVHC2IBI1dey6oRukc416ApLx9OQoXpnokam4Iu3IO
 3EhE8j6+HI4tbeLxI0Jo5xc4UpYECb8jj0Xa0GKvLoUxlR6d8ueXSFChmDOuF/7H/e
 iFVDPVV3Y53BKP6ribAcTfPkS/Lf/9N63cEIYz7ZaZQIYG6iXdk6SPhQI2OT8cjEDV
 Krs1Zlt5macbMAGdvULwB1vLxE3+8jZehLY42zDEHBoE1XxG4FVWmE/WWqdriKWj+6
 DSAmRogyfDzfzNltXHf4B5+cT89ZfHionEfAof148q7RynLlADN8wBpD/T8pLCZKwi
 0JqK1RQh7lJvw==
Date: Thu, 14 Aug 2025 11:08:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: Yannick Fertre <yannick.fertre@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Christophe Roullier <christophe.roullier@foss.st.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/13] dt-bindings: display: st: add new compatible to
 LTDC device
Message-ID: <20250814-resolute-lime-raven-de4fa5@kuoka>
References: <20250812-drm-misc-next-v2-0-132fd84463d7@foss.st.com>
 <20250812-drm-misc-next-v2-1-132fd84463d7@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250812-drm-misc-next-v2-1-132fd84463d7@foss.st.com>
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

On Tue, Aug 12, 2025 at 03:48:58PM +0200, Raphael Gallais-Pou wrote:
> +else:
> +  properties:
> +    clocks:
> +      maxItems: 4

minItems instead

> +    clock-names:
> +      maxItems: 4

minItems instead

> +
>  additionalProperties: false

Best regards,
Krzysztof


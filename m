Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C316BCAAEA
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 21:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 494BC10EAFD;
	Thu,  9 Oct 2025 19:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="N5UXUgWM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 732FF10EAFD
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 19:25:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A61AC44D51;
 Thu,  9 Oct 2025 19:25:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 405B5C4CEE7;
 Thu,  9 Oct 2025 19:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760037937;
 bh=ZleYVLbg1TqX6cXrbg8yQvDdGj6LBQ3wULzm7dwdO6g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N5UXUgWM7C5XGdo1qWqAPTsCK9nnFVgTTrpj8r6TNc2SibypxPp2RmL6ltpQew+Xz
 FAUVZDAysSwbBqBx3NAJWldPACkKw13KYYfuEXDmLX0betBRXRQ6RU5L0Qx3IsVEHv
 dqxyIiAlIXTXaBwGWDSjo1yvX7MncGZF9UWqG5RP32s2xstqvNk34xxc+6V+qgyEtf
 bLE0O4SK5XtWy3XOoEW8MOp+/C1JJcmQVf2+M+HogTO/Ws9iEvTMCPh5lXdpNODYi8
 TihPh6SrK1+80/r4vD3XWG0bnp/MvyrUC0eFGl6lKt8Wq2L/s4eIQTihQmLN1s3gC5
 DIXYyXlb9tMoQ==
Date: Thu, 9 Oct 2025 14:25:36 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 David Airlie <airlied@gmail.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Kees Cook <kees@kernel.org>,
 Chia-I Wu <olvaffe@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>,
 linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-hardening@vger.kernel.org, kernel@collabora.com,
 Chen-Yu Tsai <wenst@chromium.org>, linux-mediatek@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Maxime Ripard <mripard@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v6 1/7] dt-bindings: gpu: mali-valhall-csf: add
 mediatek,mt8196-mali variant
Message-ID: <176003793576.3141336.11200895939203051819.robh@kernel.org>
References: <20251003-mt8196-gpufreq-v6-0-76498ad61d9e@collabora.com>
 <20251003-mt8196-gpufreq-v6-1-76498ad61d9e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251003-mt8196-gpufreq-v6-1-76498ad61d9e@collabora.com>
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


On Fri, 03 Oct 2025 22:15:03 +0200, Nicolas Frattaroli wrote:
> The Mali-based GPU on the MediaTek MT8196 SoC uses a separate MCU to
> control the power and frequency of the GPU. This is modelled as a power
> domain and clock provider.
> 
> It lets us omit the OPP tables from the device tree, as those can now be
> enumerated at runtime from the MCU.
> 
> Add the necessary schema logic to handle what this SoC expects in terms
> of clocks and power-domains.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  .../bindings/gpu/arm,mali-valhall-csf.yaml         | 40 ++++++++++++++++++++--
>  1 file changed, 38 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


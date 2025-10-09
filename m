Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7540FBCAAFF
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 21:27:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31B1010EAFE;
	Thu,  9 Oct 2025 19:27:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ocOfs+N7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D888010EAFE
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 19:27:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0BB5B62400;
 Thu,  9 Oct 2025 19:27:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FEB6C116C6;
 Thu,  9 Oct 2025 19:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760038029;
 bh=J7CUiWc0ADF5tenIxtE4W4RrkCaIIs7aFDIdrQb3yuA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ocOfs+N7rtJInE5RqP5OdMODSvcF4BMfHOQ/dcESFUUiWLWZAxbZaF5uNBcC7hENh
 qSwKlQWc7ueBC64kW2mHYeok0OYGmn9lyK+JRYDFeqfUUJL++YiR0VukEUdApGwZ4P
 06fxejW18TPzKsAf3FaJh5To8Xpr1/s8bqgN9DgXGr/z1ZXFBh272XQyfXUJXlKFAv
 4mF3dyXq7P/6ESbB3idH+ngJx9sPFTjCaHZ8861rBV4KfbYP+Zth70YDTTW0kAiNxW
 8QJP0JGvJcnnBDViirhzGPJdCFx3Ynf1ASJF8rtJ/rR02QsosocZbskOnujsGkzC/J
 /yWABoLKDafzg==
Date: Thu, 9 Oct 2025 14:27:08 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, Steven Price <steven.price@arm.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Liviu Dudau <liviu.dudau@arm.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 David Airlie <airlied@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Kees Cook <kees@kernel.org>,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Jassi Brar <jassisinghbrar@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, kernel@collabora.com,
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-hardening@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v6 2/7] dt-bindings: power: Add MT8196 GPU frequency
 control binding
Message-ID: <176003802776.3154911.16315672930945564696.robh@kernel.org>
References: <20251003-mt8196-gpufreq-v6-0-76498ad61d9e@collabora.com>
 <20251003-mt8196-gpufreq-v6-2-76498ad61d9e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251003-mt8196-gpufreq-v6-2-76498ad61d9e@collabora.com>
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


On Fri, 03 Oct 2025 22:15:04 +0200, Nicolas Frattaroli wrote:
> On the MT8196 and MT6991 SoCs, the GPU power and frequency is controlled
> by some integration logic, referred to as "MFlexGraphics" by MediaTek,
> which comes in the form of an embedded controller running
> special-purpose firmware.
> 
> This controller takes care of the regulators and PLL clock frequencies
> to squeeze the maximum amount of power out of the silicon.
> 
> Add a binding which models it as a power domain.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  .../bindings/power/mediatek,mt8196-gpufreq.yaml    | 117 +++++++++++++++++++++
>  1 file changed, 117 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


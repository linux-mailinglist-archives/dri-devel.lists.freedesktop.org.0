Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23658CD2559
	for <lists+dri-devel@lfdr.de>; Sat, 20 Dec 2025 02:59:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6996E10E0AD;
	Sat, 20 Dec 2025 01:59:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SHBcNsI+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4582610E0AD
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 01:59:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8221A60008;
 Sat, 20 Dec 2025 01:59:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02FC7C4CEF1;
 Sat, 20 Dec 2025 01:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766195991;
 bh=os1jh+uZ9JsdSlnhfREmRKroQHOLlY2V9cVjgynwxB0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SHBcNsI+BT4SfEzjOuUyUlFgXxxsfU1cSymkC/KMEuxeQCV0RnQPMbWYWiWtARQ+S
 roy2dQvnmshflaSieqDX4PRCmO+Wf8YHIWNFqNI6MdGbZTL3YikWsRqVcmgHkf5Ymi
 fCIeh5cq3R11d4zZyWraYiJxA2UPdRR70H1AB7q2CNN4oeiRqBZcA1wwXelPUk7LwW
 RzXBx4vKfypoojYjBWtlD2zYR/3hCLvUohUnhAIpuOqklGbGMW8KQmitcH/a1GCAKa
 v6esnMcGmeiglkzGHLsdzq00xaB3nGrfUSEfAK0eRu4kMd8mId+B2Qrb5eR2IKcW76
 c3qCIn5Sqw/HQ==
Date: Fri, 19 Dec 2025 19:59:48 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 Chia-I Wu <olvaffe@gmail.com>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
 Simona Vetter <simona@ffwll.ch>, Liviu Dudau <liviu.dudau@arm.com>,
 Maxime Ripard <mripard@kernel.org>, kernel@collabora.com,
 Ulf Hansson <ulf.hansson@linaro.org>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Steven Price <steven.price@arm.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/4] dt-bindings: power: mt8196-gpufreq: Describe nvmem
 provider ability
Message-ID: <176619598779.359396.11418181120053228697.robh@kernel.org>
References: <20251217-mt8196-shader-present-v1-0-f6f8f3aa1e93@collabora.com>
 <20251217-mt8196-shader-present-v1-2-f6f8f3aa1e93@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217-mt8196-shader-present-v1-2-f6f8f3aa1e93@collabora.com>
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


On Wed, 17 Dec 2025 18:03:28 +0100, Nicolas Frattaroli wrote:
> On the MediaTek MT8196 SoC, the Mali GPU's "shader_present" hardware
> register may also include a non-functional shader core, along with the
> present shader cores. An efuse elsewhere in the SoC provides the
> shader_present mask with the fused off core omitted.
> 
> However, the efuse address is not publicly disclosed. What is known
> though is that the GPUEB MCU reads this efuse, and exposes its contents
> in the memory it shares with the application processor.
> 
> We can therefore describe the mediatek,mt8196-gpufreq device as being an
> nvmem provider for this purpose, as it does provide nvmem access in an
> indirect way.
> 
> The shader-present child node is left out of the list of required
> properties as we may one day be able to describe the actual efuse region
> this value comes from, so the gpufreq device isn't necessarily the only
> device that can provide this cell, and implementations shouldn't need to
> implement this functionality once this is the case.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  .../devicetree/bindings/power/mediatek,mt8196-gpufreq.yaml  | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 998F8CD254C
	for <lists+dri-devel@lfdr.de>; Sat, 20 Dec 2025 02:58:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 240B510E0A6;
	Sat, 20 Dec 2025 01:58:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="h7k7N6jG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1436E10E0A6
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 01:58:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A78D440220;
 Sat, 20 Dec 2025 01:58:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5005CC4CEF1;
 Sat, 20 Dec 2025 01:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766195899;
 bh=WNfNeRNtBHMdT3MgMNoIm2HEkpmzRyn8zXURCSnutSo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h7k7N6jGCuh/KOw8VYsG4g230WVUnnQx/8NKaj78m0lsETxEtxnLzGF8xMn8Skv5c
 6iH1jTqGr57q6v0pp44XfdtK0mRGFkVlDqHCrPye8Hip7mOhStFt2yjJ3kaYP71plb
 wSrQk9C4tOGKtKy9IRcJm9lB/rlYrykLT5KZmg4FHjTZAdl26BBYDFzqy0MCunnQcb
 iYyXzkqvNEHJ2h6yTeiutbvDpXESGSUfhsVuWoIf3OfSGAQBngL+kS3t+mDNatx/l/
 daKyKHz7A+0p0ecJc1LtYbRSiuBy7lIo1BFYXrGrYB2Vs1tueSYNsp7kkml8dzEq7U
 9ME9RVMes7/pw==
Date: Fri, 19 Dec 2025 19:58:17 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Ulf Hansson <ulf.hansson@linaro.org>,
 David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
 kernel@collabora.com, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>,
 Steven Price <steven.price@arm.com>, Chia-I Wu <olvaffe@gmail.com>,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: gpu: mali-valhall-csf: Add
 shader-present nvmem cell
Message-ID: <176619589672.357311.747766699419646929.robh@kernel.org>
References: <20251217-mt8196-shader-present-v1-0-f6f8f3aa1e93@collabora.com>
 <20251217-mt8196-shader-present-v1-1-f6f8f3aa1e93@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217-mt8196-shader-present-v1-1-f6f8f3aa1e93@collabora.com>
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


On Wed, 17 Dec 2025 18:03:27 +0100, Nicolas Frattaroli wrote:
> On the MediaTek MT8196 SoC, the bitmask for which shader cores are
> present and functional is not the one in the Mali GPU's registers, but
> in an external efuse.
> 
> Add the nvmem cell properties to describe such a setup, and make them
> required on MT8196.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  .../devicetree/bindings/gpu/arm,mali-valhall-csf.yaml      | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


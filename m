Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 457DBA403A2
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2025 00:44:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B19E510EB45;
	Fri, 21 Feb 2025 23:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="G2gZlZNJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7783010EB46
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 23:44:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 27CEB68340;
 Fri, 21 Feb 2025 23:44:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7310CC4CED6;
 Fri, 21 Feb 2025 23:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740181454;
 bh=LPuDk+6EvEIOleZ6HMXz7Q2USX7ef9j+avusUpmJAsQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G2gZlZNJ4nhnlglQR2Ul7LtTjncW3SSm33huoq+mJ6vI1LF+w3HUJDumaw0NGpT/J
 3oi6hEO+LClIxqCIMNUIRHy3fFfvGd1/vDTSey+O4d0QCqMyNrn7GZiPN+piVN9jEa
 hE0t6mSe49fbNVKQFbkany8o+WWZGT/FO8dgW+fGYY0z31hk76aKztqqwl+YvjxvyH
 4B77FUdncY/A1ir1+kGuY6SpKVq24iRVU4H9GrjksTBqizc+BEeRvZYaSpFPp0+1Zg
 7oS49dcHefUDGvpfcDnjGg39MXowMS8ApT/u+FKHDmvYO0fYvOjcbZ5njkM6/qHyIi
 JlSmnuuT4f/DQ==
Date: Fri, 21 Feb 2025 17:44:12 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi@lists.linux.dev,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, Steven Price <steven.price@arm.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Simona Vetter <simona@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 3/5] dt-bindings: gpu: mali-bifrost: Add Allwinner H616
 compatible
Message-ID: <174018145089.395682.15107324899674215035.robh@kernel.org>
References: <20250221005802.11001-1-andre.przywara@arm.com>
 <20250221005802.11001-4-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221005802.11001-4-andre.przywara@arm.com>
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


On Fri, 21 Feb 2025 00:58:00 +0000, Andre Przywara wrote:
> The Allwinner H616 SoC has a Mali-G31 MP2 GPU, which is of the Mali
> Bifrost family.
> Add the SoC specific compatible string and pair it with the bifrost
> fallback compatible.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!


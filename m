Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7476B0C719
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 17:00:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD8610E56A;
	Mon, 21 Jul 2025 15:00:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IB/CSD6V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E8C10E569
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 15:00:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AA28961360;
 Mon, 21 Jul 2025 15:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39475C4CEED;
 Mon, 21 Jul 2025 15:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753110012;
 bh=VZAFEBYGkW7zkA9QHXJ+nLYWvFYNy70boXd5O+3hoTc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IB/CSD6Vq+QSQx7hD4TITcqcR5SxQBlyS50DA0avSGhIjlvqkcRKYI17VaEjvhG9G
 8EkxIyAshM5qj5/Ca5ztlQkj1/5by7Mn9fXzKf4k03zrNSF4q6xKRa+9ynRjtY32c1
 koQ/MqhOdb++vqwtjVnKSWpw8D55HKl5tj8mVRhwr8N/crPeyeNEJXMwY/S5CE8p8V
 kD7P+aQdsXlW2q/DsTXwF+7EQEN/Fa5+0Tg3w6c5t9/A3e3yqdRXuhO3vmRAcdsZfN
 IVxJw+tZ2vk2x/To/uEb0vgzEKb9n3+yTioSZBLwKbhoPU54izO08bAtR3kGxOEwzH
 TX8rvX67snRIQ==
Date: Mon, 21 Jul 2025 10:00:11 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-rockchip@lists.infradead.org, linaro-mm-sig@lists.linaro.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Robin Murphy <robin.murphy@arm.com>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-media@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>,
 Kever Yang <kever.yang@rock-chips.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-doc@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v9 06/10] dt-bindings: npu: rockchip,rknn: Add bindings
Message-ID: <175311001041.629023.12786244001330541185.robh@kernel.org>
References: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
 <20250721-6-10-rocket-v9-6-77ebd484941e@tomeuvizoso.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250721-6-10-rocket-v9-6-77ebd484941e@tomeuvizoso.net>
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


On Mon, 21 Jul 2025 11:17:33 +0200, Tomeu Vizoso wrote:
> Add the bindings for the Neural Processing Unit IP from Rockchip.
> 
> v2:
> - Adapt to new node structure (one node per core, each with its own
>   IOMMU)
> - Several misc. fixes from Sebastian Reichel
> 
> v3:
> - Split register block in its constituent subblocks, and only require
>   the ones that the kernel would ever use (Nicolas Frattaroli)
> - Group supplies (Rob Herring)
> - Explain the way in which the top core is special (Rob Herring)
> 
> v4:
> - Change required node name to npu@ (Rob Herring and Krzysztof Kozlowski)
> - Remove unneeded items: (Krzysztof Kozlowski)
> - Fix use of minItems/maxItems (Krzysztof Kozlowski)
> - Add reg-names to list of required properties (Krzysztof Kozlowski)
> - Fix example (Krzysztof Kozlowski)
> 
> v5:
> - Rename file to rockchip,rk3588-rknn-core.yaml (Krzysztof Kozlowski)
> - Streamline compatible property (Krzysztof Kozlowski)
> 
> v6:
> - Remove mention to NVDLA, as the hardware is only incidentally related
>   (Kever Yang)
> - Mark pclk and npu clocks as required by all clocks (Rob Herring)
> 
> v7:
> - Remove allOf section, not needed now that all nodes require 4 clocks
>   (Heiko Stübner)
> 
> v8:
> - Remove notion of top core (Robin Murphy)
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> ---
>  .../bindings/npu/rockchip,rk3588-rknn-core.yaml    | 112 +++++++++++++++++++++
>  1 file changed, 112 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


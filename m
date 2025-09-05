Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4407B46733
	for <lists+dri-devel@lfdr.de>; Sat,  6 Sep 2025 01:28:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD5E610EC6D;
	Fri,  5 Sep 2025 23:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eyF/8o2W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4136010EC6B
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 23:28:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5B7F7601AE;
 Fri,  5 Sep 2025 23:28:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D40DBC4CEF1;
 Fri,  5 Sep 2025 23:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757114896;
 bh=sHDzQNR+4667hi5yiXtnj/s70kNPk7kjxozWctS/6wg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eyF/8o2Wy9POeXCaDjWYs/9R6CSYmeh9r/M2PRpfA4L9DGcUBwEUEbI6X26kA61LU
 yCDjRjNRuNAVtBjI0yKApZGnoKrQoW5prezgO6vG7QcW8ufhPAdYS6cW/oFw618sVf
 AOUfK2s9ZdvAHQrqKe+3PK4dWD7kUsLfFXdYqfrYBtgrg/dkVHGzApS+dWHf9xiWSx
 7idD8L5Zm1fLgge50y279bTRqys4e+pZXl2r7u3Q/2d1TaNrBEFcuJoCnIoOAQVZO5
 TgRG8bZwL7EnAfB3io/hw/RoAWiEOSM60SVMAgH3mH1EQQdmi4NAhAr/+cSsWzH4wl
 yPxOqH5Fc6tDg==
Date: Fri, 5 Sep 2025 18:28:15 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Simona Vetter <simona@ffwll.ch>, Kees Cook <kees@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Chia-I Wu <olvaffe@gmail.com>,
 dri-devel@lists.freedesktop.org, Jassi Brar <jassisinghbrar@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-pm@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-hardening@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Steven Price <steven.price@arm.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, kernel@collabora.com,
 Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH RFC 03/10] dt-bindings: sram: Add compatible for
 mediatek,mt8196-gpufreq-sram
Message-ID: <175711489460.1508247.14844222484675872512.robh@kernel.org>
References: <20250905-mt8196-gpufreq-v1-0-7b6c2d6be221@collabora.com>
 <20250905-mt8196-gpufreq-v1-3-7b6c2d6be221@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905-mt8196-gpufreq-v1-3-7b6c2d6be221@collabora.com>
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


On Fri, 05 Sep 2025 12:22:59 +0200, Nicolas Frattaroli wrote:
> This compatible is used for an SRAM section that's shared between the
> MT8196's application processor cores and the embedded GPUEB MCU that
> controls the GPU frequency.
> 
> Through this SRAM section, things about the GPU frequency controller
> like the OPP table can be read.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  Documentation/devicetree/bindings/sram/sram.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


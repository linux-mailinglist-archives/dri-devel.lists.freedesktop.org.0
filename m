Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF36CE783A
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 17:32:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C45A10E56C;
	Mon, 29 Dec 2025 16:32:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="OUtfCeto";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5090F10E56C
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 16:32:07 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20251229163205euoutp01fa8f8f92b6bf2669844ea3e220cb65ec~FvLevW8ny0524905249euoutp01q
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 16:32:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20251229163205euoutp01fa8f8f92b6bf2669844ea3e220cb65ec~FvLevW8ny0524905249euoutp01q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1767025925;
 bh=ExuLuxvl1jriYgk9lUcZeu3ugdqLUTCtudQjE6LZFdU=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=OUtfCeto9if+4bYrYwp+GWsRyDWuD6AyJW8UKJeGrqKoriGKr5kYlYTNdA2Lcs7no
 2jmv7sB5rLPYTOX588jBaXA8gQjpZSs7EJ3XOVBFc2/E2i16RBNXcG3L9mhWnQKJgR
 WfjSDB8fkHclTM1JBTSCy+WyBwNwrJnNUdNzNAF0=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20251229163205eucas1p1e9395170d400ce20537e79156f44778b~FvLeQqbAc1226212262eucas1p11;
 Mon, 29 Dec 2025 16:32:05 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20251229163204eusmtip2db25adcf9b918fc714030cdbfc1150d0~FvLdReIoO2218922189eusmtip2Y;
 Mon, 29 Dec 2025 16:32:04 +0000 (GMT)
Message-ID: <a1d2fc77-ac57-49d4-a13e-cc391e6e2b92@samsung.com>
Date: Mon, 29 Dec 2025 17:32:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/9] Verisilicon DC8200 driver (and adaption to TH1520)
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Drew
 Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner
 <heiko@sntech.de>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20251224161205.1132149-1-zhengxingda@iscas.ac.cn>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20251229163205eucas1p1e9395170d400ce20537e79156f44778b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251224161255eucas1p24c6de486b021f25007ed1ce24468cab2
X-EPHeader: CA
X-CMS-RootMailID: 20251224161255eucas1p24c6de486b021f25007ed1ce24468cab2
References: <CGME20251224161255eucas1p24c6de486b021f25007ed1ce24468cab2@eucas1p2.samsung.com>
 <20251224161205.1132149-1-zhengxingda@iscas.ac.cn>
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



On 12/24/25 17:11, Icenowy Zheng wrote:
> This patchset tries to add a driver for Verisilicon DC8200 driver, and
> demonstrates the driver on T-Head TH1520 with its HDMI output.
> 
> This display controller IP is used on StarFive JH7110 too, but as the
> HDMI controller used there isn't as common as the DesignWare one, I
> choose to use TH1520 in this patchset.
> 
> The DC driver is written with other DC-series (mainly DC8000, which is
> known to be used on Eswin EIC7700 SoC) display controllers in mind, and
> uses the identification registers available on all Vivante branded IPs.
> A known exception is DCNano display controller, which is unlikely to be
> supported by this driver because of totally different register map and
> no known identification registers. (P.S. the in-tree loongson DRM driver
> seems to be for some DCNano instances based on the register map.)
> 
> The HDMI controller seems to come with some common PHY by Synopsys, the
> DesignWare HDMI TX 2.0 PHY. By searching a few register names from the
> BSP driver of that PHY, that PHY seems to be used by a in-tree dw-hdmi
> glue, rcar_dw_hdmi -- an updated downstream version of rcar_dw_hdmi
> contains all 6 registers set here in the th1520-dw-hdmi driver. Some
> more suprising thing is that RK3288 uses the same PHY too, but the
> in-tree dw_hdmi-rockchip driver writes the configuration data array in a
> weird way to reuse the HDMI 3D TX PHY configuring function. It might be
> valuable to add common configuring function and configuration data
> definition for this HDMI 2.0 PHY too, but the current driver in this
> patchset simply duplicated most configuration logic from rcar_dw_hdmi
> driver (but with 3 extra configuration registers configured).
> 
> Icenowy Zheng (9):
>   dt-bindings: vendor-prefixes: add verisilicon
>   dt-bindings: display: add verisilicon,dc
>   drm: verisilicon: add a driver for Verisilicon display controllers
>   dt-bindings: display/bridge: add binding for TH1520 HDMI controller
>   drm/bridge: add a driver for T-Head TH1520 HDMI controller
>   riscv: dts: thead: add DPU and HDMI device tree nodes
>   riscv: dts: thead: lichee-pi-4a: enable HDMI
>   MAINTAINERS: assign myself as maintainer for verisilicon DC driver
>   mailmap: map all Icenowy Zheng's mail addresses
> 

I tested this patchset on the Lichee Pi 4A (TH1520). I successfully ran a 
fully hardware accelerated graphics stack using Weston and Zink over the 
HDMI output.

I have documented the reproduction steps and test results here:
[1] https://mwilczynski.dev/posts/riscv-gpu-zink/#building-the-stack-reproduction-guide

Great work, thank you!

Feel free to add to driver and DTS patches (3,5,6,7).
Tested-by: Michal Wilczynski <m.wilczynski@samsung.com>

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

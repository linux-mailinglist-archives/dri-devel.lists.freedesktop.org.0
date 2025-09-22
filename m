Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 570C0B933FB
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 22:39:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A75E710E511;
	Mon, 22 Sep 2025 20:39:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZxBdiC86";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1DD110E511
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 20:39:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7474340048;
 Mon, 22 Sep 2025 20:39:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F755C4CEF5;
 Mon, 22 Sep 2025 20:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758573587;
 bh=OX8R40WQ5HfJwHkclKJ5GlUpDaTEdb1/b83kLRNMddQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZxBdiC86CBjW6F12t+dS9d/oWdtxt0F/+pYhSyLBw9Lw3InOrxNJJ63RJvfFJKjOs
 lVenwO48aeOBY1qPv+N9bG+GSYaTAOChabkmC8Y71W2t/DG9FjHiIuznG7eKsL8/XN
 c1XAQyic4lA+k+XrJqI400TLwrPCdSJaLlhacTr2R3Eq9nYQZWUz8w+RBHBk2cEGJj
 p8KquiYW7Ry6AwG0EG677kae11rFKhehA419PnEkdKYz6Jz1pMT8m7l8J4LXPioNn7
 RTmqPFaPp+f66Rw+TzcBGFjbDEW2/nqwBHUBzmbrKGC8nkHoGINRoTBYxQGZJYsd1l
 jPPhHqjEPnwVg==
Date: Mon, 22 Sep 2025 15:39:46 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Michal Wilczynski <m.wilczynski@samsung.com>,
 Maxime Ripard <mripard@kernel.org>, Guo Ren <guoren@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-riscv@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Simona Vetter <simona@ffwll.ch>, Han Gao <rabenda.cn@gmail.com>,
 linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Yao Zi <ziyao@disroot.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, devicetree@vger.kernel.org,
 Fu Wei <wefu@redhat.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Drew Fustini <fustini@kernel.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: vendor-prefixes: add verisilicon
Message-ID: <175857358584.1289867.6423910030658494918.robh@kernel.org>
References: <20250921083446.790374-1-uwu@icenowy.me>
 <20250921083446.790374-2-uwu@icenowy.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250921083446.790374-2-uwu@icenowy.me>
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


On Sun, 21 Sep 2025 16:34:39 +0800, Icenowy Zheng wrote:
> VeriSilicon is a Silicon IP vendor, which is the current owner of
> Vivante series video-related IPs and Hantro series video codec IPs.
> 
> Add a vendor prefix for this company.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
> No changes in v2.
> 
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


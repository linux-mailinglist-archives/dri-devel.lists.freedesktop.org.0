Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC328A8B62
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 20:44:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F37E711375B;
	Wed, 17 Apr 2024 18:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="F7xHnyGb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AFCE11375C
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 18:44:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CFA0F614B8;
 Wed, 17 Apr 2024 18:44:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ED07C072AA;
 Wed, 17 Apr 2024 18:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713379454;
 bh=2ijxgrIHFYlo+GOYxQUQaAYvtvwZmGTQ2OkkC70Xwc8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F7xHnyGbTsVvEE1N1oxm22yuvvaX5ZM3WZh1+mqGMAbi6rZ6z21Hq94xdKxHpojCB
 kTbdwunZJUl9GiW0AmFpF5e1e/ZQVBNtX2zVBZQT9Z4iQ5loPwhgnKsD4IokktLiYf
 1qaoJ86vGegu1OXvjV7DtU66KOCwvC1ypK8cQ7srHnCa9Kr8lMqvRsdOcBBi9P4cad
 wSCb17RhmPC89oqDb727+mY4MrFr4KAODRKig841Mh+MamqQavjmIUGw5sbNXU7p5n
 i56Kv4vpRBWYGZsfRv4Jyzq7UX3b/HXGt66ME7DhZG6vSj4fgNPXtHlEJrkVNtehqZ
 P4yPrSzEuEOPA==
Date: Wed, 17 Apr 2024 13:44:12 -0500
From: Rob Herring <robh@kernel.org>
To: amergnat@baylibre.com
Cc: linux-arm-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Michael Turquette <mturquette@baylibre.com>,
 David Airlie <airlied@gmail.com>, linux-pwm@vger.kernel.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 CK Hu <ck.hu@mediatek.com>, Conor Dooley <conor+dt@kernel.org>,
 Fabien Parent <fparent@baylibre.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v2 06/18] dt-bindings: display: mediatek: dpi: add
 power-domains property
Message-ID: <171337936237.3073760.2764344003363574998.robh@kernel.org>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
 <20231023-display-support-v2-6-33ce8864b227@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023-display-support-v2-6-33ce8864b227@baylibre.com>
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


On Tue, 16 Apr 2024 17:53:07 +0200, amergnat@baylibre.com wrote:
> From: Fabien Parent <fparent@baylibre.com>
> 
> DPI is part of the display / multimedia block in MediaTek SoCs, and
> always have a power-domain (at least in the upstream device-trees).
> Add the power-domains property to the binding documentation.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


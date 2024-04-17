Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A288A8B4E
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 20:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EBDC10F64C;
	Wed, 17 Apr 2024 18:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="K8/NxFmk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D0E10F79A
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 18:43:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9FFE961655;
 Wed, 17 Apr 2024 18:43:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A8CAC072AA;
 Wed, 17 Apr 2024 18:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713379399;
 bh=BrDXZHypVyb/MCOt1pJ3+elBTZD7Vim7YCL5kPx7fs0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K8/NxFmkBzWm5APksMAcm8tYKwsLxDs125DaMHv/oVlIdccPmnUOv09IG7QjpSj4V
 /7ZX2Q/6oxwM6Dw4COABbrfUMcsdjepBiu4ak1tbrPobJdCYUdvGY88zxOZIZDcJd8
 jMCFKwTsLs02QVFKSrrApLO/X3IoxFHdhr9N+CEaUF6jUfu5bM9JhbnQr9l/y308Cf
 4xa6GowlumK45jro3+seYpBVRhdeA5/9xqb0kVOGQ1LMgIcC4IYA5zocdJfNU91om2
 lV6wzpJAvSpy9uwbEFczgBllP8q8eqSLpLmU9+pKGCq/xhee2/UcCQk6OCTwyYBlAw
 o2SbgzLB9hh/Q==
Date: Wed, 17 Apr 2024 13:43:17 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-pwm@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jitao Shi <jitao.shi@mediatek.com>,
 Maxime Ripard <mripard@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Stephen Boyd <sboyd@kernel.org>, Will Deacon <will@kernel.org>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-mediatek@lists.infradead.org,
 Michael Turquette <mturquette@baylibre.com>,
 CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 David Airlie <airlied@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/18] dt-bindings: display: mediatek: ccorr: add
 compatible for MT8365 SoC
Message-ID: <171337927792.3071773.4101646503948439735.robh@kernel.org>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
 <20231023-display-support-v2-2-33ce8864b227@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023-display-support-v2-2-33ce8864b227@baylibre.com>
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


On Tue, 16 Apr 2024 17:53:03 +0200, Alexandre Mergnat wrote:
> Document the display Color Correction on MT8365, which is compatible
> with that of the MT8183.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


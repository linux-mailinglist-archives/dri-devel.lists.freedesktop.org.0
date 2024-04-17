Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0358A8B76
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 20:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42943113783;
	Wed, 17 Apr 2024 18:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VUBYNmDO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E080411376B
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 18:47:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 09587CE1669;
 Wed, 17 Apr 2024 18:47:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D785C072AA;
 Wed, 17 Apr 2024 18:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713379660;
 bh=ObeGcJLBE+oOTwuDf0gmIllSwIgs3VjK5sPj+MWo/6s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VUBYNmDOHVR9aG0bfxb7PRFesARBFNmYyCFy6pzgSrZmAe8ueprUBCzTbebIkbgOn
 mrlxOz7gxyv33lCKgKUily2GNr+ayCg9q1G2naEi7uUdMFGomXBybbbwrmlfTwTnfy
 59ubGQwCR1H2T1jvDX5qLMz5WdHMJV+MvzkfvMvJ5iOqqZyBd6EYmmIrfQeHPzlEKt
 8xe01Wx3LSBqBQTgwzPhBBcfz6gEmnIRBZ5+oHdxJHkFXN4nphc4uY//7qzCPRff1w
 kLTGjA7AQgtwV7ZVGyk2nsL03LXEVYKRh1VsD6nx8FjvMWtgt28ah72li8BFZiECEO
 eMmyLxrwAXrmw==
Date: Wed, 17 Apr 2024 13:47:38 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Will Deacon <will@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-pwm@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 CK Hu <ck.hu@mediatek.com>, Maxime Ripard <mripard@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Jitao Shi <jitao.shi@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@gmail.com>
Subject: Re: [PATCH v2 08/18] dt-bindings: display: mediatek: gamma: add
 compatible for MT8365 SoC
Message-ID: <171337953454.3077398.11466593614240146510.robh@kernel.org>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
 <20231023-display-support-v2-8-33ce8864b227@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023-display-support-v2-8-33ce8864b227@baylibre.com>
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


On Tue, 16 Apr 2024 17:53:09 +0200, Alexandre Mergnat wrote:
> Document the display Gamma on MT8365, which is compatible
> with that of the MT8183.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


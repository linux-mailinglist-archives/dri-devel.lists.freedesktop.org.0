Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 704D0C7CB5B
	for <lists+dri-devel@lfdr.de>; Sat, 22 Nov 2025 10:30:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5293E10E06A;
	Sat, 22 Nov 2025 09:30:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XQsqXTRv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E86910E06A
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Nov 2025 09:30:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6279343B06;
 Sat, 22 Nov 2025 09:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB7FDC4CEF5;
 Sat, 22 Nov 2025 09:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763803833;
 bh=Mna69aGIWTG040yDqYFP32iKOKMkmBLp/YLju5u8/i4=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=XQsqXTRvU2jmY+FoyVriMGIM2lCY/KGpCbk0y3rLair5sClbL38j7jpbS/9Xa6By6
 9urj36wQOJ22rrvsgTiARRudTJOScq5kxreMKqhssWrpmgGkE2RVZcHIWM4Poy4rM3
 QdLKmLm2cJZ+SpVnztqc2EICsb3CjB3WI3xiZQFx4YiiJk5H6+PZbKDGajbH9yIMAP
 Qja9x7pBlaOo4Q5geVfJX/UKekIgfOD3D4wKYlQOZbLbajzYrFAdLb7TK0Drx6vuzL
 hMY2356p7MuHpSBNd0NQN3YQK/NdYia/2mVTfcnbYfX1DFlpZrHj8MHLZiU+VJG8AY
 rL2dgSGlSiC1g==
From: Vinod Koul <vkoul@kernel.org>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Harini Katakam <harini.katakam@amd.com>, 
 Shyam Pandey <radhey.shyam.pandey@amd.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mmc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20251115122120.35315-4-krzk@kernel.org>
References: <20251115122120.35315-4-krzk@kernel.org>
Subject: Re: (subset) [PATCH 1/3] dt-bindings: display/ti: Simplify
 dma-coherent property
Message-Id: <176380382732.330370.6897973722386830708.b4-ty@kernel.org>
Date: Sat, 22 Nov 2025 15:00:27 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Sat, 15 Nov 2025 13:21:21 +0100, Krzysztof Kozlowski wrote:
> Common boolean properties need to be only allowed in the binding
> (":true"), because their type is already defined by core DT schema.
> Simplify dma-coherent property to match common syntax.
> 
> 

Applied, thanks!

[2/3] dt-bindings: dma: xilinx: Simplify dma-coherent property
      commit: 2b11e7403a8ed816fce38b57cb88e04d997aa7af

Best regards,
-- 
~Vinod



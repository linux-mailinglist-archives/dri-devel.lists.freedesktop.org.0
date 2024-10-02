Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 267AD98D036
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 11:33:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B97610E6E2;
	Wed,  2 Oct 2024 09:33:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="p922LMMS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE1910E6E2
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 09:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1727861612;
 bh=aEZ3V0e96llw0qLEbix5vImUGc2T9SakySfi4kktqIw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=p922LMMSqLkHVljF+Ecm6Wyqj53PprrTan/GuHAnocAa0td6pPXoXZlJJIbXKd9O2
 CmGPaXvOMBG1gxZpsTVMC67Y2vbLvQUou3fZweCVWY/uhprnRdqixMUJHoQUX1ft6D
 L3mO8ubA4ZbZrYuwBko9oUEZR9CIJtKqGtqn0rIjHdoiYF5x2L4EQOpOD96gH+eHAX
 li4O+9aCtLeOKdKFwNjO2r6hbP3ccMYIhmuGyU92uOdvFB46GrpMIS5KPRtGgrURkk
 UyJ9z0E008SHk2egkElJ3XurYW6hMJOFJ3lEDyn6YEHNjeOCtnaJ/7qXqTIx6iLhf0
 EOD0frFlh1fEQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id AD9C717E1250;
 Wed,  2 Oct 2024 11:33:31 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>, 
 Pin-yen Lin <treapking@chromium.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Fabien Parent <fparent@baylibre.com>, 
 Jitao shi <jitao.shi@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20240912144430.3161717-1-treapking@chromium.org>
References: <20240912144430.3161717-1-treapking@chromium.org>
Subject: Re: (subset) [PATCH 0/2] Fix dtcheck warnings for mediatek,dpi binding
Message-Id: <172786161165.39477.4684212034089747258.b4-ty@collabora.com>
Date: Wed, 02 Oct 2024 11:33:31 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Thu, 12 Sep 2024 22:43:57 +0800, Pin-yen Lin wrote:
> This series fixes two binding schema errors in mediatek,dpi binding.
> The first patch adds the power-domain property to the binding, and the
> second patch adds the port node as it's required by the binding.
> 
> 
> Pin-yen Lin (2):
>   dt-bindings: display: mediatek: dpi: Add power-domains to the bindings
>   arm64: dts: mt8183: Add port node to dpi node
> 
> [...]

Applied to v6.12-next/dts64, thanks!

[2/2] arm64: dts: mt8183: Add port node to dpi node
      https://git.kernel.org/mediatek/c/ec1a37b3

Cheers,
Angelo


